@interface THWInteractiveImageRadioPanelLayout
- (BOOL)p_shouldUseTextLabelWithFrameWidth:(double)a3;
- (CGRect)nextButtonFrame;
- (CGRect)pageControlFrame;
- (CGRect)prevButtonFrame;
- (CGSize)controlButtonSize;
- (CGSize)navigationArrowSize;
- (THWInteractiveImageWidgetLayout)widgetLayout;
- (THWPageControlLayout)pageControl;
- (double)maxCalloutFrameWidth;
- (double)p_desiredWidth;
- (id)additionalLayouts;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (id)primaryColor;
- (unint64_t)index;
- (unint64_t)tag;
- (unint64_t)totalCallouts;
- (void)dealloc;
- (void)setIndex:(unint64_t)a3;
- (void)setMaxCalloutFrameWidth:(double)a3;
- (void)setNavigationArrowSize:(CGSize)a3;
- (void)setNextButtonFrame:(CGRect)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlFrame:(CGRect)a3;
- (void)setPrevButtonFrame:(CGRect)a3;
- (void)setTag:(unint64_t)a3;
- (void)setTotalCallouts:(unint64_t)a3;
- (void)setWidgetLayout:(id)a3;
@end

@implementation THWInteractiveImageRadioPanelLayout

- (void)dealloc
{
  self->_pageControl = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageRadioPanelLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (id)additionalLayouts
{
  id v3 = +[NSMutableArray array];
  -[THWInteractiveImageRadioPanelLayout setTotalCallouts:[-[THWInteractiveImageWidgetLayout info](-[THWInteractiveImageRadioPanelLayout widgetLayout](self, "widgetLayout"), "info"), "calloutCount"]];
  pageControl = self->_pageControl;
  if (!pageControl)
  {
    self->_pageControl = [(THWControlLayout *)[THWPageControlLayout alloc] initWithTag:2];
    [(THWPageControlLayout *)self->_pageControl setCurrentPage:[(THWInteractiveImageWidgetLayout *)[(THWInteractiveImageRadioPanelLayout *)self widgetLayout] selectedCalloutIndex]];
    [(THWPageControlLayout *)self->_pageControl setNumberOfPages:[(THWInteractiveImageRadioPanelLayout *)self totalCallouts]];
    pageControl = self->_pageControl;
  }
  [v3 addObject:pageControl];
  v5 = objc_alloc_init(THWButtonControlLayout);
  [(THWControlLayout *)v5 setTag:0];
  [v3 addObject:v5];
  [(THWButtonControlLayout *)v5 invalidateFrame];

  v6 = objc_alloc_init(THWButtonControlLayout);
  [(THWControlLayout *)v6 setTag:1];
  [v3 addObject:v6];
  [(THWButtonControlLayout *)v6 invalidateFrame];

  return v3;
}

- (id)primaryColor
{
  if ([(THWInteractiveImageWidgetLayout *)[(THWInteractiveImageRadioPanelLayout *)self widgetLayout] isExpanded])
  {
    return +[TSUColor whiteColor];
  }
  else
  {
    v4 = [(THWInteractiveImageRadioPanelLayout *)self widgetLayout];
    return [(THWInteractiveImageWidgetLayout *)v4 primaryColor];
  }
}

- (double)p_desiredWidth
{
  unint64_t v2 = [(THWInteractiveImageRadioPanelLayout *)self totalCallouts];
  unint64_t v3 = v2 - 1;
  if (!v2) {
    unint64_t v3 = 0;
  }
  return (double)v3 * 4.0 + (double)v2 * 31.0;
}

- (BOOL)p_shouldUseTextLabelWithFrameWidth:(double)a3
{
  [(THWInteractiveImageRadioPanelLayout *)self maxCalloutFrameWidth];
  double v6 = v5;
  unint64_t v7 = [(THWInteractiveImageRadioPanelLayout *)self totalCallouts];
  return v6 <= a3 || v7 > 0xA;
}

- (id)computeLayoutGeometry
{
  v28.receiver = self;
  v28.super_class = (Class)THWInteractiveImageRadioPanelLayout;
  id v3 = [(THWInteractiveImageRadioPanelLayout *)&v28 computeLayoutGeometry];
  [v3 frame];
  double v5 = v4;
  __asm { FMOV            V0.2D, #31.0 }
  self->_navigationArrowSize = _Q0;
  CGSize v27 = _Q0;
  self->_controlButtonSize = _Q0;
  [(THWInteractiveImageRadioPanelLayout *)self setMaxCalloutFrameWidth:v4 + -142.0];
  [(THWInteractiveImageRadioPanelLayout *)self p_desiredWidth];
  double v12 = v11;
  [(THWInteractiveImageRadioPanelLayout *)self maxCalloutFrameWidth];
  if (v12 <= v13) {
    double v14 = 4.0;
  }
  else {
    double v14 = 1.0;
  }
  double v15 = (double)[(THWInteractiveImageRadioPanelLayout *)self totalCallouts];
  double v16 = v14 * (double)([(THWInteractiveImageRadioPanelLayout *)self totalCallouts] - 1) + v15 * 31.0;
  BOOL v17 = [(THWInteractiveImageRadioPanelLayout *)self p_shouldUseTextLabelWithFrameWidth:v16];
  if (v17)
  {
    [(THWInteractiveImageRadioPanelLayout *)self maxCalloutFrameWidth];
    double v16 = v18;
  }
  [v3 frame];
  p_pageControlFrame = &self->_pageControlFrame;
  self->_pageControlFrame.origin.x = (v5 - v16) * 0.5;
  self->_pageControlFrame.origin.y = (v19 + -31.0) * 0.5;
  self->_pageControlFrame.size.width = v16;
  self->_pageControlFrame.size.height = 31.0;
  [(THWPageControlLayout *)self->_pageControl setSpacing:v14];
  [(THWPageControlLayout *)self->_pageControl setForceTextOnly:v17];
  [v3 frame];
  double v22 = v21;
  double v23 = 0.0;
  if ([(THWInteractiveImageWidgetLayout *)[(THWInteractiveImageRadioPanelLayout *)self widgetLayout] isExpanded])
  {
    double v23 = p_pageControlFrame->origin.x + -31.0 + -14.0;
  }
  if ([(THWInteractiveImageWidgetLayout *)[(THWInteractiveImageRadioPanelLayout *)self widgetLayout] isExpanded])
  {
    v29.origin.x = p_pageControlFrame->origin.x;
    v29.origin.y = self->_pageControlFrame.origin.y;
    v29.size.width = self->_pageControlFrame.size.width;
    v29.size.height = self->_pageControlFrame.size.height;
    double v24 = CGRectGetMaxX(v29) + 14.0;
  }
  else
  {
    double v24 = v5 + -31.0;
  }
  CGFloat v25 = (v22 + -31.0) * 0.5;
  self->_prevButtonFrame.origin.x = v23;
  self->_prevButtonFrame.origin.y = v25;
  self->_prevButtonFrame.size = v27;
  self->_nextButtonFrame.origin.x = v24;
  self->_nextButtonFrame.origin.y = v25;
  self->_nextButtonFrame.size = v27;
  return v3;
}

- (id)dependentLayouts
{
  id v3 = +[NSMutableArray arrayWithArray:[(THWInteractiveImageRadioPanelLayout *)self children]];
  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageRadioPanelLayout;
  [(NSMutableArray *)v3 addObjectsFromArray:[(THWInteractiveImageRadioPanelLayout *)&v5 dependentLayouts]];
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v4 = (void *)TSUProtocolCast();
  if (!v4) {
    return 0;
  }
  unint64_t v5 = (unint64_t)[v4 tag];
  if (v5 > 2) {
    return 0;
  }
  double v6 = off_45A440[v5];
  id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:*(double *)&self->super.TSDContainerLayout_opaque[*v6], *(double *)&self->super.TSDContainerLayout_opaque[*v6 + 8], *(double *)&self->super.TSDContainerLayout_opaque[*v6 + 16], *(double *)&self->super.TSDContainerLayout_opaque[*v6 + 24]];

  return v7;
}

- (unint64_t)tag
{
  return self->tag;
}

- (void)setTag:(unint64_t)a3
{
  self->tag = a3;
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

- (THWPageControlLayout)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (THWInteractiveImageWidgetLayout)widgetLayout
{
  return self->_widgetLayout;
}

- (void)setWidgetLayout:(id)a3
{
  self->_widgetLayout = (THWInteractiveImageWidgetLayout *)a3;
}

- (unint64_t)totalCallouts
{
  return self->_totalCallouts;
}

- (void)setTotalCallouts:(unint64_t)a3
{
  self->_totalCallouts = a3;
}

- (CGSize)navigationArrowSize
{
  double width = self->_navigationArrowSize.width;
  double height = self->_navigationArrowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNavigationArrowSize:(CGSize)a3
{
  self->_navigationArrowSize = a3;
}

- (CGSize)controlButtonSize
{
  double width = self->_controlButtonSize.width;
  double height = self->_controlButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)nextButtonFrame
{
  double x = self->_nextButtonFrame.origin.x;
  double y = self->_nextButtonFrame.origin.y;
  double width = self->_nextButtonFrame.size.width;
  double height = self->_nextButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNextButtonFrame:(CGRect)a3
{
  self->_nextButtonFrame = a3;
}

- (CGRect)prevButtonFrame
{
  double x = self->_prevButtonFrame.origin.x;
  double y = self->_prevButtonFrame.origin.y;
  double width = self->_prevButtonFrame.size.width;
  double height = self->_prevButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrevButtonFrame:(CGRect)a3
{
  self->_prevButtonFrame = a3;
}

- (CGRect)pageControlFrame
{
  double x = self->_pageControlFrame.origin.x;
  double y = self->_pageControlFrame.origin.y;
  double width = self->_pageControlFrame.size.width;
  double height = self->_pageControlFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPageControlFrame:(CGRect)a3
{
  self->_pageControlFrame = a3;
}

- (double)maxCalloutFrameWidth
{
  return self->_maxCalloutFrameWidth;
}

- (void)setMaxCalloutFrameWidth:(double)a3
{
  self->_maxCalloutFrameWidth = a3;
}

@end