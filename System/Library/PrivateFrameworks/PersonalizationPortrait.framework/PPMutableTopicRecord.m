@interface PPMutableTopicRecord
- (PPMutableTopicRecord)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlgorithm:(unint64_t)a3;
- (void)setDecayRate:(double)a3;
- (void)setExtractionAssetVersion:(unsigned int)a3;
- (void)setExtractionOsBuild:(id)a3;
- (void)setInitialScore:(double)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setSentimentScore:(double)a3;
- (void)setSource:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation PPMutableTopicRecord

- (void)setSentimentScore:(double)a3
{
  self->super._bucketizedSentimentScore = +[PPSentimentScoreEncoder encodeSentimentScore:a3];
}

- (void)setMetadata:(id)a3
{
}

- (void)setExtractionAssetVersion:(unsigned int)a3
{
  self->super._extractionAssetVersion = a3;
}

- (void)setExtractionOsBuild:(id)a3
{
  id v4 = a3;
  PPGetStringInternPool();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v7 intern:v4];

  extractionOsBuild = self->super._extractionOsBuild;
  self->super._extractionOsBuild = v5;
}

- (void)setIsLocal:(BOOL)a3
{
  self->super._isLocal = a3;
}

- (void)setDecayRate:(double)a3
{
  self->super._decayRate = a3;
}

- (void)setInitialScore:(double)a3
{
  self->super._initialScore = a3;
}

- (void)setAlgorithm:(unint64_t)a3
{
  self->super._algorithm = a3;
}

- (void)setSource:(id)a3
{
  id v4 = a3;
  PPGetSourceInternPool();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v7 intern:v4];

  source = self->super._source;
  self->super._source = v5;
}

- (void)setTopic:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->super._topic);
  objc_storeStrong((id *)(v4 + 16), self->super._source);
  *(void *)(v4 + 24) = self->super._algorithm;
  *(double *)(v4 + 32) = self->super._initialScore;
  *(double *)(v4 + 40) = self->super._decayRate;
  *(unsigned char *)(v4 + 48) = self->super._isLocal;
  objc_storeStrong((id *)(v4 + 56), self->super._extractionOsBuild);
  *(_DWORD *)(v4 + 64) = self->super._extractionAssetVersion;
  *(unsigned char *)(v4 + 80) = self->super._bucketizedSentimentScore;
  objc_storeStrong((id *)(v4 + 72), self->super._metadata);
  return (id)v4;
}

- (PPMutableTopicRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPMutableTopicRecord;
  result = [(PPMutableTopicRecord *)&v3 init];
  if (result) {
    result->super._extractionAssetVersion = -1;
  }
  return result;
}

@end