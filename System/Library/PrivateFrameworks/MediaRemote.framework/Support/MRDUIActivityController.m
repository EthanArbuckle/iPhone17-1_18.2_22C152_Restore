@interface MRDUIActivityController
+ (BOOL)deviceSupportsActivities;
- (MRDUIActivityController)init;
- (MRDUIActivityControllerDelegate)delegate;
- (NSDictionary)currentActivitiesInfo;
- (NSString)nowPlayingActivityIdentifier;
- (id)contextForActivityIdentifier:(id)a3;
- (id)startRouteRecommendationActivityFor:(id)a3 relevanceScore:(double)a4;
- (void)clearActivities;
- (void)endGroupSessionLowPowerPlatterActivity;
- (void)endGroupSessionNearbyActivity;
- (void)endMirroringActivity;
- (void)endNowPlayingActivity;
- (void)endRouteRecommendationActivityFor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRouteRecommendationRelevanceScore:(double)a3 activityIdentifier:(id)a4;
- (void)startGroupSessionNearbyActivity:(id)a3;
- (void)startMirroringActivity;
- (void)startNowPlayingActivityWithPreferredState:(int64_t)a3 suppressedBundleIdentifiers:(id)a4;
- (void)updateNowPlayingActivityState:(int64_t)a3 suppressedBundleIdentifiers:(id)a4;
@end

@implementation MRDUIActivityController

- (MRDUIActivityControllerDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (MRDUIActivityControllerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (BOOL)deviceSupportsActivities
{
  return static ActivityCenter.liveActivitiesSupported.getter() & 1;
}

- (NSDictionary)currentActivitiesInfo
{
  uint64_t v2 = qword_100484D30;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_10030F520();

  sub_100013A80(&qword_10047A080);
  v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v4.super.isa;
}

- (void)startNowPlayingActivityWithPreferredState:(int64_t)a3 suppressedBundleIdentifiers:(id)a4
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = self;
  ActivityController.startNowPlayingActivity(preferredState:suppressedBundleIdentifiers:)(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)endNowPlayingActivity
{
}

- (void)updateNowPlayingActivityState:(int64_t)a3 suppressedBundleIdentifiers:(id)a4
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = self;
  _s12mediaremoted18ActivityControllerC016updateNowPlayingB5State_27suppressedBundleIdentifiersySo05MRNowfB7UIStateV_SaySSGtF_0(a3, v6);

  swift_bridgeObjectRelease();
}

- (NSString)nowPlayingActivityIdentifier
{
  uint64_t v2 = qword_100484D30;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  if (sub_100313AE4(0)[2])
  {
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    NSString v4 = 0;
  }

  return (NSString *)v4;
}

- (void)startMirroringActivity
{
  uint64_t v2 = qword_100484D30;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  unint64_t v4 = sub_1001FA360((uint64_t)_swiftEmptyArrayStorage);
  sub_10030FC6C(1, v4);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)endMirroringActivity
{
}

- (id)startRouteRecommendationActivityFor:(id)a3 relevanceScore:(double)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  object = ActivityController.startRouteRecommendationActivity(for:relevanceScore:)(v10, a4).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

- (void)setRouteRecommendationRelevanceScore:(double)a3 activityIdentifier:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = qword_100484D30;
  Swift::String v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  sub_1003133E0(2u, v6, v8, a3);

  swift_bridgeObjectRelease();
}

- (void)endRouteRecommendationActivityFor:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = qword_100484D30;
  uint64_t v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  sub_100311E3C(2u, v4, v6);

  swift_bridgeObjectRelease();
}

- (void)startGroupSessionNearbyActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ActivityController.startGroupSessionNearbyActivity(_:)(v4);
}

- (void)endGroupSessionNearbyActivity
{
}

- (void)endGroupSessionLowPowerPlatterActivity
{
}

- (void)clearActivities
{
  uint64_t v2 = qword_100484D30;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_10030FA6C();
}

- (id)contextForActivityIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = _s12mediaremoted18ActivityControllerC010contextForB10IdentifierySo11MRUIContextaSSF_0(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (MRDUIActivityController)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityController();
  return [(MRDUIActivityController *)&v4 init];
}

- (void).cxx_destruct
{
}

@end