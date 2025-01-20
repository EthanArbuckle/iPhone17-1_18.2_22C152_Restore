@interface PVSimpleTransition
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVSimpleTransition

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.transition", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v7 withProperties:v6];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v10 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v24);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v23);
  memset(&v22, 0, sizeof(v22));
  CMTime lhs = *(CMTime *)a3;
  [(PVEffect *)self effectRange];
  CMTime rhs = v18;
  CMTimeSubtract(&v22, &lhs, &rhs);
  CMTime time = v22;
  double Seconds = CMTimeGetSeconds(&time);
  [(PVEffect *)self effectRange];
  CMTime v16 = v19;
  double v12 = CMTimeGetSeconds(&v16);
  v13 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
  HGHWBlendFlipped::HGHWBlendFlipped(v13);
  (*(void (**)(HGHWBlendFlipped *, void, HGNode *))(*(void *)v13 + 120))(v13, 0, v23);
  (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v13 + 120))(v13, 1, v24);
  (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v13 + 96))(v13, 0, 9.0, 0.0, 0.0, 0.0);
  float v14 = Seconds / v12;
  (*(void (**)(HGHWBlendFlipped *, uint64_t, float, double, double, double))(*(void *)v13 + 96))(v13, 1, v14, 0.0, 0.0, 0.0);
  *v10 = v13;
  if (v23) {
    (*(void (**)(HGNode *))(*(void *)v23 + 24))(v23);
  }
  v15 = v24;
  if (v24) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v24 + 24))(v24);
  }
  return (HGRef<HGNode>)v15;
}

@end