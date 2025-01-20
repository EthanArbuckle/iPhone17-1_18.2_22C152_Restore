@interface WFAddToHomeIconPreviewCell
+ (double)defaultRowHeight;
- (UIImageView)iconImageView;
- (UILabel)iconLabel;
- (WFAddToHomeIconPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFHomeScreenIcon)icon;
- (void)configureIcon:(id)a3;
- (void)configureName:(id)a3;
- (void)configureWithName:(id)a3 icon:(id)a4;
- (void)redrawIcon;
- (void)setIcon:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setIconLabel:(id)a3;
@end

@implementation WFAddToHomeIconPreviewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_iconLabel);
  objc_destroyWeak((id *)&self->_iconImageView);
}

- (void)setIcon:(id)a3
{
}

- (WFHomeScreenIcon)icon
{
  return self->_icon;
}

- (void)setIconLabel:(id)a3
{
}

- (UILabel)iconLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconLabel);
  return (UILabel *)WeakRetained;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)iconImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageView);
  return (UIImageView *)WeakRetained;
}

- (void)redrawIcon
{
  id v3 = [(WFAddToHomeIconPreviewCell *)self icon];
  [(WFAddToHomeIconPreviewCell *)self configureIcon:v3];
}

- (void)configureIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
  id v5 = a3;
  id v10 = (id)[objc_alloc(MEMORY[0x263F854B8]) initWithHomeScreenIcon:v5];

  [v10 setCornerRadius:13.5];
  v6 = [(WFAddToHomeIconPreviewCell *)self traitCollection];
  objc_msgSend(v10, "setDark:", objc_msgSend(v6, "userInterfaceStyle") == 2);
  objc_msgSend(v10, "setHighContrast:", objc_msgSend(v6, "accessibilityContrast") == 1);
  v7 = objc_msgSend(v10, "imageWithSize:", 60.0, 60.0);
  v8 = [v7 UIImage];
  v9 = [(WFAddToHomeIconPreviewCell *)self iconImageView];
  [v9 setImage:v8];
}

- (void)configureName:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAddToHomeIconPreviewCell *)self iconLabel];
  [v5 setText:v4];
}

- (void)configureWithName:(id)a3 icon:(id)a4
{
  id v6 = a4;
  [(WFAddToHomeIconPreviewCell *)self configureName:a3];
  [(WFAddToHomeIconPreviewCell *)self configureIcon:v6];
}

- (WFAddToHomeIconPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v35[7] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)WFAddToHomeIconPreviewCell;
  id v4 = [(WFAddToHomeIconPreviewCell *)&v34 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(WFAddToHomeIconPreviewCell *)v4 setSelectionStyle:0];
    id v6 = objc_msgSend(MEMORY[0x263F825C8], "wf_settingsCellColor");
    [(WFAddToHomeIconPreviewCell *)v5 setBackgroundColor:v6];

    v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeWeak((id *)&v5->_iconImageView, v7);
    id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
    v9 = [MEMORY[0x263F825C8] labelColor];
    [v8 setTextColor:v9];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81828]];
    [v8 setFont:v10];

    [v8 setTextAlignment:1];
    [v8 setAllowsDefaultTighteningForTruncation:1];
    [v8 setText:&stru_26E1A5FC0];
    objc_storeWeak((id *)&v5->_iconLabel, v8);
    [(WFAddToHomeIconPreviewCell *)v5 addSubview:v7];
    [(WFAddToHomeIconPreviewCell *)v5 addSubview:v8];
    v25 = (void *)MEMORY[0x263F08938];
    v33 = [v7 centerXAnchor];
    v32 = [(WFAddToHomeIconPreviewCell *)v5 centerXAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v35[0] = v31;
    v30 = [v7 centerYAnchor];
    v29 = [(WFAddToHomeIconPreviewCell *)v5 centerYAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:-9.0];
    v35[1] = v28;
    v27 = [v7 widthAnchor];
    v26 = [v27 constraintEqualToConstant:60.0];
    v35[2] = v26;
    v24 = [v7 heightAnchor];
    v23 = [v24 constraintEqualToConstant:60.0];
    v35[3] = v23;
    v22 = [v8 topAnchor];
    v21 = [v7 bottomAnchor];
    v20 = [v22 constraintEqualToAnchor:v21 constant:6.0];
    v35[4] = v20;
    v11 = [v8 centerXAnchor];
    v12 = [(WFAddToHomeIconPreviewCell *)v5 centerXAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v35[5] = v13;
    v14 = [v8 widthAnchor];
    v15 = [v7 widthAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:32.0];
    v35[6] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:7];
    [v25 activateConstraints:v17];

    v18 = v5;
  }

  return v5;
}

+ (double)defaultRowHeight
{
  return 118.0;
}

@end