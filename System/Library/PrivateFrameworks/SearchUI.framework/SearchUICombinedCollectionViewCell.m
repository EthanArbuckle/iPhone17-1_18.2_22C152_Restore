@interface SearchUICombinedCollectionViewCell
- (SearchUICombinedCardSectionsView)cardSectionView;
- (id)presentingViewController;
- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6;
- (void)emitInstrumentationEvent:(id)a3;
- (void)performSFCommand:(id)a3;
- (void)reportSFFeedback:(id)a3;
- (void)setCardSectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUICombinedCollectionViewCell

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUICombinedCollectionViewCell;
  [(SearchUICollectionViewCell *)&v14 updateWithRowModel:v4];
  v5 = [v4 snippetUICardSections];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(SearchUICollectionViewCell *)self setUseSystemSizing:1];
    v7 = [v4 snippetUICardSections];
    +[SearchUIContentConfigurator applyConfigurationTo:self rowModel:v4 cardSections:v7 interactionDelegate:self];
  }
  else
  {
    v8 = [(SearchUICombinedCollectionViewCell *)self cardSectionView];

    if (v8)
    {
      v7 = [(SearchUICombinedCollectionViewCell *)self cardSectionView];
      [v7 setRowModel:v4];
    }
    else
    {
      v9 = [SearchUICombinedCardSectionsView alloc];
      v10 = [(SearchUICollectionViewCell *)self delegate];
      v11 = [(SearchUICombinedCardSectionsView *)v9 initWithRowModel:v4 feedbackDelegate:v10];
      [(SearchUICombinedCollectionViewCell *)self setCardSectionView:v11];

      v12 = [(SearchUICombinedCollectionViewCell *)self contentView];
      v13 = [(SearchUICombinedCollectionViewCell *)self cardSectionView];
      [v12 addSubview:v13];

      v7 = [(SearchUICombinedCollectionViewCell *)self cardSectionView];
      [v7 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
    }
  }
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICombinedCollectionViewCell;
  id v4 = a3;
  [(SearchUICollectionViewCell *)&v6 setDelegate:v4];
  v5 = [(SearchUICombinedCollectionViewCell *)self cardSectionView];
  [v5 setFeedbackDelegate:v4];
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v6 = [(SearchUICombinedCollectionViewCell *)self cardSectionView];
  id v11 = [v6 visibleArrangedSubviews];

  BOOL v7 = [v11 count] == 2;
  v8 = v11;
  if (v7)
  {
    v9 = [v11 lastObject];
    v10 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v11, "count") - 2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 updateChevronVisible:v5 leaveSpaceForChevron:v4];
      }
    }

    v8 = v11;
  }
}

- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(SearchUICollectionViewCell *)self rowModel];
  v13 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities createViewControllersForButtons:v12 buttonFont:v11 isCompact:v6 sourceView:self rowModel:v14 delegate:v13 completionHandler:v10];
}

- (void)performSFCommand:(id)a3
{
  id v4 = a3;
  id v6 = [(SearchUICollectionViewCell *)self rowModel];
  BOOL v5 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities performSFCommand:v4 rowModel:v6 delegate:v5];
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities emitInstrumentationEvent:v4 delegate:v5];
}

- (void)reportSFFeedback:(id)a3
{
  id v4 = a3;
  id v7 = [(SearchUICollectionViewCell *)self rowModel];
  uint64_t v5 = [v7 queryId];
  id v6 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities reportFeedback:v4 queryId:v5 delegate:v6];
}

- (id)presentingViewController
{
  v3 = [(SearchUICollectionViewCell *)self delegate];
  id v4 = +[SnippetUIUtilities presentingViewController:self delegate:v3];

  return v4;
}

- (SearchUICombinedCardSectionsView)cardSectionView
{
  return (SearchUICombinedCardSectionsView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setCardSectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end