@interface CSDScreenSharingActivityManager
- (CSDScreenSharingActivityManager)init;
- (CSDScreenSharingActivityManager)initWithFeatureFlags:(id)a3;
- (CSDScreenSharingActivityManagerDelegate)delegate;
- (NSNumber)systemRootLayerScale;
- (TUScreenShareAttributes)latestRemoteAttributes;
- (TUScreenShareAttributes)localScreenShareAttributes;
- (void)broadcastAttributes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalScreenShareAttributes:(id)a3;
- (void)setSystemRootLayerScale:(id)a3;
- (void)startActivitySessionFor:(id)a3 with:(id)a4;
- (void)startObservingSessions;
- (void)stopActivitySession;
@end

@implementation CSDScreenSharingActivityManager

- (CSDScreenSharingActivityManagerDelegate)delegate
{
  v2 = (void *)sub_1002C2D00();

  return (CSDScreenSharingActivityManagerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1002C2D70();
}

- (TUScreenShareAttributes)localScreenShareAttributes
{
  v2 = (void *)sub_1002C2E34();

  return (TUScreenShareAttributes *)v2;
}

- (void)setLocalScreenShareAttributes:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1002C2EA4((uint64_t)a3);
}

- (NSNumber)systemRootLayerScale
{
  v2 = sub_1002C2EF0();

  return (NSNumber *)v2;
}

- (void)setSystemRootLayerScale:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002C2F7C(a3);
}

- (CSDScreenSharingActivityManager)initWithFeatureFlags:(id)a3
{
  id v3 = a3;
  sub_1002C344C();
  return result;
}

- (TUScreenShareAttributes)latestRemoteAttributes
{
  v2 = self;
  id v3 = (void *)sub_1002C3A1C();

  return (TUScreenShareAttributes *)v3;
}

- (void)startObservingSessions
{
  v2 = self;
  ScreenSharingActivityManager.startObservingSessions()();
}

- (void)startActivitySessionFor:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  ScreenSharingActivityManager.startActivitySession(for:with:)();
}

- (void)stopActivitySession
{
  v2 = self;
  ScreenSharingActivityManager.stopActivitySession()();
}

- (void)broadcastAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ScreenSharingActivityManager.broadcastAttributes(_:)();
}

- (CSDScreenSharingActivityManager)init
{
}

- (void).cxx_destruct
{
  sub_100222678((uint64_t)self + OBJC_IVAR___CSDScreenSharingActivityManager_delegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDScreenSharingActivityManager_systemRootLayerScale);
}

@end