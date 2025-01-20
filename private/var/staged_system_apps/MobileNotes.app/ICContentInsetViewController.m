@interface ICContentInsetViewController
- (ICContentInsetViewController)initWithCoder:(id)a3;
- (ICContentInsetViewController)initWithContentViewController:(id)a3;
- (ICContentInsetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICContentInsetViewControllerConfiguration)configuration;
- (UIViewController)contentViewController;
- (void)setConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICContentInsetViewController

- (UIViewController)contentViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR___ICContentInsetViewController_contentViewController));
}

- (ICContentInsetViewControllerConfiguration)configuration
{
  return (ICContentInsetViewControllerConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR___ICContentInsetViewController_configuration));
}

- (void)setConfiguration:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICContentInsetViewController_configuration);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICContentInsetViewController_configuration) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_100477DE8();
}

- (ICContentInsetViewController)initWithContentViewController:(id)a3
{
  id v3 = a3;
  v4 = (ICContentInsetViewController *)sub_100478584(v3);

  return v4;
}

- (ICContentInsetViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___ICContentInsetViewController_configuration;
  long long v13 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  CGFloat bottom = NSDirectionalEdgeInsetsZero.bottom;
  CGFloat trailing = NSDirectionalEdgeInsetsZero.trailing;
  v8 = (objc_class *)type metadata accessor for ContentInsetViewController.Configuration();
  v9 = objc_allocWithZone(v8);
  v10 = (CGFloat *)&v9[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets];
  *(_OWORD *)v10 = v13;
  v10[2] = bottom;
  v10[3] = trailing;
  v9[OBJC_IVAR___ICContentInsetViewControllerConfiguration_usesSafeAreaLayoutGuide] = 0;
  *(void *)&v9[OBJC_IVAR___ICContentInsetViewControllerConfiguration_cornerRadius] = 0;
  v14.receiver = v9;
  v14.super_class = v8;
  id v11 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[(ICContentInsetViewController *)&v14 init];

  result = (ICContentInsetViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContentInsetViewController();
  id v2 = v3.receiver;
  [(ICContentInsetViewController *)&v3 viewDidLoad];
  sub_1004780BC();
}

- (ICContentInsetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICContentInsetViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICContentInsetViewController_contentViewController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICContentInsetViewController_configuration);
}

@end