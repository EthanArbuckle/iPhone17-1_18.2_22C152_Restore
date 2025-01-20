@interface UIKBRenderFactoryNumberPad
- (CGPoint)centerColumnLetterOffset;
- (CGPoint)centerColumnNumberOffset;
- (CGPoint)deleteGlyphOffset;
- (CGPoint)dictationGlyphOffset;
- (CGPoint)leftColumnLetterOffset;
- (CGPoint)leftColumnNumberOffset;
- (CGPoint)loneZeroOffset;
- (CGPoint)rightColumnLetterOffset;
- (CGPoint)rightColumnNumberOffset;
- (CGPoint)specialSymbolOffset;
- (double)letterFontSize;
- (double)numberFontSize;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)controlKeyBackgroundColorName;
- (id)controlKeyDividerColorName;
- (id)controlKeyForegroundColorName;
- (int64_t)lightHighQualityEnabledBlendForm;
- (void)_customizeSymbolStyle:(id)a3 secondaryStyle:(id)a4 forKey:(id)a5 contents:(id)a6;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryNumberPad

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 1;
}

- (id)controlKeyBackgroundColorName
{
  return @"UIKBColorClear";
}

- (id)controlKeyForegroundColorName
{
  return 0;
}

- (id)controlKeyDividerColorName
{
  return @"UIKBColor10KeyLightControlKeySeparator";
}

- (double)numberFontSize
{
  return 25.0;
}

- (double)letterFontSize
{
  return 10.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 22.0;
}

- (CGPoint)deleteGlyphOffset
{
  double v2 = 1.0;
  double v3 = 1.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationGlyphOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnNumberOffset
{
  double v2 = 2.0;
  double v3 = -3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnLetterOffset
{
  double v2 = 2.0;
  double v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnNumberOffset
{
  double v2 = 0.0;
  double v3 = -3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnLetterOffset
{
  double v2 = 0.0;
  double v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnNumberOffset
{
  double v2 = 0.0;
  double v3 = -3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnLetterOffset
{
  double v2 = 0.0;
  double v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)loneZeroOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)specialSymbolOffset
{
  double v2 = 0.0;
  double v3 = 3.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_customizeSymbolStyle:(id)a3 secondaryStyle:(id)a4 forKey:(id)a5 contents:(id)a6
{
  id v40 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 interactionType] == 4)
  {
    [v40 setFontSize:15.0];
    [(UIKBRenderFactoryNumberPad *)self deleteGlyphOffset];
    objc_msgSend(v40, "setTextOffset:");
    [v40 setUsesSymbolImage:1];
  }
  if ([v11 interactionType] == 5)
  {
    [v40 setFontSize:15.0];
    [(UIKBRenderFactoryNumberPad *)self dictationGlyphOffset];
    goto LABEL_5;
  }
  if ([v11 interactionType] == 11
    || [v11 interactionType] == 9)
  {
    [v40 setFontSize:22.0];
    objc_msgSend(v40, "setTextOffset:", 0.0, 2.0);
    BOOL v14 = [v11 interactionType] == 9;
    v13 = v40;
    goto LABEL_10;
  }
  if ([v11 interactionType] == 14)
  {
    v22 = [v12 displayString];
    int v23 = [v22 isEqualToString:@"+*#"];

    if (v23)
    {
      v24 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      [v40 setFontName:v24];

      if (_AXSEnhanceTextLegibilityEnabled()) {
        [v40 setFontName:@"PhonepadTwo"];
      }
      [v40 setKerning:3.0];
      objc_msgSend(v40, "setTextOffset:", 0.0, 3.0);
      [v40 setSelector:1];
      goto LABEL_6;
    }
    v31 = [(UIKBRenderFactory *)self lightTextFontName];
    [v40 setFontName:v31];

    [v40 setFontSize:20.0];
LABEL_5:
    objc_msgSend(v40, "setTextOffset:");
LABEL_6:
    v13 = v40;
    BOOL v14 = 1;
LABEL_10:
    [v13 setUsesSymbolImage:v14];
    goto LABEL_11;
  }
  v30 = [v11 name];
  if ([v30 hasSuffix:@"Pause"])
  {
  }
  else
  {
    v37 = [v11 name];
    int v38 = [v37 hasSuffix:@"Wait"];

    if (!v38) {
      goto LABEL_11;
    }
  }
  [v40 setFontSize:16.0];
  v39 = [(UIKBRenderFactory *)self lightTextFontName];
  [v40 setFontName:v39];

  objc_msgSend(v40, "setTextOffset:", 0.0, 1.0);
LABEL_11:
  v15 = [v12 displayString];
  int v16 = [v15 isEqualToString:@"."];

  if (v16)
  {
    double v17 = 0.0;
    double v18 = -1.0;
LABEL_13:
    objc_msgSend(v40, "setTextOffset:", v17, v18);
    goto LABEL_20;
  }
  v19 = [v12 displayString];
  if ([v19 isEqualToString:@"#"]) {
    goto LABEL_17;
  }
  v20 = [v12 displayString];
  if ([v20 isEqualToString:@"*"])
  {

LABEL_17:
    goto LABEL_18;
  }
  v25 = [v12 displayString];
  char v26 = [v25 isEqualToString:@"+"];

  if (v26)
  {
LABEL_18:
    [v40 setFontSize:42.0];
    v21 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    [v40 setFontName:v21];

    [(UIKBRenderFactoryNumberPad *)self specialSymbolOffset];
    objc_msgSend(v40, "setTextOffset:");
    [v40 setSelector:1];
    if (_AXSEnhanceTextLegibilityEnabled()) {
      [v40 setFontName:@"PhonepadTwo"];
    }
    goto LABEL_20;
  }
  v27 = [v11 name];
  if ([v27 hasPrefix:@"NumberPad-"])
  {
    v28 = [v11 name];
    int v29 = [v28 hasSuffix:@"-0-Plus"];

    if (v29)
    {
      objc_msgSend(v40, "setTextOffset:", 0.0, 3.0);
      objc_msgSend(v10, "setTextOffset:", 18.0, 1.0);
      [v10 setFontSize:22.0];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v32 = [v11 name];
  if ([v32 hasPrefix:@"NumberPad-"])
  {
    v33 = [v12 secondaryDisplayStrings];
    uint64_t v34 = [v33 count];

    if (!v34)
    {
      v35 = [v11 name];
      int v36 = [v35 hasSuffix:@"-0"];

      if (v36)
      {
        [(UIKBRenderFactoryNumberPad *)self loneZeroOffset];
      }
      else
      {
        double v17 = 0.0;
        double v18 = 0.0;
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
LABEL_20:
  if ([v40 usesSymbolImage])
  {
    [(UIKBRenderFactoryNumberPad *)self symbolImageControlKeyFontSize];
    objc_msgSend(v40, "setFontSizeForSymbolImage:");
    [v40 setFontWeightForSymbolImage:*(double *)off_1E52D6BE8];
  }
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)UIKBRenderFactoryNumberPad;
  id v7 = a4;
  v8 = [(UIKBRenderFactory *)&v63 _traitsForKey:v6 onKeyplane:v7];
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm", v63.receiver, v63.super_class));
  v9 = [(UIKBRenderFactory *)self renderConfig];
  objc_msgSend(v8, "setUsesDarkAppearance:", objc_msgSend(v9, "lightKeyboard") ^ 1);

  id v10 = [v8 geometry];
  [v10 setRoundRectRadius:5.0];
  [v10 setRoundRectCorners:-1];
  [v7 frame];
  objc_msgSend(v10, "adjustForConsistentGapsWithSize:inFrame:", 6.0, 6.0, v11, v12, v13, v14);
  v15 = [(UIKBRenderFactory *)self displayContentsForKey:v6];
  int v16 = [(UIKBRenderFactory *)self lightTextFontName];
  [(UIKBRenderFactoryNumberPad *)self numberFontSize];
  double v17 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v16);
  [v8 setSymbolStyle:v17];

  double v18 = [v8 symbolStyle];
  [v18 setMinFontSize:9.0];

  v19 = [(UIKBRenderFactory *)self lightTextFontName];
  [(UIKBRenderFactoryNumberPad *)self letterFontSize];
  v20 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v19);

  [v20 setFontWeight:*(double *)off_1E52D6BD8];
  [v20 setKerning:2.0];
  v64[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  [v8 setSecondarySymbolStyles:v21];

  [v7 frame];
  double v23 = v22;

  [v6 frame];
  double v26 = v23 * 0.5;
  if (v24 + v25 >= v26)
  {
    [v6 frame];
    if (v32 <= v26)
    {
      [(UIKBRenderFactoryNumberPad *)self centerColumnNumberOffset];
      double v39 = v38;
      double v41 = v40;
      v42 = [v8 symbolStyle];
      objc_msgSend(v42, "setTextOffset:", v39, v41);

      [(UIKBRenderFactoryNumberPad *)self centerColumnLetterOffset];
    }
    else
    {
      [(UIKBRenderFactoryNumberPad *)self rightColumnNumberOffset];
      double v34 = v33;
      double v36 = v35;
      v37 = [v8 symbolStyle];
      objc_msgSend(v37, "setTextOffset:", v34, v36);

      [(UIKBRenderFactoryNumberPad *)self rightColumnLetterOffset];
    }
  }
  else
  {
    [(UIKBRenderFactoryNumberPad *)self leftColumnNumberOffset];
    double v28 = v27;
    double v30 = v29;
    v31 = [v8 symbolStyle];
    objc_msgSend(v31, "setTextOffset:", v28, v30);

    [(UIKBRenderFactoryNumberPad *)self leftColumnLetterOffset];
  }
  objc_msgSend(v20, "setTextOffset:");
  v43 = [v8 symbolStyle];
  [(UIKBRenderFactoryNumberPad *)self _customizeSymbolStyle:v43 secondaryStyle:v20 forKey:v6 contents:v15];

  v44 = [(UIKBRenderFactory *)self renderConfig];
  int v45 = [v44 whiteText];
  v46 = UIKBColorWhite;
  if (!v45) {
    v46 = UIKBColorBlack;
  }
  v47 = *v46;
  v48 = [v8 symbolStyle];
  [v48 setTextColor:v47];

  if ([v6 state] == 1)
  {
    v49 = [v8 symbolStyle];
    [v49 setTextOpacity:0.35];
  }
  v50 = [v8 symbolStyle];
  v51 = [v50 textColor];
  [v20 setTextColor:v51];

  v52 = [v8 symbolStyle];
  [v52 textOpacity];
  objc_msgSend(v20, "setTextOpacity:");

  unsigned int v53 = [v6 state];
  v54 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  if ((v53 & 4) != 0)
  {
    v55 = [(UIKBRenderFactory *)self renderConfig];
    int v56 = [v55 lightKeyboard];
    v57 = UIKBColorKeyGrayKeyLightBackgroundMedium;
    if (!v56) {
      v57 = UIKBColorKeyGrayKeyDarkBackground;
    }
    v58 = *v57;

    v54 = v58;
  }
  v59 = +[UIKBGradient gradientWithFlatColor:v54];
  [v8 setBackgroundGradient:v59];

  [v8 setControlOpacities:(v53 >> 2) & 1];
  v60 = [(UIKBRenderFactory *)self defaultKeyShadowColorName];
  v61 = +[UIKBEdgeEffect effectWithColor:v60 edges:4 inset:-1.0 weight:1.0];
  [v8 addRenderEffect:v61];

  return v8;
}

- (void)setupLayoutSegments
{
  id v12 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v12 setControlOpacities:1];
  double v3 = [(UIKBRenderFactoryNumberPad *)self controlKeyBackgroundColorName];
  v4 = +[UIKBGradient gradientWithFlatColor:v3];
  [v12 setBackgroundGradient:v4];

  v5 = +[UIKBNullEffect nullEffect];
  [v12 addRenderEffect:v5];

  id v6 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v12];
  [v6 setKeyStates:2];
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.33, 0.25);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v6];
  id v7 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v7 setControlOpacities:0];
  v8 = [(UIKBRenderFactoryNumberPad *)self controlKeyBackgroundColorName];
  v9 = +[UIKBGradient gradientWithFlatColor:v8];
  [v7 setBackgroundGradient:v9];

  id v10 = +[UIKBNullEffect nullEffect];
  [v7 addRenderEffect:v10];

  double v11 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v7];
  [v11 setKeyStates:4];
  objc_msgSend(v11, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.33, 0.25);
  objc_msgSend(v11, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v11];
}

@end