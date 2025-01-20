@interface NearbyTeachableMomentContaineeViewController
+ (BOOL)hasShownTeachableMoment;
+ (BOOL)shouldShowBasedOnTimesNearbyCardDisplayed;
+ (void)hasDisplayedNearbyCard;
- (_TtC4Maps44NearbyTeachableMomentContaineeViewController)init;
- (_TtC4Maps44NearbyTeachableMomentContaineeViewController)initWithTeachableMomentConfiguration:(id)a3;
@end

@implementation NearbyTeachableMomentContaineeViewController

+ (BOOL)shouldShowBasedOnTimesNearbyCardDisplayed
{
  return sub_1001DCAB4();
}

+ (BOOL)hasShownTeachableMoment
{
  id v2 = [self standardUserDefaults];
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned __int8 v4 = [v2 BOOLForKey:v3];

  return v4;
}

- (_TtC4Maps44NearbyTeachableMomentContaineeViewController)init
{
  return (_TtC4Maps44NearbyTeachableMomentContaineeViewController *)sub_1001DC528();
}

- (_TtC4Maps44NearbyTeachableMomentContaineeViewController)initWithTeachableMomentConfiguration:(id)a3
{
  id v3 = a3;
  result = (_TtC4Maps44NearbyTeachableMomentContaineeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (void)hasDisplayedNearbyCard
{
  v0 = self;
  id v1 = [v0 standardUserDefaults];
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t v3 = (uint64_t)[v1 integerForKey:v2];

  if (v3 <= 3)
  {
    id v4 = [v0 standardUserDefaults];
    id v5 = String._bridgeToObjectiveC()();
    [v4 setInteger:v3 + 1 forKey:v5];
  }
}

@end