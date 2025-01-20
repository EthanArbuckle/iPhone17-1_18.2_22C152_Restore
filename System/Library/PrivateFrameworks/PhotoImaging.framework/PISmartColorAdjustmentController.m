@interface PISmartColorAdjustmentController
+ (NSString)attributeCastKey;
+ (NSString)attributeContrastKey;
+ (NSString)attributeVibrancyKey;
+ (NSString)inputColorKey;
+ (NSString)offsetCastKey;
+ (NSString)offsetContrastKey;
+ (NSString)offsetSaturationKey;
+ (id)inputCastKey;
+ (id)inputContrastKey;
+ (id)inputSaturationKey;
+ (id)statisticsKey;
- (NSDictionary)statistics;
- (PISmartColorAdjustmentController)initWithAdjustment:(id)a3;
- (double)inputCast;
- (double)inputColor;
- (double)inputContrast;
- (double)inputSaturation;
- (double)offsetCast;
- (double)offsetContrast;
- (double)offsetSaturation;
- (id)computedSettings;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)_updateSettingsWithInputColor:(double)a3;
- (void)setInputCast:(double)a3;
- (void)setInputColor:(double)a3;
- (void)setInputContrast:(double)a3;
- (void)setInputSaturation:(double)a3;
- (void)setOffsetCast:(double)a3;
- (void)setOffsetContrast:(double)a3;
- (void)setOffsetSaturation:(double)a3;
- (void)setStatistics:(id)a3;
@end

@implementation PISmartColorAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v3 = +[PIAdjustmentController enabledKey];
  v4 = +[PISmartColorAdjustmentController inputColorKey];
  v10[1] = v4;
  v5 = +[PISmartColorAdjustmentController offsetSaturationKey];
  v10[2] = v5;
  v6 = +[PISmartColorAdjustmentController offsetContrastKey];
  v10[3] = v6;
  v7 = +[PISmartColorAdjustmentController offsetCastKey];
  v10[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

- (NSDictionary)statistics
{
  return (NSDictionary *)[(PIAdjustmentController *)self _primitiveValueForKey:@"statistics"];
}

- (void)setStatistics:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  [(PIAdjustmentController *)self _setPrimitiveValue:v5 forKey:@"statistics"];

  v6 = [v4 objectForKeyedSubscript:@"satPercentile75"];
  [v6 doubleValue];
  self->_stats.p75 = v7;

  v8 = [v4 objectForKeyedSubscript:@"satPercentile98"];
  [v8 doubleValue];
  self->_stats.p98 = v9;

  v10 = [v4 objectForKeyedSubscript:@"satPercentileG98"];

  [v10 doubleValue];
  self->_stats.g98 = v11;

  [(PISmartColorAdjustmentController *)self inputColor];
  -[PISmartColorAdjustmentController _updateSettingsWithInputColor:](self, "_updateSettingsWithInputColor:");
}

- (double)offsetSaturation
{
  v3 = +[PISmartColorAdjustmentController offsetSaturationKey];
  id v4 = [(PIAdjustmentController *)self _primitiveValueForKey:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)setOffsetSaturation:(double)a3
{
  [(PIAdjustmentController *)self setIsAuto:0];
  id v6 = [NSNumber numberWithDouble:a3];
  double v5 = +[PISmartColorAdjustmentController offsetSaturationKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v6 forKey:v5];
}

- (double)offsetContrast
{
  v3 = +[PISmartColorAdjustmentController offsetContrastKey];
  id v4 = [(PIAdjustmentController *)self _primitiveValueForKey:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)setOffsetContrast:(double)a3
{
  [(PIAdjustmentController *)self setIsAuto:0];
  id v6 = [NSNumber numberWithDouble:a3];
  double v5 = +[PISmartColorAdjustmentController offsetContrastKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v6 forKey:v5];
}

- (double)offsetCast
{
  v3 = +[PISmartColorAdjustmentController offsetCastKey];
  id v4 = [(PIAdjustmentController *)self _primitiveValueForKey:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)setOffsetCast:(double)a3
{
  [(PIAdjustmentController *)self setIsAuto:0];
  id v6 = [NSNumber numberWithDouble:a3];
  double v5 = +[PISmartColorAdjustmentController offsetCastKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v6 forKey:v5];
}

- (double)inputCast
{
  double cast = self->_smartSettings.cast;
  id v4 = +[PISmartColorAdjustmentController offsetCastKey];
  double v5 = [(PIAdjustmentController *)self _primitiveValueForKey:v4];
  [v5 doubleValue];
  double v7 = cast + v6;

  return v7;
}

- (void)setInputCast:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v4 = +[PISmartColorAdjustmentController inputCastKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v5 forKey:v4];
}

- (double)inputContrast
{
  double contrast = self->_smartSettings.contrast;
  id v4 = +[PISmartColorAdjustmentController offsetContrastKey];
  id v5 = [(PIAdjustmentController *)self _primitiveValueForKey:v4];
  [v5 doubleValue];
  double v7 = contrast + v6;

  return v7;
}

- (void)setInputContrast:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v4 = +[PISmartColorAdjustmentController inputContrastKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v5 forKey:v4];
}

- (double)inputSaturation
{
  double sat = self->_smartSettings.sat;
  id v4 = +[PISmartColorAdjustmentController offsetSaturationKey];
  id v5 = [(PIAdjustmentController *)self _primitiveValueForKey:v4];
  [v5 doubleValue];
  double v7 = sat + v6;

  return v7;
}

- (void)setInputSaturation:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v4 = +[PISmartColorAdjustmentController inputSaturationKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v5 forKey:v4];
}

- (double)inputColor
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PISmartColorAdjustmentController inputColorKey];
  id v4 = [v2 objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)setInputColor:(double)a3
{
  double v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  double v6 = +[PISmartColorAdjustmentController inputColorKey];
  [(PIAdjustmentController *)self _setPrimitiveValue:v5 forKey:v6];

  [(PISmartColorAdjustmentController *)self _updateSettingsWithInputColor:a3];
}

- (id)computedSettings
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = +[PISmartColorAdjustmentController inputSaturationKey];
  v12[0] = v3;
  p_smartSettings = &self->_smartSettings;
  double v5 = [NSNumber numberWithDouble:self->_smartSettings.sat];
  v13[0] = v5;
  double v6 = +[PISmartColorAdjustmentController inputContrastKey];
  v12[1] = v6;
  double v7 = [NSNumber numberWithDouble:p_smartSettings->contrast];
  v13[1] = v7;
  v8 = +[PISmartColorAdjustmentController inputCastKey];
  v12[2] = v8;
  double v9 = [NSNumber numberWithDouble:p_smartSettings->cast];
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (void)_updateSettingsWithInputColor:(double)a3
{
  long long v4 = *(_OWORD *)&self->_stats.autoValue;
  v12[0] = *(_OWORD *)&self->_stats.p75;
  v12[1] = v4;
  p_smartSettings = &self->_smartSettings;
  smart_color_adjustments_from_stats(&self->_smartSettings.sat, (double *)v12, a3);
  double v6 = [NSNumber numberWithDouble:p_smartSettings->sat];
  double v7 = +[PISmartColorAdjustmentController inputSaturationKey];
  [(PIAdjustmentController *)self setObject:v6 forKeyedSubscript:v7];

  v8 = [NSNumber numberWithDouble:p_smartSettings->contrast];
  double v9 = +[PISmartColorAdjustmentController inputContrastKey];
  [(PIAdjustmentController *)self setObject:v8 forKeyedSubscript:v9];

  id v11 = [NSNumber numberWithDouble:p_smartSettings->cast];
  v10 = +[PISmartColorAdjustmentController inputCastKey];
  [(PIAdjustmentController *)self setObject:v11 forKeyedSubscript:v10];
}

- (PISmartColorAdjustmentController)initWithAdjustment:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PISmartColorAdjustmentController;
  id v3 = a3;
  long long v4 = [(PIAdjustmentController *)&v20 initWithAdjustment:v3];
  double v5 = +[PISmartColorAdjustmentController statisticsKey];
  double v6 = [v3 objectForKeyedSubscript:v5];
  double v7 = [v6 objectForKeyedSubscript:@"satPercentile75"];
  [v7 doubleValue];
  v4->_stats.p75 = v8;

  double v9 = +[PISmartColorAdjustmentController statisticsKey];
  v10 = [v3 objectForKeyedSubscript:v9];
  id v11 = [v10 objectForKeyedSubscript:@"satPercentile98"];
  [v11 doubleValue];
  v4->_stats.p98 = v12;

  v13 = +[PISmartColorAdjustmentController statisticsKey];
  v14 = [v3 objectForKeyedSubscript:v13];
  v15 = [v14 objectForKeyedSubscript:@"satPercentileG98"];
  [v15 doubleValue];
  v4->_stats.g98 = v16;

  v17 = +[PISmartColorAdjustmentController inputColorKey];
  v18 = [v3 objectForKeyedSubscript:v17];

  [v18 doubleValue];
  -[PISmartColorAdjustmentController _updateSettingsWithInputColor:](v4, "_updateSettingsWithInputColor:");

  return v4;
}

+ (NSString)attributeCastKey
{
  return (NSString *)@"inputCast";
}

+ (NSString)attributeVibrancyKey
{
  return (NSString *)@"inputSaturation";
}

+ (NSString)attributeContrastKey
{
  return (NSString *)@"inputContrast";
}

+ (NSString)offsetCastKey
{
  return (NSString *)@"offsetCast";
}

+ (NSString)offsetContrastKey
{
  return (NSString *)@"offsetContrast";
}

+ (NSString)offsetSaturationKey
{
  return (NSString *)@"offsetSaturation";
}

+ (id)statisticsKey
{
  return @"statistics";
}

+ (id)inputCastKey
{
  return @"inputCast";
}

+ (id)inputContrastKey
{
  return @"inputContrast";
}

+ (id)inputSaturationKey
{
  return @"inputSaturation";
}

+ (NSString)inputColorKey
{
  return (NSString *)@"inputColor";
}

@end