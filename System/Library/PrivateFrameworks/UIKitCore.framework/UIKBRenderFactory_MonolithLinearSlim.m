@interface UIKBRenderFactory_MonolithLinearSlim
- (CGPoint)_textOffsetForKey:(id)a3;
- (double)variantKeyPaddingH;
- (double)variantKeyPaddingV;
- (id)_enabledTraitsForControlKey:(id)a3;
- (id)_highlightedTraitsForControlKey:(id)a3;
- (id)_variantTraitsForControlKey:(id)a3 onKeyplane:(id)a4;
- (id)highlightedVariantLayeredBackgroundColor;
- (id)highlightedVariantPillBackgroundColor;
- (id)variantPillBackgroundColor;
- (id)variantTextColor;
- (void)configureCornersOnGeometry:(id)a3 forKey:(id)a4;
- (void)configureGeometry:(id)a3 forControlKey:(id)a4;
- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4;
@end

@implementation UIKBRenderFactory_MonolithLinearSlim

- (double)variantKeyPaddingH
{
  return 15.0;
}

- (double)variantKeyPaddingV
{
  return 19.0;
}

- (id)variantTextColor
{
  return @"UIKBColorWhite";
}

- (id)variantPillBackgroundColor
{
  return @"UIKBColorBlack_Alpha60";
}

- (id)highlightedVariantPillBackgroundColor
{
  return @"UIKBColorBlack";
}

- (id)highlightedVariantLayeredBackgroundColor
{
  return @"UIKBColorWhite_Alpha90";
}

- (CGPoint)_textOffsetForKey:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  id v3 = a3;
  [(UIKBRenderFactory_Monolith *)&v11 _textOffsetForKey:v3];
  double v5 = v4;
  double v7 = v6;
  int v8 = objc_msgSend(v3, "interactionType", v11.receiver, v11.super_class);

  double v9 = 0.0;
  if (v8 == 4) {
    double v10 = 0.0;
  }
  else {
    double v10 = v5;
  }
  if (v8 != 4) {
    double v9 = v7;
  }
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)configureCornersOnGeometry:(id)a3 forKey:(id)a4
{
}

- (void)configureGeometry:(id)a3 forControlKey:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  id v7 = a4;
  [(UIKBRenderFactory_MonolithLinear *)&v15 configureGeometry:v6 forControlKey:v7];
  int v8 = objc_msgSend(v7, "interactionType", v15.receiver, v15.super_class);

  if (v8 == 10)
  {
    [v6 displayFrame];
    double v10 = v9;
    [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyHeight];
    double v12 = (v10 - v11) * 0.5;
    [v6 displayFrame];
    objc_msgSend(v6, "setDisplayFrame:", v13 + 0.0, v14 + v12);
  }
}

- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  id v7 = a4;
  [(UIKBRenderFactory_MonolithLinear *)&v9 configureSymbolStyle:v6 forControlKey:v7];
  int v8 = objc_msgSend(v7, "interactionType", v9.receiver, v9.super_class);

  if (v8 == 10)
  {
    [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyFontSize];
    objc_msgSend(v6, "setFontSize:");
  }
}

- (id)_enabledTraitsForControlKey:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_MonolithLinear *)&v14 _enabledTraitsForControlKey:v4];
  int v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if (v6 == 10)
  {
    [(UIKBRenderFactory_Monolith *)self controlKeyRectCornerRadius];
    double v8 = v7;
    objc_super v9 = [v5 geometry];
    [v9 setRoundRectRadius:v8];

    double v10 = [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyPillBackgroundColor];
    double v11 = +[UIKBGradient gradientWithFlatColor:v10];
    [v5 setBackgroundGradient:v11];

    [v5 setRenderFlags:&unk_1ED3F01F0];
    double v12 = [v5 symbolStyle];
    [v12 setTextColor:@"UIKBColorBlack"];

    [v5 setBlendForm:4];
  }
  else if (v6 == 9)
  {
    [v5 setRenderFlags:&unk_1ED3F01D8];
  }
  return v5;
}

- (id)_highlightedTraitsForControlKey:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_MonolithLinear *)&v14 _highlightedTraitsForControlKey:v4];
  int v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if (v6 == 10)
  {
    [(UIKBRenderFactory_Monolith *)self controlKeyRectCornerRadius];
    double v8 = v7;
    objc_super v9 = [v5 geometry];
    [v9 setRoundRectRadius:v8];

    double v10 = [(UIKBRenderFactory_MonolithLinearSlim *)self highlightedVariantPillBackgroundColor];
    double v11 = +[UIKBGradient gradientWithFlatColor:v10];
    [v5 setBackgroundGradient:v11];

    [v5 setRenderFlags:&unk_1ED3F0208];
    double v12 = [v5 symbolStyle];
    [v12 setTextColor:@"UIKBColorBlack"];

    [v5 setBlendForm:4];
    [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyFocusIncreaseSize];
    objc_msgSend(v5, "setFloatingContentViewFocusedIncreaseSize:");
  }
  return v5;
}

- (id)_variantTraitsForControlKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 interactionType] == 10)
  {
    id v83 = v7;
    [(UIKBRenderFactory_MonolithLinearSlim *)self variantKeyPaddingH];
    double v9 = v8;
    double v10 = -v8;
    [(UIKBRenderFactory_MonolithLinearSlim *)self variantKeyPaddingV];
    double v12 = v11;
    double v13 = -v11;
    [v6 paddedFrame];
    double v15 = v14 - v9;
    double v17 = v16 - (v10 - v9);
    double v19 = v18 - v12;
    double v21 = v20 - (v13 - v12);
    [v6 paddedFrame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v30 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v15, v19, v17, v21, v15, v19, v17, v21);
    [(UIKBRenderFactory_Monolith *)self keyRectCornerRadius];
    objc_msgSend(v30, "setRoundRectRadius:");
    [v30 setRoundRectCorners:-1];
    [v30 paddedFrame];
    double v74 = v31;
    double v76 = v32;
    double v78 = v33;
    double v80 = v34;
    v35 = [v6 subtrees];
    objc_msgSend(v30, "setPaddedFrame:", v74 + 0.0, v78 + 0.0, v76 - (0.0 - v17 * (double)(unint64_t)(objc_msgSend(v35, "count") - 1)), v80);

    [v30 paddedFrame];
    double v75 = v37;
    double v77 = v36;
    double v79 = v39;
    double v81 = v38;
    [(UIKBRenderFactory_Monolith *)self shadowRadius];
    double v73 = v40;
    [(UIKBRenderFactory_Monolith *)self shadowRadius];
    double v72 = v41;
    [(UIKBRenderFactory_Monolith *)self shadowRadius];
    double v70 = v42;
    [(UIKBRenderFactory_Monolith *)self shadowVerticalOffset];
    double v71 = -(v70 + v43);
    [(UIKBRenderFactory_Monolith *)self shadowRadius];
    objc_msgSend(v30, "setDisplayFrame:", v77 - v44, v81 - v73, v75 - (-v44 - v72), v79 - (v71 - v73));
    v45 = +[UIKBRenderTraits traitsWithGeometry:v30];
    v46 = [(UIKBRenderFactory_Monolith *)self variantPlatterBackgroundColor];
    v47 = +[UIKBGradient gradientWithFlatColor:v46];
    [v45 setBackgroundGradient:v47];

    [(UIKBRenderFactory_Monolith *)self shadowVerticalOffset];
    double v82 = v48;
    [(UIKBRenderFactory_Monolith *)self shadowRadius];
    v50 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha25", 0.0, v82, 0.0, 0.0, 0.0, 0.0, v49 offset insets weight];
    [v45 addRenderEffect:v50];

    [v45 setBlurBlending:1];
    v51 = [MEMORY[0x1E4F1CA48] array];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v52 = [v6 subtrees];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v88 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v85;
      while (1)
      {
        if (*(void *)v85 != v55) {
          objc_enumerationMutation(v52);
        }
        v56 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v15, v19, v17, v21, v23, v25, v27, v29);
        [v56 frame];
        objc_msgSend(v56, "setDisplayFrame:");
        [v56 frame];
        objc_msgSend(v56, "setPaddedFrame:");
        [v56 setRoundRectCorners:-1];
        [(UIKBRenderFactory_Monolith *)self keyRectCornerRadius];
        objc_msgSend(v56, "setRoundRectRadius:");
        objc_msgSend(v56, "setLayeredForegroundPaddedFrame:", v23, v25, v27, v29);
        [(UIKBRenderFactory_Monolith *)self controlKeyRectCornerRadius];
        objc_msgSend(v56, "setLayeredForegroundRoundRectRadius:");
        [v51 addObject:v56];
        double v15 = v17 + v15;
        double v23 = v17 + v23;

        if (!--v54)
        {
          uint64_t v54 = [v52 countByEnumeratingWithState:&v84 objects:v88 count:16];
          if (!v54) {
            break;
          }
        }
      }
    }

    [v45 setVariantGeometries:v51];
    v57 = [(UIKBRenderFactory_MonolithLinearSlim *)self _enabledTraitsForControlKey:v6];
    [v57 setBackgroundGradient:0];
    v58 = [(UIKBRenderFactory_MonolithLinearSlim *)self variantPillBackgroundColor];
    v59 = +[UIKBGradient gradientWithFlatColor:v58];
    [v57 setLayeredForegroundGradient:v59];

    v60 = [(UIKBRenderFactory_MonolithLinearSlim *)self variantTextColor];
    v61 = [v57 symbolStyle];
    [v61 setTextColor:v60];

    [v45 setVariantTraits:v57];
    v62 = [(UIKBRenderFactory_MonolithLinearSlim *)self _highlightedTraitsForControlKey:v6];
    v63 = [(UIKBRenderFactory_MonolithLinearSlim *)self highlightedVariantLayeredBackgroundColor];
    v64 = +[UIKBGradient gradientWithFlatColor:v63];
    [v62 setBackgroundGradient:v64];

    v65 = [(UIKBRenderFactory_MonolithLinearSlim *)self highlightedVariantPillBackgroundColor];
    v66 = +[UIKBGradient gradientWithFlatColor:v65];
    [v62 setLayeredForegroundGradient:v66];

    v67 = [(UIKBRenderFactory_MonolithLinearSlim *)self variantTextColor];
    v68 = [v62 symbolStyle];
    [v68 setTextColor:v67];

    [v45 setHighlightedVariantTraits:v62];
    id v7 = v83;
  }
  else
  {
    v45 = [(UIKBRenderFactory_Monolith *)self _variantTraitsForLetterKey:v6 onKeyplane:v7];
  }

  return v45;
}

@end