@interface TSCellularPlanUsesTableViewCell
- (CNGeminiBadge)badge;
- (TSCellularPlanUsesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (void)setBadge:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setLabel:(id)a3 description:(id)a4 badge:(id)a5;
- (void)setTitleLabel:(id)a3;
@end

@implementation TSCellularPlanUsesTableViewCell

- (TSCellularPlanUsesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v59[5] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)TSCellularPlanUsesTableViewCell;
  v4 = [(TSCellularPlanUsesTableViewCell *)&v58 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    [(TSCellularPlanUsesTableViewCell *)v4 setTitleLabel:v10];

    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v12 = [(TSCellularPlanUsesTableViewCell *)v4 titleLabel];
    [v12 setFont:v11];

    v13 = [(TSCellularPlanUsesTableViewCell *)v4 titleLabel];
    [v13 setNumberOfLines:0];

    v14 = [(TSCellularPlanUsesTableViewCell *)v4 titleLabel];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
    [(TSCellularPlanUsesTableViewCell *)v4 setDescriptionLabel:v15];

    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v17 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    [v17 setFont:v16];

    v18 = [MEMORY[0x263F825C8] systemGrayColor];
    v19 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    [v19 setTextColor:v18];

    v20 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    [v20 setNumberOfLines:0];

    v21 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    objc_msgSend(v22, "setLayoutMargins:", 0.0, 25.0, 0.0, 25.0);

    v23 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    v24 = [(TSCellularPlanUsesTableViewCell *)v4 titleLabel];
    [v23 addSubview:v24];

    v25 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    v26 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    [v25 addSubview:v26];

    v46 = (void *)MEMORY[0x263F08938];
    v57 = [(TSCellularPlanUsesTableViewCell *)v4 titleLabel];
    v55 = [v57 topAnchor];
    v56 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    v53 = [v56 topAnchor];
    v54 = [MEMORY[0x263F82770] defaultMetrics];
    [v54 scaledValueForValue:12.0];
    v52 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", v53);
    v59[0] = v52;
    v51 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    v49 = [v51 topAnchor];
    v50 = [(TSCellularPlanUsesTableViewCell *)v4 titleLabel];
    v48 = [v50 bottomAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v59[1] = v47;
    v45 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    v43 = [v45 leadingAnchor];
    v44 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    v42 = [v44 layoutMarginsGuide];
    v41 = [v42 leadingAnchor];
    v40 = [v43 constraintEqualToAnchor:v41];
    v59[2] = v40;
    v39 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    v37 = [v39 trailingAnchor];
    v38 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    v27 = [v38 trailingAnchor];
    v28 = [v37 constraintEqualToAnchor:v27];
    v59[3] = v28;
    v29 = [(TSCellularPlanUsesTableViewCell *)v4 contentView];
    v30 = [v29 bottomAnchor];
    v31 = [(TSCellularPlanUsesTableViewCell *)v4 descriptionLabel];
    v32 = [v31 bottomAnchor];
    v33 = [MEMORY[0x263F82770] defaultMetrics];
    [v33 scaledValueForValue:12.0];
    v34 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
    v59[4] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:5];
    [v46 activateConstraints:v35];
  }
  return v4;
}

- (void)setLabel:(id)a3 description:(id)a4 badge:(id)a5
{
  v53[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(TSCellularPlanUsesTableViewCell *)self titleLabel];
  [v11 setText:v10];

  v12 = [(TSCellularPlanUsesTableViewCell *)self badge];

  if (v12)
  {
    v13 = [(TSCellularPlanUsesTableViewCell *)self badge];
    [v13 removeFromSuperview];
  }
  v49 = v9;
  v14 = [MEMORY[0x263EFEAB0] badgeForText:v9];
  [(TSCellularPlanUsesTableViewCell *)self setBadge:v14];

  uint64_t v52 = *MEMORY[0x263F814A8];
  v15 = [MEMORY[0x263F825C8] systemGrayColor];
  v53[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  v17 = [(TSCellularPlanUsesTableViewCell *)self badge];
  [v17 setViewAttributes:v16];

  v18 = [(TSCellularPlanUsesTableViewCell *)self contentView];
  v19 = [(TSCellularPlanUsesTableViewCell *)self badge];
  [v18 addSubview:v19];

  v48 = v8;
  if (v8)
  {
    v20 = [(TSCellularPlanUsesTableViewCell *)self descriptionLabel];
    [v20 setText:v8];
  }
  else
  {
    v21 = [(TSCellularPlanUsesTableViewCell *)self titleLabel];
    [v21 setTextAlignment:1];

    v20 = [(TSCellularPlanUsesTableViewCell *)self contentView];
    v22 = [(TSCellularPlanUsesTableViewCell *)self titleLabel];
    [v20 addSubview:v22];
  }
  v50 = [(TSCellularPlanUsesTableViewCell *)self contentView];
  v47 = [(TSCellularPlanUsesTableViewCell *)self badge];
  v45 = [v47 leadingAnchor];
  v46 = [(TSCellularPlanUsesTableViewCell *)self contentView];
  v44 = [v46 layoutMarginsGuide];
  v43 = [v44 leadingAnchor];
  v42 = [v45 constraintEqualToAnchor:v43];
  v51[0] = v42;
  v41 = [(TSCellularPlanUsesTableViewCell *)self badge];
  v39 = [v41 trailingAnchor];
  v40 = [(TSCellularPlanUsesTableViewCell *)self titleLabel];
  v37 = [v40 leadingAnchor];
  v38 = [MEMORY[0x263F82770] defaultMetrics];
  [v38 scaledValueForValue:-4.0];
  v36 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37);
  v51[1] = v36;
  v23 = [(TSCellularPlanUsesTableViewCell *)self badge];
  v24 = [v23 centerYAnchor];
  v25 = [(TSCellularPlanUsesTableViewCell *)self titleLabel];
  v26 = [v25 centerYAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  v51[2] = v27;
  v28 = [(TSCellularPlanUsesTableViewCell *)self badge];
  v29 = [v28 widthAnchor];
  v30 = [v29 constraintLessThanOrEqualToConstant:300.0];
  v51[3] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];
  [v50 addConstraints:v31];

  v32 = [(TSCellularPlanUsesTableViewCell *)self badge];
  v33 = [(TSCellularPlanUsesTableViewCell *)self titleLabel];
  [v33 contentHuggingPriorityForAxis:0];
  *(float *)&double v35 = v34 + 1.0;
  [v32 setContentHuggingPriority:0 forAxis:v35];
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setDescriptionLabel:(id)a3
{
}

- (CNGeminiBadge)badge
{
  return (CNGeminiBadge *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setBadge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end