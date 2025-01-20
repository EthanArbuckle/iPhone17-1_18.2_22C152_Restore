@interface TSCellularPlanRemapTableViewCell
- (TSCellularPlanRemapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)titleLabel;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitleLabel:(id)a3;
@end

@implementation TSCellularPlanRemapTableViewCell

- (TSCellularPlanRemapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v43[4] = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)TSCellularPlanRemapTableViewCell;
  v4 = [(TSCellularPlanRemapTableViewCell *)&v42 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(TSCellularPlanRemapTableViewCell *)v4 setTitleLabel:v6];

    v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v8 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    [v8 setFont:v7];

    v9 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    [v9 setNumberOfLines:0];

    v10 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(TSCellularPlanRemapTableViewCell *)v4 contentView];
    objc_msgSend(v11, "setLayoutMargins:", 0.0, 25.0, 0.0, 25.0);

    v12 = [(TSCellularPlanRemapTableViewCell *)v4 contentView];
    v13 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    [v12 addSubview:v13];

    v32 = (void *)MEMORY[0x263F08938];
    v41 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    v39 = [v41 topAnchor];
    v40 = [(TSCellularPlanRemapTableViewCell *)v4 contentView];
    v37 = [v40 topAnchor];
    v38 = [MEMORY[0x263F82770] defaultMetrics];
    [v38 scaledValueForValue:20.0];
    v36 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37);
    v43[0] = v36;
    v35 = [(TSCellularPlanRemapTableViewCell *)v4 contentView];
    v33 = [v35 bottomAnchor];
    v34 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    v30 = [v34 bottomAnchor];
    v31 = [MEMORY[0x263F82770] defaultMetrics];
    [v31 scaledValueForValue:20.0];
    v29 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v30);
    v43[1] = v29;
    v28 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    v26 = [v28 leadingAnchor];
    v27 = [(TSCellularPlanRemapTableViewCell *)v4 contentView];
    v25 = [v27 layoutMarginsGuide];
    v24 = [v25 leadingAnchor];
    v14 = [v26 constraintEqualToAnchor:v24];
    v43[2] = v14;
    v15 = [(TSCellularPlanRemapTableViewCell *)v4 titleLabel];
    v16 = [v15 trailingAnchor];
    v17 = [(TSCellularPlanRemapTableViewCell *)v4 contentView];
    v18 = [v17 layoutMarginsGuide];
    v19 = [v18 trailingAnchor];
    v20 = [MEMORY[0x263F82770] defaultMetrics];
    [v20 scaledValueForValue:-30.0];
    v21 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v19);
    v43[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
    [v32 activateConstraints:v22];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanRemapTableViewCell;
  [(TSCellularPlanRemapTableViewCell *)&v5 setSelected:a3 animated:a4];
  [(TSCellularPlanRemapTableViewCell *)self setNeedsLayout];
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end