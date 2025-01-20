@interface WebThreadSafeUndoManager
- (BOOL)_alwaysShowEditAlertView;
- (void)redo;
- (void)undo;
@end

@implementation WebThreadSafeUndoManager

- (void)undo
{
  if (WebThreadIsEnabled() && WebThreadNotCurrent()) {
    WebThreadLock();
  }
  v3.receiver = self;
  v3.super_class = (Class)WebThreadSafeUndoManager;
  [(WebThreadSafeUndoManager *)&v3 undo];
  [+[UIKeyboardImpl sharedInstance] textChanged:self];
}

- (void)redo
{
  if (WebThreadIsEnabled() && WebThreadNotCurrent()) {
    WebThreadLock();
  }
  v3.receiver = self;
  v3.super_class = (Class)WebThreadSafeUndoManager;
  [(WebThreadSafeUndoManager *)&v3 redo];
  [+[UIKeyboardImpl sharedInstance] textChanged:self];
}

- (BOOL)_alwaysShowEditAlertView
{
  v2 = objc_msgSend((id)objc_msgSend(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"), "_firstResponder"), "_keyboardResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 hasEditableSelection];
}

@end