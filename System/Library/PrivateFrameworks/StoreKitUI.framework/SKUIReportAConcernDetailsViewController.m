@interface SKUIReportAConcernDetailsViewController
- (SKUIReportAConcernConfiguration)configuration;
- (SKUIReportAConcernDetailsDataSource)dataSource;
- (SKUIReportAConcernDetailsViewController)initWithCoder:(id)a3;
- (SKUIReportAConcernDetailsViewController)initWithConfiguration:(id)a3;
- (SKUIReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKUIReportAConcernMetadata)metadata;
- (UITableView)tableView;
- (double)_detailsCellHeight;
- (double)keyboardHeight;
- (id)_detailsText;
- (id)completion;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setTableView:(id)a3;
- (void)submitPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SKUIReportAConcernDetailsViewController

- (SKUIReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIReportAConcernDetailsViewController initWithNibName:bundle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v14 = [(SKUIReportAConcernDetailsViewController *)self initWithConfiguration:v13];

  return v14;
}

- (SKUIReportAConcernDetailsViewController)initWithCoder:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIReportAConcernDetailsViewController initWithCoder:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v13 = [(SKUIReportAConcernDetailsViewController *)self initWithConfiguration:v12];

  return v13;
}

- (SKUIReportAConcernDetailsViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIReportAConcernDetailsViewController initWithConfiguration:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIReportAConcernDetailsViewController;
  v14 = [(SKUIReportAConcernDetailsViewController *)&v18 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v15 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v16 addObserver:v15 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIReportAConcernDetailsViewController;
  [(SKUIReportAConcernDetailsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)SKUIReportAConcernDetailsViewController;
  [(SKUIReportAConcernDetailsViewController *)&v21 viewDidLoad];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"REPORT_A_CONCERN" value:&stru_1F1C879E8 table:0];
  [(SKUIReportAConcernDetailsViewController *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"SUBMIT" value:&stru_1F1C879E8 table:0];
  uint64_t v8 = (void *)[v5 initWithTitle:v7 style:2 target:self action:sel_submitPressed_];
  uint64_t v9 = [(SKUIReportAConcernDetailsViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  id v10 = objc_alloc(MEMORY[0x1E4FB1D00]);
  uint64_t v11 = objc_msgSend(v10, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v11 setAllowsSelection:0];
  [v11 setDelegate:self];
  uint64_t v12 = [[SKUIReportAConcernDetailsDataSource alloc] initWithTableView:v11];
  uint64_t v13 = [(SKUIReportAConcernDetailsViewController *)self configuration];
  v14 = [v13 reportConcernExplanation];
  [(SKUIReportAConcernDetailsDataSource *)v12 setPlaceholder:v14];

  v15 = [(SKUIReportAConcernDetailsViewController *)self metadata];
  v16 = [v15 selectedReason];
  v17 = [v16 uppercaseName];
  [(SKUIReportAConcernDetailsDataSource *)v12 setSelectedReason:v17];

  objc_super v18 = [(SKUIReportAConcernDetailsViewController *)self configuration];
  v19 = [v18 privacyNote];
  [(SKUIReportAConcernDetailsDataSource *)v12 setPrivacyNote:v19];

  [v11 setDataSource:v12];
  [(SKUIReportAConcernDetailsViewController *)self setDataSource:v12];
  v20 = [(SKUIReportAConcernDetailsViewController *)self view];
  [v20 addSubview:v11];

  [(SKUIReportAConcernDetailsViewController *)self setTableView:v11];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SKUIReportAConcernDetailsViewController;
  [(SKUIReportAConcernDetailsViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(SKUIReportAConcernDetailsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SKUIReportAConcernDetailsViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)submitPressed:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  double v5 = [(SKUIReportAConcernDetailsViewController *)self _detailsText];
  double v6 = [(SKUIReportAConcernDetailsViewController *)self metadata];
  [v6 setDetails:v5];

  double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v7 sendAction:sel_resignFirstResponder to:0 from:0 forEvent:0];

  uint64_t v8 = *MEMORY[0x1E4FB2748];
  double v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v10 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v10);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke;
  v31[3] = &__block_descriptor_40_e5_v8__0l;
  v31[4] = v8;
  uint64_t v12 = (void *)[v9 beginBackgroundTaskWithName:v11 expirationHandler:v31];

  objc_super v13 = [(SKUIReportAConcernDetailsViewController *)self view];
  v14 = [v13 window];

  v15 = [SKUIReportAConcernOperation alloc];
  v16 = [(SKUIReportAConcernDetailsViewController *)self metadata];
  v17 = [(SKUIReportAConcernOperation *)v15 initWithMetadata:v16];

  objc_initWeak(&location, v17);
  objc_initWeak(&from, self);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_2;
  v24 = &unk_1E642A1B0;
  objc_copyWeak(&v27, &location);
  id v18 = v14;
  id v25 = v18;
  objc_copyWeak(v28, &from);
  id v19 = v4;
  id v26 = v19;
  v28[1] = v12;
  [(SKUIReportAConcernOperation *)v17 setCompletionBlock:&v21];
  v20 = objc_msgSend(MEMORY[0x1E4FB8838], "mainQueue", v21, v22, v23, v24);
  [v20 addOperation:v17];

  objc_destroyWeak(v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

void __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_3;
  block[3] = &unk_1E642A188;
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  id v3 = WeakRetained;
  objc_copyWeak(v10, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  double v5 = *(void **)(a1 + 64);
  id v9 = v4;
  v10[1] = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v10);
}

void __57__SKUIReportAConcernDetailsViewController_submitPressed___block_invoke_3(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) responseDictionary];
  if (([*(id *)(a1 + 32) success] & 1) == 0 && v2)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v28 = (void *)[objc_alloc(MEMORY[0x1E4FA8148]) initWithResponseDictionary:v2];
    id v3 = [v28 actions];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v34;
      uint64_t v7 = *MEMORY[0x1E4FA8900];
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          double v10 = [v9 actionType];
          int v11 = [v10 isEqualToString:v7];

          if (v11)
          {
            v16 = [v9 dialog];
            v17 = [MEMORY[0x1E4FB1420] _alertViewForWindow:*(void *)(a1 + 40)];
            id v18 = [v16 message];
            [v17 setMessage:v18];

            id v19 = [v16 title];
            [v17 setTitle:v19];

            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
            [v17 setDelegate:WeakRetained];

            uint64_t v21 = [v16 buttons];
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v30;
              do
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v30 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  id v26 = [*(id *)(*((void *)&v29 + 1) + 8 * j) buttonTitle];
                  [v17 addButtonWithTitle:v26];
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
              }
              while (v23);
            }
            [v17 show];

            goto LABEL_22;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v13 = [v12 completion];

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 56));
    v15 = [v14 completion];
    v15[2](v15, 1);
  }
  else
  {
LABEL_22:
    [*(id *)(a1 + 48) setEnabled:1];
  }
  if (*(void *)(a1 + 64) != *MEMORY[0x1E4FB2748])
  {
    id v27 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v27 endBackgroundTask:*(void *)(a1 + 64)];
  }
}

- (id)_detailsText
{
  id v2 = [(SKUIReportAConcernDetailsViewController *)self tableView];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  uint64_t v4 = [v2 cellForRowAtIndexPath:v3];

  uint64_t v5 = [v4 text];

  return v5;
}

- (double)_detailsCellHeight
{
  id v3 = [(SKUIReportAConcernDetailsViewController *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v11);
  uint64_t v5 = [(SKUIReportAConcernDetailsViewController *)self topLayoutGuide];
  [v5 length];
  double v7 = Height - v6;
  [(SKUIReportAConcernDetailsViewController *)self keyboardHeight];
  double v9 = v7 - v8;

  return fmin(v9, 250.0);
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  [(SKUIReportAConcernDetailsViewController *)self setKeyboardHeight:v6];
  double v7 = [v4 objectForKey:*MEMORY[0x1E4FB2BA8]];
  [v7 floatValue];
  double v9 = v8;

  double v10 = [v4 objectForKey:*MEMORY[0x1E4FB2BA0]];
  uint64_t v11 = [v10 integerValue];

  id v12 = [(SKUIReportAConcernDetailsViewController *)self tableView];
  [v12 contentInset];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__SKUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke;
  v21[3] = &unk_1E6425038;
  v21[4] = self;
  v21[5] = v14;
  v21[6] = v16;
  v21[7] = v18;
  v21[8] = v20;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 delay:v21 options:&__block_literal_global_58 animations:v9 completion:0.0];
}

void __61__SKUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) keyboardHeight];
  double v6 = v5;
  double v7 = *(double *)(a1 + 64);
  float v8 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v8, "setContentInset:", v3, v4, v6, v7);

  double v9 = [*(id *)(a1 + 32) tableView];
  double v10 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v17 = [v9 cellForRowAtIndexPath:v10];

  uint64_t v11 = [*(id *)(a1 + 32) tableView];
  [v17 frame];
  double MinY = CGRectGetMinY(v19);
  uint64_t v13 = [*(id *)(a1 + 32) tableView];
  [v13 contentInset];
  objc_msgSend(v11, "setContentOffset:", 0.0, MinY - v14);

  uint64_t v15 = [*(id *)(a1 + 32) tableView];
  [v15 endUpdates];

  uint64_t v16 = [*(id *)(a1 + 32) view];
  [v16 layoutIfNeeded];
}

- (void)_keyboardWillHide:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BA8]];
  [v5 floatValue];
  double v7 = v6;

  float v8 = [v4 objectForKey:*MEMORY[0x1E4FB2BA0]];
  uint64_t v9 = [v8 integerValue];

  double v10 = [(SKUIReportAConcernDetailsViewController *)self tableView];
  [v10 contentInset];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  [(SKUIReportAConcernDetailsViewController *)self setKeyboardHeight:0.0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__SKUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke;
  v19[3] = &unk_1E6425038;
  v19[4] = self;
  v19[5] = v12;
  v19[6] = v14;
  v19[7] = v16;
  v19[8] = v18;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 delay:v19 options:0 animations:v7 completion:0.0];
}

void __61__SKUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) keyboardHeight];
  double v5 = v4;
  double v6 = *(double *)(a1 + 64);
  double v7 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v7, "setContentInset:", v2, v3, v5, v6);

  float v8 = [*(id *)(a1 + 32) view];
  [v8 layoutIfNeeded];

  uint64_t v9 = [*(id *)(a1 + 32) tableView];
  [v9 beginUpdates];

  id v10 = [*(id *)(a1 + 32) tableView];
  [v10 endUpdates];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SKUIReportAConcernMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (SKUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SKUIReportAConcernDetailsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboarddouble Height = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end