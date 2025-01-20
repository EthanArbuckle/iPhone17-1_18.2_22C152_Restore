@interface RPTEntitlementChecker
+ (RPTEntitlementChecker)checkerForCurrentProcess;
- (BOOL)checkWithError:(id *)a3;
- (LSBundleRecord)bundleRecord;
- (RPTEntitlementChecker)initWithBundleRecord:(id)a3;
- (void)setBundleRecord:(id)a3;
@end

@implementation RPTEntitlementChecker

+ (RPTEntitlementChecker)checkerForCurrentProcess
{
  v2 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  if (v2) {
    v3 = [[RPTEntitlementChecker alloc] initWithBundleRecord:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (RPTEntitlementChecker)initWithBundleRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPTEntitlementChecker;
  v6 = [(RPTEntitlementChecker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleRecord, a3);
  }

  return v7;
}

- (BOOL)checkWithError:(id *)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int v5 = os_variant_allows_internal_security_policies();
  v6 = [(RPTEntitlementChecker *)self bundleRecord];
  v7 = [v6 entitlements];

  v8 = [v7 objectForKey:@"com.apple.private.hid.client.event-dispatch" ofClass:objc_opt_class()];
  objc_super v9 = v8;
  if (v8)
  {
    [v8 BOOLValue];
    BSSettingFlagForBool();
  }

  char IsYes = BSSettingFlagIsYes();
  if (v5)
  {
    v11 = [v7 objectForKey:@"com.apple.private.hid.client.event-dispatch.internal" ofClass:objc_opt_class()];
    v12 = v11;
    if (v11)
    {
      [v11 BOOLValue];
      BSSettingFlagForBool();
    }

    if (IsYes)
    {
      char IsYes = 1;
      goto LABEL_12;
    }
    char IsYes = BSSettingFlagIsYes();
  }
  if (a3 && (IsYes & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28588];
    v17[0] = *MEMORY[0x1E4F28578];
    v17[1] = v14;
    v18[0] = @"Process is (likely) not entitled to create HID events.";
    v18[1] = @"HID client dispatch entitlement is missing.";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    *a3 = [v13 errorWithDomain:@"com.apple.RecapPerformanceTesting" code:2 userInfo:v15];

    char IsYes = 0;
  }
LABEL_12:

  return IsYes;
}

- (LSBundleRecord)bundleRecord
{
  return self->_bundleRecord;
}

- (void)setBundleRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end