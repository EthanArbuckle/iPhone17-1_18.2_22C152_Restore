@interface GlobalActionController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (UIResponder)nextResponder;
- (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController)init;
- (void)addPodcastAction;
- (void)alternatePlayPause;
- (void)dealloc;
- (void)decreaseVolume;
- (void)didChangeStoreAccount:(id)a3;
- (void)focusSearchField;
- (void)goToCurrentShow;
- (void)increaseVolume;
- (void)jumpBackwards;
- (void)jumpForwards;
- (void)mainWindowDidChangeKey:(id)a3;
- (void)manageAccount;
- (void)manageFavoriteCategories;
- (void)menuBarNewStation;
- (void)nextTrack;
- (void)playPause;
- (void)previousTrack;
- (void)refreshCommand;
- (void)reportAConcern;
- (void)resetIdentifier;
- (void)setDoubleSpeed;
- (void)setNormalSpeed;
- (void)setOneAndAHalfSpeed;
- (void)setOneAndAQuarterSpeed;
- (void)setOneAndThreeQuartersSpeed;
- (void)setThreeQuartersSpeed;
- (void)showMainWindow;
- (void)showNotificationSettings;
- (void)showPrivacyInfo;
- (void)validateCommand:(id)a3;
@end

@implementation GlobalActionController

- (UIResponder)nextResponder
{
  return (UIResponder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_debugActionsController));
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(GlobalActionController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  sub_10004D2D8((uint64_t)self+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_episodeController);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_debugActionsController);
}

- (void)addPodcastAction
{
}

- (void)focusSearchField
{
  v2 = self;
  sub_100285180();
}

- (void)refreshCommand
{
  swift_getObjectType();
  v3 = self;
  dispatch thunk of LibraryDataProviderProtocol.libraryActionController.getter();
  sub_100041A98(v4, v4[3]);
  dispatch thunk of LibraryActionControllerProtocol.updateAllFeeds()();
  swift_release();
  sub_10004D2D8((uint64_t)v4);
  [*(id *)((char *)&v3->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_syncController) syncEverything];
}

- (void)goToCurrentShow
{
  v2 = self;
  sub_100285BB0();
}

- (void)showNotificationSettings
{
  v2 = self;
  sub_10028682C();
}

- (void)playPause
{
  v4 = self;
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0 && !sub_10028BC34())
  {
    uint64_t v2 = *(void *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    uint64_t v3 = *(void *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_100041A98((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(void, void, uint64_t, uint64_t))(v3 + 80))(0, 0, v2, v3);
  }
}

- (void)alternatePlayPause
{
  v4 = self;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    uint64_t v2 = *(void *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    uint64_t v3 = *(void *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_100041A98((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(void, void, uint64_t, uint64_t))(v3 + 80))(0, 0, v2, v3);
  }
}

- (void)nextTrack
{
  uint64_t v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100041A98(v3, v4);
  id v6 = *(void (**)(void, void, uint64_t, uint64_t))(v5 + 112);
  objc_super v7 = self;
  v6(0, 0, v4, v5);
}

- (void)previousTrack
{
  uint64_t v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100041A98(v3, v4);
  id v6 = *(void (**)(void, void, uint64_t, uint64_t))(v5 + 128);
  objc_super v7 = self;
  v6(0, 0, v4, v5);
}

- (void)jumpForwards
{
  uint64_t v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100041A98(v3, v4);
  id v6 = *(void (**)(void, void, uint64_t, uint64_t))(v5 + 144);
  objc_super v7 = self;
  v6(0, 0, v4, v5);
}

- (void)jumpBackwards
{
  uint64_t v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100041A98(v3, v4);
  id v6 = *(void (**)(void, void, uint64_t, uint64_t))(v5 + 160);
  objc_super v7 = self;
  v6(0, 0, v4, v5);
}

- (void)setThreeQuartersSpeed
{
}

- (void)setNormalSpeed
{
}

- (void)setOneAndAQuarterSpeed
{
}

- (void)setOneAndAHalfSpeed
{
}

- (void)setOneAndThreeQuartersSpeed
{
}

- (void)setDoubleSpeed
{
}

- (void)increaseVolume
{
  uint64_t v4 = self;
  if (static Podcasts.isBlueMoonEnabled()())
  {
    dispatch thunk of PlaybackController.increaseVolume()();
  }
  else
  {
    uint64_t v2 = *(void *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    uint64_t v3 = *(void *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_100041A98((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 216))(v2, v3);
  }
}

- (void)decreaseVolume
{
  uint64_t v4 = self;
  if (static Podcasts.isBlueMoonEnabled()())
  {
    dispatch thunk of PlaybackController.decreaseVolume()();
  }
  else
  {
    uint64_t v2 = *(void *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    uint64_t v3 = *(void *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_100041A98((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 224))(v2, v3);
  }
}

- (void)didChangeStoreAccount:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = self;
  Class isa = Notification._bridgeToObjectiveC()().super.isa;
  LODWORD(v8) = [v8 iTunesAccountDidChangeForACAccountNotification:isa];

  if (v8)
  {
    v11 = (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *)[self mainSystem];
    [(GlobalActionController *)v11 setNeedsRebuild];

    v9 = v11;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)mainWindowDidChangeKey:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = self;
  id v10 = [v8 mainSystem];
  [v10 setNeedsRebuild];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)manageFavoriteCategories
{
  uint64_t v3 = type metadata accessor for ActionMetrics();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FlowAction();
  objc_super v7 = self;
  static ActionMetrics.notInstrumented.getter();
  uint64_t v8 = static FlowAction.manageCategoriesPage(actionMetrics:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  memset(v10, 0, sizeof(v10));
  swift_retain();
  v9 = (void *)UIResponder.firstViewInResponderChain.getter();
  sub_100289060(v8, (uint64_t)v10, v9, (uint64_t)v7, (uint64_t (*)(void))&type metadata accessor for FlowAction, (unint64_t *)&unk_1005FEA80, (void (*)(uint64_t))&type metadata accessor for FlowAction);
  swift_release();
  swift_release();

  sub_100054B1C((uint64_t)v10, &qword_1005F5D30);
  swift_release();
}

- (void)reportAConcern
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = [v3 sharedInstance];
  v7[4] = sub_1002875F8;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10026924C;
  v7[3] = &unk_10055CAE0;
  uint64_t v6 = _Block_copy(v7);
  [v5 reportAConcernURLWithCompletion:v6];
  _Block_release(v6);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    objc_super v7 = self;
  }
  unsigned __int8 v8 = sub_100287768((uint64_t)a3, (uint64_t)v10);

  sub_100054B1C((uint64_t)v10, &qword_1005F5D30);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002879D4(v4);
}

- (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController)init
{
  result = (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)menuBarNewStation
{
  id v3 = objc_allocWithZone((Class)MTAddPodcastOrStationController);
  id v4 = self;
  id v5 = [v3 init];
  [v5 presentAddStationUI];
}

- (void)manageAccount
{
  sub_10004D29C(0, (unint64_t *)&unk_1005FE480);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v1 = [ObjCClassFromMetadata sharedInstance];
  unsigned int v2 = [v1 isUserLoggedIn];

  if (v2)
  {
    id v3 = self;
    [v3 openAccountsPanel];
  }
  else
  {
    id v4 = [ObjCClassFromMetadata sharedInstance];
    id v5 = String._bridgeToObjectiveC()();
    [v4 promptAccountAuthenticationWithDebugReason:v5 forced:1];
  }
}

- (void)showPrivacyInfo
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = [self presenterForPrivacySplashWithIdentifier:v0];

  id v1 = v7;
  if (v7)
  {
    unsigned int v2 = self;
    id v3 = v7;
    id v4 = [v2 sharedApplication];
    id v5 = [v4 delegate];

    if (v5)
    {
      if ([v5 respondsToSelector:"window"])
      {
        id v6 = [v5 window];
        swift_unknownObjectRelease();
        id v5 = [v6 rootViewController];
      }
      else
      {
        swift_unknownObjectRelease();
        id v5 = 0;
      }
    }
    [v3 setPresentingViewController:v5];

    id v1 = v7;
  }
  [v1 present];
}

- (void)showMainWindow
{
  NSString v0 = self;
  id v1 = [v0 sharedApplication];
  id v2 = [v1 connectedScenes];

  sub_10004D29C(0, &qword_1005FE2F0);
  sub_10028C560();
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1002840A4(v3);
  id v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    id v6 = [v5 session];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v0 sharedApplication];
  [v7 requestSceneSessionActivation:v6 userActivity:0 options:0 errorHandler:0];
}

- (void)resetIdentifier
{
  NSString v0 = self;
  id v1 = [v0 mainBundle];
  v26._countAndFlagsBits = 0xD000000000000011;
  v2._countAndFlagsBits = 0xD00000000000001CLL;
  v26._object = (void *)0x80000001004D9C30;
  v2._object = (void *)0x80000001004D9C10;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)v1, v3, v26);

  id v4 = [v0 mainBundle];
  v5._countAndFlagsBits = 0xD00000000000001ELL;
  v27._countAndFlagsBits = 0xD00000000000002ALL;
  v27._object = (void *)0x80000001004D9C70;
  v5._object = (void *)0x80000001004D9C50;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v27);

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v9 = [self alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  id v10 = [v0 mainBundle];
  v11._countAndFlagsBits = 0xD000000000000024;
  v28._object = (void *)0x80000001004D9CD0;
  v11._object = (void *)0x80000001004D9CA0;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v28._countAndFlagsBits = 0xD000000000000010;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v28);

  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1002875A0;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001F2B1C;
  aBlock[3] = &unk_10055CB08;
  v14 = _Block_copy(aBlock);
  swift_release();
  v15 = self;
  id v16 = [v15 actionWithTitle:v13 style:2 handler:v14];
  _Block_release(v14);

  [v9 addAction:v16];
  id v17 = [v0 mainBundle];
  v29._object = (void *)0xE000000000000000;
  v18._countAndFlagsBits = 0x6C65636E6143;
  v18._object = (void *)0xE600000000000000;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v29);

  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [v15 actionWithTitle:v20 style:1 handler:0];

  [v9 addAction:v21];
  id v22 = [self sharedApplication];
  v23 = sub_10030A120();
  id v24 = [v23 rootViewController];

  if (v24)
  {
    [v24 presentViewController:v9 animated:0 completion:0];
  }
}

@end