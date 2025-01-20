@interface AuthenticatorWrapper
- (BOOL)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (_TtC9PassKitUI20AuthenticatorWrapper)init;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)contextWillBeginPresentingSecondaryUI:(id)a3;
- (void)dealloc;
- (void)dismissPasscodeViewController;
- (void)dismissPassphraseViewController;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
@end

@implementation AuthenticatorWrapper

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI20AuthenticatorWrapper_authenticator);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  objc_msgSend(v4, sel_setDelegate_, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AuthenticatorWrapper *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI20AuthenticatorWrapper__authenticatorModel;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E949CE28);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI20AuthenticatorWrapper_delegate;

  sub_19F482DB0((uint64_t)v5);
}

- (_TtC9PassKitUI20AuthenticatorWrapper)init
{
  result = (_TtC9PassKitUI20AuthenticatorWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FB938B4();
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_19FB93AF4(a4, a5);
}

- (BOOL)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  return 1;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = a3;
  id v8 = self;
  sub_19FB93BA4(var0, var1);
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_19FB94044(a4);
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a4);
  id v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    id v8 = sub_19FB94A90;
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  if (v9)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v10;
    v10 = sub_19FB94A8C;
  }
LABEL_5:
  id v12 = a3;
  v13 = self;
  sub_19FB942FC(a3, (uint64_t)v8, v11);
  sub_19F48BB68((uint64_t)v10);
  sub_19F48BB68((uint64_t)v8);
}

- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a4);
  id v9 = (void (*)(uint64_t, unint64_t))_Block_copy(a5);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    id v8 = sub_19F5491B4;
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  if (v9)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v10;
    v10 = sub_19FB94A04;
  }
LABEL_5:
  id v12 = a3;
  v13 = self;
  sub_19FB945F0(a3, (uint64_t)v8, v11);
  sub_19F48BB68((uint64_t)v10);
  sub_19F48BB68((uint64_t)v8);
}

- (void)dismissPasscodeViewController
{
  v2 = self;
  sub_19FB933E0("AuthenticatorWrapper - dismissPasscodeViewController");
}

- (void)dismissPassphraseViewController
{
  v2 = self;
  sub_19FB933E0("AuthenticatorWrapper - dismissPassphraseViewController");
}

@end