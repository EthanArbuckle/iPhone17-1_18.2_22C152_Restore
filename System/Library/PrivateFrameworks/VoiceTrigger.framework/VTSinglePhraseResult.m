@interface VTSinglePhraseResult
- (BOOL)isRunningQuasar;
- (BOOL)isSecondChance;
- (BOOL)isSecondChanceCandidate;
- (VTKeywordAnalyzerNDAPIResult)ndapiResult;
- (VTSinglePhraseResult)initWithPhId:(unint64_t)a3 keywordDetectorDecision:(unint64_t)a4 combinedScore:(float)a5 ndapiScore:(float)a6 ndapiResult:(id)a7 recognizerScore:(float)a8 isSecondChance:(BOOL)a9 isSecondChanceCandidate:(BOOL)a10 isRunningQuasar:(BOOL)a11;
- (float)combinedScore;
- (float)ndapiScore;
- (float)recognizerScore;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)decision;
- (unint64_t)phId;
@end

@implementation VTSinglePhraseResult

- (void).cxx_destruct
{
}

- (BOOL)isRunningQuasar
{
  return self->_isRunningQuasar;
}

- (BOOL)isSecondChanceCandidate
{
  return self->_isSecondChanceCandidate;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (float)recognizerScore
{
  return self->_recognizerScore;
}

- (VTKeywordAnalyzerNDAPIResult)ndapiResult
{
  return self->_ndapiResult;
}

- (float)ndapiScore
{
  return self->_ndapiScore;
}

- (float)combinedScore
{
  return self->_combinedScore;
}

- (unint64_t)decision
{
  return self->_decision;
}

- (unint64_t)phId
{
  return self->_phId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [VTSinglePhraseResult alloc];
  unint64_t phId = self->_phId;
  unint64_t decision = self->_decision;
  float combinedScore = self->_combinedScore;
  float ndapiScore = self->_ndapiScore;
  v9 = (void *)[(VTKeywordAnalyzerNDAPIResult *)self->_ndapiResult copy];
  *(float *)&double v10 = self->_recognizerScore;
  *(float *)&double v11 = combinedScore;
  *(float *)&double v12 = ndapiScore;
  v13 = [(VTSinglePhraseResult *)v4 initWithPhId:phId keywordDetectorDecision:decision combinedScore:v9 ndapiScore:self->_isSecondChance ndapiResult:self->_isSecondChanceCandidate recognizerScore:self->_isRunningQuasar isSecondChance:v11 isSecondChanceCandidate:v12 isRunningQuasar:v10];

  return v13;
}

- (VTSinglePhraseResult)initWithPhId:(unint64_t)a3 keywordDetectorDecision:(unint64_t)a4 combinedScore:(float)a5 ndapiScore:(float)a6 ndapiResult:(id)a7 recognizerScore:(float)a8 isSecondChance:(BOOL)a9 isSecondChanceCandidate:(BOOL)a10 isRunningQuasar:(BOOL)a11
{
  id v21 = a7;
  v25.receiver = self;
  v25.super_class = (Class)VTSinglePhraseResult;
  v22 = [(VTSinglePhraseResult *)&v25 init];
  v23 = v22;
  if (v22)
  {
    v22->_unint64_t phId = a3;
    v22->_unint64_t decision = a4;
    v22->_float combinedScore = a5;
    v22->_float ndapiScore = a6;
    objc_storeStrong((id *)&v22->_ndapiResult, a7);
    v23->_recognizerScore = a8;
    v23->_isSecondChance = a9;
    v23->_isSecondChanceCandidate = a10;
    v23->_isRunningQuasar = a11;
  }

  return v23;
}

@end