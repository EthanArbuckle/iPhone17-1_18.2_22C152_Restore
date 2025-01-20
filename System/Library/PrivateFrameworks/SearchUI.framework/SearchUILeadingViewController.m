@interface SearchUILeadingViewController
+ (BOOL)supportsRowModel:(id)a3;
+ (Class)leadingViewClassForRowModel:(id)a3;
- (BOOL)shouldCenterAlignToTitle;
- (BOOL)shouldVerticallyCenter;
- (BOOL)usesCompactWidth;
- (SearchUIDetailedRowModel)rowModel;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (SearchUILeadingViewController)init;
- (UIView)view;
- (id)imageView;
- (id)setupView;
- (unint64_t)type;
- (void)hide;
- (void)setFeedbackDelegate:(id)a3;
- (void)setRowModel:(id)a3;
- (void)setUsesCompactWidth:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation SearchUILeadingViewController

+ (Class)leadingViewClassForRowModel:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)leadingViewClassForRowModel__classes;
  if (!leadingViewClassForRowModel__classes)
  {
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    v6 = (void *)leadingViewClassForRowModel__classes;
    leadingViewClassForRowModel__classes = v5;

    v4 = (void *)leadingViewClassForRowModel__classes;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v4;
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsRowModel:", v3, (void)v13))
        {
          id v8 = v11;
          goto LABEL_13;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (Class)v8;
}

- (SearchUILeadingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUILeadingViewController;
  v2 = [(SearchUILeadingViewController *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v4 = [(SearchUILeadingViewController *)v2 setupView];
    [(SearchUILeadingViewController *)v3 setView:v4];
  }
  return v3;
}

+ (BOOL)supportsRowModel:(id)a3
{
  return 0;
}

- (void)hide
{
  id v2 = [(SearchUILeadingViewController *)self view];
  [v2 setHidden:1];
}

- (BOOL)shouldVerticallyCenter
{
  return 0;
}

- (BOOL)shouldCenterAlignToTitle
{
  return 0;
}

- (id)setupView
{
  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (id)imageView
{
  return 0;
}

- (SearchUIDetailedRowModel)rowModel
{
  return self->rowModel;
}

- (void)setRowModel:(id)a3
{
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (BOOL)usesCompactWidth
{
  return self->_usesCompactWidth;
}

- (void)setUsesCompactWidth:(BOOL)a3
{
  self->_usesCompactWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->feedbackDelegate);
  objc_storeStrong((id *)&self->rowModel, 0);
}

@end