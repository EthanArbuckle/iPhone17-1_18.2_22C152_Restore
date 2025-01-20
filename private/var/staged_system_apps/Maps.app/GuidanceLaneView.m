@interface GuidanceLaneView
- (BOOL)_highlightFirstDirection;
- (BOOL)_markFirstDirectionAsValid;
- (BOOL)maneuverHasPreferredLane;
- (CGSize)intrinsicContentSize;
- (GEOComposedRouteLaneInfo)laneInfo;
- (GuidanceLaneView)initWithLaneInfo:(id)a3 maneuverHasPreferredLane:(BOOL)a4 drawingBiasDirection:(unint64_t)a5 laneStyle:(unint64_t)a6;
- (UIColor)invalidArrowColor;
- (double)drawingScale;
- (double)verticalOffset;
- (id)_defaultInvalidArrowColor;
- (id)_preferredArrowColor;
- (id)_validArrowColor;
- (id)accessibilityIdentifier;
- (unint64_t)drawingBiasDirection;
- (unint64_t)laneStyle;
- (void)_removeUnusedUTurns;
- (void)_updateLanePaths;
- (void)drawRect:(CGRect)a3;
- (void)setDrawingScale:(double)a3;
- (void)setInvalidArrowColor:(id)a3;
- (void)setLaneStyle:(unint64_t)a3;
- (void)setVerticalOffset:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GuidanceLaneView

- (GuidanceLaneView)initWithLaneInfo:(id)a3 maneuverHasPreferredLane:(BOOL)a4 drawingBiasDirection:(unint64_t)a5 laneStyle:(unint64_t)a6
{
  id v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GuidanceLaneView;
  v12 = -[GuidanceLaneView initWithFrame:](&v20, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v12)
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [(GuidanceLaneView *)v12 setAccessibilityIdentifier:v14];

    [(GuidanceLaneView *)v12 setClearsContextBeforeDrawing:1];
    v15 = +[UIColor clearColor];
    [(GuidanceLaneView *)v12 setBackgroundColor:v15];

    [(GuidanceLaneView *)v12 setOpaque:0];
    v16 = [(GuidanceLaneView *)v12 layer];
    [v16 setNeedsDisplayOnBoundsChange:1];

    objc_storeStrong((id *)&v12->_laneInfo, a3);
    v12->_maneuverHasPreferredLane = a4;
    v12->_drawingBiasDirection = a5;
    v12->_laneStyle = a6;
    v12->_drawingScale = 1.0;
    uint64_t v17 = [(GuidanceLaneView *)v12 _defaultInvalidArrowColor];
    invalidArrowColor = v12->_invalidArrowColor;
    v12->_invalidArrowColor = (UIColor *)v17;

    [(GuidanceLaneView *)v12 _updateLanePaths];
  }

  return v12;
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setLaneStyle:(unint64_t)a3
{
  if (self->_laneStyle != a3)
  {
    self->_laneStyle = a3;
    [(GuidanceLaneView *)self setNeedsDisplay];
  }
}

- (void)setDrawingScale:(double)a3
{
  if (self->_drawingScale != a3)
  {
    self->_drawingScale = a3;
    [(GuidanceLaneView *)self setNeedsDisplay];
  }
}

- (void)setVerticalOffset:(double)a3
{
  if (self->_verticalOffset != a3)
  {
    self->_verticalOffset = a3;
    [(GuidanceLaneView *)self setNeedsDisplay];
  }
}

- (void)setInvalidArrowColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (v5 && self->_invalidArrowColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_invalidArrowColor, a3);
    [(GuidanceLaneView *)self setNeedsDisplay];
    v5 = v6;
  }
}

- (void)_removeUnusedUTurns
{
  v3 = [(GEOComposedRouteLaneInfo *)self->_laneInfo directions];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = [(GEOComposedRouteLaneInfo *)self->_laneInfo directions];
    id v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (!v6)
    {
LABEL_40:

      return;
    }
    id v7 = v6;
    v26 = self;
    char v8 = 0;
    char v9 = 0;
    char v10 = 0;
    uint64_t v11 = *(void *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v12);
        if (objc_msgSend(v13, "direction", v26) == 16
          || [v13 direction] == 256)
        {
          char v8 = 1;
        }
        else
        {
          [v13 direction];
          if (MKLaneDirectionIsToTheLeft())
          {
            char v10 = 1;
          }
          else
          {
            unsigned int v14 = [v13 direction];
            BOOL v16 = (v14 - 16 > 0x30 || ((1 << (v14 - 16)) & 0x1000000010001) == 0) && v14 >= 2;
            if (v16 && v14 != 128) {
              char v9 = 1;
            }
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v7 != v12);
      id v17 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v7 = v17;
    }
    while (v17);

    if (v8)
    {
      v18 = [(GEOComposedRouteLaneInfo *)v26->_laneInfo directions];
      v5 = [v18 firstObject];

      if (![(GuidanceLaneView *)v26 _highlightFirstDirection]
        || [v5 direction] != 16 && objc_msgSend(v5, "direction") != 256)
      {
        v19 = objc_opt_new();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        objc_super v20 = [(GEOComposedRouteLaneInfo *)v26->_laneInfo directions];
        id v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v28;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              if ((([v25 direction] == 16) & v10) == 0
                && (([v25 direction] == 256) & v9) == 0)
              {
                [v19 addObject:v25];
              }
            }
            id v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v22);
        }

        [(GEOComposedRouteLaneInfo *)v26->_laneInfo setDirections:v19];
      }
      goto LABEL_40;
    }
  }
}

- (void)_updateLanePaths
{
  [(GuidanceLaneView *)self _highlightFirstDirection];
  [(GuidanceLaneView *)self _removeUnusedUTurns];
  MKDefaultJunctionManeuverMetrics();
  MKCreateBezierPathsForLane();
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allPaths = self->_allPaths;
  self->_allPaths = v3;

  -[GuidanceLaneView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", 0, 0x4051800000000000, 0x4049000000000000, 0x401C000000000000, 0, 0, 0, 0, 0, 0, 0x4020000000000000, 0x4028000000000000, 0, 0, 0, 0x4030800000000000, 0x4023000000000000,
    0x4041800000000000,
    0x4044800000000000,
    0,
    0,
    0,
    0,
    0,
    0,
    0x40431745DB000000,
    0x4025000000000000,
    0x4030000000000000,
    0x4027A2E8B7000000,
    0x40431745DB000000,
    0x4037000000000000,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0x4044000000000000,
    0x4044000000000000,
    0x402D000000000000,
    0x4046800000000000,
    0x402A000000000000,
    0x4020000000000000,
    0x4016000000000000,
    0x4008000000000000,
    0x4024000000000000,
    0x4028000000000000,
    0x4022000000000000,
    0x4028000000000000,
    0x4024000000000000,
    0x4038000000000000,
    0x401E000000000000,
    0x402E000000000000,
    0x4010000000000000,
    0x401C000000000000);
}

- (CGSize)intrinsicContentSize
{
  double width = self->_laneDrawingSize.width;
  double height = self->_laneDrawingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_highlightFirstDirection
{
  unsigned int v4 = [(GuidanceLaneView *)self maneuverHasPreferredLane];
  if (v4)
  {
    v2 = [(GuidanceLaneView *)self laneInfo];
    if ([v2 isPreferredLaneForManeuver])
    {
      unsigned __int8 v5 = 1;
LABEL_9:

      return v5;
    }
    if ([(GuidanceLaneView *)self maneuverHasPreferredLane])
    {
      unsigned __int8 v5 = 0;
      goto LABEL_9;
    }
  }
  else if ([(GuidanceLaneView *)self maneuverHasPreferredLane])
  {
    return 0;
  }
  id v6 = [(GuidanceLaneView *)self laneInfo];
  unsigned __int8 v5 = [v6 isLaneForManeuver];

  if (v4) {
    goto LABEL_9;
  }
  return v5;
}

- (BOOL)_markFirstDirectionAsValid
{
  return 0;
}

- (id)_preferredArrowColor
{
  v2 = [(GuidanceLaneView *)self laneStyle];
  if (v2 == (void *)2)
  {
    char v3 = 1;
LABEL_7:
    v2 = sub_100D89C4C(v3);
    goto LABEL_8;
  }
  if (v2 == (void *)1)
  {
    char v3 = 0;
    goto LABEL_7;
  }
  if (!v2)
  {
    v2 = +[UIColor whiteColor];
  }
LABEL_8:

  return v2;
}

- (id)_validArrowColor
{
  return self->_invalidArrowColor;
}

- (id)_defaultInvalidArrowColor
{
  v2 = [(GuidanceLaneView *)self laneStyle];
  if (v2 == (void *)2)
  {
    v2 = +[UIColor carPlayDashboardJunctionColor];
  }
  else if (v2 == (void *)1)
  {
    v2 = +[UIColor carPlayJunctionColor];
  }
  else if (!v2)
  {
    v2 = +[UIColor iOSJunctionColor];
  }

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GuidanceLaneView;
  [(GuidanceLaneView *)&v8 traitCollectionDidChange:v4];
  if ((char *)[(GuidanceLaneView *)self laneStyle] - 1 <= (char *)1)
  {
    unsigned __int8 v5 = [(GuidanceLaneView *)self traitCollection];
    id v6 = [v5 userInterfaceStyle];
    id v7 = [v4 userInterfaceStyle];

    if (v6 != v7) {
      [(GuidanceLaneView *)self setNeedsDisplay];
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  if ([(NSArray *)self->_allPaths count])
  {
    unsigned int v6 = [(GuidanceLaneView *)self _highlightFirstDirection];
    unsigned int v7 = [(GuidanceLaneView *)self _markFirstDirectionAsValid];
    if (width > 0.0 && height > 0.0)
    {
      unsigned int v8 = v7;
      double v9 = self->_laneDrawingSize.width;
      [(GuidanceLaneView *)self drawingScale];
      double v11 = (width - v9 * v10) * 0.5;
      double v12 = self->_laneDrawingSize.height;
      [(GuidanceLaneView *)self drawingScale];
      double v14 = height - v12 * v13;
      [(GuidanceLaneView *)self verticalOffset];
      double v16 = v14 - v15;
      double v17 = 0.0;
      if (v16 >= 0.0)
      {
        double v18 = self->_laneDrawingSize.height;
        [(GuidanceLaneView *)self drawingScale];
        double v20 = height - v18 * v19;
        [(GuidanceLaneView *)self verticalOffset];
        double v17 = v20 - v21;
      }
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(CurrentContext, v11, v17);
      [(GuidanceLaneView *)self drawingScale];
      CGFloat v24 = v23;
      [(GuidanceLaneView *)self drawingScale];
      CGContextScaleCTM(CurrentContext, v24, v25);
      id v26 = [(NSArray *)self->_allPaths mutableCopy];
      long long v27 = v26;
      if ((v6 | v8) == 1)
      {
        long long v28 = [v26 firstObject];
        [v27 removeObjectAtIndex:0];
      }
      else
      {
        long long v28 = 0;
      }
      if ([v27 count])
      {
        char v43 = v6;
        double v50 = 0.0;
        double v51 = 0.0;
        double v48 = 0.0;
        double v49 = 0.0;
        invalidArrowColor = self->_invalidArrowColor;
        long long v30 = [(GuidanceLaneView *)self traitCollection];
        long long v31 = [(UIColor *)invalidArrowColor resolvedColorWithTraitCollection:v30];

        [v31 getRed:&v51 green:&v50 blue:&v49 alpha:&v48];
        long long v32 = +[UIColor colorWithRed:v51 green:v50 blue:v49 alpha:1.0];
        [v32 setFill];

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v33 = [v27 reverseObjectEnumerator];
        id v34 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v45;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v45 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              [v38 fillWithBlendMode:25 alpha:v48];
              [v38 fillWithBlendMode:18 alpha:v48];
            }
            id v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v35);
        }

        LOBYTE(v6) = v43;
      }
      if (v28)
      {
        if (v6) {
          [(GuidanceLaneView *)self _preferredArrowColor];
        }
        else {
        v39 = [(GuidanceLaneView *)self _validArrowColor];
        }
        v40 = [(GuidanceLaneView *)self traitCollection];
        v41 = [v39 resolvedColorWithTraitCollection:v40];

        double v50 = 0.0;
        double v51 = 0.0;
        double v48 = 0.0;
        double v49 = 0.0;
        [v41 getRed:&v51 green:&v50 blue:&v49 alpha:&v48];
        v42 = +[UIColor colorWithRed:v51 green:v50 blue:v49 alpha:1.0];
        [v42 setFill];

        [v28 fillWithBlendMode:0 alpha:v48];
      }
      CGContextRestoreGState(CurrentContext);
    }
  }
}

- (GEOComposedRouteLaneInfo)laneInfo
{
  return self->_laneInfo;
}

- (BOOL)maneuverHasPreferredLane
{
  return self->_maneuverHasPreferredLane;
}

- (UIColor)invalidArrowColor
{
  return self->_invalidArrowColor;
}

- (unint64_t)drawingBiasDirection
{
  return self->_drawingBiasDirection;
}

- (unint64_t)laneStyle
{
  return self->_laneStyle;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidArrowColor, 0);
  objc_storeStrong((id *)&self->_laneInfo, 0);

  objc_storeStrong((id *)&self->_allPaths, 0);
}

@end