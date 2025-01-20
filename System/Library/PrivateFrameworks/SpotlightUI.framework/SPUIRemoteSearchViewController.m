@interface SPUIRemoteSearchViewController
- (BOOL)isKeyboardPresented;
- (BOOL)prewarmSceneInTheBackground;
- (CGSize)dockedSearchBarSize;
- (CGSize)searchBarSize;
- (SPUIRemoteSearchViewController)init;
- (SPUIRemoteSearchViewDelegate)delegate;
- (UIView)dummyTransitionView;
- (double)distanceToTopOfIcons;
- (double)keyboardHeight;
- (double)keyboardProtectorHeight;
- (double)revealProgress;
- (double)searchBarCornerRadius;
- (id)didFinishDismissingSpotlightHandler;
- (id)finishedPresentingSpotlightHandler;
- (id)sceneSpecification;
- (id)willBeginDismissingSpotlightHandler;
- (id)willStartPresetingSpotlightHandler;
- (unint64_t)searchHeaderBackgroundLayerRenderID;
- (unint64_t)searchHeaderBlurLayerRenderID;
- (unint64_t)searchHeaderLayerRenderID;
- (unint64_t)source;
- (unsigned)searchHeaderBackgroundContextID;
- (unsigned)searchHeaderBlurContextID;
- (unsigned)searchHeaderContextID;
- (void)didInvalidateSceneWhenForeground;
- (void)finishCompletionHandlerIfNeeded;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidFinishDismissingSpotlightHandler:(id)a3;
- (void)setDistanceToTopOfIcons:(double)a3;
- (void)setDockedSearchBarSize:(CGSize)a3;
- (void)setDummyTransitionView:(id)a3;
- (void)setFinishedPresentingSpotlightHandler:(id)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setKeyboardPresented:(BOOL)a3;
- (void)setKeyboardProtectorHeight:(double)a3;
- (void)setRevealProgress:(double)a3;
- (void)setSearchBarCornerRadius:(double)a3;
- (void)setSearchBarSize:(CGSize)a3;
- (void)setSearchHeaderBackgroundContextID:(unsigned int)a3;
- (void)setSearchHeaderBackgroundLayerRenderID:(unint64_t)a3;
- (void)setSearchHeaderBlurContextID:(unsigned int)a3;
- (void)setSearchHeaderBlurLayerRenderID:(unint64_t)a3;
- (void)setSearchHeaderContextID:(unsigned int)a3;
- (void)setSearchHeaderLayerRenderID:(unint64_t)a3;
- (void)setSource:(unint64_t)a3;
- (void)setWillBeginDismissingSpotlightHandler:(id)a3;
- (void)setWillStartPresetingSpotlightHandler:(id)a3;
- (void)updateIntent:(unint64_t)a3;
- (void)updateSceneSettingsWithBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SPUIRemoteSearchViewController

- (SPUIRemoteSearchViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  v2 = [(SPUISpotlightRemoteViewController *)&v4 initWithSceneIdentifier:@"searchScreen"];
  [(SPUIRemoteSearchViewController *)v2 setDistanceToTopOfIcons:58.0];
  return v2;
}

- (id)sceneSpecification
{
  v2 = objc_opt_new();
  return v2;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 shouldDismiss])
    {
      v11 = [(SPUIRemoteSearchViewController *)self delegate];
      [v11 dismissSearchView];
    }
    if ([v10 shouldBackground])
    {
      v12 = [v8 settings];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v8 settings];
        uint64_t v14 = [v13 presentationIntent];

        if (v14 == 4)
        {
          v21.receiver = self;
          v21.super_class = (Class)SPUIRemoteSearchViewController;
          [(SPUISpotlightRemoteViewController *)&v21 viewDidDisappear:0];
        }
      }
      else
      {
      }
    }
  }
  v15 = [v8 clientSettings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v17 = [v8 clientSettings];
    [v17 distanceToTopOfIcons];
    if (v18 > 0.0)
    {
      [v17 distanceToTopOfIcons];
      -[SPUIRemoteSearchViewController setDistanceToTopOfIcons:](self, "setDistanceToTopOfIcons:");
    }
    -[SPUIRemoteSearchViewController setSearchHeaderLayerRenderID:](self, "setSearchHeaderLayerRenderID:", [v17 searchHeaderLayerRenderID]);
    -[SPUIRemoteSearchViewController setSearchHeaderContextID:](self, "setSearchHeaderContextID:", [v17 searchHeaderContextID]);
    -[SPUIRemoteSearchViewController setSearchHeaderBackgroundContextID:](self, "setSearchHeaderBackgroundContextID:", [v17 searchHeaderBackgroundContextID]);
    -[SPUIRemoteSearchViewController setSearchHeaderBackgroundLayerRenderID:](self, "setSearchHeaderBackgroundLayerRenderID:", [v17 searchHeaderBackgroundLayerRenderID]);
    [v17 keyboardProtectorHeight];
    -[SPUIRemoteSearchViewController setKeyboardProtectorHeight:](self, "setKeyboardProtectorHeight:");
    [v17 searchBarSize];
    -[SPUIRemoteSearchViewController setSearchBarSize:](self, "setSearchBarSize:");
    [v17 dockedSearchBarSize];
    -[SPUIRemoteSearchViewController setDockedSearchBarSize:](self, "setDockedSearchBarSize:");
    [v17 searchBarCornerRadius];
    -[SPUIRemoteSearchViewController setSearchBarCornerRadius:](self, "setSearchBarCornerRadius:");
    [v17 keyboardHeight];
    -[SPUIRemoteSearchViewController setKeyboardHeight:](self, "setKeyboardHeight:");
    -[SPUIRemoteSearchViewController setSearchHeaderBlurContextID:](self, "setSearchHeaderBlurContextID:", [v17 searchHeaderBlurContextID]);
    -[SPUIRemoteSearchViewController setSearchHeaderBlurLayerRenderID:](self, "setSearchHeaderBlurLayerRenderID:", [v17 searchHeaderBlurLayerRenderID]);
    int v19 = [(SPUIRemoteSearchViewController *)self isKeyboardPresented];
    if (v19 != [v17 isKeyboardPresented])
    {
      -[SPUIRemoteSearchViewController setKeyboardPresented:](self, "setKeyboardPresented:", [v17 isKeyboardPresented]);
      v20 = [(SPUIRemoteSearchViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v20 searchViewKeyboardPresentationStateDidChange];
      }
    }
  }
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SPUIRemoteSearchViewController_setSource___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v16__0__SPUIMutableSearchViewSceneSettings_8l;
  v3[4] = a3;
  [(SPUIRemoteSearchViewController *)self updateSceneSettingsWithBlock:v3];
}

uint64_t __44__SPUIRemoteSearchViewController_setSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresentationSource:*(void *)(a1 + 32)];
}

- (void)setRevealProgress:(double)a3
{
  self->_revealProgress = a3;
  objc_super v4 = [(SPUISpotlightRemoteViewController *)self scene];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SPUIRemoteSearchViewController_setRevealProgress___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
  *(double *)&v5[4] = a3;
  [v4 updateSettingsWithBlock:v5];
}

void __52__SPUIRemoteSearchViewController_setRevealProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setRevealProgress:*(double *)(a1 + 32)];
  }
}

- (void)didInvalidateSceneWhenForeground
{
  v3.receiver = self;
  v3.super_class = (Class)SPUIRemoteSearchViewController;
  [(SPUISpotlightRemoteViewController *)&v3 didInvalidateSceneWhenForeground];
  [(SPUIRemoteSearchViewController *)self setSource:[(SPUIRemoteSearchViewController *)self source]];
  [(SPUIRemoteSearchViewController *)self updateIntent:1];
  [(SPUIRemoteSearchViewController *)self updateIntent:2];
}

- (double)keyboardHeight
{
  objc_super v3 = [(SPUIRemoteSearchViewController *)self view];
  objc_super v4 = [v3 window];
  v5 = [v4 windowScene];
  v6 = [v5 _FBSScene];
  v7 = [v6 settings];
  id v8 = [v7 displayConfiguration];
  id v9 = [v8 identity];
  if ([v9 isContinuityDisplay])
  {

    return 0.0;
  }
  else
  {
    char v11 = [MEMORY[0x263F1C710] isInHardwareKeyboardMode];

    double result = 0.0;
    if ((v11 & 1) == 0) {
      return self->_keyboardHeight;
    }
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  v5 = [(SPUIRemoteSearchViewController *)self willStartPresetingSpotlightHandler];

  if (v5)
  {
    v6 = [(SPUIRemoteSearchViewController *)self willStartPresetingSpotlightHandler];
    v6[2]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SPUIRemoteSearchViewController;
  [(SPUISpotlightRemoteViewController *)&v8 viewWillAppear:v3];
  v7 = qword_26AB56270;
  if (!qword_26AB56270)
  {
    SPUIInitLogging();
    v7 = qword_26AB56270;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SPUIRemoteSearchViewController viewWillAppear:](v7, self);
  }
  [(SPUIRemoteSearchViewController *)self updateIntent:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  [(SPUIRemoteSearchViewController *)&v4 viewDidAppear:a3];
  [(SPUIRemoteSearchViewController *)self updateIntent:2];
  [(SPUIRemoteSearchViewController *)self finishCompletionHandlerIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SPUIRemoteSearchViewController *)self willBeginDismissingSpotlightHandler];

  if (v5)
  {
    v6 = [(SPUIRemoteSearchViewController *)self willBeginDismissingSpotlightHandler];
    v6[2]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SPUIRemoteSearchViewController;
  [(SPUIRemoteSearchViewController *)&v7 viewWillDisappear:v3];
  [(SPUIRemoteSearchViewController *)self updateIntent:3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SPUIRemoteSearchViewController *)self setRevealProgress:0.0];
  v5 = +[SPUISpotlightSceneManager sharedManager];
  [v5 spendMoreTimeReleasingMemory];

  [(SPUIRemoteSearchViewController *)self updateIntent:4];
  v6 = [(SPUIRemoteSearchViewController *)self didFinishDismissingSpotlightHandler];

  if (v6)
  {
    objc_super v7 = [(SPUIRemoteSearchViewController *)self didFinishDismissingSpotlightHandler];
    v7[2]();
  }
  if ([(SPUISpotlightRemoteViewController *)self crashedWhileForeground])
  {
    v8.receiver = self;
    v8.super_class = (Class)SPUIRemoteSearchViewController;
    [(SPUISpotlightRemoteViewController *)&v8 viewDidDisappear:v3];
  }
}

- (void)updateIntent:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__SPUIRemoteSearchViewController_updateIntent___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v16__0__SPUIMutableSearchViewSceneSettings_8l;
  v3[4] = a3;
  [(SPUIRemoteSearchViewController *)self updateSceneSettingsWithBlock:v3];
}

uint64_t __47__SPUIRemoteSearchViewController_updateIntent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresentationIntent:*(void *)(a1 + 32)];
}

- (BOOL)prewarmSceneInTheBackground
{
  return 1;
}

- (void)updateSceneSettingsWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke;
  v6[3] = &unk_264702C08;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SPUISpotlightRemoteViewController *)self addOrExecuteEventAsNeeded:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained scene];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke_2;
  v4[3] = &unk_264702BE0;
  id v5 = *(id *)(a1 + 32);
  [v3 updateSettingsWithBlock:v4];
}

void __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  [(SPUISpotlightRemoteViewController *)&v4 sceneDidInvalidate:a3];
  [(SPUIRemoteSearchViewController *)self setSearchHeaderContextID:0];
  [(SPUIRemoteSearchViewController *)self setSearchHeaderLayerRenderID:0];
}

- (void)finishCompletionHandlerIfNeeded
{
  id v3 = [(SPUISpotlightRemoteViewController *)self scene];
  objc_super v4 = [v3 settings];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SPUISpotlightRemoteViewController *)self scene];
    id v10 = [v5 settings];
  }
  else
  {
    id v10 = 0;
  }

  uint64_t v6 = [(SPUIRemoteSearchViewController *)self finishedPresentingSpotlightHandler];
  if (v6)
  {
    id v7 = (void (**)(void))v6;
    id v8 = [(SPUISpotlightRemoteViewController *)self scene];
    if ([v8 contentState] == 2)
    {
      uint64_t v9 = [v10 presentationIntent];

      if (v9 != 2) {
        goto LABEL_10;
      }
      id v7 = [(SPUIRemoteSearchViewController *)self finishedPresentingSpotlightHandler];
      v7[2]();
    }
    else
    {
    }
  }
LABEL_10:
}

- (void)sceneContentStateDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  [(SPUISpotlightRemoteViewController *)&v4 sceneContentStateDidChange:a3];
  [(SPUIRemoteSearchViewController *)self finishCompletionHandlerIfNeeded];
}

- (double)revealProgress
{
  return self->_revealProgress;
}

- (unint64_t)source
{
  return self->_source;
}

- (SPUIRemoteSearchViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPUIRemoteSearchViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)distanceToTopOfIcons
{
  return self->_distanceToTopOfIcons;
}

- (void)setDistanceToTopOfIcons:(double)a3
{
  self->_distanceToTopOfIcons = a3;
}

- (unint64_t)searchHeaderLayerRenderID
{
  return self->_searchHeaderLayerRenderID;
}

- (void)setSearchHeaderLayerRenderID:(unint64_t)a3
{
  self->_searchHeaderLayerRenderID = a3;
}

- (unsigned)searchHeaderContextID
{
  return self->_searchHeaderContextID;
}

- (void)setSearchHeaderContextID:(unsigned int)a3
{
  self->_searchHeaderContextID = a3;
}

- (unint64_t)searchHeaderBackgroundLayerRenderID
{
  return self->_searchHeaderBackgroundLayerRenderID;
}

- (void)setSearchHeaderBackgroundLayerRenderID:(unint64_t)a3
{
  self->_searchHeaderBackgroundLayerRenderID = a3;
}

- (unsigned)searchHeaderBackgroundContextID
{
  return self->_searchHeaderBackgroundContextID;
}

- (void)setSearchHeaderBackgroundContextID:(unsigned int)a3
{
  self->_searchHeaderBackgroundContextID = a3;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (double)keyboardProtectorHeight
{
  return self->_keyboardProtectorHeight;
}

- (void)setKeyboardProtectorHeight:(double)a3
{
  self->_keyboardProtectorHeight = a3;
}

- (BOOL)isKeyboardPresented
{
  return self->_keyboardPresented;
}

- (void)setKeyboardPresented:(BOOL)a3
{
  self->_keyboardPresented = a3;
}

- (CGSize)searchBarSize
{
  double width = self->_searchBarSize.width;
  double height = self->_searchBarSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSearchBarSize:(CGSize)a3
{
  self->_searchBarSize = a3;
}

- (CGSize)dockedSearchBarSize
{
  double width = self->_dockedSearchBarSize.width;
  double height = self->_dockedSearchBarSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDockedSearchBarSize:(CGSize)a3
{
  self->_dockedSearchBarSize = a3;
}

- (double)searchBarCornerRadius
{
  return self->_searchBarCornerRadius;
}

- (void)setSearchBarCornerRadius:(double)a3
{
  self->_searchBarCornerRadius = a3;
}

- (unint64_t)searchHeaderBlurLayerRenderID
{
  return self->_searchHeaderBlurLayerRenderID;
}

- (void)setSearchHeaderBlurLayerRenderID:(unint64_t)a3
{
  self->_searchHeaderBlurLayerRenderID = a3;
}

- (unsigned)searchHeaderBlurContextID
{
  return self->_searchHeaderBlurContextID;
}

- (void)setSearchHeaderBlurContextID:(unsigned int)a3
{
  self->_searchHeaderBlurContextID = a3;
}

- (UIView)dummyTransitionView
{
  return self->_dummyTransitionView;
}

- (void)setDummyTransitionView:(id)a3
{
}

- (id)willStartPresetingSpotlightHandler
{
  return self->_willStartPresetingSpotlightHandler;
}

- (void)setWillStartPresetingSpotlightHandler:(id)a3
{
}

- (id)finishedPresentingSpotlightHandler
{
  return self->_finishedPresentingSpotlightHandler;
}

- (void)setFinishedPresentingSpotlightHandler:(id)a3
{
}

- (id)willBeginDismissingSpotlightHandler
{
  return self->_willBeginDismissingSpotlightHandler;
}

- (void)setWillBeginDismissingSpotlightHandler:(id)a3
{
}

- (id)didFinishDismissingSpotlightHandler
{
  return self->_didFinishDismissingSpotlightHandler;
}

- (void)setDidFinishDismissingSpotlightHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishDismissingSpotlightHandler, 0);
  objc_storeStrong(&self->_willBeginDismissingSpotlightHandler, 0);
  objc_storeStrong(&self->_finishedPresentingSpotlightHandler, 0);
  objc_storeStrong(&self->_willStartPresetingSpotlightHandler, 0);
  objc_storeStrong((id *)&self->_dummyTransitionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewWillAppear:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  objc_super v4 = a1;
  [a2 keyboardHeight];
  *(float *)&double v5 = v5;
  uint64_t v6 = [v3 numberWithFloat:v5];
  int v7 = 138412290;
  id v8 = v6;
  _os_log_debug_impl(&dword_224D5D000, v4, OS_LOG_TYPE_DEBUG, "Keyboard height %@", (uint8_t *)&v7, 0xCu);
}

@end