@interface PREditingColorItem
+ (id)_legibleIconColorForBackgroundColor:(id)a3;
+ (id)suggestedColorItemWithColor:(id)a3 context:(unint64_t)a4;
+ (id)vibrantMaterialItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromUIKitColorPicker;
- (BOOL)pickerRespondsToDisplayColorSelector;
- (BOOL)shouldShowSlider;
- (NSString)localizedName;
- (PREditingColorItem)initWithPickerColor:(id)a3 variation:(double)a4 context:(unint64_t)a5;
- (PREditorColorPickerColor)pickerColor;
- (PRPosterColor)baseColor;
- (PRPosterColor)color;
- (PRPosterColor)displayColor;
- (UIView)itemView;
- (double)variation;
- (id)description;
- (unint64_t)context;
- (void)setContext:(unint64_t)a3;
- (void)setFromUIKitColorPicker:(BOOL)a3;
- (void)setItemView:(id)a3;
- (void)setShowsSlider:(BOOL)a3;
- (void)setVariation:(double)a3;
@end

@implementation PREditingColorItem

+ (id)vibrantMaterialItem
{
  v2 = [PREditorColorPickerConstantColor alloc];
  v3 = +[PRPosterColor vibrantMaterialColor];
  v4 = [(PREditorColorPickerConstantColor *)v2 initWithColor:v3 initialVariation:0.0];

  v5 = [[PREditingColorItem alloc] initWithPickerColor:v4 variation:1 context:0.0];
  [(PREditingColorItem *)v5 setShowsSlider:0];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
  v8 = [MEMORY[0x1E4FB1818] imageNamed:@"material" inBundle:v6 compatibleWithTraitCollection:0];
  v9 = (void *)[v7 initWithImage:v8];

  [v9 setContentMode:1];
  [(PREditingColorItem *)v5 setItemView:v9];

  return v5;
}

+ (id)suggestedColorItemWithColor:(id)a3 context:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  v8 = off_1E54D9E70;
  if (a4 != 1) {
    v8 = off_1E54D9E68;
  }
  v9 = (void *)[objc_alloc(*v8) initWithColor:v6 initialVariation:v7];
  v10 = [[PREditingColorItem alloc] initWithPickerColor:v9 variation:0 context:v7];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 30.0, 30.0);
  v12 = [v6 color];
  [v11 setBackgroundColor:v12];

  id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
  v14 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"sparkles"];
  v15 = (void *)[v13 initWithImage:v14];

  v16 = [v6 color];
  v17 = [a1 _legibleIconColorForBackgroundColor:v16];
  [v15 setTintColor:v17];

  [v11 bounds];
  CGRect v21 = CGRectInset(v20, 6.0, 6.0);
  objc_msgSend(v15, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  [v15 setContentMode:1];
  [v11 addSubview:v15];
  [v15 setAutoresizingMask:18];
  [(PREditingColorItem *)v10 setItemView:v11];

  return v10;
}

- (PREditingColorItem)initWithPickerColor:(id)a3 variation:(double)a4 context:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PREditingColorItem;
  v10 = [(PREditingColorItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pickerColor, a3);
    v11->_pickerRespondsToDisplayColorSelector = objc_opt_respondsToSelector() & 1;
    v11->_variation = a4;
    v11->_showsSlider = 1;
    v11->_context = a5;
  }

  return v11;
}

- (PRPosterColor)baseColor
{
  v2 = [(PREditingColorItem *)self pickerColor];
  v3 = [v2 baseColor];

  return (PRPosterColor *)v3;
}

- (NSString)localizedName
{
  v2 = [(PREditingColorItem *)self pickerColor];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (PRPosterColor)color
{
  v3 = [(PREditingColorItem *)self pickerColor];
  v4 = [v3 colorWithVariation:self->_variation];

  return (PRPosterColor *)v4;
}

- (PRPosterColor)displayColor
{
  BOOL pickerRespondsToDisplayColorSelector = self->_pickerRespondsToDisplayColorSelector;
  v4 = [(PREditingColorItem *)self pickerColor];
  v5 = v4;
  double variation = self->_variation;
  if (pickerRespondsToDisplayColorSelector) {
    [v4 displayColorWithVariation:variation];
  }
  else {
  double v7 = [v4 colorWithVariation:variation];
  }

  return (PRPosterColor *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREditingColorItem *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PREditingColorItem *)self baseColor];
      double v7 = [(PREditingColorItem *)v5 baseColor];
      if (BSEqualObjects())
      {
        [(PREditingColorItem *)self variation];
        double v9 = v8;
        [(PREditingColorItem *)v5 variation];
        BOOL v11 = v9 == v10;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PREditingColorItem *)self baseColor];
  [(PREditingColorItem *)self variation];
  id v6 = [v3 stringWithFormat:@"<PREditingColorItem: %p> Base Color: %@ Variation: %.5f", self, v4, v5];

  return v6;
}

+ (id)_legibleIconColorForBackgroundColor:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  double v8 = 0.0;
  v3 = [a3 colorWithAlphaComponent:1.0];
  int v4 = [v3 getHue:&v10 saturation:&v9 brightness:&v8 alpha:0];

  if (v4 && (double v5 = v8, v8 >= 0.9))
  {
    id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", v8);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", v5);
  }
  return v6;
}

- (BOOL)isFromUIKitColorPicker
{
  return self->_fromUIKitColorPicker;
}

- (void)setFromUIKitColorPicker:(BOOL)a3
{
  self->_fromUIKitColorPicker = a3;
}

- (BOOL)shouldShowSlider
{
  return self->_showsSlider;
}

- (void)setShowsSlider:(BOOL)a3
{
  self->_showsSlider = a3;
}

- (PREditorColorPickerColor)pickerColor
{
  return self->_pickerColor;
}

- (double)variation
{
  return self->_variation;
}

- (void)setVariation:(double)a3
{
  self->_double variation = a3;
}

- (UIView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)pickerRespondsToDisplayColorSelector
{
  return self->_pickerRespondsToDisplayColorSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_pickerColor, 0);
}

@end