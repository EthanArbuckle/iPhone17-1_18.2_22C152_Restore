@interface SACreateVOXList
+ (id)createVOXList;
- (BOOL)requiresResponse;
- (NSArray)introductions;
- (NSArray)items;
- (NSString)domainName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)pageSize;
- (void)setDomainName:(id)a3;
- (void)setIntroductions:(id)a3;
- (void)setItems:(id)a3;
- (void)setPageSize:(int64_t)a3;
@end

@implementation SACreateVOXList

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CreateVOXList";
}

+ (id)createVOXList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)domainName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainName"];
}

- (void)setDomainName:(id)a3
{
}

- (NSArray)introductions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"introductions"];
}

- (void)setIntroductions:(id)a3
{
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"items", v3);
}

- (void)setItems:(id)a3
{
}

- (int64_t)pageSize
{
  return AceObjectIntegerForProperty(self, @"pageSize");
}

- (void)setPageSize:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end