@interface _NTKPigmentAddCell
+ (id)reuseIdentifier;
- (CLKDevice)device;
- (NTKPigmentEditOption)pigmentEditOption;
- (UIColor)primaryColor;
- (UIImageView)check;
- (UIImageView)swatch;
- (_NTKPigmentAddCell)initWithFrame:(CGRect)a3;
- (void)_updateCheck;
- (void)layoutSubviews;
- (void)setDevice:(id)a3;
- (void)setImage:(id)a3;
- (void)setPigmentEditOption:(id)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation _NTKPigmentAddCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKPigmentAddCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_NTKPigmentAddCell;
  v3 = -[_NTKPigmentAddCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    swatch = v3->_swatch;
    v3->_swatch = (UIImageView *)v4;

    [(_NTKPigmentAddCell *)v3 addSubview:v3->_swatch];
    uint64_t v6 = objc_opt_new();
    check = v3->_check;
    v3->_check = (UIImageView *)v6;

    v8 = BPSBackgroundColor();
    [(UIImageView *)v3->_check setTintColor:v8];

    [(UIImageView *)v3->_check setHidden:1];
    [(_NTKPigmentAddCell *)v3 addSubview:v3->_check];
  }
  return v3;
}

- (void)setDevice:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_device] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_device, a3);
    [(_NTKPigmentAddCell *)self _updateCheck];
  }
}

- (void)setPrimaryColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_primaryColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryColor, a3);
    [(_NTKPigmentAddCell *)self _updateCheck];
  }
}

- (void)_updateCheck
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (_LayoutConstants_onceToken != -1) {
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_354);
  }
  v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:*(double *)&_LayoutConstants__constants_1_0];
  if (self->_primaryColor)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
    v10[0] = self->_primaryColor;
    id v5 = BPSBackgroundColor();
    v10[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    v7 = [v4 configurationWithPaletteColors:v6];

    uint64_t v8 = [v3 configurationByApplyingConfiguration:v7];

    v3 = (void *)v8;
  }
  v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill" withConfiguration:v3];
  [(UIImageView *)self->_check setImage:v9];
  [(UIImageView *)self->_check sizeToFit];
  [(_NTKPigmentAddCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_NTKPigmentAddCell;
  [(_NTKPigmentAddCell *)&v3 layoutSubviews];
  [(_NTKPigmentAddCell *)self bounds];
  -[UIImageView setFrame:](self->_swatch, "setFrame:");
  [(UIImageView *)self->_check frame];
  UIRectCenteredRect();
  -[UIImageView setFrame:](self->_check, "setFrame:");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_NTKPigmentAddCell;
  -[_NTKPigmentAddCell setSelected:](&v5, sel_setSelected_);
  [(UIImageView *)self->_check setHidden:!v3];
}

- (void)setImage:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (NTKPigmentEditOption)pigmentEditOption
{
  return self->_pigmentEditOption;
}

- (void)setPigmentEditOption:(id)a3
{
}

- (UIImageView)swatch
{
  return self->_swatch;
}

- (UIImageView)check
{
  return self->_check;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_check, 0);
  objc_storeStrong((id *)&self->_swatch, 0);
  objc_storeStrong((id *)&self->_pigmentEditOption, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end