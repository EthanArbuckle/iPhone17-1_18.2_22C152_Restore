@interface PresentmentSessionProxy
- (_TtC7idcredd23PresentmentSessionProxy)init;
- (void)buildCredentialResponseForSelection:(DCPresentmentSelection *)a3 completion:(id)a4;
- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4;
- (void)buildResponseForSelection:(DCPresentmentSelection *)a3 completion:(id)a4;
- (void)configureWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4;
- (void)interpretRequest:(DCPresentmentRequest *)a3 completion:(id)a4;
@end

@implementation PresentmentSessionProxy

- (void)dealloc
{
  v2 = self;
  sub_10004E40C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)configureWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v9);
  id v11 = a5;
  v12 = self;
  sub_100051CE4(v10, a4, a5, (uint64_t)v12, (uint64_t)v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C19A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C19A8;
  v14[5] = v13;
  v15 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C19B0, (uint64_t)v14);
  swift_release();
}

- (void)interpretRequest:(DCPresentmentRequest *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C1978;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1980;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C1988, (uint64_t)v14);
  swift_release();
}

- (void)buildResponseForSelection:(DCPresentmentSelection *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C1958;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1960;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C1968, (uint64_t)v14);
  swift_release();
}

- (void)buildCredentialResponseForSelection:(DCPresentmentSelection *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C1938;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1940;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C1948, (uint64_t)v14);
  swift_release();
}

- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C1918;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1920;
  v14[5] = v13;
  v15 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0E50, (uint64_t)v14);
  swift_release();
}

- (_TtC7idcredd23PresentmentSessionProxy)init
{
  result = (_TtC7idcredd23PresentmentSessionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end