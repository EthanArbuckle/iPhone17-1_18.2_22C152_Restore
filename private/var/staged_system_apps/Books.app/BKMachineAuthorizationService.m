@interface BKMachineAuthorizationService
+ (void)requestAuthorizeWithAccount:(id)a3 completion:(id)a4;
+ (void)requestKeybagRefetchWithDsid:(unint64_t)a3 completion:(id)a4;
- (BKMachineAuthorizationService)init;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
@end

@implementation BKMachineAuthorizationService

+ (void)requestAuthorizeWithAccount:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_1007FDC70();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  id v9 = [self sceneManager];
  v10 = (void *)swift_allocObject();
  v10[2] = v5;
  v10[3] = v7;
  v10[4] = sub_1004C70C0;
  v10[5] = v8;
  v12[4] = sub_1004C70AC;
  v12[5] = v10;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000B4B4;
  v12[3] = &unk_100A5D8E8;
  v11 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v9 requestPrimaryScene:v11];
  _Block_release(v11);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)requestKeybagRefetchWithDsid:(unint64_t)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = [self sceneManager];
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_1004C7020;
  v8[4] = v6;
  v10[4] = sub_1004C7060;
  v10[5] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10000B4B4;
  v10[3] = &unk_100A5D870;
  id v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v7 requestPrimaryScene:v9];
  _Block_release(v9);
  swift_release();
}

- (BKMachineAuthorizationService)init
{
  return (BKMachineAuthorizationService *)sub_1004C6230();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BKMachineAuthorizationService_logger;
  uint64_t v4 = sub_1007F6BC0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  sub_10007A6D0();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a3;
  v9[4] = sub_1004C70B8;
  v9[5] = v7;
  id v10 = a3;
  v11 = self;
  swift_retain();
  swift_retain();
  sub_1007FE6C0();

  swift_release();
  swift_release();

  swift_release();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  sub_10007A6D0();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1004C6D24;
  v8[5] = v7;
  id v9 = a3;
  id v10 = self;
  id v11 = v9;
  swift_retain();
  sub_1007FE6C0();

  swift_release();

  swift_release();
}

@end