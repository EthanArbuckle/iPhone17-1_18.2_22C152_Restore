@interface NSError(RBSErrors)
+ (id)rbs_errorClientNotAuthorized;
+ (id)rbs_errorClientNotEntitled:()RBSErrors permanent:;
- (BOOL)rbs_isPermanentFailure;
@end

@implementation NSError(RBSErrors)

- (BOOL)rbs_isPermanentFailure
{
  BOOL result = -[NSError rbs_isServiceDenied](a1);
  if (result)
  {
    v3 = [a1 userInfo];
    v4 = [v3 valueForKey:@"RBSPermanent"];
    uint64_t v5 = [v4 BOOLValue];

    return v5;
  }
  return result;
}

+ (id)rbs_errorClientNotEntitled:()RBSErrors permanent:
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Client not entitled" forKey:*MEMORY[0x1E4F28588]];
  if (v5) {
    [v6 setObject:v5 forKey:@"RBSEntitlement"];
  }
  v7 = [NSNumber numberWithBool:a4];
  [v6 setObject:v7 forKey:@"RBSPermanent"];

  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RBSServiceErrorDomain" code:1 userInfo:v6];

  return v8;
}

+ (id)rbs_errorClientNotAuthorized
{
  v0 = [MEMORY[0x1E4F1CA60] dictionary];
  [v0 setObject:@"Client not authorized" forKey:*MEMORY[0x1E4F28588]];
  [v0 setObject:MEMORY[0x1E4F1CC28] forKey:@"RBSPermanent"];
  v1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RBSServiceErrorDomain" code:1 userInfo:v0];

  return v1;
}

@end