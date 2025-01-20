@interface DigitalPresentmentAuthorizationCoordinatorPrivateDelegate
- (_TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate)init;
- (void)paymentAuthorizationCoordinator:(PKPaymentAuthorizationCoordinator *)a3 didAuthorizeContextWithHandler:(id)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4;
@end

@implementation DigitalPresentmentAuthorizationCoordinatorPrivateDelegate

- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4
{
  id v7 = a3;
  v8 = self;
  id v9 = a4;
  sub_1000EC660(a3, (uint64_t)a4);
}

- (void)paymentAuthorizationCoordinator:(PKPaymentAuthorizationCoordinator *)a3 didAuthorizeContextWithHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100723640;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100724BD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_100721260, (uint64_t)v14);
  swift_release();
}

- (_TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate)init
{
  result = (_TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end