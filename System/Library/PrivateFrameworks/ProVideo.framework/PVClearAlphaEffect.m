@interface PVClearAlphaEffect
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVClearAlphaEffect

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
  v8 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v13);
  id v9 = (HGInvertAlpha *)v13;
  void *v8 = v13;
  if (v9) {
    (*(void (**)(HGInvertAlpha *))(*(void *)v9 + 16))(v9);
  }
  [(NSLock *)self->super.super._inspectablePropertiesLock lock];
  [(NSLock *)self->super.super._inspectablePropertiesLock unlock];
  FxApplyAlphaRequest((HGInvertAlpha **)&v13, 0, 0, 0, &v12);
  if (v9 == v12) {
    goto LABEL_8;
  }
  if (v9) {
    (*(void (**)(HGInvertAlpha *))(*(void *)v9 + 24))(v9);
  }
  v10 = v12;
  void *v8 = v12;
  if (v10)
  {
    (*(void (**)(HGInvertAlpha *))(*(void *)v10 + 16))(v10);
    id v9 = v12;
LABEL_8:
    if (v9) {
      (*(void (**)(HGInvertAlpha *))(*(void *)v9 + 24))(v9);
    }
  }
  v11 = v13;
  if (v13) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v13 + 24))(v13);
  }
  return (HGRef<HGNode>)v11;
}

@end