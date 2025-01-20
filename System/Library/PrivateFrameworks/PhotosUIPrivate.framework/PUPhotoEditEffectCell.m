@interface PUPhotoEditEffectCell
+ (id)selectionOutlineImage;
- (NSString)name;
- (PUPhotoEditEffectCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (UIImageView)selectionView;
- (UILabel)nameLabel;
- (UIView)highlightView;
- (id)_colorForIsSelected:(BOOL)a3;
- (void)_setSubview:(id)a3 visible:(BOOL)a4 animated:(BOOL)a5;
- (void)prepareForReuse;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setName:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectionView:(id)a3;
- (void)updateConstraints;
@end

@implementation PUPhotoEditEffectCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_gapConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
}

- (void)setSelectionView:(id)a3
{
}

- (UIImageView)selectionView
{
  return self->_selectionView;
}

- (void)setHighlightView:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)image
{
  return self->_image;
}

- (void)_setSubview:(id)a3 visible:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = v7;
  if (v6) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  if (a5)
  {
    if (v6) {
      uint64_t v10 = 131078;
    }
    else {
      uint64_t v10 = 65542;
    }
    v11 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PUPhotoEditEffectCell__setSubview_visible_animated___block_invoke;
    v12[3] = &unk_1E5F2E0A8;
    id v13 = v7;
    double v14 = v9;
    [v11 animateWithDuration:v10 delay:v12 usingSpringWithDamping:0 initialSpringVelocity:0.3 options:0.0 animations:1.0 completion:v9];
  }
  else
  {
    [v7 setAlpha:v9];
  }
}

uint64_t __54__PUPhotoEditEffectCell__setSubview_visible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotoEditEffectCell *)self isHighlighted] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PUPhotoEditEffectCell;
    [(PUPhotoEditEffectCell *)&v6 setHighlighted:v3];
    v5 = [(PUPhotoEditEffectCell *)self highlightView];
    [(PUPhotoEditEffectCell *)self _setSubview:v5 visible:v3 animated:1];
  }
}

- (id)_colorForIsSelected:(BOOL)a3
{
  v4 = +[PUInterfaceManager currentTheme];
  v5 = v4;
  if (a3) {
    [v4 photoEditingActiveFilterTitleColor];
  }
  else {
  objc_super v6 = [v4 photoEditingInactiveFilterTitleColor];
  }

  return v6;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(PUPhotoEditEffectCell *)self isSelected] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PUPhotoEditEffectCell;
    [(PUPhotoEditEffectCell *)&v10 setSelected:v5];
    id v7 = [(PUPhotoEditEffectCell *)self _colorForIsSelected:v5];
    v8 = [(PUPhotoEditEffectCell *)self nameLabel];
    [v8 setTextColor:v7];

    double v9 = [(PUPhotoEditEffectCell *)self selectionView];
    [(PUPhotoEditEffectCell *)self _setSubview:v9 visible:v5 animated:v4];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setName:(id)a3
{
  if (self->_name != a3)
  {
    id v4 = a3;
    BOOL v5 = (NSString *)[v4 copy];
    name = self->_name;
    self->_name = v5;

    id v7 = [(PUPhotoEditEffectCell *)self nameLabel];
    [v7 setText:v4];
  }
}

- (void)setImage:(id)a3
{
  objc_super v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    BOOL v5 = [(PUPhotoEditEffectCell *)self imageView];
    [v5 setImage:v6];
  }
}

- (void)updateConstraints
{
  v37.receiver = self;
  v37.super_class = (Class)PUPhotoEditEffectCell;
  [(PUPhotoEditEffectCell *)&v37 updateConstraints];
  if (!self->_constraints)
  {
    BOOL v3 = [(PUPhotoEditEffectCell *)self contentView];
    id v4 = [(PUPhotoEditEffectCell *)self imageView];
    id v30 = objc_alloc(MEMORY[0x1E4F1C978]);
    v35 = [v3 widthAnchor];
    v36 = [(PUPhotoEditEffectCell *)self nameLabel];
    v33 = [v36 widthAnchor];
    v28 = [v35 constraintEqualToAnchor:v33];
    v34 = v3;
    v32 = [v3 widthAnchor];
    v31 = [v4 widthAnchor];
    BOOL v5 = [v32 constraintEqualToAnchor:v31];
    v29 = [v3 topAnchor];
    objc_super v6 = [v4 topAnchor];
    id v7 = [v29 constraintEqualToAnchor:v6];
    v8 = [v4 widthAnchor];
    double v9 = [v4 heightAnchor];
    objc_super v10 = [v8 constraintEqualToAnchor:v9 multiplier:1.0 constant:0.0];
    v11 = (NSArray *)objc_msgSend(v30, "initWithObjects:", v28, v5, v7, v10, 0);
    constraints = self->_constraints;
    self->_constraints = v11;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  }
  if (!self->_gapConstraint)
  {
    id v13 = [(PUPhotoEditEffectCell *)self nameLabel];
    double v14 = [v13 topAnchor];
    v15 = [(PUPhotoEditEffectCell *)self imageView];
    v16 = [v15 bottomAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:0.0];
    gapConstraint = self->_gapConstraint;
    self->_gapConstraint = v17;

    [(NSLayoutConstraint *)self->_gapConstraint setActive:1];
  }
  if (!self->_bottomLabelConstraint)
  {
    v19 = [(PUPhotoEditEffectCell *)self contentView];
    v20 = [v19 bottomAnchor];
    v21 = [(PUPhotoEditEffectCell *)self nameLabel];
    v22 = [v21 bottomAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    bottomLabelConstraint = self->_bottomLabelConstraint;
    self->_bottomLabelConstraint = v23;
  }
  v25 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v26 = [v25 orientation];

  if ((unint64_t)(v26 - 3) >= 2) {
    double v27 = 5.0;
  }
  else {
    double v27 = 0.0;
  }
  [(NSLayoutConstraint *)self->_bottomLabelConstraint setActive:(unint64_t)(v26 - 3) < 2];
  [(NSLayoutConstraint *)self->_gapConstraint setConstant:v27];
}

- (void)prepareForReuse
{
  [(PUPhotoEditEffectCell *)self setSelected:0 animated:0];
  [(PUPhotoEditEffectCell *)self setNeedsUpdateConstraints];
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditEffectCell;
  [(PUPhotoEditEffectCell *)&v3 prepareForReuse];
}

- (PUPhotoEditEffectCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PUPhotoEditEffectCell;
  objc_super v3 = -[PUPhotoEditEffectCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[PUInterfaceManager currentTheme];
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v6 = [(PUPhotoEditEffectCell *)v3 contentView];
    [v6 addSubview:v5];

    [(PUPhotoEditEffectCell *)v3 setImageView:v5];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v7 setNumberOfLines:2];
    [v7 setTextAlignment:1];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(PUPhotoEditEffectCell *)v3 _colorForIsSelected:0];
    [v7 setTextColor:v8];

    double v9 = +[PUInterfaceManager currentTheme];
    objc_super v10 = [v9 photoEditingFilterTitleFont];
    [v7 setFont:v10];

    [v7 setAdjustsFontSizeToFitWidth:0];
    [v7 setLineBreakMode:0];
    v11 = [(PUPhotoEditEffectCell *)v3 contentView];
    [v11 addSubview:v7];

    [(PUPhotoEditEffectCell *)v3 setNameLabel:v7];
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v5 bounds];
    id v13 = objc_msgSend(v12, "initWithFrame:");
    [v13 setAutoresizingMask:18];
    double v14 = [v4 photoEditingEffectCellHighlightBackgroundColor];
    [v13 setBackgroundColor:v14];

    [v5 addSubview:v13];
    [(PUPhotoEditEffectCell *)v3 setHighlightView:v13];
    id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
    [v5 bounds];
    v16 = objc_msgSend(v15, "initWithFrame:");
    [v16 setAutoresizingMask:18];
    v17 = [(id)objc_opt_class() selectionOutlineImage];
    [v16 setImage:v17];

    v18 = [(PUPhotoEditEffectCell *)v3 _colorForIsSelected:1];
    [v16 setTintColor:v18];

    [v5 addSubview:v16];
    [(PUPhotoEditEffectCell *)v3 setSelectionView:v16];
    [(PUPhotoEditEffectCell *)v3 _setSubview:v13 visible:0 animated:0];
    [(PUPhotoEditEffectCell *)v3 _setSubview:v16 visible:0 animated:0];
    [(PUPhotoEditEffectCell *)v3 setNeedsUpdateConstraints];
  }
  return v3;
}

+ (id)selectionOutlineImage
{
  if (PUFiltersCellSelectionOutlineImage)
  {
    id v2 = (id)PUFiltersCellSelectionOutlineImage;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    CGFloat v5 = v4;
    v15.width = 7.0;
    v15.height = 7.0;
    UIGraphicsBeginImageContextWithOptions(v15, 0, v5);

    CurrentContext = UIGraphicsGetCurrentContext();
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    [v7 setStroke];

    CGContextSetLineWidth(CurrentContext, 3.0);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = 7.0;
    v16.size.height = 7.0;
    CGRect v17 = CGRectInset(v16, 1.5, 1.5);
    CGContextStrokeRectWithWidth(CurrentContext, v17, 3.0);
    v8 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    double v9 = objc_msgSend(v8, "resizableImageWithCapInsets:", 3.0, 3.0, 3.0, 3.0);

    objc_super v10 = [v9 imageWithRenderingMode:2];

    v11 = (void *)PUFiltersCellSelectionOutlineImage;
    PUFiltersCellSelectionOutlineImage = (uint64_t)v10;
    id v12 = v10;

    id v2 = (id)PUFiltersCellSelectionOutlineImage;
  }
  return v2;
}

@end