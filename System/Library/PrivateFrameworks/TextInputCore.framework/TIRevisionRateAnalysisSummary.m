@interface TIRevisionRateAnalysisSummary
- (BOOL)hasCursorMovement;
- (BOOL)hasEmojiInput;
- (NSNumber)sessionAlignmentConfidence;
- (NSString)languageRegion;
- (int64_t)autocorrectedCount;
- (int64_t)revisedAutocorrectionCount;
- (int64_t)revisedCount;
- (int64_t)tappedCount;
- (void)setAutocorrectedCount:(int64_t)a3;
- (void)setHasCursorMovement:(BOOL)a3;
- (void)setHasEmojiInput:(BOOL)a3;
- (void)setLanguageRegion:(id)a3;
- (void)setRevisedAutocorrectionCount:(int64_t)a3;
- (void)setRevisedCount:(int64_t)a3;
- (void)setSessionAlignmentConfidence:(id)a3;
- (void)setTappedCount:(int64_t)a3;
@end

@implementation TIRevisionRateAnalysisSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageRegion, 0);

  objc_storeStrong((id *)&self->_sessionAlignmentConfidence, 0);
}

- (void)setLanguageRegion:(id)a3
{
}

- (NSString)languageRegion
{
  return self->_languageRegion;
}

- (void)setRevisedAutocorrectionCount:(int64_t)a3
{
  self->_revisedAutocorrectionCount = a3;
}

- (int64_t)revisedAutocorrectionCount
{
  return self->_revisedAutocorrectionCount;
}

- (void)setRevisedCount:(int64_t)a3
{
  self->_revisedCount = a3;
}

- (int64_t)revisedCount
{
  return self->_revisedCount;
}

- (void)setAutocorrectedCount:(int64_t)a3
{
  self->_autocorrectedCount = a3;
}

- (int64_t)autocorrectedCount
{
  return self->_autocorrectedCount;
}

- (void)setTappedCount:(int64_t)a3
{
  self->_tappedCount = a3;
}

- (int64_t)tappedCount
{
  return self->_tappedCount;
}

- (void)setSessionAlignmentConfidence:(id)a3
{
}

- (NSNumber)sessionAlignmentConfidence
{
  return self->_sessionAlignmentConfidence;
}

- (void)setHasCursorMovement:(BOOL)a3
{
  self->_hasCursorMovement = a3;
}

- (BOOL)hasCursorMovement
{
  return self->_hasCursorMovement;
}

- (void)setHasEmojiInput:(BOOL)a3
{
  self->_hasEmojiInput = a3;
}

- (BOOL)hasEmojiInput
{
  return self->_hasEmojiInput;
}

@end