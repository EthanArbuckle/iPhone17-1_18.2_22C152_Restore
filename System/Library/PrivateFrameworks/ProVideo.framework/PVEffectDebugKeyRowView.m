@interface PVEffectDebugKeyRowView
- (BOOL)isEnabled;
- (PVEffectDebugKeyRowView)initWithFrame:(CGRect)a3 config:(id)a4;
- (UIImage)icon;
- (UIImage)iconTemplate;
- (UIImageView)iconView;
- (UILabel)labelView;
- (UISwitch)switchView;
- (void)setEnabled:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconTemplate:(id)a3;
- (void)setIconView:(id)a3;
- (void)setLabelView:(id)a3;
- (void)setSwitchView:(id)a3;
@end

@implementation PVEffectDebugKeyRowView

- (PVEffectDebugKeyRowView)initWithFrame:(CGRect)a3 config:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v56[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)PVEffectDebugKeyRowView;
  v10 = -[PVEffectDebugKeyRowView initWithFrame:](&v54, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_enabled = 1;
    id v12 = objc_alloc(MEMORY[0x1E4F42E20]);
    [(PVEffectDebugKeyRowView *)v11 bounds];
    v13 = objc_msgSend(v12, "initWithFrame:");
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setAlignment:3];
    [v13 setAxis:0];
    [v13 setDistribution:0];
    [v13 setSpacing:8.0];
    [(PVEffectDebugKeyRowView *)v11 addSubview:v13];
    v47 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [(PVEffectDebugKeyRowView *)v11 leftAnchor];
    v51 = [v13 leftAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v56[0] = v50;
    v49 = [(PVEffectDebugKeyRowView *)v11 rightAnchor];
    v48 = [v13 rightAnchor];
    v14 = [v49 constraintEqualToAnchor:v48];
    v56[1] = v14;
    v15 = [(PVEffectDebugKeyRowView *)v11 topAnchor];
    [v13 topAnchor];
    v16 = v53 = v9;
    v17 = [v15 constraintEqualToAnchor:v16];
    v56[2] = v17;
    v18 = [(PVEffectDebugKeyRowView *)v11 bottomAnchor];
    v19 = [v13 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v56[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
    [v47 activateConstraints:v21];

    id v9 = v53;
    v22 = [v53 objectForKeyedSubscript:@"icon"];
    [(PVEffectDebugKeyRowView *)v11 setIconView:v22];
    v23 = [v22 image];
    [(PVEffectDebugKeyRowView *)v11 setIcon:v23];

    v24 = [v22 image];
    v25 = [v24 imageWithRenderingMode:2];
    [(PVEffectDebugKeyRowView *)v11 setIconTemplate:v25];

    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 addArrangedSubview:v22];
    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [v22 widthAnchor];
    [v22 frame];
    v29 = [v27 constraintEqualToConstant:v28];
    v55[0] = v29;
    v30 = [v22 heightAnchor];
    [v22 frame];
    v32 = [v30 constraintEqualToConstant:v31];
    v55[1] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    [v26 activateConstraints:v33];

    id v34 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v35 = *MEMORY[0x1E4F1DB28];
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v39 = objc_msgSend(v34, "initWithFrame:", *MEMORY[0x1E4F1DB28], v36, v37, v38);
    [(PVEffectDebugKeyRowView *)v11 setLabelView:v39];
    v40 = [v39 font];
    v41 = [v40 fontWithSize:15.0];
    [v39 setFont:v41];

    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = [v53 objectForKeyedSubscript:@"title"];
    [v39 setText:v42];

    [v39 sizeToFit];
    [v13 addArrangedSubview:v39];
    v43 = [v53 objectForKeyedSubscript:@"action"];
    if (v43)
    {
      v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E78]), "initWithFrame:primaryAction:", v43, v35, v36, v37, v38);
      [(PVEffectDebugKeyRowView *)v11 setSwitchView:v44];
      v45 = [v53 objectForKeyedSubscript:@"on"];
      objc_msgSend(v44, "setOn:", objc_msgSend(v45, "BOOLValue"));

      [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v13 addArrangedSubview:v44];
    }
  }

  return v11;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    if (a3)
    {
      v5 = [(PVEffectDebugKeyRowView *)self icon];
      uint64_t v6 = 1;
    }
    else
    {
      v5 = [(PVEffectDebugKeyRowView *)self iconTemplate];
      uint64_t v6 = 2;
    }
    v7 = [(PVEffectDebugKeyRowView *)self iconView];
    [v7 setImage:v5];

    v8 = [(PVEffectDebugKeyRowView *)self iconView];
    [v8 setTintAdjustmentMode:v6];

    id v9 = [(PVEffectDebugKeyRowView *)self labelView];
    [v9 setEnabled:v3];

    id v10 = [(PVEffectDebugKeyRowView *)self switchView];
    [v10 setEnabled:v3];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UILabel)labelView
{
  return self->_labelView;
}

- (void)setLabelView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void)setSwitchView:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIImage)iconTemplate
{
  return self->_iconTemplate;
}

- (void)setIconTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTemplate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_switchView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end