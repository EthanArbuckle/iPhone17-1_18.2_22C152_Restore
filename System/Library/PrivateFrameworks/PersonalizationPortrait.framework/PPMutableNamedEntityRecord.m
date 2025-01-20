@interface PPMutableNamedEntityRecord
- (PPMutableNamedEntityRecord)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlgorithm:(unint64_t)a3;
- (void)setChangeType:(unsigned __int8)a3;
- (void)setDecayRate:(double)a3;
- (void)setEntity:(id)a3;
- (void)setExtractionAssetVersion:(unsigned int)a3;
- (void)setExtractionOsBuild:(id)a3;
- (void)setInitialScore:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setSentimentScore:(double)a3;
- (void)setSource:(id)a3;
@end

@implementation PPMutableNamedEntityRecord

- (void)setMetadata:(id)a3
{
}

- (void)setSentimentScore:(double)a3
{
  self->super._bucketizedSentimentScore = +[PPSentimentScoreEncoder encodeSentimentScore:a3];
}

- (void)setChangeType:(unsigned __int8)a3
{
  self->super._changeType = a3;
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

- (void)setDecayRate:(double)a3
{
  float v3 = a3;
  self->super._decayRate = v3;
}

- (void)setInitialScore:(double)a3
{
  float v3 = a3;
  self->super._initialScore = v3;
}

- (void)setAlgorithm:(unint64_t)a3
{
  unsigned __int8 v3 = a3;
  if (a3 >= 0x100)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PPNamedEntity.m" lineNumber:672 description:@"Algorithm storage too small"];
  }
  self->super._algorithm = v3;
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

- (void)setEntity:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PPNamedEntityRecord allocWithZone:](PPNamedEntityRecord, "allocWithZone:") init];
  v6 = [(PPNamedEntity *)self->super._entity copyWithZone:a3];
  entity = v5->_entity;
  v5->_entity = v6;

  objc_storeStrong((id *)&v5->_source, self->super._source);
  v5->_algorithm = self->super._algorithm;
  v5->_initialScore = self->super._initialScore;
  v5->_decayRate = self->super._decayRate;
  objc_storeStrong((id *)&v5->_extractionOsBuild, self->super._extractionOsBuild);
  v5->_extractionAssetVersion = self->super._extractionAssetVersion;
  v5->_changeType = self->super._changeType;
  v5->_bucketizedSentimentScore = self->super._bucketizedSentimentScore;
  v8 = [(PPNamedEntityMetadata *)self->super._metadata copyWithZone:a3];
  metadata = v5->_metadata;
  v5->_metadata = v8;

  return v5;
}

- (PPMutableNamedEntityRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPMutableNamedEntityRecord;
  result = [(PPMutableNamedEntityRecord *)&v3 init];
  if (result) {
    result->super._extractionAssetVersion = -1;
  }
  return result;
}

@end