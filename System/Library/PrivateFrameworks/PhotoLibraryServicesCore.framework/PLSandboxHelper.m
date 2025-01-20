@interface PLSandboxHelper
+ (BOOL)fileURLHasSecurityScope:(id)a3;
+ (BOOL)processCanReadSandboxForPath:(id)a3;
+ (BOOL)processCanWriteSandboxForPath:(id)a3;
+ (BOOL)processWithID:(int)a3 canReadSandboxForPath:(id)a4;
+ (BOOL)processWithID:(int)a3 canWriteSandboxForPath:(id)a4;
@end

@implementation PLSandboxHelper

+ (BOOL)processCanWriteSandboxForPath:(id)a3
{
  id v4 = a3;
  LOBYTE(a1) = [a1 processWithID:getpid() canWriteSandboxForPath:v4];

  return (char)a1;
}

+ (BOOL)processWithID:(int)a3 canWriteSandboxForPath:(id)a4
{
  return sandbox_check() == 0;
}

+ (BOOL)fileURLHasSecurityScope:(id)a3
{
  v3 = (const void *)MEMORY[0x19F38EE70](a3, a2);
  id v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4 != 0;
}

+ (BOOL)processWithID:(int)a3 canReadSandboxForPath:(id)a4
{
  return sandbox_check() == 0;
}

+ (BOOL)processCanReadSandboxForPath:(id)a3
{
  id v4 = a3;
  LOBYTE(a1) = [a1 processWithID:getpid() canReadSandboxForPath:v4];

  return (char)a1;
}

@end