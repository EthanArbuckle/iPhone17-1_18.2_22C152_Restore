@interface LocalFindableConnectionMaterialTrampoline
- (_TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline)init;
- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4;
- (void)startLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3;
- (void)stopLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3;
@end

@implementation LocalFindableConnectionMaterialTrampoline

- (void)startLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100A8A4CC(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)stopLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1001DF814;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_101658318, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  v22 = (void (**)(uint64_t, uint64_t))&v21[v20];
  *v22 = sub_1001DFD28;
  v22[1] = (void (*)(uint64_t, uint64_t))v17;
  v23 = self;
  swift_retain();
  sub_100885EBC((uint64_t)v8, (uint64_t)&unk_101658300, (uint64_t)v21);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (_TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline)init
{
  result = (_TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end