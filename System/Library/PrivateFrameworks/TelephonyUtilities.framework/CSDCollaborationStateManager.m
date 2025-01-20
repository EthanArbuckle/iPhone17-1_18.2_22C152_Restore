@interface CSDCollaborationStateManager
- (OS_dispatch_queue)queue;
- (_TtC13callservicesd28CSDCollaborationStateManager)init;
- (_TtC13callservicesd28CSDCollaborationStateManager)initWithQueue:(id)a3;
- (_TtP13callservicesd36CSDCollaborationStateManagerDelegate_)delegate;
- (int64_t)documentStateForCollaborationIdentifier:(id)a3;
- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)collaborationAdded:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 isLocallyAdded:(BOOL)a6 toConversationUUID:(id)a7;
- (void)collaborationOpened:(id)a3;
- (void)collaborationReAdded:(id)a3;
- (void)collaborationRemoved:(id)a3;
- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)startTrackingCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 isLocallyAdded:(BOOL)a6 toConversationUUID:(id)a7 completionHandler:(id)a8;
- (void)stopTrackingCollaborationForConversationIfNecessary:(id)a3;
- (void)stopTrackingDisclosedCollaborationInitiatorsForConversationUUID:(id)a3;
@end

@implementation CSDCollaborationStateManager

- (_TtP13callservicesd36CSDCollaborationStateManagerDelegate_)delegate
{
  v2 = (void *)sub_100371170();

  return (_TtP13callservicesd36CSDCollaborationStateManagerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1003711E0((uint64_t)a3);
}

- (OS_dispatch_queue)queue
{
  id v2 = sub_10037122C();

  return (OS_dispatch_queue *)v2;
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100371298((uint64_t)v4);
}

- (_TtC13callservicesd28CSDCollaborationStateManager)initWithQueue:(id)a3
{
  return (_TtC13callservicesd28CSDCollaborationStateManager *)sub_1003712AC(a3);
}

- (void)startTrackingCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 isLocallyAdded:(BOOL)a6 toConversationUUID:(id)a7 completionHandler:(id)a8
{
  BOOL v18 = a6;
  v17 = self;
  uint64_t v19 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a8);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (v13)
  {
    *(void *)(swift_allocObject() + 16) = v13;
    v14 = sub_1002BCCD4;
  }
  else
  {
    v14 = 0;
  }
  v15 = v17;
  sub_100371CB0();
  sub_100208490((uint64_t)v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

- (void)collaborationAdded:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 isLocallyAdded:(BOOL)a6 toConversationUUID:(id)a7
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  sub_1003723B0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)stopTrackingCollaborationForConversationIfNecessary:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100372A40(v4);
}

- (void)collaborationRemoved:(id)a3
{
}

- (void)collaborationOpened:(id)a3
{
}

- (void)collaborationReAdded:(id)a3
{
}

- (int64_t)documentStateForCollaborationIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  sub_100373388();
  int64_t v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  id v13 = a3;
  uint64_t v14 = self;
  sub_100373890(v13, (uint64_t)v11, (uint64_t)v14, (void (**)(void, void, void))v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  _Block_release(v12);
}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100374004();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stopTrackingDisclosedCollaborationInitiatorsForConversationUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100374478();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC13callservicesd28CSDCollaborationStateManager)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_10021E23C((uint64_t)self + OBJC_IVAR____TtC13callservicesd28CSDCollaborationStateManager_protectedAppsObserver, (uint64_t *)&unk_10058B608);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

@end