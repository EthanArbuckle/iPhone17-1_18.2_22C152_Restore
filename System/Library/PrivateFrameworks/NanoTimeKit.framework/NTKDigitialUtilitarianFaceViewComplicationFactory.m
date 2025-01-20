@interface NTKDigitialUtilitarianFaceViewComplicationFactory
- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5;
- (BOOL)usesLegibility;
- (NSArray)supportedComplicationSlots;
- (UIColor)shadowColor;
- (double)_timeTravelYAdjustment;
- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5;
- (id)initForDevice:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (id)shadowColorProviderBlock;
- (id)timeTravelYAdjustmentProviderBlock;
- (int64_t)_photosUtilitySlotForSlot:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4 attributes:(unint64_t)a5 faceView:(id)a6;
- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4;
- (void)cleanupAfterEditingForFaceView:(id)a3;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRulesForFaceView:(id)a3;
- (void)prepareForEditingForFaceView:(id)a3;
- (void)setAlpha:(double)a3 faceView:(id)a4;
- (void)setForegroundColor:(id)a3 faceView:(id)a4;
- (void)setShadowColor:(id)a3;
- (void)setShadowColor:(id)a3 faceView:(id)a4;
- (void)setShadowColorProviderBlock:(id)a3;
- (void)setSupportedComplicationSlots:(id)a3;
- (void)setTimeTravelYAdjustmentProviderBlock:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
- (void)setUsesLegibility:(BOOL)a3 faceView:(id)a4;
@end

@implementation NTKDigitialUtilitarianFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKDigitialUtilitarianFaceViewComplicationFactory;
  id v5 = [(NTKFaceViewComplicationFactory *)&v13 initForDevice:v4];
  if (v5)
  {
    id v6 = [[NTKUtilityComplicationFactory alloc] initForDevice:v4];
    v7 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;

    [*((id *)v5 + 9) setForegroundAlpha:1.0];
    [*((id *)v5 + 9) setForegroundImageAlpha:1.0];
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:*(double *)off_1E62BD1C0];
    v9 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v8;

    [v5 setAlpha:1.0];
    [v5 setContentSpecificAnimationDuration:0.45];
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [v5 setForegroundColor:v10];

    v14[0] = @"top-right";
    v14[1] = @"bottom";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v5 setSupportedComplicationSlots:v11];
  }
  return v5;
}

- (UIColor)shadowColor
{
  shadowColorProviderBlock = (void (**)(id, SEL))self->_shadowColorProviderBlock;
  if (shadowColorProviderBlock)
  {
    shadowColorProviderBlock[2](shadowColorProviderBlock, a2);
    id v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    shadowColor = v4;
    if (!v4) {
      shadowColor = self->_shadowColor;
    }
    id v6 = shadowColor;
  }
  else
  {
    id v6 = self->_shadowColor;
  }

  return v6;
}

- (double)_timeTravelYAdjustment
{
  timeTravelYAdjustmentProviderBlock = (void (**)(void))self->_timeTravelYAdjustmentProviderBlock;
  if (!timeTravelYAdjustmentProviderBlock) {
    return 0.0;
  }
  timeTravelYAdjustmentProviderBlock[2]();
  return result;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NTKFaceViewComplicationFactory *)self device];
  double v6 = _LayoutConstants_8(v5);
  double v64 = v7;

  [v4 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self _timeTravelYAdjustment];
  if (v16 != 0.0)
  {
    CLKAlterRect();
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v21 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self supportedComplicationSlots];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v66;
    double v63 = v15;
    v62 = v21;
    double v61 = -v6;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v66 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v65 + 1) + 8 * v25);
        v27 = objc_msgSend(v4, "complicationLayoutforSlot:", v26, *(void *)&v61);
        if ([v26 isEqualToString:@"bottom"])
        {
          complicationFactory = self->_complicationFactory;
          int64_t v29 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self _photosUtilitySlotForSlot:v26];
          v30 = complicationFactory;
          v31 = v27;
          double v32 = v9;
          double v33 = v11;
          double v34 = v13;
          double v35 = v15;
LABEL_12:
          -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](v30, "configureComplicationLayout:forSlot:withBounds:", v31, v29, v32, v33, v34, v35);
          goto LABEL_13;
        }
        if ([v26 isEqualToString:@"top-right"])
        {
          v36 = self->_complicationFactory;
          int64_t v37 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self _photosUtilitySlotForSlot:v26];
          CLKAlterRect();
          v30 = v36;
          v31 = v27;
          int64_t v29 = v37;
          goto LABEL_12;
        }
        if ([v26 isEqualToString:@"date"])
        {
          v38 = [(NTKFaceViewComplicationFactory *)self device];
          double v39 = NTKDigitalTimeLabelStyleWideRightSideMargin(v38);
          v40 = [(NTKFaceViewComplicationFactory *)self device];
          v41 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v40, v9, v11, v13, v15, v39);

          v42 = [v41 layoutRule];
          [v42 referenceFrame];
          double v44 = v43;
          double v45 = v13;
          double v46 = v9;
          CGFloat v48 = v47;
          double v49 = v11;
          double v50 = v6;
          CGFloat v52 = v51;
          CGFloat v54 = v53;

          v71.origin.x = v44;
          v71.origin.y = v48;
          v71.size.width = v52;
          v71.size.height = v54;
          CGFloat v55 = CGRectGetMaxY(v71) - v64;
          v56 = [(NTKFaceViewComplicationFactory *)self device];
          double v57 = v55;
          double v9 = v46;
          double v13 = v45;
          double v58 = v52;
          double v6 = v50;
          double v11 = v49;
          double v15 = v63;
          v59 = +[NTKLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v56, 2, 0, v44, v57, v58, 46.0);

          [v27 setDefaultLayoutRule:v59 forState:0];
          v21 = v62;
        }
LABEL_13:

        ++v25;
      }
      while (v23 != v25);
      uint64_t v60 = [v21 countByEnumeratingWithState:&v65 objects:v69 count:16];
      uint64_t v23 = v60;
    }
    while (v60);
  }
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v11 isEqualToString:@"date"])
  {
    double v13 = [NTKDateComplicationLabel alloc];
    double v14 = [(NTKFaceViewComplicationFactory *)self device];
    double v15 = [(NTKDateComplicationLabel *)v13 initWithSizeStyle:0 accentType:0 forDevice:v14];

    double v16 = [(NTKFaceViewComplicationFactory *)self device];
    _LayoutConstants_8(v16);
    double v18 = v17;

    double v19 = [MEMORY[0x1E4F19A50] systemFontOfSize:v18 weight:*MEMORY[0x1E4FB09C8]];
    [(NTKDateComplicationLabel *)v15 setFont:v19];
    double v20 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
    [(NTKDateComplicationLabel *)v15 setTextColor:v20];

    [(NTKDateComplicationLabel *)v15 setUsesLegibility:self->_usesLegibility];
    v21 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v22 = [v21 objectForKey:*MEMORY[0x1E4F1C438]];

    int v23 = [v22 isEqualToString:@"he"];
    int v24 = [v22 isEqualToString:@"pl"];
    uint64_t v25 = 4096;
    if (!v24) {
      uint64_t v25 = 0;
    }
    if (v23) {
      uint64_t v26 = 2048;
    }
    else {
      uint64_t v26 = v25;
    }
    [(NTKDateComplicationLabel *)v15 setOverrideDateStyle:v26];
  }
  else
  {
    double v15 = [(NTKUtilityComplicationFactory *)self->_complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKDigitialUtilitarianFaceViewComplicationFactory *)self _photosUtilitySlotForSlot:v11]];
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self configureComplicationView:v15 forSlot:v11 faceView:v12];
  }

  return v15;
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return (unint64_t)a4 > 1;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4 attributes:(unint64_t)a5 faceView:(id)a6
{
  char v7 = a5;
  id v16 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v16 conformsToProtocol:&unk_1FCDFD5E8])
  {
    id v12 = v16;
    if (objc_opt_respondsToSelector())
    {
      [v12 setUseBlockyHighlightCorners:1];
      if ((v7 & 0x10) == 0)
      {
LABEL_4:
        if ((v7 & 1) == 0) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    else if ((v7 & 0x10) == 0)
    {
      goto LABEL_4;
    }
    [v12 setFontWeight:*MEMORY[0x1E4FB09E0]];
    [v12 setUseAlternativePunctuation:1];
    -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self->_complicationFactory, "foregroundAlphaForEditing:", [v11 editing]);
    objc_msgSend(v12, "setForegroundAlpha:");
    -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self->_complicationFactory, "foregroundImageAlphaForEditing:", [v11 editing]);
    objc_msgSend(v12, "setForegroundImageAlpha:");
    objc_msgSend(v12, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKDigitialUtilitarianFaceViewComplicationFactory _photosUtilitySlotForSlot:](self, "_photosUtilitySlotForSlot:", v10)));
    [v12 setSuppressesInternalColorOverrides:1];
    double v13 = [MEMORY[0x1E4FB1618] clearColor];
    [v12 setBackgroundColor:v13];

    [v12 setUsesLegibility:self->_usesLegibility];
    if ((v7 & 1) == 0)
    {
LABEL_5:
      if ((v7 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
LABEL_14:
    double v14 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
    [v12 setForegroundColor:v14];

    if ((v7 & 2) == 0)
    {
LABEL_6:
      if ((v7 & 4) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
LABEL_7:
      [(NTKFaceViewComplicationFactory *)self alpha];
      objc_msgSend(v12, "setAlpha:");
      goto LABEL_8;
    }
LABEL_15:
    double v15 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self shadowColor];
    [v12 setShadowColor:v15];

    if ((v7 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:
}

- (int64_t)_photosUtilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top-right"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"bottom"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"date"])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
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
    double v8 = [(NTKFaceViewComplicationFactory *)self alphaProviderBlock];

    if (v8) {
      uint64_t v9 = v7 | 4;
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
  char v5 = a3;
  id v7 = a4;
  double v8 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
  uint64_t v9 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self shadowColor];
  [(NTKFaceViewComplicationFactory *)self alpha];
  uint64_t v11 = v10;
  id v12 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke;
  v23[3] = &unk_1E62C27A0;
  char v28 = v5 & 1;
  id v24 = v8;
  BOOL v29 = (v5 & 4) != 0;
  uint64_t v27 = v11;
  id v13 = v12;
  BOOL v30 = (v5 & 2) != 0;
  id v25 = v13;
  id v26 = v9;
  id v14 = v9;
  id v15 = v8;
  [v7 enumerateComplicationDisplayWrappersWithBlock:v23];

  [(NTKFaceViewComplicationFactory *)self contentSpecificAnimationDuration];
  double v17 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_4;
  v21[3] = &unk_1E62C0C50;
  id v22 = v13;
  id v18 = v13;
  double v19 = +[NTKFaceViewComplicationFactory _genericComplicationAnimationWithDuration:v21 applier:v17];

  return v19;
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 isEqualToString:@"date"];
  id v7 = [v5 display];

  if (v6)
  {
    double v8 = [v7 textColor];
    [v7 alpha];
    uint64_t v10 = v9;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2;
    aBlock[3] = &unk_1E62C2750;
    char v48 = *(unsigned char *)(a1 + 64);
    double v43 = v7;
    id v44 = v8;
    id v45 = *(id *)(a1 + 32);
    char v49 = *(unsigned char *)(a1 + 65);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v46 = v10;
    uint64_t v47 = v11;
    id v12 = v8;
    id v13 = v7;
    id v14 = _Block_copy(aBlock);
    id v15 = *(void **)(a1 + 40);
    double v16 = _Block_copy(v14);
    [v15 addObject:v16];

    id v17 = v43;
  }
  else
  {
    id v18 = [v7 foregroundColor];
    double v19 = [v7 shadowColor];
    [v7 alpha];
    uint64_t v21 = v20;
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    BOOL v30 = __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3;
    v31 = &unk_1E62C2778;
    char v39 = *(unsigned char *)(a1 + 64);
    id v32 = v7;
    id v33 = v18;
    id v22 = *(id *)(a1 + 32);
    char v40 = *(unsigned char *)(a1 + 66);
    id v34 = v22;
    id v35 = v19;
    id v36 = *(id *)(a1 + 48);
    char v41 = *(unsigned char *)(a1 + 65);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v37 = v21;
    uint64_t v38 = v23;
    id v17 = v19;
    id v12 = v18;
    id v24 = v7;
    id v25 = _Block_copy(&v28);
    id v26 = *(void **)(a1 + 40);
    uint64_t v27 = _Block_copy(v25);
    objc_msgSend(v26, "addObject:", v27, v28, v29, v30, v31);
  }
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = *(void **)(a1 + 32);
    id v3 = NTKInterpolateBetweenColors();
    [v2 setTextColor:v3];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    BOOL v4 = *(void **)(a1 + 32);
    CLKInterpolateBetweenFloatsUnclipped();
    objc_msgSend(v4, "setAlpha:");
  }
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 32);
    id v3 = NTKInterpolateBetweenColors();
    [v2 setForegroundColor:v3];
  }
  if (*(unsigned char *)(a1 + 89))
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = NTKInterpolateBetweenColors();
    [v4 setShadowColor:v5];
  }
  if (*(unsigned char *)(a1 + 90))
  {
    int v6 = *(void **)(a1 + 32);
    CLKInterpolateBetweenFloatsUnclipped();
    objc_msgSend(v6, "setAlpha:");
  }
}

void __138__NTKDigitialUtilitarianFaceViewComplicationFactory_createComplicationContentSpecificAttributesAnimationWithAttributes_faceView_forSlots___block_invoke_4(uint64_t a1, double a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))(a2);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setForegroundColor:(id)a3 faceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(NTKFaceViewComplicationFactory *)self foregroundColor];
  if (([v8 isEqual:v6] & 1) == 0)
  {
    [(NTKFaceViewComplicationFactory *)self setForegroundColor:v6];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__NTKDigitialUtilitarianFaceViewComplicationFactory_setForegroundColor_faceView___block_invoke;
    v9[3] = &unk_1E62C15B0;
    v9[4] = self;
    id v10 = v7;
    [v10 enumerateComplicationDisplayWrappersWithBlock:v9];
  }
}

void __81__NTKDigitialUtilitarianFaceViewComplicationFactory_setForegroundColor_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 _configureComplicationView:v7 forSlot:v6 attributes:1 faceView:*(void *)(a1 + 40)];
}

- (void)setShadowColor:(id)a3 faceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self shadowColor];
  if (([v8 isEqual:v6] & 1) == 0)
  {
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self setShadowColor:v6];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__NTKDigitialUtilitarianFaceViewComplicationFactory_setShadowColor_faceView___block_invoke;
    v9[3] = &unk_1E62C15B0;
    v9[4] = self;
    id v10 = v7;
    [v10 enumerateComplicationDisplayWrappersWithBlock:v9];
  }
}

void __77__NTKDigitialUtilitarianFaceViewComplicationFactory_setShadowColor_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 _configureComplicationView:v7 forSlot:v6 attributes:2 faceView:*(void *)(a1 + 40)];
}

- (void)setUsesLegibility:(BOOL)a3 faceView:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(NTKDigitialUtilitarianFaceViewComplicationFactory *)self usesLegibility] != v4)
  {
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self setUsesLegibility:v4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__NTKDigitialUtilitarianFaceViewComplicationFactory_setUsesLegibility_faceView___block_invoke;
    v7[3] = &unk_1E62C15B0;
    v7[4] = self;
    id v8 = v6;
    [v8 enumerateComplicationDisplayWrappersWithBlock:v7];
  }
}

void __80__NTKDigitialUtilitarianFaceViewComplicationFactory_setUsesLegibility_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 _configureComplicationView:v7 forSlot:v6 attributes:16 faceView:*(void *)(a1 + 40)];
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
    v8[2] = __71__NTKDigitialUtilitarianFaceViewComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E62C15B0;
    v8[4] = self;
    id v9 = v6;
    [v9 enumerateComplicationDisplayWrappersWithBlock:v8];
  }
}

void __71__NTKDigitialUtilitarianFaceViewComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 _configureComplicationView:v7 forSlot:v6 attributes:4 faceView:*(void *)(a1 + 40)];
}

- (NSArray)supportedComplicationSlots
{
  return self->_supportedComplicationSlots;
}

- (void)setSupportedComplicationSlots:(id)a3
{
}

- (void)setShadowColor:(id)a3
{
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (id)shadowColorProviderBlock
{
  return self->_shadowColorProviderBlock;
}

- (void)setShadowColorProviderBlock:(id)a3
{
}

- (id)timeTravelYAdjustmentProviderBlock
{
  return self->_timeTravelYAdjustmentProviderBlock;
}

- (void)setTimeTravelYAdjustmentProviderBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeTravelYAdjustmentProviderBlock, 0);
  objc_storeStrong(&self->_shadowColorProviderBlock, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_supportedComplicationSlots, 0);

  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end