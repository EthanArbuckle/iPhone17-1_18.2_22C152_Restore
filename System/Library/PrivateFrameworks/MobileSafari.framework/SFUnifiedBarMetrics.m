@interface SFUnifiedBarMetrics
+ (NSArray)traitsAffectingBarMetrics;
+ (double)defaultItemHeight;
+ (double)defaultSquishedContentSpacing;
+ (double)minimumSquishScale;
+ (double)separatorWidth;
+ (double)squishedInlineBarHeight;
+ (double)transitioningItemScale;
- (BOOL)_updateWithContentSizeCategory:(id)a3 legibilityWeight:(int64_t)a4;
- (BOOL)updateWithTraitCollection:(id)a3;
- (SFUnifiedBarMetrics)initWithTraitCollection:(id)a3;
- (double)_scaledValueForValue:(double)a3;
- (double)cutoutBorderWidth;
- (double)defaultItemHeight;
- (double)itemCornerRadius;
- (double)itemHeight;
- (double)leadingTabIconInset;
- (double)maximumItemSpacing;
- (double)minimumItemSpacing;
- (double)squishedInlineBarHeight;
- (double)tabCloseButtonWidth;
- (int64_t)metricsCategory;
- (void)_updateMetrics;
- (void)setMetricsCategory:(int64_t)a3;
@end

@implementation SFUnifiedBarMetrics

+ (NSArray)traitsAffectingBarMetrics
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

+ (double)defaultItemHeight
{
  return 36.0;
}

+ (double)minimumSquishScale
{
  return 0.7;
}

+ (double)separatorWidth
{
  return 2.0;
}

+ (double)squishedInlineBarHeight
{
  return 19.0;
}

+ (double)transitioningItemScale
{
  return 0.8;
}

+ (double)defaultSquishedContentSpacing
{
  return 8.0;
}

- (SFUnifiedBarMetrics)initWithTraitCollection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarMetrics;
  v5 = [(SFUnifiedBarMetrics *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SFUnifiedBarMetrics *)v5 updateWithTraitCollection:v4];
    v7 = v6;
  }

  return v6;
}

- (void)setMetricsCategory:(int64_t)a3
{
  if (self->_metricsCategory != a3)
  {
    self->_metricsCategory = a3;
    [(SFUnifiedBarMetrics *)self _updateMetrics];
  }
}

- (BOOL)updateWithTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredContentSizeCategory];
  uint64_t v6 = [v4 legibilityWeight];

  LOBYTE(self) = [(SFUnifiedBarMetrics *)self _updateWithContentSizeCategory:v5 legibilityWeight:v6];
  return (char)self;
}

- (BOOL)_updateWithContentSizeCategory:(id)a3 legibilityWeight:(int64_t)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(UITraitCollection *)self->_traitCollection preferredContentSizeCategory];
  if (!WBSIsEqual())
  {

    goto LABEL_5;
  }
  UILegibilityWeight v8 = [(UITraitCollection *)self->_traitCollection legibilityWeight];

  if (v8 != a4)
  {
LABEL_5:
    v10 = (void *)MEMORY[0x1E4FB1E20];
    v11 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v6];
    v17[0] = v11;
    v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:a4];
    v17[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v14 = [v10 traitCollectionWithTraitsFromCollections:v13];
    traitCollection = self->_traitCollection;
    self->_traitCollection = v14;

    [(SFUnifiedBarMetrics *)self _updateMetrics];
    BOOL v9 = 1;
    goto LABEL_6;
  }
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (void)_updateMetrics
{
  [(SFUnifiedBarMetrics *)self defaultItemHeight];
  double v4 = v3;
  -[SFUnifiedBarMetrics _scaledValueForValue:](self, "_scaledValueForValue:");
  self->_itemHeight = fmax(v5, v4);
  [(id)objc_opt_class() squishedInlineBarHeight];
  -[SFUnifiedBarMetrics _scaledValueForValue:](self, "_scaledValueForValue:");
  self->_squishedInlineBarHeight = v6;
}

- (double)_scaledValueForValue:(double)a3
{
  double v5 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v5 scaledValueForValue:self->_traitCollection compatibleWithTraitCollection:a3];
  double v7 = v6;

  return v7;
}

- (double)cutoutBorderWidth
{
  return 2.0;
}

- (double)defaultItemHeight
{
  double result = 36.0;
  if (self->_metricsCategory) {
    return 28.0;
  }
  return result;
}

- (double)itemCornerRadius
{
  return 10.0;
}

- (double)leadingTabIconInset
{
  double result = 7.0;
  if (!self->_metricsCategory) {
    return 10.0;
  }
  return result;
}

- (double)maximumItemSpacing
{
  return 34.0;
}

- (double)minimumItemSpacing
{
  return 20.0;
}

- (double)tabCloseButtonWidth
{
  double result = 33.0;
  if (!self->_metricsCategory) {
    return 36.0;
  }
  return result;
}

- (int64_t)metricsCategory
{
  return self->_metricsCategory;
}

- (double)itemHeight
{
  return self->_itemHeight;
}

- (double)squishedInlineBarHeight
{
  return self->_squishedInlineBarHeight;
}

- (void).cxx_destruct
{
}

@end