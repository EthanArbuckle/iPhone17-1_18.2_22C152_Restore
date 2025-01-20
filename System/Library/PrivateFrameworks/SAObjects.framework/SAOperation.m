@interface SAOperation
+ (id)operation;
- (NSDictionary)constraints;
- (NSString)domainId;
- (NSString)operationId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConstraints:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setOperationId:(id)a3;
@end

@implementation SAOperation

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Operation";
}

+ (id)operation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)constraints
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"constraints"];
}

- (void)setConstraints:(id)a3
{
}

- (NSString)domainId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainId"];
}

- (void)setDomainId:(id)a3
{
}

- (NSString)operationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"operationId"];
}

- (void)setOperationId:(id)a3
{
}

@end