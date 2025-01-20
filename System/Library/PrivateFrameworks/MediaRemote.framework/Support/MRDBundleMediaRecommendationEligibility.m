@interface MRDBundleMediaRecommendationEligibility
- (BOOL)isEligible;
- (BOOL)isEligibleForAutoRoute;
- (BOOL)isEligibleForCallToAction;
- (BOOL)isEligibleForOneTapSuggestion;
- (BOOL)isVideoApp;
- (MRDBundleMediaRecommendationEligibility)init;
- (NSString)bundleIdentifier;
- (NSString)description;
@end

@implementation MRDBundleMediaRecommendationEligibility

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)isEligible
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForCallToAction) & 1) != 0
    || *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForAutoRoute) == 1)
  {
    return 1;
  }
  else
  {
    return *((unsigned char *)&self->super.isa
           + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForOneTapSuggestion);
  }
}

- (NSString)bundleIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)isEligibleForOneTapSuggestion
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForOneTapSuggestion);
}

- (BOOL)isEligibleForAutoRoute
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForAutoRoute);
}

- (BOOL)isEligibleForCallToAction
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForCallToAction);
}

- (BOOL)isVideoApp
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_mediaType) == (Class)2;
}

- (NSString)description
{
  NSString v2 = self;
  sub_10027346C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (MRDBundleMediaRecommendationEligibility)init
{
  result = (MRDBundleMediaRecommendationEligibility *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end