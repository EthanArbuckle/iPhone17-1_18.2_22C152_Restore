@interface BKPriceTrackingKeys
+ (NSString)priceTrackingNotificationsEnabled;
- (BKPriceTrackingKeys)init;
@end

@implementation BKPriceTrackingKeys

+ (NSString)priceTrackingNotificationsEnabled
{
  NSString v2 = sub_93A30();

  return (NSString *)v2;
}

- (BKPriceTrackingKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PriceTrackingKeys();
  return [(BKPriceTrackingKeys *)&v3 init];
}

@end