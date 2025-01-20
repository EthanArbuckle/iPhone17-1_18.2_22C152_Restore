@interface WLCompletedViewCell
- (WLCompletedViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)customCheckmarkAccessoryView;
- (id)customErrorAccessoryView;
- (id)customWarningAccessoryView;
- (void)setItem:(id)a3;
@end

@implementation WLCompletedViewCell

- (WLCompletedViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v69[4] = *MEMORY[0x263EF8340];
  v66.receiver = self;
  v66.super_class = (Class)WLCompletedViewCell;
  v4 = [(WLCompletedViewCell *)&v66 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WLCompletedViewCell *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = v4->_titleLabel;
    v14 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(WLCompletedViewCell *)v4 addSubview:v4->_titleLabel];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v15;

    [(UILabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = v4->_descriptionLabel;
    v18 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v4->_descriptionLabel setNumberOfLines:0];
    [(WLCompletedViewCell *)v4 addSubview:v4->_descriptionLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v7, v8, v9, v10);
    accessoryView = v4->_accessoryView;
    v4->_accessoryView = (UIView *)v19;

    [(UIView *)v4->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WLCompletedViewCell *)v4 addSubview:v4->_accessoryView];
    v48 = (void *)MEMORY[0x263F08938];
    v63 = [(UILabel *)v4->_titleLabel topAnchor];
    v60 = [(WLCompletedViewCell *)v4 topAnchor];
    v57 = [v63 constraintEqualToAnchor:v60 constant:10.0];
    v69[0] = v57;
    v54 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v51 = [(WLCompletedViewCell *)v4 leadingAnchor];
    v45 = [v54 constraintEqualToAnchor:v51 constant:15.0];
    v69[1] = v45;
    v21 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v22 = [(UIView *)v4->_accessoryView leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v69[2] = v23;
    v24 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v25 = [(UILabel *)v4->_descriptionLabel topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:-5.0];
    v69[3] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:4];
    [v48 activateConstraints:v27];

    v49 = (void *)MEMORY[0x263F08938];
    v64 = [(UILabel *)v4->_descriptionLabel topAnchor];
    v61 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v58 = [v64 constraintEqualToAnchor:v61 constant:5.0];
    v68[0] = v58;
    v55 = [(UILabel *)v4->_descriptionLabel leadingAnchor];
    v52 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v46 = [v55 constraintEqualToAnchor:v52];
    v68[1] = v46;
    v28 = [(UILabel *)v4->_descriptionLabel trailingAnchor];
    v29 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v68[2] = v30;
    v31 = [(UILabel *)v4->_descriptionLabel bottomAnchor];
    v32 = [(WLCompletedViewCell *)v4 bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:-10.0];
    v68[3] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];
    [v49 activateConstraints:v34];

    v47 = (void *)MEMORY[0x263F08938];
    v65 = [(UIView *)v4->_accessoryView topAnchor];
    v62 = [(WLCompletedViewCell *)v4 topAnchor];
    v59 = [v65 constraintEqualToAnchor:v62];
    v67[0] = v59;
    v56 = [(UIView *)v4->_accessoryView leadingAnchor];
    v53 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v50 = [v56 constraintEqualToAnchor:v53];
    v67[1] = v50;
    v35 = [(UIView *)v4->_accessoryView trailingAnchor];
    v36 = [(WLCompletedViewCell *)v4 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v67[2] = v37;
    v38 = [(UIView *)v4->_accessoryView bottomAnchor];
    v39 = [(WLCompletedViewCell *)v4 bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v67[3] = v40;
    v41 = [(UIView *)v4->_accessoryView widthAnchor];
    v42 = [v41 constraintEqualToConstant:60.0];
    v67[4] = v42;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:5];
    [v47 activateConstraints:v43];
  }
  return v4;
}

- (void)setItem:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v5 = [(UIView *)self->_accessoryView subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  titleLabel = self->_titleLabel;
  uint64_t v11 = [v4 text];
  [(UILabel *)titleLabel setText:v11];

  [(UILabel *)self->_titleLabel sizeToFit];
  descriptionLabel = self->_descriptionLabel;
  v13 = [v4 secondaryText];
  [(UILabel *)descriptionLabel setText:v13];

  [(UILabel *)self->_descriptionLabel sizeToFit];
  v30 = v4;
  if ([v4 showDetailDiscloureButton])
  {
    if ([v4 failed]) {
      [(WLCompletedViewCell *)self customErrorAccessoryView];
    }
    else {
    uint64_t v14 = [(WLCompletedViewCell *)self customWarningAccessoryView];
    }
  }
  else
  {
    uint64_t v14 = [(WLCompletedViewCell *)self customCheckmarkAccessoryView];
  }
  uint64_t v15 = (void *)v14;
  [(UIView *)self->_accessoryView addSubview:v14];
  v25 = (void *)MEMORY[0x263F08938];
  v29 = [v15 topAnchor];
  v28 = [(UIView *)self->_accessoryView topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v35[0] = v27;
  v26 = [v15 leadingAnchor];
  v16 = [(UIView *)self->_accessoryView leadingAnchor];
  v17 = [v26 constraintEqualToAnchor:v16];
  v35[1] = v17;
  v18 = [v15 trailingAnchor];
  uint64_t v19 = [(UIView *)self->_accessoryView trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v35[2] = v20;
  v21 = [v15 bottomAnchor];
  v22 = [(UIView *)self->_accessoryView bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v35[3] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
  [v25 activateConstraints:v24];
}

- (id)customWarningAccessoryView
{
  v34[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F82828]);
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  v5 = [v3 systemImageNamed:@"exclamationmark.triangle" withConfiguration:v4];
  uint64_t v6 = (void *)[v2 initWithImage:v5];

  uint64_t v7 = [MEMORY[0x263F825C8] systemOrangeColor];
  [v6 setTintColor:v7];

  [v6 setContentMode:4];
  id v8 = objc_alloc(MEMORY[0x263F82828]);
  uint64_t v9 = (void *)MEMORY[0x263F827E8];
  double v10 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  uint64_t v11 = [v9 systemImageNamed:@"chevron.forward" withConfiguration:v10];
  v12 = (void *)[v8 initWithImage:v11];

  v13 = [MEMORY[0x263F825C8] systemGray4Color];
  [v12 setTintColor:v13];

  [v12 setContentMode:4];
  id v14 = objc_alloc(MEMORY[0x263F82BF8]);
  v34[0] = v6;
  v34[1] = v12;
  v29 = v12;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v16 = (void *)[v14 initWithArrangedSubviews:v15];

  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setAxis:0];
  [v16 setAlignment:3];
  objc_msgSend(v16, "setLayoutMargins:", 0.0, 10.0, 0.0, 10.0);
  [v16 setLayoutMarginsRelativeArrangement:1];
  v26 = (void *)MEMORY[0x263F08938];
  long long v32 = [v6 topAnchor];
  long long v31 = [v16 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v33[0] = v30;
  v28 = [v6 leadingAnchor];
  v27 = [v16 leadingAnchor];
  v17 = [v28 constraintEqualToAnchor:v27];
  v33[1] = v17;
  v18 = [v6 trailingAnchor];
  uint64_t v19 = [v12 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:-5.0];
  v33[2] = v20;
  v21 = [v6 bottomAnchor];
  v22 = [v16 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v33[3] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v26 activateConstraints:v24];

  return v16;
}

- (id)customErrorAccessoryView
{
  v34[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F82828]);
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  v5 = [v3 systemImageNamed:@"xmark" withConfiguration:v4];
  uint64_t v6 = (void *)[v2 initWithImage:v5];

  uint64_t v7 = [MEMORY[0x263F825C8] systemRedColor];
  [v6 setTintColor:v7];

  [v6 setContentMode:4];
  id v8 = objc_alloc(MEMORY[0x263F82828]);
  uint64_t v9 = (void *)MEMORY[0x263F827E8];
  double v10 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  uint64_t v11 = [v9 systemImageNamed:@"chevron.forward" withConfiguration:v10];
  v12 = (void *)[v8 initWithImage:v11];

  v13 = [MEMORY[0x263F825C8] systemGray4Color];
  [v12 setTintColor:v13];

  [v12 setContentMode:4];
  id v14 = objc_alloc(MEMORY[0x263F82BF8]);
  v34[0] = v6;
  v34[1] = v12;
  v29 = v12;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v16 = (void *)[v14 initWithArrangedSubviews:v15];

  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setAxis:0];
  [v16 setAlignment:3];
  objc_msgSend(v16, "setLayoutMargins:", 0.0, 10.0, 0.0, 10.0);
  [v16 setLayoutMarginsRelativeArrangement:1];
  v26 = (void *)MEMORY[0x263F08938];
  long long v32 = [v6 topAnchor];
  long long v31 = [v16 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v33[0] = v30;
  v28 = [v6 leadingAnchor];
  v27 = [v16 leadingAnchor];
  v17 = [v28 constraintEqualToAnchor:v27];
  v33[1] = v17;
  v18 = [v6 trailingAnchor];
  uint64_t v19 = [v12 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:-5.0];
  v33[2] = v20;
  v21 = [v6 bottomAnchor];
  v22 = [v16 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v33[3] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v26 activateConstraints:v24];

  return v16;
}

- (id)customCheckmarkAccessoryView
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F82828]);
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  v5 = [v3 systemImageNamed:@"checkmark" withConfiguration:v4];
  uint64_t v6 = (void *)[v2 initWithImage:v5];

  uint64_t v7 = [MEMORY[0x263F825C8] systemBlueColor];
  [v6 setTintColor:v7];

  [v6 setContentMode:4];
  id v8 = objc_alloc(MEMORY[0x263F82BF8]);
  v12[0] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  double v10 = (void *)[v8 initWithArrangedSubviews:v9];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAxis:0];
  [v10 setAlignment:3];
  objc_msgSend(v10, "setLayoutMargins:", 0.0, 10.0, 0.0, 10.0);
  [v10 setLayoutMarginsRelativeArrangement:1];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end