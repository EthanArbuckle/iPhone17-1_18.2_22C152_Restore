@interface _SBDisplayItemFlexibleGrid
- (CGSize)maxSize;
- (CGSize)minSize;
- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4;
- (CGSize)sizeAtIndexFromFullWidthForBounds:(unint64_t)a3;
- (_SBDisplayItemFlexibleGrid)initWithBounds:(CGRect)a3 screenScale:(double)a4 chamoisLayoutAttributes:(id)a5;
- (id)_gridHeightsForSafeHeight:(double)a3 minimumHeight:(double)a4;
- (id)_gridWidthsForSafeWidth:(double)a3 minimumWidth:(double)a4;
- (id)allHeights;
- (id)allWidths;
- (void)_buildGridWithScreenScale:(double)a3;
@end

@implementation _SBDisplayItemFlexibleGrid

- (_SBDisplayItemFlexibleGrid)initWithBounds:(CGRect)a3 screenScale:(double)a4 chamoisLayoutAttributes:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_SBDisplayItemFlexibleGrid;
  v13 = [(_SBDisplayItemFlexibleGrid *)&v18 init];
  if (v13)
  {
    v14 = +[SBAppSwitcherDomain rootSettings];
    uint64_t v15 = [v14 chamoisSettings];
    settings = v13->_settings;
    v13->_settings = (SBSwitcherChamoisSettings *)v15;

    objc_storeStrong((id *)&v13->_chamoisLayoutAttributes, a5);
    v13->_bounds.origin.CGFloat x = x;
    v13->_bounds.origin.CGFloat y = y;
    v13->_bounds.size.CGFloat width = width;
    v13->_bounds.size.CGFloat height = height;
    [(_SBDisplayItemFlexibleGrid *)v13 _buildGridWithScreenScale:a4];
  }

  return v13;
}

- (void)_buildGridWithScreenScale:(double)a3
{
  v4 = [(SBSwitcherChamoisLayoutAttributes *)self->_chamoisLayoutAttributes gridWidths];
  widths = self->_widths;
  self->_widths = v4;

  v6 = [(SBSwitcherChamoisLayoutAttributes *)self->_chamoisLayoutAttributes gridHeights];
  heights = self->_heights;
  self->_heights = v6;
}

- (id)_gridWidthsForSafeWidth:(double)a3 minimumWidth:(double)a4
{
  [(SBSwitcherChamoisLayoutAttributes *)self->_chamoisLayoutAttributes stageInterItemSpacing];
  double v7 = v6;
  double v8 = v6 + a4;
  v9 = objc_opt_new();
  if (v8 > 0.0)
  {
    double v26 = floor(a3 / v8);
    unint64_t v10 = vcvtmd_u64_f64(a3 / v8);
    double v11 = floor(((a3 - v7) * 0.5 + (a3 - v7) * 0.5) * 0.5);
    double v12 = (v11 + v11) * 0.5;
    while (1)
    {
      unint64_t v13 = v10 - 1;
      if (v10 == 1) {
        break;
      }
      if (v10 == 2)
      {
        v20 = NSNumber;
        double v22 = v12;
        goto LABEL_10;
      }
      if (!v10) {
        goto LABEL_15;
      }
      double v14 = (double)v10;
      double v15 = floor((a3 - ((double)v10 + -1.0) * v7) / (double)v10);
      double v16 = floor((v15 + v15) * 0.5);
      v17 = [NSNumber numberWithDouble:(v16 + v16) * 0.5];
      [v9 addObject:v17];

      double v18 = floor((a3 - v7 - v15 + a3 - v7 - v15) * 0.5);
      v19 = [NSNumber numberWithDouble:(v18 + v18) * 0.5];
      [v9 addObject:v19];

      if (v26 == v14)
      {
        v20 = NSNumber;
        double v21 = floor((a3 - v15 * 0.5 + a3 - v15 * 0.5) * 0.5);
        double v22 = (v21 + v21) * 0.5;
LABEL_10:
        v23 = [v20 numberWithDouble:v22];
        [v9 addObject:v23];
      }
      unint64_t v10 = v13;
    }
    v20 = NSNumber;
    double v22 = a3;
    goto LABEL_10;
  }
  v24 = SBLogAppSwitcher();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[_SBDisplayItemFlexibleGrid _gridWidthsForSafeWidth:minimumWidth:](v24);
  }

LABEL_15:
  return v9;
}

- (id)_gridHeightsForSafeHeight:(double)a3 minimumHeight:(double)a4
{
  double v7 = [MEMORY[0x1E4F1CA48] array];
  [(SBSwitcherChamoisLayoutAttributes *)self->_chamoisLayoutAttributes stageInterItemSpacing];
  if (a3 >= a4)
  {
    double v9 = (a3 + (a3 - v8) * -0.5) * 0.25;
    do
    {
      double v10 = floor((a3 + a3) * 0.5);
      double v11 = [NSNumber numberWithDouble:(v10 + v10) * 0.5];
      [v7 addObject:v11];

      a3 = a3 - v9;
    }
    while (a3 >= a4);
  }
  return v7;
}

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(SBSwitcherChamoisLayoutAttributes *)self->_chamoisLayoutAttributes isAutoLayoutEnabled])
  {
    uint64_t v8 = MEMORY[0x1E4F1DB30];
    double v9 = *MEMORY[0x1E4F1DB30];
    if ([(NSArray *)self->_widths count])
    {
      unint64_t v10 = 0;
      double v11 = 1.79769313e308;
      do
      {
        double v12 = [(NSArray *)self->_widths objectAtIndex:v10];
        [v12 doubleValue];
        double v14 = v13;

        double v15 = vabdd_f64(v14, width);
        if (v15 < v11)
        {
          double v9 = v14;
          double v11 = v15;
        }
        ++v10;
      }
      while (v10 < [(NSArray *)self->_widths count]);
    }
    double v16 = *(double *)(v8 + 8);
    if ([(NSArray *)self->_heights count])
    {
      unint64_t v17 = 0;
      double v18 = 1.79769313e308;
      do
      {
        v19 = [(NSArray *)self->_heights objectAtIndex:v17];
        [v19 doubleValue];
        double v21 = v20;

        double v22 = vabdd_f64(v21, height);
        if (v22 < v18)
        {
          double v16 = v21;
          double v18 = v22;
        }
        ++v17;
      }
      while (v17 < [(NSArray *)self->_heights count]);
    }
    [(_SBDisplayItemFlexibleGrid *)self maxSize];
    char v23 = BSSizeEqualToSize();
    if (a4 == 1 && (v23 & 1) != 0)
    {
      double v9 = self->_bounds.size.width;
      double v16 = self->_bounds.size.height;
    }
  }
  else
  {
    double v16 = height;
    double v9 = width;
  }
  double v24 = v9;
  double v25 = v16;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (CGSize)minSize
{
  v3 = [(NSArray *)self->_widths firstObject];
  [v3 doubleValue];
  double v5 = v4;

  double v6 = [(NSArray *)self->_heights firstObject];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)maxSize
{
  v3 = [(NSArray *)self->_widths lastObject];
  [v3 doubleValue];
  double v5 = v4;

  double v6 = [(NSArray *)self->_heights lastObject];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeAtIndexFromFullWidthForBounds:(unint64_t)a3
{
  NSUInteger v5 = [(NSArray *)self->_widths count];
  NSUInteger v6 = [(NSArray *)self->_heights count];
  if ((uint64_t)((v5 - 1) & ~((uint64_t)(v5 - 1) >> 63)) >= (uint64_t)((v5 - 1 - a3) & ~((uint64_t)(v5 - 1 - a3) >> 63))) {
    unint64_t v7 = (v5 - 1 - a3) & ~((uint64_t)(v5 - 1 - a3) >> 63);
  }
  else {
    unint64_t v7 = (v5 - 1) & ~((uint64_t)(v5 - 1) >> 63);
  }
  if ((uint64_t)((v6 - 1) & ~((uint64_t)(v6 - 1) >> 63)) >= (uint64_t)((v6 - 1 - a3) & ~((uint64_t)(v6 - 1 - a3) >> 63))) {
    unint64_t v8 = (v6 - 1 - a3) & ~((uint64_t)(v6 - 1 - a3) >> 63);
  }
  else {
    unint64_t v8 = (v6 - 1) & ~((uint64_t)(v6 - 1) >> 63);
  }
  double v9 = [(NSArray *)self->_widths objectAtIndex:v7];
  [v9 doubleValue];
  double v11 = v10;

  double v12 = [(NSArray *)self->_heights objectAtIndex:v8];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = v11;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (id)allWidths
{
  v2 = (void *)[(NSArray *)self->_widths copy];
  return v2;
}

- (id)allHeights
{
  v2 = (void *)[(NSArray *)self->_heights copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heights, 0);
  objc_storeStrong((id *)&self->_widths, 0);
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_gridWidthsForSafeWidth:(os_log_t)log minimumWidth:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Item width should be positive non zero", v1, 2u);
}

@end