@interface AppController
- (BOOL)isMyPodcastsTabSelected;
- (BOOL)isUnplayedTabSelected;
- (UITabBarController)tabBarController;
- (UIViewController)rootViewController;
- (_TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController)init;
- (uint64_t)handleiTMSUrlScheme:(void *)a1;
- (uint64_t)selectSearchTabAndFocusSearchField;
- (void)dismissMigration;
- (void)dismissNowPlayingAnimated:(BOOL)a3;
- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)presentLibraryPicker:(id)a3;
- (void)presentMigration;
- (void)presentNowPlayingAnimated:(BOOL)a3;
- (void)presentPodcast:(id)a3 episode:(id)a4 podcastTab:(unint64_t)a5 startPlayback:(BOOL)a6 animated:(BOOL)a7;
- (void)presentPodcast:(id)a3 episodeUuid:(id)a4 episodeNotAvailable:(BOOL)a5 podcastTab:(unint64_t)a6 startPlayback:(BOOL)a7 animated:(BOOL)a8;
- (void)presentStation:(id)a3 new:(BOOL)a4;
- (void)selectFeaturedTab;
- (void)selectFeaturedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectMyPodcastsTab;
- (void)selectMyPodcastsTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectUnplayedTab;
- (void)selectUnplayedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)showDownloadsControllerAnimated:(BOOL)a3;
- (void)showSearchControllerWithSearchText:(id)a3;
- (void)switchToLibrary;
@end

@implementation AppController

- (UIViewController)rootViewController
{
  v2 = self;
  id v3 = sub_1003547B8();

  return (UIViewController *)v3;
}

- (UITabBarController)tabBarController
{
  v2 = self;
  id v3 = (void *)sub_1003548F4();

  return (UITabBarController *)v3;
}

- (uint64_t)handleiTMSUrlScheme:(void *)a1
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  id v7 = a1;
  id v8 = [v6 sharedApplication];
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  sub_10016E9B0((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_10004AE0C(&qword_1005F66F0, type metadata accessor for OpenExternalURLOptionsKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v8 openURL:v11 options:isa completionHandler:0];

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

- (void)showSearchControllerWithSearchText:(id)a3
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
  id v7 = self;
  sub_1003581C4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)showDownloadsControllerAnimated:(BOOL)a3
{
  uint64_t v3 = self;
  sub_1003584D4();
}

- (void)presentStation:(id)a3 new:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100354C90(v6, a4);
}

- (void)presentPodcast:(id)a3 episode:(id)a4 podcastTab:(unint64_t)a5 startPlayback:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v7 = a6;
  id v10 = a3;
  v11 = self;
  if (a4 && (id v12 = [a4 uuid]) != 0)
  {
    v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  sub_100358864(v10, v14, v16, 0, v7);

  swift_bridgeObjectRelease();
}

- (void)presentPodcast:(id)a3 episodeUuid:(id)a4 episodeNotAvailable:(BOOL)a5 podcastTab:(unint64_t)a6 startPlayback:(BOOL)a7 animated:(BOOL)a8
{
  BOOL v8 = a7;
  BOOL v9 = a5;
  if (a4)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  id v15 = a3;
  uint64_t v16 = self;
  sub_100358864(v15, v12, v14, v9, v8);

  swift_bridgeObjectRelease();
}

- (BOOL)isUnplayedTabSelected
{
  uint64_t v2 = self;
  NavigationTab.intValue.getter();
  sub_100358FBC();
  char v4 = v3;

  return v4 & 1;
}

- (void)selectUnplayedTab
{
  uint64_t v2 = self;
  sub_10035569C();
}

- (void)selectUnplayedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a3;
  BOOL v7 = (void (*)(uint64_t))_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    BOOL v7 = (void (*)(uint64_t))sub_100359D80;
  }
  BOOL v8 = self;
  sub_100359304(v5, v7);
  sub_1000536BC((uint64_t)v7);
}

- (BOOL)isMyPodcastsTabSelected
{
  sub_100056D54((uint64_t)self + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_appTraits, (uint64_t)v10);
  uint64_t v3 = v11;
  uint64_t v4 = v12;
  sub_100041A98(v10, v11);
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  id v6 = self;
  uint64_t v7 = v5(v3, v4);
  NavigationTab.intValue.getter();
  sub_10003649C(v7);
  sub_10004D2D8((uint64_t)v10);
  sub_100358FBC();
  LOBYTE(v7) = v8;

  return v7 & 1;
}

- (void)switchToLibrary
{
  uint64_t v2 = self;
  sub_100355860();
}

- (void)selectMyPodcastsTab
{
  uint64_t v2 = self;
  sub_100355860();
}

- (void)selectMyPodcastsTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a3;
  uint64_t v7 = (void (*)(uint64_t))_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    uint64_t v7 = (void (*)(uint64_t))sub_100359D80;
  }
  char v8 = self;
  sub_100359134(v5, v7);
  sub_1000536BC((uint64_t)v7);
}

- (void)selectFeaturedTab
{
  uint64_t v2 = self;
  sub_100355B54();
}

- (void)selectFeaturedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a3;
  uint64_t v7 = (void (*)(uint64_t))_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    uint64_t v7 = (void (*)(uint64_t))sub_100359D80;
  }
  char v8 = self;
  sub_100359304(v5, v7);
  sub_1000536BC((uint64_t)v7);
}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self;
  id v6 = self;
  id v7 = [v5 defaultInstance];
  [v7 presentNowPlayingAnimated:v3];
}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self;
  id v6 = self;
  id v7 = [v5 defaultInstance];
  [v7 dismissNowPlayingAnimated:v3 completion:0];
}

- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_1000343D8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v8 = self;
  sub_10035976C(a3, v6, v7);
  sub_1000536BC((uint64_t)v6);
}

- (void)presentMigration
{
  uint64_t v2 = self;
  sub_100355F90();
}

- (void)dismissMigration
{
  uint64_t v2 = self;
  sub_100356B5C();
}

- (void)presentLibraryPicker:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_100357250((uint64_t)sub_100359D4C, v5);

  swift_release();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  char v8 = self;
  sub_100359860(v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100359BBC();
}

- (_TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController)init
{
  result = (_TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_appDelegate));
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_appTraits);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_onLibrarySelection);

  sub_1000536BC(v3);
}

- (uint64_t)selectSearchTabAndFocusSearchField
{
  sub_100054B78((uint64_t *)&unk_1005F7750);
  __chkstk_darwin();
  v1 = (char *)&v17 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  id v7 = (char *)&v17 - v6;
  id v8 = [self searchUrlForSearchText:0];
  if (v8)
  {
    BOOL v9 = v8;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v10 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v10(v1, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
    {
      v10(v7, v1, v2);
      id v11 = [self sharedApplication];
      URL._bridgeToObjectiveC()(v12);
      uint64_t v14 = v13;
      sub_10016E9B0((uint64_t)_swiftEmptyArrayStorage);
      type metadata accessor for OpenExternalURLOptionsKey(0);
      sub_10004AE0C(&qword_1005F66F0, type metadata accessor for OpenExternalURLOptionsKey);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v11 openURL:v14 options:isa completionHandler:0];

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  }
  return sub_100054B1C((uint64_t)v1, (uint64_t *)&unk_1005F7750);
}

@end