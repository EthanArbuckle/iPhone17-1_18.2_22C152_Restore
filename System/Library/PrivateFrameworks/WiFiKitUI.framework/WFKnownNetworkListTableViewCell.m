@interface WFKnownNetworkListTableViewCell
- (BOOL)hasLeadingPadding;
- (BOOL)showLock;
- (NSLayoutConstraint)extraLeadingConstraints;
- (NSLayoutConstraint)normalLeadingConstraints;
- (NSString)networkName;
- (UIImageView)lockImageView;
- (UILabel)networkNameLabel;
- (WFKnownNetworkListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setExtraLeadingConstraints:(id)a3;
- (void)setHasLeadingPadding:(BOOL)a3;
- (void)setLockImageView:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setNetworkNameLabel:(id)a3;
- (void)setNormalLeadingConstraints:(id)a3;
- (void)setShowLock:(BOOL)a3;
@end

@implementation WFKnownNetworkListTableViewCell

- (WFKnownNetworkListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v56.receiver = self;
  v56.super_class = (Class)WFKnownNetworkListTableViewCell;
  v4 = [(WFKnownNetworkListTableViewCell *)&v56 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    lockImageView = v4->_lockImageView;
    v4->_lockImageView = v5;

    v7 = +[WFImageCache sharedImageCache];
    v8 = [v7 imageNamed:@"Lock"];
    v9 = [v8 imageWithRenderingMode:2];
    [(UIImageView *)v4->_lockImageView setImage:v9];

    v10 = v4->_lockImageView;
    v11 = [MEMORY[0x263F825C8] defaultTextColor];
    [(UIImageView *)v10 setTintColor:v11];

    [(UIImageView *)v4->_lockImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    [v12 addSubview:v4->_lockImageView];

    v13 = [(UIImageView *)v4->_lockImageView trailingAnchor];
    v14 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v15 = [v14 trailingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    networkNameLabel = v4->_networkNameLabel;
    v4->_networkNameLabel = v17;

    [(UILabel *)v4->_networkNameLabel setNumberOfLines:0];
    v19 = v4->_networkNameLabel;
    v20 = [MEMORY[0x263F825C8] defaultTextColor];
    [(UILabel *)v19 setTintColor:v20];

    [(UILabel *)v4->_networkNameLabel setAdjustsFontForContentSizeCategory:1];
    v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v4->_networkNameLabel setFont:v21];

    [(UILabel *)v4->_networkNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    [v22 addSubview:v4->_networkNameLabel];

    v23 = [(UIImageView *)v4->_lockImageView centerYAnchor];
    v24 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v25 = [v24 centerYAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UILabel *)v4->_networkNameLabel centerYAnchor];
    v28 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v29 = [v28 centerYAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    [v30 setActive:1];

    v31 = [(UILabel *)v4->_networkNameLabel trailingAnchor];
    v32 = [(UIImageView *)v4->_lockImageView leadingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    [v33 setActive:1];

    v34 = [(UILabel *)v4->_networkNameLabel font];
    [v34 _bodyLeading];
    double v36 = v35 + -8.0;

    v37 = [(UILabel *)v4->_networkNameLabel topAnchor];
    v38 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v39 = [v38 topAnchor];
    v40 = [v37 constraintEqualToAnchor:v39 constant:v36];
    [v40 setActive:1];

    v41 = [(UILabel *)v4->_networkNameLabel bottomAnchor];
    v42 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v43 = [v42 bottomAnchor];
    v44 = [v41 constraintEqualToAnchor:v43 constant:-v36];
    [v44 setActive:1];

    v45 = [(UILabel *)v4->_networkNameLabel leadingAnchor];
    v46 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v47 = [v46 leadingAnchor];
    uint64_t v48 = [v45 constraintEqualToAnchor:v47 constant:10.0];
    normalLeadingConstraints = v4->_normalLeadingConstraints;
    v4->_normalLeadingConstraints = (NSLayoutConstraint *)v48;

    [(NSLayoutConstraint *)v4->_normalLeadingConstraints setActive:1];
    v4->_showLock = 1;
    v50 = [(UILabel *)v4->_networkNameLabel leadingAnchor];
    v51 = [(WFKnownNetworkListTableViewCell *)v4 contentView];
    v52 = [v51 leadingAnchor];
    uint64_t v53 = [v50 constraintEqualToAnchor:v52 constant:50.0];
    extraLeadingConstraints = v4->_extraLeadingConstraints;
    v4->_extraLeadingConstraints = (NSLayoutConstraint *)v53;
  }
  return v4;
}

- (void)setNetworkName:(id)a3
{
  id v4 = a3;
  id v5 = [(WFKnownNetworkListTableViewCell *)self networkNameLabel];
  [v5 setText:v4];
}

- (void)setShowLock:(BOOL)a3
{
}

- (void)setHasLeadingPadding:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSLayoutConstraint setActive:](self->_extraLeadingConstraints, "setActive:");
  [(NSLayoutConstraint *)self->_normalLeadingConstraints setActive:!v3];
  [(WFKnownNetworkListTableViewCell *)self setNeedsLayout];
}

- (NSString)networkName
{
  return self->_networkName;
}

- (BOOL)showLock
{
  return self->_showLock;
}

- (BOOL)hasLeadingPadding
{
  return self->_hasLeadingPadding;
}

- (UILabel)networkNameLabel
{
  return self->_networkNameLabel;
}

- (void)setNetworkNameLabel:(id)a3
{
}

- (UIImageView)lockImageView
{
  return self->_lockImageView;
}

- (void)setLockImageView:(id)a3
{
}

- (NSLayoutConstraint)extraLeadingConstraints
{
  return self->_extraLeadingConstraints;
}

- (void)setExtraLeadingConstraints:(id)a3
{
}

- (NSLayoutConstraint)normalLeadingConstraints
{
  return self->_normalLeadingConstraints;
}

- (void)setNormalLeadingConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalLeadingConstraints, 0);
  objc_storeStrong((id *)&self->_extraLeadingConstraints, 0);
  objc_storeStrong((id *)&self->_lockImageView, 0);
  objc_storeStrong((id *)&self->_networkNameLabel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end