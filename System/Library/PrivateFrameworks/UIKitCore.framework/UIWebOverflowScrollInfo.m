@interface UIWebOverflowScrollInfo
- (BOOL)coalesceScrollForNode:(id)a3 offset:(CGPoint)a4 isUserScroll:(BOOL)a5;
- (BOOL)isUserScroll;
- (CGPoint)offset;
- (DOMNode)node;
- (UIWebOverflowScrollInfo)initWithNode:(id)a3 offset:(CGPoint)a4 isUserScroll:(BOOL)a5;
- (void)dealloc;
- (void)setIsUserScroll:(BOOL)a3;
- (void)setNode:(id)a3;
- (void)setOffset:(CGPoint)a3;
@end

@implementation UIWebOverflowScrollInfo

- (UIWebOverflowScrollInfo)initWithNode:(id)a3 offset:(CGPoint)a4 isUserScroll:(BOOL)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v11.receiver = self;
  v11.super_class = (Class)UIWebOverflowScrollInfo;
  v9 = [(UIWebOverflowScrollInfo *)&v11 init];
  if (v9)
  {
    v9->_node = (DOMNode *)a3;
    v9->_offset.CGFloat x = x;
    v9->_offset.CGFloat y = y;
    v9->_isUserScroll = a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowScrollInfo;
  [(UIWebOverflowScrollInfo *)&v3 dealloc];
}

- (BOOL)coalesceScrollForNode:(id)a3 offset:(CGPoint)a4 isUserScroll:(BOOL)a5
{
  if (self->_node != a3 || self->_isUserScroll != a5) {
    return 0;
  }
  self->_offset = a4;
  return 1;
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)isUserScroll
{
  return self->_isUserScroll;
}

- (void)setIsUserScroll:(BOOL)a3
{
  self->_isUserScroll = a3;
}

@end