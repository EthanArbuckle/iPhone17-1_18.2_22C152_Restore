@interface PGFeatureTransformersForFeatureExtractors
- (NSMutableDictionary)featureTransformersForFeatureExtractors;
- (PGFeatureTransformersForFeatureExtractors)init;
- (id)featureTransformersForFeatureExtractorName:(id)a3;
- (void)addFeatureTransformers:(id)a3 forFeatureExtractorName:(id)a4;
- (void)setFeatureTransformersForFeatureExtractors:(id)a3;
@end

@implementation PGFeatureTransformersForFeatureExtractors

- (void).cxx_destruct
{
}

- (void)setFeatureTransformersForFeatureExtractors:(id)a3
{
}

- (NSMutableDictionary)featureTransformersForFeatureExtractors
{
  return self->featureTransformersForFeatureExtractors;
}

- (id)featureTransformersForFeatureExtractorName:(id)a3
{
  id v4 = a3;
  v5 = [(PGFeatureTransformersForFeatureExtractors *)self featureTransformersForFeatureExtractors];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)addFeatureTransformers:(id)a3 forFeatureExtractorName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PGFeatureTransformersForFeatureExtractors *)self featureTransformersForFeatureExtractors];
  [v8 setObject:v7 forKey:v6];
}

- (PGFeatureTransformersForFeatureExtractors)init
{
  v5.receiver = self;
  v5.super_class = (Class)PGFeatureTransformersForFeatureExtractors;
  v2 = [(PGFeatureTransformersForFeatureExtractors *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PGFeatureTransformersForFeatureExtractors *)v2 setFeatureTransformersForFeatureExtractors:v3];
  }
  return v2;
}

@end