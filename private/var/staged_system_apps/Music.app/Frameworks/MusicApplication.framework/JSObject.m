@interface JSObject
- (BOOL)isEqual:(id)a3;
- (_TtC11MusicJSCore8JSObject)init;
- (int64_t)hash;
- (void)dealloc;
@end

@implementation JSObject

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSObject_isNativeOnly) == 1)
  {
    v3 = self;
  }
  else
  {
    uint64_t v4 = qword_DFBB58;
    v5 = self;
    if (v4 != -1) {
      swift_once();
    }
    v6 = (void *)static JSBridge.shared;
    uint64_t v8 = *(uint64_t *)((char *)&v5->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier);
    uint64_t v7 = *(void *)&v5->nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier];
    sub_638F0();
    v9 = (void *)swift_allocObject();
    v9[2] = v6;
    v9[3] = v8;
    v9[4] = v7;
    swift_bridgeObjectRetain_n();
    id v10 = v6;
    static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_9EB848, (uint64_t)v9);
    swift_bridgeObjectRelease();
    swift_release();
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for JSObject();
  [(JSObject *)&v11 dealloc];
}

- (void).cxx_destruct
{
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_AB67B0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = JSObject.isEqual(_:)((uint64_t)v8);

  sub_A85C8((uint64_t)v8);
  return v6 & 1;
}

- (_TtC11MusicJSCore8JSObject)init
{
  result = (_TtC11MusicJSCore8JSObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end