@interface STUIStatusBarIndicatorLiquidDetectionItem
- (BOOL)useFullColorIndicator;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (void)setUseFullColorIndicator:(BOOL)a3;
@end

@implementation STUIStatusBarIndicatorLiquidDetectionItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9778];
}

- (id)systemImageNameForUpdate:(id)a3
{
  if ([(STUIStatusBarIndicatorLiquidDetectionItem *)self useFullColorIndicator]) {
    v3 = 0;
  }
  else {
    v3 = @"drop.triangle.fill";
  }
  return v3;
}

- (BOOL)useFullColorIndicator
{
  return self->_useFullColorIndicator;
}

- (void)setUseFullColorIndicator:(BOOL)a3
{
  self->_useFullColorIndicator = a3;
}

@end