@interface VideosExtrasListTemplateViewController
+ (id)relatedContentViewControllerForElement:(id)a3;
- (BOOL)shouldUpdateByReplacingViewControllerWithTemplate:(id)a3;
- (BOOL)showsPlaceholder;
- (VideosExtrasListTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (VideosExtrasViewElementViewController)relatedContentViewController;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)templateElement;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addConstraintsToTableView:(id)a3;
- (void)_configureBannerWithElement:(id)a3;
- (void)_configureVignette:(BOOL)a3;
- (void)_embedRelatedContentViewController;
- (void)_prepareLayout;
- (void)_pushRelatedViewController:(id)a3 animated:(BOOL)a4;
- (void)_setDetailContraints;
- (void)_setRelatedContentEmbedded:(BOOL)a3;
- (void)_unembedRelatedContent;
- (void)_updateForTemplate:(id)a3;
- (void)_updateRelatedContent:(id)a3 forListItem:(id)a4;
- (void)dealloc;
- (void)setRelatedContentViewController:(id)a3;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation VideosExtrasListTemplateViewController

- (VideosExtrasListTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)VideosExtrasListTemplateViewController;
  v5 = [(VideosExtrasTemplateViewController *)&v14 initWithDocument:a3 options:a4 context:a5];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    relatedContentViewControllerMap = v5->_relatedContentViewControllerMap;
    v5->_relatedContentViewControllerMap = (NSMapTable *)v6;

    v8 = [(VideosExtrasListTemplateViewController *)v5 templateElement];
    v9 = [v8 list];
    v10 = [v9 sections];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke;
    v12[3] = &unk_1E6DFC3C0;
    v13 = v5;
    [v10 enumerateObjectsUsingBlock:v12];
  }
  return v5;
}

void __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7 = [a2 items];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke_2;
  v8[3] = &unk_1E6DFC398;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = [a2 autoHighlightIdentifier];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 1088);
    *(void *)(v9 + 1088) = v8;

    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

- (void)dealloc
{
  [(UITableView *)self->_tableView setDataSource:0];
  [(UITableView *)self->_tableView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasListTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v3 dealloc];
}

- (id)templateElement
{
  v2 = [(VideosExtrasTemplateViewController *)self document];
  objc_super v3 = [v2 templateElement];

  return v3;
}

- (BOOL)showsPlaceholder
{
  return 0;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)VideosExtrasListTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v33 viewDidLoad];
  objc_super v3 = [(VideosExtrasListTemplateViewController *)self view];
  v4 = [(VideosExtrasListTemplateViewController *)self templateElement];
  v5 = [v4 style];
  uint64_t v6 = [v5 elementAlignment];

  self->_tableViewLeft = v6 == 1;
  v7 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v8 = [v7 background];

  uint64_t v9 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v10 = [v9 documentBanner];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = v11;
  if (v8) {
    [v11 addObject:v8];
  }
  v13 = [v10 background];

  if (v13)
  {
    objc_super v14 = [v10 background];
    [v12 addObject:v14];
  }
  [(VideosExtrasTemplateViewController *)self configureBackgroundWithElements:v12];
  [(VideosExtrasListTemplateViewController *)self _configureBannerWithElement:v10];
  v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  vignetteView = self->_vignetteView;
  self->_vignetteView = v15;

  [(UIImageView *)self->_vignetteView setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  v18 = self->_vignetteView;
  v19 = [(VideosExtrasListTemplateViewController *)self view];
  v20 = objc_msgSend(v17, "constraintsByAttachingView:toView:alongEdges:insets:", v18, v19, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  v21 = [(VideosExtrasListTemplateViewController *)self view];
  [v21 addSubview:self->_vignetteView];

  v22 = [(VideosExtrasListTemplateViewController *)self view];
  [v22 addConstraints:v20];

  v23 = [VideosExtrasTableView alloc];
  v24 = -[VideosExtrasTableView initWithFrame:style:](v23, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v24;

  [(UITableView *)self->_tableView _setHeaderAndFooterViewsFloat:0];
  [(UITableView *)self->_tableView setSeparatorStyle:1];
  v26 = self->_tableView;
  v27 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
  [(UITableView *)v26 setSeparatorColor:v27];

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"ListTableViewCell"];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  v28 = self->_tableView;
  v29 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITableView *)v28 setBackgroundColor:v29];

  [(UITableView *)self->_tableView setShowsHorizontalScrollIndicator:0];
  [(UITableView *)self->_tableView setShowsVerticalScrollIndicator:0];
  v30 = self->_tableView;
  id v31 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UITableView *)v30 setTableFooterView:v31];

  [(UITableView *)self->_tableView _setContentInsetAdjustmentBehavior:2];
  [(UITableView *)self->_tableView setEstimatedRowHeight:60.0];
  v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2030];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setBackgroundView:v32];
  [v3 addSubview:self->_tableView];
}

- (void)_addConstraintsToTableView:(id)a3
{
  id v32 = a3;
  v4 = [(VideosExtrasListTemplateViewController *)self view];
  v5 = v4;
  if (self->_masterViewConstraints) {
    objc_msgSend(v4, "removeConstraints:");
  }
  if ([(VideosExtrasElementViewController *)self isWide])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsBySizingView:toSize:", v32, 305.0, 500.0);
    if (self->_tableViewLeft) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 5;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F6F1A8];
    UIEdgeInsetsMakeWithEdges();
    uint64_t v9 = objc_msgSend(v8, "positionConstraintsForView:insets:position:", v32, v7);
    uint64_t v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v32 attribute:10 relatedBy:0 toItem:v5 attribute:10 multiplier:1.0 constant:0.0];
    id v11 = [v9 arrayByAddingObject:v10];

    v12 = [v6 arrayByAddingObjectsFromArray:v11];
    masterViewConstraints = self->_masterViewConstraints;
    self->_masterViewConstraints = v12;

    objc_msgSend(v32, "setContentInset:", 0.0, 0.0, 60.0, 0.0);
  }
  else
  {
    double v15 = *MEMORY[0x1E4FB2848];
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v32, v5, 13, *MEMORY[0x1E4FB2848], v14, v17, v16);
    v18 = [(VideosExtrasListTemplateViewController *)self navigationController];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      v20 = [(VideosExtrasListTemplateViewController *)self navigationController];
      v21 = [v20 mainTemplateViewController];
      v22 = [v21 view];
      [v22 bounds];
      double v24 = v23;

      double v17 = 60.0;
      if (v24 > 60.0)
      {
        v25 = [v21 menuBarView];
        [v25 bounds];
        double v27 = v26;

        double v17 = fmax(v27, 60.0);
      }
    }
    objc_msgSend(v32, "setContentInset:", v15, v14, v17, v16);
    v28 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v28 bounds];
    if (v29 > 480.0) {
      double v30 = 0.4;
    }
    else {
      double v30 = 0.5;
    }

    id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v32 attribute:7 relatedBy:0 toItem:v5 attribute:7 multiplier:v30 constant:0.0];
    id v31 = [v6 arrayByAddingObject:v11];
    uint64_t v10 = self->_masterViewConstraints;
    self->_masterViewConstraints = v31;
  }

  [v5 addConstraints:self->_masterViewConstraints];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(VideosExtrasListTemplateViewController *)self templateElement];
  v4 = [v3 list];
  v5 = [v4 sections];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(VideosExtrasListTemplateViewController *)self templateElement];
  int64_t v6 = [v5 list];
  uint64_t v7 = [v6 sections];
  uint64_t v8 = [v7 objectAtIndex:a4];
  uint64_t v9 = [v8 items];
  int64_t v10 = [v9 count];

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"ListTableViewCell" forIndexPath:v7];
  uint64_t v9 = [v7 section];
  uint64_t v10 = [v7 row];
  id v11 = [(VideosExtrasListTemplateViewController *)self templateElement];
  v12 = [v11 list];
  v13 = [v12 sections];

  if (v9 >= [v13 count])
  {
    double v14 = 0;
  }
  else
  {
    double v14 = [v13 objectAtIndex:v9];
  }
  double v15 = [v14 items];
  if (v10 < [v15 count])
  {
    uint64_t v16 = [v15 objectAtIndex:v10];
    if (v16)
    {
      double v17 = (void *)v16;
      objc_msgSend(v8, "configureForListItemLockupElement:wide:", v16, -[VideosExtrasElementViewController isWide](self, "isWide"));
    }
  }
  v18 = [v6 indexPathForSelectedRow];
  uint64_t v19 = [v7 isEqual:v18];

  [v8 setSelected:v19 animated:0];
  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (tableView_heightForHeaderInSection__onceToken != -1) {
    dispatch_once(&tableView_heightForHeaderInSection__onceToken, &__block_literal_global_141);
  }
  id v7 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v8 = [v7 list];
  uint64_t v9 = [v8 sections];

  if ([v9 count] <= a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndex:a4];
  }
  id v11 = [v10 header];
  v12 = [v11 title];
  v13 = [v12 text];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    [(id)tableView_heightForHeaderInSection__headerView configureForHeaderElement:v11];
    [(id)tableView_heightForHeaderInSection__headerView intrinsicContentSize];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

void __77__VideosExtrasListTemplateViewController_tableView_heightForHeaderInSection___block_invoke()
{
  v0 = [[VideosExtrasTableViewHeaderView alloc] initWithReuseIdentifier:@"ListTableViewHeaderLayout"];
  v1 = (void *)tableView_heightForHeaderInSection__headerView;
  tableView_heightForHeaderInSection__headerView = (uint64_t)v0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v8 = [v7 list];
  uint64_t v9 = [v8 sections];

  if ([v9 count] <= a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndex:a4];
  }
  id v11 = [v10 header];
  if (v11)
  {
    v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"ListTableViewHeader"];
    if (!v12) {
      v12 = [[VideosExtrasTableViewHeaderView alloc] initWithReuseIdentifier:@"ListTableViewHeader"];
    }
    [(VideosExtrasTableViewHeaderView *)v12 configureForHeaderElement:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v5 row];

  uint64_t v8 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v9 = [v8 list];
  id v13 = [v9 sections];

  if (v6 >= [v13 count])
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v13 objectAtIndex:v6];
  }
  id v11 = [v10 items];
  if (v7 < [v11 count])
  {
    v12 = [v11 objectAtIndex:v7];
    [v12 dispatchEventOfType:4 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  uint64_t v5 = [v16 section];
  uint64_t v6 = [v16 row];
  uint64_t v7 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v8 = [v7 list];
  uint64_t v9 = [v8 sections];

  if (v5 >= [v9 count])
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndex:v5];
  }
  id v11 = [v10 items];
  if (v6 >= [v11 count])
  {
    id v13 = 0;
    v12 = 0;
  }
  else
  {
    v12 = [v11 objectAtIndex:v6];
    id v13 = [v12 relatedContent];
    if (v13)
    {
      if ([(VideosExtrasElementViewController *)self isWide]) {
        uint64_t v14 = v16;
      }
      else {
        uint64_t v14 = 0;
      }
      objc_storeStrong((id *)&self->_autohighlightIndexPath, v14);
      double v15 = [(id)objc_opt_class() relatedContentViewControllerForElement:v13];
      [(NSMapTable *)self->_relatedContentViewControllerMap setObject:v15 forKey:v12];
      [(VideosExtrasListTemplateViewController *)self setRelatedContentViewController:v15];
    }
  }
  [v12 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
}

- (BOOL)shouldUpdateByReplacingViewControllerWithTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(VideosExtrasListTemplateViewController *)self templateElement];
  uint64_t v7 = objc_opt_class();

  if (v5 == v7)
  {
    [(VideosExtrasListTemplateViewController *)self _updateForTemplate:v4];
    unsigned __int8 v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosExtrasListTemplateViewController;
    unsigned __int8 v8 = [(VideosExtrasListTemplateViewController *)&v10 shouldReplaceViewControllerWithNewTemplate:v4];
  }

  return v8;
}

- (void)_updateForTemplate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 updateType] == 1)
  {
    id v20 = v4;
    [v4 list];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v19 = v29 = 0u;
    obuint64_t j = [v19 sections];
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v9 updateType] == 1)
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            objc_super v10 = [v9 items];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v23;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v23 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  double v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                  uint64_t v16 = [v15 updateType];
                  if (v16 == 4 || v16 == 1)
                  {
                    v18 = [v15 relatedContent];
                    [(VideosExtrasListTemplateViewController *)self _updateRelatedContent:v18 forListItem:v15];
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v12);
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v6);
    }

    id v4 = v20;
  }
}

- (void)_updateRelatedContent:(id)a3 forListItem:(id)a4
{
  relatedContentViewControllerMap = self->_relatedContentViewControllerMap;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(NSMapTable *)relatedContentViewControllerMap objectForKey:v7];
  objc_super v10 = [(VideosExtrasListTemplateViewController *)self relatedContentViewController];

  uint64_t v11 = [(id)objc_opt_class() relatedContentViewControllerForElement:v8];

  [(NSMapTable *)self->_relatedContentViewControllerMap setObject:v11 forKey:v7];
  if (v9 == v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__VideosExtrasListTemplateViewController__updateRelatedContent_forListItem___block_invoke;
    v12[3] = &unk_1E6DF3F68;
    void v12[4] = self;
    id v13 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

uint64_t __76__VideosExtrasListTemplateViewController__updateRelatedContent_forListItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRelatedContentViewController:*(void *)(a1 + 40)];
}

- (void)_configureBannerWithElement:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasListTemplateViewController;
  [(VideosExtrasElementViewController *)&v11 _configureBannerWithElement:a3];
  id v4 = [(VideosExtrasListTemplateViewController *)self title];

  if (!v4)
  {
    uint64_t v5 = [(VideosExtrasListTemplateViewController *)self templateElement];
    uint64_t v6 = [v5 list];

    id v7 = [v6 header];
    id v8 = [v7 title];
    uint64_t v9 = [v8 text];
    objc_super v10 = [v9 string];

    [(VideosExtrasListTemplateViewController *)self setTitle:v10];
  }
}

- (void)_setRelatedContentEmbedded:(BOOL)a3
{
  if (self->_relatedContentEmbedded != a3)
  {
    if (self->_relatedContentViewController)
    {
      if (a3)
      {
        [(VideosExtrasListTemplateViewController *)self _embedRelatedContentViewController];
      }
      else
      {
        [(VideosExtrasListTemplateViewController *)self _unembedRelatedContent];
        [(VideosExtrasListTemplateViewController *)self _pushRelatedViewController:self->_relatedContentViewController animated:0];
      }
    }
    self->_relatedContentEmbedded = a3;
  }
}

- (void)setRelatedContentViewController:(id)a3
{
  uint64_t v5 = (VideosExtrasViewElementViewController *)a3;
  p_relatedContentViewController = &self->_relatedContentViewController;
  relatedContentViewController = self->_relatedContentViewController;
  id v20 = v5;
  if (relatedContentViewController != v5)
  {
    if (relatedContentViewController)
    {
      if (self->_relatedContentEmbedded)
      {
        [(VideosExtrasListTemplateViewController *)self _unembedRelatedContent];
      }
      else if (v5)
      {
        id v8 = [(VideosExtrasListTemplateViewController *)self navigationController];
        id v9 = (id)[v8 popViewControllerAnimated:0];
      }
    }
    objc_storeStrong((id *)&self->_relatedContentViewController, a3);
    objc_super v10 = *p_relatedContentViewController;
    if (self->_relatedContentEmbedded)
    {
      if (v10) {
        [(VideosExtrasListTemplateViewController *)self _embedRelatedContentViewController];
      }
    }
    else if (v10)
    {
      objc_super v11 = v20;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [(VideosExtrasListTemplateViewController *)self templateElement];
        id v13 = [v12 background];

        uint64_t v14 = [(VideosExtrasListTemplateViewController *)self templateElement];
        double v15 = [v14 documentBanner];

        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        double v17 = v16;
        if (v13) {
          [v16 addObject:v13];
        }
        v18 = [v15 background];

        if (v18)
        {
          uint64_t v19 = [v15 background];
          [v17 addObject:v19];
        }
        [(VideosExtrasElementViewController *)v11 configureBackgroundWithElements:v17];
      }
      [(VideosExtrasListTemplateViewController *)self _pushRelatedViewController:*p_relatedContentViewController animated:1];
    }
  }
}

- (void)_embedRelatedContentViewController
{
  [(VideosExtrasViewElementViewController *)self->_relatedContentViewController setEmbedded:1];
  [(VideosExtrasListTemplateViewController *)self addChildViewController:self->_relatedContentViewController];
  id v5 = [(VideosExtrasListTemplateViewController *)self view];
  objc_super v3 = [(VideosExtrasViewElementViewController *)self->_relatedContentViewController view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v3];
  [(VideosExtrasListTemplateViewController *)self _setDetailContraints];
  [(VideosExtrasViewElementViewController *)self->_relatedContentViewController didMoveToParentViewController:self];
  id v4 = [(VideosExtrasElementViewController *)self backgroundViewController];
  [v4 setVignetteType:3];
}

- (void)_pushRelatedViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FB1EC0];
  id v7 = a3;
  id v14 = (id)[[v6 alloc] initWithNibName:0 bundle:0];
  id v8 = [v14 view];
  id v9 = [v7 view];
  [v14 addChildViewController:v7];
  [v8 addSubview:v9];
  objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v9, v8, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  objc_super v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  detailViewConstraints = self->_detailViewConstraints;
  self->_detailViewConstraints = v10;

  [v8 addConstraints:self->_detailViewConstraints];
  [v7 didMoveToParentViewController:v14];
  uint64_t v12 = [v7 title];

  [v14 setTitle:v12];
  id v13 = [(VideosExtrasListTemplateViewController *)self navigationController];
  [v13 pushViewController:v14 animated:v4];
}

- (void)_unembedRelatedContent
{
  id v5 = [(VideosExtrasViewElementViewController *)self->_relatedContentViewController view];
  [(VideosExtrasViewElementViewController *)self->_relatedContentViewController willMoveToParentViewController:0];
  objc_super v3 = [(VideosExtrasListTemplateViewController *)self view];
  [v3 removeConstraints:self->_detailViewConstraints];

  [v5 removeFromSuperview];
  detailViewConstraints = self->_detailViewConstraints;
  self->_detailViewConstraints = 0;

  [(VideosExtrasViewElementViewController *)self->_relatedContentViewController removeFromParentViewController];
  [(VideosExtrasViewElementViewController *)self->_relatedContentViewController setEmbedded:0];
}

- (void)_setDetailContraints
{
  v23[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(VideosExtrasViewElementViewController *)self->_relatedContentViewController view];
  BOOL v4 = self->_tableView;
  if (self->_detailViewConstraints)
  {
    id v5 = [(VideosExtrasListTemplateViewController *)self view];
    [v5 removeConstraints:self->_detailViewConstraints];
  }
  if (self->_tableViewLeft) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 4;
  }
  id v7 = (void *)MEMORY[0x1E4F6F1A8];
  UIEdgeInsetsMakeWithEdges();
  long long v22 = objc_msgSend(v7, "positionConstraintsForView:insets:position:", v3, v6);
  if ([(VideosExtrasViewElementViewController *)self->_relatedContentViewController matchParentHeight])
  {
    id v8 = v4;
    id v9 = v4;
  }
  else
  {
    [(VideosExtrasListTemplateViewController *)self view];
    v10 = id v9 = v4;
    id v8 = [v10 safeAreaLayoutGuide];
  }
  objc_super v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:4 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:0.0];
  uint64_t v12 = [(VideosExtrasViewElementViewController *)self->_relatedContentViewController preferredLayoutGuide];
  int64_t v13 = [(VideosExtrasViewElementViewController *)self->_relatedContentViewController preferredLayoutAttribute];
  id v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:v13 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:0.0];
  if (self->_tableViewLeft) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  if (self->_tableViewLeft) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  double v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:v15 relatedBy:0 toItem:v9 attribute:v16 multiplier:1.0 constant:dbl_1E38FE5D0[!self->_tableViewLeft]];
  v23[0] = v11;
  v23[1] = v14;
  v23[2] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  uint64_t v19 = [v22 arrayByAddingObjectsFromArray:v18];
  detailViewConstraints = self->_detailViewConstraints;
  self->_detailViewConstraints = v19;

  v21 = [(VideosExtrasListTemplateViewController *)self view];
  [v21 addConstraints:self->_detailViewConstraints];
}

- (void)_prepareLayout
{
  v15.receiver = self;
  v15.super_class = (Class)VideosExtrasListTemplateViewController;
  [(VideosExtrasElementViewController *)&v15 _prepareLayout];
  [(VideosExtrasListTemplateViewController *)self _setRelatedContentEmbedded:[(VideosExtrasElementViewController *)self isWide]];
  if (!self->_relatedContentEmbedded)
  {
    relatedContentViewController = self->_relatedContentViewController;
    self->_relatedContentViewController = 0;
  }
  [(VideosExtrasListTemplateViewController *)self _addConstraintsToTableView:self->_tableView];
  [(VideosExtrasListTemplateViewController *)self _configureVignette:[(VideosExtrasElementViewController *)self isWide]];
  [(UITableView *)self->_tableView reloadData];
  if (![(VideosExtrasElementViewController *)self isWide])
  {
    autohighlightIndexPath = self->_autohighlightIndexPath;
    self->_autohighlightIndexPath = 0;
  }
  if (self->_autohighlightIndexPath)
  {
    id v5 = [(VideosExtrasListTemplateViewController *)self templateElement];
    uint64_t v6 = [v5 list];
    id v7 = [v6 sections];

    uint64_t v8 = [(NSIndexPath *)self->_autohighlightIndexPath section];
    if (v8 < [v7 count])
    {
      id v9 = objc_msgSend(v7, "objectAtIndex:", -[NSIndexPath section](self->_autohighlightIndexPath, "section"));
      objc_super v10 = [v9 items];

      uint64_t v11 = [(NSIndexPath *)self->_autohighlightIndexPath row];
      if (v11 < [v10 count])
      {
        uint64_t v12 = objc_msgSend(v10, "objectAtIndex:", -[NSIndexPath row](self->_autohighlightIndexPath, "row"));
        int64_t v13 = [v12 relatedContent];
        if (v13)
        {
          id v14 = [(id)objc_opt_class() relatedContentViewControllerForElement:v13];
          [(NSMapTable *)self->_relatedContentViewControllerMap setObject:v14 forKey:v12];
          [(VideosExtrasListTemplateViewController *)self setRelatedContentViewController:v14];
        }
        [(UITableView *)self->_tableView selectRowAtIndexPath:self->_autohighlightIndexPath animated:0 scrollPosition:0];
      }
    }
  }
}

- (void)_configureVignette:(BOOL)a3
{
  if (self->_relatedContentEmbedded)
  {
    if (self->_relatedContentViewController) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  id v4 = [(VideosExtrasElementViewController *)self backgroundViewController];
  [v4 setVignetteType:v3];
}

+ (id)relatedContentViewControllerForElement:(id)a3
{
  id v3 = a3;
  if (relatedContentViewControllerForElement__onceToken != -1) {
    dispatch_once(&relatedContentViewControllerForElement__onceToken, &__block_literal_global_45_0);
  }
  id v4 = (void *)relatedContentViewControllerForElement__templateMap;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = (objc_class *)(id)[v4 objectForKey:v6];

  if (v7)
  {
    id v7 = (objc_class *)[[v7 alloc] initWithViewElement:v3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    id v7 = v7;
    uint64_t v8 = +[VideosExtrasGridElementViewController wideDetailStyle];
    [(objc_class *)v7 setWideStyle:v8];

    id v9 = +[VideosExtrasGridElementViewController smallDetailStyle];
    [(objc_class *)v7 setSmallStyle:v9];

    objc_super v10 = +[VideosExtrasGridElementViewController mediumDetailStyle];
    [(objc_class *)v7 setMediumStyle:v10];

    uint64_t v11 = +[VideosExtrasGridElementViewController largeDetailStyle];
    [(objc_class *)v7 setLargeStyle:v11];

    uint64_t v12 = +[VideosExtrasGridElementViewController extraLargeDetailStyle];
    [(objc_class *)v7 setExtraLargeStyle:v12];
  }
  else
  {
    int64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v13);
    NSLog(&cfstr_CouldNotGetVie.isa, v12);
  }

LABEL_8:
  return v7;
}

void __81__VideosExtrasListTemplateViewController_relatedContentViewControllerForElement___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"IKGridElement";
  v3[0] = objc_opt_class();
  v2[1] = @"IKLockupElement";
  v3[1] = objc_opt_class();
  v2[2] = @"IKActivityIndicatorElement";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)relatedContentViewControllerForElement__templateMap;
  relatedContentViewControllerForElement__templateMap = v0;
}

- (VideosExtrasViewElementViewController)relatedContentViewController
{
  return self->_relatedContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedContentViewController, 0);
  objc_storeStrong((id *)&self->_autohighlightIndexPath, 0);
  objc_storeStrong((id *)&self->_relatedContentViewControllerMap, 0);
  objc_storeStrong((id *)&self->_detailViewConstraints, 0);
  objc_storeStrong((id *)&self->_masterViewConstraints, 0);
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end