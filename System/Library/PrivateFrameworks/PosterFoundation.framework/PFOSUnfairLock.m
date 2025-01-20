@interface PFOSUnfairLock
- (BOOL)isEqual:(id)a3;
- (BOOL)mutateUserInfo:(id)a3;
- (NSDictionary)userInfo;
- (NSString)lockIdentifier;
- (PFOSUnfairLock)init;
- (PFOSUnfairLock)initWithLockIdentifier:(id)a3;
- (id)description;
- (void)assertNotOwner;
- (void)assertOwner;
- (void)dealloc;
- (void)lock;
- (void)performBlock:(id)a3;
- (void)unlock;
@end

@implementation PFOSUnfairLock

- (PFOSUnfairLock)init
{
  v11.receiver = self;
  v11.super_class = (Class)PFOSUnfairLock;
  v2 = [(PFOSUnfairLock *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    userInfo = v2->_userInfo;
    v2->_userInfo = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = NSString;
    v6 = [MEMORY[0x263F08C38] UUID];
    v7 = [v6 UUIDString];
    uint64_t v8 = [v5 stringWithFormat:@"%@%@", @"PFOSUnfairLock-", v7];
    lockIdentifier = v2->_lockIdentifier;
    v2->_lockIdentifier = (NSString *)v8;
  }
  return v2;
}

- (PFOSUnfairLock)initWithLockIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PFOSUnfairLock *)self init];
  if (v5 && [v4 length])
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@%@", @"PFOSUnfairLock-", v4];
    lockIdentifier = v5->_lockIdentifier;
    v5->_lockIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(PFOSUnfairLock *)self assertNotOwner];
  v3.receiver = self;
  v3.super_class = (Class)PFOSUnfairLock;
  [(PFOSUnfairLock *)&v3 dealloc];
}

- (NSString)lockIdentifier
{
  return [(NSString *)self->_lockIdentifier stringByReplacingOccurrencesOfString:@"PFOSUnfairLock-" withString:&stru_2707FB7C8];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(PFOSUnfairLock *)self lockIdentifier];
  [v3 appendString:v4 withName:@"lockIdentifier"];

  if (os_unfair_lock_trylock(&self->_lock))
  {
    [v3 appendDictionarySection:self->_userInfo withName:@"userInfo" skipIfEmpty:1];
    os_unfair_lock_unlock(&self->_lock);
  }
  v5 = [v3 build];

  return v5;
}

- (void)performBlock:(id)a3
{
  v5 = (void (**)(void))a3;
  id v4 = (void *)MEMORY[0x25A2F4780]([(PFOSUnfairLock *)self lock]);
  v5[2]();
  [(PFOSUnfairLock *)self unlock];
}

- (NSDictionary)userInfo
{
  [(PFOSUnfairLock *)self lock];
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_userInfo copy];
  [(PFOSUnfairLock *)self unlock];
  return (NSDictionary *)v3;
}

- (BOOL)mutateUserInfo:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (void (**)(id, void *))a3;
  [(PFOSUnfairLock *)self lock];
  v5 = self->_userInfo;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v5];
  v4[2](v4, v6);

  char v7 = [v6 isEqualToDictionary:v5];
  if ((v7 & 1) == 0) {
    objc_storeStrong((id *)&self->_userInfo, v6);
  }
  char v8 = v7 ^ 1;
  [(PFOSUnfairLock *)self unlock];

  return v8;
}

- (void)assertOwner
{
}

- (void)assertNotOwner
{
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lockIdentifier, 0);
}

@end