@interface PXMemoriesFontsSpec
+ (UIEdgeInsets)paddingForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 layoutMargins:(UIEdgeInsets)a6 width:(double)a7 shouldScale:(BOOL)a8 forHeaderTile:(BOOL)a9;
+ (double)_playButtonPaddingForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 deviceMargin:(double)a6 forHeaderTile:(BOOL)a7;
+ (double)baselineDistanceForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 size:(CGSize)a6 shouldScale:(BOOL)a7;
+ (id)_fontSetByTitleFontName;
+ (id)_fontSpecCache;
+ (id)_titleFontNameByFontSet;
+ (id)memoriesFontsSpecForDescriptor:(PXViewSpecDescriptor *)a3 extendedTraitCollection:(id)a4;
+ (id)supportedTitleFontNames;
+ (id)textAttributesForFontName:(id)a3 fontSize:(double)a4 lineHeight:(double)a5 tracking:(double)a6 stroke:(double)a7 shadow:(id)a8 capitalizationStyle:(int64_t)a9;
+ (id)textAttributesForFontSet:(int64_t)a3 specSet:(int64_t)a4 labelKind:(int64_t)a5 variant:(int64_t)a6 size:(CGSize)a7 shouldScale:(BOOL)a8;
+ (int64_t)_memoryLabelKindForDescriptor:(PXViewSpecDescriptor *)a3;
+ (int64_t)capitalizationStyleForLabelKind:(int64_t)a3;
+ (int64_t)numberOfLinesForLabelKind:(int64_t)a3;
+ (void)_getSpecSet:(int64_t *)a3 variant:(int64_t *)a4 forDescriptor:(PXViewSpecDescriptor *)a5 extendedTraitCollection:(id)a6;
+ (void)preloadFontsSpecsForExtendedTraitCollection:(id)a3;
- (NSDictionary)fallbackTitleTextAttributes;
- (NSDictionary)subtitleTextAttributes;
- (NSDictionary)titleTextAttributes;
- (UIEdgeInsets)padding;
- (double)baselineDistance;
- (id)_initWithIdentifier:(PXMemoryFontsSpecIdentifier *)a3;
@end

@implementation PXMemoriesFontsSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_fallbackTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_titleTextAttributes, 0);
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)baselineDistance
{
  return self->_baselineDistance;
}

- (NSDictionary)subtitleTextAttributes
{
  return self->_subtitleTextAttributes;
}

- (NSDictionary)fallbackTitleTextAttributes
{
  return self->_fallbackTitleTextAttributes;
}

- (NSDictionary)titleTextAttributes
{
  return self->_titleTextAttributes;
}

- (id)_initWithIdentifier:(PXMemoryFontsSpecIdentifier *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PXMemoriesFontsSpec;
  v4 = [(PXMemoriesFontsSpec *)&v19 init];
  if (v4)
  {
    int64_t var0 = a3->var0;
    int64_t var1 = a3->var1;
    int64_t var2 = a3->var2;
    double width = a3->var3.width;
    double height = a3->var3.height;
    BOOL var5 = a3->var5;
    uint64_t v11 = objc_msgSend((id)objc_opt_class(), "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", a3->var0, var1, 0, var2, var5, width, height);
    titleTextAttributes = v4->_titleTextAttributes;
    v4->_titleTextAttributes = (NSDictionary *)v11;

    uint64_t v13 = objc_msgSend((id)objc_opt_class(), "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", 1, var1, 0, var2, var5, width, height);
    fallbackTitleTextAttributes = v4->_fallbackTitleTextAttributes;
    v4->_fallbackTitleTextAttributes = (NSDictionary *)v13;

    uint64_t v15 = objc_msgSend((id)objc_opt_class(), "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", var0, var1, 1, var2, var5, width, height);
    subtitleTextAttributes = v4->_subtitleTextAttributes;
    v4->_subtitleTextAttributes = (NSDictionary *)v15;

    objc_msgSend((id)objc_opt_class(), "baselineDistanceForFontSet:specSet:variant:size:shouldScale:", var0, var1, var2, var5, width, height);
    v4->_baselineDistance = v17;
    PXEdgeInsetsMake();
  }
  return 0;
}

+ (double)_playButtonPaddingForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 deviceMargin:(double)a6 forHeaderTile:(BOOL)a7
{
}

+ (int64_t)_memoryLabelKindForDescriptor:(PXViewSpecDescriptor *)a3
{
  int64_t v3 = 0;
  if ((unint64_t)(a3->var0 - 1900) >= 0x64) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (LOBYTE(a3->var0) - 108) / 0xFu;
  }
  if (v4 != 2)
  {
    if (v4 != 4)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:a1 file:@"PXMemoriesFontsSpec.m" lineNumber:624 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    return 1;
  }
  return v3;
}

+ (void)_getSpecSet:(int64_t *)a3 variant:(int64_t *)a4 forDescriptor:(PXViewSpecDescriptor *)a5 extendedTraitCollection:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [v9 userInterfaceIdiom];
  uint64_t v11 = [v9 layoutSizeClass];
  uint64_t v12 = [v9 layoutOrientation];

  if ((unint64_t)(a5->var0 - 1900) >= 0x64) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = (LOBYTE(a5->var0) - 108) % 0xFu;
  }
  int64_t v14 = PXMemorySpecSetForTileKind(v13, v10, v11, v12);
  int64_t v15 = PXMemorySpecVariantForTileKind(v13, v10, v11, v12);
  if (a3) {
    *a3 = v14;
  }
  if (a4) {
    *a4 = v15;
  }
}

+ (id)supportedTitleFontNames
{
  if (supportedTitleFontNames_onceToken != -1) {
    dispatch_once(&supportedTitleFontNames_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)supportedTitleFontNames_supportedFontNames;
  return v2;
}

void __46__PXMemoriesFontsSpec_supportedTitleFontNames__block_invoke()
{
  id v3 = +[PXMemoriesFontsSpec _fontSetByTitleFontName];
  v0 = [v3 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  v2 = (void *)supportedTitleFontNames_supportedFontNames;
  supportedTitleFontNames_supportedFontNames = v1;
}

+ (id)_titleFontNameByFontSet
{
  if (_titleFontNameByFontSet_onceToken != -1) {
    dispatch_once(&_titleFontNameByFontSet_onceToken, &__block_literal_global_55_184920);
  }
  v2 = (void *)_titleFontNameByFontSet_titleFontNameByFontSet;
  return v2;
}

void __46__PXMemoriesFontsSpec__titleFontNameByFontSet__block_invoke()
{
  v0 = +[PXMemoriesFontsSpec _fontSetByTitleFontName];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v0, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PXMemoriesFontsSpec__titleFontNameByFontSet__block_invoke_2;
  v5[3] = &unk_1E5DCB200;
  id v6 = v1;
  id v2 = v1;
  [v0 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)_titleFontNameByFontSet_titleFontNameByFontSet;
  _titleFontNameByFontSet_titleFontNameByFontSet = v3;
}

uint64_t __46__PXMemoriesFontsSpec__titleFontNameByFontSet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_fontSetByTitleFontName
{
  if (_fontSetByTitleFontName_onceToken != -1) {
    dispatch_once(&_fontSetByTitleFontName_onceToken, &__block_literal_global_49_184923);
  }
  id v2 = (void *)_fontSetByTitleFontName_fontSets;
  return v2;
}

void __46__PXMemoriesFontsSpec__fontSetByTitleFontName__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *(void *)off_1E5DAB018;
  v3[0] = *(void *)off_1E5DAB020;
  v3[1] = v0;
  v4[0] = &unk_1F02D8F68;
  v4[1] = &unk_1F02D8F80;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  id v2 = (void *)_fontSetByTitleFontName_fontSets;
  _fontSetByTitleFontName_fontSets = v1;
}

+ (id)memoriesFontsSpecForDescriptor:(PXViewSpecDescriptor *)a3 extendedTraitCollection:(id)a4
{
  id v6 = a4;
  memset(&v28[8], 0, 48);
  *(void *)v28 = 2;
  CGSize var2 = a3->var2;
  long long v24 = *(_OWORD *)&a3->var0;
  CGSize v25 = var2;
  [a1 _getSpecSet:&v28[8] variant:&v28[16] forDescriptor:&v24 extendedTraitCollection:v6];
  *(CGSize *)&v28[24] = a3->var2;
  [v6 layoutMargins];
  double v9 = v8;
  uint64_t v10 = +[PXMemoriesRelatedSettings sharedInstance];
  int v11 = [v10 enableIPadWideHeader];
  BOOL v12 = *(void *)&v28[8] == 0;

  double v13 = fmin(v9, 20.0);
  if ((v11 & v12) != 0) {
    double v13 = v9;
  }
  if (v13 == 0.0)
  {
    BOOL v14 = *(void *)&v28[16] == 4 && *(void *)&v28[8] == 0;
    double v13 = 24.0;
    if (!v14) {
      double v13 = 20.0;
    }
  }
  *(double *)&v28[40] = v13;
  char v15 = 1;
  if (v6 && (a3->var1 & 0x1000) == 0 && !*(void *)&v28[8])
  {
    uint64_t v16 = [v6 userInterfaceIdiom];
    BOOL v17 = [v6 userInterfaceIdiom] == 1 && objc_msgSend(v6, "layoutOrientation") == 2;
    char v18 = !v17;
    if (v16 == 2) {
      char v15 = 0;
    }
    else {
      char v15 = v18;
    }
  }
  v28[48] = v15;
  objc_super v19 = +[PXMemoriesFontsSpec _fontSpecCache];
  long long v24 = *(_OWORD *)v28;
  CGSize v25 = *(CGSize *)&v28[16];
  long long v26 = *(_OWORD *)&v28[32];
  uint64_t v27 = *(void *)&v28[48];
  v20 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithMemoryFontsSpecIdentifier:", &v24);
  v21 = [v19 objectForKey:v20];
  if (!v21)
  {
    id v22 = objc_alloc((Class)a1);
    long long v24 = *(_OWORD *)v28;
    CGSize v25 = *(CGSize *)&v28[16];
    long long v26 = *(_OWORD *)&v28[32];
    uint64_t v27 = *(void *)&v28[48];
    v21 = (void *)[v22 _initWithIdentifier:&v24];
    [v19 setObject:v21 forKey:v20];
  }

  return v21;
}

+ (UIEdgeInsets)paddingForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 layoutMargins:(UIEdgeInsets)a6 width:(double)a7 shouldScale:(BOOL)a8 forHeaderTile:(BOOL)a9
{
}

+ (double)baselineDistanceForFontSet:(int64_t)a3 specSet:(int64_t)a4 variant:(int64_t)a5 size:(CGSize)a6 shouldScale:(BOOL)a7
{
  BOOL v7 = a7;
  double width = a6.width;
  double result = _BaselineDistanceForFontSetSpecSetVariant(a3, a4);
  if (v7)
  {
    double v12 = round(width);
    double v13 = 0.913999975;
    if (a5 != 4) {
      double v13 = 1.0;
    }
    if (v12 <= 0.0) {
      return round(result * v13);
    }
    if (a4 == 2) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = a4;
    }
    if (v14 == 1)
    {
      BOOL v16 = a5 == 2;
      BOOL v17 = (double *)&unk_1AB359F30;
    }
    else
    {
      double v15 = 0.0;
      if (v14)
      {
LABEL_13:
        double v13 = v13 * (v12 / v15);
        return round(result * v13);
      }
      BOOL v16 = a5 == 4;
      BOOL v17 = (double *)&unk_1AB359F40;
    }
    double v15 = v17[v16];
    goto LABEL_13;
  }
  return result;
}

+ (id)textAttributesForFontSet:(int64_t)a3 specSet:(int64_t)a4 labelKind:(int64_t)a5 variant:(int64_t)a6 size:(CGSize)a7 shouldScale:(BOOL)a8
{
  BOOL v8 = a8;
  double width = a7.width;
  double v15 = _FontNameForFontSetSpecSetVariant(a5, a3);
  uint64_t v16 = [a1 capitalizationStyleForLabelKind:a5];
  double v17 = (double)_FontSizeForFontSetSpecSetVariant(a5, a3, a4, a6);
  double v18 = _TrackingForSpecSet(a5, a3);
  double v19 = _LineHeightForSpecSet(a5, a3, a4, a6);
  if (a3 && v8)
  {
    double v20 = 0.913999975;
    if (a6 != 4) {
      double v20 = 1.0;
    }
    if (width <= 0.0) {
      goto LABEL_15;
    }
    if (a4 == 2) {
      int64_t v21 = 1;
    }
    else {
      int64_t v21 = a4;
    }
    if (v21 == 1)
    {
      BOOL v23 = a6 == 2;
      long long v24 = (double *)&unk_1AB359F30;
    }
    else
    {
      double v22 = 0.0;
      if (v21)
      {
LABEL_14:
        double v20 = v20 * (width / v22);
LABEL_15:
        double v19 = round(v19 * v20);
        double v17 = round(v20 * v17);
        goto LABEL_16;
      }
      BOOL v23 = a6 == 4;
      long long v24 = (double *)&unk_1AB359F40;
    }
    double v22 = v24[v23];
    goto LABEL_14;
  }
LABEL_16:
  id v25 = objc_alloc_init(MEMORY[0x1E4FB0858]);
  [v25 setShadowBlurRadius:5.0];
  long long v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.100000001];
  [v25 setShadowColor:v26];

  objc_msgSend(v25, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  uint64_t v27 = [a1 textAttributesForFontName:v15 fontSize:v25 lineHeight:v16 tracking:v17 stroke:v19 shadow:v18 capitalizationStyle:0.0];

  return v27;
}

+ (id)textAttributesForFontName:(id)a3 fontSize:(double)a4 lineHeight:(double)a5 tracking:(double)a6 stroke:(double)a7 shadow:(id)a8 capitalizationStyle:(int64_t)a9
{
  id v10 = a3;
  id v11 = a8;
  [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  objc_claimAutoreleasedReturnValue();
  if (v10) {
    PXFontCreate();
  }
  PXFloatApproximatelyEqualToFloat();
}

+ (int64_t)numberOfLinesForLabelKind:(int64_t)a3
{
  if (!a3) {
    return 2;
  }
  if (a3 != 1)
  {
    uint64_t v13 = v4;
    uint64_t v14 = v3;
    double v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
    [v12 handleFailureInMethod:a2 object:a1 file:@"PXMemoriesFontsSpec.m" lineNumber:423 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 1;
}

+ (int64_t)capitalizationStyleForLabelKind:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 != 1)
  {
    uint64_t v13 = v4;
    uint64_t v14 = v3;
    double v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
    [v12 handleFailureInMethod:a2 object:a1 file:@"PXMemoriesFontsSpec.m" lineNumber:413 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 3;
}

+ (id)_fontSpecCache
{
  if (_fontSpecCache_onceToken != -1) {
    dispatch_once(&_fontSpecCache_onceToken, &__block_literal_global_184938);
  }
  id v2 = (void *)_fontSpecCache_cache;
  return v2;
}

void __37__PXMemoriesFontsSpec__fontSpecCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = (void *)_fontSpecCache_cache;
  _fontSpecCache_cache = (uint64_t)v0;
}

+ (void)preloadFontsSpecsForExtendedTraitCollection:(id)a3
{
  if (a3)
  {
    uint64_t v4 = +[PXPreloadScheduler sharedScheduler];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke;
    v6[3] = &unk_1E5DD08D8;
    id v7 = v4;
    id v8 = a1;
    id v5 = v4;
    [v5 scheduleTaskWithQoS:1 block:v6];
  }
}

void __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke(uint64_t a1)
{
  id v2 = +[PXMemoriesFontsSpec _fontSpecCache];
  uint64_t v3 = 0;
  char v4 = 1;
  long long v13 = *MEMORY[0x1E4F1DB30];
  do
  {
    char v5 = 0;
    char v12 = v4;
    uint64_t v6 = (uint64_t *)*((void *)&xmmword_1AB334290 + v3);
    uint64_t v7 = 1;
    do
    {
      char v8 = v5;
      uint64_t v18 = v7;
      double v19 = v6;
      uint64_t v20 = 0;
      long long v21 = v13;
      id v22 = 0;
      uint64_t v23 = 0;
      double v9 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithMemoryFontsSpecIdentifier:", &v18);
      uint64_t v18 = 0;
      double v19 = &v18;
      uint64_t v20 = 0x3032000000;
      *(void *)&long long v21 = __Block_byref_object_copy__184942;
      *((void *)&v21 + 1) = __Block_byref_object_dispose__184943;
      id v22 = [v2 objectForKey:v9];
      if (!v19[5])
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke_39;
        v14[3] = &unk_1E5DC2AE8;
        id v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        v14[4] = &v18;
        v14[5] = v11;
        v14[6] = v7;
        v14[7] = v6;
        v14[8] = 0;
        long long v15 = v13;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        [v10 scheduleMainQueueTaskAndWait:v14];
        [v2 setObject:v19[5] forKey:v9];
      }
      _Block_object_dispose(&v18, 8);

      char v5 = 1;
      uint64_t v7 = 2;
    }
    while ((v8 & 1) == 0);
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v12 & 1) != 0);
}

void __67__PXMemoriesFontsSpec_preloadFontsSpecsForExtendedTraitCollection___block_invoke_39(uint64_t a1)
{
  id v2 = objc_alloc(*(Class *)(a1 + 40));
  long long v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v4 = [v2 _initWithIdentifier:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end