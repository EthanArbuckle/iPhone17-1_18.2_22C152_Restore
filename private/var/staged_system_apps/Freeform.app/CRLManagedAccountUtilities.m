@interface CRLManagedAccountUtilities
+ (BOOL)loggedInUserHasManagedAppleID;
+ (BOOL)loggedInUserHasManagedAppleIDWithError:(id *)a3;
+ (BOOL)loggedInUserHasPolicyRestriction;
@end

@implementation CRLManagedAccountUtilities

+ (BOOL)loggedInUserHasManagedAppleID
{
  id v12 = 0;
  BOOL v2 = +[CRLManagedAccountUtilities loggedInUserHasManagedAppleIDWithError:&v12];
  id v3 = v12;
  if (v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7E40);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101095190(v5, v3, v4);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7E60);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v6, v4);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLManagedAccountUtilities loggedInUserHasManagedAppleID]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLManagedAccountUtilities.m"];
    id v9 = [v3 code];
    v10 = [v3 domain];
    +[CRLAssertionHandler handleFailureInFunction:v7, v8, 26, 0, "Could not determine if iCloud account is Managed Apple ID, error: %zd %{public}@ %@", v9, v10, v3 file lineNumber isFatal description];
  }
  return v2;
}

+ (BOOL)loggedInUserHasPolicyRestriction
{
  BOOL v2 = +[AADataclassManager sharedManager];
  unsigned __int8 v3 = [v2 policyRestrictsDataclass:ACAccountDataclassFreeform];

  return v3;
}

+ (BOOL)loggedInUserHasManagedAppleIDWithError:(id *)a3
{
  int HasManagedAppleID = BRLoggedInUserHasManagedAppleID();
  if (a3 && HasManagedAppleID)
  {
    id v5 = 0;
    *a3 = 0;
  }
  else
  {
    if (!a3) {
      return 0;
    }
    id v5 = *a3;
  }
  if ([v5 code] == (id)2)
  {
    v6 = [*a3 domain];
    unsigned int v7 = [v6 isEqualToString:BRCloudDocsErrorDomain];

    if (v7) {
      *a3 = 0;
    }
  }
  return 0;
}

@end