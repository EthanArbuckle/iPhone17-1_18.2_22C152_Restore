@interface PNPSqueezeThresholdSliderCell
+ (id)opaqueTouchSenderDescriptor;
- (BOOL)isExtendedRange;
- (id)pencilSqueezeThreshold;
- (id)squeezeThresholdToThreshold:(id)a3;
- (id)thresholdToSqueezeThreshold:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setPencilSqueezeThreshold:(id)a3;
@end

@implementation PNPSqueezeThresholdSliderCell

+ (id)opaqueTouchSenderDescriptor
{
  return (id)[MEMORY[0x263F29868] build:&__block_literal_global];
}

uint64_t __60__PNPSqueezeThresholdSliderCell_opaqueTouchSenderDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:65376 primaryUsage:4096];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4 = (char *)a3;
  [v4 setTarget:self];
  *(void *)&v4[*MEMORY[0x263F5FE38]] = sel_setPencilSqueezeThreshold_;
  *(void *)&v4[*MEMORY[0x263F5FE28]] = sel_pencilSqueezeThreshold;
  v5 = [v4 propertyForKey:@"extendedRange"];
  self->_isExtendedRange = [v5 BOOLValue];

  v6 = (const double *)&kExtendedRangeTickValues;
  if (self->_isExtendedRange)
  {
    int64_t v7 = 9;
  }
  else
  {
    int v8 = _AXSPencilExtendedSqueezeRangeEnabled();
    self->_isExtendedRange = v8 != 0;
    int64_t v7 = 5;
    if (v8) {
      int64_t v7 = 9;
    }
    else {
      v6 = (const double *)&kNormalTickValues;
    }
  }
  self->_numTicks = v7;
  self->_tickValues = v6;
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60238]];
  [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60260]];
  v9 = [NSNumber numberWithInteger:self->_numTicks - 1];
  [v4 setProperty:v9 forKey:*MEMORY[0x263F60258]];

  [v4 setProperty:&unk_26ECE76D8 forKey:*MEMORY[0x263F60038]];
  v10 = [NSNumber numberWithInteger:self->_numTicks - 1];
  [v4 setProperty:v10 forKey:*MEMORY[0x263F60030]];

  [v4 setProperty:&unk_26ECE76F0 forKey:*MEMORY[0x263F60068]];
  v11.receiver = self;
  v11.super_class = (Class)PNPSqueezeThresholdSliderCell;
  [(PSSliderTableCell *)&v11 refreshCellContentsWithSpecifier:v4];
}

- (id)thresholdToSqueezeThreshold:(id)a3
{
  if (self->_numTicks)
  {
    uint64_t v4 = [a3 unsignedIntegerValue];
    uint64_t v5 = self->_numTicks - 1;
    if (v5 >= (v4 & ~(v4 >> 63))) {
      uint64_t v5 = v4 & ~(v4 >> 63);
    }
    v6 = NSNumber;
    double v7 = self->_tickValues[v5];
  }
  else
  {
    int v8 = NSNumber;
    +[PNPSqueezeThresholdController defaultThreshold];
    v6 = v8;
  }
  v9 = [v6 numberWithDouble:v7];
  return v9;
}

- (id)squeezeThresholdToThreshold:(id)a3
{
  if (self->_numTicks)
  {
    [a3 doubleValue];
    int64_t numTicks = self->_numTicks;
    if (numTicks < 2)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      tickValues = self->_tickValues;
      double v8 = *tickValues - v4;
      if (v8 < 0.0) {
        double v8 = -v8;
      }
      for (uint64_t i = 1; i != numTicks; ++i)
      {
        double v10 = tickValues[i] - v4;
        if (v10 < 0.0) {
          double v10 = -v10;
        }
        if (v10 < v8)
        {
          double v8 = v10;
          uint64_t v6 = i;
        }
      }
    }
    objc_super v11 = [NSNumber numberWithInteger:v6];
  }
  else
  {
    objc_super v11 = 0;
  }
  return v11;
}

- (id)pencilSqueezeThreshold
{
  v3 = +[PNPSqueezeThresholdController sharedController];
  double v4 = [v3 squeezeThreshold];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PNPSqueezeThresholdSliderCell *)self squeezeThresholdToThreshold:v4];
  }
  else
  {
    uint64_t v6 = NSNumber;
    +[PNPSqueezeThresholdController defaultThreshold];
    double v7 = objc_msgSend(v6, "numberWithDouble:");
    uint64_t v5 = [(PNPSqueezeThresholdSliderCell *)self squeezeThresholdToThreshold:v7];
  }
  return v5;
}

- (void)setPencilSqueezeThreshold:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PNPSqueezeThresholdSliderCell *)self thresholdToSqueezeThreshold:v4];
  uint64_t v6 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2397CD000, v6, OS_LOG_TYPE_DEFAULT, "Setting squeze threshold: %@ (index: %@)", (uint8_t *)&v8, 0x16u);
  }

  double v7 = +[PNPSqueezeThresholdController sharedController];
  [v7 setSqueezeThreshold:v5];
}

- (BOOL)isExtendedRange
{
  return self->_isExtendedRange;
}

@end