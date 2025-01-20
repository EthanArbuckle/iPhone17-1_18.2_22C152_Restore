@interface SearchUIDescriptionCardSectionView
+ (BOOL)supportsCustomUserReportRequestAfforance;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (id)dragSubtitleForCardSection:(id)a3;
+ (id)dragTitleForCardSection:(id)a3;
- (BOOL)expanded;
- (id)setupContentView;
- (void)didPressFootnoteButton;
- (void)didPressMoreButton;
- (void)setExpanded:(BOOL)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIDescriptionCardSectionView

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
  v3 = objc_opt_new();
  [v3 setDelegate:self];
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 cardSection];
  v6 = [(SearchUICardSectionView *)self section];
  BOOL v7 = v6 == v5 && [(SearchUIDescriptionCardSectionView *)self expanded];
  [(SearchUIDescriptionCardSectionView *)self setExpanded:v7];

  v15.receiver = self;
  v15.super_class = (Class)SearchUIDescriptionCardSectionView;
  [(SearchUICardSectionView *)&v15 updateWithRowModel:v4];

  v8 = [(SearchUICardSectionView *)self contentView];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SearchUIDescriptionCardSectionView_updateWithRowModel___block_invoke;
  v11[3] = &unk_1E6E72938;
  id v12 = v8;
  id v13 = v5;
  v14 = self;
  id v9 = v5;
  id v10 = v8;
  [v10 performBatchUpdates:v11];
}

void __57__SearchUIDescriptionCardSectionView_updateWithRowModel___block_invoke(id *a1)
{
  id v4 = [a1[5] image];
  v5 = +[SearchUITLKImageConverter imageForSFImage:v4];
  [a1[4] setImage:v5];

  v6 = [a1[5] title];
  BOOL v7 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v6];
  [a1[4] setTitle:v7];

  v8 = [a1[5] richDescriptions];
  uint64_t v9 = [v8 count];

  id v10 = SearchUITLKMultilineTextConverter;
  id v11 = a1[5];
  if (v9)
  {
    id v12 = [v11 richDescriptions];
    id v13 = [v12 firstObject];
    id v10 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v13];
    [a1[4] setText:v10];
  }
  else
  {
    id v12 = [v11 descriptionText];
    id v13 = +[SearchUITLKMultilineTextConverter textForSearchUIText:v12];
    [a1[4] setText:v13];
  }

  char v14 = [a1[6] expanded];
  if (v14)
  {
    BOOL v15 = 0;
    BOOL v16 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    id v13 = [a1[5] richDescriptions];
    uint64_t v18 = [v13 firstObject];
    BOOL v15 = v18 != 0;
    id v19 = a1[5];
    if (v18)
    {
      id v10 = [v19 richDescriptions];
      v1 = [(__objc2_class *)v10 firstObject];
      v2 = (void *)v18;
    }
    else
    {
      v1 = [v19 descriptionText];
      v2 = 0;
    }
    BOOL v16 = v18 == 0;
    uint64_t v17 = [v1 maxLines];
  }
  v20 = [a1[4] text];
  [v20 setMaxLines:v17];

  if (v16)
  {

    if (!v15)
    {
LABEL_12:
      if (v14) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if (!v15)
  {
    goto LABEL_12;
  }

  if ((v14 & 1) == 0)
  {
LABEL_13:
  }
LABEL_14:
  v21 = [a1[5] expandText];
  [a1[4] setMoreButtonText:v21];

  v22 = [a1[5] attributionText];
  [a1[4] setFootnoteButtonText:v22];

  id v24 = [a1[5] userReportRequest];
  v23 = [v24 affordanceText];
  [a1[4] setTrailingFootnoteButtonText:v23];
}

+ (id)dragTitleForCardSection:(id)a3
{
  return (id)[a3 title];
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  v3 = [a3 descriptionText];
  id v4 = [v3 text];

  return v4;
}

- (void)didPressMoreButton
{
  id v8 = (id)objc_opt_new();
  v3 = objc_opt_new();
  [v8 setCommand:v3];

  id v4 = [(SearchUICardSectionView *)self rowModel];
  v5 = [(SearchUICardSectionView *)self feedbackDelegate];
  v6 = +[SearchUIUtilities environmentForDelegate:v5];
  BOOL v7 = +[SearchUICommandHandler handlerForButton:v8 rowModel:v4 environment:v6];
  [v7 wasPerformedWithTriggerEvent:2];

  [(SearchUICardSectionView *)self didInvalidateSizeAnimate:1];
  [(SearchUIDescriptionCardSectionView *)self setExpanded:1];
}

- (void)didPressFootnoteButton
{
  v3 = [(SearchUICardSectionView *)self rowModel];
  id v7 = [v3 cardSection];

  id v4 = (void *)MEMORY[0x1E4F9A2F8];
  v5 = [v7 attributionURL];
  v6 = [v4 punchoutWithURL:v5];
  [(SearchUICardSectionView *)self openPunchout:v6 triggerEvent:2];
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

@end