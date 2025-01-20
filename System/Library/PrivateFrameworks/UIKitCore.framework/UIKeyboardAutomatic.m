@interface UIKeyboardAutomatic
+ (id)activeInstance;
+ (id)sharedInstance;
- (BOOL)_isAutomaticKeyboard;
- (BOOL)isActive;
- (BOOL)isAutomatic;
- (BOOL)receivedCandidatesInCurrentInputMode;
- (BOOL)showsCandidateBar;
- (BOOL)showsCandidateInline;
- (UIKeyboardAutomatic)initWithFrame:(CGRect)a3;
- (UIPeripheralAnimationGeometry)geometryForHeightDelta:(SEL)a3;
- (UITextCursorAssertion)blinkAssertion;
- (_UIStringAndPositionPair)lastMatchedSupplementalCandidate;
- (_UIStringAndPositionPair)pendingSupplementalCandidateToInsert;
- (unint64_t)lastChooseSupplementalItemToInsertCallbackIdentifier;
- (void)activate;
- (void)dealloc;
- (void)didSuspend:(id)a3;
- (void)implBoundsHeightChangeDone:(double)a3 suppressNotification:(BOOL)a4;
- (void)maximize;
- (void)minimize;
- (void)prepareForImplBoundsHeightChange:(double)a3 suppressNotification:(BOOL)a4;
- (void)setBlinkAssertion:(id)a3;
- (void)setLastChooseSupplementalItemToInsertCallbackIdentifier:(unint64_t)a3;
- (void)setLastMatchedSupplementalCandidate:(id)a3;
- (void)setPendingSupplementalCandidateToInsert:(id)a3;
- (void)setReceivedCandidatesInCurrentInputMode:(BOOL)a3;
- (void)setShowsCandidateBar:(BOOL)a3;
- (void)setShowsCandidateInline:(BOOL)a3;
- (void)willResume:(id)a3;
@end

@implementation UIKeyboardAutomatic

+ (id)activeInstance
{
  return (id)_MergedGlobals_7_12;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__UIKeyboardAutomatic_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25D6E8 != -1) {
    dispatch_once(&qword_1EB25D6E8, block);
  }
  v2 = (void *)_MergedGlobals_7_12;
  return v2;
}

void __37__UIKeyboardAutomatic_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v2 = objc_msgSend(v1, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = (void *)_MergedGlobals_7_12;
  _MergedGlobals_7_12 = v2;
}

- (UIKeyboardAutomatic)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardAutomatic;
  v3 = -[UIKeyboard initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v4 addObserver:v3 selector:sel_didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationWillEnterForegroundNotification";
  v6[1] = @"UIApplicationDidEnterBackgroundNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardAutomatic;
  [(UIKeyboard *)&v5 dealloc];
}

- (void)minimize
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 minimize];
}

- (void)maximize
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 maximize];
}

- (BOOL)isActive
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardAutomatic;
  if (![(UIKeyboard *)&v6 isActive]) {
    return 0;
  }
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v3 = [v2 responder];
  if (v3) {
    char v4 = 1;
  }
  else {
    char v4 = UIKeyboardAutomaticIsOnScreen();
  }

  return v4;
}

- (BOOL)isAutomatic
{
  return 1;
}

- (UIPeripheralAnimationGeometry)geometryForHeightDelta:(SEL)a3
{
  id v27 = +[UIPeripheralHost sharedInstance];
  retstr->outPosition = 0u;
  retstr->inPosition = 0u;
  retstr->bounds.origin = 0u;
  retstr->bounds.size = 0u;
  *(_OWORD *)&retstr->transform.a = 0u;
  *(_OWORD *)&retstr->transform.c = 0u;
  *(_OWORD *)&retstr->transform.tx = 0u;
  retstr->targetFrameHeightDelta = 0.0;
  int64_t v7 = [(UIView *)self _keyboardOrientation];
  retstr->bounds.origin.x = 0.0;
  retstr->bounds.origin.y = 0.0;
  +[UIKeyboard sizeForInterfaceOrientation:v7];
  double v9 = v8;
  double v11 = v10;
  retstr->bounds.size.width = v8;
  retstr->bounds.size.height = v10;
  v12 = [v27 inputViews];
  v13 = [v12 inputAccessoryView];

  if (v13)
  {
    v14 = [v27 inputViews];
    v15 = [v14 inputAccessoryView];
    [v15 frame];
    double v11 = v11 + v16;
    retstr->bounds.size.height = v11;
  }
  v17 = [v27 containerWindow];
  [v17 bounds];
  double v19 = v18;

  CGFloat v20 = v9 * 0.5;
  double v21 = v19 - v11 * 0.5;
  retstr->inPosition.x = v20;
  retstr->inPosition.y = v21;
  retstr->outPosition.x = v20;
  retstr->outPosition.y = v21 + a4;
  if ([(UIKeyboard *)self isMinimized])
  {
    retstr->inPosition.y = v11 + v21;
    retstr->outPosition.y = v11 + v21 + a4;
  }
  if ([v27 isUndocked])
  {
    [v27 adjustedPersistentOffset];
    CGAffineTransformMakeTranslation(&retstr->transform, v22, v23);
  }
  else
  {
    uint64_t v24 = MEMORY[0x1E4F1DAB8];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->transform.c = v25;
    *(_OWORD *)&retstr->transform.tx = *(_OWORD *)(v24 + 32);
  }
  retstr->targetFrameHeightDelta = a4;

  return result;
}

- (void)prepareForImplBoundsHeightChange:(double)a3 suppressNotification:(BOOL)a4
{
  if (!a4)
  {
    objc_super v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    int64_t v7 = [v6 inputViews];
    CGFloat v8 = [v7 inputView];

    if (v8)
    {
      uint64_t v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
      [(UIKeyboardAutomatic *)self geometryForHeightDelta:a3];
      double v9 = +[UIPeripheralHost sharedInstance];
      v10[4] = v16;
      v10[5] = v17;
      v10[6] = v18;
      uint64_t v11 = v19;
      v10[0] = v12;
      v10[1] = v13;
      v10[2] = v14;
      v10[3] = v15;
      [v9 postWillShowNotificationForGeometry:v10 duration:0.0];
    }
  }
}

- (void)implBoundsHeightChangeDone:(double)a3 suppressNotification:(BOOL)a4
{
  int64_t v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  CGFloat v8 = [v7 inputViews];
  double v9 = [v8 inputView];

  if (v9)
  {
    self->super.m_respondingToImplGeometryChange = 1;
    [(UIView *)self frame];
    -[UIKeyboard setFrame:](self, "setFrame:");
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    [(UIKeyboardAutomatic *)self geometryForHeightDelta:a3];
    self->super.m_respondingToImplGeometryChange = 0;
    if (!a4)
    {
      CGFloat v10 = +[UIPeripheralHost sharedInstance];
      v11[4] = v17;
      v11[5] = v18;
      v11[6] = v19;
      uint64_t v12 = v20;
      v11[0] = v13;
      v11[1] = v14;
      v11[2] = v15;
      v11[3] = v16;
      [v10 postDidShowNotificationForGeometry:v11];
    }
  }
}

- (void)willResume:(id)a3
{
  id v30 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v4 = +[UIKeyboard activeKeyboard];
  if (v4 != self)
  {

LABEL_3:
    if (+[UIKeyboard usesInputSystemUI])
    {
      objc_super v5 = +[UIKeyboard activeKeyboard];

      if (v5 == self) {
        [(UIKeyboardAutomatic *)self activate];
      }
    }
    goto LABEL_20;
  }
  objc_super v6 = [(UIKeyboard *)self window];

  if (!v6) {
    goto LABEL_3;
  }
  int64_t v7 = +[UIKeyboardImpl activeInstance];
  +[UIKeyboardImpl suppressSetPersistentOffset:1];
  if (v7)
  {
    [v7 size];
    double v9 = v8;
    double v11 = v10;
    [(UIView *)self frame];
    if (v9 != v13 || v11 != v12)
    {
      [v7 size];
      long long v15 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");
      [(UIKeyboard *)self _didChangeKeyplaneWithContext:v15];
    }
  }
  [(UIKeyboardAutomatic *)self activate];
  long long v16 = +[UIPeripheralHost sharedInstance];
  long long v17 = [v30 responder];
  if ([v17 _requiresKeyboardWhenFirstResponder])
  {
    [v30 updateRenderConfigForCurrentResponder];
    long long v18 = +[UIKeyboardImpl activeInstance];

    objc_msgSend(v18, "setReceivedCandidatesInCurrentInputMode:", -[UIKeyboardAutomatic receivedCandidatesInCurrentInputMode](self, "receivedCandidatesInCurrentInputMode"));
    objc_msgSend(v18, "setShowsCandidateBar:", -[UIKeyboardAutomatic showsCandidateBar](self, "showsCandidateBar"));
    objc_msgSend(v18, "setShowsCandidateInline:", -[UIKeyboardAutomatic showsCandidateInline](self, "showsCandidateInline"));
    [v18 setDelegate:0];
    long long v19 = [v17 _keyboardResponder];
    [v18 setDelegate:v19];

    if ([v18 _shouldSuppressSoftwareKeyboard]) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = [v18 _shouldMinimizeForHardwareKeyboard];
    }
    [(UIKeyboard *)self setMinimized:v20];
    [v16 moveToPersistentOffset];
    objc_msgSend(v16, "setKeyboardOnScreenNotifyKey:", -[UIKeyboard isMinimized](self, "isMinimized") ^ 1);
    double v21 = +[UIKeyboardInputModeController sharedInputModeController];
    [v21 _trackInputModeIfNecessary:v17];

    CGFloat v22 = [(UIKeyboardAutomatic *)self lastMatchedSupplementalCandidate];
    [v18 setLastMatchedSupplementalCandidate:v22];

    CGFloat v23 = [(UIKeyboardAutomatic *)self pendingSupplementalCandidateToInsert];
    [v18 setPendingSupplementalCandidateToInsert:v23];

    objc_msgSend(v18, "setLastChooseSupplementalItemToInsertCallbackIdentifier:", -[UIKeyboardAutomatic lastChooseSupplementalItemToInsertCallbackIdentifier](self, "lastChooseSupplementalItemToInsertCallbackIdentifier"));
  }
  else
  {
    [v30 forceOrderOutAutomaticExceptAccessoryView];
    long long v18 = v7;
  }
  +[UIKeyboardImpl suppressSetPersistentOffset:0];
  [v30 _updateContainerWindowLevel];

LABEL_20:
  if ([(UIKeyboard *)self isMinimized])
  {
    uint64_t v24 = +[UIKeyboardImpl activeInstance];
    if (v24)
    {
      long long v25 = (void *)v24;
      v26 = +[UIKeyboardImpl activeInstance];
      if ([v26 _shouldSuppressSoftwareKeyboard])
      {
      }
      else
      {
        id v27 = +[UIKeyboardImpl activeInstance];
        char v28 = [v27 _shouldMinimizeForHardwareKeyboard];

        if ((v28 & 1) == 0)
        {
          self->super.m_minimized = 0;
          [v30 maximizeWithAnimation:0];
        }
      }
    }
  }
  v29 = [(UIKeyboardAutomatic *)self blinkAssertion];
  [v29 invalidate];

  [(UIKeyboardAutomatic *)self setBlinkAssertion:0];
}

- (void)didSuspend:(id)a3
{
  id v9 = +[UIKeyboardImpl activeInstance];
  -[UIKeyboardAutomatic setReceivedCandidatesInCurrentInputMode:](self, "setReceivedCandidatesInCurrentInputMode:", [v9 receivedCandidatesInCurrentInputMode]);
  -[UIKeyboardAutomatic setShowsCandidateBar:](self, "setShowsCandidateBar:", [v9 showsCandidateBar]);
  -[UIKeyboardAutomatic setShowsCandidateInline:](self, "setShowsCandidateInline:", [v9 showsCandidateInline]);
  char v4 = [v9 lastMatchedSupplementalCandidate];
  [(UIKeyboardAutomatic *)self setLastMatchedSupplementalCandidate:v4];

  objc_super v5 = [v9 pendingSupplementalCandidateToInsert];
  [(UIKeyboardAutomatic *)self setPendingSupplementalCandidateToInsert:v5];

  -[UIKeyboardAutomatic setLastChooseSupplementalItemToInsertCallbackIdentifier:](self, "setLastChooseSupplementalItemToInsertCallbackIdentifier:", [v9 lastChooseSupplementalItemToInsertCallbackIdentifier]);
  if ([v9 caretBlinks])
  {
    objc_super v6 = [v9 _activeAssertionController];
    int64_t v7 = [v6 nonBlinkingAssertionWithReason:@"UIKeyboardAutomatic Suspend/Resume"];
    [(UIKeyboardAutomatic *)self setBlinkAssertion:v7];
  }
  double v8 = +[UIPeripheralHost sharedInstance];
  [v8 setKeyboardOnScreenNotifyKey:0];
}

- (BOOL)_isAutomaticKeyboard
{
  return 1;
}

- (void)activate
{
  v3 = +[UIKeyboard activeKeyboard];
  if (v3 && ![(UIKeyboardAutomatic *)self isActive])
  {
    char v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    int v5 = [v4 automaticAppearanceReallyEnabled];

    if (!v5) {
      return;
    }
  }
  else
  {
  }
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardAutomatic;
  [(UIKeyboard *)&v6 activate];
}

- (BOOL)showsCandidateBar
{
  return self->showsCandidateBar;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  self->showsCandidateBar = a3;
}

- (BOOL)showsCandidateInline
{
  return self->showsCandidateInline;
}

- (void)setShowsCandidateInline:(BOOL)a3
{
  self->showsCandidateInline = a3;
}

- (BOOL)receivedCandidatesInCurrentInputMode
{
  return self->receivedCandidatesInCurrentInputMode;
}

- (void)setReceivedCandidatesInCurrentInputMode:(BOOL)a3
{
  self->receivedCandidatesInCurrentInputMode = a3;
}

- (UITextCursorAssertion)blinkAssertion
{
  return self->_blinkAssertion;
}

- (void)setBlinkAssertion:(id)a3
{
}

- (_UIStringAndPositionPair)lastMatchedSupplementalCandidate
{
  return self->_lastMatchedSupplementalCandidate;
}

- (void)setLastMatchedSupplementalCandidate:(id)a3
{
}

- (_UIStringAndPositionPair)pendingSupplementalCandidateToInsert
{
  return self->_pendingSupplementalCandidateToInsert;
}

- (void)setPendingSupplementalCandidateToInsert:(id)a3
{
}

- (unint64_t)lastChooseSupplementalItemToInsertCallbackIdentifier
{
  return self->_lastChooseSupplementalItemToInsertCallbackIdentifier;
}

- (void)setLastChooseSupplementalItemToInsertCallbackIdentifier:(unint64_t)a3
{
  self->_lastChooseSupplementalItemToInsertCallbackIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSupplementalCandidateToInsert, 0);
  objc_storeStrong((id *)&self->_lastMatchedSupplementalCandidate, 0);
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
}

@end