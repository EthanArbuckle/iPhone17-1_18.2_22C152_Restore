@interface SASyncClientVerifyResult
+ (id)clientVerifyResult;
- (BOOL)requiresResponse;
- (NSArray)checksums;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChecksums:(id)a3;
@end

@implementation SASyncClientVerifyResult

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ClientVerifyResult";
}

+ (id)clientVerifyResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)checksums
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"checksums", v3);
}

- (void)setChecksums:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end