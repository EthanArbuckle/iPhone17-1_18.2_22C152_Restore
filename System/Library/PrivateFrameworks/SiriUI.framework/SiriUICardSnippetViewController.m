@interface SiriUICardSnippetViewController
+ (void)initialize;
- (BOOL)cardLoader:(id)a3 loadCard:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)cardLoader:(id)a3 shouldLoadCard:(id)a4;
- (BOOL)isInAmbient;
- (BOOL)isIndicatingActivity;
- (BOOL)isNavigating;
- (BOOL)isPresentedWithSmartDialogText;
- (BOOL)logContentsIfApplicable;
- (BOOL)performBeganEditingCommand:(id)a3 forCardViewController:(id)a4;
- (BOOL)performFinishedEditingCommand:(id)a3 forCardViewController:(id)a4;
- (BOOL)performInvocationPayloadCommand:(id)a3 forCardViewController:(id)a4;
- (BOOL)performNextCardCommand:(id)a3 forCardViewController:(id)a4;
- (BOOL)performPunchoutCommand:(id)a3 forCardViewController:(id)a4;
- (BOOL)performReferentialCommand:(id)a3 forCardViewController:(id)a4;
- (BOOL)usePlatterStyle;
- (CGSize)cardViewController:(id)a3 boundingSizeForCardSectionViewController:(id)a4;
- (CRKCardPresentation)_cardPresentation;
- (CRKCardViewControlling)_cardViewController;
- (Class)transparentHeaderViewClass;
- (SiriUICardSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIEdgeInsets)defaultViewInsets;
- (double)boundingWidthForPresentation:(id)a3;
- (double)desiredHeight;
- (double)desiredHeightForTransparentHeaderView;
- (double)preferredContentHeight;
- (id)_analytics;
- (id)_instrumentationManager;
- (id)_metricsContextOfEventsForCard:(id)a3;
- (id)_metricsContextOfEventsForCardSection:(id)a3 inCard:(id)a4;
- (id)localeForCardSnippetView:(id)a3;
- (id)requestContext;
- (id)snippet;
- (unint64_t)navigationIndexOfCardViewController:(id)a3;
- (void)_addCardViewControllerAsChildViewController:(id)a3;
- (void)_addNextCardTo:(id)a3 fullCard:(id)a4;
- (void)_beginMonitoringForNextCardWithBlock:(id)a3;
- (void)_emitInstrumentationEvent:(id)a3 requiresNewTurn:(BOOL)a4;
- (void)_emitInstrumentationEventForKeyboardInvocation;
- (void)_emitInstrumentationEventWithInvocationSource:(int)a3;
- (void)_forwardProgressEvent:(unint64_t)a3 toCardViewController:(id)a4 animated:(BOOL)a5;
- (void)_forwardProgressEventToCardViewController:(unint64_t)a3;
- (void)_insertCardViewController:(id)a3;
- (void)_inspectPayloadForMetricsEvents:(id)a3;
- (void)_instrumentCardSectionInteractionForCardSection:(id)a3 previousTurn:(id)a4;
- (void)_logCardRelationshipIdentifiedForCompactCard:(id)a3 fullCard:(id)a4 snippet:(id)a5;
- (void)_navigationButtonTapped:(id)a3;
- (void)_removeBottomKeylineFromCard:(id)a3;
- (void)_removeCardViewControllerFromParentViewController:(id)a3;
- (void)_removeShouldHideInAmbientSectionsFromCurrentCard;
- (void)_setCardPresentation:(id)a3;
- (void)_setCardViewController:(id)a3;
- (void)_updateContentSizeAndNotifyDelegateIfNecessary:(BOOL)a3;
- (void)_validateCardForParsecFeedbackDelivery:(id)a3 validHandler:(id)a4;
- (void)_validateCardSectionForParsecFeedbackDelivery:(id)a3 validHandler:(id)a4;
- (void)backgroundColorView:(id)a3 didFinishColorUpdate:(id)a4;
- (void)cardLoadingMonitor:(id)a3 didReceiveCardSnippet:(id)a4;
- (void)cardLoadingMonitor:(id)a3 didReceiveVisualResponseSnippet:(id)a4;
- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4;
- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardSnippetViewSashWasTapped:(id)a3;
- (void)cardViewController:(id)a3 requestsHandlingOfIntent:(id)a4;
- (void)cardViewController:(id)a3 willDismissViewController:(id)a4;
- (void)cardViewControllerBoundsDidChange:(id)a3;
- (void)cardViewControllerDidLoad:(id)a3;
- (void)cardViewDidAppearForCard:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardViewDidDisappearForCard:(id)a3 withDisappearanceFeedback:(id)a4;
- (void)cardViewWillAppearForCard:(id)a3 withAppearanceFeedback:(id)a4;
- (void)commandWasPerformed:(id)a3;
- (void)configureContentWithSizeClass:(int64_t)a3;
- (void)configureReusableTransparentHeaderView:(id)a3;
- (void)controllerForCard:(id)a3 didReceiveAsyncCard:(id)a4 withAsyncCardReceiptFeedback:(id)a5;
- (void)controllerForCard:(id)a3 didRequestAsyncCard:(id)a4 withAsyncCardRequestFeedback:(id)a5;
- (void)loadView;
- (void)modalContainerViewControllerViewDidDisappear:(id)a3;
- (void)modalContainerViewControllerViewWillDisappear:(id)a3;
- (void)presentViewController:(id)a3 forCardViewController:(id)a4;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setIsPresentedWithSmartDialogText:(BOOL)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setSnippet:(id)a3;
- (void)siriDidDeactivate;
- (void)siriDidReceiveViewsWithDialogPhase:(id)a3;
- (void)siriDidScrollVisible:(BOOL)a3;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidTapOutsideContent;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriWillBeginScrolling;
- (void)siriWillStartRequest;
- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4;
- (void)userDidReportFeedback:(id)a3 fromCardSection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wasAddedToTranscript;
- (void)willCancel;
- (void)willConfirm;
@end

@implementation SiriUICardSnippetViewController

+ (void)initialize
{
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___SiriUICardSnippetViewController;
  objc_msgSendSuper2(&v17, sel_initialize);
  +[CRKCardSectionViewController registerCardSectionViewController];
  v2 = [MEMORY[0x263F31610] appearance];
  v3 = objc_msgSend(MEMORY[0x263F1C550], "siriui_highlightColor");
  [v2 setBackgroundColor:v3 forState:1];

  v4 = [MEMORY[0x263F31610] appearance];
  v5 = objc_msgSend(MEMORY[0x263F1C550], "siriui_highlightColor");
  [v4 setBackgroundColor:v5 forState:4];

  v6 = [MEMORY[0x263F31610] appearance];
  v7 = objc_msgSend(MEMORY[0x263F1C550], "siriui_highlightColor");
  [v6 setBackgroundColor:v7 forState:5];

  v8 = [MEMORY[0x263F41BF0] feedbackListenerForParsec];
  SFFeedbackListenerRegister();

  v9 = [MEMORY[0x263F36D68] sharedSession];
  SFFeedbackListenerRegister();

  v10 = +[SiriUICardProviderRegistry sharedInstance];
  [v10 loadProviders];

  v11 = (void *)MEMORY[0x263F31618];
  id v12 = objc_alloc_init(MEMORY[0x263F28268]);
  [v11 registerService:v12];

  v13 = (void *)MEMORY[0x263F31618];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v14 = (void *)getAPUICardServiceClass_softClass;
  uint64_t v22 = getAPUICardServiceClass_softClass;
  if (!getAPUICardServiceClass_softClass)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getAPUICardServiceClass_block_invoke;
    v18[3] = &unk_26469F170;
    v18[4] = &v19;
    __getAPUICardServiceClass_block_invoke((uint64_t)v18);
    v14 = (void *)v20[3];
  }
  v15 = v14;
  _Block_object_dispose(&v19, 8);
  id v16 = objc_alloc_init(v15);
  [v13 registerService:v16];
}

- (SiriUICardSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUICardSnippetViewController;
  v4 = [(SiriUISnippetViewController *)&v13 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(SiriUISnippetViewController *)v4 setLoading:1];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    referenceableCommandsByIdentifierMap = v5->_referenceableCommandsByIdentifierMap;
    v5->_referenceableCommandsByIdentifierMap = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    referenceableSnippetsByIdentifierMap = v5->_referenceableSnippetsByIdentifierMap;
    v5->_referenceableSnippetsByIdentifierMap = v8;

    v10 = (SRUIFCardLoader *)objc_alloc_init(MEMORY[0x263F75490]);
    cardLoader = v5->_cardLoader;
    v5->_cardLoader = v10;

    [(SRUIFCardLoader *)v5->_cardLoader setDelegate:v5];
    [(SRUIFCardLoader *)v5->_cardLoader setActive:1];
    v5->_sizeClass = 0;
  }
  return v5;
}

- (void)loadView
{
  v5 = objc_alloc_init(SiriUICardSnippetView);
  [(SiriUICardSnippetView *)v5 setBackingViewController:self];
  [(SiriUICardSnippetView *)v5 setDataSource:self];
  [(SiriUICardSnippetView *)v5 setDelegate:self];
  [(SiriUICardSnippetViewController *)self setView:v5];
  if (![(SiriUISnippetViewController *)self isLoading] && self->_cardViewController)
  {
    getSearchUICardViewControllerClass();
    if (objc_opt_isKindOfClass()) {
      [(CRKCardViewControlling *)self->_cardViewController setThreeDTouchEnabled:0];
    }
    v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [(SiriUICardSnippetViewController *)self _addCardViewControllerAsChildViewController:v3];

    v4 = [(SiriUICardSnippetViewController *)self view];
    [v4 reloadData];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUICardSnippetViewController;
  [(SiriUICardSnippetViewController *)&v5 viewDidLoad];
  v3 = [(SiriUICardSnippetViewController *)self view];
  v4 = [v3 backNavigationButton];
  [v4 addTarget:self action:sel__navigationButtonTapped_ forControlEvents:64];
}

- (void)backgroundColorView:(id)a3 didFinishColorUpdate:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[SiriUICardSnippetViewController backgroundColorView:didFinishColorUpdate:]";
    __int16 v10 = 1024;
    BOOL v11 = v5 != 0;
    _os_log_impl(&dword_2231EF000, v6, OS_LOG_TYPE_DEFAULT, "%s #background SearchUI color update successful %d", (uint8_t *)&v8, 0x12u);
  }
  v7 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v7 siriSnippetViewController:self isBackgroundColorUpdateSuccessful:v5 != 0];
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_isInAmbient = a3;
  cardViewController = self->_cardViewController;
  if (a3)
  {
    v6 = cardViewController;
    getSearchUICardViewControllerClass();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    v7 = v6;
    uint64_t v8 = 0;
  }
  else
  {
    [(CRKCardViewControlling *)cardViewController setCard:self->_originalCard];
    v6 = self->_cardViewController;
    getSearchUICardViewControllerClass();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    v7 = v6;
    uint64_t v8 = 1;
  }
  [(CRKCardViewControlling *)v7 setRowSelectionAppearanceEnabled:v8];
LABEL_8:

  v9 = [(SiriUICardSnippetViewController *)self view];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(SiriUICardSnippetViewController *)self view];
    [v11 setIsInAmbient:v3];
  }
}

- (void)_removeShouldHideInAmbientSectionsFromCurrentCard
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  getSearchUICardViewControllerClass();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = self->_cardViewController;
    v4 = [(CRKCardViewControlling *)v3 card];
    id v5 = [v4 cardSections];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = (void *)[v4 copy];
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v9 = [v4 cardSections];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v19 = v7;
        v20 = v3;
        char v12 = 0;
        uint64_t v13 = *(void *)v22;
        v14 = (os_log_t *)MEMORY[0x263F28348];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v9);
            }
            id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v16 shouldHideInAmbientMode])
            {
              objc_super v17 = *v14;
              if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v26 = "-[SiriUICardSnippetViewController _removeShouldHideInAmbientSectionsFromCurrentCard]";
                _os_log_impl(&dword_2231EF000, v17, OS_LOG_TYPE_DEFAULT, "%s #ambient - In ambient mode and found a shouldHideInAmbientMode card section", buf, 0xCu);
              }
              char v12 = 1;
            }
            else
            {
              [v8 addObject:v16];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v11);

        BOOL v3 = v20;
        v18 = v4;
        v7 = v19;
        if (v12)
        {
          [v19 setCardSections:v8];
          v18 = v19;
        }
      }
      else
      {

        v18 = v4;
      }
      [(CRKCardViewControlling *)v3 setCard:v18];
    }
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SiriUICardSnippetViewController *)self view];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SiriUICardSnippetViewController *)self view];
    [v7 setIsInAmbientInteractivity:v3];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__SiriUICardSnippetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_26469F298;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:0 completion:v9];
  v8.receiver = self;
  v8.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUICardSnippetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __86__SiriUICardSnippetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentSizeAndNotifyDelegateIfNecessary:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUICardSnippetViewController;
  [(SiriUISnippetViewController *)&v10 viewDidAppear:a3];
  [(SiriUICardSnippetViewController *)self _updateContentSizeAndNotifyDelegateIfNecessary:1];
  presentedModalContainerViewController = self->_presentedModalContainerViewController;
  if (presentedModalContainerViewController)
  {
    id v5 = [(SiriUIModalContainerViewController *)presentedModalContainerViewController contentViewController];
    int v6 = objc_msgSend(v5, "siriui_shouldHideStatusBar");

    if (v6)
    {
      id v7 = [(SiriUIBaseSnippetViewController *)self delegate];
      [v7 siriSnippetViewController:self setStatusBarHidden:0 animated:1];
    }
    objc_super v8 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v8 siriSnippetViewController:self setStatusViewHidden:0];

    v9 = self->_presentedModalContainerViewController;
    self->_presentedModalContainerViewController = 0;
  }
  if (self->_isCardViewControllerLoading) {
    [(SiriUISnippetViewController *)self setUserConfirmationEnabled:0];
  }
}

- (void)configureContentWithSizeClass:(int64_t)a3
{
  if (self->_sizeClass != a3) {
    self->_sizeClass = a3;
  }
}

- (void)_addNextCardTo:(id)a3 fullCard:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 cardSections];
  if (![v8 count])
  {
LABEL_20:

    goto LABEL_21;
  }
  if ([v7 type] == 2)
  {

LABEL_5:
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = objc_msgSend(v6, "cardSections", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_super v17 = [v16 nextCard];

          if (v17)
          {
            uint64_t v19 = [v16 nextCard];
            v20 = [v19 backingCard];

            long long v21 = [v7 backingCard];
            if (objc_msgSend(v20, "afui_hasContentEqualTo:", v21))
            {
              long long v22 = [v6 backingCard];
              long long v23 = [v7 backingCard];
              [(SiriUICardSnippetViewController *)self _logCardRelationshipIdentifiedForCompactCard:v22 fullCard:v23 snippet:self->_snippet];
            }
            char v18 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    char v18 = 0;
LABEL_17:

    long long v24 = [v6 cardSections];
    objc_super v8 = [v24 firstObject];

    if ((v18 & 1) == 0)
    {
      v25 = [v8 punchoutOptions];

      if (!v25)
      {
        [v8 setNextCard:v7];
        v26 = [v6 backingCard];
        v27 = [v7 backingCard];
        [(SiriUICardSnippetViewController *)self _logCardRelationshipIdentifiedForCompactCard:v26 fullCard:v27 snippet:self->_snippet];
      }
    }
    goto LABEL_20;
  }
  v9 = [v7 cardSections];
  uint64_t v10 = [v9 count];

  if (v10) {
    goto LABEL_5;
  }
LABEL_21:
}

- (void)_removeBottomKeylineFromCard:(id)a3
{
  id v7 = a3;
  BOOL v3 = [v7 cardSections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [v7 cardSections];
    id v6 = [v5 lastObject];

    [v6 setSeparatorStyle:1];
  }
}

- (void)setSnippet:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v5 = (SACardSnippet *)a3;
  p_snippet = &self->_snippet;
  snippet = self->_snippet;
  if (snippet != v5 && ([(SACardSnippet *)snippet isEqual:v5] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = v5;
      objc_storeStrong((id *)&self->_snippet, a3);
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      objc_super v8 = [(SACardSnippet *)*p_snippet referencedCommands];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v65 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            referenceableCommandsByIdentifierMap = self->_referenceableCommandsByIdentifierMap;
            uint64_t v14 = [v12 aceId];
            [(NSMutableDictionary *)referenceableCommandsByIdentifierMap setObject:v12 forKey:v14];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v73 count:16];
        }
        while (v9);
      }

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v15 = [(SACardSnippet *)*p_snippet referencedSnippets];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v72 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v61 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            referenceableSnippetsByIdentifierMap = self->_referenceableSnippetsByIdentifierMap;
            long long v21 = [v19 aceId];
            [(NSMutableDictionary *)referenceableSnippetsByIdentifierMap setObject:v19 forKey:v21];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v72 count:16];
        }
        while (v16);
      }

      long long v22 = [MEMORY[0x263F285A0] sharedPreferences];
      int v23 = [v22 cardLoggingEnabled];

      if (v23) {
        [(SiriUICardSnippetViewController *)self logContentsIfApplicable];
      }
      long long v24 = (CRKCardPresentation *)objc_alloc_init(MEMORY[0x263F315E8]);
      cardPresentation = self->_cardPresentation;
      self->_cardPresentation = v24;

      [(CRKCardPresentation *)self->_cardPresentation setDelegate:self];
      v26 = [(SACardSnippet *)*p_snippet siriui_card];
      v27 = [v26 interactions];
      v54 = [v27 anyObject];

      v53 = [v54 intent];
      objc_opt_class();
      unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
      long long v28 = [(SACardSnippet *)*p_snippet siriui_card_compact];
      long long v29 = [v26 backingCard];
      originalCard = self->_originalCard;
      self->_originalCard = v29;

      long long v31 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
      v32 = [v26 backingCard];
      uint64_t v33 = [v32 cardId];
      v34 = [(SACardSnippet *)*p_snippet aceId];
      [v31 storeCardID:v33 forSnippetAceID:v34];

      if (self->_sizeClass != 1
        || ([v28 backingCard],
            v35 = objc_claimAutoreleasedReturnValue(),
            [v35 cardSections],
            v36 = objc_claimAutoreleasedReturnValue(),
            BOOL v37 = v36 == 0,
            v36,
            v35,
            v37))
      {
        id v41 = v26;
      }
      else
      {
        v38 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v69 = "-[SiriUICardSnippetViewController setSnippet:]";
          __int16 v70 = 2112;
          v71 = v28;
          _os_log_impl(&dword_2231EF000, v38, OS_LOG_TYPE_DEFAULT, "%s Compact card exists and our size class is compact. Presenting compact card : %@", buf, 0x16u);
        }
        v39 = [v28 backingCard];
        v40 = [v26 backingCard];
        [(SiriUICardSnippetViewController *)self _addNextCardTo:v39 fullCard:v40];

        id v41 = v28;
        v42 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
        v43 = [v41 backingCard];
        v44 = [v43 cardId];
        v45 = [(SACardSnippet *)*p_snippet aceId];
        [v42 storeCardID:v44 forSnippetAceID:v45];
      }
      v46 = [v41 backingCard];
      [(SiriUICardSnippetViewController *)self _removeBottomKeylineFromCard:v46];

      v47 = (void *)[objc_alloc(MEMORY[0x263F315F0]) initWithCard:v41];
      [v47 setLoadsBundleProviders:0];
      v48 = [v47 cardRequest];
      [v48 setLoadsBundleServices:0];

      [v47 setRespectsUserConsent:(isKindOfClass ^ 1) & 1];
      self->_isCardViewControllerLoading = 1;
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, self->_cardPresentation);
      v49 = self->_cardPresentation;
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __46__SiriUICardSnippetViewController_setSnippet___block_invoke;
      v55[3] = &unk_26469F2C0;
      objc_copyWeak(&v57, (id *)buf);
      objc_copyWeak(&v58, &location);
      id v50 = v41;
      id v56 = v50;
      [(CRKCardPresentation *)v49 setConfiguration:v47 animated:0 completion:v55];

      objc_destroyWeak(&v58);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      id v5 = v52;
    }
  }
}

void __46__SiriUICardSnippetViewController_setSnippet___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v6 = objc_loadWeakRetained(a1 + 6);
  id v7 = v6;
  if (!WeakRetained || !v6) {
    goto LABEL_26;
  }
  if (v4)
  {
    objc_super v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __46__SiriUICardSnippetViewController_setSnippet___block_invoke_cold_1((uint64_t)v4, (uint64_t)a1, v8);
    }
    goto LABEL_26;
  }
  uint64_t v9 = [v6 cardViewController];
  uint64_t v10 = [a1[4] interactions];
  uint64_t v11 = [v10 anyObject];

  getSearchUICardViewControllerClass();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    if ([WeakRetained isInAmbient]) {
      [v12 setRowSelectionAppearanceEnabled:0];
    }
    uint64_t v13 = [v12 card];
    uint64_t v14 = [v13 cardSections];
    uint64_t v15 = [v14 count];

    if (!v15)
    {

      goto LABEL_26;
    }
    if ([WeakRetained isInAmbient]) {
      goto LABEL_17;
    }
    id v16 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [v13 backgroundColor];

      if (!v17)
      {
LABEL_17:

        goto LABEL_18;
      }
      [v12 setShouldDrawBackgroundColor:0];
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2050000000;
      char v18 = (void *)getSearchUIBackgroundColorViewClass_softClass;
      uint64_t v44 = getSearchUIBackgroundColorViewClass_softClass;
      if (!getSearchUIBackgroundColorViewClass_softClass)
      {
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __getSearchUIBackgroundColorViewClass_block_invoke;
        v40[3] = &unk_26469F170;
        v40[4] = &v41;
        __getSearchUIBackgroundColorViewClass_block_invoke((uint64_t)v40);
        char v18 = (void *)v42[3];
      }
      uint64_t v19 = v18;
      _Block_object_dispose(&v41, 8);
      id v16 = objc_alloc_init(v19);
      [v16 updateWithSFCard:v13];
      [v16 setDelegate:WeakRetained];
      v20 = [WeakRetained delegate];
      [v20 siriSnippetViewController:WeakRetained informHostOfBackgroundView:v16 isSnippetAsyncColored:1];
    }
    goto LABEL_17;
  }
LABEL_18:
  long long v21 = [v11 intent];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v22 = [v11 intent];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v32 = [v11 intent];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        v34 = [v11 intent];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char isKindOfClass = 1;
        }
        else
        {
          uint64_t v35 = [v11 intent];
          objc_opt_class();
          v39 = (void *)v35;
          if (objc_opt_isKindOfClass())
          {
            char isKindOfClass = 1;
          }
          else
          {
            v38 = [v11 intent];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
          }
        }
      }
      if (v11 && (isKindOfClass & 1) == 0)
      {
        switch([v11 intentHandlingStatus])
        {
          case 0:
          case 1:
          case 5:
          case 6:
            uint64_t v36 = 0;
            uint64_t v37 = 4;
            break;
          case 2:
            uint64_t v37 = 0;
            uint64_t v36 = 1;
            break;
          case 3:
            uint64_t v36 = 0;
            uint64_t v37 = 2;
            break;
          case 4:
            uint64_t v36 = 0;
            uint64_t v37 = 3;
            break;
          default:
            uint64_t v36 = 0;
            uint64_t v37 = 0;
            break;
        }
        [WeakRetained _forwardProgressEvent:v37 toCardViewController:v9 animated:0];
        [WeakRetained _setAwaitingSuccessOrFailureEvent:v36];
      }
      goto LABEL_22;
    }
  }
LABEL_22:
  [WeakRetained _setCardViewController:v9];
  [WeakRetained setLoading:0];
  [WeakRetained _addCardViewControllerAsChildViewController:v9];
  int v23 = [WeakRetained view];
  [v23 reloadData];

  int v24 = [MEMORY[0x263F286B8] isSAEEnabled];
  v25 = [v9 view];
  v26 = [WeakRetained view];
  [v26 bounds];
  double Width = CGRectGetWidth(v45);
  if (v24)
  {
    [v9 preferredContentSize];
    double v29 = v28;
  }
  else
  {
    double v29 = 1000.0;
  }
  objc_msgSend(v25, "setFrame:", 0.0, 0.0, Width, v29);

  long long v30 = [v9 view];
  [v30 layoutBelowIfNeeded];

  [WeakRetained _updateContentSizeAndNotifyDelegateIfNecessary:1];
  long long v31 = [WeakRetained delegate];
  [v31 siriSnippetViewControllerViewDidLoad:WeakRetained];

LABEL_26:
}

- (UIEdgeInsets)defaultViewInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (double)desiredHeight
{
  p_contentSize = &self->_contentSize;
  double result = self->_contentSize.height;
  if (self->_contentSize.width == *MEMORY[0x263F001B0] && result == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    -[SiriUICardSnippetViewController _updateContentSizeAndNotifyDelegateIfNecessary:](self, "_updateContentSizeAndNotifyDelegateIfNecessary:", 0, result);
    return p_contentSize->height;
  }
  return result;
}

- (BOOL)isIndicatingActivity
{
  return 0;
}

- (BOOL)logContentsIfApplicable
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v3 = [(SACardSnippet *)self->_snippet siriui_card];
  double v4 = [(SACardSnippet *)self->_snippet siriui_card_compact];
  double v5 = v4;
  if (self->_sizeClass == 1)
  {
    id v6 = [v4 backingCard];
    id v7 = [v6 cardSections];

    if (v7)
    {
      id v8 = v5;

      double v3 = v8;
    }
  }
  uint64_t v9 = +[SiriUICardLogger logCard:v3 format:0];
  uint64_t v10 = (NSObject **)MEMORY[0x263F28348];
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      snippet = self->_snippet;
      int v17 = 136316162;
      char v18 = "-[SiriUICardSnippetViewController logContentsIfApplicable]";
      __int16 v19 = 2112;
      v20 = v3;
      __int16 v21 = 2112;
      long long v22 = self;
      __int16 v23 = 2112;
      int v24 = snippet;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_2231EF000, v11, OS_LOG_TYPE_DEFAULT, "%s #cards Logged card for CardSnippetViewController\n    Card: %@\n    SnippetViewController: %@\n    Snippet: %@\n    Filename: %@", (uint8_t *)&v17, 0x34u);
    }
  }
  uint64_t v13 = +[SiriUICardLogger logCard:v3 format:3];
  if (v13)
  {
    uint64_t v14 = *v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = self->_snippet;
      int v17 = 136316162;
      char v18 = "-[SiriUICardSnippetViewController logContentsIfApplicable]";
      __int16 v19 = 2112;
      v20 = v3;
      __int16 v21 = 2112;
      long long v22 = self;
      __int16 v23 = 2112;
      int v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl(&dword_2231EF000, v14, OS_LOG_TYPE_DEFAULT, "%s #cards Logged card for CardSnippetViewController\n    Card: %@\n    SnippetViewController: %@\n    Snippet: %@\n    Filename: %@", (uint8_t *)&v17, 0x34u);
    }
  }

  return (v9 | v13) != 0;
}

- (id)requestContext
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v3 = [(SACardSnippet *)self->_snippet siriui_card];
  double v4 = [v3 backingCard];
  double v5 = [v4 entityProtobufMessages];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = [(SACardSnippet *)self->_snippet siriui_card];
    id v8 = [v7 backingCard];
    uint64_t v9 = [v8 entityProtobufMessages];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v15 = objc_alloc_init(MEMORY[0x263F64B80]);
          id v16 = [MEMORY[0x263F08C38] UUID];
          int v17 = [v16 UUIDString];
          [v15 setAceId:v17];

          char v18 = [v14 protobufMessageData];
          [v15 setData:v18];

          __int16 v19 = [v14 protobufMessageName];
          [v15 setTypeName:v19];

          [v38 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v20 = [(SACardSnippet *)self->_snippet siriui_card];
    __int16 v21 = [v20 backingCard];
    long long v22 = [v21 entityIdentifier];

    if (!v22) {
      goto LABEL_13;
    }
    id v23 = [NSString alloc];
    int v24 = [(SACardSnippet *)self->_snippet siriui_card];
    __int16 v25 = [v24 backingCard];
    uint64_t v26 = [v25 entityIdentifier];
    uint64_t v27 = (void *)[v23 initWithData:v26 encoding:4];
    uint64_t v9 = [v27 stringByRemovingPercentEncoding];

    id v28 = objc_alloc(MEMORY[0x263F67BD8]);
    double v29 = [NSURL URLWithString:v9];
    long long v30 = (void *)[v28 initWithNSURL:v29];

    id v31 = objc_alloc_init(MEMORY[0x263F64B80]);
    v32 = [MEMORY[0x263F08C38] UUID];
    uint64_t v33 = [v32 UUIDString];
    [v31 setAceId:v33];

    v34 = [v30 data];
    [v31 setData:v34];

    uint64_t v35 = objc_msgSend(v30, "_siriui_protobufTypeName");
    [v31 setTypeName:v35];

    [v38 addObject:v31];
  }

LABEL_13:
  uint64_t v36 = (void *)[v38 copy];

  return v36;
}

- (void)setNavigating:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUICardSnippetViewController *)self view];
  [v4 setNavigating:v3];
}

- (BOOL)isNavigating
{
  double v2 = [(SiriUICardSnippetViewController *)self view];
  char v3 = [v2 isNavigating];

  return v3;
}

- (void)wasAddedToTranscript
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUICardSnippetViewController;
  [(SiriUIBaseSnippetViewController *)&v6 wasAddedToTranscript];
  if ([(SiriUISnippetViewController *)self isVirgin])
  {
    char v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      double v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
      [v5 cardEventDidOccur:0 withIdentifier:0 userInfo:0];
    }
  }
}

- (void)siriDidDeactivate
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUICardSnippetViewController;
  [(SiriUIBaseSnippetViewController *)&v6 siriDidDeactivate];
  char v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v5 cardEventDidOccur:4 withIdentifier:0 userInfo:0];
  }
}

- (void)willCancel
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUICardSnippetViewController;
  [(SiriUISnippetViewController *)&v6 willCancel];
  char v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v5 cardEventDidOccur:3 withIdentifier:0 userInfo:0];
  }
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v6 cardEventDidOccur:1 withIdentifier:v7 userInfo:0];
  }
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  id v8 = a3;
  char v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v7 cardEventDidOccur:2 withIdentifier:v8 userInfo:0];
  }
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  id v8 = a3;
  char v4 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [NSDictionary dictionaryWithObject:v8 forKey:@"UpdatedRecognition"];
    id v7 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v7 cardEventDidOccur:7 withIdentifier:0 userInfo:v6];
  }
}

- (void)siriWillBeginScrolling
{
  char v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v5 cardEventDidOccur:5 withIdentifier:0 userInfo:0];
  }
}

- (void)siriDidScrollVisible:(BOOL)a3
{
  char v4 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v6 cardEventDidOccur:6 withIdentifier:0 userInfo:0];
  }
}

- (void)siriDidTapOutsideContent
{
  char v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v5 cardEventDidOccur:8 withIdentifier:0 userInfo:0];
  }
}

- (void)siriWillStartRequest
{
  char v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
    [v5 cardEventDidOccur:9 withIdentifier:0 userInfo:0];
  }
}

- (void)siriDidReceiveViewsWithDialogPhase:(id)a3
{
  id v9 = a3;
  if ([(SiriUISnippetViewController *)self _isAwaitingSuccessOrFailureEvent])
  {
    char v4 = [(SiriUICardSnippetViewController *)self _cardViewController];
    id v5 = [v4 card];
    id v6 = [v5 interactions];
    id v7 = [v6 anyObject];

    if (v7)
    {
      if (([v9 isCompletionDialogPhase] & 1) != 0
        || [v9 isConfirmedDialogPhase])
      {
        if ([v9 isConfirmedDialogPhase]) {
          [(SiriUISnippetViewController *)self setConfirmed:1];
        }
        uint64_t v8 = 2;
LABEL_13:
        [(SiriUICardSnippetViewController *)self _forwardProgressEventToCardViewController:v8];
        [(SiriUISnippetViewController *)self _setAwaitingSuccessOrFailureEvent:0];
        goto LABEL_14;
      }
      if (([v9 isErrorDialogPhase] & 1) != 0 || objc_msgSend(v9, "isCancelledDialogPhase"))
      {
        if ([v9 isCancelledDialogPhase]) {
          [(SiriUISnippetViewController *)self setCancelled:1];
        }
        uint64_t v8 = 3;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
}

- (void)_setCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardViewController, a3);
  if (self->_isInAmbient) {
    [(SiriUICardSnippetViewController *)self _removeShouldHideInAmbientSectionsFromCurrentCard];
  }
  [(SiriUISnippetViewController *)self setLoading:0];
}

- (void)_removeCardViewControllerFromParentViewController:(id)a3
{
  id v5 = a3;
  char v3 = [v5 parentViewController];

  if (v3)
  {
    [v5 didMoveToParentViewController:0];
    char v4 = [v5 view];
    [v4 removeFromSuperview];

    [v5 removeFromParentViewController];
  }
}

- (void)_addCardViewControllerAsChildViewController:(id)a3
{
  id v8 = a3;
  char v4 = [(SiriUICardSnippetViewController *)self childViewControllers];
  char v5 = [v4 containsObject:v8];

  if ((v5 & 1) == 0)
  {
    [(SiriUICardSnippetViewController *)self _removeCardViewControllerFromParentViewController:self->_cardViewController];
    [(SiriUICardSnippetViewController *)self addChildViewController:v8];
    id v6 = [v8 view];
    id v7 = [(SiriUICardSnippetViewController *)self view];
    [v7 setCardView:v6];

    [v8 didMoveToParentViewController:self];
  }
}

- (void)_updateContentSizeAndNotifyDelegateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  p_contentSize = &self->_contentSize;
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  id v8 = [(SiriUICardSnippetViewController *)self view];
  id v9 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v9 siriViewControllerExpectedWidth:self];
  objc_msgSend(v8, "sizeThatFits:", v10 + 8.0 + 8.0, 1.79769313e308);
  p_contentSize->double width = v11;
  p_contentSize->double height = v12;

  if (v3 && (width != p_contentSize->width || height != p_contentSize->height))
  {
    id v14 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v14 siriViewControllerHeightDidChange:self];
  }
}

- (void)_beginMonitoringForNextCardWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
  if (self->_isCardLoading)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
  }
  else
  {
    self->_isCardLoading = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
    char v5 = [MEMORY[0x263F75498] sharedInstance];
    [v5 addObserver:self];

    id v6 = (void *)MEMORY[0x223CB13F0](v4);
    id cardLoadingCompletionhandler = self->_cardLoadingCompletionhandler;
    self->_id cardLoadingCompletionhandler = v6;

    objc_initWeak(&location, self);
    id v8 = (void *)MEMORY[0x263EFFA20];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke;
    v11[3] = &unk_26469F2E8;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    id v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v11 block:10.0];
    cardLoadingTimer = self->_cardLoadingTimer;
    self->_cardLoadingTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = [MEMORY[0x263F75498] sharedInstance];
    [v3 removeObserver:*(void *)(a1 + 32)];

    uint64_t v4 = WeakRetained[155];
    if (v4)
    {
      char v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F31628] code:401 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);

      id v6 = (void *)WeakRetained[155];
      WeakRetained[155] = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
    *((unsigned char *)WeakRetained + 1256) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke_cold_1(v7);
    }
  }
}

- (void)_validateCardForParsecFeedbackDelivery:(id)a3 validHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(CRKCardViewControlling *)self->_cardViewController card];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 backingCard];
  }
  else
  {
    id v9 = 0;
  }
  double v10 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v11 = v10;
    int v13 = 136315394;
    id v14 = "-[SiriUICardSnippetViewController _validateCardForParsecFeedbackDelivery:validHandler:]";
    __int16 v15 = 1024;
    int v16 = [v9 source];
    _os_log_impl(&dword_2231EF000, v11, OS_LOG_TYPE_DEFAULT, "%s #cards Card source for backing card is %d", (uint8_t *)&v13, 0x12u);
  }
  if (v9)
  {
    if ([v9 source] == 1)
    {
      int v12 = [v8 isEqual:v6];
      if (v7)
      {
        if (v12) {
          v7[2](v7);
        }
      }
    }
  }
}

- (void)_validateCardSectionForParsecFeedbackDelivery:(id)a3 validHandler:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(CRKCardViewControlling *)self->_cardViewController card];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 backingCard];
    id v9 = v8;
    if (v8)
    {
      if ([v8 source] == 1)
      {
        double v10 = [v7 cardSections];
        int v11 = [v10 containsObject:v12];

        if (v6)
        {
          if (v11) {
            v6[2](v6);
          }
        }
      }
    }
  }
  else
  {
    id v9 = 0;
  }
}

- (id)_metricsContextOfEventsForCard:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [v4 cardSections];
  uint64_t v7 = [v6 count];

  id v8 = [NSNumber numberWithUnsignedInteger:v7];
  [v5 setObject:v8 forKey:@"cardSectionCount"];

  id v9 = [(SiriUICardSnippetViewController *)self snippet];
  double v10 = [v9 aceId];

  if (v10) {
    [v5 setObject:v10 forKey:@"snippetAceId"];
  }
  int v11 = [v4 interactions];
  id v12 = [v11 anyObject];
  int v13 = [v12 identifier];

  if (v13) {
    [v5 setObject:v13 forKey:@"interactionId"];
  }
  if (objc_opt_respondsToSelector())
  {
    id v14 = [v4 backingCard];
    if (v14)
    {
      __int16 v15 = v14;
      int v16 = [v14 cardId];
      if (v16) {
        [v5 setObject:v16 forKey:@"cardId"];
      }
      uint64_t v17 = [v15 resultIdentifier];
      if (v17) {
        [v5 setObject:v17 forKey:@"resultId"];
      }
    }
  }
  char v18 = (void *)[v5 copy];

  return v18;
}

- (id)_metricsContextOfEventsForCardSection:(id)a3 inCard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = NSNumber;
  double v10 = [v7 cardSections];
  int v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "indexOfObject:", v6));
  [v8 setObject:v11 forKey:@"ordinalCardSectionPosition"];

  id v12 = [v7 cardSections];
  uint64_t v13 = [v12 count];

  id v14 = [NSNumber numberWithUnsignedInteger:v13];
  [v8 setObject:v14 forKey:@"cardSectionCount"];

  __int16 v15 = [(SiriUICardSnippetViewController *)self snippet];
  int v16 = [v15 aceId];

  if (v16) {
    [v8 setObject:v16 forKey:@"snippetAceId"];
  }
  uint64_t v17 = [v7 interactions];
  char v18 = [v17 anyObject];
  __int16 v19 = [v18 identifier];

  if (v19) {
    [v8 setObject:v19 forKey:@"interactionId"];
  }
  if (objc_opt_respondsToSelector())
  {
    v20 = [v6 backingCardSection];
    if (v20)
    {
      __int16 v21 = v20;
      uint64_t v22 = [v20 cardSectionId];
      if (v22) {
        [v8 setObject:v22 forKey:@"cardSectionId"];
      }
      id v23 = [v21 resultIdentifier];
      if (v23) {
        [v8 setObject:v23 forKey:@"resultId"];
      }
      long long v30 = (void *)v22;
      int v24 = [v21 nextCard];
      __int16 v25 = [v24 cardId];

      if (v25) {
        [v8 setObject:v25 forKey:@"nextCardId"];
      }
      uint64_t v26 = [v21 nextCard];
      uint64_t v27 = [v26 resultIdentifier];

      if (v27) {
        [v8 setObject:v27 forKey:@"nextCardResultId"];
      }
    }
  }
  id v28 = (void *)[v8 copy];

  return v28;
}

- (void)_insertCardViewController:(id)a3
{
  [(SiriUICardSnippetViewController *)self _addCardViewControllerAsChildViewController:a3];
  id v4 = [(SiriUICardSnippetViewController *)self view];
  [v4 reloadData];

  [(SiriUICardSnippetViewController *)self _updateContentSizeAndNotifyDelegateIfNecessary:1];
  id v5 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v5 siriSnippetViewControllerViewDidLoad:self];
}

- (void)willConfirm
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUICardSnippetViewController;
  [(SiriUISnippetViewController *)&v7 willConfirm];
  BOOL v3 = [(SiriUICardSnippetViewController *)self _cardViewController];
  id v4 = [v3 card];
  id v5 = [v4 interactions];
  id v6 = [v5 anyObject];

  if (v6)
  {
    [(SiriUICardSnippetViewController *)self _forwardProgressEventToCardViewController:0];
    [(SiriUISnippetViewController *)self _setAwaitingSuccessOrFailureEvent:1];
  }
}

- (void)_forwardProgressEventToCardViewController:(unint64_t)a3
{
  id v5 = [(SiriUICardSnippetViewController *)self _cardViewController];
  [(SiriUICardSnippetViewController *)self _forwardProgressEvent:a3 toCardViewController:v5 animated:1];
}

- (void)_forwardProgressEvent:(unint64_t)a3 toCardViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F316B8]);
  [v8 setEvent:a3];
  [v8 setAnimatesProgress:v5];
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke;
    v10[3] = &unk_26469F310;
    id v11 = v7;
    [v11 handleCardCommand:v8 reply:v10];
  }
  else
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:]((uint64_t)v7, v9);
    }
  }
}

void __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
}

- (void)_navigationButtonTapped:(id)a3
{
  id v4 = [(SiriUICardSnippetViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (id)localeForCardSnippetView:(id)a3
{
  id v4 = [(SiriUISnippetViewController *)self _privateDelegate];
  id v5 = [v4 localeForSiriViewController:self];

  return v5;
}

- (double)preferredContentHeight
{
  [(CRKCardViewControlling *)self->_cardViewController preferredContentSize];
  return v2;
}

- (void)cardSnippetViewSashWasTapped:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = [(SiriUIBaseSnippetViewController *)self sashItem];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[SiriUICardSnippetViewController cardSnippetViewSashWasTapped:]";
    __int16 v24 = 2112;
    __int16 v25 = v4;
    _os_log_impl(&dword_2231EF000, v5, OS_LOG_TYPE_DEFAULT, "%s #cards Card snippet's sash %@ tapped", buf, 0x16u);
  }
  id v6 = [v4 commands];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(SiriUIBaseSnippetViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    id v10 = [(SiriUIBaseSnippetViewController *)self delegate];
    id v11 = [v4 commands];
    if (v9) {
      [v10 siriSnippetViewController:self performAceCommands:v11 sashItem:v4];
    }
    else {
      [v10 siriViewController:self performAceCommands:v11];
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v12 = [v4 applicationBundleIdentifier];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    int v14 = [v4 canPunchout];

    if (v14)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F64EE0]);
      __int16 v15 = [MEMORY[0x263F08C38] UUID];
      uint64_t v16 = [v15 UUIDString];
      [v10 setAceId:v16];

      [v10 setAppAvailableInStorefront:1];
      uint64_t v17 = [v4 applicationBundleIdentifier];
      [v10 setBundleId:v17];

      char v18 = [(SiriUIBaseSnippetViewController *)self delegate];
      LOBYTE(v16) = objc_opt_respondsToSelector();

      id v11 = [(SiriUIBaseSnippetViewController *)self delegate];
      if (v16)
      {
        id v21 = v10;
        __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
        [v11 siriSnippetViewController:self performAceCommands:v19 sashItem:v4];
      }
      else
      {
        id v20 = v10;
        __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
        [v11 siriViewController:self performAceCommands:v19];
      }

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)cardViewControllerDidLoad:(id)a3
{
  id v4 = a3;
  if ([(SiriUISnippetViewController *)self isLoading])
  {
    [(SiriUISnippetViewController *)self setLoading:0];
    [(SiriUICardSnippetViewController *)self _insertCardViewController:v4];
  }
  self->_isCardViewControllerLoading = 0;
  [(SiriUISnippetViewController *)self setUserConfirmationEnabled:1];
}

- (void)cardViewControllerBoundsDidChange:(id)a3
{
}

- (void)cardViewController:(id)a3 requestsHandlingOfIntent:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__SiriUICardSnippetViewController_cardViewController_requestsHandlingOfIntent___block_invoke;
  block[3] = &unk_26469EFA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __79__SiriUICardSnippetViewController_cardViewController_requestsHandlingOfIntent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmSnippet];
}

- (BOOL)performReferentialCommand:(id)a3 forCardViewController:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[SiriUICardSnippetViewController performReferentialCommand:forCardViewController:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Perform referential command %@", buf, 0x16u);
  }
  char v9 = [v6 referenceIdentifier];
  id v10 = [(NSMutableDictionary *)self->_referenceableCommandsByIdentifierMap objectForKey:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v6 userInfo];
    objc_msgSend(v10, "_siriui_applyUserInfoDictionary:", v11);
  }
  if (v10)
  {
    SRUIFPopulateSendCommandWithInstrumentationTurn();
    uint64_t v12 = [(SiriUIBaseSnippetViewController *)self delegate];
    __int16 v19 = v10;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    [v12 siriViewController:self performAceCommands:v13];
  }
  else
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_referenceableSnippetsByIdentifierMap objectForKey:v9];
    if (!v14)
    {
      BOOL v16 = 0;
      goto LABEL_10;
    }
    uint64_t v12 = (void *)v14;
    uint64_t v13 = [(SiriUIBaseSnippetViewController *)self delegate];
    char v18 = v12;
    __int16 v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v13 siriSnippetViewController:self pushSirilandSnippets:v15];
  }
  BOOL v16 = 1;
LABEL_10:

  return v16;
}

- (BOOL)performNextCardCommand:(id)a3 forCardViewController:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[SiriUICardSnippetViewController performNextCardCommand:forCardViewController:]";
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_2231EF000, v6, OS_LOG_TYPE_DEFAULT, "%s #cards Perform next card command %@", buf, 0x16u);
  }
  id v7 = (objc_class *)MEMORY[0x263F64818];
  id v8 = self->_snippet;
  id v9 = objc_alloc_init(v7);
  id v10 = [MEMORY[0x263F08C38] UUID];
  id v11 = [v10 UUIDString];
  [v9 setAceId:v11];

  uint64_t v12 = (void *)MEMORY[0x263F31690];
  uint64_t v13 = [v5 nextCard];
  uint64_t v14 = [v12 originalDataForCard:v13];
  [v9 setCardData:v14];

  __int16 v15 = [(SACardSnippet *)v8 referencedCommands];
  [v9 setReferencedCommands:v15];

  BOOL v16 = [(SACardSnippet *)v8 referencedSnippets];
  [v9 setReferencedSnippets:v16];

  uint64_t v17 = [(SACardSnippet *)v8 sash];
  [v9 setSash:v17];

  char v18 = [(SiriUIBaseSnippetViewController *)self delegate];
  id v21 = v9;
  __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  [v18 siriSnippetViewController:self pushSirilandSnippets:v19];

  return 1;
}

- (BOOL)performPunchoutCommand:(id)a3 forCardViewController:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v36 = "-[SiriUICardSnippetViewController performPunchoutCommand:forCardViewController:]";
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Perform punch out command %@", buf, 0x16u);
  }
  id v9 = [v6 punchout];
  id v10 = [v9 bundleIdentifier];
  id v11 = [v6 punchout];
  uint64_t v12 = [v11 urls];

  getSearchUICardViewControllerClass();
  if (objc_opt_isKindOfClass()) {
    [v7 setThreeDTouchEnabled:0];
  }
  if (v10)
  {
    id v13 = objc_alloc_init(MEMORY[0x263F64EE0]);
    uint64_t v14 = [MEMORY[0x263F08C38] UUID];
    __int16 v15 = [v14 UUIDString];
    [v13 setAceId:v15];

    [v13 setAppAvailableInStorefront:1];
    [v13 setBundleId:v10];
    if ([v12 count])
    {
      BOOL v16 = [v12 firstObject];
      [v13 setPunchOutUri:v16];
    }
    uint64_t v17 = [(SiriUIBaseSnippetViewController *)self delegate];
    id v34 = v13;
    char v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    [v17 siriViewController:self performAceCommands:v18];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    __int16 v19 = [v6 punchout];
    id v13 = [v19 urls];

    uint64_t v20 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v27 = v9;
      id v28 = v7;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v13);
          }
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v25 = [(SiriUIBaseSnippetViewController *)self delegate];
          [v25 siriViewController:self openURL:v24 completion:0];
        }
        uint64_t v21 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v21);
      id v9 = v27;
      id v7 = v28;
    }
  }

  return 1;
}

- (BOOL)performInvocationPayloadCommand:(id)a3 forCardViewController:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    uint64_t v24 = "-[SiriUICardSnippetViewController performInvocationPayloadCommand:forCardViewController:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Perform invocation payload command %@", (uint8_t *)&v23, 0x16u);
  }
  [(SiriUICardSnippetViewController *)self _inspectPayloadForMetricsEvents:v6];
  id v9 = objc_alloc(MEMORY[0x263F70030]);
  id v10 = [v6 invocationIdentifier];
  id v11 = (void *)[v9 initWithIdentifier:v10];

  uint64_t v12 = [v6 userInfo];
  [v11 setUserData:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F70028]);
  [v13 setInputOrigin:*MEMORY[0x263F65858]];
  [v13 setInteractionType:*MEMORY[0x263F658C8]];
  uint64_t v14 = [MEMORY[0x263F70020] runSiriKitExecutorCommandWithContext:v13 payload:v11];
  __int16 v15 = [MEMORY[0x263F70020] wrapCommandInStartLocalRequest:v14];
  BOOL v16 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  uint64_t v17 = [v16 currentInstrumentationTurnContext];

  char v18 = [(SiriUIBaseSnippetViewController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [(SiriUIBaseSnippetViewController *)self delegate];
    uint64_t v21 = [v17 turnIdentifier];
    [v20 siriSnippetViewController:self handleStartLocalRequest:v15 turnIdentifier:v21];
  }
  return 1;
}

- (void)_inspectPayloadForMetricsEvents:(id)a3
{
  id v4 = [a3 invocationIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F700F0]];

  if (v5)
  {
    [(SiriUICardSnippetViewController *)self _emitInstrumentationEventWithInvocationSource:59];
  }
}

- (BOOL)performBeganEditingCommand:(id)a3 forCardViewController:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[SiriUICardSnippetViewController performBeganEditingCommand:forCardViewController:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2231EF000, v6, OS_LOG_TYPE_DEFAULT, "%s #cards CRBeganEditingCommand received for %@. Hiding status view and alerting our delegate", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v7 siriSnippetViewController:self setStatusViewHidden:1];

  id v8 = [(SiriUISnippetViewController *)self _privateDelegate];
  [v8 siriViewControllerWillBeginEditing:self];

  [(SiriUICardSnippetViewController *)self _emitInstrumentationEventForKeyboardInvocation];
  return 1;
}

- (BOOL)performFinishedEditingCommand:(id)a3 forCardViewController:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[SiriUICardSnippetViewController performFinishedEditingCommand:forCardViewController:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2231EF000, v6, OS_LOG_TYPE_DEFAULT, "%s #cards CRFinishedEditingCommand received for %@. Showing status view and alerting our delegate", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v7 siriSnippetViewController:self setStatusViewHidden:0];

  id v8 = [(SiriUISnippetViewController *)self _privateDelegate];
  [v8 siriViewControllerDidEndEditing:self];

  return 1;
}

- (CGSize)cardViewController:(id)a3 boundingSizeForCardSectionViewController:(id)a4
{
  id v5 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v5 siriViewControllerExpectedWidth:self];
  double v7 = v6 - 8.0 - 8.0;

  double v8 = 1.79769313e308;
  double v9 = v7;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (unint64_t)navigationIndexOfCardViewController:(id)a3
{
  id v4 = [(SiriUIBaseSnippetViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(SiriUIBaseSnippetViewController *)self delegate];
    unint64_t v6 = [v5 navigationIndexOfSnippetViewController:self];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)presentViewController:(id)a3 forCardViewController:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v6 = (SiriUIModalContainerViewController *)a3;
  id v7 = a4;
  double v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v28 = "-[SiriUICardSnippetViewController presentViewController:forCardViewController:]";
    __int16 v29 = 2112;
    long long v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Presenting view controller: %@ for card view controller: %@", buf, 0x20u);
  }
  uint64_t v9 = [(SiriUIModalContainerViewController *)v6 modalPresentationStyle];
  int v10 = 0;
  char v11 = v9 + 2;
  if ((unint64_t)(v9 + 2) > 0xA)
  {
    id v13 = 0;
    goto LABEL_6;
  }
  __int16 v12 = v6;
  if (((1 << v11) & 0x73B) == 0)
  {
    if (((1 << v11) & 0x84) != 0)
    {
      __int16 v12 = [[SiriUIModalContainerViewController alloc] initWithContentViewController:v6];
      [(SiriUIModalContainerViewController *)v12 setDelegate:self];
      BOOL v16 = [(SiriUISnippetViewController *)self _privateDelegate];
      [v16 siriSnippetViewController:self willPresentViewController:v6];

      uint64_t v17 = [(SiriUIBaseSnippetViewController *)self delegate];
      [v17 siriSnippetViewController:self setStatusViewHidden:1];

      if (![(UIViewController *)v6 siriui_shouldHideStatusBar])
      {
        int v10 = v12;
        goto LABEL_5;
      }
      char v18 = [(SiriUIBaseSnippetViewController *)self delegate];
      [v18 siriSnippetViewController:self setStatusBarHidden:1 animated:1];
      int v10 = v12;
    }
    else
    {
      char v19 = [(SiriUIBaseSnippetViewController *)self delegate];
      [v19 siriSnippetViewController:self setStatusViewHidden:1];

      if ([(UIViewController *)v6 siriui_shouldHideStatusBar])
      {
        uint64_t v20 = [(SiriUIBaseSnippetViewController *)self delegate];
        [v20 siriSnippetViewController:self setStatusBarHidden:1 animated:1];
      }
      uint64_t v21 = [(SiriUIBaseSnippetViewController *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
      {
        int v10 = 0;
        __int16 v12 = v6;
        goto LABEL_5;
      }
      char v18 = [(SiriUIBaseSnippetViewController *)self delegate];
      [v18 siriViewController:self setTypeToSiriViewHidden:1];
      int v10 = 0;
      __int16 v12 = v6;
    }
  }
LABEL_5:
  id v13 = v10;
  int v10 = v12;
LABEL_6:
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79__SiriUICardSnippetViewController_presentViewController_forCardViewController___block_invoke;
  v23[3] = &unk_26469F270;
  uint64_t v24 = v13;
  __int16 v25 = self;
  id v26 = v6;
  uint64_t v14 = v6;
  __int16 v15 = v13;
  [(SiriUICardSnippetViewController *)self presentViewController:v10 animated:1 completion:v23];
}

void __79__SiriUICardSnippetViewController_presentViewController_forCardViewController___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1296), v2);
  }
  id v3 = [*(id *)(a1 + 40) _privateDelegate];
  [v3 siriSnippetViewController:*(void *)(a1 + 40) didPresentViewController:*(void *)(a1 + 48)];
}

- (void)cardViewController:(id)a3 willDismissViewController:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    __int16 v15 = "-[SiriUICardSnippetViewController cardViewController:willDismissViewController:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Card view controller %@ dismissing view controller %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v9 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v9 siriSnippetViewController:self setStatusViewHidden:0];

  if (objc_msgSend(v6, "siriui_shouldHideStatusBar"))
  {
    int v10 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v10 siriSnippetViewController:self setStatusBarHidden:0 animated:1];
  }
  char v11 = [(SiriUIBaseSnippetViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v13 siriViewController:self setTypeToSiriViewHidden:0];
  }
}

- (void)modalContainerViewControllerViewWillDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v5 siriSnippetViewController:self setStatusViewHidden:0];

  id v6 = [(SiriUISnippetViewController *)self _privateDelegate];
  id v7 = [v4 contentViewController];
  [v6 siriSnippetViewController:self willDismissViewController:v7];

  double v8 = [v4 contentViewController];

  LODWORD(v4) = objc_msgSend(v8, "siriui_shouldHideStatusBar");
  if (v4)
  {
    id v9 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v9 siriSnippetViewController:self setStatusBarHidden:0 animated:1];
  }
}

- (void)modalContainerViewControllerViewDidDisappear:(id)a3
{
  id v4 = a3;
  id v6 = [(SiriUISnippetViewController *)self _privateDelegate];
  id v5 = [v4 contentViewController];

  [v6 siriSnippetViewController:self didDismissViewController:v5];
}

- (void)commandWasPerformed:(id)a3
{
  id v8 = [a3 backingFeedback];
  if (v8)
  {
    id v4 = [(SiriUICardSnippetViewController *)self snippet];
    id v5 = [v4 aceId];

    id v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
    [v7 emitVRXInstrumentationEvent:v8 aceViewId:v6];
  }
}

- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4
{
  id v5 = a3;
  id v6 = [(SiriUIBaseSnippetViewController *)self instrumentationTurnIdentifier];
  [(SiriUICardSnippetViewController *)self _instrumentCardSectionInteractionForCardSection:v5 previousTurn:v6];
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [a4 backingFeedback];
  if ([v7 actionTarget] == 1 || objc_msgSend(v7, "actionTarget") == 2)
  {
    if ([v7 actionTarget] == 1) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 4 * ([v7 actionTarget] == 2);
    }
    id v9 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
    int v10 = [v7 destination];
    char v11 = [v10 urls];
    char v12 = [v11 firstObject];
    id v13 = [v7 destination];
    int v14 = [v13 bundleIdentifier];
    [v9 emitPunchOutEventWithURL:v12 appID:v14 punchoutOrigin:v8];
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __83__SiriUICardSnippetViewController_userDidEngageCardSection_withEngagementFeedback___block_invoke;
  v35[3] = &unk_26469EFA8;
  id v15 = v7;
  id v36 = v15;
  [(SiriUICardSnippetViewController *)self _validateCardSectionForParsecFeedbackDelivery:v6 validHandler:v35];
  __int16 v16 = [(CRKCardViewControlling *)self->_cardViewController card];
  id v17 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCardSection:v6 inCard:v16];

  __int16 v18 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  id v19 = [v17 objectForKey:@"cardSectionId"];
  uint64_t v20 = [v17 objectForKey:@"ordinalCardSectionPosition"];
  uint64_t v21 = [v20 integerValue];
  char v22 = [v17 objectForKey:@"snippetAceId"];
  [v18 emitUUFRCasinoCardSelectedEventWithCardSectionID:v19 ordinalCardSectionPosition:v21 snippetAceId:v22];

  int v23 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v24 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = v24;
    id v26 = AFAnalyticsEventTypeGetName();
    *(_DWORD *)buf = 136315394;
    id v38 = "-[SiriUICardSnippetViewController userDidEngageCardSection:withEngagementFeedback:]";
    __int16 v39 = 2112;
    long long v40 = v26;
    _os_log_impl(&dword_2231EF000, v25, OS_LOG_TYPE_DEFAULT, "%s Sending event to AFAnalytics: %@", buf, 0x16u);
  }
  uint64_t v27 = [(SiriUICardSnippetViewController *)self _analytics];
  [v27 logEventWithType:3905 context:v17];

  os_log_t v28 = *v23;
  if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v29 = v28;
    long long v30 = AFAnalyticsEventTypeGetName();
    *(_DWORD *)buf = 136315394;
    id v38 = "-[SiriUICardSnippetViewController userDidEngageCardSection:withEngagementFeedback:]";
    __int16 v39 = 2112;
    long long v40 = v30;
    _os_log_impl(&dword_2231EF000, v29, OS_LOG_TYPE_DEFAULT, "%s Sending event to AFAnalytics: %@", buf, 0x16u);
  }
  __int16 v31 = [(SiriUICardSnippetViewController *)self _analytics];
  uint64_t v32 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCard:v16];
  [v31 logEventWithType:3904 context:v32];

  uint64_t v33 = [(SiriUIBaseSnippetViewController *)self delegate];
  LOBYTE(v32) = objc_opt_respondsToSelector();

  if (v32)
  {
    id v34 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v34 userTouchedSnippet];
  }
}

uint64_t __83__SiriUICardSnippetViewController_userDidEngageCardSection_withEngagementFeedback___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SiriUICardSnippetViewController userDidEngageCardSection:withEngagementFeedback:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2231EF000, v2, OS_LOG_TYPE_DEFAULT, "%s #cards Sending feedback to registered feedbackListeners: %@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) queryId];
  return SFFeedbackNotify();
}

- (void)_instrumentCardSectionInteractionForCardSection:(id)a3 previousTurn:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F6ED78]);
  [v8 setInvocationSource:11];
  id v9 = objc_alloc_init(MEMORY[0x263F6EF00]);
  int v10 = [v6 cardSectionIdentifier];
  [v9 setViewID:v10];

  [v8 setViewContainer:v9];
  if (objc_opt_respondsToSelector())
  {
    char v11 = [v6 backingCardSection];
    char v12 = [v11 resultIdentifier];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F6EEF8]);
      [v13 setResultIdentifier:v12];
      [v8 setCardInvocationContext:v13];
    }
  }
  int v14 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v7];
  id v15 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = v15;
    id v17 = [v14 turnIdentifier];
    int v23 = 136315650;
    uint64_t v24 = "-[SiriUICardSnippetViewController _instrumentCardSectionInteractionForCardSection:previousTurn:]";
    __int16 v25 = 2112;
    id v26 = v17;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_2231EF000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v23, 0x20u);
  }
  __int16 v18 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  [v18 storeCurrentInstrumentationTurnContext:v14];

  id v19 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  [v19 emitInstrumentation:v8];

  uint64_t v20 = [v14 turnIdentifier];
  uint64_t v21 = [v20 UUIDString];
  feedbackEngagementInstrumentationIdentifier = self->_feedbackEngagementInstrumentationIdentifier;
  self->_feedbackEngagementInstrumentationIdentifier = v21;
}

- (void)_emitInstrumentationEventWithInvocationSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F6ED78]);
  [v5 setInvocationSource:v3];
  id v6 = (void *)MEMORY[0x263F28400];
  id v7 = [(SiriUIBaseSnippetViewController *)self instrumentationTurnIdentifier];
  id v8 = (void *)[v6 newTurnBasedContextWithPreviousTurnID:v7];

  id v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    char v11 = [v8 turnIdentifier];
    char v12 = [(SiriUIBaseSnippetViewController *)self instrumentationTurnIdentifier];
    int v15 = 136315650;
    __int16 v16 = "-[SiriUICardSnippetViewController _emitInstrumentationEventWithInvocationSource:]";
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_2231EF000, v10, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v15, 0x20u);
  }
  id v13 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  [v13 storeCurrentInstrumentationTurnContext:v8];

  int v14 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  [v14 emitInstrumentation:v5];
}

- (void)_emitInstrumentationEventForKeyboardInvocation
{
  id v8 = objc_alloc_init(MEMORY[0x263F6ED10]);
  uint64_t v3 = (void *)MEMORY[0x263F6EF10];
  id v4 = [(SiriUICardSnippetViewController *)self textInputMode];
  id v5 = [v4 primaryLanguage];
  uint64_t v6 = [v3 convertLanguageCodeToSchemaLocale:v5];

  [v8 setKeyboardLocale:v6];
  [v8 setKeyboardPresented:1];
  id v7 = objc_alloc_init(MEMORY[0x263F6ED78]);
  [v7 setInvocationSource:11];
  [v7 setKeyboardInvocationContext:v8];
  [(SiriUICardSnippetViewController *)self _emitInstrumentationEvent:v7 requiresNewTurn:1];
}

- (void)_emitInstrumentationEvent:(id)a3 requiresNewTurn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    id v7 = [(SiriUIBaseSnippetViewController *)self instrumentationTurnIdentifier];
    id v8 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v7];
    id v9 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      char v11 = [v8 turnIdentifier];
      int v14 = 136315650;
      int v15 = "-[SiriUICardSnippetViewController _emitInstrumentationEvent:requiresNewTurn:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v7;
      _os_log_impl(&dword_2231EF000, v10, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v14, 0x20u);
    }
    char v12 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
    [v12 storeCurrentInstrumentationTurnContext:v8];
  }
  id v13 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  [v13 emitInstrumentation:v6];
}

- (id)_instrumentationManager
{
  return (id)[MEMORY[0x263F754A8] sharedManager];
}

- (void)userDidReportFeedback:(id)a3 fromCardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F67A08]);
  id v9 = [(CRKCardViewControlling *)self->_cardViewController card];
  if (objc_opt_respondsToSelector())
  {
    int v10 = [v9 backingCard];
  }
  else
  {
    int v10 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v11 = 0;
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  char v11 = [v7 backingCardSection];
  if (v10)
  {
LABEL_8:
    char v12 = [v10 fbr];
    [v8 setFbr:v12];
  }
LABEL_9:
  if (v11)
  {
    id v13 = [v11 resultIdentifier];
    [v8 setIdentifier:v13];
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__SiriUICardSnippetViewController_userDidReportFeedback_fromCardSection___block_invoke;
  v16[3] = &unk_26469F248;
  id v17 = v6;
  id v18 = v8;
  id v14 = v8;
  id v15 = v6;
  [(SiriUICardSnippetViewController *)self _validateCardSectionForParsecFeedbackDelivery:v7 validHandler:v16];
}

void __73__SiriUICardSnippetViewController_userDidReportFeedback_fromCardSection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    double v2 = [*(id *)(a1 + 32) backingFeedback];
    [v2 setResult:*(void *)(a1 + 40)];
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      id v5 = "-[SiriUICardSnippetViewController userDidReportFeedback:fromCardSection:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_2231EF000, v3, OS_LOG_TYPE_DEFAULT, "%s #cards Sending user response feedback to registered feedbackListeners: %@", (uint8_t *)&v4, 0x16u);
    }
    [v2 queryId];
    SFFeedbackNotify();
  }
}

- (void)cardViewWillAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(CRKCardViewControlling *)self->_cardViewController card];
  __int16 v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    uint64_t v8 = AFAnalyticsEventTypeGetName();
    int v11 = 136315394;
    char v12 = "-[SiriUICardSnippetViewController cardViewWillAppearForCard:withAppearanceFeedback:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_2231EF000, v7, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(SiriUICardSnippetViewController *)self _analytics];
  int v10 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCard:v5];
  [v9 logEventWithType:3900 context:v10];
}

- (void)cardViewDidAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__SiriUICardSnippetViewController_cardViewDidAppearForCard_withAppearanceFeedback___block_invoke;
  v14[3] = &unk_26469EFA8;
  id v7 = v6;
  id v15 = v7;
  [(SiriUICardSnippetViewController *)self _validateCardForParsecFeedbackDelivery:a3 validHandler:v14];
  uint64_t v8 = [(CRKCardViewControlling *)self->_cardViewController card];
  id v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    int v11 = AFAnalyticsEventTypeGetName();
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SiriUICardSnippetViewController cardViewDidAppearForCard:withAppearanceFeedback:]";
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl(&dword_2231EF000, v10, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", buf, 0x16u);
  }
  char v12 = [(SiriUICardSnippetViewController *)self _analytics];
  __int16 v13 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCard:v8];
  [v12 logEventWithType:3901 context:v13];
}

void __83__SiriUICardSnippetViewController_cardViewDidAppearForCard_withAppearanceFeedback___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) backingFeedback];
  double v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    int v4 = "-[SiriUICardSnippetViewController cardViewDidAppearForCard:withAppearanceFeedback:]_block_invoke";
    __int16 v5 = 2112;
    id v6 = v1;
    _os_log_impl(&dword_2231EF000, v2, OS_LOG_TYPE_DEFAULT, "%s #cards Sending feedback to registered feedbackListeners: %@", (uint8_t *)&v3, 0x16u);
  }
  [v1 queryId];
  SFFeedbackNotify();
}

- (void)cardViewDidDisappearForCard:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__SiriUICardSnippetViewController_cardViewDidDisappearForCard_withDisappearanceFeedback___block_invoke;
  v8[3] = &unk_26469EFA8;
  id v9 = v6;
  id v7 = v6;
  [(SiriUICardSnippetViewController *)self _validateCardForParsecFeedbackDelivery:a3 validHandler:v8];
}

void __89__SiriUICardSnippetViewController_cardViewDidDisappearForCard_withDisappearanceFeedback___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) backingFeedback];
  double v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    int v4 = "-[SiriUICardSnippetViewController cardViewDidDisappearForCard:withDisappearanceFeedback:]_block_invoke";
    __int16 v5 = 2112;
    id v6 = v1;
    _os_log_impl(&dword_2231EF000, v2, OS_LOG_TYPE_DEFAULT, "%s #cards Sending feedback to registered feedbackListeners: %@", (uint8_t *)&v3, 0x16u);
  }
  [v1 queryId];
  SFFeedbackNotify();
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  cardViewController = self->_cardViewController;
  id v6 = a3;
  uint64_t v7 = [(CRKCardViewControlling *)cardViewController card];
  uint64_t v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    int v10 = AFAnalyticsEventTypeGetName();
    int v13 = 136315394;
    id v14 = "-[SiriUICardSnippetViewController cardSectionViewWillAppearForCardSection:withAppearanceFeedback:]";
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl(&dword_2231EF000, v9, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [(SiriUICardSnippetViewController *)self _analytics];
  char v12 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCardSection:v6 inCard:v7];

  [v11 logEventWithType:3902 context:v12];
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  cardViewController = self->_cardViewController;
  id v6 = a3;
  uint64_t v7 = [(CRKCardViewControlling *)cardViewController card];
  uint64_t v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    int v10 = AFAnalyticsEventTypeGetName();
    int v13 = 136315394;
    id v14 = "-[SiriUICardSnippetViewController cardSectionViewDidAppearForCardSection:withAppearanceFeedback:]";
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl(&dword_2231EF000, v9, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [(SiriUICardSnippetViewController *)self _analytics];
  char v12 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCardSection:v6 inCard:v7];

  [v11 logEventWithType:3903 context:v12];
}

- (void)controllerForCard:(id)a3 didRequestAsyncCard:(id)a4 withAsyncCardRequestFeedback:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = AFAnalyticsEventTypeGetName();
    int v12 = 136315394;
    int v13 = "-[SiriUICardSnippetViewController controllerForCard:didRequestAsyncCard:withAsyncCardRequestFeedback:]";
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v12, 0x16u);
  }
  int v10 = [(SiriUICardSnippetViewController *)self _analytics];
  int v11 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCard:v6];
  [v10 logEventWithType:3906 context:v11];
}

- (void)controllerForCard:(id)a3 didReceiveAsyncCard:(id)a4 withAsyncCardReceiptFeedback:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = AFAnalyticsEventTypeGetName();
    int v12 = 136315394;
    int v13 = "-[SiriUICardSnippetViewController controllerForCard:didReceiveAsyncCard:withAsyncCardReceiptFeedback:]";
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl(&dword_2231EF000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v12, 0x16u);
  }
  int v10 = [(SiriUICardSnippetViewController *)self _analytics];
  int v11 = [(SiriUICardSnippetViewController *)self _metricsContextOfEventsForCard:v6];
  [v10 logEventWithType:3907 context:v11];
}

- (BOOL)cardLoader:(id)a3 shouldLoadCard:(id)a4
{
  return objc_msgSend(a4, "type", a3) == 3;
}

- (BOOL)cardLoader:(id)a3 loadCard:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [NSString alloc];
  int v10 = [v7 entityIdentifier];
  int v11 = (void *)[v9 initWithData:v10 encoding:4];
  int v12 = [v11 stringByRemovingPercentEncoding];

  [v12 componentsSeparatedByString:@"&"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v29 = v12;
    id v30 = v8;
    id v31 = v7;
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v19 = [v18 rangeOfString:@"="];
        uint64_t v20 = [v18 substringToIndex:v19];
        uint64_t v21 = [v18 substringFromIndex:v19 + 1];
        if ([v20 isEqualToString:@"utterance"])
        {

          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    uint64_t v21 = 0;
LABEL_11:
    id v8 = v30;
    id v7 = v31;
    int v12 = v29;
  }
  else
  {
    uint64_t v21 = 0;
  }

  char v22 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v38 = "-[SiriUICardSnippetViewController cardLoader:loadCard:withCompletionHandler:]";
    __int16 v39 = 2112;
    long long v40 = v21;
    _os_log_impl(&dword_2231EF000, v22, OS_LOG_TYPE_DEFAULT, "%s #cards Machine utterance %@ for card loading", buf, 0x16u);
  }
  id v23 = objc_alloc_init(MEMORY[0x263F64E30]);
  uint64_t v24 = [MEMORY[0x263F08C38] UUID];
  __int16 v25 = [v24 UUIDString];
  [v23 setAceId:v25];

  [v23 setUtterance:v21];
  [(SiriUICardSnippetViewController *)self _beginMonitoringForNextCardWithBlock:v8];
  id v26 = [(SiriUIBaseSnippetViewController *)self delegate];
  id v36 = v23;
  __int16 v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [v26 siriViewController:self performAceCommands:v27];

  return 1;
}

- (void)cardLoadingMonitor:(id)a3 didReceiveCardSnippet:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  p_newlyLoadedCardSnippet = &self->_newlyLoadedCardSnippet;
  objc_storeStrong((id *)&self->_newlyLoadedCardSnippet, a4);
  id v9 = a3;
  [(NSTimer *)self->_cardLoadingTimer invalidate];
  cardLoadingTimer = self->_cardLoadingTimer;
  self->_cardLoadingTimer = 0;

  [v9 removeObserver:self];
  if (self->_newlyLoadedCardSnippet)
  {
    int v11 = [(SACardSnippet *)self->_newlyLoadedCardSnippet siriui_card];
    int v12 = [v11 backingCard];

    id v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      __int16 v18 = "-[SiriUICardSnippetViewController cardLoadingMonitor:didReceiveCardSnippet:]";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_2231EF000, v13, OS_LOG_TYPE_DEFAULT, "%s #cards CardLoadingMonitor received next card %@", (uint8_t *)&v17, 0x16u);
    }
    id cardLoadingCompletionhandler = (void (**)(id, void *, void))self->_cardLoadingCompletionhandler;
    if (cardLoadingCompletionhandler)
    {
      cardLoadingCompletionhandler[2](cardLoadingCompletionhandler, v12, 0);
      id v15 = self->_cardLoadingCompletionhandler;
      self->_id cardLoadingCompletionhandler = 0;
    }
    uint64_t v16 = *p_newlyLoadedCardSnippet;
    *p_newlyLoadedCardSnippet = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
  self->_isCardLoading = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
}

- (void)cardLoadingMonitor:(id)a3 didReceiveVisualResponseSnippet:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  cardLoadingTimer = self->_cardLoadingTimer;
  id v7 = a4;
  id v8 = a3;
  [(NSTimer *)cardLoadingTimer invalidate];
  id v9 = self->_cardLoadingTimer;
  self->_cardLoadingTimer = 0;

  [v8 removeObserver:self];
  id cardLoadingCompletionhandler = self->_cardLoadingCompletionhandler;
  self->_id cardLoadingCompletionhandler = 0;

  int v11 = [(SiriUIBaseSnippetViewController *)self delegate];
  v13[0] = v7;
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

  [v11 siriSnippetViewController:self pushSirilandSnippets:v12];
  os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
  self->_isCardLoading = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
}

- (Class)transparentHeaderViewClass
{
  double v2 = [(SACardSnippet *)self->_snippet title];

  if (v2)
  {
    int v3 = objc_opt_class();
  }
  else
  {
    int v3 = 0;
  }
  return (Class)v3;
}

- (void)configureReusableTransparentHeaderView:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    snippet = self->_snippet;
    id v5 = v7;
    id v6 = [(SACardSnippet *)snippet title];
    [v5 configureWithTitle:v6];
  }
}

- (double)desiredHeightForTransparentHeaderView
{
  double v2 = [(SiriUICardSnippetViewController *)self transparentHeaderViewClass];
  [(objc_class *)v2 defaultHeight];
  return result;
}

- (double)boundingWidthForPresentation:(id)a3
{
  int v4 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v4 boundingWidthForSnippetViewController:self];
  double v6 = v5;

  return v6;
}

- (id)_analytics
{
  return (id)[MEMORY[0x263F283F8] sharedAnalytics];
}

- (void)_logCardRelationshipIdentifiedForCompactCard:(id)a3 fullCard:(id)a4 snippet:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v15 = [a3 cardId];
  int v10 = [v9 cardId];

  int v11 = [v8 aceId];

  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v12 setValue:v15 forKey:@"compactId"];
  [v12 setValue:v10 forKey:@"regularId"];
  [v12 setValue:v11 forKey:@"snippetAceId"];
  id v13 = [(SiriUICardSnippetViewController *)self _instrumentationManager];
  [v13 emitCasinoRelationshipEventWithViewIDFrom:v15 ViewIDTo:v10 casinoFromType:1];

  uint64_t v14 = [(SiriUICardSnippetViewController *)self _analytics];
  [v14 logEventWithType:3908 context:v12];
}

- (id)snippet
{
  return self->_snippet;
}

- (CRKCardViewControlling)_cardViewController
{
  return self->_cardViewController;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isPresentedWithSmartDialogText
{
  return self->_isPresentedWithSmartDialogText;
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  self->_isPresentedWithSmartDialogText = a3;
}

- (CRKCardPresentation)_cardPresentation
{
  return self->_cardPresentation;
}

- (void)_setCardPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardPresentation, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
  objc_storeStrong((id *)&self->_presentedModalContainerViewController, 0);
  objc_storeStrong((id *)&self->_feedbackEngagementInstrumentationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersProcessedWithNewTurn, 0);
  objc_storeStrong((id *)&self->_originalCard, 0);
  objc_storeStrong((id *)&self->_cardLoadingTimer, 0);
  objc_storeStrong(&self->_cardLoadingCompletionhandler, 0);
  objc_storeStrong((id *)&self->_cardLoader, 0);
  objc_storeStrong((id *)&self->_newlyLoadedCardSnippet, 0);
  objc_storeStrong((id *)&self->_cardLoadingGroup, 0);
  objc_storeStrong((id *)&self->_referenceableSnippetsByIdentifierMap, 0);
  objc_storeStrong((id *)&self->_referenceableCommandsByIdentifierMap, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
}

void __46__SiriUICardSnippetViewController_setSnippet___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 136315650;
  *(void *)&v3[4] = "-[SiriUICardSnippetViewController setSnippet:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, a2, a3, "%s #cards Error %@ in attempting to configure CRKCardPresentation with card %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a2 + 32));
}

void __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  double v2 = "-[SiriUICardSnippetViewController _beginMonitoringForNextCardWithBlock:]_block_invoke";
  _os_log_error_impl(&dword_2231EF000, log, OS_LOG_TYPE_ERROR, "%s #cards Failed to load second level card", (uint8_t *)&v1, 0xCu);
}

- (void)_forwardProgressEvent:(uint64_t)a1 toCardViewController:(NSObject *)a2 animated:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2231EF000, a2, OS_LOG_TYPE_ERROR, "%s Card view controller %@ is unable to handle card command", (uint8_t *)&v2, 0x16u);
}

void __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 32);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, a2, a3, "%s Failed to handle progress undate command for card view controller %@ with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

@end