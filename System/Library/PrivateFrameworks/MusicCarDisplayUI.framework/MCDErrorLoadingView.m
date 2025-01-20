@interface MCDErrorLoadingView
- (BOOL)shouldEnableNetwork;
- (MCDErrorLoadingView)initWithTitle:(id)a3 buttonText:(id)a4;
- (MCDErrorViewDelegate)delegate;
- (void)retryButtonPressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldEnableNetwork:(BOOL)a3;
@end

@implementation MCDErrorLoadingView

- (MCDErrorLoadingView)initWithTitle:(id)a3 buttonText:(id)a4
{
  v60[8] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)MCDErrorLoadingView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[MCDErrorLoadingView initWithFrame:](&v59, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  if (v12)
  {
    v13 = [MEMORY[0x263F825C8] tableBackgroundColor];
    [(MCDErrorLoadingView *)v12 setBackgroundColor:v13];

    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v58 = v6;
    if (v6)
    {
      [v14 setText:v6];
    }
    else
    {
      v15 = MCDCarDisplayBundle();
      v16 = [v15 localizedStringForKey:@"FUSE_TIMEOUT_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
      [v14 setText:v16];
    }
    v17 = _MCDNoContentFontWithTextStyle(*MEMORY[0x263F83618]);
    [v14 setFont:v17];

    [v14 setTextAlignment:1];
    [v14 setNumberOfLines:0];
    v18 = [MEMORY[0x263F825C8] labelColor];
    [v14 setTextColor:v18];

    v19 = objc_opt_new();
    v20 = [v19 titleLabel];
    v21 = _MCDNoContentFontWithTextStyle(*MEMORY[0x263F83580]);
    [v20 setFont:v21];

    id v57 = v7;
    if (v7)
    {
      [v19 setTitle:v7 forState:0];
    }
    else
    {
      v22 = MCDCarDisplayBundle();
      v23 = [v22 localizedStringForKey:@"Try Again" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
      [v19 setTitle:v23 forState:0];
    }
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v19 addTarget:v12 action:sel_retryButtonPressed_ forControlEvents:64];
    [v19 sizeToFit];
    id v24 = objc_alloc_init(MEMORY[0x263F82908]);
    [(MCDErrorLoadingView *)v12 addLayoutGuide:v24];
    [(MCDErrorLoadingView *)v12 addSubview:v14];
    [(MCDErrorLoadingView *)v12 addSubview:v19];
    v44 = (void *)MEMORY[0x263F08938];
    v55 = v24;
    v56 = [v24 heightAnchor];
    v54 = [(MCDErrorLoadingView *)v12 heightAnchor];
    v53 = [v56 constraintEqualToAnchor:v54 multiplier:0.15 constant:0.0];
    v60[0] = v53;
    v52 = [v14 topAnchor];
    v51 = [v24 bottomAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v60[1] = v50;
    v48 = [v14 leadingAnchor];
    v49 = [(MCDErrorLoadingView *)v12 safeAreaLayoutGuide];
    v47 = [v49 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:12.0];
    v60[2] = v46;
    v42 = [v14 trailingAnchor];
    v43 = [(MCDErrorLoadingView *)v12 safeAreaLayoutGuide];
    v41 = [v43 trailingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41 constant:-12.0];
    v60[3] = v40;
    v39 = [v19 centerXAnchor];
    v38 = [(MCDErrorLoadingView *)v12 centerXAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v60[4] = v37;
    v36 = [v19 widthAnchor];
    v35 = [(MCDErrorLoadingView *)v12 widthAnchor];
    [v36 constraintEqualToAnchor:v35 multiplier:0.699999988 constant:0.0];
    v25 = v45 = v14;
    v60[5] = v25;
    v26 = [v19 heightAnchor];
    v27 = [v26 constraintEqualToConstant:40.0];
    v60[6] = v27;
    v28 = [v19 bottomAnchor];
    v29 = [(MCDErrorLoadingView *)v12 safeAreaLayoutGuide];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30 constant:-24.0];
    v60[7] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:8];
    [v44 activateConstraints:v32];

    v33 = v12;
    id v7 = v57;
    id v6 = v58;
  }

  return v12;
}

- (void)retryButtonPressed:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = MCDGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Retry button pressed", v9, 2u);
    }

    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 errorViewDidTapButton:self];
  }
}

- (MCDErrorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCDErrorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldEnableNetwork
{
  return self->_shouldEnableNetwork;
}

- (void)setShouldEnableNetwork:(BOOL)a3
{
  self->_shouldEnableNetwork = a3;
}

- (void).cxx_destruct
{
}

@end