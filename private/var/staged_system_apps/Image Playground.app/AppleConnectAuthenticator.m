@interface AppleConnectAuthenticator
- (_TtC16Image_Playground25AppleConnectAuthenticator)init;
- (void)authenticateIfNeededWithCompletion:(id)a3;
@end

@implementation AppleConnectAuthenticator

- (_TtC16Image_Playground25AppleConnectAuthenticator)init
{
  return (_TtC16Image_Playground25AppleConnectAuthenticator *)sub_100005C5C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_context);
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  uint64_t v5 = sub_100004188(&qword_100011008);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  type metadata accessor for MainActor();
  v11 = self;
  swift_retain();
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  v13[5] = sub_1000066A0;
  v13[6] = v9;
  sub_100006160((uint64_t)v7, (uint64_t)&unk_100011018, (uint64_t)v13);

  swift_release();
  swift_release();
}

@end