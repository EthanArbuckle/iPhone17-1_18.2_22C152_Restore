@interface PVPanTestEffect
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVPanTestEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.filter", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v7 withProperties:v6];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v9 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v39);
  double v10 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v12 = v11;
  float v13 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
  float v14 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
  [(NSLock *)self->super.super._inspectablePropertiesLock lock];
  v15 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"startPanX"];
  double v16 = v10 * v13;

  if (v15)
  {
    v17 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"startPanX"];
    [v17 floatValue];
    double v19 = v16 * v18;
  }
  else
  {
    double v19 = 0.0;
  }
  v20 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"startPanY"];
  double v21 = v12 * v14;

  double v22 = v21 * 0.5;
  if (v20)
  {
    v23 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"startPanY"];
    [v23 floatValue];
    double v22 = v21 * v24;
  }
  v25 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"deltaPanX"];

  if (v25)
  {
    v26 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"deltaPanX"];
    [v26 floatValue];
    double v16 = v19 + v16 * v27;
  }
  v28 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"deltaPanY"];

  if (v28)
  {
    v29 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"deltaPanY"];
    [v29 floatValue];
    double v31 = v22 + v21 * v30;
  }
  else
  {
    double v31 = v21 * 0.5 + 10.0;
  }
  [(NSLock *)self->super.super._inspectablePropertiesLock unlock];
  v33 = v39;
  void *v9 = v39;
  if (v33) {
    (*(void (**)(HGNode *))(*(void *)v33 + 16))(v33);
  }
  float v34 = v19;
  float v35 = v22;
  float v36 = v16;
  float v37 = v31;
  HGRectMake4f(v32, v34, v35, v36, v37);
  v38 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
  HGSolidColor::HGSolidColor(v38);
}

@end