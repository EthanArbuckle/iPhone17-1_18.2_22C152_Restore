@interface SearchUIAccessoryViewController
+ (BOOL)supportsRowModel:(id)a3;
+ (Class)accessoryViewClassForRowModel:(id)a3;
- (BOOL)containsSymbolImage;
- (BOOL)shouldTopAlignForAccessibilityContentSizes;
- (BOOL)shouldVerticallyCenter;
- (SearchUIAccessoryViewController)init;
- (SearchUIAccessoryViewDelegate)delegate;
- (SearchUIDetailedRowModel)rowModel;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (UIControl)control;
- (UIView)view;
- (id)controlInView:(id)a3;
- (id)setupView;
- (unint64_t)type;
- (void)didEngageAction:(unint64_t)a3 destination:(unint64_t)a4;
- (void)hide;
- (void)setControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setRowModel:(id)a3;
- (void)setView:(id)a3;
@end

@implementation SearchUIAccessoryViewController

+ (Class)accessoryViewClassForRowModel:(id)a3
{
  v18[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)accessoryViewClassForRowModel__classes;
  if (!accessoryViewClassForRowModel__classes)
  {
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    v18[5] = objc_opt_class();
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];
    v6 = (void *)accessoryViewClassForRowModel__classes;
    accessoryViewClassForRowModel__classes = v5;

    v4 = (void *)accessoryViewClassForRowModel__classes;
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

+ (BOOL)supportsRowModel:(id)a3
{
  return 0;
}

- (BOOL)shouldVerticallyCenter
{
  return 1;
}

- (SearchUIAccessoryViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAccessoryViewController;
  v2 = [(SearchUIAccessoryViewController *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v4 = [(SearchUIAccessoryViewController *)v2 setupView];
    [(SearchUIAccessoryViewController *)v3 setView:v4];

    uint64_t v5 = [(SearchUIAccessoryViewController *)v3 view];
    uint64_t v6 = [(SearchUIAccessoryViewController *)v3 controlInView:v5];
    control = v3->_control;
    v3->_control = (UIControl *)v6;

    [(UIControl *)v3->_control addTarget:v3 action:sel_buttonPressed forControlEvents:64];
  }
  return v3;
}

- (id)controlInView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = [(SearchUIAccessoryViewController *)self controlInView:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          long long v13 = v12;
          if (v12)
          {
            if (v9)
            {

              id v5 = 0;
              goto LABEL_17;
            }
            id v9 = v12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v9 = 0;
    }

    id v9 = v9;
    id v5 = v9;
LABEL_17:
  }
  return v5;
}

- (id)setupView
{
  return 0;
}

- (void)didEngageAction:(unint64_t)a3 destination:(unint64_t)a4
{
  uint64_t v7 = [(SearchUIAccessoryViewController *)self delegate];
  id v30 = [v7 feedbackDelegate];

  uint64_t v8 = [(SearchUIAccessoryViewController *)self rowModel];
  uint64_t v9 = [v8 identifyingResult];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_5;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F9A340]);
    long long v13 = [(SearchUIAccessoryViewController *)self rowModel];
    long long v14 = [v13 identifyingResult];
    uint64_t v8 = (void *)[v12 initWithResult:v14 triggerEvent:2 destination:a4 actionTarget:a3];

    [v30 didEngageResult:v8];
  }

LABEL_5:
  long long v15 = [(SearchUIAccessoryViewController *)self rowModel];
  uint64_t v16 = [v15 cardSection];
  if (v16)
  {
    long long v17 = (void *)v16;
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_9;
    }
    id v19 = objc_alloc(MEMORY[0x1E4F99F30]);
    uint64_t v20 = [(SearchUIAccessoryViewController *)self rowModel];
    v21 = [v20 cardSection];
    long long v15 = (void *)[v19 initWithCardSection:v21 destination:0 triggerEvent:2 actionCardType:0];

    [v15 setActionTarget:a3];
    objc_msgSend(v15, "setQueryId:", -[SearchUIRowModel queryId](self->rowModel, "queryId"));
    [v30 didEngageCardSection:v15];
  }

LABEL_9:
  if (objc_opt_respondsToSelector())
  {
    v22 = objc_opt_new();
    id v23 = objc_alloc(MEMORY[0x1E4F99FB8]);
    v24 = [(SearchUIAccessoryViewController *)self rowModel];
    v25 = [v24 cardSection];
    v26 = (void *)[v23 initWithCommand:v22 cardSection:v25];

    v27 = [(SearchUIAccessoryViewController *)self rowModel];
    objc_msgSend(v26, "setQueryId:", objc_msgSend(v27, "queryId"));

    v28 = [(SearchUIAccessoryViewController *)self rowModel];
    v29 = [v28 identifyingResult];
    [v26 setResult:v29];

    [v26 setTriggerEvent:2];
    [v30 didPerformCommand:v26];
  }
}

- (void)hide
{
  id v2 = [(SearchUIAccessoryViewController *)self view];
  [v2 setHidden:1];
}

- (BOOL)shouldTopAlignForAccessibilityContentSizes
{
  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)containsSymbolImage
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

- (UIView)view
{
  return self->view;
}

- (void)setView:(id)a3
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

- (UIControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (SearchUIAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIAccessoryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_control, 0);
  objc_destroyWeak((id *)&self->feedbackDelegate);
  objc_storeStrong((id *)&self->view, 0);
  objc_storeStrong((id *)&self->rowModel, 0);
}

@end