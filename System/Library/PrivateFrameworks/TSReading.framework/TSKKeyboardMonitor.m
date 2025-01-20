@interface TSKKeyboardMonitor
+ (BOOL)keyboardIsAnimating;
+ (BOOL)keyboardIsAnimatingInOrDocking;
+ (BOOL)keyboardIsAnimatingOutOrUndocking;
+ (BOOL)keyboardIsVisibleAndDocked;
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedKeyboardMonitor;
+ (void)addKeyboardObserver:(id)a3;
+ (void)afterKeyboardAnimationPerformBlock:(id)a3;
+ (void)removeKeyboardObserver:(id)a3;
+ (void)setKeyboardHiddenByModalObserver:(id)a3;
+ (void)setModalKeyboardObserver:(id)a3;
- (BOOL)keyboardIsAnimating;
- (BOOL)keyboardIsAnimatingInOrDocking;
- (BOOL)keyboardIsAnimatingOutOrUndocking;
- (BOOL)keyboardIsVisibleAndDocked;
- (CGRect)keyboardFrame;
- (TSKKeyboardMonitor)init;
- (UIWindow)rootWindow;
- (double)keyboardAnimationDuration;
- (double)keyboardHeightInView:(id)a3;
- (double)onScreenHeight;
- (id)p_keyboardFrameView;
- (unint64_t)retainCount;
- (void)addKeyboardObserver:(id)a3;
- (void)afterKeyboardAnimationPerformBlock:(id)a3;
- (void)dealloc;
- (void)p_KeyboardDidChangeFrame:(id)a3;
- (void)p_KeyboardWillChangeFrame:(id)a3;
- (void)p_enumerateObserversUsingBlock:(id)a3;
- (void)p_installKeyboardNotifications;
- (void)p_keyboardDidHideOrUndock:(id)a3;
- (void)p_keyboardDidShowOrDock:(id)a3;
- (void)p_keyboardWillHideOrUndock:(id)a3;
- (void)p_keyboardWillShowOrDock:(id)a3;
- (void)p_performAnimationCompletionBlocksWithVisible:(BOOL)a3;
- (void)p_removeKeyboardNotifications;
- (void)p_updateKeyboardInfoFromNotification:(id)a3;
- (void)removeKeyboardObserver:(id)a3;
- (void)setKeyboardHiddenByModalObserver:(id)a3;
- (void)setModalKeyboardObserver:(id)a3;
- (void)setRootWindow:(id)a3;
@end

@implementation TSKKeyboardMonitor

+ (id)sharedKeyboardMonitor
{
  id result = (id)sharedKeyboardMonitor_sSingletonInstance;
  if (!sharedKeyboardMonitor_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedKeyboardMonitor_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedKeyboardMonitor_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSKKeyboardMonitor sharedKeyboardMonitor]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 188, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)sharedKeyboardMonitor_sSingletonInstance;
  }
  return result;
}

- (TSKKeyboardMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSKKeyboardMonitor;
  v2 = [(TSKKeyboardMonitor *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_keyboardIsVisibleAndDocked = 0;
    [(TSKKeyboardMonitor *)v2 p_installKeyboardNotifications];
  }
  return v3;
}

- (void)p_installKeyboardNotifications
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_p_keyboardWillShowOrDock_ name:*MEMORY[0x263F1D488] object:0];
  [v3 addObserver:self selector:sel_p_keyboardDidShowOrDock_ name:*MEMORY[0x263F1D418] object:0];
  [v3 addObserver:self selector:sel_p_keyboardWillHideOrUndock_ name:*MEMORY[0x263F1D480] object:0];
  [v3 addObserver:self selector:sel_p_keyboardDidHideOrUndock_ name:*MEMORY[0x263F1D410] object:0];
  [v3 addObserver:self selector:sel_p_KeyboardWillChangeFrame_ name:*MEMORY[0x263F1D478] object:0];
  uint64_t v4 = *MEMORY[0x263F1D408];

  [v3 addObserver:self selector:sel_p_KeyboardDidChangeFrame_ name:v4 object:0];
}

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSKKeyboardMonitor;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

- (BOOL)keyboardIsAnimating
{
  return self->_keyboardIsAnimatingInOrDocking || self->_keyboardIsAnimatingOutOrUndocking;
}

- (void)dealloc
{
  [(TSKKeyboardMonitor *)self p_removeKeyboardNotifications];
  keyboardObservers = self->_keyboardObservers;
  if (keyboardObservers)
  {
    CFRelease(keyboardObservers);
    self->_keyboardObservers = 0;
  }

  self->_completionBlocks = 0;
  if (self->_exclusiveKeyboardObserver)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKKeyboardMonitor dealloc]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 123, @"expected nil value for '%s'", "_exclusiveKeyboardObserver");
  }
  v6.receiver = self;
  v6.super_class = (Class)TSKKeyboardMonitor;
  [(TSKKeyboardMonitor *)&v6 dealloc];
}

- (void)setRootWindow:(id)a3
{
  self->_rootWindow = (UIWindow *)a3;
}

- (void)addKeyboardObserver:(id)a3
{
  keyboardObservers = self->_keyboardObservers;
  if (!keyboardObservers)
  {
    keyboardObservers = CFArrayCreateMutable(0, 0, 0);
    self->_keyboardObservers = keyboardObservers;
  }
  if (([(__CFArray *)keyboardObservers containsObject:a3] & 1) == 0)
  {
    objc_super v6 = self->_keyboardObservers;
    [(__CFArray *)v6 addObject:a3];
  }
}

- (void)removeKeyboardObserver:(id)a3
{
  keyboardObservers = self->_keyboardObservers;
  if (keyboardObservers)
  {
    [(__CFArray *)self->_keyboardObservers removeObject:a3];
    if (![(__CFArray *)keyboardObservers count])
    {
      CFRelease(self->_keyboardObservers);
      self->_keyboardObservers = 0;
    }
  }
}

- (void)setModalKeyboardObserver:(id)a3
{
  if (a3 && self->_exclusiveKeyboardObserver)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKKeyboardMonitor setModalKeyboardObserver:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 163, @"setModalKeyboardObserver is in a bad state.");
  }
  self->_exclusiveKeyboardObserver = (TSKKeyboardObserver *)a3;
}

- (void)setKeyboardHiddenByModalObserver:(id)a3
{
  if (self->_exclusiveKeyboardObserver != a3)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKKeyboardMonitor setKeyboardHiddenByModalObserver:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 170, @"setKeyboardHiddenByModalObserver - called by a non exclusive observer.");
  }
  *(_WORD *)&self->_keyboardIsVisibleAndDocked = 0;
  self->_keyboardIsAnimatingOutOrUndocking = 0;
}

- (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  completionBlocks = self->_completionBlocks;
  if (!completionBlocks)
  {
    completionBlocks = (NSMutableArray *)objc_opt_new();
    self->_completionBlocks = completionBlocks;
  }
  id v6 = (id)[a3 copy];

  [(NSMutableArray *)completionBlocks addObject:v6];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSKKeyboardMonitor allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 188, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

+ (void)addKeyboardObserver:(id)a3
{
  uint64_t v4 = (void *)[a1 sharedKeyboardMonitor];

  [v4 addKeyboardObserver:a3];
}

+ (void)removeKeyboardObserver:(id)a3
{
  uint64_t v4 = (void *)[a1 sharedKeyboardMonitor];

  [v4 removeKeyboardObserver:a3];
}

+ (void)setModalKeyboardObserver:(id)a3
{
  uint64_t v4 = (void *)[a1 sharedKeyboardMonitor];

  [v4 setModalKeyboardObserver:a3];
}

+ (void)setKeyboardHiddenByModalObserver:(id)a3
{
  uint64_t v4 = (void *)[a1 sharedKeyboardMonitor];

  [v4 setKeyboardHiddenByModalObserver:a3];
}

+ (BOOL)keyboardIsVisibleAndDocked
{
  v2 = (void *)[a1 sharedKeyboardMonitor];

  return [v2 keyboardIsVisibleAndDocked];
}

+ (BOOL)keyboardIsAnimating
{
  v2 = (void *)[a1 sharedKeyboardMonitor];

  return [v2 keyboardIsAnimating];
}

+ (BOOL)keyboardIsAnimatingInOrDocking
{
  v2 = (void *)[a1 sharedKeyboardMonitor];

  return [v2 keyboardIsAnimatingInOrDocking];
}

+ (BOOL)keyboardIsAnimatingOutOrUndocking
{
  v2 = (void *)[a1 sharedKeyboardMonitor];

  return [v2 keyboardIsAnimatingOutOrUndocking];
}

+ (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  uint64_t v4 = (void *)[a1 sharedKeyboardMonitor];

  [v4 afterKeyboardAnimationPerformBlock:a3];
}

- (double)keyboardHeightInView:(id)a3
{
  id v5 = [(TSKKeyboardMonitor *)self p_keyboardFrameView];
  [(TSKKeyboardMonitor *)self keyboardFrame];
  if (v9 <= 0.0) {
    return 0.0;
  }
  objc_msgSend((id)objc_msgSend(a3, "superview"), "convertRect:fromView:", v5, v6, v7, v8, v9);
  double v11 = v10;
  [a3 frame];
  return fmax(v12 - v11, 0.0);
}

- (id)p_keyboardFrameView
{
  if (!objc_msgSend((id)-[UIWindow subviews](self->_rootWindow, "subviews"), "count")
    || (id result = (id)objc_msgSend((id)-[UIWindow subviews](self->_rootWindow, "subviews"), "objectAtIndex:", 0)) == 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F1C408] sharedApplication];
    return (id)[v4 keyWindow];
  }
  return result;
}

- (void)p_updateKeyboardInfoFromNotification:(id)a3
{
  objc_opt_class();
  id v5 = (void *)[a3 userInfo];
  [v5 objectForKey:*MEMORY[0x263F1D428]];
  uint64_t v6 = TSUDynamicCast();
  if (v6)
  {
    double v7 = (void *)v6;
    id v8 = [(TSKKeyboardMonitor *)self p_keyboardFrameView];
    if (!v8)
    {
      double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 289, @"Can't calculate keyboard bounds without a root view.");
    }
    [v7 CGRectValue];
    objc_msgSend(v8, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v11;
    self->_keyboardFrame.origin.y = v12;
    self->_keyboardFrame.size.width = v13;
    self->_keyboardFrame.size.height = v14;
    [(UIWindow *)self->_rootWindow frame];
    objc_msgSend(v8, "convertRect:fromView:", 0);
    self->_onScreenHeight = v15 - self->_keyboardFrame.origin.y;
  }
  v16 = (void *)[a3 userInfo];
  objc_msgSend((id)objc_msgSend(v16, "objectForKey:", *MEMORY[0x263F1D3F8]), "doubleValue");
  self->_keyboardAnimationDuration = v17;
}

- (void)p_performAnimationCompletionBlocksWithVisible:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  completionBlocks = self->_completionBlocks;
  uint64_t v6 = [(NSMutableArray *)completionBlocks countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    double v9 = MEMORY[0x263EF83A0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(completionBlocks);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __68__TSKKeyboardMonitor_p_performAnimationCompletionBlocksWithVisible___block_invoke;
        v12[3] = &unk_2646B0AD0;
        v12[4] = v11;
        BOOL v13 = a3;
        dispatch_async(v9, v12);
      }
      uint64_t v7 = [(NSMutableArray *)completionBlocks countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  self->_completionBlocks = 0;
}

uint64_t __68__TSKKeyboardMonitor_p_performAnimationCompletionBlocksWithVisible___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)p_removeKeyboardNotifications
{
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v3 removeObserver:self];
}

- (void)p_enumerateObserversUsingBlock:(id)a3
{
  if (self->_exclusiveKeyboardObserver)
  {
    CFArrayRef Copy = CFArrayCreate(0, (const void **)&self->_exclusiveKeyboardObserver, 1, 0);
  }
  else
  {
    keyboardObservers = self->_keyboardObservers;
    if (!keyboardObservers) {
      return;
    }
    CFArrayRef Copy = CFArrayCreateCopy(0, keyboardObservers);
  }
  CFArrayRef v6 = Copy;
  [(__CFArray *)Copy enumerateObjectsUsingBlock:a3];

  CFRelease(v6);
}

- (void)p_keyboardWillShowOrDock:(id)a3
{
  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  if (fabs(self->_keyboardFrame.size.width) >= 0.00999999978 && fabs(self->_keyboardFrame.size.height) >= 0.00999999978)
  {
    if (self->_keyboardIsAnimatingOutOrUndocking)
    {
      self->_keyboardIsAnimatingOutOrUndocking = 0;
      [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:&__block_literal_global_13];
    }
    *(_WORD *)&self->_keyboardIsVisibleAndDocked = 257;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__TSKKeyboardMonitor_p_keyboardWillShowOrDock___block_invoke_2;
    v5[3] = &unk_2646B0B18;
    v5[4] = a3;
    [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:v5];
  }
  else
  {
    self->_weAreFakingAHideEvent = 1;
    if (self->_keyboardIsVisibleAndDocked)
    {
      [(TSKKeyboardMonitor *)self p_keyboardWillHideOrUndock:a3];
    }
    else
    {
      self->_suppressDidHide = 1;
    }
  }
}

uint64_t __47__TSKKeyboardMonitor_p_keyboardWillShowOrDock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a2 keyboardHideCanceled];
  }
  return result;
}

uint64_t __47__TSKKeyboardMonitor_p_keyboardWillShowOrDock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 keyboardWillShowOrDock:v5];
  }
  return result;
}

- (void)p_keyboardDidShowOrDock:(id)a3
{
  if (self->_weAreFakingAHideEvent)
  {
    if (!self->_suppressDidHide) {
      [(TSKKeyboardMonitor *)self p_keyboardDidHideOrUndock:a3];
    }
    *(_WORD *)&self->_weAreFakingAHideEvent = 256;
    self->_suppressDidHide = 0;
  }
  else if (self->_keyboardIsAnimatingInOrDocking)
  {
    [(TSKKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:a3];
    self->_keyboardIsAnimatingInOrDocking = 0;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__TSKKeyboardMonitor_p_keyboardDidShowOrDock___block_invoke;
    v5[3] = &unk_2646B0B18;
    v5[4] = a3;
    [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:v5];
    [(TSKKeyboardMonitor *)self p_performAnimationCompletionBlocksWithVisible:1];
  }
}

uint64_t __46__TSKKeyboardMonitor_p_keyboardDidShowOrDock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 keyboardDidShowOrDock:v5];
  }
  return result;
}

- (void)p_keyboardWillHideOrUndock:(id)a3
{
  self->_suppressDidHide = 0;
  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  if (self->_keyboardIsAnimatingInOrDocking)
  {
    self->_keyboardIsAnimatingInOrDocking = 0;
    [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:&__block_literal_global_52];
  }
  if (self->_keyboardIsVisibleAndDocked || !self->_lastHideWasFake)
  {
    self->_keyboardIsVisibleAndDocked = 0;
    self->_keyboardIsAnimatingOutOrUndocking = 1;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__TSKKeyboardMonitor_p_keyboardWillHideOrUndock___block_invoke_2;
    v5[3] = &unk_2646B0B18;
    v5[4] = a3;
    [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:v5];
  }
}

uint64_t __49__TSKKeyboardMonitor_p_keyboardWillHideOrUndock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a2 keyboardShowCanceled];
  }
  return result;
}

uint64_t __49__TSKKeyboardMonitor_p_keyboardWillHideOrUndock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 keyboardWillHideOrUndock:v5];
  }
  return result;
}

- (void)p_keyboardDidHideOrUndock:(id)a3
{
  if (self->_keyboardIsAnimatingOutOrUndocking)
  {
    -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
    self->_keyboardIsAnimatingOutOrUndocking = 0;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__TSKKeyboardMonitor_p_keyboardDidHideOrUndock___block_invoke;
    v5[3] = &unk_2646B0B18;
    v5[4] = a3;
    [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:v5];
    [(TSKKeyboardMonitor *)self p_performAnimationCompletionBlocksWithVisible:0];
    self->_lastHideWasFake = 0;
  }
}

uint64_t __48__TSKKeyboardMonitor_p_keyboardDidHideOrUndock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 keyboardDidHideOrUndock:v5];
  }
  return result;
}

- (void)p_KeyboardWillChangeFrame:(id)a3
{
  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__TSKKeyboardMonitor_p_KeyboardWillChangeFrame___block_invoke;
  v5[3] = &unk_2646B0B18;
  v5[4] = a3;
  [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:v5];
}

uint64_t __48__TSKKeyboardMonitor_p_KeyboardWillChangeFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 keyboardWillChangeFrame:v5];
  }
  return result;
}

- (void)p_KeyboardDidChangeFrame:(id)a3
{
  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__TSKKeyboardMonitor_p_KeyboardDidChangeFrame___block_invoke;
  v5[3] = &unk_2646B0B18;
  v5[4] = a3;
  [(TSKKeyboardMonitor *)self p_enumerateObserversUsingBlock:v5];
}

uint64_t __47__TSKKeyboardMonitor_p_KeyboardDidChangeFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 keyboardDidChangeFrame:v5];
  }
  return result;
}

- (UIWindow)rootWindow
{
  return self->_rootWindow;
}

- (BOOL)keyboardIsVisibleAndDocked
{
  return self->_keyboardIsVisibleAndDocked;
}

- (BOOL)keyboardIsAnimatingInOrDocking
{
  return self->_keyboardIsAnimatingInOrDocking;
}

- (BOOL)keyboardIsAnimatingOutOrUndocking
{
  return self->_keyboardIsAnimatingOutOrUndocking;
}

- (CGRect)keyboardFrame
{
  objc_copyStruct(v6, &self->_keyboardFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)onScreenHeight
{
  return self->_onScreenHeight;
}

- (double)keyboardAnimationDuration
{
  return self->_keyboardAnimationDuration;
}

@end