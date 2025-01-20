@interface _PRIconListLayout
- (BOOL)usesAlternateLayout;
- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (_PRIconListLayout)initWithGridSize:(SBHIconGridSize)a3;
- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3;
- (unint64_t)numberOfRowsForOrientation:(int64_t)a3;
@end

@implementation _PRIconListLayout

- (_PRIconListLayout)initWithGridSize:(SBHIconGridSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PRIconListLayout;
  result = [(_PRIconListLayout *)&v5 init];
  if (result) {
    result->_gridSize = a3;
  }
  return result;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  return self->_gridSize.rows;
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  return self->_gridSize.columns;
}

- (BOOL)usesAlternateLayout
{
  return 0;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  double v3 = 20.0;
  double v4 = 20.0;
  double v5 = 20.0;
  double v6 = 20.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PRIconGridSizeClassCircular", @"PRIconGridSizeClassRectangular", @"PRIconGridSizeClassSystemSmall", 0);
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4FA6288]) initWithGridSizeClasses:v2];

  return (SBHIconGridSizeClassSet *)v3;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6290]), "initWithGridSizeClassesAndGridSizes:", @"PRIconGridSizeClassCircular", 65537, @"PRIconGridSizeClassRectangular", 65538, @"PRIconGridSizeClassSystemSmall", 131074, 0);
  return (SBHIconGridSizeClassSizeMap *)v2;
}

- (SBIconImageInfo)iconImageInfo
{
  return [(_PRIconListLayout *)self iconImageInfoForGridSizeClass:*MEMORY[0x1E4FA6518]];
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  double v4 = (__CFString *)a4;
  [MEMORY[0x1E4F5E4A8] gridUnitSize];
  [MEMORY[0x1E4F5E4A8] complicationEdgeInset];
  [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
  if (@"PRIconGridSizeClassCircular" != v4
    && (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) == 0
    && @"PRIconGridSizeClassRectangular" != v4
    && !-[__CFString isEqualToString:](v4, "isEqualToString:")
    && @"PRIconGridSizeClassSystemSmall" != v4)
  {
    -[__CFString isEqualToString:](v4, "isEqualToString:");
  }
  PRWidgetPlatterCornerRadius();

  return result;
}

@end