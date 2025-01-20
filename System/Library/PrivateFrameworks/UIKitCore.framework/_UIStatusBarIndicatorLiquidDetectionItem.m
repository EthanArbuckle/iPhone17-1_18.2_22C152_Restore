@interface _UIStatusBarIndicatorLiquidDetectionItem
- (BOOL)isTemplateImage;
- (BOOL)useFullColorIndicator;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (void)setUseFullColorIndicator:(BOOL)a3;
@end

@implementation _UIStatusBarIndicatorLiquidDetectionItem

- (id)indicatorEntryKey
{
  return @"liquidDetectionEntry";
}

- (BOOL)isTemplateImage
{
  return ![(_UIStatusBarIndicatorLiquidDetectionItem *)self useFullColorIndicator];
}

- (id)systemImageNameForUpdate:(id)a3
{
  if ([(_UIStatusBarIndicatorLiquidDetectionItem *)self useFullColorIndicator]) {
    v3 = 0;
  }
  else {
    v3 = @"drop.triangle.fill";
  }
  return v3;
}

- (id)imageNameForUpdate:(id)a3
{
  return @"LiquidDetection";
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