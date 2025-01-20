@interface THPagePositionController
+ (CGSize)fixedPageSizeForLandscapeOrientation:(BOOL)a3;
+ (id)flowPositionerWithDelegate:(id)a3;
+ (id)paginatedPositionerWithDelegate:(id)a3;
- (BOOL)pageHorizontally;
- (BOOL)shouldEnablePaging;
- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3;
- (CGPoint)sectionOriginWithPrecedingSectionSizes:(id)a3;
- (CGRect)offsetRect:(CGRect)a3 inPagingDirectionWithOffset:(CGPoint)a4;
- (CGRect)pageRectForRelativePageIndex:(unint64_t)a3;
- (CGSize)canvasSizeForPageCount:(unint64_t)a3;
- (CGSize)offsetSize:(CGSize)a3 inPagingDirectionWithOffset:(CGSize)a4;
- (CGSize)p_sequentialPageSizeOffsetFromPageSize:(CGSize)a3;
- (CGSize)pageSize;
- (CGSize)pageSizeWithZeroInPagingDirection;
- (CGSize)sequentialSizeFromPageSizes:(id)a3;
- (THPagePositionController)initWithDelegate:(id)a3 enablePaging:(BOOL)a4 pageHorizontally:(BOOL)a5;
- (_NSRange)visibleRelativePageIndexRangeForRect:(CGRect)a3 withPadding:(BOOL)a4 pageCount:(unint64_t)a5;
- (unint64_t)mostVisibleRelativePageIndexForCanvasBoundsRect:(CGRect)a3;
- (unint64_t)relativePageIndexFromCanvasPoint:(CGPoint)a3;
- (void)arrangeLayouts:(id)a3;
@end

@implementation THPagePositionController

- (THPagePositionController)initWithDelegate:(id)a3 enablePaging:(BOOL)a4 pageHorizontally:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)THPagePositionController;
  result = [(THPagePositionController *)&v9 init];
  if (result)
  {
    result->mDelegate = (THPagePositionControllerDelegate *)a3;
    result->mShouldEnablePaging = a4;
    result->mPageHorizontally = a5;
  }
  return result;
}

+ (CGSize)fixedPageSizeForLandscapeOrientation:(BOOL)a3
{
  double v3 = 768.0;
  if (a3) {
    double v3 = 1024.0;
  }
  double v4 = 1004.0;
  if (a3) {
    double v4 = 748.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)paginatedPositionerWithDelegate:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithDelegate:a3 enablePaging:1 pageHorizontally:1];

  return v3;
}

+ (id)flowPositionerWithDelegate:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithDelegate:a3 enablePaging:0 pageHorizontally:0];

  return v3;
}

- (CGSize)pageSize
{
  [(THPagePositionControllerDelegate *)self->mDelegate pageSizeForPagePositionController:self];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)relativePageIndexFromCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(THPagePositionController *)self pageSize];
  double v7 = v6;
  double v9 = v8;
  unsigned int v10 = [(THPagePositionController *)self pageHorizontally];
  if (v10) {
    double v11 = x;
  }
  else {
    double v11 = y;
  }
  if (v10) {
    double v12 = v7;
  }
  else {
    double v12 = v9;
  }
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  return (unint64_t)(v11 / v12);
}

- (CGSize)canvasSizeForPageCount:(unint64_t)a3
{
  [(THPagePositionController *)self pageSize];
  double v6 = v5;
  double v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    a3 = 1;
  }
  unsigned int v9 = [(THPagePositionController *)self pageHorizontally];
  double v10 = v8 * (double)a3;
  double v11 = v6 * (double)a3;
  if (v9) {
    double v10 = v8;
  }
  else {
    double v11 = v6;
  }
  result.height = v10;
  result.width = v11;
  return result;
}

- (_NSRange)visibleRelativePageIndexRangeForRect:(CGRect)a3 withPadding:(BOOL)a4 pageCount:(unint64_t)a5
{
  if (a3.size.height <= 0.0)
  {
    id v19 = NSInvalidRange[0];
    id v18 = NSInvalidRange[1];
  }
  else
  {
    BOOL v6 = a4;
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    [(THPagePositionController *)self pageSize];
    double v13 = v12;
    double v15 = v14;
    if ([(THPagePositionController *)self pageHorizontally])
    {
      double v16 = x / v13;
      v25.origin.double x = x;
      v25.origin.double y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double v17 = CGRectGetMaxX(v25) / v13;
    }
    else
    {
      double v16 = y / v15;
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double v17 = CGRectGetMaxY(v26) / v15;
    }
    unint64_t v20 = (unint64_t)v16 - 1;
    if (!(unint64_t)v16) {
      unint64_t v20 = 0;
    }
    if (v6) {
      id v19 = (id)v20;
    }
    else {
      id v19 = (id)v16;
    }
    unint64_t v21 = (unint64_t)v17 + v6;
    if (v21 + 1 < (unint64_t)v19) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPagePositionController visibleRelativePageIndexRangeForRect:withPadding:pageCount:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPagePositionController.m") lineNumber:94 description:@"negative page range length"];
    }
    unint64_t v22 = a5 - 1;
    if (v21 < a5 - 1) {
      unint64_t v22 = v21;
    }
    id v18 = (id)(v22 - (void)v19 + 1);
  }
  NSUInteger v23 = (NSUInteger)v19;
  result.length = (NSUInteger)v18;
  result.location = v23;
  return result;
}

- (unint64_t)mostVisibleRelativePageIndexForCanvasBoundsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v12);

  return -[THPagePositionController relativePageIndexFromCanvasPoint:](self, "relativePageIndexFromCanvasPoint:", MidX, MidY);
}

- (CGRect)pageRectForRelativePageIndex:(unint64_t)a3
{
  [(THPagePositionController *)self pageOriginForRelativePageIndex:a3];
  double v5 = v4;
  double v7 = v6;
  [(THPagePositionController *)self pageSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = v5;
  double v13 = v7;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3
{
  [(THPagePositionController *)self pageSize];
  double v6 = v5;
  double v8 = v7;
  unsigned int v9 = [(THPagePositionController *)self pageHorizontally];
  if (v9) {
    double v10 = v6 * (double)a3;
  }
  else {
    double v10 = 0.0;
  }
  if (v9) {
    double v11 = 0.0;
  }
  else {
    double v11 = v8 * (double)a3;
  }
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGSize)pageSizeWithZeroInPagingDirection
{
  unsigned int v3 = [(THPagePositionController *)self pageHorizontally];
  [(THPagePositionController *)self pageSize];
  if (v3) {
    double v4 = 0.0;
  }
  else {
    double v5 = 0.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (CGPoint)sectionOriginWithPrecedingSectionSizes:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) CGSizeValue];
        double v12 = v11;
        double v14 = v13;
        unsigned int v15 = [(THPagePositionController *)self pageHorizontally];
        double v16 = -0.0;
        if (v15) {
          double v17 = -0.0;
        }
        else {
          double v17 = v14;
        }
        double y = y + v17;
        if (v15) {
          double v16 = v12;
        }
        double x = x + v16;
      }
      id v8 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  double v18 = x;
  double v19 = y;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGSize)p_sequentialPageSizeOffsetFromPageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v5 = [(THPagePositionController *)self pageHorizontally];
  double v6 = 0.0;
  if (v5) {
    double v7 = width;
  }
  else {
    double v7 = 0.0;
  }
  if (!v5) {
    double v6 = height;
  }
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void)arrangeLayouts:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
    uint64_t v9 = *(void *)v18;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        memset(&v16, 0, sizeof(v16));
        CGAffineTransformMakeTranslation(&v16, width, height);
        id v12 = objc_msgSend(objc_msgSend(v11, "geometry"), "mutableCopy");
        CGAffineTransform v15 = v16;
        [v12 setTransform:&v15];
        [v11 setGeometry:v12];
        [v12 size];
        -[THPagePositionController p_sequentialPageSizeOffsetFromPageSize:](self, "p_sequentialPageSizeOffsetFromPageSize:");
        TSDAddSizes();
        CGFloat width = v13;
        CGFloat height = v14;

        double v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (CGSize)sequentialSizeFromPageSizes:(id)a3
{
  [(THPagePositionController *)self pageSizeWithZeroInPagingDirection];
  double v6 = v5;
  double v8 = v7;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) CGSizeValue];
        -[THPagePositionController p_sequentialPageSizeOffsetFromPageSize:](self, "p_sequentialPageSizeOffsetFromPageSize:");
        TSDAddSizes();
        double v6 = v13;
        double v8 = v14;
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  double v15 = v6;
  double v16 = v8;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (CGRect)offsetRect:(CGRect)a3 inPagingDirectionWithOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double v8 = a3.origin.y;
  double v9 = a3.origin.x;
  unsigned int v10 = [(THPagePositionController *)self pageHorizontally];
  double v11 = -0.0;
  if (v10) {
    double v12 = x;
  }
  else {
    double v12 = -0.0;
  }
  double v13 = v9 + v12;
  if (!v10) {
    double v11 = y;
  }
  double v14 = v8 + v11;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)offsetSize:(CGSize)a3 inPagingDirectionWithOffset:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  unsigned int v8 = [(THPagePositionController *)self pageHorizontally];
  double v9 = -0.0;
  if (v8) {
    double v10 = width;
  }
  else {
    double v10 = -0.0;
  }
  double v11 = v7 + v10;
  if (!v8) {
    double v9 = height;
  }
  double v12 = v6 + v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)shouldEnablePaging
{
  return self->mShouldEnablePaging;
}

- (BOOL)pageHorizontally
{
  return self->mPageHorizontally;
}

@end