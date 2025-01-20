@interface SARestaurantRestaurantsSnippet
+ (id)restaurantsSnippet;
- (NSArray)attributionOrder;
- (NSArray)contributingProviderIds;
- (NSArray)restaurants;
- (NSDictionary)providerPunchOutMap;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributionOrder:(id)a3;
- (void)setContributingProviderIds:(id)a3;
- (void)setProviderPunchOutMap:(id)a3;
- (void)setRestaurants:(id)a3;
@end

@implementation SARestaurantRestaurantsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.restaurant";
}

- (id)encodedClassName
{
  return @"RestaurantsSnippet";
}

+ (id)restaurantsSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)attributionOrder
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"attributionOrder"];
}

- (void)setAttributionOrder:(id)a3
{
}

- (NSArray)contributingProviderIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"contributingProviderIds"];
}

- (void)setContributingProviderIds:(id)a3
{
}

- (NSDictionary)providerPunchOutMap
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"providerPunchOutMap", v3);
}

- (void)setProviderPunchOutMap:(id)a3
{
}

- (NSArray)restaurants
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"restaurants", v3);
}

- (void)setRestaurants:(id)a3
{
}

@end