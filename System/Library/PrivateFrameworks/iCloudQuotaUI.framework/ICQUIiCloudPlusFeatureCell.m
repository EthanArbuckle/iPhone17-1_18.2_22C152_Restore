@interface ICQUIiCloudPlusFeatureCell
+ (int64_t)cellStyle;
- (ICQUIiCloudPlusFeatureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupViews;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation ICQUIiCloudPlusFeatureCell

- (ICQUIiCloudPlusFeatureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUIiCloudPlusFeatureCell;
  v4 = [(ICQUIiCloudPlusFeatureCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(ICQUIiCloudPlusFeatureCell *)v4 setSelectionStyle:0];
    [(ICQUIiCloudPlusFeatureCell *)v5 setEnabled:1];
    [(ICQUIiCloudPlusFeatureCell *)v5 _setupViews];
  }
  return v5;
}

- (void)_setupViews
{
  v45[7] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  cellImageView = self->_cellImageView;
  self->_cellImageView = v4;

  [(UIImageView *)self->_cellImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_cellImageView setContentMode:1];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = self->_titleLabel;
  v9 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81838]];
  [(UILabel *)v8 setFont:v9];

  v10 = self->_titleLabel;
  v11 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v10 setColor:v11];

  v12 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  [v12 addSubview:self->_titleLabel];

  v13 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  [v13 addSubview:self->_cellImageView];

  v33 = (void *)MEMORY[0x263F08938];
  v43 = [(UILabel *)self->_titleLabel leadingAnchor];
  v44 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  v42 = [v44 layoutMarginsGuide];
  v41 = [v42 leadingAnchor];
  v40 = [v43 constraintEqualToAnchor:v41 constant:42.0];
  v45[0] = v40;
  v38 = [(UILabel *)self->_titleLabel centerYAnchor];
  v39 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  v37 = [v39 layoutMarginsGuide];
  v36 = [v37 centerYAnchor];
  v35 = [v38 constraintEqualToAnchor:v36];
  v45[1] = v35;
  v32 = [(UILabel *)self->_titleLabel trailingAnchor];
  v34 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  v31 = [v34 layoutMarginsGuide];
  v30 = [v31 trailingAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  v45[2] = v29;
  v28 = [(UIImageView *)self->_cellImageView widthAnchor];
  v27 = [v28 constraintEqualToConstant:24.0];
  v45[3] = v27;
  v26 = [(UIImageView *)self->_cellImageView heightAnchor];
  v25 = [v26 constraintEqualToConstant:24.0];
  v45[4] = v25;
  v23 = [(UIImageView *)self->_cellImageView leadingAnchor];
  v24 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  v14 = [v24 layoutMarginsGuide];
  v15 = [v14 leadingAnchor];
  v16 = [v23 constraintEqualToAnchor:v15];
  v45[5] = v16;
  v17 = [(UIImageView *)self->_cellImageView centerYAnchor];
  v18 = [(ICQUIiCloudPlusFeatureCell *)self contentView];
  v19 = [v18 layoutMarginsGuide];
  v20 = [v19 centerYAnchor];
  v21 = [v17 constraintEqualToAnchor:v20];
  v45[6] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:7];
  [v33 activateConstraints:v22];

  [(ICQUIiCloudPlusFeatureCell *)self setAccessoryType:1];
}

- (void)setIcon:(id)a3
{
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)ICQUIiCloudPlusFeatureCell;
  [(PSTableCell *)&v12 layoutSubviews];
  id v3 = [(ICQUIiCloudPlusFeatureCell *)self imageView];
  [v3 setHidden:1];

  v4 = [MEMORY[0x263F825C8] clearColor];
  [(ICQUIiCloudPlusFeatureCell *)self setSeparatorColor:v4];

  LODWORD(v4) = self->_isLastCell;
  [(ICQUIiCloudPlusFeatureCell *)self layoutMargins];
  double v6 = v5;
  double v8 = v7;
  [(ICQUIiCloudPlusFeatureCell *)self layoutMargins];
  if (v4)
  {
    double v10 = v9;
    [(ICQUIiCloudPlusFeatureCell *)self layoutMargins];
    double v11 = 20.0;
    double v8 = v10;
  }
  else
  {
    double v6 = 0.0;
    double v11 = 0.0;
  }
  -[ICQUIiCloudPlusFeatureCell setLayoutMargins:](self, "setLayoutMargins:", v6, v8, v11);
  [(ICQUIiCloudPlusFeatureCell *)self setNeedsDisplay];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICQUIiCloudPlusFeatureCell;
  id v4 = a3;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  double v5 = [(ICQUIiCloudPlusFeatureCell *)self textLabel];
  [v5 setText:&stru_26DFF2C90];

  double v6 = [v4 propertyForKey:@"LAST_ITEM_KEY"];
  self->_isLastCell = v6 != 0;

  titleLabel = self->_titleLabel;
  double v8 = [v4 propertyForKey:*MEMORY[0x263F602D0]];

  [(UILabel *)titleLabel setText:v8];
  [(ICQUIiCloudPlusFeatureCell *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cellImageView, 0);
}

@end