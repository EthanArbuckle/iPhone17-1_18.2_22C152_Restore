@interface CHDivingDetailChartDetailViewController
- (CHDivingDetailChartDetailViewController)initWithCoder:(id)a3;
- (CHDivingDetailChartDetailViewController)initWithDataCalculator:(id)a3;
- (CHDivingDetailChartDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)close;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CHDivingDetailChartDetailViewController

- (CHDivingDetailChartDetailViewController)initWithDataCalculator:(id)a3
{
  uint64_t v5 = OBJC_IVAR___CHDivingDetailChartDetailViewController_contentView;
  id v6 = objc_allocWithZone((Class)UIView);
  v7 = (objc_class *)a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CHDivingDetailChartDetailViewController_hostingController) = 0;
  *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CHDivingDetailChartDetailViewController_dataCalculator) = v7;
  v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for DivingDetailChartDetailViewController();
  v10 = [(CHDivingDetailChartDetailViewController *)&v12 initWithNibName:0 bundle:0];

  return v10;
}

- (CHDivingDetailChartDetailViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___CHDivingDetailChartDetailViewController_contentView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHDivingDetailChartDetailViewController_hostingController) = 0;

  result = (CHDivingDetailChartDetailViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003DF898();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003DFBF4(a3);
}

- (void)close
{
}

- (CHDivingDetailChartDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHDivingDetailChartDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailChartDetailViewController_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailChartDetailViewController_contentView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CHDivingDetailChartDetailViewController_hostingController);
}

@end