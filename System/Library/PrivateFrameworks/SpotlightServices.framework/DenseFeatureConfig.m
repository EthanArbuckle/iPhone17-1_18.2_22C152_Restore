@interface DenseFeatureConfig
- (BOOL)normalization;
- (BOOL)transform;
- (DenseFeatureConfig)init;
- (DenseFeatureConfig)initWithConfig:(id)a3 name:(id)a4;
- (NSString)normalizationType;
- (NSString)originalFeatureName;
- (NSString)transformType;
- (float)defaultValue;
- (float)normalizationMax;
- (float)normalizationMin;
- (void)setDefaultValue:(float)a3;
- (void)setNormalization:(BOOL)a3;
- (void)setNormalizationMax:(float)a3;
- (void)setNormalizationMin:(float)a3;
- (void)setNormalizationType:(id)a3;
- (void)setOriginalFeatureName:(id)a3;
- (void)setTransform:(BOOL)a3;
- (void)setTransformType:(id)a3;
@end

@implementation DenseFeatureConfig

- (DenseFeatureConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)DenseFeatureConfig;
  result = [(FeatureConfig *)&v3 init];
  if (result)
  {
    result->_defaultValue = 0.0;
    result->_normalization = 0;
    result->_transform = 0;
  }
  return result;
}

- (DenseFeatureConfig)initWithConfig:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DenseFeatureConfig;
  v8 = [(FeatureConfig *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v20.receiver = v8;
    v20.super_class = (Class)DenseFeatureConfig;
    [(FeatureConfig *)&v20 setName:v7];
    [v6 defaultValue];
    v9->_defaultValue = v10;
    v9->_normalization = [v6 normalization];
    uint64_t v11 = [v6 normalizationType];
    normalizationType = v9->_normalizationType;
    v9->_normalizationType = (NSString *)v11;

    [v6 normalizationMin];
    v9->_normalizationMin = v13;
    [v6 normalizationMax];
    v9->_normalizationMax = v14;
    v9->_transform = [v6 transform];
    uint64_t v15 = [v6 transformType];
    transformType = v9->_transformType;
    v9->_transformType = (NSString *)v15;

    uint64_t v17 = [v6 originalFeatureName];
    originalFeatureName = v9->_originalFeatureName;
    v9->_originalFeatureName = (NSString *)v17;
  }
  return v9;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(float)a3
{
  self->_defaultValue = a3;
}

- (BOOL)normalization
{
  return self->_normalization;
}

- (void)setNormalization:(BOOL)a3
{
  self->_normalization = a3;
}

- (NSString)normalizationType
{
  return self->_normalizationType;
}

- (void)setNormalizationType:(id)a3
{
}

- (float)normalizationMin
{
  return self->_normalizationMin;
}

- (void)setNormalizationMin:(float)a3
{
  self->_normalizationMin = a3;
}

- (float)normalizationMax
{
  return self->_normalizationMax;
}

- (void)setNormalizationMax:(float)a3
{
  self->_normalizationMax = a3;
}

- (BOOL)transform
{
  return self->_transform;
}

- (void)setTransform:(BOOL)a3
{
  self->_transform = a3;
}

- (NSString)transformType
{
  return self->_transformType;
}

- (void)setTransformType:(id)a3
{
}

- (NSString)originalFeatureName
{
  return self->_originalFeatureName;
}

- (void)setOriginalFeatureName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureName, 0);
  objc_storeStrong((id *)&self->_transformType, 0);
  objc_storeStrong((id *)&self->_normalizationType, 0);
}

@end