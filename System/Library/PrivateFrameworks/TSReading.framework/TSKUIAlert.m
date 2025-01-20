@interface TSKUIAlert
+ (id)alertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6;
+ (void)setUseMockUIAlert:(BOOL)a3;
- (TSKUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6;
- (TSKUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 otherOtherButtonTitle:(id)a7;
- (id)buttonTitleAtIndex:(int64_t)a3;
- (int64_t)addButtonWithTitle:(id)a3;
- (int64_t)cancelButtonIndex;
- (int64_t)firstOtherButtonIndex;
- (int64_t)numberOfButtons;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4;
- (void)dealloc;
- (void)didPresentAlertView:(id)a3;
- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setCancelButtonIndex:(int64_t)a3;
- (void)showAlert;
- (void)willPresentAlertView:(id)a3;
@end

@implementation TSKUIAlert

+ (void)setUseMockUIAlert:(BOOL)a3
{
  gUseMockUIAlert = a3;
}

+ (id)alertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6
{
  if (gUseMockUIAlert) {
    v6 = off_2646AE5D8;
  }
  else {
    v6 = off_2646AE6A8;
  }
  v7 = (void *)[objc_alloc(*v6) initWithTitle:a3 message:a4 cancelButtonTitle:a5 otherButtonTitle:a6];

  return v7;
}

- (TSKUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)TSKUIAlert;
  v10 = [(TSKAbstractAlert *)&v12 init];
  if (v10) {
    v10->_alertView = (UIAlertView *)objc_msgSend(objc_alloc(MEMORY[0x263F1C400]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a3, a4, v10, a5, a6, 0);
  }
  return v10;
}

- (TSKUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 otherOtherButtonTitle:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TSKUIAlert;
  objc_super v12 = [(TSKAbstractAlert *)&v14 init];
  if (v12) {
    v12->_alertView = (UIAlertView *)objc_msgSend(objc_alloc(MEMORY[0x263F1C400]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a3, a4, v12, a5, a6, a7, 0);
  }
  return v12;
}

- (void)dealloc
{
  [(UIAlertView *)self->_alertView setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)TSKUIAlert;
  [(TSKAbstractAlert *)&v3 dealloc];
}

- (void)showAlert
{
}

- (int64_t)addButtonWithTitle:(id)a3
{
  return [(UIAlertView *)self->_alertView addButtonWithTitle:a3];
}

- (id)buttonTitleAtIndex:(int64_t)a3
{
  return [(UIAlertView *)self->_alertView buttonTitleAtIndex:a3];
}

- (int64_t)numberOfButtons
{
  return [(UIAlertView *)self->_alertView numberOfButtons];
}

- (int64_t)cancelButtonIndex
{
  return [(UIAlertView *)self->_alertView cancelButtonIndex];
}

- (void)setCancelButtonIndex:(int64_t)a3
{
}

- (int64_t)firstOtherButtonIndex
{
  return [(UIAlertView *)self->_alertView firstOtherButtonIndex];
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  [(UIAlertView *)self->_alertView dismissWithClickedButtonIndex:a3 animated:a4];
  if (self->super._inBackground)
  {
    [(TSKUIAlert *)self alertView:self->_alertView willDismissWithButtonIndex:a3];
    alertView = self->_alertView;
    [(TSKUIAlert *)self alertView:alertView didDismissWithButtonIndex:a3];
  }
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  if (self->_alertView != a3)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKUIAlert alertView:clickedButtonAtIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 465, @"Wrong alert view");
  }

  [(TSKAbstractAlert *)self clickedButtonAtIndex:a4];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  if (self->_alertView != a3)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKUIAlert alertView:didDismissWithButtonIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 471, @"Wrong alert view");
  }

  [(TSKAbstractAlert *)self didDismissWithButtonIndex:a4];
}

- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
  if (self->_alertView != a3)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKUIAlert alertView:willDismissWithButtonIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 481, @"Wrong alert view");
  }

  [(TSKAbstractAlert *)self willDismissWithButtonIndex:a4];
}

- (void)didPresentAlertView:(id)a3
{
  if (self->_alertView != a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKUIAlert didPresentAlertView:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 488, @"Wrong alert view");
  }

  [(TSKAbstractAlert *)self _didPresentAlertView:a3];
}

- (void)willPresentAlertView:(id)a3
{
  if (self->_alertView != a3)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKUIAlert willPresentAlertView:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 495, @"Wrong alert view");
  }

  [(TSKAbstractAlert *)self willPresentAlertView];
}

@end