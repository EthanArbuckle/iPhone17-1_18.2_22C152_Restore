@interface RMSharedLock
+ (id)newSharedLockWithDescription:(id)a3;
- (NSString)lockTitle;
- (RMSharedLock)initWithDescription:(id)a3;
- (void)lock;
- (void)performBlockUnderLock:(id)a3;
- (void)setLockTitle:(id)a3;
- (void)unlock;
@end

@implementation RMSharedLock

+ (id)newSharedLockWithDescription:(id)a3
{
  id v3 = a3;
  v4 = [[RMSharedLock alloc] initWithDescription:v3];

  return v4;
}

- (RMSharedLock)initWithDescription:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMSharedLock;
  v6 = [(RMSharedLock *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockTitle, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    lock = v7->_lock;
    v7->_lock = (NSConditionLock *)v8;
  }
  return v7;
}

- (void)lock
{
  v1 = [a1 lockTitle];
  OUTLINED_FUNCTION_0_6(&dword_224784000, v2, v3, "Shared lock %{public}@ has been taken", v4, v5, v6, v7, 2u);
}

- (void)unlock
{
  v1 = [a1 lockTitle];
  OUTLINED_FUNCTION_0_6(&dword_224784000, v2, v3, "Shared lock %{public}@ has been released", v4, v5, v6, v7, 2u);
}

- (void)performBlockUnderLock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  [(RMSharedLock *)self lock];
  v4[2](v4);

  [(RMSharedLock *)self unlock];
}

- (NSString)lockTitle
{
  return self->_lockTitle;
}

- (void)setLockTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockTitle, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end