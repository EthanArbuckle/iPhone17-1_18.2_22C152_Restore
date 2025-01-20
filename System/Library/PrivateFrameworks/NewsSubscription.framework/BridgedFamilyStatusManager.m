@interface BridgedFamilyStatusManager
- (_TtC16NewsSubscription26BridgedFamilyStatusManager)init;
- (id)refreshFamilyStatus;
- (id)syncFamilyStatus;
@end

@implementation BridgedFamilyStatusManager

- (id)refreshFamilyStatus
{
  sub_1BFB956AC(self, (uint64_t)a2, (uint64_t)&unk_1F1B3A628, (uint64_t)sub_1BFB95D94, (uint64_t)&block_descriptor_22);
  return result;
}

- (id)syncFamilyStatus
{
  sub_1BFB956AC(self, (uint64_t)a2, (uint64_t)&unk_1F1B3A5D8, (uint64_t)sub_1BFB95D90, (uint64_t)&block_descriptor_15_1);
  return result;
}

- (_TtC16NewsSubscription26BridgedFamilyStatusManager)init
{
  id result = (_TtC16NewsSubscription26BridgedFamilyStatusManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end