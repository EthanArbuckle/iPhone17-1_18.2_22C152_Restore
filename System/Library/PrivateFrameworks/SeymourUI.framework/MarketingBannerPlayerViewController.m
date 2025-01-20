@interface MarketingBannerPlayerViewController
- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithPlayerLayerView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)playerFinished:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MarketingBannerPlayerViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A2C9AE4();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A2C9C8C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A2CA460(a3);
}

- (void)playerFinished:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  v8 = self;
  v9 = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)[(MarketingBannerPlayerViewController *)v8 presentingViewController];
  if (v9)
  {
    v10 = v9;
    [(MarketingBannerPlayerViewController *)v9 dismissViewControllerAnimated:1 completion:0];

    v8 = v10;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI35MarketingBannerPlayerViewController_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end