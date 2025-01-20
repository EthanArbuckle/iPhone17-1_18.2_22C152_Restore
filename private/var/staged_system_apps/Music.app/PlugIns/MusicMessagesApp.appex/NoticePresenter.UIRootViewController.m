@interface NoticePresenter.UIRootViewController
- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController)initWithCoder:(id)a3;
- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NoticePresenter.UIRootViewController

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController)initWithCoder:(id)a3
{
  result = (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *)sub_100485590();
  __break(1u);
  return result;
}

- (void)loadView
{
  type metadata accessor for PassthroughView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = [v3 init];
  v6 = self;
  id v8 = v5;
  id v7 = [v6 clearColor];
  [v8 setBackgroundColor:v7];

  [(NoticePresenter.UIRootViewController *)v4 setView:v8];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10036F764();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10036F978();
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController_hostingController));
  swift_release();
  id v3 = (char *)self
     + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController_configuration;

  sub_100013294((uint64_t)v3);
}

@end