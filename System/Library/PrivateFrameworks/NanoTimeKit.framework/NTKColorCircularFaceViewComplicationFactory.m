@interface NTKColorCircularFaceViewComplicationFactory
- (double)_colorCircularEdgeGapForState:(int64_t)a3;
- (double)_colorCircularKeylinePaddingForState:(int64_t)a3;
- (double)_colorCircularLisaGapForState:(int64_t)a3;
- (id)initForDevice:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (int64_t)keylineStyleForComplicationSlot:(id)a3;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRulesForFaceView:(id)a3;
@end

@implementation NTKColorCircularFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKColorCircularFaceViewComplicationFactory;
  id v3 = [(NTKFaceViewComplicationFactory *)&v11 initForDevice:a3];
  if (v3)
  {
    v4 = [[NTKFaceColorPalette alloc] initWithDomainName:0 inBundle:0];
    v5 = +[NTKPigmentEditOption pigmentNamed:@"seasons.spring2015.white"];
    [(NTKFaceColorPalette *)v4 setPigmentEditOption:v5];

    v6 = [v3 device];
    v7 = +[NTKFaceColorScheme colorSchemeForDevice:v6 withFaceColorPalette:v4 units:51];

    v8 = [v7 shiftedForegroundColor];
    [v3 setForegroundColor:v8];

    v9 = [v7 shiftedBackgroundColor];
    [v3 setPlatterColor:v9];
  }
  return v3;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__NTKColorCircularFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke;
  v10[3] = &unk_1E62C0BD8;
  v10[4] = self;
  id v11 = v4;
  uint64_t v12 = v5;
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  id v9 = v4;
  NTKEnumerateComplicationStates(v10);
}

void __74__NTKColorCircularFaceViewComplicationFactory_loadLayoutRulesForFaceView___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _colorCircularKeylinePaddingForState:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _colorCircularEdgeGapForState:a2];
  double v7 = v5 + v6;
  uint64_t v8 = [*(id *)(a1 + 32) device];
  double v9 = NTKCircularSmallComplicationDiameter();
  v10 = [*(id *)(a1 + 32) device];
  double v11 = NTKCircularSmallComplicationDiameter();

  uint64_t v12 = [*(id *)(a1 + 32) device];
  uint64_t v13 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v12, 3, 3, v7, v7, v9, v11, v5, v5, v5, v5);

  uint64_t v14 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"top-left"];
  [v14 setDefaultLayoutRule:v13 forState:a2];

  double v15 = *(double *)(a1 + 64) - v9 - v7;
  [*(id *)(a1 + 32) _colorCircularLisaGapForState:a2];
  double v17 = v15 - v16;
  v18 = [*(id *)(a1 + 32) device];
  v19 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v18, 3, 3, v17, v7, v9, v11, v5, v5, v5, v5);

  v20 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"top-right"];
  [v20 setDefaultLayoutRule:v19 forState:a2];

  double v21 = *(double *)(a1 + 72) - v11 - v7;
  v22 = [*(id *)(a1 + 32) device];
  v23 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v22, 3, 3, v7, v21, v9, v11, v5, v5, v5, v5);

  v24 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"bottom-left"];
  [v24 setDefaultLayoutRule:v23 forState:a2];

  double v25 = *(double *)(a1 + 64) - v9 - v7;
  v26 = [*(id *)(a1 + 32) device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v26, 3, 3, v25, v21, v9, v11, v5, v5, v5, v5);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  v27 = [*(id *)(a1 + 40) complicationLayoutforSlot:@"bottom-right"];
  [v27 setDefaultLayoutRule:v28 forState:a2];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  double v11 = +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", [a3 complicationType]);
  [(NTKColorCircularFaceViewComplicationFactory *)self configureComplicationView:v11 forSlot:v10 faceView:v9];

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v6 = a3;
  double v7 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
  [v6 setForegroundColor:v7];

  id v8 = [(NTKFaceViewComplicationFactory *)self platterColor];
  [v6 setPlatterColor:v8];
}

- (double)_colorCircularEdgeGapForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      double v4 = [(NTKFaceViewComplicationFactory *)self device];
      double v5 = NTKColorFaceViewEdgeGapEditing(v4);
    }
    else
    {
      double v4 = [(NTKFaceViewComplicationFactory *)self device];
      double v5 = NTKColorFaceViewEdgeGapNormal(v4);
    }
    double v3 = v5;
  }
  return v3;
}

- (double)_colorCircularKeylinePaddingForState:(int64_t)a3
{
  if (a3 == 3)
  {
    double v5 = NTKKeylineWidth();
    id v6 = [(NTKFaceViewComplicationFactory *)self device];
    double v7 = NTKColorFaceViewSelectedKeylineInnerPadding(v6);
    goto LABEL_5;
  }
  double v4 = 0.0;
  if (a3 == 2)
  {
    double v5 = NTKKeylineWidth();
    id v6 = [(NTKFaceViewComplicationFactory *)self device];
    double v7 = NTKColorFaceViewDeselectedKeylineInnerPadding(v6);
LABEL_5:
    double v4 = v5 + v7;
  }
  return v4;
}

- (double)_colorCircularLisaGapForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0.0;
  }
  double v3 = [(NTKFaceViewComplicationFactory *)self device];
  double v4 = NTKColorFaceViewLisaKeylineGap(v3);

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

@end