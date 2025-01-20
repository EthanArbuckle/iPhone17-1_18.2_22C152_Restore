@interface PeriodResolutionResult
+ (id)confirmationRequiredWithPeriodToConfirm:(int64_t)a3;
+ (id)successWithResolvedPeriod:(int64_t)a3;
- (PeriodResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PeriodResolutionResult

+ (id)successWithResolvedPeriod:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_100013224(a3);

  return v4;
}

+ (id)confirmationRequiredWithPeriodToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_100013270(a3);

  return v4;
}

- (PeriodResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_100013F80();
  id v6 = a4;
  Class isa = sub_100013F70().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PeriodResolutionResult();
  v8 = [(PeriodResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end