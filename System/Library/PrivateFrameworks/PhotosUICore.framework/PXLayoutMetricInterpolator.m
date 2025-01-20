@interface PXLayoutMetricInterpolator
+ (CGSize)bestItemSizeForAvailableWidth:(double)a3 screenScale:(double)a4 columns:(unint64_t)a5 bestSpacing:(double *)a6 bestInset:(double *)a7;
+ (CGSize)zoomableGridLayoutSmallItemSizeForWidth:(double)a3;
+ (NSArray)allLayoutMetricConfigurationSizes;
+ (double)locketGadgetColumnWidthForLayoutWidth:(CGSize)a3 layoutMargins:(double)a4 interSpacing:(double)a5 isPhone:(BOOL)a6;
+ (id)_gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:(id)a3;
+ (id)_sharedGridEdgeInsetsInterpolator;
+ (id)_sharedGridItemWidthInterpolator;
+ (id)albumsGridEdgeInsetsInterpolator;
+ (id)albumsGridItemWidthInterpolator;
+ (id)gadgetColumnSpacingSpanDoubleSetAInterpolator;
+ (id)gadgetColumnSpacingSpanDoubleSetBInterpolator;
+ (id)gadgetColumnSpacingSpanSingleSetAInterpolator;
+ (id)gadgetColumnWidthSpanDoubleSetAInterpolator;
+ (id)gadgetColumnWidthSpanDoubleSetBInterpolator;
+ (id)gadgetColumnWidthSpanSingleSetAInterpolator;
+ (id)layoutMarginWidthInterpolator;
+ (id)legacyLayoutMarginWidthInterpolator;
+ (id)memoriesFeedLandscapeEdgeInsetsInterpolator;
+ (id)photosDetailsEdgeInsetsInterpolator;
+ (int64_t)photosGridSizeSubclassForScreenSize:(CGSize)a3;
+ (unint64_t)photosGridLayoutColumnsForWidth:(double)a3;
- (NSMutableArray)_referenceValuesByMetrics;
- (NSValue)_cachedValue;
- (PXLayoutMetricInterpolator)init;
- (double)_cachedMetric;
- (double)valueForMetric:(double)a3;
- (id)_valueForMetric:(double)a3 fromInterpolationBetweenValue:(id)a4 secondValue:(id)a5;
- (id)description;
- (void)_getReferenceValueForMetric:(double)a3 exactMatch:(id *)a4 closestBeforeMatch:(id *)a5 closestAfterMatch:(id *)a6;
- (void)_invalidateReferenceValuesByMetricsOrder;
- (void)_setCachedMetric:(double)a3;
- (void)_setCachedValue:(id)a3;
- (void)_updateReferenceValuesByMetricsOrderIfNeeded;
- (void)setReferenceValue:(double)a3 forMetric:(double)a4;
@end

@implementation PXLayoutMetricInterpolator

void __59__PXLayoutMetricInterpolator_layoutMarginWidthInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)layoutMarginWidthInterpolator_interpolator;
  layoutMarginWidthInterpolator_interpolator = (uint64_t)v0;

  id v2 = (id)layoutMarginWidthInterpolator_interpolator;
  [v2 setReferenceValue:16.0 forMetric:320.0];
  [v2 setReferenceValue:20.0 forMetric:375.0];
  [v2 setReferenceValue:20.0 forMetric:375.0];
  [v2 setReferenceValue:20.0 forMetric:414.0];
  [v2 setReferenceValue:20.0 forMetric:414.0];
  [v2 setReferenceValue:22.0 forMetric:428.0];
  [v2 setReferenceValue:34.0 forMetric:768.0];
  [v2 setReferenceValue:46.0 forMetric:834.0];
  [v2 setReferenceValue:52.0 forMetric:1024.0];
  [v2 setReferenceValue:52.0 forMetric:568.0];
  [v2 setReferenceValue:62.0 forMetric:667.0];
  [v2 setReferenceValue:60.0 forMetric:812.0];
  [v2 setReferenceValue:66.0 forMetric:736.0];
  [v2 setReferenceValue:64.0 forMetric:896.0];
  [v2 setReferenceValue:64.0 forMetric:926.0];
  [v2 setReferenceValue:52.0 forMetric:1024.0];
  [v2 setReferenceValue:31.0 forMetric:1112.0];
  [v2 setReferenceValue:52.0 forMetric:1366.0];
}

- (void)setReferenceValue:(double)a3 forMetric:(double)a4
{
  id v9 = [(PXLayoutMetricInterpolator *)self _referenceValuesByMetrics];
  uint64_t v7 = _IndexOfReferenceValueForMetricWithOptions(v9, 256, a4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v9 removeObjectAtIndex:v7];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a4, a3);
  [v9 addObject:v8];

  [(PXLayoutMetricInterpolator *)self _invalidateReferenceValuesByMetricsOrder];
}

- (NSMutableArray)_referenceValuesByMetrics
{
  return self->__referenceValuesByMetrics;
}

- (void)_invalidateReferenceValuesByMetricsOrder
{
  self->_needsUpdateFlags.referenceValuesByMetricsOrder = 1;
  [(PXLayoutMetricInterpolator *)self _setCachedMetric:0.0];
  [(PXLayoutMetricInterpolator *)self _setCachedValue:0];
  [(PXLayoutMetricInterpolator *)self _setNeedsUpdate];
}

- (void)_setCachedValue:(id)a3
{
}

- (void)_setCachedMetric:(double)a3
{
  self->__cachedMetric = a3;
}

- (PXLayoutMetricInterpolator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXLayoutMetricInterpolator;
  id v2 = [(PXLayoutMetricInterpolator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    referenceValuesByMetrics = v2->__referenceValuesByMetrics;
    v2->__referenceValuesByMetrics = (NSMutableArray *)v3;
  }
  return v2;
}

+ (id)layoutMarginWidthInterpolator
{
  if (layoutMarginWidthInterpolator_onceToken != -1) {
    dispatch_once(&layoutMarginWidthInterpolator_onceToken, &__block_literal_global_11);
  }
  id v2 = (void *)layoutMarginWidthInterpolator_interpolator;
  return v2;
}

- (double)valueForMetric:(double)a3
{
  [(PXLayoutMetricInterpolator *)self _cachedMetric];
  if (v5 != a3)
  {
    id v18 = 0;
    id v19 = 0;
    id v17 = 0;
    [(PXLayoutMetricInterpolator *)self _getReferenceValueForMetric:&v19 exactMatch:&v18 closestBeforeMatch:&v17 closestAfterMatch:a3];
    id v9 = v19;
    id v10 = v18;
    id v11 = v17;
    v12 = v11;
    if (v9)
    {
      id v13 = v9;
    }
    else if (!v10 || v11)
    {
      if (v10 || !v11)
      {
        v14 = 0;
        if (!v10 || !v11) {
          goto LABEL_15;
        }
        id v13 = [(PXLayoutMetricInterpolator *)self _valueForMetric:v10 fromInterpolationBetweenValue:v11 secondValue:a3];
      }
      else
      {
        id v13 = v11;
      }
    }
    else
    {
      id v13 = v10;
    }
    v14 = v13;
LABEL_15:
    [(PXLayoutMetricInterpolator *)self _setCachedMetric:a3];
    [(PXLayoutMetricInterpolator *)self _setCachedValue:v14];
    [v14 CGPointValue];
    double v8 = v15;

    return v8;
  }
  objc_super v6 = [(PXLayoutMetricInterpolator *)self _cachedValue];
  [v6 CGPointValue];
  double v8 = v7;

  return v8;
}

- (double)_cachedMetric
{
  return self->__cachedMetric;
}

- (NSValue)_cachedValue
{
  return self->__cachedValue;
}

- (id)_valueForMetric:(double)a3 fromInterpolationBetweenValue:(id)a4 secondValue:(id)a5
{
  id v7 = a5;
  [a4 CGPointValue];
  double v9 = v8;
  double v11 = v10;
  [v7 CGPointValue];
  double v13 = v12;
  double v15 = v14;

  v16 = (void *)MEMORY[0x1E4F29238];
  return (id)objc_msgSend(v16, "valueWithCGPoint:", 0.0, v11 - (v15 - v11) / (v13 - v9) * v9 + (v15 - v11) / (v13 - v9) * a3);
}

+ (unint64_t)photosGridLayoutColumnsForWidth:(double)a3
{
  if (a3 >= 480.0) {
    return 5;
  }
  else {
    return 3;
  }
}

- (void)_getReferenceValueForMetric:(double)a3 exactMatch:(id *)a4 closestBeforeMatch:(id *)a5 closestAfterMatch:(id *)a6
{
  id v14 = [(PXLayoutMetricInterpolator *)self _referenceValuesByMetrics];
  if ([v14 count])
  {
    [(PXLayoutMetricInterpolator *)self _updateReferenceValuesByMetricsOrderIfNeeded];
    unint64_t v11 = _IndexOfReferenceValueForMetricWithOptions(v14, 1024, a3);
    if (v11 < [v14 count])
    {
      double v12 = [v14 objectAtIndex:v11];
      [v12 CGPointValue];
      if (v13 == a3)
      {
        a6 = a4;
        if (!a4)
        {
LABEL_6:

          goto LABEL_9;
        }
      }
      else
      {
        if (a5 && v11)
        {
          *a5 = [v14 objectAtIndexedSubscript:v11 - 1];
        }
        if (!a6) {
          goto LABEL_6;
        }
      }
      *a6 = v12;
      goto LABEL_6;
    }
    if (a5)
    {
      *a5 = [v14 lastObject];
    }
  }
LABEL_9:
}

- (void)_updateReferenceValuesByMetricsOrderIfNeeded
{
  if (self->_needsUpdateFlags.referenceValuesByMetricsOrder)
  {
    self->_needsUpdateFlags.referenceValuesByMetricsOrder = 0;
    id v2 = [(PXLayoutMetricInterpolator *)self _referenceValuesByMetrics];
    [v2 sortUsingComparator:&__block_literal_global_129];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedValue, 0);
  objc_storeStrong((id *)&self->__referenceValuesByMetrics, 0);
}

- (id)description
{
  [(PXLayoutMetricInterpolator *)self _updateReferenceValuesByMetricsOrderIfNeeded];
  uint64_t v3 = [(PXLayoutMetricInterpolator *)self _referenceValuesByMetrics];
  v4 = [NSString stringWithFormat:@"<%@:%p, (%@)>", objc_opt_class(), self, v3];

  return v4;
}

+ (double)locketGadgetColumnWidthForLayoutWidth:(CGSize)a3 layoutMargins:(double)a4 interSpacing:(double)a5 isPhone:(BOOL)a6
{
  if (a6)
  {
    if (a3.width <= a3.height)
    {
      unint64_t v7 = 3;
      return (a3.width - a4 - a5 * (double)(v7 - 1)) / (double)v7;
    }
    BOOL v6 = a3.height / a3.width <= 0.472;
    unint64_t v7 = 6;
    uint64_t v8 = 4;
  }
  else
  {
    BOOL v6 = a3.width <= a3.height;
    unint64_t v7 = 2;
    uint64_t v8 = 3;
  }
  if (!v6) {
    unint64_t v7 = v8;
  }
  return (a3.width - a4 - a5 * (double)(v7 - 1)) / (double)v7;
}

+ (CGSize)bestItemSizeForAvailableWidth:(double)a3 screenScale:(double)a4 columns:(unint64_t)a5 bestSpacing:(double *)a6 bestInset:(double *)a7
{
  double v8 = 0.0;
  if (a3 > 0.0 && a4 > 0.0) {
    PXFloatFloorToPixel();
  }
  double v9 = round(a4);
  if (a4 <= 0.0) {
    double v9 = 1.0;
  }
  double v10 = (double)(a5 - 1);
  double v11 = round(v9 + v9);
  double v12 = floor((v9 * 0.0 - v11 * v10) / (double)a5);
  double v13 = round(v9 * 0.0 - (v11 * v10 + v12 * (double)a5 + 0.0));
  if (v13 <= 0.0)
  {
    double v14 = v11;
    if (a6) {
LABEL_24:
    }
      *a6 = v14 / v9;
  }
  else
  {
    double v14 = v11;
    double v15 = v13;
    do
    {
      if (v13 < v11 + v11 || (v8 == 0.0 ? (BOOL v16 = v14 - v8 < v9 + v9) : (BOOL v16 = 1), v16))
      {
        if (v13 >= v10)
        {
          double v14 = v14 + 1.0;
          double v13 = v13 - v10;
        }
        else if (v13 < 2.0 || v8 < v11)
        {
          double v12 = v12 + -1.0;
          double v15 = v15 + (double)a5;
          double v8 = 0.0;
          double v13 = v15;
          double v14 = v11;
        }
        else
        {
          double v8 = v8 + 1.0;
          double v13 = v13 + -2.0;
        }
      }
      else
      {
        double v13 = v13 + -v11 * 2.0;
        double v8 = v11;
      }
    }
    while (v13 > 0.0);
    if (a6) {
      goto LABEL_24;
    }
  }
  if (a7) {
    *a7 = v8 / v9;
  }
  double v18 = v12 / v9;
  double v19 = v18;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (CGSize)zoomableGridLayoutSmallItemSizeForWidth:(double)a3
{
  BOOL v3 = a3 <= 480.0;
  double v4 = 10.0;
  if (!v3) {
    double v4 = 11.0;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (int64_t)photosGridSizeSubclassForScreenSize:(CGSize)a3
{
  if (a3.width > a3.height) {
    a3.width = a3.height;
  }
  int64_t v3 = 3;
  if (a3.width != 414.0) {
    int64_t v3 = 1;
  }
  if (a3.width == 375.0) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (NSArray)allLayoutMetricConfigurationSizes
{
  if (allLayoutMetricConfigurationSizes_onceToken != -1) {
    dispatch_once(&allLayoutMetricConfigurationSizes_onceToken, &__block_literal_global_25);
  }
  id v2 = (void *)allLayoutMetricConfigurationSizes_configurations;
  return (NSArray *)v2;
}

void __63__PXLayoutMetricInterpolator_allLayoutMetricConfigurationSizes__block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 320.0, 480.0);
  v1 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 320.0, 568.0, v0);
  v7[1] = v1;
  id v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 375.0, 667.0);
  v7[2] = v2;
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 414.0, 736.0);
  v7[3] = v3;
  double v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 375.0, 812.0);
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  BOOL v6 = (void *)allLayoutMetricConfigurationSizes_configurations;
  allLayoutMetricConfigurationSizes_configurations = v5;
}

+ (id)gadgetColumnWidthSpanDoubleSetBInterpolator
{
  if (gadgetColumnWidthSpanDoubleSetBInterpolator_onceToken != -1) {
    dispatch_once(&gadgetColumnWidthSpanDoubleSetBInterpolator_onceToken, &__block_literal_global_23);
  }
  id v2 = (void *)gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator;
  return v2;
}

void __73__PXLayoutMetricInterpolator_gadgetColumnWidthSpanDoubleSetBInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator;
  gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator;
  _ConfigureGadgetColumnWidthAndSpacingSetBReferenceValues(0, v2);
}

+ (id)gadgetColumnSpacingSpanDoubleSetBInterpolator
{
  if (gadgetColumnSpacingSpanDoubleSetBInterpolator_onceToken != -1) {
    dispatch_once(&gadgetColumnSpacingSpanDoubleSetBInterpolator_onceToken, &__block_literal_global_21);
  }
  id v2 = (void *)gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator;
  return v2;
}

void __75__PXLayoutMetricInterpolator_gadgetColumnSpacingSpanDoubleSetBInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator;
  gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator;
  _ConfigureGadgetColumnWidthAndSpacingSetBReferenceValues(v2, 0);
}

+ (id)gadgetColumnWidthSpanDoubleSetAInterpolator
{
  if (gadgetColumnWidthSpanDoubleSetAInterpolator_onceToken != -1) {
    dispatch_once(&gadgetColumnWidthSpanDoubleSetAInterpolator_onceToken, &__block_literal_global_19_24141);
  }
  id v2 = (void *)gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator;
  return v2;
}

void __73__PXLayoutMetricInterpolator_gadgetColumnWidthSpanDoubleSetAInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator;
  gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator;
  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(2uLL, 0, v2);
}

+ (id)gadgetColumnSpacingSpanDoubleSetAInterpolator
{
  if (gadgetColumnSpacingSpanDoubleSetAInterpolator_onceToken != -1) {
    dispatch_once(&gadgetColumnSpacingSpanDoubleSetAInterpolator_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator;
  return v2;
}

void __75__PXLayoutMetricInterpolator_gadgetColumnSpacingSpanDoubleSetAInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator;
  gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator;
  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(2uLL, v2, 0);
}

+ (id)gadgetColumnWidthSpanSingleSetAInterpolator
{
  if (gadgetColumnWidthSpanSingleSetAInterpolator_onceToken != -1) {
    dispatch_once(&gadgetColumnWidthSpanSingleSetAInterpolator_onceToken, &__block_literal_global_15);
  }
  id v2 = (void *)gadgetColumnWidthSpanSingleSetAInterpolator_interpolator;
  return v2;
}

void __73__PXLayoutMetricInterpolator_gadgetColumnWidthSpanSingleSetAInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnWidthSpanSingleSetAInterpolator_interpolator;
  gadgetColumnWidthSpanSingleSetAInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)gadgetColumnWidthSpanSingleSetAInterpolator_interpolator;
  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(1uLL, 0, v2);
}

+ (id)gadgetColumnSpacingSpanSingleSetAInterpolator
{
  if (gadgetColumnSpacingSpanSingleSetAInterpolator_onceToken != -1) {
    dispatch_once(&gadgetColumnSpacingSpanSingleSetAInterpolator_onceToken, &__block_literal_global_13);
  }
  id v2 = (void *)gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator;
  return v2;
}

void __75__PXLayoutMetricInterpolator_gadgetColumnSpacingSpanSingleSetAInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator;
  gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator;
  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(1uLL, v2, 0);
}

+ (id)photosDetailsEdgeInsetsInterpolator
{
  if (photosDetailsEdgeInsetsInterpolator_onceToken != -1) {
    dispatch_once(&photosDetailsEdgeInsetsInterpolator_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)photosDetailsEdgeInsetsInterpolator_interpolator;
  return v2;
}

void __65__PXLayoutMetricInterpolator_photosDetailsEdgeInsetsInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)photosDetailsEdgeInsetsInterpolator_interpolator;
  photosDetailsEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  id v2 = (id)photosDetailsEdgeInsetsInterpolator_interpolator;
  [v2 setReferenceValue:16.0 forMetric:320.0];
  [v2 setReferenceValue:16.0 forMetric:375.0];
  [v2 setReferenceValue:16.0 forMetric:375.0];
  [v2 setReferenceValue:16.0 forMetric:414.0];
  [v2 setReferenceValue:16.0 forMetric:414.0];
  [v2 setReferenceValue:16.0 forMetric:768.0];
  [v2 setReferenceValue:16.0 forMetric:834.0];
  [v2 setReferenceValue:16.0 forMetric:1024.0];
  [v2 setReferenceValue:16.0 forMetric:568.0];
  [v2 setReferenceValue:16.0 forMetric:667.0];
  [v2 setReferenceValue:32.0 forMetric:812.0];
  [v2 setReferenceValue:32.0 forMetric:736.0];
  [v2 setReferenceValue:32.0 forMetric:896.0];
  [v2 setReferenceValue:32.0 forMetric:844.0];
  [v2 setReferenceValue:32.0 forMetric:926.0];
  [v2 setReferenceValue:16.0 forMetric:1024.0];
  [v2 setReferenceValue:16.0 forMetric:1112.0];
  [v2 setReferenceValue:16.0 forMetric:1366.0];
}

+ (id)legacyLayoutMarginWidthInterpolator
{
  if (legacyLayoutMarginWidthInterpolator_onceToken != -1) {
    dispatch_once(&legacyLayoutMarginWidthInterpolator_onceToken, &__block_literal_global_7);
  }
  id v2 = (void *)legacyLayoutMarginWidthInterpolator_interpolator;
  return v2;
}

void __65__PXLayoutMetricInterpolator_legacyLayoutMarginWidthInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)legacyLayoutMarginWidthInterpolator_interpolator;
  legacyLayoutMarginWidthInterpolator_interpolator = (uint64_t)v0;

  id v2 = (void *)legacyLayoutMarginWidthInterpolator_interpolator;
  _ConfigureStandardLayoutMarginValues(v2);
}

+ (id)_gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:(id)a3
{
  id v3 = a3;
  double v4 = objc_alloc_init(PXLayoutMetricInterpolator);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __87__PXLayoutMetricInterpolator__gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator___block_invoke;
  double v13 = &unk_1E5DB1428;
  id v14 = v3;
  uint64_t v5 = v4;
  double v15 = v5;
  id v6 = v3;
  unint64_t v7 = (void (**)(void *, uint64_t, double, double))_Block_copy(&v10);
  v7[2](v7, 2, 16.0, 320.0);
  v7[2](v7, 2, 16.0, 375.0);
  v7[2](v7, 2, 20.0, 414.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v5, "setReferenceValue:forMetric:", 142.0, 467.0, v10, v11, v12, v13);
  [(PXLayoutMetricInterpolator *)v5 setReferenceValue:130.0 forMetric:523.0];
  [(PXLayoutMetricInterpolator *)v5 setReferenceValue:157.5 forMetric:567.0];
  [(PXLayoutMetricInterpolator *)v5 setReferenceValue:177.0 forMetric:633.333313];
  v7[2](v7, 3, 20.0, 490.0);
  v7[2](v7, 4, 20.0, 768.0);
  v7[2](v7, 4, 22.0, 834.0);
  v7[2](v7, 5, 30.0, 1024.0);
  v7[2](v7, 5, 32.0, 1112.0);
  v7[2](v7, 7, 24.0, 1366.0);
  double v8 = v5;

  return v8;
}

uint64_t __87__PXLayoutMetricInterpolator__gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  [*(id *)(a1 + 32) valueForMetric:a4];
  double v9 = 0.0;
  if (a2 >= 2) {
    double v9 = (double)(a2 - 1) * a3;
  }
  double v10 = (a4 + v8 * -2.0 - v9) / (double)a2;
  uint64_t v11 = *(void **)(a1 + 40);
  return objc_msgSend(v11, "setReferenceValue:forMetric:", v10);
}

+ (id)_sharedGridItemWidthInterpolator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXLayoutMetricInterpolator__sharedGridItemWidthInterpolator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedGridItemWidthInterpolator_onceToken != -1) {
    dispatch_once(&_sharedGridItemWidthInterpolator_onceToken, block);
  }
  id v2 = (void *)_sharedGridItemWidthInterpolator_interpolator;
  return v2;
}

void __62__PXLayoutMetricInterpolator__sharedGridItemWidthInterpolator__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _sharedGridEdgeInsetsInterpolator];
  uint64_t v2 = [*(id *)(a1 + 32) _gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:v4];
  id v3 = (void *)_sharedGridItemWidthInterpolator_interpolator;
  _sharedGridItemWidthInterpolator_interpolator = v2;
}

+ (id)_sharedGridEdgeInsetsInterpolator
{
  if (_sharedGridEdgeInsetsInterpolator_onceToken != -1) {
    dispatch_once(&_sharedGridEdgeInsetsInterpolator_onceToken, &__block_literal_global_4_24144);
  }
  uint64_t v2 = (void *)_sharedGridEdgeInsetsInterpolator_interpolator;
  return v2;
}

void __63__PXLayoutMetricInterpolator__sharedGridEdgeInsetsInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_sharedGridEdgeInsetsInterpolator_interpolator;
  _sharedGridEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  uint64_t v2 = (void *)_sharedGridEdgeInsetsInterpolator_interpolator;
  _ConfigureSharedReferenceValues(v2);
}

+ (id)albumsGridItemWidthInterpolator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXLayoutMetricInterpolator_albumsGridItemWidthInterpolator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (albumsGridItemWidthInterpolator_onceToken != -1) {
    dispatch_once(&albumsGridItemWidthInterpolator_onceToken, block);
  }
  uint64_t v2 = (void *)albumsGridItemWidthInterpolator_interpolator;
  return v2;
}

void __61__PXLayoutMetricInterpolator_albumsGridItemWidthInterpolator__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) albumsGridEdgeInsetsInterpolator];
  uint64_t v2 = [*(id *)(a1 + 32) _gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:v4];
  id v3 = (void *)albumsGridItemWidthInterpolator_interpolator;
  albumsGridItemWidthInterpolator_interpolator = v2;
}

+ (id)albumsGridEdgeInsetsInterpolator
{
  if (albumsGridEdgeInsetsInterpolator_onceToken != -1) {
    dispatch_once(&albumsGridEdgeInsetsInterpolator_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)albumsGridEdgeInsetsInterpolator_interpolator;
  return v2;
}

uint64_t __62__PXLayoutMetricInterpolator_albumsGridEdgeInsetsInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)albumsGridEdgeInsetsInterpolator_interpolator;
  albumsGridEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  _ConfigureSharedReferenceValues((void *)albumsGridEdgeInsetsInterpolator_interpolator);
  [(id)albumsGridEdgeInsetsInterpolator_interpolator setReferenceValue:20.0 forMetric:756.0];
  uint64_t v2 = (void *)albumsGridEdgeInsetsInterpolator_interpolator;
  return [v2 setReferenceValue:20.0 forMetric:838.0];
}

+ (id)memoriesFeedLandscapeEdgeInsetsInterpolator
{
  if (memoriesFeedLandscapeEdgeInsetsInterpolator_onceToken != -1) {
    dispatch_once(&memoriesFeedLandscapeEdgeInsetsInterpolator_onceToken, &__block_literal_global_24146);
  }
  uint64_t v2 = (void *)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator;
  return v2;
}

uint64_t __73__PXLayoutMetricInterpolator_memoriesFeedLandscapeEdgeInsetsInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator;
  memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  _ConfigureSharedReferenceValues((void *)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator);
  [(id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator setReferenceValue:65.0 forMetric:667.0];
  [(id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator setReferenceValue:156.0 forMetric:724.0];
  [(id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator setReferenceValue:156.0 forMetric:1024.0];
  [(id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator setReferenceValue:179.0 forMetric:1112.0];
  uint64_t v2 = (void *)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator;
  return [v2 setReferenceValue:187.0 forMetric:1366.0];
}

@end