@interface SALocalSearchOffer
+ (id)offer;
- (NSString)identifier;
- (NSString)title;
- (SAUIAppPunchOut)offerPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
- (void)setOfferPunchOut:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SALocalSearchOffer

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Offer";
}

+ (id)offer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (SAUIAppPunchOut)offerPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"offerPunchOut");
}

- (void)setOfferPunchOut:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end