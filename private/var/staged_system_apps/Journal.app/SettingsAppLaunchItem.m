@interface SettingsAppLaunchItem
+ (id)healthAccessURL;
+ (id)notificationsAccessUrl;
- (_TtC7Journal21SettingsAppLaunchItem)init;
@end

@implementation SettingsAppLaunchItem

+ (id)healthAccessURL
{
  return sub_1002BEA64((uint64_t)a1, (uint64_t)a2, 1);
}

+ (id)notificationsAccessUrl
{
  return sub_1002BEA64((uint64_t)a1, (uint64_t)a2, 0);
}

- (_TtC7Journal21SettingsAppLaunchItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsAppLaunchItem();
  return [(SettingsAppLaunchItem *)&v3 init];
}

@end