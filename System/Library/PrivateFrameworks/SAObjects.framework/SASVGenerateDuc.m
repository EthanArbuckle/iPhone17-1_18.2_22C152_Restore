@interface SASVGenerateDuc
+ (id)generateDuc;
- (NSDictionary)parameters;
- (NSString)ducFamilyId;
- (NSString)ducId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDucFamilyId:(id)a3;
- (void)setDucId:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation SASVGenerateDuc

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"GenerateDuc";
}

+ (id)generateDuc
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)ducFamilyId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ducFamilyId"];
}

- (void)setDucFamilyId:(id)a3
{
}

- (NSString)ducId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ducId"];
}

- (void)setDucId:(id)a3
{
}

- (NSDictionary)parameters
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"parameters"];
}

- (void)setParameters:(id)a3
{
}

@end