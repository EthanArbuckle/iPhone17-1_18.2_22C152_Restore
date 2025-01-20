@interface WebViewController
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (_TtC5JSApp17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (_TtC5JSApp17WebViewController)initWithCoder:(id)a3;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation WebViewController

- (_TtC5JSApp17WebViewController)initWithCoder:(id)a3
{
  result = (_TtC5JSApp17WebViewController *)sub_86F70();
  __break(1u);
  return result;
}

- (_TtC5JSApp17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = a5;
  result = (_TtC5JSApp17WebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC5JSApp17WebViewController_url;
  uint64_t v3 = sub_85EB0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = objc_allocWithZone((Class)AMSUIAuthenticateTask);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = [v10 initWithRequest:v12 presentingViewController:v13];
  id v15 = [v14 performAuthentication];
  v17[4] = sub_81A78;
  v17[5] = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_812CC;
  v17[3] = &unk_B5FE0;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  [v15 addFinishBlock:v16];
  _Block_release(v16);

  swift_release();
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = objc_allocWithZone((Class)AMSUIAlertDialogTask);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = [v10 initWithRequest:v12 presentingViewController:v13];
  id v15 = [v14 present];
  v17[4] = sub_81A44;
  v17[5] = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_812CC;
  v17[3] = &unk_B5F90;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  [v15 addFinishBlock:v16];
  _Block_release(v16);

  swift_release();
}

@end