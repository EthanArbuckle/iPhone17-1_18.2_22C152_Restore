@interface TSWPEffectsWindow
+ (id)sharedEffectsWindowAboveStatusBar;
+ (id)sharedEffectsWindowAboveStatusBarForView:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (TSWPEffectsWindow)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)pDidChangeStatusBarOrientation:(id)a3;
- (void)p_updateForOrientation:(int64_t)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation TSWPEffectsWindow

- (TSWPEffectsWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPEffectsWindow;
  v3 = -[TSWPEffectsWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CAC8]), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    v3->_dummyToReclaimFirstResponder = v4;
    [(UITextView *)v4 setHidden:1];
    [(TSWPEffectsWindow *)v3 addSubview:v3->_dummyToReclaimFirstResponder];
    v3->_readyToGo = 1;
  }
  return v3;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(UITextView *)self->_dummyToReclaimFirstResponder removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)TSWPEffectsWindow;
  [(TSWPEffectsWindow *)&v3 dealloc];
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPEffectsWindow;
  [(TSWPEffectsWindow *)&v4 didAddSubview:a3];
  if (self->_readyToGo)
  {
    if (!self->_activeEffectsCount || [(TSWPEffectsWindow *)self isHidden]) {
      [(TSWPEffectsWindow *)self setHidden:0];
    }
    ++self->_activeEffectsCount;
  }
}

- (void)willRemoveSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPEffectsWindow;
  -[TSWPEffectsWindow willRemoveSubview:](&v6, sel_willRemoveSubview_);
  if (self->_readyToGo)
  {
    unsigned int v5 = self->_activeEffectsCount - 1;
    self->_activeEffectsCount = v5;
    if (!v5) {
      [(TSWPEffectsWindow *)self setHidden:1];
    }
    objc_opt_class();
    TSUFindFirstResponderView();
    if ([(id)TSUDynamicCast() isDescendantOfView:a3])
    {
      [(UITextView *)self->_dummyToReclaimFirstResponder becomeFirstResponder];
      [(UITextView *)self->_dummyToReclaimFirstResponder resignFirstResponder];
    }
  }
}

- (void)p_updateForOrientation:(int64_t)a3
{
  [(TSWPEffectsWindow *)self _setWindowInterfaceOrientation:a3];

  [(TSWPEffectsWindow *)self _updateTransformLayer];
}

+ (id)sharedEffectsWindowAboveStatusBar
{
  v2 = (void *)sEffectsWindowAboveStatusBar;
  if (!sEffectsWindowAboveStatusBar)
  {
    objc_super v3 = [TSWPEffectsWindow alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    sEffectsWindowAboveStatusBar = -[TSWPEffectsWindow initWithFrame:](v3, "initWithFrame:");
    [(id)sEffectsWindowAboveStatusBar setUserInteractionEnabled:1];
    [(id)sEffectsWindowAboveStatusBar setWindowLevel:*MEMORY[0x263F1D820] + 1.0];
    [(id)sEffectsWindowAboveStatusBar setAutoresizesSubviews:0];
    v2 = (void *)sEffectsWindowAboveStatusBar;
  }
  objc_msgSend(v2, "p_updateForOrientation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation"));
  uint64_t v4 = [MEMORY[0x263F1C550] clearColor];
  [(id)sEffectsWindowAboveStatusBar setBackgroundColor:v4];
  return (id)sEffectsWindowAboveStatusBar;
}

+ (id)sharedEffectsWindowAboveStatusBarForView:(id)a3
{
  if (!a3)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEffectsWindow.mm"), 160, @"invalid nil value for '%s'", "view");
  }
  objc_super v6 = objc_msgSend((id)objc_msgSend(a3, "window"), "windowScene");
  if (!v6)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEffectsWindow.mm"), 164, @"invalid nil value for '%s'", "viewScene");
  }
  AssociatedObject = (TSWPEffectsWindow *)objc_getAssociatedObject(v6, (const void *)kTSWPEffectsWindow);
  if (!AssociatedObject)
  {
    v10 = [TSWPEffectsWindow alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    AssociatedObject = -[TSWPEffectsWindow initWithFrame:](v10, "initWithFrame:");
    [(TSWPEffectsWindow *)AssociatedObject setUserInteractionEnabled:1];
    [(TSWPEffectsWindow *)AssociatedObject setWindowLevel:*MEMORY[0x263F1D820] + 1.0];
    [(TSWPEffectsWindow *)AssociatedObject setAutoresizesSubviews:0];
    [(TSWPEffectsWindow *)AssociatedObject setWindowScene:v6];
    objc_setAssociatedObject(v6, (const void *)kTSWPEffectsWindow, AssociatedObject, (void *)1);
  }
  -[TSWPEffectsWindow p_updateForOrientation:](AssociatedObject, "p_updateForOrientation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation"));
  -[TSWPEffectsWindow setBackgroundColor:](AssociatedObject, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  return AssociatedObject;
}

- (void)pDidChangeStatusBarOrientation:(id)a3
{
  objc_super v3 = (void *)sEffectsWindowAboveStatusBar;
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3), "keyWindow"), "windowScene"), "interfaceOrientation");

  objc_msgSend(v3, "p_updateForOrientation:", v4);
}

@end