@interface ICSHomeViewController
- (ICSHomeViewController)init;
- (ICSHomeViewController)initWithCoder:(id)a3;
- (ICSHomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accountsForAccountManager:(id)a3;
- (void)dealloc;
- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)handleURL:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation ICSHomeViewController

- (ICSHomeViewController)init
{
  return (ICSHomeViewController *)sub_262A43158();
}

- (void)dealloc
{
  uint64_t v2 = qword_26B422A10;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_262B02DF8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B422A88);
  v5 = sub_262B02DD8();
  os_log_type_t v6 = sub_262B04798();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_262993000, v5, v6, "iCloudHome deinitialized.", v7, 2u);
    MEMORY[0x263E5C600](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for iCloudHomeViewController();
  [(ICSHomeViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICSHomeViewController____lazy_storage___serviceOwnersManager));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICSHomeViewController____lazy_storage___accountManager);
}

- (ICSHomeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICSHomeViewController_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICSHomeViewController_delayedDeeplinkInfo) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICSHomeViewController____lazy_storage___serviceOwnersManager) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICSHomeViewController____lazy_storage___accountManager) = 0;
  id v4 = a3;

  result = (ICSHomeViewController *)sub_262B04AD8();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_262A435D8(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_262A43B44(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  os_log_type_t v6 = self;
  sub_262A43D8C((uint64_t)a3);
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_262A43ECC();
}

- (void)handleURL:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_262B04408();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_262A44FB8(v4);

  swift_bridgeObjectRelease();
}

- (ICSHomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICSHomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_262A4643C(a4);
}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_262B04408();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  objc_super v8 = self;
  sub_262A46638(v6);

  swift_bridgeObjectRelease();
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s14iCloudSettings01iA18HomeViewControllerC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0();

  type metadata accessor for AIDAServiceType(0);
  sub_2629F34B8(0, &qword_26A984D78);
  sub_262A461E0(&qword_26A9862B0, type metadata accessor for AIDAServiceType);
  uint64_t v6 = (void *)sub_262B043F8();
  swift_bridgeObjectRelease();

  return v6;
}

@end