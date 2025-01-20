@interface UrsaClient
- (_TtC21PowerlogLiteOperators10UrsaClient)init;
- (_TtC21PowerlogLiteOperators10UrsaClient)initWith:(BOOL)a3;
- (void)cancel;
- (void)submitUrsaWith:(id)a3 build:(id)a4 device:(id)a5 flag:(id)a6 fetchStartTime:(double)a7 requestId:(id)a8 completion:(id)a9;
@end

@implementation UrsaClient

- (_TtC21PowerlogLiteOperators10UrsaClient)initWith:(BOOL)a3
{
  return (_TtC21PowerlogLiteOperators10UrsaClient *)UrsaClient.init(_:)(a3);
}

- (void)submitUrsaWith:(id)a3 build:(id)a4 device:(id)a5 flag:(id)a6 fetchStartTime:(double)a7 requestId:(id)a8 completion:(id)a9
{
  v10 = _Block_copy(a9);
  uint64_t v28 = sub_1D2ADB7E8();
  uint64_t v12 = v11;
  uint64_t v27 = sub_1D2ADB7E8();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1D2ADB7E8();
  uint64_t v17 = v16;
  uint64_t v18 = sub_1D2ADB7E8();
  uint64_t v20 = v19;
  uint64_t v21 = sub_1D2ADB7E8();
  uint64_t v23 = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v10;
  v26 = self;
  UrsaClient.submitUrsa(_:_:_:_:_:_:_:)(v28, v12, v27, v14, v15, v17, v18, v20, a7, v21, v23, (uint64_t)sub_1D270BBB4, v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)cancel
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21PowerlogLiteOperators10UrsaClient_currentTask))
  {
    v2 = self;
    swift_retain();
    sub_1D2ADB8F8();

    swift_release();
  }
}

- (_TtC21PowerlogLiteOperators10UrsaClient)init
{
  result = (_TtC21PowerlogLiteOperators10UrsaClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end