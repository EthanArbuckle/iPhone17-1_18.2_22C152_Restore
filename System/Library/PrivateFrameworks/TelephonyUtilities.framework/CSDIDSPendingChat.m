@interface CSDIDSPendingChat
- (BOOL)isVideo;
- (CSDIDSPendingChat)init;
- (CSDIDSPendingChat)initWithUUID:(id)a3 isVideo:(BOOL)a4 handle:(id)a5;
- (NSUUID)uuid;
- (TUHandle)handle;
@end

@implementation CSDIDSPendingChat

- (NSUUID)uuid
{
  return (NSUUID *)sub_10031B064((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CSDIDSPendingChat_uuid);
}

- (BOOL)isVideo
{
  return sub_10031AD58() & 1;
}

- (TUHandle)handle
{
  id v2 = sub_10031AD9C();

  return (TUHandle *)v2;
}

- (CSDIDSPendingChat)initWithUUID:(id)a3 isVideo:(BOOL)a4 handle:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDIDSPendingChat *)sub_10031ADA8((uint64_t)v9, a4, (uint64_t)a5);
}

- (CSDIDSPendingChat)init
{
}

- (void).cxx_destruct
{
}

@end