@interface PVExposureAdjust
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVExposureAdjust

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
  [(NSLock *)self->super.super._inspectablePropertiesLock lock];
  v10 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"kPVExposureAdjustOffset"];
  [v10 floatValue];
  float v12 = v11;

  [(NSLock *)self->super.super._inspectablePropertiesLock unlock];
  Node = PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v15);
  if (fabsf(v12) >= 0.0001)
  {
    v14 = (HgcExposureAdjust *)HGObject::operator new(0x1A0uLL);
    HgcExposureAdjust::HgcExposureAdjust(v14);
    (*(void (**)(HgcExposureAdjust *, void, HGNode *))(*(void *)v14 + 120))(v14, 0, v15);
    (*(void (**)(HgcExposureAdjust *, void, float, float, float, float))(*(void *)v14 + 96))(v14, 0, v12, v12, v12, v12);
    *id v9 = v14;
    Node = v15;
    if (v15) {
      return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v15 + 24))(v15);
    }
  }
  else
  {
    *id v9 = (HgcExposureAdjust *)v15;
  }
  return (HGRef<HGNode>)Node;
}

@end