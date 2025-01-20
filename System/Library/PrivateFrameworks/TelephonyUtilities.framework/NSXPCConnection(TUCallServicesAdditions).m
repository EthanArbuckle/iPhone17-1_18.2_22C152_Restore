@interface NSXPCConnection(TUCallServicesAdditions)
+ (id)callServicesClientXPCInterface;
+ (id)callServicesServerXPCInterface;
- (__CFString)processBundleIdentifier;
- (id)processName;
- (void)performBlockOnQueue:()TUCallServicesAdditions;
@end

@implementation NSXPCConnection(TUCallServicesAdditions)

+ (id)callServicesServerXPCInterface
{
  if (callServicesServerXPCInterface_onceToken != -1) {
    dispatch_once(&callServicesServerXPCInterface_onceToken, &__block_literal_global_58);
  }
  v0 = (void *)callServicesServerXPCInterface_xpcInterface;

  return v0;
}

+ (id)callServicesClientXPCInterface
{
  if (callServicesClientXPCInterface_onceToken != -1) {
    dispatch_once(&callServicesClientXPCInterface_onceToken, &__block_literal_global_204);
  }
  v0 = (void *)callServicesClientXPCInterface_xpcInterface;

  return v0;
}

- (void)performBlockOnQueue:()TUCallServicesAdditions
{
  id v4 = a3;
  v5 = [a1 _queue];
  dispatch_async(v5, v4);
}

- (id)processName
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (proc_name(objc_msgSend(a1, "processIdentifier", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0),
         &v3,
         0x100u) < 1)
  {
    v1 = 0;
  }
  else
  {
    v1 = [NSString stringWithUTF8String:&v3];
  }

  return v1;
}

- (__CFString)processBundleIdentifier
{
  memset(&v5[1], 0, sizeof(audit_token_t));
  [a1 auditToken];
  v5[0] = v5[1];
  v1 = SecTaskCreateWithAuditToken(0, v5);
  if (v1)
  {
    v2 = v1;
    long long v3 = (__CFString *)SecTaskCopySigningIdentifier(v1, 0);
    CFRelease(v2);
  }
  else
  {
    long long v3 = 0;
  }

  return v3;
}

@end