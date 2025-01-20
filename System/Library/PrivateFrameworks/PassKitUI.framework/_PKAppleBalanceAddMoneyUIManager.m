@interface _PKAppleBalanceAddMoneyUIManager
- (_PKAppleBalanceAddMoneyUIManager)init;
- (_PKAppleBalanceAddMoneyUIManager)initWithAccount:(id)a3;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)presentAMSDirectTopUpFrom:(id)a3 context:(int64_t)a4 webViewDelegate:(id)a5 completion:(id)a6;
- (void)presentAMSPromotionRedemptionViewFrom:(id)a3 promotionInfo:(id)a4 webViewDelegate:(id)a5;
- (void)presentAMSRedeemGiftcardFrom:(id)a3 webViewDelegate:(id)a4;
- (void)presentAddMoneyFrom:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5;
- (void)presentAddMoneyInterstitialFrom:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5;
- (void)presentDirectTopUpFrom:(id)a3 context:(int64_t)a4 configuration:(id)a5 promotion:(id)a6 completion:(id)a7;
- (void)presentInStoreTopUpFrom:(id)a3 context:(int64_t)a4 token:(id)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation _PKAppleBalanceAddMoneyUIManager

- (_PKAppleBalanceAddMoneyUIManager)initWithAccount:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_activeViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_dtuModel) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_account) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AppleBalanceAddMoneyUIManager();
  id v4 = a3;
  return [(_PKAppleBalanceAddMoneyUIManager *)&v6 init];
}

- (void)presentAddMoneyFrom:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
}

- (void)presentAddMoneyInterstitialFrom:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
}

- (void)presentDirectTopUpFrom:(id)a3 context:(int64_t)a4 configuration:(id)a5 promotion:(id)a6 completion:(id)a7
{
  v12 = (void (*)(void))_Block_copy(a7);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = (void (*)(void))sub_19FAC610C;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  sub_19FABE870(v14, a4, a5, a6, v12, v13);
  sub_19F48BB68((uint64_t)v12);
}

- (void)presentAMSDirectTopUpFrom:(id)a3 context:(int64_t)a4 webViewDelegate:(id)a5 completion:(id)a6
{
  v10 = (void (*)(void))_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = (void (*)(void))sub_19F5C125C;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  swift_unknownObjectRetain();
  uint64_t v13 = self;
  sub_19FAC0158(0, v12, a4, 0, (uint64_t)a5, v10, v11);
  sub_19F48BB68((uint64_t)v10);

  swift_unknownObjectRelease();
}

- (void)presentAMSRedeemGiftcardFrom:(id)a3 webViewDelegate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_19FAC0158(1u, v6, 1, 0, (uint64_t)a4, 0, 0);

  swift_unknownObjectRelease();
}

- (void)presentAMSPromotionRedemptionViewFrom:(id)a3 promotionInfo:(id)a4 webViewDelegate:(id)a5
{
  uint64_t v8 = sub_1A03B47F8();
  id v9 = a3;
  swift_unknownObjectRetain();
  v10 = self;
  uint64_t v11 = (void *)sub_19F5B74BC(v8);
  sub_19FAC0158(2u, v9, 2, v11, (uint64_t)a5, 0, 0);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)presentInStoreTopUpFrom:(id)a3 context:(int64_t)a4 token:(id)a5
{
  id v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_account);
  id v10 = objc_allocWithZone((Class)type metadata accessor for InStoreTopUpTokenModel());
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = self;
  id v14 = sub_19FBD7EA4(v9, a5);
  sub_19FAC11F8(v12, a4, v14);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (_PKAppleBalanceAddMoneyUIManager)init
{
  result = (_PKAppleBalanceAddMoneyUIManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_dtuModel);
}

@end