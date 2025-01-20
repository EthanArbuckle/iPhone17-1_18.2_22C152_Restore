@interface _PUScrollViewPageSwipeTestContext
- (CGPoint)originContentOffset;
- (NSString)testName;
- (_PUScrollViewPageSwipeTestContext)init;
- (double)currentPageSwipeProgress;
- (int64_t)currentDirection;
- (int64_t)currentIteration;
- (int64_t)currentPage;
- (int64_t)currentState;
- (int64_t)numberOfIterations;
- (int64_t)numberOfPages;
- (unint64_t)scrollAxis;
- (void)setCurrentDirection:(int64_t)a3;
- (void)setCurrentIteration:(int64_t)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setCurrentPageSwipeProgress:(double)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setNumberOfIterations:(int64_t)a3;
- (void)setNumberOfPages:(int64_t)a3;
- (void)setOriginContentOffset:(CGPoint)a3;
- (void)setScrollAxis:(unint64_t)a3;
- (void)setTestName:(id)a3;
@end

@implementation _PUScrollViewPageSwipeTestContext

- (void).cxx_destruct
{
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentPageSwipeProgress:(double)a3
{
  self->_currentPageSwipeProgress = a3;
}

- (double)currentPageSwipeProgress
{
  return self->_currentPageSwipeProgress;
}

- (void)setCurrentDirection:(int64_t)a3
{
  self->_currentDirection = a3;
}

- (int64_t)currentDirection
{
  return self->_currentDirection;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentIteration:(int64_t)a3
{
  self->_currentIteration = a3;
}

- (int64_t)currentIteration
{
  return self->_currentIteration;
}

- (void)setOriginContentOffset:(CGPoint)a3
{
  self->_originContentOffset = a3;
}

- (CGPoint)originContentOffset
{
  double x = self->_originContentOffset.x;
  double y = self->_originContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScrollAxis:(unint64_t)a3
{
  self->_scrollAxis = a3;
}

- (unint64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (void)setNumberOfIterations:(int64_t)a3
{
  self->_numberOfIterations = a3;
}

- (int64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (void)setNumberOfPages:(int64_t)a3
{
  self->_numberOfPages = a3;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (void)setTestName:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (_PUScrollViewPageSwipeTestContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PUScrollViewPageSwipeTestContext;
  CGPoint result = [(_PUScrollViewPageSwipeTestContext *)&v3 init];
  if (result) {
    result->_currentDirection = 1;
  }
  return result;
}

@end