@interface NTKColorCircularUtilitarianFaceViewComplicationFactory
- (BOOL)graphicCornerComplications;
- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKColorCircularUtilitarianFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4 graphicCornerComplications:(BOOL)a5;
- (NTKColorCircularUtilitarianFaceViewComplicationFactoryDelegate)delegate;
- (NTKFaceView)faceView;
- (double)_edgeGapForState:(int64_t)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_lisaGapForState:(int64_t)a3;
- (id)_colorComplicationSlots;
- (id)_complicationSlots;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_utilityComplicationSlots;
- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5;
- (id)curvedMaskForSlot:(id)a3;
- (id)initForDevice:(id)a3;
- (id)keylineViewForComplicationSlot:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (int64_t)keylineStyleForComplicationSlot:(id)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4;
- (void)cleanupAfterEditingForFaceView:(id)a3;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)loadLayoutRules;
- (void)loadLayoutRulesForFaceView:(id)a3;
- (void)prepareForEditingForFaceView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setGraphicCornerComplications:(BOOL)a3;
@end

@implementation NTKColorCircularUtilitarianFaceViewComplicationFactory

- (NTKColorCircularUtilitarianFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4 graphicCornerComplications:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self initForDevice:v9];
  v11 = (NTKColorCircularUtilitarianFaceViewComplicationFactory *)v10;
  if (v10)
  {
    objc_storeWeak(v10 + 14, v8);
    v11->_graphicCornerComplications = a5;
    v12 = [[NTKWhistlerAnalogFaceViewComplicationFactory alloc] initWithFaceView:v8 dialDiameter:v9 device:50.0];
    cornerComplicationFactory = v11->_cornerComplicationFactory;
    v11->_cornerComplicationFactory = v12;

    [(NTKWhistlerAnalogFaceViewComplicationFactory *)v11->_cornerComplicationFactory setUsesNarrowTopSlots:1];
  }

  return v11;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKColorCircularUtilitarianFaceViewComplicationFactory;
  id v5 = [(NTKFaceViewComplicationFactory *)&v16 initForDevice:v4];
  if (v5)
  {
    id v6 = [[NTKUtilityComplicationFactory alloc] initForDevice:v4];
    v7 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;

    [*((id *)v5 + 9) setDelegate:v5];
    [*((id *)v5 + 9) setForegroundAlpha:1.0];
    [*((id *)v5 + 9) setForegroundImageAlpha:1.0];
    [*((id *)v5 + 9) setBottomCenterLayout:3];
    [v5 setContentSpecificAnimationDuration:0.45];
    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [v5 setForegroundColor:v8];

    id v9 = NTKActivityBackgroundPlatterColor();
    [v5 setPlatterColor:v9];

    uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
    v11 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v10;

    uint64_t v12 = NTKActivityBackgroundPlatterColor();
    v13 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v12;

    v14 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = 0;

    objc_storeWeak((id *)v5 + 14, 0);
    *((unsigned char *)v5 + 104) = 0;
  }

  return v5;
}

- (void)loadLayoutRules
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self loadLayoutRulesForFaceView:WeakRetained];
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v13 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _utilityComplicationSlots];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v19 = [v4 complicationLayoutforSlot:v18];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v19, [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _utilitySlotForSlot:v18], v6, v8, v10, v12);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  if (self->_graphicCornerComplications)
  {
    [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory loadLayoutRules];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__NTKColorCircularUtilitarianFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke;
    v20[3] = &unk_1E62C0BD8;
    v20[4] = self;
    id v21 = v4;
    double v22 = v6;
    double v23 = v8;
    double v24 = v10;
    double v25 = v12;
    NTKEnumerateComplicationStates(v20);
  }
}

void __85__NTKColorCircularUtilitarianFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _keylinePaddingForState:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _edgeGapForState:a2];
  double v7 = v5 + v6;
  double v8 = [*(id *)(a1 + 32) device];
  double v9 = NTKCircularSmallComplicationDiameter();
  double v10 = [*(id *)(a1 + 32) device];
  double v11 = NTKCircularSmallComplicationDiameter();

  double v12 = [*(id *)(a1 + 32) device];
  v13 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v12, 3, 3, v7, v7, v9, v11, v5, v5, v5, v5);

  uint64_t v14 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"top-left"];
  [v14 setDefaultLayoutRule:v13 forState:a2];

  double v15 = *(double *)(a1 + 64) - v9 - v7;
  [*(id *)(a1 + 32) _lisaGapForState:a2];
  double v17 = v15 - v16;
  uint64_t v18 = [*(id *)(a1 + 32) device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v18, 3, 3, v17, v7, v9, v11, v5, v5, v5, v5);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  v19 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"top-right"];
  [v19 setDefaultLayoutRule:v20 forState:a2];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  p_faceView = &self->_faceView;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_faceView);
  id v12 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self newLegacyViewForComplication:v10 family:a4 slot:v9 faceView:WeakRetained];

  return v12;
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v11 isEqual:@"bottom-center"])
  {
    id v13 = [(NTKUtilityComplicationFactory *)self->_complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _utilitySlotForSlot:v11]];
    [v12 _configureComplicationView:v13 forSlot:v11];
  }
  else if (self->_graphicCornerComplications)
  {
    id v13 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory newLegacyViewForComplication:v10 family:a4 slot:v11 faceView:v12];
  }
  else
  {
    +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", [v10 complicationType]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
    [v13 setForegroundColor:v14];

    double v15 = [(NTKFaceViewComplicationFactory *)self platterColor];
    [v13 setPlatterColor:v15];
  }
  return v13;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  p_faceView = &self->_faceView;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_faceView);
  [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self configureComplicationView:v8 forSlot:v7 faceView:WeakRetained];
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
  id v11 = [(NTKFaceViewComplicationFactory *)self platterColor];
  objc_storeStrong((id *)&self->_previousForegroundColor, v10);
  objc_storeStrong((id *)&self->_previousPlatterColor, v11);
  if (([v8 isEqualToString:@"top-left"] & 1) != 0
    || [v8 isEqualToString:@"top-right"])
  {
    if (self->_graphicCornerComplications) {
      [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory configureComplicationView:v18 forSlot:v8 faceView:v9];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v18;
      [v9 setComplicationColor:v10];
      [v9 setInterpolatedComplicationColor:v10];
      [v12 transitionToMonochromeWithFraction:1.0];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v18;
      [v13 setForegroundColor:v10];
      [v13 setPlatterColor:v11];
      [v13 setUseRoundedFontDesign:1];
      uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
      [v13 setBackgroundColor:v14];
    }
  }
  if ([v8 isEqual:@"bottom-center"])
  {
    id v15 = v18;
    double v16 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self delegate];
    BOOL v17 = [v16 textLayoutStyleForSlot:v8] == 0;

    [v15 setShouldUseBackgroundPlatter:v17];
    -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self->_complicationFactory, "foregroundAlphaForEditing:", [v9 editing]);
    objc_msgSend(v15, "setForegroundAlpha:");
    [v15 setForegroundColor:v10];
    -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self->_complicationFactory, "foregroundImageAlphaForEditing:", [v9 editing]);
    objc_msgSend(v15, "setForegroundImageAlpha:");
    objc_msgSend(v15, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKColorCircularUtilitarianFaceViewComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v8)));
    if (self->_graphicCornerComplications)
    {
      [v15 setUseRoundedFontDesign:1];
      [v15 setFontWeight:*MEMORY[0x1E4FB09D0]];
    }
  }
}

- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4
{
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory keylineFrameForCornerComplicationSlot:a3 selected:a4];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_graphicCornerComplications
    && (([v4 isEqualToString:@"top-left"] & 1) != 0
     || [v5 isEqualToString:@"top-right"]))
  {
    uint64_t v6 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory keylineViewForComplicationSlot:v5];
  }
  else
  {
    uint64_t v6 = [(NTKUtilityComplicationFactory *)self->_complicationFactory keylineViewForSlot:[(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _utilitySlotForSlot:v5]];
  }
  double v7 = (void *)v6;

  return v7;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  if ([a3 isEqualToString:@"bottom-center"]) {
    return 10;
  }
  else {
    return 0;
  }
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  if (a3 == 10)
  {
    id v4 = @"bottom-center";
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (int64_t)keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKFaceViewComplicationFactory *)self device];
  if ([v5 deviceCategory] == 1)
  {

LABEL_7:
    int64_t v7 = 0;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"top-left"])
  {
  }
  else
  {
    char v6 = [v4 isEqualToString:@"top-right"];

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  int64_t v7 = 1;
LABEL_8:

  return v7;
}

- (double)_edgeGapForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      uint64_t v3 = [(NTKFaceViewComplicationFactory *)self device];
      double v4 = NTKColorFaceViewEdgeGapEditing(v3);
    }
    else
    {
      uint64_t v3 = [(NTKFaceViewComplicationFactory *)self device];
      double v4 = NTKColorFaceViewEdgeGapNormal(v3);
    }
  }
  else
  {
    uint64_t v3 = [(NTKFaceViewComplicationFactory *)self device];
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
    char v6 = [(NTKFaceViewComplicationFactory *)self device];
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

- (id)_utilityComplicationSlots
{
  if (_utilityComplicationSlots_onceToken != -1) {
    dispatch_once(&_utilityComplicationSlots_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_utilityComplicationSlots_slots;
  return v2;
}

void __83__NTKColorCircularUtilitarianFaceViewComplicationFactory__utilityComplicationSlots__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"bottom-center";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)_utilityComplicationSlots_slots;
  _utilityComplicationSlots_slots = v0;
}

- (id)_colorComplicationSlots
{
  if (_colorComplicationSlots_onceToken != -1) {
    dispatch_once(&_colorComplicationSlots_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_colorComplicationSlots_slots;
  return v2;
}

void __81__NTKColorCircularUtilitarianFaceViewComplicationFactory__colorComplicationSlots__block_invoke()
{
  void v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"top-left";
  v2[1] = @"top-right";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)_colorComplicationSlots_slots;
  _colorComplicationSlots_slots = v0;
}

- (id)_complicationSlots
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NTKColorCircularUtilitarianFaceViewComplicationFactory__complicationSlots__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (_complicationSlots_onceToken != -1) {
    dispatch_once(&_complicationSlots_onceToken, block);
  }
  return (id)_complicationSlots_slots;
}

void __76__NTKColorCircularUtilitarianFaceViewComplicationFactory__complicationSlots__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _utilityComplicationSlots];
  v2 = [*(id *)(a1 + 32) _colorComplicationSlots];
  uint64_t v3 = [v5 arrayByAddingObjectsFromArray:v2];
  double v4 = (void *)_complicationSlots_slots;
  _complicationSlots_slots = v3;
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
    char v6 = [(NTKFaceViewComplicationFactory *)self foregroundColorProviderBlock];

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
  unsigned int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v6 & 9) != 0)
  {
    int v10 = (v6 >> 3) & 1;
    char v11 = v6 & 1;
    id v12 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
    id v13 = [(NTKFaceViewComplicationFactory *)self platterColor];
    uint64_t v14 = objc_opt_new();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke;
    v25[3] = &unk_1E62C0C28;
    id v26 = v9;
    long long v27 = self;
    id v28 = v12;
    id v29 = v13;
    id v30 = v8;
    char v32 = v11;
    char v33 = v10;
    id v15 = v14;
    id v31 = v15;
    id v16 = v13;
    id v17 = v12;
    [v30 enumerateComplicationDisplayWrappersWithBlock:v25];
    [(NTKFaceViewComplicationFactory *)self contentSpecificAnimationDuration];
    double v19 = v18;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3;
    v23[3] = &unk_1E62C0C50;
    id v24 = v15;
    id v20 = v15;
    id v21 = +[NTKFaceViewComplicationFactory _genericComplicationAnimationWithDuration:v23 applier:v19];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(void **)(a1 + 32);
  if (!v7 || [v7 containsObject:v5])
  {
    id v8 = *(id *)(*(void *)(a1 + 40) + 88);
    id v9 = *(id *)(*(void *)(a1 + 40) + 96);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2;
    id v20 = &unk_1E62C0C00;
    id v21 = v8;
    id v22 = *(id *)(a1 + 48);
    id v23 = v9;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    id v24 = v10;
    uint64_t v25 = v11;
    id v26 = *(id *)(a1 + 64);
    id v27 = v5;
    __int16 v28 = *(_WORD *)(a1 + 80);
    id v12 = v9;
    id v13 = v8;
    uint64_t v14 = _Block_copy(&v17);
    id v15 = *(void **)(a1 + 72);
    id v16 = _Block_copy(v14);
    objc_msgSend(v15, "addObject:", v16, v17, v18, v19, v20);
  }
}

void __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2(uint64_t a1)
{
  NTKInterpolateBetweenColors();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = NTKInterpolateBetweenColors();
  objc_storeStrong((id *)(*(void *)(a1 + 64) + 88), obj);
  objc_storeStrong((id *)(*(void *)(a1 + 64) + 96), v2);
  uint64_t v3 = [*(id *)(a1 + 72) normalComplicationDisplayWrapperForSlot:*(void *)(a1 + 80)];
  BOOL v4 = [v3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = v5;
    if (*(unsigned char *)(a1 + 88)) {
      [v5 setForegroundColor:obj];
    }
    if (*(unsigned char *)(a1 + 89)) {
      [v6 setPlatterColor:v2];
    }
  }
  if ([v4 conformsToProtocol:&unk_1FCDFD5E8] && *(unsigned char *)(a1 + 88)) {
    [v4 setForegroundColor:obj];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && *(unsigned char *)(a1 + 88))
  {
    BOOL v7 = *(void **)(a1 + 72);
    id v8 = v4;
    [v7 setComplicationColor:obj];
    [*(id *)(a1 + 72) setInterpolatedComplicationColor:obj];
    [v8 transitionToMonochromeWithFraction:1.0];
  }
}

void __143__NTKColorCircularUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3(uint64_t a1, double a2)
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

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  return 0;
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  uint64_t v5 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self delegate];
  uint64_t v6 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _slotForUtilitySlot:a3];
  unint64_t v7 = [v5 textLayoutStyleForSlot:v6];

  return v7;
}

- (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  int64_t v14 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _utilitySlotForSlot:a8];
  id v15 = [(NTKFaceViewComplicationFactory *)self device];
  +[NTKUtilityComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14 forDevice:v15];
}

- (id)curvedMaskForSlot:(id)a3
{
  complicationFactory = self->_complicationFactory;
  int64_t v4 = [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self _utilitySlotForSlot:a3];
  return [(NTKUtilityComplicationFactory *)complicationFactory curvedMaskForSlot:v4];
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (NTKColorCircularUtilitarianFaceViewComplicationFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKColorCircularUtilitarianFaceViewComplicationFactoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)graphicCornerComplications
{
  return self->_graphicCornerComplications;
}

- (void)setGraphicCornerComplications:(BOOL)a3
{
  self->_graphicCornerComplications = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_previousPlatterColor, 0);
  objc_storeStrong((id *)&self->_previousForegroundColor, 0);
  objc_storeStrong((id *)&self->_cornerComplicationFactory, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end