@interface ICSDataclassWithSubtitleTableViewCell
- (ICSDataclassWithSubtitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NSLayoutConstraint)trailingConstraint;
- (UIImageView)iconView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UILabel)tertiaryLabel;
- (void)_setupViews;
- (void)setIconView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTertiaryLabel:(id)a3;
- (void)setTrailingConstraint:(id)a3;
@end

@implementation ICSDataclassWithSubtitleTableViewCell

- (ICSDataclassWithSubtitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)ICSDataclassWithSubtitleTableViewCell;
  v5 = [(PSTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(ICSDataclassWithSubtitleTableViewCell *)v5 setSelectionStyle:0];
    [(ICSDataclassWithSubtitleTableViewCell *)v6 _setupViews];
  }
  return v6;
}

- (void)_setupViews
{
  v92[2] = *MEMORY[0x263EF8340];
  v3 = [(ICSDataclassWithSubtitleTableViewCell *)self textLabel];
  [v3 setHidden:1];

  v4 = [(ICSDataclassWithSubtitleTableViewCell *)self detailTextLabel];
  [v4 setHidden:1];

  id v5 = objc_alloc(MEMORY[0x263F82828]);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
  [(ICSDataclassWithSubtitleTableViewCell *)self setIconView:v10];

  v11 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  [v11 setContentMode:1];

  v12 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  LODWORD(v14) = 1148846080;
  [v13 setContentHuggingPriority:0 forAxis:v14];

  v15 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  LODWORD(v16) = 1148846080;
  [v15 setContentCompressionResistancePriority:0 forAxis:v16];

  v17 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  v18 = [v17 layer];
  [v18 setOpacity:0.0];

  v86 = (void *)MEMORY[0x263F08938];
  v19 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  v20 = [v19 heightAnchor];
  v21 = [v20 constraintEqualToConstant:29.0];
  v92[0] = v21;
  v22 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  v23 = [v22 heightAnchor];
  v24 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  v25 = [v24 widthAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v92[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:2];
  [v86 activateConstraints:v27];

  id v28 = objc_alloc(MEMORY[0x263F82BF8]);
  v29 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
  v91[0] = v29;
  v30 = [(ICSDataclassWithSubtitleTableViewCell *)self iconView];
  v91[1] = v30;
  v31 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
  v91[2] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:3];
  v33 = (void *)[v28 initWithArrangedSubviews:v32];

  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v33 setAxis:1];
  [v33 setDistribution:3];
  v34 = v33;
  v87 = v33;
  [v33 setSpacing:0.0];
  v35 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
  [(ICSDataclassWithSubtitleTableViewCell *)self setPrimaryLabel:v35];

  v36 = [(ICSDataclassWithSubtitleTableViewCell *)self primaryLabel];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v37 = *MEMORY[0x263F83570];
  v38 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v39 = [(ICSDataclassWithSubtitleTableViewCell *)self primaryLabel];
  [v39 setFont:v38];

  v40 = [(ICSDataclassWithSubtitleTableViewCell *)self primaryLabel];
  [v40 setNumberOfLines:0];

  v41 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
  [(ICSDataclassWithSubtitleTableViewCell *)self setSecondaryLabel:v41];

  v42 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v43 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  [v43 setTextColor:v42];

  v44 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v45 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  [v45 setFont:v44];

  v46 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

  v47 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  [v47 setNumberOfLines:0];

  v48 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
  [(ICSDataclassWithSubtitleTableViewCell *)self setTertiaryLabel:v48];

  v49 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v50 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
  [v50 setTextColor:v49];

  v51 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
  [v51 setTextAlignment:2];

  v52 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
  [v52 setTranslatesAutoresizingMaskIntoConstraints:0];

  v53 = [MEMORY[0x263F81708] preferredFontForTextStyle:v37];
  v54 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
  [v54 setFont:v53];

  id v55 = objc_alloc(MEMORY[0x263F82BF8]);
  v56 = [(ICSDataclassWithSubtitleTableViewCell *)self primaryLabel];
  v90[0] = v56;
  v57 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  v90[1] = v57;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:2];
  v59 = (void *)[v55 initWithArrangedSubviews:v58];

  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v59 setAxis:1];
  [v59 setDistribution:0];
  v60 = v59;
  v85 = v59;
  [v59 setSpacing:2.0];
  id v61 = objc_alloc(MEMORY[0x263F82BF8]);
  v89[0] = v34;
  v89[1] = v60;
  v62 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
  v89[2] = v62;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:3];
  v64 = (void *)[v61 initWithArrangedSubviews:v63];

  [v64 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v64 setAxis:0];
  [v64 setDistribution:0];
  [v64 setSpacing:16.0];
  v65 = [(ICSDataclassWithSubtitleTableViewCell *)self contentView];
  [v65 addSubview:v64];

  v66 = [v64 trailingAnchor];
  v67 = [(ICSDataclassWithSubtitleTableViewCell *)self contentView];
  v68 = [v67 trailingAnchor];
  v69 = [v66 constraintEqualToAnchor:v68];
  [(ICSDataclassWithSubtitleTableViewCell *)self setTrailingConstraint:v69];

  v80 = (void *)MEMORY[0x263F08938];
  v83 = [v64 topAnchor];
  v84 = [(ICSDataclassWithSubtitleTableViewCell *)self contentView];
  v82 = [v84 topAnchor];
  v81 = [v83 constraintEqualToAnchor:v82 constant:10.0];
  v88[0] = v81;
  v79 = [v64 bottomAnchor];
  v70 = [(ICSDataclassWithSubtitleTableViewCell *)self contentView];
  v71 = [v70 bottomAnchor];
  v72 = [v79 constraintEqualToAnchor:v71 constant:-10.0];
  v88[1] = v72;
  v73 = [v64 leadingAnchor];
  v74 = [(ICSDataclassWithSubtitleTableViewCell *)self contentView];
  v75 = [v74 leadingAnchor];
  v76 = [v73 constraintEqualToAnchor:v75 constant:16.0];
  v88[2] = v76;
  v77 = [(ICSDataclassWithSubtitleTableViewCell *)self trailingConstraint];
  v88[3] = v77;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:4];
  [v80 activateConstraints:v78];
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end