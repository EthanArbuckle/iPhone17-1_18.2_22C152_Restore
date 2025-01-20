@interface UIRefreshControl
+ (BOOL)_allowsUnsupportedMacIdiomBehavior;
+ (Class)_contentViewClassForStyle:(int64_t)a3;
+ (id)_defaultColor;
+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3;
- (BOOL)_areInsetsBeingApplied;
- (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)_hostAdjustsContentOffset;
- (BOOL)_isApplyingInsets;
- (BOOL)isRefreshing;
- (CGPoint)_originForContentOffset:(CGPoint)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)_appliedInsets;
- (UIRefreshControl)init;
- (UIRefreshControl)initWithCoder:(id)a3;
- (UIRefreshControl)initWithFrame:(CGRect)a3;
- (UIRefreshControl)initWithStyle:(int64_t)a3;
- (_UIRefreshControlHosting)_host;
- (double)_impactIntensityForVelocity:(double)a3;
- (double)_refreshControlHeight;
- (double)_scrollViewHeight;
- (double)_snappingHeight;
- (double)_stiffnessForVelocity:(double)a3;
- (double)_visibleHeight;
- (double)_visibleHeightForContentOffset:(CGPoint)a3 origin:(CGPoint)a4;
- (double)revealedFraction;
- (id)_attributedTitle;
- (id)_contentView;
- (id)_scrollView;
- (id)_tintColor;
- (id)description;
- (int64_t)_recomputeNewState;
- (int64_t)refreshControlState;
- (int64_t)style;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_addInsetHeight:(double)a3;
- (void)_addInsets;
- (void)_endRefreshingAnimated:(BOOL)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_removeInsetHeight:(double)a3;
- (void)_removeInsets;
- (void)_resizeToFitContents;
- (void)_setAttributedTitle:(id)a3;
- (void)_setHost:(id)a3;
- (void)_setRefreshControlState:(int64_t)a3 notify:(BOOL)a4;
- (void)_setTintColor:(id)a3;
- (void)_setVisibleHeight:(double)a3;
- (void)_update;
- (void)_updateConcealingMask;
- (void)_updateHiddenStateIfNeeded;
- (void)_updateSnappingHeight;
- (void)beginRefreshing;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)encodeWithCoder:(id)a3;
- (void)endRefreshing;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setRefreshControlState:(int64_t)a3;
- (void)sizeToFit;
@end

@implementation UIRefreshControl

- (void)setBounds:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_host)
  {
    v7 = [(UIRefreshControl *)self _contentView];
    [v7 bounds];
    double height = v8;
  }
  else
  {
    double height = a3.size.height;
  }
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  v17.receiver = self;
  v17.super_class = (Class)UIRefreshControl;
  -[UIView setBounds:](&v17, sel_setBounds_, x, y, width, height);
  [(UIView *)self bounds];
  if (v11 != v15 || v13 != v14) {
    [(UIRefreshControl *)self _updateSnappingHeight];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_host)
  {
    v3 = [(UIRefreshControl *)self _contentView];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIRefreshControl;
    -[UIView sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
    double v5 = v8;
    double v7 = v9;
  }
  double v10 = v5;
  double v11 = v7;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_setHost:(id)a3
{
}

- (BOOL)isRefreshing
{
  return self->_refreshControlState == 3;
}

- (UIRefreshControl)init
{
  return [(UIRefreshControl *)self initWithStyle:2];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIRefreshControl;
  [(UIView *)&v4 setBackgroundColor:a3];
  [(UIRefreshControl *)self _updateConcealingMask];
}

- (int64_t)_recomputeNewState
{
  [(UIRefreshControl *)self revealedFraction];
  double v5 = v4;
  double v6 = [(UIRefreshControl *)self _contentView];
  [v6 _heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen];
  double v8 = v7;

  int64_t refreshControlState = self->_refreshControlState;
  switch(refreshControlState)
  {
    case 0:
      if (v5 <= 0.0) {
        goto LABEL_23;
      }
      double v10 = [(_UIRefreshControlHosting *)self->_host scrollView];
      if ([v10 _isBouncing])
      {
        double v11 = [(_UIRefreshControlHosting *)self->_host scrollView];
        char v12 = [v11 isDecelerating];

        if (v12) {
          return 6;
        }
      }
      else
      {
      }
LABEL_23:
      if (self->_visibleHeight <= v8 || v5 >= 1.0)
      {
        if (v5 < 1.0) {
          return 0;
        }
        v23 = [(_UIRefreshControlHosting *)self->_host scrollView];
        char v24 = [v23 isTracking];

        if (v24) {
          return 0;
        }
      }
      return 1;
    case 1:
      if (v5 >= 1.0
        && ([(_UIRefreshControlHosting *)self->_host scrollView],
            double v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v14 isTracking],
            v14,
            (v15 & 1) != 0))
      {
        return 2;
      }
      else
      {
        return self->_visibleHeight >= v8;
      }
    case 2:
      return refreshControlState;
    case 3:
      return 3;
    case 4:
      if (self->_visibleHeight <= v8) {
        return 0;
      }
      v16 = [(_UIRefreshControlHosting *)self->_host scrollView];
      unsigned __int8 v17 = [v16 isTracking];

      BOOL v18 = (v17 & (v5 <= 0.75)) == 0;
      int64_t v19 = 4;
      goto LABEL_18;
    case 5:
      if (self->_visibleHeight <= v8) {
        return 0;
      }
      else {
        return 5;
      }
    case 6:
      if (self->_visibleHeight <= v8) {
        return 0;
      }
      v20 = [(_UIRefreshControlHosting *)self->_host scrollView];
      unsigned __int8 v21 = [v20 isTracking];

      BOOL v18 = (v21 & (v5 <= 0.75)) == 0;
      int64_t v19 = 6;
LABEL_18:
      if (v18) {
        return v19;
      }
      else {
        return 1;
      }
    default:
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIRefreshControl.m", 398, @"Unknown UIRefreshControlState: %ld", self->_refreshControlState);

      return refreshControlState;
  }
}

- (int64_t)refreshControlState
{
  return self->_refreshControlState;
}

- (void)_updateSnappingHeight
{
  host = self->_host;
  if (host)
  {
    double v4 = [(_UIRefreshControlHosting *)host scrollView];
    [v4 bounds];
    double v6 = v5;

    double v7 = round(v6 * 0.5);
    self->_double snappingHeight = v7;
    double v8 = [(UIRefreshControl *)self _contentView];
    [v8 maximumSnappingHeight];
    double v10 = v9;

    if (v7 > v10)
    {
      double v11 = [(UIRefreshControl *)self _contentView];
      [v11 maximumSnappingHeight];
      self->_double snappingHeight = v12;
    }
    double snappingHeight = self->_snappingHeight;
    double v14 = [(UIRefreshControl *)self _contentView];
    [v14 minimumSnappingHeight];
    double v16 = v15;

    if (snappingHeight < v16)
    {
      unsigned __int8 v17 = [(UIRefreshControl *)self _contentView];
      [v17 minimumSnappingHeight];
      self->_double snappingHeight = v18;
    }
    int64_t v19 = [(UIRefreshControl *)self _contentView];
    [v19 refreshControlInvalidatedSnappingHeight];

    [(UIView *)self setNeedsLayout];
  }
}

- (id)_contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = objc_alloc((Class)[(id)objc_opt_class() _contentViewClassForStyle:self->_style]);
    [(UIView *)self bounds];
    double v5 = (_UIRefreshControlContentView *)objc_msgSend(v4, "initWithFrame:");
    double v6 = self->_contentView;
    self->_contentView = v5;

    [(_UIRefreshControlContentView *)self->_contentView setRefreshControl:self];
    [(UIView *)self insertSubview:self->_contentView atIndex:0];
    [(UIRefreshControl *)self setRefreshControlState:0];
    double v7 = self->_contentView;
    double v8 = [(id)objc_opt_class() _defaultColor];
    [(_UIRefreshControlContentView *)v7 setTintColor:v8];

    contentView = self->_contentView;
  }
  return contentView;
}

- (double)_scrollViewHeight
{
  v2 = [(_UIRefreshControlHosting *)self->_host scrollView];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (void)_update
{
  if (!self->_adjustingInsets)
  {
    [(UIView *)self frame];
    double v4 = v3;
    double v5 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;

    -[UIRefreshControl _originForContentOffset:](self, "_originForContentOffset:", v7, v9);
    double v11 = v10;
    double v13 = v12;
    double v14 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v14 bounds];
    double v16 = v15;

    if (-[_UIRefreshControlHosting refreshControlInsetsAffectScrollViewRubberBanding](self->_host, "refreshControlInsetsAffectScrollViewRubberBanding"))-[UIRefreshControl setFrame:](self, "setFrame:", v11, v13, v16, v4); {
    -[UIRefreshControl _visibleHeightForContentOffset:origin:](self, "_visibleHeightForContentOffset:origin:", v7, v9, v11, v13);
    }
    double v18 = v17;
    -[UIRefreshControl _setVisibleHeight:](self, "_setVisibleHeight:");
    if (v18 == 0.0)
    {
      [(UIRefreshControl *)self _updateConcealingMask];
      [(UIRefreshControl *)self _updateHiddenStateIfNeeded];
    }
  }
  if (self->_style == 2)
  {
    int64_t v19 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v19 _verticalVelocity];
    double v21 = v20;

    [(UIRefreshControl *)self _stiffnessForVelocity:v21];
    double v23 = v22;
    [(UIRefreshControl *)self _impactIntensityForVelocity:v21];
    double v25 = v24;
    [(_UIRefreshControlContentView *)self->_contentView setCurrentPopStiffness:v23];
    contentView = self->_contentView;
    [(_UIRefreshControlContentView *)contentView setImpactIntensity:v25];
  }
}

- (void)_updateConcealingMask
{
  double v3 = [(UIView *)self backgroundColor];

  if (!v3)
  {
    [(UIView *)self->_contentView setHidden:0];
    if (![(UIView *)self->_contentView clipsToBounds]) {
      return;
    }
    [(UIView *)self->_contentView setClipsToBounds:0];
    [(UIView *)self bounds];
    -[UIView setBounds:](self->_contentView, "setBounds:");
    [(UIView *)self bounds];
    contentView = self->_contentView;
    goto LABEL_6;
  }
  double v4 = self->_contentView;
  if (self->_visibleHeight > 0.0)
  {
    [(UIView *)v4 setHidden:0];
    [(UIView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double visibleHeight = self->_visibleHeight;
    [(UIView *)self->_contentView setClipsToBounds:1];
    contentView = self->_contentView;
    double v13 = v6;
    double v14 = v8;
    double v15 = v10;
    double v16 = visibleHeight;
LABEL_6:
    -[UIView setFrame:](contentView, "setFrame:", v13, v14, v15, v16);
    return;
  }
  [(UIView *)v4 setHidden:1];
}

- (void)_updateHiddenStateIfNeeded
{
  if (self->_style == 2)
  {
    double visibleHeight = self->_visibleHeight;
    [(_UIRefreshControlContentView *)self->_contentView _heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen];
    [(UIView *)self setHidden:visibleHeight <= v4];
  }
}

- (void)_setVisibleHeight:(double)a3
{
  if (self->_visibleHeight != a3)
  {
    self->_double visibleHeight = a3;
    [(UIRefreshControl *)self setRefreshControlState:[(UIRefreshControl *)self _recomputeNewState]];
    [(UIView *)self setNeedsLayout];
    [(UIRefreshControl *)self _updateHiddenStateIfNeeded];
    [(UIRefreshControl *)self _updateConcealingMask];
  }
}

- (CGPoint)_originForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  double v6 = 0.0;
  if (self->_style != 2)
  {
    double v7 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v7 _effectiveContentInset];
    double v6 = -v8;
  }
  if (!self->_insetsApplied)
  {
    [(UIRefreshControl *)self _refreshControlHeight];
    double v6 = v6 - v9;
  }
  int64_t style = self->_style;
  double v11 = v6 - y;
  if (v6 - y < 0.0 && style != 2) {
    double y = v6;
  }
  if (style == 2)
  {
    double v13 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v13 _effectiveContentInset];
    double y = y + v14 - self->_additionalTopInset;
  }
  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.CGFloat x = v15;
  return result;
}

- (double)_visibleHeightForContentOffset:(CGPoint)a3 origin:(CGPoint)a4
{
  double y = a4.y;
  double v5 = a3.y;
  [(UIRefreshControl *)self _refreshControlHeight];
  double v8 = v7;
  double v9 = y + v7;
  double result = 0.0;
  if (v9 > v5)
  {
    double v11 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v11 _effectiveContentInset];
    double v13 = v12;
    double v14 = -v12;

    double v15 = v8 - v13;
    if (!self->_insetsApplied) {
      double v15 = v14;
    }
    double result = v15 - v5;
    if (result < 0.0) {
      return 0.0;
    }
  }
  return result;
}

- (double)_refreshControlHeight
{
  return self->_refreshControlHeight;
}

- (double)_impactIntensityForVelocity:(double)a3
{
  [(UIRefreshControl *)self _stiffnessForVelocity:a3];
  return v3 / 150.0 * 0.15 + 0.85;
}

- (double)_stiffnessForVelocity:(double)a3
{
  double v3 = fabs(a3) * 48.3333333 + 0.0;
  double result = 150.0;
  if (v3 <= 150.0)
  {
    double result = v3;
    if (v3 < 5.0) {
      return 5.0;
    }
  }
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_host)
  {
    double v7 = [(UIRefreshControl *)self _contentView];
    [v7 frame];
    double height = v8;
  }
  else
  {
    double height = a3.size.height;
  }
  [(UIView *)self frame];
  double v11 = v10;
  double v13 = v12;
  v17.receiver = self;
  v17.super_class = (Class)UIRefreshControl;
  -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
  [(UIView *)self frame];
  if (v11 != v15 || v13 != v14) {
    [(UIRefreshControl *)self _updateSnappingHeight];
  }
}

- (void)didMoveToSuperview
{
  double v3 = [(UIView *)self superview];

  if (v3)
  {
    if (!self->_host)
    {
      double v4 = [(UIView *)self _containingScrollView];
      if (v4)
      {
        double v5 = [[_UIScrollViewRefreshControlHost alloc] initWithScrollView:v4];
        host = self->_host;
        self->_host = (_UIRefreshControlHosting *)v5;

        [(UIRefreshControl *)self sizeToFit];
        [(UIView *)self frame];
        self->_refreshControlHeight = v7;
        double v8 = [(UIRefreshControl *)self _contentView];
        [v8 refreshControlInvalidatedSnappingHeight];
      }
      if (!self->_host)
      {
        double v9 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v10 = *MEMORY[0x1E4F1C3B8];
        double v11 = (objc_class *)objc_opt_class();
        double v12 = NSStringFromClass(v11);
        [v9 raise:v10, @"%@ was unable to find its associated scroll view", v12 format];
      }
    }
    [(UIRefreshControl *)self _updateSnappingHeight];
    [(UIRefreshControl *)self _update];
  }
}

- (double)_visibleHeight
{
  return self->_visibleHeight;
}

- (void)setRefreshControlState:(int64_t)a3
{
}

- (void)_setRefreshControlState:(int64_t)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)a3 >= 7)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIRefreshControl.m", 790, @"Illegal state: %ld", a3);
  }
  if ([(UIRefreshControl *)self _canTransitionFromState:self->_refreshControlState toState:a3])
  {
    int64_t refreshControlState = self->_refreshControlState;
    if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFDLL) {
      [(UIRefreshControl *)self _removeInsets];
    }
    double v8 = [(UIRefreshControl *)self _contentView];
    [v8 willTransitionFromState:refreshControlState toState:a3];

    self->_int64_t refreshControlState = a3;
    double v9 = [(UIRefreshControl *)self _contentView];
    [v9 didTransitionFromState:refreshControlState toState:a3];

    if (self->_refreshControlState == a3)
    {
      if (a3 == 3)
      {
        [(UIRefreshControl *)self _addInsets];
        if (v4) {
          [(UIControl *)self sendActionsForControlEvents:4096];
        }
      }
      else if (a3 == 2)
      {
        [(UIRefreshControl *)self _addInsets];
      }
      [(_UIRefreshControlHosting *)self->_host refreshControl:self didChangeToState:a3 fromState:refreshControlState];
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  BOOL result = a4 == 3;
  if (a3 != 3 && a4 == 3) {
    return 1;
  }
  switch(a3)
  {
    case 0:
      BOOL v6 = a4 == 1 || a4 == 6;
      goto LABEL_18;
    case 1:
      BOOL v5 = (unint64_t)a4 >= 3;
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      if (a4) {
        BOOL v6 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4;
      }
      else {
        BOOL v6 = 1;
      }
      goto LABEL_18;
    case 4:
    case 6:
      BOOL v5 = (unint64_t)a4 >= 2;
LABEL_8:
      BOOL result = !v5;
      break;
    case 5:
      BOOL v6 = a4 == 0;
LABEL_18:
      BOOL result = v6;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)sizeToFit
{
  if (self->_host)
  {
    double v3 = [(UIRefreshControl *)self _contentView];
    [v3 sizeToFit];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIRefreshControl;
  [(UIView *)&v4 sizeToFit];
}

- (id)_scrollView
{
  return (id)[(_UIRefreshControlHosting *)self->_host scrollView];
}

+ (id)_defaultColor
{
  if (qword_1EB25BCD0 != -1) {
    dispatch_once(&qword_1EB25BCD0, &__block_literal_global_152);
  }
  v2 = (void *)_MergedGlobals_1_4;
  return v2;
}

+ (Class)_contentViewClassForStyle:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unknown UIRefreshControlStyle: %ld", a3);
    double v3 = 0;
  }
  else
  {
    double v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (double)revealedFraction
{
  int64_t refreshControlState = self->_refreshControlState;
  BOOL v3 = refreshControlState == 3 || refreshControlState == 0;
  uint64_t v4 = 6;
  if (v3) {
    uint64_t v4 = 5;
  }
  return fmin(fmax(self->_visibleHeight/ *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIRefreshControl__style[v4]), 0.0), 1.0);
}

- (void)_removeInsets
{
  [(UIRefreshControl *)self _refreshControlHeight];
  -[UIRefreshControl _removeInsetHeight:](self, "_removeInsetHeight:");
}

- (void)_removeInsetHeight:(double)a3
{
  if (a3 > 0.0 && self->_insetsApplied)
  {
    if (self->_host)
    {
      self->_appliedInsets.top = self->_appliedInsets.top - a3;
      self->_adjustingInsets = 1;
      -[_UIRefreshControlHosting decrementInsetHeight:](self->_host, "decrementInsetHeight:");
      self->_additionalTopInset = 0.0;
      self->_adjustingInsets = 0;
      self->_insetsApplied = 0;
    }
  }
}

- (BOOL)_areInsetsBeingApplied
{
  return self->_insetsApplied;
}

- (BOOL)_hostAdjustsContentOffset
{
  return [(_UIRefreshControlHosting *)self->_host refreshControlInsetsAffectScrollViewRubberBanding] ^ 1;
}

- (UIRefreshControl)initWithStyle:(int64_t)a3
{
  if (a3 == 2) {
    double v4 = 60.0;
  }
  else {
    double v4 = 58.0;
  }
  v8.receiver = self;
  v8.super_class = (Class)UIRefreshControl;
  BOOL v5 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 320.0, v4);
  BOOL v6 = v5;
  if (v5)
  {
    v5->_int64_t style = a3;
    [(UIView *)v5 setAutoresizingMask:2];
  }
  return v6;
}

void __33__UIRefreshControl__defaultColor__block_invoke()
{
  if (dyld_program_sdk_at_least()) {
    +[UIColor secondaryLabelColor];
  }
  else {
  uint64_t v0 = +[UIColor colorWithRed:0.584313725 green:0.611764706 blue:0.650980392 alpha:1.0];
  }
  v1 = (void *)_MergedGlobals_1_4;
  _MergedGlobals_1_4 = v0;
}

- (UIRefreshControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIRefreshControl;
  BOOL v5 = [(UIControl *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"UIRefreshControlStyle"];
    uint64_t v7 = 2;
    if (v6) {
      uint64_t v7 = v6;
    }
    v5->_int64_t style = v7;
    if ([v4 containsValueForKey:@"UITintColor"])
    {
      objc_super v8 = [v4 decodeObjectForKey:@"UITintColor"];
      [(UIRefreshControl *)v5 _setTintColor:v8];
    }
    if ([v4 containsValueForKey:@"UIAttributedTitle"])
    {
      double v9 = [v4 decodeObjectForKey:@"UIAttributedTitle"];
      [(UIRefreshControl *)v5 _setAttributedTitle:v9];
    }
    [(UIView *)v5 setAutoresizingMask:2];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRefreshControl;
  [(UIControl *)&v9 encodeWithCoder:v4];
  [v4 encodeInteger:self->_style forKey:@"UIRefreshControlStyle"];
  if (self->_contentView)
  {
    BOOL v5 = [(UIRefreshControl *)self _tintColor];

    if (v5)
    {
      uint64_t v6 = [(UIRefreshControl *)self _tintColor];
      [v4 encodeObject:v6 forKey:@"UITintColor"];
    }
    uint64_t v7 = [(UIRefreshControl *)self _attributedTitle];

    if (v7)
    {
      objc_super v8 = [(UIRefreshControl *)self _attributedTitle];
      [v4 encodeObject:v8 forKey:@"UIAttributedTitle"];
    }
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIRefreshControl;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_contentView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (UIRefreshControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(UIRefreshControl *)self initWithStyle:2];
  objc_super v8 = v7;
  if (v7) {
    -[UIRefreshControl setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (void)dealloc
{
  [(_UIRefreshControlContentView *)self->_contentView setRefreshControl:0];
  v3.receiver = self;
  v3.super_class = (Class)UIRefreshControl;
  [(UIView *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UIRefreshControl;
  objc_super v3 = [(UIView *)&v7 description];
  if (os_variant_has_internal_diagnostics())
  {
    objc_super v5 = _UIRefreshControlStateDescription([(UIRefreshControl *)self refreshControlState]);
    uint64_t v6 = [v3 stringByAppendingFormat:@" %@", v5];

    if (self->_host)
    {
      objc_super v3 = objc_msgSend(v6, "stringByAppendingFormat:", @" host=%p", self->_host);
    }
    else
    {
      objc_super v3 = v6;
    }
  }
  return v3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)_setTintColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (!self->_contentView) {
      return;
    }
    id v4 = [(id)objc_opt_class() _defaultColor];
  }
  id v6 = v4;
  objc_super v5 = [(UIRefreshControl *)self _contentView];
  [v5 setTintColor:v6];
}

- (id)_tintColor
{
  if (self->_contentView)
  {
    v2 = [(UIRefreshControl *)self _contentView];
    objc_super v3 = [v2 tintColor];

    id v4 = [(id)objc_opt_class() _defaultColor];

    if (v3 != v4) {
      goto LABEL_5;
    }
  }
  objc_super v3 = 0;
LABEL_5:
  return v3;
}

- (void)_setAttributedTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIRefreshControl *)self _contentView];
  [v5 setAttributedTitle:v4];

  [(UIRefreshControl *)self _resizeToFitContents];
}

- (id)_attributedTitle
{
  if (self->_contentView)
  {
    v2 = [(UIRefreshControl *)self _contentView];
    objc_super v3 = [v2 attributedTitle];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (void)_resizeToFitContents
{
  double refreshControlHeight = self->_refreshControlHeight;
  [(UIRefreshControl *)self sizeToFit];
  [(UIView *)self frame];
  if (v4 != refreshControlHeight)
  {
    double v5 = v4;
    self->_double refreshControlHeight = v4;
    if ([(UIRefreshControl *)self _areInsetsBeingApplied]
      && ![(UIRefreshControl *)self _hostAdjustsContentOffset])
    {
      [(UIRefreshControl *)self _removeInsetHeight:refreshControlHeight];
      [(UIRefreshControl *)self _addInsetHeight:v5];
    }
    [(UIRefreshControl *)self _update];
  }
}

- (double)_snappingHeight
{
  return self->_snappingHeight;
}

- (BOOL)_isApplyingInsets
{
  return self->_insetsApplied;
}

- (UIEdgeInsets)_appliedInsets
{
  double top = self->_appliedInsets.top;
  double left = self->_appliedInsets.left;
  double bottom = self->_appliedInsets.bottom;
  double right = self->_appliedInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_addInsets
{
  [(UIRefreshControl *)self _refreshControlHeight];
  -[UIRefreshControl _addInsetHeight:](self, "_addInsetHeight:");
}

- (void)_addInsetHeight:(double)a3
{
  if (a3 > 0.0 && !self->_insetsApplied)
  {
    if (self->_host)
    {
      self->_appliedInsets.double top = self->_appliedInsets.top + a3;
      self->_insetsApplied = 1;
      self->_adjustingInsets = 1;
      self->_additionalTopInset = a3;
      -[_UIRefreshControlHosting incrementInsetHeight:](self->_host, "incrementInsetHeight:");
      self->_adjustingInsets = 0;
    }
  }
}

- (void)beginRefreshing
{
  objc_super v3 = [(UIView *)self window];

  if (v3 || (UIRefreshControlReceivedOffscreenBeginRefreshing(self), (dyld_program_sdk_at_least() & 1) == 0))
  {
    [(UIRefreshControl *)self _setRefreshControlState:3 notify:0];
  }
}

- (void)_endRefreshingAnimated:(BOOL)a3
{
  if (a3) {
    char v5 = [(_UIRefreshControlHosting *)self->_host refreshControlInsetsAffectScrollViewRubberBanding];
  }
  else {
    char v5 = 1;
  }
  [(UIRefreshControl *)self _update];
  [(UIRefreshControl *)self _visibleHeight];
  if (v6 <= 0.0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    objc_super v3 = [(_UIRefreshControlHosting *)self->_host scrollView];
    char v7 = [v3 isTracking] & v5;

    if (v7)
    {
      uint64_t v8 = 5;
    }
    else if (+[UIView areAnimationsEnabled])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  [(UIRefreshControl *)self _setRefreshControlState:v8 notify:0];
  int64_t v9 = [(UIRefreshControl *)self refreshControlState];
  if ((v9 | 4) == 4)
  {
    objc_super v3 = [(_UIRefreshControlHosting *)self->_host scrollView];
    if ([v3 _isBouncing]) {
      int v10 = 0;
    }
    else {
      int v10 = [(_UIRefreshControlHosting *)self->_host refreshControlInsetsAffectScrollViewRubberBanding];
    }
  }
  else
  {
    int v10 = 0;
  }
  if ((v9 | 4) == 4) {

  }
  if (v10)
  {
    objc_super v11 = [(_UIRefreshControlHosting *)self->_host scrollView];
    [v11 contentOffset];
    double v13 = v12;
    double v15 = v14;

    double v16 = v15 + self->_visibleHeight;
    id v17 = [(_UIRefreshControlHosting *)self->_host scrollView];
    objc_msgSend(v17, "_setAbsoluteContentOffset:animated:", v9 == 4, v13, v16);
  }
}

- (void)endRefreshing
{
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (_UIRefreshControlHosting)_host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xF7 | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 3) & 1;
}

@end