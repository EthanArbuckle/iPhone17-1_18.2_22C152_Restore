@interface NSFileHandle(ML3Additions)
- (uint64_t)ml_lock;
- (uint64_t)ml_unlock;
@end

@implementation NSFileHandle(ML3Additions)

- (uint64_t)ml_unlock
{
  v3[1] = 0;
  int v5 = 2;
  v3[0] = 0;
  pid_t v4 = getpid();
  return fcntl([a1 fileDescriptor], 8, v3);
}

- (uint64_t)ml_lock
{
  v3[1] = 0;
  int v5 = 3;
  v3[0] = 0;
  pid_t v4 = getpid();
  return fcntl([a1 fileDescriptor], 9, v3);
}

@end