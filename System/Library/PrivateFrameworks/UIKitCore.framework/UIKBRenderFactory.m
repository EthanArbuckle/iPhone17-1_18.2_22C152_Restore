@interface UIKBRenderFactory
+ (BOOL)_enabled;
+ (BOOL)couldUseGlyphSelectorForDisplayString:(id)a3;
+ (Class)factoryClassForVisualStyle:(id)a3 renderingContext:(id)a4;
+ (id)_characterSetForGlyphSelectors;
+ (id)cacheKeyForString:(id)a3 withRenderFlags:(int64_t)a4 renderingContext:(id)a5;
+ (id)factoryForVisualStyle:(id)a3 renderingContext:(id)a4;
+ (id)factoryForVisualStyle:(id)a3 renderingContext:(id)a4 skipLayoutSegments:(BOOL)a5;
+ (id)lightweightFactoryForVisualStyle:(id)a3 renderingContext:(id)a4;
+ (id)segmentedControlColor:(BOOL)a3;
+ (int64_t)_graphicsQuality;
- (BOOL)allowsPaddleForKey:(id)a3;
- (BOOL)allowsPaddles;
- (BOOL)boldTextEnabled;
- (BOOL)drawsOneHandedAffordance;
- (BOOL)dynamicFactory;
- (BOOL)increasedContrastEnabled;
- (BOOL)keyIsRightToLeftSensitive:(id)a3;
- (BOOL)lightweightFactory;
- (BOOL)popupKeyUsesCustomKeyContentView:(id)a3;
- (BOOL)preferStringKeycapOverImage;
- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3;
- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4;
- (BOOL)useBlueThemingForKey:(id)a3;
- (CGPoint)RivenPointFactor:(CGPoint)a3;
- (CGPoint)dualStringKeyBottomTextOffset:(id)a3 keyplane:(id)a4;
- (CGPoint)dualStringKeyTopTextOffset:(id)a3 keyplane:(id)a4;
- (CGSize)stretchFactor;
- (Class)contentViewClassForPopupKey:(id)a3;
- (NSArray)segmentTraits;
- (UIEdgeInsets)dynamicInsets;
- (UIKBRenderConfig)renderConfig;
- (UIKBRenderFactory)initWithRenderingContext:(id)a3 skipLayoutSegments:(BOOL)a4;
- (UIKBRenderingContext)renderingContext;
- (double)RivenFactor:(double)a3;
- (double)dynamicBottomRowMultiplier;
- (double)emojiPopupDividerKeyOffset;
- (double)keyCornerRadius;
- (double)passcodeEdgeWeight;
- (double)rivenSizeFactor;
- (double)scale;
- (double)skinnyKeyThreshold;
- (double)translucentGapWidth;
- (id)ZWNJKeyImageName;
- (id)_controlKeyBackgroundColorName;
- (id)_defaultControlKeyBackgroundColorName;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)backgroundTraitsForKeyplane:(id)a3;
- (id)biuKeyImageName;
- (id)boldKeyImageName;
- (id)controlKeyForegroundColorName;
- (id)copyKeyImageName;
- (id)cutKeyImageName;
- (id)defaultKeyBackgroundColorName;
- (id)defaultKeyShadowColorName;
- (id)deleteKeyImageName;
- (id)deleteOnKeyImageName;
- (id)dictationKeyImageName;
- (id)dismissKeyImageName;
- (id)displayContentsForKey:(id)a3;
- (id)extraPasscodePaddleTraits;
- (id)globalEmojiKeyImageName;
- (id)globalKeyImageName;
- (id)handwritingMoreKeyImageName;
- (id)hashStringElement;
- (id)keyImageNameWithSkinnyVariation:(id)a3;
- (id)leftArrowKeyImageName;
- (id)lightKeycapsFontName;
- (id)lightPadKeycapsFontName;
- (id)lightTextFontName;
- (id)lowQualityLayeredBackgroundColorName;
- (id)messagesWriteboardKeyImageName;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (id)passcodeActiveControlKeyTraits;
- (id)passcodeBackgroundTraitsForKeyplane:(id)a3;
- (id)passcodeControlKeyTraits;
- (id)passcodeKeyEdgeColorName;
- (id)passcodeShiftedControlKeyTraits;
- (id)pasteKeyImageName;
- (id)redoKeyImageName;
- (id)returnKeyImageName;
- (id)rightArrowKeyImageName;
- (id)shiftKeyImageName;
- (id)shiftLockImageName;
- (id)shiftOnKeyImageName;
- (id)spaceKeyGrabberHandlesImageName;
- (id)thinKeycapsFontName;
- (id)thinTextFontName;
- (id)traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)traitsHashStringForKey:(id)a3 withGeometry:(id)a4 withSymbolStyle:(id)a5 controlOpacities:(BOOL)a6 blurBlending:(BOOL)a7;
- (id)undoKeyImageName;
- (int64_t)assetIdiom;
- (int64_t)enabledBlendForm;
- (int64_t)glyphSelectorForDisplayString:(id)a3;
- (int64_t)lightHighQualityEnabledBlendForm;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
- (void)addLayoutSegment:(id)a3;
- (void)applyBoldTextForContent:(id)a3 withKey:(id)a4;
- (void)customizeLanguageIndicatorTraitsForTraits:(id)a3;
- (void)customizeMicOnTraitsForTraits:(id)a3 lightKeyboard:(BOOL)a4 keyState:(int)a5;
- (void)lowQualityTraits:(id)a3;
- (void)modifyKeyTraitsForPasscode:(id)a3 forKey:(id)a4 onKeyplane:(id)a5;
- (void)modifyTraitsForDetachedInputSwitcher:(id)a3 withKey:(id)a4;
- (void)modifyTraitsForDividerVariant:(id)a3 withKey:(id)a4;
- (void)scaleTraits:(id)a3;
- (void)setAllowsPaddles:(BOOL)a3;
- (void)setDrawsOneHandedAffordance:(BOOL)a3;
- (void)setDynamicFactory:(BOOL)a3;
- (void)setIncreasedContrastEnabled:(BOOL)a3;
- (void)setLightweightFactory:(BOOL)a3;
- (void)setPreferStringKeycapOverImage:(BOOL)a3;
- (void)setRenderingContext:(id)a3;
- (void)setRivenSizeFactor:(double)a3;
- (void)setScale:(double)a3;
- (void)setStretchFactor:(CGSize)a3;
- (void)suppressLayoutSegments;
@end

@implementation UIKBRenderFactory

void __37__UIKBRenderFactory__graphicsQuality__block_invoke()
{
  id v0 = +[UIDevice currentDevice];
  _graphicsQuality___quality = [v0 _keyboardGraphicsQuality];
}

+ (int64_t)_graphicsQuality
{
  if (_graphicsQuality_onceToken != -1) {
    dispatch_once(&_graphicsQuality_onceToken, &__block_literal_global_326);
  }
  int v2 = _AXSEnhanceBackgroundContrastEnabled();
  if (_graphicsQuality___quality != 100 || v2 == 0) {
    return _graphicsQuality___quality;
  }
  else {
    return 10;
  }
}

+ (BOOL)_enabled
{
  return 1;
}

- (int64_t)assetIdiom
{
  return -1;
}

- (void)setPreferStringKeycapOverImage:(BOOL)a3
{
  self->_preferStringKeycapOverImage = a3;
}

+ (Class)factoryClassForVisualStyle:(id)a3 renderingContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = objc_opt_class();
  int v7 = v4 << 26;
  uint64_t v8 = v4 << 58;
  BOOL v13 = v4 << 58 == 0x400000000000000 || v7 == 1610612736 || v7 == 1677721600 || v7 == 1744830464 || v7 == 1543503872;
  int v14 = [v5 isFloating];

  if (v14) {
    goto LABEL_70;
  }
  if (!v8 || v7 == 1409286144 || v7 == 1476395008)
  {
    if (((BYTE2(v4) < 0x23u) & (0x600000802uLL >> SBYTE2(v4))) != 0)
    {
      BOOL v15 = (v4 & 0x40) != 0
         && +[UIKBRenderFactory _graphicsQuality] == 100;
      v6 = objc_opt_class();
      if ((v4 & 0x40) != 0 && v7 == 1409286144
        || (v4 & 0x40) != 0 && v7 == 1476395008
        || !v15 && v7 == 1409286144
        || !v15 && v7 == 1476395008)
      {
        goto LABEL_70;
      }
    }
    else
    {
      if (BYTE2(v4) == 38 || BYTE2(v4) == 27) {
        goto LABEL_70;
      }
      if (BYTE2(v4) == 9)
      {
        if ((v4 & 0x40) != 0) {
          goto LABEL_70;
        }
        uint64_t v16 = objc_opt_class();
        if (v7 == 1409286144) {
          goto LABEL_70;
        }
        v6 = (void *)v16;
        if (v7 == 1476395008) {
          goto LABEL_70;
        }
      }
      else if ((v4 & 0xFF00) == 0x7F00)
      {
        uint64_t v17 = objc_opt_class();
        if (v7 == 1409286144) {
          goto LABEL_70;
        }
        v6 = (void *)v17;
        if (v7 == 1476395008) {
          goto LABEL_70;
        }
      }
      else
      {
        uint64_t v18 = objc_opt_class();
        if (v7 == 1476395008) {
          goto LABEL_70;
        }
        v6 = (void *)v18;
        if (v7 == 1409286144) {
          goto LABEL_70;
        }
      }
    }
  }
  else if (v13)
  {
    if ((v4 & 0x80) != 0) {
      goto LABEL_70;
    }
    if (BYTE2(v4) > 0x1Au)
    {
      if (BYTE2(v4) == 27 || BYTE2(v4) == 38) {
        goto LABEL_70;
      }
    }
    else if (BYTE2(v4) == 9 || BYTE2(v4) == 11)
    {
      goto LABEL_70;
    }
    if ((v4 & 0xFF00) == 0x7F00 || (uint64_t v19 = objc_opt_class(), v7 == 1610612736) || (v6 = (void *)v19, v7 == 1543503872)) {
LABEL_70:
    }
      v6 = objc_opt_class();
  }
  else if (v8 == 0x800000000000000 || v8 == 0xC00000000000000)
  {
    goto LABEL_70;
  }
  return (Class)v6;
}

+ (id)factoryForVisualStyle:(id)a3 renderingContext:(id)a4 skipLayoutSegments:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = [v8 renderConfig];
  int v10 = [v9 lightKeyboard];

  if (v10 && (v6 & 0xFF00) == 0x7F00)
  {
    v11 = +[UIKBRenderConfig darkConfig];
    [v8 setRenderConfig:v11];
  }
  v12 = (objc_class *)[a1 factoryClassForVisualStyle:v6 renderingContext:v8];
  if ([v8 handBias])
  {
    if (v12 == (objc_class *)objc_opt_class() || v12 == (objc_class *)objc_opt_class()) {
      uint64_t v13 = objc_opt_class();
    }
    else {
      uint64_t v13 = [a1 factoryClassForVisualStyle:v6 & 0xFFFFFFFFFFFFFFC0 renderingContext:v8];
    }
    v12 = (objc_class *)v13;
  }
  int v14 = (void *)[[v12 alloc] initWithRenderingContext:v8 skipLayoutSegments:v5];

  return v14;
}

+ (id)factoryForVisualStyle:(id)a3 renderingContext:(id)a4
{
  return +[UIKBRenderFactory factoryForVisualStyle:*(void *)&a3 renderingContext:a4 skipLayoutSegments:0];
}

+ (id)lightweightFactoryForVisualStyle:(id)a3 renderingContext:(id)a4
{
  uint64_t v4 = +[UIKBRenderFactory factoryForVisualStyle:*(void *)&a3 renderingContext:a4 skipLayoutSegments:1];
  [v4 setLightweightFactory:1];
  return v4;
}

- (UIKBRenderConfig)renderConfig
{
  int v2 = [(UIKBRenderFactory *)self renderingContext];
  v3 = [v2 renderConfig];

  return (UIKBRenderConfig *)v3;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)emojiPopupDividerKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  return 1.0 / v2;
}

- (CGPoint)dualStringKeyTopTextOffset:(id)a3 keyplane:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(id)a3 keyplane:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (UIEdgeInsets)dynamicInsets
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

- (double)dynamicBottomRowMultiplier
{
  return 0.125;
}

- (void)modifyTraitsForDetachedInputSwitcher:(id)a3 withKey:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 geometry];
  [v8 setDetachedVariants:1];

  v9 = [(UIKBRenderFactory *)self renderConfig];
  int v10 = [v9 lightKeyboard];

  if (v10)
  {
    [v6 setBlendForm:0];
    v11 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha12" edges:15 inset:-0.25 weight:0.5];
    [v6 addRenderEffect:v11];
  }
  [v6 setBlurBlending:1];
  if ([v7 displayType] == 13 || objc_msgSend(v7, "displayType") == 4) {
    v12 = off_1E52D3B08;
  }
  else {
    v12 = off_1E52D40B8;
  }
  uint64_t v13 = [(__objc2_class *)*v12 sharedInstance];
  [v13 popupRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = +[UIKeyboardImpl activeInstance];
  v23 = [v22 _layout];
  objc_msgSend(v23, "convertRect:fromView:", v13, v15, v17, v19, v21);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v32 = [v6 geometry];
  [v32 displayFrame];
  v47.origin.double x = v25;
  v47.origin.double y = v27;
  v47.size.double width = v29;
  v47.size.double height = v31;
  CGRect v46 = CGRectUnion(v45, v47);
  double x = v46.origin.x;
  double y = v46.origin.y;
  double width = v46.size.width;
  double height = v46.size.height;

  v37 = [v6 geometry];
  objc_msgSend(v37, "setDisplayFrame:", x, y, width, height);

  v38 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v25, v27, v29, v31, v25, v27, v29, v31);
  v44[0] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  [v6 setVariantGeometries:v39];

  v40 = [v6 geometry];
  [v40 setPopupBias:40];

  [(UIKBRenderFactory *)self keyCornerRadius];
  double v42 = v41;
  v43 = [v6 geometry];
  [v43 setRoundRectRadius:v42];
}

- (void)modifyTraitsForDividerVariant:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 variantPopupBias];

  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x4010000000;
  v70[3] = &unk_186D7DBA7;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v66 = 0;
  v67 = (double *)&v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  v9 = [v7 subtrees];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke;
  v58[3] = &unk_1E52F9FF0;
  id v10 = v6;
  id v59 = v10;
  v60 = self;
  BOOL v65 = v8 == @"fixed-left";
  v61 = &v66;
  v62 = v70;
  v63 = &v73;
  v64 = &v77;
  [v9 enumerateObjectsUsingBlock:v58];

  if (v78[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v11 = *((unsigned __int8 *)v74 + 24);
    double v12 = v67[3];
    double v13 = -v12;
    if (*((unsigned char *)v74 + 24))
    {
      double v14 = 0.0;
      double v15 = -v12;
      double v13 = v67[3];
    }
    else
    {
      double v14 = v67[3];
      double v12 = 0.0;
      double v15 = v14;
    }
    double v16 = objc_msgSend(v7, "subtrees", @"fixed-left");
    BOOL v17 = v11 == 0;
    if (v8 != @"fixed-left") {
      BOOL v17 = v11 != 0;
    }
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke_2;
    v50[3] = &unk_1E52FA018;
    BOOL v57 = v17;
    v52 = &v77;
    id v18 = v10;
    id v51 = v18;
    uint64_t v53 = 0;
    double v54 = v15;
    uint64_t v55 = 0;
    double v56 = v13;
    [v16 enumerateObjectsUsingBlock:v50];

    double v19 = [v18 geometry];
    [v19 displayFrame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = [v18 geometry];
    objc_msgSend(v28, "setDisplayFrame:", v14 + v21, v23 + 0.0, v25 - (v14 + v12), v27 - (0.0 + 0.0));

    double v29 = [v18 geometry];
    LODWORD(v28) = [v29 popupBias];

    if (v28 == 2)
    {
      double v30 = [v18 variantGeometries];
      if (v8 == @"fixed-left")
      {
        double v31 = [v30 lastObject];

        v32 = [v18 variantGeometries];
        [v32 firstObject];
      }
      else
      {
        double v31 = [v30 firstObject];

        v32 = [v18 variantGeometries];
        [v32 lastObject];
      v33 = };

      [v31 frame];
      double MinX = CGRectGetMinX(v81);
      v35 = [v18 geometry];
      [v35 displayFrame];
      double v36 = CGRectGetMinX(v82);

      [v33 frame];
      double MaxX = CGRectGetMaxX(v83);
      v38 = [v18 geometry];
      [v38 displayFrame];
      double v39 = CGRectGetMaxX(v84);

      v40 = [v18 geometry];
      [v40 displayFrame];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      v49 = [v18 geometry];
      objc_msgSend(v49, "setDisplayFrame:", (MinX - v36 + MaxX - v39) * 0.5 + v42, v44 + 0.0, v46 - ((MinX - v36 + MaxX - v39) * 0.5 - (MinX - v36 + MaxX - v39) * 0.5), v48);
    }
  }

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(v70, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
}

void __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  v9 = [v7 variantGeometries];
  id v34 = [v9 objectAtIndex:a3];

  LODWORD(v9) = [v8 displayType];
  [v34 frame];
  double v14 = v12;
  if (v9 == 50)
  {
    [*(id *)(a1 + 40) emojiPopupDividerKeyOffset];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14 * v15;
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(a1 + 80))
    {
      *(void *)(v17 + 40) = v16;
      [v34 frame];
      double MidX = CGRectGetMidX(v36);
      double v19 = [*(id *)(a1 + 32) geometry];
      [v19 frame];
      BOOL v20 = MidX > CGRectGetMidX(v37);
    }
    else
    {
      *(void *)(v17 + 56) = v16;
      [v34 frame];
      double v29 = CGRectGetMidX(v38);
      double v19 = [*(id *)(a1 + 32) geometry];
      [v19 frame];
      BOOL v20 = v29 >= CGRectGetMidX(v39);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v20;

    objc_msgSend(v34, "applyInsets:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
    *a4 = 1;
  }
  else if (CGRectIsEmpty(*(CGRect *)&v10))
  {
    double v21 = [*(id *)(a1 + 32) variantGeometries];
    double v22 = v21;
    if (a3)
    {
      double v23 = [v21 objectAtIndex:a3 - 1];

      double v24 = (void *)[v23 copy];
      [v23 frame];
      double v26 = v25;
      [v23 frame];
      double v28 = -v27;
    }
    else
    {
      double v23 = [v21 objectAtIndex:1];

      double v24 = (void *)[v23 copy];
      [v23 frame];
      double v26 = -v30;
      [v23 frame];
      double v28 = v31;
    }
    objc_msgSend(v24, "applyInsets:", 0.0, v26, 0.0, v28);
    v32 = [*(id *)(a1 + 32) variantGeometries];
    v33 = (void *)[v32 mutableCopy];

    [v33 replaceObjectAtIndex:a3 withObject:v24];
    [*(id *)(a1 + 32) setVariantGeometries:v33];
  }
}

void __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*(unsigned char *)(a1 + 80))
  {
    if (v6 >= a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6 >= a3)
  {
LABEL_3:
    id v9 = v5;
    id v7 = [*(id *)(a1 + 32) variantGeometries];
    id v8 = [v7 objectAtIndex:a3];

    objc_msgSend(v8, "applyInsets:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    id v5 = v9;
  }
LABEL_4:
}

- (UIKBRenderFactory)initWithRenderingContext:(id)a3 skipLayoutSegments:(BOOL)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIKBRenderFactory;
  id v8 = [(UIKBRenderFactory *)&v21 init];
  if (v8)
  {
    id v9 = +[UIScreen mainScreen];
    [v9 scale];
    *((void *)v8 + 6) = v10;

    int v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v12 = [v11 preferencesActions];
    [v12 rivenSizeFactor:1.0];
    *((void *)v8 + 4) = v13;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v8 + 56) = _Q0;
    objc_storeStrong((id *)v8 + 1, a3);
    v8[75] = 0;
    if (!a4) {
      [v8 setupLayoutSegments];
    }
    v8[72] = _AXSEnhanceTextLegibilityEnabled() != 0;
    if (_AXSEnhanceBackgroundContrastEnabled()) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = _AXDarkenSystemColors() != 0;
    }
    v8[73] = v19;
  }

  return (UIKBRenderFactory *)v8;
}

- (double)RivenFactor:(double)a3
{
  double v3 = round(self->_rivenSizeFactor * a3);
  if (a3 == 1.0) {
    double rivenSizeFactor = self->_rivenSizeFactor;
  }
  else {
    double rivenSizeFactor = v3;
  }
  return self->_stretchFactor.height * rivenSizeFactor;
}

- (CGPoint)RivenPointFactor:(CGPoint)a3
{
  double y = a3.y;
  [(UIKBRenderFactory *)self RivenFactor:a3.x];
  double v6 = v5;
  [(UIKBRenderFactory *)self RivenFactor:y];
  double v8 = v7;
  double v9 = v6;
  result.double y = v8;
  result.double x = v9;
  return result;
}

- (void)scaleTraits:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 geometry];
  [v5 roundRectRadius];
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  double v7 = v6;
  double v8 = [v4 geometry];
  [v8 setRoundRectRadius:v7];

  double v9 = [v4 symbolStyle];
  [v9 fontSize];
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  double v11 = v10;
  double v12 = [v4 symbolStyle];
  [v12 setFontSize:v11];

  uint64_t v13 = [v4 symbolStyle];
  [v13 minFontSize];
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  double v15 = v14;
  uint64_t v16 = [v4 symbolStyle];
  [v16 setMinFontSize:v15];

  uint64_t v17 = [v4 symbolStyle];
  [v17 kerning];
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  double v19 = v18;
  BOOL v20 = [v4 symbolStyle];
  [v20 setKerning:v19];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_super v21 = objc_msgSend(v4, "secondarySymbolStyles", 0);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        double v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v26 fontSize];
        -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
        objc_msgSend(v26, "setFontSize:");
        [v26 kerning];
        -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
        objc_msgSend(v26, "setKerning:");
        [v26 textOffset];
        -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
        objc_msgSend(v26, "setTextOffset:");
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v23);
  }

  double v27 = [v4 variantTraits];

  if (v27)
  {
    double v28 = [v4 variantTraits];
    [(UIKBRenderFactory *)self scaleTraits:v28];
  }
}

- (double)translucentGapWidth
{
  [(UIKBRenderFactory *)self scale];
  return 1.0 / v2;
}

- (void)lowQualityTraits:(id)a3
{
  id v8 = a3;
  if ([v8 blurBlending])
  {
    id v4 = [(UIKBRenderFactory *)self lowQualityLayeredBackgroundColorName];
    double v5 = +[UIKBGradient gradientWithFlatColor:v4];
    [v8 setLayeredBackgroundGradient:v5];
  }
  double v6 = [v8 variantTraits];

  if (v6)
  {
    double v7 = [v8 variantTraits];
    [(UIKBRenderFactory *)self lowQualityTraits:v7];
  }
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  return [a3 keyboardType] != 12;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  id v4 = a3;
  double v5 = +[UIKBRenderTraits emptyTraits];
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v4 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v7, v9, v11, v13, v15, v17, v19, v21);
  [v5 setGeometry:v22];

  objc_msgSend(v5, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  return v5;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v4 = a3;
  double v5 = +[UIKBRenderTraits emptyTraits];
  double v6 = [v4 shape];

  double v7 = +[UIKBRenderGeometry geometryWithShape:v6];
  [v5 setGeometry:v7];

  return v5;
}

- (void)customizeLanguageIndicatorTraitsForTraits:(id)a3
{
  id v6 = a3;
  id v4 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  double v5 = +[UIKBGradient gradientWithFlatColor:v4];
  [v6 setBackgroundGradient:v5];

  [v6 setBlurBlending:1];
}

- (void)customizeMicOnTraitsForTraits:(id)a3 lightKeyboard:(BOOL)a4 keyState:(int)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (a5 == 4)
  {
    id v13 = v7;
    if (v6)
    {
      double v8 = +[UIKBGradient gradientWithFlatColor:@"UIKBMicOnLightModeBackgroundColor"];
      [v13 setBackgroundGradient:v8];

      double v9 = UIKBMicOnLightModeGlyphColor;
    }
    else
    {
      double v10 = +[UIKBGradient gradientWithFlatColor:@"UIKBMicOnDarkModeBackgroundColor"];
      [v13 setBackgroundGradient:v10];

      double v9 = UIKBMicOnDarkModeGlyphColor;
    }
    double v11 = *v9;
    double v12 = [v13 symbolStyle];
    [v12 setTextColor:v11];

    id v7 = v13;
  }
}

- (id)traitsForKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UIKBRenderFactory *)self _traitsForKey:v6 onKeyplane:v7];
  double v9 = (double *)MEMORY[0x1E4F1DB28];
  if (self->_suppressSegmentTraits)
  {
    double v10 = 0;
  }
  else
  {
    double v10 = [(UIKBRenderFactory *)self segmentTraits];
  }
  double v12 = *v9;
  double v11 = v9[1];
  double v14 = v9[2];
  double v13 = v9[3];
  if ([v10 count])
  {
    if (![v7 isSplit]
      || ([v7 isGenerated] & 1) != 0
      || ([(UIKBRenderFactory *)self RivenFactor:1.0], v15 <= 1.0))
    {
      [v7 frame];
      double v12 = v24;
      double v11 = v25;
      double v14 = v26;
      double v13 = v27;
      [v6 frame];
      double v30 = v29 + v28 * 0.5;
      double v33 = v32 + v31 * 0.5;
    }
    else
    {
      [v7 originalFrame];
      v80.origin.double x = v16;
      v80.origin.double y = v17;
      v80.size.double width = v18;
      v80.size.double height = v19;
      v77.origin.double x = v12;
      v77.origin.double y = v11;
      v77.size.double width = v14;
      v77.size.double height = v13;
      if (CGRectEqualToRect(v77, v80)) {
        [v7 frame];
      }
      else {
        [v7 originalFrame];
      }
      double v69 = v20;
      double v57 = v22;
      double v58 = v23;
      objc_msgSend(v6, "originalFrame", v21);
      v81.origin.double x = v59;
      v81.origin.double y = v60;
      v81.size.double width = v61;
      v81.size.double height = v62;
      v79.origin.double x = v12;
      v79.origin.double y = v11;
      v79.size.double width = v14;
      v79.size.double height = v13;
      if (CGRectEqualToRect(v79, v81)) {
        [v6 frame];
      }
      else {
        [v6 originalFrame];
      }
      double v30 = v63 + v65 * 0.5;
      double v33 = v64 + v66 * 0.5;
      double v13 = v58;
      double v14 = v57;
      double v11 = v67;
      double v12 = v69;
    }
  }
  else
  {
    double v30 = *MEMORY[0x1E4F1DAD8];
    double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  [v6 frame];
  if (!CGRectIsEmpty(v78) || [v6 dynamicLayout])
  {
    uint64_t v34 = [(UIKBRenderFactory *)self renderingContext];
    uint64_t v35 = [v34 handBias];

    if (v35)
    {
      [v7 primaryKeylayoutOffset];
      double v12 = v36;
      [v7 primaryKeylayoutWidthRatio];
      double v14 = v14 * v37;
    }
    [v7 resizingOffset];
    if (v38 > 0.0)
    {
      [v7 resizingOffset];
      double v11 = v39;
      [v7 resizingOffset];
      double v13 = v13 - v40;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v68 = v10;
    id v41 = v10;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v71 != v44) {
            objc_enumerationMutation(v41);
          }
          double v46 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if ([v46 keyStates])
          {
            int v47 = [v46 keyStates];
            if (([v6 state] & v47) == 0) {
              continue;
            }
          }
          if (([v46 shouldOverlayTraitsForKey:v6] & 1) != 0
            || ([v6 dynamicLayout] & 1) == 0
            && objc_msgSend(v46, "containsPoint:inRect:withKeyplane:", v7, v30, v33, v12, v11, v14, v13))
          {
            double v48 = [v46 traits];
            [v8 overlayWithTraits:v48];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v43);
    }

    double v10 = v68;
  }
  v49 = [v6 name];
  if ([v49 hasSuffix:@"LanguageIndicator"])
  {
    uint64_t v50 = [v8 blendForm];

    if (v50 != 3) {
      [(UIKBRenderFactory *)self customizeLanguageIndicatorTraitsForTraits:v8];
    }
  }
  else
  {
  }
  if ([v6 interactionType] == 5)
  {
    id v51 = [(UIKBRenderFactory *)self renderConfig];
    -[UIKBRenderFactory customizeMicOnTraitsForTraits:lightKeyboard:keyState:](self, "customizeMicOnTraitsForTraits:lightKeyboard:keyState:", v8, [v51 lightKeyboard], objc_msgSend(v6, "state"));
  }
  if (+[UIKBRenderFactory _graphicsQuality] == 10) {
    [(UIKBRenderFactory *)self lowQualityTraits:v8];
  }
  if (![(UIKBRenderFactory *)self lightweightFactory]
    && [v6 displayTypeHint] != 12)
  {
    v52 = [v8 geometry];
    uint64_t v53 = [v8 symbolStyle];
    double v54 = v10;
    uint64_t v55 = -[UIKBRenderFactory traitsHashStringForKey:withGeometry:withSymbolStyle:controlOpacities:blurBlending:](self, "traitsHashStringForKey:withGeometry:withSymbolStyle:controlOpacities:blurBlending:", v6, v52, v53, [v8 controlOpacities], objc_msgSend(v8, "blurBlending"));
    [v8 setHashString:v55];

    double v10 = v54;
  }
  self->_suppressSegmentTraits = 0;

  return v8;
}

- (id)hashStringElement
{
  double v2 = [(UIKBRenderFactory *)self renderConfig];
  if ([v2 lightKeyboard]) {
    double v3 = @"Light";
  }
  else {
    double v3 = @"Dark";
  }
  id v4 = v3;

  return v4;
}

- (BOOL)keyIsRightToLeftSensitive:(id)a3
{
  int v3 = [a3 isRightToLeftSensitive];
  if (v3)
  {
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    double v5 = [v4 currentLinguisticInputMode];
    char v6 = [v5 isDefaultRightToLeft];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)traitsHashStringForKey:(id)a3 withGeometry:(id)a4 withSymbolStyle:(id)a5 controlOpacities:(BOOL)a6 blurBlending:(BOOL)a7
{
  BOOL v59 = a7;
  BOOL v7 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  unsigned int v14 = [v13 displayType];
  if (v14 - 7 >= 2) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  [v12 displayFrame];
  double v17 = v16;
  double v19 = v18;
  double v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  double v69 = [v21 stringByReplacingOccurrencesOfString:@"UIKBRenderFactory" withString:&stru_1ED0E84C0];

  CGFloat v61 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v68 = [(UIKBRenderFactory *)self hashStringElement];
  double v67 = [NSNumber numberWithUnsignedInt:v15];
  double v66 = objc_msgSend(NSNumber, "numberWithBool:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v13));
  uint64_t v22 = [v13 numberForProperty:@"KBinteractionType"];
  double v64 = (void *)v22;
  if (v22) {
    double v23 = (void *)v22;
  }
  else {
    double v23 = &unk_1ED3F4980;
  }
  double v58 = v23;
  uint64_t v24 = [v13 numberForProperty:@"rendering"];
  double v63 = (void *)v24;
  if (v24) {
    double v25 = (void *)v24;
  }
  else {
    double v25 = &unk_1ED3F4980;
  }
  double v57 = v25;
  uint64_t v26 = [v13 numberForProperty:@"state"];
  CGFloat v60 = (void *)v26;
  if (v26) {
    double v27 = (void *)v26;
  }
  else {
    double v27 = &unk_1ED3F4980;
  }
  double v56 = v27;
  double v28 = NSNumber;
  BOOL v29 = [(UIKBRenderFactory *)self useBlueThemingForKey:v13];

  double v65 = [v28 numberWithBool:v29];
  uint64_t v55 = [NSNumber numberWithBool:v7];
  double v30 = NSNumber;
  [v12 roundRectRadius];
  double v54 = objc_msgSend(v30, "numberWithDouble:");
  double v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "roundRectCorners"));
  double v32 = [NSNumber numberWithDouble:v17];
  double v33 = [NSNumber numberWithDouble:v19];
  uint64_t v34 = (void *)MEMORY[0x1E4F29238];
  [v12 displayInsets];
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;

  v70[0] = v36;
  v70[1] = v38;
  v70[2] = v40;
  v70[3] = v42;
  uint64_t v43 = [v34 valueWithBytes:v70 objCType:"{UIEdgeInsets=dddd}"];
  uint64_t v44 = NSNumber;
  uint64_t v45 = [v11 anchorCorner];

  double v46 = [v44 numberWithUnsignedInteger:v45];
  int v47 = [NSNumber numberWithBool:v59];
  double v48 = NSNumber;
  v49 = [(UIKBRenderFactory *)self controlKeyBackgroundColorName];
  uint64_t v50 = objc_msgSend(v48, "numberWithInt:", objc_msgSend(v49, "hash"));
  objc_msgSend(v61, "arrayWithObjects:", v69, v68, v67, v66, v58, v57, v56, v65, v55, v54, v31, v32, v33, v43, v46, v47, v50,
  CGFloat v62 = 0);

  id v51 = [[UIKBCacheToken alloc] initWithComponents:v62 name:0];
  v52 = [(UIKBCacheToken *)v51 string];

  return v52;
}

- (id)globalKeyImageName
{
  return @"globe";
}

- (id)globalEmojiKeyImageName
{
  return @"emoji.face.grinning";
}

- (id)dictationKeyImageName
{
  return @"mic";
}

- (id)dismissKeyImageName
{
  return @"keyboard.chevron.compact.down";
}

- (id)multitapCompleteKeyImageName
{
  return @"kana_multitap_complete_arrow.png";
}

- (id)muttitapReverseKeyImageName
{
  return @"kana_multitap_reverse_arrow.png";
}

- (id)handwritingMoreKeyImageName
{
  return @"hand.draw";
}

- (id)deleteKeyImageName
{
  return @"delete.left";
}

- (id)deleteOnKeyImageName
{
  return @"delete.left.fill";
}

- (id)shiftKeyImageName
{
  return @"shift";
}

- (id)shiftOnKeyImageName
{
  return @"shift.fill";
}

- (id)shiftLockImageName
{
  return @"capslock.fill";
}

- (id)returnKeyImageName
{
  return @"return";
}

- (id)leftArrowKeyImageName
{
  return @"chevron.left";
}

- (id)rightArrowKeyImageName
{
  return @"chevron.right";
}

- (id)cutKeyImageName
{
  return @"scissors";
}

- (id)copyKeyImageName
{
  return @"doc.on.doc";
}

- (id)pasteKeyImageName
{
  return @"doc.on.clipboard";
}

- (id)undoKeyImageName
{
  return @"arrow.uturn.backward";
}

- (id)redoKeyImageName
{
  return @"arrow.uturn.forward";
}

- (id)boldKeyImageName
{
  return @"bold";
}

- (id)biuKeyImageName
{
  return @"bold.italic.underline";
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard.png";
}

- (id)spaceKeyGrabberHandlesImageName
{
  return @"spacekey_grabber_handles.png";
}

- (id)ZWNJKeyImageName
{
  return @"ZWNJ_portrait.png";
}

- (double)skinnyKeyThreshold
{
  return 36.0;
}

- (id)keyImageNameWithSkinnyVariation:(id)a3
{
  id v4 = a3;
  int v5 = [v4 displayType];
  int v6 = [v4 interactionType];
  if (v5 == 3 || v6 == 4)
  {
    if ([v4 state] < 4) {
      [(UIKBRenderFactory *)self deleteKeyImageName];
    }
    else {
      [(UIKBRenderFactory *)self deleteOnKeyImageName];
    }
  }
  else
  {
    if (v5 != 23
      || (UIKBShiftKeyStringForActiveInputMode(v4),
          BOOL v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      double v8 = 0;
      goto LABEL_11;
    }
    if ([v4 state] <= 3)
    {
      uint64_t v9 = [(UIKBRenderFactory *)self shiftKeyImageName];
      goto LABEL_10;
    }
    if ([v4 state] == 8) {
      [(UIKBRenderFactory *)self shiftLockImageName];
    }
    else {
      [(UIKBRenderFactory *)self shiftOnKeyImageName];
    }
  uint64_t v9 = };
LABEL_10:
  double v8 = (void *)v9;
LABEL_11:

  return v8;
}

- (id)displayContentsForKey:(id)a3
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[UIKBKeyDisplayContents displayContents];
  int v6 = +[UIKBKeyDisplayContents displayContents];
  [v5 setFallbackContents:v6];

  uint64_t v7 = [v4 displayType];
  unsigned int v8 = [v4 interactionType];
  unsigned int v9 = v8;
  if (v7 == 3 || v8 == 4)
  {
    [v5 setDisplayPathType:2];
    id v13 = [(UIKBRenderFactory *)self keyImageNameWithSkinnyVariation:v4];
    [v5 setDisplayStringImage:v13];

    unsigned int v14 = [v4 displayString];
    [v5 setDisplayString:v14];
LABEL_11:

    objc_msgSend(v5, "setFlipImageHorizontally:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v4));
    goto LABEL_39;
  }
  if ((int)v7 > 22)
  {
    if (v7 == 53) {
      goto LABEL_19;
    }
    if (v7 == 23)
    {
      uint64_t v15 = UIKBShiftKeyStringForActiveInputMode(v4);

      if (v15) {
        goto LABEL_17;
      }
      [v5 setDisplayPathType:1];
      double v16 = [(UIKBRenderFactory *)self keyImageNameWithSkinnyVariation:v4];
      [v5 setDisplayStringImage:v16];

      double v17 = [v5 displayStringImage];
      double v18 = [v5 fallbackContents];
      [v18 setDisplayStringImage:v17];

LABEL_16:
      goto LABEL_17;
    }
  }
  else
  {
    if (v7 == 5)
    {
      if ([v4 displayTypeHint] != 11)
      {
        uint64_t v20 = [(UIKBRenderFactory *)self dismissKeyImageName];
        goto LABEL_36;
      }
      goto LABEL_19;
    }
    if (v7 == 13)
    {
      double v10 = [v4 representedString];
      int v11 = [v10 isEqualToString:@"EmojiInternational"];

      if (!v11)
      {
        uint64_t v24 = [v4 overrideDisplayString];
        int v25 = [v24 isEqualToString:@"emoji"];

        if (v25)
        {
LABEL_28:
          uint64_t v20 = [(UIKBRenderFactory *)self globalEmojiKeyImageName];
        }
        else
        {
          uint64_t v20 = [(UIKBRenderFactory *)self globalKeyImageName];
        }
        goto LABEL_36;
      }
      id v12 = [v4 displayString];

      if (v12 != @"")
      {
        if ([v4 displayTypeHint] != 11)
        {
          [v5 setStringKeycapOverImage:1];
LABEL_17:
          double v19 = [v4 displayString];
          [v5 setDisplayString:v19];
LABEL_38:

          goto LABEL_39;
        }
        goto LABEL_19;
      }
LABEL_26:
      uint64_t v20 = [(UIKBRenderFactory *)self handwritingMoreKeyImageName];
      goto LABEL_36;
    }
  }
  uint64_t v21 = [v4 displayString];

  if (v21 == @"") {
    goto LABEL_26;
  }
  if ([v4 interactionType] == 44)
  {
    uint64_t v22 = [(UIKBRenderFactory *)self renderConfig];
    double v19 = [v22 imageNameForType:v7];

    if (!v19)
    {
      if ([v4 displayType] != 4) {
        goto LABEL_38;
      }
      [v4 setInteractionType:5];
      double v23 = [(UIKBRenderFactory *)self dictationKeyImageName];
      [v5 setDisplayStringImage:v23];
LABEL_25:

      goto LABEL_38;
    }
LABEL_37:
    [v5 setDisplayStringImage:v19];
    goto LABEL_38;
  }
  if (v7 == 4 || [v4 interactionType] == 5)
  {
    uint64_t v26 = [(UIKBRenderFactory *)self renderConfig];
    double v19 = [v26 imageNameForType:v7];

    if (!v19)
    {
      uint64_t v20 = [(UIKBRenderFactory *)self dictationKeyImageName];
      goto LABEL_36;
    }
    [v4 setInteractionType:44];
    goto LABEL_37;
  }
  switch((int)v7)
  {
    case '*':
      id v55 = [(UIKBRenderFactory *)self cutKeyImageName];
      goto LABEL_101;
    case '+':
      id v55 = [(UIKBRenderFactory *)self copyKeyImageName];
      goto LABEL_101;
    case ',':
      id v55 = [(UIKBRenderFactory *)self pasteKeyImageName];
      goto LABEL_101;
    case '-':
      uint64_t v20 = [(UIKBRenderFactory *)self leftArrowKeyImageName];
      goto LABEL_36;
    case '.':
      uint64_t v20 = [(UIKBRenderFactory *)self rightArrowKeyImageName];
      goto LABEL_36;
    default:
      if (v7 == 9) {
        goto LABEL_28;
      }
      switch(v9)
      {
        case 0x1Cu:
          id v55 = [(UIKBRenderFactory *)self boldKeyImageName];
LABEL_101:
          double v17 = v55;
          [v5 setDisplayStringImage:v55];
          goto LABEL_16;
        case 0x11u:
          if ([v4 displayTypeHint] != 11)
          {
            double v63 = [v4 displayString];
            int v64 = [v63 isEqualToString:@"undo"];

            if (v64)
            {
              double v65 = [v4 displayString];
              [v5 setDisplayString:v65];
            }
            uint64_t v62 = [(UIKBRenderFactory *)self undoKeyImageName];
            goto LABEL_109;
          }
LABEL_19:
          uint64_t v20 = [(UIKBRenderFactory *)self messagesWriteboardKeyImageName];
LABEL_36:
          double v19 = (void *)v20;
          goto LABEL_37;
        case 0xCu:
          BOOL v59 = [v4 displayString];
          int v60 = [v59 isEqualToString:@"redo"];

          if (v60)
          {
            CGFloat v61 = [v4 displayString];
            [v5 setDisplayString:v61];
          }
          uint64_t v62 = [(UIKBRenderFactory *)self redoKeyImageName];
LABEL_109:
          unsigned int v14 = (void *)v62;
          [v5 setDisplayStringImage:v62];
          goto LABEL_11;
      }
      if ((int)v7 <= 48)
      {
        switch((int)v7)
        {
          case 31:
            double v66 = [v4 overrideDisplayString];
            if (v66)
            {
            }
            else
            {
              CGRect v80 = [v4 displayString];
              int v81 = [v80 isEqualToString:@"゛゜小"];

              if (!v81) {
                goto LABEL_17;
              }
            }
            [v5 setDisplayString:@"小"];
            [v5 setSecondaryDisplayStrings:&unk_1ED3F0148];
            goto LABEL_39;
          case 32:
            uint64_t v20 = [(UIKBRenderFactory *)self multitapCompleteKeyImageName];
            goto LABEL_36;
          case 33:
            uint64_t v20 = [(UIKBRenderFactory *)self muttitapReverseKeyImageName];
            goto LABEL_36;
          case 34:
            long long v70 = [v4 overrideDisplayString];
            long long v71 = v70;
            if (v70)
            {
              id v72 = v70;
            }
            else
            {
              id v72 = [v4 displayString];
            }
            double v19 = v72;

            v89 = [v19 _firstGrapheme];
            [v5 setDisplayString:v89];

            double v23 = [v19 _lastGrapheme];
            v104 = v23;
            v87 = (void *)MEMORY[0x1E4F1C978];
            v88 = &v104;
            goto LABEL_147;
          default:
            if (v7 == 7)
            {
              long long v73 = [v4 secondaryDisplayStrings];
              uint64_t v74 = [v73 count];

              if (v74) {
                goto LABEL_129;
              }
              v91 = [v4 overrideDisplayString];
              v92 = v91;
              if (v91)
              {
                id v93 = v91;
              }
              else
              {
                id v93 = [v4 displayString];
              }
              double v19 = v93;

              if ([v19 length] != 2)
              {
                double v23 = [v19 _firstGrapheme];
                [v5 setDisplayString:v23];
                v90 = objc_msgSend(v19, "substringFromIndex:", objc_msgSend(v23, "length"));
                v105 = v90;
                v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
                [v5 setSecondaryDisplayStrings:v96];

                goto LABEL_148;
              }
              v95 = [v19 substringToIndex:1];
              [v5 setDisplayString:v95];

              double v23 = [v19 substringFromIndex:1];
              v106 = v23;
              v87 = (void *)MEMORY[0x1E4F1C978];
              v88 = &v106;
LABEL_147:
              v90 = [v87 arrayWithObjects:v88 count:1];
              [v5 setSecondaryDisplayStrings:v90];
LABEL_148:

              goto LABEL_25;
            }
            if (v7 != 20) {
              goto LABEL_129;
            }
            double v67 = [v4 overrideDisplayString];
            uint64_t v68 = v67;
            if (v67)
            {
              id v69 = v67;
            }
            else
            {
              id v69 = [v4 displayString];
            }
            double v19 = v69;

            CGRect v82 = [v4 displayString];
            uint64_t v83 = [v82 rangeOfString:@"/"];

            CGRect v84 = [v4 displayString];
            unint64_t v85 = [v84 length];

            if (v83 == 0x7FFFFFFFFFFFFFFFLL || v85 < 2)
            {
              [v5 setDisplayString:v19];
              if (v83 == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_144;
              }
            }
            else
            {
              v86 = [v19 substringToIndex:v83];
              [v5 setDisplayString:v86];
            }
            if (v83 + 1 < v85)
            {
              double v23 = objc_msgSend(v19, "substringFromIndex:");
              v107[0] = v23;
              v87 = (void *)MEMORY[0x1E4F1C978];
              v88 = (void **)v107;
              goto LABEL_147;
            }
LABEL_144:
            double v23 = [v4 secondaryDisplayStrings];
            [v5 setSecondaryDisplayStrings:v23];
            goto LABEL_25;
        }
      }
      switch(v7)
      {
        case '9':
          double v19 = [v4 displayImage];
          [v5 setDisplayImage:v19];
          goto LABEL_38;
        case '2':
          [v5 setDisplayPathType:4];
          break;
        case '1':
          id v55 = [(UIKBRenderFactory *)self biuKeyImageName];
          goto LABEL_101;
        default:
LABEL_129:
          uint64_t v75 = [v4 representedString];
          int v76 = [v75 isEqualToString:@"‌"];

          if (v76)
          {
            uint64_t v20 = [(UIKBRenderFactory *)self ZWNJKeyImageName];
            goto LABEL_36;
          }
          CGRect v77 = [v4 displayString];
          int v78 = [v77 isEqualToString:@"Search"];

          if (!v78)
          {
            CGRect v79 = [v4 overrideDisplayString];
            if (v79)
            {
              [v5 setDisplayString:v79];
            }
            else
            {
              v94 = [v4 displayString];
              [v5 setDisplayString:v94];
            }
            double v19 = [v4 secondaryDisplayStrings];
            [v5 setSecondaryDisplayStrings:v19];
            goto LABEL_38;
          }
          [v5 setDisplayStringImage:@"magnifyingglass"];
          break;
      }
LABEL_39:
      if ([v4 state] == 16
        && (v9 > 0x10 || ((1 << v9) & 0x10260) == 0)
        && [v4 variantType] != 12
        && [v4 variantType] != 13
        && (!_os_feature_enabled_impl()
         || [v4 variantType] != 10 && objc_msgSend(v4, "variantType") != 11))
      {
        unsigned int v97 = v9;
        double v32 = (void *)MEMORY[0x1E4F1CA48];
        double v33 = [v4 subtrees];
        uint64_t v34 = objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));

        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        uint64_t v35 = [v4 subtrees];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v98 objects:v103 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v99 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = [(UIKBRenderFactory *)self displayContentsForKey:*(void *)(*((void *)&v98 + 1) + 8 * i)];
              [v34 addObject:v40];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v98 objects:v103 count:16];
          }
          while (v37);
        }

        [v5 setVariantDisplayContents:v34];
        uint64_t v41 = [v4 highlightedVariantsList];
        if ([v4 selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v9 = v97;
        }
        else
        {
          uint64_t v56 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "selectedVariantIndex"));
          double v57 = (void *)v56;
          if (v41)
          {
            double v58 = (void *)[v41 mutableCopy];
            if ([v58 containsObject:v57]) {
              [v58 removeObject:v57];
            }
            else {
              [v58 addObject:v57];
            }
            unsigned int v9 = v97;
          }
          else
          {
            uint64_t v102 = v56;
            double v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
            unsigned int v9 = v97;
          }

          uint64_t v41 = v58;
        }
        [v5 setHighlightedVariantsList:v41];
        if ([(UIKBRenderFactory *)self shouldClearBaseDisplayStringForVariants:v4])
        {
          [v5 setDisplayString:0];
          [v5 setDisplayStringImage:0];
        }
      }
      double v27 = [v5 displayString];
      if (v27)
      {
        double v28 = [v5 displayString];
        int v29 = [v28 hasSuffix:@".png"];
      }
      else
      {
        int v29 = 0;
      }

      if (v7 == 25 || v9 == 15)
      {
        double v31 = [v5 fallbackContents];
        [v31 setDisplayString:@"␣"];

        goto LABEL_75;
      }
      if (v7 == 21 || v9 == 13)
      {
        [v5 setStringKeycapOverImage:v29 ^ 1u];
        double v30 = [v4 overrideDisplayString];
        if (v30)
        {
          [v5 setDisplayString:v30];
        }
        else
        {
          uint64_t v42 = [v4 displayString];
          [v5 setDisplayString:v42];
        }
        uint64_t v43 = [v5 fallbackContents];
        [v43 setDisplayString:@"⮐"];

        uint64_t v44 = [v5 displayString];
        int v45 = [v44 containsString:@"Emoji"];

        if (v45)
        {
          [v5 setForceImageKeycap:1];
          double v46 = [(UIKBRenderFactory *)self globalEmojiKeyImageName];
          [v5 setDisplayString:v46];

          uint64_t v47 = [(UIKBRenderFactory *)self globalEmojiKeyImageName];
LABEL_74:
          v52 = (void *)v47;
          [v5 setDisplayStringImage:v47];

          goto LABEL_75;
        }
        double v48 = [v5 displayString];
        if ([v48 isEqualToString:@"⮐"])
        {
        }
        else
        {
          v49 = [v5 displayString];
          int v50 = [v49 isEqualToString:@"⮑"];

          if (!v50)
          {
            [v5 setStringKeycapOverImage:1];
            uint64_t v47 = [v5 displayString];
            goto LABEL_74;
          }
        }
        [v5 setStringKeycapOverImage:0];
        id v51 = [(UIKBRenderFactory *)self returnKeyImageName];
        [v5 setDisplayStringImage:v51];

        objc_msgSend(v5, "setFlipImageHorizontally:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v4));
      }
LABEL_75:
      if (v29)
      {
        uint64_t v53 = [v5 displayString];
        [v5 setDisplayStringImage:v53];
      }
      [(UIKBRenderFactory *)self applyBoldTextForContent:v5 withKey:v4];

      return v5;
  }
}

- (void)applyBoldTextForContent:(id)a3 withKey:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (self->_boldTextEnabled)
  {
    uint64_t v7 = [v16 displayStringImage];
    if (!v7 || ([v16 forceImageKeycap] & 1) != 0) {
      goto LABEL_14;
    }
    if ([v6 displayType] == 23)
    {
      if ([v6 displayType] != 23)
      {
LABEL_14:

        goto LABEL_15;
      }
      unsigned int v8 = [v6 state];

      if (v8 > 3) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    unsigned int v9 = [v16 displayStringImage];
    double v10 = (void *)[v9 copy];
    int v11 = [v16 fallbackContents];
    [v11 setDisplayStringImage:v10];

    uint64_t v7 = [v16 displayStringImage];
    id v12 = [v16 displayString];
    if ([v12 hasSuffix:@".png"])
    {
      id v13 = [v16 displayStringImage];
      char v14 = [v13 hasPrefix:@"bold_"];

      if (v14)
      {
LABEL_13:
        [v16 setDisplayStringImage:v7];
        goto LABEL_14;
      }
      id v12 = [v16 displayStringImage];
      uint64_t v15 = [@"bold_" stringByAppendingString:v12];

      uint64_t v7 = (void *)v15;
    }

    goto LABEL_13;
  }
LABEL_15:
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return 1;
}

- (BOOL)useBlueThemingForKey:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] == 21
    && ((unsigned int v4 = [v3 displayTypeHint], v4 <= 0xA) && ((1 << v4) & 0x7EE) != 0 || v4 == 124))
  {
    uint64_t v5 = [v3 overrideDisplayString];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [v3 overrideDisplayString];
      unsigned int v8 = [v3 displayString];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)addLayoutSegment:(id)a3
{
  id v4 = a3;
  segmentTraits = self->_segmentTraits;
  id v8 = v4;
  if (!segmentTraits)
  {
    id v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v7 = self->_segmentTraits;
    self->_segmentTraits = v6;

    id v4 = v8;
    segmentTraits = self->_segmentTraits;
  }
  [(NSMutableArray *)segmentTraits addObject:v4];
}

- (void)suppressLayoutSegments
{
  self->_suppressSegmentTraits = 1;
}

+ (id)cacheKeyForString:(id)a3 withRenderFlags:(int64_t)a4 renderingContext:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  char v9 = [UIKBCacheToken alloc];
  double v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];

  int v11 = [(UIKBCacheToken *)v9 initWithComponents:v10 name:0];
  id v12 = [v7 renderConfig];

  id v13 = -[UIKBCacheToken stringForRenderFlags:lightKeyboard:](v11, "stringForRenderFlags:lightKeyboard:", a4, [v12 lightKeyboard]);

  return v13;
}

- (int64_t)enabledBlendForm
{
  id v3 = [(UIKBRenderFactory *)self renderConfig];
  char v4 = [v3 animatedBackground];

  if (v4) {
    return 8;
  }
  id v6 = [(UIKBRenderFactory *)self renderConfig];
  char v7 = [v6 emptyBackground];

  if (v7) {
    return 7;
  }
  id v8 = [(UIKBRenderFactory *)self renderConfig];
  int v9 = [v8 lightKeyboard];

  if (!v9 || +[UIKBRenderFactory _graphicsQuality] != 100) {
    return 0;
  }
  return [(UIKBRenderFactory *)self lightHighQualityEnabledBlendForm];
}

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 0;
}

- (id)defaultKeyBackgroundColorName
{
  id v3 = [(UIKBRenderFactory *)self renderConfig];
  int v4 = [v3 animatedBackground];

  uint64_t v5 = [(UIKBRenderFactory *)self renderConfig];
  int v6 = [v5 lightKeyboard];
  char v7 = @"UIKBColorWhite";
  id v8 = @"UIKBColorWhite_Alpha30";
  if (v6) {
    id v8 = @"UIKBColorWhite";
  }
  else {
    char v7 = @"UIKBColorWhite_Alpha65";
  }
  if (v4) {
    int v9 = v7;
  }
  else {
    int v9 = v8;
  }
  double v10 = v9;

  return v10;
}

- (id)_controlKeyBackgroundColorName
{
  id v3 = [(UIKBRenderFactory *)self renderConfig];
  int v4 = [v3 controlKeyBackgroundName];

  if (v4)
  {
    uint64_t v5 = [(UIKBRenderFactory *)self renderConfig];
    int v6 = [v5 controlKeyBackgroundName];
  }
  else
  {
    int v6 = [(UIKBRenderFactory *)self _defaultControlKeyBackgroundColorName];
  }
  return v6;
}

- (id)_defaultControlKeyBackgroundColorName
{
  double v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];

  if (v3)
  {
    int64_t v4 = +[UIKBRenderFactory _graphicsQuality];
    uint64_t v5 = UIKBColorKeyGrayKeyLightBackgroundMedium;
    if (v4 == 100) {
      uint64_t v5 = UIKBColorGray_Percent55;
    }
  }
  else
  {
    uint64_t v5 = UIKBColorKeyGrayKeyDarkBackground;
  }
  int v6 = *v5;
  return v6;
}

- (id)lowQualityLayeredBackgroundColorName
{
  double v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  int64_t v4 = UIKBColorWhite;
  if (!v3) {
    int64_t v4 = UIKBColorBlack;
  }
  uint64_t v5 = *v4;

  return v5;
}

- (id)controlKeyForegroundColorName
{
  int v3 = [(UIKBRenderFactory *)self renderConfig];
  if ([v3 emptyBackground])
  {
  }
  else
  {
    int64_t v4 = [(UIKBRenderFactory *)self renderConfig];
    char v5 = [v4 animatedBackground];

    if ((v5 & 1) == 0)
    {
      int v6 = [(UIKBRenderFactory *)self renderConfig];
      if ([v6 lightKeyboard])
      {
        int64_t v7 = +[UIKBRenderFactory _graphicsQuality];

        if (v7 == 100)
        {
          id v8 = @"UIKBColorKeyGrayKeyLightForeground";
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
  }
  id v8 = 0;
LABEL_9:
  return v8;
}

- (id)defaultKeyShadowColorName
{
  int v3 = [(UIKBRenderFactory *)self renderConfig];
  int v4 = [v3 animatedBackground];

  if (v4)
  {
    char v5 = @"UIKBColorBlack_Alpha10";
  }
  else
  {
    int v6 = [(UIKBRenderFactory *)self renderConfig];
    int v7 = [v6 lightKeyboard];
    id v8 = UIKBColorBlack_Alpha35;
    if (!v7) {
      id v8 = UIKBColorBlack_Alpha40;
    }
    char v5 = *v8;
  }
  return v5;
}

+ (id)segmentedControlColor:(BOOL)a3
{
  int v3 = UIKBColorKeyGrayKeyLightBackground;
  if (!a3) {
    int v3 = UIKBColorKeyGrayKeyDarkBackground;
  }
  int v4 = UIKBGetNamedColor(*v3);
  return +[UIColor colorWithCGColor:v4];
}

- (id)lightKeycapsFontName
{
  if (self->_boldTextEnabled) {
    return @".PhoneKeyCaps";
  }
  else {
    return @".Keycaps-Keys";
  }
}

- (id)thinKeycapsFontName
{
  if (self->_boldTextEnabled) {
    return @".PhoneKeyCaps";
  }
  else {
    return @".Keycaps-Popups";
  }
}

- (id)lightPadKeycapsFontName
{
  if (self->_boldTextEnabled) {
    return @".PhoneKeyCaps";
  }
  else {
    return @".KeycapsPad-Keys";
  }
}

- (id)lightTextFontName
{
  return @"UIKBRenderFactorySystemFontName";
}

- (id)thinTextFontName
{
  return @"UIKBRenderFactorySystemFontName";
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id rect_24 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = [v11 renderConfig];
  int v13 = [v12 lightKeyboard];

  char v14 = UIKBColorGray_Percent37;
  if (v13) {
    char v14 = UIKBColorWhite;
  }
  uint64_t v15 = +[UIKBGradient gradientWithFlatColor:*v14];
  [rect_24 setBackgroundGradient:v15];

  [rect_24 removeAllRenderEffects];
  id v16 = [v11 renderConfig];

  int v17 = [v16 lightKeyboard];
  if (v17)
  {
    double v18 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha8", 0.0, 1.0, 1.0, 0.5, 0.0, 0.5, 4.5 offset insets weight];
    [rect_24 addRenderEffect:v18];

    double v19 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha29", 0.0, -1.0, 1.0, 0.5, 0.0, 0.5, 4.5 offset insets weight];
    [rect_24 addRenderEffect:v19];
  }
  if ([v9 displayType] == 13 || objc_msgSend(v9, "displayType") == 4) {
    uint64_t v20 = off_1E52D3B08;
  }
  else {
    uint64_t v20 = off_1E52D40B8;
  }
  uint64_t v21 = [(__objc2_class *)*v20 sharedInstance];
  uint64_t v22 = +[UIKeyboardImpl activeInstance];
  double v23 = [v22 _layout];

  [v23 bounds];
  objc_msgSend(v23, "convertRect:toView:", 0);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  double v32 = [v23 window];
  [v32 frame];
  CGFloat v34 = v33;
  CGFloat rect = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;

  v79.origin.double x = v25;
  v79.origin.double y = v27;
  v79.size.double width = v29;
  v79.size.double height = v31;
  double rect_16 = CGRectGetMinY(v79);
  v80.origin.double x = v25;
  v80.origin.double y = v27;
  v80.size.double width = v29;
  v80.size.double height = v31;
  double rect_8 = CGRectGetMinX(v80);
  v81.origin.double x = v34;
  v81.origin.double y = v36;
  v81.size.double width = v38;
  v81.size.double height = v40;
  double Height = CGRectGetHeight(v81);
  v82.origin.double x = v25;
  v82.origin.double y = v27;
  v82.size.double width = v29;
  v82.size.double height = v31;
  double v42 = Height - CGRectGetMaxY(v82);
  v83.origin.double x = rect;
  v83.origin.double y = v36;
  v83.size.double width = v38;
  v83.size.double height = v40;
  double Width = CGRectGetWidth(v83);
  v84.origin.double x = v25;
  v84.origin.double y = v27;
  v84.size.double width = v29;
  v84.size.double height = v31;
  double v44 = Width - CGRectGetMaxX(v84);
  int v45 = [rect_24 geometry];
  objc_msgSend(v45, "setLayoutMargins:", rect_16, rect_8, v42, v44);

  [v21 popupRect];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  [v9 paddedFrame];
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  objc_msgSend(v23, "convertRect:fromView:", v21, v47, v49, v51, v53);
  v88.origin.double x = v62;
  v88.origin.double y = v63;
  v88.size.double width = v64;
  v88.size.double height = v65;
  v85.origin.double x = v55;
  v85.origin.double y = v57;
  v85.size.double width = v59;
  v85.size.double height = v61;
  CGRect v86 = CGRectUnion(v85, v88);
  CGRect v87 = CGRectInset(v86, -12.0, -6.0);
  double x = v87.origin.x;
  double y = v87.origin.y;
  double v68 = v87.size.width;
  double v69 = v87.size.height;
  long long v70 = [rect_24 geometry];
  objc_msgSend(v70, "setDisplayFrame:", x, y, v68, v69);

  [rect_24 setBlurBlending:1];
  long long v71 = [rect_24 geometry];
  [v71 setPopupBias:40];

  id v72 = +[UIKBTextStyle styleWithFontName:v10 withFontSize:22.0];

  [rect_24 setSymbolStyle:v72];
  long long v73 = [rect_24 symbolStyle];
  [v73 setTextColor:@"UIKBColorClear"];

  if (+[UIKBRenderFactory _graphicsQuality] == 10) {
    [rect_24 removeAllRenderEffects];
  }
}

+ (id)_characterSetForGlyphSelectors
{
  if (qword_1EB261868 != -1) {
    dispatch_once(&qword_1EB261868, &__block_literal_global_327_1);
  }
  double v2 = (void *)_MergedGlobals_1121;
  return v2;
}

void __51__UIKBRenderFactory__characterSetForGlyphSelectors__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"‘’“”\",;"];
  v1 = (void *)_MergedGlobals_1121;
  _MergedGlobals_1121 = v0;
}

+ (BOOL)couldUseGlyphSelectorForDisplayString:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  char v5 = [a1 _characterSetForGlyphSelectors];
  uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

  BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  return v7;
}

- (int64_t)glyphSelectorForDisplayString:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (qword_1EB261878 != -1) {
    dispatch_once(&qword_1EB261878, block);
  }
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  char v5 = (void *)qword_1EB261870;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke_340;
  v9[3] = &unk_1E52FA040;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke()
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA20];
  v1 = _UIKitBundle();
  double v2 = [v1 preferredLocalizations];
  int v3 = [v2 firstObject];
  id v4 = [v0 canonicalLanguageIdentifierFromString:v3];

  char v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v4];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F1C438]];
  LODWORD(v3) = [v6 isEqualToString:@"zh"];

  if (v3)
  {
    int64_t v7 = [(id)objc_opt_class() _characterSetForGlyphSelectors];
    id v10 = v7;
    v11[0] = &unk_1ED3F4998;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = (void *)qword_1EB261870;
    qword_1EB261870 = v8;
  }
}

void __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke_340(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) rangeOfCharacterFromSet:a2] != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 integerValue];
    *a4 = 1;
  }
}

- (BOOL)popupKeyUsesCustomKeyContentView:(id)a3
{
  return [(UIKBRenderFactory *)self contentViewClassForPopupKey:a3] != 0;
}

- (Class)contentViewClassForPopupKey:(id)a3
{
  id v3 = a3;
  if ([v3 variantType] == 12
    || [v3 variantType] == 13
    || _os_feature_enabled_impl()
    && ([v3 variantType] == 10 || objc_msgSend(v3, "variantType") == 11))
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

- (BOOL)allowsPaddleForKey:(id)a3
{
  id v4 = a3;
  if ([(UIKBRenderFactory *)self allowsPaddles]) {
    int v5 = [v4 preventPaddle] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (UIKBRenderingContext)renderingContext
{
  return self->_renderingContext;
}

- (void)setRenderingContext:(id)a3
{
}

- (NSArray)segmentTraits
{
  return &self->_segmentTraits->super;
}

- (double)rivenSizeFactor
{
  return self->_rivenSizeFactor;
}

- (void)setRivenSizeFactor:(double)a3
{
  self->_double rivenSizeFactor = a3;
}

- (BOOL)lightweightFactory
{
  return self->_lightweightFactory;
}

- (void)setLightweightFactory:(BOOL)a3
{
  self->_lightweightFactordouble y = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)stretchFactor
{
  double width = self->_stretchFactor.width;
  double height = self->_stretchFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setStretchFactor:(CGSize)a3
{
  self->_stretchFactor = a3;
}

- (BOOL)boldTextEnabled
{
  return self->_boldTextEnabled;
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (BOOL)allowsPaddles
{
  return self->_allowsPaddles;
}

- (void)setAllowsPaddles:(BOOL)a3
{
  self->_allowsPaddles = a3;
}

- (BOOL)preferStringKeycapOverImage
{
  return self->_preferStringKeycapOverImage;
}

- (BOOL)drawsOneHandedAffordance
{
  return self->_drawsOneHandedAffordance;
}

- (void)setDrawsOneHandedAffordance:(BOOL)a3
{
  self->_drawsOneHandedAffordance = a3;
}

- (BOOL)dynamicFactory
{
  return self->_dynamicFactory;
}

- (void)setDynamicFactory:(BOOL)a3
{
  self->_dynamicFactordouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentTraits, 0);
  objc_storeStrong((id *)&self->_renderingContext, 0);
}

- (void)modifyKeyTraitsForPasscode:(id)a3 forKey:(id)a4 onKeyplane:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  if (([(UIKBRenderFactory *)self _popupStyleForKey:v7] & 1) == 0
    && ([(UIKBRenderFactory *)self _popupMenuStyleForKey:v7] & 1) == 0)
  {
    [v11 setBlendForm:3];
    BOOL v8 = [(UIKBRenderFactory *)self useBlueThemingForKey:v7];
    [v11 removeAllRenderEffects];
    if (!v8)
    {
      [v11 setBackgroundGradient:0];
      [v11 setLayeredBackgroundGradient:0];
      [v11 setLayeredForegroundGradient:0];
      id v9 = [(UIKBRenderFactory *)self controlKeyTraits];
      [v11 overlayWithTraits:v9];

      if ([v7 displayType] == 25)
      {
        [(UIKBRenderFactory *)self suppressLayoutSegments];
        if (([v7 state] & 4) != 0)
        {
          id v10 = [(UIKBRenderFactory *)self activeControlKeyTraits];
          [v11 overlayWithTraits:v10];
        }
      }
    }
  }
}

- (id)passcodeBackgroundTraitsForKeyplane:(id)a3
{
  id v3 = a3;
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v5, v7, v9, v11, v13, v15, v17, v19);
  uint64_t v21 = +[UIKBRenderTraits traitsWithGeometry:v20];

  [v21 setControlOpacities:1];
  [v21 setBlendForm:3];
  return v21;
}

- (double)passcodeEdgeWeight
{
  return 1.0;
}

- (id)passcodeKeyEdgeColorName
{
  return @"UIKBColorGray_Percent40";
}

- (id)passcodeControlKeyTraits
{
  id v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v3 setBlendForm:3];
  [v3 setControlOpacities:1];
  [(UIKBRenderFactory *)self passcodeEdgeWeight];
  double v5 = v4;
  double v6 = [(UIKBRenderFactory *)self passcodeKeyEdgeColorName];
  double v7 = +[UIKBEdgeEffect effectWithColor:v6 edges:15 inset:v5 * 0.5 weight:v5];

  [v3 addRenderEffect:v7];
  double v8 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorWhite" edges:15 inset:v5 * 0.5 weight:v5];
  double v9 = [(UIKBRenderFactory *)self renderConfig];
  [v9 keycapOpacity];
  objc_msgSend(v8, "setOpacity:");

  [v3 addForegroundRenderEffect:v8];
  return v3;
}

- (id)passcodeActiveControlKeyTraits
{
  id v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v3 setBlendForm:3];
  [v3 setControlOpacities:1];
  double v4 = [(UIKBRenderFactory *)self passcodeKeyEdgeColorName];
  double v5 = +[UIKBGradient gradientWithFlatColor:v4];
  [v3 setBackgroundGradient:v5];

  double v6 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite"];
  [v3 setLayeredForegroundGradient:v6];

  double v7 = [(UIKBRenderFactory *)self renderConfig];
  [v7 keycapOpacity];
  double v9 = v8;
  double v10 = [v3 layeredForegroundGradient];
  [v10 setOpacity:v9];

  double v11 = +[UIKBEdgeEffect effectWithColor:0 edges:0 inset:0.0 weight:0.0];
  [v3 addRenderEffect:v11];

  double v12 = +[UIKBEdgeEffect effectWithColor:0 edges:0 inset:0.0 weight:0.0];
  [v3 addForegroundRenderEffect:v12];

  return v3;
}

- (id)passcodeShiftedControlKeyTraits
{
  double v2 = [(UIKBRenderFactory *)self passcodeActiveControlKeyTraits];
  id v3 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorWhite"];
  [v2 setSymbolStyle:v3];

  return v2;
}

- (id)extraPasscodePaddleTraits
{
  double v2 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  id v3 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha30"];
  [v2 setBackgroundGradient:v3];

  return v2;
}

void __48__UIKBRenderFactory_Monolith__textOffsetForKey___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
  v1 = (void *)_MergedGlobals_1122;
  _MergedGlobals_1122 = v0;
}

uint64_t __68__UIKBRenderFactory_Monolith__variantTraitsForLetterKey_onKeyplane___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v5 = [a2 name];
  uint64_t v6 = [v5 containsString:@"Delete"];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

@end