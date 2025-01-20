@interface SearchUIHorizontalDetailedCardSectionView
+ (BOOL)supportsCustomUserReportRequestAfforance;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)setupContentView;
- (void)setFeedbackDelegate:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIHorizontalDetailedCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 1;
}

- (id)setupContentView
{
  v3 = [SearchUIDetailedView alloc];
  v4 = [(SearchUICardSectionView *)self feedbackDelegate];
  v5 = [(SearchUIDetailedView *)v3 initWithFeedbackDelegate:v4];

  [(SearchUIDetailedView *)v5 setIsVerticalAlignment:1];
  [(SearchUIDetailedView *)v5 setButtonDelegate:self];
  return v5;
}

- (void)updateWithRowModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIHorizontalDetailedCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v6 updateWithRowModel:v4];
  v5 = [(SearchUICardSectionView *)self contentView];
  [v5 updateWithRowModel:v4];
}

- (void)setFeedbackDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIHorizontalDetailedCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v6 setFeedbackDelegate:v4];
  v5 = [(SearchUICardSectionView *)self contentView];
  [v5 setFeedbackDelegate:v4];
}

@end