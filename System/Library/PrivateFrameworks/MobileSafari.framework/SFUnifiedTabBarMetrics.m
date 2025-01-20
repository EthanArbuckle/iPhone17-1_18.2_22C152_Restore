@interface SFUnifiedTabBarMetrics
+ (double)_maximumActiveItemWidthForSizeClass:(unint64_t)a3;
+ (double)minimumActiveItemWidthForSizeClass:(unint64_t)a3;
+ (double)minimumInactiveItemWidthForSizeClass:(unint64_t)a3;
+ (id)_maximumActiveItemWidthDefaultsKeyForSizeClass:(unint64_t)a3;
- (SFUnifiedTabBarMetrics)initWithTraitCollection:(id)a3;
- (double)insetToRevealNextItem;
- (double)maximumActiveItemWidth;
- (double)maximumItemSpacing;
- (double)minimumActiveItemWidth;
- (double)minimumActiveItemWidthRatio;
- (double)minimumInactiveItemWidth;
- (double)minimumItemSpacing;
- (unint64_t)sizeClass;
- (void)_sizeClassDidChange;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSizeClass:(unint64_t)a3;
@end

@implementation SFUnifiedTabBarMetrics

- (SFUnifiedTabBarMetrics)initWithTraitCollection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedTabBarMetrics;
  v3 = [(SFUnifiedBarMetrics *)&v7 initWithTraitCollection:a3];
  v4 = v3;
  if (v3)
  {
    [(SFUnifiedTabBarMetrics *)v3 _sizeClassDidChange];
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 removeObserver:self forKeyPath:self->_maximumActiveItemWidthDefaultsKey context:&kvoContext];

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarMetrics;
  [(SFUnifiedTabBarMetrics *)&v4 dealloc];
}

- (void)setSizeClass:(unint64_t)a3
{
  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    [(SFUnifiedTabBarMetrics *)self _sizeClassDidChange];
  }
}

- (void)_sizeClassDidChange
{
  p_maximumActiveItemWidthDefaultsKey = &self->_maximumActiveItemWidthDefaultsKey;
  objc_super v7 = self->_maximumActiveItemWidthDefaultsKey;
  objc_super v4 = [(id)objc_opt_class() _maximumActiveItemWidthDefaultsKeyForSizeClass:self->_sizeClass];
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)p_maximumActiveItemWidthDefaultsKey, v4);
    if (v7)
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v5 removeObserver:self forKeyPath:v7 context:&kvoContext];
    }
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v6 addObserver:self forKeyPath:v4 options:4 context:&kvoContext];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kvoContext == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", self->_maximumActiveItemWidthDefaultsKey, a4, a5))
    {
      [(id)objc_opt_class() _maximumActiveItemWidthForSizeClass:self->_sizeClass];
      self->_maximumActiveItemWidth = v7;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFUnifiedTabBarMetrics;
    -[SFUnifiedTabBarMetrics observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (double)minimumActiveItemWidthForSizeClass:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      v6 = SFUnifiedBarMinimumLandscapeActiveTabWidthKey;
      goto LABEL_4;
    case 1uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      v6 = SFUnifiedBarMinimumPortraitActiveTabWidthKey;
LABEL_4:
      double v7 = *v6;
      double v8 = 330.0;
      goto LABEL_7;
    case 2uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      double v7 = @"DebugUnifiedBarMinimumNarrowActiveTabWidth";
      double v8 = 270.0;
      goto LABEL_7;
    case 3uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      double v7 = @"DebugUnifiedBarMinimumExtendedActiveTabWidth";
      double v8 = 500.0;
LABEL_7:
      objc_msgSend(v4, "safari_doubleForKey:defaultValue:", v7, v8);
      double v3 = v9;

      break;
    default:
      return v3;
  }
  return v3;
}

+ (double)minimumInactiveItemWidthForSizeClass:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      v6 = @"DebugUnifiedBarMinimumInactiveTabWidth";
      *(double *)&uint64_t v7 = 120.0;
      goto LABEL_6;
    case 1uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      double v8 = SFUnifiedBarMinimumPortraitInactiveTabWidthKey;
      goto LABEL_5;
    case 2uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      double v8 = SFUnifiedBarMinimumNarrowInactiveTabWidthKey;
LABEL_5:
      v6 = *v8;
      *(double *)&uint64_t v7 = 100.0;
LABEL_6:
      double v9 = *(double *)&v7;
      goto LABEL_8;
    case 3uLL:
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      v5 = v4;
      v6 = @"DebugUnifiedBarMinimumExtendedInactiveTabWidth";
      double v9 = 250.0;
LABEL_8:
      objc_msgSend(v4, "safari_doubleForKey:defaultValue:", v6, v9);
      double v3 = v10;

      break;
    default:
      return v3;
  }
  return v3;
}

- (double)insetToRevealNextItem
{
  return 12.0;
}

+ (double)_maximumActiveItemWidthForSizeClass:(unint64_t)a3
{
  v5 = objc_msgSend(a1, "_maximumActiveItemWidthDefaultsKeyForSizeClass:");
  if (a3 <= 2)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v7 = v6;
    double v8 = 664.0;
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v7 = v6;
    double v8 = 800.0;
LABEL_5:
    objc_msgSend(v6, "safari_doubleForKey:defaultValue:", v5, v8);
    double v3 = v9;
  }
  return v3;
}

+ (id)_maximumActiveItemWidthDefaultsKeyForSizeClass:(unint64_t)a3
{
  if (a3 <= 3) {
    a1 = *off_1E54E9B50[a3];
  }
  return a1;
}

- (double)minimumActiveItemWidth
{
  uint64_t v3 = objc_opt_class();
  unint64_t sizeClass = self->_sizeClass;

  [v3 minimumActiveItemWidthForSizeClass:sizeClass];
  return result;
}

- (double)minimumActiveItemWidthRatio
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  objc_msgSend(v2, "safari_doubleForKey:defaultValue:", @"DebugUnifiedBarMinimumActiveTabWidthRatio", 0.67);
  double v4 = v3;

  return v4;
}

- (double)minimumInactiveItemWidth
{
  double v3 = objc_opt_class();
  unint64_t sizeClass = self->_sizeClass;

  [v3 minimumInactiveItemWidthForSizeClass:sizeClass];
  return result;
}

- (double)maximumItemSpacing
{
  return 12.0;
}

- (double)minimumItemSpacing
{
  return 6.0;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (double)maximumActiveItemWidth
{
  return self->_maximumActiveItemWidth;
}

- (void).cxx_destruct
{
}

@end