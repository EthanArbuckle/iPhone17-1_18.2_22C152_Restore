@interface UIInputViewController
+ (BOOL)_requiresProxyInterface;
+ (void)presentDialogForAddingKeyboard;
- (BOOL)_alignsToContentViewController;
- (BOOL)_autosizeToCurrentKeyboard;
- (BOOL)_canBecomeFirstResponder;
- (BOOL)_canResignIfContainsFirstResponder;
- (BOOL)_isPlaceholder;
- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges;
- (BOOL)_usesCustomBackground;
- (BOOL)hasDictationKey;
- (BOOL)hasFullAccess;
- (BOOL)needsInputModeSwitchKey;
- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)primaryLanguage;
- (UIInputView)inputView;
- (UIInputViewController)initWithCoder:(id)a3;
- (UIInputViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIKeyboard)_keyboard;
- (id)_compatibilityController;
- (id)_extensionContext;
- (id)_proxyInterface;
- (id)_textDocumentInterface;
- (id)textDocumentProxy;
- (void)_didResetDocumentState;
- (void)_setAutosizeToCurrentKeyboard:(BOOL)a3;
- (void)_setExtensionContextUUID:(id)a3;
- (void)_setTextDocumentProxy:(id)a3;
- (void)_setupInputController;
- (void)_updateConformanceCache;
- (void)_willResetDocumentState;
- (void)advanceToNextInputMode;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)dismissKeyboard;
- (void)handleInputModeListFromView:(UIView *)view withEvent:(UIEvent *)event;
- (void)loadView;
- (void)proceedShouldReturnIfPossibleForASP;
- (void)requestSupplementaryLexiconWithCompletion:(void *)completionHandler;
- (void)setHasDictationKey:(BOOL)hasDictationKey;
- (void)setPrimaryLanguage:(NSString *)primaryLanguage;
- (void)setView:(id)a3;
- (void)set_alignsToContentViewController:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UIInputViewController

- (UIInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewController;
  v4 = [(UIViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(UIInputViewController *)v4 _setupInputController];
  }
  return v5;
}

- (UIInputViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewController;
  v3 = [(UIViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(UIInputViewController *)v3 _setupInputController];
  }
  return v4;
}

- (void)_setupInputController
{
  if ([(id)objc_opt_class() _requiresProxyInterface])
  {
    v3 = objc_alloc_init(_UITextDocumentInterface);
    [(_UITextDocumentInterface *)v3 setDelegate:self];
    textDocumentProxy = self->_textDocumentProxy;
    self->_textDocumentProxy = (UITextDocumentProxy *)v3;
  }
}

- (void)dealloc
{
  v3 = [(UIInputViewController *)self _proxyInterface];
  [v3 setForwardingInterface:0];

  v4 = [(UIInputViewController *)self _textDocumentInterface];
  [v4 setDelegate:0];

  textDocumentProxy = self->_textDocumentProxy;
  self->_textDocumentProxy = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewController;
  [(UIViewController *)&v6 dealloc];
}

- (void)_setTextDocumentProxy:(id)a3
{
  v4 = (UITextDocumentProxy *)a3;
  v5 = [(UIInputViewController *)self _proxyInterface];
  [v5 setForwardingInterface:0];

  textDocumentProxy = self->_textDocumentProxy;
  self->_textDocumentProxy = v4;
}

- (void)_setAutosizeToCurrentKeyboard:(BOOL)a3
{
  BOOL autosizeToCurrentKeyboard = self->_autosizeToCurrentKeyboard;
  self->_BOOL autosizeToCurrentKeyboard = a3;
  if (autosizeToCurrentKeyboard != a3)
  {
    id v7 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v7 setSelfSizingChanged:1];
    v5 = [(UIViewController *)self view];
    objc_super v6 = [v5 superview];
    [v6 _didChangeKeyplaneWithContext:v7];
  }
}

- (void)loadView
{
  uint64_t v3 = [(UIViewController *)self nibName];
  if (v3
    && (v4 = (void *)v3,
        [(UIViewController *)self nibBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInputViewController;
    [(UIViewController *)&v8 loadView];
    [(UIInputViewController *)self _updateConformanceCache];
  }
  else
  {
    objc_super v6 = [UIInputView alloc];
    id v7 = -[UIInputView initWithFrame:inputViewStyle:](v6, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIInputViewController *)self setView:v7];
  }
}

- (void)_updateConformanceCache
{
  id v3 = [(UIViewController *)self view];
  self->_viewConformsToRemotePlaceholder = objc_opt_respondsToSelector() & 1;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)UIInputViewController;
  [(UIViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputViewController;
  [(UIViewController *)&v5 viewDidAppear:a3];
  v4 = [(UIViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)UIInputViewController;
  [(UIViewController *)&v2 didReceiveMemoryWarning];
}

- (id)_extensionContext
{
  return 0;
}

- (void)_setExtensionContextUUID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewController;
  [(UIViewController *)&v7 _setExtensionContextUUID:a3];
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewController;
  v4 = [(UIViewController *)&v6 extensionContext];
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    objc_super v5 = [(UIInputViewController *)self _proxyInterface];
    [v4 setForwardingInterface:v5];
  }
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewController;
  LODWORD(v5) = 1148846080;
  [(UIViewController *)&v8 _systemLayoutSizeFittingSize:a3.width withHorizontalFittingPriority:0.0 verticalFittingPriority:v5];
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 1;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

- (UIKeyboard)_keyboard
{
  return 0;
}

- (BOOL)_isPlaceholder
{
  return self->_viewConformsToRemotePlaceholder;
}

- (UIInputView)inputView
{
  id v3 = [(UIViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(UIViewController *)self view];
  }
  else
  {
    v4 = 0;
  }

  return (UIInputView *)v4;
}

- (id)_compatibilityController
{
  return 0;
}

+ (BOOL)_requiresProxyInterface
{
  return 1;
}

- (id)_proxyInterface
{
  objc_super v2 = [(UIInputViewController *)self textDocumentProxy];
  if ([v2 conformsToProtocol:&unk_1ED5AEAC0]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)_textDocumentInterface
{
  objc_super v2 = [(UIInputViewController *)self textDocumentProxy];
  if ([v2 isMemberOfClass:objc_opt_class()]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputViewController;
  [(UIViewController *)&v5 setView:a3];
  [(UIInputViewController *)self _updateConformanceCache];
  if ([(id)objc_opt_class() _requiresProxyInterface])
  {
    id v4 = [(UIInputViewController *)self inputView];
    [v4 _setDisableSplitSupport:1];
  }
}

- (void)setPrimaryLanguage:(NSString *)primaryLanguage
{
  id v4 = primaryLanguage;
  id v5 = [(UIInputViewController *)self _textDocumentInterface];
  [v5 _setPrimaryLanguage:v4];
}

- (BOOL)hasFullAccess
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  objc_super v2 = (id *)qword_1EB25B2D8;
  v17 = (void *)qword_1EB25B2D8;
  if (!qword_1EB25B2D8)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __getkTCCServiceKeyboardNetworkSymbolLoc_block_invoke;
    v13 = &unk_1E52D9900;
    id v3 = TCCLibrary();
    v15[3] = (uint64_t)dlsym(v3, "kTCCServiceKeyboardNetwork");
    qword_1EB25B2D8 = v15[3];
    objc_super v2 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v2)
  {
    id v4 = *v2;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    id v5 = (unsigned int (*)(id, void))off_1EB25B2D0;
    v17 = off_1EB25B2D0;
    if (!off_1EB25B2D0)
    {
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __getTCCAccessPreflightSymbolLoc_block_invoke;
      v13 = &unk_1E52D9900;
      double v6 = TCCLibrary();
      v15[3] = (uint64_t)dlsym(v6, "TCCAccessPreflight");
      off_1EB25B2D0 = (_UNKNOWN *)v15[3];
      id v5 = (unsigned int (*)(id, void))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (v5) {
      return v5(v4, 0) == 0;
    }
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "TCCAccessPreflightResult __TCCAccessPreflight(CFStringRef, CFDictionaryRef)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"UIInputViewController.m", 60, @"%s", dlerror(), v10, v11, v12, v13);
  }
  else
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"NSString *getkTCCServiceKeyboardNetwork(void)"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"UIInputViewController.m", 61, @"%s", dlerror(), v10, v11, v12, v13);
  }

  __break(1u);
  return result;
}

- (BOOL)needsInputModeSwitchKey
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIInputViewController *)self _textDocumentInterface];
  id v4 = [v3 forwardingInterface];

  if (!v4)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("External", &needsInputModeSwitchKey___s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v6 = NSString;
      double v7 = v5;
      objc_super v8 = [v6 stringWithUTF8String:"-[UIInputViewController needsInputModeSwitchKey]"];
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%@ was called before a connection was established to the host application. This will produce an inaccurate result. Please make sure to call this after your primary view controller has been initialized.", (uint8_t *)&v12, 0xCu);
    }
  }
  v9 = [(UIInputViewController *)self _textDocumentInterface];
  char v10 = [v9 needsInputModeSwitchKey];

  return v10;
}

- (void)dismissKeyboard
{
  objc_super v2 = [(UIInputViewController *)self _textDocumentInterface];
  [v2 _setShouldDismiss];

  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 dismissKeyboard];
}

- (void)proceedShouldReturnIfPossibleForASP
{
  id v2 = [(UIInputViewController *)self _textDocumentInterface];
  [v2 _setProceedShouldReturnIfPossibleForASP];
}

- (void)advanceToNextInputMode
{
  id v2 = [(UIInputViewController *)self _textDocumentInterface];
  [v2 _setShouldAdvanceInputMode];
}

- (void)setHasDictationKey:(BOOL)hasDictationKey
{
  BOOL v3 = hasDictationKey;
  id v5 = [(UIInputViewController *)self _textDocumentInterface];
  [v5 _setHasDictation:v3];

  self->_hasDictationKey = v3;
}

- (void)handleInputModeListFromView:(UIView *)view withEvent:(UIEvent *)event
{
  double v6 = view;
  double v7 = [(UIEvent *)event touchesForView:v6];
  objc_super v8 = [v7 anyObject];

  [(UIView *)v6 bounds];
  double MidX = CGRectGetMidX(v53);
  [(UIView *)v6 bounds];
  double MinY = CGRectGetMinY(v54);
  uint64_t v11 = [(UIViewController *)self view];
  -[UIView convertPoint:toView:](v6, "convertPoint:toView:", v11, MidX, MinY);
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = [(UIViewController *)self view];
  [v8 locationInView:v16];
  double v18 = v17;
  double v20 = v19;

  switch([v8 phase])
  {
    case 0:
      self->_inputModeListIsShown = 0;
      self->_commitInputModeOnTouchEnd = 0;
      [v8 timestamp];
      self->_double touchBegan = v21;
      dispatch_time_t v22 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__UIInputViewController_handleInputModeListFromView_withEvent___block_invoke;
      block[3] = &unk_1E52DA520;
      block[4] = self;
      *(double *)&block[5] = v13;
      *(double *)&block[6] = v15;
      *(double *)&block[7] = v18;
      *(double *)&block[8] = v20;
      dispatch_after(v22, MEMORY[0x1E4F14428], block);
      goto LABEL_16;
    case 1:
      double v23 = v15 - v20;
      if (self->_inputModeListIsShown || v23 > 10.0)
      {
        v25 = [(UIInputViewController *)self _textDocumentInterface];
        objc_msgSend(v25, "_setInputModeList:touchBegan:fromLocation:updatePoint:", 1, self->_touchBegan, v13, v15, v18, v20);

        self->_inputModeListIsShown = 1;
      }
      if (!self->_commitInputModeOnTouchEnd)
      {
        [(UIView *)v6 bounds];
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        [v8 locationInView:v6];
        v51.x = v34;
        v51.y = v35;
        v55.origin.x = v27;
        v55.origin.y = v29;
        v55.size.width = v31;
        v55.size.height = v33;
        if (!CGRectContainsPoint(v55, v51)) {
          self->_commitInputModeOnTouchEnd = 1;
        }
      }
      goto LABEL_16;
    case 3:
      if (self->_inputModeListIsShown) {
        goto LABEL_12;
      }
      [(UIView *)v6 bounds];
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      [v8 locationInView:v6];
      v52.x = v48;
      v52.y = v49;
      v56.origin.x = v41;
      v56.origin.y = v43;
      v56.size.width = v45;
      v56.size.height = v47;
      if (CGRectContainsPoint(v56, v52))
      {
        self->_inputModeListIsShown = 1;
        [(UIInputViewController *)self advanceToNextInputMode];
      }
      else if (self->_inputModeListIsShown)
      {
LABEL_12:
        if (self->_commitInputModeOnTouchEnd)
        {
          v36 = [(UIInputViewController *)self _textDocumentInterface];
          v37 = v36;
          double touchBegan = self->_touchBegan;
          uint64_t v39 = 3;
          goto LABEL_15;
        }
      }
LABEL_16:

      return;
    case 4:
      v36 = [(UIInputViewController *)self _textDocumentInterface];
      v37 = v36;
      double touchBegan = self->_touchBegan;
      uint64_t v39 = 4;
LABEL_15:
      objc_msgSend(v36, "_setInputModeList:touchBegan:fromLocation:updatePoint:", v39, touchBegan, v13, v15, v18, v20);

      goto LABEL_16;
    default:
      goto LABEL_16;
  }
}

void __63__UIInputViewController_handleInputModeListFromView_withEvent___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[977])
  {
    BOOL v3 = [v2 _textDocumentInterface];
    objc_msgSend(v3, "_setInputModeList:touchBegan:fromLocation:updatePoint:", 0, *(double *)(*(void *)(a1 + 32) + 984), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    *(unsigned char *)(*(void *)(a1 + 32) + 977) = 1;
  }
}

- (void)requestSupplementaryLexiconWithCompletion:(void *)completionHandler
{
  BOOL v3 = completionHandler;
  id v4 = (void *)MEMORY[0x1E4FAE3B0];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  double v6 = [v5 bundlePath];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__UIInputViewController_requestSupplementaryLexiconWithCompletion___block_invoke;
  v8[3] = &unk_1E52F3BA0;
  id v9 = v3;
  id v7 = v3;
  [v4 requestLexiconFromBundlePath:v6 completionHandler:v8];
}

void __67__UIInputViewController_requestSupplementaryLexiconWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[UILexicon _lexiconWithTILexicon:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)_willResetDocumentState
{
  if (pthread_main_np() == 1)
  {
    [(UIInputViewController *)self textWillChange:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__UIInputViewController__willResetDocumentState__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __48__UIInputViewController__willResetDocumentState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) textWillChange:0];
}

- (void)_didResetDocumentState
{
  if (pthread_main_np() == 1)
  {
    [(UIInputViewController *)self textDidChange:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__UIInputViewController__didResetDocumentState__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __47__UIInputViewController__didResetDocumentState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) textDidChange:0];
}

- (BOOL)_canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_usesCustomBackground
{
  return 0;
}

+ (void)presentDialogForAddingKeyboard
{
  id v4 = +[UIWindow _applicationKeyWindow];
  id v11 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = v5;
    id v7 = @"No keyWindow";
    SEL v8 = a2;
    id v9 = a1;
    uint64_t v10 = 410;
    goto LABEL_5;
  }
  if ([v4 _isHostedInAnotherProcess])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = v5;
    id v7 = @"The dialog could not be launch from keyboard extension";
    SEL v8 = a2;
    id v9 = a1;
    uint64_t v10 = 412;
LABEL_5:
    [v5 handleFailureInMethod:v8 object:v9 file:@"UIInputViewController.m" lineNumber:v10 description:v7];

    goto LABEL_7;
  }
  +[_UIDialogForAddingKeyboard presentDialogForAddingKeyboard];
LABEL_7:
}

- (id)textDocumentProxy
{
  return self->_textDocumentProxy;
}

- (BOOL)_alignsToContentViewController
{
  return self->_alignsToContentViewController;
}

- (void)set_alignsToContentViewController:(BOOL)a3
{
  self->_alignsToContentViewController = a3;
}

- (BOOL)_autosizeToCurrentKeyboard
{
  return self->_autosizeToCurrentKeyboard;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (BOOL)hasDictationKey
{
  return self->_hasDictationKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_textDocumentProxy, 0);
}

@end