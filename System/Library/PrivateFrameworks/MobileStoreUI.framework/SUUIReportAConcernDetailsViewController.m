@interface SUUIReportAConcernDetailsViewController
- (SUUIReportAConcernConfiguration)configuration;
- (SUUIReportAConcernDetailsDataSource)dataSource;
- (SUUIReportAConcernDetailsViewController)initWithCoder:(id)a3;
- (SUUIReportAConcernDetailsViewController)initWithConfiguration:(id)a3;
- (SUUIReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUUIReportAConcernMetadata)metadata;
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

@implementation SUUIReportAConcernDetailsViewController

- (SUUIReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v6 = [(SUUIReportAConcernDetailsViewController *)self initWithConfiguration:v5];

  return v6;
}

- (SUUIReportAConcernDetailsViewController)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v5 = [(SUUIReportAConcernDetailsViewController *)self initWithConfiguration:v4];

  return v5;
}

- (SUUIReportAConcernDetailsViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIReportAConcernDetailsViewController;
  v6 = [(SUUIReportAConcernDetailsViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83800] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIReportAConcernDetailsViewController;
  [(SUUIReportAConcernDetailsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)SUUIReportAConcernDetailsViewController;
  [(SUUIReportAConcernDetailsViewController *)&v21 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"REPORT_A_CONCERN" value:&stru_2704F8130 table:0];
  [(SUUIReportAConcernDetailsViewController *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"SUBMIT" value:&stru_2704F8130 table:0];
  v8 = (void *)[v5 initWithTitle:v7 style:2 target:self action:sel_submitPressed_];
  v9 = [(SUUIReportAConcernDetailsViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  id v10 = objc_alloc(MEMORY[0x263F82C78]);
  v11 = objc_msgSend(v10, "initWithFrame:style:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v11 setAllowsSelection:0];
  [v11 setDelegate:self];
  v12 = [[SUUIReportAConcernDetailsDataSource alloc] initWithTableView:v11];
  v13 = [(SUUIReportAConcernDetailsViewController *)self configuration];
  v14 = [v13 reportConcernExplanation];
  [(SUUIReportAConcernDetailsDataSource *)v12 setPlaceholder:v14];

  v15 = [(SUUIReportAConcernDetailsViewController *)self metadata];
  v16 = [v15 selectedReason];
  v17 = [v16 uppercaseName];
  [(SUUIReportAConcernDetailsDataSource *)v12 setSelectedReason:v17];

  v18 = [(SUUIReportAConcernDetailsViewController *)self configuration];
  v19 = [v18 privacyNote];
  [(SUUIReportAConcernDetailsDataSource *)v12 setPrivacyNote:v19];

  [v11 setDataSource:v12];
  [(SUUIReportAConcernDetailsViewController *)self setDataSource:v12];
  v20 = [(SUUIReportAConcernDetailsViewController *)self view];
  [v20 addSubview:v11];

  [(SUUIReportAConcernDetailsViewController *)self setTableView:v11];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIReportAConcernDetailsViewController;
  [(SUUIReportAConcernDetailsViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(SUUIReportAConcernDetailsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SUUIReportAConcernDetailsViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)submitPressed:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  double v5 = [(SUUIReportAConcernDetailsViewController *)self _detailsText];
  double v6 = [(SUUIReportAConcernDetailsViewController *)self metadata];
  [v6 setDetails:v5];

  double v7 = [MEMORY[0x263F82438] sharedApplication];
  [v7 sendAction:sel_resignFirstResponder to:0 from:0 forEvent:0];

  uint64_t v8 = *MEMORY[0x263F833E0];
  double v9 = [MEMORY[0x263F82438] sharedApplication];
  double v10 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v10);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke;
  v31[3] = &__block_descriptor_40_e5_v8__0l;
  v31[4] = v8;
  v12 = (void *)[v9 beginBackgroundTaskWithName:v11 expirationHandler:v31];

  objc_super v13 = [(SUUIReportAConcernDetailsViewController *)self view];
  v14 = [v13 window];

  v15 = [SUUIReportAConcernOperation alloc];
  v16 = [(SUUIReportAConcernDetailsViewController *)self metadata];
  v17 = [(SUUIReportAConcernOperation *)v15 initWithMetadata:v16];

  objc_initWeak(&location, v17);
  objc_initWeak(&from, self);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_2;
  v24 = &unk_265408AC0;
  objc_copyWeak(&v27, &location);
  id v18 = v14;
  id v25 = v18;
  objc_copyWeak(v28, &from);
  id v19 = v4;
  id v26 = v19;
  v28[1] = v12;
  [(SUUIReportAConcernOperation *)v17 setCompletionBlock:&v21];
  v20 = objc_msgSend(MEMORY[0x263F894E0], "mainQueue", v21, v22, v23, v24);
  [v20 addOperation:v17];

  objc_destroyWeak(v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

void __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_3;
  block[3] = &unk_265408A98;
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  id v3 = WeakRetained;
  objc_copyWeak(v10, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  double v5 = *(void **)(a1 + 64);
  id v9 = v4;
  v10[1] = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v10);
}

void __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_3(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) responseDictionary];
  if (([*(id *)(a1 + 32) success] & 1) == 0 && v2)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v28 = (void *)[objc_alloc(MEMORY[0x263F7B150]) initWithResponseDictionary:v2];
    id v3 = [v28 actions];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v34;
      uint64_t v7 = *MEMORY[0x263F7BC48];
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
            v17 = [MEMORY[0x263F82420] _alertViewForWindow:*(void *)(a1 + 40)];
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
  if (*(void *)(a1 + 64) != *MEMORY[0x263F833E0])
  {
    id v27 = [MEMORY[0x263F82438] sharedApplication];
    [v27 endBackgroundTask:*(void *)(a1 + 64)];
  }
}

- (id)_detailsText
{
  id v2 = [(SUUIReportAConcernDetailsViewController *)self tableView];
  id v3 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  uint64_t v4 = [v2 cellForRowAtIndexPath:v3];

  uint64_t v5 = [v4 text];

  return v5;
}

- (double)_detailsCellHeight
{
  id v3 = [(SUUIReportAConcernDetailsViewController *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v11);
  uint64_t v5 = [(SUUIReportAConcernDetailsViewController *)self topLayoutGuide];
  [v5 length];
  double v7 = Height - v6;
  [(SUUIReportAConcernDetailsViewController *)self keyboardHeight];
  double v9 = v7 - v8;

  return fmin(v9, 250.0);
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 CGRectValue];
  [(SUUIReportAConcernDetailsViewController *)self setKeyboardHeight:v6];
  double v7 = [v4 objectForKey:*MEMORY[0x263F83780]];
  [v7 floatValue];
  double v9 = v8;

  double v10 = [v4 objectForKey:*MEMORY[0x263F83778]];
  uint64_t v11 = [v10 integerValue];

  id v12 = [(SUUIReportAConcernDetailsViewController *)self tableView];
  [v12 contentInset];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__SUUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke;
  v21[3] = &unk_265400B40;
  v21[4] = self;
  v21[5] = v14;
  v21[6] = v16;
  v21[7] = v18;
  v21[8] = v20;
  [MEMORY[0x263F82E00] animateWithDuration:v11 delay:v21 options:&__block_literal_global_62 animations:v9 completion:0.0];
}

void __61__SUUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke(uint64_t a1)
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
  double v10 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
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
  double v5 = [v4 objectForKey:*MEMORY[0x263F83780]];
  [v5 floatValue];
  double v7 = v6;

  float v8 = [v4 objectForKey:*MEMORY[0x263F83778]];
  uint64_t v9 = [v8 integerValue];

  double v10 = [(SUUIReportAConcernDetailsViewController *)self tableView];
  [v10 contentInset];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  [(SUUIReportAConcernDetailsViewController *)self setKeyboardHeight:0.0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__SUUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke;
  v19[3] = &unk_265400B40;
  v19[4] = self;
  v19[5] = v12;
  v19[6] = v14;
  v19[7] = v16;
  v19[8] = v18;
  [MEMORY[0x263F82E00] animateWithDuration:v9 delay:v19 options:0 animations:v7 completion:0.0];
}

void __61__SUUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke(uint64_t a1)
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

- (SUUIReportAConcernMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (SUUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SUUIReportAConcernDetailsDataSource)dataSource
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

@end