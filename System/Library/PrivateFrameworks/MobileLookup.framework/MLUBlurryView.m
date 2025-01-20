@interface MLUBlurryView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)shouldRasterizeForTransition;
- (double)blurRadius;
- (void)_activateBlurring;
- (void)setBlurRadius:(double)a3;
- (void)setShouldRasterizeForTransition:(BOOL)a3;
@end

@implementation MLUBlurryView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MLUBlurryView;
  if ([(MLUBlurryView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"] & 1) != 0
    || ([v4 isEqualToString:@"path"] & 1) != 0
    || ([v4 isEqualToString:@"cornerRadius"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"mask.path"];
  }

  return v5;
}

- (void)_activateBlurring
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F157C8]);
  id v4 = (void *)[v3 initWithType:*MEMORY[0x263F15BC8]];
  [v4 setValue:&unk_26DEAE108 forKey:*MEMORY[0x263F00980]];
  [v4 setValue:@"low" forKey:@"inputQuality"];
  [v4 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
  [v4 setName:@"gaussianBlur"];
  [(MLUBlurryView *)self setShouldRasterizeForTransition:1];
  v7[0] = v4;
  char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v6 = [(MLUBlurryView *)self layer];
  [v6 setFilters:v5];
}

- (double)blurRadius
{
  if (!self->_hasActivated) {
    return 0.0;
  }
  v2 = [(MLUBlurryView *)self layer];
  id v3 = [v2 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void)setBlurRadius:(double)a3
{
  if (!self->_hasActivated) {
    [(MLUBlurryView *)self _activateBlurring];
  }
  id v6 = [(MLUBlurryView *)self layer];
  double v5 = [NSNumber numberWithDouble:a3];
  [v6 setValue:v5 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)setShouldRasterizeForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldRasterizeForTransition = a3;
  double v5 = [(MLUBlurryView *)self layer];
  [v5 setShouldRasterize:v3];

  id v6 = [(MLUBlurryView *)self window];
  objc_super v7 = [v6 screen];
  [v7 scale];
  double v9 = v8;

  if (v9 >= 3.0) {
    double v9 = v9 * 0.5;
  }
  id v10 = [(MLUBlurryView *)self layer];
  [v10 setRasterizationScale:v9];
}

- (BOOL)shouldRasterizeForTransition
{
  return self->_shouldRasterizeForTransition;
}

@end