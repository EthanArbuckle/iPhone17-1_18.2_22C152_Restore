@interface PGUnfairLock
- (PGUnfairLock)init;
- (void)lock;
- (void)unlock;
@end

@implementation PGUnfairLock

- (void)unlock
{
}

- (void)lock
{
}

- (PGUnfairLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGUnfairLock;
  result = [(PGUnfairLock *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end