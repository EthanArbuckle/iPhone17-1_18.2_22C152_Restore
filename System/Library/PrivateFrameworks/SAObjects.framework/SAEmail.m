@interface SAEmail
+ (id)email;
- (NSNumber)favoriteFacetime;
- (NSNumber)favoriteFacetimeAudio;
- (NSNumber)pseudo;
- (NSString)emailAddress;
- (NSString)label;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEmailAddress:(id)a3;
- (void)setFavoriteFacetime:(id)a3;
- (void)setFavoriteFacetimeAudio:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPseudo:(id)a3;
@end

@implementation SAEmail

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Email";
}

+ (id)email
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)emailAddress
{
  return (NSString *)[(AceObject *)self propertyForKey:@"emailAddress"];
}

- (void)setEmailAddress:(id)a3
{
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

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
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