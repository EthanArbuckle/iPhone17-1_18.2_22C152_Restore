@interface UIKBRenderFactoryiPhone
+ (id)_textOffsetHints;
- ($89C9DF7554150EC42DA90319EED2ADED)customizedOffsetForString:(SEL)a3 isPrimary:(id)a4 isLandscape:(BOOL)a5 withFrame:(BOOL)a6;
- (BOOL)_popupMenuStyleForKey:(id)a3;
- (BOOL)_popupStyleForKey:(id)a3;
- (BOOL)_shouldConfigureSecondarySymbolStyleForSpaceKey:(id)a3;
- (BOOL)iPadFudgeLayout;
- (BOOL)iPadSansHomeButtonLayout;
- (BOOL)isCustomizedKeyStyle;
- (BOOL)isTallPopup;
- (BOOL)needsSmallerFontSizeForKey:(id)a3;
- (CGPoint)ZWNJKeyOffset;
- (CGPoint)boldKeyOffset;
- (CGPoint)conjunctStringKeyOffsetTelugu;
- (CGPoint)copyKeyOffset;
- (CGPoint)cutKeyOffset;
- (CGPoint)deleteKeyOffset;
- (CGPoint)dictationKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)gurmukhiEkOnkarOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)leftArrowKeyOffset;
- (CGPoint)more123KeyOffset;
- (CGPoint)moreABCKeyOffset;
- (CGPoint)moreABCKeyWideCellOffset;
- (CGPoint)pasteKeyOffset;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)realEmojiKeyOffset;
- (CGPoint)returnKeyOffset;
- (CGPoint)rightArrowKeyOffset;
- (CGPoint)secondaryShiftKeyOffset;
- (CGPoint)shiftKeyOffset;
- (CGPoint)stringKeyOffset;
- (CGPoint)stringKeyOffsetBengali;
- (CGPoint)stringKeyOffsetDevanagari;
- (CGPoint)stringKeyOffsetGujarati;
- (CGPoint)stringKeyOffsetGurmukhi;
- (CGPoint)stringKeyOffsetKannada;
- (CGPoint)stringKeyOffsetMalayalam;
- (CGPoint)stringKeyOffsetOriya;
- (CGPoint)stringKeyOffsetTamil;
- (CGPoint)stringKeyOffsetTelugu;
- (CGPoint)symbolImageControlKeyOffset;
- (CGPoint)undoKeyOffset;
- (CGPoint)variantAnnotationTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (CGPoint)zhuyinFirstToneKeyOffset;
- (UIEdgeInsets)dynamicInsets;
- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3;
- (UIEdgeInsets)variantDisplayFrameInsets;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)_row4ControlSegmentWidthLeft;
- (double)assistKeyFontSize;
- (double)deleteKeyFontSize;
- (double)dualStringBottomAdditionalOffsetForDisplayContents:(id)a3;
- (double)dynamicBottomRowMultiplier;
- (double)gurmukhiEkOnkarFontSize;
- (double)hintNoneKeyFontSize;
- (double)moreABCKeyFontSize;
- (double)moreABCKeyWideCellFontSize;
- (double)moreKeyFontSize;
- (double)popupFontSize;
- (double)returnKeyFontSize;
- (double)shiftKeyFontSize;
- (double)skinnyKeyThreshold;
- (double)smallSymbolImageFontSize;
- (double)stringKeyFontSize;
- (double)stringKeyFontSizeBengali;
- (double)stringKeyFontSizeDevanagari;
- (double)stringKeyFontSizeGujarati;
- (double)stringKeyFontSizeGurmukhi;
- (double)stringKeyFontSizeKannada;
- (double)stringKeyFontSizeMalayalam;
- (double)stringKeyFontSizeOriya;
- (double)stringKeyFontSizeTamil;
- (double)stringKeyFontSizeTelugu;
- (double)symbolImageControlKeyFontSize;
- (double)variantAnnotationTextFontSize;
- (double)variantWideShadowWeight;
- (double)zhuyinFirstToneKeyFontSize;
- (id)_textStyleForSpaceKey;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)activeControlKeyTraits;
- (id)controlKeyTraits;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (id)shiftDeleteGlyphTraits;
- (id)shiftLockControlKeyTraits;
- (id)shiftedControlKeyTraits;
- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6;
- (int64_t)assetIdiom;
- (int64_t)lightHighQualityEnabledBlendForm;
- (int64_t)rowLimitForKey:(id)a3;
- (void)_configureTraitsForPopupStyle:(id)a3 withKey:(id)a4 onKeyplane:(id)a5;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5;
- (void)_customizePopupTraits:(id)a3 forKey:(id)a4 onKeyplane:(id)a5;
- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5;
- (void)_customizeTraits:(id)a3 forMultiscriptKey:(id)a4 style:(int64_t)a5;
- (void)_customizeTraits:(id)a3 forPredictionCellKey:(id)a4;
- (void)_customizeTraits:(id)a3 forZhuyinGridDualStringKey:(id)a4;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryiPhone

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 1;
}

- (int64_t)assetIdiom
{
  return 0;
}

- (double)stringKeyFontSize
{
  return 22.0;
}

- (double)deleteKeyFontSize
{
  return 15.0;
}

- (double)shiftKeyFontSize
{
  return 18.0;
}

- (double)hintNoneKeyFontSize
{
  return 15.0;
}

- (double)returnKeyFontSize
{
  return 16.0;
}

- (double)assistKeyFontSize
{
  return 12.0;
}

- (double)moreKeyFontSize
{
  return 16.0;
}

- (double)moreABCKeyFontSize
{
  return 13.0;
}

- (double)moreABCKeyWideCellFontSize
{
  return 16.0;
}

- (double)zhuyinFirstToneKeyFontSize
{
  return 16.0;
}

- (double)gurmukhiEkOnkarFontSize
{
  return 18.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 19.0;
}

- (double)smallSymbolImageFontSize
{
  return 14.0;
}

- (CGPoint)stringKeyOffset
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)returnKeyOffset
{
  double v2 = 0.0;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftArrowKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightArrowKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)cutKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)copyKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)pasteKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)boldKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)undoKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)zhuyinFirstToneKeyOffset
{
  double v2 = -1.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)gurmukhiEkOnkarOffset
{
  double v2 = -2.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2 = 0.0;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)realEmojiKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2 = -0.5;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyWideCellOffset
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)secondaryShiftKeyOffset
{
  double v2 = -0.5;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)ZWNJKeyOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
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

- (id)multitapCompleteKeyImageName
{
  return @"kana_multitap_complete_arrow.png";
}

- (id)muttitapReverseKeyImageName
{
  return @"kana_multitap_reverse_arrow.png";
}

- (double)skinnyKeyThreshold
{
  return 36.0;
}

- (BOOL)iPadFudgeLayout
{
  return 0;
}

- (BOOL)iPadSansHomeButtonLayout
{
  return 0;
}

- (double)stringKeyFontSizeBengali
{
  return 18.0;
}

- (double)stringKeyFontSizeDevanagari
{
  return 19.0;
}

- (double)stringKeyFontSizeGujarati
{
  return 18.0;
}

- (double)stringKeyFontSizeGurmukhi
{
  return 19.0;
}

- (double)stringKeyFontSizeKannada
{
  return 17.0;
}

- (double)stringKeyFontSizeMalayalam
{
  return 17.0;
}

- (double)stringKeyFontSizeOriya
{
  return 18.0;
}

- (double)stringKeyFontSizeTamil
{
  return 17.0;
}

- (double)stringKeyFontSizeTelugu
{
  return 17.0;
}

- (CGPoint)stringKeyOffsetBengali
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetDevanagari
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetGujarati
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetGurmukhi
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetKannada
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetMalayalam
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetOriya
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetTamil
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)stringKeyOffsetTelugu
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)conjunctStringKeyOffsetTelugu
{
  double v2 = 0.0;
  double v3 = -3.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)dynamicInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 12.0;
  double v5 = 2.0;
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

- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3
{
  if (a3 > 4)
  {
    BOOL v8 = [(UIKBRenderFactory *)self dynamicFactory];
    double v4 = 0.0;
    if (v8) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    if (v8) {
      double v9 = 2.0;
    }
    else {
      double v9 = 1.0;
    }
    double v3 = 0.0;
    if (a3 == 5)
    {
      double v5 = v9;
    }
    else
    {
      double v3 = 0.0;
      double v5 = v6;
    }
    if (a3 == 5) {
      double v6 = v9;
    }
  }
  else
  {
    [(UIKBRenderFactoryiPhone *)self dynamicInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)needsSmallerFontSizeForKey:(id)a3
{
  id v4 = a3;
  if (([v4 displayType] == 3
     || [v4 displayType] == 23
     || [v4 displayType] == 51
     || [v4 interactionType] == 38)
    && ([(UIKBRenderFactoryiPhone *)self skinnyKeyThreshold], v5 > 0.0))
  {
    [v4 paddedFrame];
    double v7 = v6;
    [(UIKBRenderFactoryiPhone *)self skinnyKeyThreshold];
    BOOL v9 = v7 < v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  [(UIKBRenderFactory *)self scale];
  double v11 = v10;
  double v12 = 5.0;
  if (v11 <= 2.0)
  {
    objc_msgSend(v8, "paddedFrame", 5.0);
    double v12 = 4.0;
    if (v13 > 42.0) {
      double v12 = 5.0;
    }
  }
  [v27 setRoundRectRadius:v12];
  if ([v8 displayTypeHint] == 12) {
    [v27 setRoundRectRadius:8.0];
  }
  [v27 paddedFrame];
  objc_msgSend(v27, "setSymbolFrame:", v14 + 2.0, v16 + 1.0, v15 + -4.0, v17 + -3.0);
  [v27 symbolFrame];
  objc_msgSend(v27, "setPaddedFrame:", v18 + 0.0, v19 + 0.0);
  if ([v8 displayType] == 23 || objc_msgSend(v8, "displayType") == 3)
  {
    v20 = [v9 displayString];

    [v27 paddedFrame];
    if (v20)
    {
      objc_msgSend(v27, "setSymbolFrame:", round(v21 + (v23 + -20.0) * 0.5), round(v22 + (v24 + -20.0) * 0.5), 20.0, 20.0);
      [v27 symbolFrame];
      CGFloat v25 = -5.0;
      CGFloat v26 = -5.0;
    }
    else
    {
      CGFloat v25 = 3.0;
      CGFloat v26 = 3.0;
    }
    CGRect v29 = CGRectInset(*(CGRect *)&v21, v25, v26);
    objc_msgSend(v27, "setSymbolFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  }
  if (![v8 displayType]
    || [v8 displayType] == 7
    || [v8 displayType] == 8)
  {
    [v27 symbolFrame];
    CGRect v31 = CGRectInset(v30, -2.0, 0.0);
    objc_msgSend(v27, "setSymbolFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  }
}

- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v79 = a3;
  id v8 = a4;
  id v9 = a5;
  [(UIKBRenderFactoryiPhone *)self symbolImageControlKeyFontSize];
  double v11 = v10;
  double v12 = *(double *)off_1E52D6BF8;
  if ([v8 displayType] == 13)
  {
    [(UIKBRenderFactoryiPhone *)self internationalKeyOffset];
LABEL_7:
    objc_msgSend(v79, "setTextOffset:");
LABEL_8:
    [v79 setUsesSymbolImage:1];
    goto LABEL_9;
  }
  if ([v8 displayType] == 9)
  {
    [(UIKBRenderFactoryiPhone *)self realEmojiKeyOffset];
    goto LABEL_7;
  }
  if ([v8 displayType] == 4)
  {
    [(UIKBRenderFactoryiPhone *)self dictationKeyOffset];
    goto LABEL_7;
  }
  if ([v8 displayType] == 3)
  {
    [(UIKBRenderFactoryiPhone *)self deleteKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self deleteKeyOffset];
LABEL_16:
    objc_msgSend(v79, "setTextOffset:");
    goto LABEL_17;
  }
  if ([v8 displayType] == 23)
  {
    [(UIKBRenderFactoryiPhone *)self shiftKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self shiftKeyOffset];
    objc_msgSend(v79, "setTextOffset:");
    int v14 = [v8 displayTypeHint];
    if (v14)
    {
      if (v14 == 2)
      {
        double v15 = [(UIKBRenderFactory *)self lightTextFontName];
        [v79 setFontName:v15];

LABEL_29:
        [(UIKBRenderFactoryiPhone *)self stringKeyOffset];
        goto LABEL_16;
      }
      if ((v14 & 0xFFFFFFFE) == 2) {
        goto LABEL_29;
      }
    }
    else
    {
      [(UIKBRenderFactoryiPhone *)self hintNoneKeyFontSize];
      objc_msgSend(v79, "setFontSize:");
    }
LABEL_17:
    [v79 setUsesSymbolImage:1];
    if ([(UIKBRenderFactoryiPhone *)self needsSmallerFontSizeForKey:v8])
    {
      [(UIKBRenderFactoryiPhone *)self smallSymbolImageFontSize];
      double v11 = v13;
      double v12 = *(double *)off_1E52D6BF0;
    }
    goto LABEL_9;
  }
  if ([v8 displayType] == 51 || objc_msgSend(v8, "interactionType") == 38) {
    goto LABEL_17;
  }
  double v16 = [v8 name];
  int v17 = [v16 hasSuffix:@"Chinese-Facemark"];

  if (v17)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffset];
LABEL_46:
    v36 = v79;
LABEL_52:
    objc_msgSend(v36, "setTextOffset:", v18, v19);
    goto LABEL_9;
  }
  if ([v8 displayType] == 18)
  {
    v20 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v20];

    [(UIKBRenderFactoryiPhone *)self moreKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self more123KeyOffset];
    double v22 = v21;
    double v24 = v23;
    if ([v8 displayTypeHint] == 1)
    {
      if ([v8 BOOLForProperty:@"More-Key-Merged"])
      {
        [(UIKBRenderFactoryiPhone *)self moreABCKeyWideCellFontSize];
        objc_msgSend(v79, "setFontSize:");
        [(UIKBRenderFactoryiPhone *)self moreABCKeyWideCellOffset];
      }
      else
      {
        [(UIKBRenderFactoryiPhone *)self moreABCKeyFontSize];
        objc_msgSend(v79, "setFontSize:");
        [(UIKBRenderFactoryiPhone *)self moreABCKeyOffset];
      }
      double v22 = v25;
      double v24 = v26;
    }
    v37 = [v8 displayString];

    if (v37 == @"") {
      [v79 setUsesSymbolImage:1];
    }
    v36 = v79;
    double v18 = v22;
    double v19 = v24;
    goto LABEL_52;
  }
  if ([v8 displayType] == 21
    || [v8 displayType] == 25
    || [v8 displayType] == 27)
  {
    id v27 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v27];

    [(UIKBRenderFactoryiPhone *)self returnKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self returnKeyOffset];
    objc_msgSend(v79, "setTextOffset:");
    [v79 setKerning:0.0];
    if ([v8 variantType] == 4)
    {
      v28 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      [v79 setFontName:v28];

      [(UIKBRenderFactoryiPhone *)self returnKeyFontSize];
      objc_msgSend(v79, "setFontSize:");
      double v29 = -0.5;
      double v30 = -0.25;
    }
    else
    {
      CGRect v31 = [v9 displayString];
      int v32 = [v31 _isIdeographicGlyphs];

      if (!v32)
      {
LABEL_42:
        v33 = [v9 displayStringImage];
        if ([v33 containsString:@"grinning"])
        {
        }
        else
        {
          v34 = [v9 displayStringImage];
          int v35 = [v34 containsString:@"return"];

          if (!v35) {
            goto LABEL_9;
          }
        }
        [v79 setUsesSymbolImage:1];
        [(UIKBRenderFactoryiPhone *)self symbolImageControlKeyFontSize];
        objc_msgSend(v79, "setFontSizeForSymbolImage:");
        [v79 setFontWeightForSymbolImage:*(double *)off_1E52D6BE8];
        [(UIKBRenderFactoryiPhone *)self symbolImageControlKeyOffset];
        goto LABEL_46;
      }
      [(UIKBRenderFactoryiPhone *)self stringKeyOffset];
    }
    objc_msgSend(v79, "setTextOffset:", v30, v29);
    goto LABEL_42;
  }
  if ([v8 displayType] == 42)
  {
    v38 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v38];

    [(UIKBRenderFactoryiPhone *)self assistKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self cutKeyOffset];
LABEL_63:
    objc_msgSend(v79, "setTextOffset:");
    [v79 setKerning:0.0];
    goto LABEL_8;
  }
  if ([v8 displayType] == 43)
  {
    v39 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v39];

    [(UIKBRenderFactoryiPhone *)self assistKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self copyKeyOffset];
    goto LABEL_63;
  }
  if ([v8 displayType] == 44)
  {
    v40 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v40];

    [(UIKBRenderFactoryiPhone *)self assistKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self pasteKeyOffset];
    goto LABEL_63;
  }
  if ([v8 displayType] == 39)
  {
    v41 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v41];

    [(UIKBRenderFactoryiPhone *)self assistKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self boldKeyOffset];
    goto LABEL_63;
  }
  if ([v8 interactionType] == 17)
  {
    v42 = [(UIKBRenderFactory *)self lightTextFontName];
    [v79 setFontName:v42];

    [(UIKBRenderFactoryiPhone *)self assistKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self undoKeyOffset];
    goto LABEL_63;
  }
  if ([v8 displayType] == 45)
  {
    [(UIKBRenderFactoryiPhone *)self leftArrowKeyOffset];
    goto LABEL_7;
  }
  if ([v8 displayType] == 46)
  {
    [(UIKBRenderFactoryiPhone *)self rightArrowKeyOffset];
    goto LABEL_7;
  }
  if ([v8 displayType] == 5)
  {
    [(UIKBRenderFactoryiPhone *)self dismissKeyOffset];
    goto LABEL_7;
  }
  v43 = [v8 name];
  int v44 = [v43 isEqualToString:@"Zhuyin-Letter-FIRST_TONE"];

  if (v44)
  {
    [(UIKBRenderFactoryiPhone *)self zhuyinFirstToneKeyFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self zhuyinFirstToneKeyOffset];
    goto LABEL_46;
  }
  v45 = [v8 representedString];
  int v46 = [v45 isEqualToString:@"‌"];

  if (v46)
  {
    [(UIKBRenderFactoryiPhone *)self ZWNJKeyOffset];
    goto LABEL_46;
  }
  v47 = [v8 representedString];
  int v48 = [v47 isEqualToString:@"ੴ"];

  if (v48)
  {
    [(UIKBRenderFactoryiPhone *)self gurmukhiEkOnkarFontSize];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self gurmukhiEkOnkarOffset];
    goto LABEL_46;
  }
  v49 = [v8 name];
  int v50 = [v49 hasPrefix:@"Bengali"];

  if (v50)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeBengali];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetBengali];
    goto LABEL_46;
  }
  v51 = [v8 name];
  int v52 = [v51 hasPrefix:@"Devanagari"];

  if (v52)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeDevanagari];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetDevanagari];
    goto LABEL_46;
  }
  v53 = [v8 name];
  int v54 = [v53 hasPrefix:@"Gujarati"];

  if (v54)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeGujarati];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetGujarati];
    goto LABEL_46;
  }
  v55 = [v8 name];
  int v56 = [v55 hasPrefix:@"Gurmukhi"];

  if (v56)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeGurmukhi];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetGurmukhi];
    goto LABEL_46;
  }
  v57 = [v8 name];
  int v58 = [v57 hasPrefix:@"Kannada"];

  if (v58)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeKannada];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetKannada];
    goto LABEL_46;
  }
  v59 = [v8 name];
  int v60 = [v59 hasPrefix:@"Malayalam"];

  if (v60)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeMalayalam];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetMalayalam];
    goto LABEL_46;
  }
  v61 = [v8 name];
  int v62 = [v61 hasPrefix:@"Oriya"];

  if (v62)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeOriya];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetOriya];
    goto LABEL_46;
  }
  v63 = [v8 name];
  int v64 = [v63 hasPrefix:@"Tamil"];

  if (v64)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeTamil];
    objc_msgSend(v79, "setFontSize:");
    [(UIKBRenderFactoryiPhone *)self stringKeyOffsetTamil];
    goto LABEL_46;
  }
  v65 = [v8 name];
  int v66 = [v65 hasPrefix:@"Telugu"];

  if (v66)
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSizeTelugu];
    objc_msgSend(v79, "setFontSize:");
    uint64_t v67 = [v8 overrideDisplayString];
    if (v67
      && (v68 = (void *)v67,
          [v8 overrideDisplayString],
          v69 = objc_claimAutoreleasedReturnValue(),
          uint64_t v70 = [v69 rangeOfString:@"్" options:2],
          v69,
          v68,
          v70 != 0x7FFFFFFFFFFFFFFFLL))
    {
      [(UIKBRenderFactoryiPhone *)self conjunctStringKeyOffsetTelugu];
    }
    else
    {
      [(UIKBRenderFactoryiPhone *)self stringKeyOffsetTelugu];
    }
    goto LABEL_46;
  }
  [(UIKBRenderFactoryiPhone *)self stringKeyFontSize];
  objc_msgSend(v79, "setFontSize:");
  [(UIKBRenderFactoryiPhone *)self stringKeyOffset];
  objc_msgSend(v79, "setTextOffset:");
  if ([v8 dynamicLayout])
  {
    [v8 frame];
    if (v71 < 35.0)
    {
      [v79 fontSize];
      [v79 setFontSize:round(v72 * 0.8)];
    }
  }
  if (qword_1EB261888 != -1) {
    dispatch_once(&qword_1EB261888, &__block_literal_global_649);
  }
  v73 = [v8 displayString];
  [v73 rangeOfCharacterFromSet:qword_1EB261880];
  uint64_t v75 = v74;

  v76 = [v8 displayString];
  uint64_t v77 = [v76 length];

  if (v75 == v77)
  {
    [v79 textOffset];
    objc_msgSend(v79, "setTextOffset:");
    [v79 fontSize];
    [v79 setFontSize:v78 + 2.0];
  }
LABEL_9:
  if ([v79 usesSymbolImage])
  {
    [v79 setFontSizeForSymbolImage:v11];
    [v79 setFontWeightForSymbolImage:v12];
  }
}

void __65__UIKBRenderFactoryiPhone__customizeSymbolStyle_forKey_contents___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
  v1 = (void *)qword_1EB261880;
  qword_1EB261880 = v0;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 28.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
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

- (UIEdgeInsets)variantDisplayFrameInsets
{
  double v2 = -2.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
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

- (double)variantWideShadowWeight
{
  return 40.0;
}

- (CGPoint)variantSymbolTextOffset
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2 = 2.0;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)variantAnnotationTextFontSize
{
  return 10.0;
}

- (CGPoint)popupSymbolTextOffset
{
  double v2 = 0.0;
  double v3 = -2.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)popupFontSize
{
  return 40.0;
}

- (BOOL)isTallPopup
{
  return 0;
}

- (double)dualStringBottomAdditionalOffsetForDisplayContents:(id)a3
{
  double v3 = [a3 displayString];
  if ([v3 isEqualToString:@"।"]) {
    double v4 = 1.5;
  }
  else {
    double v4 = -0.5;
  }

  return v4;
}

- (void)_customizePopupTraits:(id)a3 forKey:(id)a4 onKeyplane:(id)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UIKBRenderFactory *)self renderConfig];
  if ([v11 lightKeyboard])
  {
    double v12 = [(UIKBRenderFactory *)self renderConfig];
    objc_msgSend(v8, "setBlurBlending:", objc_msgSend(v12, "animatedBackground"));
  }
  else
  {
    [v8 setBlurBlending:1];
  }

  [(UIKBRenderFactory *)self suppressLayoutSegments];
  if ([(UIKBRenderFactory *)self lightweightFactory]) {
    goto LABEL_47;
  }
  double v13 = [(UIKBRenderFactory *)self thinKeycapsFontName];
  int v14 = [v8 symbolStyle];
  [v14 setFontName:v13];

  [(UIKBRenderFactoryiPhone *)self popupFontSize];
  double v16 = v15;
  int v17 = [v8 symbolStyle];
  [v17 setFontSize:v16];

  [(UIKBRenderFactoryiPhone *)self popupSymbolTextOffset];
  double v19 = v18;
  double v21 = v20;
  double v22 = [v8 symbolStyle];
  objc_msgSend(v22, "setTextOffset:", v19, v21);

  if ([v9 displayType] == 27)
  {
    double v23 = [(UIKBRenderFactory *)self thinTextFontName];
    double v24 = [v8 symbolStyle];
    [v24 setFontName:v23];

    double v25 = [v8 symbolStyle];
    [v25 setFontSize:22.0];
  }
  if (![v9 displayType])
  {
    double v26 = [v9 name];
    int v27 = [v26 hasPrefix:@"Burmese-Letter-"];

    if (v27)
    {
      v28 = [v8 symbolStyle];
      [v28 fontSize];
      double v30 = round(v29 * 0.85);
      CGRect v31 = [v8 symbolStyle];
      [v31 setFontSize:v30];
    }
  }
  if ([v9 dynamicLayout])
  {
    [v9 frame];
    if (v32 < 35.0)
    {
      v33 = [v8 symbolStyle];
      [v33 fontSize];
      double v35 = 0.7;
LABEL_15:
      double v37 = round(v34 * v35);
      v38 = [v8 symbolStyle];
      [v38 setFontSize:v37];

      goto LABEL_16;
    }
    [v9 frame];
    if (v36 < 45.0)
    {
      v33 = [v8 symbolStyle];
      [v33 fontSize];
      double v35 = 0.8;
      goto LABEL_15;
    }
  }
LABEL_16:
  if ([(UIKBRenderFactoryiPhone *)self _popupMenuStyleForKey:v9]) {
    [(UIKBRenderFactoryiPhone *)self wideShadowPopupMenuInsets];
  }
  else {
    [(UIKBRenderFactoryiPhone *)self wideShadowPaddleInsets];
  }
  double v43 = v39;
  double v44 = v40;
  double v45 = v41;
  double v46 = v42;
  v47 = [(UIKBRenderFactory *)self renderingContext];
  char v48 = [v47 isFloating];

  if ((v48 & 1) == 0)
  {
    uint64_t v49 = [v9 popupDirection];
    int v50 = @"UIKBColorBlack_Alpha35";
    if (v49 == 3)
    {
      double v51 = *MEMORY[0x1E4F1DB30];
      double v52 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v53 = 32.0;
      double v54 = 1.0;
      double v55 = 1.0;
      double v56 = 1.0;
      double v57 = 1.0;
    }
    else
    {
      int v58 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha35", 0.0, 2.5, 1.0, 0.0, 1.0, 0.0, 3.0 offset insets weight];
      [v8 addRenderEffect:v58];

      [(UIKBRenderFactoryiPhone *)self variantWideShadowWeight];
      double v53 = v59;
      double v51 = *MEMORY[0x1E4F1DB30];
      double v52 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      int v50 = @"UIKBColorBlack_Alpha55";
      double v54 = v43;
      double v55 = v44;
      double v56 = v45;
      double v57 = v46;
    }
    int v60 = +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", v50, v51, v52, v54, v55, v56, v57, v53);
    [v8 addRenderEffect:v60];
  }
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  v61 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  int v62 = +[UIKBGradient gradientWithFlatColor:v61];
  [v8 setBackgroundGradient:v62];

  v63 = [(UIKBRenderFactory *)self renderConfig];
  LODWORD(v61) = [v63 lightKeyboard];

  if (v61)
  {
    int v64 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha12" edges:15 inset:-0.25 weight:0.5];
    [v8 addRenderEffect:v64];
  }
  if (([v9 state] & 0x10) != 0)
  {
    v65 = [(UIKBRenderFactory *)self renderingContext];
    int v66 = [v65 isFloating];

    if (v66)
    {
      uint64_t v67 = [v8 geometry];
      objc_msgSend(v67, "setLayoutMargins:", 0.0, 800.0, 0.0, 0.0);
    }
    v68 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    v69 = +[UIKBTextStyle styleWithFontName:v68 withFontSize:22.0];

    [(UIKBRenderFactoryiPhone *)self variantSymbolTextOffset];
    objc_msgSend(v69, "setTextOffset:");
    if ([v9 displayType] == 27)
    {
      uint64_t v70 = [(UIKBRenderFactory *)self lightTextFontName];
      [v69 setFontName:v70];

      [v69 setFontSize:16.0];
    }
    double v71 = [v8 symbolStyle];
    double v72 = [v71 textColor];
    [v69 setTextColor:v72];

    v73 = +[UIKBRenderTraits traitsWithSymbolStyle:v69];
    [v8 setVariantTraits:v73];

    uint64_t v74 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
    uint64_t v75 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorKeyBlueKeyBackground"];
    [v74 setLayeredForegroundGradient:v75];

    v76 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorWhite"];
    [v74 setSymbolStyle:v76];

    [v8 setHighlightedVariantTraits:v74];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v77 = [v9 subtrees];
    uint64_t v78 = [v77 countByEnumeratingWithState:&v94 objects:v100 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      v92 = v69;
      id v93 = v10;
      uint64_t v80 = *(void *)v95;
      while (2)
      {
        for (uint64_t i = 0; i != v79; ++i)
        {
          if (*(void *)v95 != v80) {
            objc_enumerationMutation(v77);
          }
          v82 = [*(id *)(*((void *)&v94 + 1) + 8 * i) secondaryDisplayStrings];
          uint64_t v83 = [v82 count];

          if (v83)
          {

            v69 = v92;
            uint64_t v77 = (void *)[v92 copy];
            [(UIKBRenderFactoryiPhone *)self variantAnnotationTextFontSize];
            objc_msgSend(v77, "setFontSize:");
            v84 = [(UIKBRenderFactory *)self renderConfig];
            if ([v84 lightKeyboard]) {
              v85 = @"UIKBColorBlack_Alpha40";
            }
            else {
              v85 = @"UIKBColorWhite";
            }
            [v77 setTextColor:v85];

            [v77 setAnchorCorner:2];
            [(UIKBRenderFactoryiPhone *)self variantAnnotationTextOffset];
            objc_msgSend(v77, "setTextOffset:");
            v99 = v77;
            v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
            v87 = [v8 variantTraits];
            [v87 setSecondarySymbolStyles:v86];

            v88 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorWhite"];
            v98 = v88;
            v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
            [v74 setSecondarySymbolStyles:v89];

            id v10 = v93;
            goto LABEL_44;
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v94 objects:v100 count:16];
        if (v79) {
          continue;
        }
        break;
      }
      v69 = v92;
      id v10 = v93;
    }
LABEL_44:
  }
  if (([v9 renderKeyInKeyplane:v10] & 1) == 0)
  {
    v90 = [(UIKBRenderFactory *)self defaultKeyShadowColorName];
    v91 = +[UIKBEdgeEffect effectWithColor:v90 edges:4 inset:-1.0 weight:1.0];
    [v8 addRenderEffect:v91];
  }
LABEL_47:
}

- (void)_customizeTraits:(id)a3 forPredictionCellKey:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  double v7 = [(UIKBRenderFactory *)self renderConfig];
  int v8 = [v7 lightKeyboard];

  int v9 = [v6 state];
  if (v8)
  {
    if (v9 == 2)
    {
      id v10 = UIKBPredictionCandidateActiveBackground;
    }
    else
    {
      if (+[UIKBRenderFactory _graphicsQuality] == 100)
      {
        double v12 = @"UIKBColorGray_Percent65";
        double v13 = [(UIKBRenderFactory *)self controlKeyForegroundColorName];
LABEL_12:
        BOOL v14 = [v6 state] == 4;
        goto LABEL_15;
      }
      id v10 = UIKBColorKeyGrayKeyLightBackgroundMedium;
    }
    double v12 = *v10;
    double v13 = 0;
    goto LABEL_12;
  }
  if (v9 == 2)
  {
    double v11 = UIKBPredictionCandidateActiveBackground;
  }
  else if (+[UIKBRenderFactory _graphicsQuality] == 100)
  {
    [v17 setBlendForm:6];
    double v11 = UIKBColorKeyGrayKeyActiveDarkBackground;
  }
  else
  {
    double v11 = UIKBColorKeyGrayKeyDarkBackground;
  }
  double v12 = *v11;
  BOOL v14 = 0;
  double v13 = 0;
LABEL_15:
  [v17 setControlOpacities:v14];
  if (v12)
  {
    double v15 = +[UIKBGradient gradientWithFlatColor:v12];
    [v17 setBackgroundGradient:v15];

    if (v13)
    {
LABEL_17:
      double v16 = +[UIKBGradient gradientWithFlatColor:v13];
      [v17 setLayeredForegroundGradient:v16];

      goto LABEL_20;
    }
  }
  else
  {
    [v17 setBackgroundGradient:0];
    if (v13) {
      goto LABEL_17;
    }
  }
  [v17 setLayeredForegroundGradient:0];
LABEL_20:
}

- (void)_customizeTraits:(id)a3 forMultiscriptKey:(id)a4 style:(int64_t)a5
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v11 = [v8 symbolStyle];
  double v12 = [v8 secondarySymbolStyles];
  double v13 = [v12 firstObject];

  [v11 fontSize];
  double v15 = v14;
  [v13 fontSize];
  double v17 = v16;
  [v13 fontSize];
  double v71 = v18;
  double v19 = [v9 secondaryDisplayStrings];
  unint64_t v20 = [v19 count];

  if (a5 == 2)
  {
    double v69 = v15;
    double v36 = [v9 displayString];
    double v37 = [v9 secondaryDisplayStrings];
    v38 = [v37 firstObject];

    double v39 = [v8 geometry];
    [v39 paddedFrame];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;

    double v31 = 0.0;
    double v33 = 0.0;
    double v34 = 0.0;
    if ([v36 length])
    {
      -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:withFrame:](self, "customizedOffsetForString:isPrimary:isLandscape:withFrame:", v36, 1, isKindOfClass & 1, v41, v43, v45, v47);
      double v34 = v48;
      double v33 = v49;
      double v69 = v50;
    }
    double v68 = v47;
    double v66 = v43;
    double v67 = v41;
    double v65 = v45;
    if ([v38 length])
    {
      -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:withFrame:](self, "customizedOffsetForString:isPrimary:isLandscape:withFrame:", v38, 0, isKindOfClass & 1, v41, v43, v45, v47);
      double v32 = v51;
      double v31 = v52;
      double v17 = v53;
    }
    else
    {
      double v32 = 0.0;
    }
    double v15 = v69;
    double v21 = 0.0;
    double v35 = 0.0;
    if (v20 >= 2)
    {
      double v54 = [v9 secondaryDisplayStrings];
      [v54 lastObject];
      v55 = uint64_t v70 = v36;

      -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:withFrame:](self, "customizedOffsetForString:isPrimary:isLandscape:withFrame:", v55, 0, isKindOfClass & 1, v67, v66, v65, v68);
      double v35 = v56;
      double v21 = v57;
      double v71 = v58;

      double v36 = v70;
    }
  }
  else
  {
    double v21 = 0.0;
    double v22 = 4.0;
    if (isKindOfClass) {
      double v22 = 2.0;
    }
    double v23 = -8.0;
    double v24 = -15.0;
    if (isKindOfClass) {
      double v23 = -15.0;
    }
    double v25 = 13.0;
    double v26 = 20.0;
    if (isKindOfClass) {
      double v25 = 20.0;
    }
    double v27 = -19.0;
    if (isKindOfClass) {
      double v27 = -15.0;
    }
    double v28 = 8.0;
    if (isKindOfClass) {
      double v28 = 5.0;
    }
    else {
      double v24 = -5.0;
    }
    if ((isKindOfClass & 1) == 0) {
      double v26 = 8.5;
    }
    double v29 = -10.0;
    if (isKindOfClass) {
      double v29 = -7.0;
    }
    double v30 = 15.0;
    if (a5)
    {
      double v30 = v17;
      double v29 = 0.0;
      double v26 = 0.0;
      double v28 = 0.0;
      double v24 = 0.0;
    }
    if (a5 == 1) {
      double v17 = 25.0;
    }
    else {
      double v17 = v30;
    }
    if (a5 == 1) {
      double v31 = v27;
    }
    else {
      double v31 = v29;
    }
    if (a5 == 1) {
      double v32 = v25;
    }
    else {
      double v32 = v26;
    }
    if (a5 == 1) {
      double v33 = v22;
    }
    else {
      double v33 = v28;
    }
    if (a5 == 1) {
      double v34 = v23;
    }
    else {
      double v34 = v24;
    }
    double v35 = 0.0;
  }
  [v11 setTextOpacity:1.0];
  objc_msgSend(v11, "setTextOffset:", v34, v33);
  [v11 setFontSize:v15];
  [v13 setTextOpacity:0.4];
  objc_msgSend(v13, "setTextOffset:", v32, v31);
  [v13 setFontSize:v17];
  if (v20 >= 2)
  {
    double v59 = [v8 secondarySymbolStyles];
    unint64_t v60 = [v59 count];

    v61 = [v8 secondarySymbolStyles];
    int v62 = v61;
    if (v60 > 1)
    {
      int v64 = [v61 lastObject];
    }
    else
    {
      v63 = [v61 firstObject];
      int v64 = (void *)[v63 copy];

      v72[0] = v13;
      v72[1] = v64;
      int v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
      [v8 setSecondarySymbolStyles:v62];
    }

    objc_msgSend(v64, "setTextOffset:", v35, v21);
    [v64 setTextOpacity:0.4];
    [v64 setFontSize:v71];
  }
}

- (void)_customizeTraits:(id)a3 forZhuyinGridDualStringKey:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(UIKBRenderFactory *)self dynamicFactory];
  double v7 = [v5 symbolStyle];
  id v8 = v7;
  if (v6)
  {
    [v7 setFontSize:16.0];

    id v9 = [v5 symbolStyle];
    [v9 setAlignment:0];

    id v10 = [v5 symbolStyle];
    [v10 setAnchorCorner:4];

    double v11 = [v5 symbolStyle];
    objc_msgSend(v11, "setTextOffset:", -12.0, 8.0);

    double v12 = [(UIKBRenderFactory *)self lightTextFontName];
    double v13 = +[UIKBTextStyle styleWithFontName:v12 withFontSize:14.0];

    double v14 = [(UIKBRenderFactory *)self renderConfig];
    if ([v14 lightKeyboard]) {
      double v15 = @"UIKBColorBlack";
    }
    else {
      double v15 = @"UIKBColorWhite";
    }
    [v13 setTextColor:v15];

    [v13 setAlignment:2];
    [v13 setAnchorCorner:2];
    objc_msgSend(v13, "setTextOffset:", 5.0, 5.0);
    double v16 = [(UIKBRenderFactory *)self lightTextFontName];
    double v17 = +[UIKBTextStyle styleWithFontName:v16 withFontSize:18.0];

    double v18 = [(UIKBRenderFactory *)self renderConfig];
    if ([v18 lightKeyboard]) {
      double v19 = @"UIKBColorBlack_Alpha25";
    }
    else {
      double v19 = @"UIKBColorWhite";
    }
    [v17 setTextColor:v19];

    [v17 setAlignment:1];
    v28[0] = v13;
    unint64_t v20 = (void **)v28;
  }
  else
  {
    objc_msgSend(v7, "setTextOffset:", -12.0, 0.0);

    double v21 = [v5 secondarySymbolStyles];
    double v13 = [v21 firstObject];

    objc_msgSend(v13, "setTextOffset:", 12.0, 0.0);
    double v22 = [(UIKBRenderFactory *)self lightTextFontName];
    double v17 = +[UIKBTextStyle styleWithFontName:v22 withFontSize:14.0];

    double v23 = [(UIKBRenderFactory *)self renderConfig];
    int v24 = [v23 lightKeyboard];
    double v25 = UIKBColorBlack_Alpha25;
    if (!v24) {
      double v25 = UIKBColorWhite;
    }
    [v17 setTextColor:*v25];

    [v17 setAlignment:1];
    double v27 = v13;
    unint64_t v20 = &v27;
  }
  v20[1] = v17;
  double v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  [v5 setSecondarySymbolStyles:v26];
}

- (BOOL)_popupStyleForKey:(id)a3
{
  id v4 = a3;
  if ([(UIKBRenderFactory *)self allowsPaddleForKey:v4]) {
    int v5 = 20;
  }
  else {
    int v5 = 16;
  }
  if (([v4 interactionType] == 1 || objc_msgSend(v4, "interactionType") == 2)
    && ([v4 state] & v5) != 0)
  {
    BOOL v6 = [v4 name];
    int v7 = [v6 hasPrefix:@"Assist"] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_popupMenuStyleForKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 state] == 16
    && ([v3 displayType] == 13
     || [v3 displayType] == 4
     || [v3 displayTypeHint] == 12
     || [v3 displayType] == 5);

  return v4;
}

- (int64_t)rowLimitForKey:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  id v8 = (void *)[a3 copy];
  [v8 paddedFrame];
  objc_msgSend(v8, "setPaddedFrame:", v9 + 0.0, v10 + 0.0);
  double v11 = [v8 iPhoneVariantGeometries:a4 annotationIndex:a6];

  return v11;
}

- (void)_configureTraitsForPopupStyle:(id)a3 withKey:(id)a4 onKeyplane:(id)a5
{
  v172[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v166 = a5;
  double v10 = [(UIKBRenderFactory *)self contentViewClassForPopupKey:v9];
  if (v10)
  {
    double v11 = v10;
    if ([v9 state] == 16)
    {
      [(UIKBRenderFactoryiPhone *)self _customizePopupTraits:v8 forKey:v9 onKeyplane:v166];
      [(objc_class *)v11 preferredContentViewSizeForKey:v9 withTraits:v8];
      double v13 = v12;
      double v15 = v14;
      double v16 = [v8 geometry];
      int v17 = [v16 detachedVariants];

      [v9 paddedFrame];
      double v20 = round(v19 + (v18 - v13) * 0.5);
      [v9 paddedFrame];
      double v22 = v21;
      if ([v9 popupDirection] == 2)
      {
        [v9 paddedFrame];
        double v24 = v23;
        double v26 = v25;
        double v27 = [v8 geometry];
        double v28 = v24 + v26;
        [v27 setPopupDirection:2];
      }
      else
      {
        if (v17) {
          double v81 = 2.0;
        }
        else {
          double v81 = 0.0;
        }
        if ([v9 popupDirection] != 3)
        {
          double v28 = v22 - v15 - v81;
          goto LABEL_39;
        }
        [v166 frame];
        double v83 = v82;
        [v166 frame];
        double v85 = v84;
        v86 = [v8 geometry];
        [v86 setPopupDirection:3];

        double v27 = [v8 geometry];
        double v20 = round((v83 - v13) * 0.5 + 0.0);
        double v28 = round((v85 - v15) * 0.5 + 0.0);
        [v27 setRoundRectRadius:15.0];
      }

LABEL_39:
      int v95 = UIKBPopupBiasForKey(v166, v9);
      if (v95 <= 0) {
        uint64_t v96 = 2;
      }
      else {
        uint64_t v96 = v95;
      }
      long long v97 = [v8 geometry];
      [v97 setPopupBias:v96];

      [(UIKBRenderFactoryiPhone *)self wideShadowPaddleInsets];
      double v99 = v98;
      double v101 = v100;
      double v103 = v102;
      double v105 = v104;
      if ([v9 popupDirection] == 3)
      {
        v106 = [v8 geometry];
        objc_msgSend(v106, "setPaddedFrame:", v20, v28, v13, v15);

        double v99 = 12.0;
        double v101 = 12.0;
        double v103 = 12.0;
        double v105 = 12.0;
      }
      double v162 = v101;
      double v165 = v13;
      double v107 = -v103;
      double v108 = v20 - v101;
      double v109 = -v101;
      double width = v165 - (-v101 - v105);
      double y = v28 - v99;
      double height = v15 - (v107 - v99);
      if (v108 >= 0.0)
      {
        v173.origin.double x = v108;
        v173.origin.double y = y;
        v173.size.double width = width;
        v173.size.double height = height;
        CGFloat v113 = y;
        double MaxX = CGRectGetMaxX(v173);
        [v166 frame];
        if (MaxX <= CGRectGetWidth(v174))
        {
          double v109 = v108;
        }
        else
        {
          [v166 frame];
          double v115 = CGRectGetMaxX(v175);
          v176.origin.double x = v108;
          v176.origin.double y = v113;
          v176.size.double width = width;
          v176.size.double height = height;
          double v109 = v115 - CGRectGetWidth(v176) - v162;
        }
        double y = v113;
      }
      [v8 geometry];
      v117 = double v116 = v165;
      double x = v109;
      int v119 = [v117 detachedVariants];

      if (v119)
      {
        v120 = [v8 geometry];
        double v160 = v99;
        [v120 roundRectRadius];
        double v122 = (width - v165) * 0.5 + v109 + v121;
        double v123 = v165 - v121 - v121;
        double v124 = y + (height - v15) * 0.5 + v121;
        double v157 = height;
        double v125 = v15;
        double v126 = v15 - v121 - v121;

        double v127 = v122;
        double v128 = v124;
        double v129 = v123;
        double v130 = v126;
        double v131 = v122;
        double v116 = v165;
        double v132 = v124;
        double v99 = v160;
        double v133 = v123;
        double x = v109;
        double v134 = v126;
        double v15 = v125;
        double height = v157;
        v135 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v127, v128, v129, v130, v131, v132, v133, v134);
        v172[0] = v135;
        v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:1];
        [v8 setVariantGeometries:v136];
      }
      if ([v9 popupDirection] != 3)
      {
        [v9 paddedFrame];
        v179.origin.double x = x;
        v179.origin.double y = y;
        v179.size.double width = width;
        v179.size.double height = height;
        CGRect v178 = CGRectUnion(v177, v179);
        double x = v178.origin.x;
        double y = v178.origin.y;
        double width = v178.size.width;
        double height = v178.size.height;
      }
      v137 = [v8 geometry];
      objc_msgSend(v137, "setDisplayFrame:", x, y, width, height);

      v138 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v116, v15, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v116, v15);
      if ([v9 popupDirection] == 2)
      {
        [v9 paddedFrame];
        double v140 = v139;
        double v141 = 5.0;
      }
      else
      {
        double v140 = 0.0;
        double v141 = -5.0;
      }
      if ([v9 popupDirection] == 3)
      {
        double v142 = v162;
      }
      else
      {
        double v142 = v162 + 3.0;
        double v143 = v15 - v99;
        double v99 = v99 + v141 + v140;
        double v116 = v116 - v162 + -3.0;
        double v15 = v143 - v141;
      }
      objc_msgSend(v138, "setSymbolFrame:", v142, v99, v116, v15);
      v144 = +[UIKBRenderTraits traitsWithGeometry:v138];
      [v8 setVariantTraits:v144];

      goto LABEL_60;
    }
  }
  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory") || ![v9 dynamicLayout])
  {
    double v30 = (double *)UIKBRectsCreate(v166, v9, [v9 state]);
    int v31 = UIKBPopupBiasForKey(v166, v9);
    int v32 = v31;
    double v33 = v30[12];
    double v34 = v30[13];
    double v156 = v30[14];
    double v158 = v30[15];
    if (v31 == 21)
    {
      double v35 = -10.5;
    }
    else
    {
      if (v31 != 29) {
        goto LABEL_15;
      }
      double v35 = 10.5;
    }
    int v36 = [v9 state];
    double v37 = -0.0;
    if (v36 == 4) {
      double v37 = v35;
    }
    double v33 = v33 + v37;
LABEL_15:
    double v154 = v33;
    double v38 = v30[8];
    double v155 = v34;
    double v161 = v30[10];
    double v163 = v30[11];
    double v159 = v30[9];
    if (([v9 state] & 0x10) != 0)
    {
      [(UIKBRenderFactoryiPhone *)self variantDisplayFrameInsets];
      double v40 = v39;
      double v42 = v41;
      double v153 = v43;
      double v151 = v44;
      [(UIKBRenderFactoryiPhone *)self variantSymbolFrameInsets];
      double v46 = v45;
      double v48 = v47;
      double v152 = v49;
      double v150 = v50;
      double v51 = [v8 geometry];
      [v51 paddedFrame];
      double v146 = v53;
      double v147 = v52;
      double v148 = v54;
      double v149 = v55;
      [(UIKBRenderFactoryiPhone *)self variantPaddedFrameInsets];
      double v57 = v56;
      double v59 = v58;
      double v145 = v60;
      double v62 = v61;
      v63 = [v8 geometry];
      double v38 = v38 + v42;
      double v159 = v159 + v40;
      double v161 = v161 - (v42 + v151);
      double v163 = v163 - (v40 + v153);
      double v154 = v154 + v48;
      double v155 = v155 + v46;
      double v156 = v156 - (v48 + v150);
      double v158 = v158 - (v46 + v152);
      objc_msgSend(v63, "setPaddedFrame:", v147 + v59, v146 + v57, v148 - (v59 + v62), v149 - (v57 + v145));
    }
    int v64 = [v8 geometry];
    objc_msgSend(v64, "setDisplayFrame:", v38, v159, v161, v163);

    double v65 = [v8 geometry];
    objc_msgSend(v65, "setSymbolFrame:", v154, v155, v156, v158);

    free(v30);
    if (v32 <= 0) {
      uint64_t v66 = 2;
    }
    else {
      uint64_t v66 = v32;
    }
    double v67 = [v8 geometry];
    [v67 setPopupBias:v66];

    BOOL v68 = [(UIKBRenderFactoryiPhone *)self isTallPopup];
    double v69 = [v8 geometry];
    [v69 setTallPopup:v68];

    v164 = [(UIKBRenderFactory *)self displayContentsForKey:v9];
    uint64_t v70 = [v164 variantDisplayContents];
    uint64_t v71 = [v70 count];

    if (!v71) {
      goto LABEL_37;
    }
    uint64_t v168 = 0;
    v169 = &v168;
    uint64_t v170 = 0x2020000000;
    uint64_t v171 = 0x7FFFFFFFFFFFFFFFLL;
    double v72 = [v164 variantDisplayContents];
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __76__UIKBRenderFactoryiPhone__configureTraitsForPopupStyle_withKey_onKeyplane___block_invoke;
    v167[3] = &unk_1E52FA068;
    v167[4] = &v168;
    [v72 enumerateObjectsUsingBlock:v167];

    v73 = [v8 geometry];
    int64_t v74 = [(UIKBRenderFactoryiPhone *)self rowLimitForKey:v9];
    uint64_t v75 = [(UIKBRenderFactoryiPhone *)self variantGeometriesForGeometry:v73 variantCount:v71 rowLimit:v74 annotationIndex:v169[3]];
    [v8 setVariantGeometries:v75];

    v76 = [v9 variantPopupBias];
    LODWORD(v75) = v76 == @"fixed-right";

    if (v75)
    {
      uint64_t v79 = [v8 variantGeometries];
      uint64_t v80 = +[UIKBRenderGeometry sortedGeometries:v79 leftToRight:1];
      [v8 setVariantGeometries:v80];
    }
    else
    {
      uint64_t v77 = [v9 variantPopupBias];
      BOOL v78 = v77 == @"fixed-left";

      if (!v78)
      {
LABEL_32:
        v87 = [v166 name];
        char v88 = [v87 containsString:@"Emoji"];

        if (v88) {
          [(UIKBRenderFactory *)self modifyTraitsForDividerVariant:v8 withKey:v9];
        }
        for (uint64_t i = 0; i != v71; ++i)
        {
          v90 = [v9 subtrees];
          v91 = [v90 objectAtIndex:i];
          v92 = [v8 variantGeometries];
          id v93 = [v92 objectAtIndex:i];
          long long v94 = [v93 similarShape];
          [v91 setShape:v94];
        }
        _Block_object_dispose(&v168, 8);
LABEL_37:
        [(UIKBRenderFactoryiPhone *)self _customizePopupTraits:v8 forKey:v9 onKeyplane:v166];

LABEL_60:
        double v29 = v166;
        goto LABEL_61;
      }
      uint64_t v79 = [v8 variantGeometries];
      uint64_t v80 = +[UIKBRenderGeometry sortedGeometries:v79 leftToRight:0];
      [v8 setVariantGeometries:v80];
    }

    goto LABEL_32;
  }
  double v29 = v166;
  [(UIKBRenderFactoryiPhone *)self _customizePopupTraits:v8 forKey:v9 onKeyplane:v166];
LABEL_61:
}

void __76__UIKBRenderFactoryiPhone__configureTraitsForPopupStyle_withKey_onKeyplane___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = [a2 secondaryDisplayStrings];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)_shouldConfigureSecondarySymbolStyleForSpaceKey:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] == 25)
  {
    BOOL v4 = [v3 name];
    int v5 = [v4 hasSuffix:@"LanguageIndicator"] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_textStyleForSpaceKey
{
  double v2 = [(UIKBRenderFactory *)self lightTextFontName];
  id v3 = +[UIKBTextStyle styleWithFontName:v2 withFontSize:12.0];

  return v3;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v293[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v287.receiver = self;
  v287.super_class = (Class)UIKBRenderFactoryiPhone;
  uint64_t v8 = [(UIKBRenderFactory *)&v287 _traitsForKey:v6 onKeyplane:v7];
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  id v9 = [v8 geometry];
  [v9 setRoundRectCorners:-1];

  double v10 = [(UIKBRenderFactory *)self renderConfig];
  objc_msgSend(v8, "setUsesDarkAppearance:", objc_msgSend(v10, "lightKeyboard") ^ 1);

  double v11 = [(UIKBRenderFactory *)self displayContentsForKey:v6];
  double v12 = [(UIKBRenderFactory *)self lightKeycapsFontName];
  double v13 = +[UIKBTextStyle styleWithFontName:v12 withFontSize:0.0];
  [v8 setSymbolStyle:v13];

  double v14 = [v8 symbolStyle];
  [v14 setMinFontSize:9.0];

  double v15 = [(UIKBRenderFactory *)self renderConfig];
  if ([v15 whiteText]) {
    double v16 = @"UIKBColorWhite";
  }
  else {
    double v16 = @"UIKBColorBlack";
  }
  int v17 = [v8 symbolStyle];
  [v17 setTextColor:v16];

  double v18 = [v8 symbolStyle];
  [(UIKBRenderFactoryiPhone *)self _customizeSymbolStyle:v18 forKey:v6 contents:v11];

  double v19 = [v8 geometry];
  [(UIKBRenderFactoryiPhone *)self _customizeGeometry:v19 forKey:v6 contents:v11];

  if ([(UIKBRenderFactoryiPhone *)self _shouldConfigureSecondarySymbolStyleForSpaceKey:v6])
  {
    double v20 = [(UIKBRenderFactoryiPhone *)self _textStyleForSpaceKey];
    double v21 = [(UIKBRenderFactory *)self renderConfig];
    int v22 = [v21 lightKeyboard];
    double v23 = UIKBColorBlack_Alpha20;
    if (!v22) {
      double v23 = UIKBColorWhite_Alpha30;
    }
    [v20 setTextColor:*v23];

    if ((UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) == 0) {
      [v20 setFontWidth:*(double *)off_1E52D6C10];
    }
    [v20 setAlignment:2];
    [v20 setAnchorCorner:8];
    objc_msgSend(v20, "setTextOffset:", 5.0, 4.0);
    v293[0] = v20;
    double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v293 count:1];
    [v8 setSecondarySymbolStyles:v24];
  }
  if ([(UIKBRenderFactoryiPhone *)self _popupMenuStyleForKey:v6])
  {
    int v25 = [v6 displayType];
    double v26 = [v8 geometry];
    [v26 setPopupBias:40];

    double v27 = [v8 geometry];
    [v27 setTallPopup:0];

    double v28 = off_1E52D40B8;
    if (v25 != 5) {
      double v28 = off_1E52D3B08;
    }
    double v29 = [(__objc2_class *)*v28 sharedInstance];
    [v29 popupRect];
    double x = v30;
    double y = v32;
    double width = v34;
    double height = v36;
    if ([v29 mode] == 1)
    {
      [v6 paddedFrame];
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      double v46 = +[UIKeyboardImpl activeInstance];
      double v47 = [v46 _layout];
      objc_msgSend(v47, "convertRect:fromView:", v29, x, y, width, height);
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      CGFloat v53 = v52;
      CGFloat v55 = v54;

      v295.origin.double x = v39;
      v295.origin.double y = v41;
      v295.size.double width = v43;
      v295.size.double height = v45;
      v312.origin.double x = v49;
      v312.origin.double y = v51;
      v312.size.double width = v53;
      v312.size.double height = v55;
      CGRect v296 = CGRectUnion(v295, v312);
      double x = v296.origin.x;
      double y = v296.origin.y;
      double width = v296.size.width;
      double height = v296.size.height;
    }
    else
    {
      double v60 = [v8 geometry];
      [v60 setPopupBias:0];
    }
    v297.origin.double x = x;
    v297.origin.double y = y;
    v297.size.double width = width;
    v297.size.double height = height;
    CGRect v298 = CGRectInset(v297, -12.0, -5.0);
    double v61 = v298.origin.x;
    double v62 = v298.size.width;
    double v63 = v298.size.height;
    CGFloat v64 = v298.origin.y + -2.0;
    double v65 = [v8 geometry];
    objc_msgSend(v65, "setDisplayFrame:", v61, v64, v62, v63);

    [(UIKBRenderFactoryiPhone *)self _customizePopupTraits:v8 forKey:v6 onKeyplane:v7];
    if (+[UIKBRenderFactory _graphicsQuality] == 10) {
      [v8 removeAllRenderEffects];
    }
    uint64_t v66 = [v8 symbolStyle];
    [v66 setTextColor:@"UIKBColorClear"];

    id v67 = v8;
    goto LABEL_188;
  }
  BOOL rect_12 = [(UIKBRenderFactoryiPhone *)self _popupStyleForKey:v6];
  if (rect_12) {
    [(UIKBRenderFactoryiPhone *)self _configureTraitsForPopupStyle:v8 withKey:v6 onKeyplane:v7];
  }
  if ([v6 state] == 1)
  {
    double v56 = [v8 symbolStyle];
    [v56 setTextOpacity:0.32];
  }
  double v57 = [(UIKBRenderFactory *)self renderingContext];
  uint64_t v58 = [v57 keyboardType];

  rect_24 = v7;
  v270 = v11;
  if ([v6 displayTypeHint] == 10)
  {
    if (v58 == 12) {
      char v59 = [v7 isShiftKeyplane];
    }
    else {
      char v59 = 0;
    }
    char v68 = v59 ^ 1;
  }
  else
  {
    char v68 = 0;
  }
  uint64_t rect_16 = [v6 stringForProperty:@"KBhint"];
  int v69 = [v6 supportsSupplementalDisplayString];
  v271 = v8;
  if ([v6 displayType] == 7 && (v68 & 1) == 0)
  {
    uint64_t v70 = [v8 symbolStyle];
    uint64_t v71 = (void *)[v70 copy];

    double v72 = [v8 geometry];
    [v72 symbolFrame];
    CGFloat v74 = v73;
    double v76 = v75;
    CGFloat v78 = v77;
    double v80 = v79;

    v299.size.double height = v80 * 0.275;
    v299.origin.double y = v76 + v80 * 0.18;
    v299.origin.double x = v74;
    v299.size.double width = v78;
    CGRect v300 = CGRectIntegral(v299);
    CGFloat recta = v300.origin.x;
    CGFloat v81 = v300.origin.y;
    CGFloat v82 = v300.size.width;
    CGFloat v83 = v300.size.height;
    v300.origin.double y = v76 + v80 * 0.455;
    v300.origin.double x = v74;
    v300.size.double width = v78;
    v300.size.double height = v80 * 0.315;
    CGRect v301 = CGRectIntegral(v300);
    CGFloat v84 = v301.origin.x;
    CGFloat v85 = v301.origin.y;
    CGFloat v86 = v301.size.width;
    CGFloat v87 = v301.size.height;
    v301.origin.double x = recta;
    v301.origin.double y = v81;
    v301.size.double width = v82;
    v301.size.double height = v83;
    CGRect v302 = CGRectInset(v301, -3.0, -3.0);
    CGFloat v88 = v302.origin.x;
    double v89 = v302.origin.y;
    CGFloat v90 = v302.size.width;
    double v91 = v302.size.height;
    v302.origin.double x = v84;
    v302.origin.double y = v85;
    v302.size.double width = v86;
    v302.size.double height = v87;
    CGRect v303 = CGRectInset(v302, -3.0, -3.0);
    CGFloat rect = v303.origin.x;
    double v92 = v303.origin.y;
    CGFloat v93 = v303.size.width;
    CGFloat v94 = v303.size.height;
    if ([v6 BOOLForProperty:@"slide-down"]) {
      double v92 = v89 + v91;
    }
    v304.origin.double x = v88;
    v304.origin.double y = v89;
    v304.size.double width = v90;
    v304.size.double height = v91;
    double MidY = CGRectGetMidY(v304);
    uint64_t v96 = [v8 geometry];
    [v96 symbolFrame];
    double v97 = MidY - CGRectGetMidY(v305);

    double v98 = [v8 geometry];
    [v98 symbolFrame];
    CGRectGetMinX(v306);
    v307.origin.double x = v88;
    v307.origin.double y = v89;
    v307.size.double width = v90;
    v307.size.double height = v91;
    CGRectGetMinX(v307);

    double v99 = [v8 geometry];
    [v99 symbolFrame];
    CGRectGetMaxX(v308);
    v309.origin.double x = rect;
    v309.origin.double y = v92;
    v309.size.double width = v93;
    v309.size.double height = v94;
    CGRectGetMaxX(v309);

    v310.origin.double x = rect;
    v310.origin.double y = v92;
    v310.size.double width = v93;
    v310.size.double height = v94;
    double v100 = CGRectGetMidY(v310);
    double v101 = [v8 geometry];
    [v101 symbolFrame];
    double v102 = CGRectGetMidY(v311);

    [(UIKBRenderFactoryiPhone *)self dualStringBottomAdditionalOffsetForDisplayContents:v270];
    double v104 = v103;
    objc_msgSend(v71, "setTextOffset:", 0.0, v97 + 1.5);
    if (([(UIKBRenderFactoryiPhone *)self iPadFudgeLayout] | v69)) {
      goto LABEL_34;
    }
    double v152 = [(UIKBRenderFactory *)self renderingContext];
    uint64_t v153 = [v152 shiftState];
    if (v153 == 4
      || ([(UIKBRenderFactory *)self renderingContext],
          double v10 = objc_claimAutoreleasedReturnValue(),
          [v10 shiftState] != 1))
    {
      double v57 = [(UIKBRenderFactory *)self renderingContext];
      if ([v57 shiftState] != 4 || !objc_msgSend(rect_24, "isShiftKeyplane"))
      {
        int v157 = 0;
        goto LABEL_75;
      }
      double v154 = v6;
      int v155 = 1;
    }
    else
    {
      double v154 = v6;
      int v155 = 0;
    }
    if (UIKeyboardCurrentInputModeIsKoreanEnglishBilingual()) {
      int v156 = 1;
    }
    else {
      int v156 = [v154 supportsSupplementalDisplayString];
    }
    int v157 = v156 ^ 1;
    if (!v155)
    {
      id v6 = v154;
      uint64_t v8 = v271;
      if (v153 == 4)
      {
LABEL_76:

        if (v157) {
          goto LABEL_80;
        }
        goto LABEL_34;
      }
LABEL_79:

      if (v157)
      {
LABEL_80:
        double v158 = [v8 symbolStyle];
        double v159 = (void *)[v158 copy];
        v292 = v159;
        double v160 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v292 count:1];
        [v8 setSecondarySymbolStyles:v160];

        [v8 setSymbolStyle:0];
LABEL_81:
        double v107 = v270;
LABEL_82:

        goto LABEL_83;
      }
LABEL_34:
      if ([v6 displayTypeHint] != 10)
      {
        double v105 = [v8 symbolStyle];
        objc_msgSend(v105, "setTextOffset:", 0.0, v100 - v102 + v104);

        v291 = v71;
        v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v291 count:1];
        [v8 setSecondarySymbolStyles:v106];
      }
      goto LABEL_81;
    }
    id v6 = v154;
    uint64_t v8 = v271;
LABEL_75:

    if (v153 == 4) {
      goto LABEL_76;
    }
    goto LABEL_79;
  }
  double v107 = v270;
  if ([v6 displayTypeHint] == 10)
  {
    if ([v6 state] == 4) {
      [v8 setRenderSecondarySymbolsSeparately:1];
    }
    double v108 = [v270 secondaryDisplayStrings];
    uint64_t v109 = [v108 count];

    if ([v6 state] != 16 && v109)
    {
      v110 = [MEMORY[0x1E4F1CA48] array];
      long long v283 = 0u;
      long long v284 = 0u;
      long long v285 = 0u;
      long long v286 = 0u;
      v111 = [v270 secondaryDisplayStrings];
      uint64_t v112 = [v111 countByEnumeratingWithState:&v283 objects:v290 count:16];
      if (v112)
      {
        uint64_t v113 = v112;
        uint64_t v114 = *(void *)v284;
        while (1)
        {
          if (*(void *)v284 != v114) {
            objc_enumerationMutation(v111);
          }
          double v115 = [v271 symbolStyle];
          double v116 = (void *)[v115 copy];
          [v110 addObject:v116];

          if (!--v113)
          {
            uint64_t v113 = [v111 countByEnumeratingWithState:&v283 objects:v290 count:16];
            if (!v113) {
              break;
            }
          }
        }
      }

      uint64_t v8 = v271;
      [v271 setSecondarySymbolStyles:v110];

      double v107 = v270;
    }
    if ([v6 state] <= 2)
    {
      int v117 = [v6 displayType];
      v118 = [(UIKBRenderFactory *)self renderConfig];
      if ([v118 lightKeyboard]) {
        double v119 = 0.25;
      }
      else {
        double v119 = 0.3;
      }

      double v120 = dbl_186B99AD0[v117 == 7];
      if (v117 == 7) {
        double v121 = 1.0;
      }
      else {
        double v121 = 0.65;
      }
      double v122 = dbl_186B99AE0[v117 == 7];
      double v123 = [v8 symbolStyle];
      [v123 textOffset];
      double v125 = v124;
      double v127 = v126;

      double v128 = [v8 geometry];
      [v128 displayFrame];
      double v130 = v120 * v129;

      int v131 = [v6 BOOLForProperty:@"slide-down"];
      double v132 = v130 + v130;
      if (!v131) {
        double v132 = v130;
      }
      double v133 = v127 + v132;
      double v134 = [v8 symbolStyle];
      objc_msgSend(v134, "setTextOffset:", v125, v133);

      if (v109 == 2)
      {
        v189 = [v8 geometry];
        [v189 displayFrame];
        double v191 = v122 * v190;

        v192 = [v8 secondarySymbolStyles];
        v193 = [v192 firstObject];

        [v193 setTextOpacity:v119];
        [v193 fontSize];
        [v193 setFontSize:v121 * v194];
        [v193 textOffset];
        double v196 = v195;
        double v198 = v197 - v191;
        v199 = [v8 geometry];
        [v199 displayFrame];
        double v201 = v196 - v200 * 0.24;

        objc_msgSend(v193, "setTextOffset:", v201, v198);
        v202 = [v8 secondarySymbolStyles];
        uint64_t v71 = [v202 lastObject];

        [v71 setTextOpacity:v119];
        [v71 fontSize];
        [v71 setFontSize:v121 * v203];
        [v71 textOffset];
        double v205 = v204;
        double v207 = v206 - v191;
        v208 = [v8 geometry];
        [v208 displayFrame];
        double v210 = v205 + v209 * 0.24;

        v211 = v71;
        double v212 = v210;
        double v213 = v207;
LABEL_122:
        objc_msgSend(v211, "setTextOffset:", v212, v213);
        goto LABEL_82;
      }
      if (v109 == 1)
      {
        v135 = [v8 secondarySymbolStyles];
        uint64_t v71 = [v135 firstObject];

        if ([v6 displayType] != 7) {
          [v71 setTextOpacity:v119];
        }
        [v71 setImageScale:v121];
        [v71 textOffset];
        double v137 = v136;
        double v139 = v138;
        double v140 = [v8 geometry];
        [v140 displayFrame];
        double v142 = v141;

        [v71 fontSize];
        double v144 = v143;
        [v71 setFontSize:v121 * v143];
        double v145 = [v6 secondaryDisplayStrings];
        double v146 = [v145 firstObject];
        double v147 = v8;
        int v148 = [v146 isEqualToString:@"٬"];

        if (v148)
        {
          [v71 setFontSize:v144 * 1.1];
          double v149 = [v147 geometry];
          [v149 displayFrame];
          double v151 = v150 * 0.27;

          uint64_t v8 = v147;
        }
        else
        {
          double v151 = v122 * v142;
          v214 = [v6 secondaryDisplayStrings];
          v215 = [v214 firstObject];
          v216 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
          uint64_t v217 = [v215 rangeOfCharacterFromSet:v216];

          if (v217 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v71 fontSize];
            [v71 setFontSize:v218 * 0.9];
          }
          double v107 = v270;
          uint64_t v8 = v271;
        }
        double v213 = v139 - v151;
        v211 = v71;
        double v212 = v137;
        goto LABEL_122;
      }
    }
  }
LABEL_83:
  if ([v6 displayType] == 23
    || [v6 displayType] == 51
    || [v107 displayPathType])
  {
    double v161 = [(UIKBRenderFactory *)self renderConfig];
    double v162 = UIKBColorBlack;
    if (([v161 lightKeyboard] & 1) == 0 && objc_msgSend(v6, "state") <= 2) {
      double v162 = UIKBColorWhite;
    }
    double v163 = *v162;
    v164 = [v8 symbolStyle];
    [v164 setTextColor:v163];

    uint64_t v8 = v271;
  }
  if ([v6 displayType] == 3)
  {
    double v165 = [(UIKBRenderFactory *)self renderConfig];
    if ([v165 lightKeyboard]) {
      id v166 = @"UIKBColorBlack";
    }
    else {
      id v166 = @"UIKBColorWhite";
    }
    v167 = [v8 symbolStyle];
    [v167 setTextColor:v166];

    uint64_t v8 = v271;
  }
  if ([(UIKBRenderFactory *)self drawsOneHandedAffordance]
    && [v6 displayType] == 25)
  {
    uint64_t v168 = objc_alloc_init(UIKBDivotedEffect);
    [v8 addRenderEffect:v168];
    objc_msgSend(v8, "setRenderFlagsForAboveEffects:", objc_msgSend(v8, "renderFlagsForAboveEffects") | 1);
  }
  if (rect_12) {
    goto LABEL_136;
  }
  if (![(UIKBRenderFactory *)self useBlueThemingForKey:v6]
    || [v6 state] != 2)
  {
    CGRect v173 = [(UIKBRenderFactory *)self defaultKeyShadowColorName];
    int v174 = [v6 displayType];
    if (v174 == 47)
    {
      [(UIKBRenderFactoryiPhone *)self _customizeTraits:v8 forPredictionCellKey:v6];
    }
    else
    {
      if (v174 == 48)
      {
        CGRect v175 = [v6 name];
        int v176 = [v175 isEqualToString:@"DividerLine"];

        if (!v176)
        {
          v183 = [v6 name];
          int v184 = [v183 isEqualToString:@"SelectionBackground"];

          if (v184)
          {
            v185 = [(UIKBRenderFactory *)self renderConfig];
            int v186 = [v185 lightKeyboard];
            v187 = UIKBPredictionCandidateEnabledBackground;
            if (!v186) {
              v187 = UIKBColorKeyGrayKeyLightBackground;
            }
            v188 = +[UIKBGradient gradientWithFlatColor:*v187];
            [v8 setBackgroundGradient:v188];
          }
          goto LABEL_135;
        }
        CGRect v177 = +[UIKBGradient gradientWithFlatColor:@"UIKBPredictionCandidateEnabledBackground"];
        [v8 setBackgroundGradient:v177];
      }
      else
      {
        CGRect v178 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
        CGRect v179 = +[UIKBGradient gradientWithFlatColor:v178];
        [v8 setBackgroundGradient:v179];

        if (([v6 state] & 4) != 0
          && [v6 displayType] != 23
          && ![(UIKBRenderFactory *)self useBlueThemingForKey:v6])
        {
          if ([(UIKBRenderFactory *)self allowsPaddleForKey:v6])
          {
            [v8 setControlOpacities:1];
            v180 = [(UIKBRenderFactory *)self controlKeyBackgroundColorName];
            v181 = +[UIKBGradient gradientWithFlatColor:v180];
            [v8 setBackgroundGradient:v181];

            [(UIKBRenderFactory *)self controlKeyShadowColorName];
            v182 = v173;
            CGRect v173 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v219 = [(UIKBRenderFactory *)self renderConfig];
            int v220 = [v219 animatedBackground];

            if (v220)
            {
              [v8 setBlurBlending:1];
              v182 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
              v221 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha10"];
              [v8 setLayeredForegroundGradient:v221];

              [v8 setBlendForm:9];
            }
            else
            {
              v222 = [(UIKBRenderFactory *)self renderConfig];
              int v223 = [v222 lightKeyboard];

              if (v223)
              {
                v224 = UIKBColorLightGrayPressState;
              }
              else
              {
                [v8 setBlurBlending:1];
                if ([(id)objc_opt_class() _graphicsQuality] == 100)
                {
                  [v8 setBlendForm:6];
                  v224 = UIKBColorKeyGrayKeyActiveDarkBackground;
                }
                else
                {
                  v224 = UIKBColorKeyGrayKeyDarkBackground;
                }
              }
              v182 = *v224;
            }
            v225 = +[UIKBGradient gradientWithFlatColor:v182];
            [v8 setBackgroundGradient:v225];
          }
        }
        CGRect v177 = +[UIKBEdgeEffect effectWithColor:v173 edges:4 inset:-1.0 weight:1.0];
        [v8 addRenderEffect:v177];
      }
    }
LABEL_135:

    goto LABEL_136;
  }
  [(UIKBRenderFactory *)self suppressLayoutSegments];
  v169 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorKeyBlueKeyBackground"];
  [v8 setBackgroundGradient:v169];

  uint64_t v170 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha50" edges:4 inset:-1.0 weight:1.0];
  [v8 addRenderEffect:v170];

  uint64_t v171 = [(UIKBRenderFactory *)self renderConfig];
  int v172 = [v171 lightKeyboard];

  if (v172)
  {
    CGRect v173 = [v8 symbolStyle];
    [(__CFString *)v173 setTextColor:@"UIKBColorWhite"];
    goto LABEL_135;
  }
LABEL_136:
  v226 = [v107 displayString];
  int64_t v227 = [(UIKBRenderFactory *)self glyphSelectorForDisplayString:v226];

  if (v227)
  {
    v228 = [v8 symbolStyle];
    [v228 setSelector:v227];
  }
  v229 = [v107 secondaryDisplayStrings];
  v280[0] = MEMORY[0x1E4F143A8];
  v280[1] = 3221225472;
  v280[2] = __52__UIKBRenderFactoryiPhone__traitsForKey_onKeyplane___block_invoke;
  v280[3] = &unk_1E52E57D8;
  id v230 = v8;
  id v281 = v230;
  v282 = self;
  [v229 enumerateObjectsUsingBlock:v280];

  long long v278 = 0u;
  long long v279 = 0u;
  long long v276 = 0u;
  long long v277 = 0u;
  v231 = [v107 variantDisplayContents];
  uint64_t v232 = [v231 countByEnumeratingWithState:&v276 objects:v289 count:16];
  if (v232)
  {
    uint64_t v233 = v232;
    uint64_t v234 = *(void *)v277;
    do
    {
      for (uint64_t i = 0; i != v233; ++i)
      {
        if (*(void *)v277 != v234) {
          objc_enumerationMutation(v231);
        }
        v236 = [*(id *)(*((void *)&v276 + 1) + 8 * i) displayString];
        int64_t v237 = [(UIKBRenderFactory *)self glyphSelectorForDisplayString:v236];

        if (v237)
        {
          v238 = [v230 variantTraits];
          v239 = [v238 symbolStyle];
          [v239 setSelector:v237];

          v240 = [v230 highlightedVariantTraits];
          v241 = [v240 symbolStyle];
          [v241 setSelector:v237];
        }
      }
      uint64_t v233 = [v231 countByEnumeratingWithState:&v276 objects:v289 count:16];
    }
    while (v233);
  }

  id v7 = rect_24;
  if ([v6 displayType] == 27 && objc_msgSend(v6, "variantType") == 4)
  {
    v242 = [rect_24 firstCachedKeyWithName:@"International-Key"];
    int v243 = [v242 displayRowHint];

    if ([v6 displayRowHint] == v243) {
      [(UIKBRenderFactory *)self suppressLayoutSegments];
    }
  }
  v244 = [(UIKBRenderFactory *)self renderConfig];
  int v245 = [v244 lightKeyboard];

  double v11 = v270;
  double v29 = (void *)rect_16;
  if (v245)
  {
    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    v246 = [rect_24 subtrees];
    uint64_t v247 = [v246 countByEnumeratingWithState:&v272 objects:v288 count:16];
    if (!v247)
    {
      id v254 = 0;
      goto LABEL_171;
    }
    uint64_t v248 = v247;
    v269 = v6;
    uint64_t v249 = *(void *)v273;
    while (2)
    {
      for (uint64_t j = 0; j != v248; ++j)
      {
        if (*(void *)v273 != v249) {
          objc_enumerationMutation(v246);
        }
        v251 = *(void **)(*((void *)&v272 + 1) + 8 * j);
        v252 = [v251 name];
        char v253 = [v252 _containsSubstring:@"Assist"];

        if (v253)
        {
          id v254 = v251;

          if (v254)
          {
            v255 = [v254 keys];
            id v6 = v269;
            int v256 = [v255 containsObject:v269];

            id v7 = rect_24;
            double v11 = v270;
            if (v256)
            {
              if (([v269 state] & 3) != 0)
              {
                v246 = [(UIKBRenderFactoryiPhone *)self shiftedControlKeyTraits];
                double v29 = (void *)rect_16;
              }
              else
              {
                double v29 = (void *)rect_16;
                if (([v269 state] & 4) == 0) {
                  goto LABEL_172;
                }
                v246 = [(UIKBRenderFactoryiPhone *)self controlKeyTraits];
              }
              [v230 overlayWithTraits:v246];
              goto LABEL_171;
            }
          }
          else
          {
            id v7 = rect_24;
            id v6 = v269;
            double v11 = v270;
          }
          double v29 = (void *)rect_16;
          goto LABEL_172;
        }
      }
      uint64_t v248 = [v246 countByEnumeratingWithState:&v272 objects:v288 count:16];
      if (v248) {
        continue;
      }
      break;
    }
    id v254 = 0;
    id v7 = rect_24;
    id v6 = v269;
    double v11 = v270;
    double v29 = (void *)rect_16;
LABEL_171:

LABEL_172:
  }
  if (((UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) != 0
     || [v6 supportsSupplementalDisplayString])
    && [v6 displayType] == 7)
  {
    if (rect_12)
    {
      uint64_t v257 = 1;
    }
    else if ([(UIKBRenderFactoryiPhone *)self isCustomizedKeyStyle])
    {
      uint64_t v257 = 2;
    }
    else
    {
      uint64_t v257 = 0;
    }
    [(UIKBRenderFactoryiPhone *)self _customizeTraits:v230 forMultiscriptKey:v6 style:v257];
  }
  if ([v6 displayType] == 7)
  {
    v258 = [v6 displayString];
    if ([v258 isEqualToString:@"ㄢ"])
    {
      v259 = [v6 secondaryDisplayStrings];
      v260 = [v259 firstObject];
      int v261 = [v260 isEqualToString:@"ㄦ"];

      double v29 = (void *)rect_16;
      if (v261) {
        [(UIKBRenderFactoryiPhone *)self _customizeTraits:v230 forZhuyinGridDualStringKey:v6];
      }
    }
    else
    {
    }
  }
  id v262 = v230;

  uint64_t v8 = v271;
LABEL_188:

  return v8;
}

void __52__UIKBRenderFactoryiPhone__traitsForKey_onKeyplane___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  int v5 = [*(id *)(a1 + 32) secondarySymbolStyles];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    uint64_t v7 = [*(id *)(a1 + 40) glyphSelectorForDisplayString:v11];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [*(id *)(a1 + 32) secondarySymbolStyles];
      double v10 = [v9 objectAtIndex:a3];

      [v10 setSelector:v8];
    }
  }
}

- (BOOL)isCustomizedKeyStyle
{
  double v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [v2 currentInputMode];
  BOOL v4 = [v3 softwareLayout];

  if ([v4 containsString:@"Thai"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"Korean-With-QWERTY"];
  }

  return v5;
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.29;
}

- (id)controlKeyTraits
{
  id v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v3 setControlOpacities:1];
  BOOL v4 = [(UIKBRenderFactory *)self controlKeyBackgroundColorName];
  char v5 = +[UIKBGradient gradientWithFlatColor:v4];
  [v3 setBackgroundGradient:v5];

  unint64_t v6 = [(UIKBRenderFactory *)self controlKeyForegroundColorName];
  if (v6)
  {
    uint64_t v7 = +[UIKBGradient gradientWithFlatColor:v6];
    [v3 setLayeredForegroundGradient:v7];
  }
  else
  {
    [v3 setLayeredForegroundGradient:0];
  }
  uint64_t v8 = [(UIKBRenderFactory *)self controlKeyShadowColorName];
  id v9 = +[UIKBEdgeEffect effectWithColor:v8 edges:4 inset:-1.0 weight:1.0];
  [v3 addRenderEffect:v9];

  return v3;
}

- (id)activeControlKeyTraits
{
  id v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v3 setControlOpacities:0];
  BOOL v4 = [(UIKBRenderFactory *)self renderConfig];
  if ([v4 lightKeyboard])
  {
    char v5 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  }
  else
  {
    char v5 = @"UIKBColorKeyGrayKeyLightBackground";
  }
  unint64_t v6 = v5;

  uint64_t v7 = +[UIKBGradient gradientWithFlatColor:v6];
  [v3 setBackgroundGradient:v7];

  uint64_t v8 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorClear"];
  [v3 setLayeredForegroundGradient:v8];

  id v9 = [(UIKBRenderFactory *)self controlKeyShadowColorName];
  double v10 = +[UIKBEdgeEffect effectWithColor:v9 edges:4 inset:-1.0 weight:1.0];
  [v3 addRenderEffect:v10];

  return v3;
}

- (id)shiftedControlKeyTraits
{
  id v3 = [(UIKBRenderFactory *)self renderConfig];
  char v4 = [v3 lightKeyboard];

  if (v4)
  {
    char v5 = [(UIKBRenderFactory *)self renderConfig];
    if ([v5 lightKeyboard]) {
      [(UIKBRenderFactoryiPhone *)self activeControlKeyTraits];
    }
    else {
    unint64_t v6 = [(UIKBRenderFactoryiPhone *)self controlKeyTraits];
    }

    uint64_t v7 = [(UIKBRenderFactory *)self renderConfig];
    int v8 = [v7 animatedBackground];

    if (v8)
    {
      [v6 setBlurBlending:1];
      id v9 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha25"];
      [v6 setLayeredForegroundGradient:v9];
    }
    double v10 = [(UIKBRenderFactory *)self renderConfig];
    int v11 = [v10 lightKeyboard];
    double v12 = UIKBColorBlack;
    if (!v11) {
      double v12 = UIKBColorWhite_Alpha20;
    }
    double v13 = *v12;

    double v14 = +[UIKBTextStyle styleWithTextColor:v13];

    [v6 setSymbolStyle:v14];
  }
  else
  {
    unint64_t v6 = [(UIKBRenderFactoryiPhone *)self shiftLockControlKeyTraits];
  }
  return v6;
}

- (id)shiftLockControlKeyTraits
{
  id v3 = [(UIKBRenderFactory *)self renderConfig];
  int v4 = [v3 lightKeyboard];

  if (v4)
  {
    char v5 = [(UIKBRenderFactoryiPhone *)self shiftedControlKeyTraits];
  }
  else
  {
    char v5 = +[UIKBRenderTraits emptyTraits];
    [v5 setControlOpacities:1];
    unint64_t v6 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha80"];
    [v5 setBackgroundGradient:v6];

    uint64_t v7 = [(UIKBRenderFactory *)self renderConfig];
    LODWORD(v6) = [v7 animatedBackground];

    if (v6)
    {
      [v5 setBlurBlending:1];
      int v8 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha75"];
      [v5 setLayeredForegroundGradient:v8];
    }
    id v9 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha45" edges:4 inset:-1.0 weight:1.0];
    [v5 addRenderEffect:v9];
  }
  return v5;
}

- (id)shiftDeleteGlyphTraits
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  int v4 = [(UIKBRenderFactory *)self renderConfig];
  int v5 = [v4 lightKeyboard];

  if (v5)
  {
    unint64_t v6 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorBlack_Alpha10"];
    objc_msgSend(v6, "setTextOffset:", 2.0, 0.0);
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v3 setSecondarySymbolStyles:v7];
  }
  return v3;
}

+ (id)_textOffsetHints
{
  if (qword_1EB261890 != -1) {
    dispatch_once(&qword_1EB261890, &__block_literal_global_688);
  }
  double v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [v2 currentInputMode];
  int v4 = [v3 softwareLayout];

  int v5 = [(id)qword_1EB261898 objectForKeyedSubscript:v4];

  if (!v5)
  {
    if ([v4 containsString:@"Thai"])
    {
      unint64_t v6 = @"TUI-Thai-TextOffsets.plist";
    }
    else if ([v4 isEqualToString:@"Korean-With-QWERTY"])
    {
      unint64_t v6 = @"TUI-Korean-With-QWERTY-TextOffsets.plist";
    }
    else
    {
      unint64_t v6 = 0;
    }
    uint64_t v7 = TextInputUIBundle();
    int v8 = [v7 bundlePath];
    id v9 = [v8 stringByAppendingPathComponent:v6];

    double v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    LODWORD(v8) = [v10 fileExistsAtPath:v9];

    if (v8)
    {
      int v11 = (void *)qword_1EB261898;
      double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v9];
      [v11 setObject:v12 forKey:v4];
    }
  }
  double v13 = [(id)qword_1EB261898 objectForKeyedSubscript:v4];

  return v13;
}

void __43__UIKBRenderFactoryiPhone__textOffsetHints__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB261898;
  qword_1EB261898 = (uint64_t)v0;
}

- ($89C9DF7554150EC42DA90319EED2ADED)customizedOffsetForString:(SEL)a3 isPrimary:(id)a4 isLandscape:(BOOL)a5 withFrame:(BOOL)a6
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v49 = a4;
  double v13 = [(id)objc_opt_class() _textOffsetHints];
  BOOL v45 = v11;
  BOOL v46 = v12;
  if (v12)
  {
    double v14 = @"primaryX";
    BOOL v15 = !v11;
    if (v11)
    {
      double v14 = @"primaryLandscapeX";
      double v16 = @"primaryLandscapeY";
    }
    else
    {
      double v16 = @"primaryY";
    }
    if (v11) {
      int v17 = @"primaryLandscapeDeltaX";
    }
    else {
      int v17 = @"primaryDeltaX";
    }
    if (v11) {
      double v18 = @"primaryLandscapeDeltaY";
    }
    else {
      double v18 = @"primaryDeltaY";
    }
    double v19 = @"primaryFontSize";
    double v20 = @"primaryLandscapeFontSize";
  }
  else
  {
    double v14 = @"secondaryX";
    BOOL v15 = !v11;
    if (v11)
    {
      double v14 = @"secondaryLandscapeX";
      double v16 = @"secondaryLandscapeY";
    }
    else
    {
      double v16 = @"secondaryY";
    }
    if (v11) {
      int v17 = @"secondaryLandscapeDeltaX";
    }
    else {
      int v17 = @"secondaryDeltaX";
    }
    if (v11) {
      double v18 = @"secondaryLandscapeDeltaY";
    }
    else {
      double v18 = @"secondaryDeltaY";
    }
    double v19 = @"secondaryFontSize";
    double v20 = @"secondaryLandscapeFontSize";
  }
  if (v15) {
    double v21 = v19;
  }
  else {
    double v21 = v20;
  }
  int v22 = v14;
  double v23 = v16;
  double v24 = v17;
  int v25 = v18;
  double v47 = v21;
  double v26 = [v13 objectForKeyedSubscript:@"Configuration"];
  double v48 = v22;
  double v27 = [v26 objectForKeyedSubscript:v22];
  [v27 floatValue];
  double v28 = [v13 objectForKeyedSubscript:v49];
  double v29 = [v28 objectForKeyedSubscript:v24];
  [v29 floatValue];

  double v30 = [v13 objectForKeyedSubscript:@"Configuration"];
  int v31 = [v30 objectForKeyedSubscript:v23];
  [v31 floatValue];
  double v32 = [v13 objectForKeyedSubscript:v49];
  double v33 = [v32 objectForKeyedSubscript:v25];
  [v33 floatValue];

  double v34 = v25;
  if (!v46)
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double v35 = CGRectGetWidth(v50);
    if (v45)
    {
      if (v35 < 50.0)
      {
        double v36 = [v13 objectForKeyedSubscript:@"Configuration"];
        double v37 = v36;
        double v38 = @"secondaryLandscapeSmallKeyDeltaX";
LABEL_31:
        CGFloat v39 = [v36 objectForKeyedSubscript:v38];
        [v39 floatValue];
      }
    }
    else if (v35 < 30.0)
    {
      double v36 = [v13 objectForKeyedSubscript:@"Configuration"];
      double v37 = v36;
      double v38 = @"secondarySmallKeyDeltaX";
      goto LABEL_31;
    }
  }
  double v40 = [v13 objectForKeyedSubscript:@"Configuration"];
  CGFloat v41 = [v40 objectForKeyedSubscript:v47];
  [v41 floatValue];

  double v42 = [v13 objectForKeyedSubscript:v49];
  CGFloat v43 = [v42 objectForKeyedSubscript:@"deltaFontSize"];
  [v43 floatValue];

  return result;
}

- (void)setupLayoutSegments
{
  [(UIKBRenderFactoryiPhone *)self _row4ControlSegmentWidthLeft];
  double v4 = v3;
  [(UIKBRenderFactoryiPhone *)self _row4ControlSegmentWidthRight];
  double v6 = 1.0 - v5;
  [(UIKBRenderFactoryiPhone *)self _row4ControlSegmentWidthRight];
  double v8 = v7;
  id v19 = [(UIKBRenderFactoryiPhone *)self controlKeyTraits];
  id v9 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v19];
  [v9 setKeyStates:3];
  [v9 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [v9 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Delete-Key"];
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  [(UIKBRenderFactory *)self addLayoutSegment:v9];
  double v10 = [(UIKBRenderFactoryiPhone *)self shiftDeleteGlyphTraits];
  BOOL v11 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v10];

  [v11 setKeyStates:3];
  [v11 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [v11 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Delete-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v11];
  BOOL v12 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v19];
  [v12 setKeyStates:4];
  objc_msgSend(v12, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 1.0, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v12];
  double v13 = [(UIKBRenderFactoryiPhone *)self shiftedControlKeyTraits];
  double v14 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v13];

  [v14 setKeyStates:100];
  [v14 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v14];
  BOOL v15 = [(UIKBRenderFactoryiPhone *)self shiftLockControlKeyTraits];
  double v16 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v15];

  [v16 setKeyStates:8];
  [v16 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v16];
  int v17 = [(UIKBRenderFactoryiPhone *)self activeControlKeyTraits];
  double v18 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v17];
  [v18 setKeyStates:4];
  [v18 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Delete-Key"];
  objc_msgSend(v18, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v18, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  [(UIKBRenderFactory *)self addLayoutSegment:v18];
}

@end