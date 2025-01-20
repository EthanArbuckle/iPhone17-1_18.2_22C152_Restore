@interface SearchUIAuxiliaryTextViewController
+ (BOOL)supportsRowModel:(id)a3;
- (BOOL)shouldCenter;
- (BOOL)shouldVerticallyCenter;
- (id)setupView;
- (unint64_t)type;
- (void)setShouldCenter:(BOOL)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIAuxiliaryTextViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 trailingTopText];
  v5 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v4];
  if ([v5 hasContent])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [v3 trailingMiddleText];
    v8 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v7];
    if ([v8 hasContent])
    {
      char v6 = 1;
    }
    else
    {
      v9 = [v3 trailingBottomText];
      v10 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v9];
      char v6 = [v10 hasContent];
    }
  }

  return v6;
}

- (BOOL)shouldVerticallyCenter
{
  return 1;
}

- (id)setupView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAuxiliaryTextViewController;
  [(SearchUIAccessoryViewController *)&v9 updateWithRowModel:v4];
  v5 = [(SearchUIAccessoryViewController *)self view];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SearchUIAuxiliaryTextViewController_updateWithRowModel___block_invoke;
  v7[3] = &unk_1E6E72620;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBatchUpdates:v7];
}

void __58__SearchUIAuxiliaryTextViewController_updateWithRowModel___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) useCompactVersionOfUI];
  id v3 = [*(id *)(a1 + 32) view];
  [v3 setUseCompactMode:v2];

  id v4 = [*(id *)(a1 + 40) trailingTopText];
  v5 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v4];
  id v6 = [*(id *)(a1 + 32) view];
  [v6 setTopText:v5];

  v7 = [*(id *)(a1 + 40) trailingMiddleText];
  id v8 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v7];
  objc_super v9 = [*(id *)(a1 + 32) view];
  [v9 setMiddleText:v8];

  id v12 = [*(id *)(a1 + 40) trailingBottomText];
  v10 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v12];
  v11 = [*(id *)(a1 + 32) view];
  [v11 setBottomText:v10];
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)shouldCenter
{
  return self->_shouldCenter;
}

- (void)setShouldCenter:(BOOL)a3
{
  self->_shouldCenter = a3;
}

@end