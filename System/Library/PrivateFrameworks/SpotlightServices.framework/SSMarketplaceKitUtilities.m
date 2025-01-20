@interface SSMarketplaceKitUtilities
+ (id)distributorPriorityList;
+ (id)distributorPriorityListChangedNotifationName;
- (_TtC17SpotlightServices25SSMarketplaceKitUtilities)init;
@end

@implementation SSMarketplaceKitUtilities

+ (id)distributorPriorityList
{
  MEMORY[0x1C18843C0](a1, a2);
  v2 = (void *)sub_1BDC4F960();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)distributorPriorityListChangedNotifationName
{
  v2 = (void *)sub_1BDC4F950();
  return v2;
}

- (_TtC17SpotlightServices25SSMarketplaceKitUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SSMarketplaceKitUtilities();
  return [(SSMarketplaceKitUtilities *)&v3 init];
}

@end