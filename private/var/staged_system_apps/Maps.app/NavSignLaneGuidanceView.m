@interface NavSignLaneGuidanceView
+ (_NSRange)_visibleLaneRangeForNumberOfLanes:(unint64_t)a3 maxNumberOfVisibleLanes:(unint64_t)a4 highlightedLaneRange:(_NSRange)a5;
+ (int64_t)maxNumberVisibleLanesForSignWidth:(double)a3;
- (BOOL)debugHighlightLanes;
- (BOOL)highlightedLanesNotInVisibleRange;
- (BOOL)shouldTransformWithVerticalScale;
- (NSArray)lanes;
- (NavSignLaneGuidanceView)initWithLaneStyle:(unint64_t)a3;
- (UIColor)invalidArrowColor;
- (UIEdgeInsets)edgeInsets;
- (_NSRange)highlightedLaneRange;
- (_NSRange)visibleLaneRange;
- (double)availableLaneWidth;
- (double)availableWidthForLanes;
- (double)verticalScale;
- (id)_laneViewForLane:(id)a3;
- (id)_newGradientLayerWithFrame:(CGRect)a3 forLeftEdge:(BOOL)a4;
- (id)accessibilityIdentifier;
- (id)duplicateLaneGuidanceView;
- (unint64_t)_leftmostVisibleLaneIndex;
- (unint64_t)_rightmostVisibleLaneIndex;
- (unint64_t)maxNumberOfVisibleLanes;
- (unint64_t)numberOfVisibleLanes;
- (void)_debugHighlightLaneView:(id)a3;
- (void)_resetLanes;
- (void)_setupConstraints;
- (void)_updateLaneContentMargins;
- (void)_updateMaxLanesForSignWidth:(double)a3;
- (void)layoutSubviews;
- (void)setDebugHighlightLanes:(BOOL)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setInvalidArrowColor:(id)a3;
- (void)setLanes:(id)a3;
- (void)setShouldTransformWithVerticalScale:(BOOL)a3;
- (void)setVerticalScale:(double)a3;
@end

@implementation NavSignLaneGuidanceView

+ (int64_t)maxNumberVisibleLanesForSignWidth:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  else {
    return llround((double)GEOConfigGetInteger() * a3 / 375.0);
  }
}

- (NavSignLaneGuidanceView)initWithLaneStyle:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NavSignLaneGuidanceView;
  v4 = -[NavSignLaneGuidanceView initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    laneViews = v4->_laneViews;
    v4->_laneViews = (NSMutableArray *)v5;

    v4->_laneStyle = a3;
    v4->_lastUpdatedSignWidth = 0.0;
    v4->_maxNumberOfVisibleLanes = 0x7FFFFFFFFFFFFFFFLL;
    long long v7 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v4->_edgeInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v4->_edgeInsets.bottom = v7;
    v4->_verticalScale = 1.0;
    [(NavSignLaneGuidanceView *)v4 setClipsToBounds:0];
    [(NavSignLaneGuidanceView *)v4 _setupConstraints];
    v8 = +[UIColor clearColor];
    [(NavSignLaneGuidanceView *)v4 setBackgroundColor:v8];
  }
  return v4;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(NavSignLaneGuidanceView *)self _updateLaneContentMargins];
  }
}

- (void)setVerticalScale:(double)a3
{
  if (a3 <= 1.0 && a3 > 0.0 && self->_verticalScale != a3)
  {
    self->_verticalScale = a3;
    [(NavSignLaneGuidanceView *)self setNeedsLayout];
  }
}

- (void)setShouldTransformWithVerticalScale:(BOOL)a3
{
  if (self->_shouldTransformWithVerticalScale != a3)
  {
    self->_shouldTransformWithVerticalScale = a3;
    [(NavSignLaneGuidanceView *)self setNeedsLayout];
  }
}

- (void)setLanes:(id)a3
{
  id v4 = a3;
  if ((+[MNComparison isValue:v4 equalTo:self->_lanes] & 1) == 0)
  {
    uint64_t v5 = sub_100B23098();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      lanes = self->_lanes;
      *(_DWORD *)buf = 134349570;
      v25 = self;
      __int16 v26 = 2112;
      v27 = lanes;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Changing lanes from %@ to %@", buf, 0x20u);
    }

    long long v7 = (NSArray *)[v4 copy];
    v8 = self->_lanes;
    self->_lanes = v7;

    self->_maneuverHasPreferredLane = 0;
    self->_laneArrowBiasDirection = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = self->_lanes;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v14, "isPreferredLaneForManeuver", (void)v19))
          {
            v17 = [v14 directions];
            v18 = [v17 firstObject];
            [v18 direction];
            self->_laneArrowBiasDirection = MKLaneDirectionIsToTheLeft() ^ 1;

            self->_maneuverHasPreferredLane = 1;
            goto LABEL_16;
          }
          if ([v14 isLaneForManeuver])
          {
            v15 = [v14 directions];
            v16 = [v15 firstObject];
            [v16 direction];
            self->_laneArrowBiasDirection = MKLaneDirectionIsToTheLeft() ^ 1;
          }
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    [(NavSignLaneGuidanceView *)self _resetLanes];
  }
}

- (void)setDebugHighlightLanes:(BOOL)a3
{
  if (self->_debugHighlightLanes != a3)
  {
    self->_debugHighlightLanes = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_laneViews;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[NavSignLaneGuidanceView _debugHighlightLaneView:](self, "_debugHighlightLaneView:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (_NSRange)highlightedLaneRange
{
  v2 = [(NavSignLaneGuidanceView *)self lanes];
  id v3 = +[NavSignLaneGuidanceInfo highlightedLaneRangeForLanes:v2];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setInvalidArrowColor:(id)a3
{
  NSUInteger v5 = (UIColor *)a3;
  NSUInteger v6 = v5;
  if (v5 && self->_invalidArrowColor != v5)
  {
    objc_storeStrong((id *)&self->_invalidArrowColor, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    NSUInteger v7 = self->_laneViews;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v12 setInvalidArrowColor:self->_invalidArrowColor];
          [v12 setNeedsDisplay];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [(NavSignLaneGuidanceView *)self setNeedsDisplay];
  }
}

- (BOOL)highlightedLanesNotInVisibleRange
{
  id v3 = [(NavSignLaneGuidanceView *)self lanes];
  id v4 = [v3 count];
  unint64_t v5 = [(NavSignLaneGuidanceView *)self maxNumberOfVisibleLanes];

  if ((unint64_t)v4 > v5)
  {
    NSUInteger v6 = (char *)[(NavSignLaneGuidanceView *)self highlightedLaneRange];
    unint64_t v8 = v7;
    if (v7 >= [(NavSignLaneGuidanceView *)self maxNumberOfVisibleLanes]
      || v6 && v6 <= (char *)[(NavSignLaneGuidanceView *)self _leftmostVisibleLaneIndex])
    {
      return 1;
    }
    id v9 = &v6[v8 - 1];
    uint64_t v10 = [(NavSignLaneGuidanceView *)self lanes];
    if (v9 >= (char *)[v10 count] - 1)
    {
    }
    else
    {
      unint64_t v11 = [(NavSignLaneGuidanceView *)self _rightmostVisibleLaneIndex];

      if ((unint64_t)v9 >= v11) {
        return 1;
      }
    }
  }
  return 0;
}

- (unint64_t)numberOfVisibleLanes
{
  return self->_visibleLaneRange.length;
}

- (double)availableWidthForLanes
{
  [(NavSignLaneGuidanceView *)self bounds];
  double Width = CGRectGetWidth(v8);
  [(NavSignLaneGuidanceView *)self edgeInsets];
  double v5 = Width - v4;
  [(NavSignLaneGuidanceView *)self edgeInsets];
  double result = v5 - v6;
  if (v5 - v6 < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)availableLaneWidth
{
  if (![(NavSignLaneGuidanceView *)self numberOfVisibleLanes]) {
    return 0.0;
  }
  [(NavSignLaneGuidanceView *)self availableWidthForLanes];
  return v3 / (double)[(NavSignLaneGuidanceView *)self numberOfVisibleLanes];
}

- (id)duplicateLaneGuidanceView
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithLaneStyle:self->_laneStyle];
  [(NavSignLaneGuidanceView *)self edgeInsets];
  [v3 setEdgeInsets:];
  [(NavSignLaneGuidanceView *)self verticalScale];
  [v3 setVerticalScale:];
  [v3 setShouldTransformWithVerticalScale:[self shouldTransformWithVerticalScale]];
  double v4 = [(NavSignLaneGuidanceView *)self lanes];
  [v3 setLanes:v4];

  return v3;
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)NavSignLaneGuidanceView;
  [(NavSignLaneGuidanceView *)&v52 layoutSubviews];
  id v3 = sub_100B23098();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(NSMutableArray *)self->_laneViews count];
    [(NavSignLaneGuidanceView *)self bounds];
    double v5 = NSStringFromCGRect(v65);
    double v6 = [(NavSignLaneGuidanceView *)self superview];
    [v6 bounds];
    unint64_t v7 = NSStringFromCGRect(v66);
    lastUpdatedSigndouble Width = self->_lastUpdatedSignWidth;
    id v9 = NSStringFromRange(self->_visibleLaneRange);
    *(_DWORD *)buf = 134350338;
    v54 = self;
    __int16 v55 = 2048;
    id v56 = v4;
    __int16 v57 = 2112;
    v58 = v5;
    __int16 v59 = 2112;
    v60 = v7;
    __int16 v61 = 2048;
    double v62 = lastUpdatedSignWidth;
    __int16 v63 = 2112;
    v64 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] layoutSubviews _laneViews.count: %lu, self.bounds: %@, superview.bounds: %@, _lastUpdatedSignWidth: %.2f, visibleLaneRange: %@", buf, 0x3Eu);
  }
  if ([(NSMutableArray *)self->_laneViews count])
  {
    [(NavSignLaneGuidanceView *)self bounds];
    if (v10 == 0.0 || (double v12 = v11, v11 == 0.0))
    {
      v23 = sub_100B23098();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v54 = self;
        v24 = "[%{public}p] layoutSubviews zero bounds";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 0xCu);
      }
LABEL_17:

      return;
    }
    double v13 = v10;
    uint64_t v14 = [(NavSignLaneGuidanceView *)self superview];
    if (v14)
    {
      long long v15 = (void *)v14;
      double v16 = self->_lastUpdatedSignWidth;
      v17 = [(NavSignLaneGuidanceView *)self superview];
      [v17 bounds];
      double v19 = vabdd_f64(v16, v18);

      if (v19 > 2.22044605e-16)
      {
        long long v20 = sub_100B23098();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v54 = self;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] layoutSubviews. _lastUpdatedSignWidth does not match current bounds, will update lanes for new width", buf, 0xCu);
        }

        long long v21 = [(NavSignLaneGuidanceView *)self superview];
        [v21 bounds];
        [(NavSignLaneGuidanceView *)self _updateMaxLanesForSignWidth:v22];

        [(NavSignLaneGuidanceView *)self layoutIfNeeded];
        return;
      }
    }
    if (self->_lastUpdatedSignWidth == 0.0)
    {
      v23 = sub_100B23098();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v54 = self;
        v24 = "[%{public}p] layoutSubviews. _lastUpdatedSignWidth is 0";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    unint64_t v25 = [(NavSignLaneGuidanceView *)self _leftmostVisibleLaneIndex];
    unint64_t v26 = [(NavSignLaneGuidanceView *)self _rightmostVisibleLaneIndex];
    if (v25 && v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = [(NSMutableArray *)self->_laneViews objectAtIndexedSubscript:v25];
      [v27 bounds];
      -[CAGradientLayer setFrame:](self->_leftEdgeLaneGradientLayer, "setFrame:");
    }
    if (v26 != 0x7FFFFFFFFFFFFFFFLL && v26 + 1 < (unint64_t)[(NSMutableArray *)self->_laneViews count])
    {
      __int16 v28 = [(NSMutableArray *)self->_laneViews objectAtIndexedSubscript:v26];
      [v28 bounds];
      -[CAGradientLayer setFrame:](self->_rightEdgeLaneGradientLayer, "setFrame:");
    }
    NSUInteger length = self->_visibleLaneRange.length;
    if (length)
    {
      double v30 = v13 / (double)length;
      double v31 = 1.0;
      if (![(NavSignLaneGuidanceView *)self shouldTransformWithVerticalScale])
      {
        [(NavSignLaneGuidanceView *)self verticalScale];
        if (v32 <= 1.0)
        {
          [(NavSignLaneGuidanceView *)self verticalScale];
          double v31 = v33;
        }
      }
      v34 = [(NavSignLaneGuidanceView *)self window];
      v35 = [v34 screen];
      [v35 nativeScale];
      if (v36 <= 2.0) {
        double v37 = 51.0;
      }
      else {
        double v37 = 60.0;
      }

      if (v30 < v37 && v31 >= v30 / v37) {
        double v31 = v30 / v37;
      }
      double v38 = 0.0;
      double v39 = 0.0;
      if (v25 <= v26)
      {
        unint64_t v40 = v25;
        do
        {
          v41 = [(NSMutableArray *)self->_laneViews objectAtIndexedSubscript:v40];
          [v41 intrinsicContentSize];
          if (v42 > v38)
          {
            [v41 intrinsicContentSize];
            double v38 = v43;
          }
          [v41 intrinsicContentSize];
          if (v44 > v39)
          {
            [v41 intrinsicContentSize];
            double v39 = v45;
          }

          ++v40;
        }
        while (v40 <= v26);
      }
      if (v31 * v39 > v30 && v39 > 0.0) {
        double v31 = v30 / v39;
      }
      UIRoundToViewScale();
      if (v12 < v47 * v31 && v31 >= v12 / v47) {
        double v31 = v12 / v47;
      }
      double v48 = v12 - v47 * v31;
      if (v48 - (1.0 - v31) * 25.0 >= 0.0) {
        double v49 = (1.0 - v31) * 25.0;
      }
      else {
        double v49 = v48;
      }
      [(NSLayoutConstraint *)self->_offsetFromBottomHeightConstraint setConstant:v49];
      laneViews = self->_laneViews;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100B23BD4;
      v51[3] = &unk_101318450;
      v51[5] = v25;
      v51[6] = v26;
      *(double *)&v51[7] = v31;
      *(double *)&v51[8] = v49;
      v51[4] = self;
      [(NSMutableArray *)laneViews enumerateObjectsUsingBlock:v51];
    }
  }
}

+ (_NSRange)_visibleLaneRangeForNumberOfLanes:(unint64_t)a3 maxNumberOfVisibleLanes:(unint64_t)a4 highlightedLaneRange:(_NSRange)a5
{
  NSUInteger v5 = 0;
  NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 && a4)
  {
    NSUInteger v7 = a3 - a4;
    if (a3 >= a4) {
      NSUInteger v5 = a4;
    }
    else {
      NSUInteger v5 = a3;
    }
    if (a3 > a4)
    {
      if (a3 - (a5.location + a5.length) >= a5.location || a5.location < v7) {
        NSUInteger v7 = 0;
      }
      if (a5.length > a4) {
        NSUInteger v7 = 0;
      }
      if (a5.location == 0x7FFFFFFFFFFFFFFFLL) {
        NSUInteger v6 = 0;
      }
      else {
        NSUInteger v6 = v7;
      }
    }
    else
    {
      NSUInteger v6 = 0;
    }
  }
  result.NSUInteger length = v5;
  result.location = v6;
  return result;
}

- (void)_updateMaxLanesForSignWidth:(double)a3
{
  NSUInteger v5 = sub_100B23098();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    lastUpdatedSigndouble Width = self->_lastUpdatedSignWidth;
    int v10 = 134349568;
    double v11 = self;
    __int16 v12 = 2048;
    double v13 = a3;
    __int16 v14 = 2048;
    double v15 = lastUpdatedSignWidth;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] _updateMaxLanesForSignWidth: %.2f, previousWidth: %.2f", (uint8_t *)&v10, 0x20u);
  }

  if (a3 > 0.0 && vabdd_f64(self->_lastUpdatedSignWidth, a3) > 2.22044605e-16)
  {
    self->_lastUpdatedSigndouble Width = a3;
    if (self->_laneStyle - 1 < 2) {
      a3 = a3 + a3;
    }
    if (+[NavSignLaneGuidanceView maxNumberVisibleLanesForSignWidth:a3] < 0)unint64_t v7 = 0; {
    else
    }
      unint64_t v7 = +[NavSignLaneGuidanceView maxNumberVisibleLanesForSignWidth:a3];
    self->_unint64_t maxNumberOfVisibleLanes = v7;
    CGRect v8 = sub_100B23098();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t maxNumberOfVisibleLanes = self->_maxNumberOfVisibleLanes;
      int v10 = 134349312;
      double v11 = self;
      __int16 v12 = 2048;
      double v13 = *(double *)&maxNumberOfVisibleLanes;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] _updateMaxLanesForSignWidth: _maxNumberOfVisibleLanes set to %lu", (uint8_t *)&v10, 0x16u);
    }

    [(NavSignLaneGuidanceView *)self _resetLanes];
  }
}

- (void)_updateLaneContentMargins
{
  [(NavSignLaneGuidanceView *)self edgeInsets];
  -[NSLayoutConstraint setConstant:](self->_laneContentTopMarginConstraint, "setConstant:");
  [(NavSignLaneGuidanceView *)self edgeInsets];
  [(NSLayoutConstraint *)self->_laneContentBottomMarginConstraint setConstant:v3];
  [(NavSignLaneGuidanceView *)self edgeInsets];
  [(NSLayoutConstraint *)self->_laneContentLeftMarginConstraint setConstant:v4];
  [(NavSignLaneGuidanceView *)self edgeInsets];
  laneContentRightMarginConstraint = self->_laneContentRightMarginConstraint;

  [(NSLayoutConstraint *)laneContentRightMarginConstraint setConstant:v5];
}

- (id)_newGradientLayerWithFrame:(CGRect)a3 forLeftEdge:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(NavSignLaneGuidanceView *)self theme];
  int v10 = [v9 navSignPrimaryColor];

  id v11 = objc_alloc_init((Class)CAGradientLayer);
  [v11 setFrame:CGRectMake(x, y, width, height)];
  [v11 setAnchorPoint:CGPointZero.x, CGPointZero.y];
  double v12 = 0.0;
  id v13 = [v10 colorWithAlphaComponent:0.0];
  v18[0] = [v13 CGColor];
  id v14 = [v10 colorWithAlphaComponent:1.0];
  v18[1] = [v14 CGColor];
  double v15 = +[NSArray arrayWithObjects:v18 count:2];
  [v11 setColors:v15];

  [v11 setLocations:&off_1013AE6D0];
  if (v4) {
    double v16 = 0.0;
  }
  else {
    double v16 = 1.0;
  }
  if (v4) {
    double v12 = 1.0;
  }
  [v11 setStartPoint:v16, 0.5];
  [v11 setEndPoint:v12, 0.5];

  return v11;
}

- (unint64_t)_leftmostVisibleLaneIndex
{
  return self->_visibleLaneRange.location;
}

- (unint64_t)_rightmostVisibleLaneIndex
{
  p_visibleLaneRange = &self->_visibleLaneRange;
  NSUInteger location = self->_visibleLaneRange.location;
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = p_visibleLaneRange->length;
    if (length) {
      return location + length - 1;
    }
  }
  return result;
}

- (void)_setupConstraints
{
  unint64_t v40 = +[NSMutableArray array];
  double v3 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  laneContentGuide = self->_laneContentGuide;
  self->_laneContentGuide = v3;

  [(NavSignLaneGuidanceView *)self addLayoutGuide:self->_laneContentGuide];
  double v5 = [(UILayoutGuide *)self->_laneContentGuide topAnchor];
  NSUInteger v6 = [(NavSignLaneGuidanceView *)self topAnchor];
  unint64_t v7 = [v5 constraintEqualToAnchor:v6];
  laneContentTopMarginConstraint = self->_laneContentTopMarginConstraint;
  self->_laneContentTopMarginConstraint = v7;

  id v9 = [(NavSignLaneGuidanceView *)self bottomAnchor];
  int v10 = [(UILayoutGuide *)self->_laneContentGuide bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  laneContentBottomMarginConstraint = self->_laneContentBottomMarginConstraint;
  self->_laneContentBottomMarginConstraint = v11;

  id v13 = [(UILayoutGuide *)self->_laneContentGuide leftAnchor];
  id v14 = [(NavSignLaneGuidanceView *)self leftAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  laneContentLeftMarginConstraint = self->_laneContentLeftMarginConstraint;
  self->_laneContentLeftMarginConstraint = v15;

  v17 = [(NavSignLaneGuidanceView *)self rightAnchor];
  double v18 = [(UILayoutGuide *)self->_laneContentGuide rightAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  laneContentRightMarginConstraint = self->_laneContentRightMarginConstraint;
  self->_laneContentRightMarginConstraint = v19;

  long long v21 = self->_laneContentLeftMarginConstraint;
  v42[0] = self->_laneContentTopMarginConstraint;
  v42[1] = v21;
  double v22 = self->_laneContentBottomMarginConstraint;
  v42[2] = self->_laneContentRightMarginConstraint;
  v42[3] = v22;
  v23 = +[NSArray arrayWithObjects:v42 count:4];
  [v40 addObjectsFromArray:v23];

  v24 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  offsetFromBottomGuide = self->_offsetFromBottomGuide;
  self->_offsetFromBottomGuide = v24;

  [(NavSignLaneGuidanceView *)self addLayoutGuide:self->_offsetFromBottomGuide];
  unint64_t v26 = [(UILayoutGuide *)self->_offsetFromBottomGuide heightAnchor];
  v27 = [v26 constraintEqualToConstant:0.0];
  offsetFromBottomHeightConstraint = self->_offsetFromBottomHeightConstraint;
  self->_offsetFromBottomHeightConstraint = v27;

  double v39 = [(UILayoutGuide *)self->_offsetFromBottomGuide bottomAnchor];
  id v29 = [(UILayoutGuide *)self->_laneContentGuide bottomAnchor];
  double v30 = [v39 constraintEqualToAnchor:v29];
  v41[0] = v30;
  double v31 = [(UILayoutGuide *)self->_offsetFromBottomGuide leftAnchor];
  double v32 = [(UILayoutGuide *)self->_laneContentGuide leftAnchor];
  double v33 = [v31 constraintEqualToAnchor:v32];
  v41[1] = v33;
  v34 = [(UILayoutGuide *)self->_offsetFromBottomGuide rightAnchor];
  v35 = [(UILayoutGuide *)self->_laneContentGuide rightAnchor];
  double v36 = [v34 constraintEqualToAnchor:v35];
  double v37 = self->_offsetFromBottomHeightConstraint;
  v41[2] = v36;
  v41[3] = v37;
  double v38 = +[NSArray arrayWithObjects:v41 count:4];
  [v40 addObjectsFromArray:v38];

  +[NSLayoutConstraint activateConstraints:v40];
}

- (void)_resetLanes
{
  double v3 = sub_100B23098();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(NSMutableArray *)self->_laneViews count];
    double v5 = NSStringFromRange(self->_visibleLaneRange);
    [(NavSignLaneGuidanceView *)self frame];
    NSUInteger v6 = NSStringFromCGRect(v83);
    *(_DWORD *)buf = 134349826;
    v76 = self;
    __int16 v77 = 2048;
    id v78 = v4;
    __int16 v79 = 2112;
    v80 = v5;
    __int16 v81 = 2112;
    v82 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] _resetLanes: will reset lanes, current - lanes.count: %lu, _visibleLaneRange: %@, frame: %@", buf, 0x2Au);
  }
  leftEdgeLaneGradientLayer = self->_leftEdgeLaneGradientLayer;
  self->_leftEdgeLaneGradientLayer = 0;

  rightEdgeLaneGradientLayer = self->_rightEdgeLaneGradientLayer;
  self->_rightEdgeLaneGradientLayer = 0;

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v9 = self->_laneViews;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v71;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v71 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * i) removeFromSuperview];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_laneViews removeAllObjects];
  v68 = self->_lanes;
  int64_t v14 = [(NSArray *)v68 count];
  id v15 = [(NavSignLaneGuidanceView *)self highlightedLaneRange];
  self->_visibleLaneRange.NSUInteger location = (NSUInteger)+[NavSignLaneGuidanceView _visibleLaneRangeForNumberOfLanes:maxNumberOfVisibleLanes:highlightedLaneRange:](NavSignLaneGuidanceView, "_visibleLaneRangeForNumberOfLanes:maxNumberOfVisibleLanes:highlightedLaneRange:", v14, self->_maxNumberOfVisibleLanes, v15, v16);
  self->_visibleLaneRange.NSUInteger length = v17;
  if (v14) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    unint64_t v21 = [(NavSignLaneGuidanceView *)self _leftmostVisibleLaneIndex];
    unint64_t v22 = [(NavSignLaneGuidanceView *)self _rightmostVisibleLaneIndex];
    NSUInteger length = self->_visibleLaneRange.length;
    v24 = +[NSMutableArray array];
    double v25 = 0.5 / (double)length;
    uint64_t v69 = -(uint64_t)(v21 + (length >> 1));
    uint64_t v66 = -v14;
    char v67 = length;
    unint64_t v62 = v14 - 1;
    uint64_t v63 = -(uint64_t)v22;
    v64 = v24;
    uint64_t v65 = -(uint64_t)v21;
    uint64_t v26 = -1;
    v27 = &OBJC_IVAR___VehicleDetailViewController__strongSelf;
    double v28 = 1.0 / (double)length;
    while (1)
    {
      uint64_t v29 = v69 + v26;
      double v30 = [(NSArray *)v68 objectAtIndexedSubscript:v26 + 1];
      double v31 = [(NavSignLaneGuidanceView *)self _laneViewForLane:v30];

      [(NSMutableArray *)self->_laneViews addObject:v31];
      [(NavSignLaneGuidanceView *)self addSubview:v31];
      if (v67)
      {
        if (v29 != -1) {
          goto LABEL_26;
        }
        v34 = [(NavSignLaneGuidanceView *)v31 centerXAnchor];
        v35 = [(NavSignLaneGuidanceView *)self centerXAnchor];
        uint64_t v36 = [v34 constraintEqualToAnchor:v35];
      }
      else
      {
        if (v29 == -1)
        {
          double v32 = [(NavSignLaneGuidanceView *)self centerXAnchor];
          double v33 = v31;
        }
        else
        {
          if (v69 + v26 != -2) {
            goto LABEL_26;
          }
          double v32 = [(NavSignLaneGuidanceView *)v31 centerXAnchor];
          double v33 = self;
        }
        double v37 = [(NavSignLaneGuidanceView *)v33 centerXAnchor];
        v34 = [v32 anchorWithOffsetToAnchor:v37];

        v35 = [*(id *)((char *)&self->super.super.super.super.isa + v27[287]) widthAnchor];
        uint64_t v36 = [v34 constraintEqualToAnchor:v35 multiplier:v25];
      }
      double v38 = (void *)v36;
      [v24 addObject:v36];

LABEL_26:
      if (v26 != -1)
      {
        double v39 = [(NSMutableArray *)self->_laneViews objectAtIndexedSubscript:v26];
        unint64_t v40 = [v39 centerXAnchor];
        v41 = [(NavSignLaneGuidanceView *)v31 centerXAnchor];
        double v42 = [v40 anchorWithOffsetToAnchor:v41];

        double v43 = [*(id *)((char *)&self->super.super.super.super.isa + v27[287]) widthAnchor];
        double v44 = [v42 constraintEqualToAnchor:v43 multiplier:v28];
        [v24 addObject:v44];
      }
      double v45 = [(NavSignLaneGuidanceView *)v31 topAnchor];
      uint64_t v46 = v27[287];
      double v47 = [*(id *)((char *)&self->super.super.super.super.isa + v46) topAnchor];
      double v48 = [v45 constraintEqualToAnchor:v47];
      [v24 addObject:v48];

      double v49 = [(NavSignLaneGuidanceView *)v31 bottomAnchor];
      v50 = [*(id *)((char *)&self->super.super.super.super.isa + v46) bottomAnchor];
      v51 = [v49 constraintEqualToAnchor:v50];
      [v24 addObject:v51];

      if (v65 + v26 != -1 || v26 == -1)
      {
        if (v63 + v26 != -1 || v26 + 1 >= v62)
        {
          id v56 = [(NavSignLaneGuidanceView *)v31 layer];
          __int16 v57 = v56;
          uint64_t v58 = 0;
          goto LABEL_36;
        }
        [(NavSignLaneGuidanceView *)v31 bounds];
        objc_super v52 = -[NavSignLaneGuidanceView _newGradientLayerWithFrame:forLeftEdge:](self, "_newGradientLayerWithFrame:forLeftEdge:", 0);
        uint64_t v53 = 32;
      }
      else
      {
        [(NavSignLaneGuidanceView *)v31 bounds];
        objc_super v52 = -[NavSignLaneGuidanceView _newGradientLayerWithFrame:forLeftEdge:](self, "_newGradientLayerWithFrame:forLeftEdge:", 1);
        uint64_t v53 = 24;
      }
      v54 = *(Class *)((char *)&self->super.super.super.super.isa + v53);
      *(Class *)((char *)&self->super.super.super.super.isa + v53) = v52;

      uint64_t v55 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v53);
      id v56 = [(NavSignLaneGuidanceView *)v31 layer];
      __int16 v57 = v56;
      uint64_t v58 = v55;
LABEL_36:
      [v56 setMask:v58];
      v27 = &OBJC_IVAR___VehicleDetailViewController__strongSelf;

      [(NavSignLaneGuidanceView *)self _debugHighlightLaneView:v31];
      ++v26;
      v24 = v64;
      if (v66 + v26 == -1)
      {
        +[NSLayoutConstraint activateConstraints:v64];
        __int16 v59 = sub_100B23098();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          id v60 = [(NSMutableArray *)self->_laneViews count];
          __int16 v61 = NSStringFromRange(self->_visibleLaneRange);
          *(_DWORD *)buf = 134349570;
          v76 = self;
          __int16 v77 = 2048;
          id v78 = v60;
          __int16 v79 = 2112;
          v80 = v61;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "[%{public}p] _resetLanes: did reset lanes, current - lanes.count: %lu, _visibleLaneRange: %@", buf, 0x20u);
        }
        [(NavSignLaneGuidanceView *)self setNeedsLayout];
        goto LABEL_40;
      }
    }
  }
  self->_visibleLaneRange = (_NSRange)xmmword_100F6F190;
  v24 = sub_100B23098();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v19 = [(NSMutableArray *)self->_laneViews count];
    long long v20 = NSStringFromRange(self->_visibleLaneRange);
    *(_DWORD *)buf = 134349570;
    v76 = self;
    __int16 v77 = 2048;
    id v78 = v19;
    __int16 v79 = 2112;
    v80 = v20;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] _resetLanes: did reset lanes, current - lanes.count: %lu, _visibleLaneRange: %@", buf, 0x20u);
  }
LABEL_40:
}

- (void)_debugHighlightLaneView:(id)a3
{
  id v11 = a3;
  if (![(NavSignLaneGuidanceView *)self debugHighlightLanes]) {
    goto LABEL_4;
  }
  id v4 = [v11 laneInfo];
  unsigned int v5 = [v4 isPreferredLaneForManeuver];

  if (!v5)
  {
    CGRect v8 = [v11 laneInfo];
    unsigned int v9 = [v8 isLaneForManeuver];

    if (v9)
    {
      NSUInteger v6 = +[UIColor yellowColor];
      goto LABEL_7;
    }
LABEL_4:
    unint64_t v7 = +[UIColor clearColor];
    [v11 setBackgroundColor:v7];
    goto LABEL_8;
  }
  NSUInteger v6 = +[UIColor redColor];
LABEL_7:
  unint64_t v7 = v6;
  id v10 = [v6 colorWithAlphaComponent:0.5];
  [v11 setBackgroundColor:v10];

LABEL_8:
}

- (id)_laneViewForLane:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[GuidanceLaneView alloc] initWithLaneInfo:v4 maneuverHasPreferredLane:self->_maneuverHasPreferredLane drawingBiasDirection:self->_laneArrowBiasDirection laneStyle:self->_laneStyle];

  [(GuidanceLaneView *)v5 setInvalidArrowColor:self->_invalidArrowColor];
  [(GuidanceLaneView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1148846080;
  [(GuidanceLaneView *)v5 setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1144750080;
  [(GuidanceLaneView *)v5 setContentCompressionResistancePriority:1 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [(GuidanceLaneView *)v5 setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v9) = 1144733696;
  [(GuidanceLaneView *)v5 setContentHuggingPriority:1 forAxis:v9];

  return v5;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)verticalScale
{
  return self->_verticalScale;
}

- (BOOL)shouldTransformWithVerticalScale
{
  return self->_shouldTransformWithVerticalScale;
}

- (unint64_t)maxNumberOfVisibleLanes
{
  return self->_maxNumberOfVisibleLanes;
}

- (_NSRange)visibleLaneRange
{
  p_visibleLaneRange = &self->_visibleLaneRange;
  NSUInteger location = self->_visibleLaneRange.location;
  NSUInteger length = p_visibleLaneRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)debugHighlightLanes
{
  return self->_debugHighlightLanes;
}

- (UIColor)invalidArrowColor
{
  return self->_invalidArrowColor;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_invalidArrowColor, 0);
  objc_storeStrong((id *)&self->_offsetFromBottomHeightConstraint, 0);
  objc_storeStrong((id *)&self->_offsetFromBottomGuide, 0);
  objc_storeStrong((id *)&self->_laneContentRightMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentLeftMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentBottomMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentTopMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentGuide, 0);
  objc_storeStrong((id *)&self->_laneViews, 0);
  objc_storeStrong((id *)&self->_rightEdgeLaneGradientLayer, 0);

  objc_storeStrong((id *)&self->_leftEdgeLaneGradientLayer, 0);
}

@end