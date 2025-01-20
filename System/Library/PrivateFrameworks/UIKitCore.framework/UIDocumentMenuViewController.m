@interface UIDocumentMenuViewController
- (BOOL)_ignoreApplicationEntitlementForImport;
- (BOOL)_isContentManaged;
- (BOOL)dismissDelegateCalled;
- (NSArray)allowedUTIs;
- (NSMutableArray)auxiliaryOptions;
- (NSURL)uploadURL;
- (UIDocumentMenuViewController)initWithCoder:(NSCoder *)coder;
- (UIDocumentMenuViewController)initWithDocumentTypes:(NSArray *)allowedUTIs inMode:(UIDocumentPickerMode)mode;
- (UIDocumentMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIDocumentMenuViewController)initWithURL:(NSURL *)url inMode:(UIDocumentPickerMode)mode;
- (_UIDocumentPickerRemoteViewController)_remoteViewController;
- (_UIResilientRemoteViewContainerViewController)_childViewController;
- (id)_initIgnoringApplicationEntitlementForImportOfTypes:(id)a3;
- (id)delegate;
- (unint64_t)documentPickerMode;
- (void)_commonInitWithCompletion:(id)a3;
- (void)_didSelectPicker;
- (void)_dismissViewController;
- (void)_dismissWithOption:(id)a3;
- (void)_displayLocationsMenuFromRect:(CGRect)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setIgnoreApplicationEntitlementForImport:(BOOL)a3;
- (void)_setIsContentManaged:(BOOL)a3;
- (void)addOptionWithTitle:(NSString *)title image:(UIImage *)image order:(UIDocumentMenuOrder)order handler:(void *)handler;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setAllowedUTIs:(id)a3;
- (void)setAuxiliaryOptions:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDismissDelegateCalled:(BOOL)a3;
- (void)setDocumentPickerMode:(unint64_t)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setUploadURL:(id)a3;
@end

@implementation UIDocumentMenuViewController

- (UIDocumentMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSString;
  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_initWithDocumentTypes_inMode_);
  v12 = NSStringFromSelector(sel_initWithURL_inMode_);
  v13 = [v9 stringWithFormat:@"You cannot initialize a %@ except by the %@ and %@ initializers.", v10, v11, v12];
  id v14 = [v7 exceptionWithName:v8 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (UIDocumentMenuViewController)initWithDocumentTypes:(NSArray *)allowedUTIs inMode:(UIDocumentPickerMode)mode
{
  v7 = allowedUTIs;
  if (mode >= UIDocumentPickerModeExportToService)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentMenuViewController.m", 73, @"%s can only be called with mode Import or Open", "-[UIDocumentMenuViewController initWithDocumentTypes:inMode:]");
  }
  v15.receiver = self;
  v15.super_class = (Class)UIDocumentMenuViewController;
  uint64_t v8 = [(UIViewController *)&v15 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(UIDocumentMenuViewController *)v8 setDocumentPickerMode:mode];
    [(UIDocumentMenuViewController *)v9 setAllowedUTIs:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__UIDocumentMenuViewController_initWithDocumentTypes_inMode___block_invoke;
    v12[3] = &unk_1E52EB330;
    v13 = v7;
    UIDocumentPickerMode v14 = mode;
    [(UIDocumentMenuViewController *)v9 _commonInitWithCompletion:v12];
  }
  return v9;
}

void __61__UIDocumentMenuViewController_initWithDocumentTypes_inMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 _setPickableTypes:v3];
  [v4 _setPickerMode:*(void *)(a1 + 40)];
}

- (id)_initIgnoringApplicationEntitlementForImportOfTypes:(id)a3
{
  self->_ignoreApplicationEntitlementForImport = 1;
  return [(UIDocumentMenuViewController *)self initWithDocumentTypes:a3 inMode:0];
}

- (UIDocumentMenuViewController)initWithURL:(NSURL *)url inMode:(UIDocumentPickerMode)mode
{
  v7 = url;
  uint64_t v8 = v7;
  if ((mode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentMenuViewController.m", 96, @"%s can only be called with mode Export or Move", "-[UIDocumentMenuViewController initWithURL:inMode:]");

    if (v8) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentMenuViewController.m", 97, @"%s must be called with a valid URL", "-[UIDocumentMenuViewController initWithURL:inMode:]");

LABEL_3:
  v9 = [(NSURL *)v8 lastPathComponent];

  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentMenuViewController.m", 98, @"%s must be called with a URL pointing to a file", "-[UIDocumentMenuViewController initWithURL:inMode:]");
  }
  id v28 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1C6E8];
  id v27 = 0;
  BOOL v11 = [(NSURL *)v8 getPromisedItemResourceValue:&v28 forKey:v10 error:&v27];
  id v12 = v28;
  id v13 = v27;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentMenuViewController.m", 102, @"%s must be called with a URL pointing to an existing file", "-[UIDocumentMenuViewController initWithURL:inMode:]");
  }
  v26.receiver = self;
  v26.super_class = (Class)UIDocumentMenuViewController;
  UIDocumentPickerMode v14 = [(UIViewController *)&v26 initWithNibName:0 bundle:0];
  objc_super v15 = v14;
  if (v14)
  {
    [(UIDocumentMenuViewController *)v14 setDocumentPickerMode:mode];
    [(UIDocumentMenuViewController *)v15 setUploadURL:v8];
    v16 = +[_UIDocumentPickerNSURLWrapper wrapperWithURL:v8 readonly:mode == UIDocumentPickerModeExportToService];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__UIDocumentMenuViewController_initWithURL_inMode___block_invoke;
    v23[3] = &unk_1E52EB330;
    id v24 = v16;
    UIDocumentPickerMode v25 = mode;
    id v17 = v16;
    [(UIDocumentMenuViewController *)v15 _commonInitWithCompletion:v23];
  }
  return v15;
}

void __51__UIDocumentMenuViewController_initWithURL_inMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 _setUploadURLWrapper:v3];
  [v4 _setPickerMode:*(void *)(a1 + 40)];
}

- (void)_commonInitWithCompletion:(id)a3
{
  id v6 = a3;
  id v26 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v7 = (uint64_t (*)(id *))_MergedGlobals_1_5;
  v35 = _MergedGlobals_1_5;
  if (!_MergedGlobals_1_5)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBRGetCloudEnabledStatusSymbolLoc_block_invoke;
    v30 = &unk_1E52D9900;
    v31 = &v32;
    uint64_t v8 = CloudDocsLibrary_0();
    v33[3] = (uint64_t)dlsym(v8, "BRGetCloudEnabledStatus");
    _MergedGlobals_1_5 = *(_UNKNOWN **)(v31[1] + 24);
    v7 = (uint64_t (*)(id *))v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [NSString stringWithUTF8String:"BRCloudEnabledStatus _BRGetCloudEnabledStatus(NSError *__autoreleasing *)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"UIDocumentMenuViewController.m", 44, @"%s", dlerror());
    goto LABEL_13;
  }
  int v9 = v7(&v26);
  id v10 = v26;
  if (v9 == -3
    && (!self->_ignoreApplicationEntitlementForImport
     || [(UIDocumentMenuViewController *)self documentPickerMode]))
  {
    unint64_t v3 = 0x1E4F28000uLL;
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    id v12 = (void *)qword_1EB25BCF0;
    v35 = (void *)qword_1EB25BCF0;
    if (!qword_1EB25BCF0)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getBRICloudContainerIdentifiersEntitlementSymbolLoc_block_invoke;
      v30 = &unk_1E52D9900;
      v31 = &v32;
      id v13 = CloudDocsLibrary_0();
      UIDocumentPickerMode v14 = dlsym(v13, "BRICloudContainerIdentifiersEntitlement");
      *(void *)(v31[1] + 24) = v14;
      qword_1EB25BCF0 = *(void *)(v31[1] + 24);
      id v12 = (void *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v12)
    {
      while (1)
      {
        v22 = [*(id *)(v3 + 2816) currentHandler];
        v23 = [NSString stringWithUTF8String:"NSString *getBRICloudContainerIdentifiersEntitlement(void)"];
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"UIDocumentMenuViewController.m", 45, @"%s", dlerror());
LABEL_13:

        __break(1u);
      }
    }
    [v11 handleFailureInMethod:a2, self, @"UIDocumentMenuViewController.m", 125, @"Application initializing document picker is missing the iCloud entitlement. Is %@ set?", *v12 object file lineNumber description];
  }
  [(UIViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
  [(UIDocumentMenuViewController *)self setModalPresentationStyle:100];
  [(UIViewController *)self setModalTransitionStyle:12];
  objc_super v15 = [(UIViewController *)self actionSheetPresentationController];
  v16 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
  [v15 setDismissActionTitle:v16];

  id v17 = [(UIViewController *)self actionSheetPresentationController];
  [v17 setActionSheetDelegate:self];

  v18 = [MEMORY[0x1E4F1CA48] array];
  [(UIDocumentMenuViewController *)self setAuxiliaryOptions:v18];

  v19 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.CloudDocsUI.DocumentPicker" error:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke;
  v24[3] = &unk_1E52EB380;
  v24[4] = self;
  id v25 = v6;
  id v20 = v6;
  v21 = +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:v19 completion:v24];
  [(UIDocumentMenuViewController *)self _setChildViewController:v21];
  [v21 preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

void __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 serviceViewControllerProxy];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v7)
  {
    uint64_t v9 = objc_opt_class();
    NSLog(&cfstr_RemoteViewCont.isa, v9, v7);
    [*(id *)(a1 + 32) _endDelayingPresentation];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) auxiliaryOptions];
    [v8 _setAuxiliaryOptions:v10];

    _UIShimSetUnderbarIsContentManaged(v8, *(unsigned __int8 *)(*(void *)(a1 + 32) + 986));
    [v6 setPublicController:*(void *)(a1 + 32)];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke_2;
    v11[3] = &unk_1E52EB358;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v8;
    [v12 _prepareForDisplayWithCompletion:v11];
  }
}

uint64_t __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) modalPresentationStyle];
  double v7 = 0.0;
  if (v6 == 7) {
    double v7 = a2;
  }
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v7, a3);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) auxiliaryOptions];
  [v8 _setAuxiliaryOptions:v9];

  id v10 = *(void **)(a1 + 32);
  return [v10 _endDelayingPresentation];
}

- (UIDocumentMenuViewController)initWithCoder:(NSCoder *)coder
{
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentMenuViewController;
  return [(UIViewController *)&v4 initWithCoder:coder];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentMenuViewController;
  [(UIViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(UIViewController *)self->_childViewController preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)addOptionWithTitle:(NSString *)title image:(UIImage *)image order:(UIDocumentMenuOrder)order handler:(void *)handler
{
  id v10 = handler;
  BOOL v11 = image;
  id v12 = title;
  UIDocumentPickerMode v14 = objc_alloc_init(_UIDocumentPickerAuxiliaryOption);
  [(_UIDocumentPickerAuxiliaryOption *)v14 setTitle:v12];

  [(_UIDocumentPickerAuxiliaryOption *)v14 setImage:v11];
  [(_UIDocumentPickerAuxiliaryOption *)v14 setHandler:v10];

  [(_UIDocumentPickerAuxiliaryOption *)v14 setOrder:order];
  id v13 = [(UIDocumentMenuViewController *)self auxiliaryOptions];
  [v13 addObject:v14];
}

- (void)_setChildViewController:(id)a3
{
  id v25 = a3;
  id v5 = [(UIViewController *)self->_childViewController view];
  [v5 removeFromSuperview];

  [(UIViewController *)self->_childViewController removeFromParentViewController];
  objc_storeStrong((id *)&self->_childViewController, a3);
  if (self->_childViewController)
  {
    [v25 willMoveToParentViewController:self];
    [(UIViewController *)self addChildViewController:v25];
    uint64_t v6 = [(UIViewController *)self view];
    double v7 = [v25 view];
    [v6 addSubview:v7];

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = (void *)MEMORY[0x1E4F5B268];
    id v10 = [v25 view];
    BOOL v11 = [(UIViewController *)self view];
    id v12 = [v9 constraintWithItem:v10 attribute:7 relatedBy:0 toItem:v11 attribute:7 multiplier:1.0 constant:0.0];
    [v8 addObject:v12];

    id v13 = (void *)MEMORY[0x1E4F5B268];
    UIDocumentPickerMode v14 = [v25 view];
    objc_super v15 = [(UIViewController *)self view];
    v16 = [v13 constraintWithItem:v14 attribute:8 relatedBy:0 toItem:v15 attribute:8 multiplier:1.0 constant:0.0];
    [v8 addObject:v16];

    id v17 = (void *)MEMORY[0x1E4F5B268];
    v18 = [v25 view];
    v19 = [(UIViewController *)self view];
    id v20 = [v17 constraintWithItem:v18 attribute:1 relatedBy:0 toItem:v19 attribute:1 multiplier:1.0 constant:0.0];
    [v8 addObject:v20];

    v21 = (void *)MEMORY[0x1E4F5B268];
    v22 = [v25 view];
    v23 = [(UIViewController *)self view];
    id v24 = [v21 constraintWithItem:v22 attribute:3 relatedBy:0 toItem:v23 attribute:3 multiplier:1.0 constant:0.0];
    [v8 addObject:v24];

    [MEMORY[0x1E4F5B268] activateConstraints:v8];
    [v25 didMoveToParentViewController:self];
  }
}

- (_UIDocumentPickerRemoteViewController)_remoteViewController
{
  return (_UIDocumentPickerRemoteViewController *)[(_UIResilientRemoteViewContainerViewController *)self->_childViewController remoteViewController];
}

- (void)_setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
  id v5 = [(UIDocumentMenuViewController *)self _remoteViewController];
  objc_super v4 = [v5 serviceViewControllerProxy];
  [v4 _setIsContentManaged:self->_isContentManaged];
}

- (void)_didSelectPicker
{
  unint64_t v3 = [(UIViewController *)self presentingViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__UIDocumentMenuViewController__didSelectPicker__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __48__UIDocumentMenuViewController__didSelectPicker__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) documentPickerMode];
  if (v2 - 2 < 2)
  {
    uint64_t v6 = [UIDocumentPickerViewController alloc];
    objc_super v4 = [*(id *)(a1 + 32) uploadURL];
    uint64_t v5 = -[UIDocumentPickerViewController initWithURL:inMode:](v6, "initWithURL:inMode:", v4, [*(id *)(a1 + 32) documentPickerMode]);
    goto LABEL_5;
  }
  if (v2 <= 1)
  {
    unint64_t v3 = [UIDocumentPickerViewController alloc];
    objc_super v4 = [*(id *)(a1 + 32) allowedUTIs];
    uint64_t v5 = -[UIDocumentPickerViewController initWithDocumentTypes:inMode:](v3, "initWithDocumentTypes:inMode:", v4, [*(id *)(a1 + 32) documentPickerMode]);
LABEL_5:
    id v8 = (id)v5;

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  [v8 _setIsContentManaged:*(unsigned __int8 *)(*(void *)(a1 + 32) + 986)];
  double v7 = [*(id *)(a1 + 32) delegate];
  [v7 documentMenu:*(void *)(a1 + 32) didPickDocumentPicker:v8];

  [*(id *)(a1 + 32) setDismissDelegateCalled:1];
}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIDocumentMenuViewController.m" lineNumber:274 description:@"1st party doc picker requested locations menu display"];
}

- (void)_dismissViewController
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(UIDocumentMenuViewController *)self setAuxiliaryOptions:v3];

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = [(UIDocumentMenuViewController *)self _remoteViewController];
  [v5 invalidate];

  uint64_t v6 = [(UIDocumentMenuViewController *)self _childViewController];
  [v6 invalidate];

  if (![(UIDocumentMenuViewController *)self dismissDelegateCalled])
  {
    id v7 = [(UIDocumentMenuViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [(UIDocumentMenuViewController *)self setDismissDelegateCalled:1];
      [v7 documentMenuWasCancelled:self];
    }
  }
}

- (void)_dismissWithOption:(id)a3
{
  id v5 = a3;
  auxiliaryOptions = self->_auxiliaryOptions;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__UIDocumentMenuViewController__dismissWithOption___block_invoke;
  v17[3] = &unk_1E52EB3A8;
  id v7 = v5;
  id v18 = v7;
  id v8 = [(NSMutableArray *)self->_auxiliaryOptions objectAtIndex:[(NSMutableArray *)auxiliaryOptions indexOfObjectPassingTest:v17]];
  if (!v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIDocumentMenuViewController.m" lineNumber:304 description:@"Document picker menu dismissed with an option not previously specified?"];
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  [(UIDocumentMenuViewController *)self setAuxiliaryOptions:v9];

  [(UIDocumentMenuViewController *)self setDismissDelegateCalled:1];
  id v10 = [(UIViewController *)self presentingViewController];

  if (!v10)
  {
    UIDocumentPickerMode v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentMenuViewController.m", 308, @"%s: presenting view controller is nil", "-[UIDocumentMenuViewController _dismissWithOption:]");
  }
  BOOL v11 = [(UIViewController *)self presentingViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__UIDocumentMenuViewController__dismissWithOption___block_invoke_2;
  v15[3] = &unk_1E52D9F70;
  id v16 = v8;
  id v12 = v8;
  [v11 dismissViewControllerAnimated:1 completion:v15];
}

uint64_t __51__UIDocumentMenuViewController__dismissWithOption___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __51__UIDocumentMenuViewController__dismissWithOption___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    unint64_t v3 = [*(id *)(a1 + 32) handler];
    v3[2]();
  }
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentMenuViewController;
  [(UIViewController *)&v3 setModalPresentationStyle:100];
}

- (BOOL)_ignoreApplicationEntitlementForImport
{
  return self->_ignoreApplicationEntitlementForImport;
}

- (void)_setIgnoreApplicationEntitlementForImport:(BOOL)a3
{
  self->_ignoreApplicationEntitlementForImport = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSMutableArray)auxiliaryOptions
{
  return self->_auxiliaryOptions;
}

- (void)setAuxiliaryOptions:(id)a3
{
}

- (_UIResilientRemoteViewContainerViewController)_childViewController
{
  return self->_childViewController;
}

- (BOOL)dismissDelegateCalled
{
  return self->_dismissDelegateCalled;
}

- (void)setDismissDelegateCalled:(BOOL)a3
{
  self->_dismissDelegateCalled = a3;
}

- (unint64_t)documentPickerMode
{
  return self->_documentPickerMode;
}

- (void)setDocumentPickerMode:(unint64_t)a3
{
  self->_documentPickerMode = a3;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (void)setUploadURL:(id)a3
{
}

- (NSArray)allowedUTIs
{
  return self->_allowedUTIs;
}

- (void)setAllowedUTIs:(id)a3
{
}

- (BOOL)_isContentManaged
{
  return self->_isContentManaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedUTIs, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weak_delegate, 0);
}

@end