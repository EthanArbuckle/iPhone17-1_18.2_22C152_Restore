@interface NDOAppItemViewCell
+ (int64_t)cellStyle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NDOAppItemViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)itemImageView;
- (UILabel)itemSubtitleLabel;
- (UILabel)itemTitleLabel;
- (UIView)itemTitleView;
- (void)_setupWarrantyCoverageCell;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setItemImageView:(id)a3;
- (void)setItemSubtitleLabel:(id)a3;
- (void)setItemTitleLabel:(id)a3;
- (void)setItemTitleView:(id)a3;
- (void)updateConstraints;
@end

@implementation NDOAppItemViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NDOAppItemViewCell;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:*MEMORY[0x263F60138]];
  int v6 = [v5 isEqualToString:@"COVERAGE_ITEM"];

  if (v6)
  {
    v7 = [v4 propertyForKey:@"NDOWarranty"];
    v8 = (void *)MEMORY[0x263F827E8];
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v8 imageNamed:@"applecare-badge" inBundle:v9 withConfiguration:0];

    [(UIImageView *)self->_itemImageView setImage:v10];
    v11 = [v7 coverageLocalizedDesc];
    [(UILabel *)self->_itemTitleLabel setText:v11];

    v12 = [v4 propertyForKey:@"NDOCoverageItemSubtitle"];
    [(UILabel *)self->_itemSubtitleLabel setText:v12];
  }
  [(NDOAppItemViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NDOAppItemViewCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(NDOAppItemViewCell *)self setNeedsUpdateConstraints];
  [(PSTableCell *)self setCellEnabled:1];
}

- (NDOAppItemViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NDOAppItemViewCell;
  v9 = [(PSTableCell *)&v13 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:*MEMORY[0x263F60138]];
    int v11 = [v10 isEqualToString:@"COVERAGE_ITEM"];

    if (v11) {
      [(NDOAppItemViewCell *)v9 _setupWarrantyCoverageCell];
    }
  }

  return v9;
}

- (void)_setupWarrantyCoverageCell
{
  objc_super v3 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
  itemImageView = self->_itemImageView;
  self->_itemImageView = v3;

  [(UIImageView *)self->_itemImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(NDOAppItemViewCell *)self contentView];
  [v5 addSubview:self->_itemImageView];

  id v6 = objc_alloc(MEMORY[0x263F828E0]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  int v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  itemTitleLabel = self->_itemTitleLabel;
  self->_itemTitleLabel = v11;

  [(UILabel *)self->_itemTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemTitleLabel setBackgroundColor:0];
  [(UILabel *)self->_itemTitleLabel setOpaque:0];
  [(UILabel *)self->_itemTitleLabel setNumberOfLines:0];
  objc_super v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_itemTitleLabel setFont:v13];

  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
  itemSubtitleLabel = self->_itemSubtitleLabel;
  self->_itemSubtitleLabel = v14;

  [(UILabel *)self->_itemSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemSubtitleLabel setBackgroundColor:0];
  [(UILabel *)self->_itemSubtitleLabel setOpaque:0];
  [(UILabel *)self->_itemSubtitleLabel setNumberOfLines:2];
  v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)self->_itemSubtitleLabel setFont:v16];

  v17 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UILabel *)self->_itemSubtitleLabel setTextColor:v17];

  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v7, v8, v9, v10);
  itemTitleView = self->_itemTitleView;
  self->_itemTitleView = v18;

  [(UIView *)self->_itemTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_itemTitleView addSubview:self->_itemTitleLabel];
  [(UIView *)self->_itemTitleView addSubview:self->_itemSubtitleLabel];
  v20 = [(NDOAppItemViewCell *)self contentView];
  [v20 addSubview:self->_itemTitleView];

  [(NDOAppItemViewCell *)self layoutSubviews];
}

- (void)updateConstraints
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  imageConstraints = self->_imageConstraints;
  self->_imageConstraints = v3;

  v5 = self->_imageConstraints;
  id v6 = (void *)MEMORY[0x263F08938];
  double v7 = [(NDOAppItemViewCell *)self itemImageView];
  double v8 = [(NDOAppItemViewCell *)self contentView];
  double v9 = [v6 constraintWithItem:v7 attribute:5 relatedBy:0 toItem:v8 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v5 addObject:v9];

  double v10 = self->_imageConstraints;
  int v11 = (void *)MEMORY[0x263F08938];
  v12 = [(NDOAppItemViewCell *)self itemImageView];
  objc_super v13 = [(NDOAppItemViewCell *)self contentView];
  v14 = [v11 constraintWithItem:v12 attribute:10 relatedBy:0 toItem:v13 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v10 addObject:v14];

  v15 = [(NDOAppItemViewCell *)self itemImageView];
  LODWORD(v16) = 1148846080;
  [v15 setContentCompressionResistancePriority:0 forAxis:v16];

  v17 = [(NDOAppItemViewCell *)self itemImageView];
  LODWORD(v18) = 1148846080;
  [v17 setContentCompressionResistancePriority:1 forAxis:v18];

  v19 = (void *)MEMORY[0x263F08938];
  v20 = [(NDOAppItemViewCell *)self contentView];
  v21 = [(NDOAppItemViewCell *)self itemImageView];
  v22 = [v19 constraintWithItem:v20 attribute:8 relatedBy:1 toItem:v21 attribute:8 multiplier:1.0 constant:16.0];

  LODWORD(v23) = 1148829696;
  [v22 setPriority:v23];
  [(NSMutableArray *)self->_imageConstraints addObject:v22];
  [MEMORY[0x263F08938] activateConstraints:self->_imageConstraints];
  v24 = [(NDOAppItemViewCell *)self itemTitleView];
  v25 = (void *)MEMORY[0x263F08938];
  v26 = [(NDOAppItemViewCell *)self itemTitleLabel];
  v27 = [(NDOAppItemViewCell *)self itemTitleView];
  v28 = [v25 constraintWithItem:v26 attribute:3 relatedBy:0 toItem:v27 attribute:3 multiplier:1.0 constant:0.0];
  [v24 addConstraint:v28];

  v29 = [(NDOAppItemViewCell *)self itemTitleView];
  v30 = (void *)MEMORY[0x263F08938];
  v31 = [(NDOAppItemViewCell *)self itemTitleLabel];
  v32 = [(NDOAppItemViewCell *)self itemTitleView];
  v33 = [v30 constraintWithItem:v31 attribute:5 relatedBy:0 toItem:v32 attribute:5 multiplier:1.0 constant:0.0];
  [v29 addConstraint:v33];

  v34 = [(NDOAppItemViewCell *)self itemTitleView];
  v35 = (void *)MEMORY[0x263F08938];
  v36 = [(NDOAppItemViewCell *)self itemTitleView];
  v37 = [(NDOAppItemViewCell *)self itemTitleLabel];
  v38 = [v35 constraintWithItem:v36 attribute:6 relatedBy:1 toItem:v37 attribute:6 multiplier:1.0 constant:0.0];
  [v34 addConstraint:v38];

  v39 = [(NDOAppItemViewCell *)self itemTitleView];
  v40 = (void *)MEMORY[0x263F08938];
  v41 = [(NDOAppItemViewCell *)self itemSubtitleLabel];
  v42 = [(NDOAppItemViewCell *)self itemTitleLabel];
  v43 = [v40 constraintWithItem:v41 attribute:3 relatedBy:0 toItem:v42 attribute:4 multiplier:1.0 constant:0.0];
  [v39 addConstraint:v43];

  v44 = [(NDOAppItemViewCell *)self itemTitleView];
  v45 = (void *)MEMORY[0x263F08938];
  v46 = [(NDOAppItemViewCell *)self itemSubtitleLabel];
  v47 = [(NDOAppItemViewCell *)self itemTitleView];
  v48 = [v45 constraintWithItem:v46 attribute:5 relatedBy:0 toItem:v47 attribute:5 multiplier:1.0 constant:0.0];
  [v44 addConstraint:v48];

  v49 = [(NDOAppItemViewCell *)self itemTitleView];
  v50 = (void *)MEMORY[0x263F08938];
  v51 = [(NDOAppItemViewCell *)self itemTitleView];
  v52 = [(NDOAppItemViewCell *)self itemSubtitleLabel];
  v53 = [v50 constraintWithItem:v51 attribute:6 relatedBy:1 toItem:v52 attribute:6 multiplier:1.0 constant:0.0];
  [v49 addConstraint:v53];

  v54 = [(NDOAppItemViewCell *)self itemTitleView];
  v55 = (void *)MEMORY[0x263F08938];
  v56 = [(NDOAppItemViewCell *)self itemTitleView];
  v57 = [(NDOAppItemViewCell *)self itemSubtitleLabel];
  v58 = [v55 constraintWithItem:v56 attribute:4 relatedBy:0 toItem:v57 attribute:4 multiplier:1.0 constant:0.0];
  [v54 addConstraint:v58];

  v59 = [(NDOAppItemViewCell *)self contentView];
  v60 = (void *)MEMORY[0x263F08938];
  v61 = [(NDOAppItemViewCell *)self itemTitleView];
  v62 = [(NDOAppItemViewCell *)self itemImageView];
  v63 = [v60 constraintWithItem:v61 attribute:10 relatedBy:0 toItem:v62 attribute:10 multiplier:1.0 constant:0.0];
  [v59 addConstraint:v63];

  v64 = [(NDOAppItemViewCell *)self contentView];
  v65 = (void *)MEMORY[0x263F08938];
  v66 = [(NDOAppItemViewCell *)self itemTitleView];
  v67 = [(NDOAppItemViewCell *)self itemImageView];
  v68 = [v65 constraintWithItem:v66 attribute:5 relatedBy:0 toItem:v67 attribute:6 multiplier:1.0 constant:12.0];
  [v64 addConstraint:v68];

  v69 = [(NDOAppItemViewCell *)self contentView];
  v70 = (void *)MEMORY[0x263F08938];
  v71 = [(NDOAppItemViewCell *)self itemTitleView];
  v72 = [(NDOAppItemViewCell *)self contentView];
  v73 = [v70 constraintWithItem:v71 attribute:6 relatedBy:0 toItem:v72 attribute:6 multiplier:1.0 constant:-12.0];
  [v69 addConstraint:v73];

  v74 = [(NDOAppItemViewCell *)self contentView];
  v75 = (void *)MEMORY[0x263F08938];
  v76 = [(NDOAppItemViewCell *)self contentView];
  v77 = [(NDOAppItemViewCell *)self itemTitleView];
  v78 = [v75 constraintWithItem:v76 attribute:8 relatedBy:1 toItem:v77 attribute:8 multiplier:1.0 constant:0.0];
  [v74 addConstraint:v78];

  v79.receiver = self;
  v79.super_class = (Class)NDOAppItemViewCell;
  [(NDOAppItemViewCell *)&v79 updateConstraints];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NDOAppItemViewCell;
  -[NDOAppItemViewCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 81.0) {
    double v4 = 81.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIImageView)itemImageView
{
  return self->_itemImageView;
}

- (void)setItemImageView:(id)a3
{
}

- (UIView)itemTitleView
{
  return self->_itemTitleView;
}

- (void)setItemTitleView:(id)a3
{
}

- (UILabel)itemTitleLabel
{
  return self->_itemTitleLabel;
}

- (void)setItemTitleLabel:(id)a3
{
}

- (UILabel)itemSubtitleLabel
{
  return self->_itemSubtitleLabel;
}

- (void)setItemSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_imageConstraints, 0);
}

@end