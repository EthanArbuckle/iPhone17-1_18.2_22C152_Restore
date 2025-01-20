@interface ICUserIdentityStoreCoding
+ (BOOL)supportsSecureCoding;
- (ICDelegateAccountStoreOptions)delegateAccountStoreOptions;
- (ICUserIdentityStoreBackend)backend;
- (ICUserIdentityStoreCoding)initWithCoder:(id)a3;
- (ICUserIdentityStoreCoding)initWithIdentityStoreStyle:(int64_t)a3;
- (ICValueHistory)activeAccountHistory;
- (ICValueHistory)activeLockerAccountHistory;
- (id)_initCommon;
- (int64_t)identityStoreStyle;
- (int64_t)uniqueIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)lock:(id)a3;
- (void)setActiveAccountHistory:(id)a3;
- (void)setActiveLockerAccountHistory:(id)a3;
- (void)setBackend:(id)a3;
- (void)setDelegateAccountStoreOptions:(id)a3;
@end

@implementation ICUserIdentityStoreCoding

- (int64_t)identityStoreStyle
{
  return self->_identityStoreStyle;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (ICValueHistory)activeLockerAccountHistory
{
  return self->_activeLockerAccountHistory;
}

- (ICValueHistory)activeAccountHistory
{
  return self->_activeAccountHistory;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateAccountStoreOptions, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_activeLockerAccountHistory, 0);

  objc_storeStrong((id *)&self->_activeAccountHistory, 0);
}

- (void)lock:(id)a3
{
  v4 = (void (**)(void))a3;
  self = (ICUserIdentityStoreCoding *)((char *)self + 8);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)self);
}

- (void)setActiveLockerAccountHistory:(id)a3
{
}

- (void)setActiveAccountHistory:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  activeAccountHistory = self->_activeAccountHistory;
  id v5 = a3;
  [v5 encodeObject:activeAccountHistory forKey:@"accountHistory"];
  [v5 encodeObject:self->_activeLockerAccountHistory forKey:@"lockerHistory"];
  [v5 encodeObject:self->_backend forKey:@"backend"];
  [v5 encodeObject:self->_delegateAccountStoreOptions forKey:@"delegationOptions"];
  [v5 encodeInteger:self->_identityStoreStyle forKey:@"style"];
  [v5 encodeInt64:self->_uniqueIdentifier forKey:@"uid"];
}

- (ICUserIdentityStoreCoding)initWithIdentityStoreStyle:(int64_t)a3
{
  v4 = [(ICUserIdentityStoreCoding *)self _initCommon];
  id v5 = v4;
  if (v4)
  {
    v4->_identityStoreStyle = a3;
    CFUUIDRef v6 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    v5->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
    CFRelease(v6);
  }
  return v5;
}

- (void)setDelegateAccountStoreOptions:(id)a3
{
}

- (ICUserIdentityStoreCoding)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICUserIdentityStoreCoding *)self _initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountHistory"];
    activeAccountHistory = v5->_activeAccountHistory;
    v5->_activeAccountHistory = (ICValueHistory *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockerHistory"];
    activeLockerAccountHistory = v5->_activeLockerAccountHistory;
    v5->_activeLockerAccountHistory = (ICValueHistory *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"backend"];
    backend = v5->_backend;
    v5->_backend = (ICUserIdentityStoreBackend *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delegationOptions"];
    delegateAccountStoreOptions = v5->_delegateAccountStoreOptions;
    v5->_delegateAccountStoreOptions = (ICDelegateAccountStoreOptions *)v15;

    v5->_identityStoreStyle = [v4 decodeIntegerForKey:@"style"];
    v5->_uniqueIdentifier = [v4 decodeInt64ForKey:@"uid"];
  }
  return v5;
}

- (id)_initCommon
{
  v3.receiver = self;
  v3.super_class = (Class)ICUserIdentityStoreCoding;
  id result = [(ICUserIdentityStoreCoding *)&v3 init];
  if (result) {
    *((_DWORD *)result + 2) = 0;
  }
  return result;
}

- (ICDelegateAccountStoreOptions)delegateAccountStoreOptions
{
  return self->_delegateAccountStoreOptions;
}

- (void)setBackend:(id)a3
{
}

- (ICUserIdentityStoreBackend)backend
{
  return self->_backend;
}

@end