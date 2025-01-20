@interface PREditorColorPickerCustomColor
- (BOOL)isCustomColor;
- (BOOL)isVibrantColor;
- (NSString)localizedName;
- (PREditorColorPickerCustomColor)colorWithVariation:(double)a3;
- (PREditorColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4;
- (PREditorColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4 localizedName:(id)a5;
- (PRPosterColor)baseColor;
- (PRPosterColor)leftSliderColor;
- (PRPosterColor)rightSliderColor;
- (double)initialVariation;
- (id)colorProvider;
@end

@implementation PREditorColorPickerCustomColor

- (PREditorColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4
{
  return [(PREditorColorPickerCustomColor *)self initWithInitialVariation:a4 colorProvider:0 localizedName:a3];
}

- (PREditorColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4 localizedName:(id)a5
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

- (PRPosterColor)baseColor
{
  return (PRPosterColor *)[(PREditorColorPickerCustomColor *)self colorWithVariation:0.0];
}

- (PRPosterColor)leftSliderColor
{
  return (PRPosterColor *)[(PREditorColorPickerCustomColor *)self colorWithVariation:-1.0];
}

- (PRPosterColor)rightSliderColor
{
  return (PRPosterColor *)[(PREditorColorPickerCustomColor *)self colorWithVariation:1.0];
}

- (PREditorColorPickerCustomColor)colorWithVariation:(double)a3
{
  v4 = [(PREditorColorPickerCustomColor *)self colorProvider];
  v5 = v4[2](a3);
  v6 = [[PRPosterColor alloc] initWithColor:v5 preferredStyle:1];

  return (PREditorColorPickerCustomColor *)v6;
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