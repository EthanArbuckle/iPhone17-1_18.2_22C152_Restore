@interface MessageHandler
- (BOOL)messageViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5;
- (_TtC7MusicUI14MessageHandler)init;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5;
@end

@implementation MessageHandler

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_229E779D4((uint64_t)v8, v7);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  sub_22A170640();
  if (a5) {
    sub_22A1707E0();
  }
  id v8 = a3;
  v9 = self;
  sub_229E77A7C();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)messageViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  char v12 = sub_229E77BC4((int)v9, v10, (uint64_t)v11, v8);
  _Block_release(v8);

  return v12 & 1;
}

- (_TtC7MusicUI14MessageHandler)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI14MessageHandler_coordinator);
}

@end