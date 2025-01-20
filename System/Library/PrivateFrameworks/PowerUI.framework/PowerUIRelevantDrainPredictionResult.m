@interface PowerUIRelevantDrainPredictionResult
- (BOOL)significantDrainAhead;
- (NSString)predictionSchemeString;
- (PowerUIRelevantDrainPredictionResult)init;
- (PowerUIRelevantDrainPredictionResult)prevStageResult;
- (double)confidence;
- (double)threshold;
- (id)description;
- (int64_t)predictionScheme;
- (unint64_t)suggestedLimit;
- (void)setConfidence:(double)a3;
- (void)setPredictionScheme:(int64_t)a3;
- (void)setPredictionSchemeString:(id)a3;
- (void)setPrevStageResult:(id)a3;
- (void)setScheme:(int64_t)a3;
- (void)setSignificantDrainAhead:(BOOL)a3;
- (void)setSuggestedLimit:(unint64_t)a3;
- (void)setSuggestedLimitForSignificantDrain:(unint64_t)a3;
- (void)setThreshold:(double)a3;
@end

@implementation PowerUIRelevantDrainPredictionResult

- (PowerUIRelevantDrainPredictionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)PowerUIRelevantDrainPredictionResult;
  v2 = [(PowerUIRelevantDrainPredictionResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_significantDrainAhead = 1;
    *(_OWORD *)&v2->_confidence = xmmword_2214312E0;
    v2->_suggestedLimit = 100;
    [(PowerUIRelevantDrainPredictionResult *)v2 setScheme:1];
    prevStageResult = v3->_prevStageResult;
    v3->_prevStageResult = 0;
  }
  return v3;
}

- (void)setScheme:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    v3 = &stru_26D3439E8;
  }
  else {
    v3 = off_2645A6750[a3 - 1];
  }
  self->_predictionScheme = a3;
  self->_predictionSchemeString = &v3->isa;
  MEMORY[0x270F9A758]();
}

- (void)setSuggestedLimitForSignificantDrain:(unint64_t)a3
{
  unint64_t v3 = 100;
  if (!self->_significantDrainAhead) {
    unint64_t v3 = a3;
  }
  self->_suggestedLimit = v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  predictionSchemeString = self->_predictionSchemeString;
  BOOL significantDrainAhead = self->_significantDrainAhead;
  double confidence = self->_confidence;
  double threshold = self->_threshold;
  prevStageResult = self->_prevStageResult;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_suggestedLimit];
  v10 = (void *)v9;
  if (prevStageResult) {
    [v3 stringWithFormat:@"\r===>Second Stage:\r\nScheme: %@\r\tPrediction Result:\r\tSignificantDrainAhead: %d\r\tConfidence: %f\r\tThreshold: %f, \r\tSuggestedLimit: %@, \rPrev Stage: %@", predictionSchemeString, significantDrainAhead, *(void *)&confidence, *(void *)&threshold, v9, self->_prevStageResult];
  }
  else {
  v11 = [v3 stringWithFormat:@"===>First Stage:\r\nScheme: %@\r\tPrediction Result:\r\tSignificantDrainAhead: %d\r\tConfidence: %f\r\tThreshold: %f, \r\tSuggestedLimit: %@", predictionSchemeString, significantDrainAhead, *(void *)&confidence, *(void *)&threshold, v9, v13];
  }

  return v11;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_double threshold = a3;
}

- (BOOL)significantDrainAhead
{
  return self->_significantDrainAhead;
}

- (void)setSignificantDrainAhead:(BOOL)a3
{
  self->_BOOL significantDrainAhead = a3;
}

- (unint64_t)suggestedLimit
{
  return self->_suggestedLimit;
}

- (void)setSuggestedLimit:(unint64_t)a3
{
  self->_suggestedLimit = a3;
}

- (PowerUIRelevantDrainPredictionResult)prevStageResult
{
  return self->_prevStageResult;
}

- (void)setPrevStageResult:(id)a3
{
}

- (int64_t)predictionScheme
{
  return self->_predictionScheme;
}

- (void)setPredictionScheme:(int64_t)a3
{
  self->_predictionScheme = a3;
}

- (NSString)predictionSchemeString
{
  return self->_predictionSchemeString;
}

- (void)setPredictionSchemeString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSchemeString, 0);
  objc_storeStrong((id *)&self->_prevStageResult, 0);
}

@end