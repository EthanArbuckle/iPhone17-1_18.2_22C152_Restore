@interface NTKPrideAnalogFaceViewComplicationFactory
- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5;
- (NTKFaceView)faceView;
- (NTKPrideAnalogFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4;
- (double)_edgeGapForState:(int64_t)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_lisaGapForState:(int64_t)a3;
- (id)_complicationSlots;
- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (int64_t)keylineStyleForComplicationSlot:(id)a3;
- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4;
- (void)cleanupAfterEditingForFaceView:(id)a3;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)loadLayoutRules;
- (void)prepareForEditingForFaceView:(id)a3;
- (void)setFaceView:(id)a3;
@end

@implementation NTKPrideAnalogFaceViewComplicationFactory

- (NTKPrideAnalogFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKPrideAnalogFaceViewComplicationFactory;
  v7 = [(NTKFaceViewComplicationFactory *)&v12 initForDevice:a4];
  v8 = v7;
  if (v7)
  {
    [(NTKPrideAnalogFaceViewComplicationFactory *)v7 setFaceView:v6];
    [(NTKFaceViewComplicationFactory *)v8 setContentSpecificAnimationDuration:0.45];
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NTKFaceViewComplicationFactory *)v8 setForegroundColor:v9];

    v10 = NTKActivityBackgroundPlatterColor();
    [(NTKFaceViewComplicationFactory *)v8 setPlatterColor:v10];
  }
  return v8;
}

- (void)loadLayoutRules
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "face view is nil for NTKPrideAnalogFaceViewComplicationFactory", v1, 2u);
}

void __60__NTKPrideAnalogFaceViewComplicationFactory_loadLayoutRules__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _keylinePaddingForState:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _edgeGapForState:a2];
  double v7 = v5 + v6;
  v8 = [*(id *)(a1 + 32) device];
  double v9 = NTKCircularSmallComplicationDiameter();
  v10 = [*(id *)(a1 + 32) device];
  double v11 = NTKCircularSmallComplicationDiameter();

  double v12 = *(double *)(a1 + 72) - v11 - v7;
  double v13 = *(double *)(a1 + 64) - v9 - v7;
  v14 = [*(id *)(a1 + 32) device];
  v15 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v14, 3, 3, v7, v7, v9, v11, v5, v5, v5, v5);

  v16 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"top-left"];
  [v16 setDefaultLayoutRule:v15 forState:a2];

  [*(id *)(a1 + 32) _lisaGapForState:a2];
  double v18 = v13 - v17;
  v19 = [*(id *)(a1 + 32) device];
  v20 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v19, 3, 3, v18, v7, v9, v11, v5, v5, v5, v5);

  v21 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"top-right"];
  [v21 setDefaultLayoutRule:v20 forState:a2];

  v22 = [*(id *)(a1 + 32) device];
  v23 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v22, 3, 3, v7, v12, v9, v11, v5, v5, v5, v5);

  v24 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"bottom-left"];
  [v24 setDefaultLayoutRule:v23 forState:a2];

  v25 = [*(id *)(a1 + 32) device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v25, 3, 3, v13, v12, v9, v11, v5, v5, v5, v5);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  v26 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"bottom-right"];
  [v26 setDefaultLayoutRule:v27 forState:a2];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  double v6 = +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", [a3 complicationType]);
  double v7 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
  [v6 setForegroundColor:v7];

  v8 = [(NTKFaceViewComplicationFactory *)self platterColor];
  [v6 setPlatterColor:v8];

  return v6;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v5 = a3;
  double v6 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
  [v5 setForegroundColor:v6];

  double v7 = [(NTKFaceViewComplicationFactory *)self platterColor];
  [v5 setPlatterColor:v7];

  [v5 setUseRoundedFontDesign:1];
  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v8];
}

- (int64_t)keylineStyleForComplicationSlot:(id)a3
{
  v3 = [(NTKFaceViewComplicationFactory *)self device];
  int64_t v4 = [v3 deviceCategory] != 1;

  return v4;
}

- (double)_edgeGapForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      v3 = [(NTKFaceViewComplicationFactory *)self device];
      double v4 = NTKColorFaceViewEdgeGapEditing(v3);
    }
    else
    {
      v3 = [(NTKFaceViewComplicationFactory *)self device];
      double v4 = NTKColorFaceViewEdgeGapNormal(v3);
    }
  }
  else
  {
    v3 = [(NTKFaceViewComplicationFactory *)self device];
    double v4 = NTKColorFaceViewEdgeGapDeselected(v3);
  }
  double v5 = v4;

  return v5;
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v5 = NTKKeylineWidth();
    double v6 = [(NTKFaceViewComplicationFactory *)self device];
    double v3 = v5 + NTKColorFaceViewDeselectedKeylineInnerPadding(v6);
  }
  return v3;
}

- (double)_lisaGapForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0.0;
  }
  double v3 = [(NTKFaceViewComplicationFactory *)self device];
  double v4 = NTKColorFaceViewLisaKeylineGap(v3);

  return v4;
}

- (id)_complicationSlots
{
  if (_complicationSlots_onceToken_0 != -1) {
    dispatch_once(&_complicationSlots_onceToken_0, &__block_literal_global_130);
  }
  v2 = (void *)_complicationSlots_slots_0;

  return v2;
}

void __63__NTKPrideAnalogFaceViewComplicationFactory__complicationSlots__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"top-left";
  v2[1] = @"top-right";
  v2[2] = @"bottom-left";
  v2[3] = @"bottom-right";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)_complicationSlots_slots_0;
  _complicationSlots_slots_0 = v0;
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return (unint64_t)a4 > 1;
}

- (void)prepareForEditingForFaceView:(id)a3
{
}

- (void)cleanupAfterEditingForFaceView:(id)a3
{
}

- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if (v4)
  {
    double v6 = [(NTKFaceViewComplicationFactory *)self foregroundColorProviderBlock];

    BOOL v7 = v6 != 0;
    id v8 = [(NTKFaceViewComplicationFactory *)self platterColorProviderBlock];

    if (v8) {
      uint64_t v9 = v7 | 8;
    }
    else {
      uint64_t v9 = v7;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }
  [(NTKFaceViewComplicationFactory *)self applyComplicationContentSpecificAttributesAnimated:v4 attributes:v9 faceView:v10];
}

- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5
{
  if ((a3 & 9) != 0)
  {
    unsigned int v6 = (a3 >> 3) & 1;
    char v7 = a3 & 1;
    id v8 = a4;
    uint64_t v9 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
    id v10 = [(NTKFaceViewComplicationFactory *)self platterColor];
    double v11 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke;
    v22[3] = &unk_1E62C8070;
    char v26 = v7;
    char v27 = v6;
    id v23 = v9;
    id v24 = v10;
    id v12 = v11;
    id v25 = v12;
    id v13 = v10;
    id v14 = v9;
    [v8 enumerateComplicationDisplayWrappersWithBlock:v22];

    [(NTKFaceViewComplicationFactory *)self contentSpecificAnimationDuration];
    double v16 = v15;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3;
    v20[3] = &unk_1E62C0C50;
    id v21 = v12;
    id v17 = v12;
    double v18 = +[NTKFaceViewComplicationFactory _genericComplicationAnimationWithDuration:v20 applier:v16];
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

void __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = [a3 display];
  double v5 = [v4 foregroundColor];
  unsigned int v6 = [v4 platterColor];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2;
  id v17 = &unk_1E62C8048;
  char v23 = *(unsigned char *)(a1 + 56);
  id v18 = v4;
  id v19 = v5;
  id v7 = *(id *)(a1 + 32);
  char v24 = *(unsigned char *)(a1 + 57);
  id v20 = v7;
  id v21 = v6;
  id v22 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  double v11 = _Block_copy(&v14);
  id v12 = *(void **)(a1 + 48);
  id v13 = _Block_copy(v11);
  objc_msgSend(v12, "addObject:", v13, v14, v15, v16, v17);
}

void __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = *(void **)(a1 + 32);
    double v3 = NTKInterpolateBetweenColors();
    [v2 setForegroundColor:v3];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    BOOL v4 = *(void **)(a1 + 32);
    NTKInterpolateBetweenColors();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setPlatterColor:v5];
  }
}

void __130__NTKPrideAnalogFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    float v7 = a2;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(float))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))(v7);
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end