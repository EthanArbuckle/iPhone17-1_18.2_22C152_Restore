@interface NearbySessionsListener
+ (id)createForHomePodWithDelegate:(id)a3;
+ (id)createWithDelegate:(id)a3;
- (_TtC12mediaremoted22NearbySessionsListener)init;
@end

@implementation NearbySessionsListener

+ (id)createWithDelegate:(id)a3
{
  sub_100013A80((uint64_t *)&unk_100478510);
  swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v4 = NearbyInvitationScanner.init(provider:)();
  id v5 = objc_allocWithZone((Class)type metadata accessor for NearbySessionsListenerImplementation());
  swift_unknownObjectRetain();
  id v6 = sub_100195430(v4, 0, (uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

+ (id)createForHomePodWithDelegate:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for NearbyInvitationParameters());
  swift_unknownObjectRetain();
  id v5 = (void *)NearbyInvitationParameters.init(serviceName:browserType:route:)();
  sub_100013A80((uint64_t *)&unk_100478510);
  swift_allocObject();
  id v6 = v5;
  uint64_t v7 = NearbyInvitationScanner.init(provider:configuration:)();
  id v8 = objc_allocWithZone((Class)type metadata accessor for NearbySessionsListenerImplementation());
  swift_unknownObjectRetain();
  id v9 = sub_100195430(v7, 1, (uint64_t)a3);
  swift_unknownObjectRelease();

  return v9;
}

- (_TtC12mediaremoted22NearbySessionsListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbySessionsListener();
  return [(NearbySessionsListener *)&v3 init];
}

@end