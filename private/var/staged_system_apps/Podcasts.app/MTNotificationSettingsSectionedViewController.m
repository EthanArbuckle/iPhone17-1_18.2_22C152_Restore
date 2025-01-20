@interface MTNotificationSettingsSectionedViewController
- (_TtC8Podcasts45MTNotificationSettingsSectionedViewController)init;
- (_TtC8Podcasts45MTNotificationSettingsSectionedViewController)initWithCoder:(id)a3;
- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTNotificationSettingsSectionedViewController

- (_TtC8Podcasts45MTNotificationSettingsSectionedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001F199C();
}

- (_TtC8Podcasts45MTNotificationSettingsSectionedViewController)init
{
  return (_TtC8Podcasts45MTNotificationSettingsSectionedViewController *)sub_1001EE76C();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTNotificationSettingsSectionedViewController();
  id v2 = v3.receiver;
  [(MTGenericSettingsViewController *)&v3 viewDidLoad];
  sub_1001EE860();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MTNotificationSettingsSectionedViewController();
  v4 = (char *)v7.receiver;
  [(MTGenericSettingsViewController *)&v7 viewWillAppear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid
                    + 8];
  if (v5)
  {
    uint64_t v6 = *(void *)&v4[OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid];
    swift_bridgeObjectRetain();
    sub_1001EF54C(v6, v5, 0);

    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1001F0CA4(a3);
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  uint64_t v11 = sub_100054B78((uint64_t *)&unk_1005FCBD0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  if (a6)
  {
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v18 = a3;
  id v19 = a5;
  v20 = self;
  sub_1001F1110(a3, (uint64_t)v13, a5, v16, (uint64_t)a6);

  swift_bridgeObjectRelease();
  sub_100054B1C((uint64_t)v13, (uint64_t *)&unk_1005FCBD0);
}

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  double v11 = sub_1001F1540((uint64_t)a3, v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10018DB70((uint64_t)self + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end