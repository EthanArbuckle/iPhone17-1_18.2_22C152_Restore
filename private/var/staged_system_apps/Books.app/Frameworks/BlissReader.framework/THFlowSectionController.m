@interface THFlowSectionController
- (CGRect)firstLineCacheRect;
- (CGSize)sectionSizeForContentNode:(id)a3;
- (NSArray)sortedPageControllers;
- (THFlowSectionController)initWithDelegate:(id)a3 pagePositionController:(id)a4 presentationType:(id)a5;
- (_NSRange)firstLineCacheRange;
- (_NSRange)firstLineInRect:(CGRect)a3 forBodyAnchor:(id)a4;
- (id)bodyAnchorForCanvasRect:(CGRect)a3;
- (id)description;
- (id)infosToDisplayForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4;
- (id)infosToDisplayOnlyForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4;
- (id)layoutAnchorForContentOffset:(CGPoint)a3;
- (id)newPageControllerForContentNode:(id)a3;
- (id)newSectionInfoForContentNode:(id)a3;
- (id)pageControllerForContentOffset:(CGPoint)a3;
- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double)a4 padBelow:(double)a5 layoutController:(id)a6;
- (void)layoutContentFromBottom:(double)a3 layoutController:(id)a4;
- (void)p_preparePageControllerForLayout:(id)a3 layoutController:(id)a4;
- (void)setFirstLineCacheRange:(_NSRange)a3;
- (void)setFirstLineCacheRect:(CGRect)a3;
@end

@implementation THFlowSectionController

- (THFlowSectionController)initWithDelegate:(id)a3 pagePositionController:(id)a4 presentationType:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)THFlowSectionController;
  result = [(THSectionController *)&v7 initWithDelegate:a3 pagePositionController:a4 presentationType:a5];
  if (result)
  {
    result->_firstLineCacheRange = *(_NSRange *)NSInvalidRange;
    CGSize size = CGRectZero.size;
    result->_firstLineCacheRect.origin = CGRectZero.origin;
    result->_firstLineCacheRect.CGSize size = size;
  }
  return result;
}

- (id)infosToDisplayForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  id v5 = [(TSUPointerKeyDictionary *)self->super.mSectionInfos allValues];
  v6 = [(THNavigationUnit *)self->super.mCurrentNavigationUnit contentNodes];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_11F314;
  v8[3] = &unk_457B78;
  v8[4] = v6;
  return [v5 sortedArrayUsingComparator:v8];
}

- (id)infosToDisplayOnlyForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = -[THFlowSectionController infosToDisplayForRelativePageRange:forceLoad:](self, "infosToDisplayForRelativePageRange:forceLoad:", a3.location, a3.length, a4);
  id v7 = +[NSMutableArray array];
  if (location < location + length)
  {
    do
    {
      if (location >= (unint64_t)[v6 count]) {
        break;
      }
      [v7 addObject:[v6 objectAtIndexedSubscript:location++]];
      --length;
    }
    while (length);
  }
  return v7;
}

- (id)bodyAnchorForCanvasRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = -[THFlowSectionController pageControllerForContentOffset:](self, "pageControllerForContentOffset:");
  if (!v7) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController bodyAnchorForCanvasRect:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm") lineNumber:89 description:@"invalid nil value for '%s'", "pageController"];
  }
  [v7 i_rectForSectionLayout];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectIntersection(v10, v11);
  TSDSubtractPoints();

  return [v7 bodyAnchorForRect:1];
}

- (id)layoutAnchorForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = -[THFlowSectionController pageControllerForContentOffset:](self, "pageControllerForContentOffset:");
  if (!v5) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutAnchorForContentOffset:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm") lineNumber:103 description:@"invalid nil value for '%s'", "pageController"];
  }
  id v6 = -[THFlowLayoutAnchor initWithPageController:absoluteOffset:]([THFlowLayoutAnchor alloc], "initWithPageController:absoluteOffset:", v5, x, y);
  if (!v6) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutAnchorForContentOffset:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm") lineNumber:107 description:@"invalid nil value for '%s'", "anchor"];
  }
  return v6;
}

- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double)a4 padBelow:(double)a5 layoutController:(id)a6
{
  double v24 = a5;
  double v25 = a4;
  if (a3)
  {
    v9 = [(THFlowSectionController *)self sortedPageControllers];
    CGRect v10 = -[NSArray indexOfObjectIdenticalTo:](v9, "indexOfObjectIdenticalTo:", [a3 pageController]);
    if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = +[TSUAssertionHandler currentHandler];
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"];
      [v11 handleFailureInFunction:v12 file:v13 lineNumber:121 description:@"layout anchor is from another navigation unit"];
    }
    else
    {
      v14 = v10;
      -[THFlowSectionController p_preparePageControllerForLayout:layoutController:](self, "p_preparePageControllerForLayout:layoutController:", [a3 pageController], a6);
      objc_msgSend(objc_msgSend(a3, "pageController"), "layoutContentAtLayoutAnchor:padAbove:padBelow:", a3, &v25, &v24);
      if (v14)
      {
        double v15 = v25;
        if (v25 > 0.0)
        {
          v16 = v14 - 1;
          do
          {
            id v17 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", v16, v15);
            [(THFlowSectionController *)self p_preparePageControllerForLayout:v17 layoutController:a6];
            [v17 layoutContentFromBottom:&v25];
            if (v16-- == 0) {
              break;
            }
            double v15 = v25;
          }
          while (v25 > 0.0);
        }
      }
      NSUInteger v19 = [(NSArray *)v9 count];
      if ((unint64_t)(v14 + 1) < v19)
      {
        double v20 = v24;
        if (v24 > 0.0)
        {
          NSUInteger v21 = v19;
          v22 = v14 + 2;
          do
          {
            id v23 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", v22 - 1, v20);
            [(THFlowSectionController *)self p_preparePageControllerForLayout:v23 layoutController:a6];
            [v23 layoutContentFromTop:&v24];
            if ((unint64_t)v22 >= v21) {
              break;
            }
            double v20 = v24;
            ++v22;
          }
          while (v24 > 0.0);
        }
      }
    }
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm") lineNumber:114 description:@"invalid nil value for '%s'", "layoutAnchor"];
  }
}

- (void)layoutContentFromBottom:(double)a3 layoutController:(id)a4
{
  double v12 = a3;
  id v7 = [(THFlowSectionController *)self sortedPageControllers];
  v8 = [(NSArray *)v7 count];
  if (v8 && a3 > 0.0)
  {
    v9 = v8 - 1;
    do
    {
      id v10 = [(NSArray *)v7 objectAtIndex:v9];
      [(THFlowSectionController *)self p_preparePageControllerForLayout:v10 layoutController:a4];
      [v10 layoutContentFromBottom:&v12];
      BOOL v11 = v9-- != 0;
    }
    while (v11 && v12 > 0.0);
  }
}

- (_NSRange)firstLineInRect:(CGRect)a3 forBodyAnchor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(THFlowSectionController *)self firstLineCacheRect];
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  if (!CGRectEqualToRect(v24, v27)
    || ((id v10 = [(THFlowSectionController *)self firstLineCacheRange], v10 == NSInvalidRange[0])
      ? (BOOL v12 = v11 == NSInvalidRange[1])
      : (BOOL v12 = 0),
        v12))
  {
    id v13 = -[TSUPointerKeyDictionary objectForKey:](self->super.mPageControllers, "objectForKey:", [a4 contentNode]);
    if (!v13) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController firstLineInRect:forBodyAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm") lineNumber:168 description:@"invalid nil value for '%s'", "pageController"];
    }
    [v13 i_rectForSectionLayout];
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    CGRect v26 = CGRectIntersection(v25, v28);
    double v14 = v26.size.width;
    double v15 = v26.size.height;
    TSDSubtractPoints();
    id v18 = [v13 firstLineInRect:[a4 range] fromCharIndex:v16, v17, v14, v15];
    -[THFlowSectionController setFirstLineCacheRange:](self, "setFirstLineCacheRange:", v18, v19);
    -[THFlowSectionController setFirstLineCacheRect:](self, "setFirstLineCacheRect:", x, y, width, height);
  }

  id v20 = [(THFlowSectionController *)self firstLineCacheRange];
  result.NSUInteger length = v21;
  result.NSUInteger location = (NSUInteger)v20;
  return result;
}

- (id)newPageControllerForContentNode:(id)a3
{
  id v5 = [(THSectionControllerDelegate *)[(THSectionController *)self delegate] flowLayoutObserverForSectionController:self];
  id v6 = [THFlowPageController alloc];
  id v7 = [(THSectionController *)self presentationType];

  return [(THFlowPageController *)v6 initWithDelegate:self layoutObserver:v5 contentNode:a3 presentationType:v7];
}

- (id)newSectionInfoForContentNode:(id)a3
{
  v4 = objc_alloc_init(THFlowSectionInfo);
  [(THFlowSectionInfo *)v4 setPresentationType:[(THSectionController *)self presentationType]];
  return v4;
}

- (CGSize)sectionSizeForContentNode:(id)a3
{
  id v3 = [(TSUPointerKeyDictionary *)self->super.mPageControllers objectForKey:a3];

  [v3 desiredPageSizeForRelativePageIndex:0];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (NSArray)sortedPageControllers
{
  id v3 = (NSArray *)+[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(THNavigationUnit *)self->super.mCurrentNavigationUnit contentNodes];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSArray *)v3 addObject:[(TSUPointerKeyDictionary *)self->super.mPageControllers objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)]];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)pageControllerForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(THNavigationUnit *)self->super.mCurrentNavigationUnit contentNodes];
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v17;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v17 != v8) {
      objc_enumerationMutation(v5);
    }
    id v10 = [(TSUPointerKeyDictionary *)self->super.mPageControllers objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v9)];
    [v10 i_rectForSectionLayout];
    CGFloat x = v21.origin.x;
    CGFloat v12 = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
    if (y >= CGRectGetMinY(v21))
    {
      v22.origin.CGFloat x = x;
      v22.origin.double y = v12;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      if (y < CGRectGetMaxY(v22)) {
        return v10;
      }
    }
    if (v7 == (id)++v9)
    {
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return v10;
    }
  }
}

- (void)p_preparePageControllerForLayout:(id)a3 layoutController:(id)a4
{
  [a3 prepareForLayout];
  id v7 = -[TSUPointerKeyDictionary objectForKey:](self->super.mSectionInfos, "objectForKey:", [a3 contentNode]);
  objc_opt_class();
  [a4 layoutForInfo:v7];
  uint64_t v8 = (void *)TSUDynamicCast();
  if (!v8) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController p_preparePageControllerForLayout:layoutController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm") lineNumber:241 description:@"invalid nil value for '%s'", "sectionLayout"];
  }

  [v8 ensurePageLayoutCreated];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@=%p pageControllers=%@>", NSStringFromClass(v3), self, [(THFlowSectionController *)self sortedPageControllers]];
}

- (_NSRange)firstLineCacheRange
{
  p_firstLineCacheRange = &self->_firstLineCacheRange;
  NSUInteger location = self->_firstLineCacheRange.location;
  NSUInteger length = p_firstLineCacheRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setFirstLineCacheRange:(_NSRange)a3
{
  self->_firstLineCacheRange = a3;
}

- (CGRect)firstLineCacheRect
{
  double x = self->_firstLineCacheRect.origin.x;
  double y = self->_firstLineCacheRect.origin.y;
  double width = self->_firstLineCacheRect.size.width;
  double height = self->_firstLineCacheRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFirstLineCacheRect:(CGRect)a3
{
  self->_firstLineCacheRect = a3;
}

@end