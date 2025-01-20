@interface MCDNoContentView
- (MCDNoContentView)initWithFrame:(CGRect)a3;
- (MCDNoContentView)initWithTitle:(id)a3 subtitle:(id)a4;
- (MCDNoContentView)initWithTitle:(id)a3 subtitle:(id)a4 buttonText:(id)a5;
- (MCDNoContentViewDelegate)delegate;
- (void)buttonPressed:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MCDNoContentView

- (MCDNoContentView)initWithFrame:(CGRect)a3
{
  v4 = MCDCarDisplayBundle();
  v5 = [v4 localizedStringForKey:@"NO_CONTENT_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  v6 = MCDCarDisplayBundle();
  v7 = [v6 localizedStringForKey:@"NO_CONTENT_SUBTITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  v8 = [(MCDNoContentView *)self initWithTitle:v5 subtitle:v7];

  return v8;
}

- (MCDNoContentView)initWithTitle:(id)a3 subtitle:(id)a4
{
  return [(MCDNoContentView *)self initWithTitle:a3 subtitle:a4 buttonText:0];
}

- (MCDNoContentView)initWithTitle:(id)a3 subtitle:(id)a4 buttonText:(id)a5
{
  v81[4] = *MEMORY[0x263EF8340];
  id v78 = a3;
  id v77 = a4;
  id v8 = a5;
  v79.receiver = self;
  v79.super_class = (Class)MCDNoContentView;
  double v9 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  v13 = -[MCDNoContentView initWithFrame:](&v79, sel_initWithFrame_, *MEMORY[0x263F001A8], v10, v11, v12);
  if (v13)
  {
    [MEMORY[0x263F825C8] tableBackgroundColor];
    v14 = id v75 = v8;
    [(MCDNoContentView *)v13 setBackgroundColor:v14];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v9, v10, v11, v12);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v9, v10, v11, v12);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v9, v10, v11, v12);
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 setHidden:1];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setText:v78];
    [v16 setText:v78];
    [v16 setText:v77];
    v70 = [MEMORY[0x263F81708] systemFontOfSize:28.0];
    objc_msgSend(v15, "setFont:");
    v18 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
    [v16 setFont:v18];

    [v15 setTextAlignment:1];
    [v16 setTextAlignment:1];
    v19 = [MEMORY[0x263F825C8] labelColor];
    [v15 setTextColor:v19];

    v20 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
    [v16 setTextColor:v20];

    [v15 setNumberOfLines:0];
    [v16 setNumberOfLines:0];
    [(MCDNoContentView *)v13 addSubview:v15];
    [(MCDNoContentView *)v13 addSubview:v16];
    [(MCDNoContentView *)v13 addSubview:v17];
    v21 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:12 relatedBy:0 toItem:v15 attribute:11 multiplier:1.0 constant:28.0];
    LODWORD(v22) = 1148846080;
    v74 = v21;
    [v21 setPriority:v22];
    v73 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:2 relatedBy:0 toItem:v17 attribute:2 multiplier:1.0 constant:0.0];
    v72 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:1 relatedBy:0 toItem:v17 attribute:1 multiplier:1.0 constant:0.0];
    v69 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:2 relatedBy:0 toItem:v17 attribute:2 multiplier:1.0 constant:0.0];
    v68 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:1 relatedBy:0 toItem:v17 attribute:1 multiplier:1.0 constant:0.0];
    v66 = v15;
    v67 = [MEMORY[0x263F08938] constraintWithItem:v17 attribute:3 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:0.0];
    v64 = v16;
    v65 = [MEMORY[0x263F08938] constraintWithItem:v17 attribute:4 relatedBy:0 toItem:v16 attribute:4 multiplier:1.0 constant:0.0];
    v23 = (void *)MEMORY[0x263F08938];
    v24 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
    v71 = [v23 constraintWithItem:v17 attribute:1 relatedBy:0 toItem:v24 attribute:1 multiplier:1.0 constant:12.0];

    v25 = (void *)MEMORY[0x263F08938];
    v26 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
    v63 = [v25 constraintWithItem:v17 attribute:2 relatedBy:0 toItem:v26 attribute:2 multiplier:1.0 constant:-12.0];

    v27 = (void *)MEMORY[0x263F08938];
    v28 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
    uint64_t v29 = [v27 constraintWithItem:v17 attribute:10 relatedBy:0 toItem:v28 attribute:10 multiplier:1.0 constant:-11.0];

    v30 = (void *)MEMORY[0x263F08938];
    v31 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
    v62 = [v30 constraintWithItem:v17 attribute:3 relatedBy:1 toItem:v31 attribute:3 multiplier:1.0 constant:0.0];

    v32 = (void *)MEMORY[0x263F08938];
    v33 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
    v76 = [v32 constraintWithItem:v17 attribute:4 relatedBy:-1 toItem:v33 attribute:4 multiplier:1.0 constant:0.0];

    unint64_t v34 = 0x263EFF000uLL;
    if (v75)
    {
      v35 = objc_opt_new();
      v36 = [v35 titleLabel];
      v37 = _MCDNoContentFontWithTextStyle(*MEMORY[0x263F83580]);
      [v36 setFont:v37];

      [v35 setTitle:v75 forState:0];
      [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v35 addTarget:v13 action:sel_buttonPressed_ forControlEvents:64];
      [v35 sizeToFit];
      [(MCDNoContentView *)v13 addSubview:v35];
      v38 = [v35 widthAnchor];
      v39 = [(MCDNoContentView *)v13 widthAnchor];
      v61 = [v38 constraintEqualToAnchor:v39 multiplier:0.699999988 constant:0.0];

      v40 = [v35 heightAnchor];
      v60 = [v40 constraintEqualToConstant:40.0];

      v41 = [v35 centerXAnchor];
      v42 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
      [v42 centerXAnchor];
      v44 = v43 = (void *)v29;
      v45 = [v41 constraintEqualToAnchor:v44];

      v46 = [v35 bottomAnchor];
      v47 = [(MCDNoContentView *)v13 safeAreaLayoutGuide];
      v48 = [v47 bottomAnchor];
      v49 = [v46 constraintEqualToAnchor:v48 constant:-24.0];

      v81[0] = v61;
      v81[1] = v60;
      v81[2] = v45;
      v81[3] = v49;
      v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
      [(MCDNoContentView *)v13 addConstraints:v50];
      [v35 frame];
      double v52 = v51;
      [v43 constant];
      v54 = v43;
      [v43 setConstant:v53 - v52];
      uint64_t v55 = [MEMORY[0x263F08938] constraintWithItem:v17 attribute:4 relatedBy:-1 toItem:v35 attribute:3 multiplier:1.0 constant:0.0];

      unint64_t v34 = 0x263EFF000;
      v76 = (void *)v55;
      v56 = v13;
    }
    else
    {
      v56 = v13;
      v54 = (void *)v29;
    }
    v80[0] = v73;
    v80[1] = v72;
    v80[2] = v69;
    v80[3] = v68;
    v80[4] = v74;
    v80[5] = v76;
    v80[6] = v62;
    v80[7] = v71;
    v80[8] = v63;
    v80[9] = v54;
    v80[10] = v67;
    v80[11] = v65;
    v57 = objc_msgSend(*(id *)(v34 + 2240), "arrayWithObjects:count:", v80, 12, v60);
    [(MCDNoContentView *)v56 addConstraints:v57];
    v58 = v56;

    id v8 = v75;
    v13 = v56;
  }

  return v13;
}

- (void)buttonPressed:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 didTapButton:self];
  }
}

- (MCDNoContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCDNoContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end