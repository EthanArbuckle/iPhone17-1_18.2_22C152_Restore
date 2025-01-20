@interface SearchUIDetailedRowCardSectionView
+ (BOOL)supportsCustomUserReportRequestAfforance;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)findDescendentOfView:(id)a3 matchingClass:(Class)a4;
- (id)leadingTextView;
- (id)leadingView;
- (id)setupContentView;
- (id)viewForQuickLookZoomTransitionSource;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)setFeedbackDelegate:(id)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIDetailedRowCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 0;
}

- (id)setupContentView
{
  v3 = [SearchUIDetailedView alloc];
  v4 = [(SearchUICardSectionView *)self feedbackDelegate];
  v5 = [(SearchUIDetailedView *)v3 initWithFeedbackDelegate:v4];

  [(SearchUIDetailedView *)v5 setButtonDelegate:self];
  return v5;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIDetailedRowCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v8, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
  BOOL v6 = [(SearchUICardSectionView *)self isCompactWidth];
  v7 = [(SearchUICardSectionView *)self contentView];
  [v7 setIsCompactWidth:v6];
}

- (void)updateWithRowModel:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIDetailedRowCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v8 updateWithRowModel:v4];
  v5 = [(SearchUICardSectionView *)self contentView];
  [v5 updateWithRowModel:v4];

  LODWORD(v5) = [v4 useCompactVersionOfUI];
  if (v5)
  {
    if ([MEMORY[0x1E4FAE198] isMacOS])
    {
      [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:self];
      BOOL v6 = (void *)MEMORY[0x1E4FAE1A0];
      v7 = [(SearchUICardSectionView *)self contentView];
      [v6 makeContainerShadowCompatible:v7];
    }
  }
}

- (void)setFeedbackDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIDetailedRowCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v6 setFeedbackDelegate:v4];
  v5 = [(SearchUICardSectionView *)self contentView];
  [v5 setFeedbackDelegate:v4];
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(SearchUICardSectionView *)self contentView];
  objc_super v8 = [v7 currentAccessoryViewController];

  if (!v8)
  {
    int v11 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v7 = [(SearchUICardSectionView *)self rowModel];
    if (![v7 useCompactVersionOfUI])
    {
      int v11 = 0;
      goto LABEL_8;
    }
  }
  v10 = [v8 view];
  int v11 = [v10 isHidden] ^ 1;

  if (isKindOfClass) {
LABEL_8:
  }

LABEL_9:
  v12 = [(SearchUICardSectionView *)self rowModel];
  v13 = [v12 buttonItems];
  if ([v13 count])
  {
    v14 = [(SearchUICardSectionView *)self rowModel];
    int v15 = [v14 buttonItemsAreTrailing] ^ 1;
  }
  else
  {
    int v15 = 1;
  }

  v16.receiver = self;
  v16.super_class = (Class)SearchUIDetailedRowCardSectionView;
  [(SearchUICardSectionView *)&v16 updateChevronVisible:v5 & ~v11 & v15 leaveSpaceForChevron:v4];
}

- (id)leadingView
{
  v2 = [(SearchUICardSectionView *)self contentView];
  v3 = [v2 leadingView];

  return v3;
}

- (id)leadingTextView
{
  v2 = [(SearchUICardSectionView *)self contentView];
  v3 = [v2 leadingTextView];

  return v3;
}

- (id)viewForQuickLookZoomTransitionSource
{
  v3 = [(SearchUIDetailedRowCardSectionView *)self leadingView];
  BOOL v4 = [(SearchUIDetailedRowCardSectionView *)self findDescendentOfView:v3 matchingClass:objc_opt_class()];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIDetailedRowCardSectionView;
    id v6 = [(SearchUICardSectionView *)&v9 viewForQuickLookZoomTransitionSource];
  }
  v7 = v6;

  return v7;
}

- (id)findDescendentOfView:(id)a3 matchingClass:(Class)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v8 = objc_msgSend(v6, "subviews", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [(SearchUIDetailedRowCardSectionView *)self findDescendentOfView:*(void *)(*((void *)&v15 + 1) + 8 * i) matchingClass:a4];
          if (v13)
          {
            id v7 = (id)v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
  }
LABEL_13:

  return v7;
}

@end