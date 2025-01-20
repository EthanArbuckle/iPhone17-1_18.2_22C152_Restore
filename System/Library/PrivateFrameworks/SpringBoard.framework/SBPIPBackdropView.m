@interface SBPIPBackdropView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (NSString)groupName;
- (SBPIPBackdropView)initWithFrame:(CGRect)a3;
- (double)backdropScale;
- (double)gaussianBlurRadius;
- (void)_updateFilters;
- (void)dealloc;
- (void)setBackdropScale:(double)a3;
- (void)setGaussianBlurRadius:(double)a3;
- (void)setGroupName:(id)a3;
@end

@implementation SBPIPBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBPIPBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = SBLogPIP();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPBackdropView initWithFrame:]();
  }

  v18.receiver = self;
  v18.super_class = (Class)SBPIPBackdropView;
  v9 = -[SBPIPBackdropView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    animatedLayerProperties = v9->_animatedLayerProperties;
    v9->_animatedLayerProperties = (NSArray *)&unk_1F3347958;

    v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v12 setName:@"gaussianBlur"];
    [v12 setValue:&unk_1F3348AB8 forKey:@"inputRadius"];
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    [v12 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    [v12 setValue:v13 forKey:@"inputHardEdges"];
    gaussianBlurFilter = v10->_gaussianBlurFilter;
    v10->_gaussianBlurFilter = (CAFilter *)v12;
    id v15 = v12;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v10 selector:sel__updateFilters name:*MEMORY[0x1E4F43480] object:0];

    [(SBPIPBackdropView *)v10 _updateFilters];
  }
  return v10;
}

- (void)dealloc
{
  v3 = SBLogPIP();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPBackdropView initWithFrame:]();
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SBPIPBackdropView;
  [(SBPIPBackdropView *)&v5 dealloc];
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
  [(SBPIPBackdropView *)self gaussianBlurRadius];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [(CAFilter *)gaussianBlurFilter setValue:v8 forKey:@"inputRadius"];

  v9 = [(SBPIPBackdropView *)self layer];
  [v9 setFilters:v10];
}

- (NSString)groupName
{
  v2 = [(SBPIPBackdropView *)self layer];
  v3 = [v2 groupName];

  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v5 = [(SBPIPBackdropView *)self layer];
  [v5 setGroupName:v4];
}

- (double)gaussianBlurRadius
{
  v2 = [(SBPIPBackdropView *)self layer];
  v3 = [v2 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setGaussianBlurRadius:(double)a3
{
  id v5 = [(SBPIPBackdropView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (double)backdropScale
{
  v2 = [(SBPIPBackdropView *)self layer];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (void)setBackdropScale:(double)a3
{
  id v4 = [(SBPIPBackdropView *)self layer];
  [v4 setScale:a3];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_animatedLayerProperties containsObject:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBPIPBackdropView;
    BOOL v5 = [(SBPIPBackdropView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedLayerProperties, 0);
  objc_storeStrong((id *)&self->_averageColorFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
}

- (void)initWithFrame:.cold.1()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%@", v3, v4, v5, v6, 2u);
}

@end