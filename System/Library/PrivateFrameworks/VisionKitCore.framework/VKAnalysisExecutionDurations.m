@interface VKAnalysisExecutionDurations
- (double)madDocumentDuration;
- (double)madMRCDuration;
- (double)madRectangleDuration;
- (double)madRoundTripAnalysisDuration;
- (double)madVisualSearchDuration;
- (double)mrcParseDuration;
- (void)setMadDocumentDuration:(double)a3;
- (void)setMadMRCDuration:(double)a3;
- (void)setMadRectangleDuration:(double)a3;
- (void)setMadRoundTripAnalysisDuration:(double)a3;
- (void)setMadVisualSearchDuration:(double)a3;
- (void)setMrcParseDuration:(double)a3;
@end

@implementation VKAnalysisExecutionDurations

- (double)madRoundTripAnalysisDuration
{
  return self->_madRoundTripAnalysisDuration;
}

- (void)setMadRoundTripAnalysisDuration:(double)a3
{
  self->_madRoundTripAnalysisDuration = a3;
}

- (double)mrcParseDuration
{
  return self->_mrcParseDuration;
}

- (void)setMrcParseDuration:(double)a3
{
  self->_mrcParseDuration = a3;
}

- (double)madDocumentDuration
{
  return self->_madDocumentDuration;
}

- (void)setMadDocumentDuration:(double)a3
{
  self->_madDocumentDuration = a3;
}

- (double)madMRCDuration
{
  return self->_madMRCDuration;
}

- (void)setMadMRCDuration:(double)a3
{
  self->_madMRCDuration = a3;
}

- (double)madVisualSearchDuration
{
  return self->_madVisualSearchDuration;
}

- (void)setMadVisualSearchDuration:(double)a3
{
  self->_madVisualSearchDuration = a3;
}

- (double)madRectangleDuration
{
  return self->_madRectangleDuration;
}

- (void)setMadRectangleDuration:(double)a3
{
  self->_madRectangleDuration = a3;
}

@end