@interface NTKModularTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (BOOL)_useInvertedHighlightForColorScheme:(id)a3;
- (CLKComplicationTemplate)complicationTemplate;
- (NSDate)timeTravelDate;
- (unint64_t)highlightMode;
- (void)_enumerateColoringViewsSubviewsWithBlock:(id)a3 invertedHighlight:(BOOL)a4;
- (void)_propagateColorSchemeToSubviews:(id)a3;
- (void)_setColorScheme:(id)a3 propagateToSubviews:(BOOL)a4;
- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4;
- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7;
- (void)setComplicationTemplate:(id)a3;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
- (void)setContainsOverrideFaceColor:(id)a3;
- (void)setHighlightMode:(unint64_t)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation NTKModularTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  v6 = (CLKComplicationTemplate *)a3;
  if (self->_complicationTemplate != v6)
  {
    v24 = v6;
    objc_storeStrong((id *)&self->_complicationTemplate, a3);
    unint64_t v7 = [(NTKModularTemplateView *)self highlightMode];
    [(NTKModularTemplateView *)self _update];
    unint64_t v8 = [(NTKModularTemplateView *)self highlightMode];
    v9 = [(CLKComplicationTemplate *)self->_complicationTemplate tintColor];
    [(NTKModuleView *)self setOverrideColor:v9];

    v10 = [(NTKModuleView *)self colorScheme];
    int v11 = [v10 containsOverrideFaceColor];

    if (v11)
    {
      BOOL v12 = self->_highlightMode - 1 < 2;
      v13 = [[NTKFaceColorPalette alloc] initWithDomainName:0 inBundle:0];
      v14 = +[NTKPigmentEditOption pigmentNamed:@"special.multicolor"];
      [(NTKFaceColorPalette *)v13 setPigmentEditOption:v14];

      v15 = [(NTKModuleView *)self device];
      v16 = [(NTKModuleView *)self overrideColor];
      v17 = [(NTKModuleView *)self colorScheme];
      v18 = +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v15, v13, v16, [v17 units], v12);
      [(NTKModularTemplateView *)self setContainsOverrideFaceColor:v18];
    }
    else
    {
      v6 = v24;
      if (v7 == v8) {
        goto LABEL_7;
      }
      BOOL v19 = self->_highlightMode == 1;
      v20 = [(NTKModuleView *)self device];
      v21 = [(NTKModuleView *)self colorScheme];
      v22 = [v21 faceColorPalette];
      v23 = [(NTKModuleView *)self colorScheme];
      +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v20, v22, 0, [v23 units], v19);
      v13 = (NTKFaceColorPalette *)objc_claimAutoreleasedReturnValue();

      [(NTKModularTemplateView *)self setContainsOverrideFaceColor:v13];
    }

    v6 = v24;
  }
LABEL_7:
}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  unint64_t highlightMode = self->_highlightMode;
  BOOL v7 = highlightMode == 1;
  id v8 = a3;
  if ([v8 isMulticolor])
  {
    BOOL v7 = highlightMode == 1 || self->_highlightMode == 2;
    id v13 = [(NTKModuleView *)self overrideColor];
    double v10 = 0.0;
  }
  else
  {
    id v13 = 0;
    double v10 = 1.0;
  }
  [(NTKModuleView *)self transitionToMonochromeWithFraction:v10];
  int v11 = [(NTKModuleView *)self device];
  BOOL v12 = +[NTKFaceColorScheme colorSchemeForDevice:v11 withFaceColorPalette:v8 foregroundColor:v13 units:a4 alternateHighlight:v7];

  [(NTKModularTemplateView *)self setContainsOverrideFaceColor:v12];
}

- (void)_setColorScheme:(id)a3 propagateToSubviews:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKModularTemplateView;
  [(NTKModuleView *)&v7 setColorScheme:v6];
  if (v4) {
    [(NTKModularTemplateView *)self _propagateColorSchemeToSubviews:v6];
  }
}

- (void)setContainsOverrideFaceColor:(id)a3
{
}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 units:(unint64_t)a6 brightenedUnits:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  char v14 = [v12 isMulticolor];
  char v15 = [v13 isMulticolor];
  char v16 = v15;
  unint64_t highlightMode = self->_highlightMode;
  if (v14 & 1) != 0 || (v15)
  {
    BOOL v22 = highlightMode == 1;
    v23 = +[NTKPigmentEditOption pigmentNamed:@"special.multicolor"];
    v24 = (void *)[v12 copyWithOption:v23];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke;
    aBlock[3] = &unk_1E62C71C8;
    char v44 = v14;
    BOOL v45 = v22;
    aBlock[4] = self;
    id v25 = v24;
    id v39 = v25;
    unint64_t v42 = a6;
    id v40 = v12;
    char v46 = v16;
    id v41 = v13;
    double v43 = a3;
    v26 = (void (**)(void *, void *))_Block_copy(aBlock);
    v27 = [(CLKComplicationTemplate *)self->_complicationTemplate tintColor];
    v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [(NTKModuleView *)self overrideColor];
    }
    v30 = v29;

    v31 = v26[2](v26, v30);
    [(NTKModularTemplateView *)self _setColorScheme:v31 propagateToSubviews:0];
    if ([v31 containsOverrideFaceColor])
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_2;
      v36[3] = &unk_1E62C71F0;
      v32 = v26;
      v37 = v32;
      [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v36];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_3;
      v34[3] = &unk_1E62C71F0;
      v35 = v32;
      [(NTKModuleView *)self _enumerateSecondaryForegroundColoringViewsWithBlock:v34];
    }
  }
  else
  {
    BOOL v18 = highlightMode == 1;
    BOOL v19 = [(NTKModuleView *)self device];
    v20 = [(NTKModuleView *)self overrideColor];
    LOBYTE(v33) = v18;
    v21 = +[NTKFaceColorScheme interpolationForDevice:v19 fromFaceColorPalette:v12 toFaceColorPalette:v13 fraction:a6 units:a7 brightenUnits:v20 overrideColor:a3 alternateHighlight:v33];
    [(NTKModularTemplateView *)self setContainsOverrideFaceColor:v21];
  }
  [(NTKModuleView *)self _applyMonochromeTransitionFraction:v12 fromFaceColorPalette:v13 toFaceColorPalette:a3];
}

id __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 81)) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4[75] == 2;
    }
    id v6 = [v4 device];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 64);
    double v10 = v6;
    id v11 = v3;
    uint64_t v9 = v5;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) device];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 81);
    double v10 = v6;
    id v11 = 0;
  }
  id v12 = +[NTKFaceColorScheme colorSchemeForDevice:v10 withFaceColorPalette:v7 foregroundColor:v11 units:v8 alternateHighlight:v9];

  if (*(unsigned char *)(a1 + 82))
  {
    id v13 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 81)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v13[75] == 2;
    }
    char v15 = [v13 device];
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 64);
    BOOL v19 = v15;
    id v20 = v3;
    uint64_t v18 = v14;
  }
  else
  {
    char v15 = [*(id *)(a1 + 32) device];
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v18 = *(unsigned __int8 *)(a1 + 81);
    BOOL v19 = v15;
    id v20 = 0;
  }
  v21 = +[NTKFaceColorScheme colorSchemeForDevice:v19 withFaceColorPalette:v16 foregroundColor:v20 units:v17 alternateHighlight:v18];

  BOOL v22 = +[NTKFaceColorScheme interpolationFrom:v12 to:v21 fraction:*(double *)(a1 + 72)];

  return v22;
}

void __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 overrideColor];
  if (v3)
  {
    BOOL v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    BOOL v5 = [v4 foregroundColor];
    [v6 setColor:v5];
  }
}

void __112__NTKModularTemplateView_applyTransitionFraction_fromFaceColorPalette_toFaceColorPalette_units_brightenedUnits___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 overrideColor];
  if (v3)
  {
    BOOL v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    BOOL v5 = [v4 secondaryForegroundColor];
    [v6 setColor:v5];
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  timeTravelDate = self->_timeTravelDate;
  if (v6)
  {
    if ([v6 isEqual:timeTravelDate]) {
      goto LABEL_14;
    }
    uint64_t v9 = self->_timeTravelDate;
    BOOL v11 = [(CLKComplicationTemplate *)self->_complicationTemplate timeTravelUpdateFrequency] == 2
       || v9 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0) {
      goto LABEL_14;
    }
    BOOL v11 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke;
  v13[3] = &unk_1E62C5068;
  v13[4] = self;
  [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke_2;
  v12[3] = &unk_1E62C5068;
  v12[4] = self;
  [(NTKModuleView *)self _enumerateSecondaryForegroundColoringViewsWithBlock:v12];
  if (v11) {
    [(NTKModularTemplateView *)self _update];
  }
LABEL_14:
}

void __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setInTimeTravel:*(void *)(*(void *)(a1 + 32) + 584) != 0];
  }
}

void __53__NTKModularTemplateView_setTimeTravelDate_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setInTimeTravel:*(void *)(*(void *)(a1 + 32) + 584) != 0];
  }
}

- (BOOL)_useInvertedHighlightForColorScheme:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  unint64_t highlightMode = self->_highlightMode;
  BOOL v7 = highlightMode == 1 || highlightMode == 2 && ([v4 containsOverrideFaceColor] & 1) != 0;

  return v7;
}

- (void)_enumerateColoringViewsSubviewsWithBlock:(id)a3 invertedHighlight:(BOOL)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke;
  v12[3] = &unk_1E62C7218;
  id v7 = v6;
  id v13 = v7;
  BOOL v14 = a4;
  [(NTKModuleView *)self _enumerateForegroundColoringViewsWithBlock:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke_2;
  v9[3] = &unk_1E62C7218;
  id v10 = v7;
  BOOL v11 = a4;
  id v8 = v7;
  [(NTKModuleView *)self _enumerateSecondaryForegroundColoringViewsWithBlock:v9];
}

uint64_t __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned char *)(a1 + 40) == 0);
}

uint64_t __85__NTKModularTemplateView__enumerateColoringViewsSubviewsWithBlock_invertedHighlight___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)_propagateColorSchemeToSubviews:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NTKModularTemplateView *)self _useInvertedHighlightForColorScheme:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NTKModularTemplateView__propagateColorSchemeToSubviews___block_invoke;
  v7[3] = &unk_1E62C7240;
  id v8 = v4;
  id v6 = v4;
  [(NTKModularTemplateView *)self _enumerateColoringViewsSubviewsWithBlock:v7 invertedHighlight:v5];
}

void __58__NTKModularTemplateView__propagateColorSchemeToSubviews___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    id v10 = v5;
    int v6 = [*(id *)(a1 + 32) containsOverrideFaceColor];
    uint64_t v7 = [v10 overrideColor];
    id v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9) {
      [v10 setColor:v7];
    }

    id v5 = v10;
  }
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void)setComplicationTemplate:(id)a3
{
}

- (NSDate)timeTravelDate
{
  return (NSDate *)objc_getProperty(self, a2, 584, 1);
}

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_unint64_t highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end