@interface WFTriggerImageCell
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)imagePaddingBottomConstraint;
- (NSLayoutConstraint)imagePaddingTopConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSString)objectIdentifier;
- (UIImageView)iconView;
- (UILabel)label;
- (WFTriggerImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setCornerRadius:(double)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setImage:(id)a3 width:(double)a4 height:(double)a5;
- (void)setImagePaddingBottomConstraint:(id)a3;
- (void)setImagePaddingTopConstraint:(id)a3;
- (void)setImageTopPadding:(double)a3 bottomPadding:(double)a4;
- (void)setObjectIdentifier:(id)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation WFTriggerImageCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePaddingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imagePaddingTopConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setImagePaddingBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)imagePaddingBottomConstraint
{
  return self->_imagePaddingBottomConstraint;
}

- (void)setImagePaddingTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)imagePaddingTopConstraint
{
  return self->_imagePaddingTopConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UILabel)label
{
  return self->_label;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)WFTriggerImageCell;
  [(WFTriggerImageCell *)&v4 prepareForReuse];
  [(WFTriggerImageCell *)self setAccessoryType:0];
  v3 = [(WFTriggerImageCell *)self textLabel];
  [v3 setText:0];
}

- (void)setCornerRadius:(double)a3
{
  [(UIImageView *)self->_iconView _setContinuousCornerRadius:a3];
  iconView = self->_iconView;
  [(UIImageView *)iconView setClipsToBounds:1];
}

- (void)setImageTopPadding:(double)a3 bottomPadding:(double)a4
{
  [(NSLayoutConstraint *)self->_imagePaddingTopConstraint setConstant:a3];
  [(NSLayoutConstraint *)self->_imagePaddingBottomConstraint setConstant:a4];
  [(WFTriggerImageCell *)self setNeedsUpdateConstraints];
}

- (void)setImage:(id)a3 width:(double)a4 height:(double)a5
{
  widthConstraint = self->_widthConstraint;
  id v9 = a3;
  [(NSLayoutConstraint *)widthConstraint setConstant:a4];
  [(NSLayoutConstraint *)self->_heightConstraint setConstant:a5];
  [(UIImageView *)self->_iconView setImage:v9];

  [(WFTriggerImageCell *)self separatorInset];
  double v11 = v10;
  [(WFTriggerImageCell *)self separatorInset];
  double v13 = v12;
  [(WFTriggerImageCell *)self separatorInset];
  -[WFTriggerImageCell setSeparatorInset:](self, "setSeparatorInset:", v11, a4 + 30.0, v13);
  [(WFTriggerImageCell *)self setNeedsUpdateConstraints];
}

- (WFTriggerImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v64[11] = *MEMORY[0x263EF8340];
  v63.receiver = self;
  v63.super_class = (Class)WFTriggerImageCell;
  objc_super v4 = [(WFTriggerImageCell *)&v63 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    iconView = v4->_iconView;
    v4->_iconView = v5;

    [(UIImageView *)v4->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconView setContentMode:1];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v4->_label;
    v4->_label = v7;

    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v4->_label setFont:v9];

    double v10 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v4->_label setTextColor:v10];

    [(UILabel *)v4->_label setNumberOfLines:0];
    double v11 = [(WFTriggerImageCell *)v4 contentView];
    [v11 addSubview:v4->_iconView];

    double v12 = [(WFTriggerImageCell *)v4 contentView];
    [v12 addSubview:v4->_label];

    double v13 = [(UIImageView *)v4->_iconView widthAnchor];
    uint64_t v14 = [v13 constraintEqualToConstant:42.0];
    widthConstraint = v4->_widthConstraint;
    v4->_widthConstraint = (NSLayoutConstraint *)v14;

    v16 = [(UIImageView *)v4->_iconView heightAnchor];
    uint64_t v17 = [v16 constraintEqualToConstant:42.0];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v17;

    v19 = [(UIImageView *)v4->_iconView topAnchor];
    v20 = [(WFTriggerImageCell *)v4 contentView];
    v21 = [v20 topAnchor];
    uint64_t v22 = [v19 constraintGreaterThanOrEqualToAnchor:v21 constant:15.0];
    imagePaddingTopConstraint = v4->_imagePaddingTopConstraint;
    v4->_imagePaddingTopConstraint = (NSLayoutConstraint *)v22;

    v24 = [(UIImageView *)v4->_iconView bottomAnchor];
    v25 = [(WFTriggerImageCell *)v4 contentView];
    v26 = [v25 bottomAnchor];
    uint64_t v27 = [v24 constraintGreaterThanOrEqualToAnchor:v26 constant:15.0];
    imagePaddingBottomConstraint = v4->_imagePaddingBottomConstraint;
    v4->_imagePaddingBottomConstraint = (NSLayoutConstraint *)v27;

    v50 = (void *)MEMORY[0x263F08938];
    v61 = [(UIImageView *)v4->_iconView centerYAnchor];
    v62 = [(WFTriggerImageCell *)v4 contentView];
    v60 = [v62 centerYAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v64[0] = v59;
    v57 = [(UIImageView *)v4->_iconView leadingAnchor];
    v58 = [(WFTriggerImageCell *)v4 contentView];
    v56 = [v58 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:15.0];
    v64[1] = v55;
    v53 = [(UILabel *)v4->_label centerYAnchor];
    v54 = [(WFTriggerImageCell *)v4 contentView];
    v52 = [v54 centerYAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v64[2] = v51;
    v49 = [(UILabel *)v4->_label leadingAnchor];
    v48 = [(UIImageView *)v4->_iconView trailingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 constant:15.0];
    v64[3] = v47;
    v45 = [(UILabel *)v4->_label trailingAnchor];
    v46 = [(WFTriggerImageCell *)v4 contentView];
    v44 = [v46 layoutMarginsGuide];
    v43 = [v44 trailingAnchor];
    v42 = [v45 constraintEqualToAnchor:v43];
    v64[4] = v42;
    v40 = [(UILabel *)v4->_label topAnchor];
    v41 = [(WFTriggerImageCell *)v4 contentView];
    v29 = [v41 layoutMarginsGuide];
    v30 = [v29 topAnchor];
    v31 = [v40 constraintEqualToAnchor:v30];
    v64[5] = v31;
    v32 = [(UILabel *)v4->_label bottomAnchor];
    v33 = [(WFTriggerImageCell *)v4 contentView];
    v34 = [v33 layoutMarginsGuide];
    v35 = [v34 bottomAnchor];
    v36 = [v32 constraintEqualToAnchor:v35];
    v64[6] = v36;
    v64[7] = v4->_widthConstraint;
    v64[8] = v4->_heightConstraint;
    v64[9] = v4->_imagePaddingTopConstraint;
    v64[10] = v4->_imagePaddingBottomConstraint;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:11];
    [v50 activateConstraints:v37];

    v38 = v4;
  }

  return v4;
}

@end