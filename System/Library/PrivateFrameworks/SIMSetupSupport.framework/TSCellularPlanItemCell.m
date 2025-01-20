@interface TSCellularPlanItemCell
- (TSCellularPlanItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)planInfo;
- (UILabel)title;
- (void)setDisable;
- (void)setIcon:(BOOL)a3;
- (void)setPlanInfo:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
@end

@implementation TSCellularPlanItemCell

- (TSCellularPlanItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v79[7] = *MEMORY[0x263EF8340];
  v78.receiver = self;
  v78.super_class = (Class)TSCellularPlanItemCell;
  v4 = [(TSCellularPlanItemCell *)&v78 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    [(TSCellularPlanItemCell *)v4 setTitle:v10];

    v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
    v12 = [(TSCellularPlanItemCell *)v4 title];
    [v12 setFont:v11];

    v13 = [(TSCellularPlanItemCell *)v4 title];
    [v13 setNumberOfLines:0];

    v14 = [(TSCellularPlanItemCell *)v4 title];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
    [(TSCellularPlanItemCell *)v4 setPlanInfo:v15];

    v16 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    v17 = [(TSCellularPlanItemCell *)v4 planInfo];
    [v17 setFont:v16];

    v18 = [(TSCellularPlanItemCell *)v4 planInfo];
    [v18 setNumberOfLines:0];

    v19 = [(TSCellularPlanItemCell *)v4 planInfo];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = [MEMORY[0x263F825C8] systemGrayColor];
    v21 = [(TSCellularPlanItemCell *)v4 planInfo];
    [v21 setTextColor:v20];

    -[TSCellularPlanItemCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 50.0, 0.0, 0.0);
    v22 = [(TSCellularPlanItemCell *)v4 contentView];
    objc_msgSend(v22, "setLayoutMargins:", 0.0, 0.0, 0.0, 40.0);

    v23 = [(TSCellularPlanItemCell *)v4 contentView];
    v24 = [(TSCellularPlanItemCell *)v4 title];
    [v23 addSubview:v24];

    v25 = [(TSCellularPlanItemCell *)v4 contentView];
    v26 = [(TSCellularPlanItemCell *)v4 planInfo];
    [v25 addSubview:v26];

    v60 = (void *)MEMORY[0x263F08938];
    v77 = [(TSCellularPlanItemCell *)v4 title];
    v74 = [v77 topAnchor];
    v76 = [(TSCellularPlanItemCell *)v4 contentView];
    v75 = [v76 layoutMarginsGuide];
    v72 = [v75 topAnchor];
    v73 = [MEMORY[0x263F82770] defaultMetrics];
    [v73 scaledValueForValue:0.0];
    v71 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v72);
    v79[0] = v71;
    v70 = [(TSCellularPlanItemCell *)v4 title];
    v67 = [v70 leadingAnchor];
    v69 = [(TSCellularPlanItemCell *)v4 contentView];
    v68 = [v69 layoutMarginsGuide];
    v65 = [v68 leadingAnchor];
    v66 = [MEMORY[0x263F82770] defaultMetrics];
    [v66 scaledValueForValue:30.0];
    v64 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", v65);
    v79[1] = v64;
    v63 = [(TSCellularPlanItemCell *)v4 title];
    v59 = [v63 trailingAnchor];
    v62 = [(TSCellularPlanItemCell *)v4 contentView];
    v61 = [v62 layoutMarginsGuide];
    v57 = [v61 trailingAnchor];
    v58 = [MEMORY[0x263F82770] defaultMetrics];
    [v58 scaledValueForValue:24.0];
    v56 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", v57);
    v79[2] = v56;
    v55 = [(TSCellularPlanItemCell *)v4 planInfo];
    v53 = [v55 topAnchor];
    v54 = [(TSCellularPlanItemCell *)v4 title];
    v52 = [v54 bottomAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v79[3] = v51;
    v50 = [(TSCellularPlanItemCell *)v4 planInfo];
    v47 = [v50 leadingAnchor];
    v49 = [(TSCellularPlanItemCell *)v4 contentView];
    v48 = [v49 layoutMarginsGuide];
    v45 = [v48 leadingAnchor];
    v46 = [MEMORY[0x263F82770] defaultMetrics];
    [v46 scaledValueForValue:30.0];
    v44 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45);
    v79[4] = v44;
    v43 = [(TSCellularPlanItemCell *)v4 planInfo];
    v40 = [v43 trailingAnchor];
    v42 = [(TSCellularPlanItemCell *)v4 contentView];
    v41 = [v42 layoutMarginsGuide];
    v39 = [v41 trailingAnchor];
    v27 = [MEMORY[0x263F82770] defaultMetrics];
    [v27 scaledValueForValue:24.0];
    v28 = objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39);
    v79[5] = v28;
    v29 = [(TSCellularPlanItemCell *)v4 contentView];
    v30 = [v29 bottomAnchor];
    v31 = [(TSCellularPlanItemCell *)v4 planInfo];
    v32 = [v31 bottomAnchor];
    v33 = [MEMORY[0x263F82770] defaultMetrics];
    [v33 scaledValueForValue:13.0];
    v34 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
    v79[6] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:7];
    [v60 activateConstraints:v35];

    v36 = objc_opt_new();
    v37 = [MEMORY[0x263F825C8] clearColor];
    [v36 setBackgroundColor:v37];

    [(TSCellularPlanItemCell *)v4 setSelectedBackgroundView:v36];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanItemCell;
  [(TSCellularPlanItemCell *)&v5 setSelected:a3 animated:a4];
  [(TSCellularPlanItemCell *)self setNeedsLayout];
}

- (void)setIcon:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(TSCellularPlanItemCell *)self imageView];
  if (v3) {
    double v6 = @"simcard";
  }
  else {
    double v6 = @"esim";
  }
  double v7 = [MEMORY[0x263F827E8] systemImageNamed:v6];
  [v5 setImage:v7];

  id v9 = [(TSCellularPlanItemCell *)self imageView];
  double v8 = [MEMORY[0x263F825C8] labelColor];
  [v9 setTintColor:v8];
}

- (void)setDisable
{
  [(TSCellularPlanItemCell *)self setUserInteractionEnabled:0];
  BOOL v3 = [(TSCellularPlanItemCell *)self title];
  [v3 setEnabled:0];

  v4 = [(TSCellularPlanItemCell *)self planInfo];
  [v4 setEnabled:0];

  id v6 = [(TSCellularPlanItemCell *)self imageView];
  objc_super v5 = [MEMORY[0x263F825C8] systemGrayColor];
  [v6 setTintColor:v5];
}

- (UILabel)title
{
  return (UILabel *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTitle:(id)a3
{
}

- (UILabel)planInfo
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setPlanInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end