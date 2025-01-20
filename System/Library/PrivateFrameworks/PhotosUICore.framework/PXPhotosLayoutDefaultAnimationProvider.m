@interface PXPhotosLayoutDefaultAnimationProvider
- (id)createAnimationForLayout:(id)a3 presentedLayoutState:(id)a4 targetLayoutState:(id)a5;
@end

@implementation PXPhotosLayoutDefaultAnimationProvider

- (id)createAnimationForLayout:(id)a3 presentedLayoutState:(id)a4 targetLayoutState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 pendingAnimations];
  v11 = [v10 lastObject];

  if (!v11)
  {
    v12 = [v7 superlayout];

    if (v12)
    {
      v13 = [v7 superlayout];
      v11 = [v13 createDefaultAnimationForCurrentContext];
    }
    else
    {
      v11 = [v7 createAnimation];
    }
  }
  v14 = [v8 bodyProvider];
  [v9 bodyProvider];

  v15 = (objc_class *)objc_opt_class();
  v16 = [v11 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v11 delegate];
  }
  else
  {
    v17 = 0;
  }

  v18 = [v17 context];
  v19 = v18;
  if (v18) {
    v20 = v18;
  }
  else {
    v20 = objc_alloc_init(PXPhotosLayoutAnimationContext);
  }
  v21 = v20;

  [(PXPhotosLayoutAnimationContext *)v21 setFromState:v8];
  [(PXPhotosLayoutAnimationContext *)v21 setToState:v9];
  if (v15 == (objc_class *)objc_opt_class()) {
    id v22 = v17;
  }
  else {
    id v22 = (id)[[v15 alloc] initWithContext:v21];
  }
  v23 = v22;
  objc_msgSend(v11, "setCurve:", objc_msgSend(v22, "animationCurve"));
  [v23 animationDuration];
  objc_msgSend(v11, "setDuration:");
  objc_msgSend(v11, "setDoubleSided:", objc_msgSend(v23, "wantsDoubleSidedAnimations"));
  objc_msgSend(v11, "setSupportsPresentationAdjustment:", objc_msgSend(v23, "wantsPresentationAdjustment"));
  objc_msgSend(v11, "setSupportsSpriteTransfer:", objc_msgSend(v23, "wantsAnimationWithSpriteTransfer"));
  objc_msgSend(v11, "setHighFrameRateReason:", objc_msgSend(v23, "highFrameRateReason"));
  [v11 setDelegate:v23];

  return v11;
}

@end