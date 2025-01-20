@interface SearchUILeadingHomeScreenViewController
+ (BOOL)supportsRowModel:(id)a3;
- (BOOL)shouldVerticallyCenter;
- (id)setupView;
- (unint64_t)type;
- (void)deleteIcon:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUILeadingHomeScreenViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3 = a3;
  if ([v3 isLocalApplicationResult])
  {
    int v4 = [v3 useCompactVersionOfUI] ^ 1;
  }
  else
  {
    v5 = [v3 cardSection];
    v6 = [v5 command];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v4 = [v3 useCompactVersionOfUI] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (id)setupView
{
  id v3 = objc_opt_new();
  [v3 setAllowsLabelArea:0];
  int v4 = [(SearchUILeadingViewController *)self feedbackDelegate];
  [v3 setFeedbackDelegate:v4];

  [v3 setEngagementDelegate:self];
  [v3 setVariant:4];
  +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", [v3 variant]);
  objc_msgSend(v3, "setMaximumLayoutSize:");
  +[SearchUIAutoLayout requireIntrinsicSizeForView:v3];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_deleteIcon_ name:*MEMORY[0x1E4FA6708] object:0];

  return v3;
}

- (void)setFeedbackDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUILeadingHomeScreenViewController;
  id v4 = a3;
  [(SearchUILeadingViewController *)&v6 setFeedbackDelegate:v4];
  v5 = [(SearchUILeadingViewController *)self view];
  [v5 setFeedbackDelegate:v4];
}

- (void)deleteIcon:(id)a3
{
  id v4 = [a3 userInfo];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA6860]];

  v5 = [(SearchUILeadingViewController *)self view];
  id v6 = [v5 icon];
  if (v6 == v9)
  {
    v7 = [(SearchUILeadingViewController *)self feedbackDelegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_5;
    }
    v5 = [(SearchUILeadingViewController *)self feedbackDelegate];
    id v6 = [(SearchUILeadingViewController *)self rowModel];
    [v5 removeRowModel:v6 completion:0];
  }

LABEL_5:
}

- (BOOL)shouldVerticallyCenter
{
  return 0;
}

- (void)updateWithRowModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUILeadingHomeScreenViewController;
  id v4 = a3;
  [(SearchUILeadingViewController *)&v6 updateWithRowModel:v4];
  v5 = [(SearchUILeadingViewController *)self view];
  [v5 updateWithRowModel:v4];
}

- (unint64_t)type
{
  return 2;
}

@end