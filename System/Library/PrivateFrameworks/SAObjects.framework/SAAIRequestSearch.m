@interface SAAIRequestSearch
+ (id)requestSearch;
- (BOOL)requiresResponse;
- (NSString)acousticIdSearchSessionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAcousticIdSearchSessionId:(id)a3;
@end

@implementation SAAIRequestSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"RequestSearch";
}

+ (id)requestSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)acousticIdSearchSessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"acousticIdSearchSessionId"];
}

- (void)setAcousticIdSearchSessionId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end