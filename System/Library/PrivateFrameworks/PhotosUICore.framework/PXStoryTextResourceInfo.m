@interface PXStoryTextResourceInfo
+ (BOOL)titleShouldBeUppercasedForStylePairing:(int64_t)a3 kind:(unint64_t)a4;
+ (NSCache)subtitleCachedCharacterSetByKind;
+ (NSCache)titleCachedCharacterSetByStyleAndKind;
+ (id)_allowedSubtitleCharacterSetWithKind:(unint64_t)a3;
+ (id)_allowedTitleCharacterSetWithStylePairing:(int64_t)a3 kind:(unint64_t)a4;
+ (id)_rangesAndStylesForTitle:(id)a3;
+ (id)_subtitleFontCacheKeyForKind:(unint64_t)a3;
+ (id)_subtitleFontForKind:(unint64_t)a3 scale:(double)a4 hasExtendedCharacterSet:(BOOL)a5 internationalStyle:(int64_t)a6;
+ (id)_titleFontCacheKeyForStylePairing:(int64_t)a3 kind:(unint64_t)a4;
+ (id)_titleFontForStylePairing:(int64_t)a3 scale:(double)a4 kind:(unint64_t)a5 internationalStyle:(int64_t)a6;
+ (id)_titlePrimaryAttributesForStylePairing:(int64_t)a3 scale:(double)a4 kind:(unint64_t)a5 layoutScheme:(int64_t)a6 allowHyphenation:(BOOL)a7 internationalStyle:(int64_t)a8;
+ (id)subtitleAttributesForSize:(CGSize)a3 string:(id)a4 scale:(double)a5 kind:(unint64_t)a6 extendedTraitCollectionSnapshot:(id)a7 internationalStyle:(int64_t)a8;
+ (id)titleFontDescriptorForStylePairing:(int64_t)a3 kind:(unint64_t)a4;
+ (int64_t)stylePairingFromTitleCategory:(id)a3 string:(id)a4 kind:(unint64_t)a5 layoutScheme:(int64_t)a6;
+ (void)_increaseMaximumLineHeightToAvoidOverlapForLines:(id)a3 attributes:(id)a4 attributedString:(id *)a5;
+ (void)_setKashidaToParagraphStyle:(id)a3;
- (BOOL)_isKashidaText:(id)a3;
- (BOOL)_isUserInterfaceIdiomPadOrMacOrTV:(id)a3;
- (BOOL)_isVerticalText:(id)a3;
- (BOOL)hasForcedPositioning;
- (BOOL)isEqual:(id)a3;
- (CGPoint)_subtitlePositionInFrame:(CGRect)a3 titleCategory:(id)a4 displayAsset:(id)a5 currentAssetCropRect:(CGRect)a6 kind:(unint64_t)a7 relativeTo:(id)a8 extendedTraitCollectionSnapshot:(id)a9 fixedBottomPadding:(double)a10 isTitleVertical:(BOOL)a11 isSubtitleVertical:(BOOL)a12;
- (CGPoint)bestPositionInFrame:(CGRect)a3 occlusionSize:(CGSize)a4 possiblePositions:(id)a5 displayAsset:(id)a6 currentAssetCropRect:(CGRect)a7 layoutOrientation:(int64_t)a8 desiredInternationalStyle:(int64_t)a9;
- (CGPoint)origin;
- (CGRect)attributedStringFrameInRect:(CGRect)a3 titleCategory:(id)a4 displayAsset:(id)a5 currentAssetCropRect:(CGRect)a6 kind:(unint64_t)a7 relativeTo:(id)a8 extendedTraitCollectionSnapshot:(id)a9 fixedBottomPadding:(double)a10;
- (CGSize)_availableSizeForRect:(CGRect)a3 extendedTraitCollectionSnapshot:(id)a4 kind:(unint64_t)a5 fixedBottomPadding:(double)a6;
- (CGSize)_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:(id)a3 fixedBottomPadding:(double)a4;
- (CGSize)_occlusionSizeForSize:(CGSize)a3 kind:(unint64_t)a4 size:(CGSize)a5 containerRect:(CGRect)a6 stylePairing:(int64_t)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9 isVerticalText:(BOOL)a10 isKashida:(BOOL)a11;
- (CGSize)boundingSize;
- (NSAttributedString)attributedString;
- (NSString)assetCollectionUUID;
- (NSString)associatedSubtitleString;
- (NSString)string;
- (NSStringDrawingContext)drawingContext;
- (PXStoryTextResourceInfo)initWithString:(id)a3 associatedSubtitleString:(id)a4 type:(int64_t)a5 layoutScheme:(int64_t)a6 assetCollectionUUID:(id)a7;
- (double)_paddingBottomForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5 fixedBottomPadding:(double)a6;
- (double)_paddingBottomScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4;
- (double)_paddingLeadingMinimumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4;
- (double)_paddingLeftOrRightAlignmentLeadingForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5;
- (double)_paddingLeftOrRightAlignmentLeadingScaleForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4;
- (double)_paddingTopForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5;
- (double)_paddingTopScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4;
- (double)_sizeWidthMaximumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4;
- (double)_sizeWidthMinimumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4;
- (double)_sizeWidthScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4;
- (double)_subtitleLineSpacingForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6 isVerticalText:(BOOL)a7;
- (double)_subtitleScalingFactorForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6;
- (double)_titleScalingFactorForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6;
- (double)boundingRectPadding;
- (id)_possibleTitlePositionsForRect:(CGRect)a3 boudingSize:(CGSize)a4 occlusionSize:(CGSize)a5 kind:(unint64_t)a6 extendedTraitCollectionSnapshot:(id)a7 fixedBottomPadding:(double)a8 isTitleVertical:(BOOL)a9 isSubtitleVertical:(BOOL)a10 isKashida:(BOOL)a11;
- (id)attributedStringBoundingSizeForSubtitle:(id)a3 size:(CGSize)a4 containerRect:(CGRect)a5 kind:(unint64_t)a6 relativeTo:(id)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9 desiredInternationalStyle:(int64_t)a10;
- (id)attributedStringBoundingSizeForTitle:(id)a3 stylePairing:(int64_t)a4 availableSize:(CGSize)a5 containerRect:(CGRect)a6 kind:(unint64_t)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9;
- (int64_t)_fullScreenTitlePositionWithTitleCategory:(id)a3 displayAsset:(id)a4 currentAssetCropRect:(CGRect)a5 relativeTo:(id)a6 extendedTraitCollectionSnapshot:(id)a7 fixedBottomPadding:(double)a8 desiredInternationalStyle:(int64_t)a9;
- (int64_t)drawingOptions;
- (int64_t)effectivePositionIndex;
- (int64_t)forcedPositionIndex;
- (int64_t)layoutScheme;
- (int64_t)textAlignment;
- (int64_t)type;
- (int64_t)verticalAlignment;
- (void)_checkForForcedPositioning:(id *)a3;
- (void)setEffectivePositionIndex:(int64_t)a3;
- (void)setForcedPositionIndex:(int64_t)a3;
- (void)setHasForcedPositioning:(BOOL)a3;
@end

@implementation PXStoryTextResourceInfo

+ (BOOL)titleShouldBeUppercasedForStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4 == 64;
}

+ (id)titleFontDescriptorForStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  if (a4 != 64)
  {
    switch(a3)
    {
      case 0:
        uint64_t v27 = *MEMORY[0x1E4FB0950];
        v25[0] = *MEMORY[0x1E4FB09F0];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
        v25[1] = *MEMORY[0x1E4FB0998];
        v26[0] = v4;
        v26[1] = *MEMORY[0x1E4FB0928];
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
        v28 = v5;
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = &v28;
        v13 = &v27;
        goto LABEL_15;
      case 1:
        uint64_t v51 = *MEMORY[0x1E4FB0950];
        v49[0] = *MEMORY[0x1E4FB0A10];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24700]];
        v50[0] = v4;
        v49[1] = *MEMORY[0x1E4FB09F0];
        v5 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
        v49[2] = *MEMORY[0x1E4FB0998];
        uint64_t v16 = *MEMORY[0x1E4FB0928];
        v50[1] = v5;
        v50[2] = v16;
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
        v52 = v7;
        v8 = (void *)MEMORY[0x1E4F1C9E8];
        v9 = &v52;
        v10 = &v51;
        goto LABEL_7;
      case 2:
        uint64_t v47 = *MEMORY[0x1E4FB0950];
        v45[0] = *MEMORY[0x1E4FB0A10];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24710]];
        v46[0] = v4;
        v45[1] = *MEMORY[0x1E4FB09F0];
        v5 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
        v45[2] = *MEMORY[0x1E4FB0998];
        uint64_t v17 = *MEMORY[0x1E4FB0928];
        v46[1] = v5;
        v46[2] = v17;
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
        v48 = v7;
        v8 = (void *)MEMORY[0x1E4F1C9E8];
        v9 = &v48;
        v10 = &v47;
        goto LABEL_7;
      case 3:
        uint64_t v43 = *MEMORY[0x1E4FB0950];
        v41[0] = *MEMORY[0x1E4FB09F0];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09C0]];
        v41[1] = *MEMORY[0x1E4FB0998];
        v42[0] = v4;
        v42[1] = *MEMORY[0x1E4FB0940];
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
        v44 = v5;
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = &v44;
        v13 = &v43;
        goto LABEL_15;
      case 4:
        uint64_t v39 = *MEMORY[0x1E4FB0950];
        v37[0] = *MEMORY[0x1E4FB09F0];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09A8]];
        v37[1] = *MEMORY[0x1E4FB0998];
        v38[0] = v4;
        v38[1] = *MEMORY[0x1E4FB0938];
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        v40 = v5;
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = &v40;
        v13 = &v39;
        goto LABEL_15;
      case 5:
        uint64_t v35 = *MEMORY[0x1E4FB0950];
        v33[0] = *MEMORY[0x1E4FB09F0];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09C0]];
        v33[1] = *MEMORY[0x1E4FB0998];
        v34[0] = v4;
        v34[1] = *MEMORY[0x1E4FB0930];
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
        v36 = v5;
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = &v36;
        v13 = &v35;
        goto LABEL_15;
      case 6:
        uint64_t v31 = *MEMORY[0x1E4FB0950];
        v29[0] = *MEMORY[0x1E4FB09F0];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09A8]];
        v29[1] = *MEMORY[0x1E4FB0998];
        v30[0] = v4;
        v30[1] = *MEMORY[0x1E4FB0940];
        v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
        v32 = v5;
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = &v32;
        v13 = &v31;
LABEL_15:
        v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
        goto LABEL_16;
      case 7:
        uint64_t v23 = *MEMORY[0x1E4FB0950];
        v21[0] = *MEMORY[0x1E4FB0A10];
        v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4F246E8]];
        v22[0] = v4;
        v21[1] = *MEMORY[0x1E4FB09F0];
        v5 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
        v21[2] = *MEMORY[0x1E4FB0998];
        uint64_t v20 = *MEMORY[0x1E4FB0928];
        v22[1] = v5;
        v22[2] = v20;
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
        v24 = v7;
        v8 = (void *)MEMORY[0x1E4F1C9E8];
        v9 = &v24;
        v10 = &v23;
        goto LABEL_7;
      default:
        v15 = 0;
        goto LABEL_17;
    }
  }
  if (a3 == 7)
  {
    uint64_t v59 = *MEMORY[0x1E4FB0950];
    v57[0] = *MEMORY[0x1E4FB0A10];
    v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4F246E8]];
    v58[0] = v4;
    v57[1] = *MEMORY[0x1E4FB09F0];
    v5 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
    v57[2] = *MEMORY[0x1E4FB0998];
    uint64_t v6 = *MEMORY[0x1E4FB0928];
    v58[1] = v5;
    v58[2] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
    v60[0] = v7;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = (void **)v60;
    v10 = &v59;
  }
  else
  {
    uint64_t v55 = *MEMORY[0x1E4FB0950];
    v53[0] = *MEMORY[0x1E4FB0A10];
    v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24700]];
    v54[0] = v4;
    v53[1] = *MEMORY[0x1E4FB09F0];
    v5 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
    v53[2] = *MEMORY[0x1E4FB0998];
    uint64_t v14 = *MEMORY[0x1E4FB0928];
    v54[1] = v5;
    v54[2] = v14;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
    v56 = v7;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = &v56;
    v10 = &v55;
  }
LABEL_7:
  v15 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];

LABEL_16:
LABEL_17:
  v18 = [MEMORY[0x1E4FB08E8] fontDescriptorWithFontAttributes:v15];

  return v18;
}

+ (NSCache)titleCachedCharacterSetByStyleAndKind
{
  if (titleCachedCharacterSetByStyleAndKind_onceToken != -1) {
    dispatch_once(&titleCachedCharacterSetByStyleAndKind_onceToken, &__block_literal_global_107244);
  }
  v2 = (void *)titleCachedCharacterSetByStyleAndKind_instance;
  return (NSCache *)v2;
}

+ (int64_t)stylePairingFromTitleCategory:(id)a3 string:(id)a4 kind:(unint64_t)a5 layoutScheme:(int64_t)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ((unint64_t)a6 > 1)
  {
    uint64_t v11 = 0;
  }
  else if ([v9 isEqual:*MEMORY[0x1E4F8D2D0]])
  {
    uint64_t v11 = 1;
  }
  else if ([v9 isEqual:*MEMORY[0x1E4F8D2B8]])
  {
    uint64_t v11 = 2;
  }
  else if ([v9 isEqual:*MEMORY[0x1E4F8D2B0]])
  {
    uint64_t v11 = 3;
  }
  else if ([v9 isEqual:*MEMORY[0x1E4F8D2C8]])
  {
    uint64_t v11 = 4;
  }
  else if ([v9 isEqual:*MEMORY[0x1E4F8D2C0]])
  {
    uint64_t v11 = 5;
  }
  else if ([v9 isEqual:*MEMORY[0x1E4F8D2D8]])
  {
    uint64_t v11 = 6;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [(id)objc_opt_class() _allowedTitleCharacterSetWithStylePairing:v11 kind:a5];
  v13 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v10];
  int v14 = [v12 isSupersetOfSet:v13];

  if (v14) {
    int64_t v15 = v11;
  }
  else {
    int64_t v15 = 7;
  }
  uint64_t v16 = PLStoryGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218754;
    int64_t v19 = v15;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2048;
    int64_t v23 = a6;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "stylePairing: %ti for titleCategory: %@, layoutScheme: %ti, string: %@", (uint8_t *)&v18, 0x2Au);
  }

  return v15;
}

+ (id)_titleFontForStylePairing:(int64_t)a3 scale:(double)a4 kind:(unint64_t)a5 internationalStyle:(int64_t)a6
{
  if (a5 == 64)
  {
    double v6 = 20.0;
LABEL_3:
    double v7 = a4 * v6;
LABEL_18:
    int v14 = [(id)objc_opt_class() titleFontDescriptorForStylePairing:a3 kind:a5];
    int64_t v15 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v14 size:v7];
  }
  else
  {
    double v8 = 28.0;
    double v9 = 45.0;
    switch(a3)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_17;
      case 2:
        double v9 = 29.0;
        goto LABEL_17;
      case 3:
        double v9 = 28.0;
        goto LABEL_17;
      case 4:
        double v9 = 37.0;
        goto LABEL_17;
      case 5:
        *(double *)&uint64_t v13 = 32.0;
        goto LABEL_16;
      case 6:
        *(double *)&uint64_t v13 = 36.0;
LABEL_16:
        double v9 = *(double *)&v13;
LABEL_17:
        double v7 = v9 * a4;
        goto LABEL_18;
      case 7:
        double v8 = 38.0;
LABEL_9:
        double v10 = v8 * a4;
        if (a6)
        {
          if (a6 == 1)
          {
            v12 = (double *)MEMORY[0x1E4FB09E0];
          }
          else
          {
            double v11 = 0.0;
            if (a6 != 2) {
              goto LABEL_25;
            }
            v12 = (double *)MEMORY[0x1E4FB09D8];
          }
        }
        else
        {
          v12 = (double *)MEMORY[0x1E4FB09B8];
        }
        double v11 = *v12;
LABEL_25:
        int64_t v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v10 weight:v11];
        break;
      default:
        double v6 = 0.0;
        goto LABEL_3;
    }
  }
  return v15;
}

+ (id)_allowedTitleCharacterSetWithStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v7 = objc_msgSend(a1, "_titleFontCacheKeyForStylePairing:kind:");
  double v8 = [a1 titleCachedCharacterSetByStyleAndKind];
  double v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    double v10 = [a1 _titleFontForStylePairing:a3 scale:a4 kind:0 internationalStyle:1.0];
    double v11 = [v10 fontDescriptor];
    v12 = [v11 fontAttributes];
    double v9 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB08F8]];

    if (!v9)
    {
      double v9 = CTFontCopyCharacterSet((CTFontRef)v10);
      if (!v9)
      {
        uint64_t v13 = PLStoryGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 67109376;
          v16[1] = a3;
          __int16 v17 = 1024;
          int v18 = a4;
          _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "font missing NSCharacterSet mapping for stylePairing: %d, kind: %d", (uint8_t *)v16, 0xEu);
        }

        double v9 = [MEMORY[0x1E4F28B88] letterCharacterSet];
      }
    }
    int v14 = [a1 titleCachedCharacterSetByStyleAndKind];
    [v14 setObject:v9 forKey:v7];
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionUUID, 0);
  objc_storeStrong((id *)&self->_associatedSubtitleString, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_lock_drawingContext, 0);
  objc_storeStrong((id *)&self->_lock_attributedString, 0);
}

- (void)setForcedPositionIndex:(int64_t)a3
{
  self->_forcedPositionIndex = a3;
}

- (int64_t)forcedPositionIndex
{
  return self->_forcedPositionIndex;
}

- (void)setHasForcedPositioning:(BOOL)a3
{
  self->_hasForcedPositioning = a3;
}

- (BOOL)hasForcedPositioning
{
  return self->_hasForcedPositioning;
}

- (NSString)assetCollectionUUID
{
  return self->_assetCollectionUUID;
}

- (NSString)associatedSubtitleString
{
  return self->_associatedSubtitleString;
}

- (NSString)string
{
  return self->_string;
}

- (int64_t)layoutScheme
{
  return self->_layoutScheme;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setEffectivePositionIndex:(int64_t)a3
{
  self->_lock_effectivePositionIndex = a3;
}

- (BOOL)_isUserInterfaceIdiomPadOrMacOrTV:(id)a3
{
  uint64_t v3 = [a3 userInterfaceIdiom];
  return v3 == 4 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (CGPoint)bestPositionInFrame:(CGRect)a3 occlusionSize:(CGSize)a4 possiblePositions:(id)a5 displayAsset:(id)a6 currentAssetCropRect:(CGRect)a7 layoutOrientation:(int64_t)a8 desiredInternationalStyle:(int64_t)a9
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v37 = a6;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__107099;
  uint64_t v55 = __Block_byref_object_dispose__107100;
  id v56 = v13;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  void v49[3] = __Block_byref_object_copy__107099;
  v49[4] = __Block_byref_object_dispose__107100;
  id v50 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke;
  aBlock[3] = &unk_1E5DBA578;
  v46 = &v51;
  id v34 = v56;
  id v44 = v34;
  v45 = self;
  uint64_t v47 = v49;
  SEL v48 = a2;
  v33 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (a9)
  {
    if (a9 == 2)
    {
      v33[2](v33, &unk_1F02D4300);
      uint64_t v14 = 0;
    }
    else if (a9 == 1)
    {
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    v33[2](v33, &unk_1F02D4360);
    uint64_t v14 = 2;
  }
  int64_t v15 = [v34 objectAtIndexedSubscript:v14];
  [v15 pointValue];
  v35.double x = v16;
  v35.double y = v17;

  int v18 = +[PXStorySettings sharedInstance];
  [v18 titleFarthestDistanceThreshold];
  v32 = v18;
  int v19 = [v18 enableTitlePositioningLogs];
  if (v19)
  {
    __int16 v20 = [(PXStoryTextResourceInfo *)self string];
    NSLog(&cfstr_MemoriesTitles.isa, v20, v34);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)v52[5];
  uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v57 count:16];
  if (v21)
  {
    double v22 = *MEMORY[0x1E4F1DAD8];
    double v38 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) pointValue];
        if (v26 != v22 || v25 != v38) {
          PXRectNormalize();
        }
      }
      uint64_t v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v57, 16, v38);
    }
    while (v21);
  }

  if (v19)
  {
    v28 = [(PXStoryTextResourceInfo *)self string];
    v29 = NSStringFromPoint(v35);
    NSLog(&cfstr_MemoriesTitles_2.isa, v28, v29);
  }
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
  double y = v35.y;
  double x = v35.x;
  result.double y = y;
  result.double x = x;
  return result;
}

void __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PXFlatMap();
}

uint64_t __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 objectAtIndexedSubscript:v3];
}

void __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "integerValue"));
        if (!v10)
        {
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PXStoryTextResourceInfo.m", 1722, @"Invalid parameter not satisfying: %@", @"positionValue != nil" object file lineNumber description];
        }
        double v11 = [NSNumber numberWithUnsignedInteger:a3];
        [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

id __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_2(int a1, id a2)
{
  return a2;
}

- (CGPoint)_subtitlePositionInFrame:(CGRect)a3 titleCategory:(id)a4 displayAsset:(id)a5 currentAssetCropRect:(CGRect)a6 kind:(unint64_t)a7 relativeTo:(id)a8 extendedTraitCollectionSnapshot:(id)a9 fixedBottomPadding:(double)a10 isTitleVertical:(BOOL)a11 isSubtitleVertical:(BOOL)a12
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a8;
  id v20 = a9;
  [v20 layoutOrientation];
  if (!v19) {
    PXRectGetCenter();
  }
  -[PXStoryTextResourceInfo _availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:](self, "_availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:", v20, a7, x, y, width, height, a10);
  -[PXStoryTextResourceInfo _subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:](self, "_subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:", a7, v20, a12);
  double v22 = v21;
  [v19 origin];
  double v24 = v23;
  double v26 = v25;
  [v19 boundingSize];
  double v28 = v27;
  CGFloat v30 = v29;
  uint64_t v31 = [v19 drawingContext];
  [v31 baselineOffset];
  double v33 = v32;

  id v34 = [(PXStoryTextResourceInfo *)self drawingContext];
  [v34 baselineOffset];
  double v36 = v35;

  if (a12)
  {
    CGFloat rect = v28;
    double v37 = ceil(width * 0.0032);
    if ([v19 textAlignment])
    {
      uint64_t v38 = [v19 textAlignment];
      [v19 boundingSize];
      double v40 = v39;
      [(PXStoryTextResourceInfo *)self boundingSize];
      double v42 = v26 + v40 * 0.5 + v41 * -0.5;
      double v43 = v26 + v40 - v41 - v37;
      if (v38 == 2) {
        double v44 = v43;
      }
      else {
        double v44 = v42;
      }
    }
    else
    {
      double v44 = v37 + v26;
    }
    if ((unint64_t)([v19 effectivePositionIndex] - 6) > 2)
    {
      double v24 = v22 + v24 + v33 - v36;
    }
    else
    {
      v58.origin.double x = v24;
      v58.origin.double y = v26;
      v58.size.double width = rect;
      v58.size.double height = v30;
      double v49 = v22 + v24 + v33 - v36 - CGRectGetMaxX(v58);
      [(PXStoryTextResourceInfo *)self boundingSize];
      double v24 = v24 - v50 - v49;
    }
  }
  else
  {
    double v44 = v22 + v26 + v33 - v36;
    unint64_t v45 = [v19 effectivePositionIndex];
    if (v45 > 8)
    {
      double v24 = 0.0;
    }
    else if (((1 << v45) & 7) != 0)
    {
      [v19 boundingSize];
      double v52 = v24 + v51 * 0.5;
      [(PXStoryTextResourceInfo *)self boundingSize];
      double v24 = v52 + v53 * -0.5;
    }
    else if (((1 << v45) & 0x38) == 0)
    {
      [v19 boundingSize];
      double v47 = v24 + v46;
      [(PXStoryTextResourceInfo *)self boundingSize];
      double v24 = v47 - v48;
    }
  }

  double v54 = v24;
  double v55 = v44;
  result.double y = v55;
  result.double x = v54;
  return result;
}

- (id)attributedStringBoundingSizeForSubtitle:(id)a3 size:(CGSize)a4 containerRect:(CGRect)a5 kind:(unint64_t)a6 relativeTo:(id)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9 desiredInternationalStyle:(int64_t)a10
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v19 = a4.height;
  double v20 = a4.width;
  id v22 = a3;
  id v23 = a7;
  id v24 = a8;
  double v25 = [v22 localizedUppercaseString];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __179__PXStoryTextResourceInfo_attributedStringBoundingSizeForSubtitle_size_containerRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding_desiredInternationalStyle___block_invoke;
  aBlock[3] = &unk_1E5DBA508;
  double v78 = v20;
  double v79 = v19;
  void aBlock[4] = self;
  unint64_t v80 = a6;
  id v26 = v24;
  id v74 = v26;
  CGFloat v81 = x;
  CGFloat v82 = y;
  CGFloat v83 = width;
  CGFloat v84 = height;
  id v67 = v23;
  id v75 = v67;
  id v27 = v22;
  id v76 = v27;
  id v28 = v25;
  id v77 = v28;
  double v29 = (void (**)(void *, id *, id, void, double, double))_Block_copy(aBlock);
  CGFloat v30 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v28];
  v68 = v26;
  -[PXStoryTextResourceInfo _subtitleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_subtitleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", a6, v26, v20, v19, a9);
  double v32 = v31;
  id v33 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  id v34 = +[PXStorySettings sharedInstance];
  [v34 subtitleMinimumScale];
  objc_msgSend(v33, "setMinimumScaleFactor:");

  [v33 setWrapsForTruncationMode:1];
  [v33 setWantsBaselineOffset:1];
  [v33 setMaximumNumberOfLines:1];
  double v35 = [(PXStoryTextResourceInfo *)self assetCollectionUUID];
  uint64_t v36 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v27, v35);

  if (v36 == a10) {
    int64_t v37 = a10;
  }
  else {
    int64_t v37 = 0;
  }
  if (v37 == 2)
  {
    id v70 = v30;
    uint64_t v38 = v29[2](v29, &v70, v33, 0, v32, 0.0);
    id v39 = v70;

    [v38 totalBounds];
    v41.n128_f64[0] = ceil(v40);
    id v69 = v39;
    double v42 = &v69;
    v43.n128_f64[0] = v32;
    ((void (*)(void (**)(void *, id *, id, void, double, double), id *, void *, uint64_t, __n128, __n128))v29[2])(v29, &v69, v38, 2, v43, v41);
  }
  else
  {
    id v72 = v30;
    uint64_t v38 = v29[2](v29, &v72, v33, v37, v32, 0.0);
    id v39 = v72;

    [v38 actualScaleFactor];
    v45.n128_f32[0] = v45.n128_f64[0] * 10.0;
    v45.n128_f32[0] = floorf(v45.n128_f32[0]) / 10.0;
    if (v45.n128_f32[0] == 1.0) {
      goto LABEL_9;
    }
    v45.n128_f64[0] = v32 * v45.n128_f32[0];
    id v71 = v39;
    double v42 = &v71;
    v44.n128_u64[0] = 0;
    ((void (*)(void (**)(void *, id *, id, void, double, double), id *, void *, int64_t, __n128, __n128))v29[2])(v29, &v71, v38, v37, v45, v44);
  uint64_t v46 = };
  id v47 = *v42;

  uint64_t v38 = (void *)v46;
  id v39 = v47;
LABEL_9:
  [v38 totalBounds];
  double v49 = ceil(v48);
  double v51 = ceil(v50);
  double v52 = v49 + 40.0;
  double v53 = v51 + 40.0;
  if (v37 == 1)
  {
    if ([v39 length])
    {
      double v54 = [v39 attributesAtIndex:0 effectiveRange:0];
      double v55 = (void *)[v54 mutableCopy];
    }
    else
    {
      double v55 = 0;
    }
    [v55 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FB0810]];
    objc_msgSend(v39, "setAttributes:range:", v55, 0, objc_msgSend(v39, "length"));

    double v56 = v52;
  }
  else
  {
    double v56 = v51 + 40.0;
    double v53 = v49 + 40.0;
  }
  v57 = [v27 uppercaseString];
  CGRect v58 = [(PXStoryTextResourceInfo *)self string];
  uint64_t v59 = [v58 uppercaseString];
  int v60 = [v57 isEqualToString:v59];

  if (v60)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_drawingContext, v38);
    v61 = (NSAttributedString *)[v39 copy];
    lock_attributedString = self->_lock_attributedString;
    self->_lock_attributedString = v61;

    self->_lock_boundingSize.CGFloat width = v53;
    self->_lock_boundingSize.CGFloat height = v56;
    os_unfair_lock_unlock(&self->_lock);
  }
  id v63 = objc_alloc((Class)off_1E5DA9668);
  v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v53, v56);
  v65 = (void *)[v63 initWithFirst:v39 second:v64];

  return v65;
}

id __179__PXStoryTextResourceInfo_attributedStringBoundingSizeForSubtitle_size_containerRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding_desiredInternationalStyle___block_invoke(uint64_t a1, id *a2, void *a3, uint64_t a4, double a5, double a6)
{
  id v11 = a3;
  double v13 = *(double *)(a1 + 72);
  double v12 = *(double *)(a1 + 80);
  if (a4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", *(void *)(a1 + 88), *(void *)(a1 + 40), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
    double v15 = fmin(v13, (*(double *)(a1 + 112) + v14 * -2.0) * 0.5);
    [*(id *)(a1 + 48) boundingSize];
    double v17 = v16 + -40.0;
    uint64_t v18 = [off_1E5DA6F98 defaultSpecs];
    [v18 maximumWidthForSubtitle:*(void *)(a1 + 56) titleWidth:v17];
    double v13 = fmax(fmin(v15, v19), a6);
  }
  id v20 = *a2;
  double v21 = +[PXStoryTextResourceInfo subtitleAttributesForSize:string:scale:kind:extendedTraitCollectionSnapshot:internationalStyle:](PXStoryTextResourceInfo, "subtitleAttributesForSize:string:scale:kind:extendedTraitCollectionSnapshot:internationalStyle:", *(void *)(a1 + 64), *(void *)(a1 + 88), *(void *)(a1 + 40), a4, v13, v12, a5);
  objc_msgSend(v20, "setAttributes:range:", v21, 0, objc_msgSend(*(id *)(a1 + 64), "length"));

  objc_msgSend(*a2, "boundingRectWithSize:options:context:", objc_msgSend(*(id *)(a1 + 32), "drawingOptions"), v11, v13, v12);
  return v11;
}

- (id)attributedStringBoundingSizeForTitle:(id)a3 stylePairing:(int64_t)a4 availableSize:(CGSize)a5 containerRect:(CGRect)a6 kind:(unint64_t)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v16 = a5.height;
  double v17 = a5.width;
  double v20 = a5.height;
  id v21 = a3;
  id v22 = a8;
  v88 = v21;
  double v85 = x;
  if ([(id)objc_opt_class() titleShouldBeUppercasedForStylePairing:a4 kind:a7])
  {
    id v23 = [v21 localizedUppercaseString];
  }
  else
  {
    id v23 = v21;
  }
  id v24 = v23;
  double v25 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v23];
  -[PXStoryTextResourceInfo _titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", a7, v22, v17, v20, a9);
  double v27 = v26;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  uint64_t v103 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __161__PXStoryTextResourceInfo_attributedStringBoundingSizeForTitle_stylePairing_availableSize_containerRect_kind_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke;
  aBlock[3] = &unk_1E5DBA4E0;
  id v86 = v24;
  id v93 = v86;
  v94 = self;
  int64_t v96 = a4;
  unint64_t v97 = a7;
  double v98 = v17;
  double v99 = v20;
  v95 = &v100;
  id v28 = _Block_copy(aBlock);
  id v29 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  CGFloat v30 = +[PXStorySettings sharedInstance];
  [v30 titleMinimumScale];
  double v32 = v31;

  [v29 setMinimumScaleFactor:v32];
  [v29 setWrapsForTruncationMode:1];
  [v29 setWantsBaselineOffset:1];
  id v33 = +[PXStorySettings sharedInstance];
  objc_msgSend(v29, "setMaximumNumberOfLines:", objc_msgSend(v33, "titleMaximumNumberOfLines"));
  v87 = v22;

  id v34 = (void (*)(void *, id *, id, void, void, double, double, double))v28[2];
  id v91 = v25;
  double v35 = v34(v28, &v91, v29, 0, 0, v27, v17, v20);
  id v36 = v91;

  [v35 actualScaleFactor];
  *(float *)&double v37 = v37 * 10.0;
  float v38 = floorf(*(float *)&v37) / 10.0;
  double v39 = v27 * v38;
  if (v38 == 1.0)
  {
    BOOL v41 = 0;
  }
  else
  {
    float v40 = v32 * 10.0;
    BOOL v41 = (float)(floorf(v38 * 10.0) / 10.0) == (float)(floorf(v40) / 10.0);
    id v90 = v36;
    uint64_t v42 = ((void (*)(void *, id *, void *, BOOL, void, double, double, double))v28[2])(v28, &v90, v35, v41, 0, v39, v17, v20);
    id v43 = v90;

    double v35 = (void *)v42;
    id v36 = v43;
  }
  uint64_t v44 = 0;
  char v45 = 0;
  if (a7 != 64 && v101[3] <= 2)
  {
    uint64_t v46 = [(PXStoryTextResourceInfo *)self assetCollectionUUID];

    if (v46)
    {
      id v47 = [(PXStoryTextResourceInfo *)self assetCollectionUUID];
      uint64_t v44 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v88, v47);

      if (v44 == 2)
      {
        -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", a7, v87, v85, y, width, height);
        double v49 = fmin(v17 * 1.25, width - (v48 + v48)) / v17;
        double v50 = v17 * v49;
        double v20 = v16 * v49;
        if (v101[3] == 1)
        {
          double v51 = [off_1E5DA6F98 defaultSpecs];
          double v52 = [v36 string];
          objc_msgSend(v51, "maximumWidthForTitle:containerSize:", v52, v50, v20);
          double v54 = v53;

          [v35 totalBounds];
          BOOL v56 = v54 > 0.0;
          BOOL v57 = ceil(v55) < v54;
          double v58 = fmin(v54, v17);
          if (v56 && v57) {
            double v17 = v58;
          }
          else {
            double v17 = v50;
          }
          if (v56 && v57) {
            uint64_t v44 = 2;
          }
          else {
            uint64_t v44 = 0;
          }
        }
        else
        {
          uint64_t v44 = 2;
          double v17 = v17 * v49;
        }
      }
      id v89 = v36;
      uint64_t v59 = ((void (*)(void *, id *, void *, BOOL, uint64_t, double, double, double))v28[2])(v28, &v89, v35, v41, v44, v39, v17, v20);
      id v60 = v89;

      char v45 = 1;
      double v35 = (void *)v59;
      id v36 = v60;
    }
    else
    {
      char v45 = 0;
      uint64_t v44 = 0;
    }
  }
  [v35 totalBounds];
  double v62 = ceil(v61);
  double v64 = ceil(v63);
  double v65 = v62 + 40.0;
  double v66 = v64 + 40.0;
  if (v44 == 1) {
    char v67 = v45;
  }
  else {
    char v67 = 0;
  }
  if (v67)
  {
    v68 = v88;
    if (v101[3] == 1
      && v62 < v16 * 0.85
      && ([(PXStoryTextResourceInfo *)self associatedSubtitleString],
          id v69 = objc_claimAutoreleasedReturnValue(),
          [(PXStoryTextResourceInfo *)self assetCollectionUUID],
          id v70 = objc_claimAutoreleasedReturnValue(),
          uint64_t v71 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v69, v70),
          v70,
          v69,
          v71 == 1))
    {
      if ([v36 length])
      {
        id v72 = [v36 attributesAtIndex:0 effectiveRange:0];
        v73 = (void *)[v72 mutableCopy];
      }
      else
      {
        v73 = 0;
      }
      [v73 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FB0810]];
      objc_msgSend(v36, "setAttributes:range:", v73, 0, objc_msgSend(v36, "length"));
      [v35 setMaximumNumberOfLines:1];

      double v74 = v66;
    }
    else
    {
      double v74 = v65;
      double v65 = v66;
    }
  }
  else
  {
    double v74 = v62 + 40.0;
    double v65 = v64 + 40.0;
    v68 = v88;
  }
  id v75 = [v68 uppercaseString];
  id v76 = [(PXStoryTextResourceInfo *)self string];
  id v77 = [v76 uppercaseString];
  int v78 = [v75 isEqualToString:v77];

  if (v78)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_drawingContext, v35);
    double v79 = (NSAttributedString *)[v36 copy];
    lock_attributedString = self->_lock_attributedString;
    self->_lock_attributedString = v79;

    self->_lock_boundingSize.double width = v74;
    self->_lock_boundingSize.double height = v65;
    os_unfair_lock_unlock(&self->_lock);
  }
  id v81 = objc_alloc((Class)off_1E5DA9668);
  CGFloat v82 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v74, v65);
  CGFloat v83 = (void *)[v81 initWithFirst:v36 second:v82];

  _Block_object_dispose(&v100, 8);
  return v83;
}

id __161__PXStoryTextResourceInfo_attributedStringBoundingSizeForTitle_stylePairing_availableSize_containerRect_kind_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke(uint64_t a1, id *a2, void *a3, unsigned int a4, uint64_t a5, double a6, double a7, double a8)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = +[PXStoryTextResourceInfo _rangesAndStylesForTitle:*(void *)(a1 + 32)];
  uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  double v14 = a2;
  if (v13)
  {
    uint64_t v15 = v13;
    double v16 = 0;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(obj);
        }
        double v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        double v20 = [v19 second];
        uint64_t v21 = [v20 integerValue];

        if (!v21)
        {
          uint64_t v22 = objc_msgSend((id)objc_opt_class(), "_titlePrimaryAttributesForStylePairing:scale:kind:layoutScheme:allowHyphenation:internationalStyle:", *(void *)(a1 + 56), *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "layoutScheme"), a4, a5, a6);

          double v16 = (void *)v22;
        }
        a2 = v14;
        id v23 = *v14;
        id v24 = [v19 first];
        uint64_t v25 = [v24 rangeValue];
        objc_msgSend(v23, "setAttributes:range:", v16, v25, v26);
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v15);
  }
  else
  {
    double v16 = 0;
  }

  if ([*a2 length])
  {
    uint64_t v27 = *MEMORY[0x1E4FB0738];
    id v28 = [v16 valueForKey:*MEMORY[0x1E4FB0738]];
    id obja = (id)[v28 mutableCopy];

    [obja setLineBreakMode:0];
    id v29 = (void *)[v16 mutableCopy];
    [v29 setValue:obja forKey:v27];
    id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v31 = *(void *)(a1 + 32);
    double v32 = (void *)[v29 copy];
    id v33 = (void *)[v30 initWithString:v31 attributes:v32];

    id v34 = [[PXCTFramesetter alloc] initWithAttributedString:v33 context:0];
    double v35 = -[PXCTFramesetter frameWithRect:maximumLineCount:allowTruncation:](v34, "frameWithRect:maximumLineCount:allowTruncation:", 5, 0, 0.0, 0.0, *(double *)(a1 + 72), *(double *)(a1 + 80));
    id v36 = [v35 lines];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v36 count];
    double v37 = [*v14 attributesAtIndex:0 effectiveRange:0];
    a2 = v14;
    +[PXStoryTextResourceInfo _increaseMaximumLineHeightToAvoidOverlapForLines:v36 attributes:v37 attributedString:v14];
  }
  objc_msgSend(*a2, "boundingRectWithSize:options:context:", objc_msgSend(*(id *)(a1 + 40), "drawingOptions"), v39, a7, a8);

  return v39;
}

- (double)_subtitleScalingFactorForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6
{
  double width = a4.width;
  id v10 = a5;
  id v11 = +[PXStorySettings sharedInstance];
  int v12 = [v11 useReferenceWidthBasedTitleLayout];

  uint64_t v13 = [v10 layoutOrientation];
  if (v12)
  {
    double v14 = 0.0;
    if ((uint64_t)a3 <= 127)
    {
      if (a3 - 1 > 0x3F) {
        goto LABEL_42;
      }
      if (((1 << (a3 - 1)) & 0x8000808BLL) != 0) {
        goto LABEL_5;
      }
      if (a3 != 64)
      {
LABEL_42:
        if (a3) {
          goto LABEL_45;
        }
      }
LABEL_43:
      double v14 = 1.0;
      goto LABEL_45;
    }
    if ((uint64_t)a3 > 511)
    {
      if (a3 != 512 && a3 != 1024) {
        goto LABEL_45;
      }
    }
    else if (a3 != 128)
    {
      if (a3 == 256)
      {
        uint64_t v15 = +[PXStorySettings sharedInstance];
        double v16 = v15;
        goto LABEL_6;
      }
      goto LABEL_45;
    }
LABEL_5:
    uint64_t v15 = +[PXStorySettings sharedInstance];
    double v16 = v15;
    if (v13 != 2)
    {
      [v15 titleReferenceWidthPortrait];
      goto LABEL_28;
    }
LABEL_6:
    [v15 titleReferenceWidthLandscape];
LABEL_28:
    double v24 = v17;

    double v14 = width / v24;
    goto LABEL_45;
  }
  uint64_t v18 = +[PXStorySettings sharedInstance];
  [v18 subtitleSizeScale];
  double v20 = v19;

  double v21 = 1.96;
  if (v13 != 2) {
    double v21 = 2.0;
  }
  if (v20 == 0.0) {
    double v22 = dbl_1AB359D70[v13 == 2];
  }
  else {
    double v22 = v20;
  }
  if (v20 == 0.0) {
    double v23 = v21;
  }
  else {
    double v23 = v20;
  }
  double v14 = 0.0;
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 255)
    {
      if (a3 != 256 && a3 != 512 && a3 != 1024) {
        goto LABEL_45;
      }
    }
    else if (a3 != 32)
    {
      if (a3 == 64) {
        goto LABEL_43;
      }
      if (a3 != 128) {
        goto LABEL_45;
      }
    }
LABEL_37:
    if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v10, dbl_1AB359D70[v13 == 2], v21))
    {
      double v25 = v23;
    }
    else
    {
      double v25 = v22;
    }
    [(PXStoryTextResourceInfo *)self _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:v10 fixedBottomPadding:a6];
    double v14 = width * (v25 / v26);
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_43;
      case 1uLL:
        double v14 = v22;
        break;
      case 2uLL:
        double v14 = v23;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
      case 8uLL:
        goto LABEL_37;
      default:
        if (a3 == 16) {
          goto LABEL_37;
        }
        break;
    }
  }
LABEL_45:

  return v14;
}

- (double)_titleScalingFactorForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6
{
  double width = a4.width;
  id v10 = a5;
  id v11 = +[PXStorySettings sharedInstance];
  int v12 = [v11 useReferenceWidthBasedTitleLayout];

  uint64_t v13 = [v10 layoutOrientation];
  uint64_t v14 = v13;
  if (v12)
  {
    double v15 = 0.0;
    if ((uint64_t)a3 <= 127)
    {
      if (a3 - 1 > 0x3F) {
        goto LABEL_40;
      }
      if (((1 << (a3 - 1)) & 0x8000808BLL) != 0) {
        goto LABEL_5;
      }
      if (a3 != 64)
      {
LABEL_40:
        if (a3) {
          goto LABEL_43;
        }
      }
LABEL_41:
      double v15 = 1.0;
      goto LABEL_43;
    }
    if ((uint64_t)a3 > 511)
    {
      if (a3 != 512 && a3 != 1024) {
        goto LABEL_43;
      }
    }
    else if (a3 != 128)
    {
      if (a3 == 256)
      {
        double v16 = +[PXStorySettings sharedInstance];
        double v17 = v16;
        goto LABEL_6;
      }
      goto LABEL_43;
    }
LABEL_5:
    double v16 = +[PXStorySettings sharedInstance];
    double v17 = v16;
    if (v14 != 2)
    {
      [v16 titleReferenceWidthPortrait];
      goto LABEL_26;
    }
LABEL_6:
    [v16 titleReferenceWidthLandscape];
LABEL_26:
    double v25 = v18;

    double v15 = width / v25;
    goto LABEL_43;
  }
  BOOL v19 = v13 == 2;
  double v20 = +[PXStorySettings sharedInstance];
  [v20 titleSizeScale];
  double v22 = v21;

  if (v22 == 0.0) {
    double v23 = 1.5;
  }
  else {
    double v23 = v22;
  }
  if (v22 == 0.0) {
    double v24 = dbl_1AB359D70[v19];
  }
  else {
    double v24 = v22;
  }
  double v15 = 0.0;
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 255)
    {
      if (a3 != 256 && a3 != 512 && a3 != 1024) {
        goto LABEL_43;
      }
    }
    else if (a3 != 32)
    {
      if (a3 == 64) {
        goto LABEL_41;
      }
      if (a3 != 128) {
        goto LABEL_43;
      }
    }
LABEL_35:
    if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v10, dbl_1AB359D70[v19]))
    {
      double v26 = v23;
    }
    else
    {
      double v26 = v24;
    }
    [(PXStoryTextResourceInfo *)self _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:v10 fixedBottomPadding:a6];
    double v15 = width * (v26 / v27);
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_41;
      case 1uLL:
        double v15 = v24;
        break;
      case 2uLL:
        double v15 = v23;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
      case 8uLL:
        goto LABEL_35;
      default:
        if (a3 == 16) {
          goto LABEL_35;
        }
        break;
    }
  }
LABEL_43:

  return v15;
}

- (int64_t)_fullScreenTitlePositionWithTitleCategory:(id)a3 displayAsset:(id)a4 currentAssetCropRect:(CGRect)a5 relativeTo:(id)a6 extendedTraitCollectionSnapshot:(id)a7 fixedBottomPadding:(double)a8 desiredInternationalStyle:(int64_t)a9
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  if ([(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v14]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 1;
  }
  [v14 fullScreenReferenceRect];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(PXStoryTextResourceInfo *)self _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:v14 fixedBottomPadding:a8];
  double v27 = v26;
  double v29 = v28;
  double v58 = v28;
  id v30 = objc_opt_class();
  uint64_t v31 = [(PXStoryTextResourceInfo *)self string];
  uint64_t v32 = objc_msgSend(v30, "stylePairingFromTitleCategory:string:kind:layoutScheme:", v16, v31, v17, -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme"));

  id v33 = [(PXStoryTextResourceInfo *)self string];
  double v34 = v29;
  double v35 = v19;
  double v36 = v21;
  double v37 = -[PXStoryTextResourceInfo attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:", v33, v32, v17, v14, v27, v34, v19, v21, v23, v25, a8);

  float v38 = [v37 second];
  [v38 CGSizeValue];
  double v40 = v39;
  double v42 = v41;

  double v59 = a8;
  -[PXStoryTextResourceInfo _occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:](self, "_occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:", v17, v32, v14, a9 == 1, a9 == 2, v40, v42, v27, v58, v35, v36, v23, v25, *(void *)&a8);
  double v44 = v43;
  double v46 = v45;
  if (a9 == 1)
  {
    long long v47 = [(PXStoryTextResourceInfo *)self associatedSubtitleString];
    double v48 = [(PXStoryTextResourceInfo *)self assetCollectionUUID];
    BOOL v49 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v47, v48) == 1;
  }
  else
  {
    BOOL v49 = 0;
  }
  double v50 = -[PXStoryTextResourceInfo _possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:](self, "_possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:", v17, v14, a9 == 1, v49, a9 == 2, v35, v36, v23, v25, v40, v42, v44, v46, *(void *)&v59);
  -[PXStoryTextResourceInfo bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:](self, "bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:", v50, v15, [v14 layoutOrientation], a9, v35, v36, v23, v25, v44, v46, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  double v52 = v51;
  double v54 = v53;

  double v55 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v52, v54);
  int64_t v56 = [v50 indexOfObject:v55];

  return v56;
}

- (CGSize)_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:(id)a3 fixedBottomPadding:(double)a4
{
  id v5 = a3;
  if ([(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v5]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 fullScreenReferenceRect];
  -[PXStoryTextResourceInfo _availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:](self, "_availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:", v5, v6);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)_availableSizeForRect:(CGRect)a3 extendedTraitCollectionSnapshot:(id)a4 kind:(unint64_t)a5 fixedBottomPadding:(double)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  BOOL v14 = [v13 layoutOrientation] == 2;
  [(PXStoryTextResourceInfo *)self _sizeWidthMinimumForKind:a5 orientationIsLandscape:v14];
  double v16 = v15;
  [(PXStoryTextResourceInfo *)self _sizeWidthMaximumForKind:a5 orientationIsLandscape:v14];
  double v28 = v17;
  [(PXStoryTextResourceInfo *)self _sizeWidthScaleForKind:a5 extendedTraitCollectionSnapshot:v13];
  double v19 = v18;
  -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", a5, v13, x, y, width, height);
  double v27 = v20;
  -[PXStoryTextResourceInfo _paddingTopForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingTopForKind:extendedTraitCollectionSnapshot:rect:", a5, v13, x, y, width, height);
  double v22 = v21;
  -[PXStoryTextResourceInfo _paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:](self, "_paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:", a5, v13, x, y, width, height, a6);
  double v24 = v23;

  if (width * v19 >= v16 || width - v16 + v27 * -2.0 <= 0.0) {
    double v16 = fmin(width * v19, v28);
  }
  double v25 = height - v22 - v24;
  double v26 = v16;
  result.double height = v25;
  result.double width = v26;
  return result;
}

- (id)_possibleTitlePositionsForRect:(CGRect)a3 boudingSize:(CGSize)a4 occlusionSize:(CGSize)a5 kind:(unint64_t)a6 extendedTraitCollectionSnapshot:(id)a7 fixedBottomPadding:(double)a8 isTitleVertical:(BOOL)a9 isSubtitleVertical:(BOOL)a10 isKashida:(BOOL)a11
{
  BOOL v11 = a11;
  BOOL v12 = a10;
  BOOL v13 = a9;
  double height = a5.height;
  double width = a5.width;
  double v16 = a4.width;
  double v17 = a3.size.height;
  double v18 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v22 = a7;
  -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", a6, v22, x, y, v18, v17);
  double v24 = v23;
  -[PXStoryTextResourceInfo _paddingTopForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingTopForKind:extendedTraitCollectionSnapshot:rect:", a6, v22, x, y, v18, v17);
  double v61 = v25;
  -[PXStoryTextResourceInfo _paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:](self, "_paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:", a6, v22, x, y, v18, v17, a8);
  double v27 = v26;
  double v28 = +[PXStorySettings sharedInstance];
  int v29 = [v28 titleUseCenterAlignment];

  if (v29) {
    BOOL v30 = width <= v16 + -40.0;
  }
  else {
    BOOL v30 = 1;
  }
  if (v30) {
    double v31 = v24 + -20.0;
  }
  else {
    double v31 = v24 + (width - v16) * 0.5;
  }
  if (v30) {
    double v32 = v18 - v16 - v24 + 20.0;
  }
  else {
    double v32 = v18 - width - v24 + (width - v16) * 0.5;
  }
  double v33 = v16 * -0.5 + v18 * 0.5;
  double v34 = v61 + -20.0;
  double v35 = v17 - height - v27 + -20.0;
  double v36 = height * -0.5 + v17 * 0.5 + -20.0;
  uint64_t v37 = [v22 userInterfaceIdiom];

  BOOL v38 = a6 == 4 && v13;
  double v39 = v34 + v18 * 0.05;
  if (!v38 || (unint64_t)(v37 - 1) >= 2) {
    double v39 = v61 + -20.0;
  }
  double v63 = v39;
  double v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:9];
  double v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v33, v34);
  [v40 setObject:v41 atIndexedSubscript:0];

  double v43 = *MEMORY[0x1E4F1DAD8];
  double v42 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v13) {
    double v44 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else {
    double v44 = v36;
  }
  if (v13) {
    double v45 = *MEMORY[0x1E4F1DAD8];
  }
  else {
    double v45 = v33;
  }
  double v46 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v45, v44);
  [v40 setObject:v46 atIndexedSubscript:1];

  if (v13 || v11) {
    double v47 = v42;
  }
  else {
    double v47 = v35;
  }
  if (v13 || v11) {
    double v48 = v43;
  }
  else {
    double v48 = v33;
  }
  BOOL v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v48, v47);
  [v40 setObject:v49 atIndexedSubscript:2];

  double v50 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v31, v34);
  [v40 setObject:v50 atIndexedSubscript:3];

  int v51 = v13 ^ v12 | v11;
  if (v51)
  {
    double v36 = v42;
    double v52 = v43;
  }
  else
  {
    double v52 = v31;
  }
  if (v51) {
    double v53 = v42;
  }
  else {
    double v53 = v35;
  }
  if (v51) {
    double v54 = v43;
  }
  else {
    double v54 = v32;
  }
  double v55 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v52, v36);
  [v40 setObject:v55 atIndexedSubscript:4];

  int64_t v56 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v52, v53);
  [v40 setObject:v56 atIndexedSubscript:5];

  BOOL v57 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v32, v63);
  [v40 setObject:v57 atIndexedSubscript:6];

  double v58 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v54, v36);
  [v40 setObject:v58 atIndexedSubscript:7];

  double v59 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v54, v53);
  [v40 setObject:v59 atIndexedSubscript:8];

  return v40;
}

- (double)_paddingBottomForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5 fixedBottomPadding:(double)a6
{
  double height = a5.size.height;
  id v10 = a4;
  BOOL v11 = v10;
  double v12 = 14.0;
  if (a3 != 64)
  {
    if (a6 == 0.0)
    {
      [(PXStoryTextResourceInfo *)self _paddingBottomScaleForKind:a3 extendedTraitCollectionSnapshot:v10];
      double v12 = height * v13;
    }
    else
    {
      uint64_t v14 = [v10 layoutOrientation];
      double v15 = 40.0;
      if (v14 == 2) {
        double v15 = 26.0;
      }
      double v12 = v15 + a6;
    }
  }

  return v12;
}

- (double)_paddingTopForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5
{
  if (a3 == 64) {
    return 14.0;
  }
  double height = a5.size.height;
  -[PXStoryTextResourceInfo _paddingTopScaleForKind:extendedTraitCollectionSnapshot:](self, "_paddingTopScaleForKind:extendedTraitCollectionSnapshot:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width);
  double v9 = height * v8;
  BOOL v10 = a3 == 8 || a3 == 4;
  double v11 = 48.0;
  if (!v10) {
    double v11 = 0.0;
  }
  return fmax(v11, v9);
}

- (double)_paddingLeftOrRightAlignmentLeadingForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5
{
  double width = a5.size.width;
  uint64_t v8 = objc_msgSend(a4, "layoutOrientation", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (a3 == 64) {
    return 14.0;
  }
  BOOL v10 = v8 == 2;
  [(PXStoryTextResourceInfo *)self _paddingLeftOrRightAlignmentLeadingScaleForKind:a3 orientationIsLandscape:v10];
  double v12 = width * v11;
  [(PXStoryTextResourceInfo *)self _paddingLeadingMinimumForKind:a3 orientationIsLandscape:v10];
  return fmax(v12, v13);
}

- (double)_paddingBottomScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4
{
  uint64_t v5 = [a4 layoutOrientation];
  double result = 0.0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 0uLL:
        return 1.0;
      case 1uLL:
        double v7 = +[PXStorySettings sharedInstance];
        [v7 titleRegularPaddingBottomScale];
        double v9 = v8;

        double result = v9;
        break;
      case 2uLL:
        double result = 0.14;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      case 4uLL:
        return dbl_1AB359D80[v5 == 2];
      case 8uLL:
        double result = 0.2;
        break;
      default:
        if (a3 == 16) {
          double result = 0.26;
        }
        break;
    }
    return result;
  }
  if ((uint64_t)a3 > 255)
  {
    if (a3 != 256 && a3 != 512 && a3 != 1024) {
      return result;
    }
    return dbl_1AB359D80[v5 == 2];
  }
  switch(a3)
  {
    case 0x20uLL:
      return dbl_1AB359D80[v5 == 2];
    case 0x40uLL:
      return 1.0;
    case 0x80uLL:
      return dbl_1AB359D80[v5 == 2];
  }
  return result;
}

- (double)_paddingTopScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 layoutOrientation];
  double v8 = 0.0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_14;
      case 1uLL:
        BOOL v9 = v7 == 2;
        BOOL v10 = (double *)&unk_1AB359DA0;
        goto LABEL_13;
      case 2uLL:
        double v8 = 0.14;
        goto LABEL_22;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_22;
      case 4uLL:
        BOOL v13 = v7 == 2;
        BOOL v14 = [(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v6];
        double v12 = dbl_1AB359D90[v13];
        BOOL v11 = !v14;
        goto LABEL_19;
      case 8uLL:
        goto LABEL_16;
      default:
        if (a3 == 16)
        {
LABEL_16:
          BOOL v11 = ![(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v6];
          double v12 = 0.2;
LABEL_19:
          if (v11) {
            double v8 = v12;
          }
          else {
            double v8 = 0.14;
          }
        }
        break;
    }
    goto LABEL_22;
  }
  if ((uint64_t)a3 > 255)
  {
    if (a3 != 256 && a3 != 512 && a3 != 1024) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  switch(a3)
  {
    case 0x20uLL:
      goto LABEL_12;
    case 0x40uLL:
LABEL_14:
      double v8 = 1.0;
      break;
    case 0x80uLL:
LABEL_12:
      BOOL v9 = v7 == 2;
      BOOL v10 = dbl_1AB359D80;
LABEL_13:
      double v8 = v10[v9];
      break;
  }
LABEL_22:
  double v15 = +[PXStorySettings sharedInstance];
  [v15 titlePaddingTopScale];
  double v17 = v16;

  if (v17 != 0.0)
  {
    double v19 = +[PXStorySettings sharedInstance];
    [v19 titlePaddingTopScale];
    double v8 = v20;
  }
  return v8;
}

- (double)_paddingLeftOrRightAlignmentLeadingScaleForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  double result = 0.0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 0uLL:
        return 1.0;
      case 1uLL:
        return 0.1;
      case 2uLL:
        BOOL v5 = !a4;
        double result = 0.14;
        double v6 = 0.1;
        goto LABEL_13;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      case 4uLL:
        BOOL v5 = !a4;
        double result = 0.1;
        double v6 = 0.07;
        goto LABEL_13;
      case 8uLL:
        goto LABEL_18;
      default:
        if (a3 == 16) {
LABEL_18:
        }
          double result = 0.07;
        break;
    }
    return result;
  }
  if ((uint64_t)a3 > 255)
  {
    if (a3 != 256 && a3 != 512 && a3 != 1024) {
      return result;
    }
    goto LABEL_12;
  }
  switch(a3)
  {
    case 0x20uLL:
      goto LABEL_12;
    case 0x40uLL:
      return 1.0;
    case 0x80uLL:
LABEL_12:
      BOOL v5 = !a4;
      double result = 0.1;
      double v6 = 0.08;
LABEL_13:
      if (!v5) {
        return v6;
      }
      break;
  }
  return result;
}

- (double)_paddingLeadingMinimumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  double result = 0.0;
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 511)
    {
      if (a3 != 512 && a3 != 1024) {
        return result;
      }
    }
    else if (a3 != 128 && a3 != 256)
    {
      return result;
    }
    goto LABEL_16;
  }
  if ((uint64_t)a3 <= 3)
  {
    if (a3 == 1) {
      return 45.0;
    }
    if (a3 == 2) {
      return 50.0;
    }
    return result;
  }
  if (a3 != 4)
  {
    if (a3 != 32) {
      return result;
    }
LABEL_16:
    BOOL v5 = !a4;
    double result = 35.0;
    double v6 = 25.0;
    goto LABEL_17;
  }
  BOOL v5 = !a4;
  double result = 35.0;
  double v6 = 0.0;
LABEL_17:
  if (!v5) {
    return v6;
  }
  return result;
}

- (double)_sizeWidthScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 layoutOrientation];
  double v8 = +[PXStorySettings sharedInstance];
  int v9 = [v8 useReferenceWidthBasedTitleLayout];

  if (v9)
  {
    double v10 = dbl_1AB359DB0[v7 == 2];
    double v11 = dbl_1AB359DC0[v7 == 2];
    double v12 = 0.0;
    if ((uint64_t)a3 > 31)
    {
      if ((uint64_t)a3 > 255)
      {
        switch(a3)
        {
          case 0x100uLL:
            double v12 = 0.6;
            goto LABEL_50;
          case 0x200uLL:
            if ([(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v6])
            {
              double v12 = v11;
            }
            else
            {
              double v12 = v10;
            }
            goto LABEL_50;
          case 0x400uLL:
            double v12 = 0.4;
            goto LABEL_50;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x20uLL:
LABEL_23:
            if ([(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v6])
            {
              if (v7 == 2) {
                double v12 = 0.5;
              }
              else {
                double v12 = 0.65;
              }
            }
            else
            {
              double v12 = dbl_1AB359DD0[v7 == 2];
            }
            break;
          case 0x40uLL:
LABEL_27:
            double v12 = 0.8;
            break;
          case 0x80uLL:
            if (v7 == 2) {
              double v12 = 0.5;
            }
            else {
              double v12 = 0.7;
            }
            goto LABEL_50;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 0uLL:
          goto LABEL_27;
        case 1uLL:
          goto LABEL_39;
        case 2uLL:
          double v10 = dbl_1AB359DC0[v7 == 2];
          goto LABEL_39;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_35;
        case 4uLL:
          goto LABEL_23;
        case 8uLL:
          break;
        default:
          if (a3 != 16) {
            goto LABEL_35;
          }
          break;
      }
      double v12 = 0.4;
    }
LABEL_35:
    if ((uint64_t)a3 > 127)
    {
      if ((uint64_t)a3 > 511)
      {
        if (a3 != 512 && a3 != 1024) {
          goto LABEL_56;
        }
      }
      else if (a3 != 128 && a3 != 256)
      {
        goto LABEL_56;
      }
    }
    else
    {
      if (a3 > 0x20) {
        goto LABEL_56;
      }
      if (((1 << a3) & 0x100010110) == 0)
      {
        double v10 = v12;
        if (((1 << a3) & 6) == 0) {
          goto LABEL_56;
        }
        goto LABEL_39;
      }
    }
LABEL_50:
    id v22 = +[PXStorySettings sharedInstance];
    double v23 = v22;
    if (v7 == 2)
    {
      [v22 titleFeedLandscapeWidthScale];
      double v25 = v24;

      if (v25 != 0.0)
      {
        double v18 = +[PXStorySettings sharedInstance];
        [v18 titleFeedLandscapeWidthScale];
        goto LABEL_55;
      }
    }
    else
    {
      [v22 titleFeedPortraitWidthScale];
      double v27 = v26;

      if (v27 != 0.0)
      {
        double v18 = +[PXStorySettings sharedInstance];
        [v18 titleFeedPortraitWidthScale];
        goto LABEL_55;
      }
    }
    goto LABEL_56;
  }
  if (a3 != 2)
  {
    if ((a3 == 128 || a3 == 32) && v7 == 2) {
      double v12 = 0.76;
    }
    else {
      double v12 = 0.7;
    }
    goto LABEL_35;
  }
  double v10 = 0.4;
LABEL_39:
  BOOL v13 = +[PXStorySettings sharedInstance];
  BOOL v14 = v13;
  if (v7 == 2)
  {
    [v13 titleFullScreenLandscapeWidthScale];
    double v16 = v15;

    BOOL v17 = v16 == 0.0;
    double v12 = v10;
    if (!v17)
    {
      double v18 = +[PXStorySettings sharedInstance];
      [v18 titleFullScreenLandscapeWidthScale];
LABEL_55:
      double v12 = v19;
    }
  }
  else
  {
    [v13 titleFullScreenPortraitWidthScale];
    double v21 = v20;

    BOOL v17 = v21 == 0.0;
    double v12 = v10;
    if (!v17)
    {
      double v18 = +[PXStorySettings sharedInstance];
      [v18 titleFullScreenPortraitWidthScale];
      goto LABEL_55;
    }
  }
LABEL_56:

  return v12;
}

- (double)_sizeWidthMaximumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  if (a3 == 2)
  {
    double v5 = 600.0;
  }
  else if (a3 == 128 || a3 == 32)
  {
    double v4 = 360.0;
    if (a4) {
      double v4 = 280.0;
    }
    if (a3 == 128) {
      double v5 = 680.0;
    }
    else {
      double v5 = v4;
    }
  }
  else
  {
    double v5 = 360.0;
  }
  id v6 = +[PXStorySettings sharedInstance];
  [v6 titleWidthMax];
  double v8 = v7;

  if (v8 != 0.0)
  {
    double v12 = +[PXStorySettings sharedInstance];
    [v12 titleWidthMax];
    double v5 = v13;
  }
  int v9 = +[PXStorySettings sharedInstance];
  int v10 = [v9 useReferenceWidthBasedTitleLayout];

  double result = 1.79769313e308;
  if (!v10) {
    return v5;
  }
  return result;
}

- (double)_sizeWidthMinimumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64)
    {
      *(double *)&uint64_t v5 = 100.0;
      goto LABEL_12;
    }
    if (a3 != 128) {
      goto LABEL_4;
    }
  }
  else
  {
    if (a3 == 2)
    {
      *(double *)&uint64_t v5 = 200.0;
      goto LABEL_12;
    }
    if (a3 != 32)
    {
LABEL_4:
      *(double *)&uint64_t v5 = 240.0;
LABEL_12:
      double v6 = *(double *)&v5;
      goto LABEL_13;
    }
  }
  double v4 = 170.0;
  if (a4) {
    double v6 = 170.0;
  }
  else {
    double v6 = 240.0;
  }
LABEL_13:
  double v7 = +[PXStorySettings sharedInstance];
  [v7 titleWidthMin];
  double v9 = v8;

  if (v9 != 0.0)
  {
    double v13 = +[PXStorySettings sharedInstance];
    [v13 titleWidthMin];
    double v6 = v14;
  }
  int v10 = +[PXStorySettings sharedInstance];
  int v11 = [v10 useReferenceWidthBasedTitleLayout];

  double result = 0.0;
  if (!v11) {
    return v6;
  }
  return result;
}

- (BOOL)_isKashidaText:(id)a3
{
  return PXStoryTitleInternationalStyleAppliedToAttributedString(a3) == 2;
}

- (BOOL)_isVerticalText:(id)a3
{
  return PXStoryTitleInternationalStyleAppliedToAttributedString(a3) == 1;
}

- (CGRect)attributedStringFrameInRect:(CGRect)a3 titleCategory:(id)a4 displayAsset:(id)a5 currentAssetCropRect:(CGRect)a6 kind:(unint64_t)a7 relativeTo:(id)a8 extendedTraitCollectionSnapshot:(id)a9 fixedBottomPadding:(double)a10
{
  double height = a6.size.height;
  double width = a6.size.width;
  double x = a6.origin.x;
  double y = a6.origin.y;
  double v14 = a3.size.height;
  double v15 = a3.size.width;
  CGFloat v16 = a3.origin.y;
  double v17 = a3.origin.x;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  id v22 = a9;
  double v23 = (double *)MEMORY[0x1E4F1DB30];
  double v24 = (double *)MEMORY[0x1E4F1DAD8];
  if (a7 == 1)
  {
    if ([(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v22]) {
      a7 = 2;
    }
    else {
      a7 = 1;
    }
  }
  double v26 = *v23;
  double v25 = v23[1];
  double v28 = *v24;
  double v27 = v24[1];
  v151 = [(PXStoryTextResourceInfo *)self string];
  double v145 = v16;
  double v29 = v16;
  double v148 = v15;
  double v30 = v14;
  -[PXStoryTextResourceInfo _availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:](self, "_availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:", v22, a7, v17, v29, v15, v14, a10);
  double v32 = v31;
  double v34 = v33;
  int64_t v35 = [(PXStoryTextResourceInfo *)self layoutScheme];
  if (v35 == 1)
  {
    int64_t v58 = [(PXStoryTextResourceInfo *)self type];
    if (v58 == 1)
    {
      double v28 = *MEMORY[0x1E4F1DB28];
      double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_65;
    }
    if (!v58)
    {
      double v59 = [(PXStoryTextResourceInfo *)self associatedSubtitleString];
      if ([v59 length])
      {
        uint64_t v132 = [v151 stringByAppendingFormat:@"\n%@", v59];

        v151 = (void *)v132;
      }
      -[PXStoryTextResourceInfo attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:", v151, objc_msgSend((id)objc_opt_class(), "stylePairingFromTitleCategory:string:kind:layoutScheme:", v19, v151, a7, -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme")), a7, v22, v32, v34, v17, v145, v148, v30,
      id v60 = a10);
      double v61 = [v60 first];
      double v62 = [v60 second];
      [v62 CGSizeValue];
      double v26 = v63;
      double v25 = v64;

      v146 = [(PXStoryTextResourceInfo *)self drawingContext];
      if ([v61 length])
      {
        double v65 = [v61 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
      }
      else
      {
        double v65 = 0;
      }
      v155.origin.double x = v17;
      v155.origin.double y = v145;
      v155.size.double width = v148;
      v155.size.double height = v30;
      double v28 = CGRectGetMidX(v155) + v26 * -0.5;
      v156.origin.double x = v17;
      v156.origin.double y = v145;
      v156.size.double width = v148;
      v156.size.double height = v30;
      CGFloat v80 = CGRectGetMaxY(v156) - a10;
      [v65 descender];
      double v27 = v80 - v81 - v25 + 20.0;

      int64_t v66 = 1;
      uint64_t v67 = 2;
      goto LABEL_22;
    }
  }
  else if (!v35)
  {
    int64_t v36 = [(PXStoryTextResourceInfo *)self type];
    if (v36 != 1)
    {
      if (!v36)
      {
        uint64_t v37 = objc_msgSend((id)objc_opt_class(), "stylePairingFromTitleCategory:string:kind:layoutScheme:", v19, v151, a7, -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme"));
        BOOL v38 = -[PXStoryTextResourceInfo attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:", v151, v37, a7, v22, v32, v34, v17, v145, v148, v30, a10);
        double v39 = [v38 second];
        [v39 CGSizeValue];
        double v41 = v40;
        double v43 = v42;

        v135 = v38;
        uint64_t v44 = [v38 first];
        v146 = [(PXStoryTextResourceInfo *)self drawingContext];
        BOOL v45 = [(PXStoryTextResourceInfo *)self _isVerticalText:v44];
        BOOL v46 = [(PXStoryTextResourceInfo *)self _isKashidaText:v44];
        uint64_t v47 = 2;
        if (!v46) {
          uint64_t v47 = 0;
        }
        if (v45) {
          uint64_t v47 = 1;
        }
        uint64_t v134 = v47;
        double v138 = v41;
        double v25 = v43;
        BOOL v48 = v46;
        -[PXStoryTextResourceInfo _occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:](self, "_occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:", a7, v37, v22, v45, v41, v43, v32, v34, v17, v145, v148, v30, *(void *)&a10);
        double v50 = v49;
        double v52 = v51;
        BOOL v136 = v45;
        v140 = (void *)v44;
        if (v45)
        {
          [(PXStoryTextResourceInfo *)self associatedSubtitleString];
          v54 = id v53 = v22;
          [(PXStoryTextResourceInfo *)self assetCollectionUUID];
          v56 = id v55 = v21;
          BOOL v57 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v54, v56) == 1;

          id v21 = v55;
          id v22 = v53;
        }
        else
        {
          BOOL v57 = 0;
        }
        id v75 = -[PXStoryTextResourceInfo _possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:](self, "_possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:", a7, v22, v136, v57, v48, v17, v145, v148, v30, v41, v25, v50, v52, *(void *)&a10);
        id v76 = [v75 objectAtIndexedSubscript:5];
        [v76 pointValue];
        double v28 = v77;
        double v27 = v78;

        if (a7 != 64)
        {
          if ([(PXStoryTextResourceInfo *)self hasForcedPositioning])
          {
            int64_t v79 = [(PXStoryTextResourceInfo *)self forcedPositionIndex];
          }
          else
          {
            int64_t v79 = -[PXStoryTextResourceInfo _fullScreenTitlePositionWithTitleCategory:displayAsset:currentAssetCropRect:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:](self, "_fullScreenTitlePositionWithTitleCategory:displayAsset:currentAssetCropRect:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:", v19, v20, v21, v22, v134, x, y, width, height, a10);
            if (v79 == 0x7FFFFFFFFFFFFFFFLL)
            {
              -[PXStoryTextResourceInfo bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:](self, "bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:", v75, v20, [v22 layoutOrientation], v134, v17, v145, v148, v30, v50, v52, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
              double v28 = v95;
              double v27 = v96;
              goto LABEL_47;
            }
          }
          unint64_t v97 = [v75 objectAtIndexedSubscript:v79];
          [v97 pointValue];
          double v28 = v98;
          double v27 = v99;
        }
LABEL_47:
        double v26 = v138;
        if (v136)
        {
          uint64_t v100 = [v75 objectAtIndexedSubscript:4];
          [v100 pointValue];
          double v102 = v101;

          if (v27 != v102)
          {
            uint64_t v103 = [v75 objectAtIndexedSubscript:5];
            [v103 pointValue];
            BOOL v105 = v27 == v104;
LABEL_50:

            int64_t v66 = 2 * v105;
LABEL_56:
            v111 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v28, v27);
            int64_t v152 = [v75 indexOfObject:v111];

            v112 = v135;
LABEL_60:

            double v61 = v140;
            goto LABEL_61;
          }
        }
        else
        {
          if (v48)
          {
            int64_t v66 = 3;
            goto LABEL_56;
          }
          v106 = +[PXStorySettings sharedInstance];
          char v107 = [v106 titleUseCenterAlignment];

          if ((v107 & 1) == 0)
          {
            v108 = [v75 objectAtIndexedSubscript:0];
            [v108 pointValue];
            double v110 = v109;

            if (v28 != v110)
            {
              uint64_t v103 = [v75 objectAtIndexedSubscript:3];
              [v103 pointValue];
              BOOL v105 = v28 != v131;
              goto LABEL_50;
            }
          }
        }
        int64_t v66 = 1;
        goto LABEL_56;
      }
      goto LABEL_21;
    }
    if (v21) {
      objc_msgSend(v21, "attributedStringFrameInRect:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:", v19, v20, a7, 0, v22, v17, v145, v148, v30, x, y, width, height, *(void *)&a10);
    }
    v68 = [v21 attributedString];
    unsigned int v69 = [v21 _isVerticalText:v68];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __170__PXStoryTextResourceInfo_attributedStringFrameInRect_titleCategory_displayAsset_currentAssetCropRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke;
    aBlock[3] = &unk_1E5DBB5C0;
    id v70 = v21;
    id v154 = v70;
    uint64_t v71 = (unsigned int (**)(void))_Block_copy(aBlock);
    unsigned int v139 = v69;
    v137 = v71;
    if (v69 && !v71[2]())
    {
      int v73 = 0;
      uint64_t v74 = 1;
    }
    else
    {
      id v72 = [v70 attributedString];
      int v73 = [v70 _isKashidaText:v72];

      if (v73) {
        uint64_t v74 = 2;
      }
      else {
        uint64_t v74 = 0;
      }
    }
    id v82 = v22;
    CGFloat v83 = -[PXStoryTextResourceInfo attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:](self, "attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:", v151, a7, v70, v22, v74, v32, v34, v17, v145, v148, v30, a10);
    CGFloat v84 = [v83 second];
    [v84 CGSizeValue];
    double v26 = v85;
    double v25 = v86;

    uint64_t v87 = [v83 first];
    v146 = [(PXStoryTextResourceInfo *)self drawingContext];
    v140 = (void *)v87;
    BOOL v88 = [(PXStoryTextResourceInfo *)self _isVerticalText:v87];
    if (v139)
    {
      double v89 = x;
      double v90 = y;
      if (((v73 | !v88) & 1) == 0)
      {
LABEL_40:
        LOBYTE(v133) = v88;
        id v22 = v82;
        -[PXStoryTextResourceInfo _subtitlePositionInFrame:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:](self, "_subtitlePositionInFrame:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:", v19, v20, a7, v70, v82, v139, v17, v145, v148, v30, v89, v90, width, height, *(void *)&a10, v133);
        double v28 = v91;
        double v27 = v92;
        int64_t v152 = [v70 effectivePositionIndex];
        id v93 = v137;
LABEL_59:
        int64_t v66 = [v70 textAlignment];

        v112 = v154;
        goto LABEL_60;
      }
    }
    else
    {
      double v89 = x;
      double v90 = y;
      if (!v73) {
        goto LABEL_40;
      }
    }
    id v22 = v82;
    if ([v140 length])
    {
      v94 = [v140 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    }
    else
    {
      v94 = 0;
    }
    id v93 = v137;
    v157.origin.double x = v17;
    v157.origin.double y = v145;
    v157.size.double width = v148;
    v157.size.double height = v30;
    double v28 = CGRectGetMidX(v157) + v26 * -0.5;
    v158.origin.double x = v17;
    v158.origin.double y = v145;
    v158.size.double width = v148;
    v158.size.double height = v30;
    CGFloat v113 = CGRectGetMaxY(v158) - a10;
    [v94 descender];
    double v27 = v113 - v114 - v25 + -5.0;

    int64_t v152 = 2;
    goto LABEL_59;
  }
LABEL_21:
  int64_t v66 = 0;
  v146 = 0;
  double v61 = 0;
  uint64_t v67 = 5;
LABEL_22:
  int64_t v152 = v67;
LABEL_61:
  id v149 = v20;
  id v150 = v21;
  v115 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v61];
  id v147 = v22;
  id v116 = v19;
  if ([v61 length])
  {
    v117 = [v61 attributesAtIndex:0 effectiveRange:0];
  }
  else
  {
    v117 = (void *)MEMORY[0x1E4F1CC08];
  }
  v118 = v61;
  uint64_t v119 = *MEMORY[0x1E4FB0738];
  v120 = [v117 valueForKey:*MEMORY[0x1E4FB0738]];
  v121 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v117];
  [v120 setAlignment:v66];
  [v121 setValue:v120 forKey:v119];
  v122 = (void *)[v121 copy];

  objc_msgSend(v115, "setAttributes:range:", v122, 0, objc_msgSend(v118, "length"));
  os_unfair_lock_lock(&self->_lock);
  v123 = (NSAttributedString *)[v115 copy];
  lock_attributedString = self->_lock_attributedString;
  self->_lock_attributedString = v123;

  self->_lock_boundingSize.double width = v26;
  self->_lock_boundingSize.double height = v25;
  self->_lock_origin.double x = v28;
  self->_lock_origin.double y = v27;
  lock_drawingContext = self->_lock_drawingContext;
  self->_lock_drawingContext = v146;
  self->_lock_textAlignment = v66;
  v126 = v146;

  self->_lock_effectivePositionIndedouble x = v152;
  os_unfair_lock_unlock(&self->_lock);

  id v19 = v116;
  id v20 = v149;
  id v21 = v150;
  id v22 = v147;
LABEL_65:

  double v127 = v28;
  double v128 = v27;
  double v129 = v26;
  double v130 = v25;
  result.size.double height = v130;
  result.size.double width = v129;
  result.origin.double y = v128;
  result.origin.double x = v127;
  return result;
}

BOOL __170__PXStoryTextResourceInfo_attributedStringFrameInRect_titleCategory_displayAsset_currentAssetCropRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke(uint64_t a1)
{
  return (unint64_t)[*(id *)(a1 + 32) effectivePositionIndex] < 3;
}

- (CGSize)_occlusionSizeForSize:(CGSize)a3 kind:(unint64_t)a4 size:(CGSize)a5 containerRect:(CGRect)a6 stylePairing:(int64_t)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9 isVerticalText:(BOOL)a10 isKashida:(BOOL)a11
{
  BOOL v12 = a10;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v16 = a5.height;
  double v17 = a5.width;
  double v19 = a3.height;
  double v20 = a3.width;
  id v22 = a8;
  if (v12) {
    double v23 = v19;
  }
  else {
    double v23 = v20;
  }
  double v24 = v23 + -40.0;
  double v25 = [(PXStoryTextResourceInfo *)self drawingContext];
  [v25 baselineOffset];
  double v27 = v26;

  if (!a11)
  {
    -[PXStoryTextResourceInfo _subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:](self, "_subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:", a4, v22, v12, v17, v16, a9);
    double v39 = v28;
    uint64_t v29 = [(PXStoryTextResourceInfo *)self associatedSubtitleString];
    double v30 = (void *)v29;
    if (v29) {
      double v31 = (__CFString *)v29;
    }
    else {
      double v31 = &stru_1F00B0030;
    }
    double v32 = -[PXStoryTextResourceInfo attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:](self, "attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:", v31, a4, self, v22, 0, v17, v16, x, y, width, height, a9);
    double v33 = [v32 second];
    [v33 CGSizeValue];
    double v35 = v34;

    if (v24 < v35 + -40.0) {
      double v24 = v35 + -40.0;
    }
    double v27 = v27 + v39;
  }
  if (v12) {
    double v36 = v24;
  }
  else {
    double v36 = v27;
  }
  if (!v12) {
    double v27 = v24;
  }

  double v37 = v27;
  double v38 = v36;
  result.double height = v38;
  result.double width = v37;
  return result;
}

- (double)_subtitleLineSpacingForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6 isVerticalText:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v13 = a5;
  if (v7) {
    double v14 = 25.0;
  }
  else {
    double v14 = 30.0;
  }
  double v15 = +[PXStorySettings sharedInstance];
  int v16 = [v15 useReferenceWidthBasedTitleLayout];

  if (v16 || a3 - 1 <= 1)
  {
    -[PXStoryTextResourceInfo _titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", a3, v13, width, height, a6);
    double v18 = v14 * v17;
  }
  else
  {
    if ([(PXStoryTextResourceInfo *)self _isUserInterfaceIdiomPadOrMacOrTV:v13]) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    [(PXStoryTextResourceInfo *)self _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:v13 fixedBottomPadding:a6];
    double v21 = v20;
    -[PXStoryTextResourceInfo _titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", v19, v13);
    double v18 = width * (v14 * v22 / v21);
  }
  if (a3 == 64) {
    double v23 = 18.0;
  }
  else {
    double v23 = v18;
  }

  return v23;
}

- (int64_t)effectivePositionIndex
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_effectivePositionIndedouble x = self->_lock_effectivePositionIndex;
  os_unfair_lock_unlock(p_lock);
  return lock_effectivePositionIndex;
}

- (int64_t)textAlignment
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_textAlignment = self->_lock_textAlignment;
  os_unfair_lock_unlock(p_lock);
  return lock_textAlignment;
}

- (NSStringDrawingContext)drawingContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = self->_lock_drawingContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CGPoint)origin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CGFloat x = self->_lock_origin.x;
  CGFloat y = self->_lock_origin.y;
  os_unfair_lock_unlock(p_lock);
  double v6 = x;
  double v7 = y;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (CGSize)boundingSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CGFloat width = self->_lock_boundingSize.width;
  CGFloat height = self->_lock_boundingSize.height;
  os_unfair_lock_unlock(p_lock);
  double v6 = width;
  double v7 = height;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (NSAttributedString)attributedString
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = (void *)[(NSAttributedString *)self->_lock_attributedString copy];
  os_unfair_lock_unlock(p_lock);
  return (NSAttributedString *)v4;
}

- (int64_t)verticalAlignment
{
  return 0;
}

- (double)boundingRectPadding
{
  return 20.0;
}

- (int64_t)drawingOptions
{
  return 33;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXStoryTextResourceInfo *)self string];
    id v7 = [v5 string];
    if (v6 == v7)
    {
    }
    else
    {
      double v8 = v7;
      char v9 = [v6 isEqual:v7];

      if ((v9 & 1) == 0) {
        goto LABEL_10;
      }
    }
    int64_t v11 = [(PXStoryTextResourceInfo *)self type];
    if (v11 == [v5 type])
    {
      BOOL v12 = [(PXStoryTextResourceInfo *)self associatedSubtitleString];
      id v13 = [v5 associatedSubtitleString];
      if (v12 == v13) {
        char v10 = 1;
      }
      else {
        char v10 = [v12 isEqualToString:v13];
      }

      goto LABEL_13;
    }
LABEL_10:
    char v10 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v10 = 0;
LABEL_14:

  return v10;
}

- (void)_checkForForcedPositioning:(id *)a3
{
  if ([*a3 hasSuffix:@"*"])
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:9];
    [v7 setObject:@"*M1*" atIndexedSubscript:0];
    [v7 setObject:@"*M2*" atIndexedSubscript:1];
    [v7 setObject:@"*M3*" atIndexedSubscript:2];
    [v7 setObject:@"*L1*" atIndexedSubscript:3];
    [v7 setObject:@"*L2*" atIndexedSubscript:4];
    [v7 setObject:@"*L3*" atIndexedSubscript:5];
    [v7 setObject:@"*R1*" atIndexedSubscript:6];
    [v7 setObject:@"*R2*" atIndexedSubscript:7];
    [v7 setObject:@"*R3*" atIndexedSubscript:8];
    if ([v7 count])
    {
      uint64_t v5 = 0;
      while (1)
      {
        id v6 = [v7 objectAtIndexedSubscript:v5];
        if ([*a3 hasSuffix:v6]) {
          break;
        }

        if (++v5 >= (unint64_t)[v7 count]) {
          goto LABEL_9;
        }
      }
      objc_msgSend(*a3, "substringToIndex:", objc_msgSend(*a3, "length") - objc_msgSend(v6, "length"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      [(PXStoryTextResourceInfo *)self setHasForcedPositioning:1];
      [(PXStoryTextResourceInfo *)self setForcedPositionIndex:v5];
    }
LABEL_9:
  }
}

- (PXStoryTextResourceInfo)initWithString:(id)a3 associatedSubtitleString:(id)a4 type:(int64_t)a5 layoutScheme:(int64_t)a6 assetCollectionUUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryTextResourceInfo;
  double v15 = [(PXStoryTextResourceInfo *)&v22 init];
  if (v15)
  {
    int v16 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

    if (PFOSVariantHasInternalUI())
    {
      id v21 = v16;
      [(PXStoryTextResourceInfo *)v15 _checkForForcedPositioning:&v21];
      id v17 = v21;

      int v16 = v17;
    }
    objc_storeStrong((id *)&v15->_string, v16);
    v15->_type = a5;
    v15->_layoutScheme = a6;
    uint64_t v18 = [v13 copy];
    associatedSubtitleString = v15->_associatedSubtitleString;
    v15->_associatedSubtitleString = (NSString *)v18;

    objc_storeStrong((id *)&v15->_assetCollectionUUID, a7);
    v15->_lock._os_unfair_lock_opaque = 0;
    id v12 = v16;
  }

  return v15;
}

+ (id)_rangesAndStylesForTitle:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc((Class)off_1E5DA9668);
  id v7 = (void *)MEMORY[0x1E4F29238];
  uint64_t v8 = [v4 length];

  char v9 = objc_msgSend(v7, "valueWithRange:", 0, v8);
  char v10 = (void *)[v6 initWithFirst:v9 second:&unk_1F02D7D08];
  [v5 addObject:v10];

  return v5;
}

+ (void)_increaseMaximumLineHeightToAvoidOverlapForLines:(id)a3 attributes:(id)a4 attributedString:(id *)a5
{
  uint64_t v44 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    uint64_t v12 = *MEMORY[0x1E4FB0738];
    CGFloat MinY = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        double v48 = MinY;
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(obj);
        }
        double v15 = (const __CTLine *)objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "line", v44);
        int v16 = [v7 valueForKey:v12];
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v15, 0);
        CGFloat x = BoundsWithOptions.origin.x;
        CGFloat y = BoundsWithOptions.origin.y;
        CGFloat width = BoundsWithOptions.size.width;
        CGFloat height = BoundsWithOptions.size.height;
        CGRect v61 = CTLineGetBoundsWithOptions(v15, 8uLL);
        CGFloat v21 = v61.size.width;
        CGFloat v22 = v61.size.height;
        CGFloat v46 = v61.origin.y;
        CGFloat v47 = v61.origin.x;
        double MaxY = CGRectGetMaxY(v61);
        [v16 maximumLineHeight];
        double v25 = v24;
        if (v24 <= 0.0)
        {
          v62.origin.CGFloat x = x;
          v62.origin.CGFloat y = y;
          v62.size.CGFloat width = width;
          v62.size.CGFloat height = height;
          double v24 = CGRectGetHeight(v62);
        }
        double v26 = v48 - MaxY;
        float v27 = v24 * 0.0500000007;
        double v28 = roundf(v27);
        if (v48 - MaxY < v28)
        {
          if (v26 < 0.0) {
            double v26 = -v26;
          }
          double v29 = v26 + v28;
          if (v26 + v28 > v25)
          {
            double v30 = (void *)[v7 mutableCopy];
            [v16 setMinimumLineHeight:v29];
            [v16 setMaximumLineHeight:v29];
            [v30 setValue:v16 forKey:v12];
            uint64_t v31 = [v30 copy];

            id v7 = (id)v31;
          }
        }
        v63.origin.CGFloat y = v46;
        v63.origin.CGFloat x = v47;
        v63.size.CGFloat width = v21;
        v63.size.CGFloat height = v22;
        CGFloat MinY = CGRectGetMinY(v63);
        double v32 = (void *)MEMORY[0x1E4F29238];
        CFIndex location = CTLineGetStringRange(v15).location;
        double v34 = objc_msgSend(v32, "valueWithRange:", location, CTLineGetStringRange(v15).length);
        [v8 addObject:v34];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v10);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v35 = v8;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
  double v37 = v44;
  if (v36)
  {
    uint64_t v38 = v36;
    uint64_t v39 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(v35);
        }
        double v41 = *v37;
        uint64_t v42 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "rangeValue", v44);
        objc_msgSend(v41, "setAttributes:range:", v7, v42, v43);
      }
      uint64_t v38 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v38);
  }
}

+ (id)subtitleAttributesForSize:(CGSize)a3 string:(id)a4 scale:(double)a5 kind:(unint64_t)a6 extendedTraitCollectionSnapshot:(id)a7 internationalStyle:(int64_t)a8
{
  v34[3] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (void *)MEMORY[0x1E4FB1618];
  id v13 = a4;
  id v14 = [v12 whiteColor];
  double v15 = [(id)objc_opt_class() _allowedSubtitleCharacterSetWithKind:a6];
  int v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v13];

  int v17 = [v15 isSupersetOfSet:v16];
  BOOL v18 = a6 != 64;
  char v19 = v18 & v17;
  double v20 = 14.0;
  if ((v18 & v17) == 0) {
    double v20 = 0.0;
  }
  double v21 = v20 * a5;
  CGFloat v22 = [a1 _subtitleFontForKind:a6 scale:v17 ^ 1u hasExtendedCharacterSet:a8 internationalStyle:a5];
  double v23 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  double v24 = (void *)[v23 mutableCopy];

  [v24 setMaximumLineHeight:v21];
  [v24 setLineBreakMode:4];
  uint64_t v25 = *MEMORY[0x1E4FB0700];
  v33[0] = *MEMORY[0x1E4FB06F8];
  v33[1] = v25;
  v34[0] = v22;
  v34[1] = v14;
  void v33[2] = *MEMORY[0x1E4FB0738];
  void v34[2] = v24;
  double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  float v27 = (void *)[v26 mutableCopy];

  if (a8 == 2)
  {
    [a1 _setKashidaToParagraphStyle:v24];
  }
  else
  {
    double v28 = 2.0;
    if (a8 != 1) {
      double v28 = 0.0;
    }
    if (v19) {
      double v28 = 1.566;
    }
    double v29 = v28 * a5;
    [v24 setAlignment:1];
    double v30 = [NSNumber numberWithDouble:v29];
    [v27 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4FB07F8]];
  }
  uint64_t v31 = (void *)[v27 copy];

  return v31;
}

+ (id)_subtitleFontForKind:(unint64_t)a3 scale:(double)a4 hasExtendedCharacterSet:(BOOL)a5 internationalStyle:(int64_t)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v6 = a4 * 14.0;
  if (v6 < 10.0) {
    double v6 = 10.0;
  }
  if (a3 == 64) {
    double v6 = 11.0;
  }
  if (a6 == 1) {
    double v7 = v6 * 1.16;
  }
  else {
    double v7 = v6;
  }
  if (a5)
  {
    uint64_t v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v7 weight:*MEMORY[0x1E4FB09E0]];
  }
  else
  {
    uint64_t v18 = *MEMORY[0x1E4FB0950];
    v16[0] = *MEMORY[0x1E4FB0A10];
    uint64_t v9 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24720]];
    v17[0] = v9;
    v16[1] = *MEMORY[0x1E4FB09F0];
    uint64_t v10 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
    _DWORD v16[2] = *MEMORY[0x1E4FB0998];
    uint64_t v11 = *MEMORY[0x1E4FB0928];
    v17[1] = v10;
    v17[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    v19[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

    id v14 = [MEMORY[0x1E4FB08E8] fontDescriptorWithFontAttributes:v13];
    uint64_t v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v14 size:v7];
  }
  return v8;
}

+ (id)_allowedSubtitleCharacterSetWithKind:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "_subtitleFontCacheKeyForKind:");
  double v6 = [a1 subtitleCachedCharacterSetByKind];
  double v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    uint64_t v8 = [a1 _subtitleFontForKind:a3 scale:0 hasExtendedCharacterSet:0 internationalStyle:1.0];
    uint64_t v9 = [v8 fontDescriptor];
    uint64_t v10 = [v9 fontAttributes];
    double v7 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB08F8]];

    if (!v7)
    {
      double v7 = CTFontCopyCharacterSet((CTFontRef)v8);
      if (!v7)
      {
        uint64_t v11 = PLStoryGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v14[0] = 67109120;
          v14[1] = a3;
          _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "font missing NSCharacterSet mapping for kind: %d", (uint8_t *)v14, 8u);
        }

        double v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
      }
    }
    uint64_t v12 = [a1 subtitleCachedCharacterSetByKind];
    [v12 setObject:v7 forKey:v5];
  }
  return v7;
}

+ (id)_subtitleFontCacheKeyForKind:(unint64_t)a3
{
  if (a3 == 64) {
    return &unk_1F02D7CD8;
  }
  else {
    return &unk_1F02D7CF0;
  }
}

+ (void)_setKashidaToParagraphStyle:(id)a3
{
  id v3 = a3;
  [v3 setSpansAllLines:1];
  [v3 setAlignment:3];
}

+ (id)_titlePrimaryAttributesForStylePairing:(int64_t)a3 scale:(double)a4 kind:(unint64_t)a5 layoutScheme:(int64_t)a6 allowHyphenation:(BOOL)a7 internationalStyle:(int64_t)a8
{
  BOOL v9 = a7;
  v30[3] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [MEMORY[0x1E4FB1618] whiteColor];
  if (a5 == 64)
  {
    double v16 = 20.0;
    double v17 = 0.0;
    if (a3 == 7) {
      double v16 = 0.0;
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
      case 7:
        double v16 = 55.0;
        if (a8 != 2) {
          double v16 = 0.0;
        }
        if (a8 == 1) {
          double v17 = 4.0;
        }
        else {
          double v17 = 0.0;
        }
        break;
      case 1:
        double v17 = 1.556;
        double v16 = 45.0;
        break;
      case 2:
        double v17 = 1.564;
        double v16 = 35.0;
        break;
      case 3:
        double v17 = 2.499;
        goto LABEL_17;
      case 4:
        double v17 = -0.476;
        goto LABEL_19;
      case 5:
        double v17 = 0.665;
LABEL_17:
        uint64_t v18 = 0x4043000000000000;
        goto LABEL_20;
      case 6:
        double v17 = -0.5;
LABEL_19:
        uint64_t v18 = 0x4044000000000000;
LABEL_20:
        double v16 = *(double *)&v18;
        break;
      default:
        double v16 = 0.0;
        double v17 = 0.0;
        break;
    }
  }
  if (a6 == 1) {
    a4 = a4 * 0.8;
  }
  double v19 = a4 * v16;
  double v20 = [a1 _titleFontForStylePairing:a3 scale:a5 kind:a8 internationalStyle:a4];
  double v21 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  CGFloat v22 = (void *)[v21 mutableCopy];

  [v22 setMaximumLineHeight:v19];
  [v22 setLineBreakMode:4];
  [v22 setUsesDefaultHyphenation:v9];
  uint64_t v23 = *MEMORY[0x1E4FB0700];
  v29[0] = *MEMORY[0x1E4FB06F8];
  v29[1] = v23;
  v30[0] = v20;
  v30[1] = v15;
  void v29[2] = *MEMORY[0x1E4FB0738];
  void v30[2] = v22;
  double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  uint64_t v25 = (void *)[v24 mutableCopy];

  if (a8 == 2)
  {
    [a1 _setKashidaToParagraphStyle:v22];
  }
  else
  {
    double v26 = [NSNumber numberWithDouble:a4 * v17];
    [v25 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4FB07F8]];
  }
  float v27 = (void *)[v25 copy];

  return v27;
}

+ (id)_titleFontCacheKeyForStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  if (a4 == 64)
  {
    id v4 = &unk_1F02D7CF0;
    if (a3 == 7) {
      id v4 = &unk_1F02D7CD8;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = [NSNumber numberWithInteger:a3 + 3];
  }
  return v5;
}

+ (NSCache)subtitleCachedCharacterSetByKind
{
  if (subtitleCachedCharacterSetByKind_onceToken != -1) {
    dispatch_once(&subtitleCachedCharacterSetByKind_onceToken, &__block_literal_global_2_107241);
  }
  id v2 = (void *)subtitleCachedCharacterSetByKind_instance;
  return (NSCache *)v2;
}

void __59__PXStoryTextResourceInfo_subtitleCachedCharacterSetByKind__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)subtitleCachedCharacterSetByKind_instance;
  subtitleCachedCharacterSetByKind_instance = (uint64_t)v0;
}

void __64__PXStoryTextResourceInfo_titleCachedCharacterSetByStyleAndKind__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)titleCachedCharacterSetByStyleAndKind_instance;
  titleCachedCharacterSetByStyleAndKind_instance = (uint64_t)v0;
}

@end