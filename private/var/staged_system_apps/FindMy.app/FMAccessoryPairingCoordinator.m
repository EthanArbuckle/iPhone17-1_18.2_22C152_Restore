@interface FMAccessoryPairingCoordinator
- (_TtC6FindMy29FMAccessoryPairingCoordinator)init;
- (void)proxCardFlowDidDismiss;
@end

@implementation FMAccessoryPairingCoordinator

- (_TtC6FindMy29FMAccessoryPairingCoordinator)init
{
  result = (_TtC6FindMy29FMAccessoryPairingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_accessory;
  uint64_t v4 = type metadata accessor for FMIPDiscoveredAccessory();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_startDate;
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_delegate);
  sub_10011FF38((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_state, type metadata accessor for FMAccessoryPairingCoordinator.State);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10011E6A8();
}

@end