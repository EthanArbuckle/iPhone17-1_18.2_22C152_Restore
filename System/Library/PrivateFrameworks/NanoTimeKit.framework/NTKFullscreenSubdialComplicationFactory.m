@interface NTKFullscreenSubdialComplicationFactory
- (BOOL)_convertCircularSlot:(id)a3 toPosition:(int64_t *)a4;
- (CGPoint)_circularComplicationCenterForSlot:(id)a3 inFaceBounds:(CGRect)a4;
- (CGPoint)circularComplicationDistanceFromCenter;
- (NTKFaceView)faceView;
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
- (void)setAlpha:(double)a3 faceView:(id)a4;
- (void)setCircularComplicationDistanceFromCenter:(CGPoint)a3;
- (void)setFaceView:(id)a3;
@end

@implementation NTKFullscreenSubdialComplicationFactory

- (id)initForDevice:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NTKFullscreenSubdialComplicationFactory;
  v3 = [(NTKFaceViewComplicationFactory *)&v17 initForDevice:a3];
  v4 = v3;
  if (v3)
  {
    v5 = v3 + 10;
    id v6 = [v3 device];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_34);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_34);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      id v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_34);
      if (v9 == v6)
      {
        uint64_t v10 = [v6 version];
        uint64_t v11 = _LayoutConstants___previousCLKDeviceVersion_34;

        if (v10 == v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_34);
          uint64_t v14 = _LayoutConstants__constants_0_1;
          uint64_t v15 = _LayoutConstants__constants_1;

          uint64_t *v5 = v14;
          v4[11] = v15;

          return v4;
        }
      }
      else
      {
      }
    }
    id v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_34, v6);
    _LayoutConstants___previousCLKDeviceVersion_34 = [v6 version];

    ___LayoutConstants_block_invoke_31(v13, v6);
    goto LABEL_7;
  }
  return v4;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  uint64_t v4 = [a3 isEqualToString:@"subdial-top"];
  v5 = [(NTKFaceViewComplicationFactory *)self device];
  id v6 = +[NTKRichComplicationCircularBaseView keylineViewForDevice:v5 wide:v4 expanded:1];

  return v6;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = [(NTKFaceViewComplicationFactory *)self device];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__NTKFullscreenSubdialComplicationFactory_loadLayoutRulesForFaceView___block_invoke;
  v16[3] = &unk_1E62C4EA0;
  id v17 = v4;
  v18 = self;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  uint64_t v23 = v12;
  id v19 = v13;
  id v14 = v13;
  id v15 = v4;
  NTKEnumerateComplicationStates(v16);
}

void __70__NTKFullscreenSubdialComplicationFactory_loadLayoutRulesForFaceView___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"subdial-left"];
  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", @"subdial-left", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v5 = +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 0, 1, 0, *(void *)(a1 + 48));
  [v4 setDefaultLayoutRule:v5 forState:a2];
  uint64_t v6 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"subdial-right"];

  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", @"subdial-right", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v7 = +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 1, 1, 0, *(void *)(a1 + 48));

  [v6 setDefaultLayoutRule:v7 forState:a2];
  uint64_t v8 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"subdial-bottom"];

  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", @"subdial-bottom", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v9 = +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 2, 1, 0, *(void *)(a1 + 48));

  [v8 setDefaultLayoutRule:v9 forState:a2];
  uint64_t v10 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"subdial-top"];

  objc_msgSend(*(id *)(a1 + 40), "_circularComplicationCenterForSlot:inFaceBounds:", @"subdial-top", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  +[NTKRichComplicationCircularBaseView layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:](NTKRichComplicationCircularBaseView, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a2, 3, 1, 1, *(void *)(a1 + 48));
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [v10 setDefaultLayoutRule:v11 forState:a2];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  uint64_t v10 = +[NTKRichComplicationCircularBaseView viewWithLegacyComplicationType:](NTKRichComplicationCircularBaseView, "viewWithLegacyComplicationType:", [a3 complicationType]);
  [v8 _configureComplicationView:v10 forSlot:v9];

  return v10;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    uint64_t v10 = 0;
    if ([(NTKFullscreenSubdialComplicationFactory *)self _convertCircularSlot:v8 toPosition:&v10])
    {
      [v9 setPosition:v10];
    }
    [(NTKFaceViewComplicationFactory *)self alpha];
    objc_msgSend(v9, "setAlpha:");
  }
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
    v8[2] = __61__NTKFullscreenSubdialComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E62C15B0;
    v8[4] = self;
    id v9 = v6;
    [v9 enumerateComplicationDisplayWrappersWithBlock:v8];
  }
}

void __61__NTKFullscreenSubdialComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 configureComplicationView:v7 forSlot:v6 faceView:*(void *)(a1 + 40)];
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  return 3;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKFullscreenSubdialComplicationFactory *)self faceView];
  [(NTKFullscreenSubdialComplicationFactory *)self configureComplicationView:v7 forSlot:v6 faceView:v8];
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = [(NTKFullscreenSubdialComplicationFactory *)self faceView];
  int64_t v8 = [(NTKFaceViewComplicationFactory *)self legacyLayoutOverrideforComplicationType:a3 slot:v6 faceView:v7];

  return v8;
}

- (void)loadLayoutRules
{
  id v3 = [(NTKFullscreenSubdialComplicationFactory *)self faceView];
  [(NTKFullscreenSubdialComplicationFactory *)self loadLayoutRulesForFaceView:v3];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(NTKFullscreenSubdialComplicationFactory *)self faceView];
  id v11 = [(NTKFullscreenSubdialComplicationFactory *)self newLegacyViewForComplication:v9 family:a4 slot:v8 faceView:v10];

  return v11;
}

- (CGPoint)_circularComplicationCenterForSlot:(id)a3 inFaceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  double v10 = MEMORY[0x1C1874A70](x, y, width, height);
  double v12 = v11;
  if ([v9 isEqualToString:@"subdial-top"])
  {
    double v12 = v12 - self->_circularComplicationDistanceFromCenter.y;
  }
  else if ([v9 isEqualToString:@"subdial-left"])
  {
    double v10 = v10 - self->_circularComplicationDistanceFromCenter.x;
  }
  else if ([v9 isEqualToString:@"subdial-right"])
  {
    double v10 = v10 + self->_circularComplicationDistanceFromCenter.x;
  }
  else if ([v9 isEqualToString:@"subdial-bottom"])
  {
    double v12 = v12 + self->_circularComplicationDistanceFromCenter.y;
  }

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (BOOL)_convertCircularSlot:(id)a3 toPosition:(int64_t *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"subdial-left"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"subdial-right"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"subdial-bottom"])
  {
    int64_t v6 = 2;
  }
  else
  {
    if (![v5 isEqualToString:@"subdial-top"])
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

- (CGPoint)circularComplicationDistanceFromCenter
{
  double x = self->_circularComplicationDistanceFromCenter.x;
  double y = self->_circularComplicationDistanceFromCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCircularComplicationDistanceFromCenter:(CGPoint)a3
{
  self->_circularComplicationDistanceFromCenter = a3;
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