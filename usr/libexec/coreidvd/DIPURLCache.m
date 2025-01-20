@interface DIPURLCache
- (_TtC8coreidvd11DIPURLCache)init;
- (_TtC8coreidvd11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5;
- (_TtC8coreidvd11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5;
- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4;
- (void)storeCachedResponse:(id)a3 forRequest:(id)a4;
@end

@implementation DIPURLCache

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1005200D8(v6, 0);
  if (v9)
  {
    v10 = v9;
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for DIPURLCache();
    [(DIPURLCache *)&v11 storeCachedResponse:v10 forDataTask:v7];
  }
  else
  {
  }
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v6 = type metadata accessor for URLRequest();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  objc_super v11 = self;
  id v12 = sub_1005200D8(v10, 0);
  if (v12)
  {
    id v13 = v12;
    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    v15 = (objc_class *)type metadata accessor for DIPURLCache();
    v16.receiver = v11;
    v16.super_class = v15;
    [(DIPURLCache *)&v16 storeCachedResponse:v13 forRequest:isa];

    id v10 = v13;
    objc_super v11 = (_TtC8coreidvd11DIPURLCache *)isa;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC8coreidvd11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5
{
  result = (_TtC8coreidvd11DIPURLCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8coreidvd11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5
{
  uint64_t v6 = sub_100007764(&qword_100720A68);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    uint64_t v11 = 0;
    id v10 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    id v10 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    uint64_t v11 = 1;
  }
  (*v10)(v8, v11, 1, v9);
  result = (_TtC8coreidvd11DIPURLCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8coreidvd11DIPURLCache)init
{
  result = (_TtC8coreidvd11DIPURLCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end