@interface LocalAudioRouteProvider
- (BOOL)hasActiveAudioSession;
- (_TtC13callservicesd23LocalAudioRouteProvider)init;
- (void)audioInterruptionPropertiesChangedWithNotification:(id)a3;
- (void)audioRouteInformationChangedWithNotification:(id)a3;
- (void)callsChangedForCallCenterObserver:(id)a3;
@end

@implementation LocalAudioRouteProvider

- (BOOL)hasActiveAudioSession
{
  return sub_1003339E4();
}

- (void)audioRouteInformationChangedWithNotification:(id)a3
{
}

- (void)audioInterruptionPropertiesChangedWithNotification:(id)a3
{
}

- (_TtC13callservicesd23LocalAudioRouteProvider)init
{
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_routesDidChangeHandler));
  swift_bridgeObjectRelease();

  sub_1002018DC((uint64_t)self + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_localAudioSystemProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_lastUserPickedRoute));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_callAudioInterruptionState);

  sub_100336600(v3);
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100336208();
  swift_unknownObjectRelease();
}

@end