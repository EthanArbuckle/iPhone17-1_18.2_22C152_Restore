@interface CSDAudioController
- (CSDAudioController)init;
- (CSDAudioController)initWithVoiceOverObserver:(id)a3;
- (void)expediteDeferredEndInterruptionForCallWithUUID:(id)a3;
@end

@implementation CSDAudioController

- (CSDAudioController)initWithVoiceOverObserver:(id)a3
{
  return (CSDAudioController *)sub_100292E7C(a3);
}

- (void)expediteDeferredEndInterruptionForCallWithUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100293118((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CSDAudioController)init
{
}

- (void).cxx_destruct
{
}

@end