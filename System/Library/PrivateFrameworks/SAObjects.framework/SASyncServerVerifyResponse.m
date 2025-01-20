@interface SASyncServerVerifyResponse
+ (id)serverVerifyResponse;
- (BOOL)requiresResponse;
- (NSArray)internalVerifications;
- (NSArray)serverChecksums;
- (NSArray)syncDebugInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInternalVerifications:(id)a3;
- (void)setServerChecksums:(id)a3;
- (void)setSyncDebugInfo:(id)a3;
@end

@implementation SASyncServerVerifyResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ServerVerifyResponse";
}

+ (id)serverVerifyResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)internalVerifications
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"internalVerifications", v3);
}

- (void)setInternalVerifications:(id)a3
{
}

- (NSArray)serverChecksums
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"serverChecksums", v3);
}

- (void)setServerChecksums:(id)a3
{
}

- (NSArray)syncDebugInfo
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"syncDebugInfo", v3);
}

- (void)setSyncDebugInfo:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end