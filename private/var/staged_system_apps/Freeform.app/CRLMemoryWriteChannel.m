@interface CRLMemoryWriteChannel
- (BOOL)isValid;
- (_TtC8Freeform21CRLMemoryWriteChannel)init;
- (void)addBarrier:(id)a3;
- (void)flushWithCompletion:(id)a3;
- (void)writeData:(id)a3 handler:(id)a4;
@end

@implementation CRLMemoryWriteChannel

- (void)writeData:(id)a3 handler:(id)a4
{
  uint64_t v7 = type metadata accessor for DispatchData();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void (**)(void *, uint64_t, uint64_t, void))_Block_copy(a4);
  static DispatchData._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  id v13 = a3;
  v14 = self;
  DispatchData.append(_:)();
  swift_endAccess();
  uint64_t v15 = DispatchData.count.getter();
  v12[2](v12, 1, v15, 0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  _Block_release(v12);
}

- (void)flushWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *, void))v4[2];
  v6 = self;
  v5(v4, 0);
  _Block_release(v4);
}

- (void)addBarrier:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (BOOL)isValid
{
  return 1;
}

- (_TtC8Freeform21CRLMemoryWriteChannel)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  static DispatchData.empty.getter();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(CRLMemoryWriteChannel *)&v5 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLMemoryWriteChannel_dispatchData;
  uint64_t v3 = type metadata accessor for DispatchData();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end