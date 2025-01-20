@interface PUPhotoEditBaseAdjustmentCell
- (BOOL)imageIsColor;
- (BOOL)isEnabled;
- (BOOL)isUserModifying;
- (NSString)imageName;
- (PUPhotoEditAdjustmentControl)containerButton;
- (PUPhotoEditBaseAdjustmentCell)initWithCoder:(id)a3;
- (PUPhotoEditBaseAdjustmentCell)initWithFrame:(CGRect)a3;
- (double)defaultValue;
- (double)identityValue;
- (double)maxValue;
- (double)minValue;
- (double)value;
- (id)focusEffect;
- (id)imageTransformBlock;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_setupContainerButton;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)resetToDefault;
- (void)setContainerButton:(id)a3;
- (void)setDefaultValue:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentityValue:(double)a3;
- (void)setImageIsColor:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setImageTransformBlock:(id)a3;
- (void)setIsUserModifying:(BOOL)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setValue:(double)a3;
@end

@implementation PUPhotoEditBaseAdjustmentCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerButton, 0);
  objc_storeStrong(&self->_imageTransformBlock, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (void)setContainerButton:(id)a3
{
}

- (PUPhotoEditAdjustmentControl)containerButton
{
  return self->_containerButton;
}

- (void)setIsUserModifying:(BOOL)a3
{
  self->_isUserModifying = a3;
}

- (BOOL)isUserModifying
{
  return self->_isUserModifying;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setImageTransformBlock:(id)a3
{
}

- (id)imageTransformBlock
{
  return self->_imageTransformBlock;
}

- (void)setImageIsColor:(BOOL)a3
{
  self->_imageIsColor = a3;
}

- (BOOL)imageIsColor
{
  return self->_imageIsColor;
}

- (void)setImageName:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  v6 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v5];
  PXEdgeInsetsMake();
  [(PUPhotoEditBaseAdjustmentCell *)self frame];
  PXEdgeInsetsInsetRect();
  v7 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:");
  v8 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v7];

  return v8;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (void)resetToDefault
{
  [(PUPhotoEditBaseAdjustmentCell *)self defaultValue];
  -[PUPhotoEditBaseAdjustmentCell setValue:](self, "setValue:");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setSelected:](&v7, sel_setSelected_);
  v5 = +[PUPhotoEditProtoSettings sharedInstance];
  unsigned int v6 = [v5 alwaysShowValueWhenAdjustmentIsSelected];

  [(PUPhotoEditBaseAdjustmentCell *)self setIsUserModifying:v3 & v6];
}

- (double)maxValue
{
  v2 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 maxValue];
  double v4 = v3;

  return v4;
}

- (void)setMaxValue:(double)a3
{
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setMaxValue:a3];
}

- (double)minValue
{
  v2 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 minValue];
  double v4 = v3;

  return v4;
}

- (void)setMinValue:(double)a3
{
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setMinValue:a3];
}

- (double)identityValue
{
  v2 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 identityValue];
  double v4 = v3;

  return v4;
}

- (void)setIdentityValue:(double)a3
{
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setIdentityValue:a3];
}

- (double)defaultValue
{
  v2 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 defaultValue];
  double v4 = v3;

  return v4;
}

- (void)setDefaultValue:(double)a3
{
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setDefaultValue:a3];
}

- (double)value
{
  v2 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (void)setValue:(double)a3
{
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setValue:a3];
}

- (id)focusEffect
{
  return 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  [(PUPhotoEditBaseAdjustmentCell *)&v12 layoutSubviews];
  [(PUPhotoEditBaseAdjustmentCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  [(PUPhotoEditBaseAdjustmentCell *)&v5 prepareForReuse];
  double v3 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v3 resetToDefaults];

  double v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setUserInteractionEnabled:0];

  [(PUPhotoEditBaseAdjustmentCell *)self setIsUserModifying:0];
  [(PUPhotoEditBaseAdjustmentCell *)self setImageTransformBlock:0];
}

- (void)_setupContainerButton
{
  [(PUPhotoEditBaseAdjustmentCell *)self bounds];
  double v7 = -[PUPhotoEditAdjustmentControl initWithFrame:]([PUPhotoEditAdjustmentControl alloc], "initWithFrame:", v3, v4, v5, v6);
  containerButton = self->_containerButton;
  self->_containerButton = v7;

  [(PUPhotoEditAdjustmentControl *)self->_containerButton setUserInteractionEnabled:0];
  id v9 = [(PUPhotoEditBaseAdjustmentCell *)self contentView];
  [v9 addSubview:self->_containerButton];
}

- (PUPhotoEditBaseAdjustmentCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  double v3 = [(PUPhotoEditBaseAdjustmentCell *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    commonInit_41952(v3);
  }
  return v4;
}

- (PUPhotoEditBaseAdjustmentCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  double v3 = -[PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    commonInit_41952(v3);
  }
  return v4;
}

@end