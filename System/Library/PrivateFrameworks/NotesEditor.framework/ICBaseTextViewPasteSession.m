@interface ICBaseTextViewPasteSession
- (BOOL)didWarnAboutAttachmentLimitExceeded;
- (BOOL)didWarnAboutAttachmentSizeExceeded;
- (BOOL)didWarnAboutExceedingMaxLength;
- (BOOL)didWarnAboutNotSupportedForPasswordProtectedNotes;
- (BOOL)previousShouldAddMediaAsynchronously;
- (unint64_t)numberOfImagesPasted;
- (void)setDidWarnAboutAttachmentLimitExceeded:(BOOL)a3;
- (void)setDidWarnAboutAttachmentSizeExceeded:(BOOL)a3;
- (void)setDidWarnAboutExceedingMaxLength:(BOOL)a3;
- (void)setDidWarnAboutNotSupportedForPasswordProtectedNotes:(BOOL)a3;
- (void)setNumberOfImagesPasted:(unint64_t)a3;
- (void)setPreviousShouldAddMediaAsynchronously:(BOOL)a3;
@end

@implementation ICBaseTextViewPasteSession

- (BOOL)didWarnAboutExceedingMaxLength
{
  return self->_didWarnAboutExceedingMaxLength;
}

- (void)setDidWarnAboutExceedingMaxLength:(BOOL)a3
{
  self->_didWarnAboutExceedingMaxLength = a3;
}

- (BOOL)didWarnAboutAttachmentSizeExceeded
{
  return self->_didWarnAboutAttachmentSizeExceeded;
}

- (void)setDidWarnAboutAttachmentSizeExceeded:(BOOL)a3
{
  self->_didWarnAboutAttachmentSizeExceeded = a3;
}

- (BOOL)didWarnAboutNotSupportedForPasswordProtectedNotes
{
  return self->_didWarnAboutNotSupportedForPasswordProtectedNotes;
}

- (void)setDidWarnAboutNotSupportedForPasswordProtectedNotes:(BOOL)a3
{
  self->_didWarnAboutNotSupportedForPasswordProtectedNotes = a3;
}

- (BOOL)didWarnAboutAttachmentLimitExceeded
{
  return self->_didWarnAboutAttachmentLimitExceeded;
}

- (void)setDidWarnAboutAttachmentLimitExceeded:(BOOL)a3
{
  self->_didWarnAboutAttachmentLimitExceeded = a3;
}

- (BOOL)previousShouldAddMediaAsynchronously
{
  return self->_previousShouldAddMediaAsynchronously;
}

- (void)setPreviousShouldAddMediaAsynchronously:(BOOL)a3
{
  self->_previousShouldAddMediaAsynchronously = a3;
}

- (unint64_t)numberOfImagesPasted
{
  return self->_numberOfImagesPasted;
}

- (void)setNumberOfImagesPasted:(unint64_t)a3
{
  self->_numberOfImagesPasted = a3;
}

@end