@interface PXPeopleDetailSettingsCollectionViewCell
+ (double)preferredHeightForWidth:(double)a3 forAvatarPercentage:(double)a4 withSizeClass:(int64_t)a5 isFavorite:(BOOL)a6;
- (BOOL)isActionIndicatorHidden;
- (BOOL)isFavorite;
- (NSString)name;
- (PXPeopleDetailSettingsCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)avatarView;
- (UILabel)nameLabel;
- (UILabel)quantityLabel;
- (UIView)actionIndicatorView;
- (UIView)selectionView;
- (double)avatarCenterYOffset;
- (double)textAlpha;
- (id)_placeHolderColor;
- (int64_t)_preferredSizeClass;
- (unint64_t)photoQuantity;
- (void)_updateType;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActionIndicatorHidden:(BOOL)a3;
- (void)setActionIndicatorView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 normalizedFaceRect:(CGRect)a4;
- (void)setIsFavorite:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPhotoQuantity:(unint64_t)a3;
- (void)setQuantityLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionView:(id)a3;
- (void)setTextAlpha:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXPeopleDetailSettingsCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_actionIndicatorView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_quantityLabel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_quantityNumberFormatter, 0);
}

- (void)setSelectionView:(id)a3
{
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void)setActionIndicatorView:(id)a3
{
}

- (UIView)actionIndicatorView
{
  return self->_actionIndicatorView;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setQuantityLabel:(id)a3
{
}

- (UILabel)quantityLabel
{
  return self->_quantityLabel;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (unint64_t)photoQuantity
{
  return self->_photoQuantity;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (id)_placeHolderColor
{
  if (_placeHolderColor_token != -1) {
    dispatch_once(&_placeHolderColor_token, &__block_literal_global_354);
  }
  v2 = (void *)_placeHolderColor_placeHolderColor;
  return v2;
}

void __61__PXPeopleDetailSettingsCollectionViewCell__placeHolderColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.899999976 alpha:1.0];
  v1 = (void *)_placeHolderColor_placeHolderColor;
  _placeHolderColor_placeHolderColor = v0;
}

- (void)_updateType
{
  if ([(PXPeopleDetailSettingsCollectionViewCell *)self _preferredSizeClass] == 1)
  {
    v3 = (void *)MEMORY[0x1E4FB28F0];
    if (self->_isFavorite) {
      v4 = (void *)MEMORY[0x1E4FB2950];
    }
    else {
      v4 = (void *)MEMORY[0x1E4FB28F0];
    }
    id v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v4];
    if (self->_isFavorite) {
      v5 = v3;
    }
    else {
      v5 = (void *)MEMORY[0x1E4FB28D8];
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v5 = (void *)MEMORY[0x1E4FB2950];
  }
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v5];
  v7 = [(PXPeopleDetailSettingsCollectionViewCell *)self nameLabel];
  [v7 setFont:v9];

  v8 = [(PXPeopleDetailSettingsCollectionViewCell *)self quantityLabel];
  [v8 setFont:v6];
}

- (int64_t)_preferredSizeClass
{
  v2 = [(PXPeopleDetailSettingsCollectionViewCell *)self traitCollection];
  if ([v2 horizontalSizeClass] == 2)
  {
    if ([v2 userInterfaceIdiom] == 1) {
      int64_t v3 = 2;
    }
    else {
      int64_t v3 = 1;
    }
  }
  else
  {
    int64_t v3 = 1;
  }

  return v3;
}

- (double)avatarCenterYOffset
{
  int64_t v3 = [(PXPeopleDetailSettingsCollectionViewCell *)self avatarView];
  [v3 center];
  double v5 = v4;
  [(PXPeopleDetailSettingsCollectionViewCell *)self bounds];
  double v7 = v5 + v6 * -0.5;

  return v7;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  -[PXPeopleDetailSettingsCollectionViewCell setSelected:](&v6, sel_setSelected_);
  double v5 = [(PXPeopleDetailSettingsCollectionViewCell *)self selectionView];
  [v5 setHidden:!v3];
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
  double v4 = [(PXPeopleDetailSettingsCollectionViewCell *)self nameLabel];
  [v4 setAlpha:self->_textAlpha];

  id v5 = [(PXPeopleDetailSettingsCollectionViewCell *)self quantityLabel];
  [v5 setAlpha:self->_textAlpha];
}

- (BOOL)isActionIndicatorHidden
{
  v2 = [(PXPeopleDetailSettingsCollectionViewCell *)self actionIndicatorView];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setActionIndicatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXPeopleDetailSettingsCollectionViewCell *)self actionIndicatorView];
  [v4 setHidden:v3];
}

- (void)setPhotoQuantity:(unint64_t)a3
{
  self->_photoQuantity = a3;
  quantityNumberFormatter = self->_quantityNumberFormatter;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSNumberFormatter *)quantityNumberFormatter stringFromNumber:v5];

  objc_super v6 = [(PXPeopleDetailSettingsCollectionViewCell *)self quantityLabel];
  [v6 setText:v7];
}

- (UIImage)image
{
  v2 = [(PXPeopleDetailSettingsCollectionViewCell *)self avatarView];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3 normalizedFaceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v11 = [(PXPeopleDetailSettingsCollectionViewCell *)self avatarView];
  v10 = [v11 layer];
  [v11 setImage:v9];

  [v11 setContentMode:2];
  objc_msgSend(v10, "setContentsRect:", x, y, width, height);
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v6 = [(PXPeopleDetailSettingsCollectionViewCell *)self avatarView];
  [v6 setImage:v4];

  [v6 setContentMode:1];
  id v5 = [v6 layer];
  objc_msgSend(v5, "setContentsRect:", self->_unitRect.origin.x, self->_unitRect.origin.y, self->_unitRect.size.width, self->_unitRect.size.height);
}

- (void)setName:(id)a3
{
  id v5 = (NSString *)a3;
  v10 = v5;
  if (self->_name != v5 || (BOOL v6 = [(NSString *)v5 isEqualToString:v5], v7 = v10, !v6))
  {
    objc_storeStrong((id *)&self->_name, a3);
    v8 = [(PXPeopleDetailSettingsCollectionViewCell *)self nameLabel];
    uint64_t v9 = [(NSString *)v10 length];
    if (v9) {
      [v8 setText:v10];
    }
    [v8 setHidden:v9 == 0];
    [(PXPeopleDetailSettingsCollectionViewCell *)self setNeedsLayout];

    id v7 = v10;
  }
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  [(PXPeopleDetailSettingsCollectionViewCell *)&v6 prepareForReuse];
  [(UIImageView *)self->_avatarView setImage:0];
  name = self->_name;
  self->_name = (NSString *)&stru_1F00B0030;

  [(UILabel *)self->_nameLabel setText:&stru_1F00B0030];
  [(UILabel *)self->_nameLabel setHidden:1];
  self->_photoQuantitdouble y = 0;
  quantityLabel = self->_quantityLabel;
  id v5 = [(NSNumberFormatter *)self->_quantityNumberFormatter stringFromNumber:&unk_1F02D57B8];
  [(UILabel *)quantityLabel setText:v5];

  [(PXPeopleDetailSettingsCollectionViewCell *)self setHidden:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  [(PXPeopleDetailSettingsCollectionViewCell *)&v4 traitCollectionDidChange:a3];
  [(PXPeopleDetailSettingsCollectionViewCell *)self _updateType];
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  [(PXPeopleDetailSettingsCollectionViewCell *)&v63 layoutSubviews];
  BOOL v3 = [(PXPeopleDetailSettingsCollectionViewCell *)self avatarView];
  objc_super v4 = [(PXPeopleDetailSettingsCollectionViewCell *)self quantityLabel];
  id v5 = [(PXPeopleDetailSettingsCollectionViewCell *)self nameLabel];
  objc_super v6 = [(PXPeopleDetailSettingsCollectionViewCell *)self actionIndicatorView];
  id v7 = [(PXPeopleDetailSettingsCollectionViewCell *)self selectionView];
  [(PXPeopleDetailSettingsCollectionViewCell *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  int v16 = [v5 isHidden];
  v17 = [v5 font];
  v18 = [v4 font];
  [v5 setFont:v17];
  [v4 setFont:v18];
  int64_t v19 = [(PXPeopleDetailSettingsCollectionViewCell *)self _preferredSizeClass];
  if (v19 == 1) {
    double v20 = 20.0;
  }
  else {
    double v20 = 30.0;
  }
  if (v19 == 1) {
    double v21 = 16.0;
  }
  else {
    double v21 = 20.0;
  }
  [v17 _scaledValueForValue:v20];
  double v23 = v22;
  [v18 _scaledValueForValue:v20];
  double v58 = v24;
  [v18 _scaledValueForValue:v21];
  double v26 = v25;
  v64.origin.double x = v9;
  v64.origin.double y = v11;
  v64.size.double width = v13;
  v64.size.double height = v15;
  double Width = CGRectGetWidth(v64);
  v65.origin.double x = v9;
  v65.origin.double y = v11;
  v65.size.double width = v13;
  v65.size.double height = v15;
  double Height = CGRectGetHeight(v65);
  objc_msgSend(v4, "sizeThatFits:", Width, 1.79769313e308);
  double v30 = v29;
  [v4 sizeThatFits:1.79769313e308];
  double v59 = v31;
  *(float *)&double v31 = v30 * 0.5;
  double v62 = floorf(*(float *)&v31);
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  double v33 = v32;
  [v5 sizeThatFits:1.79769313e308];
  double v60 = v34;
  double v61 = v26;
  if (Height - (v23 + v26) >= Width) {
    double v35 = Width;
  }
  else {
    double v35 = Height - (v23 + v26);
  }
  objc_msgSend(v3, "setFrame:", (Width - v35) * 0.5, 0.0, v35, v35);
  v36 = [v3 layer];
  [v36 setCornerRadius:v35 * 0.5];

  [v3 setClipsToBounds:1];
  [v3 frame];
  CGRect v67 = CGRectInset(v66, -2.0, -2.0);
  double v37 = v67.size.width;
  objc_msgSend(v7, "setFrame:", v67.origin.x, v67.origin.y);
  v38 = [v7 layer];
  [v38 setCornerRadius:v37 * 0.5];

  if (v16)
  {
    [v18 ascender];
    *(float *)&double v39 = v58 + v35 - v39;
    CGFloat v40 = floorf(*(float *)&v39);
    [v3 frame];
    double MinX = CGRectGetMinX(v68);
    objc_msgSend(v4, "setFrame:", MinX, v40, Width, v30);
    v69.origin.double x = MinX;
    v69.origin.double y = v40;
    v69.size.double width = Width;
    v69.size.double height = v30;
    double v42 = v62;
    float v43 = CGRectGetMidX(v69) - v59 * 0.5 - v62 + -5.0;
    float v44 = floorf(v43);
    double v45 = MinX;
    CGFloat v46 = v40;
    double v47 = Width;
    double v48 = v30;
  }
  else
  {
    double v49 = v23 + v35;
    [v17 ascender];
    *(float *)&double v50 = v49 - v50;
    CGFloat v51 = floorf(*(float *)&v50);
    [v3 frame];
    double v52 = CGRectGetMinX(v70);
    objc_msgSend(v5, "setFrame:", v52, v51, Width, v33);
    [v18 ascender];
    *(float *)&double v53 = v61 + v49 - v53;
    double v54 = floorf(*(float *)&v53);
    [v3 frame];
    objc_msgSend(v4, "setFrame:", CGRectGetMinX(v71), v54, Width, v30);
    v72.origin.double x = v52;
    v72.origin.double y = v51;
    v72.size.double width = Width;
    v72.size.double height = v33;
    double v42 = v62;
    float v55 = CGRectGetMidX(v72) - v60 * 0.5 - v62 + -5.0;
    float v44 = floorf(v55);
    double v45 = v52;
    CGFloat v46 = v51;
    double v47 = Width;
    double v48 = v33;
  }
  float v56 = CGRectGetMidY(*(CGRect *)&v45) - v62 * 0.5;
  objc_msgSend(v6, "setFrame:", v44, floorf(v56), v42, v42);
  v57 = [v6 layer];
  [v57 setCornerRadius:v62 * 0.5];
}

- (void)setIsFavorite:(BOOL)a3
{
  if (self->_isFavorite != a3)
  {
    self->_isFavorite = a3;
    [(PXPeopleDetailSettingsCollectionViewCell *)self _updateType];
    [(PXPeopleDetailSettingsCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  [(PXPeopleDetailSettingsCollectionViewCell *)&v4 dealloc];
}

- (PXPeopleDetailSettingsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v38.receiver = self;
  v38.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  BOOL v3 = -[PXPeopleDetailSettingsCollectionViewCell initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = (PXPeopleDetailSettingsCollectionViewCell *)v3;
  if (v3)
  {
    *((void *)v3 + 81) = 0;
    *((void *)v3 + 82) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v3 + 664) = _Q0;
    double v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    CGFloat v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    quantityNumberFormatter = v4->_quantityNumberFormatter;
    v4->_quantityNumberFormatter = v11;

    [(NSNumberFormatter *)v4->_quantityNumberFormatter setLocale:v10];
    [(NSNumberFormatter *)v4->_quantityNumberFormatter setFormatterBehavior:1040];
    [(NSNumberFormatter *)v4->_quantityNumberFormatter setNumberStyle:1];
    CGFloat v13 = [(PXPeopleDetailSettingsCollectionViewCell *)v4 contentView];
    double v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    avatarView = v4->_avatarView;
    v4->_avatarView = v14;

    [(UIImageView *)v4->_avatarView setContentMode:1];
    int v16 = v4->_avatarView;
    v17 = [(PXPeopleDetailSettingsCollectionViewCell *)v4 _placeHolderColor];
    [(UIImageView *)v16 setBackgroundColor:v17];

    [v13 addSubview:v4->_avatarView];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v18 setTextAlignment:0];
    int64_t v19 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v18 setTextColor:v19];

    [(UILabel *)v18 setHidden:1];
    [(UILabel *)v18 setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v18 setText:&stru_1F00B0030];
    [(UILabel *)v18 setAdjustsFontSizeToFitWidth:1];
    [v13 addSubview:v18];
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v18;
    double v21 = v18;

    name = v4->_name;
    v4->_name = (NSString *)&stru_1F00B0030;

    double v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v24 = [(NSNumberFormatter *)v4->_quantityNumberFormatter stringFromNumber:&unk_1F02D57B8];
    [(UILabel *)v23 setText:v24];

    [(UILabel *)v23 setTextAlignment:0];
    double v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v23 setTextColor:v25];

    [(UILabel *)v23 setAdjustsFontForContentSizeCategory:1];
    [v13 addSubview:v23];
    quantityLabel = v4->_quantityLabel;
    v4->_quantityLabel = v23;
    v27 = v23;

    v28 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    actionIndicatorView = v4->_actionIndicatorView;
    v4->_actionIndicatorView = v28;

    [(UIView *)v4->_actionIndicatorView setHidden:1];
    double v30 = [(UIView *)v4->_actionIndicatorView layer];
    id v31 = [(PXPeopleDetailSettingsCollectionViewCell *)v4 tintColor];
    objc_msgSend(v30, "setBackgroundColor:", objc_msgSend(v31, "CGColor"));

    [v13 addSubview:v4->_actionIndicatorView];
    double v32 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    selectionView = v4->_selectionView;
    v4->_selectionView = v32;

    [(UIView *)v4->_selectionView setHidden:1];
    double v34 = [(UIView *)v4->_selectionView layer];
    id v35 = [(PXPeopleDetailSettingsCollectionViewCell *)v4 tintColor];
    objc_msgSend(v34, "setBorderColor:", objc_msgSend(v35, "CGColor"));

    [v34 setBorderWidth:2.0];
    [v13 addSubview:v4->_selectionView];
    [(PXPeopleDetailSettingsCollectionViewCell *)v4 _updateType];
    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v4 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

+ (double)preferredHeightForWidth:(double)a3 forAvatarPercentage:(double)a4 withSizeClass:(int64_t)a5 isFavorite:(BOOL)a6
{
  double v8 = (void *)MEMORY[0x1E4FB28C8];
  CGFloat v9 = (void *)MEMORY[0x1E4FB28F0];
  if (a6) {
    double v10 = (void *)MEMORY[0x1E4FB2950];
  }
  else {
    double v10 = (void *)MEMORY[0x1E4FB28F0];
  }
  if (!a6) {
    CGFloat v9 = (void *)MEMORY[0x1E4FB28D8];
  }
  if (a5 == 1)
  {
    double v8 = v10;
    CGFloat v11 = v9;
  }
  else
  {
    CGFloat v11 = (void *)MEMORY[0x1E4FB2950];
  }
  if (a5 == 1) {
    double v12 = 36.0;
  }
  else {
    double v12 = 50.0;
  }
  if (a5 == 1) {
    double v13 = 16.0;
  }
  else {
    double v13 = 20.0;
  }
  if (a5 == 1) {
    double v14 = 20.0;
  }
  else {
    double v14 = 30.0;
  }
  CGFloat v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *v8, 30.0, 20.0, 50.0, 16.0, 36.0);
  int v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v11];
  if (a4 > 0.0 && a4 < 1.0) {
    double v18 = a4;
  }
  else {
    double v18 = 0.65;
  }
  [v15 _scaledValueForValue:v14];
  double v20 = v19;
  [v16 _scaledValueForValue:v13];
  double v22 = v18 / (1.0 - v18) * v12 + v20 - v14 + v21 - v13;
  if (v22 >= a3) {
    double v22 = a3;
  }
  float v23 = v12 + v22;
  double v24 = ceilf(v23);

  return v24;
}

@end