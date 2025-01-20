@interface SearchUIStrokeAnimationCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)setupContentView;
- (void)animationDidStart;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIStrokeAnimationCardSectionView

- (id)setupContentView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA8A90]);
  v4 = [v3 strokeViewWithDelegate:self];

  return v4;
}

- (void)updateWithRowModel:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SearchUIStrokeAnimationCardSectionView;
  [(SearchUICardSectionView *)&v15 updateWithRowModel:a3];
  v4 = [(SearchUICardSectionView *)self rowModel];
  v5 = [v4 cardSection];

  id v6 = objc_alloc(MEMORY[0x1E4FA8A88]);
  v7 = [v5 characters];
  v8 = [v7 firstObject];
  v9 = [v5 strokeAnimationRepresentation];
  v10 = [v5 strokeNames];
  v11 = [v5 pronunciations];
  v12 = [v11 firstObject];
  v13 = (void *)[v6 initWithCharacter:v8 strokeAnimationRepresention:v9 strokeNames:v10 pronunciation:v12];

  v14 = [(SearchUICardSectionView *)self contentView];
  [v14 updateWithData:v13];
}

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (void)animationDidStart
{
  id v3 = [(SearchUICardSectionView *)self rowModel];
  v4 = [v3 cardSection];
  v5 = [v4 commands];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F99F30]);
    v8 = [(SearchUICardSectionView *)self section];
    id v10 = (id)[v7 initWithCardSection:v8 destination:0 triggerEvent:2 actionCardType:1];

    [v10 setActionTarget:4];
    v9 = [(SearchUICardSectionView *)self feedbackDelegate];
    [v9 didEngageCardSection:v10];
  }
}

@end