@interface SSBlurView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (SSBlurView)initWithFrame:(CGRect)a3;
- (double)blurRadius;
- (double)scale;
- (void)setBlurRadius:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation SSBlurView

- (SSBlurView)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)SSBlurView;
  v3 = -[SSBlurView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = objc_alloc(MEMORY[0x263F157C8]);
  v5 = (void *)[v4 initWithType:*MEMORY[0x263F15BC8]];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [v5 setValue:MEMORY[0x263EFFA88] forKey:@"inputHardEdges"];
  [v5 setValue:v6 forKey:@"inputNormalizeEdges"];
  [v5 setValue:&unk_26D05B838 forKey:@"inputRadius"];
  [v5 setValue:@"low" forKey:@"inputQuality"];
  [v5 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
  [v5 setName:@"gaussianBlur"];
  v7 = [(SSBlurView *)v3 layer];
  v11[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v7 setFilters:v8];

  [(SSBlurView *)v3 setScale:1.0];
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SSBlurView;
  if ([(SSBlurView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"scale"];
  }

  return v5;
}

- (void)setScale:(double)a3
{
  id v4 = [(SSBlurView *)self _backdropLayer];
  [v4 setScale:a3];
}

- (double)scale
{
  v2 = [(SSBlurView *)self _backdropLayer];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(SSBlurView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (double)blurRadius
{
  v2 = [(SSBlurView *)self layer];
  double v3 = [v2 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

@end