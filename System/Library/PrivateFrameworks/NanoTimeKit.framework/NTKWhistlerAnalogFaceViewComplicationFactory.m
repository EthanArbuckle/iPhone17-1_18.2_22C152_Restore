@interface NTKWhistlerAnalogFaceViewComplicationFactory
- (BOOL)_convertCircularSlot:(id)a3 toPosition:(int64_t *)a4;
- (BOOL)_convertCornerSlot:(id)a3 toPosition:(int64_t *)a4;
- (BOOL)_isCenterComplicationForSlot:(id)a3;
- (BOOL)_isCornerComplicationForSlot:(id)a3;
- (BOOL)usesNarrowTopSlots;
- (CGPoint)circularComplicationCenterForSlot:(id)a3 inFaceBounds:(CGRect)a4;
- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKFaceView)faceView;
- (NTKWhistlerAnalogFaceViewComplicationFactory)initWithFaceView:(id)a3 dialDiameter:(double)a4 device:(id)a5;
- (double)_edgeGapForState:(int64_t)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_lisaGapForState:(int64_t)a3;
- (double)dialDiameter;
- (id)_cornerKeylineViewForSlot:(id)a3;
- (id)initForDevice:(id)a3;
- (id)keylineViewForComplicationSlot:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (int64_t)complicationPickerStyleForSlot:(id)a3;
- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRules;
- (void)loadLayoutRulesForFaceView:(id)a3;
- (void)loadLayoutRulesForFaceView:(id)a3 dialDiameter:(double)a4;
- (void)setAlpha:(double)a3 faceView:(id)a4;
- (void)setDialDiameter:(double)a3;
- (void)setFaceView:(id)a3;
- (void)setUsesNarrowTopSlots:(BOOL)a3;
@end

@implementation NTKWhistlerAnalogFaceViewComplicationFactory

- (NTKWhistlerAnalogFaceViewComplicationFactory)initWithFaceView:(id)a3 dialDiameter:(double)a4 device:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKWhistlerAnalogFaceViewComplicationFactory;
  v9 = [(NTKFaceViewComplicationFactory *)&v13 initForDevice:a5];
  v10 = (NTKWhistlerAnalogFaceViewComplicationFactory *)v9;
  if (v9)
  {
    objc_storeWeak(v9 + 10, v8);
    v10->_dialDiameter = a4;
    v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NTKFaceViewComplicationFactory *)v10 setForegroundColor:v11];
  }
  return v10;
}

- (id)initForDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWhistlerAnalogFaceViewComplicationFactory;
  id v3 = [(NTKFaceViewComplicationFactory *)&v6 initForDevice:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [v3 setForegroundColor:v4];
  }
  return v3;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self faceView];
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self configureComplicationView:v7 forSlot:v6 faceView:v8];
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self faceView];
  int64_t v8 = [(NTKFaceViewComplicationFactory *)self legacyLayoutOverrideforComplicationType:a3 slot:v6 faceView:v7];

  return v8;
}

- (void)loadLayoutRules
{
  id v3 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self faceView];
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self dialDiameter];
  -[NTKWhistlerAnalogFaceViewComplicationFactory loadLayoutRulesForFaceView:dialDiameter:](self, "loadLayoutRulesForFaceView:dialDiameter:", v3);
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self faceView];
  id v11 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self newLegacyViewForComplication:v9 family:a4 slot:v8 faceView:v10];

  return v11;
}

- (CGPoint)circularComplicationCenterForSlot:(id)a3 inFaceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v7 = a3;
  id v8 = [(NTKFaceViewComplicationFactory *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    id v11 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
    if (v11 == v8)
    {
      uint64_t v12 = [v8 version];
      uint64_t v13 = _LayoutConstants___previousCLKDeviceVersion_6;

      if (v12 == v13) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v14 = objc_storeWeak(&_LayoutConstants___cachedDevice_6, v8);
  _LayoutConstants___previousCLKDeviceVersion_6 = [v8 version];

  _LayoutConstants__constants_0 = NTKWhistlerSubdialComplicationDistanceFromCenter(v8);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  double v15 = *(double *)&_LayoutConstants__constants_0;

  double v16 = width * 0.5;
  double v17 = height * 0.5;
  if ([v7 isEqualToString:@"slot1"])
  {
    double v16 = v16 - v15;
  }
  else if ([v7 isEqualToString:@"slot2"])
  {
    double v16 = v16 + v15;
  }
  else if ([v7 isEqualToString:@"slot3"])
  {
    double v17 = v17 + v15;
  }
  else
  {
    int v18 = [v7 isEqualToString:@"bezel"];
    double v19 = 0.0;
    if (v18) {
      double v19 = v15;
    }
    double v17 = v17 - v19;
  }

  double v20 = v16;
  double v21 = v17;
  result.y = v21;
  result.x = v20;
  return result;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _isCornerComplicationForSlot:v4])
  {
    v5 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self _cornerKeylineViewForSlot:v4];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"bezel"])
  {
    id v6 = NTKRichComplicationBezelView;
LABEL_7:
    id v7 = [(NTKFaceViewComplicationFactory *)self device];
    v5 = [(__objc2_class *)v6 keylineViewForDevice:v7];

    goto LABEL_9;
  }
  if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _isCenterComplicationForSlot:v4])
  {
    id v6 = NTKRichComplicationCircularBaseView;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"bezel"] & 1) != 0
    || [(NTKWhistlerAnalogFaceViewComplicationFactory *)self _isCornerComplicationForSlot:v4])
  {
    int64_t v5 = 3;
  }
  else if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _isCenterComplicationForSlot:v4])
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4 = a3;
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self dialDiameter];
  -[NTKWhistlerAnalogFaceViewComplicationFactory loadLayoutRulesForFaceView:dialDiameter:](self, "loadLayoutRulesForFaceView:dialDiameter:", v4);
}

- (void)loadLayoutRulesForFaceView:(id)a3 dialDiameter:(double)a4
{
  id v6 = a3;
  [v6 bounds];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  double v15 = [(NTKFaceViewComplicationFactory *)self device];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__NTKWhistlerAnalogFaceViewComplicationFactory_loadLayoutRulesForFaceView_dialDiameter___block_invoke;
  v18[3] = &unk_1E62C1588;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  uint64_t v25 = v14;
  id v19 = v6;
  id v20 = v15;
  double v21 = self;
  double v26 = a4;
  id v16 = v15;
  id v17 = v6;
  NTKEnumerateComplicationStates(v18);
}

void __88__NTKWhistlerAnalogFaceViewComplicationFactory_loadLayoutRulesForFaceView_dialDiameter___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"top-left"];
  int64_t v5 = +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 0, *(void *)(a1 + 40), [*(id *)(a1 + 48) usesNarrowTopSlots], *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [v4 setDefaultLayoutRule:v5 forState:a2];
  id v6 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"top-right"];

  uint64_t v7 = +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 1, *(void *)(a1 + 40), [*(id *)(a1 + 48) usesNarrowTopSlots], *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [v6 setDefaultLayoutRule:v7 forState:a2];
  uint64_t v8 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"bottom-left"];

  uint64_t v9 = +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 2, *(void *)(a1 + 40), [*(id *)(a1 + 48) usesNarrowTopSlots], *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [v8 setDefaultLayoutRule:v9 forState:a2];
  uint64_t v10 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"bottom-right"];

  uint64_t v11 = +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 3, *(void *)(a1 + 40), [*(id *)(a1 + 48) usesNarrowTopSlots], *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [v10 setDefaultLayoutRule:v11 forState:a2];
  uint64_t v12 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"slot1"];

  objc_msgSend(*(id *)(a1 + 48), "circularComplicationCenterForSlot:inFaceBounds:", @"slot1", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v14 = v13;
  double v16 = v15;
  id v17 = [*(id *)(a1 + 48) device];
  int v18 = +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:forDevice:", a2, 0, v17, v14, v16);

  [v12 setDefaultLayoutRule:v18 forState:a2];
  id v19 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"slot2"];

  objc_msgSend(*(id *)(a1 + 48), "circularComplicationCenterForSlot:inFaceBounds:", @"slot2", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v21 = v20;
  double v23 = v22;
  uint64_t v24 = [*(id *)(a1 + 48) device];
  uint64_t v25 = +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:forDevice:", a2, 1, v24, v21, v23);

  [v19 setDefaultLayoutRule:v25 forState:a2];
  double v26 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"slot3"];

  objc_msgSend(*(id *)(a1 + 48), "circularComplicationCenterForSlot:inFaceBounds:", @"slot3", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v28 = v27;
  double v30 = v29;
  v31 = [*(id *)(a1 + 48) device];
  v32 = +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:forDevice:", a2, 2, v31, v28, v30);

  [v26 setDefaultLayoutRule:v32 forState:a2];
  v33 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"bezel"];

  +[NTKRichComplicationBezelView layoutRuleForState:faceBounds:dialDiameter:forDevice:](NTKRichComplicationBezelView, "layoutRuleForState:faceBounds:dialDiameter:forDevice:", a2, *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  id v34 = (id)objc_claimAutoreleasedReturnValue();

  [v33 setDefaultLayoutRule:v34 forState:a2];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _isCenterComplicationForSlot:v11])
  {
    double v13 = NTKRichComplicationCircularBaseView;
LABEL_9:
    uint64_t v14 = -[__objc2_class viewWithLegacyComplicationType:](v13, "viewWithLegacyComplicationType:", [v10 complicationType]);
    goto LABEL_10;
  }
  if (![(NTKWhistlerAnalogFaceViewComplicationFactory *)self _isCornerComplicationForSlot:v11])
  {
    if (![v11 isEqualToString:@"bezel"])
    {
      double v15 = 0;
      goto LABEL_11;
    }
    double v13 = NTKRichComplicationBezelView;
    goto LABEL_9;
  }
  if (a4 != 4)
  {
    double v13 = NTKRichComplicationCornerUtilities;
    goto LABEL_9;
  }
  uint64_t v14 = +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", [v10 complicationType]);
LABEL_10:
  double v15 = (void *)v14;
LABEL_11:
  [v12 _configureComplicationView:v15 forSlot:v11];

  return v15;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 conformsToProtocol:&unk_1FCD8CF80])
  {
    id v9 = v7;
    uint64_t v10 = 0;
    if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _convertCornerSlot:v8 toPosition:&v10])
    {
      [v9 setCornerComplicationPosition:v10];
    }
LABEL_7:
    [(NTKFaceViewComplicationFactory *)self alpha];
    objc_msgSend(v9, "setAlpha:");

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    uint64_t v10 = 0;
    if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _convertCircularSlot:v8 toPosition:&v10])
    {
      [v9 setPosition:v10];
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)_isCenterComplicationForSlot:(id)a3
{
  id v3 = a3;
  if (([v3 isEqual:@"slot1"] & 1) != 0
    || ([v3 isEqual:@"slot2"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqual:@"slot3"];
  }

  return v4;
}

- (BOOL)_isCornerComplicationForSlot:(id)a3
{
  id v3 = a3;
  if (([v3 isEqual:@"top-left"] & 1) != 0
    || ([v3 isEqual:@"top-right"] & 1) != 0
    || ([v3 isEqual:@"bottom-left"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqual:@"bottom-right"];
  }

  return v4;
}

- (id)_cornerKeylineViewForSlot:(id)a3
{
  uint64_t v8 = 0;
  char v4 = 0;
  if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _convertCornerSlot:a3 toPosition:&v8])
  {
    uint64_t v5 = v8;
    id v6 = [(NTKFaceViewComplicationFactory *)self device];
    char v4 = +[NTKRichComplicationCornerUtilities keylineViewForPosition:v5 forDevice:v6 narrowTopSlots:[(NTKWhistlerAnalogFaceViewComplicationFactory *)self usesNarrowTopSlots]];
  }
  return v4;
}

- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v63 = 0;
  if ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self _convertCornerSlot:v6 toPosition:&v63])
  {
    id v7 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self faceView];
    uint64_t v8 = v7;
    if (v7)
    {
      if (v4) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 2;
      }
      uint64_t v10 = v63;
      [v7 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      id v19 = [(NTKFaceViewComplicationFactory *)self device];
      double v20 = +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", v9, v10, v19, [(NTKWhistlerAnalogFaceViewComplicationFactory *)self usesNarrowTopSlots], v12, v14, v16, v18);

      [v20 referenceFrame];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      [v20 keylinePadding];
      double v32 = v22 - v31;
      double v34 = v24 - v33;
      double v35 = v26 - (-v30 - v31);
      double v36 = v28 - (-v29 - v33);
      v37 = [v8 _complicationContainerViewForSlot:v6];
      objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v37, v32, v34, v35, v36);
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;

      v46 = [MEMORY[0x1E4F19A30] currentDevice];
      [v46 screenBounds];
      double v48 = v47;

      [v8 faceViewFrameForEditMode:1 option:0 slot:v6];
      CGFloat v50 = v49;
      CGFloat v52 = v51;
      CGAffineTransformMakeScale(&v62, v53 / v48, v53 / v48);
      v64.origin.CGFloat x = v39;
      v64.origin.CGFloat y = v41;
      v64.size.CGFloat width = v43;
      v64.size.CGFloat height = v45;
      CGRect v65 = CGRectApplyAffineTransform(v64, &v62);
      CGRect v66 = CGRectOffset(v65, v50, v52);
      CGFloat x = v66.origin.x;
      CGFloat y = v66.origin.y;
      CGFloat width = v66.size.width;
      CGFloat height = v66.size.height;
    }
    else
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v58 = x;
  double v59 = y;
  double v60 = width;
  double v61 = height;
  result.size.CGFloat height = v61;
  result.size.CGFloat width = v60;
  result.origin.CGFloat y = v59;
  result.origin.CGFloat x = v58;
  return result;
}

- (BOOL)_convertCornerSlot:(id)a3 toPosition:(int64_t *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"top-left"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"top-right"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"bottom-left"])
  {
    int64_t v6 = 2;
  }
  else
  {
    if (![v5 isEqualToString:@"bottom-right"])
    {
      BOOL v7 = 0;
      goto LABEL_10;
    }
    int64_t v6 = 3;
  }
  *a4 = v6;
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)_convertCircularSlot:(id)a3 toPosition:(int64_t *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"slot1"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"slot2"])
  {
    int64_t v6 = 1;
  }
  else
  {
    if (![v5 isEqualToString:@"slot3"])
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
    int64_t v6 = 2;
  }
  *a4 = v6;
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (void)setAlpha:(double)a3 faceView:(id)a4
{
  id v6 = a4;
  [(NTKFaceViewComplicationFactory *)self alpha];
  if (v7 != a3)
  {
    [(NTKFaceViewComplicationFactory *)self setAlpha:a3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__NTKWhistlerAnalogFaceViewComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E62C15B0;
    v8[4] = self;
    id v9 = v6;
    [v9 enumerateComplicationDisplayWrappersWithBlock:v8];
  }
}

void __66__NTKWhistlerAnalogFaceViewComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 configureComplicationView:v7 forSlot:v6 faceView:*(void *)(a1 + 40)];
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v5 = NTKKeylineWidth();
    id v6 = [(NTKFaceViewComplicationFactory *)self device];
    double v3 = v5 + NTKColorFaceViewDeselectedKeylineInnerPadding(v6);
  }
  return v3;
}

- (double)_edgeGapForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      double v3 = [(NTKFaceViewComplicationFactory *)self device];
      double v4 = NTKColorFaceViewEdgeGapEditing(v3);
    }
    else
    {
      double v3 = [(NTKFaceViewComplicationFactory *)self device];
      double v4 = NTKColorFaceViewEdgeGapNormal(v3);
    }
  }
  else
  {
    double v3 = [(NTKFaceViewComplicationFactory *)self device];
    double v4 = NTKColorFaceViewEdgeGapDeselected(v3);
  }
  double v5 = v4;

  return v5;
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

- (BOOL)usesNarrowTopSlots
{
  return self->_usesNarrowTopSlots;
}

- (void)setUsesNarrowTopSlots:(BOOL)a3
{
  self->_usesNarrowTopSlots = a3;
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void)setDialDiameter:(double)a3
{
  self->_dialDiameter = a3;
}

- (void).cxx_destruct
{
}

@end