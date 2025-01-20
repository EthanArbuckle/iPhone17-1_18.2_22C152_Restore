@interface SASyncVerificationResult
+ (id)verificationResult;
- (NSArray)failedObjectIds;
- (NSString)name;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)fail;
- (int64_t)total;
- (void)setFail:(int64_t)a3;
- (void)setFailedObjectIds:(id)a3;
- (void)setName:(id)a3;
- (void)setTotal:(int64_t)a3;
@end

@implementation SASyncVerificationResult

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"VerificationResult";
}

+ (id)verificationResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)fail
{
  return AceObjectIntegerForProperty(self, @"fail");
}

- (void)setFail:(int64_t)a3
{
}

- (NSArray)failedObjectIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"failedObjectIds"];
}

- (void)setFailedObjectIds:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (int64_t)total
{
  return AceObjectIntegerForProperty(self, @"total");
}

- (void)setTotal:(int64_t)a3
{
}

@end