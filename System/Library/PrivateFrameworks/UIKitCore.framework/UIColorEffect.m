@interface UIColorEffect
+ (BOOL)supportsSecureCoding;
+ (id)_colorEffectCAMatrix:(CAColorMatrix *)a3;
+ (id)_colorEffectSourceOver:(id)a3;
+ (id)colorEffectAdd:(id)a3;
+ (id)colorEffectBlendColor:(id)a3;
+ (id)colorEffectBrightness:(double)a3;
+ (id)colorEffectColor:(id)a3;
+ (id)colorEffectContrast:(double)a3;
+ (id)colorEffectCurvesRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6;
+ (id)colorEffectInvert;
+ (id)colorEffectLuminanceCurveMap:(id)a3 blendingAmount:(double)a4;
+ (id)colorEffectLuminanceMap:(id)a3 blendingAmount:(double)a4;
+ (id)colorEffectMatrix:(id *)a3;
+ (id)colorEffectMonochromeTint:(id)a3 blendingAmount:(double)a4 brightnessAdjustment:(double)a5;
+ (id)colorEffectMultiply:(id)a3;
+ (id)colorEffectSaturate:(double)a3;
+ (id)colorEffectSubtract:(id)a3;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 changedTraits:(id)a5 usage:(int64_t)a6;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (UIColorEffect)init;
- (UIColorEffect)initWithCoder:(id)a3;
- (id)_filterEntry;
- (id)_filterEntryForTraitCollection:(id)a3;
- (id)description;
- (int64_t)_expectedUsage;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIColorEffect

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 changedTraits:(id)a5 usage:(int64_t)a6
{
  id v7 = a5;
  if (self->_sourceColorUpdater)
  {
    v8 = +[UITraitCollection systemTraitsAffectingColorAppearance];
    if ([v8 count])
    {
      unint64_t v9 = 0;
      do
      {
        int v10 = objc_msgSend(v7, "containsObject:", (id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
        if (v10) {
          break;
        }
        ++v9;
      }
      while (v9 < [v8 count]);
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (id)colorEffectLuminanceCurveMap:(id)a3 blendingAmount:(double)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = _UIColorEffectUpgradeCurve(a3);
  id v8 = objc_alloc_init((Class)a1);
  unint64_t v9 = v8;
  if (a3)
  {
    objc_storeStrong((id *)v8 + 1, (id)*MEMORY[0x1E4F3A260]);
    uint64_t v23 = *MEMORY[0x1E4F3A218];
    v24[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v11 = (void *)v9[2];
    v9[2] = v10;

    uint64_t v21 = *MEMORY[0x1E4F3A100];
    uint64_t v12 = v21;
    v22 = &unk_1ED3F1B28;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v14 = (void *)v9[3];
    v9[3] = v13;

    uint64_t v19 = v12;
    v15 = [NSNumber numberWithDouble:a4];
    v20 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v17 = (void *)v9[4];
    v9[4] = v16;
  }
  return v9;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_filterType)
  {
    unint64_t v9 = [v7 traitCollection];
    uint64_t v10 = [(UIColorEffect *)self _filterEntryForTraitCollection:v9];
    [v11 addFilterEntry:v10];

    if (self->_disableInPlaceFiltering) {
      [v11 setDisableInPlaceFiltering:1];
    }
  }
}

- (id)_filterEntryForTraitCollection:(id)a3
{
  v5 = self->_requestedValues;
  v6 = self->_identityValues;
  if (a3)
  {
    sourceColorUpdater = self->_sourceColorUpdater;
    if (sourceColorUpdater)
    {
      id v8 = (void (*)(void *, NSDictionary *, id, uint64_t))sourceColorUpdater[2];
      id v9 = a3;
      uint64_t v10 = v8(sourceColorUpdater, v5, v9, 1);

      uint64_t v11 = (*((void (**)(void))self->_sourceColorUpdater + 2))();

      v5 = (NSDictionary *)v10;
      v6 = (NSDictionary *)v11;
    }
  }
  uint64_t v12 = [[_UIVisualEffectFilterEntry alloc] initWithFilterType:self->_filterType configurationValues:self->_configurationValues requestedValues:v5 identityValues:v6];

  return v12;
}

+ (id)colorEffectMatrix:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E4F3A038]);
  uint64_t v27 = *MEMORY[0x1E4F3A168];
  uint64_t v5 = v27;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  void v24[2] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  v24[3] = v6;
  v24[4] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  v24[0] = *MEMORY[0x1E4F39AD8];
  v24[1] = v7;
  id v8 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v24];
  v28[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  id v10 = v4[3];
  v4[3] = (id)v9;

  uint64_t v25 = v5;
  v11.f64[0] = a3->var1.var3;
  float64x2_t v12 = *(float64x2_t *)&a3->var2.var0;
  float64x2_t v13 = *(float64x2_t *)&a3->var2.var2;
  float64x2_t v14 = *(float64x2_t *)&a3->var3.var1;
  v15.f64[0] = a3->var3.var3;
  v16.f64[0] = a3->var4.var0;
  v17.f64[0] = a3->var4.var2;
  v16.f64[1] = a3->var1.var0;
  float32x4_t v18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), *(float64x2_t *)&a3->var1.var1);
  v23[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var0.var0), *(float64x2_t *)&a3->var0.var2);
  v23[1] = v18;
  v11.f64[1] = a3->var4.var1;
  v17.f64[1] = a3->var3.var0;
  v23[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
  v23[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v17);
  v15.f64[1] = a3->var4.var3;
  v23[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v15);
  uint64_t v19 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v23];
  v26 = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v21 = v4[4];
  v4[4] = (id)v20;

  return v4;
}

+ (id)colorEffectSaturate:(double)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E4F3A048]);
  uint64_t v14 = *MEMORY[0x1E4F3A100];
  uint64_t v5 = v14;
  v15[0] = &unk_1ED3F1B18;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v7 = v4[3];
  v4[3] = (id)v6;

  uint64_t v12 = v5;
  id v8 = [NSNumber numberWithDouble:a3];
  float64x2_t v13 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v10 = v4[4];
  v4[4] = (id)v9;

  return v4;
}

- (UIColorEffect)init
{
  v9.receiver = self;
  v9.super_class = (Class)UIColorEffect;
  v2 = [(UIColorEffect *)&v9 init];
  v3 = v2;
  if (v2)
  {
    configurationValues = v2->_configurationValues;
    uint64_t v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v2->_configurationValues = (NSDictionary *)MEMORY[0x1E4F1CC08];

    identityValues = v3->_identityValues;
    v3->_identityValues = v5;

    requestedValues = v3->_requestedValues;
    v3->_requestedValues = v5;
  }
  return v3;
}

- (id)_filterEntry
{
  return [(UIColorEffect *)self _filterEntryForTraitCollection:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sourceColorUpdater, 0);
  objc_storeStrong((id *)&self->_requestedValues, 0);
  objc_storeStrong((id *)&self->_identityValues, 0);
  objc_storeStrong((id *)&self->_configurationValues, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIColorEffect *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4 && [(UIColorEffect *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    if ([v6[1] isEqualToString:self->_filterType]
      && [v6[2] isEqualToDictionary:self->_configurationValues])
    {
      char v7 = [v6[4] isEqualToDictionary:self->_requestedValues];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (UIColorEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIColorEffect;
  uint64_t v5 = [(UIVisualEffect *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIColorEffectType"];
    filterType = v5->_filterType;
    v5->_filterType = (NSString *)v6;

    uint64_t v8 = _UIColorEffectDecodeDictionary(v4, @"UIColorEffectConfigurationValues");
    configurationValues = v5->_configurationValues;
    v5->_configurationValues = (NSDictionary *)v8;

    uint64_t v10 = _UIColorEffectDecodeDictionary(v4, @"UIColorEffectIdentityValues");
    identityValues = v5->_identityValues;
    v5->_identityValues = (NSDictionary *)v10;

    uint64_t v12 = _UIColorEffectDecodeDictionary(v4, @"UIColorEffectRequestedValues");
    requestedValues = v5->_requestedValues;
    v5->_requestedValues = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIColorEffect;
  id v4 = a3;
  [(UIVisualEffect *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_filterType, @"UIColorEffectType", v5.receiver, v5.super_class);
  _UIColorEffectEncodeDictionary(v4, @"UIColorEffectConfigurationValues", self->_configurationValues);
  _UIColorEffectEncodeDictionary(v4, @"UIColorEffectIdentityValues", self->_identityValues);
  _UIColorEffectEncodeDictionary(v4, @"UIColorEffectRequestedValues", self->_requestedValues);
}

+ (id)_colorEffectCAMatrix:(CAColorMatrix *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E4F3A038]);
  uint64_t v24 = *MEMORY[0x1E4F3A168];
  uint64_t v5 = v24;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  long long v20 = v6;
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  long long v17 = *MEMORY[0x1E4F39AD8];
  long long v18 = v7;
  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v17];
  v25[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v10 = v4[3];
  v4[3] = (id)v9;

  uint64_t v22 = v5;
  long long v11 = *(_OWORD *)&a3->m33;
  long long v19 = *(_OWORD *)&a3->m24;
  long long v20 = v11;
  long long v21 = *(_OWORD *)&a3->m42;
  long long v12 = *(_OWORD *)&a3->m15;
  long long v17 = *(_OWORD *)&a3->m11;
  long long v18 = v12;
  float64x2_t v13 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v17];
  uint64_t v23 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v15 = v4[4];
  v4[4] = (id)v14;

  return v4;
}

+ (id)colorEffectColor:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E4F3A038]);
  uint64_t v6 = *MEMORY[0x1E4F3A168];
  uint64_t v39 = *MEMORY[0x1E4F3A168];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  v27[0] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  v27[1] = v7;
  float64x2_t v28 = *(float64x2_t *)(MEMORY[0x1E4F39AD8] + 64);
  float64x2_t v8 = *(float64x2_t *)(MEMORY[0x1E4F39AD8] + 16);
  float64x2_t v25 = *(float64x2_t *)MEMORY[0x1E4F39AD8];
  float64x2_t v26 = v8;
  uint64_t v9 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v25];
  v40[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  id v11 = v5[3];
  v5[3] = (id)v10;

  if ([v4 _isDynamic])
  {
    v37 = @"UIDynamicColor";
    id v38 = v4;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v13 = v5[4];
    v5[4] = (id)v12;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__UIColorEffect_colorEffectColor___block_invoke;
    aBlock[3] = &unk_1E52DD208;
    id v34 = v4;
    uint64_t v14 = _Block_copy(aBlock);
    id v15 = v5[5];
    v5[5] = v14;
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    memset(v30, 0, sizeof(v30));
    float64x2_t v28 = 0u;
    float64x2_t v29 = 0u;
    memset(v27, 0, sizeof(v27));
    float64x2_t v25 = 0u;
    float64x2_t v26 = 0u;
    [v4 getRed:&v31 green:(char *)&v31 + 8 blue:&v32 alpha:(char *)&v32 + 8];
    uint64_t v35 = v6;
    v16.f64[0] = *((float64_t *)&v27[1] + 1);
    v17.f64[0] = v30[1].f64[1];
    *(void *)&v18.f64[0] = v31;
    *(void *)&v19.f64[0] = v32;
    v18.f64[1] = *(float64_t *)v27;
    v24[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v26);
    v24[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), *(float64x2_t *)((char *)v27 + 8));
    v16.f64[1] = *((float64_t *)&v31 + 1);
    v19.f64[1] = v30[0].f64[0];
    void v24[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v28);
    v24[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v19);
    v17.f64[1] = *((float64_t *)&v32 + 1);
    v24[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)v30 + 8)), v17);
    long long v20 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v24];
    v36 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v22 = v5[4];
    v5[4] = (id)v21;
  }
  return v5;
}

id __34__UIColorEffect_colorEffectColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  float64x2_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a3];
    long long v24 = 0u;
    long long v25 = 0u;
    memset(v23, 0, sizeof(v23));
    float64x2_t v21 = 0u;
    float64x2_t v22 = 0u;
    memset(v20, 0, sizeof(v20));
    float64x2_t v18 = 0u;
    float64x2_t v19 = 0u;
    [v9 getRed:&v24 green:(char *)&v24 + 8 blue:&v25 alpha:(char *)&v25 + 8];
    uint64_t v26 = *MEMORY[0x1E4F3A168];
    v10.f64[0] = v20[1].f64[1];
    v11.f64[0] = v23[1].f64[1];
    *(void *)&v12.f64[0] = v24;
    *(void *)&v13.f64[0] = v25;
    v12.f64[1] = v20[0].f64[0];
    v17[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
    v17[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), *(float64x2_t *)((char *)v20 + 8));
    v10.f64[1] = *((float64_t *)&v24 + 1);
    v13.f64[1] = v23[0].f64[0];
    v17[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v21);
    v17[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v13);
    v11.f64[1] = *((float64_t *)&v25 + 1);
    v17[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)v23 + 8)), v11);
    uint64_t v14 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v17];
    v27[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  }
  else
  {
    id v15 = v7;
  }

  return v15;
}

+ (id)colorEffectMultiply:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E4F3A2A8]);
  uint64_t v6 = *MEMORY[0x1E4F3A148];
  uint64_t v23 = *MEMORY[0x1E4F3A148];
  id v7 = +[UIColor whiteColor];
  v24[0] = [v7 CGColor];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v9 = v5[3];
  v5[3] = (id)v8;

  if ([v4 _isDynamic])
  {
    float64x2_t v21 = @"UIDynamicColor";
    id v22 = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v11 = v5[4];
    v5[4] = (id)v10;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__UIColorEffect_colorEffectMultiply___block_invoke;
    v17[3] = &unk_1E52DD208;
    id v18 = v4;
    float64x2_t v12 = _Block_copy(v17);
    id v13 = v5[5];
    v5[5] = v12;

    id v14 = v18;
  }
  else
  {
    uint64_t v19 = v6;
    uint64_t v20 = [v4 CGColor];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v14 = v5[4];
    v5[4] = (id)v15;
  }

  return v5;
}

id __37__UIColorEffect_colorEffectMultiply___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = v7;
  if (a4)
  {
    id v9 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a3];
    uint64_t v13 = *MEMORY[0x1E4F3A148];
    id v10 = v9;
    v14[0] = [v10 CGColor];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

+ (id)colorEffectAdd:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E4F39FF0]);
  uint64_t v6 = *MEMORY[0x1E4F3A148];
  uint64_t v23 = *MEMORY[0x1E4F3A148];
  id v7 = +[UIColor clearColor];
  v24[0] = [v7 CGColor];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v9 = v5[3];
  v5[3] = (id)v8;

  if ([v4 _isDynamic])
  {
    float64x2_t v21 = @"UIDynamicColor";
    id v22 = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v11 = v5[4];
    v5[4] = (id)v10;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__UIColorEffect_colorEffectAdd___block_invoke;
    v17[3] = &unk_1E52DD208;
    id v18 = v4;
    float64x2_t v12 = _Block_copy(v17);
    id v13 = v5[5];
    v5[5] = v12;

    id v14 = v18;
  }
  else
  {
    uint64_t v19 = v6;
    uint64_t v20 = [v4 CGColor];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v14 = v5[4];
    v5[4] = (id)v15;
  }

  return v5;
}

id __32__UIColorEffect_colorEffectAdd___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = v7;
  if (a4)
  {
    id v9 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a3];
    uint64_t v13 = *MEMORY[0x1E4F3A148];
    id v10 = v9;
    v14[0] = [v10 CGColor];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

+ (id)colorEffectSubtract:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E4F3A050]);
  uint64_t v6 = *MEMORY[0x1E4F3A148];
  uint64_t v23 = *MEMORY[0x1E4F3A148];
  id v7 = +[UIColor clearColor];
  v24[0] = [v7 CGColor];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v9 = v5[3];
  v5[3] = (id)v8;

  if ([v4 _isDynamic])
  {
    float64x2_t v21 = @"UIDynamicColor";
    id v22 = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v11 = v5[4];
    v5[4] = (id)v10;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__UIColorEffect_colorEffectSubtract___block_invoke;
    v17[3] = &unk_1E52DD208;
    id v18 = v4;
    float64x2_t v12 = _Block_copy(v17);
    id v13 = v5[5];
    v5[5] = v12;

    id v14 = v18;
  }
  else
  {
    uint64_t v19 = v6;
    uint64_t v20 = [v4 CGColor];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v14 = v5[4];
    v5[4] = (id)v15;
  }

  return v5;
}

id __37__UIColorEffect_colorEffectSubtract___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = v7;
  if (a4)
  {
    id v9 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a3];
    uint64_t v13 = *MEMORY[0x1E4F3A148];
    id v10 = v9;
    v14[0] = [v10 CGColor];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

+ (id)colorEffectBlendColor:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 _isDynamic];
  uint64_t v6 = (id *)objc_alloc_init((Class)a1);
  if ((v5 & 1) != 0 || ([v4 alphaComponent], v7 != 0.0))
  {
    objc_storeStrong(v6 + 1, (id)*MEMORY[0x1E4F3A038]);
    uint64_t v8 = *MEMORY[0x1E4F3A168];
    uint64_t v40 = *MEMORY[0x1E4F3A168];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
    long long v27 = v9;
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
    long long v24 = *MEMORY[0x1E4F39AD8];
    long long v25 = v10;
    id v11 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v24];
    v41[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v13 = v6[3];
    v6[3] = (id)v12;

    if (v5)
    {
      id v38 = @"UIDynamicColor";
      id v39 = v4;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v15 = v6[4];
      v6[4] = (id)v14;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__UIColorEffect_colorEffectBlendColor___block_invoke;
      aBlock[3] = &unk_1E52DD208;
      id v35 = v4;
      float64x2_t v16 = _Block_copy(aBlock);
      id v17 = v6[5];
      v6[5] = v16;
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      [v4 getRed:&v32 green:(char *)&v32 + 8 blue:&v33 alpha:(char *)&v33 + 8];
      uint64_t v36 = v8;
      id v18 = (void *)MEMORY[0x1E4F29238];
      _UIColorEffectSourceOverCAMatrix((uint64_t)v23, v4);
      uint64_t v19 = [v18 valueWithCAColorMatrix:v23];
      v37 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v21 = v6[4];
      v6[4] = (id)v20;
    }
  }

  return v6;
}

id __39__UIColorEffect_colorEffectBlendColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = v7;
  if (a4)
  {
    long long v9 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a3];
    uint64_t v15 = *MEMORY[0x1E4F3A168];
    long long v10 = (void *)MEMORY[0x1E4F29238];
    _UIColorEffectSourceOverCAMatrix((uint64_t)v14, v9);
    id v11 = [v10 valueWithCAColorMatrix:v14];
    v16[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    id v12 = v7;
  }

  return v12;
}

+ (id)_colorEffectSourceOver:(id)a3
{
  if (a3.var3 == 0.0)
  {
    id v3 = objc_alloc_init((Class)a1);
  }
  else
  {
    long long v7 = 0u;
    long long v6 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = 1.0 - a3.var3;
    double v8 = 1.0 - a3.var3;
    double v11 = 1.0 - a3.var3;
    double v14 = 1.0 - a3.var3;
    $01BB1521EC52D44A8E7628F5261DCEC8 v15 = a3;
    id v3 = +[UIColorEffect colorEffectMatrix:&v5];
  }
  return v3;
}

+ (id)colorEffectBrightness:(double)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  double v5 = v4;
  if (a3 != 0.0)
  {
    objc_storeStrong((id *)v4 + 1, (id)*MEMORY[0x1E4F3A000]);
    uint64_t v15 = *MEMORY[0x1E4F3A100];
    uint64_t v6 = v15;
    v16[0] = &unk_1ED3F1B28;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    double v8 = (void *)v5[3];
    v5[3] = v7;

    uint64_t v13 = v6;
    long long v9 = [NSNumber numberWithDouble:a3];
    double v14 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    double v11 = (void *)v5[4];
    v5[4] = v10;
  }
  return v5;
}

+ (id)colorEffectContrast:(double)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E4F3A010]);
  uint64_t v14 = *MEMORY[0x1E4F3A100];
  uint64_t v5 = v14;
  v15[0] = &unk_1ED3F1B18;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v7 = v4[3];
  v4[3] = (id)v6;

  uint64_t v12 = v5;
  double v8 = [NSNumber numberWithDouble:a3];
  uint64_t v13 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v10 = v4[4];
  v4[4] = (id)v9;

  return v4;
}

+ (id)colorEffectInvert
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  v9[0] = 0xBFF0000000000000;
  memset(&v9[1], 0, 32);
  v9[5] = 0xBFF0000000000000;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  unint64_t v12 = 0xBFF0000000000000;
  __asm { FMOV            V0.2D, #1.0 }
  long long v17 = _Q0;
  long long v18 = _Q0;
  uint64_t v19 = 0;
  id v7 = [a1 colorEffectMatrix:v9];
  return v7;
}

+ (id)colorEffectMonochromeTint:(id)a3 blendingAmount:(double)a4 brightnessAdjustment:(double)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v9 + 1, (id)*MEMORY[0x1E4F3A040]);
  if ([v8 _isDynamic])
  {
    id v34 = @"UIDynamicColor";
    v35[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v11 = v9[4];
    v9[4] = (id)v10;

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__UIColorEffect_colorEffectMonochromeTint_blendingAmount_brightnessAdjustment___block_invoke;
    v26[3] = &unk_1E52DD230;
    id v27 = v8;
    double v28 = a5;
    double v29 = a4;
    unint64_t v12 = _Block_copy(v26);
    id v13 = v9[5];
    v9[5] = v12;

    uint64_t v14 = v27;
  }
  else
  {
    v32[0] = *MEMORY[0x1E4F3A148];
    uint64_t v15 = v32[0];
    id v16 = v8;
    uint64_t v17 = [v16 CGColor];
    uint64_t v18 = *MEMORY[0x1E4F3A130];
    v33[0] = v17;
    v33[1] = &unk_1ED3F1B28;
    uint64_t v19 = *MEMORY[0x1E4F3A100];
    v32[1] = v18;
    v32[2] = v19;
    v33[2] = &unk_1ED3F1B28;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
    id v21 = v9[3];
    v9[3] = (id)v20;

    v30[0] = v15;
    v31[0] = [v16 CGColor];
    v30[1] = v18;
    uint64_t v14 = [NSNumber numberWithDouble:a5];
    v31[1] = v14;
    float64x2_t v30[2] = v19;
    id v22 = [NSNumber numberWithDouble:a4];
    v31[2] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    id v24 = v9[4];
    v9[4] = (id)v23;
  }
  return v9;
}

id __79__UIColorEffect_colorEffectMonochromeTint_blendingAmount_brightnessAdjustment___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:v6];

  id v9 = v8;
  uint64_t v10 = [v9 CGColor];
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F3A148]];
  if (a4)
  {
    id v11 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3A130]];

    unint64_t v12 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F3A100]];
  }
  else
  {
    [v7 setObject:&unk_1ED3F1B28 forKeyedSubscript:*MEMORY[0x1E4F3A130]];
    [v7 setObject:&unk_1ED3F1B28 forKeyedSubscript:*MEMORY[0x1E4F3A100]];
  }

  return v7;
}

+ (id)colorEffectLuminanceMap:(id)a3 blendingAmount:(double)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![v7 CGImage])
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"UIColorEffect.m" lineNumber:441 description:@"Luminance Map Image must be a CGImage based image"];
  }
  [v7 size];
  if (v9 <= 0.0 || v8 <= 0.0)
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:a1 file:@"UIColorEffect.m" lineNumber:443 description:@"Luminance Map Image must be non-zero size"];
  }
  uint64_t v10 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v10 + 1, (id)*MEMORY[0x1E4F3A268]);
  id v11 = v7;
  uint64_t v12 = [v11 imageOrientation];
  id v13 = v11;
  uint64_t v14 = (CGImage *)[v13 CGImage];
  if (v12)
  {
    [v13 size];
    double v16 = v15;
    [v13 scale];
    double v18 = 1.0 / v17;
    uint64_t v19 = [UIGraphicsImageRenderer alloc];
    uint64_t v20 = [v13 imageRendererFormat];
    id v21 = -[UIGraphicsImageRenderer initWithSize:format:](v19, "initWithSize:format:", v20, v16, v18);

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = ___UIColorEffectProcessLuminanceMap_block_invoke;
    v39[3] = &unk_1E52DD280;
    id v40 = v13;
    id v22 = [(UIGraphicsImageRenderer *)v21 imageWithActions:v39];
  }
  else
  {
    uint64_t v23 = v14;
    if (CGImageGetHeight(v14) == 1)
    {
      id v22 = v13;
    }
    else
    {
      CGFloat v24 = *MEMORY[0x1E4F1DAD8];
      CGFloat v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v48.size.width = (double)CGImageGetWidth(v23);
      v48.size.height = 1.0;
      v48.origin.x = v24;
      v48.origin.y = v25;
      long long v26 = CGImageCreateWithImageInRect(v23, v48);
      id v22 = +[UIImage imageWithCGImage:v26];
      CGImageRelease(v26);
    }
  }

  uint64_t v45 = *MEMORY[0x1E4F3A160];
  id v27 = v22;
  v46[0] = [v27 CGImage];
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v29 = v10[2];
  v10[2] = (id)v28;

  uint64_t v43 = *MEMORY[0x1E4F3A100];
  uint64_t v30 = v43;
  v44 = &unk_1ED3F1B28;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  id v32 = v10[3];
  v10[3] = (id)v31;

  uint64_t v41 = v30;
  long long v33 = [NSNumber numberWithDouble:a4];
  v42 = v33;
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v35 = v10[4];
  v10[4] = (id)v34;

  return v10;
}

+ (id)colorEffectCurvesRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  long long v26 = _UIColorEffectUpgradeCurve(a3);
  id v13 = _UIColorEffectUpgradeCurve(v12);

  uint64_t v14 = _UIColorEffectUpgradeCurve(v11);

  double v15 = _UIColorEffectUpgradeCurve(v10);

  double v16 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v16 + 1, (id)*MEMORY[0x1E4F3A068]);
  uint64_t v18 = *MEMORY[0x1E4F3A190];
  v29[0] = *MEMORY[0x1E4F3A1E0];
  uint64_t v17 = v29[0];
  v29[1] = v18;
  v32[0] = &unk_1ED3EF1A0;
  v32[1] = &unk_1ED3EF1A0;
  uint64_t v20 = *MEMORY[0x1E4F3A0F8];
  uint64_t v30 = *MEMORY[0x1E4F3A138];
  uint64_t v19 = v30;
  uint64_t v31 = v20;
  v32[2] = &unk_1ED3EF1A0;
  void v32[3] = &unk_1ED3EF1A0;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v29 count:4];
  id v22 = v16[3];
  v16[3] = (id)v21;

  v27[0] = v17;
  v27[1] = v18;
  v28[0] = v26;
  v28[1] = v13;
  void v27[2] = v19;
  v27[3] = v20;
  void v28[2] = v14;
  v28[3] = v15;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  id v24 = v16[4];
  v16[4] = (id)v23;

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_filterType hash];
}

- (int64_t)_expectedUsage
{
  return 2;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 traitCollection];
  id v11 = [v8 traitCollection];
  id v12 = [v10 changedTraitsFromTraitCollection:v11];

  LOBYTE(a5) = [(UIColorEffect *)self _needsUpdateForTransitionFromEnvironment:v9 toEnvironment:v8 changedTraits:v12 usage:a5];
  return a5;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)UIColorEffect;
  id v3 = [(UIColorEffect *)&v16 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@" filterType=%@", self->_filterType];
  if (self->_sourceColorUpdater) {
    [v4 appendString:@" dynamicColorBased"];
  }
  configurationValues = self->_configurationValues;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __28__UIColorEffect_description__block_invoke;
  v14[3] = &unk_1E52DD258;
  id v6 = v4;
  id v15 = v6;
  [(NSDictionary *)configurationValues enumerateKeysAndObjectsUsingBlock:v14];
  requestedValues = self->_requestedValues;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__UIColorEffect_description__block_invoke_2;
  v12[3] = &unk_1E52DD258;
  id v8 = v6;
  id v13 = v8;
  [(NSDictionary *)requestedValues enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __28__UIColorEffect_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  _UIVisualEffectFilterEntryDescribeValue(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@" %@=%@", v5, v6];
}

void __28__UIColorEffect_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  _UIVisualEffectFilterEntryDescribeValue(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@" %@=%@", v5, v6];
}

@end