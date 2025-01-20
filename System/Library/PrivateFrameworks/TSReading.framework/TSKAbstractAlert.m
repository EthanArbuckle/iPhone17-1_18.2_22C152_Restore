@interface TSKAbstractAlert
- (BOOL)cancelOnEnterBackground;
- (BOOL)inBackground;
- (TSKAbstractAlert)init;
- (TSKUIAlertProtocol)delegate;
- (TSKUIAlertProtocol)retainedDelegate;
- (id)buttonTitleAtIndex:(int64_t)a3;
- (id)context;
- (int64_t)addButtonWithTitle:(id)a3;
- (int64_t)cancelButtonIndex;
- (int64_t)firstOtherButtonIndex;
- (int64_t)numberOfButtons;
- (int64_t)result;
- (int64_t)showSynchronously;
- (void)_didPresentAlertView:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)clickedButtonAtIndex:(int64_t)a3;
- (void)dealloc;
- (void)didDismissWithButtonIndex:(int64_t)a3;
- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)enterBackground;
- (void)setCancelButtonIndex:(int64_t)a3;
- (void)setCancelOnEnterBackground:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRetainedDelegate:(id)a3;
- (void)show;
- (void)showAlert;
- (void)showWithClickedButtonBlock:(id)a3;
- (void)showWithDelegate:(id)a3 context:(id)a4;
- (void)showWithDismissedByButtonBlock:(id)a3;
- (void)willDismissWithButtonIndex:(int64_t)a3;
- (void)willPresentAlertView;
@end

@implementation TSKAbstractAlert

- (TSKAbstractAlert)init
{
  v7.receiver = self;
  v7.super_class = (Class)TSKAbstractAlert;
  v2 = [(TSKAbstractAlert *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_result = 0;
    v2->_cancelOnEnterBackground = 0;
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];
  v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  [(TSKAbstractAlert *)self setRetainedDelegate:0];
  id clickedBlock = self->_clickedBlock;
  if (clickedBlock) {
    _Block_release(clickedBlock);
  }
  id dismissedBlock = self->_dismissedBlock;
  if (dismissedBlock) {
    _Block_release(dismissedBlock);
  }
  v7.receiver = self;
  v7.super_class = (Class)TSKAbstractAlert;
  [(TSKAbstractAlert *)&v7 dealloc];
}

- (int64_t)addButtonWithTitle:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAbstractAlert addButtonWithTitle:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 67, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert addButtonWithTitle:]"), 0 reason userInfo]);
}

- (void)showWithDelegate:(id)a3 context:(id)a4
{
  self->_delegate = (TSKUIAlertProtocol *)a3;
  [(TSKAbstractAlert *)self setContext:a4];

  [(TSKAbstractAlert *)self show];
}

- (void)show
{
  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_inBackground = 0;
  *(_WORD *)&self->_didPresentAlertView = 0;
  v3 = self;

  [(TSKAbstractAlert *)self showAlert];
}

- (void)showWithClickedButtonBlock:(id)a3
{
  self->_id clickedBlock = _Block_copy(a3);
  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = self;

  [(TSKAbstractAlert *)self showAlert];
}

- (void)showWithDismissedByButtonBlock:(id)a3
{
  self->_id dismissedBlock = _Block_copy(a3);
  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = self;

  [(TSKAbstractAlert *)self showAlert];
}

- (int64_t)showSynchronously
{
  self->_delegate = 0;
  self->_int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_inBackground = 0;
  *(_WORD *)&self->_didPresentAlertView = 0;
  [(TSKAbstractAlert *)self setContext:0];
  [(TSKAbstractAlert *)self setCancelOnEnterBackground:1];
  v3 = self;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "applicationState") == 2) {
    [(TSKAbstractAlert *)self enterBackground];
  }
  else {
    [(TSKAbstractAlert *)self showAlert];
  }
  int64_t result = self->_result;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE88];
    do
    {
      CFRunLoopRunInMode(v5, 0.0, 1u);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "applicationState") == 2
        && self->_didPresentAlertView)
      {
        [(TSKAbstractAlert *)self enterBackground];
      }
      int64_t result = self->_result;
    }
    while (result == 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (int64_t)result
{
  return self->_result;
}

- (id)buttonTitleAtIndex:(int64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAbstractAlert buttonTitleAtIndex:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 159, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert buttonTitleAtIndex:]"), 0 reason userInfo]);
}

- (int64_t)numberOfButtons
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKAbstractAlert numberOfButtons]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 164, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert numberOfButtons]"), 0 reason userInfo]);
}

- (int64_t)cancelButtonIndex
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKAbstractAlert cancelButtonIndex]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 169, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert cancelButtonIndex]"), 0 reason userInfo]);
}

- (void)setCancelButtonIndex:(int64_t)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAbstractAlert setCancelButtonIndex:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 174, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert setCancelButtonIndex:]"), 0 reason userInfo]);
}

- (int64_t)firstOtherButtonIndex
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKAbstractAlert firstOtherButtonIndex]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 179, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert firstOtherButtonIndex]"), 0 reason userInfo]);
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSKAbstractAlert dismissWithClickedButtonIndex:animated:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 184, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert dismissWithClickedButtonIndex:animated:]"), 0 reason userInfo]);
}

- (void)clickedButtonAtIndex:(int64_t)a3
{
  if (!self->_clickedButtonAtIndex
    && (![(TSKAbstractAlert *)self inBackground]
     || [(TSKAbstractAlert *)self cancelOnEnterBackground]))
  {
    if (!self->_isDelegateRetained)
    {
      [(TSKAbstractAlert *)self setRetainedDelegate:self->_delegate];
      self->_isDelegateRetained = 1;
    }
    self->_clickedButtonAtIndex = 1;
    self->_int64_t result = a3;
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(TSKUIAlertProtocol *)self->_delegate alert:self clickedButtonAtIndex:a3 withContext:self->_context];
    }
    id clickedBlock = self->_clickedBlock;
    if (clickedBlock)
    {
      v6 = (void (*)(void))*((void *)clickedBlock + 2);
      v6();
    }
  }
}

- (void)didDismissWithButtonIndex:(int64_t)a3
{
  if (!self->_didDismissWithButtonIndex
    && (![(TSKAbstractAlert *)self inBackground]
     || [(TSKAbstractAlert *)self cancelOnEnterBackground]))
  {
    self->_didDismissWithButtonIndex = 1;
    self->_int64_t result = a3;
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(TSKUIAlertProtocol *)self->_delegate alert:self didDismissWithButtonIndex:a3 withContext:self->_context];
    }
    id dismissedBlock = (void (**)(id, TSKAbstractAlert *, int64_t))self->_dismissedBlock;
    if (dismissedBlock) {
      dismissedBlock[2](dismissedBlock, self, a3);
    }
    [(TSKAbstractAlert *)self setCancelOnEnterBackground:0];
    if (self->_isDelegateRetained)
    {
      [(TSKAbstractAlert *)self setRetainedDelegate:0];
      self->_isDelegateRetained = 0;
    }
    self->_delegate = 0;
    v6 = self;
  }
}

- (void)willDismissWithButtonIndex:(int64_t)a3
{
  if (!self->_willDismissWithButtonIndex
    && (![(TSKAbstractAlert *)self inBackground]
     || [(TSKAbstractAlert *)self cancelOnEnterBackground]))
  {
    self->_willDismissWithButtonIndex = 1;
    if (self->_inBackground)
    {
      [(TSKAbstractAlert *)self didDismissWithButtonIndex:a3];
    }
  }
}

- (void)_didPresentAlertView:(id)a3
{
  if (!self->_didPresentAlertView)
  {
    self->_didPresentAlertView = 1;
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "window"), "windowScene"), "activationState");
    if (v4 == 2 || v4 == -1)
    {
      [(TSKAbstractAlert *)self enterBackground];
    }
  }
}

- (void)willPresentAlertView
{
  if (!self->_willPresentAlertView) {
    self->_willPresentAlertView = 1;
  }
}

- (void)enterBackground
{
  if (!self->_inBackground && !self->_didDismissWithButtonIndex)
  {
    self->_inBackground = 1;
    self->_int64_t result = [(TSKAbstractAlert *)self cancelButtonIndex];
    [(TSKAbstractAlert *)self clickedButtonAtIndex:[(TSKAbstractAlert *)self cancelButtonIndex]];
    int64_t v3 = [(TSKAbstractAlert *)self cancelButtonIndex];
    [(TSKAbstractAlert *)self dismissWithClickedButtonIndex:v3 animated:0];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  if (self->_inBackground && !self->_didDismissWithButtonIndex)
  {
    self->_inBackground = 0;
    if (![(TSKAbstractAlert *)self cancelOnEnterBackground])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__TSKAbstractAlert_applicationWillEnterForeground___block_invoke;
      block[3] = &unk_2646AF7B8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __51__TSKAbstractAlert_applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAlert];
}

- (void)showAlert
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKAbstractAlert showAlert]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 329, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKAbstractAlert showAlert]"), 0 reason userInfo]);
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (BOOL)cancelOnEnterBackground
{
  return self->_cancelOnEnterBackground;
}

- (void)setCancelOnEnterBackground:(BOOL)a3
{
  self->_cancelOnEnterBackground = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TSKUIAlertProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSKUIAlertProtocol *)a3;
}

- (TSKUIAlertProtocol)retainedDelegate
{
  return self->_retainedDelegate;
}

- (void)setRetainedDelegate:(id)a3
{
}

@end