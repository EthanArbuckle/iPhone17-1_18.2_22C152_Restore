@interface CRLWPiOSTextCaretDragTrackerController
- (CRLWPiOSTextCaretDragTrackerController)initWithPreferredStatusBarStyle:(int64_t)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)statusBarStyle;
@end

@implementation CRLWPiOSTextCaretDragTrackerController

- (CRLWPiOSTextCaretDragTrackerController)initWithPreferredStatusBarStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPiOSTextCaretDragTrackerController;
  result = [(CRLWPiOSTextCaretDragTrackerController *)&v5 init];
  if (result) {
    result->_statusBarStyle = a3;
  }
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return [(CRLWPiOSTextCaretDragTrackerController *)self statusBarStyle];
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

@end