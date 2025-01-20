@interface HikingWelcomeViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (CGSize)preferredContentSize;
- (_TtC4Maps27HikingWelcomeViewController)initWithCoder:(id)a3;
- (_TtC4Maps27HikingWelcomeViewController)initWithCompletionHandler:(id)a3;
- (_TtC4Maps27HikingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)continueTapped;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)updateForTraitChanges;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HikingWelcomeViewController

- (_TtC4Maps27HikingWelcomeViewController)initWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  if (v3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    v3 = sub_100135AFC;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = (_TtC4Maps27HikingWelcomeViewController *)sub_100135510((uint64_t)v3, v4);
  sub_10006C5D8((uint64_t)v3);
  return v5;
}

- (_TtC4Maps27HikingWelcomeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100135694();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100132A58();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HikingWelcomeViewController();
  id v4 = v7.receiver;
  [(HikingWelcomeViewController *)&v7 viewDidAppear:v3];
  id v5 = [self standardUserDefaults];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 setBool:1 forKey:v6];

  sub_100133E74();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1001340A4();
}

- (CGSize)preferredContentSize
{
  v2 = self;

  [v2 preferredContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HikingWelcomeViewController();
  -[HikingWelcomeViewController setPreferredContentSize:](&v5, "setPreferredContentSize:", width, height);
}

- (_TtC4Maps27HikingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC4Maps27HikingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_videoView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_titleText));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_topContentGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_titleToBodyGradientView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_completionHandler);

  sub_10006C5D8(v3);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)updateForTraitChanges
{
  id v4 = self;
  sub_1001339CC();
  v2 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC4Maps27HikingWelcomeViewController_videoView);
  sub_100134C7C();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v2 loadAssetNamed:v3 preservingTimestamp:1];

  if (([v2 isHidden] & 1) == 0) {
    [v2 play];
  }
}

- (void)continueTapped
{
  v2 = self;
  sub_100134ED4();
}

@end