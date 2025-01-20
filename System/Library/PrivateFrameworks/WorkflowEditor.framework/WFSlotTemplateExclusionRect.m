@interface WFSlotTemplateExclusionRect
- (CGRect)rect;
- (CGRect)resolvedRectWithViewBounds:(CGRect)a3 inRTL:(BOOL)a4;
- (WFSlotTemplateExclusionRect)initWithRect:(CGRect)a3 fromEdge:(unint64_t)a4;
- (unint64_t)edge;
@end

@implementation WFSlotTemplateExclusionRect

- (unint64_t)edge
{
  return self->_edge;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)resolvedRectWithViewBounds:(CGRect)a3 inRTL:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.size.width;
  CGFloat y = self->_rect.origin.y;
  double v7 = self->_rect.size.width;
  CGFloat height = self->_rect.size.height;
  unint64_t v9 = [(WFSlotTemplateExclusionRect *)self edge];
  double v10 = width - v7;
  if (v9) {
    double v11 = 0.0;
  }
  else {
    double v11 = width - v7;
  }
  if (!v9) {
    double v10 = 0.0;
  }
  if (v4) {
    double v10 = v11;
  }
  double v12 = y;
  double v13 = v7;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = v10;
  return result;
}

- (WFSlotTemplateExclusionRect)initWithRect:(CGRect)a3 fromEdge:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateExclusionRect;
  unint64_t v9 = [(WFSlotTemplateExclusionRect *)&v13 init];
  double v10 = v9;
  if (v9)
  {
    v9->_rect.origin.CGFloat x = x;
    v9->_rect.origin.CGFloat y = y;
    v9->_rect.size.CGFloat width = width;
    v9->_rect.size.CGFloat height = height;
    v9->_edge = a4;
    double v11 = v9;
  }

  return v10;
}

@end