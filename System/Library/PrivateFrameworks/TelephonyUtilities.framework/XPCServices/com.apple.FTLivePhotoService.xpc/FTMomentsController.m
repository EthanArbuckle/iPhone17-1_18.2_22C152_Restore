@interface FTMomentsController
- (FTMomentsController)init;
- (OS_dispatch_queue)queue;
- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4;
- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4;
- (void)prewarmAudioClientWithCompletion:(id)a3;
- (void)prewarmMediaRequest:(id)a3 completion:(id)a4;
- (void)registerClient:(id)a3;
- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7;
- (void)registerXPCClientWithReply:(id)a3;
- (void)resetVideoMessagingWithSessionUUID:(id)a3 completionHandler:(id)a4;
- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4;
- (void)setQueue:(id)a3;
- (void)setup;
- (void)startMediaRequest:(id)a3 completion:(id)a4;
- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7;
- (void)unregisterClient:(id)a3;
- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4;
@end

@implementation FTMomentsController

- (OS_dispatch_queue)queue
{
  id v2 = sub_10001488C();

  return (OS_dispatch_queue *)v2;
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000148F8((uint64_t)v4);
}

- (FTMomentsController)init
{
  sub_10001490C();
  return result;
}

- (void)setup
{
  id v2 = self;
  sub_100014CE4();
}

- (void).cxx_destruct
{
  sub_10000D5B8((uint64_t)self + OBJC_IVAR___FTMomentsController_messageController);

  swift_unknownObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FTMomentsController_queue);
}

- (void)prewarmMediaRequest:(id)a3 completion:(id)a4
{
}

- (void)startMediaRequest:(id)a3 completion:(id)a4
{
}

- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4
{
}

- (void)registerXPCClientWithReply:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_10002C6E4((uint64_t)&unk_100059E98, v5);
}

- (void)registerClient:(id)a3
{
  sub_1000161B0(self, a2, a3, "Registering XPC client %s", v3);
}

- (void)unregisterClient:(id)a3
{
}

- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7
{
  v10 = _Block_copy(a7);
  if (a4)
  {
    sub_10003CFC0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_10003CF70();
LABEL_4:
  *(void *)(swift_allocObject() + 16) = v10;
  v11 = self;
  sub_100016220();

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_100016DA0();

  swift_release();
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7
{
  v10 = _Block_copy(a7);
  if (a5)
  {
    sub_10003CFC0();
    if (!a6) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a6) {
LABEL_3:
  }
    sub_10003CFC0();
LABEL_5:
  *(void *)(swift_allocObject() + 16) = v10;
  v11 = self;
  sub_100017730();

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10003CFC0();
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_1000188DC();

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100019120((uint64_t)sub_10001D62C, v5);

  swift_release();
}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_100019520(a3, (uint64_t)v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_10001AAD4(v8, (uint64_t)sub_10001D62C, v7);

  swift_release();
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  __chkstk_darwin(v7 - 8);
  v9 = (void (*)(void))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = _Block_copy(a4);
  if (a3)
  {
    sub_10003CD80();
    uint64_t v11 = sub_10003CDA0();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = sub_10003CDA0();
    uint64_t v12 = 1;
  }
  sub_10000FA0C((uint64_t)v9, v12, 1, v11);
  _Block_copy(v10);
  v13 = self;
  sub_10001B928(v9, (uint64_t)v13, (void (**)(void, void))v10);
  _Block_release(v10);

  sub_10001BF90((uint64_t)v9);
}

@end