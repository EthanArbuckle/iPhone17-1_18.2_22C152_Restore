@interface TSKUIActionSheet
+ (id)alertWithTitle:(id)a3 cancelButtonTitle:(id)a4 destructiveButtonTitle:(id)a5 otherButtonTitle:(id)a6 targetView:(id)a7;
- (TSKUIActionSheet)initWithTitle:(id)a3 cancelButtonTitle:(id)a4 destructiveButtonTitle:(id)a5 otherButtonTitle:(id)a6 targetView:(id)a7;
- (id)buttonTitleAtIndex:(int64_t)a3;
- (int64_t)addButtonWithTitle:(id)a3;
- (int64_t)cancelButtonIndex;
- (int64_t)firstOtherButtonIndex;
- (int64_t)numberOfButtons;
- (void)actionSheet:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)actionSheet:(id)a3 willDismissWithButtonIndex:(int64_t)a4;
- (void)dealloc;
- (void)didPresentActionSheet:(id)a3;
- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setCancelButtonIndex:(int64_t)a3;
- (void)showAlert;
- (void)willPresentActionSheet:(id)a3;
@end

@implementation TSKUIActionSheet

+ (id)alertWithTitle:(id)a3 cancelButtonTitle:(id)a4 destructiveButtonTitle:(id)a5 otherButtonTitle:(id)a6 targetView:(id)a7
{
  v7 = [[TSKUIActionSheet alloc] initWithTitle:a3 cancelButtonTitle:a4 destructiveButtonTitle:a5 otherButtonTitle:a6 targetView:a7];
  return v7;
}

- (TSKUIActionSheet)initWithTitle:(id)a3 cancelButtonTitle:(id)a4 destructiveButtonTitle:(id)a5 otherButtonTitle:(id)a6 targetView:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TSKUIActionSheet;
  v12 = [(TSKAbstractAlert *)&v14 init];
  if (v12)
  {
    v12->_actionSheet = (UIActionSheet *)objc_msgSend(objc_alloc(MEMORY[0x263F1C3C8]), "initWithTitle:delegate:cancelButtonTitle:destructiveButtonTitle:otherButtonTitles:", a3, v12, a4, a5, a6, 0);
    v12->_targetView = (UIView *)a7;
  }
  return v12;
}

- (void)dealloc
{
  [(UIActionSheet *)self->_actionSheet setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)TSKUIActionSheet;
  [(TSKAbstractAlert *)&v3 dealloc];
}

- (void)showAlert
{
}

- (int64_t)addButtonWithTitle:(id)a3
{
  return [(UIActionSheet *)self->_actionSheet addButtonWithTitle:a3];
}

- (id)buttonTitleAtIndex:(int64_t)a3
{
  return [(UIActionSheet *)self->_actionSheet buttonTitleAtIndex:a3];
}

- (int64_t)numberOfButtons
{
  return [(UIActionSheet *)self->_actionSheet numberOfButtons];
}

- (int64_t)cancelButtonIndex
{
  return [(UIActionSheet *)self->_actionSheet cancelButtonIndex];
}

- (void)setCancelButtonIndex:(int64_t)a3
{
}

- (int64_t)firstOtherButtonIndex
{
  return [(UIActionSheet *)self->_actionSheet firstOtherButtonIndex];
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)actionSheet:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  if (self->_actionSheet != a3)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKUIActionSheet actionSheet:clickedButtonAtIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 590, @"Wrong action sheet");
  }
  [(TSKAbstractAlert *)self clickedButtonAtIndex:a4];
}

- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  if (self->_actionSheet != a3)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKUIActionSheet actionSheet:didDismissWithButtonIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 596, @"Wrong action sheet");
  }
  [(TSKAbstractAlert *)self didDismissWithButtonIndex:a4];
}

- (void)actionSheet:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
  if (self->_actionSheet != a3)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKUIActionSheet actionSheet:willDismissWithButtonIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 606, @"Wrong action sheet");
  }
  [(TSKAbstractAlert *)self willDismissWithButtonIndex:a4];
}

- (void)didPresentActionSheet:(id)a3
{
  if (self->_actionSheet != a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKUIActionSheet didPresentActionSheet:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 613, @"Wrong action sheet");
  }
  [(TSKAbstractAlert *)self _didPresentAlertView:a3];
}

- (void)willPresentActionSheet:(id)a3
{
  if (self->_actionSheet != a3)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKUIActionSheet willPresentActionSheet:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 620, @"Wrong action sheet");
  }
  [(TSKAbstractAlert *)self willPresentAlertView];
}

@end