@interface CRLWPTextMagnifierCaretController
- (CRLWPTextMagnifierCaretController)initWithPreferredStatusBarStyle:(int64_t)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)statusBarStyle;
@end

@implementation CRLWPTextMagnifierCaretController

- (CRLWPTextMagnifierCaretController)initWithPreferredStatusBarStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPTextMagnifierCaretController;
  result = [(CRLWPTextMagnifierCaretController *)&v5 init];
  if (result) {
    result->_statusBarStyle = a3;
  }
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return [(CRLWPTextMagnifierCaretController *)self statusBarStyle];
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

@end