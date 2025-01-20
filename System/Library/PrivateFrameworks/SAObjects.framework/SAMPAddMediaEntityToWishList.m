@interface SAMPAddMediaEntityToWishList
+ (id)addMediaEntityToWishList;
- (BOOL)requiresResponse;
- (NSString)adamId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdamId:(id)a3;
@end

@implementation SAMPAddMediaEntityToWishList

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AddMediaEntityToWishList";
}

+ (id)addMediaEntityToWishList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)adamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"adamId"];
}

- (void)setAdamId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end