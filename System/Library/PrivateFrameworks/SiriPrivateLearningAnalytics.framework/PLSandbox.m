@interface PLSandbox
+ (BOOL)isCurrentProcessInSandbox;
+ (int64_t)checkOperation:(id)a3 forPath:(id)a4;
@end

@implementation PLSandbox

+ (BOOL)isCurrentProcessInSandbox
{
  return sandbox_check() != 0;
}

+ (int64_t)checkOperation:(id)a3 forPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isCurrentProcessInSandbox])
  {
    getpid();
    [v6 UTF8String];
    [v7 UTF8String];
    int64_t v8 = (int)sandbox_check();
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

@end