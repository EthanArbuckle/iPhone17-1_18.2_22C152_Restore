@interface MCDLoadingContentView
- (MCDLoadingContentView)initWithFrame:(CGRect)a3;
@end

@implementation MCDLoadingContentView

- (MCDLoadingContentView)initWithFrame:(CGRect)a3
{
  v48[7] = *MEMORY[0x263EF8340];
  v47.receiver = self;
  v47.super_class = (Class)MCDLoadingContentView;
  v3 = -[MCDLoadingContentView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] tableBackgroundColor];
    [(MCDLoadingContentView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = MCDCarDisplayBundle();
    v12 = [v11 localizedStringForKey:@"LOADING_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    [v10 setText:v12];

    v13 = _MCDNoContentFontWithTextStyle(*MEMORY[0x263F83618]);
    [v10 setFont:v13];

    [v10 setTextAlignment:1];
    [v10 setNumberOfLines:0];
    v14 = [MEMORY[0x263F825C8] labelColor];
    [v10 setTextColor:v14];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x263F823E8]), "initWithFrame:", v6, v7, v8, v9);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x263F825C8] labelColor];
    [v15 setColor:v16];

    [v15 setActivityIndicatorViewStyle:21];
    [v15 sizeToFit];
    [v15 startAnimating];
    id v17 = objc_alloc_init(MEMORY[0x263F82908]);
    [(MCDLoadingContentView *)v3 addLayoutGuide:v17];
    [(MCDLoadingContentView *)v3 addSubview:v15];
    [(MCDLoadingContentView *)v3 addSubview:v10];
    v35 = (void *)MEMORY[0x263F08938];
    v45 = [v17 topAnchor];
    v46 = [(MCDLoadingContentView *)v3 safeAreaLayoutGuide];
    v44 = [v46 topAnchor];
    [v45 constraintEqualToAnchor:v44];
    v43 = v42 = v17;
    v48[0] = v43;
    v41 = [v17 heightAnchor];
    v40 = [(MCDLoadingContentView *)v3 heightAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 multiplier:0.15 constant:0.0];
    v48[1] = v39;
    v38 = [v10 topAnchor];
    v37 = [v17 bottomAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v48[2] = v36;
    v33 = [v10 leadingAnchor];
    v34 = [(MCDLoadingContentView *)v3 safeAreaLayoutGuide];
    v32 = [v34 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:12.0];
    v48[3] = v31;
    v29 = [v10 trailingAnchor];
    v30 = [(MCDLoadingContentView *)v3 safeAreaLayoutGuide];
    v28 = [v30 trailingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:-12.0];
    v48[4] = v27;
    v18 = [v15 centerXAnchor];
    v19 = [(MCDLoadingContentView *)v3 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v48[5] = v20;
    v21 = [v15 topAnchor];
    v22 = [v10 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:28.0];
    v48[6] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:7];
    [v35 activateConstraints:v24];

    v25 = v3;
  }

  return v3;
}

@end