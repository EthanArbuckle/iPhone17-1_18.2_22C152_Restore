@interface PIPortraitAdjustmentController
+ (id)kindKey;
+ (id)portraitInfoKey;
+ (id)spillMatteAllowedKey;
+ (id)strengthKey;
- (BOOL)canRenderPortraitEffect;
- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4;
- (NSDictionary)portraitInfo;
- (NSNumber)spillMatteAllowed;
- (NSString)kind;
- (PIPortraitAdjustmentController)initWithAdjustment:(id)a3;
- (double)defaultStrength;
- (double)strength;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (int64_t)version;
- (void)setKind:(id)a3;
- (void)setPortraitInfo:(id)a3;
- (void)setSpillMatteAllowed:(id)a3;
- (void)setStrength:(double)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PIPortraitAdjustmentController

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = +[PIAdjustmentController enabledKey];
  v4 = +[PIPortraitAdjustmentController kindKey];
  v8[1] = v4;
  v5 = +[PIPortraitAdjustmentController strengthKey];
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (NSNumber)spillMatteAllowed
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIPortraitAdjustmentController spillMatteAllowedKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  int v5 = [v4 BOOLValue];

  if (v5) {
    return (NSNumber *)MEMORY[0x1E4F1CC38];
  }
  else {
    return 0;
  }
}

- (void)setSpillMatteAllowed:(id)a3
{
  int v4 = [a3 BOOLValue];
  id v8 = [(PIAdjustmentController *)self adjustment];
  int v5 = +[PIPortraitAdjustmentController spillMatteAllowedKey];
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    v7 = v8;
  }
  else
  {
    v7 = v8;
    uint64_t v6 = 0;
  }
  [v7 setObject:v6 forKeyedSubscript:v5];
}

- (double)defaultStrength
{
  v3 = +[PIPortraitAdjustmentController strengthKey];
  int v4 = [(PIAdjustmentController *)self adjustment];
  int v5 = [v4 schema];
  uint64_t v6 = [v5 settings];
  v7 = [v6 objectForKeyedSubscript:v3];

  id v8 = [v7 defaultValue];
  [v8 floatValue];
  double v10 = v9;

  return v10;
}

- (double)strength
{
  v3 = +[PIPortraitAdjustmentController strengthKey];
  int v4 = [(PIAdjustmentController *)self adjustment];
  int v5 = [v4 schema];
  uint64_t v6 = [v5 settings];
  v7 = [v6 objectForKeyedSubscript:v3];

  id v8 = [(PIAdjustmentController *)self adjustment];
  float v9 = [v8 objectForKeyedSubscript:v3];

  if (!v9)
  {
    float v9 = [v7 defaultValue];
  }
  [v9 floatValue];
  double v11 = v10;

  return v11;
}

- (void)setStrength:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  int v4 = [(PIAdjustmentController *)self adjustment];
  int v5 = +[PIPortraitAdjustmentController strengthKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)canRenderPortraitEffect
{
  v2 = [(PIPortraitAdjustmentController *)self portraitInfo];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSDictionary)portraitInfo
{
  v2 = [(PIAdjustmentController *)self adjustment];
  BOOL v3 = +[PIPortraitAdjustmentController portraitInfoKey];
  int v4 = [v2 objectForKeyedSubscript:v3];

  return (NSDictionary *)v4;
}

- (void)setPortraitInfo:(id)a3
{
  id v6 = (id)[a3 copy];
  int v4 = [(PIAdjustmentController *)self adjustment];
  int v5 = +[PIPortraitAdjustmentController portraitInfoKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSString)kind
{
  v2 = [(PIAdjustmentController *)self adjustment];
  BOOL v3 = +[PIPortraitAdjustmentController kindKey];
  int v4 = [v2 objectForKeyedSubscript:v3];

  return (NSString *)v4;
}

- (void)setKind:(id)a3
{
  id v6 = (id)[a3 copy];
  int v4 = [(PIAdjustmentController *)self adjustment];
  int v5 = +[PIPortraitAdjustmentController kindKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PIPortraitAdjustmentController strengthKey];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    float v10 = [(PIAdjustmentController *)self adjustment];
    double v11 = [v10 objectForKeyedSubscript:v7];

    v12 = [v6 objectForKeyedSubscript:v7];
    v13 = [(PIAdjustmentController *)self adjustment];
    v14 = [v13 schema];
    v15 = [v14 settings];
    v16 = +[PIPortraitAdjustmentController strengthKey];
    v17 = [v15 objectForKeyedSubscript:v16];

    uint64_t v18 = [v17 defaultValue];
    v19 = (void *)v18;
    if (v11) {
      v20 = v11;
    }
    else {
      v20 = (void *)v18;
    }
    unint64_t v21 = v20;

    if (v12) {
      v22 = v12;
    }
    else {
      v22 = v19;
    }
    unint64_t v23 = v22;

    [(id)v21 doubleValue];
    double v25 = v24;
    [(id)v23 doubleValue];
    unsigned __int8 v27 = round(v25 * 100.0) == round(v26 * 100.0) || (v21 | v23) == 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)PIPortraitAdjustmentController;
    unsigned __int8 v27 = [(PIAdjustmentController *)&v29 isSettingEqual:v6 forKey:v7];
  }

  return v27;
}

- (PIPortraitAdjustmentController)initWithAdjustment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIPortraitAdjustmentController;
  return [(PIAdjustmentController *)&v4 initWithAdjustment:a3];
}

+ (id)spillMatteAllowedKey
{
  return @"spillMatteAllowed";
}

+ (id)strengthKey
{
  return @"strength";
}

+ (id)kindKey
{
  return @"kind";
}

+ (id)portraitInfoKey
{
  return @"portraitInfo";
}

@end