@interface CryptoBackendXPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnlocked;
- (BackendXPC)baseBackendXPC;
- (CryptoBackendXPC)initWithCoder:(id)a3;
- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
@end

@implementation CryptoBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CryptoBackendXPC;
  v8 = [(CryptoBackendXPC *)&v16 init];
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a4);
    if (*p_baseBackendXPC)
    {
      [*p_baseBackendXPC backend];
    }
    else
    {
      uint64_t v12 = 0;
      v13 = 0;
    }
    sub_1000D1A10((uint64_t)&v12, (uint64_t)a3, &v14);
    long long v15 = v14;
    long long v14 = 0uLL;
    [(BackendXPC *)v9 setBackend:&v15];
    if (*((void *)&v15 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v15 + 1));
    }
    if (*((void *)&v14 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v14 + 1));
    }
    if (v13) {
      sub_100010A48(v13);
    }
  }

  return v9;
}

- (CryptoBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CryptoBackendXPC;
  v5 = [(BackendXPC *)&v19 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    sub_1000CD2B0(v4, (uint64_t *)[(BackendXPC *)v5 cryptoHeader], &v17);
    if (!v17)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_1001B6CA0;
      uint64_t v12 = std::generic_category();
      exception[1] = 154;
      exception[2] = v12;
      *((unsigned char *)exception + 24) = 0;
      *((unsigned char *)exception + 48) = 0;
      exception[7] = "Failed to deserialize crypto format";
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseBackend"];
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v7;

    v9 = v6->_baseBackendXPC;
    if (v9)
    {
      [(BackendXPC *)v9 backend];
    }
    else
    {
      uint64_t v13 = 0;
      long long v14 = 0;
    }
    sub_1000D1AF8((uint64_t)&v13, (uint64_t)&v17, &v15);
    long long v16 = v15;
    long long v15 = 0uLL;
    [(BackendXPC *)v6 setBackend:&v16];
    if (*((void *)&v16 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v15 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v15 + 1));
    }
    if (v14) {
      sub_100010A48(v14);
    }
    if (v18) {
      sub_100010A48(v18);
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CryptoBackendXPC;
  [(BackendXPC *)&v10 encodeWithCoder:v4];
  [(BackendXPC *)self backend];
  v5 = *(void **)(v8 + 40);
  v6 = *(std::__shared_weak_count **)(v8 + 48);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1000CD670(v4, v5);
  if (v6) {
    sub_100010A48(v6);
  }
  uint64_t v7 = [(CryptoBackendXPC *)self baseBackendXPC];
  [v4 encodeObject:v7 forKey:@"baseBackend"];

  if (v9) {
    sub_100010A48(v9);
  }
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v5 = a3;
  [(BackendXPC *)self backend];
  if (v5)
  {
    [v5 backend];
    long long v6 = v8;
  }
  else
  {
    long long v6 = 0uLL;
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v9 + 32);
  *(_OWORD *)(v9 + 24) = v6;
  if (v7) {
    sub_100010A48(v7);
  }
  objc_storeStrong((id *)&self->_baseBackendXPC, a3);
  if (v10) {
    sub_100010A48(v10);
  }
}

- (BOOL)isUnlocked
{
  return 1;
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
}

@end