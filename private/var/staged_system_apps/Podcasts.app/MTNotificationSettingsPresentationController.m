@interface MTNotificationSettingsPresentationController
+ (_TtC8Podcasts44MTNotificationSettingsPresentationController)shared;
+ (void)setShared:(id)a3;
- (_TtC8Podcasts44MTNotificationSettingsPresentationController)init;
- (void)presentModalWithHighlightedPodcastUuid:(id)a3;
@end

@implementation MTNotificationSettingsPresentationController

+ (_TtC8Podcasts44MTNotificationSettingsPresentationController)shared
{
  if (qword_1005F5AA8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10061ABA0;

  return (_TtC8Podcasts44MTNotificationSettingsPresentationController *)v2;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1005F5AA8;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_10061ABA0;
  qword_10061ABA0 = (uint64_t)v4;
}

- (_TtC8Podcasts44MTNotificationSettingsPresentationController)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MTNotificationSettingsPresentationController();
  return [(MTNotificationSettingsPresentationController *)&v4 init];
}

- (void)presentModalWithHighlightedPodcastUuid:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  MTNotificationSettingsPresentationController.presentModal(highlightedPodcastUuid:)(v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end