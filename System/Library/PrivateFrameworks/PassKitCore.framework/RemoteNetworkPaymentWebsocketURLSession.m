@interface RemoteNetworkPaymentWebsocketURLSession
- (_TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession)init;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 webSocketTask:(id)a4 didCloseWithCode:(int64_t)a5 reason:(id)a6;
- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5;
- (void)dealloc;
@end

@implementation RemoteNetworkPaymentWebsocketURLSession

- (void)dealloc
{
  v2 = self;
  sub_190FB0E50();
}

- (void).cxx_destruct
{
  sub_190F1042C((uint64_t)self + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_delegate);
  sub_190F9B030(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_remoteIdentifier), *(void *)&self->delegate[OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_remoteIdentifier]);
  v3 = (char *)self + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_websocketURL;
  uint64_t v4 = sub_1915EEAA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_urlSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_delegateQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_webSocketTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_pingTimer));
  v5 = (char *)self + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_logger;
  uint64_t v6 = sub_1915EECD0();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5
{
  if (a5) {
    sub_1915EF030();
  }
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_190FB6E44();

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didCloseWithCode:(int64_t)a5 reason:(id)a6
{
  uint64_t v6 = a6;
  if (a6)
  {
    id v10 = a3;
    id v11 = a4;
    v12 = self;
    id v13 = v6;
    uint64_t v6 = (void *)sub_1915EEAF0();
    unint64_t v15 = v14;
  }
  else
  {
    id v16 = a3;
    id v17 = a4;
    v18 = self;
    unint64_t v15 = 0xF000000000000000;
  }
  sub_190FB70FC(a5, (uint64_t)v6, v15);
  sub_190E14B50((uint64_t)v6, v15);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_190FB7374(a4);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_190FB7564((int)v9, a5);
}

- (_TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession)init
{
  result = (_TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end