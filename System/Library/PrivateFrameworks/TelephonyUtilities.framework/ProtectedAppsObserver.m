@interface ProtectedAppsObserver
- (_TtC13callservicesd21ProtectedAppsObserver)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
@end

@implementation ProtectedAppsObserver

- (_TtC13callservicesd21ProtectedAppsObserver)init
{
  return (_TtC13callservicesd21ProtectedAppsObserver *)sub_100348E18();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  type metadata accessor for APSubject();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  v6 = self;
  sub_100348F04(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end