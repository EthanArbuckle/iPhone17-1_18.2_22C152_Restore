@interface ICMarkupPresenter
+ (void)markupAttachment:(id)a3 fromView:(id)a4 presentingViewController:(id)a5 inkStyle:(unint64_t)a6 frameBlock:(id)a7 startPresentBlock:(id)a8 completionBlock:(id)a9 dismissCompletionBlock:(id)a10;
- (BOOL)markupWasDismissedByUserInteraction;
- (ICAttachment)attachment;
- (MURemoteViewController)markupRemoteViewController;
- (MarkupViewController)markupViewController;
- (UIViewController)presentingViewController;
- (id)completionBlock;
- (id)dismissCompletionBlock;
- (id)frameBlock;
- (id)startPresentBlock;
- (unint64_t)inkStyle;
- (void)dismissMarkupViewController;
- (void)handleReturnedURL:(id)a3;
- (void)markupCancelAction:(id)a3;
- (void)markupDoneAction:(id)a3;
- (void)markupViewWillDissappear;
- (void)presentMarkupFromView:(id)a3;
- (void)presentMarkupUsingExtensionFromView:(id)a3;
- (void)presentMarkupViewControllerFromView:(id)a3;
- (void)saveChangesAndDismiss;
- (void)setAttachment:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDismissCompletionBlock:(id)a3;
- (void)setFrameBlock:(id)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setMarkupRemoteViewController:(id)a3;
- (void)setMarkupViewController:(id)a3;
- (void)setMarkupWasDismissedByUserInteraction:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setStartPresentBlock:(id)a3;
@end

@implementation ICMarkupPresenter

+ (void)markupAttachment:(id)a3 fromView:(id)a4 presentingViewController:(id)a5 inkStyle:(unint64_t)a6 frameBlock:(id)a7 startPresentBlock:(id)a8 completionBlock:(id)a9 dismissCompletionBlock:(id)a10
{
  id v26 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = [v26 attachmentModel];
  int v22 = [v21 isReadyToPresent];

  if (v22)
  {
    v23 = (void *)currentMarkupPresenter;
    if (!currentMarkupPresenter)
    {
      v24 = objc_alloc_init(ICMarkupPresenter);
      v25 = (void *)currentMarkupPresenter;
      currentMarkupPresenter = (uint64_t)v24;

      v23 = (void *)currentMarkupPresenter;
    }
    [v23 setAttachment:v26];
    [(id)currentMarkupPresenter setPresentingViewController:v16];
    [(id)currentMarkupPresenter setInkStyle:a6];
    [(id)currentMarkupPresenter setFrameBlock:v17];
    [(id)currentMarkupPresenter setStartPresentBlock:v18];
    [(id)currentMarkupPresenter setCompletionBlock:v19];
    [(id)currentMarkupPresenter setDismissCompletionBlock:v20];
    [(id)currentMarkupPresenter presentMarkupFromView:v15];
  }
}

- (void)presentMarkupFromView:(id)a3
{
  id v6 = a3;
  v4 = [(ICMarkupPresenter *)self attachment];
  int v5 = [v4 shouldEmbedMarkupDataInMedia];

  if (v5) {
    [(ICMarkupPresenter *)self presentMarkupUsingExtensionFromView:v6];
  }
  else {
    [(ICMarkupPresenter *)self presentMarkupViewControllerFromView:v6];
  }
}

- (void)markupCancelAction:(id)a3
{
  [(ICMarkupPresenter *)self setMarkupWasDismissedByUserInteraction:1];

  [(ICMarkupPresenter *)self dismissMarkupViewController];
}

- (void)markupDoneAction:(id)a3
{
  [(ICMarkupPresenter *)self setMarkupWasDismissedByUserInteraction:1];

  [(ICMarkupPresenter *)self saveChangesAndDismiss];
}

- (void)markupViewWillDissappear
{
  if (![(ICMarkupPresenter *)self markupWasDismissedByUserInteraction])
  {
    [(ICMarkupPresenter *)self saveChangesAndDismiss];
  }
}

- (void)saveChangesAndDismiss
{
  v3 = [(ICMarkupPresenter *)self markupViewController];
  v4 = [v3 createArchivedModelData];

  if (v4)
  {
    int v5 = [(ICMarkupPresenter *)self markupViewController];
    id v6 = [v5 dataRepresentationEmbeddingSourceImageAndEditModel:0 error:0];

    v7 = (void *)MEMORY[0x263F5AC78];
    v8 = [(ICMarkupPresenter *)self attachment];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__ICMarkupPresenter_saveChangesAndDismiss__block_invoke;
    v12[3] = &unk_2640B82D8;
    v12[4] = self;
    id v13 = v6;
    id v9 = v6;
    [v7 applyMarkupModelData:v4 attachment:v8 completionBlock:v12];
  }
  else
  {
    v10 = [(ICMarkupPresenter *)self completionBlock];

    if (v10)
    {
      v11 = [(ICMarkupPresenter *)self completionBlock];
      v11[2](v11, 0);
    }
    [(ICMarkupPresenter *)self dismissMarkupViewController];
  }
}

uint64_t __42__ICMarkupPresenter_saveChangesAndDismiss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completionBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
  v4 = *(void **)(a1 + 32);

  return [v4 dismissMarkupViewController];
}

- (void)dismissMarkupViewController
{
  v3 = [(ICMarkupPresenter *)self dismissCompletionBlock];
  [(ICMarkupPresenter *)self setDismissCompletionBlock:0];
  [(ICMarkupPresenter *)self setMarkupViewController:0];
  v4 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;

  int v5 = [(ICMarkupPresenter *)self presentingViewController];
  id v6 = [v5 presentedViewController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__ICMarkupPresenter_dismissMarkupViewController__block_invoke;
  v8[3] = &unk_2640B8B80;
  id v9 = v3;
  id v7 = v3;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __48__ICMarkupPresenter_dismissMarkupViewController__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentMarkupViewControllerFromView:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F5AC78] createMarkupViewController];
  objc_msgSend(v5, "setInkStyle:", -[ICMarkupPresenter inkStyle](self, "inkStyle"));
  id v6 = [(ICMarkupPresenter *)self attachment];
  id v7 = [v6 markupModelData];
  v8 = [MEMORY[0x263F5AC78] dataToEditForAttachment:v6 includeMarkupModelData:0];
  id v9 = [v6 image];
  [v5 setData:v8 withArchivedModelData:v7 placeholderImage:v9];

  v10 = [[ICMarkupNavigationController alloc] initWithRootViewController:v5];
  [(ICMarkupPresenter *)self setMarkupWasDismissedByUserInteraction:0];
  [(ICMarkupNavigationController *)v10 setMarkupDelegate:self];
  v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_markupDoneAction_];
  v12 = [v5 navigationItem];
  [v12 setLeftBarButtonItem:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_markupCancelAction_];
  v14 = [v5 navigationItem];
  [v14 setRightBarButtonItem:v13];

  [(ICMarkupPresenter *)self setMarkupViewController:v5];
  [(ICMarkupNavigationController *)v10 setModalTransitionStyle:2];
  [(ICMarkupNavigationController *)v10 setModalPresentationStyle:0];
  id v15 = [MEMORY[0x263F825C8] ICExtractedDocumentViewControllerBackgroundColor];
  [v5 setBackgroundColor:v15];

  id v16 = [(ICMarkupPresenter *)self startPresentBlock];
  [(ICMarkupPresenter *)self setStartPresentBlock:0];
  if (v16)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke;
    v21[3] = &unk_2640B82D8;
    v21[4] = self;
    int v22 = v10;
    ((void (**)(void, void *))v16)[2](v16, v21);
  }
  else
  {
    objc_initWeak(&location, self);
    id v17 = [(ICMarkupPresenter *)self presentingViewController];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_2;
    v18[3] = &unk_2640B7F90;
    objc_copyWeak(&v19, &location);
    [v17 presentViewController:v10 animated:1 completion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained markupViewController];
    *(_DWORD *)buf = 67109120;
    int v8 = [v4 isFirstResponder];
    _os_log_impl(&dword_20BE60000, v2, OS_LOG_TYPE_DEFAULT, "MarkupViewController finished presenting, isFirstResponder: %d", buf, 8u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_19;
  block[3] = &unk_2640B7F90;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
}

void __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_19(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained markupViewController];
  char v4 = [v3 isFirstResponder];

  if ((v4 & 1) == 0)
  {
    int v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_20BE60000, v5, OS_LOG_TYPE_DEFAULT, "Make MarkupViewController become first responder", v8, 2u);
    }

    id v6 = objc_loadWeakRetained(v1);
    id v7 = [v6 markupViewController];
    [v7 becomeFirstResponder];
  }
}

- (void)presentMarkupUsingExtensionFromView:(id)a3
{
  v85[5] = *MEMORY[0x263EF8340];
  id v57 = a3;
  id v72 = 0;
  v58 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.MarkupUI.MarkupPrivateExtension" error:&v72];
  id v53 = v72;
  if (v53) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v58 == 0;
  }
  if (!v4) {
    goto LABEL_9;
  }
  int v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ICMarkupPresenter presentMarkupUsingExtensionFromView:]((uint64_t)v53, v5);
  }

  if (v58)
  {
LABEL_9:
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke;
    v71[3] = &unk_2640BB6A8;
    v71[4] = self;
    v71[5] = a2;
    [v58 setRequestCompletionBlock:v71];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2;
    v70[3] = &unk_2640BB6D0;
    v70[4] = self;
    v70[5] = a2;
    [v58 setRequestCancellationBlock:v70];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_25;
    v69[3] = &unk_2640BB6F8;
    v69[4] = self;
    v69[5] = a2;
    [v58 setRequestInterruptionBlock:v69];
    id v55 = objc_alloc_init(MEMORY[0x263F088E0]);
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    id v6 = [(ICMarkupPresenter *)self attachment];
    id v7 = [v6 managedObjectContext];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_29;
    v64[3] = &unk_2640B92A8;
    v64[4] = self;
    v64[5] = &v65;
    [v7 performBlockAndWait:v64];

    int v8 = (void *)*MEMORY[0x263F1DA48];
    if (*((unsigned char *)v66 + 24))
    {
      uint64_t v9 = [v8 identifier];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3;
      v63[3] = &unk_2640BB720;
      v63[4] = self;
      [v55 registerItemForTypeIdentifier:v9 loadHandler:v63];
    }
    else
    {
      uint64_t v9 = [v8 identifier];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_32;
      v62[3] = &unk_2640BB720;
      v62[4] = self;
      [v55 registerItemForTypeIdentifier:v9 loadHandler:v62];
    }

    v10 = [(ICMarkupPresenter *)self frameBlock];
    ((void (**)(void, id))v10)[2](v10, v57);
    objc_msgSend(v57, "convertRect:toView:", 0);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    id v19 = (id *)getMUAnimationSourceRectSymbolLoc_ptr;
    uint64_t v81 = getMUAnimationSourceRectSymbolLoc_ptr;
    if (!getMUAnimationSourceRectSymbolLoc_ptr)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __getMUAnimationSourceRectSymbolLoc_block_invoke;
      v76 = &unk_2640B9818;
      v77 = &v78;
      id v20 = (void *)MarkupUILibrary();
      v21 = dlsym(v20, "MUAnimationSourceRect");
      *(void *)(v77[1] + 24) = v21;
      getMUAnimationSourceRectSymbolLoc_ptr = *(void *)(v77[1] + 24);
      id v19 = (id *)v79[3];
    }
    _Block_object_dispose(&v78, 8);
    if (v19)
    {
      id v52 = *v19;
      v84[0] = v52;
      v86.origin.x = v12;
      v86.origin.y = v14;
      v86.size.width = v16;
      v86.size.height = v18;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v86);
      v85[0] = DictionaryRepresentation;
      int v22 = getMUAnimationMaskRect();
      v84[1] = v22;
      v87.origin.x = v12;
      v87.origin.y = v14;
      v87.size.width = v16;
      v87.size.height = v18;
      CFDictionaryRef v23 = CGRectCreateDictionaryRepresentation(v87);
      v85[1] = v23;
      uint64_t v78 = 0;
      v79 = &v78;
      uint64_t v80 = 0x2020000000;
      v24 = (id *)getMUAnimationIconImageSymbolLoc_ptr;
      uint64_t v81 = getMUAnimationIconImageSymbolLoc_ptr;
      if (!getMUAnimationIconImageSymbolLoc_ptr)
      {
        uint64_t v73 = MEMORY[0x263EF8330];
        uint64_t v74 = 3221225472;
        v75 = __getMUAnimationIconImageSymbolLoc_block_invoke;
        v76 = &unk_2640B9818;
        v77 = &v78;
        v25 = (void *)MarkupUILibrary();
        id v26 = dlsym(v25, "MUAnimationIconImage");
        *(void *)(v77[1] + 24) = v26;
        getMUAnimationIconImageSymbolLoc_ptr = *(void *)(v77[1] + 24);
        v24 = (id *)v79[3];
      }
      _Block_object_dispose(&v78, 8);
      if (v24)
      {
        id v27 = *v24;
        v84[2] = v27;
        v28 = [(ICMarkupPresenter *)self attachment];
        v29 = [v28 image];
        v85[2] = v29;
        uint64_t v78 = 0;
        v79 = &v78;
        uint64_t v80 = 0x2020000000;
        v30 = (id *)getMUDisplayAsFullScreenSymbolLoc_ptr;
        uint64_t v81 = getMUDisplayAsFullScreenSymbolLoc_ptr;
        if (!getMUDisplayAsFullScreenSymbolLoc_ptr)
        {
          uint64_t v73 = MEMORY[0x263EF8330];
          uint64_t v74 = 3221225472;
          v75 = __getMUDisplayAsFullScreenSymbolLoc_block_invoke;
          v76 = &unk_2640B9818;
          v77 = &v78;
          v31 = (void *)MarkupUILibrary();
          v32 = dlsym(v31, "MUDisplayAsFullScreen");
          *(void *)(v77[1] + 24) = v32;
          getMUDisplayAsFullScreenSymbolLoc_ptr = *(void *)(v77[1] + 24);
          v30 = (id *)v79[3];
        }
        _Block_object_dispose(&v78, 8);
        if (v30)
        {
          id v33 = *v30;
          v84[3] = v33;
          v85[3] = MEMORY[0x263EFFA88];
          uint64_t v78 = 0;
          v79 = &v78;
          uint64_t v80 = 0x2020000000;
          v34 = (id *)getMUEncryptPrivateMetadataSymbolLoc_ptr;
          uint64_t v81 = getMUEncryptPrivateMetadataSymbolLoc_ptr;
          if (!getMUEncryptPrivateMetadataSymbolLoc_ptr)
          {
            uint64_t v73 = MEMORY[0x263EF8330];
            uint64_t v74 = 3221225472;
            v75 = __getMUEncryptPrivateMetadataSymbolLoc_block_invoke;
            v76 = &unk_2640B9818;
            v77 = &v78;
            v35 = (void *)MarkupUILibrary();
            v36 = dlsym(v35, "MUEncryptPrivateMetadata");
            *(void *)(v77[1] + 24) = v36;
            getMUEncryptPrivateMetadataSymbolLoc_ptr = *(void *)(v77[1] + 24);
            v34 = (id *)v79[3];
          }
          _Block_object_dispose(&v78, 8);
          if (v34)
          {
            id v37 = *v34;
            v84[4] = v37;
            v85[4] = MEMORY[0x263EFFA80];
            v38 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:5];
            v39 = (void *)[v38 mutableCopy];

            v40 = [(ICMarkupPresenter *)self attachment];
            v41 = [v40 previewItemTitle];
            BOOL v42 = [v41 length] == 0;

            if (v42)
            {
LABEL_29:
              id v49 = objc_alloc_init(MEMORY[0x263F08810]);
              [v49 setUserInfo:v39];
              id v83 = v55;
              v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
              [v49 setAttachments:v50];

              id v82 = v49;
              v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
              v59[0] = MEMORY[0x263EF8330];
              v59[1] = 3221225472;
              v59[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_36;
              v59[3] = &unk_2640BB798;
              v59[4] = self;
              SEL v61 = a2;
              id v60 = v57;
              [v58 instantiateViewControllerWithInputItems:v51 connectionHandler:v59];

              _Block_object_dispose(&v65, 8);
              goto LABEL_30;
            }
            v43 = [(ICMarkupPresenter *)self attachment];
            v44 = [v43 previewItemTitle];
            uint64_t v78 = 0;
            v79 = &v78;
            uint64_t v80 = 0x2020000000;
            v45 = (id *)getMUFileDisplayNameSymbolLoc_ptr;
            uint64_t v81 = getMUFileDisplayNameSymbolLoc_ptr;
            if (!getMUFileDisplayNameSymbolLoc_ptr)
            {
              uint64_t v73 = MEMORY[0x263EF8330];
              uint64_t v74 = 3221225472;
              v75 = __getMUFileDisplayNameSymbolLoc_block_invoke;
              v76 = &unk_2640B9818;
              v77 = &v78;
              v46 = (void *)MarkupUILibrary();
              v47 = dlsym(v46, "MUFileDisplayName");
              *(void *)(v77[1] + 24) = v47;
              getMUFileDisplayNameSymbolLoc_ptr = *(void *)(v77[1] + 24);
              v45 = (id *)v79[3];
            }
            _Block_object_dispose(&v78, 8);
            if (v45)
            {
              id v48 = *v45;
              [v39 setObject:v44 forKeyedSubscript:v48];

              goto LABEL_29;
            }
          }
        }
      }
    }
    dlerror();
    abort_report_np();
    __break(1u);
  }
LABEL_30:
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@ B", buf, 0x16u);
  }
  double v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20BE60000, v11, OS_LOG_TYPE_DEFAULT, "RequestCompletionBlock id: %@ items: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_21;
  block[3] = &unk_2640B8140;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_21(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@ C", buf, 0x16u);
  }
  double v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20BE60000, v11, OS_LOG_TYPE_DEFAULT, "RequestCancellationBlock id: %@ error: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_23;
  block[3] = &unk_2640B8140;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_23(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  v3 = *(void **)(a1 + 32);

  return [v3 setMarkupRemoteViewController:0];
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_25(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    double v13 = v7;
    _os_log_impl(&dword_20BE60000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@ D", buf, 0x16u);
  }
  int v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_DEFAULT, "RequestInterruptionBlock id: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_26;
  block[3] = &unk_2640B8140;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_26(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  id v3 = *(void **)(a1 + 32);

  return [v3 setMarkupRemoteViewController:0];
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_29(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) attachment];
  id v2 = [v3 media];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isPasswordProtected];
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__23;
  __int16 v15 = __Block_byref_object_dispose__23;
  id v16 = 0;
  int v8 = [*(id *)(a1 + 32) attachment];
  uint64_t v9 = [v8 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_30;
  v10[3] = &unk_2640B92A8;
  v10[4] = *(void *)(a1 + 32);
  v10[5] = &v11;
  [v9 performBlockAndWait:v10];

  v6[2](v6, v12[5], 0);
  _Block_object_dispose(&v11, 8);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_30(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) attachment];
  id v2 = [v6 media];
  uint64_t v3 = [v2 decryptedData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_32(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F5AC78];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  id v5 = [v3 attachment];
  id v6 = [v2 dataToEditForAttachment:v5 includeMarkupModelData:1];

  v4[2](v4, v6, 0);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_36(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_36_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_37;
    v10[3] = &unk_2640BA108;
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    uint64_t v13 = v9;
    id v11 = v6;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_37(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    v21 = v4;
    __int16 v22 = 2112;
    CFDictionaryRef v23 = v5;
    _os_log_impl(&dword_20BE60000, v2, OS_LOG_TYPE_DEFAULT, "%@ %@ E", buf, 0x16u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v6 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) setMarkupRemoteViewController:v6];
  id v7 = [*(id *)(a1 + 32) markupRemoteViewController];
  int v8 = [v7 view];
  [v8 setOpaque:0];

  uint64_t v9 = [MEMORY[0x263F825C8] clearColor];
  v10 = [*(id *)(a1 + 32) markupRemoteViewController];
  id v11 = [v10 view];
  [v11 setBackgroundColor:v9];

  id v12 = [*(id *)(a1 + 32) markupRemoteViewController];
  [v12 setModalPresentationStyle:5];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_38;
  v16[3] = &unk_2640BB770;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = *(id *)(a1 + 48);
  id v13 = v6;
  id v18 = v13;
  uint64_t v14 = [*(id *)(a1 + 32) markupRemoteViewController];
  [v14 setFinishedWithResultsCompletionBlock:v16];

  __int16 v15 = [*(id *)(a1 + 32) presentingViewController];
  [v15 presentViewController:*(void *)(a1 + 40) animated:0 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_38(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ic_isReachable"))
  {
    os_log_t WeakRetained = (os_log_t)objc_loadWeakRetained(a1 + 6);
    [WeakRetained handleReturnedURL:v3];
  }
  else
  {
    os_log_t WeakRetained = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_38_cold_1((uint64_t)a1, (uint64_t)v3, WeakRetained);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_39;
  block[3] = &unk_2640BB748;
  id v6 = a1[4];
  objc_copyWeak(&v8, a1 + 6);
  id v7 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_39(uint64_t a1)
{
  v26[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained frameBlock];
  v5[2](v5, *v3);
  objc_msgSend(v2, "convertRect:toView:", 0);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v14 = (id *)getMUAnimationTargetRectSymbolLoc_ptr;
  uint64_t v24 = getMUAnimationTargetRectSymbolLoc_ptr;
  if (!getMUAnimationTargetRectSymbolLoc_ptr)
  {
    __int16 v15 = (void *)MarkupUILibrary();
    v22[3] = (uint64_t)dlsym(v15, "MUAnimationTargetRect");
    getMUAnimationTargetRectSymbolLoc_ptr = v22[3];
    uint64_t v14 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
    __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    __break(1u);
  }
  v25[0] = *v14;
  id v16 = v25[0];
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v27);
  v26[0] = DictionaryRepresentation;
  id v18 = getMUAnimationMaskRect();
  v25[1] = v18;
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  CFDictionaryRef v19 = CGRectCreateDictionaryRepresentation(v28);
  v26[1] = v19;
  id v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  [*(id *)(a1 + 40) beginDismissWithInfo:v20];
}

- (void)handleReturnedURL:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__23;
  void v8[4] = __Block_byref_object_dispose__23;
  id v9 = [(ICMarkupPresenter *)self markupRemoteViewController];
  id v5 = (void *)MEMORY[0x263F5AC78];
  double v6 = [(ICMarkupPresenter *)self attachment];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ICMarkupPresenter_handleReturnedURL___block_invoke;
  v7[3] = &unk_2640B9818;
  v7[4] = v8;
  [v5 applyReturnedMarkupURL:v4 attachment:v6 completionBlock:v7];

  _Block_object_dispose(v8, 8);
}

void __39__ICMarkupPresenter_handleReturnedURL___block_invoke(uint64_t a1)
{
  id v2 = [(id)currentMarkupPresenter completionBlock];

  if (v2)
  {
    id v3 = [(id)currentMarkupPresenter completionBlock];
    v3[2](v3, 0);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  double v6 = MEMORY[0x263EF83A0];

  dispatch_async(v6, &__block_literal_global_26);
}

void __39__ICMarkupPresenter_handleReturnedURL___block_invoke_2()
{
  v0 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttachment:(id)a3
{
}

- (MURemoteViewController)markupRemoteViewController
{
  return self->_markupRemoteViewController;
}

- (void)setMarkupRemoteViewController:(id)a3
{
}

- (MarkupViewController)markupViewController
{
  return self->_markupViewController;
}

- (void)setMarkupViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)startPresentBlock
{
  return self->_startPresentBlock;
}

- (void)setStartPresentBlock:(id)a3
{
}

- (id)dismissCompletionBlock
{
  return self->_dismissCompletionBlock;
}

- (void)setDismissCompletionBlock:(id)a3
{
}

- (BOOL)markupWasDismissedByUserInteraction
{
  return self->_markupWasDismissedByUserInteraction;
}

- (void)setMarkupWasDismissedByUserInteraction:(BOOL)a3
{
  self->_markupWasDismissedByUserInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionBlock, 0);
  objc_storeStrong(&self->_startPresentBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_markupViewController, 0);
  objc_storeStrong((id *)&self->_markupRemoteViewController, 0);

  objc_storeStrong((id *)&self->_attachment, 0);
}

- (void)presentMarkupUsingExtensionFromView:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Could not get Markup extension: %@", (uint8_t *)&v2, 0xCu);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_36_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Error instantiateViewControllerWithInputItems: %@", (uint8_t *)&v2, 0xCu);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_38_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v6 = [WeakRetained attachment];
  int v7 = 138412546;
  double v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Markup result URL is not reachable {attachment: %@, url: %@}", (uint8_t *)&v7, 0x16u);
}

@end