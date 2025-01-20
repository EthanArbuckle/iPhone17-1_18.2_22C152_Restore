@interface THWAnchoredWidgetLayout
- (BOOL)stackedControlContainer:(id)a3 allowsLastLineTruncationForLayout:(id)a4;
- (BOOL)stackedControlContainer:(id)a3 isHeightFlexibleForLayout:(id)a4;
- (BOOL)widgetLayoutIsCompactFlow:(id)a3;
- (BOOL)widgetLayoutIsReflowablePresentation:(id)a3;
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (CGRect)widgetLayoutBounds;
- (CGSize)_containerSize;
- (CGSize)_containerSizeClampWidth:(BOOL)a3;
- (THWAnchoredWidgetLayout)initWithInfo:(id)a3;
- (THWStackedControlContainer)stackInfo;
- (THWWidgetLayout)widgetLayout;
- (THWWidgetStackHosting)stackHost;
- (THWWidgetStackLayout)widgetStackLayout;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (UIEdgeInsets)widgetInsets;
- (double)_adjustedContentPadding;
- (double)stackedControlContainer:(id)a3 heightForFlexibleLayout:(id)a4 withTotalFixedHeight:(double)a5;
- (double)stackedControlContainer:(id)a3 minHeightForChildLayout:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (double)widgetStackWidth;
- (id)_stackLayout;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childrenForLayout;
- (id)computeLayoutGeometry;
- (id)controlContainerChildrenForLayout:(id)a3;
- (id)dependentLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForStorage:(id)a4;
- (int)widgetLayoutMode:(id)a3;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (unsigned)stackedControlContainer:(id)a3 maxLineCountForLayout:(id)a4;
- (void)_computeInsets;
- (void)dealloc;
- (void)setStackHost:(id)a3;
- (void)setStackInfo:(id)a3;
- (void)setWidgetInsets:(UIEdgeInsets)a3;
- (void)setWidgetLayout:(id)a3;
- (void)setWidgetStackLayout:(id)a3;
- (void)updateChildrenFromInfo;
- (void)wasAddedToLayoutController:(id)a3;
- (void)widgetStackInvalidateChildren;
- (void)willBeRemovedFromLayoutController:(id)a3;
@end

@implementation THWAnchoredWidgetLayout

- (THWAnchoredWidgetLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWAnchoredWidgetLayout;
  v3 = [(THWAnchoredWidgetLayout *)&v5 initWithInfo:a3];
  if (v3) {
    v3->_stackInfo = [[THWStackedControlContainer alloc] initWithDelegate:v3];
  }
  return v3;
}

- (void)dealloc
{
  [(THWWidgetLayout *)self->_widgetLayout setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)THWAnchoredWidgetLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (double)_adjustedContentPadding
{
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "contentPadding");
  return fmin(v2, 10.0);
}

- (void)_computeInsets
{
  [(THWAnchoredWidgetLayout *)self _adjustedContentPadding];
  double v4 = v3;
  unsigned int v5 = [[self layoutController] isCompactHeight];
  [(THWAnchoredWidgetLayout *)self parent];
  v6 = (char *)[TSUProtocolCast() columnMetricsForCharIndex:0 outRange:0].columnCount;
  BOOL v7 = v6 == (unsigned char *)&dword_0 + 1;
  unsigned int v8 = v6 != (unsigned char *)&dword_0 + 1;
  if (v7 && (v5 & 1) == 0) {
    unsigned int v8 = [[self layoutController] isCompactWidth];
  }
  double v9 = 75.0;
  if (!v5) {
    double v9 = 30.0;
  }
  if (v8) {
    double v9 = 10.0;
  }
  CGFloat v10 = v4 + v9;
  self->_widgetInsets.top = v4;
  self->_widgetInsets.left = v10;
  self->_widgetInsets.bottom = v4;
  self->_widgetInsets.right = v10;
}

- (void)wasAddedToLayoutController:(id)a3
{
  -[THWAnchoredWidgetLayout setStackHost:](self, "setStackHost:", [a3 ancestorLayoutOfLayout:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWWidgetStackHosting]);

  [(THWAnchoredWidgetLayout *)self _computeInsets];
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
}

- (id)childrenForLayout
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "background");
  if (v3)
  {
    stackInfo = self->_stackInfo;
    id v9 = v3;
    CGFloat v10 = stackInfo;
    unsigned int v5 = (THWStackedControlContainer **)&v9;
    uint64_t v6 = 2;
  }
  else
  {
    unsigned int v8 = self->_stackInfo;
    unsigned int v5 = &v8;
    uint64_t v6 = 1;
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v6, v8, v9, v10);
}

- (void)updateChildrenFromInfo
{
  v4.receiver = self;
  v4.super_class = (Class)THWAnchoredWidgetLayout;
  [(THWContainerLayout *)&v4 updateChildrenFromInfo];
  [layoutController layoutForInfo:[info widgetInfo] childOfLayout:[_stackLayout]];
  id v3 = (void *)TSUProtocolCast();
  [v3 setDelegate:self];
  [(THWAnchoredWidgetLayout *)self setWidgetLayout:v3];
  [(THWAnchoredWidgetLayout *)self setWidgetStackLayout:TSUProtocolCast()];
}

- (void)setWidgetStackLayout:(id)a3
{
  widgetStackLayout = self->_widgetStackLayout;
  if (widgetStackLayout != a3)
  {

    self->_widgetStackLayout = (THWWidgetStackLayout *)a3;
    id v6 = [(THWAnchoredWidgetLayout *)self _stackLayout];
    [v6 invalidateChildren];
  }
}

- (id)computeLayoutGeometry
{
  objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"), "geometry"), "size");
  [(THWAnchoredWidgetLayout *)self _containerSizeClampWidth:0];
  id v3 = objc_alloc((Class)TSDLayoutGeometry);
  TSDRectWithSize();
  id v4 = [v3 initWithFrame:];

  return v4;
}

- (id)_stackLayout
{
  objc_opt_class();
  [self->_layoutController layoutForInfo:self->_stackInfo childOfLayout:self];

  return (id)TSUDynamicCast();
}

- (CGSize)_containerSize
{
  [(THWAnchoredWidgetLayout *)self _containerSizeClampWidth:1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_containerSizeClampWidth:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  [(THWAnchoredWidgetLayout *)self parent];
  unsigned int v5 = (void *)TSUDynamicCast();
  if (v5)
  {
    [v5 maximumFrameSizeForChild:self];
    double v7 = v6;
    double v9 = v8;
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v9 = 400.0;
  double v7 = 300.0;
  if (v3)
  {
LABEL_3:
    objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "geometry"), "size");
    double v7 = fmin(v7, fmax(v10, 100.0) + self->_widgetInsets.left + self->_widgetInsets.right);
  }
LABEL_4:
  stackHost = self->_stackHost;
  if (stackHost)
  {
    -[THWWidgetStackHosting widgetStackMaxContainerSizeForSize:](stackHost, "widgetStackMaxContainerSizeForSize:", v7, v9);
    double v7 = v12;
    double v9 = v13;
  }
  double v14 = v7;
  double v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  if ([(THWAnchoredWidgetLayout *)self _stackLayout] != a3) {
    return 0;
  }
  unsigned int v5 = self;
  return +[NSArray arrayWithObjects:&v5 count:1];
}

- (id)dependentLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)THWAnchoredWidgetLayout;
  id v3 = [[-[THWAnchoredWidgetLayout dependentLayouts](&v7, "dependentLayouts") mutableCopy]];
  if (!v3) {
    id v3 = +[NSMutableArray array];
  }
  id v4 = [[[[[self info] widgetInfo] adornmentInfo] background];
  if (v4)
  {
    id v5 = [[-[THWAnchoredWidgetLayout layoutController](self, "layoutController")] layoutForInfo:v4 childOfLayout:self];
    if (v5) {
      [v3 addObject:v5];
    }
  }
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v4 = [a3 info];
  if (v4 != objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "background"))return 0; {
  objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"), "geometry"), "frame");
  }
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(THWAnchoredWidgetLayout *)self _adjustedContentPadding];
  CGFloat v15 = self->_widgetInsets.left - v14;
  id v16 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v7 + v15, v9 + 0.0, v11 - (v15 + self->_widgetInsets.right - v14), v13];

  return v16;
}

- (double)widgetStackWidth
{
  [(THWAnchoredWidgetLayout *)self _containerSize];
  return v3 - self->_widgetInsets.left - self->_widgetInsets.right;
}

- (void)widgetStackInvalidateChildren
{
  id v2 = [(THWAnchoredWidgetLayout *)self _stackLayout];

  [v2 invalidateChildren];
}

- (id)controlContainerChildrenForLayout:(id)a3
{
  id v4 = +[NSMutableArray array];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(THWWidgetStackLayout *)self->_widgetStackLayout widgetStackTitleChildren:self];
  }
  else
  {
    id v5 = [[[self info] widgetInfo] adornmentInfo] topPanelInfos];
    if (![v5 count]) {
      goto LABEL_5;
    }
  }
  [v4 addObjectsFromArray:v5];
LABEL_5:
  if (objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo")) {
    [v4 addObject:[-[THWAnchoredWidgetLayout info](self, "info") widgetInfo]];
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(THWWidgetStackLayout *)self->_widgetStackLayout widgetStackCaptionChildren:self];
LABEL_10:
    [v4 addObjectsFromArray:v6];
    return v4;
  }
  id v6 = [[[self info] widgetInfo] adornmentInfo] bottomPanelInfos;
  if ([v6 count]) {
    goto LABEL_10;
  }
  return v4;
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  [(THWAnchoredWidgetLayout *)self _containerSizeClampWidth:0];
  [(THWAnchoredWidgetLayout *)self _containerSizeClampWidth:1];
  TSURound();
  double v5 = 0.0;
  result.y = v5;
  result.x = v4;
  return result;
}

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  double top = self->_widgetInsets.top;
  double left = self->_widgetInsets.left;
  double bottom = self->_widgetInsets.bottom;
  double right = self->_widgetInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  unsigned int v4 = [self layoutController:a3, a4].isCompactHeight;
  double result = 10.0;
  if (v4) {
    return 5.0;
  }
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
  return 0.0;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  widgetStackLayout = self->_widgetStackLayout;

  return [(THWWidgetStackLayout *)widgetStackLayout widgetStack:self layoutGeometryForLayout:a4];
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 2;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  double v5 = -[THWAnchoredWidgetWPStyleProvider initWithStorage:]([THWAnchoredWidgetWPStyleProvider alloc], "initWithStorage:", [a4 info]);
  -[THWAnchoredWidgetWPStyleProvider setFilterDelegate:[self layoutController] ancestorLayoutOfLayout:orDelegateConformingToProtocol:self &OBJC_PROTOCOL___THWPCoreTextPropertiesFilterDelegate]];
  return v5;
}

- (id)stackedControlContainer:(id)a3 styleProviderForStorage:(id)a4
{
  double v5 = [[THWAnchoredWidgetWPStyleProvider alloc] initWithStorage:a4];
  -[THWAnchoredWidgetWPStyleProvider setFilterDelegate:[self layoutController] ancestorLayoutOfLayout:orDelegateConformingToProtocol:self &OBJC_PROTOCOL___THWPCoreTextPropertiesFilterDelegate]];
  return v5;
}

- (BOOL)stackedControlContainer:(id)a3 isHeightFlexibleForLayout:(id)a4
{
  id v5 = [a4 info:a3];
  return v5 == [self info].widgetInfo;
}

- (double)stackedControlContainer:(id)a3 heightForFlexibleLayout:(id)a4 withTotalFixedHeight:(double)a5
{
  [(THWAnchoredWidgetLayout *)self _containerSize];
  TSDRectWithSize();
  double v8 = v7;
  double left = self->_widgetInsets.left;
  double right = self->_widgetInsets.right;
  double v12 = v11 - (self->_widgetInsets.top + self->_widgetInsets.bottom) - a5;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return fmax(v12, 100.0);
  }
  widgetStackLayout = self->_widgetStackLayout;

  -[THWWidgetStackLayout widgetStack:idealHeightForMaxSize:](widgetStackLayout, "widgetStack:idealHeightForMaxSize:", self, v8 - (left + right), v12);
  return result;
}

- (BOOL)stackedControlContainer:(id)a3 allowsLastLineTruncationForLayout:(id)a4
{
  return 1;
}

- (unsigned)stackedControlContainer:(id)a3 maxLineCountForLayout:(id)a4
{
  uint64_t v6 = 1;
  if ((objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController", a3), "isCompactWidth") & 1) == 0)
  {
    if ([self layoutController].isCompactHeight)uint64_t v6 = 1; {
    else
    }
      uint64_t v6 = 2;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v6;
  }
  widgetStackLayout = self->_widgetStackLayout;

  return [(THWWidgetStackLayout *)widgetStackLayout widgetStack:self maxLinesForWPLayout:a4 withDefault:v6];
}

- (double)stackedControlContainer:(id)a3 minHeightForChildLayout:(id)a4
{
  [a4 frame];
  double v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v8;
  }
  widgetStackLayout = self->_widgetStackLayout;

  [(THWWidgetStackLayout *)widgetStackLayout widgetStack:self stackedControlContainer:a3 minHeightForLayout:a4];
  return result;
}

- (int)widgetLayoutMode:(id)a3
{
  return 3;
}

- (BOOL)widgetLayoutIsCompactFlow:(id)a3
{
  return 1;
}

- (BOOL)widgetLayoutIsReflowablePresentation:(id)a3
{
  return 0;
}

- (CGRect)widgetLayoutBounds
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (THWWidgetLayout)widgetLayout
{
  return self->_widgetLayout;
}

- (void)setWidgetLayout:(id)a3
{
}

- (THWStackedControlContainer)stackInfo
{
  return self->_stackInfo;
}

- (void)setStackInfo:(id)a3
{
}

- (THWWidgetStackLayout)widgetStackLayout
{
  return self->_widgetStackLayout;
}

- (UIEdgeInsets)widgetInsets
{
  double top = self->_widgetInsets.top;
  double left = self->_widgetInsets.left;
  double bottom = self->_widgetInsets.bottom;
  double right = self->_widgetInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setWidgetInsets:(UIEdgeInsets)a3
{
  self->_widgetInsets = a3;
}

- (THWWidgetStackHosting)stackHost
{
  return self->_stackHost;
}

- (void)setStackHost:(id)a3
{
  self->_stackHost = (THWWidgetStackHosting *)a3;
}

@end