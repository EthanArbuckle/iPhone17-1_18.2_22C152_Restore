@interface CSDVoucherManagerImpl
- (CSDVoucherManagerImpl)init;
- (CSDVoucherManagerImpl)initWithIdsService:(id)a3;
- (void)sign:(id)a3 as:(id)a4 completion:(id)a5;
- (void)verify:(id)a3 completion:(id)a4;
@end

@implementation CSDVoucherManagerImpl

- (CSDVoucherManagerImpl)initWithIdsService:(id)a3
{
  return (CSDVoucherManagerImpl *)sub_1002B89F8(a3);
}

- (void)sign:(id)a3 as:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v14 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  _Block_copy(v8);
  sub_1002B8BE0(v11, v13, v10, (char *)v14, (void (**)(void, void, void))v8);
  _Block_release(v8);
  sub_1001F7498(v11, v13);
}

- (void)verify:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1002B9EC0(v7, v8, v6);
  _Block_release(v6);
}

- (CSDVoucherManagerImpl)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDVoucherManagerImpl_idsService);
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDVoucherManagerImpl_idsPushHandler);
  v3 = (char *)self + OBJC_IVAR___CSDVoucherManagerImpl_timeout;
  uint64_t v4 = type metadata accessor for DispatchTimeInterval();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDVoucherManagerImpl_verificationCache);
}

@end