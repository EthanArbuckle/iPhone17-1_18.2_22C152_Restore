@interface PPScoreInterpreterCoreMLModelFeature
- (NSString)featureName;
- (PPScoreInterpreterCoreMLModelFeature)initWithFeatureName:(id)a3;
- (PPScoreInterpreterCoreMLModelFeature)initWithFeatureName:(id)a3 multiArraySize:(unint64_t)a4;
- (int64_t)featureType;
- (unint64_t)multiArraySize;
@end

@implementation PPScoreInterpreterCoreMLModelFeature

- (void).cxx_destruct
{
}

- (unint64_t)multiArraySize
{
  return self->_multiArraySize;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (PPScoreInterpreterCoreMLModelFeature)initWithFeatureName:(id)a3
{
  return [(PPScoreInterpreterCoreMLModelFeature *)self initWithFeatureName:a3 multiArraySize:0];
}

- (PPScoreInterpreterCoreMLModelFeature)initWithFeatureName:(id)a3 multiArraySize:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPScoreInterpreterCoreMLModelFeature;
  v7 = [(PPScoreInterpreterCoreMLModelFeature *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_multiArraySize = a4;
    uint64_t v9 = [v6 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v9;

    uint64_t v11 = 5;
    if (!v8->_multiArraySize) {
      uint64_t v11 = 2;
    }
    v8->_featureType = v11;
  }

  return v8;
}

@end