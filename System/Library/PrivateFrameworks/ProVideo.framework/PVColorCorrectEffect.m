@interface PVColorCorrectEffect
+ (void)registerEffects;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVColorCorrectEffect

+ (void)registerEffects
{
  +[PVColorCorrectEffect_BnW registerEffectWithID:@"Helium:CBA2376C-F0E0-4D55-8C97-0A3ECF72CE63" displayName:@"Black and White"];
  +[PVColorCorrectEffect_Contrast registerEffectWithID:@"Helium:D47A107B-85CF-4DC8-B580-060F272D611F" displayName:@"Contrast"];
  +[PVColorCorrectEffect_Bright registerEffectWithID:@"Helium:0B37D582-6CFF-48BA-B57A-85FE45E14AAE" displayName:@"Brighten"];
  +[PVColorCorrectEffect_Warm registerEffectWithID:@"Helium:73A91088-DD32-4B19-B7AE-A27F070A926D" displayName:@"Warmth"];

  +[PVColorCorrectEffect_Cool registerEffectWithID:@"Helium:9215A4CB-FB6F-47F8-944B-1785F0551131" displayName:@"Cool"];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v9 = v6;
  uint64_t look = self->_look;
  if (look > 4)
  {
    float v11 = 1.0;
    float v14 = 6504.0;
    float v12 = 1.0;
    float v13 = 1.0;
  }
  else
  {
    float v11 = flt_1B7E73E20[look];
    float v12 = flt_1B7E73E34[look];
    float v13 = flt_1B7E73E48[look];
    float v14 = flt_1B7E73E5C[look];
  }
  [(NSLock *)self->super.super._inspectablePropertiesLock lock];
  inspectableProperties = self->super.super._inspectableProperties;
  if (inspectableProperties)
  {
    v16 = [(NSMutableDictionary *)inspectableProperties objectForKeyedSubscript:@"xParam"];

    float v17 = 0.0;
    float v18 = 0.0;
    if (v16)
    {
      v19 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"xParam"];
      [v19 floatValue];
      float v18 = v20 / 100.0;
    }
    v21 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"yParam"];

    if (v21)
    {
      v22 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"yParam"];
      [v22 floatValue];
      float v17 = v23 / 100.0;
    }
    float v12 = v12 + v18;
    float v13 = v13 + v17;
  }
  [(NSLock *)self->super.super._inspectablePropertiesLock unlock];
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v26);
  v24 = (HGColorCorrect *)HGObject::operator new(0x1A0uLL);
  HGColorCorrect::HGColorCorrect(v24);
  (*(void (**)(HGColorCorrect *, void, HGNode *))(*(void *)v24 + 120))(v24, 0, v26);
  (*(void (**)(HGColorCorrect *, void, float, float, float, double))(*(void *)v24 + 96))(v24, HGColorCorrect::kParam_wgt, 0.2126, 0.7152, 0.0722, 0.0);
  (*(void (**)(HGColorCorrect *, void, double, float, float, double))(*(void *)v24 + 96))(v24, HGColorCorrect::kParam_hue_saturation_temp, 0.0, v11, v14, 0.0);
  (*(void (**)(HGColorCorrect *, void, float, float, float, float))(*(void *)v24 + 96))(v24, HGColorCorrect::kParam_brightness, v12, v12, v12, 1.0);
  (*(void (**)(HGColorCorrect *, void, float, float, float, float))(*(void *)v24 + 96))(v24, HGColorCorrect::kParam_contrast, v13, v13, v13, 1.0);
  *v9 = v24;
  v25 = v26;
  if (v26) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v26 + 24))(v26);
  }
  return (HGRef<HGNode>)v25;
}

@end