@interface SAPhone
+ (id)phone;
- (NSNumber)favoriteFacetime;
- (NSNumber)favoriteFacetimeAudio;
- (NSNumber)favoriteVoice;
- (NSNumber)pseudo;
- (NSString)label;
- (NSString)number;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFavoriteFacetime:(id)a3;
- (void)setFavoriteFacetimeAudio:(id)a3;
- (void)setFavoriteVoice:(id)a3;
- (void)setLabel:(id)a3;
- (void)setNumber:(id)a3;
- (void)setPseudo:(id)a3;
@end

@implementation SAPhone

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Phone";
}

+ (id)phone
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)favoriteFacetime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"favoriteFacetime"];
}

- (void)setFavoriteFacetime:(id)a3
{
}

- (NSNumber)favoriteFacetimeAudio
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"favoriteFacetimeAudio"];
}

- (void)setFavoriteFacetimeAudio:(id)a3
{
}

- (NSNumber)favoriteVoice
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"favoriteVoice"];
}

- (void)setFavoriteVoice:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSString)number
{
  return (NSString *)[(AceObject *)self propertyForKey:@"number"];
}

- (void)setNumber:(id)a3
{
}

- (NSNumber)pseudo
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"pseudo"];
}

- (void)setPseudo:(id)a3
{
}

@end