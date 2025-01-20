@interface DebugFrameConfig
- (CGRect)frame;
- (UIColor)color;
- (UILayoutGuide)layoutGuide;
- (double)weight;
- (unint64_t)edges;
- (void)setColor:(id)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setWeight:(double)a3;
@end

@implementation DebugFrameConfig

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UILayoutGuide)layoutGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutGuide);

  return (UILayoutGuide *)WeakRetained;
}

- (void)setLayoutGuide:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_destroyWeak((id *)&self->_layoutGuide);
}

@end