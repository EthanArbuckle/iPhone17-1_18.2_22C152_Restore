@interface BKFlowingBookFontSizeConfiguration
+ (double)fontSizeFactorForViewportSize:(CGSize)a3 useOldFontStepsAndSpacing:(BOOL)a4;
- (BKFlowingBookFontSizeConfiguration)initWithViewController:(id)a3 configurationEnvironment:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFlowingBookFontSizeConfiguration:(id)a3;
- (double)largeSize;
- (double)largeSizeFactor;
- (double)mediumSize;
- (double)smallSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_reloadFontSizes;
- (void)setLargeSizeFactor:(double)a3;
- (void)viewSizeChanged;
@end

@implementation BKFlowingBookFontSizeConfiguration

- (BKFlowingBookFontSizeConfiguration)initWithViewController:(id)a3 configurationEnvironment:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKFlowingBookFontSizeConfiguration;
  v4 = [(BKFlowingBookFontSizeConfiguration *)&v7 initWithViewController:a3 configurationEnvironment:a4];
  v5 = v4;
  if (v4) {
    [(BKFlowingBookFontSizeConfiguration *)v4 viewSizeChanged];
  }
  return v5;
}

- (void)_reloadFontSizes
{
  v3 = +[NSUserDefaults standardUserDefaults];
  self->_useOldFontStepsAndSpacing = [v3 BOOLForKey:@"BKUseOldFontStepsAndSpacing"];

  self->_largeSizeFactor = 1.0;
  sizes = (float64x2_t *)self->_sizes;
  *(_OWORD *)self->_sizes = xmmword_18F020;
  self->_sizes[2] = 1.0;
  v5 = [(BKFlowingBookFontSizeConfiguration *)self environment];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  if (v7 >= kIMConfigurationSize_superPhone)
  {
    if (v7 <= kIMConfigurationSize_proMaxPhone)
    {
      float64x2_t *sizes = (float64x2_t)xmmword_18F030;
      double v11 = 2.2;
    }
    else
    {
      if (v7 >= 1366.0) {
        long long v10 = xmmword_18F040;
      }
      else {
        long long v10 = xmmword_18F050;
      }
      float64x2_t *sizes = (float64x2_t)v10;
      double v11 = 4.0;
    }
    self->_sizes[2] = v11;
  }
  else
  {
    float64x2_t *sizes = (float64x2_t)xmmword_18F030;
  }
  [objc_opt_class() fontSizeFactorForViewportSize:self->_useOldFontStepsAndSpacing useOldFontStepsAndSpacing:v7 v9];
  float64x2_t *sizes = vmulq_n_f64(*sizes, v12);
  self->_sizes[2] = v12 * self->_sizes[2];
  [(BKFlowingBookFontSizeConfiguration *)self largeSizeFactor];
  self->_sizes[2] = v13 * self->_sizes[2];
}

- (void)viewSizeChanged
{
}

+ (double)fontSizeFactorForViewportSize:(CGSize)a3 useOldFontStepsAndSpacing:(BOOL)a4
{
  if (a4)
  {
    double v4 = 1.0;
    if (a3.width >= 1366.0) {
      return 1.13;
    }
  }
  else if (a3.width >= 375.0)
  {
    double v4 = 1.0;
    if (a3.width >= 768.0) {
      return dbl_18F060[a3.width < 1024.0];
    }
  }
  else
  {
    return 0.96;
  }
  return v4;
}

- (double)smallSize
{
  return self->_sizes[0];
}

- (double)mediumSize
{
  return self->_sizes[1];
}

- (double)largeSize
{
  return self->_sizes[2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKFlowingBookFontSizeConfiguration;
  id v4 = [(BKFlowingBookFontSizeConfiguration *)&v7 copyWithZone:a3];
  if (v4)
  {
    [(BKFlowingBookFontSizeConfiguration *)self largeSizeFactor];
    [v4 setLargeSizeFactor:];
    double v5 = self->_sizes[2];
    *((_OWORD *)v4 + 1) = *(_OWORD *)self->_sizes;
    *((double *)v4 + 4) = v5;
  }
  return v4;
}

- (BOOL)isEqualToFlowingBookFontSizeConfiguration:(id)a3
{
  id v4 = a3;
  [(BKFlowingBookFontSizeConfiguration *)self largeSizeFactor];
  double v6 = v5;
  [v4 largeSizeFactor];
  BOOL v10 = v6 == v7
     && *(void *)&self->_sizes[0] == v4[2]
     && *(void *)&self->_sizes[1] == v4[3]
     && *(void *)&self->_sizes[2] == v4[4];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKFlowingBookFontSizeConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BKFlowingBookFontSizeConfiguration *)self isEqualToFlowingBookFontSizeConfiguration:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BKFlowingBookFontSizeConfiguration;
  v3 = [(BKFlowingBookFontSizeConfiguration *)&v7 description];
  [(BKFlowingBookFontSizeConfiguration *)self largeSizeFactor];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  BOOL v5 = +[NSString stringWithFormat:@"%@\nBKFlowingBookFontSizeConfiguration: largeSizeFactor:%@", v3, v4];

  return v5;
}

- (double)largeSizeFactor
{
  return self->_largeSizeFactor;
}

- (void)setLargeSizeFactor:(double)a3
{
  self->_largeSizeFactor = a3;
}

@end