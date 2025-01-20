@interface PUIStyleColorPickerCustomColor
- (BOOL)isCustomColor;
- (BOOL)isVibrantColor;
- (NSString)localizedName;
- (PUIStyleColor)baseColor;
- (PUIStyleColor)leftSliderColor;
- (PUIStyleColor)rightSliderColor;
- (PUIStyleColorPickerCustomColor)colorWithVariation:(double)a3;
- (PUIStyleColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4;
- (PUIStyleColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4 localizedName:(id)a5;
- (double)initialVariation;
- (id)colorProvider;
@end

@implementation PUIStyleColorPickerCustomColor

- (PUIStyleColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4
{
  return [(PUIStyleColorPickerCustomColor *)self initWithInitialVariation:a4 colorProvider:0 localizedName:a3];
}

- (PUIStyleColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4 localizedName:(id)a5
{
  if (self)
  {
    self->_initialVariation = a3;
    id v7 = a5;
    v8 = (void *)[a4 copy];
    id colorProvider = self->_colorProvider;
    self->_id colorProvider = v8;

    v10 = (NSString *)[v7 copy];
    localizedName = self->_localizedName;
    self->_localizedName = v10;
  }
  return self;
}

- (PUIStyleColor)baseColor
{
  return (PUIStyleColor *)[(PUIStyleColorPickerCustomColor *)self colorWithVariation:0.0];
}

- (PUIStyleColor)leftSliderColor
{
  return (PUIStyleColor *)[(PUIStyleColorPickerCustomColor *)self colorWithVariation:-1.0];
}

- (PUIStyleColor)rightSliderColor
{
  return (PUIStyleColor *)[(PUIStyleColorPickerCustomColor *)self colorWithVariation:1.0];
}

- (PUIStyleColorPickerCustomColor)colorWithVariation:(double)a3
{
  v4 = [(PUIStyleColorPickerCustomColor *)self colorProvider];
  v5 = v4[2](a3);
  v6 = [[PUIStyleColor alloc] initWithColor:v5 preferredStyle:1];

  return (PUIStyleColorPickerCustomColor *)v6;
}

- (BOOL)isCustomColor
{
  return 1;
}

- (BOOL)isVibrantColor
{
  return 0;
}

- (double)initialVariation
{
  return self->_initialVariation;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)colorProvider
{
  return self->_colorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorProvider, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end