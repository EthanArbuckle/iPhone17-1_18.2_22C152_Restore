@interface SearchUICardSectionTableCell
- (id)leadingTextView;
- (id)leadingView;
- (id)presentingViewController;
- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6;
- (void)performSFCommand:(id)a3;
- (void)reportSFFeedback:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tabKeyPressed;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUICardSectionTableCell

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionTableCell;
  id v4 = a3;
  [(SearchUITableViewCell *)&v6 setDelegate:v4];
  v5 = [(SearchUITableViewCell *)self sizingContainer];
  [v5 setFeedbackDelegate:v4];
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchUICardSectionTableCell;
  [(SearchUITableViewCell *)&v11 updateWithRowModel:v4];
  if (+[SearchUIContentConfigurator supportsConfigurationFor:v4])
  {
    +[SearchUIContentConfigurator applyConfigurationTo:self rowModel:v4 interactionDelegate:self];
    v5 = [(SearchUICardSectionTableCell *)self contentView];
    [v5 setClipsToBounds:1];
  }
  else
  {
    objc_super v6 = [(SearchUITableViewCell *)self sizingContainer];

    if (!v6)
    {
      v7 = [(SearchUITableViewCell *)self delegate];
      v8 = +[SearchUICardSectionCreator cardSectionViewForModel:v4 feedbackDelegate:v7];
      [(SearchUITableViewCell *)self setSizingContainer:v8];

      v9 = [(SearchUICardSectionTableCell *)self contentView];
      v10 = [(SearchUITableViewCell *)self sizingContainer];
      [v9 addSubview:v10];
    }
    v5 = [(SearchUITableViewCell *)self sizingContainer];
    [v5 updateWithRowModel:v4];
  }
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(SearchUITableViewCell *)self sizingContainer];
  [v6 updateChevronVisible:v5 leaveSpaceForChevron:v4];
}

- (void)tabKeyPressed
{
  id v2 = [(SearchUITableViewCell *)self sizingContainer];
  [v2 tabKeyPressed];
}

- (id)leadingView
{
  id v2 = [(SearchUICardSectionTableCell *)self cardSectionView];
  v3 = [v2 leadingView];

  return v3;
}

- (id)leadingTextView
{
  id v2 = [(SearchUICardSectionTableCell *)self cardSectionView];
  v3 = [v2 leadingTextView];

  return v3;
}

- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(SearchUITableViewCell *)self rowModel];
  v13 = [(SearchUITableViewCell *)self delegate];
  +[SnippetUIUtilities createViewControllersForButtons:v12 buttonFont:v11 isCompact:v6 sourceView:self rowModel:v14 delegate:v13 completionHandler:v10];
}

- (void)performSFCommand:(id)a3
{
  id v4 = a3;
  id v6 = [(SearchUITableViewCell *)self rowModel];
  BOOL v5 = [(SearchUITableViewCell *)self delegate];
  +[SnippetUIUtilities performSFCommand:v4 rowModel:v6 delegate:v5];
}

- (void)reportSFFeedback:(id)a3
{
  id v4 = a3;
  id v7 = [(SearchUITableViewCell *)self rowModel];
  uint64_t v5 = [v7 queryId];
  id v6 = [(SearchUITableViewCell *)self delegate];
  +[SnippetUIUtilities reportFeedback:v4 queryId:v5 delegate:v6];
}

- (id)presentingViewController
{
  v3 = [(SearchUITableViewCell *)self delegate];
  id v4 = +[SnippetUIUtilities presentingViewController:self delegate:v3];

  return v4;
}

@end