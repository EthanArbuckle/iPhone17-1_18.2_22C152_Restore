@interface NotificationProxyScoringService
- (_TtC19NewsPersonalization31NotificationProxyScoringService)init;
@end

@implementation NotificationProxyScoringService

- (_TtC19NewsPersonalization31NotificationProxyScoringService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC19NewsPersonalization31NotificationProxyScoringService_proxyConnection;
  sub_1DE7AE2D0();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1DE7AE2C0();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(NotificationProxyScoringService *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization31NotificationProxyScoringService_proxyConnection));
}

@end