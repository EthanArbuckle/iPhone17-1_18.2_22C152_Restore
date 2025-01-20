@interface NDOCoverageItemCell
+ (int64_t)cellStyle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NDOCoverageItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)itemImageView;
- (UILabel)itemOfferLabel;
- (UILabel)itemSubtitleLabel;
- (UILabel)itemTitleLabel;
- (UIView)itemTitleView;
- (void)_setupWarrantyCoverageCell;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setItemImageView:(id)a3;
- (void)setItemOfferLabel:(id)a3;
- (void)setItemSubtitleLabel:(id)a3;
- (void)setItemTitleLabel:(id)a3;
- (void)setItemTitleView:(id)a3;
- (void)updateConstraints;
- (void)updateDeviceImage;
@end

@implementation NDOCoverageItemCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NDOCoverageItemCell;
  [(PSTableCell *)&v19 refreshCellContentsWithSpecifier:a3];
  [(NDOCoverageItemCell *)self updateDeviceImage];
  v4 = [(PSTableCell *)self specifier];
  v5 = [v4 name];
  [(UILabel *)self->_itemTitleLabel setText:v5];

  v6 = [(PSTableCell *)self specifier];
  v7 = [v6 objectForKeyedSubscript:@"NDOCoverageItemCellCoverageLabelKey"];
  [(UILabel *)self->_itemSubtitleLabel setText:v7];

  v8 = [(PSTableCell *)self specifier];
  v9 = [v8 objectForKeyedSubscript:@"NDOCoverageItemCellOfferLabelKey"];

  if (v9)
  {
    self->_hasOffer = 1;
    v10 = [(PSTableCell *)self specifier];
    v11 = [v10 objectForKeyedSubscript:@"NDOCoverageItemCellOfferLabelKey"];
    [(UILabel *)self->_itemOfferLabel setText:v11];

    v12 = NSString;
    v13 = [(PSTableCell *)self specifier];
    v14 = [v13 name];
    v15 = [(UILabel *)self->_itemSubtitleLabel text];
    v16 = [(UILabel *)self->_itemOfferLabel text];
    v17 = [v12 stringWithFormat:@"%@\n%@\n%@", v14, v15, v16];
    [(NDOCoverageItemCell *)self setAccessibilityLabel:v17];
  }
  else
  {
    v18 = NSString;
    v13 = [(PSTableCell *)self specifier];
    v14 = [v13 name];
    v15 = [(UILabel *)self->_itemSubtitleLabel text];
    v16 = [v18 stringWithFormat:@"%@\n%@", v14, v15];
    [(NDOCoverageItemCell *)self setAccessibilityLabel:v16];
  }

  [(NDOCoverageItemCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NDOCoverageItemCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(NDOCoverageItemCell *)self setNeedsUpdateConstraints];
  [(PSTableCell *)self setCellEnabled:1];
}

- (NDOCoverageItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NDOCoverageItemCell;
  v5 = [(PSTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5) {
    [(NDOCoverageItemCell *)v5 _setupWarrantyCoverageCell];
  }
  return v6;
}

- (void)_setupWarrantyCoverageCell
{
  objc_super v3 = [(PSTableCell *)self titleLabel];
  [v3 setHidden:1];

  v4 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
  itemImageView = self->_itemImageView;
  self->_itemImageView = v4;

  [(UIImageView *)self->_itemImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(NDOCoverageItemCell *)self contentView];
  [v6 addSubview:self->_itemImageView];

  id v7 = objc_alloc(MEMORY[0x263F828E0]);
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], v9, v10, v11);
  itemTitleLabel = self->_itemTitleLabel;
  self->_itemTitleLabel = v12;

  [(UILabel *)self->_itemTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemTitleLabel setBackgroundColor:0];
  [(UILabel *)self->_itemTitleLabel setOpaque:0];
  [(UILabel *)self->_itemTitleLabel setNumberOfLines:0];
  v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_itemTitleLabel setFont:v14];

  v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
  itemSubtitleLabel = self->_itemSubtitleLabel;
  self->_itemSubtitleLabel = v15;

  [(UILabel *)self->_itemSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemSubtitleLabel setBackgroundColor:0];
  [(UILabel *)self->_itemSubtitleLabel setOpaque:0];
  [(UILabel *)self->_itemSubtitleLabel setNumberOfLines:2];
  uint64_t v17 = *MEMORY[0x263F835B8];
  v18 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)self->_itemSubtitleLabel setFont:v18];

  objc_super v19 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UILabel *)self->_itemSubtitleLabel setTextColor:v19];

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
  itemOfferLabel = self->_itemOfferLabel;
  self->_itemOfferLabel = v20;

  [(UILabel *)self->_itemOfferLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemOfferLabel setBackgroundColor:0];
  [(UILabel *)self->_itemOfferLabel setOpaque:0];
  [(UILabel *)self->_itemOfferLabel setNumberOfLines:2];
  v22 = [MEMORY[0x263F81708] preferredFontForTextStyle:v17];
  [(UILabel *)self->_itemOfferLabel setFont:v22];

  v23 = [MEMORY[0x263F825C8] systemOrangeColor];
  [(UILabel *)self->_itemOfferLabel setTextColor:v23];

  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
  itemTitleView = self->_itemTitleView;
  self->_itemTitleView = v24;

  [(UIView *)self->_itemTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_itemTitleView addSubview:self->_itemTitleLabel];
  [(UIView *)self->_itemTitleView addSubview:self->_itemSubtitleLabel];
  [(UIView *)self->_itemTitleView addSubview:self->_itemOfferLabel];
  v26 = [(NDOCoverageItemCell *)self contentView];
  [v26 addSubview:self->_itemTitleView];

  [(NDOCoverageItemCell *)self layoutSubviews];
}

- (void)updateConstraints
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  imageConstraints = self->_imageConstraints;
  self->_imageConstraints = v3;

  v5 = self->_imageConstraints;
  v6 = (void *)MEMORY[0x263F08938];
  id v7 = [(NDOCoverageItemCell *)self itemImageView];
  double v8 = [(NDOCoverageItemCell *)self contentView];
  double v9 = [v6 constraintWithItem:v7 attribute:5 relatedBy:0 toItem:v8 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v5 addObject:v9];

  double v10 = self->_imageConstraints;
  double v11 = (void *)MEMORY[0x263F08938];
  v12 = [(NDOCoverageItemCell *)self itemImageView];
  v13 = [(NDOCoverageItemCell *)self contentView];
  v14 = [v11 constraintWithItem:v12 attribute:3 relatedBy:1 toItem:v13 attribute:3 multiplier:1.0 constant:8.0];
  [(NSMutableArray *)v10 addObject:v14];

  v15 = self->_imageConstraints;
  v16 = (void *)MEMORY[0x263F08938];
  uint64_t v17 = [(NDOCoverageItemCell *)self itemImageView];
  v18 = [(NDOCoverageItemCell *)self contentView];
  objc_super v19 = [v16 constraintWithItem:v17 attribute:10 relatedBy:0 toItem:v18 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v15 addObject:v19];

  v20 = self->_imageConstraints;
  v21 = (void *)MEMORY[0x263F08938];
  v22 = [(NDOCoverageItemCell *)self itemImageView];
  v23 = [v21 constraintWithItem:v22 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
  [(NSMutableArray *)v20 addObject:v23];

  v24 = self->_imageConstraints;
  v25 = (void *)MEMORY[0x263F08938];
  v26 = [(NDOCoverageItemCell *)self itemImageView];
  v27 = [v25 constraintWithItem:v26 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
  [(NSMutableArray *)v24 addObject:v27];

  v28 = [(NDOCoverageItemCell *)self itemImageView];
  LODWORD(v29) = 1148846080;
  [v28 setContentCompressionResistancePriority:0 forAxis:v29];

  v30 = [(NDOCoverageItemCell *)self itemImageView];
  LODWORD(v31) = 1148846080;
  [v30 setContentCompressionResistancePriority:1 forAxis:v31];

  v32 = (void *)MEMORY[0x263F08938];
  v33 = [(NDOCoverageItemCell *)self contentView];
  v34 = [(NDOCoverageItemCell *)self itemImageView];
  v35 = [v32 constraintWithItem:v33 attribute:8 relatedBy:1 toItem:v34 attribute:8 multiplier:1.0 constant:16.0];

  LODWORD(v36) = 1148829696;
  [v35 setPriority:v36];
  [(NSMutableArray *)self->_imageConstraints addObject:v35];
  [MEMORY[0x263F08938] activateConstraints:self->_imageConstraints];
  v37 = [(NDOCoverageItemCell *)self itemTitleView];
  v38 = (void *)MEMORY[0x263F08938];
  v39 = [(NDOCoverageItemCell *)self itemTitleLabel];
  v40 = [(NDOCoverageItemCell *)self itemTitleView];
  v41 = [v38 constraintWithItem:v39 attribute:3 relatedBy:0 toItem:v40 attribute:3 multiplier:1.0 constant:0.0];
  [v37 addConstraint:v41];

  v42 = [(NDOCoverageItemCell *)self itemTitleView];
  v43 = (void *)MEMORY[0x263F08938];
  v44 = [(NDOCoverageItemCell *)self itemTitleLabel];
  v45 = [(NDOCoverageItemCell *)self itemTitleView];
  v46 = [v43 constraintWithItem:v44 attribute:5 relatedBy:0 toItem:v45 attribute:5 multiplier:1.0 constant:0.0];
  [v42 addConstraint:v46];

  v47 = [(NDOCoverageItemCell *)self itemTitleView];
  v48 = (void *)MEMORY[0x263F08938];
  v49 = [(NDOCoverageItemCell *)self itemTitleView];
  v50 = [(NDOCoverageItemCell *)self itemTitleLabel];
  v51 = [v48 constraintWithItem:v49 attribute:6 relatedBy:1 toItem:v50 attribute:6 multiplier:1.0 constant:0.0];
  [v47 addConstraint:v51];

  v52 = [(NDOCoverageItemCell *)self itemTitleView];
  v53 = (void *)MEMORY[0x263F08938];
  v54 = [(NDOCoverageItemCell *)self itemSubtitleLabel];
  v55 = [(NDOCoverageItemCell *)self itemTitleLabel];
  v56 = [v53 constraintWithItem:v54 attribute:3 relatedBy:0 toItem:v55 attribute:4 multiplier:1.0 constant:0.0];
  [v52 addConstraint:v56];

  v57 = [(NDOCoverageItemCell *)self itemTitleView];
  v58 = (void *)MEMORY[0x263F08938];
  v59 = [(NDOCoverageItemCell *)self itemSubtitleLabel];
  v60 = [(NDOCoverageItemCell *)self itemTitleView];
  v61 = [v58 constraintWithItem:v59 attribute:5 relatedBy:0 toItem:v60 attribute:5 multiplier:1.0 constant:0.0];
  [v57 addConstraint:v61];

  v62 = [(NDOCoverageItemCell *)self itemTitleView];
  v63 = (void *)MEMORY[0x263F08938];
  v64 = [(NDOCoverageItemCell *)self itemTitleView];
  v65 = [(NDOCoverageItemCell *)self itemSubtitleLabel];
  v66 = [v63 constraintWithItem:v64 attribute:6 relatedBy:1 toItem:v65 attribute:6 multiplier:1.0 constant:0.0];
  [v62 addConstraint:v66];

  LODWORD(v66) = self->_hasOffer;
  v67 = [(NDOCoverageItemCell *)self itemTitleView];
  v68 = (void *)MEMORY[0x263F08938];
  if (v66)
  {
    v69 = [(NDOCoverageItemCell *)self itemOfferLabel];
    v70 = [(NDOCoverageItemCell *)self itemSubtitleLabel];
    v71 = [v68 constraintWithItem:v69 attribute:3 relatedBy:0 toItem:v70 attribute:4 multiplier:1.0 constant:0.0];
    [v67 addConstraint:v71];

    v72 = [(NDOCoverageItemCell *)self itemTitleView];
    v73 = (void *)MEMORY[0x263F08938];
    v74 = [(NDOCoverageItemCell *)self itemOfferLabel];
    v75 = [(NDOCoverageItemCell *)self itemTitleView];
    v76 = [v73 constraintWithItem:v74 attribute:5 relatedBy:0 toItem:v75 attribute:5 multiplier:1.0 constant:0.0];
    [v72 addConstraint:v76];

    v77 = [(NDOCoverageItemCell *)self itemTitleView];
    v78 = (void *)MEMORY[0x263F08938];
    v79 = [(NDOCoverageItemCell *)self itemTitleView];
    v80 = [(NDOCoverageItemCell *)self itemOfferLabel];
    v81 = [v78 constraintWithItem:v79 attribute:6 relatedBy:1 toItem:v80 attribute:6 multiplier:1.0 constant:0.0];
    [v77 addConstraint:v81];

    v67 = [(NDOCoverageItemCell *)self itemTitleView];
    v68 = (void *)MEMORY[0x263F08938];
    v82 = [(NDOCoverageItemCell *)self itemTitleView];
    [(NDOCoverageItemCell *)self itemOfferLabel];
  }
  else
  {
    v82 = [(NDOCoverageItemCell *)self itemTitleView];
    [(NDOCoverageItemCell *)self itemSubtitleLabel];
  v83 = };
  v84 = [v68 constraintWithItem:v82 attribute:4 relatedBy:0 toItem:v83 attribute:4 multiplier:1.0 constant:0.0];
  [v67 addConstraint:v84];

  v85 = [(NDOCoverageItemCell *)self contentView];
  v86 = (void *)MEMORY[0x263F08938];
  v87 = [(NDOCoverageItemCell *)self itemTitleView];
  v88 = [(NDOCoverageItemCell *)self itemImageView];
  v89 = [v86 constraintWithItem:v87 attribute:10 relatedBy:0 toItem:v88 attribute:10 multiplier:1.0 constant:0.0];
  [v85 addConstraint:v89];

  v90 = [(NDOCoverageItemCell *)self contentView];
  v91 = (void *)MEMORY[0x263F08938];
  v92 = [(NDOCoverageItemCell *)self itemTitleView];
  v93 = [(NDOCoverageItemCell *)self itemImageView];
  v94 = [v91 constraintWithItem:v92 attribute:5 relatedBy:0 toItem:v93 attribute:6 multiplier:1.0 constant:12.0];
  [v90 addConstraint:v94];

  v95 = [(NDOCoverageItemCell *)self contentView];
  v96 = (void *)MEMORY[0x263F08938];
  v97 = [(NDOCoverageItemCell *)self itemTitleView];
  v98 = [(NDOCoverageItemCell *)self contentView];
  v99 = [v96 constraintWithItem:v97 attribute:6 relatedBy:0 toItem:v98 attribute:6 multiplier:1.0 constant:-12.0];
  [v95 addConstraint:v99];

  v100 = [(NDOCoverageItemCell *)self contentView];
  v101 = (void *)MEMORY[0x263F08938];
  v102 = [(NDOCoverageItemCell *)self itemTitleView];
  v103 = [(NDOCoverageItemCell *)self contentView];
  v104 = [v101 constraintWithItem:v102 attribute:3 relatedBy:1 toItem:v103 attribute:3 multiplier:1.0 constant:8.0];
  [v100 addConstraint:v104];

  v105.receiver = self;
  v105.super_class = (Class)NDOCoverageItemCell;
  [(NDOCoverageItemCell *)&v105 updateConstraints];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NDOCoverageItemCell;
  -[NDOCoverageItemCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 60.0) {
    double v4 = 60.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateDeviceImage
{
  double v3 = [(PSTableCell *)self specifier];
  double v4 = [v3 objectForKeyedSubscript:@"NDOCoverageItemCellImageURLKey"];

  if (v4)
  {
    objc_initWeak(&location, self);
    objc_super v5 = +[NDOImageManager sharedManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__NDOCoverageItemCell_updateDeviceImage__block_invoke;
    v9[3] = &unk_264D49D00;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    id v6 = (id)[v5 fetchImageWithURLString:v10 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = [(PSTableCell *)self specifier];
    double v8 = [v7 objectForKeyedSubscript:@"NDOCoverageItemCellFallbackImageKey"];
    [(UIImageView *)self->_itemImageView setImage:v8];
  }
}

void __40__NDOCoverageItemCell_updateDeviceImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v8 = WeakRetained;
  if (!v5 || v6)
  {
    id v10 = _NDOLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __40__NDOCoverageItemCell_updateDeviceImage__block_invoke_cold_1((uint64_t)v6, a1, v10);
    }

    double v9 = [v8 specifier];
    id v11 = [v9 objectForKeyedSubscript:@"NDOCoverageItemCellFallbackImageKey"];
    v12 = [v8 itemImageView];
    [v12 setImage:v11];
  }
  else
  {
    double v9 = [WeakRetained itemImageView];
    [v9 setImage:v5];
  }
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

- (UILabel)itemOfferLabel
{
  return self->_itemOfferLabel;
}

- (void)setItemOfferLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemOfferLabel, 0);
  objc_storeStrong((id *)&self->_itemSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_imageConstraints, 0);
}

void __40__NDOCoverageItemCell_updateDeviceImage__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_238845000, log, OS_LOG_TYPE_ERROR, "Image fetch failed with error: %@ for: %@", (uint8_t *)&v4, 0x16u);
}

@end