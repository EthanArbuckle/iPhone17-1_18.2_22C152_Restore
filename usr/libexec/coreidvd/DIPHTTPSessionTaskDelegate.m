@interface DIPHTTPSessionTaskDelegate
- (_TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate)init;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
@end

@implementation DIPHTTPSessionTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v27 = a5;
  v28 = self;
  uint64_t v10 = sub_100007764((uint64_t *)&unk_100734020);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v25 - v14;
  uint64_t v16 = type metadata accessor for URLRequest();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (void (**)(void *, Class))_Block_copy(a7);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  sub_1005E0158((uint64_t)v15, (uint64_t)v13);
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v13, 1, v16);
  id v26 = a3;
  id v25 = a4;
  id v22 = v27;
  v23 = v28;
  Class isa = 0;
  if (v21 != 1)
  {
    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v16);
  }
  v20[2](v20, isa);

  sub_10000C6CC((uint64_t)v15, (uint64_t *)&unk_100734020);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1005DF8EC(v7);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1005DFD54((uint64_t)a4);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1005DFFDC(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(DIPHTTPSessionTaskDelegate *)&v3 init];
}

@end