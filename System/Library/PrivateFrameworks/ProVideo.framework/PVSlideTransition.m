@interface PVSlideTransition
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (int)transitionDirection;
- (void)setTransitionDirection:(int)a3;
@end

@implementation PVSlideTransition

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
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v33);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v32);
  v12 = v33;
  *v11 = (HGHWBlendFlipped *)v33;
  if (v12) {
    (*(void (**)(HGNode *))(*(void *)v12 + 16))(v12);
  }
  memset(&v31, 0, sizeof(v31));
  CMTime lhs = (CMTime)*a3;
  [(PVEffect *)self effectRange];
  CMTime rhs = v26[0];
  CMTimeSubtract(&v31, &lhs, &rhs);
  CMTime time = v31;
  double Seconds = CMTimeGetSeconds(&time);
  [(PVEffect *)self effectRange];
  CMTime v27 = v26[1];
  double v14 = CMTimeGetSeconds(&v27);
  double v15 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v17 = v16;
  float v18 = Seconds / v14;
  switch([(PVSlideTransition *)self transitionDirection])
  {
    case 0:
      HGTransform::HGTransform((HGTransform *)v26);
      float v19 = -(v15 * v18);
      HGTransform::Translate((HGTransform *)v26, v19, 0.0, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v20 + 120))(v20, 0, v33);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v21 + 120))(v21, 0, v20);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v21 + 120))(v21, 1, v32);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v21 + 16))(v21);
      }
      goto LABEL_23;
    case 1:
      HGTransform::HGTransform((HGTransform *)v26);
      float v22 = v15 * v18;
      HGTransform::Translate((HGTransform *)v26, v22, 0.0, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v20 + 120))(v20, 0, v32);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, void, HGNode *))(*(void *)v21 + 120))(v21, 0, v33);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(void *)v21 + 120))(v21, 1, v20);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v21 + 16))(v21);
      }
      goto LABEL_23;
    case 2:
      HGTransform::HGTransform((HGTransform *)v26);
      float v23 = -(v17 * v18);
      HGTransform::Translate((HGTransform *)v26, 0.0, v23, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v20 + 120))(v20, 0, v33);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v21 + 120))(v21, 0, v20);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v21 + 120))(v21, 1, v32);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v21 + 16))(v21);
      }
      goto LABEL_23;
    case 3:
      HGTransform::HGTransform((HGTransform *)v26);
      float v24 = -(v17 * v18);
      HGTransform::Translate((HGTransform *)v26, 0.0, v24, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(void *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v20 + 120))(v20, 0, v33);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, void, HGXForm *))(*(void *)v21 + 120))(v21, 0, v20);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v21 + 120))(v21, 1, v32);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v21 + 16))(v21);
      }
LABEL_23:
      (*(void (**)(HGHWBlendFlipped *))(*(void *)v21 + 24))(v21);
      (*(void (**)(HGXForm *))(*(void *)v20 + 24))(v20);
      HGTransform::~HGTransform((HGTransform *)v26);
      break;
    default:
      break;
  }
  if (v32) {
    (*(void (**)(HGNode *))(*(void *)v32 + 24))(v32);
  }
  v25 = v33;
  if (v33) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v33 + 24))(v33);
  }
  return (HGRef<HGNode>)v25;
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