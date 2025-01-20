@interface SARestaurantRestaurant
+ (id)restaurant;
- (NSArray)attributeSet;
- (NSArray)makeReservationPunchOuts;
- (NSArray)openings;
- (NSArray)orderDeliveryPunchOuts;
- (NSURL)menuLink;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributeSet:(id)a3;
- (void)setMakeReservationPunchOuts:(id)a3;
- (void)setMenuLink:(id)a3;
- (void)setOpenings:(id)a3;
- (void)setOrderDeliveryPunchOuts:(id)a3;
@end

@implementation SARestaurantRestaurant

- (id)groupIdentifier
{
  return @"com.apple.ace.restaurant";
}

- (id)encodedClassName
{
  return @"Restaurant";
}

+ (id)restaurant
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)attributeSet
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"attributeSet"];
}

- (void)setAttributeSet:(id)a3
{
}

- (NSArray)makeReservationPunchOuts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"makeReservationPunchOuts", v3);
}

- (void)setMakeReservationPunchOuts:(id)a3
{
}

- (NSURL)menuLink
{
  return (NSURL *)AceObjectURLForProperty(self, @"menuLink");
}

- (void)setMenuLink:(id)a3
{
}

- (NSArray)openings
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"openings", v3);
}

- (void)setOpenings:(id)a3
{
}

- (NSArray)orderDeliveryPunchOuts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"orderDeliveryPunchOuts", v3);
}

- (void)setOrderDeliveryPunchOuts:(id)a3
{
}

@end