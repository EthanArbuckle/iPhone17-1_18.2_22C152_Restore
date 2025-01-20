@interface TSCellularPlanLabelTableViewCell
- (CNGeminiBadge)badge;
- (TSCellularPlanLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)label;
- (void)setBadge:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabel:(id)a3 badge:(id)a4;
- (void)setLabelWithNoBadge:(id)a3;
@end

@implementation TSCellularPlanLabelTableViewCell

- (TSCellularPlanLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)TSCellularPlanLabelTableViewCell;
  v4 = [(TSCellularPlanLabelTableViewCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(TSCellularPlanLabelTableViewCell *)v4 setLabel:v6];

    v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v8 = [(TSCellularPlanLabelTableViewCell *)v4 label];
    [v8 setFont:v7];

    v9 = [(TSCellularPlanLabelTableViewCell *)v4 label];
    [v9 setNumberOfLines:0];

    v10 = [(TSCellularPlanLabelTableViewCell *)v4 label];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(TSCellularPlanLabelTableViewCell *)v4 contentView];
    v12 = [(TSCellularPlanLabelTableViewCell *)v4 label];
    [v11 addSubview:v12];

    v13 = [(TSCellularPlanLabelTableViewCell *)v4 contentView];
    v23 = [(TSCellularPlanLabelTableViewCell *)v4 label];
    v14 = [v23 centerYAnchor];
    v15 = [(TSCellularPlanLabelTableViewCell *)v4 contentView];
    v16 = [v15 centerYAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v25[0] = v17;
    v18 = [(TSCellularPlanLabelTableViewCell *)v4 contentView];
    v19 = [v18 heightAnchor];
    v20 = [v19 constraintGreaterThanOrEqualToConstant:45.0];
    v25[1] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    [v13 addConstraints:v21];
  }
  return v4;
}

- (void)setLabelWithNoBadge:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TSCellularPlanLabelTableViewCell *)self label];
  [v5 setText:v4];

  v6 = [(TSCellularPlanLabelTableViewCell *)self badge];

  if (v6)
  {
    v7 = [(TSCellularPlanLabelTableViewCell *)self badge];
    [v7 removeFromSuperview];
  }
  v8 = [(TSCellularPlanLabelTableViewCell *)self contentView];
  v9 = [(TSCellularPlanLabelTableViewCell *)self label];
  v10 = [v9 leadingAnchor];
  v11 = [(TSCellularPlanLabelTableViewCell *)self contentView];
  v12 = [v11 layoutMarginsGuide];
  v13 = [v12 leadingAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  v16[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v8 addConstraints:v15];
}

- (void)setLabel:(id)a3 badge:(id)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(TSCellularPlanLabelTableViewCell *)self label];
  [v8 setText:v7];

  v9 = [(TSCellularPlanLabelTableViewCell *)self badge];

  if (v9)
  {
    v10 = [(TSCellularPlanLabelTableViewCell *)self badge];
    [v10 removeFromSuperview];
  }
  v11 = [MEMORY[0x263EFEAB0] badgeForText:v6];
  [(TSCellularPlanLabelTableViewCell *)self setBadge:v11];

  uint64_t v50 = *MEMORY[0x263F814A8];
  v12 = [MEMORY[0x263F825C8] systemGrayColor];
  v51[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
  [(TSCellularPlanLabelTableViewCell *)self badge];
  v14 = v47 = v6;
  [v14 setViewAttributes:v13];

  v15 = [(TSCellularPlanLabelTableViewCell *)self contentView];
  v16 = [(TSCellularPlanLabelTableViewCell *)self badge];
  [v15 addSubview:v16];

  v48 = [(TSCellularPlanLabelTableViewCell *)self contentView];
  v46 = [(TSCellularPlanLabelTableViewCell *)self badge];
  v44 = [v46 leadingAnchor];
  v45 = [(TSCellularPlanLabelTableViewCell *)self contentView];
  v43 = [v45 layoutMarginsGuide];
  v42 = [v43 leadingAnchor];
  v41 = [v44 constraintEqualToAnchor:v42];
  v49[0] = v41;
  v40 = [(TSCellularPlanLabelTableViewCell *)self badge];
  v38 = [v40 trailingAnchor];
  v39 = [(TSCellularPlanLabelTableViewCell *)self label];
  v36 = [v39 leadingAnchor];
  v37 = [MEMORY[0x263F82770] defaultMetrics];
  [v37 scaledValueForValue:-4.0];
  v35 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36);
  v49[1] = v35;
  v34 = [(TSCellularPlanLabelTableViewCell *)self badge];
  v32 = [v34 bottomAnchor];
  v33 = [(TSCellularPlanLabelTableViewCell *)self label];
  v31 = [v33 firstBaselineAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v49[2] = v30;
  v17 = [(TSCellularPlanLabelTableViewCell *)self badge];
  v18 = [v17 widthAnchor];
  v19 = [v18 constraintLessThanOrEqualToConstant:300.0];
  v49[3] = v19;
  v20 = [(TSCellularPlanLabelTableViewCell *)self badge];
  v21 = [v20 centerYAnchor];
  v22 = [(TSCellularPlanLabelTableViewCell *)self contentView];
  v23 = [v22 centerYAnchor];
  objc_super v24 = [v21 constraintEqualToAnchor:v23];
  v49[4] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:5];
  [v48 addConstraints:v25];

  v26 = [(TSCellularPlanLabelTableViewCell *)self badge];
  v27 = [(TSCellularPlanLabelTableViewCell *)self label];
  [v27 contentHuggingPriorityForAxis:0];
  *(float *)&double v29 = v28 + 1.0;
  [v26 setContentHuggingPriority:0 forAxis:v29];
}

- (CNGeminiBadge)badge
{
  return (CNGeminiBadge *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setBadge:(id)a3
{
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end