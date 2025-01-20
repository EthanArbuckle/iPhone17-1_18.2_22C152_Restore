@interface BKThumbnailScrubber
- (BKScrubberCalloutView)callout;
- (BKThumbnailScrubberDelegate)delegate;
- (BOOL)accessibilityActivate;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)hideThumbView;
- (BOOL)hidesSpine;
- (BOOL)isWithinGravitationalPointReach;
- (BOOL)showSpreads;
- (CGPoint)accessibilityActivationPoint;
- (CGPoint)gravitationalPoint;
- (CGPoint)pointForValue:(double)a3;
- (CGRect)hitRectForThumb;
- (CGRect)thumbRect;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)_segmentSizeForMaxScrubberSize:(CGSize)result orientation:(int)a4 cellAspectRatio:(double)a5 spread:(BOOL)a6;
- (CGSize)calloutImageSize;
- (CGSize)intrinsicContentSize;
- (CGSize)segmentSize;
- (NSString)bkAccessibilityAnnouncementString;
- (UIColor)strokeColor;
- (_NSRange)_pageRangeAtIndex:(unint64_t)a3 segmentCount:(unint64_t)a4 pageCount:(unint64_t)a5 orientation:(int)a6 layoutDirection:(int64_t)a7 spread:(BOOL)a8;
- (_NSRange)_pageRangeForPageNumber:(int64_t)a3 pageCount:(unint64_t)a4 spread:(BOOL)a5;
- (_NSRange)pageRangeAtIndex:(unint64_t)a3;
- (_NSRange)pageRangeForPageNumber:(int64_t)a3;
- (double)cellAspectRatio;
- (double)value;
- (double)valueForPoint:(CGPoint)a3;
- (id)thumb;
- (id)track;
- (int64_t)leftCalloutPageNumber;
- (int64_t)pageNumber;
- (int64_t)pageNumberForValue:(double)a3;
- (int64_t)rightCalloutPageNumber;
- (unint64_t)_computeSegmentCountForRect:(CGSize)a3 segmentSize:(CGSize)a4 idealCount:(unint64_t)a5 orientation:(int)a6;
- (unint64_t)idealCellCount;
- (unint64_t)segmentIndexForPage:(int64_t)a3;
- (void)_bkAccessibilityAnnounceValue;
- (void)_bkAccessibilityValueDidChange;
- (void)_updateCalloutPageView;
- (void)_updateThumb;
- (void)_updateThumbnails;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
- (void)cancelPendingRenderRequests;
- (void)configureCell:(id)a3 pageRange:(_NSRange)a4 context:(id)a5;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prewarmThumbnailsForScrubberSize:(CGSize)a3;
- (void)setBkAccessibilityAnnouncementString:(id)a3;
- (void)setCallout:(id)a3;
- (void)setCellAspectRatio:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGravitationalPoint:(CGPoint)a3;
- (void)setHideThumbView:(BOOL)a3;
- (void)setHidesSpine:(BOOL)a3;
- (void)setIsWithinGravitationalPointReach:(BOOL)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageNumber:(int64_t)a3;
- (void)setShowSpreads:(BOOL)a3;
- (void)setStrokeColor:(id)a3;
- (void)setThumbnail:(id)a3 forPage:(int64_t)a4 context:(id)a5;
- (void)snapToGravitationalPoint;
@end

@implementation BKThumbnailScrubber

- (void)layoutSubviews
{
  [(BKThumbnailScrubber *)self _updateThumbnails];
  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailScrubber;
  [(BKThumbnailScrubber *)&v12 layoutSubviews];
  if ([(BKThumbnailScrubber *)self orientation] == 1)
  {
    v3 = [(BKThumbnailScrubber *)self track];
    [v3 bounds];
    double MaxY = CGRectGetMaxY(v13);
    [(BKThumbnailScrubber *)self bounds];
    double v5 = CGRectGetMaxY(v14);

    if (MaxY != v5)
    {
      [(BKThumbnailScrubber *)self center];
      double v7 = v6;
      v8 = [(BKThumbnailScrubber *)self track];
      [v8 frame];
      double Height = CGRectGetHeight(v15);

      [(BKThumbnailScrubber *)self frame];
      double v11 = v10;
      [(BKThumbnailScrubber *)self frame];
      -[BKThumbnailScrubber setFrame:](self, "setFrame:", v11, v7 + Height * -0.5, floor(CGRectGetWidth(v16)), floor(Height));
      [(BKThumbnailScrubber *)self setNeedsLayout];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double width = UILayoutFittingExpandedSize.width;
  double height = UILayoutFittingExpandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailScrubber;
  [(BKThumbnailScrubber *)&v11 beginTrackingWithTouch:v6 withEvent:a4];
  double v7 = [(BKThumbnailScrubber *)self track];
  if (v7)
  {
    [v6 locationInView:v7];
    -[BKThumbnailScrubber valueForPoint:](self, "valueForPoint:");
    *(float *)&double v8 = v8;
    double v9 = *(float *)&v8;
    [(BKThumbnailScrubber *)self setValue:*(float *)&v8];
    [(BKThumbnailScrubber *)self setPageNumber:[(BKThumbnailScrubber *)self pageNumberForValue:v9]];
  }

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BKThumbnailScrubber *)self pageNumber];
  v18.receiver = self;
  v18.super_class = (Class)BKThumbnailScrubber;
  BOOL v9 = [(BKThumbnailScrubber *)&v18 continueTrackingWithTouch:v6 withEvent:v7];

  double y = CGPointZero.y;
  BOOL v11 = CGPointZero.x == self->_gravitationalPoint.x && y == self->_gravitationalPoint.y;
  if (!v11 && v8 != (void *)[(BKThumbnailScrubber *)self pageNumber])
  {
    [v6 locationInView:self];
    double v13 = self->_gravitationalPoint.y;
    double v14 = v13 + -10.0;
    double v15 = v13 + 10.0;
    if (v12 > v14 && v12 < v15)
    {
      [(BKThumbnailScrubber *)self setIsWithinGravitationalPointReach:1];
      [(BKThumbnailScrubber *)self snapToGravitationalPoint];
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    [(BKThumbnailScrubber *)self setIsWithinGravitationalPointReach:0];
  }
  if (v9) {
LABEL_12:
  }
    [(BKThumbnailScrubber *)self _bkAccessibilityValueDidChange];
LABEL_13:

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailScrubber;
  [(BKThumbnailScrubber *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  [(BKThumbnailScrubber *)self setBkAccessibilityAnnouncementString:0];
}

- (double)value
{
  id v3 = [(BKThumbnailScrubber *)self pageCount];
  double result = 0.0;
  if ((unint64_t)v3 >= 2)
  {
    double v5 = (double)((unint64_t)[(BKThumbnailScrubber *)self pageNumber] - 1);
    return (float)(v5 / (double)((unint64_t)[(BKThumbnailScrubber *)self pageCount] - 1));
  }
  return result;
}

- (int64_t)pageNumber
{
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailScrubber;
  return (int64_t)[(BKThumbnailScrubber *)self pageRangeForPageNumber:[(BKThumbnailScrubber *)&v3 pageNumber]];
}

- (void)setPageNumber:(int64_t)a3
{
  if (*(void *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__pageNumber] != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKThumbnailScrubber;
    -[BKThumbnailScrubber setPageNumber:](&v4, "setPageNumber:");
    [(BKThumbnailScrubber *)self _updateThumb];
    [(BKThumbnailScrubber *)self _updateCalloutPageView];
    if (![(BKThumbnailScrubber *)self hideThumbView]) {
      [(BKThumbnailScrubber *)self setNeedsLayout];
    }
  }
}

- (void)setPageCount:(unint64_t)a3
{
  if ([(BKThumbnailScrubber *)self pageCount] != (id)a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKThumbnailScrubber;
    [(BKThumbnailScrubber *)&v5 setPageCount:a3];
    [(BKThumbnailScrubber *)self _updateCalloutPageView];
  }
}

- (id)track
{
  uint64_t v3 = OBJC_IVAR___BKScrubberControl__track;
  objc_super v4 = *(void **)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
  if (!v4)
  {
    objc_super v5 = [BKThumbnailScrubberTrack alloc];
    [(BKThumbnailScrubber *)self bounds];
    id v6 = -[BKThumbnailScrubberTrack initWithFrame:](v5, "initWithFrame:");
    [(BKThumbnailScrubberTrack *)v6 setAutoresizingMask:18];
    [(BKThumbnailScrubber *)self segmentSize];
    -[BKThumbnailScrubberTrack setSegmentSize:](v6, "setSegmentSize:");
    id v7 = [(BKThumbnailScrubber *)self strokeColor];
    [(BKThumbnailScrubberTrack *)v6 setSegmentStrokeColor:v7];

    [(BKThumbnailScrubber *)self showSpreads];
    [(BKThumbnailScrubberTrack *)v6 setCellClass:objc_opt_class()];
    double v8 = *(void **)&self->BKScrubberControl_opaque[v3];
    *(void *)&self->BKScrubberControl_opaque[v3] = v6;

    objc_super v4 = *(void **)&self->BKScrubberControl_opaque[v3];
  }

  return v4;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(BKThumbnailScrubber *)self track];
  [v8 sizeThatFits:width, height];
  double v10 = v9;
  double v12 = v11;

  if ([(BKThumbnailScrubber *)self orientation] == 1)
  {
    double v14 = CGPointZero.x;
    double v13 = CGPointZero.y;
  }
  else
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    double v14 = round((CGRectGetWidth(v18) - v10) * 0.5);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    double v13 = round((CGRectGetHeight(v19) - v12) * 0.5);
  }
  double v15 = v14;
  double v16 = v10;
  double v17 = v12;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)thumb
{
  if (!self->_imageThumb && ![(BKThumbnailScrubber *)self hideThumbView])
  {
    [(BKThumbnailScrubber *)self showSpreads];
    uint64_t v3 = [(BKThumbnailScrubberCell *)[objc_alloc((Class)objc_opt_class()) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    imageThumb = self->_imageThumb;
    self->_imageThumb = v3;

    objc_super v5 = [(BKThumbnailScrubber *)self strokeColor];
    [(BKThumbnailScrubberCell *)self->_imageThumb setStrokeColor:v5];

    [(BKThumbnailScrubberCell *)self->_imageThumb setAlpha:(double)([(BKThumbnailScrubber *)self hideThumbView] ^ 1)];
    [(BKThumbnailScrubber *)self _updateThumb];
  }
  id v6 = self->_imageThumb;

  return v6;
}

- (CGRect)hitRectForThumb
{
  v2 = [(BKThumbnailScrubber *)self track];
  [v2 frame];
  CGRect v12 = CGRectInset(v11, -20.0, -20.0);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;

  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)thumbRect
{
  uint64_t v3 = [(BKThumbnailScrubber *)self track];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_inMiniBar) {
    double v12 = 25.0;
  }
  else {
    double v12 = 33.0;
  }
  if (self->_inMiniBar) {
    double v13 = 19.0;
  }
  else {
    double v13 = 26.0;
  }
  [(BKThumbnailScrubber *)self cellAspectRatio];
  if (v14 != 0.0)
  {
    [(BKThumbnailScrubber *)self cellAspectRatio];
    double v13 = floor(v12 * v15);
    if ([(BKThumbnailScrubber *)self showSpreads]) {
      double v13 = v13 + v13;
    }
  }
  double v16 = [(BKThumbnailScrubber *)self track];
  [v16 segmentSize];
  double v18 = v17 * 0.5;
  [v16 segmentSize];
  double v40 = v19 * 0.5;
  if ((unint64_t)[(BKThumbnailScrubber *)self pageCount] >= 2)
  {
    id v20 = [(BKThumbnailScrubber *)self pageRangeForPageNumber:[(BKThumbnailScrubber *)self pageNumber]];
    unint64_t v22 = v21;
    if ([(BKThumbnailScrubber *)self orientation] == 1)
    {
      [(BKThumbnailScrubber *)self value];
      -[BKThumbnailScrubber pointForValue:](self, "pointForValue:");
      double v40 = v23;
    }
    else
    {
      v24 = (char *)[(BKThumbnailScrubber *)self pageCount] - 1;
      if ((unint64_t)v24 <= 1) {
        v24 = (unsigned char *)(&dword_0 + 1);
      }
      double v39 = (((double)v22 + -1.0) * 0.5 + (double)(unint64_t)v20 + -1.0) / (double)(unint64_t)v24;
      v41.origin.CGFloat x = v5;
      v41.origin.CGFloat y = v7;
      v41.size.CGFloat width = v9;
      v41.size.CGFloat height = v11;
      double Width = CGRectGetWidth(v41);
      [v16 segmentSize];
      double v18 = v18 + v39 * (Width - v26);
    }
  }
  if ([(BKThumbnailScrubber *)self layoutDirection] == (char *)&dword_0 + 1
    && ![(BKThumbnailScrubber *)self orientation])
  {
    v42.origin.CGFloat x = v5;
    v42.origin.CGFloat y = v7;
    v42.size.CGFloat width = v9;
    v42.size.CGFloat height = v11;
    double v18 = CGRectGetWidth(v42) - v18;
  }
  unsigned int v27 = [(BKThumbnailScrubber *)self orientation];
  v43.origin.CGFloat x = v5;
  v43.origin.CGFloat y = v7;
  v43.size.CGFloat width = v9;
  v43.size.CGFloat height = v11;
  double MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = v5;
  v44.origin.CGFloat y = v7;
  v44.size.CGFloat width = v9;
  v44.size.CGFloat height = v11;
  double MinY = CGRectGetMinY(v44);
  double v30 = round(v18 - v13 * 0.5);
  double v31 = round((v9 - v13) * 0.5);
  double v32 = v40 - v12 * 0.5;
  if (v27 == 1) {
    double v30 = v31;
  }
  else {
    double v32 = (v11 - v12) * 0.5;
  }
  double v33 = v30 + MinX;
  double v34 = round(v32) + MinY;

  double v35 = v33;
  double v36 = v34;
  double v37 = v13;
  double v38 = v12;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (void)setStrokeColor:(id)a3
{
  CGFloat v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    [*(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track] setSegmentStrokeColor:v5];
    [(BKThumbnailScrubberCell *)self->_imageThumb setStrokeColor:v5];
  }
}

- (void)setShowSpreads:(BOOL)a3
{
  if (self->_showSpreads != a3)
  {
    self->_showSpreads = a3;
    id v4 = *(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
    [(BKThumbnailScrubber *)self showSpreads];
    [v4 setCellClass:objc_opt_class()];
    CGFloat v5 = [(BKThumbnailScrubber *)self delegate];
    [v5 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:self->_imageThumb];

    [(BKThumbnailScrubberCell *)self->_imageThumb removeFromSuperview];
    imageThumb = self->_imageThumb;
    self->_imageThumb = 0;

    id v7 = [(BKThumbnailScrubber *)self thumb];
    [(BKThumbnailScrubber *)self addSubview:v7];
  }
}

- (void)setCellAspectRatio:(double)a3
{
  if (self->_cellAspectRatio != a3)
  {
    self->_cellAspectRatio = a3;
    id v4 = *(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
    [(BKThumbnailScrubber *)self segmentSize];
    [v4 setSegmentSize:];
  }
}

- (void)setHideThumbView:(BOOL)a3
{
  if (self->_hideThumbView != a3)
  {
    self->_hideThumbView = a3;
    if (a3)
    {
      [(BKThumbnailScrubberCell *)self->_imageThumb removeFromSuperview];
      imageThumb = self->_imageThumb;
      self->_imageThumb = 0;
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BKThumbnailScrubber *)self frame];
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  BOOL v8 = CGRectEqualToRect(v11, v12);
  v10.receiver = self;
  v10.super_class = (Class)BKThumbnailScrubber;
  -[BKThumbnailScrubber setFrame:](&v10, "setFrame:", x, y, width, height);
  if (!v8)
  {
    id v9 = *(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
    [(BKThumbnailScrubber *)self segmentSize];
    [v9 setSegmentSize:];
    [(BKThumbnailScrubber *)self _updateThumbnails];
  }
}

- (CGSize)segmentSize
{
  if (*(void *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track]) {
    id v3 = [(BKThumbnailScrubber *)self orientation];
  }
  else {
    id v3 = 0;
  }
  [(BKThumbnailScrubber *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(BKThumbnailScrubber *)self cellAspectRatio];
  double v9 = v8;
  BOOL v10 = [(BKThumbnailScrubber *)self showSpreads];

  -[BKThumbnailScrubber _segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:](self, "_segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:", v3, v10, v5, v7, v9);
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)_segmentSizeForMaxScrubberSize:(CGSize)result orientation:(int)a4 cellAspectRatio:(double)a5 spread:(BOOL)a6
{
  if (a4 == 1)
  {
    double width = result.width * 0.5;
    if (!a6) {
      double width = result.width;
    }
    double v7 = floor(width / a5);
    if (a5 > 0.0) {
      result.double height = v7;
    }
  }
  else
  {
    result.double height = 22.0;
    if (self->_inMiniBar) {
      result.double height = 16.0;
    }
    result.double width = 14.0;
    if (!self->_inMiniBar) {
      result.double width = 18.0;
    }
    double v8 = floor(result.height * a5);
    if (a5 > 0.0) {
      result.double width = v8;
    }
    if (a6) {
      result.double width = result.width + result.width;
    }
  }
  return result;
}

- (unint64_t)idealCellCount
{
  unsigned int v3 = [(BKThumbnailScrubber *)self showSpreads];
  float v4 = (float)(unint64_t)[(BKThumbnailScrubber *)self pageCount];
  float v5 = ceilf((float)(v4 + 1.0) * 0.5);
  if (v3) {
    return (unint64_t)v5;
  }
  return (unint64_t)v4;
}

- (_NSRange)_pageRangeForPageNumber:(int64_t)a3 pageCount:(unint64_t)a4 spread:(BOOL)a5
{
  NSUInteger v5 = a3;
  if (a5)
  {
    if (a3 >= 2 && a3 < a4)
    {
      if ((a3 & 0x8000000000000001) == 1) {
        uint64_t v6 = -1;
      }
      else {
        uint64_t v6 = 0;
      }
      goto LABEL_11;
    }
    NSUInteger v7 = 1;
    if (a3 == a4 && (a3 & 0x8000000000000001) == 1)
    {
      uint64_t v6 = -1;
LABEL_11:
      NSUInteger v5 = v6 + a3;
      NSUInteger v7 = 2;
    }
  }
  else
  {
    NSUInteger v7 = 1;
  }
  result.length = v7;
  result.location = v5;
  return result;
}

- (_NSRange)pageRangeForPageNumber:(int64_t)a3
{
  id v5 = [(BKThumbnailScrubber *)self pageCount];
  BOOL v6 = [(BKThumbnailScrubber *)self showSpreads];

  id v7 = [(BKThumbnailScrubber *)self _pageRangeForPageNumber:a3 pageCount:v5 spread:v6];
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)_pageRangeAtIndex:(unint64_t)a3 segmentCount:(unint64_t)a4 pageCount:(unint64_t)a5 orientation:(int)a6 layoutDirection:(int64_t)a7 spread:(BOOL)a8
{
  if (a4 < 2)
  {
    id v11 = &dword_0 + 1;
    NSUInteger v12 = 1;
  }
  else
  {
    float v8 = roundf((float)((float)((float)a5 + -1.0) / (float)(a4 - 1)) * (float)a3) + 1.0;
    if (a7 == 1 && a6 == 0) {
      unint64_t v10 = a5 - (unint64_t)v8 + 1;
    }
    else {
      unint64_t v10 = (unint64_t)v8;
    }
    id v11 = -[BKThumbnailScrubber _pageRangeForPageNumber:pageCount:spread:](self, "_pageRangeForPageNumber:pageCount:spread:", v10, a5, a8, *(void *)&a6);
  }
  result.length = v12;
  result.location = (NSUInteger)v11;
  return result;
}

- (_NSRange)pageRangeAtIndex:(unint64_t)a3
{
  id v5 = [(BKThumbnailScrubber *)self track];
  id v6 = -[BKThumbnailScrubber _pageRangeAtIndex:segmentCount:pageCount:orientation:layoutDirection:spread:](self, "_pageRangeAtIndex:segmentCount:pageCount:orientation:layoutDirection:spread:", a3, [v5 segmentCount], -[BKThumbnailScrubber pageCount](self, "pageCount"), -[BKThumbnailScrubber orientation](self, "orientation"), -[BKThumbnailScrubber layoutDirection](self, "layoutDirection"), -[BKThumbnailScrubber showSpreads](self, "showSpreads"));
  NSUInteger v8 = v7;

  NSUInteger v9 = (NSUInteger)v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (unint64_t)segmentIndexForPage:(int64_t)a3
{
  id v5 = [(BKThumbnailScrubber *)self track];
  id v6 = [v5 segmentCount];
  id v7 = [(BKThumbnailScrubber *)self pageCount];
  NSUInteger v8 = (char *)[(BKThumbnailScrubber *)self layoutDirection];
  int64_t v9 = a3 - 1;
  if (a3 == 1 || !v7)
  {
    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      if ([(BKThumbnailScrubber *)self orientation]) {
        unint64_t v10 = 0;
      }
      else {
        unint64_t v10 = (unint64_t)v6 - 1;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
  }
  else
  {
    if (v8 == (unsigned char *)&dword_0 + 1 && ![(BKThumbnailScrubber *)self orientation]) {
      int64_t v9 = (int64_t)v7 - a3;
    }
    unint64_t v10 = llround((double)v9 / (double)((unint64_t)v7 - 1) * (double)((unint64_t)v6 - 1));
  }

  return v10;
}

- (void)configureCell:(id)a3 pageRange:(_NSRange)a4 context:(id)a5
{
  NSUInteger length = a4.length;
  location = (char *)a4.location;
  id v28 = a3;
  int64_t v9 = (BKThumbnailScrubberCell *)a5;
  unint64_t v10 = [(BKThumbnailScrubber *)self track];
  id v11 = v10;
  if (self->_imageThumb == v9)
  {
    [(BKThumbnailScrubberCell *)v9 bounds];
    double v13 = v16;
    double v15 = v17;
  }
  else
  {
    [v10 segmentSize];
    double v13 = v12;
    double v15 = v14;
  }
  double v18 = [(BKThumbnailScrubber *)self delegate];
  if ([(BKThumbnailScrubber *)self showSpreads])
  {
    double v19 = v13 * 0.5;
    id v20 = v28;
    if (length == 2)
    {
      unint64_t v21 = [v18 pageNumberFromRange:location, 2];
      unint64_t v22 = [v18 thumbnailScrubber:self thumbnailForPage:v21 size:v9 context:v15];
      double v23 = [v18 thumbnailScrubber:self thumbnailForPage:v21 + 1 size:v9 context:v15];
      if ([(BKThumbnailScrubber *)self layoutDirection] == (char *)&dword_0 + 1)
      {
        [v20 setRightImage:v22];
        [v20 setLeftImage:v23];
      }
      else
      {
        [v20 setLeftImage:v22];
        [v20 setRightImage:v23];
      }
      [v20 setShouldHaveRightImage:1];
      [v20 setShouldHaveLeftImage:1];
    }
    else
    {
      unint64_t v22 = [v18 thumbnailScrubber:self thumbnailForPage:location size:v9 context:v15];
      if (location == (unsigned char *)&dword_0 + 1 && ![(BKThumbnailScrubber *)self layoutDirection]
        || location == [(BKThumbnailScrubber *)self pageCount]
        && [(BKThumbnailScrubber *)self layoutDirection] == (char *)&dword_0 + 1)
      {
        v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = 1;
        unsigned int v27 = v22;
      }
      else
      {
        unsigned int v27 = 0;
        uint64_t v26 = 0;
        uint64_t v25 = 1;
        v24 = v22;
      }
      [v20 setLeftImage:v24];
      [v20 setRightImage:v27];
      [v20 setShouldHaveLeftImage:v25];
      [v20 setShouldHaveRightImage:v26];
    }
  }
  else
  {
    [v18 thumbnailScrubber:self thumbnailForPage:location size:v9 context:v13];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    [v28 setImage:v20];
  }
}

- (void)prewarmThumbnailsForScrubberSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(BKThumbnailScrubber *)self orientation];
  [(BKThumbnailScrubber *)self cellAspectRatio];
  -[BKThumbnailScrubber _segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:](self, "_segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:", v6, [(BKThumbnailScrubber *)self showSpreads], width, height, v7);
  double v9 = v8;
  double v11 = v10;
  unint64_t v12 = -[BKThumbnailScrubber _computeSegmentCountForRect:segmentSize:idealCount:orientation:](self, "_computeSegmentCountForRect:segmentSize:idealCount:orientation:", [(BKThumbnailScrubber *)self idealCellCount], [(BKThumbnailScrubber *)self orientation], width, height, v8, v10);
  id v26 = [(BKThumbnailScrubber *)self pageCount];
  id v13 = [(BKThumbnailScrubber *)self orientation];
  id v14 = [(BKThumbnailScrubber *)self layoutDirection];
  BOOL v15 = [(BKThumbnailScrubber *)self showSpreads];
  if (v12)
  {
    BOOL v16 = v15;
    for (uint64_t i = 0; i != v12; ++i)
    {
      double v18 = (char *)[(BKThumbnailScrubber *)self _pageRangeAtIndex:i segmentCount:v12 pageCount:v26 orientation:v13 layoutDirection:v14 spread:v16];
      unint64_t v20 = v19;
      unint64_t v21 = [(BKThumbnailScrubber *)self delegate];
      uint64_t v22 = OBJC_IVAR___BKScrubberControl__track;
      id v23 = [v21 thumbnailScrubber:self thumbnailForPage:v18 size:*(void *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track] context:v9];

      if (v20 >= 2)
      {
        v24 = [(BKThumbnailScrubber *)self delegate];
        id v25 = [v24 thumbnailScrubber:self thumbnailForPage:v18 + 1 size:*(void *)&self->BKScrubberControl_opaque[v22] context:v9];
      }
    }
  }
}

- (void)cancelPendingRenderRequests
{
  unsigned int v3 = [(BKThumbnailScrubber *)self delegate];
  [v3 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:self->_imageThumb];

  id v4 = [(BKThumbnailScrubber *)self delegate];
  [v4 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:*(void *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track]];
}

- (void)setThumbnail:(id)a3 forPage:(int64_t)a4 context:(id)a5
{
  id v31 = a3;
  double v8 = (BKThumbnailScrubberCell *)a5;
  if (v31 && a4 && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_imageThumb == v8)
    {
      id v16 = [(BKThumbnailScrubber *)self pageRangeForPageNumber:[(BKThumbnailScrubber *)self pageNumber]];
      if (a4 >= (unint64_t)v16 && a4 - (uint64_t)v16 < v17) {
        -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", self->_imageThumb, v16, v17, self->_imageThumb);
      }
    }
    else
    {
      uint64_t v9 = OBJC_IVAR___BKScrubberControl__track;
      if (*(BKThumbnailScrubberCell **)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track] == v8)
      {
        id v14 = [(BKThumbnailScrubber *)self track];
        unint64_t v18 = [(BKThumbnailScrubber *)self segmentIndexForPage:a4];
        unint64_t v19 = [v14 cellAtIndex:v18];
        id v20 = [(BKThumbnailScrubber *)self pageRangeAtIndex:v18];
        -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", v19, v20, v21, *(void *)&self->BKScrubberControl_opaque[v9]);

        goto LABEL_25;
      }
      double v10 = [(BKThumbnailScrubber *)self callout];
      double v11 = [v10 pageView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v13 = [(BKThumbnailScrubber *)self callout];
      id v14 = [v13 pageView];
      if (isKindOfClass)
      {

        BOOL v15 = [v14 leftPageView];
        if (v15 == v8)
        {
          id v25 = [v14 leftPageView];
          id v26 = [v25 pageNumber];

          if (v26 == (id)a4)
          {
            unsigned int v27 = [v14 leftPageView];
LABEL_23:
            id v28 = v27;
            [(BKThumbnailScrubberCell *)v27 setImage:v31];
            goto LABEL_24;
          }
        }
        else
        {
        }
        id v28 = [v14 rightPageView];
        if (v28 != v8)
        {
LABEL_24:

          goto LABEL_25;
        }
        v29 = [v14 rightPageView];
        id v30 = [v29 pageNumber];

        if (v30 == (id)a4)
        {
          unsigned int v27 = [v14 rightPageView];
          goto LABEL_23;
        }
LABEL_25:

        goto LABEL_26;
      }
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        id v23 = [(BKThumbnailScrubber *)self callout];
        v24 = [v23 pageView];

        if (v24 == v8 && [(BKThumbnailScrubberCell *)v8 pageNumber] == (id)a4) {
          [(BKThumbnailScrubberCell *)v8 setImage:v31];
        }
      }
    }
  }
LABEL_26:
}

- (unint64_t)_computeSegmentCountForRect:(CGSize)a3 segmentSize:(CGSize)a4 idealCount:(unint64_t)a5 orientation:(int)a6
{
  if (!a6)
  {
    double v6 = a3.width / (a4.width + 2.0);
    goto LABEL_5;
  }
  if (a4.height > 0.0)
  {
    double v6 = a3.height / a4.height;
LABEL_5:
    unint64_t v7 = (uint64_t)v6;
    goto LABEL_7;
  }
  unint64_t v7 = 0;
LABEL_7:
  if (v7 >= a5) {
    return a5;
  }
  else {
    return v7;
  }
}

- (void)_updateThumbnails
{
  if ([(BKThumbnailScrubber *)self pageCount] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v29 = [(BKThumbnailScrubber *)self track];
    unsigned int v3 = [(BKThumbnailScrubber *)self delegate];
    [v3 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:v29];

    [v29 segmentSize];
    double v5 = v4;
    double v7 = v6;
    [(BKThumbnailScrubber *)self bounds];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    unsigned int v16 = [(BKThumbnailScrubber *)self orientation];
    uint64_t v17 = v9;
    uint64_t v18 = v11;
    uint64_t v19 = v13;
    uint64_t v20 = v15;
    if (v16) {
      double v21 = CGRectGetHeight(*(CGRect *)&v17) / v7;
    }
    else {
      double v21 = CGRectGetWidth(*(CGRect *)&v17) / (v5 + 2.0);
    }
    uint64_t v22 = (uint64_t)v21;
    unint64_t v23 = [(BKThumbnailScrubber *)self idealCellCount];
    if (v23 < v22) {
      uint64_t v22 = v23;
    }
    [v29 setSegmentCount:v22];
    [v29 sizeToFit];
    [v29 layoutIfNeeded];
    if (v22 >= 1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        uint64_t v25 = i;
        if ([(BKThumbnailScrubber *)self layoutDirection] == (char *)&dword_0 + 1)
        {
          if ([(BKThumbnailScrubber *)self orientation]) {
            uint64_t v25 = i;
          }
          else {
            uint64_t v25 = v22 + ~i;
          }
        }
        id v26 = [v29 cellAtIndex:v25];
        id v27 = [(BKThumbnailScrubber *)self pageRangeAtIndex:v25];
        -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", v26, v27, v28, *(void *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track]);
      }
    }
  }
}

- (void)_updateThumb
{
  unsigned int v3 = [(BKThumbnailScrubber *)self delegate];
  [v3 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:self->_imageThumb];

  if (![(BKThumbnailScrubber *)self hideThumbView])
  {
    id v5 = [(BKThumbnailScrubber *)self pageRangeForPageNumber:[(BKThumbnailScrubber *)self pageNumber]];
    imageThumb = self->_imageThumb;
    -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", imageThumb, v5, v4, imageThumb);
  }
}

- (void)setIsWithinGravitationalPointReach:(BOOL)a3
{
  if (self->_isWithinGravitationalPointReach != a3)
  {
    self->_isWithinGravitationalPointReach = a3;
    if (a3)
    {
      id v3 = [objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
      [v3 impactOccurred];
    }
  }
}

- (void)snapToGravitationalPoint
{
  -[BKThumbnailScrubber valueForPoint:](self, "valueForPoint:", self->_gravitationalPoint.x, self->_gravitationalPoint.y);
  double v4 = v3;
  -[BKThumbnailScrubber setValue:](self, "setValue:");
  int64_t v5 = [(BKThumbnailScrubber *)self pageNumberForValue:v4];

  [(BKThumbnailScrubber *)self setPageNumber:v5];
}

- (void)setCallout:(id)a3
{
  int64_t v5 = (BKScrubberCalloutView *)a3;
  p_callout = &self->_callout;
  if (*p_callout != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_callout, a3);
    [(BKScrubberCalloutView *)*p_callout setUsesMonospacedDigitFontForSubtitle:1];
    int64_t v5 = v7;
  }
}

- (CGSize)calloutImageSize
{
  double v3 = [(BKThumbnailScrubber *)self callout];

  if (v3)
  {
    double v4 = [(BKThumbnailScrubber *)self callout];
    [(BKThumbnailScrubber *)self cellAspectRatio];
    [v4 thumbnailSizeForAspectRatio:[self showSpreads] showSpreads:v5];
    double v7 = v6;
    double v9 = v8;

    double v10 = v7;
    double v11 = v9;
  }
  else
  {
    if ([(BKThumbnailScrubber *)self im_isCompactWidth]) {
      double v12 = 75.0;
    }
    else {
      double v12 = 184.0;
    }
    [(BKThumbnailScrubber *)self cellAspectRatio];
    double v14 = v12 / v13;
    double v10 = ceil(v12);
    double v11 = ceil(v14);
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (int64_t)leftCalloutPageNumber
{
  int64_t v3 = [(BKThumbnailScrubber *)self pageNumber];
  int64_t v4 = v3 & 0xFFFFFFFFFFFFFFFELL | ([(BKThumbnailScrubber *)self layoutDirection] != 0);
  id v5 = [(BKThumbnailScrubber *)self pageCount];
  if (v4 < 1 || v4 > (unint64_t)v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v4;
  }
}

- (int64_t)rightCalloutPageNumber
{
  int64_t v3 = [(BKThumbnailScrubber *)self pageNumber];
  int64_t v4 = v3 & 0xFFFFFFFFFFFFFFFELL | ([(BKThumbnailScrubber *)self layoutDirection] == 0);
  id v5 = [(BKThumbnailScrubber *)self pageCount];
  if (v4 < 1 || v4 > (unint64_t)v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v4;
  }
}

- (void)_updateCalloutPageView
{
  id v111 = [(BKThumbnailScrubber *)self callout];
  int64_t v3 = [v111 pageView];
  unsigned int v4 = [(BKThumbnailScrubber *)self showSpreads];
  [(BKThumbnailScrubber *)self calloutImageSize];
  double v6 = v5;
  double v8 = v7;
  if (!v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = v3;
      -[BKPageThumbnailView setFrame:](v9, "setFrame:", 0.0, 0.0, v6, v8);
    }
    else
    {
      double v9 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", 0.0, 0.0, v6, v8);
      [v111 setPageView:v9];
    }
    v50 = [(BKThumbnailScrubber *)self delegate];
    [v50 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:v9];

    v51 = [(BKThumbnailScrubber *)self delegate];
    v52 = [v51 thumbnailScrubber:self pageTitleForPageNumber:[self pageNumber]];

    [(BKPageThumbnailView *)v9 setPageNumber:[(BKThumbnailScrubber *)self pageNumber]];
    [(BKPageThumbnailView *)v9 setPageTitle:v52];
    v53 = [(BKThumbnailScrubber *)self delegate];
    v54 = [v53 thumbnailScrubber:self thumbnailForPage:[self pageNumber] size:v9 context:v8];
    [(BKPageThumbnailView *)v9 setImage:v54];

    if (v52)
    {
      if ([v52 length])
      {
        id v55 = objc_alloc((Class)NSString);
        v56 = AEBundle();
        v57 = [v56 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
        double v35 = [v55 initWithFormat:v57, v52];

        CGRect v44 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@", v52];
      }
      else
      {
        double v35 = &stru_1DF0D8;
        CGRect v44 = &stru_1DF0D8;
      }
    }
    else if ([(BKThumbnailScrubber *)self pageNumber] == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v35 = 0;
      CGRect v44 = 0;
    }
    else
    {
      id v87 = objc_alloc((Class)NSString);
      v88 = AEBundle();
      v89 = [v88 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
      v90 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:[(BKThumbnailScrubber *)self pageNumber] usesGroupingSeparator:0];
      v91 = [v87 initWithFormat:v89, v90];

      id v92 = objc_alloc((Class)NSString);
      v93 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:[(BKThumbnailScrubber *)self pageNumber] usesGroupingSeparator:0];
      v94 = v92;
      double v35 = v91;
      CGRect v44 = (__CFString *)[v94 initWithFormat:@"%@", v93];
    }
    [v111 setLeftPageText:v35 shortenString:v44];
    [(BKPageThumbnailView *)v9 setNeedsLayout];
    goto LABEL_36;
  }
  objc_opt_class();
  v109 = v3;
  if (objc_opt_isKindOfClass())
  {
    double v9 = v3;
    -[BKPageThumbnailView setFrame:](v9, "setFrame:", 0.0, 0.0, v6 + v6, v8);
  }
  else
  {
    double v9 = -[BKSpreadThumbnailView initWithFrame:]([BKSpreadThumbnailView alloc], "initWithFrame:", 0.0, 0.0, v6 + v6, v8);
    [v111 setPageView:v9];
  }
  -[BKPageThumbnailView setPageSize:](v9, "setPageSize:", v6, v8);
  double v10 = [(BKThumbnailScrubber *)self delegate];
  double v11 = [(BKPageThumbnailView *)v9 leftPageView];
  [v10 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:v11];

  double v12 = [(BKThumbnailScrubber *)self delegate];
  double v13 = [(BKPageThumbnailView *)v9 rightPageView];
  [v12 thumbnailScrubber:self cancelPreviousRenderRequestsWithContext:v13];

  int64_t v14 = [(BKThumbnailScrubber *)self leftCalloutPageNumber];
  int64_t v15 = [(BKThumbnailScrubber *)self rightCalloutPageNumber];
  unsigned int v16 = [(BKThumbnailScrubber *)self delegate];
  uint64_t v17 = [v16 thumbnailScrubber:self pageTitleForPageNumber:v14];

  uint64_t v18 = [(BKThumbnailScrubber *)self delegate];
  uint64_t v19 = [v18 thumbnailScrubber:self pageTitleForPageNumber:v15];

  uint64_t v20 = [(BKPageThumbnailView *)v9 leftPageView];
  [v20 setPageNumber:v14];

  double v21 = [(BKPageThumbnailView *)v9 leftPageView];
  unint64_t v22 = v17;
  [v21 setPageTitle:v17];

  unint64_t v23 = [(BKThumbnailScrubber *)self delegate];
  v24 = [(BKPageThumbnailView *)v9 leftPageView];
  uint64_t v25 = [v23 thumbnailScrubber:self thumbnailForPage:v14 size:v24 context:v6];
  id v26 = [(BKPageThumbnailView *)v9 leftPageView];
  [v26 setImage:v25];

  id v27 = [(BKPageThumbnailView *)v9 leftPageView];
  [v27 setShowsPageNumber:0];

  uint64_t v28 = [(BKPageThumbnailView *)v9 rightPageView];
  [v28 setPageNumber:v15];

  id v29 = [(BKPageThumbnailView *)v9 rightPageView];
  [v29 setPageTitle:v19];

  id v30 = [(BKThumbnailScrubber *)self delegate];
  id v31 = [(BKPageThumbnailView *)v9 rightPageView];
  int64_t v108 = v15;
  double v32 = [v30 thumbnailScrubber:self thumbnailForPage:v15 size:v31 context:v6];
  double v33 = [(BKPageThumbnailView *)v9 rightPageView];
  [v33 setImage:v32];

  double v34 = [(BKPageThumbnailView *)v9 rightPageView];
  [v34 setShowsPageNumber:0];

  double v35 = (__CFString *)v19;
  v110 = (void *)v22;
  if (v22 | v19)
  {
    if ([(id)v22 length] && objc_msgSend((id)v19, "length"))
    {
      if (v14 > v15)
      {
        double v36 = (__CFString *)v22;
      }
      else
      {
        uint64_t v19 = v22;
        double v36 = v35;
      }
      double v37 = v35;
      double v38 = v36;
      id v39 = (id)v19;
      id v40 = objc_alloc((Class)NSString);
      CGRect v41 = AEBundle();
      CGRect v42 = [v41 localizedStringForKey:@"Pages %@-%@" value:&stru_1DF0D8 table:0];
      CGRect v43 = v38;
      CGRect v44 = [v40 initWithFormat:v42, v39, v38];

      id v45 = objc_alloc((Class)NSString);
      v46 = AEBundle();
      v47 = [v46 localizedStringForKey:@"%@-%@" value:&stru_1DF0D8 table:0];
      v48 = v45;
      double v35 = v37;
      v49 = [v48 initWithFormat:v47, v39, v43];
    }
    else
    {
      if (![(id)v22 length])
      {
        int64_t v3 = v109;
        if ([(id)v19 length])
        {
          id v103 = objc_alloc((Class)NSString);
          v104 = AEBundle();
          v105 = [v104 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
          v106 = v103;
          double v35 = (__CFString *)v19;
          CGRect v44 = [v106 initWithFormat:v105, v19];

          v49 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@", v19];
          id v73 = 0;
          id v69 = 0;
        }
        else
        {
          id v73 = 0;
          id v69 = 0;
          v49 = &stru_1DF0D8;
          CGRect v44 = &stru_1DF0D8;
        }
        v102 = v111;
        goto LABEL_35;
      }
      id v74 = objc_alloc((Class)NSString);
      v75 = AEBundle();
      v76 = [v75 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
      v77 = v74;
      double v35 = (__CFString *)v19;
      CGRect v44 = [v77 initWithFormat:v76, v22];

      v49 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@", v22];
    }
LABEL_33:
    id v73 = 0;
    id v69 = 0;
    goto LABEL_34;
  }
  int64_t v58 = v14;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL || v108 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v108 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v49 = 0;
        id v73 = 0;
        id v69 = 0;
        CGRect v44 = 0;
        goto LABEL_34;
      }
      v95 = (__CFString *)v19;
      id v96 = objc_alloc((Class)NSString);
      v97 = AEBundle();
      v98 = [v97 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
      v99 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v108 usesGroupingSeparator:0];
      CGRect v44 = [(__CFString *)[v96 initWithFormat:v98, v99];

      id v100 = objc_alloc((Class)NSString);
      v84 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v108 usesGroupingSeparator:0];
      v101 = v100;
      double v35 = v95;
      v86 = (__CFString *)[v101 initWithFormat:@"%@", v84];
    }
    else
    {
      v78 = (__CFString *)v19;
      id v79 = objc_alloc((Class)NSString);
      v80 = AEBundle();
      v81 = [v80 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
      v82 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v14 usesGroupingSeparator:0];
      CGRect v44 = [(__CFString *)v79 initWithFormat:v81, v82];

      id v83 = objc_alloc((Class)NSString);
      v84 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v58 usesGroupingSeparator:0];
      v85 = v83;
      double v35 = v78;
      v86 = (__CFString *)[v85 initWithFormat:@"%@", v84];
    }
    v49 = v86;

    goto LABEL_33;
  }
  v107 = (__CFString *)v19;
  id v59 = objc_alloc((Class)NSString);
  v60 = AEBundle();
  v61 = [v60 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
  v62 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v14 usesGroupingSeparator:0];
  CGRect v44 = [v59 initWithFormat:v61, v62];

  id v63 = objc_alloc((Class)NSString);
  v64 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v14 usesGroupingSeparator:0];
  v49 = (__CFString *)[v63 initWithFormat:@"%@", v64];

  id v65 = objc_alloc((Class)NSString);
  v66 = AEBundle();
  v67 = [v66 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
  v68 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v108 usesGroupingSeparator:0];
  id v69 = [v65 initWithFormat:v67, v68];

  id v70 = objc_alloc((Class)NSString);
  v71 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v108 usesGroupingSeparator:0];
  v72 = v70;
  double v35 = v107;
  id v73 = [v72 initWithFormat:@"%@", v71];

LABEL_34:
  v102 = v111;
  int64_t v3 = v109;
LABEL_35:
  [v102 setLeftPageText:v44 shortenString:v49];
  [v111 setRightPageText:v69 shortenString:v73];
  [(BKPageThumbnailView *)v9 setHidesSpine:[(BKThumbnailScrubber *)self hidesSpine]];
  [(BKPageThumbnailView *)v9 setNeedsLayout];

  v52 = v110;
LABEL_36:
}

- (double)valueForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(BKThumbnailScrubber *)self track];
  if ([(BKThumbnailScrubber *)self orientation])
  {
    if ([(BKThumbnailScrubber *)self orientation] == 1)
    {
      [v6 frame];
      double v7 = y / CGRectGetHeight(v13);
    }
    else
    {
      double v7 = NAN;
    }
  }
  else
  {
    [v6 frame];
    double v8 = x / CGRectGetWidth(v14);
    if (v8 > 1.0) {
      double v8 = 1.0;
    }
    double v9 = fmax(v8, 0.0);
    double v10 = (char *)[(BKThumbnailScrubber *)self layoutDirection];
    double v7 = 1.0 - v9;
    if (v10 != (unsigned char *)&dword_0 + 1) {
      double v7 = v9;
    }
  }
  if (v7 > 1.0) {
    double v7 = 1.0;
  }
  double v11 = fmax(v7, 0.0);

  return v11;
}

- (CGPoint)pointForValue:(double)a3
{
  unsigned int v4 = [(BKThumbnailScrubber *)self track];
  [v4 frame];
  CGFloat v5 = CGRectGetWidth(v10) * a3;
  [v4 frame];
  CGFloat v6 = CGRectGetHeight(v11) * a3;

  double v7 = v5;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (int64_t)pageNumberForValue:(double)a3
{
  id v5 = [(BKThumbnailScrubber *)self pageCount];
  double v6 = a3 * (double)(unint64_t)[(BKThumbnailScrubber *)self pageCount] + 1.0;
  if (v6 > (double)(unint64_t)v5) {
    double v6 = (double)(unint64_t)v5;
  }
  return (uint64_t)fmax(v6, 1.0);
}

- (CGPoint)accessibilityActivationPoint
{
  int64_t v3 = [(BKThumbnailScrubber *)self track];
  unsigned int v4 = [v3 cellAtIndex:[self pageNumber] - 1];
  id v5 = [v4 superview];
  [v4 center];
  [v5 convertPoint:0 toView:];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (void)_bkAccessibilityValueDidChange
{
}

- (void)_bkAccessibilityAnnounceValue
{
  id argument = [(BKThumbnailScrubber *)self accessibilityValue];
  int64_t v3 = [(BKThumbnailScrubber *)self bkAccessibilityAnnouncementString];
  unsigned __int8 v4 = [argument isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    [(BKThumbnailScrubber *)self setBkAccessibilityAnnouncementString:argument];
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, argument);
  }
}

- (void)accessibilityIncrement
{
  if ([(BKThumbnailScrubber *)self layoutDirection] == (char *)&dword_0 + 1)
  {
    double v7 = self;
    int64_t v3 = &selRef_accessibilityDecrement;
    unsigned __int8 v4 = &v7;
  }
  else
  {
    double v6 = self;
    int64_t v3 = &selRef_accessibilityIncrement;
    unsigned __int8 v4 = &v6;
  }
  v4[1] = (BKThumbnailScrubber *)BKThumbnailScrubber;
  [v4 super:v3 selector:v6];
  id v5 = [(BKThumbnailScrubber *)self callout];
  [v5 setAlpha:0.0];
}

- (void)accessibilityDecrement
{
  if ([(BKThumbnailScrubber *)self layoutDirection] == (char *)&dword_0 + 1)
  {
    double v7 = self;
    int64_t v3 = &selRef_accessibilityIncrement;
    unsigned __int8 v4 = &v7;
  }
  else
  {
    double v6 = self;
    int64_t v3 = &selRef_accessibilityDecrement;
    unsigned __int8 v4 = &v6;
  }
  v4[1] = (BKThumbnailScrubber *)BKThumbnailScrubber;
  [super v3:v6];
  id v5 = [(BKThumbnailScrubber *)self callout];
  [v5 setAlpha:0.0];
}

- (void)accessibilityElementDidLoseFocus
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailScrubber;
  [(BKThumbnailScrubber *)&v4 accessibilityElementDidLoseFocus];
  int64_t v3 = [(BKThumbnailScrubber *)self callout];
  [v3 setAlpha:0.0];
}

- (BKScrubberCalloutView)callout
{
  return self->_callout;
}

- (BKThumbnailScrubberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return (BKThumbnailScrubberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)showSpreads
{
  return self->_showSpreads;
}

- (double)cellAspectRatio
{
  return self->_cellAspectRatio;
}

- (BOOL)hideThumbView
{
  return self->_hideThumbView;
}

- (BOOL)hidesSpine
{
  return self->_hidesSpine;
}

- (void)setHidesSpine:(BOOL)a3
{
  self->_hidesSpine = a3;
}

- (CGPoint)gravitationalPoint
{
  double x = self->_gravitationalPoint.x;
  double y = self->_gravitationalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGravitationalPoint:(CGPoint)a3
{
  self->_gravitationalPoint = a3;
}

- (NSString)bkAccessibilityAnnouncementString
{
  return self->_bkAccessibilityAnnouncementString;
}

- (void)setBkAccessibilityAnnouncementString:(id)a3
{
}

- (BOOL)isWithinGravitationalPointReach
{
  return self->_isWithinGravitationalPointReach;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bkAccessibilityAnnouncementString, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_callout, 0);

  objc_storeStrong((id *)&self->_imageThumb, 0);
}

@end