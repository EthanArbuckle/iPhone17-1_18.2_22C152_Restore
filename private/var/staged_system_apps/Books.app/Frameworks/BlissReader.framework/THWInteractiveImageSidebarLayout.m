@interface THWInteractiveImageSidebarLayout
- (BOOL)hidden;
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (Class)repClassOverride;
- (THWInteractiveImageCalloutInfo)currentCallout;
- (THWInteractiveImageCalloutInfo)previousCallout;
- (THWInteractiveImageSidebarLayout)initWithDelegate:(id)a3;
- (THWInteractiveImageSidebarLayoutDelegate)delegate;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (double)stackedControlContainerWidth:(id)a3;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)layoutForCallout:(id)a3;
- (id)p_stackForCallout:(id)a3;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (void)clearPreviousCallout;
- (void)dealloc;
- (void)p_updateContainerMap:(id)a3 forCallout:(id)a4;
- (void)p_updateContainers;
- (void)setCurrentCallout:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setPreviousCallout:(id)a3;
- (void)updateCallout:(id)a3;
@end

@implementation THWInteractiveImageSidebarLayout

- (THWInteractiveImageSidebarLayout)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWInteractiveImageSidebarLayout;
  v4 = [(THWInteractiveImageSidebarLayout *)&v7 initWithInfo:0];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (THWInteractiveImageSidebarLayoutDelegate *)a3;
    v4->_calloutToStackedControlContainerMap = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageSidebarLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  v4 = self;
  return +[NSArray arrayWithObjects:&v4 count:1];
}

- (id)computeLayoutGeometry
{
  delegate = self->_delegate;
  if (!delegate)
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    goto LABEL_15;
  }
  unsigned __int8 v4 = [(THWInteractiveImageSidebarLayoutDelegate *)delegate interactiveImageSidebarIsExpanded:self];
  [(THWInteractiveImageSidebarLayoutDelegate *)self->_delegate interactiveImageSidebarSize:self];
  TSDRectWithSize();
  double x = v6;
  double y = v8;
  double width = v5;
  double height = v11;
  if (!self->_currentCallout)
  {
    if (v4)
    {
      if (!self->_previousCallout) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!self->_hidden)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((v4 & 1) == 0)
  {
LABEL_10:
    double x = -v5;
    goto LABEL_15;
  }
LABEL_12:
  id v13 = -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
  if (v13)
  {
    id v14 = [[-[THWInteractiveImageSidebarLayout layoutController](self, "layoutController")] layoutForInfo:v13 childOfLayout:self];
    if (v14)
    {
      objc_msgSend(objc_msgSend(v14, "geometry"), "size");
      double height = v15;
      double x = 17.0;
      double y = 94.0;
    }
  }
LABEL_15:
  id v16 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:x, y, width, height];

  return v16;
}

- (void)setCurrentCallout:(id)a3
{
  currentCallout = self->_currentCallout;
  if (currentCallout != a3)
  {

    self->_currentCallout = (THWInteractiveImageCalloutInfo *)a3;
    [(THWInteractiveImageSidebarLayout *)self invalidateChildren];
  }
}

- (void)setPreviousCallout:(id)a3
{
  previousCallout = self->_previousCallout;
  if (previousCallout != a3)
  {

    self->_previousCallout = (THWInteractiveImageCalloutInfo *)a3;
    [(THWInteractiveImageSidebarLayout *)self invalidateChildren];
  }
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    [(THWInteractiveImageSidebarLayout *)self invalidateFrame];
  }
}

- (void)p_updateContainerMap:(id)a3 forCallout:(id)a4
{
  if (a4)
  {
    objc_super v7 = (THWStackedControlContainer *)[(TSURetainedPointerKeyDictionary *)self->_calloutToStackedControlContainerMap objectForKeyedSubscript:a4];
    if (v7
      || (objc_super v7 = [[THWStackedControlContainer alloc] initWithDelegate:self], [(THWControlContainer *)v7 setInstanceData:a4], v7))
    {
      [a3 setObject:v7 forUncopiedKey:a4];
    }
  }
}

- (void)p_updateContainers
{
  objc_super v3 = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
  [(THWInteractiveImageSidebarLayout *)self p_updateContainerMap:v3 forCallout:self->_currentCallout];
  [(THWInteractiveImageSidebarLayout *)self p_updateContainerMap:v3 forCallout:self->_previousCallout];

  self->_calloutToStackedControlContainerMap = v3;
}

- (id)childInfosForLayout
{
  [(THWInteractiveImageSidebarLayout *)self p_updateContainers];
  if (self->_currentCallout)
  {
    id v3 = -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
    id v4 = v3;
    if (!self->_previousCallout)
    {
      if (!v3) {
        return 0;
      }
LABEL_13:
      id v10 = v4;
      objc_super v7 = &v10;
LABEL_14:
      uint64_t v8 = 1;
      return +[NSArray arrayWithObjects:v7 count:v8];
    }
  }
  else
  {
    if (!self->_previousCallout) {
      return 0;
    }
    id v4 = 0;
  }
  id result = -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
  if (v4) {
    BOOL v6 = result == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v11[0] = v4;
    v11[1] = result;
    objc_super v7 = (id *)v11;
    uint64_t v8 = 2;
    return +[NSArray arrayWithObjects:v7 count:v8];
  }
  if (v4) {
    goto LABEL_13;
  }
  if (result)
  {
    id v9 = result;
    objc_super v7 = &v9;
    goto LABEL_14;
  }
  return result;
}

- (void)updateCallout:(id)a3
{
  if (self->_currentCallout != a3)
  {
    [(THWInteractiveImageSidebarLayout *)self invalidateFrame];
    [(THWInteractiveImageSidebarLayout *)self setPreviousCallout:self->_currentCallout];
    [(THWInteractiveImageSidebarLayout *)self setCurrentCallout:a3];
  }
}

- (void)clearPreviousCallout
{
}

- (id)p_stackForCallout:(id)a3
{
  if (a3) {
    return -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
  }
  else {
    return 0;
  }
}

- (id)layoutForCallout:(id)a3
{
  id result = [(THWInteractiveImageSidebarLayout *)self p_stackForCallout:a3];
  if (result)
  {
    id v5 = result;
    id v6 = [(THWInteractiveImageSidebarLayout *)self layoutController];
    return [v6 layoutForInfo:v5 childOfLayout:self];
  }
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "info"), "instanceData");
  id v4 = [v3 titleStorage];
  id v5 = [v3 descriptionStorage];
  id v6 = [v4 length];
  id result = [v5 length];
  if (v6 && result)
  {
    v12[0] = v4;
    v12[1] = v5;
    uint64_t v8 = (id *)v12;
    uint64_t v9 = 2;
  }
  else
  {
    if (v6)
    {
      id v11 = v4;
      uint64_t v8 = &v11;
    }
    else
    {
      if (!result) {
        return result;
      }
      id v10 = v5;
      uint64_t v8 = &v10;
    }
    uint64_t v9 = 1;
  }
  return +[NSArray arrayWithObjects:v8 count:v9];
}

- (double)stackedControlContainerWidth:(id)a3
{
  [(THWInteractiveImageSidebarLayoutDelegate *)self->_delegate interactiveImageSidebarSize:self];
  return result;
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "instanceData"), "contentInset");
  double v4 = v3 + -1.0;
  double v6 = v5 + -1.0;
  double v7 = 8.0;
  double v8 = 8.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v4;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "instanceData"), "verticalSpacing");
  return v4 + 4.0;
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
  return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (THWInteractiveImageCalloutInfo)currentCallout
{
  return self->_currentCallout;
}

- (THWInteractiveImageCalloutInfo)previousCallout
{
  return self->_previousCallout;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (THWInteractiveImageSidebarLayoutDelegate)delegate
{
  return self->_delegate;
}

@end