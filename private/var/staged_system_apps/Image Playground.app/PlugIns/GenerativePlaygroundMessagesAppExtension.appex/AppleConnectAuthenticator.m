@interface AppleConnectAuthenticator
- (_TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator)init;
- (void)authenticateIfNeededWithCompletion:(id)a3;
@end

@implementation AppleConnectAuthenticator

- (_TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator)init
{
  return (_TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator *)sub_100003854();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_context);
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  sub_1000040F4(&qword_10001D3F8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = sub_100013F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  sub_100013F60();
  v10 = self;
  swift_retain();
  uint64_t v11 = sub_100013F50();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v10;
  v12[5] = sub_100004170;
  v12[6] = v8;
  sub_1000046E4((uint64_t)v6, (uint64_t)&unk_10001D408, (uint64_t)v12);

  swift_release();
  swift_release();
}

@end