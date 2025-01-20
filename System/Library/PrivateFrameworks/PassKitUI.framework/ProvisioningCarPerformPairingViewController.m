@interface ProvisioningCarPerformPairingViewController
- (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonPressed;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ProvisioningCarPerformPairingViewController

- (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_provisioningView;
  id v6 = objc_allocWithZone((Class)PKProvisioningProgressView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator) = 0;

  result = (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
  v4 = self;
  id v5 = objc_msgSend(v3, sel_initWithBarButtonSystemItem_target_action_, 1, v4, sel_cancelButtonPressed);
  id v6 = [(ProvisioningCarPerformPairingViewController *)v4 navigationItem];
  objc_msgSend(v6, sel_setLeftBarButtonItem_animated_, v5, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  [(ProvisioningCarPerformPairingViewController *)&v9 viewDidAppear:v3];
  id v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator];
  if (v5)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F84C88]);
    id v7 = v5;
    v8 = (char *)objc_msgSend(v6, sel_init, v9.receiver, v9.super_class);
    sub_19F704D44(v8);

    v4 = v8;
  }
}

- (void)loadView
{
  v2 = self;
  sub_19FB75C44();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(ProvisioningCarPerformPairingViewController *)&v15 viewWillLayoutSubviews];
  BOOL v3 = (char *)objc_msgSend(v2, sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = *(void **)&v2[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_provisioningView];
    id v6 = objc_msgSend(v3, sel_safeAreaLayoutGuide);
    objc_msgSend(v6, sel_layoutFrame);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    objc_msgSend(v5, sel_setFrame_, v8, v10, v12, v14);
    v2 = v4;
  }
}

- (void)cancelButtonPressed
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator);
  if (v2)
  {
    BOOL v3 = self;
    id v4 = v2;
    sub_19F705C34();
  }
}

- (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_credential));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_provisioningView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator);
}

@end