@interface SFBrowsingAssistantSearchResultView
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSNumber)componentIdentifier;
- (NSString)webpageIdentifier;
- (SFBrowsingAssistantSearchResultView)initWithSearchResult:(id)a3;
- (id)actionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setComponentIdentifier:(id)a3;
- (void)setWebpageIdentifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SFBrowsingAssistantSearchResultView

- (SFBrowsingAssistantSearchResultView)initWithSearchResult:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFBrowsingAssistantSearchResultView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[SFBrowsingAssistantSearchResultView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchResult, a3);
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:", v6, v7, v8, v9);
    tableView = v11->_tableView;
    v11->_tableView = (UITableView *)v12;

    [(UITableView *)v11->_tableView setDataSource:v11];
    [(UITableView *)v11->_tableView setDelegate:v11];
    [(UITableView *)v11->_tableView setScrollEnabled:0];
    [(UITableView *)v11->_tableView setScrollsToTop:0];
    [(UITableView *)v11->_tableView setSeparatorStyle:0];
    [(UIView *)v11 _sf_addEdgeMatchedSubview:v11->_tableView];
    v14 = v11;
  }

  return v11;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = 11;
  do
  {
    double v9 = height;
    -[SFBrowsingAssistantSearchResultView setBounds:](self, "setBounds:", 0.0, 0.0, width, height);
    [(SFBrowsingAssistantSearchResultView *)self layoutIfNeeded];
    [(UITableView *)self->_tableView contentSize];
    double height = fmax(v10, 60.0);
    if (_SFEqualWithEpsilon(height, v9, 0.01)) {
      break;
    }
    double v9 = height;
    --v8;
  }
  while (v8);
  double v11 = width;
  double v12 = v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  uint64_t v8 = (void *)getSearchUITableViewCellClass_softClass;
  uint64_t v27 = getSearchUITableViewCellClass_softClass;
  if (!getSearchUITableViewCellClass_softClass)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __getSearchUITableViewCellClass_block_invoke;
    v22 = &unk_1E54EA8A0;
    v23 = &v24;
    __getSearchUITableViewCellClass_block_invoke((uint64_t)&v19);
    uint64_t v8 = (void *)v25[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v24, 8);
  uint64_t v10 = [v9 reuseIdentifierForResult:self->_searchResult];
  double v11 = (void *)v10;
  double v12 = @"BrowsingAssistantSearchResult";
  if (v10) {
    double v12 = (__CFString *)v10;
  }
  v13 = v12;

  v14 = [v6 dequeueReusableCellWithIdentifier:v13];
  if (!v14)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v15 = (void *)getSearchUIClass_softClass;
    uint64_t v27 = getSearchUIClass_softClass;
    if (!getSearchUIClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getSearchUIClass_block_invoke;
      v22 = &unk_1E54EA8A0;
      v23 = &v24;
      __getSearchUIClass_block_invoke((uint64_t)&v19);
      v15 = (void *)v25[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v24, 8);
    v14 = [v16 rowViewForResult:self->_searchResult style:0 feedbackDelegate:self];
  }
  [v14 setAccessibilityIdentifier:v13];
  if (objc_opt_respondsToSelector()) {
    [v14 updateWithResult:self->_searchResult];
  }
  v17 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  [v17 setCornerRadius:22.0];
  [v14 setBackgroundConfiguration:v17];

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = [a3 cellForRowAtIndexPath:a4];
  if (objc_opt_respondsToSelector()) {
    [v6 executeCommandWithTriggerEvent:2];
  }
  actionHandler = (void (**)(id, SFSearchResult *))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2](actionHandler, self->_searchResult);
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(SFSearchResult *)self->_searchResult _sf_isMediaResult])
  {
    id v9 = [v7 cellForRowAtIndexPath:v8];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FB1678];
      double v11 = [v9 contextMenuActionProvider];
      double v12 = [v10 configurationWithIdentifier:0 previewProvider:0 actionProvider:v11];
    }
    else
    {
      double v12 = 0;
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  return ![(SFSearchResult *)self->_searchResult _sf_canOpenInBrowser];
}

- (void)didEngageResult:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F982A8];
  id v4 = a3;
  id v5 = [v3 sharedPARSession];
  [v5 didEngageResult:v4];
}

- (void)didEngageCardSection:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F982A8];
  id v4 = a3;
  id v5 = [v3 sharedPARSession];
  [v5 didEngageCardSection:v4];
}

- (void)didPerformCommand:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F982A8];
  id v5 = a3;
  id v6 = [v4 sharedPARSession];
  [v6 didPerformCommand:v5];

  id v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v7 didClickEntityCardSBA];

  id v8 = [MEMORY[0x1E4F98298] sharedManager];
  objc_msgSend(v8, "donateBrowsingAssistantUserInteractionDetectedWithWebPageID:componentType:componentIdentifier:tableOfContentsArrayLength:tableOfContentsTextIndex:readerSectionExpanded:", self->_webpageIdentifier, objc_msgSend(MEMORY[0x1E4F98298], "entityComponentTypeFromResult:", self->_searchResult), self->_componentIdentifier, 0, 0, 0);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
}

- (NSNumber)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void)setComponentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end