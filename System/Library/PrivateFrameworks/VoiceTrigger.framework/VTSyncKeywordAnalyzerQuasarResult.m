@interface VTSyncKeywordAnalyzerQuasarResult
- (VTSyncKeywordAnalyzerQuasarResult)initWithConfidence:(double)a3;
- (double)triggerConfidence;
- (id)description;
- (void)setTriggerConfidence:(double)a3;
@end

@implementation VTSyncKeywordAnalyzerQuasarResult

- (void)setTriggerConfidence:(double)a3
{
  self->_triggerConfidence = a3;
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"triggerConfidence = %lf", *(void *)&self->_triggerConfidence);
}

- (VTSyncKeywordAnalyzerQuasarResult)initWithConfidence:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTSyncKeywordAnalyzerQuasarResult;
  result = [(VTSyncKeywordAnalyzerQuasarResult *)&v5 init];
  if (result) {
    result->_triggerConfidence = a3;
  }
  return result;
}

@end