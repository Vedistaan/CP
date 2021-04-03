const int N = 1e8;
bool notPrime[N + 5];
//true = not prime
//false = prime
void sieve() {
   notPrime[0] = notPrime[1] = true;

   for(int i = 2; i * i <= N; i++)
       if(!notPrime[i])
           for(int j = i * i; j <= N; j += i)
               notPrime[j] = true;
}

long Prime[N + 5];
void generatePrime() {
    int ind = 0;
    for(int i = 0; i <= N; i++)
        if(!notPrime[i])
            Prime[ind++] = i;
}

vector<long long> pf, ex;
void primeFactorize(long long n) {
    for(int i = 0; i < N; i++) {
    	int p = Prime[i];
    	if((long long) p * p > n) break;
        if( n % p == 0) {
            int cnt = 0;
            while (n % p == 0) {
                n /= p;
                cnt++;
            }

            pf.emplace_back(p);
            ex.emplace_back(cnt);
        }
    }

    if(n > 1) {
    	pf.emplace_back(n);
        ex.emplace_back(1);
    }
}
