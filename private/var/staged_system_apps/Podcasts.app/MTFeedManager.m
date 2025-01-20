@interface MTFeedManager
+ (MTFeedManager)sharedInstance;
- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3;
- (BOOL)isUpdating;
- (BOOL)isUpdatingShowWithUrl:(id)a3 storeID:(int64_t)a4;
- (MTFeedManager)init;
- (void)handleEventsForBackgroundURLSessionFor:(id)a3 completionHandler:(id)a4;
- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 completion:(id)a11;
- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 isSubscribing:(BOOL)a11 feedDownloadedHook:(id)a12 preProcessFeedHook:(id)a13 postProcessFeedHook:(id)a14 completion:(id)a15;
@end

@implementation MTFeedManager

- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3
{
  return _s8Podcasts11FeedManagerC32abortUpdatesIfNetworkUnreachable13userInitiatedS2b_tF_0(a3) & 1;
}

+ (MTFeedManager)sharedInstance
{
  if (qword_1005F5AB8 != -1) {
    swift_once();
  }
  v2 = (void *)static FeedManager.shared;

  return (MTFeedManager *)v2;
}

- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 completion:(id)a11
{
  BOOL v31 = a7;
  BOOL v32 = a8;
  uint64_t v29 = a5;
  uint64_t v14 = sub_100054B78((uint64_t *)&unk_1005F7750);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (uint64_t (*)())_Block_copy(a11);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, v22, 1, v17);
  uint64_t v30 = v17;
  if (!a6)
  {
    uint64_t v23 = 0;
    int64_t v25 = a10;
    if (v21) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v26 = 0;
    goto LABEL_9;
  }
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a6 = v24;
  int64_t v25 = a10;
  if (!v21) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v21;
  v21 = sub_10030D6A0;
LABEL_9:
  v27 = self;
  FeedManager.updateFeed(forFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:completion:)((uint64_t)v20, (uint64_t)v16, v29, v23, a6, v31, v32, a9, v25, (uint64_t)v21, v26);
  sub_1000536BC((uint64_t)v21);

  swift_bridgeObjectRelease();
  sub_100054B1C((uint64_t)v16, (uint64_t *)&unk_1005F7750);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v30);
}

- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 isSubscribing:(BOOL)a11 feedDownloadedHook:(id)a12 preProcessFeedHook:(id)a13 postProcessFeedHook:(id)a14 completion:(id)a15
{
  BOOL v46 = a7;
  BOOL v47 = a8;
  v44 = self;
  uint64_t v45 = a5;
  uint64_t v17 = sub_100054B78((uint64_t *)&unk_1005F7750);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v50 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = _Block_copy(a12);
  v24 = _Block_copy(a13);
  int64_t v25 = _Block_copy(a14);
  v42 = _Block_copy(a15);
  v49 = v22;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v19, v26, 1, v20);
  if (a6)
  {
    uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v43 = v27;
    if (v23) {
      goto LABEL_6;
    }
LABEL_9:
    v39 = 0;
    uint64_t v28 = 0;
    if (v24) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v41 = 0;
  uint64_t v43 = 0;
  if (!v23) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v23;
  v39 = sub_10030D458;
  if (v24)
  {
LABEL_7:
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v24;
    uint64_t v30 = sub_10030D410;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v30 = 0;
  uint64_t v29 = 0;
LABEL_11:
  uint64_t v48 = v20;
  BOOL v40 = a9;
  v51 = v19;
  if (v25)
  {
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v25;
    BOOL v32 = sub_10030D3B0;
  }
  else
  {
    BOOL v32 = 0;
    uint64_t v31 = 0;
  }
  uint64_t v38 = a10;
  v33 = v42;
  if (v42)
  {
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v33;
    v35 = sub_10030D3A8;
  }
  else
  {
    v35 = 0;
    uint64_t v34 = 0;
  }
  v36 = v44;
  v37 = v39;
  FeedManager.updateFeed(forFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:isSubscribing:feedDownloadedHook:preProcessFeedHook:postProcessFeedHook:completion:)((uint64_t)v49, (uint64_t)v51, v45, v41, v43, v46, v47, v40, v38, a11, (uint64_t)v39, v28, (uint64_t)v30, v29, (uint64_t)v32, v31, (uint64_t)v35, v34);
  sub_1000536BC((uint64_t)v35);
  sub_1000536BC((uint64_t)v32);
  sub_1000536BC((uint64_t)v30);
  sub_1000536BC((uint64_t)v37);

  swift_bridgeObjectRelease();
  sub_100054B1C((uint64_t)v51, (uint64_t *)&unk_1005F7750);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v48);
}

- (MTFeedManager)init
{
  return (MTFeedManager *)sub_10002FCA0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___MTFeedManager_systemFuture;
  uint64_t v4 = sub_100054B78((uint64_t *)&unk_100602020);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_10003B4E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__system));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  v5 = (char *)self + OBJC_IVAR___MTFeedManager_signpostID;
  uint64_t v6 = type metadata accessor for OSSignpostID();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (BOOL)isUpdatingShowWithUrl:(id)a3 storeID:(int64_t)a4
{
  sub_100054B78((uint64_t *)&unk_1005F7750);
  __chkstk_darwin();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = self;
  char v12 = FeedManager.isUpdatingShow(url:storeID:)((uint64_t)v8, a4);

  sub_100054B1C((uint64_t)v8, (uint64_t *)&unk_1005F7750);
  return v12 & 1;
}

- (void)handleEventsForBackgroundURLSessionFor:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = self;
  v10[3] = v6;
  v10[4] = v8;
  v10[5] = sub_1000343D8;
  v10[6] = v9;
  v11 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10030AE94((uint64_t)sub_10030C9B8, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (BOOL)isUpdating
{
  v2 = self;
  char v3 = FeedManager.isUpdating.getter();

  return v3 & 1;
}

@end