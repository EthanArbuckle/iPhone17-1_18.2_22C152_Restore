@interface ICQUISpecifierCellWithAsyncImageLoading
+ (int64_t)cellStyle;
- (ICQUISpecifierCellWithAsyncImageLoading)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupViews;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation ICQUISpecifierCellWithAsyncImageLoading

- (ICQUISpecifierCellWithAsyncImageLoading)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUISpecifierCellWithAsyncImageLoading;
  v4 = [(ICQUISpecifierCellWithAsyncImageLoading *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(ICQUISpecifierCellWithAsyncImageLoading *)v4 setSelectionStyle:0];
    [(ICQUISpecifierCellWithAsyncImageLoading *)v5 _setupViews];
  }
  return v5;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)_setupViews
{
  v77[2] = *MEMORY[0x263EF8340];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v5 = *MEMORY[0x263F83570];
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_titleLabel setFont:v6];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  objc_super v7 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)self->_titleLabel setColor:v7];

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v8;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)self->_subtitleLabel setFont:v10];

  v11 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)self->_subtitleLabel setColor:v11];

  id v12 = objc_alloc(MEMORY[0x263F82828]);
  v13 = (UIImageView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  cellImageView = self->_cellImageView;
  self->_cellImageView = v13;

  [(UIImageView *)self->_cellImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_cellImageView setContentMode:2];
  id v15 = objc_alloc(MEMORY[0x263F82BF8]);
  v16 = self->_subtitleLabel;
  v77[0] = self->_titleLabel;
  v77[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
  v18 = (void *)[v15 initWithArrangedSubviews:v17];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setAxis:1];
  [v18 setSpacing:1.0];
  LODWORD(v19) = 1144750080;
  [v18 setContentCompressionResistancePriority:0 forAxis:v19];
  v20 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  accessoryLabel = self->_accessoryLabel;
  self->_accessoryLabel = v20;

  [(UILabel *)self->_accessoryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [MEMORY[0x263F81708] preferredFontForTextStyle:v5];
  [(UILabel *)self->_accessoryLabel setFont:v22];

  v23 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)self->_accessoryLabel setColor:v23];

  [(UILabel *)self->_accessoryLabel setTextAlignment:2];
  LODWORD(v24) = 1148846080;
  [(UILabel *)self->_accessoryLabel setContentCompressionResistancePriority:0 forAxis:v24];
  v25 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  [v25 addSubview:self->_cellImageView];

  v26 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  [v26 addSubview:v18];

  v27 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  [v27 addSubview:self->_accessoryLabel];

  v56 = (void *)MEMORY[0x263F08938];
  v75 = [(UIImageView *)self->_cellImageView widthAnchor];
  v74 = [v75 constraintEqualToConstant:29.0];
  v76[0] = v74;
  v73 = [(UIImageView *)self->_cellImageView heightAnchor];
  v72 = [v73 constraintEqualToConstant:40.0];
  v76[1] = v72;
  v70 = [(UIImageView *)self->_cellImageView leadingAnchor];
  v71 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v69 = [v71 layoutMarginsGuide];
  v68 = [v69 leadingAnchor];
  v67 = [v70 constraintEqualToAnchor:v68];
  v76[2] = v67;
  v65 = [(UIImageView *)self->_cellImageView centerYAnchor];
  v66 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v64 = [v66 layoutMarginsGuide];
  v63 = [v64 centerYAnchor];
  v62 = [v65 constraintEqualToAnchor:v63];
  v76[3] = v62;
  v60 = [(UILabel *)self->_accessoryLabel centerYAnchor];
  v61 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v59 = [v61 layoutMarginsGuide];
  v58 = [v59 centerYAnchor];
  v57 = [v60 constraintEqualToAnchor:v58];
  v76[4] = v57;
  v54 = [(UILabel *)self->_accessoryLabel trailingAnchor];
  v55 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v53 = [v55 layoutMarginsGuide];
  v52 = [v53 trailingAnchor];
  v50 = [v54 constraintEqualToAnchor:v52];
  v76[5] = v50;
  v49 = [(UILabel *)self->_accessoryLabel leadingAnchor];
  v48 = [v18 trailingAnchor];
  v47 = [v49 constraintGreaterThanOrEqualToAnchor:v48];
  v76[6] = v47;
  v44 = [v18 topAnchor];
  v46 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v45 = [v46 layoutMarginsGuide];
  v43 = [v45 topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:5.0];
  v76[7] = v42;
  v39 = [v18 bottomAnchor];
  v41 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v40 = [v41 layoutMarginsGuide];
  v38 = [v40 bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:-5.0];
  v76[8] = v37;
  v51 = v18;
  v28 = [v18 leadingAnchor];
  v29 = [(UIImageView *)self->_cellImageView trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:10.0];
  v76[9] = v30;
  v31 = [v18 centerYAnchor];
  v32 = [(ICQUISpecifierCellWithAsyncImageLoading *)self contentView];
  v33 = [v32 layoutMarginsGuide];
  v34 = [v33 centerYAnchor];
  v35 = [v31 constraintEqualToAnchor:v34];
  v76[10] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:11];
  [v56 activateConstraints:v36];

  [(ICQUISpecifierCellWithAsyncImageLoading *)self setAccessoryType:1];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ICQUISpecifierCellWithAsyncImageLoading;
  [(PSTableCell *)&v4 layoutSubviews];
  v3 = [(ICQUISpecifierCellWithAsyncImageLoading *)self imageView];
  [v3 setHidden:1];

  [(ICQUISpecifierCellWithAsyncImageLoading *)self setContentMode:3];
}

- (void)setIcon:(id)a3
{
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICQUISpecifierCellWithAsyncImageLoading;
  id v4 = a3;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:v4];
  uint64_t v5 = [(ICQUISpecifierCellWithAsyncImageLoading *)self textLabel];
  [v5 setText:&stru_26DFF2C90];

  titleLabel = self->_titleLabel;
  objc_super v7 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [(UILabel *)titleLabel setText:v7];

  subtitleLabel = self->_subtitleLabel;
  v9 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
  [(UILabel *)subtitleLabel setText:v9];

  v10 = [v4 target];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      accessoryLabel = self->_accessoryLabel;
      id v12 = [v10 storageUsedLabel];
      [(UILabel *)accessoryLabel setText:v12];
    }
  }
  [(ICQUISpecifierCellWithAsyncImageLoading *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_storeStrong((id *)&self->_cellImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end