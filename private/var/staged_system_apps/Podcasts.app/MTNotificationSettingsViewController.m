@interface MTNotificationSettingsViewController
- (_TtC8Podcasts36MTNotificationSettingsViewController)initWithCoder:(id)a3;
- (_TtC8Podcasts36MTNotificationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissButtonTappedFrom:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTNotificationSettingsViewController

- (_TtC8Podcasts36MTNotificationSettingsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_contentViewController) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8Podcasts36MTNotificationSettingsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Podcasts36MTNotificationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8Podcasts36MTNotificationSettingsViewController *)sub_1004102B0(v5, v7, a4);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  v2 = (char *)v5.receiver;
  [(MTNotificationSettingsViewController *)&v5 viewDidLoad];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_sectionedContentViewController];
  id v4 = v3;
  sub_1004109C8(v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  id v4 = v5.receiver;
  [(MTNotificationSettingsViewController *)&v5 viewWillAppear:v3];
  sub_1001EE860();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  id v4 = v5.receiver;
  [(MTNotificationSettingsViewController *)&v5 viewDidAppear:v3];
  if (qword_1005F5AA8 != -1) {
    swift_once();
  }
  swift_unknownObjectWeakAssign();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  id v4 = v5.receiver;
  [(MTNotificationSettingsViewController *)&v5 viewDidDisappear:v3];
  if (qword_1005F5AA8 != -1) {
    swift_once();
  }
  swift_unknownObjectWeakAssign();
}

- (void)dismissButtonTappedFrom:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    objc_super v5 = self;
  }
  -[MTNotificationSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v6, v7);

  sub_100172424((uint64_t)&v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_sectionedContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_contentViewController));

  swift_bridgeObjectRelease();
}

@end