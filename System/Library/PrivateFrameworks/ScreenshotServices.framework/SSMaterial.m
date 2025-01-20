@interface SSMaterial
+ (id)cropHandle;
+ (id)vellumOpacitySliderTrack;
+ (id)vellumOpacitySliderValueImage;
- (CAFilter)filter;
- (UIColor)color;
- (double)colorAlpha;
- (id)_initWithFilterType:(id)a3 color:(id)a4;
- (void)applyToView:(id)a3;
@end

@implementation SSMaterial

- (id)_initWithFilterType:(id)a3 color:(id)a4
{
  v6 = (UIColor *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SSMaterial;
  id v7 = a3;
  v8 = [(SSMaterial *)&v13 init];
  uint64_t v9 = objc_msgSend(MEMORY[0x263F157C8], "filterWithType:", v7, v13.receiver, v13.super_class);

  filter = v8->_filter;
  v8->_filter = (CAFilter *)v9;

  color = v8->_color;
  v8->_color = v6;

  return v8;
}

- (CAFilter)filter
{
  return self->_filter;
}

- (UIColor)color
{
  return self->_color;
}

- (double)colorAlpha
{
  double v4 = 0.0;
  v2 = [(SSMaterial *)self color];
  [v2 getRed:0 green:0 blue:0 alpha:&v4];

  return v4;
}

+ (id)vellumOpacitySliderValueImage
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 _initWithFilterType:*MEMORY[0x263F15CD8] color:0];
  return v3;
}

+ (id)vellumOpacitySliderTrack
{
  id v2 = objc_alloc((Class)a1);
  uint64_t v3 = *MEMORY[0x263F15D58];
  double v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
  v5 = (void *)[v2 _initWithFilterType:v3 color:v4];

  return v5;
}

+ (id)cropHandle
{
  id v2 = objc_alloc((Class)a1);
  uint64_t v3 = *MEMORY[0x263F15D58];
  double v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.82];
  v5 = (void *)[v2 _initWithFilterType:v3 color:v4];

  return v5;
}

- (void)applyToView:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_color)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    color = self->_color;
    if (isKindOfClass) {
      [v4 setTintColor:color];
    }
    else {
      [v4 setBackgroundColor:color];
    }
  }
  id v7 = [v4 layer];
  v9[0] = self->_filter;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v7 setCompositingFilter:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end