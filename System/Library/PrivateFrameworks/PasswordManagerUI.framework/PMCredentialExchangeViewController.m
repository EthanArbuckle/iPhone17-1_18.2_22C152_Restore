@interface PMCredentialExchangeViewController
- (PMCredentialExchangeViewController)initWithCoder:(id)a3;
- (PMCredentialExchangeViewController)initWithExportedCredentialData:(id)a3 exporterBundleID:(id)a4;
- (PMCredentialExchangeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PMCredentialExchangeViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PMCredentialExchangeViewController.viewWillAppear(_:)(a3);
}

- (PMCredentialExchangeViewController)initWithExportedCredentialData:(id)a3 exporterBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_258D6B5B8();
  unint64_t v10 = v9;

  sub_258D6F498();
  v11 = (void *)sub_258D6B598();
  v12 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();
  v15.receiver = self;
  v15.super_class = (Class)PMCredentialExchangeViewController;
  v13 = [(ASExportViewController *)&v15 initWithExportedCredentialData:v11 exporterBundleID:v12];
  sub_258921624(v8, v10);

  return v13;
}

- (PMCredentialExchangeViewController)initWithCoder:(id)a3
{
  result = (PMCredentialExchangeViewController *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (PMCredentialExchangeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PMCredentialExchangeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end