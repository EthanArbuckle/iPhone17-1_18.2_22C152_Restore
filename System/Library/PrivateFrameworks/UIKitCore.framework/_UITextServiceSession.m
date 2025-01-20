@interface _UITextServiceSession
+ (BOOL)_canShowTextServiceForType:(int64_t)a3;
+ (BOOL)_canShowTextServices;
+ (BOOL)shouldPresentServiceInSameWindowAsView:(id)a3;
+ (BOOL)textServiceIsDisplaying;
+ (id)showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7;
+ (id)showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6;
+ (id)showServiceForType:(int64_t)a3 withContext:(id)a4;
+ (id)textServiceSessionForType:(int64_t)a3;
+ (int64_t)availableTextServices;
- (BOOL)isDisplaying;
- (_UITextServiceSession)init;
- (_UITextServiceSession)initWithType:(int64_t)a3;
- (id)dismissedHandler;
- (int64_t)type;
- (void)_endSession;
- (void)dismissTextServiceAnimated:(BOOL)a3;
- (void)sessionDidDismiss;
- (void)setDismissedHandler:(id)a3;
@end

@implementation _UITextServiceSession

+ (BOOL)_canShowTextServices
{
  if ([(id)UIApp _isSpringBoard]) {
    return 0;
  }
  int v3 = MKBGetDeviceLockState();
  return !v3 || v3 == 3;
}

+ (int64_t)availableTextServices
{
  if (![a1 _canShowTextServices]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v2 isDefinitionLookupAllowed]) {
    int64_t v3 = 18;
  }
  else {
    int64_t v3 = 0;
  }
  if ([v2 isSelectedTextSharingAllowed]) {
    v3 |= 8uLL;
  }
  if ([v2 isSpellCheckAllowed]) {
    v3 |= 4uLL;
  }
  if ([v2 isTranslationLookupAllowed]) {
    v3 |= 0x20uLL;
  }
  if ((v3 & 0x20) != 0 && ![getLTUITranslationViewControllerClass() isAvailable]) {
    v3 &= ~0x20uLL;
  }

  return v3;
}

+ (BOOL)_canShowTextServiceForType:(int64_t)a3
{
  return (a3 & ~[a1 availableTextServices]) == 0;
}

+ (BOOL)shouldPresentServiceInSameWindowAsView:(id)a3
{
  int64_t v3 = [a3 _window];
  if ([v3 _isTextEffectsWindow]) {
    char v4 = 0;
  }
  else {
    char v4 = dyld_program_sdk_at_least();
  }

  return v4;
}

+ (id)showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  return 0;
}

+ (id)showServiceForType:(int64_t)a3 withContext:(id)a4
{
  v109[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![a1 _canShowTextServiceForType:a3])
  {
    id v9 = 0;
    goto LABEL_78;
  }
  v7 = [v6 textWithContext];
  v75 = [v6 rvItemWithContext];
  if (a3 == 16 && !v7 && !v75)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v73 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v73, OS_LOG_TYPE_FAULT, "Cannot show text service when there isn't text; _UITextServiceSessionContext.textWithContext is nil.",
          buf,
          2u);
      }
    }
    else
    {
      v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB264928) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Cannot show text service when there isn't text; _UITextServiceSessionContext.textWithContext is nil.",
          buf,
          2u);
      }
    }
    id v9 = 0;
    goto LABEL_77;
  }
  if (qword_1EB264930 != -1) {
    dispatch_once(&qword_1EB264930, &__block_literal_global_587);
  }
  uint64_t v10 = [v6 selectedRange];
  uint64_t v12 = v11;
  v74 = objc_msgSend(v7, "substringWithRange:", v10, v11);
  v13 = [v6 view];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = [v6 textInput];
    id v15 = [v16 textInputView];
  }
  [v6 presentationRect];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = [objc_alloc((Class)a1) initWithType:a3];
  objc_storeStrong((id *)(v25 + 24), v15);
  id v9 = 0;
  if (a3 <= 7)
  {
    if (a3 == 2)
    {
      v26 = [[UIReferenceLibraryViewController alloc] initWithTerm:v74];
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_2;
      v97[3] = &unk_1E52D9F70;
      id v98 = (id)v25;
      [(UIReferenceLibraryViewController *)v26 setDismissCompletionHandler:v97];
    }
    else
    {
      if (a3 != 4) {
        goto LABEL_76;
      }
      v34 = _shortcutEditorController(v74);
      if (v34)
      {
        v26 = [[UINavigationController alloc] initWithRootViewController:v34];
        v35 = +[UIDevice currentDevice];
        uint64_t v36 = [v35 userInterfaceIdiom];

        if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
          uint64_t v37 = 7;
        }
        else {
          uint64_t v37 = -2;
        }
        [(UIViewController *)v26 setModalPresentationStyle:v37];
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_3;
        v95[3] = &unk_1E52D9F70;
        id v96 = (id)v25;
        _swapInCompletionForShortcutEditor(v26, v95);
      }
      else
      {
        v26 = 0;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 8:
        id v38 = objc_alloc(MEMORY[0x1E4F9F2E8]);
        v109[0] = v74;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:1];
        v26 = (UIReferenceLibraryViewController *)[v38 initWithActivityItems:v39 applicationActivities:0];

        uint64_t v108 = *MEMORY[0x1E4F9F3E8];
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
        [(UIReferenceLibraryViewController *)v26 setExcludedActivityTypes:v40];

        objc_initWeak((id *)buf, v26);
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_4;
        v92[3] = &unk_1E530C758;
        objc_copyWeak(&v94, (id *)buf);
        id v93 = (id)v25;
        [(UIReferenceLibraryViewController *)v26 setCompletionWithItemsHandler:v92];

        objc_destroyWeak(&v94);
        objc_destroyWeak((id *)buf);
        break;
      case 16:
        if (!v75
          || (v41 = (void *)[objc_alloc((Class)DataDetectorsUIGetClass(@"DDParsecCollectionViewController")) initWithRVItem:v75]) == 0)
        {
          v41 = objc_msgSend(objc_alloc((Class)DataDetectorsUIGetClass(@"DDParsecCollectionViewController")), "initWithString:range:", v7, v10, v12);
        }
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_5;
        v90[3] = &unk_1E52D9F70;
        id v91 = (id)v25;
        v26 = v41;
        [(UIReferenceLibraryViewController *)v26 setDismissCompletionHandler:v90];

        break;
      case 32:
        v26 = (UIReferenceLibraryViewController *)objc_alloc_init((Class)getLTUITranslationViewControllerClass());
        [(UIViewController *)v26 setModalPresentationStyle:7];
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v74];
        [(UIReferenceLibraryViewController *)v26 setText:v27];

        [(UIReferenceLibraryViewController *)v26 setIsSourceEditable:0];
        v28 = [v6 textInput];
        if (v28 && (int v29 = [v15 isEditable], v28, v29))
        {
          v30 = [v6 textInput];
          v31 = [v30 selectedTextRange];

          v32 = [v6 textInput];
          objc_initWeak((id *)buf, v32);

          [(UIReferenceLibraryViewController *)v26 setIsSourceEditable:1];
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_6;
          v87[3] = &unk_1E530C780;
          objc_copyWeak(&v89, (id *)buf);
          id v33 = v31;
          id v88 = v33;
          [(UIReferenceLibraryViewController *)v26 setReplacementHandler:v87];

          objc_destroyWeak(&v89);
          objc_destroyWeak((id *)buf);
        }
        else if ([v15 conformsToProtocolCached:&unk_1ED7009A0])
        {
          id v42 = objc_initWeak((id *)buf, v15);
          int v43 = [v15 isReplaceAllowed];

          if (v43)
          {
            [(UIReferenceLibraryViewController *)v26 setIsSourceEditable:1];
            v84[0] = MEMORY[0x1E4F143A8];
            v84[1] = 3221225472;
            v84[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_7;
            v84[3] = &unk_1E530C780;
            objc_copyWeak(&v86, (id *)buf);
            id v85 = v74;
            [(UIReferenceLibraryViewController *)v26 setReplacementHandler:v84];

            objc_destroyWeak(&v86);
          }
          objc_destroyWeak((id *)buf);
        }
        else if ([v15 conformsToProtocol:&unk_1ED700940])
        {
          id v44 = objc_initWeak((id *)buf, v15);
          int v45 = [v15 isReplaceAllowed];

          if (v45)
          {
            [(UIReferenceLibraryViewController *)v26 setIsSourceEditable:1];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_8;
            v81[3] = &unk_1E530C780;
            objc_copyWeak(&v83, (id *)buf);
            id v82 = v74;
            [(UIReferenceLibraryViewController *)v26 setReplacementHandler:v81];

            objc_destroyWeak(&v83);
          }
          objc_destroyWeak((id *)buf);
        }
        else if ([v15 conformsToProtocol:&unk_1ED700D60])
        {
          id v46 = objc_initWeak((id *)buf, v15);
          int v47 = [v15 isReplaceAllowed];

          if (v47)
          {
            [(UIReferenceLibraryViewController *)v26 setIsSourceEditable:1];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_9;
            v78[3] = &unk_1E530C780;
            objc_copyWeak(&v80, (id *)buf);
            id v79 = v74;
            [(UIReferenceLibraryViewController *)v26 setReplacementHandler:v78];

            objc_destroyWeak(&v80);
          }
          objc_destroyWeak((id *)buf);
        }
        uint64_t v48 = [v6 textInput];
        v49 = (void *)v48;
        if (v48) {
          v50 = (void *)v48;
        }
        else {
          v50 = v15;
        }
        id v51 = v50;

        if ([v51 conformsToProtocol:&unk_1ED7017E0])
        {
          uint64_t v104 = 0;
          v105 = &v104;
          uint64_t v106 = 0x2050000000;
          v52 = (void *)qword_1EB264938;
          uint64_t v107 = qword_1EB264938;
          if (!qword_1EB264938)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            uint64_t v100 = 3221225472;
            v101 = __getLTUISourceMetaClass_block_invoke;
            v102 = &unk_1E52D9900;
            v103 = &v104;
            __getLTUISourceMetaClass_block_invoke((uint64_t)buf);
            v52 = (void *)v105[3];
          }
          v53 = v52;
          _Block_object_dispose(&v104, 8);
          id v54 = objc_alloc_init(v53);
          objc_msgSend(v54, "setOrigin:", objc_msgSend(v51, "isImageBacked"));
          [(UIReferenceLibraryViewController *)v26 setSourceMeta:v54];
        }
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_10;
        v76[3] = &unk_1E52D9F70;
        id v77 = (id)v25;
        [(UIReferenceLibraryViewController *)v26 setDismissCompletionHandler:v76];

        break;
      default:
        goto LABEL_76;
    }
  }
  if (v26)
  {
    v55 = [v15 _window];
    if ([v55 _isTextEffectsWindow])
    {
      unsigned int v56 = ((unint64_t)a3 < 0x21) & (0x100010010uLL >> a3);
      if (a3 == 8) {
        unsigned int v57 = 1;
      }
      else {
        unsigned int v57 = ((unint64_t)a3 < 0x21) & (0x100010010uLL >> a3);
      }

      if (!v57)
      {
LABEL_67:
        v64 = [(UIViewController *)v26 presentationController];
        [v64 setDelegate:v25];

        v65 = [(UIViewController *)v26 popoverPresentationController];
        [v65 setSourceView:v15];

        v66 = [(UIViewController *)v26 popoverPresentationController];
        objc_msgSend(v66, "setSourceRect:", v18, v20, v22, v24);

        objc_storeStrong((id *)(v25 + 16), v26);
        if ([a1 shouldPresentServiceInSameWindowAsView:v15])
        {
          v67 = [v15 _viewControllerForAncestor];
          v68 = [(UIViewController *)v67 presentedViewController];

          if (v68)
          {
            do
            {
              v69 = [(UIViewController *)v67 presentedViewController];

              v70 = [(UIViewController *)v69 presentedViewController];

              v67 = v69;
            }
            while (v70);
          }
          else
          {
            v69 = v67;
          }
          [(UIViewController *)v69 presentViewController:v26 animated:1 completion:0];
        }
        else
        {
          v69 = objc_alloc_init(_UIFallbackPresentationViewController);
          [(UIApplicationRotationFollowingController *)v69 setSizesWindowToScene:1];
          v71 = [(UIViewController *)v26 popoverPresentationController];
          [v71 _setAllowsSourceViewInDifferentWindowThanInitialPresentationViewController:1];

          [(_UIFallbackPresentationViewController *)v69 _presentViewController:v26 sendingView:v15 animated:1];
        }

        [(id)_MergedGlobals_1276 addObject:v25];
        id v9 = (id)v25;

        goto LABEL_76;
      }
      if (v56)
      {
        uint64_t v58 = [v15 keyboardSceneDelegate];
        v59 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v58;

        uint64_t v60 = [(UIViewController *)v26 view];
        v61 = *(void **)(v25 + 32);
        *(void *)(v25 + 32) = v60;

        [*(id *)(v25 + 40) _beginPinningInputViewsOnBehalfOfResponder:*(void *)(v25 + 32)];
      }
      v55 = [v15 keyboardSceneDelegate];
      v62 = [v55 passthroughViews];
      v63 = [(UIViewController *)v26 popoverPresentationController];
      [v63 setPassthroughViews:v62];
    }
    goto LABEL_67;
  }
  id v9 = 0;
LABEL_76:

LABEL_77:
LABEL_78:

  return v9;
}

+ (id)showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a6;
  id v13 = a3;
  v14 = +[_UITextServiceSession showServiceForText:selectedTextRange:type:fromRect:inView:](_UITextServiceSession, "showServiceForText:selectedTextRange:type:fromRect:inView:", v13, 0, [v13 length], a4, v12, x, y, width, height);

  return v14;
}

- (_UITextServiceSession)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextServiceSession;
  result = [(_UITextServiceSession *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (_UITextServiceSession)init
{
  return [(_UITextServiceSession *)self initWithType:2];
}

- (BOOL)isDisplaying
{
  return !self->_dismissed;
}

- (int64_t)type
{
  return self->_type;
}

+ (id)textServiceSessionForType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)_MergedGlobals_1276;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)textServiceIsDisplaying
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)_MergedGlobals_1276;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isDisplaying", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)dismissTextServiceAnimated:(BOOL)a3
{
  int64_t type = self->_type;
  if (type <= 7)
  {
    if (type == 2)
    {
      modalViewController = self->_modalViewController;
      [(UIViewController *)modalViewController _dismissModalReferenceView:0];
    }
    else if (type == 4)
    {
      uint64_t v5 = self->_modalViewController;
      _dismissShortcutEditorController(v5);
    }
  }
  else if (type == 8 || type == 16)
  {
    long long v8 = self->_modalViewController;
    uint64_t v6 = [(UIViewController *)v8 dismissCompletionHandler];
    [(UIViewController *)v8 dismissViewControllerAnimated:1 completion:v6];

    [(UIViewController *)v8 setDismissCompletionHandler:0];
  }
  else if (type == 32)
  {
    uint64_t v4 = self->_modalViewController;
    [(UIViewController *)v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_endSession
{
  if (!self->_dismissed)
  {
    if (self->_pinnedResponder)
    {
      -[UIKeyboardSceneDelegate _stopPinningInputViewsOnBehalfOfResponder:](self->_keyboardSceneDelegate, "_stopPinningInputViewsOnBehalfOfResponder:");
      keyboardSceneDelegate = self->_keyboardSceneDelegate;
      self->_keyboardSceneDelegate = 0;

      pinnedResponder = self->_pinnedResponder;
      self->_pinnedResponder = 0;
    }
    [(_UITextServiceSession *)self sessionDidDismiss];
    modalViewController = self->_modalViewController;
    self->_modalViewController = 0;

    uint64_t v6 = (void *)_MergedGlobals_1276;
    [v6 removeObject:self];
  }
}

- (id)dismissedHandler
{
  return self->_dismissedHandler;
}

- (void)setDismissedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissedHandler, 0);
  objc_storeStrong((id *)&self->_keyboardSceneDelegate, 0);
  objc_storeStrong((id *)&self->_pinnedResponder, 0);
  objc_storeStrong((id *)&self->_contextView, 0);
  objc_storeStrong((id *)&self->_modalViewController, 0);
}

- (void)sessionDidDismiss
{
  if (!self->_dismissed)
  {
    dismissedHandler = (void (**)(id, _UITextServiceSession *))self->_dismissedHandler;
    if (dismissedHandler)
    {
      dismissedHandler[2](dismissedHandler, self);
      [(_UITextServiceSession *)self setDismissedHandler:0];
    }
    self->_dismissed = 1;
  }
}

@end