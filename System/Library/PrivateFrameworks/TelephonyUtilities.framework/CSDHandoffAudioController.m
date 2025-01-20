@interface CSDHandoffAudioController
+ (NSString)continueHandoffAudioRouteNotification;
+ (NSString)routeIdentifierChangedNotification;
- (CSDHandoffAudioController)init;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)handleContinueHandoffAudioRouteNotification:(id)a3;
- (void)routesChangedForRouteController:(id)a3;
@end

@implementation CSDHandoffAudioController

+ (NSString)routeIdentifierChangedNotification
{
  id v2 = static HandoffAudioController.routeIdentifierChangedNotification.getter();

  return (NSString *)v2;
}

+ (NSString)continueHandoffAudioRouteNotification
{
  id v2 = static HandoffAudioController.continueHandoffAudioRouteNotification.getter();

  return (NSString *)v2;
}

- (CSDHandoffAudioController)init
{
  return (CSDHandoffAudioController *)HandoffAudioController.init()();
}

- (void)dealloc
{
  id v2 = self;
  HandoffAudioController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)handleContinueHandoffAudioRouteNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10039B684();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HandoffAudioController.conversationManager(_:stateChangedFor:)();
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  HandoffAudioController.routesChanged(for:)();
}

@end