@interface PGGraphFeatureExtractor
+ (id)featureExtractorWithError:(id *)a3;
- (PGGraphFeatureExtractor)initWithError:(id *)a3;
- (PGGraphFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6;
- (unint64_t)featureLength;
@end

@implementation PGGraphFeatureExtractor

- (unint64_t)featureLength
{
  v2 = [(MARelationCollectionFeatureExtractor *)self featureNames];
  unint64_t v3 = [v2 count];

  return v3;
}

- (PGGraphFeatureExtractor)initWithError:(id *)a3
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"Subclasses must override %@", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (PGGraphFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphFeatureExtractor;
  return [(MARelationCollectionFeatureExtractor *)&v7 initWithName:a3 featureNames:a4 relation:a5 labelForTargetBlock:a6];
}

+ (id)featureExtractorWithError:(id *)a3
{
  unint64_t v3 = (void *)[objc_alloc((Class)a1) initWithError:a3];
  return v3;
}

@end