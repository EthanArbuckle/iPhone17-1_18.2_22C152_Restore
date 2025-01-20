@interface PMSafariStreamlinedStrongPasswordViewController
- (NSString)domain;
- (PMSafariStreamlinedStrongPasswordViewController)initWithCoder:(id)a3;
- (PMSafariStreamlinedStrongPasswordViewController)initWithDomain:(id)a3;
- (PMSafariStreamlinedStrongPasswordViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PMSafariStreamlinedStrongPasswordViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)viewDidLoad;
@end

@implementation PMSafariStreamlinedStrongPasswordViewController

- (PMSafariStreamlinedStrongPasswordViewControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x25A2D1DD0]((char *)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_delegate, a2);

  return (PMSafariStreamlinedStrongPasswordViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setDomain:(id)a3
{
  uint64_t v4 = sub_258D6F498();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_domain);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  PMSafariStreamlinedStrongPasswordViewController.viewDidLoad()();
}

- (PMSafariStreamlinedStrongPasswordViewController)initWithDomain:(id)a3
{
  uint64_t v4 = sub_258D6F498();
  uint64_t v6 = v5;
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_domain);
  uint64_t *v7 = v4;
  v7[1] = v6;
  v9.receiver = self;
  v9.super_class = (Class)PMSafariStreamlinedStrongPasswordViewController;
  return [(PMSafariStreamlinedStrongPasswordViewController *)&v9 initWithNibName:0 bundle:0];
}

- (PMSafariStreamlinedStrongPasswordViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (PMSafariStreamlinedStrongPasswordViewController *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (PMSafariStreamlinedStrongPasswordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PMSafariStreamlinedStrongPasswordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25892DE34((uint64_t)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_delegate);

  swift_bridgeObjectRelease();
}

@end