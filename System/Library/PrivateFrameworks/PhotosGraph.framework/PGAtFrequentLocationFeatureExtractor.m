@interface PGAtFrequentLocationFeatureExtractor
- (PGAtFrequentLocationFeatureExtractor)initWithError:(id *)a3;
- (PGAtFrequentLocationFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6;
@end

@implementation PGAtFrequentLocationFeatureExtractor

- (PGAtFrequentLocationFeatureExtractor)initWithError:(id *)a3
{
  return (PGAtFrequentLocationFeatureExtractor *)AtFrequentLocationFeatureExtractor.init()();
}

- (PGAtFrequentLocationFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6
{
  v7 = _Block_copy(a6);
  id v8 = a5;
  _Block_release(v7);
  result = (PGAtFrequentLocationFeatureExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end