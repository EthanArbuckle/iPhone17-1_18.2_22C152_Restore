@interface SDShareSheetAirDropTransferUpdate
- (NSString)realName;
- (NSString)sessionID;
- (SDShareSheetAirDropTransferUpdate)init;
- (SDShareSheetAirDropTransferUpdate)initWithSessionID:(id)a3 realName:(id)a4;
- (double)progress;
- (int64_t)state;
- (void)setProgress:(double)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SDShareSheetAirDropTransferUpdate

- (NSString)sessionID
{
  return (NSString *)sub_10060F6F0();
}

- (NSString)realName
{
  return (NSString *)sub_10060F6F0();
}

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_state);
}

- (void)setState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_state) = (Class)a3;
}

- (double)progress
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_progress);
}

- (void)setProgress:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_progress) = a3;
}

- (SDShareSheetAirDropTransferUpdate)initWithSessionID:(id)a3 realName:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_state) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_progress) = 0;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_sessionID);
  uint64_t *v10 = v6;
  v10[1] = v8;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_realName);
  uint64_t *v11 = v9;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return [(SDShareSheetAirDropTransferUpdate *)&v14 init];
}

- (SDShareSheetAirDropTransferUpdate)init
{
  result = (SDShareSheetAirDropTransferUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end