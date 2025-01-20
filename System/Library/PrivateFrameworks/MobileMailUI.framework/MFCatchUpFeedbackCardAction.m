@interface MFCatchUpFeedbackCardAction
- (int64_t)selectedFeedbackType;
- (void)setSelectedFeedbackType:(int64_t)a3;
@end

@implementation MFCatchUpFeedbackCardAction

- (int64_t)selectedFeedbackType
{
  return self->_selectedFeedbackType;
}

- (void)setSelectedFeedbackType:(int64_t)a3
{
  self->_selectedFeedbackType = a3;
}

@end