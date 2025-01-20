@interface SSRTriggerPhraseDetectorNDAPIResult
- (BOOL)isEarlyWarning;
- (BOOL)isRescoring;
- (float)bestScore;
- (unint64_t)bestEnd;
- (unint64_t)bestPhrase;
- (unint64_t)bestStart;
- (unint64_t)phId;
- (unint64_t)samplesFed;
- (void)setBestEnd:(unint64_t)a3;
- (void)setBestPhrase:(unint64_t)a3;
- (void)setBestScore:(float)a3;
- (void)setBestStart:(unint64_t)a3;
- (void)setIsEarlyWarning:(BOOL)a3;
- (void)setIsRescoring:(BOOL)a3;
- (void)setPhId:(unint64_t)a3;
- (void)setSamplesFed:(unint64_t)a3;
@end

@implementation SSRTriggerPhraseDetectorNDAPIResult

- (void)setIsRescoring:(BOOL)a3
{
  self->_isRescoring = a3;
}

- (BOOL)isRescoring
{
  return self->_isRescoring;
}

- (void)setIsEarlyWarning:(BOOL)a3
{
  self->_isEarlyWarning = a3;
}

- (BOOL)isEarlyWarning
{
  return self->_isEarlyWarning;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestEnd:(unint64_t)a3
{
  self->_bestEnd = a3;
}

- (unint64_t)bestEnd
{
  return self->_bestEnd;
}

- (void)setBestStart:(unint64_t)a3
{
  self->_bestStart = a3;
}

- (unint64_t)bestStart
{
  return self->_bestStart;
}

- (void)setBestPhrase:(unint64_t)a3
{
  self->_bestPhrase = a3;
}

- (unint64_t)bestPhrase
{
  return self->_bestPhrase;
}

- (void)setSamplesFed:(unint64_t)a3
{
  self->_samplesFed = a3;
}

- (unint64_t)samplesFed
{
  return self->_samplesFed;
}

- (void)setPhId:(unint64_t)a3
{
  self->_phId = a3;
}

- (unint64_t)phId
{
  return self->_phId;
}

@end