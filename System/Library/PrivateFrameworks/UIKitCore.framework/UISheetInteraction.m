@interface UISheetInteraction
@end

@implementation UISheetInteraction

void __27___UISheetInteraction_init__block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(void *)a2 = 0;
  v3 = [WeakRetained detentGetter];
  v4 = [WeakRetained indexOfCurrentDetentGetter];
  uint64_t v5 = v4[2]();
  *(double *)(a2 + 8) = v3[2](v3, v5);
}

id __27___UISheetInteraction_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained numberOfDetentsGetter];
  unint64_t v3 = v2[2]();

  v4 = [WeakRetained detentPoints];
  uint64_t v5 = [WeakRetained interactor];
  uint64_t v6 = [v5 _dimensions];

  while ([v4 count] < v3)
  {
    v7 = [[_UIHyperpoint alloc] initWithDimensions:v6];
    [v4 addObject:v7];
  }
  if (v3 < [v4 count]) {
    objc_msgSend(v4, "removeObjectsInRange:", v3, objc_msgSend(v4, "count") - v3);
  }
  if (v3)
  {
    uint64_t v8 = 0;
    double v9 = 2.22507386e-308;
    double v10 = 1.79769313e308;
    do
    {
      v11 = [WeakRetained detentGetter];
      double v12 = v11[2](v11, v8);

      v13 = [v4 objectAtIndexedSubscript:v8];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __27___UISheetInteraction_init__block_invoke_2;
      v21[3] = &__block_descriptor_40_e9_v16__0_d8l;
      *(double *)&v21[4] = v12;
      [v13 _mutateValue:v21];

      if (v10 >= v12) {
        double v10 = v12;
      }
      if (v9 < v12) {
        double v9 = v12;
      }
      ++v8;
    }
    while (v3 != v8);
  }
  else
  {
    double v10 = 1.79769313e308;
    double v9 = 2.22507386e-308;
  }
  v14 = [WeakRetained detentUnion];
  [v14 _setRegions:v4];

  v15 = [WeakRetained detentContinuum];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __27___UISheetInteraction_init__block_invoke_3;
  v20[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v20[4] = v10;
  [v15 _mutateMinimumPoint:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __27___UISheetInteraction_init__block_invoke_4;
  v19[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v19[4] = v9;
  [v15 _mutateMaximumPoint:v19];
  if ([WeakRetained isDragging])
  {
    id v16 = v15;
  }
  else
  {
    id v16 = [WeakRetained detentUnion];
  }
  v17 = v16;

  return v17;
}

double __27___UISheetInteraction_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0;
  double result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

double __27___UISheetInteraction_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0;
  double result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

double __27___UISheetInteraction_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0;
  double result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

id __27___UISheetInteraction_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained extender];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27___UISheetInteraction_init__block_invoke_6;
  v8[3] = &unk_1E52DB3A0;
  id v3 = WeakRetained;
  id v9 = v3;
  [v2 _mutateExtentBeyondMinimum:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27___UISheetInteraction_init__block_invoke_7;
  v6[3] = &unk_1E52DB3A0;
  id v7 = v3;
  id v4 = v3;
  [v2 _mutateExtentBeyondMaximum:v6];

  return v2;
}

void __27___UISheetInteraction_init__block_invoke_6(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0x4059000000000000;
  id v3 = [*(id *)(a1 + 32) rubberBandExtentBeyondMinimumOffsetGetter];
  *(double *)(a2 + 8) = v3[2]();
}

void __27___UISheetInteraction_init__block_invoke_7(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0x4059000000000000;
  id v3 = [*(id *)(a1 + 32) rubberBandExtentBeyondMaximumOffsetGetter];
  *(double *)(a2 + 8) = v3[2]();
}

void __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [UIViewPropertyAnimator alloc];
    double v3 = _UISheetTransitionDuration();
    id v4 = _UISheetTransitionTimingCurve();
    uint64_t v5 = [(UIViewPropertyAnimator *)v2 initWithDuration:v4 timingParameters:v3];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_2;
    v6[3] = &unk_1E52D9F70;
    void v6[4] = *(void *)(a1 + 32);
    [(UIViewPropertyAnimator *)v5 addAnimations:v6];
    [(UIViewPropertyAnimator *)v5 startAnimation];
  }
}

uint64_t __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_3;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048612, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendCurrentOffsetDidChange];
}

void __45___UISheetInteraction_draggingEndedInSource___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) interactor];
  double v3 = [*(id *)(a1 + 32) detentPoints];
  CAFrameRateRange v4 = [*(id *)(a1 + 32) detentUnion];
  uint64_t v5 = [v2 _translatedUnconstrainedPoint];
  uint64_t v24 = 0;
  double v25 = 0.0;
  uint64_t v6 = [v4 _regionIndexForClosestPoint:&v24 toPoint:v5];
  double v7 = *(double *)(v5 + 8);
  double v8 = v25;
  unint64_t v9 = objc_msgSend(v4, "_regionIndexForClosestPoint:toPoint:", 0, objc_msgSend(v2, "_projectedPoint"));
  double v10 = *(double *)([v2 _velocity] + 8);
  double v11 = fabs(v10);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SheetSpeedThreshold, @"SheetSpeedThreshold", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v12 = 1000.0; {
  else
  }
    double v12 = *(double *)&qword_1E8FD4F30;
  uint64_t v13 = *(void *)&v10;
  if ((unint64_t)[v3 count] < 2)
  {
    uint64_t v17 = 1;
  }
  else
  {
    v14 = [v3 objectAtIndexedSubscript:0];
    double v15 = *(double *)([v14 _value] + 8);
    id v16 = [v3 objectAtIndexedSubscript:1];
    if (v15 <= *(double *)([v16 _value] + 8)) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = -1;
    }
  }
  BOOL v18 = v11 >= v12 && v6 == v9;
  if (v18 && v7 < v8 == v13 < 0)
  {
    if (v13 >= 0) {
      uint64_t v19 = v17;
    }
    else {
      uint64_t v19 = -v17;
    }
    unint64_t v9 = (v19 + v6) & ~((v19 + v6) >> 63);
    v20 = [v4 _regions];
    unint64_t v21 = [v20 count] - 1;

    if (v9 >= v21) {
      unint64_t v9 = v21;
    }
  }
  [*(id *)(a1 + 32) setIndexOfCurrentDetent:v9];
  v22 = _UISheetTransitionSpringParametersHighSpeed(v11 >= v12);
  v23 = [*(id *)(a1 + 32) animator];
  [v23 _setInteractionEndedSpringParameters:v22];

  [*(id *)(a1 + 32) setDragSource:0];
}

@end