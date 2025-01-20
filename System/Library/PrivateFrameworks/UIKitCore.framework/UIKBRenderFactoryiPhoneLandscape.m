@interface UIKBRenderFactoryiPhoneLandscape
- (BOOL)isTallPopup;
- (CGPoint)gurmukhiEkOnkarOffset;
- (CGPoint)more123KeyOffset;
- (CGPoint)moreABCKeyOffset;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)stringKeyOffsetBengali;
- (CGPoint)stringKeyOffsetMalayalam;
- (CGPoint)variantAnnotationTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (UIEdgeInsets)dynamicInsets;
- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3;
- (UIEdgeInsets)variantDisplayFrameInsets;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)_row4ControlSegmentWidthLeft;
- (double)dynamicBottomRowMultiplier;
- (double)emojiPopupDividerKeyOffset;
- (double)gurmukhiEkOnkarFontSize;
- (double)moreABCKeyFontSize;
- (double)popupFontSize;
- (double)skinnyKeyThreshold;
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
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6;
@end

@implementation UIKBRenderFactoryiPhoneLandscape

- (UIEdgeInsets)wideShadowPaddleInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v7 wideShadowPaddleInsets];
  }
  else
  {
    double v4 = 6.0;
    double v5 = 22.0;
    double v3 = 18.0;
    double v6 = 6.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v7 variantPaddedFrameInsets];
  }
  else
  {
    double v4 = 0.0;
    double v3 = -3.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantDisplayFrameInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v7 variantDisplayFrameInsets];
  }
  else
  {
    double v4 = 0.0;
    double v5 = 1.0;
    double v3 = 7.0;
    double v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v7 variantSymbolFrameInsets];
  }
  else
  {
    double v4 = 0.0;
    double v5 = -4.5;
    double v3 = 8.0;
    double v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 variantSymbolTextOffset];
  }
  else
  {
    double v4 = 1.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double v4 = 4.0;
  double v5 = 4.0;
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v6 variantAnnotationTextOffset];
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 popupSymbolTextOffset];
  }
  else
  {
    double v4 = -2.5;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)popupFontSize
{
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 42.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  [(UIKBRenderFactoryiPhone *)&v4 popupFontSize];
  return result;
}

- (BOOL)isTallPopup
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    LOBYTE(v3) = [(UIKBRenderFactoryiPhone *)&v5 isTallPopup];
  }
  return v3;
}

- (double)emojiPopupDividerKeyOffset
{
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 0.8;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  [(UIKBRenderFactory *)&v4 emojiPopupDividerKeyOffset];
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 18.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 symbolImageControlKeyFontSize];
  }
  return result;
}

- (double)gurmukhiEkOnkarFontSize
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v4 gurmukhiEkOnkarFontSize];
  }
  else
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyFontSize];
  }
  return result;
}

- (CGPoint)gurmukhiEkOnkarOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 gurmukhiEkOnkarOffset];
  }
  else
  {
    [(UIKBRenderFactoryiPhone *)self stringKeyOffset];
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)stringKeyFontSizeBengali
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 12.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeBengali];
  }
  return result;
}

- (double)stringKeyFontSizeDevanagari
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeDevanagari];
  }
  return result;
}

- (double)stringKeyFontSizeGujarati
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeGujarati];
  }
  return result;
}

- (double)stringKeyFontSizeGurmukhi
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeGurmukhi];
  }
  return result;
}

- (double)stringKeyFontSizeKannada
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 12.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeKannada];
  }
  return result;
}

- (double)stringKeyFontSizeMalayalam
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeMalayalam];
  }
  return result;
}

- (double)stringKeyFontSizeOriya
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeOriya];
  }
  return result;
}

- (double)stringKeyFontSizeTamil
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeTamil];
  }
  return result;
}

- (double)stringKeyFontSizeTelugu
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 12.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyFontSizeTelugu];
  }
  return result;
}

- (CGPoint)stringKeyOffsetBengali
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyOffsetBengali];
  }
  else
  {
    double v4 = -1.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)stringKeyOffsetMalayalam
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 stringKeyOffsetMalayalam];
  }
  else
  {
    double v4 = -1.0;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (UIEdgeInsets)dynamicInsets
{
  if ([(UIKBRenderFactory *)self dynamicFactory]) {
    double v2 = 12.0;
  }
  else {
    double v2 = 4.0;
  }
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  return 0.1;
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
    [(UIKBRenderFactoryiPhoneLandscape *)self dynamicInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)_row4ControlSegmentWidthLeft
{
  [(UIKBRenderFactory *)self scale];
  return dbl_186B99AF0[v2 > 2.0];
}

- (double)moreABCKeyFontSize
{
  BOOL v3 = [(UIKBRenderFactory *)self dynamicFactory];
  double result = 15.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 moreABCKeyFontSize];
  }
  return result;
}

- (CGPoint)more123KeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 more123KeyOffset];
  }
  else
  {
    double v4 = 0.5;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    [(UIKBRenderFactoryiPhone *)&v5 moreABCKeyOffset];
  }
  else
  {
    double v4 = 0.5;
    double v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
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
  if (![(UIKBRenderFactory *)self dynamicFactory]) {
    return 60.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  [(UIKBRenderFactoryiPhone *)&v4 skinnyKeyThreshold];
  return result;
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  id v10 = a3;
  if ([(UIKBRenderFactory *)self dynamicFactory])
  {
    v17.receiver = self;
    v17.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    v11 = [(UIKBRenderFactoryiPhone *)&v17 variantGeometriesForGeometry:v10 variantCount:a4 rowLimit:a5 annotationIndex:a6];
  }
  else
  {
    v12 = (void *)[v10 copy];

    [v12 paddedFrame];
    objc_msgSend(v12, "setPaddedFrame:", v13 + -0.5, v15 + 0.0, v14 + 1.0);
    v11 = [v12 iPhoneVariantGeometries:a4 annotationIndex:a6];
  }
  return v11;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  BOOL v8 = [(UIKBRenderFactoryiPhone *)&v34 _traitsForKey:v6 onKeyplane:v7];
  if (![(UIKBRenderFactory *)self dynamicFactory])
  {
    if (![(UIKBRenderFactoryiPhone *)self _popupStyleForKey:v6]
      && ![v6 displayType])
    {
      double v9 = [v6 name];
      int v10 = [v9 hasPrefix:@"Burmese-"];

      if (v10)
      {
        v11 = [v8 symbolStyle];
        [v11 fontSize];
        double v13 = round(v12 * 0.9);
        double v14 = [v8 symbolStyle];
        [v14 setFontSize:v13];
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v15 = [v7 subtrees];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v28 = v8;
      id v29 = v7;
      uint64_t v18 = *(void *)v31;
LABEL_8:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v30 + 1) + 8 * v19);
        v21 = objc_msgSend(v20, "name", v28, v29);
        char v22 = [v21 _containsSubstring:@"Assist"];

        if (v22) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v17) {
            goto LABEL_8;
          }
          id v23 = 0;
          BOOL v8 = v28;
          id v7 = v29;
          goto LABEL_24;
        }
      }
      id v23 = v20;

      if (!v23)
      {
        BOOL v8 = v28;
        id v7 = v29;
        goto LABEL_25;
      }
      v24 = [v23 keys];
      int v25 = [v24 containsObject:v6];

      BOOL v8 = v28;
      id v7 = v29;
      if (!v25) {
        goto LABEL_25;
      }
      if (([v6 state] & 3) != 0)
      {
        uint64_t v26 = [(UIKBRenderFactoryiPhone *)self controlKeyTraits];
      }
      else
      {
        if (([v6 state] & 4) == 0) {
          goto LABEL_25;
        }
        uint64_t v26 = [(UIKBRenderFactoryiPhone *)self activeControlKeyTraits];
      }
      double v15 = (void *)v26;
      [v28 overlayWithTraits:v26];
    }
    else
    {
      id v23 = 0;
    }
LABEL_24:

LABEL_25:
  }

  return v8;
}

@end