@interface XPCConnection
- (NSString)description;
- (_TtC17proximitycontrold13XPCConnection)init;
- (void)activateObserver:(id)a3;
- (void)client:(id)a3 activateWithCompletion:(id)a4;
- (void)didSwitchRouteToDevice:(id)a3;
- (void)dismissBannerWithCompletion:(id)a3;
- (void)mediaTransferObserver:(id)a3 activateWithCompletion:(id)a4;
- (void)observer:(id)a3 activateWithCompletion:(id)a4;
- (void)requestState;
- (void)setBannerScaleProgress:(float)a3 completion:(id)a4;
- (void)startObservingHomeKitIdentifier:(id)a3;
- (void)startObservingMediaRemoteIdentifier:(id)a3;
- (void)stateWithCompletion:(id)a3;
- (void)stopObservingAllDevices;
- (void)stopObservingHomeKitIdentifier:(id)a3;
- (void)stopObservingMediaRemoteIdentifier:(id)a3;
- (void)triggerHandoffFeedbackAlertWithCompletion:(id)a3;
- (void)updateLockscreenMediaThresholdWithCompletion:(id)a3;
- (void)userTappedCloseButton;
- (void)userTappedDisambiguationButton:(id)a3;
@end

@implementation XPCConnection

- (_TtC17proximitycontrold13XPCConnection)init
{
  id v2 = [objc_allocWithZone((Class)NSXPCConnection) init];
  if (qword_10035A628 != -1) {
    swift_once();
  }
  v3 = (void *)qword_1003ACB50;
  id v4 = objc_allocWithZone((Class)type metadata accessor for XPCServer());
  v5 = sub_1000D30F8(v3);
  id v6 = objc_allocWithZone((Class)type metadata accessor for XPCConnection());
  v7 = (_TtC17proximitycontrold13XPCConnection *)sub_1000484D8(v2, v5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000D78C((uint64_t)self + OBJC_IVAR____TtC17proximitycontrold13XPCConnection_activityServer, (uint64_t *)&unk_10035E760);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17proximitycontrold13XPCConnection_mediaTransferObserver));

  swift_release();
}

- (void)client:(id)a3 activateWithCompletion:(id)a4
{
}

- (void)startObservingHomeKitIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100049204((uint64_t)v4, (void (*)(void))sub_100082AE4);
}

- (void)stopObservingHomeKitIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000494A8((uint64_t)v4, (void (*)(void))sub_1000840E8);
}

- (void)startObservingMediaRemoteIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100049204((uint64_t)v4, (void (*)(void))sub_100083AC4);
}

- (void)stopObservingMediaRemoteIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000494A8((uint64_t)v4, (void (*)(void))sub_1000843D8);
}

- (void)stopObservingAllDevices
{
  id v2 = self;
  sub_100049734();
}

- (void)userTappedCloseButton
{
  id v2 = self;
  sub_100049D0C();
}

- (void)userTappedDisambiguationButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100049E58(v4);
}

- (void)dismissBannerWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (void)setBannerScaleProgress:(float)a3 completion:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)requestState
{
  id v2 = self;
  sub_10004A740();
}

- (void)stateWithCompletion:(id)a3
{
}

- (void)triggerHandoffFeedbackAlertWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_10004CBAC((uint64_t)sub_10004D17C, v5);

  swift_release();
}

- (void)updateLockscreenMediaThresholdWithCompletion:(id)a3
{
}

- (void)activateObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10004AC9C((uint64_t)v4);
}

- (void)didSwitchRouteToDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10004D018(v4);
}

- (void)observer:(id)a3 activateWithCompletion:(id)a4
{
}

- (NSString)description
{
  id v2 = self;
  sub_10004B900();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)mediaTransferObserver:(id)a3 activateWithCompletion:(id)a4
{
}

@end