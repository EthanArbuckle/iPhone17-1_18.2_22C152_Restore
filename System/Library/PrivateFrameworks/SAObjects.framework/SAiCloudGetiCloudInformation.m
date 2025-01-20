@interface SAiCloudGetiCloudInformation
+ (id)getiCloudInformation;
- (BOOL)requiresResponse;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setQuery:(id)a3;
@end

@implementation SAiCloudGetiCloudInformation

- (id)groupIdentifier
{
  return @"com.apple.ace.iCloud";
}

- (id)encodedClassName
{
  return @"GetiCloudInformation";
}

+ (id)getiCloudInformation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end