@interface MSCollection
- (BOOL)isLegacyFavoritesCollection;
@end

@implementation MSCollection

- (BOOL)isLegacyFavoritesCollection
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  v4 = [(MSCollection *)self identifier];
  unsigned __int8 v5 = [v4 isEqual:v3];

  return v5;
}

@end