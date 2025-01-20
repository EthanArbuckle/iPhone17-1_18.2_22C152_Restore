@interface BottomPlayerManager.Queue
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (_TtCC5Music19BottomPlayerManager5Queue)init;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
@end

@implementation BottomPlayerManager.Queue

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10075CBC8(v7, (char *)v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (_TtCC5Music19BottomPlayerManager5Queue)init
{
  result = (_TtCC5Music19BottomPlayerManager5Queue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCC5Music19BottomPlayerManager5Queue__response;
  uint64_t v4 = sub_100063814(&qword_1010A1490);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC5Music19BottomPlayerManager5Queue_playerRequestController);
}

@end