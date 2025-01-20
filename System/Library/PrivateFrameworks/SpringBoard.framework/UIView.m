@interface UIView
@end

@implementation UIView

uint64_t __114__UIView_SBSAC2PropertyAnimating___sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath_caLayerRelativeKeyPath___block_invoke()
{
  return BSEqualObjects();
}

void __99__UIView_SBSAGeometricTypeAnimationDecomposing___independentlyAnimatableMemberKeyPathsForProperty___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"x", @"y", 0);
  v1 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____centerMembers;
  _independentlyAnimatableMemberKeyPathsForProperty____centerMembers = v0;

  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"origin.x", @"origin.y", @"size.width", @"size.height", 0);
  v3 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____boundsMembers;
  _independentlyAnimatableMemberKeyPathsForProperty____boundsMembers = v2;
}

uint64_t __80__UIView_SBSAC2PropertyAnimating__sbsa_isPropertyActivelyC2AnimatingForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 keyPath];
  char v5 = BSEqualStrings();

  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = objc_msgSend(*(id *)(a1 + 40), "_independentlyAnimatableMemberKeyPathsForProperty:", *(void *)(a1 + 48), 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(a1 + 32) stringByAppendingPathExtension:*(void *)(*((void *)&v16 + 1) + 8 * v11)];
          v13 = [v3 keyPath];
          char v14 = BSEqualStrings();

          if (v14)
          {
            uint64_t v6 = 1;
            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v6 = 0;
LABEL_13:
  }
  return v6;
}

uint64_t __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 keyPath];
  uint64_t v3 = BSEqualStrings();

  return v3;
}

uint64_t __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  char v5 = [v2 stringByAppendingPathExtension:v3];
  uint64_t v6 = [v4 keyPath];

  uint64_t v7 = BSEqualStrings();
  return v7;
}

uint64_t __59__UIView_SBSystemActionPreviewPresentable__sb_setInflated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __58__UIView_SBSystemActionPreviewPresentable___popWithBlock___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.1, 1.1);
  [v2 setTransform:&v4];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__UIView_SBSystemActionPreviewPresentable___popWithBlock___block_invoke_2(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4F42FF0];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v3 setBehaviorType:1];
  [v3 setDampingRatio:1.0];
  [v3 setDampingRatioSmoothing:0.0];
  [v3 setResponse:0.5];
  [v3 setResponseSmoothing:0.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__UIView_SBSystemActionPreviewPresentable___popWithBlock___block_invoke_3;
  _OWORD v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "sb_animateWithSettings:mode:animations:completion:", v3, 4, v4, 0);
}

uint64_t __58__UIView_SBSystemActionPreviewPresentable___popWithBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __60__UIView_SBSystemActionPreviewPresentable___shakeWithBlock___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v4, 7.0, 0.0);
  [v2 setTransform:&v4];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__UIView_SBSystemActionPreviewPresentable___shakeWithBlock___block_invoke_2(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4F42FF0];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v3 setBehaviorType:1];
  [v3 setDampingRatio:1.0];
  [v3 setDampingRatioSmoothing:0.0];
  [v3 setResponse:0.45];
  [v3 setResponseSmoothing:0.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__UIView_SBSystemActionPreviewPresentable___shakeWithBlock___block_invoke_3;
  _OWORD v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "sb_animateWithSettings:mode:animations:completion:", v3, 4, v4, 0);
}

uint64_t __60__UIView_SBSystemActionPreviewPresentable___shakeWithBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __58__UIView_SpringBoardAdditions__sb_firstDescendantOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [v2 layer];
  [WeakRetained value];
  double v5 = v4;
  uint64_t v6 = (id *)MEMORY[0x1E4F39EB8];
  uint64_t v7 = SBFEffectiveArtworkSubtype();
  BOOL v8 = v7 == 2622 || v7 == 2868;
  uint64_t v9 = (id *)MEMORY[0x1E4F39EC0];
  if (!v8) {
    uint64_t v9 = v6;
  }
  id v10 = *v9;
  if (v5 >= 20.0)
  {
    id v11 = (id)*MEMORY[0x1E4F39EA8];

    id v10 = v11;
  }
  [v3 setCornerCurve:v10];

  [v3 setCornerRadius:v5];
}

void __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = objc_loadWeakRetained(a1 + 6);
  [WeakRetained presentationValue];
  double v4 = v3;
  if (objc_msgSend(a1[4], "sbsa_isPropertyActivelyC2AnimatingForKeyPath:", @"bounds"))
  {
    [WeakRetained value];
    [WeakRetained presentationValue];
    if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      [v2 bounds];
      double v6 = v5;
      double v8 = v7;
      uint64_t v9 = objc_msgSend(a1[4], "sbsa_presentationModifierValueForKeyPath:", @"bounds");
      id v10 = v9;
      if (v9)
      {
        [v9 CGRectValue];
        double v6 = v11;
        double v8 = v12;
      }
      double v13 = v8 * 0.5;
      if (v8 * 0.5 >= v4) {
        double v13 = v4;
      }
      if (v6 * 0.5 >= v13) {
        double v4 = v13;
      }
      else {
        double v4 = v6 * 0.5;
      }
    }
  }
  char v14 = [NSNumber numberWithDouble:v4];
  v15 = NSNumber;
  [WeakRetained velocity];
  long long v16 = objc_msgSend(v15, "numberWithDouble:");
  [v2 _setPresentationValue:v14 velocity:v16 preferredFrameRateRangeMaximum:120 forKey:@"cornerRadius"];
}

uint64_t __67__UIView_SBPIPAdditions__SBPIP_performWithoutRetargetingAnimation___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] activate];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 commit];
}

uint64_t __91__UIView_SBPIPAdditions__SBPIP_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] activate];
  [MEMORY[0x1E4F39CF8] begin];
  id v2 = (void *)MEMORY[0x1E4F39CF8];
  [*(id *)(a1 + 40) _currentAnimationDuration];
  objc_msgSend(v2, "setAnimationDuration:");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v3 = (void *)MEMORY[0x1E4F39CF8];
  return [v3 commit];
}

void __65__UIView_SBSnapshoting__sb_generateSnapshotContentsSynchronously__block_invoke(uint64_t a1, void *a2)
{
}

void __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "createImageSlot:hasAlpha:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGRectGetMinX(*(CGRect *)(a1 + 72));
  CGRectGetMinY(*(CGRect *)(a1 + 72));
  CARenderServerCaptureLayerWithTransform();
  id object = [MEMORY[0x1E4F39B58] objectForSlot:v2];
  if (object)
  {
    double v3 = [[SBSnapshotSlotIdWrapper alloc] initWithContext:*(void *)(a1 + 32) slotId:v2];
    objc_setAssociatedObject(object, "com.apple.SpringBoard.SBAppViewSnapshotSlotIdWrapper", v3, (void *)0x301);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id, double))(v4 + 16))(v4, object, *(double *)(a1 + 104));
  }
}

uint64_t __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end