@interface SessionObserver
- (NSString)sceneSessionIdentifier;
- (_TtC13NewsAnalytics15SessionObserver)init;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)configurationManagerScienceExperimentFieldsDidChange:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)familySharingStatusDidChange:(id)a3;
- (void)networkReachabilityConnectivityDidChange:(id)a3;
- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)offerDidChange:(id)a3;
- (void)pushContentEnvironmentData;
- (void)pushOrientationData;
- (void)pushUserSubscriptionContextData;
- (void)sessionDidStartWithSessionID:(id)a3 sourceApplication:(id)a4 url:(id)a5;
- (void)sessionWillEndWithEndReason:(id)a3;
- (void)setSceneSessionIdentifier:(id)a3;
- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
- (void)userInfoDidChangeAdsUserID:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangePuzzleNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation SessionObserver

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s13NewsAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v4);
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s13NewsAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v6);
}

- (void)configurationManagerScienceExperimentFieldsDidChange:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = objc_msgSend(a3, sel_configuration);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v5;
    *(void *)(v8 + 24) = v7;
    v9 = v5;
    swift_unknownObjectRetain();
    sub_1DE47ED10();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)pushContentEnvironmentData
{
  v2 = self;
  sub_1DE154E20();
}

- (void)familySharingStatusDidChange:(id)a3
{
  uint64_t v4 = sub_1DE47E440();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DE47E420();
  uint64_t v8 = self;
  sub_1DE1645E4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pushOrientationData
{
  v2 = self;
  sub_1DE1BC054();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_1DE47FE90();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1DE480290();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1DE2044C4();
  v15 = (void *)sub_1DE47FDD0();

LABEL_8:
  SessionObserver.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DE0BD6BC((uint64_t)v18);
}

- (void)contentSizeCategoryDidChange
{
  *(void *)(swift_allocObject() + 16) = self;
  v3 = self;
  sub_1DE47F7B0();

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  SessionObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_aggregateStateModeProvider);

  swift_unknownObjectRelease();
  sub_1DE04CBB4((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_appExtensionCommunicator);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_tabiDataProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_liveActivityCountDataProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_userEmbeddingDataProvider);
  swift_release();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (NSString)sceneSessionIdentifier
{
  v2 = (char *)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_sceneSessionIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1DE47FE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setSceneSessionIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1DE47FE90();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_sceneSessionIdentifier);
  swift_beginAccess();
  *id v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC13NewsAnalytics15SessionObserver)init
{
  result = (_TtC13NewsAnalytics15SessionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sessionDidStartWithSessionID:(id)a3 sourceApplication:(id)a4 url:(id)a5
{
  sub_1DE27A524(0, (unint64_t *)&qword_1EBEC1C70, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = sub_1DE47FE90();
  uint64_t v13 = v12;
  if (!a4)
  {
    uint64_t v14 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v17 = sub_1DE47E5E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 1, 1, v17);
    goto LABEL_6;
  }
  uint64_t v14 = sub_1DE47FE90();
  a4 = v15;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1DE47E5C0();
  uint64_t v16 = sub_1DE47E5E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 0, 1, v16);
LABEL_6:
  v18 = self;
  SessionObserver.sessionDidStart(withSessionID:sourceApplication:url:)(v11, v13, v14, (uint64_t)a4, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DE27A6BC((uint64_t)v10, (unint64_t *)&qword_1EBEC1C70, MEMORY[0x1E4F276F0]);
}

- (void)sessionWillEndWithEndReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SessionObserver.sessionWillEnd(withEndReason:)((NSNumber)v4);
}

- (void)networkReachabilityConnectivityDidChange:(id)a3
{
  *(void *)(swift_allocObject() + 16) = a3;
  swift_unknownObjectRetain_n();
  id v4 = self;
  sub_1DE47F2E0();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)pushUserSubscriptionContextData
{
  v2 = self;
  sub_1DE32515C();
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
}

- (void)userInfoDidChangeAdsUserID:(id)a3 fromCloud:(BOOL)a4
{
}

- (void)userInfoDidChangePuzzleNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  SessionObserver.pushNotificationSettingsData()();
}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  v3 = self;
  SessionObserver.pushNotificationSettingsData()();
}

- (void)offerDidChange:(id)a3
{
  uint64_t v4 = sub_1DE47E440();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DE47E420();
  uint64_t v8 = self;
  sub_1DE3E6F64();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    sub_1DE480080();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_1DE480080();
LABEL_4:
  if (a6) {
    sub_1DE480080();
  }
  if (a7) {
    sub_1DE480080();
  }
  id v13 = a3;
  uint64_t v14 = self;
  if (v13)
  {
    v15 = v14;
    id v16 = objc_msgSend(*(id *)((char *)&v14->super.isa + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_cloudContext), sel_shortcutList);
    sub_1DE3F2FC4(v13, v16);

    sub_1DE3F3368(v13);
    sub_1DE3F364C(v13);
    SessionObserver.pushNotificationSettingsData()();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6
{
  id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_cloudContext);
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = objc_msgSend(v7, sel_subscriptionController);
  if (v10)
  {
    id v11 = v10;
    sub_1DE3F2FC4(v10, v8);
  }
  else
  {
    __break(1u);
  }
}

@end