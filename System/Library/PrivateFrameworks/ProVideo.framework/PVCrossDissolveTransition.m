@interface PVCrossDissolveTransition
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVCrossDissolveTransition

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.transition", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v7 withProperties:v6];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v9 = v6;
  memset(&v21, 0, sizeof(v21));
  CMTime lhs = *(CMTime *)a3;
  [(PVEffect *)self effectRange];
  CMTime rhs = v18[0];
  CMTimeSubtract(&v21, &lhs, &rhs);
  CMTime time = v21;
  double Seconds = CMTimeGetSeconds(&time);
  [(PVEffect *)self effectRange];
  CMTime v16 = v18[1];
  double v11 = CMTimeGetSeconds(&v16);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, (HGNode **)v18);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v15);
  v12 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
  HGHWBlendFlipped::HGHWBlendFlipped(v12);
  (*(void (**)(HGHWBlendFlipped *, void, HGNode *))(*(void *)v12 + 120))(v12, 0, v15);
  (*(void (**)(HGHWBlendFlipped *, uint64_t, CMTimeValue))(*(void *)v12 + 120))(v12, 1, v18[0].value);
  (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v12 + 96))(v12, 0, 9.0, 0.0, 0.0, 0.0);
  float v13 = Seconds / v11;
  (*(void (**)(HGHWBlendFlipped *, uint64_t, float, double, double, double))(*(void *)v12 + 96))(v12, 1, v13, 0.0, 0.0, 0.0);
  *v9 = v12;
  if (v15) {
    (*(void (**)(HGNode *))(*(void *)v15 + 24))(v15);
  }
  CMTimeValue value = v18[0].value;
  if (v18[0].value) {
    return (HGRef<HGNode>)(*(uint64_t (**)(CMTimeValue))(*(void *)v18[0].value + 24))(v18[0].value);
  }
  return (HGRef<HGNode>)value;
}

@end