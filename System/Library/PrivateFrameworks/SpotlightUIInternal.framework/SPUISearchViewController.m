@interface SPUISearchViewController
+ (BOOL)shouldShowAsTypedSuggestion;
+ (id)spotlightUserDefaults;
+ (void)_updateHeaderView:(id)a3 fromText:(id)a4 fromToken:(id)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowInternet;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformCommand:(id)a3;
- (BOOL)checkClearTimer;
- (BOOL)clearQueryOnDismissal;
- (BOOL)currentQueryIdMatchesResultInGeneralModel;
- (BOOL)expandPlatterOnAppear;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasContentInSearchField;
- (BOOL)internetOverrideForPPT;
- (BOOL)isInStateRestoration;
- (BOOL)isQueryCommand:(id)a3;
- (BOOL)lastQueryWasAuthenticated;
- (BOOL)optOutOfGoButton;
- (BOOL)queryIdSameAsInvokeQueryIdentifier;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)sectionShouldBeExpanded:(id)a3;
- (BOOL)spotlightIsVisible;
- (NSData)restorationData;
- (NSMutableSet)allHeaderViews;
- (NSString)currentQuery;
- (NSString)lastSearchString;
- (NSString)queryOnDismissal;
- (NSTimer)windowExpansionTimer;
- (OS_dispatch_queue)factorsFetchingQueue;
- (SPUIProactiveResultsViewController)proactiveResultViewController;
- (SPUISearchFirstTimeViewController)firstTimeExperienceViewController;
- (SPUISearchHeader)searchHeader;
- (SPUISearchViewController)init;
- (SPUISearchViewControllerSizingDelegate)sizingDelegate;
- (SPUITestingHelper)testingHelper;
- (SUIAppIntentsQueryHelper)appIntentsQueryHelper;
- (UISearchToken)lastSearchToken;
- (UIView)topBlurView;
- (_UILegibilitySettings)legibilitySettings;
- (double)contentHeight;
- (double)distanceToTopOfAppIcons;
- (double)timeAtDismissal;
- (id)appIntentsDidLaunchCompletion;
- (id)createAdditionalHeaderView;
- (id)currentModel;
- (id)currentQueryContext;
- (id)firstResultIgnoringSuggestionsIfNeeded;
- (id)searchTextField;
- (id)searchViewRestorationContext;
- (unint64_t)currentQueryId;
- (unint64_t)feedbackBackgroundTaskIdentifier;
- (unint64_t)presentationMode;
- (void)activateFirstTimeExperienceViewAnimate:(BOOL)a3;
- (void)activateFirstTimeExperienceViewIfNecessary;
- (void)appIconDragged;
- (void)backButtonPressed;
- (void)cancelButtonPressed;
- (void)clearSearchResultsAndFetchZKW:(BOOL)a3;
- (void)clearTimerExpired;
- (void)createAdditionalHeaderView;
- (void)dealloc;
- (void)didBeginEditing;
- (void)didBeginScrollingResults;
- (void)didChangeExpansionStateForSection:(id)a3 expanded:(BOOL)a4;
- (void)didEngageResult:(id)a3;
- (void)didScrollPastBottomOfContent;
- (void)didUpdateActiveViewController;
- (void)didUpdateContentScrolledOffScreenStatus:(BOOL)a3 animated:(BOOL)a4;
- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4;
- (void)dragInitiated;
- (void)endBackgroundTaskIfNeeded;
- (void)escapeKeyCommand;
- (void)expandWindowIfNeeded;
- (void)firstTimeExperienceContinueButtonPressed;
- (void)highlightResultAfterUnmarkingText;
- (void)invalidateWindowExpansionTimer;
- (void)performCommand:(id)a3;
- (void)performReturnKeyPressAndExpandWidowIfNeeded;
- (void)performTestSearchWithQuery:(id)a3 event:(unint64_t)a4 queryKind:(unint64_t)a5;
- (void)performWebSearch;
- (void)presentSpotlightWithCompletionHandler:(id)a3;
- (void)purgeMemory;
- (void)queryContextDidChange:(id)a3 fromSearchHeader:(id)a4 allowZKW:(BOOL)a5;
- (void)refreshTrial;
- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)resultsViewController:(id)a3 didChangeContentSize:(CGSize)a4 animated:(BOOL)a5;
- (void)returnKeyPressed;
- (void)scheduleWindowExpansionWithInterval:(double)a3;
- (void)searchViewDidDismissWithReason:(unint64_t)a3;
- (void)searchViewDidPresentFromSource:(unint64_t)a3;
- (void)searchViewDidUpdatePresentationProgress:(double)a3;
- (void)searchViewWillDismissWithReason:(unint64_t)a3;
- (void)searchViewWillPresentFromSource:(unint64_t)a3;
- (void)sendPresentationFeedback;
- (void)setAdditionalKeyboardHeight:(double)a3;
- (void)setAllHeaderViews:(id)a3;
- (void)setAppIntentsDidLaunchCompletion:(id)a3;
- (void)setAppIntentsQueryHelper:(id)a3;
- (void)setClearQueryOnDismissal:(BOOL)a3;
- (void)setExpandPlatterOnAppear:(BOOL)a3;
- (void)setExpansionValueForZKW:(BOOL)a3;
- (void)setFactorsFetchingQueue:(id)a3;
- (void)setFeedbackBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setFirstTimeExperienceViewController:(id)a3;
- (void)setFooterViewsForProactive:(id)a3 forResults:(id)a4;
- (void)setInternetOverrideForPPT:(BOOL)a3;
- (void)setIsInStateRestoration:(BOOL)a3;
- (void)setLastQueryWasAuthenticated:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setProactiveResultViewController:(id)a3;
- (void)setQueryOnDismissal:(id)a3;
- (void)setRestorationData:(id)a3;
- (void)setSearchHeader:(id)a3;
- (void)setSizingDelegate:(id)a3;
- (void)setTestingHelper:(id)a3;
- (void)setTimeAtDismissal:(double)a3;
- (void)setTopBlurView:(id)a3;
- (void)setWindowExpansionTimer:(id)a3;
- (void)showVerticalScrollIndicators:(BOOL)a3;
- (void)spotlightDidBackground;
- (void)spotlight_leftArrowPressed;
- (void)spotlight_rightArrowPressed;
- (void)updateHeaderViewsWithBlock:(id)a3;
- (void)updatePlatterMode;
- (void)updateResponderChainIfNeeded;
- (void)viewWillAppear:(BOOL)a3;
- (void)willUpdateActiveViewController;
- (void)willUpdateFromResultsWithHighlightedResult:(id)a3 viewController:(id)a4;
@end

@implementation SPUISearchViewController

- (BOOL)sectionShouldBeExpanded:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:*MEMORY[0x263F67530]])
  {
    v5 = [v3 results];
    v6 = [v5 firstObject];
    int v7 = [v6 renderHorizontallyWithOtherResultsInCategory];

    if (!v7)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    v4 = [(id)objc_opt_class() spotlightUserDefaults];
    char v8 = [v4 BOOLForKey:@"SpotlightZKWExpanded"];
  }
  else
  {
    char v8 = 0;
  }

LABEL_7:
  return v8;
}

- (BOOL)isInStateRestoration
{
  v2 = [(id)objc_opt_class() spotlightUserDefaults];
  char v3 = [v2 BOOLForKey:@"RestorationCurrentState"];

  return v3;
}

+ (id)spotlightUserDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
  return v2;
}

- (BOOL)hasContentInSearchField
{
  char v3 = [(SPUISearchViewController *)self currentQuery];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SPUISearchViewController *)self searchHeader];
    v6 = [v5 searchEntity];
    BOOL v4 = v6 != 0;
  }
  return v4;
}

- (NSString)currentQuery
{
  v2 = [(SPUISearchViewController *)self searchHeader];
  char v3 = [v2 currentQuery];

  return (NSString *)v3;
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SPUISearchViewController *)self searchHeader];
  char v8 = [(SPUIViewController *)self searchResultViewController];
  objc_msgSend(v9, "updateFocusResult:cardSection:focusIsOnFirstResult:", v7, v6, objc_msgSend(v8, "isHighlighting"));
}

- (void)willUpdateFromResultsWithHighlightedResult:(id)a3 viewController:(id)a4
{
  id v31 = a4;
  id v6 = a3;
  if ([(SPUISearchViewController *)self hasContentInSearchField]
    && ([(SPUIViewController *)self searchResultViewController],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v31))
  {
    v13 = [(SPUIViewController *)self searchResultViewController];
    v14 = [v13 view];
    [v14 frame];
    BOOL v15 = CGRectEqualToRect(v33, *MEMORY[0x263F001A8]);

    if (v15)
    {
      v16 = [(SPUISearchViewController *)self view];
      [v16 frame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      v23 = [(SPUISearchViewController *)self view];
      v24 = objc_msgSend(v23, "tlks_screen");
      [v24 bounds];
      double Height = CGRectGetHeight(v34);

      v26 = [(SPUIViewController *)self searchResultViewController];
      v27 = [v26 view];
      objc_msgSend(v27, "setFrame:", v18, v20, v22, Height);

      v28 = [(SPUIViewController *)self searchResultViewController];
      v29 = [v28 view];
      [v29 layoutBelowIfNeeded];
    }
    if ([MEMORY[0x263F79140] enableFloatingWindow]
      && [MEMORY[0x263F828A0] isInHardwareKeyboardMode])
    {
      [(SPUISearchViewController *)self invalidateWindowExpansionTimer];
      if ([(SPUISearchViewController *)self currentQueryIdMatchesResultInGeneralModel])
      {
        [(SPUISearchViewController *)self scheduleWindowExpansionWithInterval:0.5];
      }
    }
    else
    {
      v30 = [(SPUIViewController *)self searchResultViewController];
      [(SPUIViewController *)self activateViewController:v30 animate:0];
    }
  }
  else
  {
    char v8 = [(SPUISearchViewController *)self windowExpansionTimer];
    [v8 invalidate];

    [(SPUISearchViewController *)self setWindowExpansionTimer:0];
  }
  id v9 = [MEMORY[0x263F67C78] cardForRenderingResult:v6];
  v10 = [(SPUISearchViewController *)self searchHeader];
  v11 = [v9 cardSections];
  v12 = [v11 firstObject];
  [v10 updateFocusResult:v6 cardSection:v12 focusIsOnFirstResult:1];
}

- (NSTimer)windowExpansionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setWindowExpansionTimer:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUISearchViewController;
  [(SPUISearchViewController *)&v4 viewWillAppear:a3];
  [(SPUISearchViewController *)self updatePlatterMode];
}

- (void)didUpdateActiveViewController
{
  v9.receiver = self;
  v9.super_class = (Class)SPUISearchViewController;
  [(SPUIViewController *)&v9 didUpdateActiveViewController];
  [(SPUISearchViewController *)self updateResponderChainIfNeeded];
  char v3 = (void *)MEMORY[0x263F82758];
  objc_super v4 = [(SPUISearchViewController *)self searchHeader];
  v5 = [v4 searchField];
  id v6 = [v3 focusSystemForEnvironment:v5];
  id v7 = [(SPUISearchViewController *)self searchHeader];
  char v8 = [v7 searchField];
  [v6 requestFocusUpdateToEnvironment:v8];
}

- (void)didUpdateContentScrolledOffScreenStatus:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(SPUISearchViewController *)self navigationController];
  id v9 = [v7 navigationBar];

  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    char v8 = [(SPUISearchViewController *)self navigationController];
    objc_msgSend(v9, "showSeparator:animated:", objc_msgSend(v8, "navigationMode") != 0, 0);
  }
  else
  {
    [v9 showSeparator:v5 animated:v4];
  }
}

- (void)resultsViewController:(id)a3 didChangeContentSize:(CGSize)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [(SPUIViewController *)self activeViewController];

  if (v8 == v7)
  {
    id v10 = [(SPUISearchViewController *)self sizingDelegate];
    if (v5)
    {
      [v10 didInvalidateSizeAnimated:1];
    }
    else
    {
      id v9 = [(SPUISearchViewController *)self navigationController];
      objc_msgSend(v10, "didInvalidateSizeAnimated:", objc_msgSend(v9, "navigationMode") == 5);
    }
  }
}

- (SPUISearchViewControllerSizingDelegate)sizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizingDelegate);
  return (SPUISearchViewControllerSizingDelegate *)WeakRetained;
}

- (id)createAdditionalHeaderView
{
  char v3 = objc_opt_new();
  [v3 setDelegate:self];
  BOOL v4 = [(SPUISearchViewController *)self searchHeader];
  BOOL v5 = [v4 legibilitySettings];
  [v3 setLegibilitySettings:v5];

  id v6 = [(SPUISearchViewController *)self allHeaderViews];
  [v6 addObject:v3];

  id v7 = [(SPUISearchViewController *)self searchHeader];
  id v8 = [v7 searchField];
  uint64_t v9 = [v8 text];

  id v10 = [(SPUISearchViewController *)self searchHeader];
  v11 = [v10 searchField];
  v12 = [v11 tokens];
  unint64_t v13 = [v12 count];

  if (v13 >= 2)
  {
    uint64_t v14 = MEMORY[0x263F79148];
    BOOL v15 = *(NSObject **)(MEMORY[0x263F79148] + 8);
    if (!v15)
    {
      SPUIInitLogging();
      BOOL v15 = *(NSObject **)(v14 + 8);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SPUISearchViewController createAdditionalHeaderView]();
    }
  }
  v16 = [(SPUISearchViewController *)self searchHeader];
  double v17 = [v16 searchField];
  double v18 = [v17 tokens];
  uint64_t v19 = [v18 firstObject];

  if (v9 | v19) {
    [(id)objc_opt_class() _updateHeaderView:v3 fromText:v9 fromToken:v19];
  }

  return v3;
}

- (void)searchViewWillPresentFromSource:(unint64_t)a3
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v5 = MEMORY[0x263F79148];
  id v6 = *(void **)(MEMORY[0x263F79148] + 32);
  if (!v6)
  {
    SPUIInitLogging();
    id v6 = *(void **)(v5 + 32);
  }
  id v7 = v6;
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "bringUp", (const char *)&unk_23D315BC7, buf, 2u);
  }

  id v8 = *(void **)(v5 + 40);
  if (!v8)
  {
    SPUIInitLogging();
    id v8 = *(void **)(v5 + 40);
  }
  uint64_t v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D2E6000, v9, OS_LOG_TYPE_DEFAULT, "bringUp start", buf, 2u);
  }

  id v10 = [(SPUISearchViewController *)self appIntentsDidLaunchCompletion];

  if (v10)
  {
    v11 = [(SPUISearchViewController *)self appIntentsDidLaunchCompletion];
    v11[2]();

    [(SPUISearchViewController *)self setAppIntentsDidLaunchCompletion:0];
  }
  uint64_t v12 = [(SPUISearchViewController *)self searchHeader];
  unint64_t v13 = [(id)v12 searchField];
  [v13 setSelectionGrabbersHiddenSafe:a3 != 5];

  LOBYTE(v12) = [(SPUISearchViewController *)self isInStateRestoration];
  [(SPUISearchViewController *)self setIsInStateRestoration:1];
  if ((v12 & 1) == 0)
  {
    uint64_t v14 = (void *)MEMORY[0x263F67C78];
    unint64_t v13 = [(SPUISearchViewController *)self view];
    LODWORD(v14) = [v14 deviceIsAuthenticatedForView:v13];

    if (v14)
    {
      BOOL v15 = [(SPUISearchViewController *)self restorationData];
      id v113 = 0;
      unint64_t v13 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:&v113];
      id v16 = v113;
      if (v16 && [v15 length])
      {
        double v17 = *(void **)(v5 + 40);
        if (!v17)
        {
          SPUIInitLogging();
          double v17 = *(void **)(v5 + 40);
        }
        double v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SPUISearchViewController searchViewWillPresentFromSource:]((uint64_t)v16, v18);
        }
      }
      [(SPUISearchViewController *)self timeAtDismissal];
      if (v19 == 0.0) {
        [v13 timeAtDismissal];
      }
      -[SPUISearchViewController setTimeAtDismissal:](self, "setTimeAtDismissal:");
      BOOL v20 = [(SPUISearchViewController *)self checkClearTimer];
      if (v16 || v20)
      {
LABEL_51:

        goto LABEL_52;
      }
      v101 = v15;
      double v21 = [v13 searchViewContext];
      double v22 = [v21 searchString];
      unint64_t v102 = a3;
      if ([v22 length])
      {
      }
      else
      {
        v23 = [v13 searchViewContext];
        v24 = [v23 searchEntity];

        if (!v24)
        {
          v43 = [v13 viewControllerContexts];
          uint64_t v44 = [v43 count];

          if (!v44)
          {
LABEL_34:
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            v48 = [v13 viewControllerContexts];
            uint64_t v49 = [v48 countByEnumeratingWithState:&v109 objects:v115 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v110;
              do
              {
                for (uint64_t i = 0; i != v50; ++i)
                {
                  if (*(void *)v110 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  v53 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v54 = v53;
                    v55 = [SPUIResultsViewController alloc];
                    v56 = [v54 searchEntity];
                    v57 = [(SPUIResultsViewController *)v55 initWithSearchModel:0 searchEntity:v56];

                    [(SPUIResultsViewController *)v57 setRestorationContext:v54];
                    v58 = [(SPUISearchViewController *)self searchHeader];
                    v59 = [v58 searchField];
                    [(SearchUIResultsViewController *)v57 setSearchField:v59];

                    v60 = (void *)MEMORY[0x263F82E00];
                    v107[0] = MEMORY[0x263EF8330];
                    v107[1] = 3221225472;
                    v107[2] = __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke;
                    v107[3] = &unk_264E90910;
                    v107[4] = self;
                    v108 = v57;
                    v61 = v57;
                    [v60 performWithoutAnimation:v107];
                    [(SearchUIResultsViewController *)v61 setFeedbackListener:self];
                    [(SearchUIResultsViewController *)v61 setCommandDelegate:self];
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      continue;
                    }
                    v62 = (void *)[objc_alloc(MEMORY[0x263F67C28]) initWithCard:0 feedbackListener:self];
                    [v62 setCommandDelegate:self];
                    if ([MEMORY[0x263F79140] enableFloatingWindow])
                    {
                      [v62 setTextField:0];
                    }
                    else
                    {
                      v63 = [(SPUISearchViewController *)self searchHeader];
                      v64 = [v63 searchField];
                      [v62 setTextField:v64];
                    }
                    v65 = [(SPUISearchViewController *)self proactiveResultViewController];
                    objc_msgSend(v62, "setShouldUseInsetRoundedSections:", objc_msgSend(v65, "shouldUseInsetRoundedSections"));

                    [v62 setRestorationContext:v53];
                    v66 = (void *)MEMORY[0x263F82E00];
                    v105[0] = MEMORY[0x263EF8330];
                    v105[1] = 3221225472;
                    v105[2] = __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_2;
                    v105[3] = &unk_264E90910;
                    v105[4] = self;
                    id v54 = v62;
                    id v106 = v54;
                    [v66 performWithoutAnimation:v105];
                  }
                }
                uint64_t v50 = [v48 countByEnumeratingWithState:&v109 objects:v115 count:16];
              }
              while (v50);
            }

            v67 = [(SPUISearchViewController *)self navigationController];
            v68 = [v67 view];
            [v68 layoutIfNeeded];

            v69 = [(SPUISearchViewController *)self searchHeader];
            v70 = [v69 searchField];
            [v70 detokenizeIfNeededAndSearch:0];

            int v71 = [v13 wantsGo];
            uint64_t v5 = MEMORY[0x263F79148];
            BOOL v15 = v101;
            a3 = v102;
            id v16 = 0;
            if (v71)
            {
              v72 = [(SPUISearchViewController *)self searchHeader];
              v73 = [v72 searchField];
              [v73 setReturnKeyType:1];

              +[SPUITextField updateBlueButton];
            }
            goto LABEL_51;
          }
          v41 = +[SPUISearchModel sharedFullZWKInstance];
          [v41 updateWithQueryContext:0];
          v42 = [v41 queryTask];
          v45 = [v42 query];
          uint64_t v46 = [v45 queryIdent];
          v47 = [(SPUISearchViewController *)self searchHeader];
          [v47 setQueryId:v46];

LABEL_33:
          goto LABEL_34;
        }
      }
      v25 = [(SPUIViewController *)self activeViewController];
      v26 = [(SPUIViewController *)self searchResultViewController];

      if (v25 != v26)
      {
        v27 = [(SPUIViewController *)self searchResultViewController];
        [(SPUIViewController *)self activateViewController:v27 animate:0];

        v28 = [v13 searchViewContext];
        v29 = [v28 searchString];
        v30 = [(SPUIViewController *)self searchResultViewController];
        [v30 setQueryString:v29];

        id v31 = [(SPUISearchViewController *)self searchHeader];
        v32 = [v13 searchViewContext];
        CGRect v33 = [v32 searchString];
        CGRect v34 = [v13 searchViewContext];
        v35 = [v34 searchEntity];
        [v31 restoreSearchText:v33 searchEntity:v35];

        v36 = [v13 searchViewContext];
        v37 = [v36 searchString];
        [(SPUISearchViewController *)self setQueryOnDismissal:v37];
      }
      v38 = [(SPUIViewController *)self searchResultViewController];
      v39 = [v38 sections];
      uint64_t v40 = [v39 count];

      if (v40) {
        goto LABEL_34;
      }
      v41 = [(SPUIViewController *)self searchResultViewController];
      v42 = [v13 searchViewContext];
      [v41 setRestorationContext:v42];
      goto LABEL_33;
    }
  }
LABEL_52:
  [(SPUISearchViewController *)self setIsInStateRestoration:0];
  v74 = +[SPUIFeedbackManager feedbackListener];
  [v74 updateParsecEnabled];

  [(SPUISearchViewController *)self setTimeAtDismissal:0.0];
  [(SPUISearchViewController *)self setClearQueryOnDismissal:0];
  [(SPUISearchViewController *)self showVerticalScrollIndicators:0];
  v75 = [(SPUISearchViewController *)self searchHeader];
  if (a3 <= 7 && ((1 << a3) & 0xE2) != 0)
  {
    uint64_t v76 = 1;
  }
  else
  {
    unint64_t v13 = [(SPUISearchViewController *)self searchHeader];
    uint64_t v76 = [v13 isFirstResponder];
  }
  [v75 showCancelButton:v76 animated:0];
  if (a3 > 7 || ((1 << a3) & 0xE2) == 0) {

  }
  [(SPUISearchViewController *)self setPresentationMode:a3];
  v77 = [(SPUISearchViewController *)self searchHeader];
  [v77 setHidden:0];

  [(SPUISearchViewController *)self updatePlatterMode];
  v78 = [(SPUISearchViewController *)self navigationController];
  [v78 updateFooterViewsIfNecessary];

  if (![(SPUISearchViewController *)self hasContentInSearchField])
  {
    v79 = *(void **)(v5 + 40);
    if (!v79)
    {
      SPUIInitLogging();
      v79 = *(void **)(v5 + 40);
    }
    v80 = v79;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D2E6000, v80, OS_LOG_TYPE_DEFAULT, "field is empty", buf, 2u);
    }

    v81 = [(SPUISearchViewController *)self proactiveResultViewController];
    v82 = [v81 sections];
    uint64_t v83 = [v82 count];

    if ([MEMORY[0x263F79140] enableFloatingWindow]
      && ([(SPUISearchViewController *)self navigationController],
          v84 = objc_claimAutoreleasedReturnValue(),
          uint64_t v85 = [v84 navigationMode],
          v84,
          !v85)
      || v83)
    {
      v86 = [(SPUISearchViewController *)self searchHeader];
      [v86 updateFocusResult:0 cardSection:0 focusIsOnFirstResult:1];
    }
    else
    {
      v87 = [(SPUISearchViewController *)self proactiveResultViewController];
      uint64_t v88 = [v87 refreshResultsWithContext:0 allowPartialUpdates:1];

      v86 = [(SPUISearchViewController *)self searchHeader];
      [v86 setQueryId:v88];
    }

    v89 = *(void **)(v5 + 40);
    if (!v89)
    {
      SPUIInitLogging();
      v89 = *(void **)(v5 + 40);
    }
    v90 = v89;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D2E6000, v90, OS_LOG_TYPE_DEFAULT, "activating zkw", buf, 2u);
    }

    v91 = [(SPUISearchViewController *)self proactiveResultViewController];
    [(SPUIViewController *)self activateViewController:v91 animate:0];

    if (+[SPUISearchFirstTimeViewController needsDisplay])
    {
      v92 = *(void **)(v5 + 40);
      if (!v92)
      {
        SPUIInitLogging();
        v92 = *(void **)(v5 + 40);
      }
      v93 = v92;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D2E6000, v93, OS_LOG_TYPE_DEFAULT, "trying to activate FTE", buf, 2u);
      }

      [(SPUISearchViewController *)self activateFirstTimeExperienceViewIfNecessary];
    }
  }
  if ([(SPUISearchViewController *)self expandPlatterOnAppear]) {
    [(SPUISearchViewController *)self expandWindowIfNeeded];
  }
  if ([(SPUISearchViewController *)self presentationMode] == 5)
  {
    v94 = [(SPUISearchViewController *)self navigationController];
    v95 = [v94 topViewController];

    if (v95 == self)
    {
      v96 = [(SPUIViewController *)self activeViewController];
      v98 = [(SPUIViewController *)self searchResultViewController];
      if (v96 == v98)
      {
        v97 = [(SPUIViewController *)self searchResultViewController];
      }
      else
      {
        v97 = 0;
      }
    }
    else
    {
      v96 = [(SPUISearchViewController *)self navigationController];
      v97 = [v96 topViewController];
    }

    if (objc_opt_respondsToSelector())
    {
      v99 = [v97 view];
      [v99 setAlpha:0.0];

      [v97 scrollAndSelectLastSelectedIndexPath];
      v100 = (void *)MEMORY[0x263F67C78];
      v103[0] = MEMORY[0x263EF8330];
      v103[1] = 3221225472;
      v103[2] = __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_349;
      v103[3] = &unk_264E90660;
      id v104 = v97;
      [v100 performAnimatableChanges:v103];
    }
  }
}

- (void)setTimeAtDismissal:(double)a3
{
  self->_timeAtDismissal = a3;
}

- (void)setIsInStateRestoration:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(id)objc_opt_class() spotlightUserDefaults];
  [v4 setBool:v3 forKey:@"RestorationCurrentState"];
}

- (void)updatePlatterMode
{
  BOOL v3 = [(SPUISearchViewController *)self navigationController];
  id v4 = [v3 topViewController];

  if (v4 != self) {
    goto LABEL_20;
  }
  uint64_t v5 = [(SPUISearchViewController *)self navigationController];
  uint64_t v6 = [v5 navigationMode];

  id v7 = [(SPUIViewController *)self activeViewController];
  id v8 = [(SPUISearchViewController *)self proactiveResultViewController];
  if (v7 != v8)
  {

    goto LABEL_9;
  }
  unint64_t v9 = [(SPUISearchViewController *)self presentationMode];

  if (v9 != 6)
  {
LABEL_9:
    id v10 = [(SPUIViewController *)self activeViewController];
    v11 = [(SPUISearchViewController *)self proactiveResultViewController];

    if (v10 == v11)
    {
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v12 = [(SPUIViewController *)self activeViewController];
      unint64_t v13 = [(SPUIViewController *)self searchResultViewController];

      if (v12 == v13)
      {
        uint64_t v6 = 1;
      }
      else
      {
        uint64_t v14 = [(SPUIViewController *)self activeViewController];
        BOOL v15 = [(SPUISearchViewController *)self firstTimeExperienceViewController];

        if (v14 == v15) {
          uint64_t v6 = 2;
        }
      }
    }
    goto LABEL_17;
  }
  if (+[SPUISearchFirstTimeViewController needsDisplay])
  {
    if (+[SPUISearchFirstTimeViewController useZKWFTE]) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_17:
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    id v16 = [(SPUISearchViewController *)self navigationController];
    double v17 = [v16 navigationBar];

    [v17 showSeparator:v6 != 0 animated:0];
  }
  double v18 = [(SPUISearchViewController *)self navigationController];
  [v18 setNavigationMode:v6];

LABEL_20:
  [(SPUISearchViewController *)self updateResponderChainIfNeeded];
}

- (void)updateResponderChainIfNeeded
{
  BOOL v3 = [(SPUISearchViewController *)self navigationController];
  id v21 = [v3 topViewController];

  id v4 = [(SPUIViewController *)self activeViewController];
  uint64_t v5 = [(SPUISearchViewController *)self proactiveResultViewController];
  if (v4 == (void *)v5)
  {
  }
  else
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(SPUIViewController *)self activeViewController];
    id v8 = [(SPUIViewController *)self searchResultViewController];

    if (v7 != v8) {
      goto LABEL_6;
    }
  }
  unint64_t v9 = [(SPUIViewController *)self activeViewController];
  uint64_t v10 = [v9 responderForKeyboardInput];

  id v21 = (id)v10;
LABEL_6:
  v11 = [(SPUISearchViewController *)self navigationController];
  uint64_t v12 = [v11 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = [(SPUISearchViewController *)self navigationController];
    BOOL v15 = [v14 topViewController];
    uint64_t v16 = [v15 responderForKeyboardInput];

    id v21 = (id)v16;
  }
  id v17 = v21;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    double v18 = [(SPUISearchViewController *)self navigationController];
    uint64_t v19 = [v18 navigationMode];

    if (v19) {
      id v17 = v21;
    }
    else {
      id v17 = 0;
    }
  }
  BOOL v20 = [(SPUISearchViewController *)self searchHeader];
  [v20 setResponderForKeyboardInput:v17];
}

- (SPUISearchHeader)searchHeader
{
  return (SPUISearchHeader *)objc_getProperty(self, a2, 1032, 1);
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)showVerticalScrollIndicators:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v5 setShowsVerticalScrollIndicator:v3];

  id v6 = [(SPUIViewController *)self searchResultViewController];
  [v6 setShowsVerticalScrollIndicator:v3];
}

- (BOOL)checkClearTimer
{
  [(SPUISearchViewController *)self timeAtDismissal];
  if (v3 == 0.0) {
    return 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(SPUISearchViewController *)self timeAtDismissal];
  if (Current - v5 <= 480.0) {
    return 0;
  }
  [(SPUISearchViewController *)self clearTimerExpired];
  return 1;
}

- (double)timeAtDismissal
{
  return self->_timeAtDismissal;
}

void __40__SPUISearchViewController_refreshTrial__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F7E3C8] sharedManager];
  [v2 refresh];

  double v3 = [MEMORY[0x263F7E3C8] sharedManager];
  uint64_t v4 = [v3 zkwOverrideValue];

  if (v4 == 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (v4 != 2) {
      return;
    }
    uint64_t v5 = 1;
  }
  id v6 = *(void **)(a1 + 32);
  [v6 setExpansionValueForZKW:v5];
}

- (void)willUpdateActiveViewController
{
  v3.receiver = self;
  v3.super_class = (Class)SPUISearchViewController;
  [(SPUIViewController *)&v3 willUpdateActiveViewController];
  [(SPUISearchViewController *)self updatePlatterMode];
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (void)setClearQueryOnDismissal:(BOOL)a3
{
  self->_clearQueryOnDismissal = a3;
}

- (NSData)restorationData
{
  return self->_restorationData;
}

- (BOOL)expandPlatterOnAppear
{
  return self->_expandPlatterOnAppear;
}

- (NSMutableSet)allHeaderViews
{
  return (NSMutableSet *)objc_getProperty(self, a2, 1040, 1);
}

- (id)currentQueryContext
{
  v2 = [(SPUISearchViewController *)self currentModel];
  objc_super v3 = [v2 queryTask];
  uint64_t v4 = [v3 query];
  uint64_t v5 = [v4 queryContext];

  return v5;
}

- (void)didBeginEditing
{
  objc_super v3 = [(SPUISearchViewController *)self searchHeader];
  [v3 showCancelButton:1 animated:1];

  id v4 = [(SPUIViewController *)self delegate];
  [v4 searchFieldDidFocus];
}

- (void)setFooterViewsForProactive:(id)a3 forResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v8 setFooterView:v7];

  id v9 = [(SPUIViewController *)self searchResultViewController];
  [v9 setFooterView:v6];
}

- (double)distanceToTopOfAppIcons
{
  v2 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v2 distanceToTopOfAppIcons];
  double v4 = v3;

  return v4;
}

- (SPUISearchViewController)init
{
  v57[4] = *MEMORY[0x263EF8340];
  v55.receiver = self;
  v55.super_class = (Class)SPUISearchViewController;
  v2 = [(SPUIViewController *)&v55 init];
  if (v2)
  {
    double v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    double v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, -1);

    dispatch_queue_t v5 = dispatch_queue_create("factorFetchQueue", v4);
    [(SPUISearchViewController *)v2 setFactorsFetchingQueue:v5];

    [(SPUISearchViewController *)v2 refreshTrial];
    id v6 = objc_opt_new();
    [(SPUISearchViewController *)v2 setView:v6];

    id v7 = objc_opt_new();
    [(SPUISearchViewController *)v2 setAppIntentsQueryHelper:v7];

    id v8 = (void *)MEMORY[0x263F79150];
    id v9 = [(SPUISearchViewController *)v2 appIntentsQueryHelper];
    uint64_t v10 = [MEMORY[0x263F79150] queryHelperKey];
    [v8 registerDependency:v9 forKey:v10];

    v11 = (void *)MEMORY[0x263F79150];
    uint64_t v12 = [MEMORY[0x263F79150] presentationHelperKey];
    [v11 registerDependency:v2 forKey:v12];

    [(SPUISearchViewController *)v2 setTimeAtDismissal:0.0];
    unint64_t v13 = [(SPUISearchViewController *)v2 view];
    uint64_t v14 = [v13 layer];
    [v14 setAllowsGroupOpacity:0];

    BOOL v15 = objc_opt_new();
    [(SPUISearchViewController *)v2 setAllHeaderViews:v15];

    uint64_t v16 = [(SPUIViewController *)v2 searchResultViewController];
    [v16 setCommandDelegate:v2];

    id v17 = [(SPUIViewController *)v2 searchResultViewController];
    [v17 setAllowHighlightingWhenInactive:1];

    double v18 = [SPUIProactiveResultsViewController alloc];
    uint64_t v19 = +[SPUISearchModel sharedFullZWKInstance];
    BOOL v20 = [(SPUIProactiveResultsViewController *)v18 initWithSearchModel:v19 searchEntity:0];
    [(SPUISearchViewController *)v2 setProactiveResultViewController:v20];

    id v21 = [(SPUISearchViewController *)v2 proactiveResultViewController];
    [v21 setDelegate:v2];

    double v22 = [(SPUISearchViewController *)v2 proactiveResultViewController];
    [v22 setFeedbackListener:v2];

    v23 = [(SPUISearchViewController *)v2 proactiveResultViewController];
    [v23 setCommandDelegate:v2];

    v24 = [(SPUISearchViewController *)v2 proactiveResultViewController];
    [v24 setShouldMonitorScrollingPastBottomOfContent:1];

    v25 = [(SPUISearchViewController *)v2 createAdditionalHeaderView];
    [(SPUISearchViewController *)v2 setSearchHeader:v25];

    v26 = [(SPUISearchViewController *)v2 searchHeader];
    v27 = [v26 searchField];
    v28 = [(SPUISearchViewController *)v2 proactiveResultViewController];
    [v28 setSearchField:v27];

    v29 = [(SPUISearchViewController *)v2 searchHeader];
    v30 = [v29 searchField];
    id v31 = [(SPUIViewController *)v2 searchResultViewController];
    [v31 setSearchField:v30];

    v32 = (void *)MEMORY[0x263F79150];
    CGRect v33 = [(SPUISearchViewController *)v2 searchHeader];
    CGRect v34 = [v33 searchField];
    [v32 annotateSearchField:v34];

    v35 = [(SPUISearchViewController *)v2 proactiveResultViewController];
    [(SPUIViewController *)v2 activateViewController:v35 animate:0];

    v36 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83758] modifierFlags:0 action:sel_escapeKeyCommand];
    v37 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83760] modifierFlags:0 action:sel_spotlight_leftArrowPressed];
    [v37 setWantsPriorityOverSystemBehavior:1];
    v38 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83768] modifierFlags:0 action:sel_spotlight_rightArrowPressed];
    [v38 setWantsPriorityOverSystemBehavior:1];
    v39 = [MEMORY[0x263F82890] keyCommandWithInput:@"b" modifierFlags:0x100000 action:sel_performWebSearch];
    v57[0] = v36;
    v57[1] = v37;
    v57[2] = v38;
    v57[3] = v39;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:4];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = [v40 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v52;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v52 != v43) {
            objc_enumerationMutation(v40);
          }
          -[SPUISearchViewController addKeyCommand:](v2, "addKeyCommand:", *(void *)(*((void *)&v51 + 1) + 8 * v44++), (void)v51);
        }
        while (v42 != v44);
        uint64_t v42 = [v40 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v42);
    }

    v45 = [MEMORY[0x263F08A00] defaultCenter];
    [v45 addObserver:v2 selector:sel_checkClearTimer name:*MEMORY[0x263F833B8] object:0];

    uint64_t v46 = [MEMORY[0x263F08A00] defaultCenter];
    [v46 addObserver:v2 selector:sel_spotlightDidBackground name:*MEMORY[0x263F83330] object:0];

    v47 = [MEMORY[0x263F08A00] defaultCenter];
    [v47 addObserver:v2 selector:sel_dragInitiated name:*MEMORY[0x263F67C88] object:0];

    v48 = [MEMORY[0x263F08A00] defaultCenter];
    [v48 addObserver:v2 selector:sel_appIconDragged name:*MEMORY[0x263F67C80] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)lockStateChanged_0, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDrop);
    [MEMORY[0x263F67C78] prewarmApplicationLibrary];
  }
  return v2;
}

- (SPUIProactiveResultsViewController)proactiveResultViewController
{
  return (SPUIProactiveResultsViewController *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setTopBlurView:(id)a3
{
}

- (void)setSearchHeader:(id)a3
{
}

- (void)setProactiveResultViewController:(id)a3
{
}

- (void)setFactorsFetchingQueue:(id)a3
{
}

- (void)setAllHeaderViews:(id)a3
{
}

- (void)refreshTrial
{
  double v3 = [(SPUISearchViewController *)self factorsFetchingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SPUISearchViewController_refreshTrial__block_invoke;
  block[3] = &unk_264E90660;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)factorsFetchingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setSizingDelegate:(id)a3
{
}

- (void)setAdditionalKeyboardHeight:(double)a3
{
  dispatch_queue_t v5 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v5 setAdditionalKeyboardHeight:a3];

  id v6 = [(SPUIViewController *)self searchResultViewController];
  [v6 setAdditionalKeyboardHeight:a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)searchViewDidPresentFromSource:(unint64_t)a3
{
  double v4 = [(SPUIViewController *)self searchResultViewController];
  [v4 didPresentToResumeSearch:1];

  dispatch_queue_t v5 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v5 didPresentToResumeSearch:0];

  id v6 = [(SPUISearchViewController *)self searchHeader];
  id v7 = [v6 searchField];
  [v7 setSelectionGrabbersHiddenSafe:0];

  if ([(SPUISearchViewController *)self presentationMode] != 5)
  {
    id v8 = [(SPUISearchViewController *)self searchHeader];
    objc_msgSend(v8, "focusSearchFieldAndSelectAll:withReason:", -[SPUISearchViewController queryIdSameAsInvokeQueryIdentifier](self, "queryIdSameAsInvokeQueryIdentifier"), 1);
  }
  id v9 = [(SPUISearchViewController *)self view];
  [v9 setAlpha:1.0];

  [(SPUISearchViewController *)self showVerticalScrollIndicators:1];
  uint64_t v10 = [(SPUISearchViewController *)self navigationController];
  v11 = [v10 presentedViewController];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v13 = MEMORY[0x263F79148];
  if (isKindOfClass)
  {
    uint64_t v14 = *(NSObject **)(MEMORY[0x263F79148] + 40);
    if (!v14)
    {
      SPUIInitLogging();
      uint64_t v14 = *(NSObject **)(v13 + 40);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[SPUISearchViewController searchViewDidPresentFromSource:]();
    }
    id v15 = v11;
    if (objc_opt_respondsToSelector()) {
      [v15 _didFinishDismissal];
    }
  }
  uint64_t v16 = [(SPUISearchViewController *)self topBlurView];
  [v16 setAlpha:1.0];

  dispatch_after(0, MEMORY[0x263EF83A0], &__block_literal_global_3);
  id v17 = *(NSObject **)(v13 + 40);
  if (!v17)
  {
    SPUIInitLogging();
    id v17 = *(NSObject **)(v13 + 40);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D2E6000, v17, OS_LOG_TYPE_DEFAULT, "bringUp end", buf, 2u);
  }
  kdebug_trace();
  double v18 = *(NSObject **)(v13 + 32);
  if (!v18)
  {
    SPUIInitLogging();
    double v18 = *(NSObject **)(v13 + 32);
  }
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "bringUp", " enableTelemetry=YES ", v19, 2u);
  }
}

- (UIView)topBlurView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topBlurView);
  return (UIView *)WeakRetained;
}

- (BOOL)queryIdSameAsInvokeQueryIdentifier
{
  double v3 = [(SPUISearchViewController *)self queryOnDismissal];
  double v4 = [(SPUISearchViewController *)self currentQuery];
  if ([v3 isEqualToString:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(SPUISearchViewController *)self navigationController];
    id v7 = [v6 viewControllers];
    BOOL v5 = (unint64_t)[v7 count] > 1;
  }
  return v5;
}

- (NSString)queryOnDismissal
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[SPUISearchFirstTimeViewController dismissForever];
  id v8 = [[SPUITestingHelper alloc] initWithSearchViewController:self];
  [(SPUISearchViewController *)self setTestingHelper:v8];

  id v9 = [(SPUISearchViewController *)self testingHelper];
  int v10 = [v9 canPerformTest:v6];

  if (v10)
  {
    v11 = [(SPUISearchViewController *)self testingHelper];
    [v11 performTest:v6 options:v7 completion:0];
  }
  return v10;
}

- (SPUITestingHelper)testingHelper
{
  return (SPUITestingHelper *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setTestingHelper:(id)a3
{
}

- (void)resultsDidBecomeVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SPUIViewController *)self searchResultViewController];
  id v6 = [v5 goTakeoverResult];
  [v4 setGoTakeoverResult:v6];

  id v7 = +[SPUIFeedbackManager feedbackListener];
  [v7 resultsDidBecomeVisible:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_spotlight_leftArrowPressed == a3 || sel_spotlight_rightArrowPressed == a3)
  {
    id v8 = [MEMORY[0x263F82758] focusSystemForEnvironment:self];
    id v9 = [v8 focusedItem];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned __int8 v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    char v10 = [v9 _allowsHorizontalFocusMovement];
LABEL_13:
    unsigned __int8 v11 = v10 ^ 1;
    goto LABEL_18;
  }
  if (sel_escapeKeyCommand == a3)
  {
    id v9 = [(SPUISearchViewController *)self searchTextField];
    char v10 = [v9 hasMarkedText];
    goto LABEL_13;
  }
  if (sel_performWebSearch == a3)
  {
    id v9 = [(SPUISearchViewController *)self searchTextField];
    uint64_t v12 = [v9 searchText];
    if ([v12 length])
    {
      uint64_t v13 = [(SPUISearchViewController *)self searchTextField];
      uint64_t v14 = [v13 tokens];
      unsigned __int8 v11 = [v14 count] == 0;
    }
    else
    {
      unsigned __int8 v11 = 0;
    }

    goto LABEL_18;
  }
  v16.receiver = self;
  v16.super_class = (Class)SPUISearchViewController;
  unsigned __int8 v11 = [(SPUISearchViewController *)&v16 canPerformAction:a3 withSender:v6];
LABEL_19:

  return v11;
}

- (id)searchTextField
{
  v2 = [(SPUISearchViewController *)self searchHeader];
  double v3 = [v2 searchField];

  return v3;
}

- (void)escapeKeyCommand
{
  id v2 = [(SPUISearchViewController *)self searchHeader];
  [v2 focusSearchFieldAndSelectAll:1 withReason:3];
}

- (void)spotlight_leftArrowPressed
{
  id v2 = [(SPUISearchViewController *)self searchTextField];
  [v2 promoteCompletionIfPossibleAndMoveForward:0];
}

- (void)spotlight_rightArrowPressed
{
  id v2 = [(SPUISearchViewController *)self searchTextField];
  [v2 promoteCompletionIfPossibleAndMoveForward:1];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v4 = [(SPUIViewController *)self searchResultViewController];
  [v3 removeObserver:v4];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.lock_status", 0);
  v6.receiver = self;
  v6.super_class = (Class)SPUISearchViewController;
  [(SPUISearchViewController *)&v6 dealloc];
}

- (BOOL)canPerformCommand:(id)a3
{
  id v4 = a3;
  if ([(SPUISearchViewController *)self isQueryCommand:v4])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)performCommand:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SPUISearchViewController *)self isQueryCommand:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 entityType] == 3)
    {
      id v5 = v4;
      objc_super v6 = objc_opt_new();
      id v7 = objc_alloc(MEMORY[0x263F78DB0]);
      id v8 = [v5 tokenString];
      id v9 = (void *)[v7 initWithSearchString:v8];

      char v10 = (void *)MEMORY[0x263F79178];
      unsigned __int8 v11 = [(SPUISearchViewController *)self view];
      objc_msgSend(v9, "setDeviceAuthenticationState:", objc_msgSend(v10, "deviceAuthenticationStateForView:", v11));

      [v9 setWhyQuery:8];
      uint64_t v12 = [(SPUISearchViewController *)self searchHeader];
      [v12 addInputMethodInformationToQueryContext:v9];

      uint64_t v13 = [MEMORY[0x263F78DA8] searchEntityWithCommand:v5 fromSuggestion:1];

      v33[0] = v13;
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
      [v9 setSearchEntities:v14];

      [v9 setAllowInternet:1];
      id v15 = [[SPUIResultsViewController alloc] initWithSearchModel:v6 searchEntity:v13];
      objc_super v16 = [(SPUISearchViewController *)self searchHeader];
      id v17 = [v16 searchField];
      [(SearchUIResultsViewController *)v15 setSearchField:v17];

      [(SearchUIResultsViewController *)v15 setFeedbackListener:self];
      [(SearchUIResultsViewController *)v15 setCommandDelegate:self];
      double v18 = [v9 displayedText];
      [(SearchUIResultsViewController *)v15 setQueryString:v18];

      uint64_t v19 = [(SPUISearchViewController *)self navigationController];
      [(SPUIResultsViewController *)v15 setBackgroundColorDelegate:v19];

      [(SPUIResultsViewController *)v15 setUseLoadingView:1];
      [v6 updateWithQueryContext:v9];
      [(SPUISearchViewController *)self showViewController:v15 sender:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v4 searchString];
        uint64_t v24 = [v23 length];

        if (!v24)
        {
          [(SPUISearchViewController *)self clearSearchResultsAndFetchZKW:1];
          goto LABEL_11;
        }
      }
      v25 = [(SPUISearchViewController *)self searchHeader];
      [v25 updateWithCommand:v4];

      v26 = [(SPUISearchViewController *)self searchHeader];
      v27 = [v26 searchEntity];
      v28 = [(SPUIViewController *)self searchResultViewController];
      [v28 setSearchEntity:v27];

      v29 = [(SPUISearchViewController *)self navigationController];
      id v30 = (id)[v29 popToRootViewControllerAnimated:1];

      id v31 = [(SPUIViewController *)self searchResultViewController];
      [(SPUIViewController *)self activateViewController:v31 animate:1];

      objc_super v6 = [(SPUISearchViewController *)self navigationController];
      v32 = [(SPUIViewController *)self searchResultViewController];
      [v6 updateBackgroundColorWithViewControllerToBeShown:v32];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v20 = objc_opt_new();
      [v20 setSource:0];
      id v21 = [v4 utteranceText];
      [v20 setUtteranceText:v21];

      double v22 = objc_opt_new();
      [v22 activateWithContext:v20];
    }
  }
LABEL_11:
}

- (BOOL)isQueryCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (NSString)lastSearchString
{
  id v2 = [(SPUISearchViewController *)self searchHeader];
  id v3 = [v2 lastSearchText];

  return (NSString *)v3;
}

- (UISearchToken)lastSearchToken
{
  id v2 = [(SPUISearchViewController *)self searchHeader];
  id v3 = [v2 lastSearchToken];

  return (UISearchToken *)v3;
}

- (void)updateHeaderViewsWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SPUISearchViewController *)self allHeaderViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)dragInitiated
{
  if ([(SPUISearchViewController *)self presentationMode] == 6)
  {
    [(SPUISearchViewController *)self cancelButtonPressed];
  }
}

- (void)appIconDragged
{
  if ([(SPUISearchViewController *)self presentationMode] == 2
    || [(SPUISearchViewController *)self presentationMode] == 1
    || [(SPUISearchViewController *)self presentationMode] == 8)
  {
    [(SPUISearchViewController *)self cancelButtonPressed];
  }
}

- (void)didEngageResult:(id)a3
{
  id v9 = a3;
  id v4 = [v9 result];
  if ([v4 isLocalApplicationResult])
  {
    id v5 = [(SPUISearchViewController *)self windowExpansionTimer];
    -[SPUISearchViewController setClearQueryOnDismissal:](self, "setClearQueryOnDismissal:", [v5 isValid]);
  }
  else
  {
    [(SPUISearchViewController *)self setClearQueryOnDismissal:0];
  }
  uint64_t v6 = [(SPUISearchViewController *)self searchHeader];
  int v7 = [v6 isReturnKeyPressedInGoMode];

  if (v7) {
    [v9 setTriggerEvent:1];
  }
  uint64_t v8 = +[SPUIFeedbackManager feedbackListener];
  [v8 didEngageResult:v9];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUISearchViewController *)self searchHeader];
  [v5 setLegibilitySettings:v4];
}

- (void)performTestSearchWithQuery:(id)a3 event:(unint64_t)a4 queryKind:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(SPUISearchViewController *)self searchHeader];
  [v9 performTestSearchWithQuery:v8 event:a4 queryKind:a5];
}

uint64_t __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showViewController:*(void *)(a1 + 40) sender:0];
}

uint64_t __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showViewController:*(void *)(a1 + 40) sender:0];
}

void __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_349(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (void)searchViewDidUpdatePresentationProgress:(double)a3
{
  if (a3 >= 1.0)
  {
    id v5 = [(SPUISearchViewController *)self searchHeader];
    objc_msgSend(v5, "focusSearchFieldAndSelectAll:withReason:", -[SPUISearchViewController queryIdSameAsInvokeQueryIdentifier](self, "queryIdSameAsInvokeQueryIdentifier"), 0);
  }
  else
  {
    if (a3 >= 0.5) {
      return;
    }
    id v5 = [(SPUISearchViewController *)self searchHeader];
    if ([v5 isFirstResponder])
    {
      int v4 = [MEMORY[0x263F79140] enableFloatingWindow];

      if (!v4) {
        return;
      }
      id v5 = [(SPUISearchViewController *)self searchHeader];
      [v5 unfocusSearchFieldWithReason:0];
    }
  }
}

- (void)purgeMemory
{
  id v3 = [(SPUIViewController *)self searchResultViewController];
  [v3 purgeMemory];

  int v4 = [(SPUIViewController *)self searchResultViewController];
  [v4 updateWithResultSections:MEMORY[0x263EFFA68]];

  id v5 = +[SPUISearchModel sharedGeneralInstance];
  [v5 purgeMemory];

  id v6 = +[SPUISearchModel sharedFullZWKInstance];
  [v6 purgeMemory];
}

void __59__SPUISearchViewController_searchViewDidPresentFromSource___block_invoke()
{
  uint64_t v0 = MEMORY[0x263F79148];
  id v1 = *(NSObject **)(MEMORY[0x263F79148] + 32);
  if (!v1)
  {
    SPUIInitLogging();
    id v1 = *(NSObject **)(v0 + 32);
  }
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v1, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "finalPrewarm", (const char *)&unk_23D315BC7, buf, 2u);
  }
  id v2 = +[SPUISearchModel sharedGeneralInstance];
  [v2 activate];

  [MEMORY[0x263F79178] prewarmVisionForImageDerivedColors];
  id v3 = *(NSObject **)(v0 + 32);
  if (!v3)
  {
    SPUIInitLogging();
    id v3 = *(NSObject **)(v0 + 32);
  }
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)int v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "finalPrewarm", " enableTelemetry=YES ", v4, 2u);
  }
}

- (void)sendPresentationFeedback
{
  unint64_t v3 = [(SPUISearchViewController *)self presentationMode];
  id v8 = [(SPUISearchViewController *)self searchHeader];
  uint64_t v4 = [v8 queryId];
  id v5 = [(SPUISearchViewController *)self currentQuery];
  id v6 = (void *)MEMORY[0x263F67C78];
  int v7 = [(SPUISearchViewController *)self view];
  +[SPUIFeedbackManager didAppearFromSource:withQueryId:queryString:deviceIsAuthenticated:](SPUIFeedbackManager, "didAppearFromSource:withQueryId:queryString:deviceIsAuthenticated:", v3, v4, v5, [v6 deviceIsAuthenticatedForView:v7]);
}

- (void)searchViewWillDismissWithReason:(unint64_t)a3
{
  uint64_t v4 = [(SPUIViewController *)self searchResultViewController];
  [v4 willDismiss];

  id v5 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v5 willDismiss];

  id v6 = [(SPUISearchViewController *)self searchHeader];
  int v7 = [v6 searchField];
  [v7 setSelectionGrabbersHiddenSafe:1];

  kdebug_trace();
  uint64_t v8 = MEMORY[0x263F79148];
  id v9 = *(NSObject **)(MEMORY[0x263F79148] + 32);
  if (!v9)
  {
    SPUIInitLogging();
    id v9 = *(NSObject **)(v8 + 32);
  }
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "dismiss", (const char *)&unk_23D315BC7, buf, 2u);
  }
  long long v10 = *(NSObject **)(v8 + 40);
  if (!v10)
  {
    SPUIInitLogging();
    long long v10 = *(NSObject **)(v8 + 40);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v18 = 0;
    _os_log_impl(&dword_23D2E6000, v10, OS_LOG_TYPE_DEFAULT, "dismiss start", v18, 2u);
  }
  if ([(SPUISearchViewController *)self presentationMode] != 1
    && [(SPUISearchViewController *)self presentationMode] != 5
    && [(SPUISearchViewController *)self presentationMode] != 7)
  {
    long long v11 = [(SPUISearchViewController *)self searchHeader];
    [v11 showCancelButton:0 animated:1];
  }
  long long v12 = [(SPUIViewController *)self activeViewController];
  long long v13 = [v12 presentedViewController];

  if (v13)
  {
    uint64_t v14 = [(SPUIViewController *)self activeViewController];
    [v14 dismissViewControllerAnimated:1 completion:0];

    uint64_t v15 = [(SPUISearchViewController *)self searchHeader];
    +[SPUIFeedbackManager cardViewDidDisappearWithEvent:withQueryId:](SPUIFeedbackManager, "cardViewDidDisappearWithEvent:withQueryId:", 5, [v15 queryId]);
  }
  [(SPUISearchViewController *)self showVerticalScrollIndicators:0];
  if (([MEMORY[0x263F79140] pageDotInvokeEnabled] & 1) == 0)
  {
    objc_super v16 = [(SPUISearchViewController *)self searchHeader];
    [v16 unfocusSearchFieldWithReason:1];
  }
  id v17 = [(SPUISearchViewController *)self topBlurView];
  [v17 setAlpha:0.0];

  [(SPUISearchViewController *)self setTimeAtDismissal:CFAbsoluteTimeGetCurrent()];
}

- (void)clearTimerExpired
{
  unint64_t v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23D2E6000, v3, v4, "Clear timer expired", v5, 2u);
  }

  [(SPUISearchViewController *)self clearSearchResultsAndFetchZKW:0];
}

- (BOOL)currentQueryIdMatchesResultInGeneralModel
{
  id v2 = [(SPUISearchViewController *)self searchHeader];
  uint64_t v3 = [v2 queryId];
  os_log_type_t v4 = +[SPUISearchModel sharedGeneralInstance];
  id v5 = [v4 sections];
  id v6 = [v5 firstObject];
  int v7 = [v6 results];
  uint64_t v8 = [v7 firstObject];
  LOBYTE(v3) = v3 == [v8 queryId];

  return v3;
}

- (void)highlightResultAfterUnmarkingText
{
  id v2 = [(SPUIViewController *)self searchResultViewController];
  [v2 highlightResultAfterUnmarkingText];
}

- (void)returnKeyPressed
{
  uint64_t v3 = [(SPUISearchViewController *)self currentQuery];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = +[SPUISearchModel sharedGeneralInstance];
    int v6 = [v5 queryInProgress];

    if (v6)
    {
      id v7 = objc_initWeak(&location, self);
      BOOL v8 = [(SPUISearchViewController *)self currentQueryIdMatchesResultInGeneralModel];

      id v9 = objc_loadWeakRetained(&location);
      long long v10 = v9;
      if (v8)
      {
        [v9 performReturnKeyPressAndExpandWidowIfNeeded];
      }
      else
      {
        long long v11 = [v9 searchResultViewController];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __44__SPUISearchViewController_returnKeyPressed__block_invoke;
        v13[3] = &unk_264E90800;
        objc_copyWeak(&v14, &location);
        [v11 setViewDidUpdateHandler:v13];

        objc_destroyWeak(&v14);
      }
      objc_destroyWeak(&location);
    }
    else
    {
      [(SPUISearchViewController *)self performReturnKeyPressAndExpandWidowIfNeeded];
    }
  }
  else if ([(SPUISearchViewController *)self presentationMode] != 6 {
         || ([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
  }
  {
    id v12 = [(SPUISearchViewController *)self proactiveResultViewController];
    [v12 performReturnKeyPressAction];
  }
}

void __44__SPUISearchViewController_returnKeyPressed__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained currentQueryIdMatchesResultInGeneralModel];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 searchResultViewController];
    [v5 setViewDidUpdateHandler:0];

    id v6 = objc_loadWeakRetained(v1);
    [v6 performReturnKeyPressAndExpandWidowIfNeeded];
  }
}

- (void)backButtonPressed
{
  id v3 = [(SPUISearchViewController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (void)performWebSearch
{
  id v7 = (id)objc_opt_new();
  id v3 = [(SPUISearchViewController *)self searchHeader];
  id v4 = [v3 searchField];
  id v5 = [v4 searchText];
  [v7 setSearchString:v5];

  id v6 = [MEMORY[0x263F67C38] handlerForCommand:v7 environment:0];
  [v6 executeWithTriggerEvent:1];
}

- (void)performReturnKeyPressAndExpandWidowIfNeeded
{
  uint64_t v3 = [(SPUISearchViewController *)self windowExpansionTimer];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(SPUIViewController *)self activeViewController];
    id v6 = [(SPUIViewController *)self searchResultViewController];

    if (v5 != v6)
    {
      [(SPUISearchViewController *)self invalidateWindowExpansionTimer];
      id v7 = [(SPUISearchViewController *)self searchHeader];
      int v8 = [v7 completionResultIsPotentiallyPunchout];

      if (v8)
      {
        [(SPUISearchViewController *)self scheduleWindowExpansionWithInterval:0.5];
        [(SPUISearchViewController *)self setExpandPlatterOnAppear:1];
      }
      else
      {
        [(SPUISearchViewController *)self expandWindowIfNeeded];
      }
    }
  }
  id v9 = [(SPUISearchViewController *)self searchHeader];
  long long v10 = [v9 searchField];
  uint64_t v11 = [v10 returnKeyType];

  if (v11 == 6)
  {
    id v12 = [(SPUISearchViewController *)self searchHeader];
    [v12 commitSearch];
  }
  else
  {
    id v12 = [(SPUIViewController *)self searchResultViewController];
    [v12 performReturnKeyPressAction];
  }
}

- (void)invalidateWindowExpansionTimer
{
  uint64_t v3 = [(SPUISearchViewController *)self windowExpansionTimer];
  [v3 invalidate];

  [(SPUISearchViewController *)self setWindowExpansionTimer:0];
}

- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SPUIViewController *)self activeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(SPUIViewController *)self activeViewController];
    [v7 removeCompletionAndHighlightAsTyped:v3];
  }
}

- (void)clearSearchResultsAndFetchZKW:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SPUIViewController *)self searchResultViewController];
  [v5 purgeMemory];

  id v6 = [(SPUISearchViewController *)self navigationController];
  id v7 = (id)[v6 popToRootViewControllerAnimated:0];

  id v8 = [(SPUISearchViewController *)self searchHeader];
  [v8 clearSearchFieldWhyQuery:9 allowZKW:v3];
}

- (void)searchViewDidDismissWithReason:(unint64_t)a3
{
  id v5 = [(SPUISearchViewController *)self searchHeader];
  +[SPUIFeedbackManager didDisappearWithReason:withQueryId:](SPUIFeedbackManager, "didDisappearWithReason:withQueryId:", a3, [v5 queryId]);

  if ([(SPUISearchViewController *)self clearQueryOnDismissal])
  {
    id v6 = [(SPUISearchViewController *)self searchHeader];
    [v6 clearSearchFieldWhyQuery:0 allowZKW:0];
  }
  id v7 = +[SPUISearchModel sharedGeneralInstance];
  [v7 deactivate];

  [(SPUISearchViewController *)self refreshTrial];
  id v8 = [(SPUISearchViewController *)self navigationController];
  [v8 setNavigationMode:0];

  [(SPUISearchViewController *)self updateResponderChainIfNeeded];
  if (([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F79140] bottomSearchFieldEnabled] ^ 1;
    long long v10 = [(SPUISearchViewController *)self searchHeader];
    [v10 setHidden:v9];
  }
  uint64_t v11 = [(SPUISearchViewController *)self proactiveResultViewController];
  [(SPUIViewController *)self activateViewController:v11 animate:0];

  id v12 = [(SPUISearchViewController *)self proactiveResultViewController];
  [v12 updateWithResultSections:MEMORY[0x263EFFA68]];

  long long v13 = [(SPUISearchViewController *)self currentQuery];
  [(SPUISearchViewController *)self setQueryOnDismissal:v13];

  uint64_t v14 = MEMORY[0x263F79148];
  uint64_t v15 = *(NSObject **)(MEMORY[0x263F79148] + 40);
  if (!v15)
  {
    SPUIInitLogging();
    uint64_t v15 = *(NSObject **)(v14 + 40);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D2E6000, v15, OS_LOG_TYPE_DEFAULT, "dismiss end", buf, 2u);
  }
  kdebug_trace();
  objc_super v16 = *(NSObject **)(v14 + 32);
  if (!v16)
  {
    SPUIInitLogging();
    objc_super v16 = *(NSObject **)(v14 + 32);
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "dismiss", " enableTelemetry=YES ", v17, 2u);
  }
}

- (void)spotlightDidBackground
{
  unint64_t v3 = [(SPUISearchViewController *)self feedbackBackgroundTaskIdentifier];
  if (v3 == *MEMORY[0x263F833E0])
  {
    id v4 = [MEMORY[0x263F82438] sharedApplication];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__SPUISearchViewController_spotlightDidBackground__block_invoke;
    v6[3] = &unk_264E90660;
    v6[4] = self;
    -[SPUISearchViewController setFeedbackBackgroundTaskIdentifier:](self, "setFeedbackBackgroundTaskIdentifier:", [v4 beginBackgroundTaskWithName:@"Send Feedback" expirationHandler:v6]);

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__SPUISearchViewController_spotlightDidBackground__block_invoke_359;
    v5[3] = &unk_264E90660;
    v5[4] = self;
    +[SPUIFeedbackManager flushFeedbackWithCompletion:v5];
  }
}

uint64_t __50__SPUISearchViewController_spotlightDidBackground__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) feedbackBackgroundTaskIdentifier];
  if (v2 != *MEMORY[0x263F833E0])
  {
    unint64_t v3 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__SPUISearchViewController_spotlightDidBackground__block_invoke_cold_1();
    }
  }
  return [*(id *)(a1 + 32) endBackgroundTaskIfNeeded];
}

uint64_t __50__SPUISearchViewController_spotlightDidBackground__block_invoke_359(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTaskIfNeeded];
}

- (void)endBackgroundTaskIfNeeded
{
  unint64_t v3 = [(SPUISearchViewController *)self feedbackBackgroundTaskIdentifier];
  if (v3 != *MEMORY[0x263F833E0])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__SPUISearchViewController_endBackgroundTaskIfNeeded__block_invoke;
    v4[3] = &unk_264E90660;
    v4[4] = self;
    [MEMORY[0x263F67C78] dispatchMainIfNecessary:v4];
  }
}

uint64_t __53__SPUISearchViewController_endBackgroundTaskIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  objc_msgSend(v2, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "feedbackBackgroundTaskIdentifier"));

  uint64_t v3 = *MEMORY[0x263F833E0];
  id v4 = *(void **)(a1 + 32);
  return [v4 setFeedbackBackgroundTaskIdentifier:v3];
}

- (void)didScrollPastBottomOfContent
{
  id v2 = [(SPUIViewController *)self delegate];
  [v2 dismissSearchViewWithReason:3];
}

- (void)setExpansionValueForZKW:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(id)objc_opt_class() spotlightUserDefaults];
  [v4 setBool:v3 forKey:@"SpotlightZKWExpanded"];
}

- (void)didChangeExpansionStateForSection:(id)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [v10 bundleIdentifier];
  if ([v6 isEqualToString:*MEMORY[0x263F67530]])
  {
    id v7 = [v10 results];
    id v8 = [v7 firstObject];
    int v9 = [v8 renderHorizontallyWithOtherResultsInCategory];

    if (v9) {
      [(SPUISearchViewController *)self setExpansionValueForZKW:v4];
    }
  }
  else
  {
  }
}

- (void)activateFirstTimeExperienceViewIfNecessary
{
  if (+[SPUISearchFirstTimeViewController needsDisplay])
  {
    if (+[SPUISearchFirstTimeViewController useZKWFTE])
    {
      if (![(SPUISearchViewController *)self hasContentInSearchField])
      {
        uint64_t v3 = MEMORY[0x263F79148];
        BOOL v4 = *(NSObject **)(MEMORY[0x263F79148] + 40);
        if (!v4)
        {
          SPUIInitLogging();
          BOOL v4 = *(NSObject **)(v3 + 40);
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D2E6000, v4, OS_LOG_TYPE_DEFAULT, "FTE incremented count", buf, 2u);
        }
        +[SPUISearchFirstTimeViewController incrementViewCount];
      }
    }
    else
    {
      uint64_t v10 = MEMORY[0x263F79148];
      uint64_t v11 = *(NSObject **)(MEMORY[0x263F79148] + 40);
      if (!v11)
      {
        SPUIInitLogging();
        uint64_t v11 = *(NSObject **)(v10 + 40);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D2E6000, v11, OS_LOG_TYPE_DEFAULT, "[FTE] FTE needs display", buf, 2u);
      }
      id v12 = [(SPUISearchViewController *)self firstTimeExperienceViewController];

      long long v13 = *(NSObject **)(v10 + 40);
      if (v12)
      {
        if (!v13)
        {
          SPUIInitLogging();
          long long v13 = *(NSObject **)(v10 + 40);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D2E6000, v13, OS_LOG_TYPE_DEFAULT, "[FTE] presenting cached FTE view controller", buf, 2u);
        }
        [(SPUISearchViewController *)self activateFirstTimeExperienceViewAnimate:0];
      }
      else
      {
        if (!v13)
        {
          SPUIInitLogging();
          long long v13 = *(NSObject **)(v10 + 40);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D2E6000, v13, OS_LOG_TYPE_DEFAULT, "[FTE] retrieving FTE - call from UI", buf, 2u);
        }
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke;
        v14[3] = &unk_264E90B68;
        v14[4] = self;
        +[SPUISearchModel retrieveFirstTimeExperienceTextWithReply:v14];
      }
    }
  }
  else
  {
    id v5 = [(SPUIViewController *)self activeViewController];
    id v6 = [(SPUISearchViewController *)self firstTimeExperienceViewController];

    if (v5 == v6)
    {
      uint64_t v7 = MEMORY[0x263F79148];
      id v8 = *(NSObject **)(MEMORY[0x263F79148] + 40);
      if (!v8)
      {
        SPUIInitLogging();
        id v8 = *(NSObject **)(v7 + 40);
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D2E6000, v8, OS_LOG_TYPE_DEFAULT, "Doesnt need FTE enabling search view", buf, 2u);
      }
      int v9 = [(SPUIViewController *)self searchResultViewController];
      [(SPUIViewController *)self activateViewController:v9 animate:0];
    }
  }
}

void __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 objectForKey:@"FTE_STRING"];
  id v5 = [v3 objectForKey:@"FTE_LEARN_MORE_LINK"];
  id v6 = [v3 objectForKey:@"FTE_CONTINUE_LINK"];
  uint64_t v7 = [v3 objectForKey:@"FTE_DOMAINS"];

  uint64_t v8 = [v4 length];
  uint64_t v9 = MEMORY[0x263F79148];
  uint64_t v10 = *(NSObject **)(MEMORY[0x263F79148] + 40);
  if (v8)
  {
    if (!v10)
    {
      SPUIInitLogging();
      uint64_t v10 = *(NSObject **)(v9 + 40);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D2E6000, v10, OS_LOG_TYPE_DEFAULT, "[FTE] got parameter values in UI", buf, 2u);
    }
    uint64_t v11 = (void *)MEMORY[0x263F67C78];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_382;
    v12[3] = &unk_264E90B40;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v7;
    id v14 = v4;
    id v15 = v5;
    id v16 = v6;
    [v11 dispatchMainIfNecessary:v12];
  }
  else
  {
    if (!v10)
    {
      SPUIInitLogging();
      uint64_t v10 = *(NSObject **)(v9 + 40);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_cold_1();
    }
  }
}

uint64_t __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_382(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstTimeExperienceViewController];

  if (!v2)
  {
    id v3 = [[SPUISearchFirstTimeViewController alloc] initWithDomains:*(void *)(a1 + 40) explanationText:*(void *)(a1 + 48) learnMoreText:*(void *)(a1 + 56) continueButtonTitle:*(void *)(a1 + 64)];
    [*(id *)(a1 + 32) setFirstTimeExperienceViewController:v3];

    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v4 firstTimeExperienceViewController];
    [v5 setDelegate:v4];
  }
  id v6 = *(void **)(a1 + 32);
  return [v6 activateFirstTimeExperienceViewAnimate:1];
}

- (void)activateFirstTimeExperienceViewAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SPUISearchViewController *)self hasContentInSearchField])
  {
    uint64_t v5 = MEMORY[0x263F79148];
    id v6 = *(NSObject **)(MEMORY[0x263F79148] + 40);
    if (!v6)
    {
      SPUIInitLogging();
      id v6 = *(NSObject **)(v5 + 40);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_23D2E6000, v6, OS_LOG_TYPE_DEFAULT, "[FTE] query was present, so did not show FTE", v11, 2u);
    }
  }
  else
  {
    uint64_t v7 = [(SPUISearchViewController *)self firstTimeExperienceViewController];
    [(SPUIViewController *)self activateViewController:v7 animate:v3];

    uint64_t v8 = MEMORY[0x263F79148];
    uint64_t v9 = *(NSObject **)(MEMORY[0x263F79148] + 40);
    if (!v9)
    {
      SPUIInitLogging();
      uint64_t v9 = *(NSObject **)(v8 + 40);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D2E6000, v9, OS_LOG_TYPE_DEFAULT, "[FTE] displaying FTE view", buf, 2u);
    }
    if ([(SPUISearchViewController *)self _appearState] == 2
      || [(SPUISearchViewController *)self _appearState] == 1)
    {
      uint64_t v10 = [(SPUISearchViewController *)self firstTimeExperienceViewController];
      [v10 updateViewCount];
    }
  }
}

- (void)firstTimeExperienceContinueButtonPressed
{
  +[SPUISearchFirstTimeViewController dismissForever];
  BOOL v3 = [(SPUISearchViewController *)self proactiveResultViewController];
  [(SPUIViewController *)self activateViewController:v3 animate:1];

  id v4 = [(SPUISearchViewController *)self searchHeader];
  [v4 focusSearchFieldAndSelectAll:1 withReason:4];
}

+ (BOOL)shouldShowAsTypedSuggestion
{
  if (shouldShowAsTypedSuggestion_onceToken != -1) {
    dispatch_once(&shouldShowAsTypedSuggestion_onceToken, &__block_literal_global_386);
  }
  return [(id)shouldShowAsTypedSuggestion_defaults BOOLForKey:@"disableAsTypedSuggestion"] ^ 1;
}

uint64_t __55__SPUISearchViewController_shouldShowAsTypedSuggestion__block_invoke()
{
  shouldShowAsTypedSuggestion_defaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
  return MEMORY[0x270F9A758]();
}

+ (void)_updateHeaderView:(id)a3 fromText:(id)a4 fromToken:(id)a5
{
  if (a5)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [a5 representedObject];
    uint64_t v9 = +[SPUISearchHeader tokenFromSearchEntity:v8];

    uint64_t v10 = [v7 searchField];
    [v10 updateTextRange:v6];

    uint64_t v11 = [v7 searchField];
    [v11 updateToken:v9];
  }
  else
  {
    id v12 = a4;
    id v13 = a3;
    id v14 = [v13 searchField];
    [v14 updateTextRange:v12];

    uint64_t v9 = [v13 searchField];
    [v9 updateToken:0];
  }

  [a3 clearLastSearchedText];
}

- (id)currentModel
{
  BOOL v3 = [(SPUISearchViewController *)self navigationController];
  id v4 = [v3 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(SPUISearchViewController *)self hasContentInSearchField]) {
      [(SPUIViewController *)self searchResultViewController];
    }
    else {
    uint64_t v5 = [(SPUISearchViewController *)self proactiveResultViewController];
    }

    id v4 = (void *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = 0;
  }
  id v6 = [v4 model];

  return v6;
}

- (unint64_t)currentQueryId
{
  id v2 = [(SPUISearchViewController *)self currentModel];
  unint64_t v3 = [v2 currentQueryId];

  return v3;
}

- (void)queryContextDidChange:(id)a3 fromSearchHeader:(id)a4 allowZKW:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(SPUISearchViewController *)self invalidateWindowExpansionTimer];
  uint64_t v10 = [(SPUISearchViewController *)self navigationController];
  uint64_t v11 = [v10 viewControllers];
  unint64_t v12 = [v11 count];

  if (v12 >= 2)
  {
    id v13 = [(SPUIViewController *)self searchResultViewController];
    [v13 setSections:MEMORY[0x263EFFA68]];

    id v14 = [(SPUISearchViewController *)self navigationController];
    id v15 = (id)[v14 popToRootViewControllerAnimated:0];
  }
  id v16 = [v8 searchEntities];
  uint64_t v17 = [v16 count];

  if (!v17)
  {
    double v18 = [v8 searchEntities];
    uint64_t v19 = [v18 firstObject];
    BOOL v20 = [(SPUIViewController *)self searchResultViewController];
    [v20 setSearchEntity:v19];

    id v21 = [(SPUISearchViewController *)self navigationController];
    double v22 = [v8 searchString];
    if (v22) {
      [(SPUIViewController *)self searchResultViewController];
    }
    else {
    v23 = [(SPUISearchViewController *)self proactiveResultViewController];
    }
    [v21 updateBackgroundColorWithViewControllerToBeShown:v23];
  }
  v68 = [v8 searchString];
  uint64_t v24 = [v8 searchEntities];
  uint64_t v25 = [v24 count];

  v26 = [v9 searchField];
  v27 = [v26 text];

  v28 = [v9 searchField];
  v29 = [v28 tokens];
  unint64_t v30 = [v29 count];

  if (v30 >= 2)
  {
    uint64_t v31 = MEMORY[0x263F79148];
    v32 = *(NSObject **)(MEMORY[0x263F79148] + 8);
    if (!v32)
    {
      SPUIInitLogging();
      v32 = *(NSObject **)(v31 + 8);
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[SPUISearchViewController createAdditionalHeaderView]();
    }
  }
  CGRect v33 = [(SPUISearchViewController *)self appIntentsQueryHelper];
  [v33 updateSearchString:v27 completionHandler:&__block_literal_global_395];

  CGRect v34 = [v9 searchField];
  v35 = [v34 tokens];
  v36 = [v35 firstObject];

  v37 = +[SPUISearchModel sharedGeneralInstance];
  -[SPUISearchViewController setLastQueryWasAuthenticated:](self, "setLastQueryWasAuthenticated:", [v8 deviceAuthenticationState] == 0);
  v38 = v68;
  if ([v68 length]) {
    int v39 = 1;
  }
  else {
    int v39 = v5;
  }
  int v67 = v39;
  if (v39)
  {
    if ([v68 length] | v25)
    {
      objc_msgSend(v8, "setAllowInternet:", -[SPUISearchViewController allowInternet](self, "allowInternet"));
      [v37 updateWithQueryContext:v8];
      goto LABEL_22;
    }
    uint64_t v42 = [(SPUISearchViewController *)self proactiveResultViewController];
    [(SPUIViewController *)self activateViewController:v42 animate:0];

    uint64_t v41 = [(SPUISearchViewController *)self proactiveResultViewController];
    uint64_t v43 = [v41 refreshResultsWithContext:v8 allowPartialUpdates:0];
    [(SPUISearchViewController *)self searchHeader];
    v45 = uint64_t v44 = v37;
    [v45 setQueryId:v43];

    v37 = v44;
  }
  else
  {
    id v40 = +[SPUISearchModel sharedGeneralInstance];
    [v40 clear];

    uint64_t v41 = +[SPUISearchModel sharedFullZWKInstance];
    [v41 clear];
  }

LABEL_22:
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __76__SPUISearchViewController_queryContextDidChange_fromSearchHeader_allowZKW___block_invoke_2;
  v69[3] = &unk_264E90B90;
  id v46 = v9;
  id v70 = v46;
  int v71 = self;
  id v47 = v27;
  id v72 = v47;
  id v48 = v36;
  id v73 = v48;
  [(SPUISearchViewController *)self updateHeaderViewsWithBlock:v69];
  uint64_t v49 = [v8 displayedText];
  uint64_t v50 = [(SPUIViewController *)self searchResultViewController];
  [v50 setQueryString:v49];

  uint64_t v51 = [v8 queryKind];
  if (+[SPUISearchViewController shouldShowAsTypedSuggestion])
  {
    BOOL v63 = (unint64_t)(v51 - 1) < 2;
    [(SPUIViewController *)self searchResultViewController];
    long long v52 = v66 = self;
    long long v53 = [v8 searchString];
    v64 = [v8 searchEntities];
    long long v54 = [v64 firstObject];
    [(SPUISearchViewController *)v66 searchHeader];
    objc_super v55 = v65 = v46;
    id v56 = v48;
    v57 = v37;
    uint64_t v58 = [v55 queryId];
    [v8 keyboardLanguage];
    v60 = id v59 = v47;
    uint64_t v61 = v58;
    v37 = v57;
    id v48 = v56;
    [v52 searchUpdatedWithString:v53 tokenEntity:v54 queryId:v61 wantsCompletions:v63 keyboardLanguage:v60];

    id v47 = v59;
    id v46 = v65;

    v38 = v68;
    self = v66;
  }
  if (v67)
  {
    v62 = [(SPUISearchViewController *)self navigationController];
    [v62 updateFooterViewsIfNecessary];

    [(SPUISearchViewController *)self activateFirstTimeExperienceViewIfNecessary];
  }
}

void __76__SPUISearchViewController_queryContextDidChange_fromSearchHeader_allowZKW___block_invoke_2(void *a1, void *a2)
{
  if ((void *)a1[4] != a2)
  {
    id v3 = a2;
    [(id)objc_opt_class() _updateHeaderView:v3 fromText:a1[6] fromToken:a1[7]];
  }
}

- (BOOL)optOutOfGoButton
{
  id v2 = [(SPUISearchViewController *)self searchHeader];
  char v3 = [v2 optOutOfGoButton];

  return v3;
}

- (double)contentHeight
{
  char v3 = [(SPUIViewController *)self activeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v5 = [(SPUIViewController *)self activeViewController];
  id v6 = v5;
  if (isKindOfClass)
  {
    [v5 contentSize];
    double v8 = v7;
LABEL_5:

    return v8;
  }
  id v9 = [(SPUISearchViewController *)self firstTimeExperienceViewController];

  double v8 = 0.0;
  if (v6 == v9)
  {
    id v6 = [(SPUISearchViewController *)self firstTimeExperienceViewController];
    [v6 idealContentHeight];
    double v8 = v10;
    goto LABEL_5;
  }
  return v8;
}

- (void)scheduleWindowExpansionWithInterval:(double)a3
{
  id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_expandWindowIfNeeded selector:0 userInfo:0 repeats:a3];
  [(SPUISearchViewController *)self setWindowExpansionTimer:v4];

  id v5 = [(SPUISearchViewController *)self windowExpansionTimer];
  [v5 setTolerance:0.1];
}

- (void)expandWindowIfNeeded
{
  if ([(SPUISearchViewController *)self hasContentInSearchField])
  {
    char v3 = [(SPUIViewController *)self activeViewController];
    id v4 = [(SPUIViewController *)self searchResultViewController];

    if (v3 != v4)
    {
      id v5 = [(SPUIViewController *)self searchResultViewController];
      [v5 invalidateContentHeight];

      id v6 = [(SPUIViewController *)self searchResultViewController];
      [(SPUIViewController *)self activateViewController:v6 animate:0];

      [(SPUISearchViewController *)self setExpandPlatterOnAppear:0];
    }
  }
}

- (id)firstResultIgnoringSuggestionsIfNeeded
{
  id v2 = +[SPUISearchModel sharedGeneralInstance];
  char v3 = [v2 sections];
  id v4 = [v3 firstObject];
  id v5 = [v4 results];
  id v6 = [v5 firstObject];

  return v6;
}

- (BOOL)allowInternet
{
  if (!+[SPUISearchFirstTimeViewController needsDisplay](SPUISearchFirstTimeViewController, "needsDisplay")|| (BOOL v3 = +[SPUISearchFirstTimeViewController hasBeenDisplayed]))
  {
    LOBYTE(v3) = ![(SPUISearchViewController *)self internetOverrideForPPT];
  }
  return v3;
}

- (void)cancelButtonPressed
{
  id v2 = [(SPUIViewController *)self delegate];
  [v2 dismissSearchViewWithReason:1];
}

- (void)didBeginScrollingResults
{
  id v2 = +[SPUISearchModel sharedGeneralInstance];
  [v2 setForceStableResults:1];
}

- (id)searchViewRestorationContext
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  id v4 = [(SPUIViewController *)self activeViewController];
  uint64_t v5 = [(SPUIViewController *)self searchResultViewController];
  if (v4 == (void *)v5)
  {
    id v9 = [(SPUIViewController *)self searchResultViewController];
    uint64_t v7 = [v9 sections];

    if (!v7)
    {
      v26 = 0;
      double v8 = 0;
      goto LABEL_6;
    }
    double v10 = [(SPUIViewController *)self searchResultViewController];
    double v8 = [v10 restorationContext];

    uint64_t v11 = [(SPUISearchViewController *)self lastSearchString];
    [v8 setSearchString:v11];

    id v4 = [(SPUISearchViewController *)self searchHeader];
    id v6 = [v4 searchEntity];
    [v8 setSearchEntity:v6];
  }
  else
  {
    id v6 = (void *)v5;
    uint64_t v7 = 0;
    double v8 = 0;
  }
  v26 = (void *)v7;

LABEL_6:
  v27 = v3;
  [v3 setSearchViewContext:v8];
  unint64_t v12 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = [(SPUISearchViewController *)self navigationController];
  id v14 = [v13 viewControllers];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v15) {
    goto LABEL_21;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v29 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(SPUISearchViewController **)(*((void *)&v28 + 1) + 8 * i);
      if (v19 != self)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v20 = [(SPUISearchViewController *)v19 restorationContext];
          id v21 = [v20 sections];
          uint64_t v22 = [v21 count];

          if (!v22) {
            goto LABEL_18;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          BOOL v20 = [(SPUISearchViewController *)v19 restorationContext];
        }
        [v12 addObject:v20];
LABEL_18:

        continue;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v16);
LABEL_21:

  [v27 setViewControllerContexts:v12];
  [v27 setSearchViewContext:v8];
  [(SPUISearchViewController *)self timeAtDismissal];
  objc_msgSend(v27, "setTimeAtDismissal:");
  v23 = [(SPUISearchViewController *)self searchHeader];
  uint64_t v24 = [v23 searchField];
  objc_msgSend(v27, "setWantsGo:", objc_msgSend(v24, "returnKeyType") == 1);

  return v27;
}

- (BOOL)spotlightIsVisible
{
  id v2 = [(SPUISearchViewController *)self view];
  BOOL v3 = [v2 window];
  id v4 = [v3 windowScene];

  if (v4)
  {
    if ([v4 activationState]) {
      BOOL v5 = [v4 activationState] == 1;
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)presentSpotlightWithCompletionHandler:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  if ([(SPUISearchViewController *)self spotlightIsVisible])
  {
    v5[2]();
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F79460]);
    [v4 requestSpotlightActivation];
    [(SPUISearchViewController *)self setAppIntentsDidLaunchCompletion:v5];
  }
}

- (void)setRestorationData:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SPUISearchFirstTimeViewController)firstTimeExperienceViewController
{
  return (SPUISearchFirstTimeViewController *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setFirstTimeExperienceViewController:(id)a3
{
}

- (BOOL)internetOverrideForPPT
{
  return self->_internetOverrideForPPT;
}

- (void)setInternetOverrideForPPT:(BOOL)a3
{
  self->_internetOverrideForPPT = a3;
}

- (BOOL)lastQueryWasAuthenticated
{
  return self->_lastQueryWasAuthenticated;
}

- (void)setLastQueryWasAuthenticated:(BOOL)a3
{
  self->_lastQueryWasAuthenticated = a3;
}

- (BOOL)clearQueryOnDismissal
{
  return self->_clearQueryOnDismissal;
}

- (void)setExpandPlatterOnAppear:(BOOL)a3
{
  self->_expandPlatterOnAppear = a3;
}

- (unint64_t)feedbackBackgroundTaskIdentifier
{
  return self->_feedbackBackgroundTaskIdentifier;
}

- (void)setFeedbackBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_feedbackBackgroundTaskIdentifier = a3;
}

- (void)setQueryOnDismissal:(id)a3
{
}

- (SUIAppIntentsQueryHelper)appIntentsQueryHelper
{
  return self->_appIntentsQueryHelper;
}

- (void)setAppIntentsQueryHelper:(id)a3
{
}

- (id)appIntentsDidLaunchCompletion
{
  return self->_appIntentsDidLaunchCompletion;
}

- (void)setAppIntentsDidLaunchCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_storeStrong(&self->_appIntentsDidLaunchCompletion, 0);
  objc_storeStrong((id *)&self->_appIntentsQueryHelper, 0);
  objc_storeStrong((id *)&self->_factorsFetchingQueue, 0);
  objc_storeStrong((id *)&self->_queryOnDismissal, 0);
  objc_storeStrong((id *)&self->_windowExpansionTimer, 0);
  objc_storeStrong((id *)&self->_testingHelper, 0);
  objc_storeStrong((id *)&self->_proactiveResultViewController, 0);
  objc_storeStrong((id *)&self->_firstTimeExperienceViewController, 0);
  objc_storeStrong((id *)&self->_allHeaderViews, 0);
  objc_storeStrong((id *)&self->_searchHeader, 0);
  objc_destroyWeak((id *)&self->_topBlurView);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_restorationData, 0);
}

- (void)createAdditionalHeaderView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D2E6000, v0, v1, "more than one search token was found in the search header when we only support one at a time", v2, v3, v4, v5, v6);
}

- (void)searchViewWillPresentFromSource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D2E6000, a2, OS_LOG_TYPE_ERROR, "Failed to unpack restoration with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)searchViewDidPresentFromSource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_23D2E6000, v0, OS_LOG_TYPE_FAULT, "StoreKit didnt dismiss", v1, 2u);
}

void __50__SPUISearchViewController_spotlightDidBackground__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D2E6000, v0, v1, "Feedback failed to send in time", v2, v3, v4, v5, v6);
}

void __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D2E6000, v0, v1, "[FTE] Got nil length parameters", v2, v3, v4, v5, v6);
}

@end