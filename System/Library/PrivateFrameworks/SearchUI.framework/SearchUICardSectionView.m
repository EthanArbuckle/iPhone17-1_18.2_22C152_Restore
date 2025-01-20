@interface SearchUICardSectionView
+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3;
+ (BOOL)hasLeadingImageForCardSection:(id)a3;
+ (BOOL)supportsCustomUserReportRequestAfforance;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (UIEdgeInsets)separatorInsetsForStyle:(int)a3 cellView:(id)a4 leadingView:(id)a5 leadingTextView:(id)a6;
+ (id)dragSubtitleForCardSection:(id)a3;
+ (id)dragTitleForCardSection:(id)a3;
+ (int)defaultSeparatorStyleForRowModel:(id)a3;
- (BOOL)configureUserReportButton:(id)a3;
- (BOOL)highlightFrameMatchesHighlightView;
- (BOOL)isCompactWidth;
- (BOOL)needsInternalFocus;
- (BOOL)setupManualFocus;
- (NSString)description;
- (SFCardSection)section;
- (SearchUICardSectionRowModel)rowModel;
- (SearchUICardSectionView)initWithArrangedSubviews:(id)a3;
- (SearchUICardSectionView)initWithFrame:(CGRect)a3;
- (SearchUICardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (UIMenu)userReportMenu;
- (UIView)chevronView;
- (UIView)contentView;
- (UIView)highlightReferenceView;
- (UIView)leadingTextView;
- (UIView)leadingView;
- (UIView)viewForForcedFocus;
- (UIViewController)embeddedViewController;
- (double)highlightFrameCornerRadius;
- (double)trailingMarginForAccessory:(id)a3;
- (id)setupContentView;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)didInvalidateSizeAnimate:(BOOL)a3;
- (void)openPunchout:(id)a3 triggerEvent:(unint64_t)a4;
- (void)requestRemovalFromEnclosingView;
- (void)setChevronView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setIsCompactWidth:(BOOL)a3;
- (void)setRowModel:(id)a3;
- (void)setUserReportMenu:(id)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUICardSectionView

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return [a1 fillsBackgroundWithContentForRowModel:a3];
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  v3 = [a3 backgroundColor];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)hasLeadingImageForCardSection:(id)a3
{
  return 0;
}

+ (UIEdgeInsets)separatorInsetsForStyle:(int)a3 cellView:(id)a4 leadingView:(id)a5 leadingTextView:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = *MEMORY[0x1E4FB2848];
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (a3 == 5)
  {
    double MinX = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  else
  {
    +[SearchUIUtilities standardTableCellContentInset];
    double MinX = v16;
    if (a3 == 4) {
      double v14 = v16;
    }
    if (a3 != 3 && a3 != 4 || (v17 = v11) == 0) {
      v17 = v10;
    }
    id v18 = v17;
    [v18 bounds];
    objc_msgSend(v18, "convertRect:toView:", v9);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    int v27 = [MEMORY[0x1E4FAE100] isLTR];
    if (v18)
    {
      if (v27)
      {
        v33.origin.x = v20;
        v33.origin.y = v22;
        v33.size.width = v24;
        v33.size.height = v26;
        double MinX = CGRectGetMinX(v33);
      }
      else
      {
        [v9 bounds];
        double MaxX = CGRectGetMaxX(v34);
        v35.origin.x = v20;
        v35.origin.y = v22;
        v35.size.width = v24;
        v35.size.height = v26;
        double MinX = MaxX - CGRectGetMaxX(v35);
      }
    }
  }

  double v29 = v12;
  double v30 = MinX;
  double v31 = v13;
  double v32 = v14;
  result.right = v32;
  result.bottom = v31;
  result.left = v30;
  result.top = v29;
  return result;
}

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 0;
}

+ (id)dragTitleForCardSection:(id)a3
{
  return 0;
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  return 0;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 0;
}

- (SearchUICardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchUICardSectionView;
  v8 = [(NUIContainerStackView *)&v14 initWithArrangedSubviews:0];
  id v9 = v8;
  if (v8)
  {
    [(SearchUICardSectionView *)v8 setRowModel:v6];
    [(SearchUICardSectionView *)v9 setFeedbackDelegate:v7];
    [(NUIContainerStackView *)v9 setAlignment:3];
    [(NUIContainerStackView *)v9 setDistribution:0];
    [(SearchUICardSectionView *)v9 setLayoutMarginsRelativeArrangement:1];
    id v10 = [(SearchUICardSectionView *)v9 setupContentView];
    [(SearchUICardSectionView *)v9 setContentView:v10];

    id v11 = [(SearchUICardSectionView *)v9 contentView];

    if (v11)
    {
      double v12 = [(SearchUICardSectionView *)v9 contentView];
      [(SearchUICardSectionView *)v9 addArrangedSubview:v12];
    }
    [(SearchUICardSectionView *)v9 updateWithRowModel:v6];
    [(SearchUICardSectionView *)v9 updateChevronVisible:0 leaveSpaceForChevron:0];
    [(SearchUICardSectionView *)v9 setDelegate:v9];
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v9];
  }

  return v9;
}

- (SearchUICardSectionView)initWithFrame:(CGRect)a3
{
  return -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](self, "initWithRowModel:feedbackDelegate:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SearchUICardSectionView)initWithArrangedSubviews:(id)a3
{
  return [(SearchUICardSectionView *)self initWithRowModel:0 feedbackDelegate:0];
}

- (id)setupContentView
{
  return 0;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  if (a3 == self)
  {
    double width = a4.width;
    id v7 = (void *)MEMORY[0x1E4FAE100];
    id v8 = a3;
    objc_msgSend(v8, "setIsCompactWidth:", objc_msgSend(v7, "widthIsCompact:", width));
  }
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = (double *)MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  id v9 = [(SearchUICardSectionView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v11 = [(SearchUICardSectionView *)self contentView];
  double v12 = v11;
  if (isKindOfClass)
  {
    [v11 layoutMargins];
  }
  else
  {
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    double v15 = v8;
    if ((v14 & 1) == 0) {
      goto LABEL_6;
    }
    double v12 = [(SearchUICardSectionView *)self contentView];
    [v12 effectiveLayoutMargins];
  }
  double v15 = v13;

LABEL_6:
  [(NUIContainerStackView *)self setSpacing:10.0 - v15];
  BOOL v16 = !v5 && !v4;
  v17 = [(SearchUICardSectionView *)self chevronView];
  [v17 setHidden:v16];

  if (v16)
  {
    double v23 = *v7;
    double v24 = v7[1];
    double v28 = 0.0;
    double v25 = v7[2];
  }
  else
  {
    id v18 = [(SearchUICardSectionView *)self chevronView];

    if (!v18)
    {
      double v19 = +[SearchUISymbolImage chevronImage];
      CGFloat v20 = +[SearchUIImageView imageViewWithImage:v19];

      [v20 setProminence:2];
      [(SearchUICardSectionView *)self setChevronView:v20];
      +[SearchUIAutoLayout requireIntrinsicSizeForView:v20];
      [(SearchUICardSectionView *)self addArrangedSubview:v20];
    }
    double v21 = (double)v5;
    CGFloat v22 = [(SearchUICardSectionView *)self chevronView];
    [v22 setAlpha:v21];

    double v23 = *v7;
    double v24 = v7[1];
    double v25 = v7[2];
    CGFloat v26 = [(SearchUICardSectionView *)self chevronView];
    [(SearchUICardSectionView *)self trailingMarginForAccessory:v26];
    double v28 = v27;
  }
  int v29 = [MEMORY[0x1E4FAE100] isLTR];
  if (v29) {
    double v30 = v28;
  }
  else {
    double v30 = v8;
  }
  if (v29) {
    double v31 = v24;
  }
  else {
    double v31 = v28;
  }
  -[SearchUICardSectionView setLayoutMargins:](self, "setLayoutMargins:", v23, v31, v25, v30);
}

- (double)trailingMarginForAccessory:(id)a3
{
  [a3 intrinsicContentSize];
  double v5 = v4;
  +[SearchUIUtilities imageAccessoryAdditionalCompactHorizontalMargin];
  double v7 = v6;
  double v8 = [(SearchUICardSectionView *)self rowModel];
  id v9 = [(SearchUICardSectionView *)self rowModel];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
    double v12 = v13;
    goto LABEL_7;
  }
  int v10 = [v8 useCompactVersionOfUI];

  if (!v10 || ([MEMORY[0x1E4FAE198] isMacOS] & 1) != 0) {
    goto LABEL_6;
  }
  +[SearchUIUtilities standardCompactHorizontalMargin];
  double v12 = v7 + v5 * -0.5 + v11;
LABEL_7:

  return v12;
}

- (SFCardSection)section
{
  v2 = [(SearchUICardSectionView *)self rowModel];
  v3 = [v2 cardSection];

  return (SFCardSection *)v3;
}

- (void)updateWithRowModel:(id)a3
{
  [(SearchUICardSectionView *)self setRowModel:a3];
  [(SearchUICardSectionView *)self setUserReportMenu:0];
}

- (void)openPunchout:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6 = a3;
  id v12 = (id)objc_opt_new();
  [v12 setPunchout:v6];

  double v7 = objc_opt_new();
  [v7 setCommand:v12];
  double v8 = [(SearchUICardSectionView *)self rowModel];
  id v9 = [(SearchUICardSectionView *)self feedbackDelegate];
  int v10 = +[SearchUIUtilities environmentForDelegate:v9];
  double v11 = +[SearchUICommandHandler handlerForButton:v7 rowModel:v8 environment:v10];
  [v11 executeWithTriggerEvent:a4];
}

- (void)didInvalidateSizeAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SearchUICardSectionView *)self feedbackDelegate];
  char v6 = objc_opt_respondsToSelector();

  double v7 = [(SearchUICardSectionView *)self feedbackDelegate];
  id v9 = v7;
  if (v6)
  {
    [v7 cardSectionViewDidInvalidateSize:self animate:v3];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = [(SearchUICardSectionView *)self feedbackDelegate];
    [v9 cardSectionViewDidInvalidateSize:self];
  }
}

- (void)requestRemovalFromEnclosingView
{
  BOOL v3 = [(SearchUICardSectionView *)self feedbackDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SearchUICardSectionView *)self feedbackDelegate];
    char v6 = [(SearchUICardSectionView *)self rowModel];
    [v5 removeRowModel:v6 completion:0];
  }
  [(SearchUICardSectionView *)self didInvalidateSizeAnimate:1];
}

- (BOOL)configureUserReportButton:(id)a3
{
  char v4 = (SearchUICardSectionView *)a3;
  double v5 = [(SearchUICardSectionView *)self userReportMenu];

  if (!v5)
  {
    char v6 = objc_opt_new();
    double v7 = objc_opt_new();
    [v6 setCommand:v7];

    char v8 = [(SearchUICardSectionView *)self feedbackDelegate];
    id v9 = +[SearchUIUtilities environmentForDelegate:v8];

    if (v4) {
      int v10 = v4;
    }
    else {
      int v10 = self;
    }
    [v9 setSourceView:v10];
    double v11 = [(SearchUICardSectionView *)self rowModel];
    id v12 = +[SearchUICommandHandler handlerForButton:v6 rowModel:v11 environment:v9];

    if ([v12 prefersContextMenu])
    {
      double v13 = [v12 contextMenu];
      [(SearchUICardSectionView *)self setUserReportMenu:v13];
    }
  }
  char v14 = [(SearchUICardSectionView *)self userReportMenu];
  double v15 = [v14 children];
  uint64_t v16 = [v15 count];

  if (v16) {
    [(SearchUICardSectionView *)v4 setMenu:v14];
  }

  return v16 != 0;
}

- (BOOL)highlightFrameMatchesHighlightView
{
  return 1;
}

- (double)highlightFrameCornerRadius
{
  v2 = [(SearchUICardSectionView *)self highlightReferenceView];
  BOOL v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (UIView)highlightReferenceView
{
  return 0;
}

- (BOOL)needsInternalFocus
{
  return 0;
}

- (BOOL)setupManualFocus
{
  return 0;
}

- (NSString)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)SearchUICardSectionView;
  double v4 = [(SearchUICardSectionView *)&v8 description];
  double v5 = [v3 stringWithString:v4];

  char v6 = [(SearchUICardSectionView *)self section];
  [v5 appendFormat:@"\t %@", v6];

  return (NSString *)v5;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (SearchUICardSectionRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
}

- (UIViewController)embeddedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 728, 1);
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (BOOL)isCompactWidth
{
  return self->_isCompactWidth;
}

- (void)setIsCompactWidth:(BOOL)a3
{
  self->_isCompactWidth = a3;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)leadingTextView
{
  return self->_leadingTextView;
}

- (UIView)viewForForcedFocus
{
  return self->_viewForForcedFocus;
}

- (UIView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
}

- (UIMenu)userReportMenu
{
  return self->_userReportMenu;
}

- (void)setUserReportMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userReportMenu, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_viewForForcedFocus, 0);
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end