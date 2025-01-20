@interface UIKeyboardMediaController
+ (id)sharedKeyboardMediaController;
- (BOOL)_stickerIsSupportedPayload;
- (BOOL)recentsViewWillBeVisible;
- (BOOL)remoteHandlesRecentsStickerDonation;
- (BOOL)shouldPrefetchRemoteView;
- (BOOL)shouldRetryFetchingRecents;
- (UIKeyboardMediaControllerDelegate)delegate;
- (void)_didInsertMedia;
- (void)_didPresentCard;
- (void)_displayiMessageAppWithID:(id)a3;
- (void)_embedRecentlyUsedMediaViewInView:(id)a3 animated:(BOOL)a4;
- (void)_instantiateCardFromViewService;
- (void)_instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:(id)a3;
- (void)_keyboardDidChangeFrame:(id)a3;
- (void)_presentiMessageApp;
- (void)_setRecentlyUsedMediaViewControllerHostBundleID;
- (void)_tearDownRemoteViews;
- (void)dismissCardAnimated;
- (void)dismissCardIfNeeded;
- (void)draggedStickerToPoint:(CGPoint)a3;
- (void)handleStickerSuggestionWithTISticker:(id)a3;
- (void)pasteImageAtFileHandle:(id)a3;
- (void)prefetchRecentsViewControllerWithCompletion:(id)a3;
- (void)presentCard;
- (void)releaseRecentlyUsedMediaViewIfNeeded;
- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3;
- (void)requestInsertionPointCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showRecentlyUsedMediaInView:(id)a3;
- (void)stageSticker:(id)a3;
- (void)stageStickerWithFileHandle:(id)a3 url:(id)a4 accessibilityLabel:(id)a5;
- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7;
@end

@implementation UIKeyboardMediaController

+ (id)sharedKeyboardMediaController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIKeyboardMediaController_sharedKeyboardMediaController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB260468 != -1) {
    dispatch_once(&qword_1EB260468, block);
  }
  v2 = (void *)_MergedGlobals_1033;
  return v2;
}

void __58__UIKeyboardMediaController_sharedKeyboardMediaController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1033;
  _MergedGlobals_1033 = (uint64_t)v1;
}

- (void)handleStickerSuggestionWithTISticker:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v44 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v3 = [v39 representations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v59;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v59 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v58 + 1) + 8 * v6);
        v8 = objc_alloc_init(_UIStickerRepresentation);
        v9 = [v7 data];
        [(_UIStickerRepresentation *)v8 setData:v9];

        v10 = [v7 uti];
        v11 = [v10 identifier];
        [(_UIStickerRepresentation *)v8 setType:v11];

        v12 = [v7 role];
        [(_UIStickerRepresentation *)v8 setRole:v12];

        [v7 size];
        -[_UIStickerRepresentation setSize:](v8, "setSize:");
        [v44 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v4);
  }

  v43 = objc_opt_new();
  v13 = [v39 identifier];
  v14 = [v13 UUIDString];
  [v43 setIdentifier:v14];

  [v43 setRepresentations:v44];
  v15 = [v39 name];
  [v43 setName:v15];

  v16 = [v39 externalURI];
  [v43 setExternalURI:v16];

  v17 = [v39 accessibilityLabel];
  [v43 setAccessibilityLabel:v17];

  v18 = [v39 metadata];
  [v43 setMetadata:v18];

  v19 = [v39 searchText];
  [v43 setSearchText:v19];

  v20 = [v39 accessibilityName];
  [v43 setAccessibilityName:v20];

  v21 = [v39 attributionInfo];
  [v43 setAttributionInfo:v21];

  objc_msgSend(v43, "setEffectType:", objc_msgSend(v39, "effectType"));
  v22 = [v39 metadata];
  [v43 setMetadata:v22];

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2050000000;
  v23 = (void *)qword_1EB260470;
  uint64_t v65 = qword_1EB260470;
  if (!qword_1EB260470)
  {
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    uint64_t v50 = (uint64_t)__getVKCStickerEffectClass_block_invoke;
    v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52D9900;
    v52 = (void (*)(uint64_t))&v62;
    __getVKCStickerEffectClass_block_invoke((uint64_t)&v48);
    v23 = (void *)v63[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v62, 8);
  v42 = objc_msgSend(v24, "effectWithType:", objc_msgSend(v39, "effectType"));
  if ([v42 type])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = [v43 representations];
    uint64_t v25 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v25)
    {
      uint64_t v41 = *(void *)v55;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v55 != v41) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v54 + 1) + 8 * v26);
          dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
          CFDataRef v29 = [v27 data];
          ImageFromData = _UIStickerCreateImageFromData(v29);

          v31 = [[UIImage alloc] initWithCGImage:ImageFromData];
          CGImageRelease(ImageFromData);
          uint64_t v48 = 0;
          uint64_t v49 = (uint64_t)&v48;
          uint64_t v50 = 0x3032000000;
          v51 = __Block_byref_object_copy__81;
          v52 = __Block_byref_object_dispose__81;
          id v53 = 0;
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __66__UIKeyboardMediaController_handleStickerSuggestionWithTISticker___block_invoke;
          v45[3] = &unk_1E52ED0A8;
          v47 = &v48;
          v32 = v28;
          v46 = v32;
          [v42 applyToImage:v31 completion:v45];
          dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
          v33 = (CGImage *)[*(id *)(v49 + 40) CGImage];
          v34 = [v27 type];
          v35 = [v43 metadata];
          v36 = _UIStickerDataFromImageWithMetadata(v33, v34, v35);

          [v27 setData:v36];
          _Block_object_dispose(&v48, 8);

          ++v26;
        }
        while (v25 != v26);
        uint64_t v25 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v25);
    }
  }
  v37 = [[_UIStickerUsageEvent alloc] initWithSuggestedSticker:v43];
  [(_UIStickerUsageEvent *)v37 setUsageType:0];
  [(_UIStickerUsageEvent *)v37 send];
  v38 = +[UIKeyboardImpl activeInstance];
  [v38 insertSticker:v43];
}

void __66__UIKeyboardMediaController_handleStickerSuggestionWithTISticker___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)shouldPrefetchRemoteView
{
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled]
    || self->_recentlyUsedMediaViewController
    || self->_hasRequestedRecentlyUsedMediaViewController)
  {
    return 0;
  }
  return [(UIKeyboardMediaController *)self recentsViewWillBeVisible];
}

- (BOOL)recentsViewWillBeVisible
{
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled]) {
    return 0;
  }
  v3 = +[UIKeyboardEmojiPreferences sharedInstance];
  id v4 = +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", [v3 selectedCategoryType]);

  if ([v4 categoryType])
  {
    BOOL v2 = 0;
  }
  else
  {
    uint64_t v5 = +[UIKeyboardEmojiPreferences sharedInstance];
    uint64_t v6 = [v5 emojiCategoryDefaultsIndex:v4];

    BOOL v2 = v6 == 0;
  }

  return v2;
}

- (void)_embedRecentlyUsedMediaViewInView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(UIViewController *)self->_recentlyUsedMediaViewController parentViewController];

  if (v7)
  {
    v8 = [(UIViewController *)self->_recentlyUsedMediaViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)self->_recentlyUsedMediaViewController removeFromParentViewController];
  }
  v9 = [v6 _viewControllerForAncestor];
  [v9 addChildViewController:self->_recentlyUsedMediaViewController];
  v10 = [(UIViewController *)self->_recentlyUsedMediaViewController view];
  [v6 bounds];
  objc_msgSend(v10, "setFrame:");
  if (v4)
  {
    [v10 setAlpha:0.0];
    [v6 addSubview:v10];
    [(UIViewController *)self->_recentlyUsedMediaViewController didMoveToParentViewController:v9];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__UIKeyboardMediaController__embedRecentlyUsedMediaViewInView_animated___block_invoke;
    v11[3] = &unk_1E52D9F70;
    id v12 = v10;
    +[UIView animateWithDuration:v11 animations:0.15];
  }
  else
  {
    [v6 addSubview:v10];
    [(UIViewController *)self->_recentlyUsedMediaViewController didMoveToParentViewController:v9];
  }
}

uint64_t __72__UIKeyboardMediaController__embedRecentlyUsedMediaViewInView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)showRecentlyUsedMediaInView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_recentlyUsedMediaViewController)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIKeyboardMediaController *)self _setRecentlyUsedMediaViewControllerHostBundleID];
    }
    [(UIKeyboardMediaController *)self _embedRecentlyUsedMediaViewInView:v5 animated:0];
  }
  else
  {
    objc_storeWeak((id *)&self->_targetViewAwaitingRecents, v4);
    [(UIKeyboardMediaController *)self _instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:0];
  }
}

- (void)releaseRecentlyUsedMediaViewIfNeeded
{
  self->_hasRequestedRecentlyUsedMediaViewController = 0;
  recentlyUsedMediaViewController = self->_recentlyUsedMediaViewController;
  if (recentlyUsedMediaViewController)
  {
    [(UIViewController *)recentlyUsedMediaViewController willMoveToParentViewController:0];
    id v4 = [(UIViewController *)self->_recentlyUsedMediaViewController view];
    [v4 removeFromSuperview];

    [(UIViewController *)self->_recentlyUsedMediaViewController removeFromParentViewController];
    id v5 = self->_recentlyUsedMediaViewController;
    self->_recentlyUsedMediaViewController = 0;
  }
}

- (void)prefetchRecentsViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E52E3388;
  v13 = v14;
  id v5 = v4;
  id v12 = v5;
  id v6 = _Block_copy(aBlock);
  [(UIKeyboardMediaController *)self _instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:v6];
  dispatch_time_t v7 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke_2;
  block[3] = &unk_1E52DA040;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v14, 8);
}

uint64_t __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->_hasRequestedRecentlyUsedMediaViewController)
  {
    self->_hasRequestedRecentlyUsedMediaViewController = 1;
    kdebug_trace();
    id v5 = perfLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0x35uLL, "remote-view-fetch", "enableTelemetry=YES", buf, 2u);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__UIKeyboardMediaController__instantiateViewServiceRecentlyUsedMediaWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E52ED0D0;
    v8[4] = self;
    id v9 = v4;
    id v6 = +[UIKeyboardMediaServiceRemoteViewController requestInlineViewControllerWithConnectionHandler:v8];
    recentlyUsedMediaViewControllerRequest = self->_recentlyUsedMediaViewControllerRequest;
    self->_recentlyUsedMediaViewControllerRequest = v6;
  }
}

void __91__UIKeyboardMediaController__instantiateViewServiceRecentlyUsedMediaWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  kdebug_trace();
  dispatch_time_t v7 = perfLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v7, OS_SIGNPOST_INTERVAL_END, 0x35uLL, "remote-view-fetch", "enableTelemetry=YES", v14, 2u);
  }

  if (v6 && !a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 setDelegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) _setRecentlyUsedMediaViewControllerHostBundleID];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));

    if (WeakRetained)
    {
      id v9 = *(id **)(a1 + 32);
      id v10 = objc_loadWeakRetained(v9 + 5);
      [v9 _embedRecentlyUsedMediaViewInView:v10 animated:1];

      objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), 0);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = 0;
  }
}

- (void)_setRecentlyUsedMediaViewControllerHostBundleID
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    v3 = +[UIKeyboard keyboardBundleIdentifier];
  }
  else
  {
    v3 = &stru_1ED0E84C0;
  }
  id v4 = v3;
  [(UIViewController *)self->_recentlyUsedMediaViewController setHostBundleID:v3];
}

- (void)dismissCardIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIKeyboardMediaController_dismissCardIfNeeded__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__UIKeyboardMediaController_dismissCardIfNeeded__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:0];
    }
    [*(id *)(*(void *)(a1 + 32) + 8) willMoveToParentViewController:0];
    BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 8) view];
    [v2 removeFromSuperview];

    [*(id *)(*(void *)(a1 + 32) + 8) removeFromParentViewController];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 didDismissCardForKeyboardMediaController:*(void *)(a1 + 32)];
    }
  }
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(UIViewController *)self->_remoteCardViewController serviceViewControllerProxy];
    if (objc_opt_respondsToSelector())
    {
      id v4 = +[UIKeyboard activeKeyboard];
      +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", [v4 interfaceOrientation]);
      double v6 = v5;

      [v7 updateCompactCardHeight:v6];
    }
  }
}

- (void)_displayiMessageAppWithID:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    double v5 = [v4 inputSystemSourceSession];

    uint64_t v12 = *MEMORY[0x1E4FAE8D8];
    v13[0] = v3;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = (void *)[v6 mutableCopy];
    id v8 = [v5 textOperations];
    id v9 = [v8 keyboardOutput];
    [v9 setCustomInfo:v7];

    [v5 flushOperations];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__UIKeyboardMediaController__displayiMessageAppWithID___block_invoke;
    v10[3] = &unk_1E52D9F70;
    id v11 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v10);
    double v5 = v11;
  }
}

void __55__UIKeyboardMediaController__displayiMessageAppWithID___block_invoke(uint64_t a1)
{
  id v3 = +[UITextInputPayloadController sharedInstance];
  BOOL v2 = [v3 payloadDelegate];
  [v2 handlePayload:0 withPayloadId:*(void *)(a1 + 32)];
}

- (void)_tearDownRemoteViews
{
  unint64_t v3 = self->_viewServiceTerminationCount + 1;
  self->_viewServiceTerminationCount = v3;
  BOOL v4 = v3 <= 2 && [(id)UIApp applicationState] == 0;
  self->_shouldRetryFetchingRecents = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 didTearDownRecentsViewForKeyboardMediaController:self];
  }
  if (self->_shouldRetryFetchingRecents) {
    [(UIKeyboardMediaController *)self prefetchRecentsViewControllerWithCompletion:0];
  }
  [(UIKeyboardMediaController *)self releaseRecentlyUsedMediaViewIfNeeded];
  [(UIKeyboardMediaController *)self dismissCardIfNeeded];
}

- (void)_presentiMessageApp
{
  if (_os_feature_enabled_impl()) {
    unint64_t v3 = @"com.apple.messages.stickers";
  }
  else {
    unint64_t v3 = @"com.apple.messages.animoji.stickers";
  }
  [(UIKeyboardMediaController *)self _displayiMessageAppWithID:v3];
  [(UIKeyboardMediaController *)self _didPresentCard];
}

- (void)presentCard
{
  if (!self->_remoteCardViewControllerRequest)
  {
    unint64_t v3 = [(UIViewController *)self->_remoteCardViewController parentViewController];

    if (!v3)
    {
      BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 addObserver:self selector:sel_dismissCardAnimated name:@"UIKeyboardPrivateInteractiveDismissalDidBeginNotification" object:0];

      double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel__keyboardDidChangeFrame_ name:@"UIKeyboardDidChangeFrameNotification" object:0];

      id v11 = +[UIKeyboard keyboardBundleIdentifier];
      if ([v11 isEqualToString:@"com.apple.MobileSMS"]
        && (+[UITextInputPayloadController sharedInstance],
            char v6 = objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 supportsStickerTapbackPayload],
            v6,
            (v7 & 1) == 0))
      {
        [(UIKeyboardMediaController *)self _presentiMessageApp];
      }
      else if (_os_feature_enabled_impl())
      {
        BOOL v8 = +[UIKeyboard isKeyboardProcess];
        id v9 = +[UIKeyboardImpl activeInstance];
        id v10 = v9;
        if (v8) {
          objc_msgSend(v9, "forwardStickerEvent_presentCard");
        }
        else {
          objc_msgSend(v9, "handleStickerEvent_presentCard");
        }
      }
      else
      {
        [(UIKeyboardMediaController *)self _instantiateCardFromViewService];
      }
    }
  }
}

- (void)dismissCardAnimated
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardPrivateInteractiveDismissalDidBeginNotification" object:0];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIKeyboardDidChangeFrameNotification" object:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(UIViewController *)self->_remoteCardViewController serviceViewControllerProxy];
    if (objc_opt_respondsToSelector())
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48__UIKeyboardMediaController_dismissCardAnimated__block_invoke;
      v6[3] = &unk_1E52D9F70;
      v6[4] = self;
      [v5 animateCardHiddenWithCompletion:v6];
    }
  }
}

uint64_t __48__UIKeyboardMediaController_dismissCardAnimated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissCard];
}

- (void)_instantiateCardFromViewService
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__UIKeyboardMediaController__instantiateCardFromViewService__block_invoke;
  v5[3] = &unk_1E52ED0F8;
  v5[4] = self;
  unint64_t v3 = +[UIKeyboardMediaServiceRemoteViewController requestCardViewControllerWithConnectionHandler:v5];
  remoteCardViewControllerRequest = self->_remoteCardViewControllerRequest;
  self->_remoteCardViewControllerRequest = v3;
}

void __60__UIKeyboardMediaController__instantiateCardFromViewService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 setDelegate:*(void *)(a1 + 32)];
      char v7 = [v6 serviceViewControllerProxy];
      if (objc_opt_respondsToSelector())
      {
        BOOL v8 = +[UIKeyboard activeKeyboard];
        +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", [v8 interfaceOrientation]);
        double v10 = v9;

        [v7 updateCompactCardHeight:v10];
      }
    }
    id v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v31 = [v11 keyboardWindow];

    v30 = [v31 rootViewController];
    [v30 addChildViewController:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v12 = [v30 view];
    v13 = [v6 view];
    [v12 addSubview:v13];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v24 = (void *)MEMORY[0x1E4F5B268];
    CFDataRef v29 = [v13 topAnchor];
    dispatch_semaphore_t v28 = [v12 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    uint64_t v26 = [v13 leadingAnchor];
    uint64_t v25 = [v12 leadingAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v32[1] = v23;
    v22 = [v13 bottomAnchor];
    v14 = [v12 bottomAnchor];
    char v15 = [v22 constraintEqualToAnchor:v14];
    v32[2] = v15;
    v16 = [v13 trailingAnchor];
    v17 = [v12 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v32[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v24 activateConstraints:v19];

    [*(id *)(*(void *)(a1 + 32) + 8) didMoveToParentViewController:v30];
    uint64_t v20 = *(void *)(a1 + 32);
    v21 = *(void **)(v20 + 16);
    *(void *)(v20 + 16) = 0;

    [*(id *)(a1 + 32) _didPresentCard];
  }
}

- (void)_didPresentCard
{
  unint64_t v3 = [(UIKeyboardMediaController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKeyboardMediaController *)self delegate];
    [v5 didPresentCardForKeyboardMediaController:self];
  }
}

- (void)pasteImageAtFileHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v4;
  BOOL v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[UIKeyboardImpl activeInstance];
  unint64_t v3 = [v2 inputDelegateManager];
  id v4 = [v3 delegateRespectingForwardingDelegate:0];

  if ((objc_msgSend(v4, "__isKindOfUIResponder") & 1) == 0)
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    uint64_t v6 = [v5 delegateAsResponder];

    id v4 = (void *)v6;
  }
  id v7 = [v4 _responderForEditing];

  BOOL v8 = [*(id *)(a1 + 32) readDataToEndOfFile];
  id v9 = [[UIImage alloc] _initWithData:v8 preserveScale:1];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v10 registerObject:v9 visibility:3];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_2;
  v21[3] = &unk_1E52DD3E0;
  id v11 = v8;
  id v22 = v11;
  [v10 registerDataRepresentationForTypeIdentifier:@"com.apple.png-sticker" visibility:0 loadHandler:v21];
  uint64_t v12 = +[UIPasteboard generalPasteboard];
  v23[0] = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.5];
  [v12 _pinItemProviders:v13 expirationDate:v14];

  char v15 = [v7 targetForAction:sel_paste_ withSender:0];
  v16 = v15;
  if (v15)
  {
    if ([v15 conformsToProtocol:&unk_1ED7009A0])
    {
      id v17 = v16;
      if (objc_opt_respondsToSelector()) {
        [v17 pasteWithCompletionHandler:&__block_literal_global_191];
      }

      goto LABEL_15;
    }
    if ([v16 conformsToProtocol:&unk_1ED700940])
    {
      v19 = &__block_literal_global_515_0;
    }
    else
    {
      if (![v16 conformsToProtocol:&unk_1ED700D60])
      {
        [v16 paste:0];
        dispatch_time_t v20 = dispatch_time(0, 500000000);
        dispatch_after(v20, MEMORY[0x1E4F14428], &__block_literal_global_542);
        goto LABEL_15;
      }
      v19 = &__block_literal_global_540;
    }
    [v16 pasteWithCompletionHandler:v19];
LABEL_15:
    [*(id *)(a1 + 40) _didInsertMedia];
    goto LABEL_16;
  }
  v18 = +[UIPasteboard generalPasteboard];
  [v18 _clearPinnedItemProviders];

LABEL_16:
}

uint64_t __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_3()
{
  id v0 = +[UIPasteboard generalPasteboard];
  [v0 _clearPinnedItemProviders];
}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_4()
{
  id v0 = +[UIPasteboard generalPasteboard];
  [v0 _clearPinnedItemProviders];
}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_5()
{
  id v0 = +[UIPasteboard generalPasteboard];
  [v0 _clearPinnedItemProviders];
}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_6()
{
  id v0 = +[UIPasteboard generalPasteboard];
  [v0 _clearPinnedItemProviders];
}

- (void)stageStickerWithFileHandle:(id)a3 url:(id)a4 accessibilityLabel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__UIKeyboardMediaController_stageStickerWithFileHandle_url_accessibilityLabel___block_invoke;
  void v14[3] = &unk_1E52DD450;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  v18 = self;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __79__UIKeyboardMediaController_stageStickerWithFileHandle_url_accessibilityLabel___block_invoke(uint64_t a1)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard isInputSystemUI])
  {
    BOOL v2 = +[UIKeyboardImpl activeInstance];
    unint64_t v3 = [v2 inputDelegateManager];
    id v4 = [v3 inputSystemSourceSession];

    if (!v4)
    {
LABEL_7:
      [*(id *)(a1 + 56) _didInsertMedia];

      return;
    }
    id v5 = [v4 textOperations];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v16[0] = @"url";
    v16[1] = @"accessibilityLabel";
    uint64_t v8 = *(void *)(a1 + 48);
    v17[0] = v6;
    v17[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v5 insertImageWithFileHandle:v7 typeIdentifier:@"com.apple.png-sticker" imageUserInfo:v9];

    [v4 flushOperations];
LABEL_6:

    goto LABEL_7;
  }
  if ([*(id *)(a1 + 56) _stickerIsSupportedPayload])
  {
    v14[0] = @"url";
    v14[1] = @"accessibilityLabel";
    uint64_t v10 = *(void *)(a1 + 48);
    v15[0] = *(void *)(a1 + 40);
    v15[1] = v10;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v5 = +[UITextInputPayloadController sharedInstance];
    id v11 = [v5 payloadDelegate];
    [v11 handlePayload:v4 withPayloadId:@"com.apple.messages.stageSticker"];

    goto LABEL_6;
  }
  id v12 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 32);
  [v12 pasteImageAtFileHandle:v13];
}

- (void)stageSticker:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _UIKBMediaLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 identifier];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "UIKeyboardMediaController: Staging sticker with identifier %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = +[UIKeyboardImpl activeInstance];
  [v7 insertSticker:v4];

  [(UIKeyboardMediaController *)self _didInsertMedia];
}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = _UIKBMediaLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "UIKeyboardMediaController: Staging sticker using old protocol with identifier %@", (uint8_t *)&v20, 0xCu);
  }

  v18 = objc_opt_new();
  [v18 setIdentifier:v12];
  [v18 setRepresentations:v16];

  [v18 setName:v15];
  [v18 setExternalURI:v14];

  [v18 setAccessibilityLabel:v13];
  v19 = +[UIKeyboardImpl activeInstance];
  [v19 insertSticker:v18];

  [(UIKeyboardMediaController *)self _didInsertMedia];
}

- (void)_didInsertMedia
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 didInsertMediaForKeyboardMediaController:self];
  }
}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, void))a3;
    v4[2](v4, [(UIKeyboardMediaController *)self _stickerIsSupportedPayload] ^ 1);
  }
}

- (BOOL)remoteHandlesRecentsStickerDonation
{
  return ![(UIKeyboardMediaController *)self _stickerIsSupportedPayload];
}

- (BOOL)_stickerIsSupportedPayload
{
  BOOL v2 = +[UIKeyboardImpl activeInstance];
  unint64_t v3 = [v2 inputDelegateManager];
  id v4 = [v3 keyboardStateDelegate];
  char v5 = [v4 keyboardState];
  id v6 = [v5 supportedPayloadIds];

  LOBYTE(v2) = [v6 containsObject:@"com.apple.messages.stageSticker"];
  return (char)v2;
}

- (void)requestInsertionPointCompletion:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__UIKeyboardMediaController_requestInsertionPointCompletion___block_invoke;
    v6[3] = &unk_1E52DA160;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __61__UIKeyboardMediaController_requestInsertionPointCompletion___block_invoke(uint64_t a1)
{
  BOOL v2 = +[UIWindow _applicationKeyWindow];
  id v22 = [v2 firstResponder];

  if ([v22 conformsToProtocol:&unk_1ED42F658])
  {
    id v3 = v22;
    id v4 = *(void **)(*(void *)(a1 + 32) + 64);
    if (v4)
    {
      [v4 position];
      char v5 = objc_msgSend(v3, "closestPositionToPoint:");
      id v6 = [v3 textRangeFromPosition:v5 toPosition:v5];
      [v3 setSelectedTextRange:v6];
      [*(id *)(*(void *)(a1 + 32) + 64) remove];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(void **)(v7 + 64);
      *(void *)(v7 + 64) = 0;
    }
    id v9 = [v3 selectedTextRange];
    uint64_t v10 = [v3 positionWithinRange:v9 farthestInDirection:5];
    [v3 caretRectForPosition:v10];
    double v13 = v12 + v11 * 0.5;
    double v16 = v15 + v14 * 0.5;
    id v17 = [v3 textInputView];
    objc_msgSend(v17, "convertPoint:toView:", 0, v13, v16);
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DAD8];
    double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(v19, v21);
}

- (void)draggedStickerToPoint:(CGPoint)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardMediaController_draggedStickerToPoint___block_invoke;
  block[3] = &unk_1E52DD178;
  CGPoint v4 = a3;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__UIKeyboardMediaController_draggedStickerToPoint___block_invoke(uint64_t a1)
{
  BOOL v2 = +[UIWindow _applicationKeyWindow];
  id v15 = [v2 firstResponder];

  if ([v15 conformsToProtocol:&unk_1ED42F658])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v15;
      CGPoint v4 = [v3 textInputView];
      objc_msgSend(v4, "convertPoint:fromView:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
      double v6 = v5;
      double v8 = v7;

      id v9 = objc_msgSend(v3, "closestPositionToPoint:", v6, v8 + -35.0);
      uint64_t v10 = [v3 textRangeFromPosition:v9 toPosition:v9];
      double v11 = *(void **)(*(void *)(a1 + 32) + 64);
      if (v11)
      {
        [v11 updateToRange:v10 animations:0 completion:0 animated:1];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [*(id *)(*(void *)(a1 + 32) + 64) frame];
          CGRect v18 = CGRectInset(v17, -24.0, -24.0);
          objc_msgSend(v3, "scrollRectToVisible:animated:", 1, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
        }
      }
      else
      {
        [v3 setSelectedTextRange:0];
        double v12 = [[_UITextDragCaretView alloc] initWithTextInputView:v3];
        uint64_t v13 = *(void *)(a1 + 32);
        double v14 = *(void **)(v13 + 64);
        *(void *)(v13 + 64) = v12;

        [*(id *)(*(void *)(a1 + 32) + 64) insertAtRange:v10 animations:0 completion:0 animated:1];
      }
    }
  }
}

- (UIKeyboardMediaControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardMediaControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldRetryFetchingRecents
{
  return self->_shouldRetryFetchingRecents;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dropCaret, 0);
  objc_destroyWeak((id *)&self->_targetViewAwaitingRecents);
  objc_storeStrong((id *)&self->_recentlyUsedMediaViewControllerRequest, 0);
  objc_storeStrong((id *)&self->_recentlyUsedMediaViewController, 0);
  objc_storeStrong((id *)&self->_remoteCardViewControllerRequest, 0);
  objc_storeStrong((id *)&self->_remoteCardViewController, 0);
}

@end