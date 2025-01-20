@interface CACSceneManager
- (BOOL)isAlwaysShowingElementNamesOverlayManager:(id)a3;
- (BOOL)isAlwaysShowingLabeledElementsOverlayManager:(id)a3;
- (BOOL)isAlwaysShowingLabeledGridOverlayManager:(id)a3;
- (BOOL)isCarPlayScene;
- (BOOL)isDisplayingAnyContentView;
- (BOOL)isDisplayingAnyInteractiveContentInProcess;
- (BOOL)isDisplayingAnyOutOfProcessPresentation;
- (BOOL)isDisplayingAnyOverlay;
- (BOOL)isDisplayingAnyPresentation;
- (BOOL)isDisplayingCorrections;
- (BOOL)isHandlingDisambiguationForLabeledElementsOverlayManager:(id)a3;
- (BOOL)isMainDisplayScene;
- (BOOL)isOverlayFadingEnabledForEditingModeOverlayManager:(id)a3;
- (BOOL)isOverlayFadingEnabledForElementNamesOverlayManager:(id)a3;
- (BOOL)isOverlayFadingEnabledForLabeledElementsOverlayManager:(id)a3;
- (BOOL)isOverlayFadingEnabledForLabeledGridOverlayManager:(id)a3;
- (BOOL)isPressOnFirstLevelEnabledForLabeledGridOverlayManager:(id)a3;
- (BOOL)isZoomEnabledForGridOverlayManager:(id)a3;
- (BOOL)shouldAssignNumbersRandomlyInLabeledElementsOverlayManager:(id)a3;
- (BOOL)showsNumbersInTopLeftForLabeledGridOverlayManager:(id)a3;
- (BOOL)updateGridLayoutFromPreferences;
- (CACBannerViewPresenter)bannerViewPresenter;
- (CACContainerViewController)overlayContainerViewController;
- (CACContainerViewController)windowContainerViewController;
- (CACContextCluesPresentationManager)contextCluesPresentationManager;
- (CACCorrectionPresentationManager)correctionPresentationManager;
- (CACCustomCommandEditorPresentationManager)customCommandEditorPresentationManager;
- (CACDictationRecognizerModeOverlayManager)dictationRecognizerModeOverlayManager;
- (CACDisambiguationPresentationManager)contactDisambiguationPresentationManager;
- (CACEditingModeOverlayManager)editingModeOverlayManager;
- (CACEditingModeOverlayManager)linesEditingModeOverlayManager;
- (CACElementActionsPresentationManager)elementActionsPresentationManager;
- (CACElementNamesOverlayManager)elementNamesOverlayManager;
- (CACGestureLivePreviewOverlayManager)gestureLivePreviewOverlayManager;
- (CACGestureLivePreviewOverlayManager)gestureLivePreviewPresentationOverlayManager;
- (CACLabeledElementsOverlayManager)labeledElementsOverlayManager;
- (CACLabeledGridOverlayManager)labeledGridOverlayManager;
- (CACSceneManager)init;
- (CGRect)imageRectForDictationRecognizerModeOverlayManager:(id)a3;
- (CGRect)minimumSystemAperatureRect;
- (CGRect)systemAperatureRect;
- (CGRect)topLevelPortraitUpRectForLabeledGridOverlayManager:(id)a3;
- (NSMutableArray)registeredPresentationManagers;
- (UIWindow)overlayWindow;
- (UIWindow)window;
- (UIWindowScene)scene;
- (double)overlayFadeDelayForEditingModeOverlayManager:(id)a3;
- (double)overlayFadeDelayForElementNamesOverlayManager:(id)a3;
- (double)overlayFadeDelayForLabeledElementsOverlayManager:(id)a3;
- (double)overlayFadeDelayForLabeledGridOverlayManager:(id)a3;
- (float)overlayFadeOpacityForEditingModeOverlayManager:(id)a3;
- (float)overlayFadeOpacityForElementNamesOverlayManager:(id)a3;
- (float)overlayFadeOpacityForLabeledElementsOverlayManager:(id)a3;
- (float)overlayFadeOpacityForLabeledGridOverlayManager:(id)a3;
- (id)_containerViewControllerForViewController:(id)a3;
- (id)labeledGridOverlayManager:(id)a3 elementWithTitle:(id)a4 rectangle:(CGRect)a5;
- (id)localeForLabeledElementsOverlayManager:(id)a3;
- (id)screen;
- (int)modeForDictationRecognizerModeOverlayManager:(id)a3;
- (int64_t)defaultNumberOfColumnsForLabeledGridOverlayManager:(id)a3;
- (int64_t)maximumLevelForLabeledGridOverlayManager:(id)a3;
- (unint64_t)_numberOfLabelsForGridManager:(id)a3;
- (unint64_t)numberOfLabelsForGridManager;
- (unint64_t)updateGridLayoutWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 shouldPreferRows:(BOOL)a5 startingNumber:(unint64_t)a6;
- (unsigned)displayID;
- (void)_installViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_uninstallViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)contentViewManager:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)contentViewManager:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)didAssignNumbersInLabeledElementsOverlayManager:(id)a3;
- (void)didUpdateElementsForLabeledGridOverlayManager:(id)a3;
- (void)hideAnyOverlayAnimated:(BOOL)a3 includeInteractiveOverlays:(BOOL)a4;
- (void)hideAnyPresentationAnimated:(BOOL)a3 includingOutOfProcessPresentations:(BOOL)a4;
- (void)hideDictationRecognizerModeOverlayNow;
- (void)redrawGridIfExists;
- (void)registerPresentationManager:(id)a3;
- (void)setBannerViewPresenter:(id)a3;
- (void)setContactDisambiguationPresentationManager:(id)a3;
- (void)setContextCluesPresentationManager:(id)a3;
- (void)setCorrectionPresentationManager:(id)a3;
- (void)setCustomCommandEditorPresentationManager:(id)a3;
- (void)setDictationRecognizerModeOverlayManager:(id)a3;
- (void)setEditingModeOverlayManager:(id)a3;
- (void)setElementActionsPresentationManager:(id)a3;
- (void)setElementNamesOverlayManager:(id)a3;
- (void)setGestureLivePreviewOverlayManager:(id)a3;
- (void)setGestureLivePreviewPresentationOverlayManager:(id)a3;
- (void)setLabeledElementsOverlayManager:(id)a3;
- (void)setLabeledGridOverlayManager:(id)a3;
- (void)setLinesEditingModeOverlayManager:(id)a3;
- (void)setMinimumSystemAperatureRect:(CGRect)a3;
- (void)setOverlayContainerViewController:(id)a3;
- (void)setOverlayWindow:(id)a3;
- (void)setRegisteredPresentationManagers:(id)a3;
- (void)setScene:(id)a3;
- (void)setSystemAperatureRect:(CGRect)a3;
- (void)setWindow:(id)a3;
- (void)setWindowContainerViewController:(id)a3;
- (void)showBannerViewWithText:(id)a3 type:(int64_t)a4;
@end

@implementation CACSceneManager

- (CACSceneManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CACSceneManager;
  v2 = [(CACSceneManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v3;

    long long v5 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)(v2 + 168) = *MEMORY[0x263F001A8];
    *(_OWORD *)(v2 + 184) = v5;
  }
  return (CACSceneManager *)v2;
}

- (unsigned)displayID
{
  v2 = [(CACSceneManager *)self scene];
  uint64_t v3 = [v2 screen];
  unsigned int v4 = [v3 _integerDisplayID];

  return v4;
}

- (BOOL)isMainDisplayScene
{
  unsigned int v2 = [(CACSceneManager *)self displayID];
  uint64_t v3 = [MEMORY[0x263F82B60] mainScreen];
  LOBYTE(v2) = v2 == [v3 _integerDisplayID];

  return v2;
}

- (BOOL)isCarPlayScene
{
  unsigned int v2 = [(CACSceneManager *)self scene];
  uint64_t v3 = [v2 session];
  unsigned int v4 = [v3 role];
  char v5 = [v4 isEqualToString:*MEMORY[0x263F83E38]];

  return v5;
}

- (id)screen
{
  uint64_t v3 = [(CACSceneManager *)self scene];

  if (v3)
  {
    unsigned int v4 = [(CACSceneManager *)self scene];
    char v5 = [v4 screen];
  }
  else
  {
    char v5 = [MEMORY[0x263F82B60] mainScreen];
  }
  return v5;
}

- (void)registerPresentationManager:(id)a3
{
  id v5 = a3;
  unsigned int v4 = self->_registeredPresentationManagers;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_registeredPresentationManagers addObject:v5];
  objc_sync_exit(v4);
}

- (void)showBannerViewWithText:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(CACSceneManager *)self bannerViewPresenter];

  if (!v7)
  {
    v8 = [CACBannerViewPresenter alloc];
    v9 = [(CACContainerViewController *)self->_overlayContainerViewController viewAboveContainedViews];
    v10 = [(CACBannerViewPresenter *)v8 initWithContainingView:v9];
    [(CACSceneManager *)self setBannerViewPresenter:v10];
  }
  id v11 = [(CACSceneManager *)self bannerViewPresenter];
  objc_msgSend(v11, "presentBannerViewWithText:type:avoidingSystemAperature:", v6, a4, self->_systemAperatureRect.origin.x, self->_systemAperatureRect.origin.y, self->_systemAperatureRect.size.width, self->_systemAperatureRect.size.height);
}

- (id)_containerViewControllerForViewController:(id)a3
{
  int v4 = [a3 isOverlay];
  uint64_t v5 = 32;
  if (v4) {
    uint64_t v5 = 40;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  return v6;
}

- (void)_installViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CACSceneManager *)self _containerViewControllerForViewController:v9];
  [v10 installViewController:v9 animated:v5 completion:v8];
}

- (void)_uninstallViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CACSceneManager *)self _containerViewControllerForViewController:v9];
  [v10 uninstallViewController:v9 animated:v5 completion:v8];
}

- (void)hideAnyOverlayAnimated:(BOOL)a3 includeInteractiveOverlays:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v7 = self->_registeredPresentationManagers;
  objc_sync_enter(v7);
  id v8 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v7);

  id v9 = CACLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = @"excluding";
    if (v4) {
      id v10 = @"including";
    }
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_238377000, v9, OS_LOG_TYPE_INFO, "Hiding all overlays %@ interactive", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "isShowing", (void)v16)
          && [v15 isOverlay]
          && (v4 || ([v15 isPhysiciallyInteractiveOverlay] & 1) == 0))
        {
          if (v5) {
            [v15 hide];
          }
          else {
            [v15 hideWithoutAnimation];
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)hideAnyPresentationAnimated:(BOOL)a3 includingOutOfProcessPresentations:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v7 = self->_registeredPresentationManagers;
  objc_sync_enter(v7);
  id v8 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v7);

  id v9 = CACLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = @"excluding";
    if (v4) {
      id v10 = @"including";
    }
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_238377000, v9, OS_LOG_TYPE_INFO, "Hiding all presentations %@ out of process", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isOverlay", (void)v16) & 1) == 0
          && (v4 || ([v15 isOutOfProcess] & 1) == 0))
        {
          if (v5) {
            [v15 hide];
          }
          else {
            [v15 hideWithoutAnimation];
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)hideDictationRecognizerModeOverlayNow
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "isShowing", (void)v10)) {
          [v9 hideWithoutAnimation];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isDisplayingAnyContentView
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isShowing", (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isDisplayingAnyPresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (void)v11) && (objc_msgSend(v9, "isOverlay") & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isDisplayingCorrections
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (void)v14))
        {
          if (([v9 isOverlay] & 1) == 0)
          {
            long long v10 = [(CACSceneManager *)self correctionPresentationManager];
            BOOL v11 = v9 == v10;

            if (v11)
            {
              BOOL v12 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)isDisplayingAnyInteractiveContentInProcess
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (void)v11)
          && ([v9 isOverlay] & 1) == 0
          && ([v9 isOutOfProcess] & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)isDisplayingAnyOutOfProcessPresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if objc_msgSend(v9, "isShowing", (void)v11) && (objc_msgSend(v9, "isOutOfProcess"))
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isDisplayingAnyOverlay
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  BOOL v4 = (void *)[(NSMutableArray *)self->_registeredPresentationManagers copy];
  objc_sync_exit(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if objc_msgSend(v9, "isShowing", (void)v11) && (objc_msgSend(v9, "isOverlay"))
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)redrawGridIfExists
{
}

- (CACLabeledElementsOverlayManager)labeledElementsOverlayManager
{
  labeledElementsOverlayManager = self->_labeledElementsOverlayManager;
  if (!labeledElementsOverlayManager)
  {
    BOOL v4 = objc_alloc_init(CACLabeledElementsOverlayManager);
    id v5 = self->_labeledElementsOverlayManager;
    self->_labeledElementsOverlayManager = v4;

    [(CACLabeledElementsOverlayManager *)self->_labeledElementsOverlayManager setDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_labeledElementsOverlayManager];
    labeledElementsOverlayManager = self->_labeledElementsOverlayManager;
  }
  return labeledElementsOverlayManager;
}

- (CACLabeledGridOverlayManager)labeledGridOverlayManager
{
  labeledGridOverlayManager = self->_labeledGridOverlayManager;
  if (!labeledGridOverlayManager)
  {
    BOOL v4 = objc_alloc_init(CACLabeledGridOverlayManager);
    id v5 = self->_labeledGridOverlayManager;
    self->_labeledGridOverlayManager = v4;

    [(CACLabeledGridOverlayManager *)self->_labeledGridOverlayManager setDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_labeledGridOverlayManager];
    [(CACSceneManager *)self updateGridLayoutFromPreferences];
    labeledGridOverlayManager = self->_labeledGridOverlayManager;
  }
  return labeledGridOverlayManager;
}

- (CACElementNamesOverlayManager)elementNamesOverlayManager
{
  elementNamesOverlayManager = self->_elementNamesOverlayManager;
  if (!elementNamesOverlayManager)
  {
    BOOL v4 = objc_alloc_init(CACElementNamesOverlayManager);
    id v5 = self->_elementNamesOverlayManager;
    self->_elementNamesOverlayManager = v4;

    [(CACElementNamesOverlayManager *)self->_elementNamesOverlayManager setDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_elementNamesOverlayManager];
    elementNamesOverlayManager = self->_elementNamesOverlayManager;
  }
  return elementNamesOverlayManager;
}

- (CACEditingModeOverlayManager)editingModeOverlayManager
{
  editingModeOverlayManager = self->_editingModeOverlayManager;
  if (!editingModeOverlayManager)
  {
    BOOL v4 = objc_alloc_init(CACEditingModeOverlayManager);
    id v5 = self->_editingModeOverlayManager;
    self->_editingModeOverlayManager = v4;

    [(CACEditingModeOverlayManager *)self->_editingModeOverlayManager setDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_editingModeOverlayManager];
    editingModeOverlayManager = self->_editingModeOverlayManager;
  }
  return editingModeOverlayManager;
}

- (CACEditingModeOverlayManager)linesEditingModeOverlayManager
{
  linesEditingModeOverlayManager = self->_linesEditingModeOverlayManager;
  if (!linesEditingModeOverlayManager)
  {
    BOOL v4 = objc_alloc_init(CACEditingModeOverlayManager);
    id v5 = self->_linesEditingModeOverlayManager;
    self->_linesEditingModeOverlayManager = v4;

    [(CACEditingModeOverlayManager *)self->_linesEditingModeOverlayManager setDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_linesEditingModeOverlayManager];
    linesEditingModeOverlayManager = self->_linesEditingModeOverlayManager;
  }
  return linesEditingModeOverlayManager;
}

- (CACGestureLivePreviewOverlayManager)gestureLivePreviewPresentationOverlayManager
{
  gestureLivePreviewOverlayManager = self->_gestureLivePreviewOverlayManager;
  if (!gestureLivePreviewOverlayManager)
  {
    BOOL v4 = objc_alloc_init(CACGestureLivePreviewOverlayManager);
    id v5 = self->_gestureLivePreviewOverlayManager;
    self->_gestureLivePreviewOverlayManager = v4;

    [(CACSimpleContentViewManager *)self->_gestureLivePreviewOverlayManager setContentViewManagerDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_gestureLivePreviewOverlayManager];
    gestureLivePreviewOverlayManager = self->_gestureLivePreviewOverlayManager;
  }
  return gestureLivePreviewOverlayManager;
}

- (CACElementActionsPresentationManager)elementActionsPresentationManager
{
  elementActionsPresentationManager = self->_elementActionsPresentationManager;
  if (!elementActionsPresentationManager)
  {
    BOOL v4 = objc_alloc_init(CACElementActionsPresentationManager);
    id v5 = self->_elementActionsPresentationManager;
    self->_elementActionsPresentationManager = v4;

    [(CACSimpleContentViewManager *)self->_elementActionsPresentationManager setContentViewManagerDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_elementActionsPresentationManager];
    elementActionsPresentationManager = self->_elementActionsPresentationManager;
  }
  return elementActionsPresentationManager;
}

- (CACCorrectionPresentationManager)correctionPresentationManager
{
  correctionPresentationManager = self->_correctionPresentationManager;
  if (!correctionPresentationManager)
  {
    BOOL v4 = objc_alloc_init(CACCorrectionPresentationManager);
    id v5 = self->_correctionPresentationManager;
    self->_correctionPresentationManager = v4;

    [(CACSimpleContentViewManager *)self->_correctionPresentationManager setContentViewManagerDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_correctionPresentationManager];
    correctionPresentationManager = self->_correctionPresentationManager;
  }
  return correctionPresentationManager;
}

- (CACCustomCommandEditorPresentationManager)customCommandEditorPresentationManager
{
  customCommandEditorPresentationManager = self->_customCommandEditorPresentationManager;
  if (!customCommandEditorPresentationManager)
  {
    BOOL v4 = (CACCustomCommandEditorPresentationManager *)objc_opt_new();
    id v5 = self->_customCommandEditorPresentationManager;
    self->_customCommandEditorPresentationManager = v4;

    [(CACSceneManager *)self registerPresentationManager:self->_customCommandEditorPresentationManager];
    customCommandEditorPresentationManager = self->_customCommandEditorPresentationManager;
  }
  return customCommandEditorPresentationManager;
}

- (CACDictationRecognizerModeOverlayManager)dictationRecognizerModeOverlayManager
{
  dictationRecognizerModeOverlayManager = self->_dictationRecognizerModeOverlayManager;
  if (!dictationRecognizerModeOverlayManager)
  {
    BOOL v4 = (CACDictationRecognizerModeOverlayManager *)objc_opt_new();
    id v5 = self->_dictationRecognizerModeOverlayManager;
    self->_dictationRecognizerModeOverlayManager = v4;

    [(CACDictationRecognizerModeOverlayManager *)self->_dictationRecognizerModeOverlayManager setDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_dictationRecognizerModeOverlayManager];
    dictationRecognizerModeOverlayManager = self->_dictationRecognizerModeOverlayManager;
  }
  return dictationRecognizerModeOverlayManager;
}

- (CACDisambiguationPresentationManager)contactDisambiguationPresentationManager
{
  contactDisambiguationPresentationManager = self->_contactDisambiguationPresentationManager;
  if (!contactDisambiguationPresentationManager)
  {
    BOOL v4 = (CACDisambiguationPresentationManager *)objc_opt_new();
    id v5 = self->_contactDisambiguationPresentationManager;
    self->_contactDisambiguationPresentationManager = v4;

    [(CACSimpleContentViewManager *)self->_contactDisambiguationPresentationManager setContentViewManagerDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_contactDisambiguationPresentationManager];
    contactDisambiguationPresentationManager = self->_contactDisambiguationPresentationManager;
  }
  return contactDisambiguationPresentationManager;
}

- (CACContextCluesPresentationManager)contextCluesPresentationManager
{
  contextCluesPresentationManager = self->_contextCluesPresentationManager;
  if (!contextCluesPresentationManager)
  {
    BOOL v4 = (CACContextCluesPresentationManager *)objc_opt_new();
    id v5 = self->_contextCluesPresentationManager;
    self->_contextCluesPresentationManager = v4;

    [(CACSimpleContentViewManager *)self->_contextCluesPresentationManager setContentViewManagerDelegate:self];
    [(CACSceneManager *)self registerPresentationManager:self->_contextCluesPresentationManager];
    contextCluesPresentationManager = self->_contextCluesPresentationManager;
  }
  return contextCluesPresentationManager;
}

- (BOOL)updateGridLayoutFromPreferences
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  BOOL v4 = [(CACSceneManager *)self labeledGridOverlayManager];
  uint64_t v5 = [v4 currentNumberOfColumns];

  uint64_t v6 = [(CACSceneManager *)self labeledGridOverlayManager];
  uint64_t v7 = [v6 currentNumberOfRows];

  if ([v3 gridOverlayCustomColumnsEnabled]) {
    uint64_t v8 = [v3 gridOverlayCustomColumnsCount];
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v3 gridOverlayCustomRowsEnabled]) {
    uint64_t v9 = [v3 gridOverlayCustomRowsCount];
  }
  else {
    uint64_t v9 = 0;
  }
  long long v10 = [(CACSceneManager *)self labeledGridOverlayManager];
  [v10 setCurrentNumberOfColumns:v8];

  long long v11 = [(CACSceneManager *)self labeledGridOverlayManager];
  [v11 setCurrentNumberOfRows:v9];

  BOOL v13 = v5 != v8 || v7 != v9;
  return v13;
}

- (unint64_t)_numberOfLabelsForGridManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentNumberOfColumns];
  uint64_t v6 = [v4 currentNumberOfRows];
  if (!(v5 | v6)) {
    uint64_t v5 = [(CACSceneManager *)self defaultNumberOfColumnsForLabeledGridOverlayManager:v4];
  }
  [(CACSceneManager *)self topLevelPortraitUpRectForLabeledGridOverlayManager:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [(CACSceneManager *)self screen];
  +[CACLabeledGridOverlayManager gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:](CACLabeledGridOverlayManager, "gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:", v5, v6, v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;

  return vcvtad_u64_f64(v19 * v17);
}

- (unint64_t)numberOfLabelsForGridManager
{
  uint64_t v3 = [(CACSceneManager *)self labeledGridOverlayManager];
  unint64_t v4 = [(CACSceneManager *)self _numberOfLabelsForGridManager:v3];

  return v4;
}

- (unint64_t)updateGridLayoutWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 shouldPreferRows:(BOOL)a5 startingNumber:(unint64_t)a6
{
  double v11 = [(CACSceneManager *)self labeledGridOverlayManager];
  [(CACSceneManager *)self topLevelPortraitUpRectForLabeledGridOverlayManager:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(CACSceneManager *)self screen];
  +[CACLabeledGridOverlayManager gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:](CACLabeledGridOverlayManager, "gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:", a4, a3, v20, v13, v15, v17, v19);
  double v22 = v21;
  double v24 = v23;

  v25 = [(CACSceneManager *)self labeledGridOverlayManager];
  [v25 setCurrentNumberOfColumns:a4];

  v26 = [(CACSceneManager *)self labeledGridOverlayManager];
  [v26 setCurrentNumberOfRows:a3];

  v27 = [(CACSceneManager *)self labeledGridOverlayManager];
  [v27 setStartingNumber:a6];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __100__CACSceneManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows_startingNumber___block_invoke;
  v29[3] = &unk_264D12638;
  BOOL v30 = a5;
  v29[4] = self;
  *(double *)&v29[5] = v22;
  *(double *)&v29[6] = v24;
  dispatch_async(MEMORY[0x263EF83A0], v29);
  return vcvtad_u64_f64(v22 * v24);
}

void __100__CACSceneManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows_startingNumber___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    id v7 = [*(id *)(a1 + 32) labeledGridOverlayManager];
    if (*(double *)(a1 + 48) < (double)[v7 currentNumberOfRows])
    {

LABEL_9:
      id v7 = +[CACDisplayManager sharedManager];
      uint64_t v6 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.GridResolutionMaximumReached"];
      [v7 displayMessageString:v6 type:1 announcementCompletion:&__block_literal_global_32];

      goto LABEL_10;
    }
    if (*(unsigned char *)(a1 + 56))
    {
LABEL_10:

      return;
    }
  }
  uint64_t v3 = [*(id *)(a1 + 32) labeledGridOverlayManager];
  double v4 = (double)[v3 currentNumberOfColumns];
  double v5 = *(double *)(a1 + 40);

  if (v2) {
  if (v5 < v4)
  }
    goto LABEL_9;
}

void __100__CACSceneManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows_startingNumber___block_invoke_2()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 speakVoiceOverDescriptionForActiveOverlayIfNeeded];
}

- (void)contentViewManager:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__CACSceneManager_contentViewManager_presentViewController_animated_completion___block_invoke;
  v11[3] = &unk_264D12660;
  id v12 = v9;
  id v10 = v9;
  [(CACSceneManager *)self _installViewController:a4 animated:v6 completion:v11];
}

uint64_t __80__CACSceneManager_contentViewManager_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  int v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 synchronizeRecognizersWithReason:kSRUISyncReasonOverlayStateChanged];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)contentViewManager:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__CACSceneManager_contentViewManager_dismissViewController_animated_completion___block_invoke;
  v13[3] = &unk_264D116E0;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(CACSceneManager *)self _uninstallViewController:v12 animated:v7 completion:v13];
}

uint64_t __80__CACSceneManager_contentViewManager_dismissViewController_animated_completion___block_invoke(uint64_t a1)
{
  int v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 synchronizeRecognizersWithReason:kSRUISyncReasonOverlayStateChanged];

  if (([*(id *)(a1 + 32) isOverlay] & 1) == 0)
  {
    uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v3 forceElementFetchWithReason:@"Dismissed our own view controller"];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)didAssignNumbersInLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  double v4 = [v3 labeledScreenElementsCollection];
  [v4 setAreElementsNumbered:1];

  id v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v5 synchronizeRecognizersWithReason:kSRUISyncReasonOverlayStateChanged];
}

- (BOOL)isHandlingDisambiguationForLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  double v4 = [v3 disambiguationHandler];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldAssignNumbersRandomlyInLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v4 = [v3 doesFocusedElementRequireSecureInput];

  return v4;
}

- (id)localeForLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF960];
  char v4 = +[CACPreferences sharedPreferences];
  BOOL v5 = [v4 bestLocaleIdentifier];
  BOOL v6 = [v3 localeWithLocaleIdentifier:v5];

  return v6;
}

- (BOOL)isOverlayFadingEnabledForLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  char v4 = [v3 overlayFadingEnabled];

  return v4;
}

- (double)overlayFadeDelayForLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeDelay];
  double v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeOpacity];
  float v5 = v4;

  return v5;
}

- (BOOL)isAlwaysShowingLabeledElementsOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  float v4 = [v3 alwaysShowOverlayType];
  char v5 = [v4 isEqualToString:@"NumberedElements"];

  return v5;
}

- (BOOL)isOverlayFadingEnabledForElementNamesOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  char v4 = [v3 overlayFadingEnabled];

  return v4;
}

- (double)overlayFadeDelayForElementNamesOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeDelay];
  double v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForElementNamesOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeOpacity];
  float v5 = v4;

  return v5;
}

- (BOOL)isAlwaysShowingElementNamesOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  float v4 = [v3 alwaysShowOverlayType];
  char v5 = [v4 isEqualToString:@"NamedElements"];

  return v5;
}

- (BOOL)isOverlayFadingEnabledForEditingModeOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  char v4 = [v3 overlayFadingEnabled];

  return v4;
}

- (double)overlayFadeDelayForEditingModeOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeDelay];
  double v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForEditingModeOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeOpacity];
  float v5 = v4;

  return v5;
}

- (id)labeledGridOverlayManager:(id)a3 elementWithTitle:(id)a4 rectangle:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v15[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = [CACLabeledElement alloc];
  v15[0] = v10;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  double v13 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v11, "initWithElement:recognitionStrings:rectangle:", 0, v12, x, y, width, height);

  [(CACLabeledElement *)v13 setNumberedLabel:v10];
  [(CACLabeledElement *)v13 setDisplayID:[(CACSceneManager *)self displayID]];
  return v13;
}

- (CGRect)topLevelPortraitUpRectForLabeledGridOverlayManager:(id)a3
{
  uint64_t v3 = [(CACSceneManager *)self screen];
  [v3 bounds];
  double v8 = CACPortraitUpRectFromViewRect(0, v4, v5, v6, v7);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (int64_t)maximumLevelForLabeledGridOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  int64_t v4 = [v3 gridOverlayMaxLevel];

  return v4;
}

- (BOOL)isOverlayFadingEnabledForLabeledGridOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  char v4 = [v3 overlayFadingEnabled];

  return v4;
}

- (double)overlayFadeDelayForLabeledGridOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeDelay];
  double v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForLabeledGridOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeOpacity];
  float v5 = v4;

  return v5;
}

- (BOOL)isAlwaysShowingLabeledGridOverlayManager:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  float v4 = [v3 alwaysShowOverlayType];
  char v5 = [v4 isEqualToString:@"NumberedGrid"];

  return v5;
}

- (void)didUpdateElementsForLabeledGridOverlayManager:(id)a3
{
  id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v3 synchronizeRecognizersWithReason:kSRUISyncReasonOverlayStateChanged];
}

- (int64_t)defaultNumberOfColumnsForLabeledGridOverlayManager:(id)a3
{
  return 4;
}

- (BOOL)showsNumbersInTopLeftForLabeledGridOverlayManager:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  char v4 = [v3 gridOverlayShowsNumbersInTopLeft];

  return v4;
}

- (BOOL)isPressOnFirstLevelEnabledForLabeledGridOverlayManager:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  char v4 = [v3 gridOverlayPressOnFirstLevelEnabled];

  return v4;
}

- (BOOL)isZoomEnabledForGridOverlayManager:(id)a3
{
  return 1;
}

- (int)modeForDictationRecognizerModeOverlayManager:(id)a3
{
  id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 dictationRecognizerMode];

  return v4;
}

- (CGRect)imageRectForDictationRecognizerModeOverlayManager:(id)a3
{
  id v3 = a3;
  int v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v5 = [v3 viewController];

  double v6 = [v5 view];
  [v4 bestDictationRecognizerModeImageRectForView:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIWindow)overlayWindow
{
  return self->_overlayWindow;
}

- (void)setOverlayWindow:(id)a3
{
}

- (CGRect)systemAperatureRect
{
  double x = self->_systemAperatureRect.origin.x;
  double y = self->_systemAperatureRect.origin.y;
  double width = self->_systemAperatureRect.size.width;
  double height = self->_systemAperatureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSystemAperatureRect:(CGRect)a3
{
  self->_systemAperatureRect = a3;
}

- (CGRect)minimumSystemAperatureRect
{
  double x = self->_minimumSystemAperatureRect.origin.x;
  double y = self->_minimumSystemAperatureRect.origin.y;
  double width = self->_minimumSystemAperatureRect.size.width;
  double height = self->_minimumSystemAperatureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMinimumSystemAperatureRect:(CGRect)a3
{
  self->_minimumSystemAperatureRect = a3;
}

- (CACContainerViewController)windowContainerViewController
{
  return self->_windowContainerViewController;
}

- (void)setWindowContainerViewController:(id)a3
{
}

- (CACContainerViewController)overlayContainerViewController
{
  return self->_overlayContainerViewController;
}

- (void)setOverlayContainerViewController:(id)a3
{
}

- (CACBannerViewPresenter)bannerViewPresenter
{
  return self->_bannerViewPresenter;
}

- (void)setBannerViewPresenter:(id)a3
{
}

- (void)setLabeledElementsOverlayManager:(id)a3
{
}

- (void)setLabeledGridOverlayManager:(id)a3
{
}

- (void)setElementNamesOverlayManager:(id)a3
{
}

- (void)setEditingModeOverlayManager:(id)a3
{
}

- (void)setLinesEditingModeOverlayManager:(id)a3
{
}

- (CACGestureLivePreviewOverlayManager)gestureLivePreviewOverlayManager
{
  return self->_gestureLivePreviewOverlayManager;
}

- (void)setGestureLivePreviewOverlayManager:(id)a3
{
}

- (void)setElementActionsPresentationManager:(id)a3
{
}

- (void)setCorrectionPresentationManager:(id)a3
{
}

- (void)setCustomCommandEditorPresentationManager:(id)a3
{
}

- (void)setDictationRecognizerModeOverlayManager:(id)a3
{
}

- (void)setGestureLivePreviewPresentationOverlayManager:(id)a3
{
}

- (void)setContactDisambiguationPresentationManager:(id)a3
{
}

- (void)setContextCluesPresentationManager:(id)a3
{
}

- (NSMutableArray)registeredPresentationManagers
{
  return self->_registeredPresentationManagers;
}

- (void)setRegisteredPresentationManagers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPresentationManagers, 0);
  objc_storeStrong((id *)&self->_contextCluesPresentationManager, 0);
  objc_storeStrong((id *)&self->_contactDisambiguationPresentationManager, 0);
  objc_storeStrong((id *)&self->_gestureLivePreviewPresentationOverlayManager, 0);
  objc_storeStrong((id *)&self->_dictationRecognizerModeOverlayManager, 0);
  objc_storeStrong((id *)&self->_customCommandEditorPresentationManager, 0);
  objc_storeStrong((id *)&self->_correctionPresentationManager, 0);
  objc_storeStrong((id *)&self->_elementActionsPresentationManager, 0);
  objc_storeStrong((id *)&self->_gestureLivePreviewOverlayManager, 0);
  objc_storeStrong((id *)&self->_linesEditingModeOverlayManager, 0);
  objc_storeStrong((id *)&self->_editingModeOverlayManager, 0);
  objc_storeStrong((id *)&self->_elementNamesOverlayManager, 0);
  objc_storeStrong((id *)&self->_labeledGridOverlayManager, 0);
  objc_storeStrong((id *)&self->_labeledElementsOverlayManager, 0);
  objc_storeStrong((id *)&self->_bannerViewPresenter, 0);
  objc_storeStrong((id *)&self->_overlayContainerViewController, 0);
  objc_storeStrong((id *)&self->_windowContainerViewController, 0);
  objc_storeStrong((id *)&self->_overlayWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end