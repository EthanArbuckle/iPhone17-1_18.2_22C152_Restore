@interface PNTextEmbeddingResultWithZScore
- (NSArray)embedding;
- (NSNumber)calibrationVersion;
- (PNTextEmbeddingResultWithZScore)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 mean:(id)a5 standardDeviation:(id)a6;
- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3;
- (id)defaultThresholdForImageSearch;
@end

@implementation PNTextEmbeddingResultWithZScore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationVersion, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_standardDeviation, 0);
  objc_storeStrong((id *)&self->_mean, 0);
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
  [a3 floatValue];
  float v5 = v4;
  [(NSNumber *)self->_standardDeviation floatValue];
  float v7 = v6;
  [(NSNumber *)self->_mean floatValue];
  *(float *)&double v8 = *(float *)&v8 + (float)(v5 * v7);
  v9 = NSNumber;
  return (id)[v9 numberWithFloat:v8];
}

- (id)defaultThresholdForImageSearch
{
  LODWORD(v2) = 3.75;
  float v4 = [NSNumber numberWithFloat:v2];
  float v5 = [(PNTextEmbeddingResultWithZScore *)self calibratedThresholdForImageSearchWithBaseThreshold:v4];

  return v5;
}

- (PNTextEmbeddingResultWithZScore)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 mean:(id)a5 standardDeviation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PNTextEmbeddingResultWithZScore;
  v15 = [(PNTextEmbeddingResultWithZScore *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_embedding, a3);
    objc_storeStrong((id *)&v16->_calibrationVersion, a4);
    objc_storeStrong((id *)&v16->_mean, a5);
    objc_storeStrong((id *)&v16->_standardDeviation, a6);
  }

  return v16;
}

@end