@interface NotificationContent
- (BOOL)shouldCallMlDaemon;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC33iCloudSubscriptionOptimizerClient19NotificationContent)init;
@end

@implementation NotificationContent

- (BOOL)shouldCallMlDaemon
{
  sub_228AAD370();
  uint64_t v2 = sub_228AAD360();
  return v2 == sub_228AAD360();
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_228AAD7A0();
  sub_228AAD6C0();
  sub_228AAD390();
  sub_228AAD7C0();
  sub_228AAD6C0();

  v3 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  v3 = [(NotificationContent *)v2 description];
  sub_228AAD660();

  v4 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC33iCloudSubscriptionOptimizerClient19NotificationContent)init
{
  result = (_TtC33iCloudSubscriptionOptimizerClient19NotificationContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end