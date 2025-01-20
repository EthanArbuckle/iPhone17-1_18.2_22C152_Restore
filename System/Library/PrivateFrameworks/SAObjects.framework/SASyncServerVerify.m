@interface SASyncServerVerify
+ (id)serverVerify;
- (BOOL)fetchSyncDebugInfo;
- (BOOL)performInternalVerification;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFetchSyncDebugInfo:(BOOL)a3;
- (void)setPerformInternalVerification:(BOOL)a3;
@end

@implementation SASyncServerVerify

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ServerVerify";
}

+ (id)serverVerify
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)fetchSyncDebugInfo
{
  return AceObjectBoolForProperty(self, @"fetchSyncDebugInfo");
}

- (void)setFetchSyncDebugInfo:(BOOL)a3
{
}

- (BOOL)performInternalVerification
{
  return AceObjectBoolForProperty(self, @"performInternalVerification");
}

- (void)setPerformInternalVerification:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end