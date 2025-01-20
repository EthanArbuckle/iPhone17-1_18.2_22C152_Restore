@interface SAFetchUserActivity
+ (id)fetchUserActivity;
- (BOOL)requiresResponse;
- (NSString)internalGUID;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInternalGUID:(id)a3;
@end

@implementation SAFetchUserActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"FetchUserActivity";
}

+ (id)fetchUserActivity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)internalGUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"internalGUID"];
}

- (void)setInternalGUID:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end