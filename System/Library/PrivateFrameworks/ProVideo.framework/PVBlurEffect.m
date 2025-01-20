@interface PVBlurEffect
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVBlurEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.filter", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v9 withProperties:v6];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"displayName", @"BuiltIn", @"contentGroup", 0);
  v8 = +[PVContentRegistry sharedInstance];
  [v8 registerContentClass:objc_opt_class() forID:v9 type:@"effect.video.filter" withProperties:v7];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  id v9 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v26);
  v10 = v26;
  *id v9 = (HGCrop *)v26;
  if (v10) {
    (*(void (**)(HGNode *))(*(void *)v10 + 16))(v10);
  }
  [(NSLock *)self->super.super._inspectablePropertiesLock lock];
  v11 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"kPVBlurEffectRadius"];
  [v11 floatValue];
  float v13 = v12;

  v14 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"kPVBlurEffectClampToEdge"];
  if (v14)
  {
    v15 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"kPVBlurEffectClampToEdge"];
    int v16 = [v15 BOOLValue];
  }
  else
  {
    int v16 = 0;
  }

  [(NSLock *)self->super.super._inspectablePropertiesLock unlock];
  if (v16)
  {
    v17 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v17);
    (*(void (**)(HGTextureWrap *, void, HGNode *))(*(void *)v17 + 120))(v17, 0, v10);
    HGTextureWrap::SetTextureWrapMode((uint64_t)v17, (const char *)1, v18);
    if (v10 != (HGNode *)v17)
    {
      if (v10) {
        (*(void (**)(HGNode *))(*(void *)v10 + 24))(v10);
      }
      *id v9 = v17;
      v10 = (HGNode *)v17;
      (*(void (**)(HGTextureWrap *))(*(void *)v17 + 16))(v17);
    }
    (*(void (**)(HGTextureWrap *))(*(void *)v17 + 24))(v17);
  }
  v19 = (HGBlur *)HGObject::operator new(0x220uLL);
  HGBlur::HGBlur(v19);
  (*(void (**)(HGBlur *, void, HGNode *))(*(void *)v19 + 120))(v19, 0, v10);
  (*(void (**)(HGBlur *, void, float, float, double, double))(*(void *)v19 + 96))(v19, 0, v13, v13, 0.0, 0.0);
  (*(void (**)(HGBlur *, uint64_t, float, double, double, double))(*(void *)v19 + 96))(v19, 2, 1.0, 0.0, 0.0, 0.0);
  if (v10 != (HGNode *)v19)
  {
    if (v10) {
      (*(void (**)(HGNode *))(*(void *)v10 + 24))(v10);
    }
    *id v9 = v19;
    (*(void (**)(HGBlur *))(*(void *)v19 + 16))(v19);
  }
  if (v16)
  {
    uint64_t DOD = HGRenderer::GetDOD(*(HGRenderer **)a5, v26);
    uint64_t v22 = v21;
    v23 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v23);
    v24 = *v9;
    (*(void (**)(HGCrop *, void, HGCrop *))(*(void *)v23 + 120))(v23, 0, *v9);
    (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v23 + 96))(v23, 0, (float)(int)DOD, (float)SHIDWORD(DOD), (float)(int)v22, (float)SHIDWORD(v22));
    if (v24 != v23)
    {
      if (v24) {
        (*(void (**)(HGCrop *))(*(void *)v24 + 24))(v24);
      }
      *id v9 = v23;
      (*(void (**)(HGCrop *))(*(void *)v23 + 16))(v23);
    }
    (*(void (**)(HGCrop *))(*(void *)v23 + 24))(v23);
  }
  (*(void (**)(HGBlur *))(*(void *)v19 + 24))(v19);
  v25 = v26;
  if (v26) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v26 + 24))(v26);
  }
  return (HGRef<HGNode>)v25;
}

@end