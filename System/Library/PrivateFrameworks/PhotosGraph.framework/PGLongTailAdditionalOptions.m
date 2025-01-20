@interface PGLongTailAdditionalOptions
- (PGLongTailAdditionalOptions)init;
- (PGLongTailAdditionalOptions)initWithDictionary:(id)a3;
- (unint64_t)qualityPercentile;
- (unint64_t)topTierAestheticScoreValue;
- (unint64_t)verifiedPersonScoreValue;
- (void)setQualityPercentile:(unint64_t)a3;
- (void)setTopTierAestheticScoreValue:(unint64_t)a3;
- (void)setVerifiedPersonScoreValue:(unint64_t)a3;
@end

@implementation PGLongTailAdditionalOptions

- (void)setTopTierAestheticScoreValue:(unint64_t)a3
{
  self->_topTierAestheticScoreValue = a3;
}

- (unint64_t)topTierAestheticScoreValue
{
  return self->_topTierAestheticScoreValue;
}

- (void)setVerifiedPersonScoreValue:(unint64_t)a3
{
  self->_verifiedPersonScoreValue = a3;
}

- (unint64_t)verifiedPersonScoreValue
{
  return self->_verifiedPersonScoreValue;
}

- (void)setQualityPercentile:(unint64_t)a3
{
  self->_qualityPercentile = a3;
}

- (unint64_t)qualityPercentile
{
  return self->_qualityPercentile;
}

- (PGLongTailAdditionalOptions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PGLongTailAdditionalOptions *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"qualityPercentile"];
    v7 = v6;
    if (v6 && ([v6 integerValue] & 0x8000000000000000) == 0) {
      v5->_qualityPercentile = [v7 unsignedIntegerValue];
    }
    v8 = [v4 objectForKeyedSubscript:@"verifiedPersonScore"];
    v9 = v8;
    if (v8 && ([v8 integerValue] & 0x8000000000000000) == 0) {
      v5->_verifiedPersonScoreValue = [v9 unsignedIntegerValue];
    }
    v10 = [v4 objectForKeyedSubscript:@"topTierAestheticScore"];
    v11 = v10;
    if (v10 && ([v10 integerValue] & 0x8000000000000000) == 0) {
      v5->_topTierAestheticScoreValue = [v11 unsignedIntegerValue];
    }
  }
  return v5;
}

- (PGLongTailAdditionalOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGLongTailAdditionalOptions;
  result = [(PGLongTailAdditionalOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_qualityPercentile = xmmword_1D1F4F200;
    result->_topTierAestheticScoreValue = 3;
  }
  return result;
}

@end