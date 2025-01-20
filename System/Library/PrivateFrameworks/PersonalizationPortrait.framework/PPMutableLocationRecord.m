@interface PPMutableLocationRecord
+ (id)new;
- (PPMutableLocationRecord)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlgorithm:(unsigned __int16)a3;
- (void)setContextualNamedEntities:(id)a3;
- (void)setDecayRate:(double)a3;
- (void)setExtractionAssetVersion:(unsigned int)a3;
- (void)setExtractionOsBuild:(id)a3;
- (void)setInitialScore:(double)a3;
- (void)setLocation:(id)a3;
- (void)setSentimentScore:(double)a3;
- (void)setSource:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PPMutableLocationRecord

- (void)setSentimentScore:(double)a3
{
  if (a3 < -1.0) {
    a3 = -1.0;
  }
  double v3 = a3 / 0.00787401575;
  BOOL v4 = a3 < 1.0;
  double v5 = 127.0;
  if (v4) {
    double v5 = v3;
  }
  self->super._bucketizedSentimentScore = (int)v5;
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
  double v5 = [v7 intern:v4];

  extractionOsBuild = self->super._extractionOsBuild;
  self->super._extractionOsBuild = v5;
}

- (void)setContextualNamedEntities:(id)a3
{
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

- (void)setAlgorithm:(unsigned __int16)a3
{
  unsigned __int8 v3 = a3;
  if (a3 >= 0x100u)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PPLocation.m" lineNumber:688 description:@"Algorithm storage too small"];
  }
  self->super._algorithm = v3;
}

- (void)setSource:(id)a3
{
  id v4 = a3;
  PPGetSourceInternPool();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = [v7 intern:v4];

  source = self->super._source;
  self->super._source = v5;
}

- (void)setLocation:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self->super._uuid)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PPLocation.m", 649, @"Invalid parameter not satisfying: %@", @"_uuid" object file lineNumber description];
  }
  if (!self->super._location)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PPLocation.m", 650, @"Invalid parameter not satisfying: %@", @"_location" object file lineNumber description];
  }
  if (!self->super._source)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PPLocation.m", 651, @"Invalid parameter not satisfying: %@", @"_source" object file lineNumber description];
  }
  v6 = [+[PPLocationRecord allocWithZone:a3] init];
  uint64_t v7 = [(NSUUID *)self->super._uuid copyWithZone:a3];
  uuid = v6->_uuid;
  v6->_uuid = (NSUUID *)v7;

  v9 = [(PPLocation *)self->super._location copyWithZone:a3];
  location = v6->_location;
  v6->_location = v9;

  objc_storeStrong((id *)&v6->_source, self->super._source);
  v6->_algorithm = self->super._algorithm;
  v6->_initialScore = self->super._initialScore;
  v6->_decayRate = self->super._decayRate;
  uint64_t v11 = [(NSArray *)self->super._contextualNamedEntities copyWithZone:a3];
  contextualNamedEntities = v6->_contextualNamedEntities;
  v6->_contextualNamedEntities = (NSArray *)v11;

  objc_storeStrong((id *)&v6->_extractionOsBuild, self->super._extractionOsBuild);
  v6->_extractionAssetVersion = self->super._extractionAssetVersion;
  v6->_bucketizedSentimentScore = self->super._bucketizedSentimentScore;
  return v6;
}

- (PPMutableLocationRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPMutableLocationRecord;
  result = [(PPLocationRecord *)&v3 init_];
  if (result) {
    result->super._extractionAssetVersion = -1;
  }
  return result;
}

+ (id)new
{
  return (id)MEMORY[0x1F4181648](a1, a2);
}

@end