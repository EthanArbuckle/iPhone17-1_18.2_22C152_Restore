@interface MSVEntitlementUtilities
+ (BOOL)_checkEntitlement:(id)a3 inGroup:(id)a4 shouldLogForMissingEntitlement:(BOOL)a5;
+ (BOOL)hasBoolEntitlement:(id)a3;
+ (BOOL)hasBoolEntitlement:(id)a3 shouldLogForMissingEntitlement:(BOOL)a4;
+ (BOOL)hasEntitlement:(id)a3 inGroup:(id)a4;
+ (id)_checkArrayEntitlement:(id)a3 group:(id)a4 task:(__SecTask *)a5;
+ (id)_checkBooleanEntitlement:(id)a3 task:(__SecTask *)a4;
+ (void)_logForMissingEntitlementWithResult:(id)a3;
@end

@implementation MSVEntitlementUtilities

+ (BOOL)hasBoolEntitlement:(id)a3 shouldLogForMissingEntitlement:(BOOL)a4
{
  return [a1 _checkEntitlement:a3 inGroup:0 shouldLogForMissingEntitlement:a4];
}

+ (BOOL)hasBoolEntitlement:(id)a3
{
  return [a1 hasBoolEntitlement:a3 shouldLogForMissingEntitlement:1];
}

+ (id)_checkArrayEntitlement:(id)a3 group:(id)a4 task:(__SecTask *)a5
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v9 = [[_EntitlementCheckResult alloc] initWithEntitlement:v7 group:v8];
  CFErrorRef error = 0;
  v10 = (void *)SecTaskCopyValueForEntitlement(a5, v8, &error);

  if (v10)
  {
    CFTypeID v11 = CFGetTypeID(v10);
    if (v11 == CFArrayGetTypeID()) {
      -[_EntitlementCheckResult setEntitled:](v9, "setEntitled:", [v10 containsObject:v7]);
    }
    CFRelease(v10);
  }
  CFErrorRef v12 = error;
  if (error)
  {
    [(_EntitlementCheckResult *)v9 setError:error];

    CFRelease(error);
  }

  return v9;
}

+ (void)_logForMissingEntitlementWithResult:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 error];
  if (v5)
  {
  }
  else if ([v4 isEntitled])
  {
    goto LABEL_7;
  }
  v6 = [MEMORY[0x1E4F28F80] processInfo];
  id v7 = os_log_create("com.apple.amp.MediaServices", "Entitlements");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = [v6 processName];
    int v9 = [v6 processIdentifier];
    v10 = [v4 group];
    CFTypeID v11 = [v4 entitlement];
    int v12 = [v4 isEntitled];
    v13 = [v4 error];
    int v14 = 138544898;
    id v15 = a1;
    __int16 v16 = 2114;
    v17 = v8;
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 2114;
    v21 = v10;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 1024;
    int v25 = v12;
    __int16 v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_ERROR, "%{public}@ - Process %{public}@ PID[%d] - Group: %{public}@ - Entitlement: %{public}@ - Entitled: %{BOOL}u - Error: %{public}@", (uint8_t *)&v14, 0x40u);
  }
LABEL_7:
}

+ (BOOL)_checkEntitlement:(id)a3 inGroup:(id)a4 shouldLogForMissingEntitlement:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  SecTaskRef v10 = SecTaskCreateFromSelf(0);
  if (!v10) {
    goto LABEL_6;
  }
  SecTaskRef v11 = v10;
  if (v9) {
    [a1 _checkArrayEntitlement:v8 group:v9 task:v10];
  }
  else {
  int v12 = [a1 _checkBooleanEntitlement:v8 task:v10];
  }
  CFRelease(v11);
  if (!v12) {
LABEL_6:
  }
    int v12 = [[_EntitlementCheckResult alloc] initWithEntitlement:v8 group:v9];
  if (v5) {
    [a1 _logForMissingEntitlementWithResult:v12];
  }
  BOOL v13 = [(_EntitlementCheckResult *)v12 isEntitled];

  return v13;
}

+ (id)_checkBooleanEntitlement:(id)a3 task:(__SecTask *)a4
{
  BOOL v5 = (__CFString *)a3;
  v6 = [[_EntitlementCheckResult alloc] initWithEntitlement:v5 group:0];
  CFErrorRef error = 0;
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(a4, v5, &error);

  if (v7)
  {
    CFTypeID v8 = CFGetTypeID(v7);
    if (v8 == CFBooleanGetTypeID()) {
      [(_EntitlementCheckResult *)v6 setEntitled:CFBooleanGetValue((CFBooleanRef)v7) != 0];
    }
    CFRelease(v7);
  }
  CFErrorRef v9 = error;
  if (error)
  {
    [(_EntitlementCheckResult *)v6 setError:error];

    CFRelease(error);
  }
  return v6;
}

+ (BOOL)hasEntitlement:(id)a3 inGroup:(id)a4
{
  return [a1 hasEntitlement:a3 inGroup:a4 shouldLogForMissingEntitlement:1];
}

@end