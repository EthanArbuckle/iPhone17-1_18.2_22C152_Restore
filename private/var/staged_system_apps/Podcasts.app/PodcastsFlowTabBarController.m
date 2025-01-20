@interface PodcastsFlowTabBarController
- (unint64_t)supportedInterfaceOrientations;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PodcastsFlowTabBarController

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(PodcastsFlowTabBarController *)&v2 viewDidLayoutSubviews];
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10002168C(a3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(PodcastsFlowTabBarController *)&v3 viewDidLoad];
  swift_retain();
  PodcastsTabBarPresenter.viewDidLoad()();

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  sub_100054B1C((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC8Podcasts28PodcastsFlowTabBarController_flowController], &qword_100604710);
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end