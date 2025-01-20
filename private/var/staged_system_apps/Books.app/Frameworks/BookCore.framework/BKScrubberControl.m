@interface BKScrubberControl
- (BKAccessibilityScrubberControlDelegate)bkAccessibilityDelegate;
- (BKScrubberControl)initWithFrame:(CGRect)a3;
- (BKScrubberControl)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (BKScrubberHoverController)hoverController;
- (BKScrubberLayerImp)modernKnobImp;
- (BKScrubberLayerImp)modernTrackImp;
- (BKScrubberTrack)track;
- (BKShapeView)thumb;
- (BOOL)_touchBeganAtPoint:(CGPoint)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)hideThumbView;
- (BOOL)isClassic;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CALayer)modernKnobLayer;
- (CALayer)modernTrackLayer;
- (CGRect)_classicThumbRect;
- (CGRect)_modernThumbRect;
- (CGRect)hitRectForThumb;
- (CGRect)thumbRect;
- (UIPointerInteraction)pointerInteraction;
- (UIScrollView)scrollView;
- (double)_knobOffsetForInset:(double)a3 knobLength:(double)a4 knobTravelLength:(double)a5;
- (double)_knobProportion;
- (double)_xPositionFromPercentage:(double)Width;
- (double)progress;
- (double)value;
- (id)_makeScrollerPartLayer;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int)orientation;
- (int64_t)hoverState;
- (int64_t)layoutDirection;
- (int64_t)pageNumber;
- (int64_t)pageNumberForValue:(double)a3;
- (int64_t)themeInterfaceStyle;
- (int64_t)validateHoverState:(int64_t)a3;
- (unint64_t)pageCount;
- (void)_setValue:(double)a3 updateScrollView:(BOOL)a4;
- (void)_setupCommon:(int64_t)a3;
- (void)_setupCommonLayerProperties:(id)a3;
- (void)_touchMovedAtPoint:(CGPoint)a3 refresh:(BOOL)a4;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateScrollviewValue:(double)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrubToPageNumber:(int64_t)a3 refresh:(BOOL)a4;
- (void)scrubToValue:(double)a3 refresh:(BOOL)a4;
- (void)setBkAccessibilityDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHideThumbView:(BOOL)a3;
- (void)setHoverController:(id)a3;
- (void)setHoverState:(int64_t)a3;
- (void)setIsClassic:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setModernKnobImp:(id)a3;
- (void)setModernKnobLayer:(id)a3;
- (void)setModernTrackImp:(id)a3;
- (void)setModernTrackLayer:(id)a3;
- (void)setOrientation:(int)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageCount:(unint64_t)a3 refresh:(BOOL)a4;
- (void)setPageNumber:(int64_t)a3;
- (void)setPageNumber:(int64_t)a3 refresh:(BOOL)a4;
- (void)setProgress:(double)a3;
- (void)setScrollView:(id)a3;
- (void)setThemeInterfaceStyle:(int64_t)a3;
- (void)setThumb:(id)a3;
- (void)setTrack:(id)a3;
- (void)setValue:(double)a3;
- (void)updateHoverState;
- (void)updateValue;
- (void)updateValueAndRefresh:(BOOL)a3;
@end

@implementation BKScrubberControl

- (void)_setupCommon:(int64_t)a3
{
  self->_isClassic = a3 == 0;
  [(BKScrubberControl *)self setUserInteractionEnabled:1];
  id v17 = [(BKScrubberControl *)self track];
  [(BKScrubberControl *)self bounds];
  [v17 setFrame:];
  [v17 setAutoresizingMask:18];
  [(BKScrubberControl *)self addSubview:v17];
  v4 = [(BKScrubberControl *)self thumb];
  [(BKScrubberControl *)self addSubview:v4];

  [(BKScrubberControl *)self addTarget:self action:"_updateInteractions:" forControlEvents:4096];
  [(BKScrubberControl *)self addTarget:self action:"_updateInteractions:" forControlEvents:64];
  [(BKScrubberControl *)self addTarget:self action:"_updateInteractions:" forControlEvents:256];
  self->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
  [(BKScrubberControl *)self setProgress:0.0];
  [(BKScrubberControl *)self setLayoutDirection:0];
  [(BKScrubberControl *)self setOrientation:0];
  if (!self->_isClassic)
  {
    v5 = [(BKScrubberControl *)self _makeScrollerPartLayer];
    modernKnobLayer = self->_modernKnobLayer;
    self->_modernKnobLayer = v5;

    v7 = [(BKShapeView *)self->_thumb layer];
    [v7 addSublayer:self->_modernKnobLayer];

    [(BKScrubberControl *)self _setupCommonLayerProperties:self->_modernKnobLayer];
    v8 = [[BKScrubberLayerImp alloc] initWithLayer:self->_modernKnobLayer orientation:[(BKScrubberControl *)self orientation]];
    modernKnobImp = self->_modernKnobImp;
    self->_modernKnobImp = v8;

    [(BKScrubberLayerImp *)self->_modernKnobImp setIsKnob:1];
    v10 = [(BKScrubberControl *)self _makeScrollerPartLayer];
    modernTrackLayer = self->_modernTrackLayer;
    self->_modernTrackLayer = v10;

    v12 = [(BKScrubberTrack *)self->_track layer];
    [v12 addSublayer:self->_modernTrackLayer];

    [(BKScrubberControl *)self _setupCommonLayerProperties:self->_modernTrackLayer];
    v13 = [[BKScrubberLayerImp alloc] initWithLayer:self->_modernTrackLayer orientation:[(BKScrubberControl *)self orientation]];
    modernTrackImp = self->_modernTrackImp;
    self->_modernTrackImp = v13;
  }
  v15 = +[UITraitCollection bc_allAPITraits];
  id v16 = [(BKScrubberControl *)self registerForTraitChanges:v15 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)BKScrubberControl;
  [(BKScrubberControl *)&v5 didMoveToWindow];
  if (!self->_hoverController && !self->_isClassic)
  {
    v3 = [[BKScrubberHoverController alloc] initWithScrubber:self];
    hoverController = self->_hoverController;
    self->_hoverController = v3;
  }
}

- (void)setThemeInterfaceStyle:(int64_t)a3
{
  self->_themeInterfaceStyle = a3;
  -[BKScrubberLayerImp setThemeInterfaceStyle:](self->_modernKnobImp, "setThemeInterfaceStyle:");
  [(BKScrubberLayerImp *)self->_modernTrackImp setThemeInterfaceStyle:a3];
  [(CALayer *)self->_modernKnobLayer setNeedsDisplay];
  modernTrackLayer = self->_modernTrackLayer;

  [(CALayer *)modernTrackLayer setNeedsDisplay];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  objc_super v5 = [(BKScrubberControl *)self traitCollection];
  [(BKScrubberLayerImp *)self->_modernKnobImp setTraitCollection:v5];

  id v6 = [(BKScrubberControl *)self traitCollection];
  [(BKScrubberLayerImp *)self->_modernTrackImp setTraitCollection:v6];
}

- (void)_setupCommonLayerProperties:(id)a3
{
  double y = CGPointZero.y;
  id v5 = a3;
  [v5 setAnchorPoint:CGPointZero.x, y];
  [v5 setGeometryFlipped:1];
  id v6 = [(BKScrubberTrack *)self->_track layer];
  [v6 contentsScale];
  [v5 setContentsScale:];
}

- (id)_makeScrollerPartLayer
{
  v2 = +[CALayer layer];
  [v2 setBounds:0.0, 0.0, 8.0, 8.0];
  [v2 setNeedsDisplayOnBoundsChange:0];
  [v2 setNeedsDisplay];

  return v2;
}

- (BKScrubberControl)initWithFrame:(CGRect)a3
{
  return -[BKScrubberControl initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKScrubberControl)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKScrubberControl;
  id v5 = -[BKScrubberControl initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = v5;
  if (v5) {
    [(BKScrubberControl *)v5 _setupCommon:a4];
  }
  return v6;
}

- (void)dealloc
{
  track = self->_track;
  self->_track = 0;

  thumb = self->_thumb;
  self->_thumb = 0;

  scrollView = self->_scrollView;
  self->_scrollView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKScrubberControl;
  [(BKScrubberControl *)&v6 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BKScrubberControl *)self hitRectForThumb];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKScrubberControl;
  id v5 = -[BKScrubberControl hitTest:withEvent:](&v8, "hitTest:withEvent:", a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self])
  {
    uint64_t v6 = self;

    id v5 = v6;
  }

  return v5;
}

- (double)_xPositionFromPercentage:(double)Width
{
  id v5 = [(BKScrubberControl *)self track];
  uint64_t v6 = (char *)[v5 layoutDirection];

  if (v6 == (unsigned char *)&def_7D91C + 1)
  {
    double v8 = 1.0 - Width;
    [(BKScrubberControl *)self bounds];
    Width = CGRectGetWidth(v10);
  }
  else
  {
    double result = 0.0;
    if (v6) {
      return result;
    }
    [(BKScrubberControl *)self bounds];
    double v8 = CGRectGetWidth(v9);
  }
  return v8 * Width;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)BKScrubberControl;
  [(BKScrubberControl *)&v32 layoutSubviews];
  [(BKScrubberControl *)self bounds];
  -[BKScrubberControl trackRectForBounds:](self, "trackRectForBounds:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(BKScrubberControl *)self track];
  [v11 setFrame:v4, v6, v8, v10];

  v12 = [(BKScrubberControl *)self track];
  [v12 bounds];
  -[CALayer setFrame:](self->_modernTrackLayer, "setFrame:");

  [(BKScrubberControl *)self thumbRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(BKScrubberControl *)self thumb];
  [v21 setFrame:v14, v16, v18, v20];

  v22 = [(BKScrubberControl *)self thumb];
  [v22 bounds];
  -[CALayer setFrame:](self->_modernKnobLayer, "setFrame:");

  v23 = [(BKScrubberControl *)self thumb];
  [(BKScrubberControl *)self progress];
  if (v24 == 1.0
    && [(BKScrubberControl *)self isEnabled]
    && ([(BKScrubberControl *)self value], v25 >= 0.0)
    && ([(BKScrubberControl *)self value], v26 <= 1.0)
    || [(BKScrubberControl *)self hideThumbView])
  {
    [v23 bounds];
    double v28 = v27;
    [(BKScrubberControl *)self value];
    -[BKScrubberControl _xPositionFromPercentage:](self, "_xPositionFromPercentage:");
    double v30 = v29;
    [(BKScrubberControl *)self bounds];
    BOOL v31 = v30 > v28 * 0.5 + CGRectGetWidth(v33) || v30 < -(v28 * 0.5);
  }
  else
  {
    BOOL v31 = 1;
  }
  [v23 setHidden:v31];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BKScrubberControl;
  id v6 = a3;
  [(BKScrubberControl *)&v13 beginTrackingWithTouch:v6 withEvent:a4];
  [v6 locationInView:self];
  double v8 = v7;
  double v10 = v9;

  [(BKScrubberControl *)self hitRectForThumb];
  v14.CGFloat x = v8;
  v14.CGFloat y = v10;
  BOOL v11 = CGRectContainsPoint(v15, v14);
  if (v11) {
    LOBYTE(v11) = -[BKScrubberControl _touchBeganAtPoint:](self, "_touchBeganAtPoint:", v8, v10);
  }
  return v11;
}

- (BOOL)_touchBeganAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BKScrubberControl;
  id v6 = a3;
  [(BKScrubberControl *)&v13 continueTrackingWithTouch:v6 withEvent:a4];
  double v7 = [(BKScrubberControl *)self track];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  -[BKScrubberControl _touchMovedAtPoint:refresh:](self, "_touchMovedAtPoint:refresh:", [(BKScrubberControl *)self isTracking] ^ 1, v9, v11);
  return 1;
}

- (void)_touchMovedAtPoint:(CGPoint)a3 refresh:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v11 = [(BKScrubberControl *)self track];
  if ([(BKScrubberControl *)self orientation])
  {
    unsigned int v8 = [(BKScrubberControl *)self orientation];
    double v9 = 0.0;
    if (v8 == 1)
    {
      [v11 frame];
      double v9 = y / CGRectGetHeight(v13);
    }
  }
  else
  {
    int64_t v10 = [(BKScrubberControl *)self layoutDirection];
    if (v10 == 1)
    {
      [v11 frame];
      double v9 = 1.0 - x / CGRectGetWidth(v15);
    }
    else
    {
      double v9 = 0.0;
      if (!v10)
      {
        [v11 frame];
        double v9 = x / CGRectGetWidth(v14);
      }
    }
  }
  [(BKScrubberControl *)self scrubToValue:v4 refresh:v9];
  [(BKScrubberControl *)self layoutIfNeeded];
}

- (int64_t)pageNumberForValue:(double)a3
{
  uint64_t v4 = [(BKScrubberControl *)self pageCount];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  double v6 = (double)v4;
  if ((double)v4 * a3 <= (double)v4) {
    double v6 = (double)v4 * a3;
  }
  return (uint64_t)fmax(v6, 1.0);
}

- (void)scrubToValue:(double)a3 refresh:(BOOL)a4
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  double v5 = fmax(a3, 0.0);
  [(BKScrubberControl *)self _setValue:0 updateScrollView:v5];
  unint64_t v6 = [(BKScrubberControl *)self pageCount];
  double v7 = v5 * (double)[(BKScrubberControl *)self pageCount] + 1.0;
  if (v7 > (double)v6) {
    double v7 = (double)v6;
  }
  double v8 = fmax(v7, 1.0);
  if (v8 != (double)[(BKScrubberControl *)self pageNumber])
  {
    [(BKScrubberControl *)self setPageNumber:(uint64_t)v8];
    [(BKScrubberControl *)self sendActionsForControlEvents:4096];
  }
}

- (void)scrubToPageNumber:(int64_t)a3 refresh:(BOOL)a4
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKScrubberControl *)self isEnabled] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKScrubberControl;
    [(BKScrubberControl *)&v8 setEnabled:v3];
    [(BKScrubberControl *)self setNeedsLayout];
    uint64_t v5 = v3 ^ 1;
    if (self->_isClassic)
    {
      unint64_t v6 = [(BKScrubberControl *)self track];
      [v6 setHidden:v5];
    }
    double v7 = [(BKScrubberControl *)self scrollView];
    [v7 setHidden:v5];

    [(BKScrubberControl *)self updateHoverState];
  }
}

- (CGRect)hitRectForThumb
{
  v2 = [(BKScrubberControl *)self thumb];
  [v2 center];
  CGRectMakeWithCenterAndSize();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setValue:(double)a3
{
}

- (void)_setValue:(double)a3 updateScrollView:(BOOL)a4
{
  double v6 = [(BKScrubberControl *)self track];
  [v6 readingProgress];
  double v8 = v7;

  if (v8 != a3)
  {
    double v9 = [(BKScrubberControl *)self track];
    [v9 setReadingProgress:a3];

    if (![(BKScrubberControl *)self hideThumbView])
    {
      [(BKScrubberControl *)self setNeedsLayout];
    }
  }
}

- (void)setPageNumber:(int64_t)a3
{
  uint64_t v5 = [(BKScrubberControl *)self isTracking] ^ 1;

  [(BKScrubberControl *)self setPageNumber:a3 refresh:v5];
}

- (void)setPageNumber:(int64_t)a3 refresh:(BOOL)a4
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 >= 1) {
    int64_t v4 = a3;
  }
  if (v4 != self->_pageNumber)
  {
    BOOL v5 = a4;
    self->_pageNumber = v4;
    if (![(BKScrubberControl *)self hideThumbView]) {
      [(BKScrubberControl *)self setNeedsLayout];
    }
    [(BKScrubberControl *)self updateValueAndRefresh:v5];
  }
}

- (void)setPageCount:(unint64_t)a3
{
  uint64_t v5 = [(BKScrubberControl *)self isTracking] ^ 1;

  [(BKScrubberControl *)self setPageCount:a3 refresh:v5];
}

- (void)setPageCount:(unint64_t)a3 refresh:(BOOL)a4
{
  if (self->_pageCount != a3)
  {
    BOOL v4 = a4;
    self->_pageCount = a3;
    [(BKScrubberControl *)self setNeedsLayout];
    [(BKScrubberControl *)self updateValueAndRefresh:v4];
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double height = CGSizeZero.height;
      scrollView = self->_scrollView;
      -[UIScrollView setContentSize:](scrollView, "setContentSize:", CGSizeZero.width, height);
    }
  }
}

- (void)updateValue
{
  uint64_t v3 = [(BKScrubberControl *)self isTracking] ^ 1;

  [(BKScrubberControl *)self updateValueAndRefresh:v3];
}

- (void)updateValueAndRefresh:(BOOL)a3
{
  if (a3)
  {
    int64_t pageNumber = self->_pageNumber;
    double v4 = 0.0;
    if (pageNumber != 1 && pageNumber != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t pageCount = self->_pageCount;
      double v4 = 1.0;
      if (pageNumber != pageCount)
      {
        double v4 = 0.0;
        if (pageCount) {
          double v4 = (double)pageNumber / (double)pageCount;
        }
      }
    }
    [(BKScrubberControl *)self setValue:v4];
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  uint64_t v5 = [(BKScrubberControl *)self track];
  id v6 = [v5 layoutDirection];

  if (v6 != (id)a3)
  {
    double v7 = [(BKScrubberControl *)self track];
    [v7 setLayoutDirection:a3];

    [(BKScrubberControl *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(BKScrubberControl *)self track];
  unsigned int v6 = [v5 trackOrientation];

  if (v6 != v3)
  {
    double v7 = [(BKScrubberControl *)self track];
    [v7 setTrackOrientation:v3];

    [(BKScrubberLayerImp *)self->_modernKnobImp setOrientation:v3];
    [(BKScrubberLayerImp *)self->_modernTrackImp setOrientation:v3];
    [(BKScrubberControl *)self setNeedsLayout];
  }
}

- (void)setProgress:(double)a3
{
  uint64_t v5 = [(BKScrubberControl *)self track];
  [v5 loadingProgress];
  double v7 = v6;

  if (v7 != a3)
  {
    double v8 = [(BKScrubberControl *)self track];
    [v8 setLoadingProgress:a3];

    [(BKScrubberControl *)self setNeedsLayout];
    [(BKScrubberControl *)self updateHoverState];
  }
}

- (CGRect)thumbRect
{
  uint64_t v3 = [(BKScrubberControl *)self track];
  [v3 loadingProgress];
  double v5 = v4;

  if (v5 == 1.0)
  {
    if (self->_isClassic) {
      [(BKScrubberControl *)self _classicThumbRect];
    }
    else {
      [(BKScrubberControl *)self _modernThumbRect];
    }
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_classicThumbRect
{
  uint64_t v3 = [(BKScrubberControl *)self track];
  [v3 loadingProgress];
  double v5 = v4;

  if (v5 == 1.0)
  {
    if ([(BKScrubberControl *)self orientation])
    {
      if ([(BKScrubberControl *)self orientation] != 1)
      {
LABEL_8:
        double v13 = +[UIScreen mainScreen];
        [v13 scale];

        CGRectMakeWithOriginSize();
        goto LABEL_9;
      }
      double v6 = [(BKScrubberControl *)self track];
      [v6 frame];
      CGRectGetMidX(v14);

      [(BKScrubberControl *)self value];
      double v7 = [(BKScrubberControl *)self track];
      [v7 frame];
      CGRectGetHeight(v15);
    }
    else
    {
      [(BKScrubberControl *)self value];
      double v12 = [(BKScrubberControl *)self track];
      [v12 frame];
      CGRectGetWidth(v16);

      double v7 = [(BKScrubberControl *)self track];
      [v7 frame];
      CGRectGetMidY(v17);
    }

    goto LABEL_8;
  }
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
LABEL_9:
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_knobOffsetForInset:(double)a3 knobLength:(double)a4 knobTravelLength:(double)a5
{
  [(BKScrubberControl *)self value];
  return a3 + v8 * (a5 - a4);
}

- (CGRect)_modernThumbRect
{
  [(BKScrubberControl *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  unsigned int v11 = [(BKScrubberControl *)self orientation];
  CGFloat v12 = v4;
  CGFloat v13 = v6;
  CGFloat v14 = v8;
  CGFloat v15 = v10;
  if (v11)
  {
    CGFloat v16 = CGRectGetHeight(*(CGRect *)&v12) + -2.0;
    [(BKScrubberControl *)self _knobProportion];
    double v18 = fmax(v17 * v16, 26.0);
    double v19 = 1.0;
    [(BKScrubberControl *)self _knobOffsetForInset:1.0 knobLength:v18 knobTravelLength:v16];
    double v21 = v20;
    v30.origin.double x = v4;
    v30.origin.double y = v6;
    v30.size.double width = v8;
    v30.size.double height = v10;
    double v22 = CGRectGetWidth(v30) + -2.0;
  }
  else
  {
    CGFloat v23 = CGRectGetWidth(*(CGRect *)&v12) + -2.0;
    [(BKScrubberControl *)self _knobProportion];
    double v22 = fmax(v24 * v23, 26.0);
    double v21 = 1.0;
    [(BKScrubberControl *)self _knobOffsetForInset:1.0 knobLength:v22 knobTravelLength:v23];
    double v19 = v25;
    v31.origin.double x = v4;
    v31.origin.double y = v6;
    v31.size.double width = v8;
    v31.size.double height = v10;
    double v18 = CGRectGetHeight(v31) + -2.0;
  }
  double v26 = v19;
  double v27 = v21;
  double v28 = v22;
  double v29 = v18;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (double)_knobProportion
{
  return (float)(1.0 / (float)[(BKScrubberControl *)self pageCount]);
}

- (BKShapeView)thumb
{
  if (!self->_thumb && ![(BKScrubberControl *)self hideThumbView])
  {
    double v3 = -[BKShapeView initWithFrame:]([BKShapeView alloc], "initWithFrame:", 0.0, 0.0, 8.0, 8.0);
    CGFloat v4 = v3;
    if (self->_isClassic)
    {
      [(BKShapeView *)v3 bounds];
      double v5 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
      [(BKShapeView *)v4 setPath:v5];
    }
    [(BKShapeView *)v4 setFillColorUsesTintColor:1];
    [(BKShapeView *)v4 setIgnoresTintColorAlpha:1];
    thumb = self->_thumb;
    self->_thumb = v4;
    double v7 = v4;

    [(BKShapeView *)self->_thumb setAlpha:0.01];
  }
  CGFloat v8 = self->_thumb;

  return v8;
}

- (BKScrubberTrack)track
{
  track = self->_track;
  if (!track)
  {
    CGFloat v4 = objc_alloc_init(BKClassicScrubberTrack);
    double v5 = self->_track;
    self->_track = &v4->super;

    [(BKScrubberTrack *)self->_track setAlpha:0.01];
    track = self->_track;
    if (!self->_isClassic)
    {
      [(BKScrubberTrack *)track setModern:1];
      track = self->_track;
    }
  }

  return track;
}

- (int64_t)layoutDirection
{
  v2 = [(BKScrubberControl *)self track];
  id v3 = [v2 layoutDirection];

  return (int64_t)v3;
}

- (double)progress
{
  v2 = [(BKScrubberControl *)self track];
  [v2 loadingProgress];
  double v4 = v3;

  return v4;
}

- (double)value
{
  int64_t v3 = [(BKScrubberControl *)self layoutDirection];
  double v4 = [(BKScrubberControl *)self track];
  [v4 readingProgress];
  if (v3) {
    double v6 = 1.0 - v5;
  }
  else {
    double v6 = v5;
  }

  return v6;
}

- (int)orientation
{
  v2 = [(BKScrubberControl *)self track];
  int v3 = [v2 trackOrientation];

  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(BKScrubberControl *)self pointerInteraction];
  if (v9 == v7)
  {
    [(BKShapeView *)self->_thumb frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v8 location];
    v24.double x = v18;
    v24.double y = v19;
    v25.origin.double x = v11;
    v25.origin.double y = v13;
    v25.size.double width = v15;
    v25.size.double height = v17;
    BOOL v20 = CGRectContainsPoint(v25, v24);

    if (v20)
    {
      [(BKShapeView *)self->_thumb frame];
      double v21 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", @"thumb");
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v21 = 0;
LABEL_6:

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKScrubberControl *)self pointerInteraction];
  if ((id)v8 == v6)
  {
    CGFloat v11 = [v7 identifier];
    unsigned int v12 = [v11 isEqual:@"thumb"];

    if (!v12)
    {
      double v10 = 0;
      goto LABEL_10;
    }
    if ([(BKScrubberControl *)self isTracking])
    {
      id v9 = +[UIBezierPath bezierPath];
      CGFloat v13 = +[UIPointerShape shapeWithPath:v9];
      +[UIPointerStyle styleWithShape:v13 constrainedAxes:0];
    }
    else
    {
      id v9 = [objc_alloc((Class)UITargetedPreview) initWithView:self->_thumb];
      CGFloat v13 = +[UIPointerHighlightEffect effectWithPreview:v9];
      +[UIPointerStyle styleWithEffect:v13 shape:0];
    double v10 = };
  }
  else
  {
    id v9 = (id)v8;
    double v10 = 0;
  }

LABEL_10:

  return v10;
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setTrack:(id)a3
{
}

- (int64_t)themeInterfaceStyle
{
  return self->_themeInterfaceStyle;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)hideThumbView
{
  return self->_hideThumbView;
}

- (void)setHideThumbView:(BOOL)a3
{
  self->_hideThumbView = a3;
}

- (void)setThumb:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (BKAccessibilityScrubberControlDelegate)bkAccessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bkAccessibilityDelegate);

  return (BKAccessibilityScrubberControlDelegate *)WeakRetained;
}

- (void)setBkAccessibilityDelegate:(id)a3
{
}

- (int64_t)hoverState
{
  return self->_hoverState;
}

- (BOOL)isClassic
{
  return self->_isClassic;
}

- (void)setIsClassic:(BOOL)a3
{
  self->_isClassic = a3;
}

- (BKScrubberHoverController)hoverController
{
  return self->_hoverController;
}

- (void)setHoverController:(id)a3
{
}

- (CALayer)modernKnobLayer
{
  return self->_modernKnobLayer;
}

- (void)setModernKnobLayer:(id)a3
{
}

- (CALayer)modernTrackLayer
{
  return self->_modernTrackLayer;
}

- (void)setModernTrackLayer:(id)a3
{
}

- (BKScrubberLayerImp)modernKnobImp
{
  return self->_modernKnobImp;
}

- (void)setModernKnobImp:(id)a3
{
}

- (BKScrubberLayerImp)modernTrackImp
{
  return self->_modernTrackImp;
}

- (void)setModernTrackImp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernTrackImp, 0);
  objc_storeStrong((id *)&self->_modernKnobImp, 0);
  objc_storeStrong((id *)&self->_modernTrackLayer, 0);
  objc_storeStrong((id *)&self->_modernKnobLayer, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_destroyWeak((id *)&self->_bkAccessibilityDelegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_thumb, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_track, 0);
}

- (void)updateHoverState
{
  hoverController = self->_hoverController;
  if (hoverController) {
    id v4 = [(BKScrubberHoverController *)hoverController gestureHoverState];
  }
  else {
    id v4 = &def_7D91C + 2;
  }

  [(BKScrubberControl *)self setHoverState:v4];
}

- (void)setHoverState:(int64_t)a3
{
  int64_t v4 = [(BKScrubberControl *)self validateHoverState:a3];
  int64_t hoverState = self->_hoverState;
  if (hoverState != v4)
  {
    int64_t v6 = v4;
    self->_int64_t hoverState = v4;
    BOOL v7 = v4 == 2;
    BOOL v8 = v4 != 0;
    [(BKScrubberControl *)self progress];
    if (v9 == 1.0) {
      double v10 = 0.25;
    }
    else {
      double v10 = 0.0;
    }
    if (v9 == 1.0) {
      double v11 = 0.5;
    }
    else {
      double v11 = 0.0;
    }
    if (((v7 ^ (hoverState != 2)) & 1) == 0)
    {
      if (v6 == 2) {
        double v12 = v10;
      }
      else {
        double v12 = v11;
      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1507CC;
      v16[3] = &unk_2C5308;
      v16[4] = self;
      BOOL v17 = v6 == 2;
      +[UIView animateWithDuration:v16 animations:v12];
    }
    if ((v6 != 0) == (hoverState == 0))
    {
      if (v6) {
        double v13 = v10;
      }
      else {
        double v13 = v11;
      }
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_150834;
      v14[3] = &unk_2C5308;
      v14[4] = self;
      BOOL v15 = v8;
      +[UIView animateWithDuration:v14 animations:v13];
    }
  }
}

- (int64_t)validateHoverState:(int64_t)a3
{
  if (![(BKScrubberControl *)self isEnabled]) {
    return 0;
  }
  [(BKScrubberControl *)self progress];
  if (v5 != 1.0) {
    return 0;
  }
  return a3;
}

- (void)_updateScrollviewValue:(double)a3
{
  if ([(BKScrubberControl *)self orientation])
  {
    [(UIScrollView *)self->_scrollView contentSize];
    double v6 = v5 * a3;
    scrollView = self->_scrollView;
    double v8 = 0.0;
  }
  else
  {
    double v9 = [(BKScrubberControl *)self track];
    double v10 = (char *)[v9 layoutDirection];

    if (v10 == (unsigned char *)&def_7D91C + 1)
    {
      [(UIScrollView *)self->_scrollView contentSize];
      double v13 = v12;
      [(UIScrollView *)self->_scrollView contentSize];
      double v8 = v13 - v14 * a3;
    }
    else
    {
      if (v10) {
        return;
      }
      [(UIScrollView *)self->_scrollView contentSize];
      double v8 = v11 * a3;
    }
    scrollView = self->_scrollView;
    double v6 = 0.0;
  }

  -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", v8, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  scrollView = self->_scrollView;
  id v5 = a3;
  [(UIScrollView *)scrollView frame];
  double v7 = v6;
  double v9 = v8;
  unsigned int v10 = [(BKScrubberControl *)self orientation];
  [(UIScrollView *)self->_scrollView contentOffset];
  double v12 = v11;
  double v14 = v13;
  [(UIScrollView *)self->_scrollView contentSize];
  double v16 = v9 * (v14 / (v15 - v9));
  double v18 = v7 * (v12 / (v17 - v7));
  if (v10) {
    double v19 = 0.0;
  }
  else {
    double v19 = v18;
  }
  if (v10) {
    double v20 = v16;
  }
  else {
    double v20 = 0.0;
  }
  double v21 = [v5 panGestureRecognizer];

  double v22 = (char *)[v21 state];
  if (v22 == (unsigned char *)&def_7D91C + 2)
  {
    -[BKScrubberControl _touchMovedAtPoint:refresh:](self, "_touchMovedAtPoint:refresh:", 0, v19, v20);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_150B84;
  v4[3] = &unk_2C4F08;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

@end