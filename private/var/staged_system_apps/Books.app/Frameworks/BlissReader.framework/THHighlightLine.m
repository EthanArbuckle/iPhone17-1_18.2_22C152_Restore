@interface THHighlightLine
- (BOOL)includesCapSpace;
- (CALayer)contentLayer;
- (CGRect)currentLineRect;
- (CGRect)fullLineRect;
- (double)baseline;
- (double)underlineOffset;
- (void)dealloc;
- (void)setBaseline:(double)a3;
- (void)setContentLayer:(id)a3;
- (void)setCurrentLineRect:(CGRect)a3;
- (void)setFullLineRect:(CGRect)a3;
- (void)setIncludesCapSpace:(BOOL)a3;
- (void)setUnderlineOffset:(double)a3;
@end

@implementation THHighlightLine

- (void)dealloc
{
  [(THHighlightLine *)self setContentLayer:0];
  v3.receiver = self;
  v3.super_class = (Class)THHighlightLine;
  [(THHighlightLine *)&v3 dealloc];
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (CGRect)fullLineRect
{
  double x = self->_fullLineRect.origin.x;
  double y = self->_fullLineRect.origin.y;
  double width = self->_fullLineRect.size.width;
  double height = self->_fullLineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullLineRect:(CGRect)a3
{
  self->_fullLineRect = a3;
}

- (CGRect)currentLineRect
{
  double x = self->_currentLineRect.origin.x;
  double y = self->_currentLineRect.origin.y;
  double width = self->_currentLineRect.size.width;
  double height = self->_currentLineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentLineRect:(CGRect)a3
{
  self->_currentLineRect = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (double)underlineOffset
{
  return self->_underlineOffset;
}

- (void)setUnderlineOffset:(double)a3
{
  self->_underlineOffset = a3;
}

- (BOOL)includesCapSpace
{
  return self->_includesCapSpace;
}

- (void)setIncludesCapSpace:(BOOL)a3
{
  self->_includesCapSpace = a3;
}

@end