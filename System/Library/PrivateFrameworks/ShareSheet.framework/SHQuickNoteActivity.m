@interface SHQuickNoteActivity
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_hasSupportedShareableItems;
- (BOOL)_hasUserActivityCurrent;
- (BOOL)_managesOwnPresentation;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canOpenFromManagedToUnmanaged;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isQuickNoteExtensionInstalled;
- (ICSystemPaperExtensionHostViewController)systemPaperViewController;
- (NSArray)_imageFileURLs;
- (NSArray)_images;
- (NSArray)_urls;
- (SHQuickNoteActivity)init;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)_configureQuickNotePresentationDelegateWithPresenterViewController:(id)a3;
- (void)prepareWithActivityItems:(id)a3;
- (void)setSystemPaperViewController:(id)a3;
- (void)set_hasSupportedShareableItems:(BOOL)a3;
- (void)set_hasUserActivityCurrent:(BOOL)a3;
- (void)set_imageFileURLs:(id)a3;
- (void)set_images:(id)a3;
- (void)set_urls:(id)a3;
- (void)systemPaperDidFinishWithError:(id)a3;
@end

@implementation SHQuickNoteActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return @"com.apple.sharing.quick-note";
}

- (SHQuickNoteActivity)init
{
  v18.receiver = self;
  v18.super_class = (Class)SHQuickNoteActivity;
  uint64_t v2 = [(UIActivity *)&v18 init];
  v3 = v2;
  if (v2)
  {
    atomic_store(1u, (unsigned __int8 *)&v2->_isQuickNoteExtensionInstalled);
    atomic_store(0, (unsigned __int8 *)&v2->_canOpenFromManagedToUnmanaged);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.sharing.QuickNote", v5);
    queryQueue = v3->_queryQueue;
    v3->_queryQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_queryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__SHQuickNoteActivity_init__block_invoke;
    block[3] = &unk_1E5A21900;
    v9 = v3;
    v17 = v9;
    dispatch_async(v8, block);
    v10 = [MEMORY[0x1E4F22488] _currentUserActivityUUID];
    v9->__hasUserActivityCurrent = v10 != 0;
    if (v10)
    {
      id location = 0;
      objc_initWeak(&location, v9);
      v11 = (void *)MEMORY[0x1E4F22488];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __27__SHQuickNoteActivity_init__block_invoke_2;
      v13[3] = &unk_1E5A22DB8;
      objc_copyWeak(&v14, &location);
      [v11 _fetchUserActivityWithUUID:v10 completionHandler:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  return v3;
}

void __27__SHQuickNoteActivity_init__block_invoke(uint64_t a1)
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v21 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getMCProfileConnectionClass_block_invoke;
    v16 = &unk_1E5A216E8;
    v17 = &v18;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v13);
    uint64_t v2 = (void *)v19[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v18, 8);
  v4 = [v3 sharedConnection];
  atomic_store([v4 mayOpenFromManagedToUnmanaged], (unsigned __int8 *)(*(void *)(a1 + 32) + 137));
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v5 = (void *)get_EXQueryClass_softClass;
  uint64_t v21 = get_EXQueryClass_softClass;
  if (!get_EXQueryClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __get_EXQueryClass_block_invoke;
    v16 = &unk_1E5A216E8;
    v17 = &v18;
    __get_EXQueryClass_block_invoke((uint64_t)&v13);
    v5 = (void *)v19[3];
  }
  dispatch_queue_t v6 = v5;
  _Block_object_dispose(&v18, 8);
  id v7 = [v6 alloc];
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleIdentifier == %@", @"com.apple.mobilenotes.EditorExtension"];
  v9 = (void *)[v7 initWithExtensionPointIdentifier:@"com.apple.private.system-paper" predicate:v8];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v10 = (void *)get_EXQueryControllerClass_softClass;
  uint64_t v21 = get_EXQueryControllerClass_softClass;
  if (!get_EXQueryControllerClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __get_EXQueryControllerClass_block_invoke;
    v16 = &unk_1E5A216E8;
    v17 = &v18;
    __get_EXQueryControllerClass_block_invoke((uint64_t)&v13);
    v10 = (void *)v19[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v18, 8);
  v12 = [v11 executeQuery:v9];
  atomic_store([v12 count] != 0, (unsigned __int8 *)(*(void *)(a1 + 32) + 136));
}

void __27__SHQuickNoteActivity_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SHQuickNoteActivity_init__block_invoke_3;
  block[3] = &unk_1E5A22D90;
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __27__SHQuickNoteActivity_init__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    v4 = (uint64_t (*)(id))getSYIsLinkableUserActivitySymbolLoc_ptr;
    uint64_t v13 = getSYIsLinkableUserActivitySymbolLoc_ptr;
    if (!getSYIsLinkableUserActivitySymbolLoc_ptr)
    {
      id v5 = (void *)SynapseLibrary();
      v11[3] = (uint64_t)dlsym(v5, "SYIsLinkableUserActivity");
      getSYIsLinkableUserActivitySymbolLoc_ptr = (_UNKNOWN *)v11[3];
      v4 = (uint64_t (*)(id))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v4)
    {
      v9 = (_Unwind_Exception *)__85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v9);
    }
    uint64_t v6 = v4(v3);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained set_hasUserActivityCurrent:v6];
  }
  else
  {
    id v8 = (uint64_t *)(a1 + 40);
    if (!*(void *)(a1 + 40)) {
      return;
    }
    WeakRetained = SHQuickNoteLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __27__SHQuickNoteActivity_init__block_invoke_3_cold_1(v8, WeakRetained);
    }
  }
}

- (BOOL)isQuickNoteExtensionInstalled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isQuickNoteExtensionInstalled);
  return v2 & 1;
}

- (BOOL)canOpenFromManagedToUnmanaged
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canOpenFromManagedToUnmanaged);
  return v2 & 1;
}

- (id)activityTitle
{
  if ([(SHQuickNoteActivity *)self _hasSupportedShareableItems]
    || [(SHQuickNoteActivity *)self _hasUserActivityCurrent])
  {
    id v3 = _ShareSheetBundle();
    v4 = v3;
    id v5 = @"AddToNewQuickNote[Activity]";
    uint64_t v6 = @"Add to New Quick Note";
  }
  else
  {
    id v3 = _ShareSheetBundle();
    v4 = v3;
    id v5 = @"NewQuickNote[Activity]";
    uint64_t v6 = @"New Quick Note";
  }
  id v7 = [v3 localizedStringForKey:v5 value:v6 table:@"Localizable"];

  return v7;
}

- (id)_systemImageName
{
  return @"quicknote";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([MEMORY[0x1E4F9F6B8] isSWYActivityItemProvider:v9] & 1) != 0)
        {

          goto LABEL_24;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (![(SHQuickNoteActivity *)self canOpenFromManagedToUnmanaged])
  {
    v26 = SHQuickNoteLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1A0AD8000, v26, OS_LOG_TYPE_INFO, "Can't perform Quick Note activity from managed app.", v28, 2u);
    }

    goto LABEL_24;
  }
  uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  int v12 = _os_feature_enabled_impl();
  uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v14 = [v13 bundleIdentifier];
  v15 = [v14 lowercaseString];
  int v16 = [v15 isEqualToString:@"com.apple.mobilesafari"];

  v17 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v18 = [v17 bundleIdentifier];
  v19 = [v18 lowercaseString];
  int v20 = [v19 isEqualToString:@"com.apple.mobilenotes"];

  BOOL v21 = 0;
  if (v11 || !v12) {
    goto LABEL_25;
  }
  if (((![(SHQuickNoteActivity *)self isQuickNoteExtensionInstalled] | v16 | v20) & 1) != 0
    || (uint64_t v22 = _UIActivityItemCountOfType(v4, 2), v22 > 5))
  {
LABEL_24:
    BOOL v21 = 0;
    goto LABEL_25;
  }
  uint64_t v23 = v22;
  BOOL v24 = _UIActivityHasAtMoreThan(v4, 4, 0);
  uint64_t v25 = v23 > 0 || v24;
  [(SHQuickNoteActivity *)self set_hasSupportedShareableItems:v25];
  BOOL v21 = [(SHQuickNoteActivity *)self _hasUserActivityCurrent]
     || [v4 count] != 0;
LABEL_25:

  return v21;
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIActivityItemsGetWebURLs(v4, 0);
  [(SHQuickNoteActivity *)self set_urls:v5];

  uint64_t v6 = _UIActivityItemsGetImages(v4, 0, 0);
  [(SHQuickNoteActivity *)self set_images:v6];

  v19 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F225F8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (isKindOfClass)
        {
          if (isKindOfClass)
          {
            id v15 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
          }
          else
          {
            id v15 = v13;
          }
          int v16 = v15;
          _UIActivityUTIForURL(v15);
          CFStringRef v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = (__CFString *)v17;
          if (v17 && UTTypeConformsTo(v17, v11)) {
            [v19 addObject:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(SHQuickNoteActivity *)self set_imageFileURLs:v19];
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [(SHQuickNoteActivity *)self isQuickNoteExtensionInstalled];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  uint64_t v10 = (void *)getSYNotesActivationRequestClass_softClass;
  uint64_t v48 = getSYNotesActivationRequestClass_softClass;
  if (!getSYNotesActivationRequestClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __getSYNotesActivationRequestClass_block_invoke;
    v43 = &unk_1E5A216E8;
    v44 = &v45;
    __getSYNotesActivationRequestClass_block_invoke((uint64_t)&v40);
    uint64_t v10 = (void *)v46[3];
  }
  CFStringRef v11 = v10;
  _Block_object_dispose(&v45, 8);
  id v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "setShouldAutoInsertLinkToCurrentActivity:", -[SHQuickNoteActivity _hasUserActivityCurrent](self, "_hasUserActivityCurrent"));
  if (v9)
  {
    uint64_t v13 = [(SHQuickNoteActivity *)self _urls];
    BOOL v14 = [v13 count] == 0;

    if (!v14)
    {
      id v15 = [(SHQuickNoteActivity *)self _urls];
      [v12 addURLs:v15];
    }
    int v16 = [(SHQuickNoteActivity *)self _images];
    BOOL v17 = [v16 count] == 0;

    if (!v17)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v18 = [(SHQuickNoteActivity *)self _images];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v37 != v20) {
              objc_enumerationMutation(v18);
            }
            long long v22 = *(UIImage **)(*((void *)&v36 + 1) + 8 * i);
            if ([(UIImage *)v22 imageOrientation]) {
              UIImageJPEGRepresentation(v22, 0.9);
            }
            else {
            long long v23 = UIImagePNGRepresentation(v22);
            }
            if (v23) {
              [v12 addImageData:v23];
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
        }
        while (v19);
      }
    }
    BOOL v24 = [(SHQuickNoteActivity *)self _imageFileURLs];
    BOOL v25 = [v24 count] == 0;

    if (!v25)
    {
      v26 = [(SHQuickNoteActivity *)self _imageFileURLs];
      [v12 addImageFileURLs:v26];
    }
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  v27 = (void *)getSYNotesActivationCommandClass_softClass;
  uint64_t v48 = getSYNotesActivationCommandClass_softClass;
  if (!getSYNotesActivationCommandClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __getSYNotesActivationCommandClass_block_invoke;
    v43 = &unk_1E5A216E8;
    v44 = &v45;
    __getSYNotesActivationCommandClass_block_invoke((uint64_t)&v40);
    v27 = (void *)v46[3];
  }
  v28 = v27;
  _Block_object_dispose(&v45, 8);
  id v29 = objc_alloc_init(v28);
  [v29 setActivationRequest:v12];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke;
  v33[3] = &unk_1E5A22DE0;
  v33[4] = self;
  id v34 = v7;
  id v35 = v8;
  id v30 = v8;
  id v31 = v7;
  [v29 activateWithCompletion:v33];

  return 1;
}

void __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SHQuickNoteLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_48;
  block[3] = &unk_1E5A21D20;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_48(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureQuickNotePresentationDelegateWithPresenterViewController:*(void *)(a1 + 40)];
  unsigned __int8 v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_configureQuickNotePresentationDelegateWithPresenterViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    while (1)
    {
      NSClassFromString(&cfstr_Icsystempapere.isa);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v5 presentedViewController];

      uint64_t v5 = (void *)v6;
      if (!v6) {
        goto LABEL_7;
      }
    }
    [(SHQuickNoteActivity *)self setSystemPaperViewController:v5];
  }
LABEL_7:
  uint64_t v7 = [(SHQuickNoteActivity *)self systemPaperViewController];
  if (v7
    && (id v8 = (void *)v7,
        [(SHQuickNoteActivity *)self systemPaperViewController],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isBeingDismissed],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    id v11 = [(SHQuickNoteActivity *)self systemPaperViewController];
    [v11 setPresentationDelegate:self];
  }
  else
  {
    [(UIActivity *)self activityDidFinish:0];
  }
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  BOOL v17 = __78__SHQuickNoteActivity__dismissActivityFromViewController_animated_completion___block_invoke;
  uint64_t v18 = &unk_1E5A22578;
  uint64_t v19 = self;
  id v20 = v8;
  id v9 = v8;
  char v10 = (void (**)(void))MEMORY[0x1A6229A90](&v15);
  if (v7)
  {
    BOOL v11 = 1;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v10, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    id v12 = [(SHQuickNoteActivity *)self systemPaperViewController];

    if (v12)
    {
      uint64_t v13 = [(SHQuickNoteActivity *)self systemPaperViewController];
      BOOL v11 = 1;
      [v13 dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      v10[2](v10);
      BOOL v11 = 0;
    }
  }

  return v11;
}

uint64_t __78__SHQuickNoteActivity__dismissActivityFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSystemPaperViewController:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)systemPaperDidFinishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  uint64_t v6 = v5;
  if (v5 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v7 = [v4 code];

    if (v7 == 3072)
    {
      id v8 = SHQuickNoteLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SHQuickNoteActivity systemPaperDidFinishWithError:](v8);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v4)
  {
    id v8 = SHQuickNoteLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SHQuickNoteActivity systemPaperDidFinishWithError:](v4, v8);
    }
LABEL_9:
  }
  [(UIActivity *)self activityDidFinish:v4 == 0];
}

- (NSArray)_urls
{
  return self->__urls;
}

- (void)set_urls:(id)a3
{
}

- (NSArray)_images
{
  return self->__images;
}

- (void)set_images:(id)a3
{
}

- (NSArray)_imageFileURLs
{
  return self->__imageFileURLs;
}

- (void)set_imageFileURLs:(id)a3
{
}

- (BOOL)_hasSupportedShareableItems
{
  return self->__hasSupportedShareableItems;
}

- (void)set_hasSupportedShareableItems:(BOOL)a3
{
  self->__hasSupportedShareableItems = a3;
}

- (BOOL)_hasUserActivityCurrent
{
  return self->__hasUserActivityCurrent;
}

- (void)set_hasUserActivityCurrent:(BOOL)a3
{
  self->__hasUserActivityCurrent = a3;
}

- (ICSystemPaperExtensionHostViewController)systemPaperViewController
{
  return self->_systemPaperViewController;
}

- (void)setSystemPaperViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPaperViewController, 0);
  objc_storeStrong((id *)&self->__imageFileURLs, 0);
  objc_storeStrong((id *)&self->__images, 0);
  objc_storeStrong((id *)&self->__urls, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
}

void __27__SHQuickNoteActivity_init__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch local user activity: %@", (uint8_t *)&v3, 0xCu);
}

void __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Quick Note invocation failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)systemPaperDidFinishWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_DEBUG, "Quick Note presentation cancelled", v1, 2u);
}

- (void)systemPaperDidFinishWithError:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Quick Note presentation finished with error: %@", (uint8_t *)&v4, 0xCu);
}

@end