@interface PUIColorStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isSimilarToColorStatistics:(id)a3;
- (PUIColorStatistics)initWithAverageColor:(id)a3;
- (PUIColorStatistics)initWithAverageColor:(id)a3 contrast:(double)a4;
- (PUIColorStatistics)initWithCoder:(id)a3;
- (PUIColorStatistics)initWithDelegate:(id)a3;
- (PUIColorStatisticsDelegate)delegate;
- (UIColor)averageColor;
- (_UILegibilitySettings)legibilitySettings;
- (double)averageContrast;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)resetWithColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateWithAverageColor:(id)a3 contrast:(double)a4;
- (void)updateWithColorBoxes:(id)a3;
@end

@implementation PUIColorStatistics

- (_UILegibilitySettings)legibilitySettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(_UILegibilitySettingsProvider *)self->_legibilityProvider settings];
  os_unfair_lock_unlock(p_lock);
  return (_UILegibilitySettings *)v4;
}

- (PUIColorStatistics)initWithAverageColor:(id)a3 contrast:(double)a4
{
  id v6 = a3;
  v7 = [(PUIColorStatistics *)self initWithDelegate:0];
  v8 = v7;
  if (v7) {
    [(PUIColorStatistics *)v7 updateWithAverageColor:v6 contrast:a4];
  }

  return v8;
}

- (PUIColorStatistics)initWithAverageColor:(id)a3
{
  id v4 = a3;
  v5 = [(PUIColorStatistics *)self initWithDelegate:0];
  id v6 = v5;
  if (v5) {
    [(PUIColorStatistics *)v5 resetWithColor:v4];
  }

  return v6;
}

- (PUIColorStatistics)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUIColorStatistics;
  v5 = [(PUIColorStatistics *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x263F1C550] systemGrayColor];
    averageColor = v6->_averageColor;
    v6->_averageColor = (UIColor *)v7;

    [(UIColor *)v6->_averageColor _luminance];
    v6->_averageContrast = v9;
    v10 = (_UILegibilitySettingsProvider *)objc_alloc_init(MEMORY[0x263F1CCD8]);
    legibilityProvider = v6->_legibilityProvider;
    v6->_legibilityProvider = v10;

    [(_UILegibilitySettingsProvider *)v6->_legibilityProvider accumulateChangesToContentColor:v6->_averageColor];
  }

  return v6;
}

- (UIColor)averageColor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_averageColor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)averageContrast
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double averageContrast = self->_averageContrast;
  os_unfair_lock_unlock(p_lock);
  return averageContrast;
}

- (void)resetWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 colorWithAlphaComponent:1.0];
  [v5 _luminance];
  -[PUIColorStatistics updateWithAverageColor:contrast:](self, "updateWithAverageColor:contrast:", v4);
}

- (void)updateWithAverageColor:(id)a3 contrast:(double)a4
{
  id v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = self->_averageColor;
  objc_storeStrong((id *)&self->_averageColor, a3);
  self->_double averageContrast = a4;
  [(_UILegibilitySettingsProvider *)self->_legibilityProvider clearContentColorAccumulator];
  [(_UILegibilitySettingsProvider *)self->_legibilityProvider accumulateChangesToContentColor:self->_averageColor contrast:self->_averageContrast];
  os_unfair_lock_unlock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    char v10 = [(UIColor *)v7 _isSimilarToColor:v12 withinPercentage:0.00000011920929];

    if ((v10 & 1) == 0)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 colorStatisticsDidChange:self];
    }
  }
}

- (void)updateWithColorBoxes:(id)a3
{
  CGFloat v4 = *MEMORY[0x263F00190];
  CGFloat v5 = *(double *)(MEMORY[0x263F00190] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x263F00190] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x263F00190] + 24);
  id v8 = a3;
  double v9 = PUIAverageColorFromColorBoxes(v8, v4, v5, v6, v7, 0.0);
  double v10 = -1.0;
  PUICalculateContrastFromColorBoxes(v8, 0, &v10, v4, v5, v6, v7);

  [(PUIColorStatistics *)self updateWithAverageColor:v9 contrast:v10];
}

- (BOOL)isSimilarToColorStatistics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CGFloat v5 = [(PUIColorStatistics *)self averageColor];
    CGFloat v6 = [v4 averageColor];
    if ([v5 _isSimilarToColor:v6 withinPercentage:0.00000011920929])
    {
      [(PUIColorStatistics *)self averageContrast];
      double v8 = v7;
      [v4 averageContrast];
      BOOL v10 = vabdd_f64(v8, v9) <= 0.00000011920929;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)invalidate
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PUIColorStatistics alloc];
  averageColor = self->_averageColor;
  double averageContrast = self->_averageContrast;
  return [(PUIColorStatistics *)v4 initWithAverageColor:averageColor contrast:averageContrast];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(PUIColorStatistics *)self averageColor];
  CGFloat v5 = [v4 BSColor];
  [v6 encodeObject:v5 forKey:@"averageColor"];

  [(PUIColorStatistics *)self averageContrast];
  objc_msgSend(v6, "encodeDouble:forKey:", @"averageContrast");
}

- (PUIColorStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"averageContrast"];
  double v6 = v5;
  double v7 = self;
  double v8 = [v4 decodeObjectOfClass:v7 forKey:@"averageColor"];

  double v9 = [v8 UIColor];
  BOOL v10 = [(PUIColorStatistics *)self initWithAverageColor:v9 contrast:v6];

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(PUIColorStatistics *)self averageColor];
  [(PUIColorStatistics *)self averageContrast];
  double v8 = [v3 stringWithFormat:@"<%@: %p; color: %@; contrast: %.2f>", v5, self, v6, v7];

  return v8;
}

- (PUIColorStatisticsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIColorStatisticsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColor, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end