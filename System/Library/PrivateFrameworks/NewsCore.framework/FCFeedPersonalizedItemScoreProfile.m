@interface FCFeedPersonalizedItemScoreProfile
- (BOOL)hasShadowScores;
- (BOOL)isCoread;
- (BOOL)respondsToSelector:(SEL)a3;
- (FCFeedPersonalizedItemScoreProfile)init;
- (FCFeedPersonalizedItemScoreProfile)initWithPBScoreProfile:(id)a3;
- (NTPBCoefficients)coefficients;
- (NTPBScoreProfile)pbScoreProfile;
- (NTPBScoreProfileDebug)debugFields;
- (NTPBScoringCohort)globalCohort;
- (double)sortingScore;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setCoefficients:(id)a3;
- (void)setDebugFields:(id)a3;
- (void)setGlobalCohort:(id)a3;
- (void)setHasShadowScores:(BOOL)a3;
- (void)setIsCoread:(BOOL)a3;
- (void)setPbScoreProfile:(id)a3;
@end

@implementation FCFeedPersonalizedItemScoreProfile

- (FCFeedPersonalizedItemScoreProfile)init
{
  v3 = objc_opt_new();
  v4 = [(FCFeedPersonalizedItemScoreProfile *)self initWithPBScoreProfile:v3];

  return v4;
}

- (FCFeedPersonalizedItemScoreProfile)initWithPBScoreProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCFeedPersonalizedItemScoreProfile;
  v6 = [(FCFeedPersonalizedItemScoreProfile *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pbScoreProfile, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbScoreProfile, 0);
  objc_storeStrong((id *)&self->_globalCohort, 0);
  objc_storeStrong((id *)&self->_coefficients, 0);
}

- (NTPBScoreProfileDebug)debugFields
{
  v3 = [(FCFeedPersonalizedItemScoreProfile *)self pbScoreProfile];
  v4 = [v3 debugFields];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F82BB0]);
    v6 = [(FCFeedPersonalizedItemScoreProfile *)self pbScoreProfile];
    [v6 setDebugFields:v5];
  }
  v7 = [(FCFeedPersonalizedItemScoreProfile *)self pbScoreProfile];
  v8 = [v7 debugFields];

  return (NTPBScoreProfileDebug *)v8;
}

- (void)setDebugFields:(id)a3
{
  id v4 = a3;
  id v5 = [(FCFeedPersonalizedItemScoreProfile *)self pbScoreProfile];
  [v5 setDebugFields:v4];
}

- (double)sortingScore
{
  if (qword_1EB5D18C8 != -1) {
    dispatch_once(&qword_1EB5D18C8, &__block_literal_global_137);
  }
  if (_MergedGlobals_198)
  {
    [(FCFeedPersonalizedItemScoreProfile *)self embeddingScore];
  }
  else if (byte_1EB5D18C1)
  {
    [(FCFeedPersonalizedItemScoreProfile *)self tabiScore];
  }
  else
  {
    [(FCFeedPersonalizedItemScoreProfile *)self agedPersonalizationScore];
  }
  return result;
}

void __50__FCFeedPersonalizedItemScoreProfile_sortingScore__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = NewsCoreUserDefaults();
  _MergedGlobals_198 = [v0 BOOLForKey:@"news.features.scoreExclusivelyUsingEmbeddings"];

  v1 = NewsCoreUserDefaults();
  byte_1EB5D18C1 = [v1 BOOLForKey:@"news.features.scoreExclusivelyUsingTabi"];

  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109376;
    v3[1] = _MergedGlobals_198;
    __int16 v4 = 1024;
    int v5 = byte_1EB5D18C1;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Configuring sortingScore with scoreExclusivelyUsingEmbeddings=%d scoreExclusivelyUsingTabi=%d", (uint8_t *)v3, 0xEu);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_pbScoreProfile;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(NTPBScoreProfile *)self->_pbScoreProfile methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (BOOL)isCoread
{
  return self->_isCoread;
}

- (void)setIsCoread:(BOOL)a3
{
  self->_isCoread = a3;
}

- (BOOL)hasShadowScores
{
  return self->_hasShadowScores;
}

- (void)setHasShadowScores:(BOOL)a3
{
  self->_hasShadowScores = a3;
}

- (NTPBCoefficients)coefficients
{
  return self->_coefficients;
}

- (void)setCoefficients:(id)a3
{
}

- (NTPBScoringCohort)globalCohort
{
  return self->_globalCohort;
}

- (void)setGlobalCohort:(id)a3
{
}

- (NTPBScoreProfile)pbScoreProfile
{
  return self->_pbScoreProfile;
}

- (void)setPbScoreProfile:(id)a3
{
}

@end