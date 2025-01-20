@interface SASyncDeepSyncVerificationResult
+ (id)deepSyncVerificationResult;
- (BOOL)requiresResponse;
- (NSString)key;
- (NSString)result;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKey:(id)a3;
- (void)setResult:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SASyncDeepSyncVerificationResult

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"DeepSyncVerificationResult";
}

+ (id)deepSyncVerificationResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)key
{
  return (NSString *)[(AceObject *)self propertyForKey:@"key"];
}

- (void)setKey:(id)a3
{
}

- (NSString)result
{
  return (NSString *)[(AceObject *)self propertyForKey:@"result"];
}

- (void)setResult:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end