@interface PKDashboardPassMessagePresenter
- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardPassMessagePresenter)initWithPassGroupView:(id)a3;
- (id)_identifierForItem:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (unint64_t)_indexForIdentifier:(id)a3 inMessages:(id)a4;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKDashboardPassMessagePresenter

- (PKDashboardPassMessagePresenter)initWithPassGroupView:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardPassMessagePresenter;
  v6 = [(PKDashboardPassMessagePresenter *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupView, a3);
    v8 = [PKDashboardMessagesView alloc];
    uint64_t v9 = -[PKDashboardMessagesView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleMessageView = v7->_sampleMessageView;
    v7->_sampleMessageView = (PKDashboardMessagesView *)v9;
  }
  return v7;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"passMessagePresenter";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)_identifierForItem:(id)a3
{
  return @"passMessagePresenter";
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKDashboardPassMessagePresenter *)self _identifierForItem:v10];
  objc_super v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  [(PKDashboardPassMessagePresenter *)self _configureCell:v12 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v12;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleMessageView = self->_sampleMessageView;
  id v8 = a4;
  id v9 = [a3 messages];
  [(PKDashboardMessagesView *)sampleMessageView updateWithMessages:v9 currentIndex:0];

  id v10 = self->_sampleMessageView;
  [v8 bounds];
  double v12 = v11;

  -[PKDashboardMessagesView sizeThatFits:](v10, "sizeThatFits:", v12, 3.40282347e38);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v19 = a3;
  id v8 = a4;
  id v9 = [v19 hostedContentView];
  if (!v9)
  {
    id v10 = [PKDashboardMessagesView alloc];
    id v9 = -[PKDashboardMessagesView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PKDashboardMessagesView *)v9 setDelegate:self];
    [v19 setHostedContentView:v9];
  }
  double v11 = [v8 messages];
  double v12 = v11;
  currentIdentifier = self->_currentIdentifier;
  if (currentIdentifier)
  {
    unint64_t v14 = [(PKDashboardPassMessagePresenter *)self _indexForIdentifier:currentIdentifier inMessages:v11];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [v12 count];
      if (v15 - 1 < self->_currentIndex) {
        self->_currentIndex = v15 - 1;
      }
    }
    else
    {
      self->_currentIndex = v14;
    }
  }
  else
  {
    v16 = [v11 firstObject];
    v17 = [v16 identifier];
    v18 = self->_currentIdentifier;
    self->_currentIdentifier = v17;

    self->_currentIndex = 0;
  }
  [v19 setAccessibilityIdentifier:*MEMORY[0x1E4F856E0]];
  [(PKDashboardMessagesView *)v9 updateWithMessages:v12 currentIndex:self->_currentIndex];
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      id v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        double v11 = [PKDashboardMessagesView alloc];
        double v12 = -[PKDashboardMessagesView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleMessageView = self->_sampleMessageView;
        self->_sampleMessageView = v12;
      }
    }
  }
}

- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4
{
  objc_storeStrong((id *)&self->_currentIdentifier, a4);
  id v7 = a4;
  id v8 = a3;
  currentIdentifier = self->_currentIdentifier;
  id v11 = [v8 messages];

  unint64_t v10 = [(PKDashboardPassMessagePresenter *)self _indexForIdentifier:currentIdentifier inMessages:v11];
  self->_currentIndex = v10;
}

- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4
{
  id v5 = a4;
  if ([v5 type] == 2
    && ([v5 identifier], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    viewEventEnqueued = self->_viewEventEnqueued;
    if (!viewEventEnqueued)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = self->_viewEventEnqueued;
      self->_viewEventEnqueued = v8;

      viewEventEnqueued = self->_viewEventEnqueued;
    }
    unint64_t v10 = [v5 identifier];
    id v11 = [(NSMutableDictionary *)viewEventEnqueued objectForKeyedSubscript:v10];
    char v12 = [v11 BOOLValue];

    if ((v12 & 1) == 0)
    {
      double v13 = [NSNumber numberWithBool:1];
      unint64_t v14 = self->_viewEventEnqueued;
      uint64_t v15 = [v5 identifier];
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
    }
    char v16 = v12 ^ 1;
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (unint64_t)_indexForIdentifier:(id)a3 inMessages:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKDashboardPassMessagePresenter__indexForIdentifier_inMessages___block_invoke;
  v9[3] = &unk_1E59D94D0;
  id v10 = v5;
  id v6 = v5;
  unint64_t v7 = [a4 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __66__PKDashboardPassMessagePresenter__indexForIdentifier_inMessages___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  unint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewEventEnqueued, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tablesViews, 0);
  objc_storeStrong((id *)&self->_sampleMessageView, 0);

  objc_storeStrong((id *)&self->_groupView, 0);
}

@end