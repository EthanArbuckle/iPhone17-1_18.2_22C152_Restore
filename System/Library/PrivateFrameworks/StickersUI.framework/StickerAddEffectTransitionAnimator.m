@interface StickerAddEffectTransitionAnimator
- (CGRect)frameIncludingStrokeForView:(id)a3;
- (double)transitionScaleForView:(id)a3;
@end

@implementation StickerAddEffectTransitionAnimator

- (double)transitionScaleForView:(id)a3
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4) {
    return 1.0;
  }
  v5 = (void *)v4;
  v6 = self;
  id v7 = a3;
  swift_retain();
  id v8 = objc_msgSend(v5, sel_effect);
  unint64_t v9 = (unint64_t)objc_msgSend(v8, sel_type);

  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v5, sel_bounds);
    objc_msgSend(v6, sel_extraScaleToIncludeStrokeWithEffectType_bounds_, v9);
    double v12 = v11;
    swift_release();

    return v12;
  }
  return result;
}

- (CGRect)frameIncludingStrokeForView:(id)a3
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = (double (*)(uint64_t))*((void *)self->super.isa + 58);
    id v8 = a3;
    swift_retain();
    double v9 = v7(v6);
    objc_msgSend(v8, sel_frame);
    double v14 = sub_25E492C98(v10, v11, v12, v13);
    double v16 = v15;
    objc_msgSend(v8, sel_frame);
    double v18 = sub_25E492C80(v14, v16, v9 * v17);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    swift_release();
  }
  else
  {
    objc_msgSend(a3, sel_frame);
    double v18 = v25;
    double v20 = v26;
    double v22 = v27;
    double v24 = v28;
  }
  double v29 = v18;
  double v30 = v20;
  double v31 = v22;
  double v32 = v24;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

@end