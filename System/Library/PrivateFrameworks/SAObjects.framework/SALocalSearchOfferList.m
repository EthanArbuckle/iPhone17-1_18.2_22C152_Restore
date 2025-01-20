@interface SALocalSearchOfferList
+ (id)offerList;
- (NSArray)offers;
- (NSString)providerId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOffers:(id)a3;
- (void)setProviderId:(id)a3;
@end

@implementation SALocalSearchOfferList

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"OfferList";
}

+ (id)offerList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)offers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"offers", v3);
}

- (void)setOffers:(id)a3
{
}

- (NSString)providerId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerId"];
}

- (void)setProviderId:(id)a3
{
}

@end