@interface PISliderNetAdjustmentsRequest
- (NSData)contentFeatureVectorData;
- (NSData)styleFeatureVectorData;
- (PISliderNetAdjustmentsRequest)initWithComposition:(id)a3;
- (double)similarityGatingThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setContentFeatureVectorData:(id)a3;
- (void)setSimilarityGatingThreshold:(double)a3;
- (void)setStyleFeatureVectorData:(id)a3;
@end

@implementation PISliderNetAdjustmentsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFeatureVectorData, 0);
  objc_storeStrong((id *)&self->_styleFeatureVectorData, 0);
}

- (void)setSimilarityGatingThreshold:(double)a3
{
  self->_similarityGatingThreshold = a3;
}

- (double)similarityGatingThreshold
{
  return self->_similarityGatingThreshold;
}

- (void)setContentFeatureVectorData:(id)a3
{
}

- (NSData)contentFeatureVectorData
{
  return self->_contentFeatureVectorData;
}

- (void)setStyleFeatureVectorData:(id)a3
{
}

- (NSData)styleFeatureVectorData
{
  return self->_styleFeatureVectorData;
}

- (id)newRenderJob
{
  v3 = [PISliderNetAdjustmentsJob alloc];
  return [(NURenderJob *)v3 initWithRequest:self];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PISliderNetAdjustmentsRequest;
  v4 = [(PISliderNetBaseRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 23, self->_styleFeatureVectorData);
    objc_storeStrong(v5 + 24, self->_contentFeatureVectorData);
    v5[25] = *(id *)&self->_similarityGatingThreshold;
  }
  return v5;
}

- (PISliderNetAdjustmentsRequest)initWithComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PISliderNetAdjustmentsRequest;
  result = [(NURenderRequest *)&v4 initWithComposition:a3];
  if (result) {
    result->_similarityGatingThreshold = -1.0;
  }
  return result;
}

@end