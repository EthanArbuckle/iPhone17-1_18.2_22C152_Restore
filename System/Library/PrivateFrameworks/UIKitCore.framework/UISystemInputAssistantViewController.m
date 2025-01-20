@interface UISystemInputAssistantViewController
+ (BOOL)_requiresProxyInterface;
+ (BOOL)shouldShowSystemInputAssistantItems;
+ (double)_defaultPreferredHeightForTraitCollection:(id)a3;
+ (double)_defaultPreferredHeightForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4;
+ (int64_t)keyboardOrientation;
- (BOOL)_allowedToShowBarButtonItemsInline:(id)a3;
- (BOOL)_assistantItemsVisibleForResponder:(id)a3;
- (BOOL)_canShowCenterBarButtonItem;
- (BOOL)_canShowWhileLocked;
- (BOOL)_centerPredictionViewVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)_hasCustomCenterViewControllerWidth;
- (BOOL)_hidesCenterViewForActiveWindowingMode;
- (BOOL)_isAssistantPreferenceEnabled;
- (BOOL)_isEmojiInputMode;
- (BOOL)_shouldCollapseEmojiSearchView;
- (BOOL)_shouldShowExpandableButtonBarItemsForResponder:(id)a3;
- (BOOL)_usesCustomBackground;
- (BOOL)assistantEnabledPreference;
- (BOOL)assistantOniPhonePreference;
- (BOOL)currentlyCheckingPreferences;
- (BOOL)hasCheckedPreferences;
- (BOOL)isEmojiSearchResultsVisible;
- (BOOL)isInputAssistantItemEmpty;
- (BOOL)isVisibleWhenMinimized;
- (BOOL)layoutHasBuiltinAssistantView;
- (BOOL)shouldBeShownForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)shouldShowEmojiSearchViewControllerForInputDelegate:(id)a3;
- (BOOL)shouldUseCustomBackground:(id)a3;
- (BOOL)showsRemoteInputDashViewController;
- (BOOL)supportsCompactStyle;
- (BOOL)updateFloatingAssistantRectEdge:(unint64_t)a3 position:(CGPoint)a4;
- (CGRect)barFrame;
- (NSMutableDictionary)cachedPredictiveViewControllers;
- (NSValue)currentInputDelegatePointerValue;
- (TUIEmojiSearchInputViewController)emojiSearchViewController;
- (TUISystemInputAssistantLayout)compactAssistantViewLayout;
- (TUISystemInputAssistantLayout)floatAssistantViewLayout;
- (TUISystemInputAssistantLayoutSplit)splitAssistantViewLayout;
- (TUISystemInputAssistantLayoutStandard)standardAssistantViewLayout;
- (TUISystemInputAssistantStyleCompact)compactStyle;
- (TUISystemInputAssistantStyleFloat)floatStyle;
- (TUISystemInputAssistantStyleStandard)standardStyle;
- (UIPredictiveViewController)centerViewController;
- (UIPredictiveViewController)predictiveViewController;
- (UIRemoteInputViewInfo)remoteAssistantViewInfo;
- (UISystemInputAssistantViewController)init;
- (UITextInputAssistantItem)observedInputAssistantItem;
- (UITextInputAssistantItem)remoteAssistantItem;
- (UIView)popoverSourceView;
- (UIView)remoteAssistantContainerView;
- (UIViewController)expandedItemsController;
- (_UILayerHostView)remoteAssistantView;
- (double)_buttonBarWidthForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4;
- (double)_centerViewWidthForTraitCollection:(id)a3;
- (double)_centerViewWidthForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4;
- (double)preferredHeightForTraitCollection:(id)a3;
- (double)preferredHeightForTraitCollection:(id)a3 orientation:(int64_t)a4;
- (double)remoteCenterViewPreferredWidth;
- (id)UIAssistantItemForRTIAssistantItem:(id)a3;
- (id)UIGroupsForRTIGroups:(id)a3;
- (id)_currentInputDelegate;
- (id)_customCenterBarButtonItem:(id)a3;
- (id)_customCenterViewController:(id)a3;
- (id)_defaultTintColor;
- (id)_emojiSearchField;
- (id)_inputDelegateAsResponder:(id)a3;
- (id)_popoverViewControllerForBarButtonItemGroup:(id)a3;
- (id)candidateViewController;
- (id)compatibilityViewController;
- (id)inputWindowController;
- (id)layoutFromAssistantBarStyle:(int64_t)a3;
- (id)placeholderItemOfWidth:(double)a3;
- (id)predictionViewController;
- (id)styleFromAssistantBarStyle:(int64_t)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)assistantBarStyle;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_beginObservingInputAssistantItemForRelevantItemChanges:(id)a3;
- (void)_candidatesChanged;
- (void)_collapseBarItems;
- (void)_didChangePlacementOrInputSourceNotification:(id)a3;
- (void)_didChangeTextEffectsRotationNotification:(id)a3;
- (void)_dismissEmojiSearch;
- (void)_expandBarItems;
- (void)_inputModeChanged:(id)a3;
- (void)_keyboardDictationAvailabilityDidChangeNotification:(id)a3;
- (void)_queueResponderChangedForNewResponder:(id)a3;
- (void)_registerForAssistantViewNotifications;
- (void)_responderCapabilitiesChangedNotification:(id)a3;
- (void)_responderChangedNotification:(id)a3;
- (void)_showCandidates;
- (void)_updateCenterViewWidthAndRenderConfig;
- (void)_updateCenterViewWidthForInterfaceOrientation:(int64_t)a3;
- (void)_updateLanguageIndicatorPointerInteractionAndImage;
- (void)_updateSystemInputAssistantViewStylingForInputAssistantItem:(id)a3;
- (void)_updateViewsForAssistantBarStyle:(int64_t)a3;
- (void)_willChangePlacementNotification:(id)a3;
- (void)_willChangeTextEffectsRotationNotification:(id)a3;
- (void)_writingDirectionChanged:(id)a3;
- (void)applyRemoteAssistantItem:(id)a3;
- (void)autocorrectionController:(id)a3 didUpdateAutocorrectionList:(id)a4;
- (void)automaticallySetCenterViewControllerBasedOnInputDelegate:(id)a3;
- (void)dealloc;
- (void)dismissDictationMenuIfNeeded;
- (void)dismissKeyboardItemIfNeeded;
- (void)dismissLanguageIndicatorMenuIfNeeded;
- (void)emojiSearchTextFieldDidBecomeActive:(id)a3;
- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeActive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3;
- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)preferencesControllerChanged:(id)a3;
- (void)prepareForFloating:(BOOL)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)prepareTransition:(id)a3 animated:(BOOL)a4;
- (void)setAssistantBarStyle:(int64_t)a3;
- (void)setAssistantEnabledPreference:(BOOL)a3;
- (void)setAssistantOniPhonePreference:(BOOL)a3;
- (void)setCachedPredictiveViewControllers:(id)a3;
- (void)setCenterViewController:(id)a3;
- (void)setCompactAssistantViewLayout:(id)a3;
- (void)setCompactStyle:(id)a3;
- (void)setCurrentInputDelegatePointerValue:(id)a3;
- (void)setCurrentlyCheckingPreferences:(BOOL)a3;
- (void)setEmojiSearchViewController:(id)a3;
- (void)setExpandedItemsController:(id)a3;
- (void)setFloatAssistantViewLayout:(id)a3;
- (void)setFloatStyle:(id)a3;
- (void)setHasCheckedPreferences:(BOOL)a3;
- (void)setInputAssistantButtonItemsForResponder:(id)a3;
- (void)setNeedsValidation;
- (void)setObservedInputAssistantItem:(id)a3;
- (void)setOverrideSafeAreaInsets;
- (void)setPopoverSourceView:(id)a3;
- (void)setPredictiveViewController:(id)a3;
- (void)setRemoteAssistantContainerView:(id)a3;
- (void)setRemoteAssistantItem:(id)a3;
- (void)setRemoteAssistantView:(id)a3;
- (void)setRemoteAssistantViewInfo:(id)a3;
- (void)setRemoteCenterViewPreferredWidth:(double)a3;
- (void)setShowsRemoteInputDashViewController:(BOOL)a3;
- (void)setSplitAssistantViewLayout:(id)a3;
- (void)setStandardAssistantViewLayout:(id)a3;
- (void)setStandardStyle:(id)a3;
- (void)showEmojiSearch:(BOOL)a3;
- (void)systemInputAssistantView:(id)a3 wantsToShowCollapsedItemGroup:(id)a4 fromView:(id)a5;
- (void)updateAssistantBarStyle:(int64_t)a3;
- (void)updateAssistantPreferences;
- (void)updateCenterViewVisibilityStateForInputDelegate:(id)a3;
- (void)updateRemoteAssistantViewHidden;
- (void)viewDidLoad;
@end

@implementation UISystemInputAssistantViewController

- (UISystemInputAssistantViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)UISystemInputAssistantViewController;
  v2 = [(UIInputViewController *)&v6 initWithNibName:0 bundle:0];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(UISystemInputAssistantViewController *)v2 setCachedPredictiveViewControllers:v3];

    v2->_hasCheckedPreferences = 0;
    v2->_currentlyCheckingPreferences = 0;
    [(UISystemInputAssistantViewController *)v2 updateAssistantPreferences];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_preferencesControllerChanged_ name:*MEMORY[0x1E4FAEA28] object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(UISystemInputAssistantViewController *)self _beginObservingInputAssistantItemForRelevantItemChanges:0];
  id v3 = [(UIViewController *)self view];
  v4 = [v3 layer];
  [v4 removeObserver:self forKeyPath:@"bounds"];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FAEA28] object:0];

  v6.receiver = self;
  v6.super_class = (Class)UISystemInputAssistantViewController;
  [(UIInputViewController *)&v6 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isInputAssistantItemEmpty
{
  id v3 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  if ([v3 isInputAssistantItemHidden])
  {
    v4 = [(UISystemInputAssistantViewController *)self centerViewController];
    v5 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    int v6 = [v4 isVisibleForInputDelegate:v5 inputViews:0] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)barFrame
{
  v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v2 containerFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (BOOL)_requiresProxyInterface
{
  return 0;
}

+ (double)_defaultPreferredHeightForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = +[UIKeyboard activeKeyboard];
  double v7 = [v6 _rootInputWindowController];
  double v8 = [v7 placement];
  double v9 = UIAssistantViewPlacement(v8);

  if (!v9 || ([v9 isFloating] & 1) == 0 && (objc_msgSend(v9, "isHiddenForFloatingTransition") & 1) == 0)
  {
    uint64_t v11 = [v5 userInterfaceIdiom];
    double v12 = +[UIKeyboardImpl keyboardScreen];
    double v13 = +[UIKBScreenTraits traitsWithScreen:v12 orientation:a4];

    if (v11 == -1) {
      uint64_t v11 = [v13 idiom];
    }
    uint64_t v14 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v13, v11, 0);
    double v10 = 55.0;
    if ((unint64_t)(v14 - 23) < 4) {
      goto LABEL_8;
    }
    unint64_t v16 = v14;
    if (v14 == 1) {
      goto LABEL_8;
    }
    if (![v13 idiom])
    {
      v17 = +[UIKeyboardImpl activeInstance];
      int v18 = [v17 isMinimized];

      if (v18)
      {
        v19 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v20 = [v19 existingContainerWindow];
        [v20 safeAreaInsets];
        double v10 = v21 + 38.0;

LABEL_8:
        goto LABEL_9;
      }
    }
    v22 = +[UIKeyboardImpl activeInstance];
    int v23 = [v22 shouldShowCandidateBar];

    if (!v23)
    {
      if ((unint64_t)(a4 - 3) >= 2)
      {
        if (v16 != 21)
        {
          if (v16 == 22) {
            double v10 = 45.0;
          }
          else {
            double v10 = __103__UISystemInputAssistantViewController__defaultPreferredHeightForTraitCollection_interfaceOrientation___block_invoke(v16);
          }
          goto LABEL_8;
        }
        *(double *)&uint64_t v43 = 44.0;
      }
      else
      {
        *(double *)&uint64_t v43 = 38.0;
      }
      goto LABEL_39;
    }
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v25 = +[UIKeyboardImpl activeInstance];
    v26 = [v25 candidateController];
    v27 = [v26 screenTraits];
    uint64_t v28 = [v27 idiom];
    if (!has_internal_diagnostics)
    {
      if (v28 == 1)
      {
LABEL_21:

LABEL_22:
        v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_defaultPreferredHeightForTraitCollection_interfaceOrientation____s_category)+ 8);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        v36 = v35;
        v37 = +[UIKeyboardImpl activeInstance];
        v38 = [v37 candidateController];
        v39 = [v38 screenTraits];
        *(_DWORD *)buf = 134218240;
        unint64_t v102 = v16;
        __int16 v103 = 2048;
        uint64_t v104 = [v39 idiom];
        _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "%ld != %ld", buf, 0x16u);

        goto LABEL_24;
      }
      v95 = v26;
      v98 = v25;
      v29 = +[UIKeyboardImpl activeInstance];
      v30 = [v29 candidateController];
      v31 = [v30 screenTraits];
      if ([v31 idiom] == 24)
      {
LABEL_20:

        v26 = v95;
        v25 = v98;
        goto LABEL_21;
      }
      v86 = v30;
      v89 = v29;
      v92 = v27;
      v32 = +[UIKeyboardImpl activeInstance];
      v33 = [v32 candidateController];
      v34 = [v33 screenTraits];
      if ([v34 idiom] == 25)
      {

        v29 = v89;
        v27 = v92;
        v30 = v86;
        goto LABEL_20;
      }
      v75 = v34;
      v78 = v33;
      v84 = v32;
      v72 = +[UIKeyboardImpl activeInstance];
      v68 = [v72 candidateController];
      v51 = [v68 screenTraits];
      if ([v51 idiom] == 26)
      {
        BOOL v81 = 1;
      }
      else
      {
        v66 = +[UIKeyboardImpl activeInstance];
        v61 = [v66 candidateController];
        v62 = [v61 screenTraits];
        BOOL v81 = [v62 idiom] == 23;
      }
      if (v81) {
        goto LABEL_22;
      }
LABEL_26:
      v40 = +[UIKeyboardImpl activeInstance];
      v41 = [v40 candidateController];
      v42 = [v41 screenTraits];
      if ([v42 idiom] == 1)
      {
      }
      else
      {
        v99 = v40;
        v44 = +[UIKeyboardImpl activeInstance];
        v45 = [v44 candidateController];
        v46 = [v45 screenTraits];
        if ([v46 idiom] == 24)
        {
        }
        else
        {
          v93 = v42;
          v96 = v41;
          v90 = v44;
          v47 = +[UIKeyboardImpl activeInstance];
          v48 = [v47 candidateController];
          v49 = [v48 screenTraits];
          if ([v49 idiom] != 25)
          {
            v80 = v49;
            v83 = v48;
            v87 = v47;
            v77 = +[UIKeyboardImpl activeInstance];
            v74 = [v77 candidateController];
            v50 = [v74 screenTraits];
            if ([v50 idiom] == 26)
            {
              BOOL v71 = 1;
            }
            else
            {
              v69 = +[UIKeyboardImpl activeInstance];
              v52 = [v69 candidateController];
              v53 = [v52 screenTraits];
              BOOL v71 = [v53 idiom] == 23;
            }
            if (!v71)
            {
              v54 = +[UIKeyboardImpl activeInstance];
              v55 = [v54 candidateController];
              [v55 candidateBarHeight];
              double v57 = v56;
              v58 = +[UIKeyboardImpl activeInstance];
              v59 = [v58 candidateController];
              [v59 candidateBarEdgeInsetsForOrientation:a4];
              double v10 = v57 + v60;

              goto LABEL_8;
            }
            goto LABEL_38;
          }
        }
      }
LABEL_38:
      *(double *)&uint64_t v43 = 42.0;
LABEL_39:
      double v10 = *(double *)&v43;
      goto LABEL_8;
    }
    if (v28 != 1)
    {
      v100 = +[UIKeyboardImpl activeInstance];
      v97 = [v100 candidateController];
      v63 = [v97 screenTraits];
      if ([v63 idiom] != 24)
      {
        v94 = +[UIKeyboardImpl activeInstance];
        v91 = [v94 candidateController];
        v88 = [v91 screenTraits];
        if ([v88 idiom] != 25)
        {
          v85 = +[UIKeyboardImpl activeInstance];
          v79 = [v85 candidateController];
          v76 = [v79 screenTraits];
          if ([v76 idiom] == 26)
          {
            BOOL v82 = 1;
          }
          else
          {
            v73 = +[UIKeyboardImpl activeInstance];
            v70 = [v73 candidateController];
            v67 = [v70 screenTraits];
            BOOL v82 = [v67 idiom] == 23;
          }
          if (!v82) {
            goto LABEL_26;
          }
LABEL_58:
          v37 = __UIFaultDebugAssertLog();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
            goto LABEL_25;
          }
          v38 = +[UIKeyboardImpl activeInstance];
          v64 = [v38 candidateController];
          v65 = [v64 screenTraits];
          *(_DWORD *)buf = 134218240;
          unint64_t v102 = v16;
          __int16 v103 = 2048;
          uint64_t v104 = [v65 idiom];
          _os_log_fault_impl(&dword_1853B0000, v37, OS_LOG_TYPE_FAULT, "%ld != %ld", buf, 0x16u);

LABEL_24:
LABEL_25:

          goto LABEL_26;
        }
      }
    }

    goto LABEL_58;
  }
  double v10 = 38.0;
LABEL_9:

  return v10;
}

double __103__UISystemInputAssistantViewController__defaultPreferredHeightForTraitCollection_interfaceOrientation___block_invoke(unint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1 < 9 && ((0x13Fu >> a1) & 1) != 0) {
    return dbl_186B94DF8[a1];
  }
  if (os_variant_has_internal_diagnostics())
  {
    id v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 134217984;
      unint64_t v7 = a1;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Unexpected user interface idiom: %ld", (uint8_t *)&v6, 0xCu);
    }

    return -1.0;
  }
  else
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &kUISystemInputAssistantCenterViewLandscapeWidth_block_invoke___s_category)+ 8);
    double v3 = -1.0;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      unint64_t v7 = a1;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Unexpected user interface idiom: %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

+ (int64_t)keyboardOrientation
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    return +[UIKeyboardSceneDelegate interfaceOrientation];
  }
  else
  {
    double v3 = +[UIKeyboard activeKeyboard];
    int64_t v4 = [v3 interfaceOrientation];

    return v4;
  }
}

+ (double)_defaultPreferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_defaultPreferredHeightForTraitCollection:interfaceOrientation:", v4, objc_msgSend(a1, "keyboardOrientation"));
  double v6 = v5;

  return v6;
}

- (void)loadView
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2050000000;
  double v3 = (void *)getTUISystemInputAssistantViewClass_softClass;
  uint64_t v12 = getTUISystemInputAssistantViewClass_softClass;
  if (!getTUISystemInputAssistantViewClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getTUISystemInputAssistantViewClass_block_invoke;
    v8[3] = &unk_1E52D9900;
    v8[4] = &v9;
    __getTUISystemInputAssistantViewClass_block_invoke((uint64_t)v8);
    double v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = [v4 alloc];
  double v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setBackgroundVisible:0];
  [v6 setDelegate:self];
  [v6 setAccessibilityIdentifier:@"SystemInputAssistantView"];
  unint64_t v7 = [v6 layer];
  [v7 addObserver:self forKeyPath:@"bounds" options:3 context:0];

  [(UIInputViewController *)self setView:v6];
}

- (void)viewDidLoad
{
  [(UISystemInputAssistantViewController *)self _registerForAssistantViewNotifications];
  id v5 = [(UIViewController *)self view];
  double v3 = [v5 _inheritedRenderConfig];
  id v4 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v4 setRenderConfig:v3];
}

- (id)_inputDelegateAsResponder:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    if ((objc_msgSend(v3, "__isKindOfUIResponder") & 1) == 0)
    {
      double v6 = +[UIKeyboardImpl activeInstance];
      id v5 = [v6 delegateAsResponder];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_currentInputDelegate
{
  v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 inputDelegateManager];
  id v4 = [v3 keyInputDelegate];

  return v4;
}

- (void)updateAssistantPreferences
{
  if (![(UISystemInputAssistantViewController *)self hasCheckedPreferences]
    && ![(UISystemInputAssistantViewController *)self currentlyCheckingPreferences])
  {
    [(UISystemInputAssistantViewController *)self setCurrentlyCheckingPreferences:1];
    id v3 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke(uint64_t a1)
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 preferencesActions];
  objc_msgSend(*(id *)(a1 + 32), "setAssistantEnabledPreference:", objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE790]));

  if (os_variant_has_internal_diagnostics())
  {
    id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v5 = [v4 preferencesActions];
    objc_msgSend(*(id *)(a1 + 32), "setAssistantOniPhonePreference:", objc_msgSend(v5, "BOOLForPreferenceKey:", @"KeyboardAssistantOniPhone"));
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentlyCheckingPreferences:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setHasCheckedPreferences:1];
}

- (void)preferencesControllerChanged:(id)a3
{
  [(UISystemInputAssistantViewController *)self setHasCheckedPreferences:0];
  [(UISystemInputAssistantViewController *)self updateAssistantPreferences];
}

- (BOOL)_isAssistantPreferenceEnabled
{
  if (![(UISystemInputAssistantViewController *)self hasCheckedPreferences])
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v4 = [v3 preferencesActions];
    -[UISystemInputAssistantViewController setAssistantEnabledPreference:](self, "setAssistantEnabledPreference:", [v4 BOOLForPreferenceKey:*MEMORY[0x1E4FAE790]]);

    [(UISystemInputAssistantViewController *)self setHasCheckedPreferences:1];
  }
  return [(UISystemInputAssistantViewController *)self assistantEnabledPreference];
}

- (BOOL)_assistantItemsVisibleForResponder:(id)a3
{
  id v4 = a3;
  if (([v4 _isDisplayingWritingToolsSessionInUCB] & 1) == 0)
  {
    BOOL v6 = [(UISystemInputAssistantViewController *)self _isAssistantPreferenceEnabled];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__72;
    v32[4] = __Block_byref_object_dispose__72;
    id v33 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__UISystemInputAssistantViewController__assistantItemsVisibleForResponder___block_invoke;
    aBlock[3] = &unk_1E52EC080;
    v31 = v32;
    id v7 = v4;
    id v30 = v7;
    uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v9 = v8;
    if (v6)
    {
      int v5 = 1;
    }
    else
    {
      double v10 = v8[2](v8);
      int v5 = [v10 allowsHidingShortcuts] ^ 1;
    }
    uint64_t v11 = +[UIKeyboardImpl activeInstance];
    int v28 = [v11 _showsScribbleIconsInAssistantView];

    uint64_t v12 = [(UISystemInputAssistantViewController *)self inputWindowController];
    double v13 = [v12 placement];
    if ([v13 isFloating])
    {
      int v14 = 1;
    }
    else
    {
      v15 = [(UISystemInputAssistantViewController *)self inputWindowController];
      unint64_t v16 = [v15 placement];
      int v14 = [v16 isHiddenForFloatingTransition];
    }
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
      && +[UIKeyboard usesInputSystemUI])
    {
      if ((+[UIKeyboard usesLocalKeyboard] & v5 & 1) == 0)
      {
        if ((v5 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_24:
        int v18 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v19 = [v18 visualModeManager];
        int v20 = [v19 useVisualModeWindowed];

        if (v20 && ([v7 inputView], (double v21 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          LOBYTE(v5) = 0;
        }
        else
        {
          v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          char v23 = [v22 hasCustomInputViewController];

          if (v23)
          {
LABEL_28:
            LOBYTE(v5) = 0;
            goto LABEL_37;
          }
          double v21 = v9[2](v9);
          v24 = [v21 leadingBarButtonGroups];
          if ([v24 count])
          {
            LOBYTE(v5) = 1;
          }
          else
          {
            v25 = [v21 trailingBarButtonGroups];
            if ([v25 count])
            {
              LOBYTE(v5) = 1;
            }
            else
            {
              v26 = [v21 _centerBarButtonGroups];
              LOBYTE(v5) = [v26 count] != 0;
            }
          }
        }
        goto LABEL_37;
      }
    }
    else if (!v5)
    {
      goto LABEL_37;
    }
    v17 = +[UIDevice currentDevice];
    if ([v17 userInterfaceIdiom] == 6)
    {

      if ((v5 & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {

      if ((v14 & ~v28) != 1)
      {
        if (v5) {
          goto LABEL_24;
        }
        goto LABEL_37;
      }
    }
    else
    {
    }
    int v5 = [(UISystemInputAssistantViewController *)self _shouldShowExpandableButtonBarItemsForResponder:v7];
    if (v5) {
      goto LABEL_24;
    }
LABEL_37:

    _Block_object_dispose(v32, 8);
    goto LABEL_38;
  }
  LOBYTE(v5) = 0;
LABEL_38:

  return v5;
}

id __75__UISystemInputAssistantViewController__assistantItemsVisibleForResponder___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = _UIResponderFindInputAssistantItem(*(void **)(a1 + 32));
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

- (BOOL)_centerPredictionViewVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UISystemInputAssistantViewController *)self centerViewController];

  if (!v8) {
    [(UISystemInputAssistantViewController *)self automaticallySetCenterViewControllerBasedOnInputDelegate:v6];
  }
  uint64_t v9 = [(UISystemInputAssistantViewController *)self centerViewController];
  if (objc_opt_respondsToSelector())
  {
    double v10 = [(UISystemInputAssistantViewController *)self centerViewController];
    int v11 = [v10 requiresKeyboard];

    if (v11)
    {
      uint64_t v12 = [v7 keyboard];

      if (!v12) {
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
  double v13 = [(UISystemInputAssistantViewController *)self centerViewController];
  char v14 = [v13 isVisibleForInputDelegate:v6 inputViews:v7];

  if (v14)
  {
    BOOL v15 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if ([(UISystemInputAssistantViewController *)self _canShowCenterBarButtonItem])
  {
    unint64_t v16 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v6];
    v17 = _UIResponderFindInputAssistantItem(v16);

    int v18 = [v17 _centerBarButtonGroups];
    BOOL v15 = [v18 count] != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_13:

  return v15;
}

- (BOOL)shouldBeShownForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v6 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    if (v8) {
      goto LABEL_3;
    }
LABEL_11:
    unint64_t v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v8 = [v16 inputViews];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
  double v10 = [v9 currentInputMode];

  int v11 = [v10 identifier];
  int v12 = [v11 containsString:@"dictation"];

  int v13 = [v10 isEmojiInputMode];
  int v14 = [v10 isSpecializedInputMode];
  if (!v14) {
    goto LABEL_6;
  }
  if ((+[UIKeyboard isMajelEnabled] & v12) != 1)
  {
    LOBYTE(v15) = 1;
    if (!v13) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  uint64_t v4 = +[UIKeyboardImpl activeInstance];
  if (![v4 isMinimized])
  {
    LOBYTE(v15) = 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v15) = v13;
    if (_os_feature_enabled_impl())
    {
      int v15 = +[UIKeyboard usesInputSystemUI] & v13;
      if (!v14)
      {
LABEL_8:
        if (!v13) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }
    }
    else if (!v14)
    {
      goto LABEL_8;
    }
  }

  if (!v13) {
    goto LABEL_20;
  }
LABEL_18:
  v17 = [v8 keyboard];
  if (v17)
  {
  }
  else
  {
    uint64_t v45 = [v8 inputAccessoryView];
    if (v45)
    {
      v46 = (void *)v45;
      BOOL v47 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled];

      if (v47) {
        goto LABEL_46;
      }
    }
  }
LABEL_20:
  if (+[UIKeyboard usesInputSystemUI])
  {
    int v18 = +[UIKeyboardImpl activeInstance];
    int v19 = [v18 showingEmojiSearch];

    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((v15 & 1) == 0) {
      goto LABEL_29;
    }
LABEL_46:
    char v44 = 0;
    goto LABEL_47;
  }
  int v19 = [v6 keyboardType] == 122;
LABEL_24:
  char v20 = v15 & ~(_BYTE)v12;
  if (!v19) {
    char v20 = v15;
  }
  if (v20) {
    goto LABEL_46;
  }
LABEL_29:
  BOOL v21 = [(UISystemInputAssistantViewController *)self _centerPredictionViewVisibleForInputDelegate:v6 inputViews:v8];
  if (!v21) {
    goto LABEL_50;
  }
  v22 = +[UIKeyboard activeKeyboard];
  char v23 = [v22 _rootInputWindowController];
  v24 = [v23 placement];
  v25 = UIAssistantViewPlacement(v24);
  char v26 = [v25 isFloating];

  if ((v26 & 1) == 0)
  {
LABEL_50:
    v27 = +[UIKeyboardImpl activeInstance];
    char v28 = [v27 _shouldSuppressAssistantBar];

    if (v28) {
      goto LABEL_46;
    }
  }
  if (([v6 conformsToProtocol:&unk_1ED42F658] & 1) == 0
    && ([v6 conformsToProtocol:&unk_1ED700940] & 1) == 0
    && ![v6 conformsToProtocol:&unk_1ED7009A0])
  {
    goto LABEL_46;
  }
  v29 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v30 = [v29 hideSystemInputAssistantView];

  if (v30) {
    goto LABEL_46;
  }
  v31 = +[UIKeyboardImpl activeInstance];
  char v32 = [v31 disableInputBars];

  if (v32) {
    goto LABEL_46;
  }
  id v33 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v34 = [v33 visualModeManager];
  char v35 = [v34 useVisualModeWindowed];

  LODWORD(v34) = [(UISystemInputAssistantViewController *)self layoutHasBuiltinAssistantView];
  v36 = +[UIKeyboardImpl activeInstance];
  int v37 = [v36 _showsScribbleIconsInAssistantView];

  if (v34)
  {
    if ((v35 & 1) == 0 && !v37) {
      goto LABEL_46;
    }
  }
  v38 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v6];
  BOOL v39 = [(UISystemInputAssistantViewController *)self _assistantItemsVisibleForResponder:v38];

  v40 = [(UISystemInputAssistantViewController *)self inputWindowController];
  v41 = [v40 placement];
  v42 = UIAssistantViewPlacement(v41);

  int v43 = [v42 isFloatingAssistantView];
  char v44 = v43 | (v21 || v39);
  if (v43 && !v21 && !v39) {
    char v44 = +[UIAssistantBarButtonItemProvider isKeyboardGroupVisible];
  }

LABEL_47:
  return v44;
}

- (BOOL)_isEmojiInputMode
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v3 = [v2 currentInputMode];
  char v4 = [v3 isEmojiInputMode];

  return v4;
}

- (BOOL)shouldShowEmojiSearchViewControllerForInputDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl()
    && !+[UIKeyboard usesInputSystemUI])
  {
    if (!v4)
    {
      id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    }
    BOOL v7 = [(UISystemInputAssistantViewController *)self _isEmojiInputMode];
    uint64_t v8 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    uint64_t v9 = [v8 emojiSearchView];
    double v10 = [v9 searchTextField];
    LOBYTE(v5) = [v10 isActive];

    int v11 = !v7;
    if (v7)
    {
      int v12 = +[UIKeyboardInputModeController sharedInputModeController];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      int v13 = objc_msgSend(v12, "activeInputModes", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([*(id *)(*((void *)&v18 + 1) + 8 * i) supportsEmojiSearch])
            {
              LOBYTE(v5) = 1;
              goto LABEL_18;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      int v13 = [v12 currentSystemInputModeExcludingEmoji:1];
      int v5 = [v13 supportsEmojiSearch] | v11;
LABEL_18:
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_shouldCollapseEmojiSearchView
{
  v2 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
  uint64_t v3 = [v2 emojiSearchView];
  id v4 = [v3 searchTextField];
  char v5 = [v4 isActive] ^ 1;

  return v5;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  -[UISystemInputAssistantViewController preferredHeightForTraitCollection:orientation:](self, "preferredHeightForTraitCollection:orientation:", v4, [(id)objc_opt_class() keyboardOrientation]);
  double v6 = v5;

  return v6;
}

- (double)preferredHeightForTraitCollection:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(UISystemInputAssistantViewController *)self centerViewController];

  if (!v7)
  {
    uint64_t v8 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    [(UISystemInputAssistantViewController *)self automaticallySetCenterViewControllerBasedOnInputDelegate:v8];
  }
  uint64_t v9 = [(UISystemInputAssistantViewController *)self centerViewController];

  if (!v9
    || ([(UISystemInputAssistantViewController *)self centerViewController],
        double v10 = objc_claimAutoreleasedReturnValue(),
        [v10 preferredHeightForTraitCollection:v6],
        double v12 = v11,
        v10,
        v12 == -1.0))
  {
    [(id)objc_opt_class() _defaultPreferredHeightForTraitCollection:v6 interfaceOrientation:a4];
    double v12 = v13;
  }
  remoteAssistantView = self->_remoteAssistantView;
  if (remoteAssistantView)
  {
    if (![(UIView *)remoteAssistantView isHidden])
    {
      [(UIRemoteInputViewInfo *)self->_remoteAssistantViewInfo size];
      if (v12 < v15) {
        double v12 = v15;
      }
    }
  }

  return v12;
}

- (BOOL)layoutHasBuiltinAssistantView
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    goto LABEL_4;
  }
  uint64_t v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 _layout];
  uint64_t v5 = [v4 candidateList];
  if (!v5)
  {
    LOBYTE(v8) = 0;
LABEL_7:

    return v8;
  }
  id v6 = (void *)v5;
  BOOL v7 = +[UIKeyboardImpl isSplit];

  if (!v7)
  {
    uint64_t v3 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    id v4 = [v3 emojiSearchView];
    uint64_t v9 = [v4 searchTextField];
    int v8 = [v9 isActive] ^ 1;

    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v8) = 0;
  return v8;
}

- (void)_showCandidates
{
  uint64_t v3 = [(UISystemInputAssistantViewController *)self candidateViewController];

  if (v3)
  {
    id v4 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v4 setButtonBarItemsExpanded:0 animated:0];
  }
}

- (void)_candidatesChanged
{
  if ([(UISystemInputAssistantViewController *)self shouldShowEmojiSearchViewControllerForInputDelegate:0])
  {
    uint64_t v3 = [(UISystemInputAssistantViewController *)self candidateViewController];

    if (v3)
    {
      id v4 = +[UIKeyboardImpl activeInstance];
      id v11 = [v4 candidateController];

      if ([v11 hasCandidates]
        && (+[UIKeyboardImpl activeInstance],
            uint64_t v5 = objc_claimAutoreleasedReturnValue(),
            int v6 = [v5 hasMarkedText],
            v5,
            v6))
      {
        BOOL v7 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
        int v8 = [v7 emojiSearchView];
        uint64_t v9 = v8;
        uint64_t v10 = 1;
      }
      else
      {
        BOOL v7 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
        int v8 = [v7 emojiSearchView];
        uint64_t v9 = v8;
        uint64_t v10 = 0;
      }
      [v8 setPredictionViewVisible:v10 animated:1];
    }
  }
}

- (void)_inputModeChanged:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
  int v6 = [v5 emojiSearchView];
  BOOL v7 = [v6 searchTextField];

  int v8 = [v7 isActive];
  if ([(UISystemInputAssistantViewController *)self _isEmojiInputMode]) {
    [(UISystemInputAssistantViewController *)self _dismissEmojiSearch];
  }
  uint64_t v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKey:@"UITextInputFromInputModeKey"];

  if (([v10 isEmojiInputMode] & 1) == 0
    && ([(UISystemInputAssistantViewController *)self _isEmojiInputMode] | v8) == 1)
  {
    long long v19 = @"UIKeyboardSwitchToEmojiIsEmojiInputMode";
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode"));
    v20[0] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

    double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"UIKeyboardSwitchToEmoji" object:0 userInfo:v12];

    uint64_t v14 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    self->_BOOL isButtonBarItemsInlineVisible = [v14 showsButtonBarItemsInline];

    double v15 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v15 setShowsButtonBarItemsInline:0];

LABEL_12:
    goto LABEL_14;
  }
  if ([v10 isEmojiInputMode]
    && (([(UISystemInputAssistantViewController *)self _isEmojiInputMode] | v8) & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"UIKeyboardSwitchedAwayFromEmoji" object:0];

    BOOL isButtonBarItemsInlineVisible = self->_isButtonBarItemsInlineVisible;
    long long v18 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v18 setShowsButtonBarItemsInline:isButtonBarItemsInlineVisible];

    self->_postedSwitchFromEmojiNotification = 1;
    goto LABEL_14;
  }
  if ([v10 isEmojiInputMode]
    && ![(UISystemInputAssistantViewController *)self _isEmojiInputMode]
    && ((v8 ^ 1) & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"UIKeyboardSwitchToEmojiSearch" object:0];
    goto LABEL_12;
  }
LABEL_14:
  [(UISystemInputAssistantViewController *)self dismissKeyboardItemIfNeeded];
  [(UISystemInputAssistantViewController *)self updateRemoteAssistantViewHidden];
}

- (void)_writingDirectionChanged:(id)a3
{
  id v17 = a3;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v5 = [v4 currentInputMode];

  if (([v5 isEmojiInputMode] & 1) == 0)
  {
    int v6 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
    BOOL v7 = [v6 searchTextField];
    int v8 = [v7 isActive];

    if (!v8)
    {
      if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled])goto LABEL_9; {
      goto LABEL_7;
      }
    }
  }
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled])
  {
    uint64_t v9 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
    uint64_t v10 = [v9 searchTextField];
    char v11 = [v10 isActive];

    if ((v11 & 1) == 0)
    {
LABEL_7:
      double v15 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController view];
      [v15 _setLocalOverrideTraitCollection:0];
      goto LABEL_8;
    }
  }
  double v12 = [v17 userInfo];
  double v13 = [v12 objectForKeyedSubscript:@"writingDirection"];
  int v14 = [v13 intValue];

  double v15 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController view];
  uint64_t v16 = +[UITraitCollection traitCollectionWithLayoutDirection:v14 == 1];
  [v15 _setLocalOverrideTraitCollection:v16];

LABEL_8:
LABEL_9:
}

- (void)_expandBarItems
{
  id v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v2 setButtonBarItemsExpanded:1 animated:1];
}

- (void)_collapseBarItems
{
  uint64_t v3 = [(UISystemInputAssistantViewController *)self predictionViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    char v6 = [v5 centerViewHidden];

    if ((v6 & 1) == 0)
    {
      id v7 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      [v7 setButtonBarItemsExpanded:0 animated:1];
    }
  }
}

- (TUISystemInputAssistantLayoutStandard)standardAssistantViewLayout
{
  if (!self->_standardAssistantViewLayout)
  {
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2050000000;
    uint64_t v3 = (void *)getTUISystemInputAssistantLayoutStandardClass_softClass;
    uint64_t v17 = getTUISystemInputAssistantLayoutStandardClass_softClass;
    if (!getTUISystemInputAssistantLayoutStandardClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getTUISystemInputAssistantLayoutStandardClass_block_invoke;
      v13[3] = &unk_1E52D9900;
      v13[4] = &v14;
      __getTUISystemInputAssistantLayoutStandardClass_block_invoke((uint64_t)v13);
      uint64_t v3 = (void *)v15[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v14, 8);
    uint64_t v5 = (TUISystemInputAssistantLayoutStandard *)objc_alloc_init(v4);
    standardAssistantViewLayout = self->_standardAssistantViewLayout;
    self->_standardAssistantViewLayout = v5;
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (+[UIKeyboardImpl isSplit]) {
      uint64_t v8 = [v7 centerFilled] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
    [(TUISystemInputAssistantLayoutStandard *)self->_standardAssistantViewLayout setIsSplit:v8];
    [v7 frameForKeylayoutName:@"split-left"];
    [(TUISystemInputAssistantLayoutStandard *)self->_standardAssistantViewLayout setLeftSplitWidth:v9];
    [v7 frameForKeylayoutName:@"split-right"];
    [(TUISystemInputAssistantLayoutStandard *)self->_standardAssistantViewLayout setRightSplitWidth:v10];
  }
  char v11 = self->_standardAssistantViewLayout;

  return v11;
}

- (TUISystemInputAssistantLayout)floatAssistantViewLayout
{
  floatAssistantViewLayout = self->_floatAssistantViewLayout;
  if (!floatAssistantViewLayout)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getTUISystemInputAssistantLayoutFloatClass_softClass;
    uint64_t v13 = getTUISystemInputAssistantLayoutFloatClass_softClass;
    if (!getTUISystemInputAssistantLayoutFloatClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantLayoutFloatClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getTUISystemInputAssistantLayoutFloatClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v10, 8);
    char v6 = (TUISystemInputAssistantLayout *)objc_alloc_init(v5);
    id v7 = self->_floatAssistantViewLayout;
    self->_floatAssistantViewLayout = v6;

    floatAssistantViewLayout = self->_floatAssistantViewLayout;
  }
  return floatAssistantViewLayout;
}

- (TUISystemInputAssistantLayout)compactAssistantViewLayout
{
  if (!self->_compactAssistantViewLayout)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v3 = (void *)getTUISystemInputAssistantLayoutCompactClass_softClass;
    uint64_t v13 = getTUISystemInputAssistantLayoutCompactClass_softClass;
    if (!getTUISystemInputAssistantLayoutCompactClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantLayoutCompactClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getTUISystemInputAssistantLayoutCompactClass_block_invoke((uint64_t)v9);
      uint64_t v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = (TUISystemInputAssistantLayout *)objc_alloc_init(v4);
    compactAssistantViewLayout = self->_compactAssistantViewLayout;
    self->_compactAssistantViewLayout = v5;
  }
  id v7 = self->_compactAssistantViewLayout;
  return v7;
}

- (TUISystemInputAssistantLayoutSplit)splitAssistantViewLayout
{
  if (!self->_splitAssistantViewLayout)
  {
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2050000000;
    uint64_t v3 = (void *)getTUISystemInputAssistantLayoutSplitClass_softClass;
    uint64_t v17 = getTUISystemInputAssistantLayoutSplitClass_softClass;
    if (!getTUISystemInputAssistantLayoutSplitClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getTUISystemInputAssistantLayoutSplitClass_block_invoke;
      v13[3] = &unk_1E52D9900;
      v13[4] = &v14;
      __getTUISystemInputAssistantLayoutSplitClass_block_invoke((uint64_t)v13);
      uint64_t v3 = (void *)v15[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v14, 8);
    uint64_t v5 = (TUISystemInputAssistantLayoutSplit *)objc_alloc_init(v4);
    splitAssistantViewLayout = self->_splitAssistantViewLayout;
    self->_splitAssistantViewLayout = v5;
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 frameForKeylayoutName:@"split-left"];
    [(TUISystemInputAssistantLayoutSplit *)self->_splitAssistantViewLayout setLeftSplitWidth:v9];
    [v8 frameForKeylayoutName:@"split-right"];
    [(TUISystemInputAssistantLayoutSplit *)self->_splitAssistantViewLayout setRightSplitWidth:v10];
  }
  char v11 = self->_splitAssistantViewLayout;

  return v11;
}

- (TUISystemInputAssistantStyleStandard)standardStyle
{
  standardStyle = self->_standardStyle;
  if (!standardStyle)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getTUISystemInputAssistantStyleStandardClass_softClass;
    uint64_t v13 = getTUISystemInputAssistantStyleStandardClass_softClass;
    if (!getTUISystemInputAssistantStyleStandardClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantStyleStandardClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getTUISystemInputAssistantStyleStandardClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v10, 8);
    char v6 = (TUISystemInputAssistantStyleStandard *)objc_alloc_init(v5);
    id v7 = self->_standardStyle;
    self->_standardStyle = v6;

    standardStyle = self->_standardStyle;
  }
  return standardStyle;
}

- (TUISystemInputAssistantStyleFloat)floatStyle
{
  floatStyle = self->_floatStyle;
  if (!floatStyle)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getTUISystemInputAssistantStyleFloatClass_softClass;
    uint64_t v13 = getTUISystemInputAssistantStyleFloatClass_softClass;
    if (!getTUISystemInputAssistantStyleFloatClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantStyleFloatClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getTUISystemInputAssistantStyleFloatClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v10, 8);
    char v6 = (TUISystemInputAssistantStyleFloat *)objc_alloc_init(v5);
    id v7 = self->_floatStyle;
    self->_floatStyle = v6;

    floatStyle = self->_floatStyle;
  }
  return floatStyle;
}

- (TUISystemInputAssistantStyleCompact)compactStyle
{
  compactStyle = self->_compactStyle;
  if (!compactStyle)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getTUISystemInputAssistantStyleCompactClass_softClass;
    uint64_t v13 = getTUISystemInputAssistantStyleCompactClass_softClass;
    if (!getTUISystemInputAssistantStyleCompactClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantStyleCompactClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getTUISystemInputAssistantStyleCompactClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v10, 8);
    char v6 = (TUISystemInputAssistantStyleCompact *)objc_alloc_init(v5);
    id v7 = self->_compactStyle;
    self->_compactStyle = v6;

    compactStyle = self->_compactStyle;
  }
  return compactStyle;
}

- (BOOL)_canShowCenterBarButtonItem
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 1;
  }
  id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
  uint64_t v5 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v4];

  BOOL v6 = [(UISystemInputAssistantViewController *)self _allowedToShowBarButtonItemsInline:v5];
  return v6;
}

- (void)automaticallySetCenterViewControllerBasedOnInputDelegate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(UISystemInputAssistantViewController *)self assistantBarStyle];
  BOOL v6 = +[UIKeyboardImpl activeInstance];
  char v7 = [v6 suppressUpdateLayout];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(UISystemInputAssistantViewController *)self inputWindowController];
    double v9 = [v8 animationAwarePlacement];
    uint64_t v10 = UIAssistantViewPlacement(v9);

    if (([v10 showsInputOrAssistantViews] & 1) != 0 || objc_msgSend(v10, "isUndocked")) {
      uint64_t v5 = UIGetAssistantBarStyleFromPlacement(v10);
    }
  }
  char v11 = [(UISystemInputAssistantViewController *)self _customCenterBarButtonItem:v4];
  uint64_t v12 = [(UISystemInputAssistantViewController *)self _customCenterViewController:v4];
  if (!v11)
  {
    if (+[UIKeyboard usesInputSystemUI]
      || [(UISystemInputAssistantViewController *)self showsRemoteInputDashViewController])
    {
      uint64_t v13 = +[UIKeyboardImpl activeInstance];
      [v13 showsCandidateBar];
    }
    else
    {
      double v56 = +[UIKeyboardImpl activeInstance];
      char v57 = [v56 showsCandidateBar];

      if ((v57 & 1) == 0)
      {
        v58 = +[UIKeyboardImpl activeInstance];
        v59 = [v58 _layout];
        char v60 = [v59 hasCandidateKeys];

        if ((v60 & 1) == 0)
        {
          if (_os_feature_enabled_impl())
          {
            v61 = +[UIKeyboardInputModeController sharedInputModeController];
            v62 = [v61 currentInputMode];
            [v62 showsTransliterationCandidates];
          }
        }
      }
    }
  }
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  if (!v15
    || (uint64_t v16 = (void *)v15,
        [(UISystemInputAssistantViewController *)self predictiveViewController],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = objc_opt_class(),
        v17,
        v16,
        (objc_class *)v18 != v14))
  {
    long long v19 = NSStringFromClass(v14);
    long long v20 = [(UISystemInputAssistantViewController *)self cachedPredictiveViewControllers];
    long long v21 = [v20 objectForKey:v19];

    if (!v21)
    {
      long long v21 = (void *)[[v14 alloc] initWithNibName:0 bundle:0];
      if (v21)
      {
        v22 = [(UISystemInputAssistantViewController *)self cachedPredictiveViewControllers];
        [v22 setObject:v21 forKey:v19];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v21, "setShowsRemoteInputDashViewController:", -[UISystemInputAssistantViewController showsRemoteInputDashViewController](self, "showsRemoteInputDashViewController"));
    }
    [(UISystemInputAssistantViewController *)self setPredictiveViewController:v21];
    uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 postNotificationName:@"_uisavcccn" object:0];
  }
  if ([(UISystemInputAssistantViewController *)self shouldShowEmojiSearchViewControllerForInputDelegate:v4])
  {
    v24 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];

    if (!v24)
    {
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2050000000;
      v25 = (void *)getTUIEmojiSearchInputViewControllerClass_softClass_0;
      uint64_t v67 = getTUIEmojiSearchInputViewControllerClass_softClass_0;
      if (!getTUIEmojiSearchInputViewControllerClass_softClass_0)
      {
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __getTUIEmojiSearchInputViewControllerClass_block_invoke_0;
        v63[3] = &unk_1E52D9900;
        v63[4] = &v64;
        __getTUIEmojiSearchInputViewControllerClass_block_invoke_0((uint64_t)v63);
        v25 = (void *)v65[3];
      }
      char v26 = v25;
      _Block_object_dispose(&v64, 8);
      v27 = (void *)[[v26 alloc] initWithNibName:0 bundle:0];
      [(UISystemInputAssistantViewController *)self setEmojiSearchViewController:v27];

      char v28 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
      [v28 setDelegate:self];
    }
    BOOL v29 = [(UISystemInputAssistantViewController *)self _shouldCollapseEmojiSearchView];
    char v30 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    v31 = [v30 emojiSearchView];
    [v31 setCollapsed:v29];

    char v32 = [(UISystemInputAssistantViewController *)self predictiveViewController];
    id v33 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    [v33 setChildPredictionViewController:v32];

    v34 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    [(UISystemInputAssistantViewController *)self setCenterViewController:v34];

    char v35 = +[UIKeyboardImpl activeInstance];
    v36 = [v35 autocorrectionController];
    [v36 addAutocorrectionObserver:self];

    int v37 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    v38 = [v37 emojiSearchView];
    BOOL v39 = [v38 searchTextField];
    [v39 setKeyboardType:122];

    v40 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    v41 = [v40 emojiSearchView];
    v42 = [v41 searchTextField];
    [v42 setReturnKeyType:9];

    char v11 = 0;
  }
  else
  {
    int v43 = [(UISystemInputAssistantViewController *)self centerViewController];
    char v44 = v43;
    if (v12)
    {

      if (v44 != v12) {
        [(UISystemInputAssistantViewController *)self setCenterViewController:v12];
      }
    }
    else
    {
      uint64_t v45 = [(UISystemInputAssistantViewController *)self predictiveViewController];

      if (v44 != v45)
      {
        v46 = +[UIKeyboardImpl activeInstance];
        BOOL v47 = [v46 autocorrectionController];
        [v47 removeAutocorrectionObserver:self];

        v48 = [(UISystemInputAssistantViewController *)self predictiveViewController];
        [(UISystemInputAssistantViewController *)self setCenterViewController:v48];
      }
    }
  }
  uint64_t v49 = [v11 customView];
  if (v49)
  {
    v50 = (void *)v49;
    v51 = [(UISystemInputAssistantViewController *)self compatibilityViewController];
    v52 = [v51 customView];
    v53 = [v11 customView];

    if (v52 != v53)
    {
      v54 = [v11 customView];
      v55 = [(UISystemInputAssistantViewController *)self compatibilityViewController];
      [v55 setCustomView:v54];
    }
  }
  [(UISystemInputAssistantViewController *)self _updateViewsForAssistantBarStyle:v5];
  [(UISystemInputAssistantViewController *)self updateCenterViewVisibilityStateForInputDelegate:v4];
  [(UISystemInputAssistantViewController *)self updateAssistantBarStyle:v5];
}

- (BOOL)updateFloatingAssistantRectEdge:(unint64_t)a3 position:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  double v9 = [v8 layout];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    uint64_t v12 = [v11 layout];
    objc_msgSend(v12, "trackHorizontalMovement:", x, y);

    uint64_t v13 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    uint64_t v14 = [v13 layout];
    [v14 setCurrentRectEdge:a3];
  }
  return v10 & 1;
}

- (void)prepareTransition:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = UIAssistantViewPlacement(a3);
  uint64_t v7 = UIGetAssistantBarStyleFromPlacement(v6);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__UISystemInputAssistantViewController_prepareTransition_animated___block_invoke;
  v13[3] = &unk_1E52D9CD0;
  v13[4] = self;
  void v13[5] = v7;
  uint64_t v8 = _Block_copy(v13);
  double v9 = v8;
  if (v4)
  {
    char v10 = [(UISystemInputAssistantViewController *)self layoutFromAssistantBarStyle:v7];
    char v11 = [(UISystemInputAssistantViewController *)self styleFromAssistantBarStyle:v7];
    uint64_t v12 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v12 transitionToLayout:v10 withStyle:v11 start:v9];
  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
  [(UISystemInputAssistantViewController *)self _updateViewsForAssistantBarStyle:v7];
}

void __67__UISystemInputAssistantViewController_prepareTransition_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateAssistantBarStyle:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 observedInputAssistantItem];
  [v2 _updateSystemInputAssistantViewStylingForInputAssistantItem:v3];
}

- (void)_updateViewsForAssistantBarStyle:(int64_t)a3
{
  uint64_t v5 = [(UISystemInputAssistantViewController *)self layoutFromAssistantBarStyle:"layoutFromAssistantBarStyle:"];
  BOOL v6 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v6 setLayout:v5];

  uint64_t v7 = [(UISystemInputAssistantViewController *)self styleFromAssistantBarStyle:a3];
  uint64_t v8 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [(id)v8 setStyle:v7];

  double v9 = [(UISystemInputAssistantViewController *)self centerViewController];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    id v10 = [(UISystemInputAssistantViewController *)self centerViewController];
    [v10 setAssistantBarStyle:a3];
  }
}

- (void)setCenterViewController:(id)a3
{
  uint64_t v5 = (UIPredictiveViewController *)a3;
  centerViewController = self->_centerViewController;
  char v11 = v5;
  if (centerViewController != v5)
  {
    [(UIPredictiveViewController *)centerViewController removeFromParentViewController];
    uint64_t v7 = [(UIPredictiveViewController *)self->_centerViewController view];
    [v7 removeFromSuperview];

    objc_storeStrong((id *)&self->_centerViewController, a3);
    if (v11)
    {
      uint64_t v8 = [(UIPredictiveViewController *)v11 view];
      [v8 removeFromSuperview];

      [(UIViewController *)self addChildViewController:v11];
      double v9 = [(UIPredictiveViewController *)v11 view];
      id v10 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      [v10 setCenterView:v9];
    }
    if (objc_opt_respondsToSelector()) {
      [(UIPredictiveViewController *)v11 setAssistantBarStyle:self->_assistantBarStyle];
    }
  }
}

- (BOOL)_hidesCenterViewForActiveWindowingMode
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v4 = [v3 visualModeManager];
  char v5 = [v4 useVisualModeWindowed];

  BOOL v6 = [(UIViewController *)self view];
  uint64_t v7 = [v6 window];
  uint64_t v8 = [v7 traitCollection];
  if ([v8 horizontalSizeClass] != 1) {
    char v5 = 0;
  }

  return v5;
}

- (void)updateCenterViewVisibilityStateForInputDelegate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
  }
  id v44 = v4;
  char v5 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v4];
  BOOL v6 = +[UIKeyboard activeKeyboard];
  uint64_t v7 = [v6 _rootInputWindowController];
  uint64_t v8 = [v7 placement];
  double v9 = UIAssistantViewPlacement(v8);

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    char v10 = [v9 isFloating] ^ 1;
  }
  else {
    char v10 = 0;
  }
  char v11 = +[UIKeyboardImpl activeInstance];
  uint64_t v12 = +[UIKeyboard activeKeyboard];
  uint64_t v13 = [v12 _rootInputWindowController];
  char v14 = [v13 isSplitting];

  char v15 = [v5 _disableAutomaticKeyboardUI];
  uint64_t v16 = [(UISystemInputAssistantViewController *)self centerViewController];
  int v17 = [v16 isVisibleForInputDelegate:v44 inputViews:0];

  char isKindOfClass = 0;
  if (+[UIKeyboard usesInputSystemUI] && (v10 & 1) == 0)
  {
    long long v19 = [(UISystemInputAssistantViewController *)self centerViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  BOOL v20 = [(UISystemInputAssistantViewController *)self _hidesCenterViewForActiveWindowingMode];
  BOOL v21 = +[UIKeyboard usesInputSystemUI];
  if ((v21 & v17) == 1) {
    int v22 = [v11 showingEmojiSearch] ^ 1;
  }
  else {
    LOBYTE(v22) = v17 & ~v21;
  }
  char v23 = v14 | v15 | ~(_BYTE)v22 | isKindOfClass | v20;
  v24 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  int v25 = [v24 centerViewHidden];

  char v26 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  uint64_t v27 = v23 & 1;
  [v26 setCenterViewHidden:v27];

  if (v25 != v27)
  {
    char v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v29 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v28 postNotificationName:@"_uisavcvcn" object:v29];
  }
  char v30 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    char v32 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    objc_msgSend(v32, "setScrollEnabled:", +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") ^ 1);
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    uint64_t v33 = 1;
  }
  else
  {
    v34 = [(UISystemInputAssistantViewController *)self centerViewController];
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      v36 = [(UISystemInputAssistantViewController *)self centerViewController];
      uint64_t v33 = [v36 hidesExpandableButton];
    }
    else
    {
      uint64_t v33 = 0;
    }
  }
  int v37 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v37 setHidesExpandableButton:v33];

  BOOL v38 = [(UISystemInputAssistantViewController *)self _shouldShowExpandableButtonBarItemsForResponder:v5];
  BOOL v39 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v39 setShowsExpandableButtonBarItems:v38];

  v40 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  uint64_t v41 = [v40 showsExpandableButtonBarItems];
  v42 = +[UIKeyboardImpl activeInstance];
  int v43 = [v42 candidateController];
  [v43 setReuseArrowButtonToExpandAssistantBarItems:v41];

  if ([(UISystemInputAssistantViewController *)self _hasCustomCenterViewControllerWidth])
  {
    [(UISystemInputAssistantViewController *)self _updateCenterViewWidthForInterfaceOrientation:+[UIKeyboardSceneDelegate interfaceOrientation]];
  }
}

- (void)setInputAssistantButtonItemsForResponder:(id)a3
{
  id v17 = a3;
  if ([(UISystemInputAssistantViewController *)self layoutHasBuiltinAssistantView])
  {
    [(UISystemInputAssistantViewController *)self _beginObservingInputAssistantItemForRelevantItemChanges:0];
  }
  else if ([(UISystemInputAssistantViewController *)self _assistantItemsVisibleForResponder:v17])
  {
    if (v17)
    {
      id v4 = _UIResponderFindInputAssistantItem(v17);
      char v5 = [(UISystemInputAssistantViewController *)self remoteAssistantItem];

      if (v5)
      {
        uint64_t v6 = [(UISystemInputAssistantViewController *)self remoteAssistantItem];

        id v4 = (void *)v6;
      }
      if (![(UISystemInputAssistantViewController *)self _isAssistantPreferenceEnabled]
        && [v4 allowsHidingShortcuts])
      {

        id v4 = 0;
      }
      uint64_t v7 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      [v7 setInputAssistantItem:v4];

      [(UISystemInputAssistantViewController *)self _beginObservingInputAssistantItemForRelevantItemChanges:v4];
      [(UISystemInputAssistantViewController *)self _updateSystemInputAssistantViewStylingForInputAssistantItem:v4];
    }
    uint64_t v8 = [(UISystemInputAssistantViewController *)self inputWindowController];
    double v9 = [v8 expectedPlacement];
    char v10 = UIAssistantViewPlacement(v9);

    uint64_t v11 = UIGetAssistantBarStyleFromPlacement(v10);
    if (self->_assistantBarStyle != v11)
    {
      int64_t v12 = v11;
      if (([v10 showsInputOrAssistantViews] & 1) != 0 || objc_msgSend(v10, "isUndocked"))
      {
        [(UISystemInputAssistantViewController *)self _updateViewsForAssistantBarStyle:v12];
        self->_assistantBarStyle = v12;
      }
      [(UISystemInputAssistantViewController *)self setOverrideSafeAreaInsets];
    }
    if ([(id)objc_opt_class() shouldShowSystemInputAssistantItems])
    {
      uint64_t v13 = +[UIAssistantBarButtonItemProvider unmodifiableSystemAssistantItem:self->_assistantBarStyle];
      char v14 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      [v14 setSystemInputAssistantItem:v13];
    }
  }
  else
  {
    char v15 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v15 setInputAssistantItem:0 force:1];

    uint64_t v16 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    [v16 setSystemInputAssistantItem:0];
  }
}

- (void)setNeedsValidation
{
  id v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v2 setNeedsValidation];
}

- (void)dismissKeyboardItemIfNeeded
{
  [(UISystemInputAssistantViewController *)self dismissLanguageIndicatorMenuIfNeeded];
  [(UISystemInputAssistantViewController *)self dismissDictationMenuIfNeeded];
}

- (void)dismissLanguageIndicatorMenuIfNeeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  id v3 = [v2 systemInputAssistantItem];
  id v4 = [v3 leadingBarButtonGroups];

  obuint64_t j = v4;
  uint64_t v19 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v7 = [v6 barButtonItems];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              int64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              if ([v12 tag] == 1735287116)
              {
                uint64_t v13 = [v12 view];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  char v15 = [v12 view];
                  uint64_t v16 = [v15 contextMenuInteraction];
                  [v16 dismissMenu];

                  goto LABEL_17;
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }
}

- (void)dismissDictationMenuIfNeeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  id v3 = [v2 systemInputAssistantItem];
  id v4 = [v3 trailingBarButtonGroups];

  obuint64_t j = v4;
  uint64_t v19 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v7 = [v6 barButtonItems];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              int64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              if ([v12 tag] == 1944175551)
              {
                uint64_t v13 = [v12 view];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  char v15 = [v12 view];
                  uint64_t v16 = [v15 contextMenuInteraction];
                  [v16 dismissMenu];

                  goto LABEL_17;
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }
}

- (void)_dismissEmojiSearch
{
  id v3 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
  id v4 = [v3 emojiSearchView];
  char v5 = [v4 searchTextField];
  int v6 = [v5 isActive];

  if (v6)
  {
    uint64_t v7 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    uint64_t v8 = [v7 emojiSearchView];
    uint64_t v9 = [v8 searchTextField];
    [v9 resignFirstResponder];
  }
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled])
  {
    id v10 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController view];
    [v10 _setLocalOverrideTraitCollection:0];
  }
}

- (void)setRemoteAssistantViewInfo:(id)a3
{
  id v31 = a3;
  objc_storeStrong((id *)&self->_remoteAssistantViewInfo, a3);
  [v31 size];
  double v6 = v5;
  double v8 = v7;
  [v31 insets];
  double v11 = v10;
  if (v9 <= 50.0) {
    double v12 = v9;
  }
  else {
    double v12 = 50.0;
  }
  if ([v31 contextId])
  {
    double v13 = v11 + fmin(v8, 120.0);
    char v14 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    char v15 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    uint64_t v16 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v15];

    if ([(UISystemInputAssistantViewController *)self _shouldShowExpandableButtonBarItemsForResponder:v16])
    {
      char v17 = objc_opt_respondsToSelector();
    }
    else
    {
      char v17 = 0;
    }
    double v18 = v13 + v12;
    int v19 = [v31 contextId];
    if (v19 != [(_UILayerHostView *)self->_remoteAssistantView contextID])
    {
      [(UIView *)self->_remoteAssistantView removeFromSuperview];
      long long v20 = -[_UILayerHostView initWithFrame:pid:contextID:]([_UILayerHostView alloc], "initWithFrame:pid:contextID:", [v31 processId], objc_msgSend(v31, "contextId"), 0.0, -v11, v6, v18);
      remoteAssistantView = self->_remoteAssistantView;
      self->_remoteAssistantView = v20;

      [(UIView *)self->_remoteAssistantView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_remoteAssistantView setClipsToBounds:1];
      [self->_remoteAssistantView setAccessibilityIdentifier:@"RemoteAssistantView"];
      long long v22 = [UIView alloc];
      long long v23 = -[UIView initWithFrame:](v22, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v6, v18);
      remoteAssistantContainerView = self->_remoteAssistantContainerView;
      self->_remoteAssistantContainerView = v23;

      [(UIView *)self->_remoteAssistantContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
      [self->_remoteAssistantContainerView setAccessibilityIdentifier:@"RemoteAssistantContainerView"];
      [(UIView *)self->_remoteAssistantContainerView addSubview:self->_remoteAssistantView];
    }
    if (v17)
    {
      [v14 setSecondaryView:self->_remoteAssistantContainerView];
    }
    else
    {
      long long v25 = [(UIView *)self->_remoteAssistantContainerView superview];

      if (v25 != v14) {
        [v14 insertSubview:self->_remoteAssistantContainerView atIndex:0];
      }
    }
    [(UIView *)self->_remoteAssistantView frame];
    if (v6 != v27 || v18 != v26)
    {
      -[UIView setFrame:](self->_remoteAssistantContainerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v6, v18);
      [(UIView *)self->_remoteAssistantView frame];
      -[UIView setFrame:](self->_remoteAssistantView, "setFrame:");
      char v28 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      BOOL v29 = [v28 containerRootController];
      [v29 updateViewSizingConstraints];
    }
  }
  else
  {
    [(UIView *)self->_remoteAssistantView removeFromSuperview];
    char v14 = self->_remoteAssistantView;
    self->_remoteAssistantView = 0;
  }

  if (self->_remoteAssistantView)
  {
    [(UISystemInputAssistantViewController *)self updateRemoteAssistantViewHidden];
    uint64_t v30 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    [(UISystemInputAssistantViewController *)self automaticallySetCenterViewControllerBasedOnInputDelegate:v30];
  }
}

- (void)updateRemoteAssistantViewHidden
{
  unint64_t v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  int64_t assistantBarStyle = self->_assistantBarStyle;
  uint64_t v5 = assistantBarStyle > 1 || v3 == 1;
  if (v3 == 1 && assistantBarStyle <= 1)
  {
    double v6 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    uint64_t v5 = [v6 showsButtonBarItemsInline] ^ 1;
  }
  remoteAssistantView = self->_remoteAssistantView;
  [(UIView *)remoteAssistantView setHidden:v5];
}

- (void)applyRemoteAssistantItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UISystemInputAssistantViewController *)self UIAssistantItemForRTIAssistantItem:v4];
  [(UISystemInputAssistantViewController *)self setRemoteAssistantItem:v5];

  -[UISystemInputAssistantViewController setShowsRemoteInputDashViewController:](self, "setShowsRemoteInputDashViewController:", [v4 showsInputDashboardViewController]);
  [v4 centerViewPreferredWidth];
  float v7 = v6;

  [(UISystemInputAssistantViewController *)self setRemoteCenterViewPreferredWidth:v7];
}

- (id)placeholderItemOfWidth:(double)a3
{
  id v4 = [UIBarButtonItem alloc];
  uint64_t v5 = objc_alloc_init(UIView);
  float v6 = [(UIBarButtonItem *)v4 initWithCustomView:v5];

  [(UIBarButtonItem *)v6 setWidth:a3];
  return v6;
}

- (id)UIGroupsForRTIGroups:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v9 = objc_alloc_init(UIBarButtonItemGroup);
        [v8 representativeItemWidth];
        if (v10 > 0.0)
        {
          [v8 representativeItemWidth];
          double v12 = [(UISystemInputAssistantViewController *)self placeholderItemOfWidth:v11];
          [(UIBarButtonItemGroup *)v9 setRepresentativeItem:v12];
        }
        id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
        char v14 = [v8 itemWidths];
        char v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v16 = [v8 itemWidths];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v27 + 1) + 8 * j) floatValue];
              long long v22 = [(UISystemInputAssistantViewController *)self placeholderItemOfWidth:v21];
              [v15 addObject:v22];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v18);
        }

        [(UIBarButtonItemGroup *)v9 setBarButtonItems:v15];
        [v26 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }

  return v26;
}

- (id)UIAssistantItemForRTIAssistantItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = objc_alloc_init(UITextInputAssistantItem);
    -[UITextInputAssistantItem _setShowsBarButtonItemsInline:](v5, "_setShowsBarButtonItemsInline:", [v4 showsBarButtonItemsInline]);
    uint64_t v6 = [v4 detachedTintColor];
    [(UITextInputAssistantItem *)v5 _setDetachedTintColor:v6];

    float v7 = [v4 detachedBackgroundColor];
    [(UITextInputAssistantItem *)v5 _setDetachedBackgroundColor:v7];

    -[UITextInputAssistantItem _setVisibleWhenMinimized:](v5, "_setVisibleWhenMinimized:", [v4 visibleWhenMinimized]);
    double v8 = [v4 leadingBarButtonGroups];
    double v9 = [(UISystemInputAssistantViewController *)self UIGroupsForRTIGroups:v8];
    [(UITextInputAssistantItem *)v5 setLeadingBarButtonGroups:v9];

    float v10 = [v4 trailingBarButtonGroups];

    float v11 = [(UISystemInputAssistantViewController *)self UIGroupsForRTIGroups:v10];
    [(UITextInputAssistantItem *)v5 setTrailingBarButtonGroups:v11];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)supportsCompactStyle
{
  unint64_t v3 = [(UISystemInputAssistantViewController *)self centerViewController];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 allowsCompactAssistantBar];
  }
  else {
    char v4 = 1;
  }
  uint64_t v5 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
  uint64_t v6 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v5];

  if (v6 && ([v6 _writingToolsWantsKeyboardSuppression] & 1) != 0) {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)shouldShowSystemInputAssistantItems
{
  id v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (id)_defaultTintColor
{
  id v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  BOOL v3 = [v2 renderConfig];
  if ([v3 lightKeyboard]) {
    +[UIColor blackColor];
  }
  else {
  char v4 = +[UIColor whiteColor];
  }

  return v4;
}

- (void)_updateSystemInputAssistantViewStylingForInputAssistantItem:(id)a3
{
  id v21 = a3;
  char v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v5 = [v4 inputViews];

  uint64_t v6 = +[UIKeyboardImpl activeInstance];
  if ([v6 isMinimized] & 1) != 0 || (objc_msgSend(v5, "isCustomInputView"))
  {
    BOOL v7 = 1;
  }
  else
  {
    double v8 = [v5 inputView];
    BOOL v7 = v8 == 0;
  }
  double v9 = +[UIColor clearColor];
  float v10 = [(UISystemInputAssistantViewController *)self _defaultTintColor];
  if (v7)
  {
    float v11 = [v21 _detachedTintColor];

    if (v11)
    {
      uint64_t v12 = [v21 _detachedTintColor];

      float v10 = (void *)v12;
    }
    if (+[UIKeyboard usesInputSystemUI]) {
      goto LABEL_9;
    }
    id v13 = [v21 _detachedBackgroundEffect];

    BOOL v7 = v13 != 0;
    if (v13)
    {
      char v14 = [v21 _detachedBackgroundEffect];
      char v15 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      uint64_t v16 = [v15 backdropView];
      [v16 setEffect:v14];
    }
    else
    {
      uint64_t v17 = [v21 _detachedBackgroundColor];

      if (!v17)
      {
LABEL_9:
        BOOL v7 = 0;
LABEL_15:
        [(UISystemInputAssistantViewController *)self _dismissEmojiSearch];
        goto LABEL_16;
      }
      [v21 _detachedBackgroundColor];
      double v9 = v14 = v9;
    }

    goto LABEL_15;
  }
LABEL_16:
  uint64_t v18 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v18 setTintColor:v10];

  uint64_t v19 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v19 setBackgroundColor:v9];

  long long v20 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v20 setBackgroundVisible:v7];
}

- (BOOL)_allowedToShowBarButtonItemsInline:(id)a3
{
  char v4 = [(UIViewController *)self view];
  uint64_t v5 = [v4 traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (os_variant_has_internal_diagnostics())
  {
    if ([(UISystemInputAssistantViewController *)self hasCheckedPreferences])
    {
      char v7 = [(UISystemInputAssistantViewController *)self assistantOniPhonePreference];
    }
    else
    {
      char v15 = +[UIKeyboardPreferencesController sharedPreferencesController];
      uint64_t v16 = [v15 preferencesActions];
      char v7 = [v16 BOOLForPreferenceKey:@"KeyboardAssistantOniPhone"];
    }
  }
  else
  {
    char v7 = 0;
  }
  if (+[UIKeyboard isKeyboardProcess])
  {
    double v8 = +[UIKeyboardImpl activeInstance];
    double v9 = [v8 inputSystemSourceSession];
    float v10 = [v9 documentTraits];
    float v11 = [v10 bundleId];
  }
  else
  {
    float v11 = _UIMainBundleIdentifier();
  }
  char v12 = v6 == 0;
  if (v12) {
    char v13 = v7;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0) {
    char v12 = [&unk_1ED3EF9B0 containsObject:v11];
  }

  return v12;
}

- (BOOL)_shouldShowExpandableButtonBarItemsForResponder:(id)a3
{
  id v4 = a3;
  if (v4
    && [(UISystemInputAssistantViewController *)self _allowedToShowBarButtonItemsInline:v4])
  {
    if (+[UIKeyboard isInputSystemUI]) {
      [(UISystemInputAssistantViewController *)self remoteAssistantItem];
    }
    else {
    uint64_t v6 = _UIResponderFindInputAssistantItem(v4);
    }
    if ([v6 _showsBarButtonItemsInline])
    {
      char v7 = [v6 leadingBarButtonGroups];
      if ([v7 count])
      {
        BOOL v5 = 1;
      }
      else
      {
        double v8 = [v6 trailingBarButtonGroups];
        BOOL v5 = [v8 count] != 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_registerForAssistantViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__responderChangedNotification_ name:@"UITextInputResponderDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__responderCapabilitiesChangedNotification_ name:@"UITextInputResponderCapabilitiesChangedNotification" object:0];
  [v3 addObserver:self selector:sel__responderChangedNotification_ name:@"UIKeyboardLayoutDidChangedNotification" object:0];
  [v3 addObserver:self selector:sel__showCandidates name:@"UIKeyboardCandidatesAvailable" object:0];
  [v3 addObserver:self selector:sel__collapseBarItems name:@"UIKeyboardPredictionsAvailable" object:0];
  [v3 addObserver:self selector:sel__willChangeTextEffectsRotationNotification_ name:@"UITextEffectsWindowViewControllerWillRotateNotification" object:0];
  [v3 addObserver:self selector:sel__didChangeTextEffectsRotationNotification_ name:@"UITextEffectsWindowViewControllerDidRotateNotification" object:0];
  [v3 addObserver:self selector:sel__didChangePlacementOrInputSourceNotification_ name:@"UITextInputSourceDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__willChangePlacementNotification_ name:@"UIKeyboardWillChangeFrameNotification" object:0];
  [v3 addObserver:self selector:sel__didChangePlacementOrInputSourceNotification_ name:@"UIKeyboardDidChangeFrameNotification" object:0];
  [v3 addObserver:self selector:sel__expandBarItems name:@"UIKeyboardShouldExpandAssistantBarItems" object:0];
  [v3 addObserver:self selector:sel__applicationDidBecomeActiveNotification_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v3 addObserver:self selector:sel__candidatesChanged name:@"UIKeyboardCandidatesChanged" object:0];
  [v3 addObserver:self selector:sel__inputModeChanged_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__writingDirectionChanged_ name:0x1ED148420 object:0];
  [v3 addObserver:self selector:sel__textDidChange name:@"UITextFieldTextDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__textDidChange name:@"UITextViewTextDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__willShowKeyboardSwitcher name:0x1ED148400 object:0];
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    [v3 addObserver:self selector:sel__keyboardDictationAvailabilityDidChangeNotification_ name:@"UIKeyboardDictationAvailabilityDidChangeNotification" object:0];
  }
}

- (void)_updateCenterViewWidthAndRenderConfig
{
  [(UISystemInputAssistantViewController *)self _updateCenterViewWidthForInterfaceOrientation:+[UIKeyboardSceneDelegate interfaceOrientation]];
  id v5 = [(UIViewController *)self view];
  id v3 = [v5 _inheritedRenderConfig];
  id v4 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v4 setRenderConfig:v3];
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = +[UIPeripheralHost sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__UISystemInputAssistantViewController__applicationDidBecomeActiveNotification___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  id v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [v4 queueDelayedTask:v6 forKey:v5];
}

uint64_t __80__UISystemInputAssistantViewController__applicationDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCenterViewWidthAndRenderConfig];
}

- (void)_willChangeTextEffectsRotationNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"UITextEffectsWindow_toOrientation"];
  uint64_t v6 = [v5 integerValue];

  [(UISystemInputAssistantViewController *)self _updateCenterViewWidthForInterfaceOrientation:v6];
}

- (void)_didChangeTextEffectsRotationNotification:(id)a3
{
  id v3 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v3 setNeedsValidation];
}

- (void)_beginObservingInputAssistantItemForRelevantItemChanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1E8FDE2D0 != -1) {
    dispatch_once(&qword_1E8FDE2D0, &__block_literal_global_667);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)_MergedGlobals_16_0;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        float v11 = [(UISystemInputAssistantViewController *)self observedInputAssistantItem];

        if (v11)
        {
          char v12 = [(UISystemInputAssistantViewController *)self observedInputAssistantItem];
          [v12 removeObserver:self forKeyPath:v10];
        }
        if (v4) {
          [v4 addObserver:self forKeyPath:v10 options:3 context:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(UISystemInputAssistantViewController *)self setObservedInputAssistantItem:v4];
}

void __96__UISystemInputAssistantViewController__beginObservingInputAssistantItemForRelevantItemChanges___block_invoke()
{
  v0 = (void *)_MergedGlobals_16_0;
  _MergedGlobals_16_0 = (uint64_t)&unk_1ED3EF9C8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v39 = a3;
  id v8 = a5;
  if ([v39 isEqualToString:@"bounds"])
  {
    double v9 = [v8 objectForKey:*MEMORY[0x1E4F284C8]];
    [v9 CGRectValue];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    uint64_t v18 = [v8 objectForKey:*MEMORY[0x1E4F284E0]];
    [v18 CGRectValue];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v41.origin.double x = v11;
    v41.origin.double y = v13;
    v41.size.width = v15;
    v41.size.height = v17;
    v42.origin.double x = v20;
    v42.origin.double y = v22;
    v42.size.width = v24;
    v42.size.height = v26;
    if (!CGRectEqualToRect(v41, v42))
    {
      long long v27 = [(UIViewController *)self view];
      long long v28 = [v27 window];
      if (v28)
      {
        long long v29 = [(UIViewController *)self view];
        long long v30 = [v29 window];
        uint64_t v31 = [v30 _toWindowOrientation];
      }
      else
      {
        uint64_t v31 = [(id)objc_opt_class() keyboardOrientation];
      }

      [(UISystemInputAssistantViewController *)self _updateCenterViewWidthForInterfaceOrientation:v31];
    }
  }
  else
  {
    if ([v39 isEqualToString:@"centerBarButtonGroups"])
    {
      long long v32 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
      [(UISystemInputAssistantViewController *)self automaticallySetCenterViewControllerBasedOnInputDelegate:v32];
    }
    else
    {
      long long v33 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      [v33 setNeedsValidation];

      long long v32 = [v8 objectForKey:*MEMORY[0x1E4F284C8]];
      long long v34 = [v8 objectForKey:*MEMORY[0x1E4F284E0]];
      if ([v39 hasSuffix:@"BarButtonGroups"]
        && (v34 != v32 || ([v32 isEqual:v32] & 1) == 0))
      {
        char v35 = +[UIKeyboardImpl activeInstance];
        v36 = [v35 remoteTextInputPartner];
        [v36 documentTraitsChanged];

        uint64_t v37 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
        if (objc_opt_respondsToSelector())
        {
          BOOL v38 = [(UISystemInputAssistantViewController *)self observedInputAssistantItem];
          [v37 setInputAssistantItem:v38 force:1];
        }
      }
    }
  }
}

- (void)_willChangePlacementNotification:(id)a3
{
  id v4 = [(UISystemInputAssistantViewController *)self expandedItemsController];
  id v5 = [v4 presentingViewController];

  if (v5)
  {
    uint64_t v6 = [(UISystemInputAssistantViewController *)self expandedItemsController];
    uint64_t v7 = [v6 presentationController];
    id v8 = [v7 presentedView];
    [v8 setHidden:1];

    [(UIViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
  int64_t v9 = +[UIKeyboardSceneDelegate interfaceOrientation];
  [(UISystemInputAssistantViewController *)self _updateCenterViewWidthForInterfaceOrientation:v9];
}

- (void)_didChangePlacementOrInputSourceNotification:(id)a3
{
  id v11 = a3;
  id v4 = [(UISystemInputAssistantViewController *)self inputWindowController];
  char v5 = [v4 isTransitioning];

  if ((v5 & 1) == 0) {
    [(UISystemInputAssistantViewController *)self updateCenterViewVisibilityStateForInputDelegate:0];
  }
  uint64_t v6 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v6 setNeedsValidation];

  uint64_t v7 = [(UISystemInputAssistantViewController *)self observedInputAssistantItem];
  [(UISystemInputAssistantViewController *)self _updateSystemInputAssistantViewStylingForInputAssistantItem:v7];

  [(UISystemInputAssistantViewController *)self _updateLanguageIndicatorPointerInteractionAndImage];
  id v8 = +[UIKeyboardImpl activeInstance];
  if ([v8 _shouldMinimizeForHardwareKeyboard])
  {
    int64_t v9 = [v11 name];
    int v10 = [v9 isEqualToString:@"UITextInputSourceDidChangeNotification"];

    if (v10) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_686);
    }
  }
  else
  {
  }
}

void __85__UISystemInputAssistantViewController__didChangePlacementOrInputSourceNotification___block_invoke()
{
  +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 updateAssistantView];
}

- (void)_updateLanguageIndicatorPointerInteractionAndImage
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(UISystemInputAssistantViewController *)self inputWindowController];
  id v4 = [v3 placement];
  char v5 = UIAssistantViewPlacement(v4);

  CGFloat v22 = v5;
  int v6 = [v5 isMemberOfClass:objc_opt_class()];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  id v8 = [v7 systemInputAssistantItem];
  int64_t v9 = [v8 leadingBarButtonGroups];

  uint64_t v25 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    unsigned int v23 = v6 ^ 1;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v9);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v12 = [v11 barButtonItems];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              CGFloat v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if ([v17 tag] == 1735287116)
              {
                uint64_t v18 = [v17 view];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  CGFloat v20 = [v17 view];
                  [v20 setPointerInteractionEnabled:v23];

                  double v21 = +[UIAssistantBarButtonItemProvider languageIndicatorImage];
                  [v17 setImage:v21];

                  goto LABEL_17;
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v25 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
  }
}

- (void)_keyboardDictationAvailabilityDidChangeNotification:(id)a3
{
  id v4 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v4 setNeedsValidation];

  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v5 = [v6 responder];
  [(UISystemInputAssistantViewController *)self setInputAssistantButtonItemsForResponder:v5];
}

- (double)_buttonBarWidthForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  char v5 = +[UIKeyboardImpl keyboardScreen];
  id v6 = +[UIKBScreenTraits traitsWithScreen:v5 orientation:1];

  [v6 assistantViewWindowBounds];
  double v8 = v7;
  [v6 assistantViewWindowBounds];
  if (v8 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  unint64_t v11 = a4 - 3;
  if (v10 >= 1024.0)
  {
    BOOL v12 = v11 >= 2;
    double v13 = 283.0;
    double v14 = 352.0;
  }
  else
  {
    if (v10 >= 834.0)
    {
      double v15 = dbl_186B94DC0[v11 < 2];
      goto LABEL_12;
    }
    BOOL v12 = v11 >= 2;
    double v13 = 152.0;
    double v14 = 178.0;
  }
  if (v12) {
    double v15 = v13;
  }
  else {
    double v15 = v14;
  }
LABEL_12:

  return v15;
}

- (double)_centerViewWidthForTraitCollection:(id)a3
{
  id v4 = a3;
  -[UISystemInputAssistantViewController _centerViewWidthForTraitCollection:interfaceOrientation:](self, "_centerViewWidthForTraitCollection:interfaceOrientation:", v4, [(id)objc_opt_class() keyboardOrientation]);
  double v6 = v5;

  return v6;
}

- (double)_centerViewWidthForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  double v8 = [v7 inputAssistantItem];
  double v9 = [v8 _centerBarButtonGroups];

  double v10 = 0.0;
  if ([v9 count])
  {
    unint64_t v11 = [v9 firstObject];
    BOOL v12 = [v11 barButtonItems];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      double v14 = [v9 firstObject];
      double v15 = [v14 barButtonItems];
      double v16 = [v15 firstObject];

      [v16 width];
      if (v17 <= 0.0) {
        goto LABEL_50;
      }
      [v16 width];
      double v10 = v18;
    }
  }
  if ([(UISystemInputAssistantViewController *)self _hasCustomCenterViewControllerWidth])
  {
    double v19 = [(UISystemInputAssistantViewController *)self _customCenterViewController:0];
    [v19 preferredWidthForTraitCollection:v6];
    if (v20 == -1.0) {
      double v10 = 0.0;
    }
    else {
      double v10 = v20;
    }
  }
  [(UISystemInputAssistantViewController *)self remoteCenterViewPreferredWidth];
  if (v21 > 0.0)
  {
    [(UISystemInputAssistantViewController *)self remoteCenterViewPreferredWidth];
    double v10 = v22;
  }
  unsigned int v23 = +[UIKeyboardImpl keyboardScreen];
  double v16 = +[UIKBScreenTraits traitsWithScreen:v23 orientation:a4];

  [(UISystemInputAssistantViewController *)self _buttonBarWidthForTraitCollection:v6 interfaceOrientation:a4];
  double v25 = v24;
  long long v26 = [(UISystemInputAssistantViewController *)self inputWindowController];
  long long v27 = [v26 placement];
  if ([v27 isFloatingAssistantView])
  {
  }
  else
  {
    long long v28 = +[UIKeyboardImpl activeInstance];
    char v29 = [v28 _showsScribbleIconsInAssistantView];

    if ((v29 & 1) == 0)
    {
      [v16 assistantViewWidth];
      double v31 = v30 - v25;
      if (v10 > v31) {
        double v10 = v31;
      }
    }
  }
  if (v10 == 0.0)
  {
    long long v32 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    long long v33 = [v32 containerRootController];
    long long v34 = [v33 placement];

    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      int v36 = [v34 isFloating];
    }
    else {
      int v36 = 1;
    }
    uint64_t v37 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    char v38 = [v37 showsExpandableButtonBarItems];

    if (![v34 isFloatingAssistantView]
      || (double v39 = 1.0, ([v34 isCompactAssistantView] & 1) == 0))
    {
      if ([v34 isFloatingAssistantView])
      {
        BOOL v40 = (unint64_t)(a4 - 3) < 2;
        CGRect v41 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
        if ([v41 wantsAssistantWhileSuppressingKeyboard])
        {
          CGRect v42 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
          char v43 = [v42 disableBecomeFirstResponder];
        }
        else
        {
          char v43 = 0;
        }
        double v39 = dbl_186B94DD0[v40];

        uint64_t v45 = [(UIViewController *)self view];
        v46 = [v45 window];
        BOOL v47 = [v46 windowScene];
        int v48 = [v47 _enhancedWindowingEnabled];

        if (v48 && (v43 & 1) == 0)
        {
          [v16 assistantViewWidth];
          double v50 = v49 - (v25 + v25);
          if (v39 < v50) {
            double v50 = v39;
          }
          double v39 = fmax(v50, 1.0);
        }
      }
      else if ((v36 | isKindOfClass))
      {
        if (v10 < 667.0
          || ((unint64_t)(a4 - 5) < 0xFFFFFFFFFFFFFFFELL ? (char v44 = 1) : (char v44 = v38), (v44 & 1) != 0))
        {
          double v39 = v10;
        }
        else
        {
          v59 = +[UIKeyboardImpl activeInstance];
          char v60 = [v59 _layout];
          v61 = [v60 currentKeyplane];
          [v61 keyUnionFrame];
          double v63 = v62;

          if (v63 <= 0.0) {
            double v39 = v10;
          }
          else {
            double v39 = v63;
          }
        }
      }
      else
      {
        v51 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
        v52 = [v51 emojiSearchView];
        v53 = [v52 searchTextField];
        char v54 = [v53 isActive];

        v55 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
        double v56 = [v55 emojiSearchView];
        char v57 = [v56 window];

        if ((v54 & 1) != 0
          || +[UIKeyboard isRemoteEmojiCollectionViewEnabled]&& v57)
        {
          [v16 keyboardWidth];
          double v39 = v58;
        }
        else if (v10 <= 0.0)
        {
          [v16 keyboardWidth];
          double v39 = v64 - (v25 + v25);
        }
        else
        {
          double v39 = v25 + v25 + v10;
        }
      }
    }

    double v10 = v39;
  }
LABEL_50:

  return v10;
}

- (void)_updateCenterViewWidthForInterfaceOrientation:(int64_t)a3
{
  double v5 = [(UISystemInputAssistantViewController *)self inputWindowController];
  id v6 = [v5 placement];
  UIAssistantViewPlacement(v6);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  double v7 = (void *)[v24 isHiddenForFloatingTransition];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    int v8 = [v24 isFloating];
  }
  else {
    int v8 = 1;
  }
  BOOL v9 = [(UISystemInputAssistantViewController *)self _isEmojiInputMode];
  double v10 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
  unint64_t v11 = [v10 emojiSearchView];
  BOOL v12 = [v11 searchTextField];
  int v13 = v9 | [v12 isActive];

  if (v13 == 1)
  {
    double v14 = v24;
    if ((v8 & 1) == 0)
    {
      if ([v24 showsKeyboard])
      {
        double v14 = v24;
        if (!v7) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      if (([v24 showsInputOrAssistantViews] & 1) != 0
        || (v15 = [v24 accessoryViewWillAppear], double v14 = v24, ((v15 | v7) & 1) != 0))
      {
LABEL_12:
        [(UISystemInputAssistantViewController *)self _dismissEmojiSearch];
        double v14 = v24;
        int v13 = 0;
      }
    }
  }
  else
  {
    double v14 = v24;
  }
LABEL_13:
  if (((v8 | v7) & 1) != 0 || v13)
  {
    if ([v14 isFloating])
    {
      double v7 = +[UIKeyboardImpl activeInstance];
      uint64_t v17 = [v7 _showsScribbleIconsInAssistantView];
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
      uint64_t v17 = 0;
    }
  }
  else
  {
    int v16 = 0;
    uint64_t v17 = 1;
  }
  double v18 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v18 setShowsButtonBarItemsInline:v17];

  if (v16) {
  double v19 = [(UIViewController *)self view];
  }
  double v20 = [v19 traitCollection];

  [(UISystemInputAssistantViewController *)self _centerViewWidthForTraitCollection:v20 interfaceOrientation:a3];
  double v22 = v21;
  unsigned int v23 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v23 setCenterViewWidth:v22];

  [(UISystemInputAssistantViewController *)self updateRemoteAssistantViewHidden];
}

- (void)_queueResponderChangedForNewResponder:(id)a3
{
  objc_storeWeak((id *)&self->_pendingResponderForChangedNotification, a3);
  if (!self->_pendingResponderChangedTimer)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__UISystemInputAssistantViewController__queueResponderChangedForNewResponder___block_invoke;
    v6[3] = &unk_1E52EC0A8;
    v6[4] = self;
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v6 block:0.0];
    pendingResponderChangedTimer = self->_pendingResponderChangedTimer;
    self->_pendingResponderChangedTimer = v4;
  }
}

void __78__UISystemInputAssistantViewController__queueResponderChangedForNewResponder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1016));
  int v3 = objc_msgSend(WeakRetained, "__isKindOfUIView");

  if (v3) {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1016));
  }
  else {
    id v4 = 0;
  }
  id v14 = v4;
  double v5 = [v4 keyboardSceneDelegate];
  id v6 = [v5 systemInputAssistantViewController];
  double v7 = *(void **)(a1 + 32);

  int v8 = v14;
  if (v6 == v7)
  {
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1016));

    if (v9)
    {
      double v10 = *(id **)(a1 + 32);
      id v11 = objc_loadWeakRetained(v10 + 127);
      [v10 automaticallySetCenterViewControllerBasedOnInputDelegate:v11];
    }
    [*(id *)(a1 + 32) _responderCapabilitiesChangedNotification:0];
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void **)(v12 + 1024);
    *(void *)(v12 + 1024) = 0;

    objc_storeWeak((id *)(*(void *)(a1 + 32) + 1016), 0);
    int v8 = v14;
  }
}

- (void)_responderChangedNotification:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 valueForKey:@"UITextInputResponderCapabilitiesChangedInputResponderKey"];
  if (!v4)
  {
    id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
  }
  [(UISystemInputAssistantViewController *)self _queueResponderChangedForNewResponder:v4];
}

- (void)_responderCapabilitiesChangedNotification:(id)a3
{
  id v26 = a3;
  id v4 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  [v4 setNeedsValidation];

  id v5 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  if ([v5 showsExpandableButtonBarItems])
  {
    id v6 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    char v7 = [v6 centerViewHidden];

    if (v7) {
      goto LABEL_26;
    }
    BOOL v8 = +[UIKeyboard usesInputSystemUI];
    if (+[UIKeyboard isKeyboardProcess])
    {
      id v9 = +[UIKeyboardImpl activeInstance];
      double v10 = [v9 inputDelegateManager];
      id v11 = [v10 forwardingInputDelegate];
      BOOL v12 = v11 == 0;
    }
    else
    {
      BOOL v12 = 1;
    }
    int v13 = [v26 userInfo];
    id v5 = [v13 objectForKey:@"UITextInputResponderCapabilitiesChangedKeyboardOutputKey"];

    id v14 = [v26 userInfo];
    int v15 = [v14 objectForKey:@"UITextInputResponderCapabilitiesChangedSelectionDidChangeKey"];
    int v16 = [v15 BOOLValue];

    if (v5) {
      int v17 = 1;
    }
    else {
      int v17 = v16;
    }
    if ((v17 | v8) == 1)
    {
      if ((v16 | v8))
      {
        BOOL v18 = 0;
        goto LABEL_18;
      }
      if (![v5 deletionCount])
      {
        double v19 = [v5 insertionText];
        double v20 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        if (v19) {
          BOOL v18 = [v19 rangeOfCharacterFromSet:v20] != 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v18 = 0;
        }

LABEL_18:
        if ((v12 & ((v18 || v8) | v16)) == 1)
        {
          double v21 = +[UIKeyboardImpl activeInstance];
          if ([v21 shouldCollapseButtonBarForFeedbackUI])
          {
            uint64_t v22 = 0;
          }
          else
          {
            unsigned int v23 = +[UIKeyboardImpl activeInstance];
            id v24 = [v23 delegateAsResponder];
            uint64_t v22 = [v24 _shouldDisplayWritingToolsCandidateOptions] ^ 1;
          }
        }
        else
        {
          uint64_t v22 = 0;
        }
        double v25 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
        [v25 setButtonBarItemsExpanded:v22 animated:1];
      }
    }
    else
    {
      id v5 = 0;
    }
  }

LABEL_26:
}

- (id)_popoverViewControllerForBarButtonItemGroup:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 _expandStyle];
  if (v5 == 1)
  {
LABEL_14:
    id v14 = [(UISystemInputAssistantViewController *)self popoverSourceView];
    uint64_t v15 = [v14 _lightStyleRenderConfig];

    int v16 = [_UIButtonGroupViewController alloc];
    id v27 = v4;
    int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    BOOL v18 = [(_UIButtonGroupViewController *)v16 initWithBarButtonItemGroups:v17 overLightKeyboard:v15];

    int v13 = v18;
    double v19 = 0.2;
    if (v15) {
      double v19 = 1.0;
    }
    double v20 = +[UIColor colorWithWhite:v19 alpha:0.8];
    [(UIExpandedBarItemsTableViewController *)v13 setBackgroundColor:v20];

    double v21 = [(UISystemInputAssistantViewController *)self _defaultTintColor];
    [(UIExpandedBarItemsTableViewController *)v13 setTintColor:v21];
  }
  else
  {
    if (!v5)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = objc_msgSend(v4, "barButtonItems", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) title];
            uint64_t v12 = [v11 length];

            if (!v12)
            {

              goto LABEL_14;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
    int v13 = [[UIExpandedBarItemsTableViewController alloc] initWithBarButtonGroup:v4];
  }

  return v13;
}

- (void)systemInputAssistantView:(id)a3 wantsToShowCollapsedItemGroup:(id)a4 fromView:(id)a5
{
  id v7 = a4;
  [(UISystemInputAssistantViewController *)self setPopoverSourceView:a5];
  id v9 = [(UISystemInputAssistantViewController *)self _popoverViewControllerForBarButtonItemGroup:v7];

  [v9 setModalPresentationStyle:7];
  uint64_t v8 = [v9 presentationController];
  [v8 setDelegate:self];

  [(UIViewController *)self presentViewController:v9 animated:1 completion:0];
  [(UISystemInputAssistantViewController *)self setExpandedItemsController:v9];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v6 = a3;
  id v4 = [(UISystemInputAssistantViewController *)self popoverSourceView];
  [v6 setSourceView:v4];

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v5 = [(UISystemInputAssistantViewController *)self popoverSourceView];
    [v5 bounds];
    objc_msgSend(v6, "setSourceRect:");
  }
  [v6 setPermittedArrowDirections:2];
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  id v4 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
  int v3 = [v4 emojiSearchView];
  [v3 setCollapsed:0];
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  self->_postedSwitchFromEmojiNotification = 0;
  id v3 = a3;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  [v4 changePreferredEmojiSearchInputModeForInputDelegate:v3];
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v3 = +[UIKeyboardImpl sharedInstance];
  [v3 clearForwardingInputDelegateAndResign:0];
}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 updateAssistantView];

  if (!self->_postedSwitchFromEmojiNotification)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"UIKeyboardSwitchedAwayFromEmoji" object:0];

    self->_postedSwitchFromEmojiNotification = 1;
  }
}

- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIKeyboardImpl activeInstance];
  [v7 emojiSearchWillInsertEmoji:v6 forSearchQuery:v5];
}

- (void)autocorrectionController:(id)a3 didUpdateAutocorrectionList:(id)a4
{
  id v10 = a4;
  id v5 = [(UISystemInputAssistantViewController *)self centerViewController];
  id v6 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];

  if (v5 == v6)
  {
    id v7 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
      [v9 autocorrectionListDidBecomeAvailable:v10];
    }
  }
}

- (id)layoutFromAssistantBarStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 3)
  {
    uint64_t v4 = [(UISystemInputAssistantViewController *)self compactAssistantViewLayout];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    uint64_t v4 = [(UISystemInputAssistantViewController *)self floatAssistantViewLayout];
    goto LABEL_5;
  }
  id v5 = [(UISystemInputAssistantViewController *)self standardAssistantViewLayout];
  id v7 = +[UIKeyboardImpl activeInstance];
  if ([v7 showsCandidateBar]
    && +[UIKeyboardImpl isSplit])
  {
    char v8 = +[UIKeyboardImpl activeInstance];
    char v9 = [v8 centerFilled];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(UISystemInputAssistantViewController *)self splitAssistantViewLayout];

      id v5 = (void *)v10;
    }
  }
  else
  {
  }
LABEL_6:
  return v5;
}

- (id)styleFromAssistantBarStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 1) {
      [(UISystemInputAssistantViewController *)self floatStyle];
    }
    else {
    id v3 = [(UISystemInputAssistantViewController *)self standardStyle];
    }
  }
  else
  {
    id v3 = [(UISystemInputAssistantViewController *)self compactStyle];
  }
  return v3;
}

- (void)setOverrideSafeAreaInsets
{
  id v3 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0 && +[UIKeyboard usesInputSystemUI])
  {
    if (self->_assistantBarStyle)
    {
      id v5 = [(UISystemInputAssistantViewController *)self inputWindowController];
      id v6 = [v5 _window];
      [v6 safeAreaInsets];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      double v15 = v12 - *(double *)&UIFloatingAssistantBottomMargin;
    }
    else
    {
      int v16 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
      double v8 = 0.0;
      objc_msgSend(v16, "setSafeAreaInsets:", 0.0, 0.0, 0.0, 0.0);

      double v10 = 0.0;
      double v15 = 0.0;
      double v14 = 0.0;
    }
    id v17 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
    objc_msgSend(v17, "setOverrideSafeAreaInsets:", v8, v10, v15, v14);
  }
}

- (void)updateAssistantBarStyle:(int64_t)a3
{
  BOOL v5 = (unint64_t)(a3 - 2) <= 2 && (unint64_t)(self->_assistantBarStyle - 2) < 3;
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate"));
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  if (self->_assistantBarStyle != a3
    || self->_isInputAssistantItemEmpty != [(UISystemInputAssistantViewController *)self isInputAssistantItemEmpty]|| self->_assistantBarStyle == 1&& ![(NSValue *)self->_currentInputDelegatePointerValue isEqualToValue:obj])
  {
    self->_isInputAssistantItemEmptdouble y = [(UISystemInputAssistantViewController *)self isInputAssistantItemEmpty];
    if (!v5)
    {
      if ([(id)objc_opt_class() shouldShowSystemInputAssistantItems])
      {
        id v6 = +[UIAssistantBarButtonItemProvider unmodifiableSystemAssistantItem:a3];
        double v7 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
        [v7 setSystemInputAssistantItem:v6];
      }
      [(UISystemInputAssistantViewController *)self _updateCenterViewWidthForInterfaceOrientation:+[UIKeyboardSceneDelegate interfaceOrientation]];
    }
    self->_int64_t assistantBarStyle = a3;
    [(UISystemInputAssistantViewController *)self setOverrideSafeAreaInsets];
    objc_storeStrong((id *)&self->_currentInputDelegatePointerValue, obj);
    [(UISystemInputAssistantViewController *)self updateRemoteAssistantViewHidden];
  }
}

- (BOOL)shouldUseCustomBackground:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIKeyboard keyboardBundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.Playgrounds"];

  if (v6)
  {
    if (!v4)
    {
      id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    }
    double v7 = [(UISystemInputAssistantViewController *)self remoteAssistantItem];
    double v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      double v11 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v4];
      _UIResponderFindInputAssistantItem(v11);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v10 = UIShouldUseCustomBackground(v9);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_usesCustomBackground
{
  id v2 = [(UISystemInputAssistantViewController *)self systemInputAssistantView];
  id v3 = [v2 inputAssistantItem];

  LOBYTE(v2) = UIShouldUseCustomBackground(v3);
  return (char)v2;
}

- (id)_customCenterBarButtonItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
  }
  if ([(UISystemInputAssistantViewController *)self _canShowCenterBarButtonItem])
  {
    BOOL v5 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v4];
    int v6 = _UIResponderFindInputAssistantItem(v5);

    double v7 = [v6 _centerBarButtonGroups];
    double v8 = (void *)[v7 count];

    if (v8)
    {
      id v9 = +[UIKeyboardImpl activeInstance];
      if ([v9 showsCandidateBar]
        && ([v9 candidateController],
            BOOL v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 hasCandidates],
            v10,
            (v11 & 1) != 0))
      {
        double v8 = 0;
      }
      else
      {
        double v12 = [v6 _centerBarButtonGroups];
        double v13 = [v12 firstObject];
        double v14 = [v13 barButtonItems];
        double v8 = [v14 firstObject];
      }
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)_customCenterViewController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
  }
  BOOL v5 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v4];
  int v6 = v5;
  if (v5)
  {
    double v7 = [v5 inputDashboardViewController];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)_hasCustomCenterViewControllerWidth
{
  id v2 = [(UISystemInputAssistantViewController *)self _customCenterViewController:0];
  if (v2) {
    char v3 = objc_opt_respondsToSelector();
  }
  else {
    char v3 = 0;
  }

  return v3 & 1;
}

- (BOOL)isVisibleWhenMinimized
{
  if (+[UIKeyboard isInputSystemUI])
  {
    char v3 = [(UISystemInputAssistantViewController *)self remoteAssistantItem];
  }
  else
  {
    id v4 = [(UISystemInputAssistantViewController *)self _currentInputDelegate];
    BOOL v5 = [(UISystemInputAssistantViewController *)self _inputDelegateAsResponder:v4];
    char v3 = _UIResponderFindInputAssistantItem(v5);
  }
  char v6 = [v3 _isVisibleWhenMinimized];

  return v6;
}

- (UIPredictiveViewController)predictiveViewController
{
  return self->_predictiveViewController;
}

- (id)predictionViewController
{
  char v3 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    char v6 = [(UISystemInputAssistantViewController *)self predictiveViewController];
    goto LABEL_6;
  }
  id v4 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  char v6 = 0;
LABEL_6:
  return v6;
}

- (id)candidateViewController
{
  char v3 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (id)compatibilityViewController
{
  char v3 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(UISystemInputAssistantViewController *)self predictiveViewController];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (id)inputWindowController
{
  if (+[UIKeyboard inputUIOOP])
  {
    char v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v4 = [v3 containerRootController];
  }
  else
  {
    BOOL v5 = [(UIViewController *)self view];
    id v4 = [v5 _rootInputWindowController];

    if (v4) {
      goto LABEL_6;
    }
    char v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    char v6 = [v3 keyboardWindow];
    id v4 = [v6 rootViewController];
  }
LABEL_6:
  return v4;
}

- (UIPredictiveViewController)centerViewController
{
  return self->_centerViewController;
}

- (int64_t)assistantBarStyle
{
  return self->_assistantBarStyle;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  self->_int64_t assistantBarStyle = a3;
}

- (UIView)popoverSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverSourceView);
  return (UIView *)WeakRetained;
}

- (void)setPopoverSourceView:(id)a3
{
}

- (UITextInputAssistantItem)observedInputAssistantItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedInputAssistantItem);
  return (UITextInputAssistantItem *)WeakRetained;
}

- (void)setObservedInputAssistantItem:(id)a3
{
}

- (NSMutableDictionary)cachedPredictiveViewControllers
{
  return self->_cachedPredictiveViewControllers;
}

- (void)setCachedPredictiveViewControllers:(id)a3
{
}

- (void)setStandardAssistantViewLayout:(id)a3
{
}

- (void)setSplitAssistantViewLayout:(id)a3
{
}

- (void)setFloatAssistantViewLayout:(id)a3
{
}

- (void)setCompactAssistantViewLayout:(id)a3
{
}

- (void)setStandardStyle:(id)a3
{
}

- (void)setFloatStyle:(id)a3
{
}

- (void)setCompactStyle:(id)a3
{
}

- (UITextInputAssistantItem)remoteAssistantItem
{
  return self->_remoteAssistantItem;
}

- (void)setRemoteAssistantItem:(id)a3
{
}

- (BOOL)showsRemoteInputDashViewController
{
  return self->_showsRemoteInputDashViewController;
}

- (void)setShowsRemoteInputDashViewController:(BOOL)a3
{
  self->_showsRemoteInputDashViewController = a3;
}

- (double)remoteCenterViewPreferredWidth
{
  return self->_remoteCenterViewPreferredWidth;
}

- (void)setRemoteCenterViewPreferredWidth:(double)a3
{
  self->_remoteCenterViewPreferredWidth = a3;
}

- (TUIEmojiSearchInputViewController)emojiSearchViewController
{
  return self->_emojiSearchViewController;
}

- (void)setEmojiSearchViewController:(id)a3
{
}

- (void)setPredictiveViewController:(id)a3
{
}

- (UIViewController)expandedItemsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandedItemsController);
  return (UIViewController *)WeakRetained;
}

- (void)setExpandedItemsController:(id)a3
{
}

- (BOOL)assistantEnabledPreference
{
  return self->_assistantEnabledPreference;
}

- (void)setAssistantEnabledPreference:(BOOL)a3
{
  self->_assistantEnabledPreference = a3;
}

- (BOOL)assistantOniPhonePreference
{
  return self->_assistantOniPhonePreference;
}

- (void)setAssistantOniPhonePreference:(BOOL)a3
{
  self->_assistantOniPhonePreference = a3;
}

- (BOOL)hasCheckedPreferences
{
  return self->_hasCheckedPreferences;
}

- (void)setHasCheckedPreferences:(BOOL)a3
{
  self->_hasCheckedPreferences = a3;
}

- (BOOL)currentlyCheckingPreferences
{
  return self->_currentlyCheckingPreferences;
}

- (void)setCurrentlyCheckingPreferences:(BOOL)a3
{
  self->_currentlyCheckingPreferences = a3;
}

- (NSValue)currentInputDelegatePointerValue
{
  return self->_currentInputDelegatePointerValue;
}

- (void)setCurrentInputDelegatePointerValue:(id)a3
{
}

- (_UILayerHostView)remoteAssistantView
{
  return self->_remoteAssistantView;
}

- (void)setRemoteAssistantView:(id)a3
{
}

- (UIView)remoteAssistantContainerView
{
  return self->_remoteAssistantContainerView;
}

- (void)setRemoteAssistantContainerView:(id)a3
{
}

- (UIRemoteInputViewInfo)remoteAssistantViewInfo
{
  return self->_remoteAssistantViewInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssistantViewInfo, 0);
  objc_storeStrong((id *)&self->_remoteAssistantContainerView, 0);
  objc_storeStrong((id *)&self->_remoteAssistantView, 0);
  objc_storeStrong((id *)&self->_currentInputDelegatePointerValue, 0);
  objc_destroyWeak((id *)&self->_expandedItemsController);
  objc_storeStrong((id *)&self->_predictiveViewController, 0);
  objc_storeStrong((id *)&self->_emojiSearchViewController, 0);
  objc_storeStrong((id *)&self->_remoteAssistantItem, 0);
  objc_storeStrong((id *)&self->_compactStyle, 0);
  objc_storeStrong((id *)&self->_floatStyle, 0);
  objc_storeStrong((id *)&self->_standardStyle, 0);
  objc_storeStrong((id *)&self->_compactAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_floatAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_splitAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_standardAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_cachedPredictiveViewControllers, 0);
  objc_destroyWeak((id *)&self->_observedInputAssistantItem);
  objc_destroyWeak((id *)&self->_popoverSourceView);
  objc_storeStrong((id *)&self->_centerViewController, 0);
  objc_storeStrong((id *)&self->_pendingResponderChangedTimer, 0);
  objc_destroyWeak((id *)&self->_pendingResponderForChangedNotification);
}

- (BOOL)isEmojiSearchResultsVisible
{
  char v3 = [(UISystemInputAssistantViewController *)self centerViewController];
  id v4 = [(UISystemInputAssistantViewController *)self emojiSearchViewController];
  if (v3 == v4)
  {
    char v6 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
    int v5 = [v6 predictionViewVisible] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)showEmojiSearch:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
    [v4 setCollapsed:0];

    id v7 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
    int v5 = [v7 searchTextField];
    [v5 becomeFirstResponder];
  }
  else
  {
    BOOL v6 = [(UISystemInputAssistantViewController *)self _shouldCollapseEmojiSearchView];
    id v7 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
    [v7 setCollapsed:v6];
  }
}

- (void)prepareForFloating:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UISystemInputAssistantViewController *)self centerViewController];
  emojiSearchViewController = self->_emojiSearchViewController;

  if (v5 == emojiSearchViewController) {
    [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController setUsesFloatingStyle:v3];
  }
  if (self->_remoteAssistantView)
  {
    [(UISystemInputAssistantViewController *)self updateRemoteAssistantViewHidden];
  }
}

- (id)_emojiSearchField
{
  id v2 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchViewController emojiSearchView];
  BOOL v3 = [v2 searchTextField];

  return v3;
}

@end