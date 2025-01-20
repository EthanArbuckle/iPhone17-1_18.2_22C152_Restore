@interface VTPhraseDetectorInfo
- (BOOL)hasPendingNearMiss;
- (VTPhraseConfig)phraseConfig;
- (VTPhraseDetectorInfo)initWithPhraseConfig:(id)a3;
- (float)effectiveKeywordThreshold;
- (void)setEffectiveKeywordThreshold:(float)a3;
- (void)setHasPendingNearMiss:(BOOL)a3;
- (void)setPhraseConfig:(id)a3;
@end

@implementation VTPhraseDetectorInfo

- (void).cxx_destruct
{
}

- (void)setPhraseConfig:(id)a3
{
}

- (VTPhraseConfig)phraseConfig
{
  return self->_phraseConfig;
}

- (void)setHasPendingNearMiss:(BOOL)a3
{
  self->_hasPendingNearMiss = a3;
}

- (BOOL)hasPendingNearMiss
{
  return self->_hasPendingNearMiss;
}

- (void)setEffectiveKeywordThreshold:(float)a3
{
  self->_effectiveKeywordThreshold = a3;
}

- (float)effectiveKeywordThreshold
{
  return self->_effectiveKeywordThreshold;
}

- (VTPhraseDetectorInfo)initWithPhraseConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VTPhraseDetectorInfo;
  v6 = [(VTPhraseDetectorInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_phraseConfig, a3);
    v7->_effectiveKeywordThreshold = INFINITY;
    v7->_hasPendingNearMiss = 0;
  }

  return v7;
}

@end