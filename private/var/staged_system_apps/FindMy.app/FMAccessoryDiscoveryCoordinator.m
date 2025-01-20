@interface FMAccessoryDiscoveryCoordinator
- (_TtC6FindMy31FMAccessoryDiscoveryCoordinator)init;
- (void)dealloc;
- (void)didCompleteAccessoryOnboarding:(id)a3 pairingSuccessful:(BOOL)a4;
- (void)proxCardFlowDidDismiss;
- (void)systemOnboardingStarted;
@end

@implementation FMAccessoryDiscoveryCoordinator

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  v6 = v4;
  NSString v7 = String._bridgeToObjectiveC()();
  [v5 removeObserver:v6 name:v7 object:0];

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryCoordinator(0);
  [(FMAccessoryDiscoveryCoordinator *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_pairingCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_onboardingCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_sharingDefaults));
  swift_unknownObjectWeakDestroy();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_delegate);
  sub_10027D21C((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_state, type metadata accessor for FMAccessoryDiscoveryCoordinator.State);
  sub_10027D21C((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_initialEvent, type metadata accessor for FMAccessoryDiscoveryCoordinator.Event);
}

- (void)systemOnboardingStarted
{
  v4 = self;
  os_log_type_t v2 = static os_log_type_t.default.getter();
  sub_10027DF94(v2, 0xD000000000000064, 0x800000010058FB90);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  sub_10027DF94(v3, 0xD000000000000038, 0x800000010058F8F0);
  [*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_presenter) dismissViewControllerAnimated:0 completion:0];
  [(FMAccessoryDiscoveryCoordinator *)v4 proxCardFlowDidDismiss];
}

- (_TtC6FindMy31FMAccessoryDiscoveryCoordinator)init
{
  result = (_TtC6FindMy31FMAccessoryDiscoveryCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)proxCardFlowDidDismiss
{
  os_log_type_t v2 = self;
  sub_10027BDC0();
}

- (void)didCompleteAccessoryOnboarding:(id)a3 pairingSuccessful:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10027E138();
}

@end