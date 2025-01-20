@interface PKCredentialCenterViewController
- (PKCredentialCenterViewController)init;
- (PKCredentialCenterViewController)initWithCoder:(id)a3;
- (PKCredentialCenterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation PKCredentialCenterViewController

- (PKCredentialCenterViewController)init
{
  return (PKCredentialCenterViewController *)CredentialCenterViewController.init()();
}

- (PKCredentialCenterViewController)initWithCoder:(id)a3
{
  result = (PKCredentialCenterViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19FD45A5C();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for CredentialCenterViewController();
  v2 = (char *)v15.receiver;
  [(PKCredentialCenterViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(v2, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13 = (id *)&v2[OBJC_IVAR___PKCredentialCenterViewController_hostingVC];
    swift_beginAccess();
    id v14 = objc_msgSend(*v13, sel_view);
    objc_msgSend(v14, sel_setFrame_, v6, v8, v10, v12);
  }
  else
  {
    __break(1u);
  }
}

- (PKCredentialCenterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PKCredentialCenterViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end