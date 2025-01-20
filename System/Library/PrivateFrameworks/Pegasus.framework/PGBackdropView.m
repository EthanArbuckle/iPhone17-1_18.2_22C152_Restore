@interface PGBackdropView
+ (Class)layerClass;
- (NSString)groupName;
- (PGBackdropView)initWithFrame:(CGRect)a3;
- (double)backdropScale;
- (double)gaussianBlurRadius;
- (void)_updateFilters;
- (void)dealloc;
- (void)setBackdropScale:(double)a3;
- (void)setGaussianBlurRadius:(double)a3;
- (void)setGroupName:(id)a3;
@end

@implementation PGBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (PGBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v17.receiver = self;
  v17.super_class = (Class)PGBackdropView;
  v9 = -[PGBackdropView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    [(__PGView *)v9 setAnimatedLayerProperties:&unk_1F0E5D808];
    v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v11 setName:@"gaussianBlur"];
    [v11 setValue:&unk_1F0E5D7E0 forKey:@"inputRadius"];
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    [v11 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    [v11 setValue:v12 forKey:@"inputHardEdges"];
    gaussianBlurFilter = v10->_gaussianBlurFilter;
    v10->_gaussianBlurFilter = (CAFilter *)v11;
    id v14 = v11;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel__updateFilters name:*MEMORY[0x1E4F43480] object:0];

    [(PGBackdropView *)v10 _updateFilters];
  }
  return v10;
}

- (void)dealloc
{
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PGBackdropView;
  [(PGBackdropView *)&v5 dealloc];
}

- (void)_updateFilters
{
  id v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_gaussianBlurFilter];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    averageColorFilter = self->_averageColorFilter;
    if (!averageColorFilter)
    {
      v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F39FD0]];
      objc_super v5 = self->_averageColorFilter;
      self->_averageColorFilter = v4;

      averageColorFilter = self->_averageColorFilter;
    }
    [v10 addObject:averageColorFilter];
  }
  gaussianBlurFilter = self->_gaussianBlurFilter;
  v7 = NSNumber;
  [(PGBackdropView *)self gaussianBlurRadius];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [(CAFilter *)gaussianBlurFilter setValue:v8 forKey:@"inputRadius"];

  v9 = [(PGBackdropView *)self layer];
  [v9 setFilters:v10];
}

- (NSString)groupName
{
  v2 = [(PGBackdropView *)self layer];
  v3 = [v2 groupName];

  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v5 = [(PGBackdropView *)self layer];
  [v5 setGroupName:v4];
}

- (double)gaussianBlurRadius
{
  v2 = [(PGBackdropView *)self layer];
  v3 = [v2 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setGaussianBlurRadius:(double)a3
{
  id v5 = [(PGBackdropView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (double)backdropScale
{
  v2 = [(PGBackdropView *)self layer];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (void)setBackdropScale:(double)a3
{
  id v4 = [(PGBackdropView *)self layer];
  [v4 setScale:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColorFilter, 0);

  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
}

@end