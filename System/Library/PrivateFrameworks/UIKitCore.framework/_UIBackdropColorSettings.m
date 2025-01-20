@interface _UIBackdropColorSettings
- (BOOL)applyCABackdropLayerStatistics:(id)a3;
- (BOOL)hasObservedValues;
- (UIColor)color;
- (_UIBackdropViewSettings)parentSettings;
- (double)averageBrightness;
- (double)averageHue;
- (double)averageSaturation;
- (double)contrast;
- (void)setDefaultValues;
- (void)setHasObservedValues:(BOOL)a3;
- (void)setParentSettings:(id)a3;
@end

@implementation _UIBackdropColorSettings

- (void)setParentSettings:(id)a3
{
  self->_parentSettings = (_UIBackdropViewSettings *)a3;
}

- (double)averageBrightness
{
  return 0.5;
}

- (double)contrast
{
  return 0.0;
}

- (double)averageSaturation
{
  return 0.0;
}

- (void)setDefaultValues
{
  self->_hasObservedValues = 0;
}

- (double)averageHue
{
  return 0.0;
}

- (BOOL)applyCABackdropLayerStatistics:(id)a3
{
  return 0;
}

- (UIColor)color
{
  return +[UIColor colorWithWhite:0.5 alpha:1.0];
}

- (_UIBackdropViewSettings)parentSettings
{
  return self->_parentSettings;
}

- (BOOL)hasObservedValues
{
  return self->_hasObservedValues;
}

- (void)setHasObservedValues:(BOOL)a3
{
  self->_hasObservedValues = a3;
}

@end