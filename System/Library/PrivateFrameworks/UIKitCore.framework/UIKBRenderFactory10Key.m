@interface UIKBRenderFactory10Key
+ (BOOL)_isActiveKeyplaneSwitchKey:(id)a3;
- (BOOL)shouldShowBottomRowEdge;
- (BOOL)shouldShowTopRowEdge;
- (BOOL)useRoundCorner;
- (CGPoint)abcKeyTextOffset;
- (CGPoint)dictationKeyTextOffset;
- (CGPoint)globeKeyTextOffset;
- (CGPoint)longVowelSignKeyTextOffset;
- (CGPoint)numberPadKeyPrimaryTextOffset;
- (CGPoint)numberPadKeySecondaryTextOffset;
- (CGPoint)numberPadVBarSecondaryTextOffset;
- (CGPoint)symbolImageControlKeyOffset;
- (UIEdgeInsets)topEdgeAdjustmentInsets;
- (double)capitalAbcSymbolSize;
- (double)keyCornerRadius;
- (double)numberPadKeyPrimarySymbolSize;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)activeControlKeyTraits;
- (id)controlKeyBackgroundColorName;
- (id)controlKeyDividerColorName;
- (id)controlKeyForegroundColorName;
- (id)controlKeyTraits;
- (id)defaultKeyDividerColorName;
- (id)displayContentsForKey:(id)a3;
- (id)shiftedControlKeyTraits;
- (id)shiftedWhiteControlKeyTraits;
- (int64_t)assetIdiom;
- (int64_t)lightHighQualityEnabledBlendForm;
- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5;
- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4;
- (void)modifyTraitsForDetachedInputSwitcher:(id)a3 withKey:(id)a4;
- (void)populateFlickGuide:(id)a3 forKey:(id)a4 from:(id)a5;
- (void)setupColumnLayoutSegmentsWithControlWidth:(double)a3;
@end

@implementation UIKBRenderFactory10Key

- (int64_t)assetIdiom
{
  return 0;
}

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 2;
}

- (id)defaultKeyDividerColorName
{
  v3 = [(UIKBRenderFactory *)self renderConfig];
  if ([v3 lightKeyboard])
  {
    v4 = [(UIKBRenderFactory *)self _controlKeyBackgroundColorName];
  }
  else
  {
    v4 = @"UIKBColorClear";
  }
  v5 = v4;

  return v5;
}

- (id)controlKeyBackgroundColorName
{
  int64_t v3 = +[UIKBRenderFactory _graphicsQuality];
  v4 = [(UIKBRenderFactory *)self renderConfig];
  int v5 = [v4 lightKeyboard];
  if (v3 == 10)
  {
    v6 = UIKBColorLightLowQualityBackdropTint;
    if (!v5) {
      v6 = UIKBColorGray_Percent20;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    v6 = UIKBColorClear;
LABEL_7:
    v7 = *v6;
    goto LABEL_9;
  }
  v7 = [(UIKBRenderFactory *)self _controlKeyBackgroundColorName];
LABEL_9:
  v8 = v7;

  return v8;
}

- (id)controlKeyForegroundColorName
{
  return 0;
}

- (id)controlKeyDividerColorName
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  v4 = UIKBColor10KeyLightControlKeySeparator;
  if (!v3) {
    v4 = UIKBColorClear;
  }
  int v5 = *v4;

  return v5;
}

- (id)displayContentsForKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIKBRenderFactory10Key;
  int v5 = [(UIKBRenderFactory *)&v25 displayContentsForKey:v4];
  if (([v4 state] & 0x10) != 0)
  {
    v20 = v5;
    v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = [v4 subtrees];
    v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = [v4 subtrees];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v15 = [MEMORY[0x1E4F1CA98] null];

          if (v14 == v15) {
            [MEMORY[0x1E4F1CA98] null];
          }
          else {
          v16 = [(UIKBRenderFactory10Key *)self displayContentsForKey:v14];
          }
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v11);
    }

    int v5 = v20;
    [v20 setVariantDisplayContents:v8];
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "flickDirection") + 1);
    v26 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v20 setHighlightedVariantsList:v18];

    [v20 setDisplayString:0];
  }

  return v5;
}

- (UIEdgeInsets)topEdgeAdjustmentInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [v9 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v9 primaryKeylayoutWidthRatio];
  if (v19 > 0.0)
  {
    [v9 primaryKeylayoutOffset];
    double v21 = v20;
    if (v20 <= 0.0)
    {
      [v9 primaryKeylayoutWidthRatio];
      double v21 = v16 * v22;
      double v20 = 0.0;
    }
    double v16 = v16 - (v21 + 0.0);
    double v14 = v14 + 0.0;
    double v12 = v12 + v20;
  }
  [v8 frame];
  double MaxY = CGRectGetMaxY(v33);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = v16;
  v34.size.height = v18;
  BOOL v24 = MaxY < CGRectGetMaxY(v34) || [(UIKBRenderFactory10Key *)self shouldShowBottomRowEdge];
  if ([(UIKBRenderFactory10Key *)self shouldShowTopRowEdge]) {
    BOOL v25 = [v8 displayRowHint] == 1;
  }
  else {
    BOOL v25 = 0;
  }
  -[UIKBRenderFactory10Key interkeyGapsCenterXOfKeyplaneFrame:](self, "interkeyGapsCenterXOfKeyplaneFrame:", v12, v14, v16, v18);
  double v27 = v26;
  [(UIKBRenderFactory *)self translucentGapWidth];
  double v29 = v28;
  [(UIKBRenderFactory *)self translucentGapWidth];
  unint64_t v31 = objc_msgSend(v10, "adjustForTranslucentGapsInFrameWithSize_10Key:centerX:bottomEdge:topEdge:", v24, v25, v29, v30, v27);

  return v31;
}

- (CGPoint)abcKeyTextOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)capitalAbcSymbolSize
{
  return 16.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 22.0;
}

- (CGPoint)globeKeyTextOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyTextOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)longVowelSignKeyTextOffset
{
  double v2 = 8.0;
  double v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)numberPadKeyPrimarySymbolSize
{
  return 22.0;
}

- (CGPoint)numberPadKeyPrimaryTextOffset
{
  double v2 = 0.0;
  double v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadKeySecondaryTextOffset
{
  double v2 = 1.0;
  double v3 = 13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadVBarSecondaryTextOffset
{
  double v2 = 1.0;
  double v3 = 13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (BOOL)shouldShowBottomRowEdge
{
  return 0;
}

- (BOOL)shouldShowTopRowEdge
{
  return 0;
}

- (BOOL)useRoundCorner
{
  return 0;
}

- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4
{
  return 0;
}

- (void)modifyTraitsForDetachedInputSwitcher:(id)a3 withKey:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 geometry];
  [v8 setDetachedVariants:1];

  id v9 = [(UIKBRenderFactory *)self renderConfig];
  int v10 = [v9 lightKeyboard];

  if (v10)
  {
    if ([(UIKBRenderFactory10Key *)self useRoundCorner])
    {
      +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha35", 0.0, 2.0, 1.0, 1.0, 0.0, 1.0, 4.5 offset insets weight];
    }
    else
    {
      [v6 setBlendForm:0];
      +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha12" edges:15 inset:-0.25 weight:0.5];
    double v11 = };
    [v6 addRenderEffect:v11];
  }
  double v12 = [(UIKBRenderFactory *)self renderConfig];
  objc_msgSend(v6, "setBlurBlending:", objc_msgSend(v12, "lightKeyboard") ^ 1);

  if ([v7 displayType] == 13 || objc_msgSend(v7, "displayType") == 4) {
    double v13 = off_1E52D3B08;
  }
  else {
    double v13 = off_1E52D40B8;
  }
  double v14 = [(__objc2_class *)*v13 sharedInstance];
  [v14 popupRect];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  long long v23 = +[UIKeyboardImpl activeInstance];
  BOOL v24 = [v23 _layout];
  objc_msgSend(v24, "convertRect:fromView:", v14, v16, v18, v20, v22);
  double x = v25;
  double y = v27;
  double width = v29;
  double height = v31;

  if ([(UIKBRenderFactory10Key *)self useRoundCorner])
  {
    [(UIKBRenderFactory10Key *)self keyCornerRadius];
    CGFloat v34 = v33;
    [(UIKBRenderFactory10Key *)self keyCornerRadius];
    CGFloat v36 = v35;
    v54.origin.double x = x;
    v54.origin.double y = y;
    v54.size.double width = width;
    v54.size.double height = height;
    CGRect v55 = CGRectInset(v54, v34, v36);
    double x = v55.origin.x;
    double y = v55.origin.y;
    double width = v55.size.width;
    double height = v55.size.height;
  }
  v37 = [v6 geometry];
  [v37 displayFrame];
  v60.origin.double x = x;
  v60.origin.double y = y;
  v60.size.double width = width;
  v60.size.double height = height;
  CGRect v57 = CGRectUnion(v56, v60);
  CGFloat v38 = v57.origin.x;
  CGFloat v39 = v57.origin.y;
  CGFloat v40 = v57.size.width;
  CGFloat v41 = v57.size.height;

  v58.origin.double x = v38;
  v58.origin.double y = v39;
  v58.size.double width = v40;
  v58.size.double height = v41;
  CGRect v59 = CGRectInset(v58, -12.0, -6.0);
  double v42 = v59.origin.x;
  double v43 = v59.origin.y;
  double v44 = v59.size.width;
  double v45 = v59.size.height;
  v46 = [v6 geometry];
  objc_msgSend(v46, "setDisplayFrame:", v42, v43, v44, v45);

  v47 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", x, y, width, height, x, y, width, height);
  v53[0] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [v6 setVariantGeometries:v48];

  v49 = [v6 geometry];
  [v49 setPopupBias:40];

  [(UIKBRenderFactory10Key *)self keyCornerRadius];
  double v51 = v50;
  v52 = [v6 geometry];
  [v52 setRoundRectRadius:v51];
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v297[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v295.receiver = self;
  v295.super_class = (Class)UIKBRenderFactory10Key;
  id v8 = [(UIKBRenderFactory *)&v295 _traitsForKey:v6 onKeyplane:v7];
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  id v9 = [v8 geometry];
  [v9 paddedFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [v8 geometry];
  objc_msgSend(v18, "setDisplayFrame:", v11, v13, v15, v17);

  double v19 = [(UIKBRenderFactory *)self renderConfig];
  objc_msgSend(v8, "setUsesDarkAppearance:", objc_msgSend(v19, "lightKeyboard") ^ 1);

  if ([v6 clipCorners])
  {
    uint64_t v20 = [v6 clipCorners];
    double v21 = [v8 geometry];
    [v21 setRoundRectCorners:v20];

    double v22 = [v8 geometry];
    [v22 setRoundRectRadius:10.0];
  }
  long long v23 = [v8 geometry];
  [(UIKBRenderFactory10Key *)self topEdgeAdjustmentInsets];
  objc_msgSend(v23, "adjustToTopWithInsets:");

  if ([(UIKBRenderFactory10Key *)self useRoundCorner]
    && [(UIKBRenderFactory10Key *)self roundCornersForKey:v6 onKeyplane:v7] == -1)
  {
    unint64_t v25 = 0;
  }
  else
  {
    BOOL v24 = [v8 geometry];
    unint64_t v25 = [(UIKBRenderFactory10Key *)self edgesAdjustedForTranslucentGapsForGeometry:v24 key:v6 onKeyplane:v7];
  }
  v290 = v6;
  int v26 = [v6 displayType];
  double v27 = [(UIKBRenderFactory *)self lightKeycapsFontName];
  double v28 = +[UIKBTextStyle styleWithFontName:v27 withFontSize:22.0];
  [v8 setSymbolStyle:v28];

  double v29 = [v8 symbolStyle];
  [v29 setKerning:2.0];

  double v30 = [v8 symbolStyle];
  [v30 setMinFontSize:9.0];

  double v31 = [(UIKBRenderFactory *)self lightKeycapsFontName];
  v32 = +[UIKBTextStyle styleWithFontName:v31 withFontSize:12.0];

  [v32 setKerning:2.0];
  [v32 setMinFontSize:9.0];
  v297[0] = v32;
  double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v297 count:1];
  [v8 setSecondarySymbolStyles:v33];

  unint64_t v287 = v25;
  v289 = v7;
  unsigned int v284 = v26;
  switch(v26)
  {
    case 34:
      double v44 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      double v45 = [v8 symbolStyle];
      [v45 setFontName:v44];

      v46 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      [v32 setFontName:v46];

      [v32 setFontSize:14.0];
      [(UIKBRenderFactory10Key *)self longVowelSignKeyTextOffset];
      objc_msgSend(v32, "setTextOffset:");
LABEL_27:
      id v6 = v290;
      goto LABEL_36;
    case 31:
      v47 = [v6 name];
      char v48 = [v47 containsString:@"Facemark"];

      if ((v48 & 1) == 0)
      {
        v49 = [v8 symbolStyle];
        [v49 setFontName:@".PhoneKeyCaps"];

        [v32 setFontName:@".PhoneKeyCaps"];
      }
      CGFloat v34 = [(UIKBRenderFactory10Key *)self displayContentsForKey:v6];
      uint64_t v50 = [v34 displayString];
      if (v50)
      {
        double v51 = (void *)v50;
        v52 = [v34 secondaryDisplayStrings];
        uint64_t v53 = [v52 count];

        if (v53)
        {
          CGRect v54 = [v8 symbolStyle];
          [v54 setFontSize:14.0];

          CGRect v55 = [v8 symbolStyle];
          objc_msgSend(v55, "setTextOffset:", 0.0, 6.0);

          CGRect v56 = [v8 symbolStyle];
          [v56 setKerning:0.0];

          [v32 setFontSize:22.0];
          objc_msgSend(v32, "setTextOffset:", 7.0, 3.0);
          [v32 setKerning:-6.0];
        }
      }
      goto LABEL_35;
    case 20:
      CGFloat v34 = [v6 displayString];
      if ((unint64_t)[v34 length] >= 2)
      {
        unint64_t v35 = [v34 rangeOfString:@"/"];
        if (v35 < [v34 length] - 1)
        {
          [(UIKBRenderFactory10Key *)self numberPadKeyPrimarySymbolSize];
          double v37 = v36;
          CGFloat v38 = [v8 symbolStyle];
          [v38 setFontSize:v37];

          [(UIKBRenderFactory10Key *)self numberPadKeyPrimaryTextOffset];
          double v40 = v39;
          double v42 = v41;
          double v43 = [v8 symbolStyle];
          objc_msgSend(v43, "setTextOffset:", v40, v42);

          if ([v34 rangeOfString:@"|"] == 0x7FFFFFFFFFFFFFFFLL) {
            [(UIKBRenderFactory10Key *)self numberPadKeySecondaryTextOffset];
          }
          else {
            [(UIKBRenderFactory10Key *)self numberPadVBarSecondaryTextOffset];
          }
          objc_msgSend(v32, "setTextOffset:");
        }
      }
      goto LABEL_35;
    case 25:
      CGRect v57 = [(UIKBRenderFactory *)self lightTextFontName];
      CGRect v58 = [v8 symbolStyle];
      [v58 setFontName:v57];

      CGRect v59 = [v8 symbolStyle];
      [v59 setFontSize:16.0];

      uint64_t v60 = [v7 visualStyling] & 0xFF0000;
      v61 = [v8 symbolStyle];
      v62 = v61;
      if (v60 == 2228224) {
        [v61 setKerning:0.0];
      }
      else {
        objc_msgSend(v61, "setTextOffset:", 1.0, 0.0);
      }
      goto LABEL_26;
  }
  if ([v6 interactionType] == 24)
  {
    v63 = [(UIKBRenderFactory *)self lightTextFontName];
    v64 = [v8 symbolStyle];
    [v64 setFontName:v63];

    v65 = [v8 symbolStyle];
    [v65 setFontSize:16.0];

    goto LABEL_36;
  }
  if (v26 > 4)
  {
    if (v26 == 5)
    {
      v72 = [v8 symbolStyle];
      [v72 setFontSize:37.0];
LABEL_145:

      v224 = [v8 symbolStyle];
      [v224 setUsesSymbolImage:1];
LABEL_146:

      goto LABEL_36;
    }
    if (v26 == 21) {
      goto LABEL_130;
    }
  }
  else
  {
    if (v26 == 3)
    {
      v215 = [v8 symbolStyle];
      [v215 setFontSize:15.0];

      [(UIKBRenderFactory *)self scale];
      if (v216 == 2.0) {
        double v217 = 0.0;
      }
      else {
        double v217 = *MEMORY[0x1E4F1DAD8];
      }
      if (v216 == 2.0) {
        double v218 = -0.5;
      }
      else {
        double v218 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      v219 = [v8 symbolStyle];
      objc_msgSend(v219, "setTextOffset:", v217, v218);

      v72 = [v8 symbolStyle];
      [v72 setKerning:0.0];
      goto LABEL_145;
    }
    if (v26 == 4)
    {
      v66 = [v8 symbolStyle];
      [v66 setFontSize:19.0];

      [(UIKBRenderFactory10Key *)self dictationKeyTextOffset];
LABEL_32:
      double v69 = v67;
      double v70 = v68;
      v71 = [v8 symbolStyle];
      v72 = v71;
      double v73 = v69;
      double v74 = v70;
LABEL_144:
      objc_msgSend(v71, "setTextOffset:", v73, v74);
      goto LABEL_145;
    }
  }
  v199 = [v6 name];
  int v200 = [v199 containsString:@"Syllable-Separator"];

  if (v200)
  {
LABEL_130:
    v201 = [v6 displayString];
    int v202 = [v201 containsString:@"Emoji"];

    if (v202)
    {
      v203 = [v8 symbolStyle];
      [v203 setUsesSymbolImage:1];

      v204 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      v205 = [v8 symbolStyle];
      [v205 setFontName:v204];

      [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
      double v207 = v206;
      v208 = [v8 symbolStyle];
      [v208 setFontSize:v207];

      double v209 = *(double *)off_1E52D6BE8;
      v210 = [v8 symbolStyle];
      [v210 setFontWeight:v209];

      [(UIKBRenderFactory10Key *)self symbolImageControlKeyOffset];
      double v212 = v211;
      double v214 = v213;
    }
    else
    {
      v220 = [(UIKBRenderFactory *)self lightTextFontName];
      v221 = [v8 symbolStyle];
      [v221 setFontName:v220];

      v222 = [v8 symbolStyle];
      [v222 setFontSize:16.0];

      [(UIKBRenderFactory *)self scale];
      double v214 = 0.0;
      if (v223 == 2.0) {
        double v212 = 0.0;
      }
      else {
        double v212 = 0.5;
      }
    }
    v71 = [v8 symbolStyle];
    v72 = v71;
    double v73 = v212;
    double v74 = v214;
    goto LABEL_144;
  }
  switch(v26)
  {
    case 13:
      v237 = [v8 symbolStyle];
      [v237 setFontSize:28.0];

      [(UIKBRenderFactory10Key *)self globeKeyTextOffset];
      goto LABEL_32;
    case 35:
      [v6 frame];
      if (CGRectGetHeight(v303) <= 45.0)
      {
        v238 = [v6 name];
        if ([v238 hasPrefix:@"TenKey-Chinese-Pinyin-"])
        {

LABEL_164:
          [(UIKBRenderFactory10Key *)self capitalAbcSymbolSize];
          double v249 = v248;
          v250 = [v8 symbolStyle];
          v251 = v250;
          double v252 = v249;
          goto LABEL_169;
        }
        v245 = [v6 name];
        if ([v245 hasPrefix:@"TenKey-Latin-"])
        {
          v246 = [v6 name];
          char v247 = [v246 hasPrefix:@"TenKey-Latin-Small-"];

          if ((v247 & 1) == 0) {
            goto LABEL_164;
          }
        }
        else
        {
        }
      }
      v250 = [v8 symbolStyle];
      v251 = v250;
      double v252 = 16.0;
LABEL_169:
      [v250 setFontSize:v252];

      v258 = [v6 name];
      if ([v258 hasPrefix:@"TenKey-Chinese-Pinyin-"])
      {
      }
      else
      {
        v259 = [v6 name];
        int v260 = [v259 hasPrefix:@"TenKey-Latin-"];

        if (!v260) {
          goto LABEL_36;
        }
      }
      CGFloat v34 = [v8 symbolStyle];
      [v34 setFontName:@"UIKBRenderFactorySystemFontName"];
LABEL_35:

      goto LABEL_36;
    case 23:
      v225 = [v8 symbolStyle];
      [v225 setFontSize:18.0];

      v226 = [v8 symbolStyle];
      objc_msgSend(v226, "setTextOffset:", 0.0, -1.0);

      v227 = [v8 symbolStyle];
      [v227 setUsesSymbolImage:1];

      if ([v6 state] == 8)
      {
        v224 = [v8 geometry];
        [v224 displayFrame];
        double v229 = v228;
        double v231 = v230 + 0.0;
        double v233 = v232 + -0.5;
        double v235 = v234 + 0.5;
        v236 = [v8 geometry];
        objc_msgSend(v236, "setDisplayFrame:", v231, v233, v229, v235);
LABEL_152:

        goto LABEL_146;
      }
      goto LABEL_36;
  }
  v239 = [v6 name];
  int v240 = [v239 hasPrefix:@"Wubihua"];

  if (v240)
  {
    v241 = [v8 symbolStyle];
    v224 = v241;
    double v242 = 26.0;
LABEL_161:
    [v241 setFontSize:v242];
    goto LABEL_146;
  }
  v243 = [v6 name];
  int v244 = [v243 hasSuffix:@"Chinese-Facemark"];

  if (v244)
  {
    v241 = [v8 symbolStyle];
    v224 = v241;
    double v242 = 22.0;
    goto LABEL_161;
  }
  v253 = [v6 name];
  int v254 = [v253 hasSuffix:@"Comma-Full-Stop-Question-Mark-Exclamation-Mark"];

  if (v254)
  {
    v255 = [v8 symbolStyle];
    [v255 setFontSize:22.0];

    v256 = [v8 symbolStyle];
    v224 = v256;
    double v257 = 1.0;
LABEL_175:
    [v256 setKerning:v257];
    goto LABEL_146;
  }
  v261 = [v6 name];
  int v262 = [v261 hasSuffix:@"Chinese-Full-Width-Half-Width-Swap"];

  if (v262)
  {
    v263 = [v8 symbolStyle];
    [v263 setFontSize:16.0];

    v256 = [v8 symbolStyle];
    v224 = v256;
    double v257 = -1.0;
    goto LABEL_175;
  }
  if (v26 > 0x21) {
    goto LABEL_195;
  }
  if (((1 << v26) & 0x44C04) == 0)
  {
    if (v26 == 32)
    {
      v280 = [v8 symbolStyle];
      [v280 setFontSize:28.0];
LABEL_196:

      goto LABEL_27;
    }
    if (v26 == 33)
    {
      v276 = [v8 symbolStyle];
      [v276 setFontSize:28.0];

      [(UIKBRenderFactory *)self scale];
      if (v277 == 2.0) {
        double v278 = -0.5;
      }
      else {
        double v278 = *MEMORY[0x1E4F1DAD8];
      }
      if (v277 == 2.0) {
        double v279 = 0.0;
      }
      else {
        double v279 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      v280 = [v8 symbolStyle];
      objc_msgSend(v280, "setTextOffset:", v278, v279);
      goto LABEL_196;
    }
LABEL_195:
    v280 = -[UIKBRenderFactory10Key _preferredScriptFontForRendering:](self, "_preferredScriptFontForRendering:", ([v7 visualStyling] >> 16));
    v281 = [v8 symbolStyle];
    [v281 setFontName:v280];

    goto LABEL_196;
  }
  v264 = [v8 symbolStyle];
  [v264 setKerning:0.0];

  v265 = [v8 symbolStyle];
  [v265 setFontSize:16.0];

  v266 = [v8 symbolStyle];
  [v266 setUsesSymbolImage:1];

  v267 = [v6 displayString];
  int v268 = [v267 hasSuffix:@"ABC"];

  if (v268)
  {
    [(UIKBRenderFactory10Key *)self abcKeyTextOffset];
    double v270 = v269;
    double v272 = v271;
    v273 = [v8 symbolStyle];
    objc_msgSend(v273, "setTextOffset:", v270, v272);
  }
  v62 = [v6 name];
  if ([v62 hasSuffix:@"Symbol-Alternative-To-Symbol-Alternative-Width-Toggle-Keyplane-Switch-Key"])goto LABEL_26; {
  v274 = [v6 name];
  }
  if ([v274 hasSuffix:@"Symbol-Alternative-Width-Toggle-To-Symbol-Alternative-Keyplane-Switch-Key"])goto LABEL_184; {
  v275 = [v6 name];
  }
  if ([v275 hasSuffix:@"Symbol-To-Symbol-Width-Toggle-Keyplane-Switch-Key"])
  {

LABEL_184:
LABEL_26:

    goto LABEL_27;
  }
  v282 = [v6 name];
  char v283 = [v282 hasSuffix:@"Symbol-Width-Toggle-To-Symbol-Keyplane-Switch-Key"];

  if ((v283 & 1) == 0)
  {
    v224 = [(UIKBRenderFactory *)self lightTextFontName];
    v236 = [v8 symbolStyle];
    [v236 setFontName:v224];
    goto LABEL_152;
  }
LABEL_36:
  v75 = [v6 name];
  if ([v75 hasSuffix:@"At-Sign-Number-Sign-Solidus-Ampersand-Underline"])
  {
LABEL_39:

LABEL_40:
    [v8 setSecondarySymbolStyles:0];
    goto LABEL_41;
  }
  v76 = [v6 name];
  if ([v76 hasSuffix:@"Case-Swap"])
  {

    goto LABEL_39;
  }
  v96 = [v6 name];
  char v97 = [v96 hasSuffix:@"Chinese-Digit-Symbols"];

  if (v97) {
    goto LABEL_40;
  }
LABEL_41:
  v77 = [v8 secondarySymbolStyles];
  v78 = [v77 firstObject];

  int v79 = [v6 state] & 0xC;
  v80 = [(UIKBRenderFactory *)self renderConfig];
  if ([v80 whiteText]) {
    v81 = @"UIKBColorWhite";
  }
  else {
    v81 = @"UIKBColorBlack";
  }
  v82 = [v8 symbolStyle];
  [v82 setTextColor:v81];

  v83 = [v8 symbolStyle];
  v84 = [v83 textColor];
  v286 = v78;
  [v78 setTextColor:v84];

  if (v79) {
    [(UIKBRenderFactory10Key *)self controlKeyBackgroundColorName];
  }
  else {
  v285 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  }
  v85 = +[UIKBGradient gradientWithFlatColor:v285];
  [v8 setBackgroundGradient:v85];

  [v8 setControlOpacities:v79 != 0];
  if (+[UIKBRenderFactory _graphicsQuality] != 10) {
    [v8 setBlurBlending:v79 != 0];
  }
  [(UIKBRenderFactory *)self translucentGapWidth];
  double v87 = v86;
  v88 = [(UIKBRenderFactory10Key *)self defaultKeyDividerColorName];
  v89 = [(UIKBRenderFactory *)self renderConfig];
  int v90 = [v89 lightKeyboard];

  uint64_t v91 = v287;
  if (v90)
  {
    if ([(id)objc_opt_class() _isActiveKeyplaneSwitchKey:v6])
    {
      v92 = [(UIKBRenderFactory *)self renderConfig];
      v93 = [v92 activatedKeyplaneSwitchControlKeyBackgroundName];
      v94 = +[UIKBGradient gradientWithFlatColor:v93];
      [v8 setBackgroundGradient:v94];

      uint64_t v95 = [(UIKBRenderFactory10Key *)self controlKeyDividerColorName];

      [(UIKBRenderFactory *)self suppressLayoutSegments];
      v88 = (void *)v95;
    }
    else if (v79)
    {
      uint64_t v91 = 15;
    }
  }
  if ([(id)objc_opt_class() _isActiveKeyplaneSwitchKey:v6]) {
    [v8 setBlurBlending:0];
  }
  if ([v6 state] == 1)
  {
    v98 = [v8 symbolStyle];
    [v98 setTextOpacity:0.35];
  }
  if (v91 && ([v6 state] & 0x10) == 0)
  {
    double v99 = 0.0;
    if (v91) {
      double v100 = -v87;
    }
    else {
      double v100 = 0.0;
    }
    if ((v91 & 4) != 0) {
      double v101 = -v87;
    }
    else {
      double v101 = 0.0;
    }
    if ((v91 & 8) != 0) {
      double v102 = -v87;
    }
    else {
      double v102 = 0.0;
    }
    if ((v91 & 2) != 0)
    {
      v103 = [v8 geometry];
      [v103 frame];
      double v105 = v104;
      v106 = [v8 geometry];
      [v106 paddedFrame];
      double v99 = v105 - v107;
    }
    v108 = +[UIKBEdgeEffect effectWithColor:edges:insets:weight:](UIKBEdgeEffect, "effectWithColor:edges:insets:weight:", v88, v91, v100, v99, v101, v102, v87);
    [v8 addRenderEffect:v108];
  }
  if ([(UIKBRenderFactory *)self useBlueThemingForKey:v6])
  {
    if ([v6 state] == 2)
    {
      [(UIKBRenderFactory *)self suppressLayoutSegments];
      v109 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorKeyBlueKeyBackground"];
      [v8 setBackgroundGradient:v109];

      v110 = [(UIKBRenderFactory10Key *)self controlKeyDividerColorName];
      v111 = +[UIKBEdgeEffect effectWithColor:v110 edges:15 inset:-v87 weight:v87];
      [v8 addRenderEffect:v111];

      v112 = [(UIKBRenderFactory *)self renderConfig];
      LODWORD(v110) = [v112 lightKeyboard];

      if (v110)
      {
        v113 = [v8 symbolStyle];
        [v113 setTextColor:@"UIKBColorWhite"];
      }
    }
  }
  v288 = v88;
  if (v284 <= 0xD && ((1 << v284) & 0x2030) != 0)
  {
    [v6 state];
    int v114 = 1;
  }
  else
  {
    if ([v6 state] == 16)
    {
      v148 = [v8 symbolStyle];
      v149 = (void *)[v148 copy];
      v117 = +[UIKBRenderTraits traitsWithSymbolStyle:v149];

      v150 = [v8 symbolStyle];
      v151 = [v150 textColor];
      v152 = [v117 symbolStyle];
      [v152 setTextColor:v151];

      v153 = [v117 symbolStyle];
      [v153 setFontSize:26.0];

      double v154 = *MEMORY[0x1E4F1DAD8];
      double v155 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v156 = [v117 symbolStyle];
      objc_msgSend(v156, "setTextOffset:", v154, v155);

      [v8 setVariantTraits:v117];
      v157 = [v117 symbolStyle];
      v158 = (void *)[v157 copy];
      v131 = +[UIKBRenderTraits traitsWithSymbolStyle:v158];

      v159 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorKeyBlueKeyBackground"];
      [v131 setLayeredForegroundGradient:v159];

      v160 = [v131 symbolStyle];
      [v160 setTextColor:@"UIKBColorWhite"];

      [v8 setHighlightedVariantTraits:v131];
      v161 = [v8 geometry];
      [v161 setRoundRectCorners:0];

      v162 = [v8 geometry];
      [(UIKBRenderFactory10Key *)self populateFlickGuide:v8 forKey:v6 from:v162];

      uint64_t v163 = [v6 flickDirection];
      v164 = [v8 geometry];
      [v164 setFlickDirection:v163];

      v165 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha40", 0.0, 4.0, 1.0, 1.0, 1.0, 1.0, 15.0 offset insets weight];
      [v8 addRenderEffect:v165];

      v166 = [(UIKBRenderFactory *)self renderConfig];
      LODWORD(v164) = [v166 lightKeyboard];

      if (v164)
      {
        v167 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorLightBackdropTint"];
        [v8 setLayeredBackgroundGradient:v167];
      }
      v168 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha20" edges:15 inset:0.0 weight:v87];
      [v8 addRenderEffect:v168];

      [v8 setBlurBlending:1];
      v169 = [(UIKBRenderFactory *)self renderConfig];
      if ([v169 animatedBackground]) {
        int64_t v170 = [(UIKBRenderFactory *)self enabledBlendForm];
      }
      else {
        int64_t v170 = 0;
      }
      [v8 setBlendForm:v170];
      int v114 = 0;
      goto LABEL_95;
    }
    int v114 = 0;
  }
  if ([v6 state] == 20)
  {
    v115 = [v8 symbolStyle];
    v116 = (void *)[v115 copy];
    v117 = +[UIKBRenderTraits traitsWithSymbolStyle:v116];

    v118 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
    v119 = +[UIKBGradient gradientWithFlatColor:v118];
    [v117 setBackgroundGradient:v119];

    v120 = [v117 symbolStyle];
    [v120 setFontSize:30.0];

    double v121 = *MEMORY[0x1E4F1DAD8];
    double v122 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v123 = [v117 symbolStyle];
    objc_msgSend(v123, "setTextOffset:", v121, v122);

    v124 = [v8 symbolStyle];
    v125 = [v124 textColor];
    v126 = [v117 symbolStyle];
    [v126 setTextColor:v125];

    v127 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha40", 0.0, 4.0, 1.0, 1.0, 1.0, 1.0, 15.0 offset insets weight];
    [v117 addRenderEffect:v127];

    v128 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha15" edges:15 inset:-v87 weight:v87];
    [v117 addRenderEffect:v128];

    v129 = [v8 geometry];
    uint64_t v130 = [v6 flickDirection];
    [(UIKBRenderFactory *)self scale];
    v131 = objc_msgSend(v129, "copyForFlickDirection:scale:", v130);

    v132 = [v8 geometry];
    [v132 paddedFrame];
    double MidX = CGRectGetMidX(v299);
    v134 = [v8 geometry];
    [v134 paddedFrame];
    objc_msgSend(v131, "setPopupSource:", MidX, CGRectGetMidY(v300));

    [v131 displayFrame];
    CGRect v302 = CGRectInset(v301, -20.0, -20.0);
    objc_msgSend(v131, "setDisplayFrame:", v302.origin.x, v302.origin.y, v302.size.width, v302.size.height);
    objc_msgSend(v131, "setFlickDirection:", objc_msgSend(v6, "flickDirection"));
    [v131 setRoundRectCorners:-1];
    [v117 setGeometry:v131];
    [v8 setVariantTraits:v117];
    [v131 displayFrame];
    double v136 = v135;
    double v138 = v137;
    double v140 = v139;
    double v142 = v141;
    v143 = [v8 geometry];
    objc_msgSend(v143, "setDisplayFrame:", v136, v138, v140, v142);

    uint64_t v144 = [v6 flickDirection];
    v145 = [v8 geometry];
    [v145 setFlickDirection:v144];

    [v117 setBlurBlending:1];
    v146 = [(UIKBRenderFactory *)self renderConfig];
    if ([v146 animatedBackground]) {
      int64_t v147 = [(UIKBRenderFactory *)self enabledBlendForm];
    }
    else {
      int64_t v147 = 0;
    }
    [v8 setBlendForm:v147];

    v171 = [(UIKBRenderFactory *)self renderConfig];
    int v172 = [v171 lightKeyboard];

    if (!v172) {
      goto LABEL_96;
    }
    v169 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorLightBackdropTint"];
    [v8 setLayeredBackgroundGradient:v169];
LABEL_95:

LABEL_96:
    [(UIKBRenderFactory *)self suppressLayoutSegments];
  }
  char v173 = [v6 state];
  if (v114 && (v173 & 0x10) != 0)
  {
    v174 = [(UIKBRenderFactory *)self renderingContext];
    v175 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    [(UIKBRenderFactory *)self _customizeTraits:v8 forPopupForKey:v6 withRenderingContext:v174 keycapsFontName:v175];

    [(UIKBRenderFactory *)self suppressLayoutSegments];
  }
  v177 = v288;
  v176 = v289;
  if (([(id)objc_opt_class() _isActiveKeyplaneSwitchKey:v6] & 1) == 0)
  {
    long long v293 = 0u;
    long long v294 = 0u;
    long long v291 = 0u;
    long long v292 = 0u;
    v178 = [v289 subtrees];
    uint64_t v179 = [v178 countByEnumeratingWithState:&v291 objects:v296 count:16];
    if (v179)
    {
      uint64_t v180 = v179;
      uint64_t v181 = *(void *)v292;
LABEL_103:
      uint64_t v182 = 0;
      while (1)
      {
        if (*(void *)v292 != v181) {
          objc_enumerationMutation(v178);
        }
        v183 = *(void **)(*((void *)&v291 + 1) + 8 * v182);
        v184 = [v183 name];
        char v185 = [v184 _containsSubstring:@"Assist"];

        if (v185) {
          break;
        }
        if (v180 == ++v182)
        {
          uint64_t v180 = [v178 countByEnumeratingWithState:&v291 objects:v296 count:16];
          if (v180) {
            goto LABEL_103;
          }
          id v186 = 0;
          v176 = v289;
          id v6 = v290;
          v177 = v288;
          goto LABEL_120;
        }
      }
      id v186 = v183;

      if (!v186)
      {
        v176 = v289;
        id v6 = v290;
        v177 = v288;
        goto LABEL_121;
      }
      v187 = [v186 keys];
      id v6 = v290;
      int v188 = [v187 containsObject:v290];

      v177 = v288;
      v176 = v289;
      if (!v188) {
        goto LABEL_121;
      }
      if (([v290 state] & 3) != 0)
      {
        uint64_t v189 = [(UIKBRenderFactory10Key *)self controlKeyTraits];
      }
      else
      {
        if (([v290 state] & 4) == 0)
        {
LABEL_119:
          v178 = [v8 symbolStyle];
          [v178 setUsesSymbolImage:1];
          goto LABEL_120;
        }
        uint64_t v189 = [(UIKBRenderFactory10Key *)self activeControlKeyTraits];
      }
      v190 = (void *)v189;
      [v8 overlayWithTraits:v189];

      goto LABEL_119;
    }
    id v186 = 0;
LABEL_120:

LABEL_121:
  }
  v191 = [v8 symbolStyle];
  int v192 = [v191 usesSymbolImage];

  if (v192)
  {
    [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
    double v194 = v193;
    v195 = [v8 symbolStyle];
    [v195 setFontSizeForSymbolImage:v194];

    double v196 = *(double *)off_1E52D6BE8;
    v197 = [v8 symbolStyle];
    [v197 setFontWeightForSymbolImage:v196];
  }
  return v8;
}

- (id)controlKeyTraits
{
  [(UIKBRenderFactory *)self translucentGapWidth];
  double v4 = v3;
  double v5 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v5 setControlOpacities:1];
  id v6 = [(UIKBRenderFactory10Key *)self controlKeyBackgroundColorName];
  id v7 = +[UIKBGradient gradientWithFlatColor:v6];
  [v5 setBackgroundGradient:v7];

  id v8 = [(UIKBRenderFactory10Key *)self controlKeyDividerColorName];
  id v9 = +[UIKBEdgeEffect effectWithColor:v8 edges:15 inset:-v4 weight:v4];
  [v5 addRenderEffect:v9];

  return v5;
}

- (id)activeControlKeyTraits
{
  [(UIKBRenderFactory *)self translucentGapWidth];
  double v4 = v3;
  double v5 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v5 setControlOpacities:0];
  id v6 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  id v7 = +[UIKBGradient gradientWithFlatColor:v6];
  [v5 setBackgroundGradient:v7];

  id v8 = [(UIKBRenderFactory10Key *)self controlKeyDividerColorName];
  id v9 = +[UIKBEdgeEffect effectWithColor:v8 edges:15 inset:-v4 weight:v4];
  [v5 addRenderEffect:v9];

  return v5;
}

- (id)shiftedControlKeyTraits
{
  double v3 = [(UIKBRenderFactory10Key *)self controlKeyTraits];
  double v4 = [(UIKBRenderFactory *)self renderConfig];
  int v5 = [v4 lightKeyboard];
  id v6 = UIKBColorBlack;
  if (!v5) {
    id v6 = UIKBColorWhite;
  }
  id v7 = *v6;

  id v8 = +[UIKBTextStyle styleWithTextColor:v7];

  [v3 setSymbolStyle:v8];
  id v9 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  double v10 = +[UIKBGradient gradientWithFlatColor:v9];
  [v3 setBackgroundGradient:v10];

  return v3;
}

- (id)shiftedWhiteControlKeyTraits
{
  double v3 = [(UIKBRenderFactory10Key *)self controlKeyTraits];
  double v4 = [(UIKBRenderFactory *)self renderConfig];
  int v5 = [v4 lightKeyboard];
  id v6 = UIKBColorBlack;
  if (!v5) {
    id v6 = UIKBColorWhite;
  }
  id v7 = *v6;

  id v8 = +[UIKBTextStyle styleWithTextColor:v7];

  [v3 setSymbolStyle:v8];
  id v9 = [(UIKBRenderFactory *)self renderConfig];
  int v10 = [v9 lightKeyboard];
  double v11 = UIKBColor10KeyWhiteShiftedBackground;
  if (!v10) {
    double v11 = UIKBColorKeyGrayKeyDarkBackground;
  }
  double v12 = *v11;

  double v13 = +[UIKBGradient gradientWithFlatColor:v12];

  [v3 setBackgroundGradient:v13];
  return v3;
}

- (void)setupColumnLayoutSegmentsWithControlWidth:(double)a3
{
  int v5 = [(UIKBRenderFactory10Key *)self controlKeyTraits];
  id v12 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v5];

  [v12 setKeyStates:3];
  objc_msgSend(v12, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, a3, 1.0);
  objc_msgSend(v12, "addLayoutRect:asTriangle:", 0, 1.0 - a3, 0.0, a3, 1.0);
  [(UIKBRenderFactory *)self addLayoutSegment:v12];
  id v6 = [(UIKBRenderFactory10Key *)self activeControlKeyTraits];
  id v7 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v6];

  [v7 setKeyStates:4];
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, a3, 1.0);
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 1.0 - a3, 0.0, a3, 1.0);
  [(UIKBRenderFactory *)self addLayoutSegment:v7];
  id v8 = [(UIKBRenderFactory10Key *)self shiftedControlKeyTraits];
  id v9 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v8];

  [v9 setKeyStates:108];
  [v9 setRequireAllMatches:1];
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, a3, 1.0);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 1.0 - a3, 0.0, a3, 1.0);
  [v9 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v9];
  int v10 = [(UIKBRenderFactory10Key *)self shiftedWhiteControlKeyTraits];
  double v11 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v10];

  [v11 setKeyStates:108];
  [v11 setRequireAllMatches:1];
  objc_msgSend(v11, "addLayoutRect:asTriangle:", 0, a3, 0.0, 1.0 - a3 - a3, 1.0);
  [v11 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v11];
}

+ (BOOL)_isActiveKeyplaneSwitchKey:(id)a3
{
  id v3 = a3;
  if (([v3 state] & 0xC) != 0)
  {
    int v4 = [v3 displayType];
    BOOL v6 = v4 == 14 || v4 == 11;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)populateFlickGuide:(id)a3 forKey:(id)a4 from:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 displayFrame];
  CGFloat x = v10;
  CGFloat y = v12;
  CGFloat width = v14;
  CGFloat height = v16;
  double v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  double v19 = (void *)[v9 copy];
  [(UIKBRenderFactory *)self scale];
  objc_msgSend(v19, "makeIntegralWithScale:");
  [v18 addObject:v19];
  uint64_t v20 = 0;
  do
  {
    double v21 = [v8 subtrees];
    uint64_t v22 = v20 + 1;
    long long v23 = [v21 objectAtIndex:v20 + 1];

    BOOL v24 = [MEMORY[0x1E4F1CA98] null];

    if (v23 == v24)
    {
      unint64_t v25 = [MEMORY[0x1E4F1CA98] null];
    }
    else
    {
      [(UIKBRenderFactory *)self scale];
      unint64_t v25 = objc_msgSend(v19, "copyForPopupDirection:scale:", v20);
      [v25 displayFrame];
      v41.origin.CGFloat x = v26;
      v41.origin.CGFloat y = v27;
      v41.size.CGFloat width = v28;
      v41.size.CGFloat height = v29;
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      CGRect v38 = CGRectUnion(v37, v41);
      CGFloat x = v38.origin.x;
      CGFloat y = v38.origin.y;
      CGFloat width = v38.size.width;
      CGFloat height = v38.size.height;
    }
    [v18 addObject:v25];

    uint64_t v20 = v22;
  }
  while (v22 != 4);
  [v35 setVariantGeometries:v18];
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGRect v40 = CGRectInset(v39, -20.0, -20.0);
  double v30 = v40.origin.x;
  double v31 = v40.origin.y;
  double v32 = v40.size.width;
  double v33 = v40.size.height;
  CGFloat v34 = [v35 geometry];
  objc_msgSend(v34, "setDisplayFrame:", v30, v31, v32, v33);
}

@end