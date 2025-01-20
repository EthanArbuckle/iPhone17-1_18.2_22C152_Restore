@interface PKSpendingSummaryPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKSpendingSummaryPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureView:(id)a3 item:(id)a4 presentationStyle:(unint64_t)a5;
- (void)swapSummaryInCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKSpendingSummaryPresenter

- (PKSpendingSummaryPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKSpendingSummaryPresenter;
  v2 = [(PKSpendingSummaryPresenter *)&v7 init];
  if (v2)
  {
    v3 = PKPassKitUIBundle();
    v4 = [v3 URLForResource:@"ArrowDown" withExtension:@"pdf"];
    v5 = [v3 URLForResource:@"ArrowUp" withExtension:@"pdf"];

    v2->_needsSizing = 1;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"spendingPresenter";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"spendingPresenter" forIndexPath:a5];
  v10 = [v9 hostedContentView];

  if (!v10)
  {
    v11 = [PKSpendingSummaryView alloc];
    v12 = -[PKSpendingSummaryView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v9 setHostedContentView:v12];
  }
  v13 = [v9 hostedContentView];
  [(PKSpendingSummaryPresenter *)self _configureView:v13 item:v8 presentationStyle:0];

  return v9;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v8 = a4;
  v9 = [v10 hostedContentView];
  [(PKSpendingSummaryPresenter *)self _configureView:v9 item:v8 presentationStyle:1];
}

- (void)swapSummaryInCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v8 = a4;
  v9 = [v10 hostedContentView];
  [(PKSpendingSummaryPresenter *)self _configureView:v9 item:v8 presentationStyle:2];
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_needsSizing)
  {
    sampleView = self->_sampleView;
    if (!sampleView)
    {
      v12 = [PKSpendingSummaryView alloc];
      v13 = -[PKSpendingSummaryView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v14 = self->_sampleView;
      self->_sampleView = v13;

      sampleView = self->_sampleView;
    }
    [(PKSpendingSummaryPresenter *)self _configureView:sampleView item:v8 presentationStyle:0];
    v15 = self->_sampleView;
    [v9 bounds];
    double v17 = v16;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    -[PKSpendingSummaryView sizeThatFits:](v15, "sizeThatFits:", v17 + v18 * -2.0, 3.40282347e38);
    CGFloat width = v19;
    CGFloat height = v21;
    self->_summarySize.CGFloat width = v19;
    self->_summarySize.CGFloat height = v21;
  }
  else
  {
    CGFloat width = self->_summarySize.width;
    CGFloat height = self->_summarySize.height;
  }

  double v23 = width;
  double v24 = height;
  result.CGFloat height = v24;
  result.CGFloat width = v23;
  return result;
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
        self->_needsSizing = 1;
        v11 = [PKSpendingSummaryView alloc];
        v12 = -[PKSpendingSummaryView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleView = self->_sampleView;
        self->_sampleView = v12;
      }
    }
  }
}

- (void)_configureView:(id)a3 item:(id)a4 presentationStyle:(unint64_t)a5
{
  if (a3)
  {
    id v7 = a3;
    id v8 = [a4 spendingSummary];
    [v7 configureWithSummary:v8 presentationStyle:a5];
  }
}

- (void).cxx_destruct
{
}

@end