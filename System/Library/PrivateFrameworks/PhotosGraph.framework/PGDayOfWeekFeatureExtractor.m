@interface PGDayOfWeekFeatureExtractor
- (PGDayOfWeekFeatureExtractor)initWithError:(id *)a3;
- (PGDayOfWeekFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6;
@end

@implementation PGDayOfWeekFeatureExtractor

- (PGDayOfWeekFeatureExtractor)initWithError:(id *)a3
{
  return (PGDayOfWeekFeatureExtractor *)DayOfWeekFeatureExtractor.init()();
}

- (PGDayOfWeekFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6
{
  v7 = _Block_copy(a6);
  id v8 = a5;
  _Block_release(v7);
  result = (PGDayOfWeekFeatureExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end