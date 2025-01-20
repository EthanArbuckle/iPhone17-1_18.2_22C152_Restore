@interface SUUIComposeReviewNicknameViewController
- (SUUIComposeReviewNicknameDelegate)delegate;
- (SUUIComposeReviewNicknameView)nicknameView;
- (UIScrollView)scrollView;
- (void)_cancel;
- (void)_setupBarButtonItems;
- (void)_setupNicknameView;
- (void)_setupScrollView;
- (void)_submit;
- (void)_updateConfirmState;
- (void)setDelegate:(id)a3;
- (void)setNicknameView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SUUIComposeReviewNicknameViewController

- (void)viewDidLoad
{
  v3 = [(SUUIComposeReviewNicknameViewController *)self view];
  v4 = [v3 keyboardLayoutGuide];
  [v4 setFollowsUndockedKeyboard:1];

  [(SUUIComposeReviewNicknameViewController *)self _setupScrollView];
  [(SUUIComposeReviewNicknameViewController *)self _setupNicknameView];
  [(SUUIComposeReviewNicknameViewController *)self _setupBarButtonItems];
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F83AC8];
  v6 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  v7 = [v6 nicknameTextfield];
  [v8 addObserver:self selector:sel__updateConfirmState name:v5 object:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  v3 = [v4 nicknameTextfield];
  [v3 becomeFirstResponder];
}

- (void)_setupScrollView
{
  v3 = objc_opt_new();
  [(SUUIComposeReviewNicknameViewController *)self setScrollView:v3];

  id v4 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v5 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  [v5 setShowsVerticalScrollIndicator:0];

  v6 = [(SUUIComposeReviewNicknameViewController *)self view];
  v7 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  [v6 addSubview:v7];

  id v8 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v9 = [v8 frameLayoutGuide];
  v10 = [v9 topAnchor];
  v11 = [(SUUIComposeReviewNicknameViewController *)self view];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 topAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v16 = [v15 frameLayoutGuide];
  v17 = [v16 centerXAnchor];
  v18 = [(SUUIComposeReviewNicknameViewController *)self view];
  v19 = [v18 centerXAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  v23 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v24 = [v23 frameLayoutGuide];
  v25 = [v24 widthAnchor];
  v26 = v25;
  if (v22 == 1)
  {
    v27 = [v25 constraintLessThanOrEqualToConstant:400.0];
    [v27 setActive:1];
  }
  else
  {
    v27 = [(SUUIComposeReviewNicknameViewController *)self view];
    v28 = [v27 widthAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v29 setActive:1];
  }
  id v36 = [(SUUIComposeReviewNicknameViewController *)self view];
  v30 = [v36 keyboardLayoutGuide];
  v31 = [v30 topAnchor];
  v32 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v33 = [v32 frameLayoutGuide];
  v34 = [v33 bottomAnchor];
  v35 = [v31 constraintEqualToSystemSpacingBelowAnchor:v34 multiplier:1.0];
  [v35 setActive:1];
}

- (void)_setupNicknameView
{
  v3 = [SUUIComposeReviewNicknameView alloc];
  id v4 = -[SUUIComposeReviewNicknameView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SUUIComposeReviewNicknameViewController *)self setNicknameView:v4];

  uint64_t v5 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v7 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  [v6 addSubview:v7];

  id v8 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v9 = [v8 contentLayoutGuide];
  v10 = [v9 topAnchor];
  v11 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v15 = [v14 contentLayoutGuide];
  v16 = [v15 leadingAnchor];
  v17 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  v18 = [v17 leadingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v21 = [v20 contentLayoutGuide];
  uint64_t v22 = [v21 trailingAnchor];
  v23 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v27 = [v26 contentLayoutGuide];
  v28 = [v27 bottomAnchor];
  v29 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  id v38 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v32 = [v38 contentLayoutGuide];
  v33 = [v32 widthAnchor];
  v34 = [(SUUIComposeReviewNicknameViewController *)self scrollView];
  v35 = [v34 frameLayoutGuide];
  id v36 = [v35 widthAnchor];
  v37 = [v33 constraintEqualToAnchor:v36];
  [v37 setActive:1];
}

- (void)_setupBarButtonItems
{
  id v9 = [(SUViewController *)self navigationItem];
  id v3 = objc_alloc(MEMORY[0x263F895D0]);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"CONFIRM" value:&stru_2704F8130 table:0];
  v6 = (void *)[v3 initWithTitle:v5 style:2 target:self action:sel__submit];

  [v9 setRightBarButtonItem:v6];
  v7 = [(SUViewController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:0];
}

- (void)_cancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 composeReviewNicknameDidCancel:self];
  }
}

- (void)_submit
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
    v7 = [v6 nicknameTextfield];
    id v8 = [v7 text];
    [v9 composeReviewNicknameDidConfirm:self nickname:v8];
  }
}

- (void)_updateConfirmState
{
  id v3 = [(SUUIComposeReviewNicknameViewController *)self nicknameView];
  id v4 = [v3 nicknameTextfield];
  char v5 = [v4 text];
  id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v9 = [v5 stringByTrimmingCharactersInSet:v6];

  v7 = [(SUViewController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  objc_msgSend(v8, "setEnabled:", objc_msgSend(v9, "length") != 0);
}

- (SUUIComposeReviewNicknameDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIComposeReviewNicknameDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (SUUIComposeReviewNicknameView)nicknameView
{
  return self->_nicknameView;
}

- (void)setNicknameView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end