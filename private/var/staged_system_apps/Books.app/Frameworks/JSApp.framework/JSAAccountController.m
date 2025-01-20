@interface JSAAccountController
+ (id)sharedController;
- (JSAAccountController)init;
- (void)addObserver:(id)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)openIForgot;
- (void)openTermsAndConditions;
- (void)presentGiftViewControllerForAdamID:(NSString *)a3 options:(NSDictionary *)a4 completion:(id)a5;
- (void)presentGiftViewControllerForAdamID:(id)a3 :(id)a4 :(id)a5;
- (void)presentRedeemViewControllerForRedemptionCode:(NSString *)a3 options:(NSDictionary *)a4 completion:(id)a5;
- (void)presentRedeemViewControllerForRedemptionCode:(id)a3 :(id)a4 :(id)a5;
- (void)reauthenticateSignIn:(id)a3 :(id)a4;
- (void)removeObserver:(id)a3;
- (void)showAccountViewControllerWithUrl:(id)a3 :(id)a4 :(id)a5;
- (void)signIn:(id)a3;
- (void)signInEnablingAccountCreation:(BOOL)a3 completion:(id)a4;
- (void)signOut:(id)a3;
- (void)viewAppleID:(id)a3 :(id)a4;
@end

@implementation JSAAccountController

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)signInEnablingAccountCreation:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_CD010;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_CD018;
  v14[5] = v13;
  v15 = self;
  sub_59BFC((uint64_t)v9, (uint64_t)&unk_CD020, (uint64_t)v14);
  swift_release();
}

- (void)presentGiftViewControllerForAdamID:(NSString *)a3 options:(NSDictionary *)a4 completion:(id)a5
{
  uint64_t v9 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_CCFF0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_CCFF8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_59BFC((uint64_t)v11, (uint64_t)&unk_CD000, (uint64_t)v16);
  swift_release();
}

- (void)presentRedeemViewControllerForRedemptionCode:(NSString *)a3 options:(NSDictionary *)a4 completion:(id)a5
{
  uint64_t v9 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_CCFB0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_CCFC0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_59BFC((uint64_t)v11, (uint64_t)&unk_CCFD0, (uint64_t)v16);
  swift_release();
}

- (JSAAccountController)init
{
  return (JSAAccountController *)AccountController.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAAccountController_observerQueue);
}

+ (id)sharedController
{
  if (qword_CC4A0 != -1) {
    swift_once();
  }
  v0 = (void *)qword_CCE40;

  return v0;
}

- (void)openIForgot
{
}

- (void)openTermsAndConditions
{
}

- (void)presentGiftViewControllerForAdamID:(id)a3 :(id)a4 :(id)a5
{
  v5 = a5;
  if (a3)
  {
    uint64_t v8 = sub_86860();
    uint64_t v10 = v9;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  uint64_t v10 = 0;
  if (a5) {
LABEL_3:
  }
    v5 = (void *)sub_86800();
LABEL_4:
  id v11 = a4;
  uint64_t v12 = self;
  v13.value._countAndFlagsBits = v8;
  v13.value._object = v10;
  v15.value._rawValue = v5;
  AccountController.presentGiftViewController(for:_:_:)(v13, (JSValue)v11, v15);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)presentRedeemViewControllerForRedemptionCode:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v9 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4) {
    a4 = (id)sub_86800();
  }
  uint64_t v12 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  Swift::String_optional v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a3;
  v13[5] = self;
  v13[6] = a4;
  v13[7] = a5;
  swift_bridgeObjectRetain();
  id v14 = a3;
  id v15 = a5;
  uint64_t v16 = self;
  id v17 = v14;
  v18 = v16;
  id v19 = v15;
  sub_339CC((uint64_t)v11, (uint64_t)&unk_CCFA0, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)viewAppleID:(id)a3 :(id)a4
{
  uint64_t v7 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4) {
    a4 = (id)sub_86800();
  }
  uint64_t v10 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a4;
  v11[5] = a3;
  swift_bridgeObjectRetain();
  id v12 = a3;
  Swift::String_optional v13 = self;
  sub_339CC((uint64_t)v9, (uint64_t)&unk_CCF98, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)signIn:(id)a3
{
  uint64_t v5 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone((Class)AMSAuthenticateOptions);
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = [v8 init];
  [v11 setEnableAccountCreation:1];
  uint64_t v12 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  Swift::String_optional v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = v11;
  v13[6] = v9;
  id v14 = v9;
  id v15 = v10;
  sub_339CC((uint64_t)v7, (uint64_t)&unk_CCF90, (uint64_t)v13);

  swift_release();
}

- (void)signOut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AccountController.signOut(_:)((JSValue)v4);
}

- (void)reauthenticateSignIn:(id)a3 :(id)a4
{
  if (a3) {
    uint64_t v6 = (void *)sub_86800();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a4;
  id v8 = self;
  v11.value._rawValue = v6;
  v11.is_nil = (char)v7;
  AccountController.reauthenticateSignIn(with:_:)(v11, v9);

  swift_bridgeObjectRelease();
}

- (void)showAccountViewControllerWithUrl:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8 = sub_86860();
  unint64_t v10 = v9;
  if (a5) {
    a5 = (id)sub_86800();
  }
  id v11 = a4;
  uint64_t v12 = self;
  _s5JSApp17AccountControllerC04showb4ViewC04with__ySS_So7JSValueCSDys11AnyHashableVypGSgtF_0(v8, v10, v11, (uint64_t)a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  sub_5B85C(v11, (uint64_t)sub_5BB88, v9);

  swift_release();
}

@end