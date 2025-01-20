@interface THFlowLayoutAnchor
- (CGPoint)deltaFromOriginalOffset;
- (CGPoint)originalAbsoluteOffset;
- (THFlowLayoutAnchor)initWithPageController:(id)a3 absoluteOffset:(CGPoint)a4;
- (THFlowPageController)pageController;
- (double)offsetFromBodyTop;
- (unint64_t)bodyIndex;
- (void)dealloc;
- (void)setOriginalAbsoluteOffset:(CGPoint)a3;
@end

@implementation THFlowLayoutAnchor

- (THFlowLayoutAnchor)initWithPageController:(id)a3 absoluteOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v16.receiver = self;
  v16.super_class = (Class)THFlowLayoutAnchor;
  v7 = [(THFlowLayoutAnchor *)&v16 init];
  if (v7)
  {
    v7->_pageController = (THFlowPageController *)a3;
    v7->_originalAbsoluteOffset.CGFloat x = x;
    v7->_originalAbsoluteOffset.CGFloat y = y;
    [a3 i_rectForSectionLayout];
    TSDSubtractPoints();
    double v9 = v8;
    id v10 = [a3 bodyIndexClosestToPoint:];
    v7->_bodyIndeCGFloat x = (unint64_t)v10;
    [a3 bodyTopAtIndex:v10];
    v7->_offsetFromBodyTop = v9 - v11;
    [(THFlowLayoutAnchor *)v7 deltaFromOriginalOffset];
    if (v13 != CGPointZero.x || v12 != CGPointZero.y) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowLayoutAnchor initWithPageController:absoluteOffset:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowLayoutAnchor.mm") lineNumber:41 description:@"offset shouldn't have changed already"];
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowLayoutAnchor;
  [(THFlowLayoutAnchor *)&v3 dealloc];
}

- (CGPoint)deltaFromOriginalOffset
{
  [(THFlowPageController *)self->_pageController i_rectForSectionLayout];
  [(THFlowPageController *)self->_pageController bodyTopAtIndex:self->_bodyIndex];

  TSDSubtractPoints();
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (THFlowPageController)pageController
{
  return self->_pageController;
}

- (unint64_t)bodyIndex
{
  return self->_bodyIndex;
}

- (double)offsetFromBodyTop
{
  return self->_offsetFromBodyTop;
}

- (CGPoint)originalAbsoluteOffset
{
  double x = self->_originalAbsoluteOffset.x;
  double y = self->_originalAbsoluteOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalAbsoluteOffset:(CGPoint)a3
{
  self->_originalAbsoluteOffset = a3;
}

@end