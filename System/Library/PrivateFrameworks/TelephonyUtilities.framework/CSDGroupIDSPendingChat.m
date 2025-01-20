@interface CSDGroupIDSPendingChat
- (CSDGroupIDSPendingChat)init;
- (CSDGroupIDSPendingChat)initWithUUID:(id)a3 handle:(id)a4;
- (NSUUID)uuid;
- (TUHandle)handle;
@end

@implementation CSDGroupIDSPendingChat

- (NSUUID)uuid
{
  return (NSUUID *)sub_10031B064((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CSDGroupIDSPendingChat_uuid);
}

- (TUHandle)handle
{
  id v2 = sub_10031B1FC();

  return (TUHandle *)v2;
}

- (CSDGroupIDSPendingChat)initWithUUID:(id)a3 handle:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDGroupIDSPendingChat *)sub_10031B208((uint64_t)v7, (uint64_t)a4);
}

- (CSDGroupIDSPendingChat)init
{
}

- (void).cxx_destruct
{
}

@end