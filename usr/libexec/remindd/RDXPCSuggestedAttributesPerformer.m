@interface RDXPCSuggestedAttributesPerformer
- (_TtC7remindd33RDXPCSuggestedAttributesPerformer)init;
- (void)dealloc;
- (void)performSwiftInvocation:(id)a3 withParametersData:(id)a4 storages:(id)a5 completion:(id)a6;
- (void)preWarmModels;
@end

@implementation RDXPCSuggestedAttributesPerformer

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1009070A8;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10008E2DC(v6, (uint64_t)qword_10090F250);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Deallocating SuggestedAttributesPerformer", v9, 2u);
    swift_slowDealloc();
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(RDXPCSuggestedAttributesPerformer *)&v10 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_cachedEditingSessionID, (uint64_t *)&unk_100909E50);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_storePerformer));
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_cachedMLModels, &qword_10090F390);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_contactStore);
}

- (void)preWarmModels
{
  v2 = self;
  sub_1001D26D8();
}

- (void)performSwiftInvocation:(id)a3 withParametersData:(id)a4 storages:(id)a5 completion:(id)a6
{
  objc_super v10 = _Block_copy(a6);
  id v11 = a3;
  id v12 = a4;
  v19 = self;
  id v13 = a5;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  if (v13)
  {
    sub_1000963CC(0, (unint64_t *)&qword_10090A3B0);
    sub_1000E4F40((unint64_t *)&qword_10090A3C0, (unint64_t *)&qword_10090A3B0);
    uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(uint64_t *)((char *)&v19->super.isa + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_storePerformer);
  _Block_copy(v10);
  sub_100563B54(v11, v14, v16, v17, (uint64_t)v19, v18, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_bridgeObjectRelease();
  sub_100097F34(v14, v16);
}

- (_TtC7remindd33RDXPCSuggestedAttributesPerformer)init
{
  result = (_TtC7remindd33RDXPCSuggestedAttributesPerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end