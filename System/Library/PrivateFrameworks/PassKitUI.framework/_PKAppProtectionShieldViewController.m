@interface _PKAppProtectionShieldViewController
- (_PKAppProtectionShieldViewController)initWithCoder:(id)a3;
- (_PKAppProtectionShieldViewController)initWithConfiguration:(id)a3;
- (_PKAppProtectionShieldViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation _PKAppProtectionShieldViewController

- (_PKAppProtectionShieldViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  return (_PKAppProtectionShieldViewController *)AppProtectionShieldViewController.init(configuration:)(a3);
}

- (_PKAppProtectionShieldViewController)initWithCoder:(id)a3
{
  result = (_PKAppProtectionShieldViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19FA2DE88();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AppProtectionShieldViewController();
  v2 = (char *)v14.receiver;
  [(_PKAppProtectionShieldViewController *)&v14 viewWillLayoutSubviews];
  id v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____PKAppProtectionShieldViewController_appProtectionShieldVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);
  }
  else
  {
    __break(1u);
  }
}

- (_PKAppProtectionShieldViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_PKAppProtectionShieldViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAppProtectionShieldViewController_appProtectionShieldVC));
}

@end