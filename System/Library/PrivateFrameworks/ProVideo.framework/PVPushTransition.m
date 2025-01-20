@interface PVPushTransition
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (int)transitionDirection;
- (void)setTransitionDirection:(int)a3;
@end

@implementation PVPushTransition

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.transition", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v7 withProperties:v6];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v11 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v35);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v34);
  v12 = v35;
  *v11 = (HGHWBlendFlipped *)v35;
  if (v12) {
    (*(void (**)(HGNode *))(*(void *)v12 + 16))(v12);
  }
  memset(&v33, 0, sizeof(v33));
  CMTime lhs = (CMTime)*a3;
  [(PVEffect *)self effectRange];
  CMTime rhs = v28[0];
  CMTimeSubtract(&v33, &lhs, &rhs);
  CMTime time = v33;
  double Seconds = CMTimeGetSeconds(&time);
  [(PVEffect *)self effectRange];
  CMTime v29 = v28[1];
  double v14 = CMTimeGetSeconds(&v29);
  HGTransform::HGTransform((HGTransform *)v28);
  HGTransform::HGTransform((HGTransform *)v27);
  v15 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v15);
  v16 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v16);
  double v17 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v19 = v18;
  float v20 = Seconds / v14;
  switch([(PVPushTransition *)self transitionDirection])
  {
    case 0:
      float v21 = v17;
      HGTransform::Translate((HGTransform *)v28, (float)((float)((float)(1.0 - v20) * 0.0) - (float)(v20 * v21)), 0.0, 0.0);
      HGTransform::Translate((HGTransform *)v27, (float)((float)(v20 * 0.0) + (float)((float)(1.0 - v20) * v21)), 0.0, 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, unsigned char *))(*(void *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(void *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v22 + 16))(v22);
      }
      goto LABEL_25;
    case 1:
      float v23 = v17;
      HGTransform::Translate((HGTransform *)v28, (float)((float)((float)(1.0 - v20) * 0.0) + (float)(v20 * v23)), 0.0, 0.0);
      HGTransform::Translate((HGTransform *)v27, (float)((float)(v20 * 0.0) - (float)((float)(1.0 - v20) * v23)), 0.0, 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, unsigned char *))(*(void *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(void *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v22 + 16))(v22);
      }
      goto LABEL_25;
    case 2:
      float v24 = v19;
      HGTransform::Translate((HGTransform *)v28, 0.0, (float)((float)((float)(1.0 - v20) * 0.0) - (float)(v20 * v24)), 0.0);
      HGTransform::Translate((HGTransform *)v27, 0.0, (float)((float)(v20 * 0.0) + (float)((float)(1.0 - v20) * v24)), 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, unsigned char *))(*(void *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(void *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v22 + 16))(v22);
      }
      goto LABEL_25;
    case 3:
      float v25 = v19;
      HGTransform::Translate((HGTransform *)v28, 0.0, (float)((float)((float)(1.0 - v20) * 0.0) + (float)(v20 * v25)), 0.0);
      HGTransform::Translate((HGTransform *)v27, 0.0, (float)((float)(v20 * 0.0) - (float)((float)(1.0 - v20) * v25)), 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, unsigned char *))(*(void *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(void *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v22 + 16))(v22);
      }
LABEL_25:
      (*(void (**)(HGHWBlendFlipped *))(*(void *)v22 + 24))(v22);
      goto LABEL_26;
    default:
      if (v16) {
LABEL_26:
      }
        (*(void (**)(HGXForm *))(*(void *)v16 + 24))(v16);
      if (v15) {
        (*(void (**)(HGXForm *))(*(void *)v15 + 24))(v15);
      }
      HGTransform::~HGTransform((HGTransform *)v27);
      HGTransform::~HGTransform((HGTransform *)v28);
      if (v34) {
        (*(void (**)(HGNode *))(*(void *)v34 + 24))(v34);
      }
      v26 = v35;
      if (v35) {
        return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v35 + 24))(v35);
      }
      return (HGRef<HGNode>)v26;
  }
}

- (int)transitionDirection
{
  return self->_transitionDirection;
}

- (void)setTransitionDirection:(int)a3
{
  self->_transitionDirection = a3;
}

@end