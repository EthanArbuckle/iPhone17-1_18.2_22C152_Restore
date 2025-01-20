@interface PXPeoplePickerCollectionViewCell
- (BOOL)isDisabled;
- (BOOL)isFavorite;
- (PXPeoplePickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UILabel)nameLabel;
- (void)_updateContentAlpha;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PXPeoplePickerCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_favoriteBadgeView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)_updateContentAlpha
{
  double v3 = 0.5;
  if (![(PXPeoplePickerCollectionViewCell *)self isDisabled])
  {
    if ([(PXPeoplePickerCollectionViewCell *)self isSelected]) {
      double v3 = 0.5;
    }
    else {
      double v3 = 1.0;
    }
  }
  v4 = [(PXPeoplePickerCollectionViewCell *)self imageView];
  [v4 setAlpha:v3];

  id v5 = [(PXPeoplePickerCollectionViewCell *)self nameLabel];
  [v5 setAlpha:v3];
}

- (void)setFavorite:(BOOL)a3
{
  if (self->_favorite != a3)
  {
    self->_favorite = a3;
    [(UIImageView *)self->_favoriteBadgeView setHidden:!a3];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXPeoplePickerCollectionViewCell;
  -[PXPeoplePickerCollectionViewCell setSelected:](&v5, sel_setSelected_);
  [(UIImageView *)self->_badgeView setHidden:!v3];
  [(PXPeoplePickerCollectionViewCell *)self _updateContentAlpha];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(PXPeoplePickerCollectionViewCell *)self _updateContentAlpha];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeoplePickerCollectionViewCell;
  [(PXPeoplePickerCollectionViewCell *)&v3 prepareForReuse];
  [(PXPeoplePickerCollectionViewCell *)self setDisabled:0];
  [(PXPeoplePickerCollectionViewCell *)self setSelected:0];
  [(PXPeoplePickerCollectionViewCell *)self setFavorite:0];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PXPeoplePickerCollectionViewCell;
  [(PXPeoplePickerCollectionViewCell *)&v9 layoutSubviews];
  objc_super v3 = [(PXPeoplePickerCollectionViewCell *)self imageView];
  uint64_t v4 = *MEMORY[0x1E4F39EA8];
  objc_super v5 = [v3 layer];
  [v5 setCornerCurve:v4];

  +[PXLemonadePeopleCellSpecsConstants cornerRadius];
  double v7 = v6;
  v8 = [v3 layer];
  [v8 setCornerRadius:v7];
}

- (PXPeoplePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v64[11] = *MEMORY[0x1E4F143B8];
  v63.receiver = self;
  v63.super_class = (Class)PXPeoplePickerCollectionViewCell;
  objc_super v3 = -[PXPeoplePickerCollectionViewCell initWithFrame:](&v63, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    objc_super v5 = [(PXPeoplePickerCollectionViewCell *)v3 contentView];
    double v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_imageView setContentMode:1];
    v8 = [(UIImageView *)v4->_imageView layer];
    [v8 setMasksToBounds:1];

    [v5 addSubview:v4->_imageView];
    v62 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    objc_super v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
    v10 = [v9 imageWithSymbolConfiguration:v62];
    v11 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v61 = objc_msgSend(v10, "px_tintedCircularImageWithColor:backgroundColor:", v11, v12);

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    badgeView = v4->_badgeView;
    v4->_badgeView = v13;

    [(UIImageView *)v4->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_badgeView setImage:v61];
    [(UIImageView *)v4->_badgeView setHidden:1];
    [v5 addSubview:v4->_badgeView];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v15;

    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_nameLabel setAdjustsFontForContentSizeCategory:1];
    [v5 addSubview:v4->_nameLabel];
    v17 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] weight:*MEMORY[0x1E4FB09B8]];
    [(UILabel *)v4->_nameLabel setFont:v17];

    [(UILabel *)v4->_nameLabel setTextAlignment:4];
    v18 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v4->_nameLabel setTextColor:v18];

    v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.fill"];
    v20 = [MEMORY[0x1E4FB1830] configurationWithPointSize:16.0];
    v60 = [v19 imageWithSymbolConfiguration:v20];

    v21 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    favoriteBadgeView = v4->_favoriteBadgeView;
    v4->_favoriteBadgeView = v21;

    [(UIImageView *)v4->_favoriteBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_favoriteBadgeView setImage:v60];
    v23 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v4->_favoriteBadgeView setTintColor:v23];

    [(UIImageView *)v4->_favoriteBadgeView setHidden:1];
    [v5 addSubview:v4->_favoriteBadgeView];
    v47 = (void *)MEMORY[0x1E4F28DC8];
    v59 = [(UIImageView *)v4->_imageView topAnchor];
    v58 = [v5 topAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:5.0];
    v64[0] = v57;
    v56 = [(UIImageView *)v4->_imageView leadingAnchor];
    v55 = [v5 leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55 constant:5.0];
    v64[1] = v54;
    v53 = [(UIImageView *)v4->_imageView trailingAnchor];
    v52 = [v5 trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:-5.0];
    v64[2] = v51;
    v50 = [(UIImageView *)v4->_imageView bottomAnchor];
    v49 = [v5 bottomAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:-5.0];
    v64[3] = v48;
    v46 = [(UIImageView *)v4->_favoriteBadgeView trailingAnchor];
    v45 = [v5 trailingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:-16.0];
    v64[4] = v44;
    v43 = [(UIImageView *)v4->_favoriteBadgeView topAnchor];
    v42 = [v5 topAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
    v64[5] = v41;
    v40 = [(UIImageView *)v4->_badgeView trailingAnchor];
    v39 = [v5 trailingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:-16.0];
    v64[6] = v38;
    v37 = [(UIImageView *)v4->_badgeView bottomAnchor];
    v36 = [v5 bottomAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:-16.0];
    v64[7] = v35;
    v34 = [(UILabel *)v4->_nameLabel bottomAnchor];
    v33 = [v5 bottomAnchor];
    v24 = [v34 constraintEqualToAnchor:v33 constant:-16.0];
    v64[8] = v24;
    v25 = [(UILabel *)v4->_nameLabel leadingAnchor];
    v26 = [v5 leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:16.0];
    v64[9] = v27;
    v28 = [(UILabel *)v4->_nameLabel trailingAnchor];
    v29 = [v5 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v64[10] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:11];
    [v47 activateConstraints:v31];
  }
  return v4;
}

@end