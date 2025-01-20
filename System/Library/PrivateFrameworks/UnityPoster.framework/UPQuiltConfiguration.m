@interface UPQuiltConfiguration
- (BOOL)isSnapshotConfiguration;
- (CGRect)timeBounds;
- (CGRect)viewport;
- (UPQuiltConfiguration)initWithRandomizationSeedValue:(unint64_t)a3 viewport:(CGRect)a4 timeBounds:(CGRect)a5 lineVariance:(double)a6;
- (UPSeededRandomizer)randomizer;
- (double)lineVariance;
- (unint64_t)randomizationSeedValue;
- (void)initRandomizer;
- (void)setIsSnapshotConfiguration:(BOOL)a3;
- (void)setLineVariance:(double)a3;
- (void)setRandomizationSeedValue:(unint64_t)a3;
- (void)setRandomizer:(id)a3;
- (void)setTimeBounds:(CGRect)a3;
- (void)setViewport:(CGRect)a3;
@end

@implementation UPQuiltConfiguration

- (UPQuiltConfiguration)initWithRandomizationSeedValue:(unint64_t)a3 viewport:(CGRect)a4 timeBounds:(CGRect)a5 lineVariance:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v10 = a4.size.height;
  double v11 = a4.size.width;
  double v12 = a4.origin.y;
  double v13 = a4.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)UPQuiltConfiguration;
  v15 = [(UPQuiltConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(UPQuiltConfiguration *)v15 setRandomizationSeedValue:a3];
    -[UPQuiltConfiguration setViewport:](v16, "setViewport:", v13, v12, v11, v10);
    -[UPQuiltConfiguration setTimeBounds:](v16, "setTimeBounds:", x, y, width, height);
    [(UPQuiltConfiguration *)v16 setLineVariance:a6];
    -[UPQuiltConfiguration initRandomizer](v16);
  }
  return v16;
}

- (void)initRandomizer
{
  if (a1)
  {
    v2 = [a1 randomizer];

    if (v2)
    {
      id v3 = [a1 randomizer];
      [v3 reset];
    }
    else
    {
      +[UPSeededRandomizer randomizerWithSeedValue:](UPSeededRandomizer, "randomizerWithSeedValue:", [a1 randomizationSeedValue]);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setRandomizer:");
    }
  }
}

- (unint64_t)randomizationSeedValue
{
  return self->_randomizationSeedValue;
}

- (void)setRandomizationSeedValue:(unint64_t)a3
{
  self->_randomizationSeedValue = a3;
}

- (UPSeededRandomizer)randomizer
{
  return self->_randomizer;
}

- (void)setRandomizer:(id)a3
{
}

- (CGRect)viewport
{
  double x = self->_viewport.origin.x;
  double y = self->_viewport.origin.y;
  double width = self->_viewport.size.width;
  double height = self->_viewport.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setViewport:(CGRect)a3
{
  self->_viewport = a3;
}

- (CGRect)timeBounds
{
  double x = self->_timeBounds.origin.x;
  double y = self->_timeBounds.origin.y;
  double width = self->_timeBounds.size.width;
  double height = self->_timeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTimeBounds:(CGRect)a3
{
  self->_timeBounds = a3;
}

- (double)lineVariance
{
  return self->_lineVariance;
}

- (void)setLineVariance:(double)a3
{
  self->_lineVariance = a3;
}

- (BOOL)isSnapshotConfiguration
{
  return self->_isSnapshotConfiguration;
}

- (void)setIsSnapshotConfiguration:(BOOL)a3
{
  self->_isSnapshotConfiguration = a3;
}

- (void).cxx_destruct
{
}

@end