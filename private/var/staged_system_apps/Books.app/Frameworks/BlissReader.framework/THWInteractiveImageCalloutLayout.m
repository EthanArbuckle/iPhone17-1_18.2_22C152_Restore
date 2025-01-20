@interface THWInteractiveImageCalloutLayout
- (BOOL)hasDescription;
- (BOOL)hasTitle;
- (BOOL)highlighted;
- (BOOL)selected;
- (BOOL)titleOnly;
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (CGRect)backgroundRect;
- (CGRect)backgroundRectTitleOnly;
- (CGRect)groupFrameWithViewScale:(double)a3;
- (Class)repClassOverride;
- (THWInteractiveImageCalloutInfo)calloutInfo;
- (THWInteractiveImageCalloutLayout)initWithInfo:(id)a3;
- (THWInteractiveImageCalloutLayoutDelegate)delegate;
- (THWInteractiveImageCalloutStyleProvider)styleProvider;
- (THWStackedControlContainer)stackedControlContainer;
- (UIEdgeInsets)p_scaledInsets;
- (double)marginInset;
- (double)p_scaledWidth;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)sccLayout;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (id)stackedControlContainerHeightLastChild:(id)a3;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (void)dealloc;
- (void)invalidateTitleStyle;
- (void)p_invalidateTitleIfNeeded;
- (void)setCalloutInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMarginInset:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStackedControlContainer:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitleOnly:(BOOL)a3;
@end

@implementation THWInteractiveImageCalloutLayout

- (THWInteractiveImageCalloutLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageCalloutLayout;
  v3 = [(THWInteractiveImageCalloutLayout *)&v5 initWithInfo:a3];
  if (v3) {
    v3->_stackedControlContainer = [[THWStackedControlContainer alloc] initWithDelegate:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)childInfosForLayout
{
  stackedControlContainer = self->_stackedControlContainer;
  return +[NSArray arrayWithObjects:&stackedControlContainer count:1];
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  v4 = self;
  return +[NSArray arrayWithObjects:&v4 count:1];
}

- (id)sccLayout
{
  objc_opt_class();
  [self children].firstObject;

  return (id)TSUDynamicCast();
}

- (id)computeLayoutGeometry
{
  id v3 = [(THWInteractiveImageCalloutLayout *)self sccLayout];
  [(THWInteractiveImageCalloutLayout *)self p_scaledInsets];
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"), v3), "geometry"), "size");
  [(THWInteractiveImageCalloutLayout *)self p_scaledWidth];
  v4 = [(THWInteractiveImageCalloutLayout *)self delegate];
  [(THWInteractiveImageCalloutInfo *)self->_calloutInfo placardFixedPoint];
  -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCallout:convertContentPointToUnscaledOverlayPoint:](v4, "interactiveImageCallout:convertContentPointToUnscaledOverlayPoint:", self);
  TSDRectWithCenterAndSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  TSDRectWithSize();
  self->_backgroundRectTitleOnly.origin.x = v13;
  self->_backgroundRectTitleOnly.origin.y = v14;
  self->_backgroundRectTitleOnly.size.width = v15;
  self->_backgroundRectTitleOnly.size.height = v16;
  if (self->_selected)
  {
    objc_msgSend(objc_msgSend(v3, "geometry"), "size");
    double v12 = v17;
    TSDRectWithSize();
  }
  self->_backgroundRect.origin.x = v13;
  self->_backgroundRect.origin.y = v14;
  self->_backgroundRect.size.width = v15;
  self->_backgroundRect.size.height = v16;
  id v18 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v6, v8, v10, v12];

  return v18;
}

- (BOOL)hasTitle
{
  return [(TSWPStorage *)[(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage] length] != 0;
}

- (BOOL)hasDescription
{
  return [(TSWPStorage *)[(THWInteractiveImageCalloutInfo *)self->_calloutInfo descriptionStorage] length] != 0;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    if (!self->_titleOnly)
    {
      [(THWInteractiveImageCalloutLayout *)self invalidateSize];
      [THWInteractiveImageCalloutLayout sccLayout][self sccLayout] invalidateSize;
    }
    objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutLayout layoutController](self, "layoutController"), "canvas"), "invalidateLayers");
    [(THWInteractiveImageCalloutLayout *)self p_invalidateTitleIfNeeded];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutLayout layoutController](self, "layoutController"), "canvas"), "invalidateLayers");
    [(THWInteractiveImageCalloutLayout *)self p_invalidateTitleIfNeeded];
  }
}

- (void)setTitleOnly:(BOOL)a3
{
  if (self->_titleOnly != a3)
  {
    self->_titleOnly = a3;
    [(THWInteractiveImageCalloutLayout *)self invalidateSize];
    [THWInteractiveImageCalloutLayout sccLayout][self sccLayout] invalidateSize;
    [sccLayout invalidateChildren];
    [(THWInteractiveImageCalloutLayout *)self invalidateTitleStyle];
  }
}

- (void)p_invalidateTitleIfNeeded
{
  if (self->_titleOnly) {
    [(THWInteractiveImageCalloutLayout *)self invalidateTitleStyle];
  }
}

- (void)invalidateTitleStyle
{
  id v3 = [(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage];
  id v4 = [(TSWPStorage *)[(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage] length];

  -[TSWPStorage styleDidChangeInRange:](v3, "styleDidChangeInRange:", 0, v4);
}

- (CGRect)groupFrameWithViewScale:(double)a3
{
  id v4 = [(THWInteractiveImageCalloutLayout *)self calloutInfo];
  [(-[THWInteractiveImageCalloutInfo groupShape](-[THWInteractiveImageCalloutLayout calloutInfo](self, "calloutInfo"), "groupShape"), "geometry") boundsBeforeRotation];
  [(THWInteractiveImageCalloutInfo *)v4 placardFixedPoint];
  TSDMultiplyPointScalar();

  TSDRectWithCenterAndSize();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  unsigned int v4 = [(THWInteractiveImageCalloutLayout *)self hasTitle];
  unsigned int v5 = [(THWInteractiveImageCalloutLayout *)self hasDescription];
  if (self->_titleOnly)
  {
    if (v4)
    {
      double v11 = [(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage];
      double v6 = &v11;
LABEL_8:
      uint64_t v7 = 1;
      return +[NSArray arrayWithObjects:v6 count:v7];
    }
  }
  else
  {
    if ((v4 & v5) == 1)
    {
      v10[0] = [(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage];
      v10[1] = [(THWInteractiveImageCalloutInfo *)self->_calloutInfo descriptionStorage];
      double v6 = (TSWPStorage **)v10;
      uint64_t v7 = 2;
      return +[NSArray arrayWithObjects:v6 count:v7];
    }
    if (v4)
    {
      double v9 = [(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage];
      double v6 = &v9;
      goto LABEL_8;
    }
  }
  return 0;
}

- (id)stackedControlContainerHeightLastChild:(id)a3
{
  if (self->_selected) {
    return 0;
  }
  id v4 = [a3 children];

  return [v4 firstObject];
}

- (double)p_scaledWidth
{
  [(-[THWInteractiveImageCalloutInfo groupShape](self->_calloutInfo, "groupShape"), "geometry") size];
  [(THWInteractiveImageCalloutLayoutDelegate *)self->_delegate interactiveImageCalloutFontScale:self];
  TSURound();
  return fmax(v3, 1.0);
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)p_scaledInsets
{
  [(THWInteractiveImageCalloutInfo *)self->_calloutInfo contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(THWInteractiveImageCalloutLayoutDelegate *)self->_delegate interactiveImageCalloutFontScale:self];
  if (v11 != 1.0)
  {
    TSURound();
    double v4 = v12;
    TSURound();
    double v8 = v13;
    TSURound();
    double v6 = v14;
    TSURound();
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  [(THWInteractiveImageCalloutInfo *)self->_calloutInfo verticalSpacing];
  [(THWInteractiveImageCalloutLayoutDelegate *)self->_delegate interactiveImageCalloutFontScale:self];

  TSURound();
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4
{
  objc_msgSend(objc_msgSend(a3, "children"), "firstObject");
  [(THWInteractiveImageCalloutLayoutDelegate *)self->_delegate interactiveImageCalloutFontScale:self];

  TSURound();
  return result;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  if (!self->_titleOnly) {
    return 0;
  }
  double v5 = [a4 info];
  if (v5 != [(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage]) {
    return 0;
  }
  if (!self->_styleProvider) {
    self->_styleProvider = [[THWInteractiveImageCalloutStyleProvider alloc] initWithStorage:[(THWInteractiveImageCalloutInfo *)self->_calloutInfo titleStorage]];
  }
  [(THWInteractiveImageCalloutLayoutDelegate *)[(THWInteractiveImageCalloutLayout *)self delegate] interactiveImageCalloutFontScale:self];
  -[THWInteractiveImageCalloutStyleProvider setFontScale:](self->_styleProvider, "setFontScale:");
  BOOL v7 = self->_selected || self->_highlighted;
  [(THWInteractiveImageCalloutStyleProvider *)self->_styleProvider setSelected:v7];
  return self->_styleProvider;
}

- (THWInteractiveImageCalloutInfo)calloutInfo
{
  return self->_calloutInfo;
}

- (void)setCalloutInfo:(id)a3
{
}

- (BOOL)titleOnly
{
  return self->_titleOnly;
}

- (THWInteractiveImageCalloutLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWInteractiveImageCalloutLayoutDelegate *)a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (CGRect)backgroundRect
{
  double x = self->_backgroundRect.origin.x;
  double y = self->_backgroundRect.origin.y;
  double width = self->_backgroundRect.size.width;
  double height = self->_backgroundRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)backgroundRectTitleOnly
{
  double x = self->_backgroundRectTitleOnly.origin.x;
  double y = self->_backgroundRectTitleOnly.origin.y;
  double width = self->_backgroundRectTitleOnly.size.width;
  double height = self->_backgroundRectTitleOnly.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (THWStackedControlContainer)stackedControlContainer
{
  return self->_stackedControlContainer;
}

- (void)setStackedControlContainer:(id)a3
{
}

- (double)marginInset
{
  return self->_marginInset;
}

- (void)setMarginInset:(double)a3
{
  self->_marginInset = a3;
}

- (THWInteractiveImageCalloutStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

@end