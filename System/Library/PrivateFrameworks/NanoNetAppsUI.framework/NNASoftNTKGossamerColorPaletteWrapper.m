@interface NNASoftNTKGossamerColorPaletteWrapper
+ (id)sharedPalette;
- (NNASoftNTKGossamerColorPaletteWrapper)init;
- (id)getSolarColorsForLocation:(id)a3 atDate:(id)a4;
- (void)assertColor:(id)a3 closeTo:(id)a4;
@end

@implementation NNASoftNTKGossamerColorPaletteWrapper

+ (id)sharedPalette
{
  if (sharedPalette_onceToken != -1) {
    dispatch_once(&sharedPalette_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedPalette_wrapper;
  return v2;
}

uint64_t __54__NNASoftNTKGossamerColorPaletteWrapper_sharedPalette__block_invoke()
{
  sharedPalette_wrapper = objc_alloc_init(NNASoftNTKGossamerColorPaletteWrapper);
  return MEMORY[0x270F9A758]();
}

- (NNASoftNTKGossamerColorPaletteWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)NNASoftNTKGossamerColorPaletteWrapper;
  v2 = [(NNASoftNTKGossamerColorPaletteWrapper *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SGColorPalette);
    colorPalette = v2->_colorPalette;
    v2->_colorPalette = v3;
  }
  return v2;
}

- (void)assertColor:(id)a3 closeTo:(id)a4
{
  double v14 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  double v7 = 0.0;
  id v6 = a4;
  [a3 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
  [v6 getRed:&v10 green:&v9 blue:&v8 alpha:&v7];

  [(NNASoftNTKGossamerColorPaletteWrapper *)self assertDouble:v14 closeTo:v10];
  [(NNASoftNTKGossamerColorPaletteWrapper *)self assertDouble:v13 closeTo:v9];
  [(NNASoftNTKGossamerColorPaletteWrapper *)self assertDouble:v12 closeTo:v8];
  [(NNASoftNTKGossamerColorPaletteWrapper *)self assertDouble:v11 closeTo:v7];
}

- (id)getSolarColorsForLocation:(id)a3 atDate:(id)a4
{
  return [(SGColorPalette *)self->_colorPalette getSolarColorsForLocation:a3 atDate:a4];
}

- (void).cxx_destruct
{
}

@end