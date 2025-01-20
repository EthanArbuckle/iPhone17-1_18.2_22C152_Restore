@interface NSXPCConnection(MicroLocationUtilities)
+ (id)_signingIdentityForAuditToken:()MicroLocationUtilities;
+ (id)signingIdentityForSelf;
- (id)signingIdentity;
- (uint64_t)hasBooleanEntitlement:()MicroLocationUtilities;
@end

@implementation NSXPCConnection(MicroLocationUtilities)

+ (id)signingIdentityForSelf
{
  *(_OWORD *)task_info_out = 0u;
  long long v7 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x263EF8960], 0xFu, task_info_out, &task_info_outCnt))
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *(_OWORD *)task_info_out;
    v4[1] = v7;
    v2 = [a1 _signingIdentityForAuditToken:v4];
  }

  return v2;
}

- (id)signingIdentity
{
  v2 = objc_opt_class();
  [a1 auditToken];
  v3 = [v2 _signingIdentityForAuditToken:&v5];

  return v3;
}

- (uint64_t)hasBooleanEntitlement:()MicroLocationUtilities
{
  v1 = objc_msgSend(a1, "valueForEntitlement:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (id)_signingIdentityForAuditToken:()MicroLocationUtilities
{
  uint64_t v0 = xpc_copy_code_signing_identity_for_token();
  if (v0)
  {
    v1 = (void *)v0;
    uint64_t v2 = [NSString stringWithUTF8String:v0];
    free(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end