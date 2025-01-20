@interface PNTextEmbeddingResultWithBiasScale
- (NSArray)embedding;
- (NSNumber)calibrationVersion;
- (PNTextEmbeddingResultWithBiasScale)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 bias:(id)a5 scale:(id)a6;
- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3;
- (id)defaultThresholdForImageSearch;
@end

@implementation PNTextEmbeddingResultWithBiasScale

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationVersion, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_bias, 0);
}

- (NSNumber)calibrationVersion
{
  return self->_calibrationVersion;
}

- (NSArray)embedding
{
  return self->_embedding;
}

- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3
{
  [a3 doubleValue];
  double v5 = v4;
  double v6 = log(v4);
  long double v7 = v6 - log(1.0 - v5);
  [(NSNumber *)self->_bias doubleValue];
  long double v9 = v7 - v8;
  [(NSNumber *)self->_scale doubleValue];
  double v11 = v9 / v10;
  v12 = NSNumber;
  return (id)[v12 numberWithDouble:v11];
}

- (id)defaultThresholdForImageSearch
{
  return [(PNTextEmbeddingResultWithBiasScale *)self calibratedThresholdForImageSearchWithBaseThreshold:&unk_27076A0E8];
}

- (PNTextEmbeddingResultWithBiasScale)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 bias:(id)a5 scale:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PNTextEmbeddingResultWithBiasScale;
  v15 = [(PNTextEmbeddingResultWithBiasScale *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_embedding, a3);
    objc_storeStrong((id *)&v16->_calibrationVersion, a4);
    objc_storeStrong((id *)&v16->_bias, a5);
    objc_storeStrong((id *)&v16->_scale, a6);
  }

  return v16;
}

@end