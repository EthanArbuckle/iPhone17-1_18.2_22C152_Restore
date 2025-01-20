@interface SHSRingSilentFooter
+ (id)newImageView;
+ (id)newTextView;
- (SHSRingSilentFooter)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
@end

@implementation SHSRingSilentFooter

+ (id)newTextView
{
  v2 = [MEMORY[0x263F5FBC0] appearance];
  v3 = [v2 altTextColor];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    PreferencesTableViewFooterColor();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  id v7 = objc_alloc_init(MEMORY[0x263F82D60]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setTextColor:v6];
  v8 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v8];

  v9 = PreferencesTableViewFooterFont();
  [v7 setFont:v9];

  [v7 setShowsVerticalScrollIndicator:0];
  [v7 setEditable:0];
  [v7 setSelectable:1];
  [v7 setScrollEnabled:0];
  v10 = [v7 textContainer];
  [v10 setLineFragmentPadding:0.0];

  objc_msgSend(v7, "setTextContainerInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  [v7 _setInteractiveTextSelectionDisabled:1];

  return v7;
}

+ (id)newImageView
{
  v2 = objc_opt_new();
  [v2 setContentMode:5];
  LODWORD(v3) = 1148846080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [v2 setContentCompressionResistancePriority:1 forAxis:v4];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [v2 widthAnchor];
  v6 = [v5 constraintEqualToConstant:40.0];
  [v6 setActive:1];

  return v2;
}

- (SHSRingSilentFooter)initWithSpecifier:(id)a3
{
  double v3 = -[SHSRingSilentFooter initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v4 = v3;
  if (v3)
  {
    id v5 = [(SHSRingSilentFooter *)v3 contentView];
    v6 = [v5 layoutMarginsGuide];

    uint64_t v7 = [MEMORY[0x263F82818] configurationWithPointSize:5 weight:28.0];
    v8 = objc_opt_new();
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setAxis:1];
    v9 = [(SHSRingSilentFooter *)v4 contentView];
    [v9 addSubview:v8];

    v10 = [v8 topAnchor];
    [v6 topAnchor];
    v11 = v47 = v4;
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [v8 leadingAnchor];
    v14 = [v6 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [v8 trailingAnchor];
    v46 = v6;
    v17 = [v6 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [v8 bottomAnchor];
    v20 = [v6 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = objc_opt_new();
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 setAxis:0];
    [v8 addArrangedSubview:v22];
    [v8 setCustomSpacing:v22 afterView:18.0];
    v41 = (void *)v7;
    v23 = [MEMORY[0x263F827E8] systemImageNamed:@"bell.fill" withConfiguration:v7];
    v24 = [MEMORY[0x263F825C8] labelColor];
    v45 = [v23 imageWithTintColor:v24 renderingMode:1];

    id v44 = +[SHSRingSilentFooter newImageView];
    [v44 setImage:v45];
    [v22 addArrangedSubview:v44];
    [v22 setCustomSpacing:v44 afterView:8.0];
    v25 = objc_opt_new();
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v25 setAxis:1];
    [v22 addArrangedSubview:v25];
    id v43 = +[SHSRingSilentFooter newTextView];
    v26 = SHS_LocalizedStringForSounds(@"RING_MODE");
    v27 = [v26 localizedUppercaseString];
    [v43 setText:v27];

    [v25 addArrangedSubview:v43];
    [v25 setCustomSpacing:v43 afterView:5.0];
    id v42 = +[SHSRingSilentFooter newTextView];
    v28 = SHS_LocalizedStringForSounds(@"RING_MODE_FOOTER");
    [v42 setText:v28];

    [v25 addArrangedSubview:v42];
    v29 = objc_opt_new();
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v29 setAxis:0];
    [v8 addArrangedSubview:v29];
    v30 = [MEMORY[0x263F827E8] systemImageNamed:@"bell.slash.fill" withConfiguration:v7];
    v31 = [MEMORY[0x263F825C8] labelColor];
    v32 = [v30 imageWithTintColor:v31 renderingMode:1];

    id v33 = +[SHSRingSilentFooter newImageView];
    [v33 setImage:v32];
    [v29 addArrangedSubview:v33];
    [v29 setCustomSpacing:v33 afterView:8.0];
    v34 = objc_opt_new();
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v34 setAxis:1];
    [v29 addArrangedSubview:v34];
    id v35 = +[SHSRingSilentFooter newTextView];
    v36 = SHS_LocalizedStringForSounds(@"SILENT_MODE");
    v37 = [v36 localizedUppercaseString];
    [v35 setText:v37];

    [v34 addArrangedSubview:v35];
    [v34 setCustomSpacing:v35 afterView:5.0];
    id v38 = +[SHSRingSilentFooter newTextView];
    v39 = SHS_LocalizedStringForSounds(@"SILENT_MODE_FOOTER");
    [v38 setText:v39];

    [v34 addArrangedSubview:v38];
    double v4 = v47;
  }
  return v4;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v6 = a4;
  double v7 = *(double *)(MEMORY[0x263F83810] + 8);
  v8 = [(SHSRingSilentFooter *)self superview];

  if (!v8)
  {
    [(SHSRingSilentFooter *)self layoutMargins];
    double v12 = v11;
    double v14 = v13;
    [v6 layoutMargins];
    double v16 = v15;
    [v6 layoutMargins];
    -[SHSRingSilentFooter setLayoutMargins:](self, "setLayoutMargins:", v12, v16, v14);
  }
  LODWORD(v9) = 1148846080;
  LODWORD(v10) = 1112014848;
  -[SHSRingSilentFooter systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, v7, v9, v10);
  double v18 = v17;

  return v18;
}

@end