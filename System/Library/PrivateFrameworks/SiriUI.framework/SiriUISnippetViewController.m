@interface SiriUISnippetViewController
- (BOOL)_hasConfirmationButtons;
- (BOOL)_hasConfirmationOrCancelledInsets;
- (BOOL)_isAwaitingSuccessOrFailureEvent;
- (BOOL)_isProvisional;
- (BOOL)_willAnimateCancellation;
- (BOOL)_willAnimateConfirmation;
- (BOOL)isCancelled;
- (BOOL)isConfirmed;
- (BOOL)isFullPadWidth;
- (BOOL)isHint;
- (BOOL)isIndicatingActivity;
- (BOOL)isLoading;
- (BOOL)isMemoryIntensive;
- (BOOL)isNavigating;
- (BOOL)isTransparent;
- (BOOL)isUserConfirmationEnabled;
- (BOOL)isVirgin;
- (BOOL)logContentsIfApplicable;
- (BOOL)removedAfterDialogProgresses;
- (BOOL)shouldHidePriorViews;
- (BOOL)showHeaderChevron;
- (BOOL)wantsConfirmationInsets;
- (BOOL)wantsToManageBackgroundColor;
- (Class)footerViewClass;
- (Class)headerViewClass;
- (Class)transparentFooterViewClass;
- (Class)transparentHeaderViewClass;
- (NSArray)requestContext;
- (NSAttributedString)attributedSubtitle;
- (NSString)navigationTitle;
- (NSString)subtitle;
- (SAUIAppPunchOut)headerPunchOut;
- (SAUIAppPunchOut)snippetPunchOut;
- (SAUIConfirmationOptions)_previousConfirmationOptions;
- (SiriUISnippetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIColor)titleBackgroundColor;
- (UIColor)titleTextColor;
- (UIEdgeInsets)defaultViewInsets;
- (UIView)containingView;
- (double)desiredHeightForFooterView;
- (double)desiredHeightForHeaderView;
- (double)desiredHeightForTransparentFooterView;
- (double)desiredHeightForTransparentHeaderView;
- (id)_createReusableViewIfNeededWithClass:(Class)a3;
- (id)_footerView;
- (id)_headerView;
- (id)_instrumentationManager;
- (id)_privateDelegate;
- (id)_transparentFooterView;
- (id)_transparentHeaderView;
- (id)alternativeAceCommandsToPerformIfNotExposingViews;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (int64_t)_replacementAnimation;
- (int64_t)defaultKeylineType;
- (void)_cellDidLayoutSubviews;
- (void)_instrumentConfirmationOptionInteractionWithPreviousTurn:(id)a3;
- (void)_setAwaitingSuccessOrFailureEvent:(BOOL)a3;
- (void)_setPreviousConfirmationOptions:(id)a3;
- (void)_setProvisional:(BOOL)a3;
- (void)_setVirgin:(BOOL)a3;
- (void)_setWillAnimateCancellation:(BOOL)a3;
- (void)_setWillAnimateConfirmation:(BOOL)a3;
- (void)_snippetPunchOutButtonTapped;
- (void)cancelButtonTapped:(id)a3;
- (void)configureForConversationStorable:(id)a3;
- (void)configureReusableFooterView:(id)a3;
- (void)configureReusableHeaderView:(id)a3;
- (void)confirmButtonTapped:(id)a3;
- (void)confirmSnippet;
- (void)headerTapped:(id)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setContainingView:(id)a3;
- (void)setDefaultKeylineType:(int64_t)a3;
- (void)setDefaultViewInsets:(UIEdgeInsets)a3;
- (void)setHeaderPunchOut:(id)a3;
- (void)setIsFullPadWidth:(BOOL)a3;
- (void)setIsHint:(BOOL)a3;
- (void)setIsTransparent:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setNavigationTitle:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setShowHeaderChevron:(BOOL)a3;
- (void)setSnippetPunchOut:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitleBackgroundColor:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setUserConfirmationEnabled:(BOOL)a3;
- (void)setWantsConfirmationInsets:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SiriUISnippetViewController

- (SiriUISnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUISnippetViewController;
  v4 = [(SiriUISnippetViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    -[SiriUISnippetViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", 10.0, 8.0, 10.0, 8.0);
    [(SiriUISnippetViewController *)v5 setWantsConfirmationInsets:1];
    [(SiriUISnippetViewController *)v5 setShowHeaderChevron:1];
  }
  return v5;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)removedAfterDialogProgresses
{
  return 0;
}

- (BOOL)isMemoryIntensive
{
  return 0;
}

- (BOOL)isIndicatingActivity
{
  return 0;
}

- (BOOL)logContentsIfApplicable
{
  return 0;
}

- (BOOL)shouldHidePriorViews
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUISnippetViewController;
  [(SiriUISnippetViewController *)&v5 viewDidAppear:a3];
  v4 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v4 siriViewControllerViewDidAppear:self isTopLevelViewController:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUISnippetViewController;
  [(SiriUISnippetViewController *)&v5 viewDidDisappear:a3];
  v4 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v4 siriViewControllerViewDidDisappear:self isTopLevelViewController:1];
}

- (void)_setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (int64_t)_pinAnimationType
{
  return 3;
}

- (int64_t)_insertionAnimation
{
  return 2;
}

- (int64_t)_replacementAnimation
{
  return 0;
}

- (BOOL)_hasConfirmationOrCancelledInsets
{
  BOOL v3 = [(SiriUISnippetViewController *)self _isProvisional];
  BOOL v4 = [(SiriUISnippetViewController *)self _willAnimateConfirmation];
  BOOL v5 = [(SiriUISnippetViewController *)self wantsConfirmationInsets];
  if (!v5 || v3 || v4) {
    return v5 || v5 && !v3;
  }
  return [(SiriUISnippetViewController *)self isCancelled];
}

- (BOOL)_hasConfirmationButtons
{
  BOOL v4 = [(SiriUISnippetViewController *)self _hasConfirmationOrCancelledInsets];
  if (v4)
  {
    v2 = [(SiriUIBaseSnippetViewController *)self snippet];
    BOOL v5 = [v2 confirmationOptions];
    if (v5)
    {
      BOOL v6 = 1;
LABEL_6:

      return v6;
    }
  }
  objc_super v7 = [(SiriUISnippetViewController *)self _previousConfirmationOptions];
  BOOL v6 = v7 != 0;

  if (v4)
  {
    BOOL v5 = 0;
    goto LABEL_6;
  }
  return v6;
}

- (id)_privateDelegate
{
  BOOL v3 = [(SiriUIBaseSnippetViewController *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_26D685308];

  if (v4)
  {
    BOOL v5 = [(SiriUIBaseSnippetViewController *)self delegate];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (id)alternativeAceCommandsToPerformIfNotExposingViews
{
  return 0;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 0;
}

- (void)setSubtitle:(id)a3
{
  if (a3)
  {
    int v4 = (objc_class *)MEMORY[0x263F086A0];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(SiriUISnippetViewController *)self setAttributedSubtitle:v6];
}

- (NSString)subtitle
{
  v2 = [(SiriUISnippetViewController *)self attributedSubtitle];
  BOOL v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setUserConfirmationEnabled:(BOOL)a3
{
  if (self->_userConfirmationEnabled != a3)
  {
    BOOL v3 = a3;
    self->_userConfirmationEnabled = a3;
    if (self->_footerView)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [(SiriUIReusableView *)self->_footerView confirmButton];
        [v5 setEnabled:v3];
      }
    }
  }
}

- (Class)headerViewClass
{
  BOOL v3 = [(SiriUISnippetViewController *)self title];

  if (v3)
  {
    [(SiriUISnippetViewController *)self attributedSubtitle];

    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }
  return (Class)v4;
}

- (Class)footerViewClass
{
  [(SiriUISnippetViewController *)self _hasConfirmationButtons];
  v2 = objc_opt_class();
  return (Class)v2;
}

- (Class)transparentHeaderViewClass
{
  return 0;
}

- (Class)transparentFooterViewClass
{
  return 0;
}

- (void)_cellDidLayoutSubviews
{
  if (self->_headerView) {
    -[SiriUISnippetViewController configureReusableHeaderView:](self, "configureReusableHeaderView:");
  }
  if (self->_footerView) {
    -[SiriUISnippetViewController configureReusableFooterView:](self, "configureReusableFooterView:");
  }
  if (self->_transparentHeaderView) {
    -[SiriUISnippetViewController configureReusableTransparentHeaderView:](self, "configureReusableTransparentHeaderView:");
  }
  if (self->_transparentFooterView)
  {
    -[SiriUISnippetViewController configureReusableTransparentFooterView:](self, "configureReusableTransparentFooterView:");
  }
}

- (void)configureReusableHeaderView:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v11;
    id v5 = [(SiriUISnippetViewController *)self titleTextColor];
    [v4 setTitleTextColor:v5];

    id v6 = [(SiriUISnippetViewController *)self title];
    [v4 setTitleText:v6];

    objc_super v7 = [(SiriUISnippetViewController *)self titleBackgroundColor];
    [v4 setBackgroundColor:v7];

    v8 = [v4 headerAreaButton];

    [v8 addTarget:self action:sel_headerTapped_ forControlEvents:64];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v11;
    v10 = [(SiriUISnippetViewController *)self attributedSubtitle];
    [v9 setAttributedSubtitleText:v10];
  }
}

- (void)configureReusableFooterView:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v15;
  if (isKindOfClass)
  {
    id v6 = v15;
    objc_super v7 = [(SiriUISnippetViewController *)self _previousConfirmationOptions];

    if (v7)
    {
      v8 = [(SiriUISnippetViewController *)self _previousConfirmationOptions];
      [v6 setConfirmationOptions:v8];

      [v6 setUserInteractionEnabled:0];
    }
    else
    {
      id v9 = [(SiriUIBaseSnippetViewController *)self snippet];
      v10 = [v9 confirmationOptions];
      [v6 setConfirmationOptions:v10];

      id v11 = [v6 cancelButton];
      [v11 addTarget:self action:sel_cancelButtonTapped_ forControlEvents:64];

      v12 = [v6 confirmButton];
      [v12 addTarget:self action:sel_confirmButtonTapped_ forControlEvents:64];

      v13 = [v6 confirmButton];
      [v13 setEnabled:self->_userConfirmationEnabled];
    }
    footerView = self->_footerView;
    self->_footerView = (SiriUIReusableView *)v6;

    id v5 = v15;
  }
  MEMORY[0x270F9A758](isKindOfClass, v5);
}

- (double)desiredHeightForHeaderView
{
  BOOL v3 = [(SiriUISnippetViewController *)self _headerView];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v4 siriViewControllerExpectedWidth:self];
    double v6 = v5;

    [(SiriUISnippetViewController *)self defaultViewInsets];
    double v8 = v7;
    [(SiriUISnippetViewController *)self defaultViewInsets];
    double v10 = v6 + v8 + v9;
    [(SiriUISnippetViewController *)self configureReusableHeaderView:v3];
    [v3 desiredHeightForWidth:v10];
  }
  else
  {
    [(objc_class *)[(SiriUISnippetViewController *)self headerViewClass] defaultHeight];
  }
  double v12 = v11;

  return v12;
}

- (double)desiredHeightForFooterView
{
  if ([(SiriUISnippetViewController *)self isCancelled]
    || [(SiriUISnippetViewController *)self isConfirmed]
    || [(SiriUISnippetViewController *)self _isAwaitingSuccessOrFailureEvent])
  {
    return 0.0;
  }
  id v4 = [(SiriUISnippetViewController *)self footerViewClass];
  [(objc_class *)v4 defaultHeight];
  return result;
}

- (double)desiredHeightForTransparentHeaderView
{
  BOOL v3 = [(SiriUISnippetViewController *)self _transparentHeaderView];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v4 siriViewControllerExpectedWidth:self];
    double v6 = v5;

    [(SiriUISnippetViewController *)self defaultViewInsets];
    double v8 = v7;
    [(SiriUISnippetViewController *)self defaultViewInsets];
    double v10 = v6 + v8 + v9;
    [(SiriUISnippetViewController *)self configureReusableTransparentHeaderView:v3];
    [v3 desiredHeightForWidth:v10];
  }
  else
  {
    [(objc_class *)[(SiriUISnippetViewController *)self transparentHeaderViewClass] defaultHeight];
  }
  double v12 = v11;

  return v12;
}

- (double)desiredHeightForTransparentFooterView
{
  v2 = [(SiriUISnippetViewController *)self transparentFooterViewClass];
  [(objc_class *)v2 defaultHeight];
  return result;
}

- (id)_headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    id v4 = [(SiriUISnippetViewController *)self _createReusableViewIfNeededWithClass:[(SiriUISnippetViewController *)self headerViewClass]];
    double v5 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }
  return headerView;
}

- (id)_footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    id v4 = [(SiriUISnippetViewController *)self _createReusableViewIfNeededWithClass:[(SiriUISnippetViewController *)self footerViewClass]];
    double v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (id)_transparentHeaderView
{
  transparentHeaderView = self->_transparentHeaderView;
  if (!transparentHeaderView)
  {
    id v4 = [(SiriUISnippetViewController *)self _createReusableViewIfNeededWithClass:[(SiriUISnippetViewController *)self transparentHeaderViewClass]];
    double v5 = self->_transparentHeaderView;
    self->_transparentHeaderView = v4;

    transparentHeaderView = self->_transparentHeaderView;
  }
  return transparentHeaderView;
}

- (id)_transparentFooterView
{
  transparentFooterView = self->_transparentFooterView;
  if (!transparentFooterView)
  {
    id v4 = [(SiriUISnippetViewController *)self _createReusableViewIfNeededWithClass:[(SiriUISnippetViewController *)self transparentFooterViewClass]];
    double v5 = self->_transparentFooterView;
    self->_transparentFooterView = v4;

    transparentFooterView = self->_transparentFooterView;
  }
  return transparentFooterView;
}

- (id)_createReusableViewIfNeededWithClass:(Class)a3
{
  id v4 = [a3 alloc];
  double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (objc_opt_respondsToSelector()) {
    [v5 setSnippetViewController:self];
  }
  return v5;
}

- (BOOL)isTransparent
{
  return (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) == 0 && self->_isTransparent;
}

- (void)_snippetPunchOutButtonTapped
{
  v6[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(SiriUIBaseSnippetViewController *)self delegate];
  id v4 = [(SiriUISnippetViewController *)self snippetPunchOut];
  v6[0] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 siriViewController:self performAceCommands:v5];
}

- (void)headerTapped:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = [(SiriUIBaseSnippetViewController *)self delegate];
  double v5 = [(SiriUISnippetViewController *)self headerPunchOut];
  v7[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v4 siriViewController:self performAceCommands:v6];
}

- (void)cancelButtonTapped:(id)a3
{
  id v4 = [(SiriUIReusableView *)self->_footerView cancelButton];
  [v4 setEnabled:0];

  double v5 = [(SiriUIReusableView *)self->_footerView confirmButton];
  [v5 setEnabled:0];

  double v6 = [(SiriUISnippetViewController *)self view];
  [v6 setUserInteractionEnabled:0];

  [(SiriUISnippetViewController *)self willCancel];
  double v7 = [(SiriUIBaseSnippetViewController *)self instrumentationTurnIdentifier];
  [(SiriUISnippetViewController *)self _instrumentConfirmationOptionInteractionWithPreviousTurn:v7];

  id v11 = [(SiriUIBaseSnippetViewController *)self delegate];
  double v8 = [(SiriUIBaseSnippetViewController *)self snippet];
  double v9 = [v8 confirmationOptions];
  double v10 = [v9 denyCommands];
  [v11 siriViewController:self performAceCommands:v10];
}

- (void)confirmButtonTapped:(id)a3
{
  id v4 = [(SiriUIReusableView *)self->_footerView cancelButton];
  [v4 setEnabled:0];

  double v5 = [(SiriUIReusableView *)self->_footerView confirmButton];
  [v5 setEnabled:0];

  double v6 = [(SiriUISnippetViewController *)self view];
  [v6 setUserInteractionEnabled:0];

  [(SiriUISnippetViewController *)self willConfirm];
  double v7 = [(SiriUIBaseSnippetViewController *)self instrumentationTurnIdentifier];
  [(SiriUISnippetViewController *)self _instrumentConfirmationOptionInteractionWithPreviousTurn:v7];

  id v11 = [(SiriUIBaseSnippetViewController *)self delegate];
  double v8 = [(SiriUIBaseSnippetViewController *)self snippet];
  double v9 = [v8 confirmationOptions];
  double v10 = [v9 confirmCommands];
  [v11 siriViewController:self performAceCommands:v10];
}

- (void)confirmSnippet
{
  if (!self->_cancelled) {
    [(SiriUISnippetViewController *)self confirmButtonTapped:0];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUISnippetViewController;
  [(SiriUISnippetViewController *)&v8 touchesBegan:a3 withEvent:a4];
  double v5 = [(SiriUIBaseSnippetViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(SiriUIBaseSnippetViewController *)self delegate];
    [v7 userTouchedSnippet];
  }
}

- (void)_instrumentConfirmationOptionInteractionWithPreviousTurn:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F6EF00]);
  char v6 = [(SiriUIBaseSnippetViewController *)self snippet];
  double v7 = [v6 confirmationOptions];
  objc_super v8 = [v7 aceId];
  [v5 setViewID:v8];

  double v9 = [(SiriUIBaseSnippetViewController *)self snippet];
  double v10 = [v9 confirmationOptions];
  id v11 = (objc_class *)objc_opt_class();
  double v12 = NSStringFromClass(v11);
  [v5 setSnippetClass:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F6ED78]);
  [v13 setInvocationSource:11];
  [v13 setViewContainer:v5];
  v14 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v4];
  id v15 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = [v14 turnIdentifier];
    int v20 = 136315650;
    v21 = "-[SiriUISnippetViewController _instrumentConfirmationOptionInteractionWithPreviousTurn:]";
    __int16 v22 = 2112;
    v23 = v17;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_2231EF000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v20, 0x20u);
  }
  v18 = [(SiriUISnippetViewController *)self _instrumentationManager];
  [v18 storeCurrentInstrumentationTurnContext:v14];

  v19 = [(SiriUISnippetViewController *)self _instrumentationManager];
  [v19 emitInstrumentation:v13];
}

- (id)_instrumentationManager
{
  return (id)[MEMORY[0x263F754A8] sharedManager];
}

- (void)configureForConversationStorable:(id)a3
{
  id v4 = a3;
  -[SiriUISnippetViewController _setVirgin:](self, "_setVirgin:", [v4 isVirgin]);
  uint64_t v5 = [v4 presentationState];

  if (v5 == 2)
  {
    [(SiriUISnippetViewController *)self _setProvisional:1];
  }
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIColor)titleBackgroundColor
{
  return self->_titleBackgroundColor;
}

- (void)setTitleBackgroundColor:(id)a3
{
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void)setAttributedSubtitle:(id)a3
{
}

- (NSString)navigationTitle
{
  return self->_navigationTitle;
}

- (void)setNavigationTitle:(id)a3
{
}

- (NSArray)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (SAUIAppPunchOut)headerPunchOut
{
  return self->_headerPunchOut;
}

- (void)setHeaderPunchOut:(id)a3
{
}

- (SAUIAppPunchOut)snippetPunchOut
{
  return self->_snippetPunchOut;
}

- (void)setSnippetPunchOut:(id)a3
{
}

- (UIEdgeInsets)defaultViewInsets
{
  double top = self->_defaultViewInsets.top;
  double left = self->_defaultViewInsets.left;
  double bottom = self->_defaultViewInsets.bottom;
  double right = self->_defaultViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDefaultViewInsets:(UIEdgeInsets)a3
{
  self->_defaultViewInsets = a3;
}

- (BOOL)wantsConfirmationInsets
{
  return self->_wantsConfirmationInsets;
}

- (void)setWantsConfirmationInsets:(BOOL)a3
{
  self->_wantsConfirmationInsets = a3;
}

- (BOOL)isFullPadWidth
{
  return self->_isFullPadWidth;
}

- (void)setIsFullPadWidth:(BOOL)a3
{
  self->_isFullPadWidth = a3;
}

- (void)setIsTransparent:(BOOL)a3
{
  self->_isTransparent = a3;
}

- (BOOL)isHint
{
  return self->_isHint;
}

- (void)setIsHint:(BOOL)a3
{
  self->_isHint = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (BOOL)isUserConfirmationEnabled
{
  return self->_userConfirmationEnabled;
}

- (UIView)containingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingView);
  return (UIView *)WeakRetained;
}

- (void)setContainingView:(id)a3
{
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (BOOL)isNavigating
{
  return self->_navigating;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (int64_t)defaultKeylineType
{
  return self->_defaultKeylineType;
}

- (void)setDefaultKeylineType:(int64_t)a3
{
  self->_defaultKeylineType = a3;
}

- (BOOL)_willAnimateConfirmation
{
  return self->_willAnimateConfirmation;
}

- (void)_setWillAnimateConfirmation:(BOOL)a3
{
  self->_willAnimateConfirmation = a3;
}

- (BOOL)_willAnimateCancellation
{
  return self->_willAnimateCancellation;
}

- (void)_setWillAnimateCancellation:(BOOL)a3
{
  self->_willAnimateCancellation = a3;
}

- (SAUIConfirmationOptions)_previousConfirmationOptions
{
  return self->_previousConfirmationOptions;
}

- (void)_setPreviousConfirmationOptions:(id)a3
{
}

- (BOOL)_isAwaitingSuccessOrFailureEvent
{
  return self->_awaitingSuccessOrFailureEvent;
}

- (void)_setAwaitingSuccessOrFailureEvent:(BOOL)a3
{
  self->_awaitingSuccessOrFailureEvent = a3;
}

- (BOOL)showHeaderChevron
{
  return self->_showHeaderChevron;
}

- (void)setShowHeaderChevron:(BOOL)a3
{
  self->_showHeaderChevron = a3;
}

- (BOOL)_isProvisional
{
  return self->_provisional;
}

- (void)_setProvisional:(BOOL)a3
{
  self->_provisional = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousConfirmationOptions, 0);
  objc_destroyWeak((id *)&self->_containingView);
  objc_storeStrong((id *)&self->_snippetPunchOut, 0);
  objc_storeStrong((id *)&self->_headerPunchOut, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_titleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_transparentFooterView, 0);
  objc_storeStrong((id *)&self->_transparentHeaderView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end