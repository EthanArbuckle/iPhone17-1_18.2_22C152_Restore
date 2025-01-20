@interface SiriUILegacyCardSnippetViewController
+ (void)initialize;
- (BOOL)cardViewController:(id)a3 shouldLoadIdentifiedCardSectionViewProvidersWithProviderManager:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isConfirmed;
- (BOOL)isFullPadWidth;
- (BOOL)removedAfterDialogProgresses;
- (BOOL)usePlatterStyle;
- (BOOL)wantsConfirmationInsets;
- (BOOL)wantsToManageBackgroundColor;
- (Class)transparentHeaderViewClass;
- (SiriUILegacyCardSnippetViewController)initWithSnippet:(id)a3;
- (id)_backingSnippetViewController;
- (id)_legacyCardSectionViewController;
- (id)attributedSubtitle;
- (id)headerPunchOut;
- (id)navigationTitle;
- (id)requestContext;
- (id)sashItem;
- (id)snippet;
- (id)snippetPunchOut;
- (id)subtitle;
- (void)_legacyCardSectionViewController;
- (void)_setVirgin:(BOOL)a3;
- (void)cardViewControllerDidLoad:(id)a3;
- (void)configureContentWithSizeClass:(int64_t)a3;
- (void)endEditingAndCorrect:(BOOL)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderPunchOut:(id)a3;
- (void)setIsFullPadWidth:(BOOL)a3;
- (void)setNavigationTitle:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setSnippet:(id)a3;
- (void)setSnippetPunchOut:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setWantsConfirmationInsets:(BOOL)a3;
- (void)siriDidDeactivate;
- (void)siriDidLayoutSnippetView;
- (void)siriWillLayoutSnippetView;
- (void)wasAddedToTranscript;
- (void)willCancel;
- (void)willConfirm;
@end

@implementation SiriUILegacyCardSnippetViewController

+ (void)initialize
{
}

- (SiriUILegacyCardSnippetViewController)initWithSnippet:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriUILegacyCardSnippetViewController;
  v5 = [(SiriUICardSnippetViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(SiriUILegacyCardSnippetViewController *)v5 setSnippet:v4];
  }

  return v6;
}

- (void)configureContentWithSizeClass:(int64_t)a3
{
  v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  int v6 = [v5 conformsToProtocol:&unk_26D67B330];

  if (v6)
  {
    id v7 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
    [v7 configureContentWithSizeClass:a3];
  }
}

- (id)_legacyCardSectionViewController
{
  v2 = [(SiriUICardSnippetViewController *)self _cardViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 _legacyCardSectionViewController];
  }
  else
  {
    id v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriUILegacyCardSnippetViewController _legacyCardSectionViewController](v4);
    }
    v3 = 0;
  }

  return v3;
}

- (id)_backingSnippetViewController
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _legacyCardSectionViewController];
  v3 = [v2 backingSnippetViewController];

  return v3;
}

- (void)setSnippet:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  int v6 = (SAUISnippet *)a3;
  if (self->_snippet != v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_snippet, a3);
      id v7 = objc_alloc(MEMORY[0x263F0FBD8]);
      id v8 = objc_alloc_init(MEMORY[0x263F0FBB0]);
      v9 = (void *)[v7 initWithIntent:v8 response:0];

      [v9 _setSnippet:self->_snippet];
      v10 = objc_alloc_init(SiriUILegacyCardSection);
      id v11 = objc_alloc_init(MEMORY[0x263F31648]);
      v18[0] = v10;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
      [v11 setCardSections:v12];

      v13 = [MEMORY[0x263EFFA08] setWithObject:v9];
      [v11 setInteractions:v13];

      v14 = (void *)[objc_alloc(MEMORY[0x263F31600]) _initWithCard:v11 delegate:self loadProvidersImmediately:1];
      v15 = [v14 _legacyCardSectionViewController];
      if (!v15)
      {
        v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"SiriUILegacyCardSnippetViewController.m" lineNumber:110 description:@"The legacy card section view controller must exist after initialization."];
      }
      [v15 setContainingSnippetViewController:self];
      v16 = [v15 backingSnippetViewController];
      [v16 setSnippet:v6];

      [(SiriUICardSnippetViewController *)self _setCardViewController:v14];
    }
  }
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUIBaseSnippetViewController *)&v6 setDelegate:a3];
  id v4 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v5 = [(SiriUILegacyCardSnippetViewController *)self _legacyCardSectionViewController];
  [v4 setDelegate:v5];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v5 setSubtitle:v4];
}

- (id)subtitle
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v3 = [v2 subtitle];

  return v3;
}

- (void)setAttributedSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v5 setAttributedSubtitle:v4];
}

- (id)attributedSubtitle
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v3 = [v2 attributedSubtitle];

  return v3;
}

- (void)setNavigationTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v5 setNavigationTitle:v4];
}

- (id)navigationTitle
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v3 = [v2 navigationTitle];

  return v3;
}

- (void)setRequestContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v5 setRequestContext:v4];
}

- (id)requestContext
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v3 = [v2 requestContext];

  return v3;
}

- (void)setHeaderPunchOut:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v5 setHeaderPunchOut:v4];
}

- (id)headerPunchOut
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v3 = [v2 headerPunchOut];

  return v3;
}

- (void)setSnippetPunchOut:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v5 setSnippetPunchOut:v4];
}

- (id)snippetPunchOut
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  v3 = [v2 snippetPunchOut];

  return v3;
}

- (void)setWantsConfirmationInsets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v4 setWantsConfirmationInsets:v3];
}

- (BOOL)wantsConfirmationInsets
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v3 = [v2 wantsConfirmationInsets];

  return v3;
}

- (void)setIsFullPadWidth:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v4 setIsFullPadWidth:v3];
}

- (BOOL)isFullPadWidth
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v3 = [v2 isFullPadWidth];

  return v3;
}

- (void)setConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v4 setConfirmed:v3];
}

- (BOOL)isConfirmed
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v3 = [v2 isConfirmed];

  return v3;
}

- (void)setCancelled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v4 setCancelled:v3];
}

- (BOOL)isCancelled
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v3 = [v2 isCancelled];

  return v3;
}

- (void)willConfirm
{
  char v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v3 willConfirm];

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUICardSnippetViewController *)&v4 willConfirm];
}

- (void)willCancel
{
  char v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v3 willCancel];

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUICardSnippetViewController *)&v4 willCancel];
}

- (void)_setVirgin:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v4 _setVirgin:v3];
}

- (void)siriWillLayoutSnippetView
{
  BOOL v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v3 siriWillLayoutSnippetView];

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUISnippetViewController *)&v4 siriWillLayoutSnippetView];
}

- (void)siriDidLayoutSnippetView
{
  BOOL v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v3 siriDidLayoutSnippetView];

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUISnippetViewController *)&v4 siriDidLayoutSnippetView];
}

- (BOOL)removedAfterDialogProgresses
{
  v2 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v3 = [v2 removedAfterDialogProgresses];

  return v3;
}

- (BOOL)usePlatterStyle
{
  char v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v6 = [v5 usePlatterStyle];

  return v6;
}

- (BOOL)wantsToManageBackgroundColor
{
  char v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
    char v6 = [v5 wantsToManageBackgroundColor];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SiriUILegacyCardSnippetViewController;
    return [(SiriUISnippetViewController *)&v8 wantsToManageBackgroundColor];
  }
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
    [v7 endEditingAndCorrect:v3];
  }
}

- (id)sashItem
{
  v9.receiver = self;
  v9.super_class = (Class)SiriUILegacyCardSnippetViewController;
  BOOL v3 = [(SiriUIBaseSnippetViewController *)&v9 sashItem];
  char v4 = v3;
  if (!v3 || [v3 isDefault])
  {
    id v5 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
    char v6 = [v5 sashItem];

    if (v6)
    {
      id v7 = v6;

      char v4 = v7;
    }
  }
  return v4;
}

- (void)siriDidDeactivate
{
  BOOL v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v3 siriDidDeactivate];

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUICardSnippetViewController *)&v4 siriDidDeactivate];
}

- (void)wasAddedToTranscript
{
  BOOL v3 = [(SiriUILegacyCardSnippetViewController *)self _backingSnippetViewController];
  [v3 wasAddedToTranscript];

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUICardSnippetViewController *)&v4 wasAddedToTranscript];
}

- (Class)transparentHeaderViewClass
{
  return 0;
}

- (BOOL)cardViewController:(id)a3 shouldLoadIdentifiedCardSectionViewProvidersWithProviderManager:(id)a4
{
  return 0;
}

- (void)cardViewControllerDidLoad:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUICardSnippetViewController *)self _cardViewController];

  if (!v5) {
    [(SiriUICardSnippetViewController *)self _setCardViewController:v4];
  }
  v6.receiver = self;
  v6.super_class = (Class)SiriUILegacyCardSnippetViewController;
  [(SiriUICardSnippetViewController *)&v6 cardViewControllerDidLoad:v4];
}

- (id)snippet
{
  return self->_snippet;
}

- (void).cxx_destruct
{
}

- (void)_legacyCardSectionViewController
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  int v4 = 136315394;
  id v5 = "-[SiriUILegacyCardSnippetViewController _legacyCardSectionViewController]";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_2231EF000, v1, OS_LOG_TYPE_ERROR, "%s #cards The card view controller in this legacy snippet is not a CRKCardViewController, but instead a %@. This is a bug and we can't get a legacy card section view controller in this case.", (uint8_t *)&v4, 0x16u);
}

@end