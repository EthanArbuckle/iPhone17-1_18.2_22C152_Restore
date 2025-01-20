@interface PVWipeTransition
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (int)transitionDirection;
- (void)setTransitionDirection:(int)a3;
@end

@implementation PVWipeTransition

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
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v52);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v51);
  v12 = v52;
  *v11 = (HGHWBlendFlipped *)v52;
  if (v12) {
    (*(void (**)(HGNode *))(*(void *)v12 + 16))(v12);
  }
  memset(&v50, 0, sizeof(v50));
  CMTime lhs = (CMTime)*a3;
  [(PVEffect *)self effectRange];
  CMTime rhs = v46;
  CMTimeSubtract(&v50, &lhs, &rhs);
  CMTime time = v50;
  double Seconds = CMTimeGetSeconds(&time);
  [(PVEffect *)self effectRange];
  CMTime v44 = v47;
  double v14 = CMTimeGetSeconds(&v44);
  double v15 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v17 = v16;
  int v18 = [(PVWipeTransition *)self transitionDirection];
  v20.n128_f64[0] = Seconds / v14;
  v20.n128_f32[0] = Seconds / v14;
  switch(v18)
  {
    case 0:
      float v21 = v15 * (float)(1.0 - v20.n128_f32[0]);
      float v22 = v17;
      uint64_t v23 = HGRectMake4f(v19, 0.0, 0.0, v21, v22);
      uint64_t v25 = v24;
      v26 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v26);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v26 + 96))(v26, 0, (float)(int)v23, (float)SHIDWORD(v23), (float)(int)v25, (float)SHIDWORD(v25));
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v26 + 120))(v26, 0, v52);
      v27 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v27);
      (*(void (**)(HGHWBlendFlipped *, void, HGCrop *))(*(void *)v27 + 120))(v27, 0, v26);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v27 + 120))(v27, 1, v51);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v27 + 96))(v27, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v27)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v27;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v27 + 16))(v27);
      }
      goto LABEL_23;
    case 1:
      float v28 = v15 * v20.n128_f32[0];
      float v29 = v17;
      uint64_t v30 = HGRectMake4f(v19, 0.0, 0.0, v28, v29);
      uint64_t v32 = v31;
      v26 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v26);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v26 + 96))(v26, 0, (float)(int)v30, (float)SHIDWORD(v30), (float)(int)v32, (float)SHIDWORD(v32));
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v26 + 120))(v26, 0, v52);
      v27 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v27);
      (*(void (**)(HGHWBlendFlipped *, void, HGCrop *))(*(void *)v27 + 120))(v27, 0, v26);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v27 + 120))(v27, 1, v51);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v27 + 96))(v27, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v27)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v27;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v27 + 16))(v27);
      }
      goto LABEL_23;
    case 2:
      float v33 = v15;
      float v34 = v17 * (float)(1.0 - v20.n128_f32[0]);
      uint64_t v35 = HGRectMake4f(v19, 0.0, 0.0, v33, v34);
      uint64_t v37 = v36;
      v26 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v26);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v26 + 96))(v26, 0, (float)(int)v35, (float)SHIDWORD(v35), (float)(int)v37, (float)SHIDWORD(v37));
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v26 + 120))(v26, 0, v52);
      v27 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v27);
      (*(void (**)(HGHWBlendFlipped *, void, HGCrop *))(*(void *)v27 + 120))(v27, 0, v26);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v27 + 120))(v27, 1, v51);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v27 + 96))(v27, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v27)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v27;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v27 + 16))(v27);
      }
      goto LABEL_23;
    case 3:
      float v38 = v15;
      float v39 = v17 * v20.n128_f32[0];
      uint64_t v40 = HGRectMake4f(v19, 0.0, 0.0, v38, v39);
      uint64_t v42 = v41;
      v26 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v26);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v26 + 96))(v26, 0, (float)(int)v40, (float)SHIDWORD(v40), (float)(int)v42, (float)SHIDWORD(v42));
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v26 + 120))(v26, 0, v52);
      v27 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v27);
      (*(void (**)(HGHWBlendFlipped *, void, HGCrop *))(*(void *)v27 + 120))(v27, 0, v26);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(void *)v27 + 120))(v27, 1, v51);
      (*(void (**)(HGHWBlendFlipped *, void, float, double, double, double))(*(void *)v27 + 96))(v27, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v27)
      {
        if (v12) {
          (*(void (**)(HGNode *))(*(void *)v12 + 24))(v12);
        }
        *v11 = v27;
        (*(void (**)(HGHWBlendFlipped *))(*(void *)v27 + 16))(v27);
      }
LABEL_23:
      (*(void (**)(HGHWBlendFlipped *))(*(void *)v27 + 24))(v27);
      (*(void (**)(HGCrop *))(*(void *)v26 + 24))(v26);
      break;
    default:
      break;
  }
  if (v51) {
    (*(void (**)(HGNode *, __n128))(*(void *)v51 + 24))(v51, v20);
  }
  v43 = v52;
  if (v52) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *, __n128))(*(void *)v52 + 24))(v52, v20);
  }
  return (HGRef<HGNode>)v43;
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