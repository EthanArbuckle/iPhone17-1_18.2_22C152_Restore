@interface ICSTipTableViewCell
+ (int64_t)cellStyle;
- (ICSTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)actionButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ICSTipTableViewCell

+ (int64_t)cellStyle
{
  return 0;
}

- (ICSTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v68[3] = *MEMORY[0x263EF8340];
  v65.receiver = self;
  v65.super_class = (Class)ICSTipTableViewCell;
  v4 = [(ICSTipTableViewCell *)&v65 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(ICSTipTableViewCell *)v4 setSelectionStyle:0];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    [(UIImageView *)v5->_imageView setContentMode:1];
    [(UIImageView *)v5->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x263F825C8] systemRedColor];
    [(UIImageView *)v5->_imageView setTintColor:v8];

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    v11 = v5->_titleLabel;
    uint64_t v12 = *MEMORY[0x263F835F0];
    v13 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81840]];
    [(UILabel *)v11 setFont:v13];

    v14 = v5->_titleLabel;
    v15 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v14 setTextColor:v15];

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v16;

    [(UILabel *)v5->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_subtitleLabel setNumberOfLines:0];
    v18 = v5->_subtitleLabel;
    v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:v12];
    [(UILabel *)v18 setFont:v19];

    v20 = v5->_subtitleLabel;
    v21 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v20 setTextColor:v21];

    v22 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
    actionButton = v5->_actionButton;
    v5->_actionButton = v22;

    [(UIButton *)v5->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [(UIButton *)v5->_actionButton titleLabel];
    [v24 setNumberOfLines:0];

    v25 = [(UIButton *)v5->_actionButton titleLabel];
    [v25 setTextAlignment:0];

    v26 = [MEMORY[0x263F81708] preferredFontForTextStyle:v12];
    v27 = [(UIButton *)v5->_actionButton titleLabel];
    [v27 setFont:v26];

    v28 = v5->_actionButton;
    v29 = [(ICSTipTableViewCell *)v5 tintColor];
    [(UIButton *)v28 setTitleColor:v29 forState:0];

    v30 = v5->_actionButton;
    v31 = [(ICSTipTableViewCell *)v5 tintColor];
    v32 = [v31 colorWithAlphaComponent:0.200000003];
    [(UIButton *)v30 setTitleColor:v32 forState:1];

    [(UIButton *)v5->_actionButton addTarget:v5 action:sel_actionButtonTapped_ forControlEvents:64];
    id v33 = objc_alloc(MEMORY[0x263F82BF8]);
    v68[0] = v5->_titleLabel;
    v68[1] = v5->_subtitleLabel;
    v68[2] = v5->_actionButton;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:3];
    v35 = (void *)[v33 initWithArrangedSubviews:v34];

    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v35 setAxis:1];
    v36 = v35;
    v64 = v35;
    [v35 setAlignment:1];
    id v37 = objc_alloc(MEMORY[0x263F82BF8]);
    v67[0] = v5->_imageView;
    v67[1] = v36;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
    v39 = (void *)[v37 initWithArrangedSubviews:v38];

    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v39 setAxis:0];
    [v39 setAlignment:3];
    [v39 setSpacing:12.0];
    v40 = [(ICSTipTableViewCell *)v5 contentView];
    [v40 addSubview:v39];

    v55 = (void *)MEMORY[0x263F08938];
    v62 = [v39 leadingAnchor];
    v63 = [(ICSTipTableViewCell *)v5 contentView];
    v61 = [v63 leadingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:6.0];
    v66[0] = v60;
    v58 = [v39 trailingAnchor];
    v59 = [(ICSTipTableViewCell *)v5 contentView];
    v57 = [v59 trailingAnchor];
    v56 = [v58 constraintEqualToAnchor:v57 constant:-11.0];
    v66[1] = v56;
    v53 = [v39 topAnchor];
    v54 = [(ICSTipTableViewCell *)v5 contentView];
    v52 = [v54 topAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:11.0];
    v66[2] = v51;
    v50 = [v39 bottomAnchor];
    v41 = [(ICSTipTableViewCell *)v5 contentView];
    v42 = [v41 bottomAnchor];
    v43 = [v50 constraintEqualToAnchor:v42 constant:-11.0];
    v66[3] = v43;
    v44 = [(UIImageView *)v5->_imageView widthAnchor];
    v45 = [v44 constraintEqualToConstant:40.0];
    v66[4] = v45;
    v46 = [(UIImageView *)v5->_imageView heightAnchor];
    v47 = [v46 constraintEqualToConstant:40.0];
    v66[5] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:6];
    [v55 activateConstraints:v48];
  }
  return v5;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)ICSTipTableViewCell;
  [(PSTableCell *)&v2 layoutSubviews];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ICSTipTableViewCell;
  id v4 = a3;
  [(PSTableCell *)&v12 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSTableCell *)self titleLabel];
  [v5 setText:&stru_270DEF3F8];

  v6 = [(ICSTipTableViewCell *)self imageView];
  [v6 setImage:0];

  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F60140]];
  [(UIImageView *)self->_imageView setImage:v7];

  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F602D0]];
  [(UILabel *)self->_titleLabel setText:v8];

  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
  [(UILabel *)self->_subtitleLabel setText:v9];

  actionButton = self->_actionButton;
  v11 = [v4 objectForKeyedSubscript:@"ICSActionButtonTitleKey"];

  [(UIButton *)actionButton setTitle:v11 forStates:0];
  [(ICSTipTableViewCell *)self setNeedsLayout];
}

- (void)actionButtonTapped:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Action button tapped.", v6, 2u);
  }

  v5 = [(PSTableCell *)self specifier];
  [v5 performButtonAction];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end