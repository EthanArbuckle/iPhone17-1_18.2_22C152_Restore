@interface SearchUICardViewController
+ (void)_loadAndEnrichCardSectionsFromCard:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)hasCustomViewControllersForCardSections;
- (BOOL)hasFocusableElements;
- (BOOL)hasFocusableElementsInSnapshot:(id)a3;
- (BOOL)isInPreviewPlatter;
- (BOOL)rowSelectionAppearanceEnabled;
- (BOOL)scrollEnabled;
- (BOOL)shouldDrawBackgroundColor;
- (BOOL)shouldForceEnableThreeDTouch:(id)a3;
- (BOOL)shouldUseInsetRoundedSections;
- (BOOL)threeDTouchEnabled;
- (BOOL)topRowWillFillBackgroundWithContent;
- (CGSize)preferredContentSize;
- (NSTimer)loadingScreenTimer;
- (SFCard)card;
- (SFFeedbackListener)feedbackListener;
- (SearchUIBackgroundColorView)colorView;
- (SearchUICardCollectionViewController)tableViewController;
- (SearchUICardViewController)init;
- (SearchUICardViewController)initWithCard:(id)a3 feedbackListener:(id)a4;
- (SearchUICardViewController)initWithCard:(id)a3 style:(unint64_t)a4 feedbackListener:(id)a5;
- (SearchUICardViewDelegate)delegate;
- (SearchUICommandDelegate)commandDelegate;
- (SearchUILoadingView)loadingView;
- (UITextField)textField;
- (double)contentHeightForWidth:(double)a3;
- (double)initialPreviewPlatterHeight;
- (id)restorationContext;
- (id)searchUIBackgroundColor;
- (id)viewContainingContent;
- (unint64_t)level;
- (void)cardViewDidAppear;
- (void)contentSizeDidChange:(CGSize)a3 animated:(BOOL)a4;
- (void)displayLoadingViewAfterDelay:(double)a3;
- (void)prepareLoadingView;
- (void)scrollAndSelectLastSelectedIndexPath;
- (void)setCard:(id)a3;
- (void)setColorView:(id)a3;
- (void)setCommandDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackListener:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHasFocusableElements:(BOOL)a3;
- (void)setInPreviewPlatter:(BOOL)a3;
- (void)setInitialPreviewPlatterHeight:(double)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setLoadingScreenTimer:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setRestorationContext:(id)a3;
- (void)setRowSelectionAppearanceEnabled:(BOOL)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setShouldDrawBackgroundColor:(BOOL)a3;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
- (void)setTableViewController:(id)a3;
- (void)setTextField:(id)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
- (void)updateBackgroundColor;
- (void)updateTimerAndCardSections:(id)a3;
- (void)updateWithCardSections:(id)a3;
@end

@implementation SearchUICardViewController

- (SearchUICardViewController)init
{
  return [(SearchUICardViewController *)self initWithCard:0 feedbackListener:0];
}

- (SearchUICardViewController)initWithCard:(id)a3 style:(unint64_t)a4 feedbackListener:(id)a5
{
  return [(SearchUICardViewController *)self initWithCard:a3 feedbackListener:a5];
}

- (SearchUICardViewController)initWithCard:(id)a3 feedbackListener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SearchUICardViewController;
  v8 = [(SearchUICardViewController *)&v26 init];
  v9 = v8;
  if (v8)
  {
    [(SearchUICardViewController *)v8 setLevel:1];
    v10 = objc_opt_new();
    [(SearchUICardViewController *)v9 setView:v10];

    v11 = objc_opt_new();
    [(SearchUICardViewController *)v9 setTableViewController:v11];

    v12 = [(SearchUICardViewController *)v9 view];
    v13 = [(SearchUICardViewController *)v9 tableViewController];
    v14 = [v13 view];
    [v12 addSubview:v14];

    v15 = [(SearchUICardViewController *)v9 tableViewController];
    v16 = [v15 view];
    +[SearchUIAutoLayout constrainViewToContainer:v16];

    v17 = [(SearchUICardViewController *)v9 tableViewController];
    [(SearchUICardViewController *)v9 addChildViewController:v17];

    v9->_shouldDrawBackgroundColor = 1;
    [(SearchUICardViewController *)v9 setCard:v6];
    [(SearchUICardViewController *)v9 setFeedbackListener:v7];
    id v18 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v19 = +[SearchUIUtilities localizedStringForKey:@"BACK_BUTTON_TITLE"];
    v20 = (void *)[v18 initWithTitle:v19 style:0 target:0 action:0];
    v21 = [(SearchUICardViewController *)v9 navigationItem];
    [v21 setBackBarButtonItem:v20];

    v22 = [(SearchUICardViewController *)v9 tableViewController];
    [v22 setSizingDelegate:v9];

    v23 = [(SearchUICardViewController *)v9 tableViewController];
    v24 = [v23 scrollViewForSizing];
    [(SearchUICardViewController *)v9 setContentScrollView:v24 forEdge:15];
  }
  return v9;
}

- (BOOL)shouldUseInsetRoundedSections
{
  v2 = [(SearchUICardViewController *)self view];
  char v3 = [v2 shouldUseInsetRoundedSections];

  return v3;
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SearchUICardViewController *)self view];
  [v5 setShouldUseInsetRoundedSections:v3];

  id v6 = [(SearchUICardViewController *)self tableViewController];
  [v6 setShouldUseInsetRoundedSections:v3];
}

- (BOOL)rowSelectionAppearanceEnabled
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  char v3 = [v2 rowSelectionAppearanceEnabled];

  return v3;
}

- (void)setRowSelectionAppearanceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchUICardViewController *)self tableViewController];
  [v4 setRowSelectionAppearanceEnabled:v3];
}

- (BOOL)isInPreviewPlatter
{
  v2 = [(SearchUICardViewController *)self view];
  char v3 = [v2 isInPreviewPlatter];

  return v3;
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SearchUICardViewController *)self view];
  [v5 setInPreviewPlatter:v3];

  id v6 = [(SearchUICardViewController *)self tableViewController];
  [v6 setInPreviewPlatter:v3];
}

- (double)contentHeightForWidth:(double)a3
{
  return 0.0;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUICardViewController *)self tableViewController];
  [v5 setCardViewDelegate:v4];

  if (v4)
  {
    id v8 = [(SearchUICardViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(SearchUICardViewController *)self tableViewController];
      id v7 = [v6 tableModel];

      if (!v7) {
        return;
      }
      id v8 = [(SearchUICardViewController *)self tableViewController];
      [v8 reloadViews];
    }
  }
}

- (SearchUICardViewDelegate)delegate
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  BOOL v3 = [v2 cardViewDelegate];

  return (SearchUICardViewDelegate *)v3;
}

- (void)setFeedbackListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICardViewController *)self tableViewController];
  [v5 setFeedbackListener:v4];
}

- (SFFeedbackListener)feedbackListener
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  BOOL v3 = [v2 feedbackListener];

  return (SFFeedbackListener *)v3;
}

- (void)displayLoadingViewAfterDelay:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke;
  v5[3] = &unk_1E6E743A0;
  v5[4] = self;
  id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:a3];
  [(SearchUICardViewController *)self setLoadingScreenTimer:v4];
}

uint64_t __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareLoadingView];
  v2 = [*(id *)(a1 + 32) loadingView];
  [v2 setAlpha:0.0];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke_2;
  v4[3] = &unk_1E6E72730;
  v4[4] = *(void *)(a1 + 32);
  return +[SearchUIUtilities performAnimatableChanges:v4 animated:1];
}

void __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) loadingView];
  [v1 setAlpha:1.0];
}

- (void)prepareLoadingView
{
  BOOL v3 = [(SearchUICardViewController *)self loadingView];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [(SearchUICardViewController *)self setLoadingView:v4];

    id v5 = [(SearchUICardViewController *)self view];
    id v6 = [(SearchUICardViewController *)self loadingView];
    [v5 addSubview:v6];

    id v7 = [(SearchUICardViewController *)self loadingView];
    +[SearchUIAutoLayout fillContainerWithView:v7];
  }
  id v8 = [(SearchUICardViewController *)self loadingView];
  [v8 setAlpha:0.0];

  v9 = [(SearchUICardViewController *)self loadingView];
  [v9 setHidden:0];

  id v10 = [(SearchUICardViewController *)self loadingView];
  [v10 setLoadingState:0];
}

- (void)cardViewDidAppear
{
  BOOL v3 = [(SearchUICardViewController *)self feedbackListener];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F99F40]);
    id v6 = [(SearchUICardViewController *)self card];
    id v8 = (id)[v5 initWithCard:v6];

    objc_msgSend(v8, "setLevel:", -[SearchUICardViewController level](self, "level"));
    id v7 = [(SearchUICardViewController *)self feedbackListener];
    [v7 cardViewDidAppear:v8];
  }
}

- (id)searchUIBackgroundColor
{
  v2 = [(SearchUICardViewController *)self card];
  BOOL v3 = [v2 backgroundColor];

  return v3;
}

- (void)setShouldDrawBackgroundColor:(BOOL)a3
{
  if (self->_shouldDrawBackgroundColor != a3)
  {
    self->_shouldDrawBackgroundColor = a3;
    [(SearchUICardViewController *)self updateBackgroundColor];
  }
}

- (void)updateBackgroundColor
{
  BOOL v3 = [(SearchUICardViewController *)self shouldDrawBackgroundColor];
  if (v3)
  {
    char v4 = [(SearchUICardViewController *)self searchUIBackgroundColor];
    if (v4)
    {
      id v5 = [(SearchUICardViewController *)self colorView];

      if (!v5)
      {
        id v6 = objc_opt_new();
        [(SearchUICardViewController *)self setColorView:v6];

        id v7 = [(SearchUICardViewController *)self colorView];
        [v7 setDelegate:self];

        id v8 = [(SearchUICardViewController *)self colorView];
        [v8 setShowsPlaceholderPlatterView:0];

        v9 = [(SearchUICardViewController *)self view];
        id v10 = [(SearchUICardViewController *)self colorView];
        [v9 insertSubview:v10 atIndex:0];

        v11 = [(SearchUICardViewController *)self colorView];
        +[SearchUIAutoLayout fillContainerWithView:v11];
      }
    }
    v12 = [(SearchUICardViewController *)self colorView];
    [v12 setColor:v4];

    v13 = [(SearchUICardViewController *)self card];
    v14 = [v13 backgroundImage];
    v15 = [(SearchUICardViewController *)self colorView];
    [v15 setBackgroundImage:v14];
  }
  id v16 = [(SearchUICardViewController *)self colorView];
  [v16 setHidden:!v3];
}

- (id)viewContainingContent
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  BOOL v3 = [v2 view];

  return v3;
}

+ (void)_loadAndEnrichCardSectionsFromCard:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__SearchUICardViewController__loadAndEnrichCardSectionsFromCard_withCompletionHandler___block_invoke;
  v7[3] = &unk_1E6E72E48;
  id v8 = v5;
  id v6 = v5;
  [a3 loadCardSectionsWithCompletionHandler:v7];
}

void __87__SearchUICardViewController__loadAndEnrichCardSectionsFromCard_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  id v6 = [v3 firstObject];
  id v7 = [v6 flight];

  id v8 = [v7 legs];
  uint64_t v9 = [v8 count];

  if (v9 != 1)
  {

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_6;
  }
  id v10 = [v7 legs];
  v11 = [v10 lastObject];

  id v14 = *(id *)(a1 + 32);
  id v13 = v3;
  id v12 = v11;
  GEOFetchOfflineMapsDownloadURLForSFFlightLeg();

LABEL_6:
}

void __87__SearchUICardViewController__loadAndEnrichCardSectionsFromCard_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (v16)
  {
    id v3 = (void *)[*(id *)(a1 + 32) mutableCopy];
    char v4 = NSString;
    id v5 = +[SearchUIUtilities localizedStringForKey:@"DOWNLOAD_MAP_ACTION_TITLE_FORMAT"];
    id v6 = [*(id *)(a1 + 40) arrivalAirport];
    id v7 = [v6 city];
    id v8 = [v4 stringWithValidatedFormat:v5, @"%@", 0, v7 validFormatSpecifiers error];

    uint64_t v9 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v16];
    id v10 = +[SearchUIUtilities bundleIdentifierForApp:9];
    [v9 setBundleIdentifier:v10];

    [v9 setActionTarget:@"download-map"];
    v11 = objc_opt_new();
    [v11 setPunchout:v9];
    id v12 = objc_opt_new();
    id v13 = +[SearchUIUtilities bundleIdentifierForApp:9];
    [v12 setBundleIdentifier:v13];

    id v14 = objc_opt_new();
    v15 = [MEMORY[0x1E4F9A378] textWithString:v8];
    [v14 setLeadingText:v15];

    [v14 setImage:v12];
    [v14 setCommand:v11];
    [v14 setImageIsRightAligned:1];
    [v3 addObject:v14];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)setCard:(id)a3
{
  id v4 = a3;
  id v5 = [v4 title];
  id v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];
  [(SearchUICardViewController *)self setTitle:v7];

  id v8 = [(SearchUICardViewController *)self tableViewController];
  [v8 setTableModel:0];

  uint64_t v9 = [(SearchUICardViewController *)self tableViewController];
  [v9 setCard:v4];

  id v10 = [(SearchUICardViewController *)self tableViewController];
  v11 = [v10 view];
  [v11 setAlpha:0.0];

  id v12 = [(SearchUICardViewController *)self loadingView];
  [v12 setAlpha:0.0];

  id v13 = [(SearchUICardViewController *)self colorView];
  [v13 setHidden:1];

  if (v4)
  {
    [(SearchUICardViewController *)self displayLoadingViewAfterDelay:0.7];
    id v14 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__SearchUICardViewController_setCard___block_invoke;
    v15[3] = &unk_1E6E729B0;
    id v16 = v4;
    v17 = self;
    [v14 _loadAndEnrichCardSectionsFromCard:v16 withCompletionHandler:v15];
  }
  else
  {
    [(SearchUICardViewController *)self prepareLoadingView];
    [(SearchUICardViewController *)self updateWithCardSections:0];
  }
}

void __38__SearchUICardViewController_setCard___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SearchUICardViewController_setCard___block_invoke_2;
  v7[3] = &unk_1E6E72938;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v7];
}

void __38__SearchUICardViewController_setCard___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) card];

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) updateBackgroundColor];
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 updateTimerAndCardSections:v5];
  }
}

- (SFCard)card
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  id v3 = [v2 card];

  return (SFCard *)v3;
}

- (void)updateTimerAndCardSections:(id)a3
{
  id v7 = a3;
  id v4 = [(SearchUICardViewController *)self loadingScreenTimer];
  if ([v4 isValid])
  {
    uint64_t v5 = [v7 count];

    if (!v5) {
      [(SearchUICardViewController *)self prepareLoadingView];
    }
  }
  else
  {
  }
  id v6 = [(SearchUICardViewController *)self loadingScreenTimer];
  [v6 invalidate];

  [(SearchUICardViewController *)self setLoadingScreenTimer:0];
  [(SearchUICardViewController *)self updateWithCardSections:v7];
}

- (BOOL)hasCustomViewControllersForCardSections
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SearchUICardViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v3 = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(SearchUICardViewController *)self card];
  uint64_t v5 = [v4 cardSections];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v3 customViewControllerForCardSection:v9];
        if (v10)
        {

LABEL_15:
          LOBYTE(v6) = 1;
          goto LABEL_16;
        }
        if (!+[SearchUICardSectionCreator viewClassForCardSection:horizontal:](SearchUICardSectionCreator, "viewClassForCardSection:horizontal:", v9, 0)&& !+[SnippetUIUtilities supportsConfigurationForCardSection:v9])
        {
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v6;
}

- (void)updateWithCardSections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SearchUICardViewController *)self card];
  uint64_t v6 = +[SearchUITableModel tableModelWithCardSections:result:isInline:queryId:shouldCombine:](SearchUITableModel, "tableModelWithCardSections:result:isInline:queryId:shouldCombine:", v4, 0, 0, [v5 queryId], -[SearchUICardViewController hasCustomViewControllersForCardSections](self, "hasCustomViewControllersForCardSections") ^ 1);

  uint64_t v7 = [(SearchUICardViewController *)self loadingView];
  [v7 setLoadingState:1];

  uint64_t v8 = [v4 count];
  if (v8)
  {
    uint64_t v9 = [(SearchUICardViewController *)self tableViewController];
    [v9 setTableModel:v6];

    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __53__SearchUICardViewController_updateWithCardSections___block_invoke;
    v33 = &unk_1E6E72730;
    v34 = self;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __53__SearchUICardViewController_updateWithCardSections___block_invoke_2;
    v28 = &unk_1E6E72730;
    v29 = self;
    id v10 = &v30;
    v11 = &v25;
  }
  else
  {
    v19 = self;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __53__SearchUICardViewController_updateWithCardSections___block_invoke_3;
    v23 = &unk_1E6E72730;
    v24 = self;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __53__SearchUICardViewController_updateWithCardSections___block_invoke_4;
    id v18 = &unk_1E6E72730;
    id v10 = &v20;
    v11 = &v15;
  }
  +[SearchUIUtilities performAnimatableChanges:animated:completion:](SearchUIUtilities, "performAnimatableChanges:animated:completion:", v10, 1, v11, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34);
  long long v12 = [(SearchUICardViewController *)self tableViewController];
  long long v13 = [v12 dataSource];
  long long v14 = [v13 snapshot];
  [(SearchUICardViewController *)self setHasFocusableElements:[(SearchUICardViewController *)self hasFocusableElementsInSnapshot:v14]];
}

void __53__SearchUICardViewController_updateWithCardSections___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingView];
  [v2 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) tableViewController];
  id v3 = [v4 view];
  [v3 setAlpha:1.0];
}

uint64_t __53__SearchUICardViewController_updateWithCardSections___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingView];
  [v2 setHidden:1];

  id v3 = *(void **)(a1 + 32);
  return [v3 cardViewDidAppear];
}

void __53__SearchUICardViewController_updateWithCardSections___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) loadingView];
  [v1 setAlpha:0.0];
}

uint64_t __53__SearchUICardViewController_updateWithCardSections___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingView];
  [v2 setLoadingState:2];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SearchUICardViewController_updateWithCardSections___block_invoke_5;
  v4[3] = &unk_1E6E72730;
  v4[4] = *(void *)(a1 + 32);
  return +[SearchUIUtilities performAnimatableChanges:v4];
}

void __53__SearchUICardViewController_updateWithCardSections___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) loadingView];
  [v1 setAlpha:1.0];
}

- (BOOL)hasFocusableElementsInSnapshot:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "itemIdentifiers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isFocusable])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)topRowWillFillBackgroundWithContent
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  id v3 = [v2 tableModel];
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  char v5 = [v3 rowWillFillBackgroundWithContentAtIndexPath:v4];

  return v5;
}

- (void)setCommandDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICardViewController *)self tableViewController];
  [v5 setCommandDelegate:v4];
}

- (SearchUICommandDelegate)commandDelegate
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  id v3 = [v2 commandDelegate];

  return (SearchUICommandDelegate *)v3;
}

- (void)setTextField:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICardViewController *)self tableViewController];
  [v5 setTextField:v4];
}

- (UITextField)textField
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  id v3 = [v2 textField];

  return (UITextField *)v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SearchUICardViewController *)self tableViewController];
  uint64_t v6 = [v5 scrollViewForSizing];
  [v6 setScrollEnabled:v3];

  id v8 = [(SearchUICardViewController *)self tableViewController];
  uint64_t v7 = [v8 scrollViewForSizing];
  [v7 _setSafeAreaInsetsFrozen:v3 ^ 1];
}

- (BOOL)scrollEnabled
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  BOOL v3 = [v2 scrollViewForSizing];
  char v4 = [v3 isScrollEnabled];

  return v4;
}

- (BOOL)threeDTouchEnabled
{
  v2 = [(SearchUICardViewController *)self tableViewController];
  char v3 = [v2 threeDTouchEnabled];

  return v3;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(SearchUICardViewController *)self card];
  uint64_t v5 = [(SearchUICardViewController *)self shouldForceEnableThreeDTouch:v7] | v3;
  uint64_t v6 = [(SearchUICardViewController *)self tableViewController];
  [v6 setThreeDTouchEnabled:v5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contentSizeDidChange:(CGSize)a3 animated:(BOOL)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  id v8 = [(SearchUICardViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0 && height != 0.0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke;
    block[3] = &unk_1E6E743F0;
    block[4] = self;
    *(CGFloat *)&block[5] = width;
    *(double *)&block[6] = height;
    BOOL v12 = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([(SearchUICardViewController *)self isInPreviewPlatter])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_2;
    v10[3] = &unk_1E6E74418;
    v10[4] = self;
    *(CGFloat *)&v10[5] = width;
    *(double *)&v10[6] = height;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "cardViewController:preferredContentSizeDidChange:animated:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_3;
  v2[3] = &unk_1E6E74418;
  v2[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  return +[SearchUIUtilities performAnimatableChanges:v2];
}

uint64_t __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) initialPreviewPlatterHeight];
  if (v2 == 0.0)
  {
    long long v3 = [*(id *)(a1 + 32) view];
    [v3 bounds];
    [*(id *)(a1 + 32) setInitialPreviewPlatterHeight:CGRectGetHeight(v9)];
  }
  [*(id *)(a1 + 32) initialPreviewPlatterHeight];
  double v5 = *(double *)(a1 + 48);
  if (v4 < v5) {
    double v5 = v4;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setPreferredContentSize:", 0.0, v5);
}

- (CGSize)preferredContentSize
{
  long long v3 = [(SearchUICardViewController *)self tableViewController];
  [v3 collectionViewContentSize];
  if (v5 == *MEMORY[0x1E4F1DB30] && v4 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    BOOL v12 = [(SearchUICardViewController *)self view];
    [v12 frame];
    double v9 = v13;
    double v11 = 44.0;
  }
  else
  {
    id v7 = [(SearchUICardViewController *)self tableViewController];
    [v7 collectionViewContentSize];
    double v9 = v8;
    double v11 = v10;

    if (v11 == 0.0 && [MEMORY[0x1E4FAE198] isSiri]) {
      double v11 = 1.0;
    }
  }
  if ([(SearchUICardViewController *)self isInPreviewPlatter])
  {
    v18.receiver = self;
    v18.super_class = (Class)SearchUICardViewController;
    [(SearchUICardViewController *)&v18 preferredContentSize];
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v9;
  double v17 = v11;
  result.double height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)setFooterView:(id)a3
{
  id v7 = a3;
  double v4 = [(SearchUICardViewController *)self tableViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [(SearchUICardViewController *)self tableViewController];
    [v6 setFooterView:v7];
  }
}

- (void)scrollAndSelectLastSelectedIndexPath
{
  id v2 = [(SearchUICardViewController *)self tableViewController];
  [v2 scrollAndSelectLastSelectedIndexPath];
}

- (void)setRestorationContext:(id)a3
{
  id v8 = a3;
  double v4 = [(SearchUICardViewController *)self tableViewController];
  [v4 setRestorationContext:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v8 card];
    [(SearchUICardViewController *)self setCard:v5];

    -[SearchUICardViewController setLevel:](self, "setLevel:", [v8 level]);
    uint64_t v6 = [v8 card];

    if (v6)
    {
      id v7 = [(SearchUICardViewController *)self loadingView];
      [v7 removeFromSuperview];
    }
  }
}

- (id)restorationContext
{
  long long v3 = [(SearchUICardViewController *)self tableViewController];
  double v4 = [v3 restorationContext];

  objc_msgSend(v4, "setLevel:", -[SearchUICardViewController level](self, "level"));
  double v5 = [(SearchUICardViewController *)self card];
  [v4 setCard:v5];

  return v4;
}

- (BOOL)shouldForceEnableThreeDTouch:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v3 = [a3 cardSections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v8 forceEnable3DTouch])
        {
LABEL_21:
          BOOL v15 = 1;
          goto LABEL_23;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          double v10 = objc_msgSend(v9, "cardSections", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ([*(id *)(*((void *)&v17 + 1) + 8 * j) forceEnable3DTouch])
                {

                  goto LABEL_21;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      BOOL v15 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_23:

  return v15;
}

- (BOOL)shouldDrawBackgroundColor
{
  return self->_shouldDrawBackgroundColor;
}

- (BOOL)hasFocusableElements
{
  return self->_hasFocusableElements;
}

- (void)setHasFocusableElements:(BOOL)a3
{
  self->_hasFocusableElements = a3;
}

- (SearchUIBackgroundColorView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (SearchUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (NSTimer)loadingScreenTimer
{
  return self->_loadingScreenTimer;
}

- (void)setLoadingScreenTimer:(id)a3
{
}

- (double)initialPreviewPlatterHeight
{
  return self->_initialPreviewPlatterHeight;
}

- (void)setInitialPreviewPlatterHeight:(double)a3
{
  self->_initialPreviewPlatterHeight = a3;
}

- (SearchUICardCollectionViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_loadingScreenTimer, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
}

@end