@interface THSectionController
- (BOOL)allowsDescendersToClipForPageController:(id)a3;
- (BOOL)displaySinglePageChapterSeparatelyForPageController:(id)a3;
- (BOOL)isCompactFlowPresentationForPageController:(id)a3;
- (BOOL)isTwoUpForNavigationUnitForPageController:(id)a3;
- (BOOL)p_showingPagesInNodeContainingRelativePageIndex:(unint64_t)a3;
- (BOOL)pageController:(id)a3 needsAnnotationSourceForLayout:(id)a4;
- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForPageController:(id)a3;
- (BOOL)shouldEnablePaging;
- (BOOL)shouldScaleFlowLayoutsForPageController:(id)a3;
- (CGPoint)canvasOriginDelta;
- (CGPoint)canvasOriginDeltaForPageController:(id)a3;
- (CGPoint)canvasOriginForPageController:(id)a3;
- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3;
- (CGPoint)sectionOriginForContentNode:(id)a3;
- (CGRect)canvasRectForRelativePageIndex:(unint64_t)a3;
- (CGRect)p_expandCanvasRectIfFlow:(CGRect)a3;
- (CGRect)rectForBodyAnchor:(id)a3;
- (CGRect)rectForContentNode:(id)a3 layout:(id)a4;
- (CGRect)sectionRelativeCanvasRectForRelativePageIndex:(unint64_t)a3;
- (CGSize)pageSize;
- (CGSize)preferredCanvasSize;
- (CGSize)sectionSizeForContentNode:(id)a3;
- (NSArray)currentContentNodes;
- (THNavigationUnit)currentNavigationUnit;
- (THPagePositionController)pagePositionController;
- (THPresentationType)presentationType;
- (THReflowablePaginationController)reflowablePaginationController;
- (THSectionController)initWithDelegate:(id)a3 pagePositionController:(id)a4 presentationType:(id)a5;
- (THSectionControllerDelegate)delegate;
- (TSKSearchTargetProvider)searchTargetProvider;
- (TSUPointerKeyDictionary)pageControllers;
- (TSUPointerKeyDictionary)sectionInfos;
- (_NSRange)firstLineInRect:(CGRect)a3 forBodyAnchor:(id)a4;
- (_NSRange)relativePageRangeForCanvasRect:(CGRect)a3 pad:(int)a4;
- (id)accessControllerForPageController:(id)a3;
- (id)bodyAnchorForCanvasRect:(CGRect)a3;
- (id)bodyInfoForStorage:(id)a3 anchoredCharIndex:(unint64_t)a4;
- (id)bodyInfoForStorage:(id)a3 charIndex:(unint64_t)a4;
- (id)bodyStorageForPageController:(id)a3 presentationType:(id)a4;
- (id)displaySectionInfoForRelativePageIndex:(unint64_t)a3;
- (id)infosToDisplayForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4;
- (id)layoutAnchorForContentOffset:(CGPoint)a3;
- (id)layoutControllerForPageController:(id)a3;
- (id)newPageControllerForContentNode:(id)a3;
- (id)newSectionInfoForContentNode:(id)a3;
- (id)p_contentNodeForBodyStorage:(id)a3 forceLoad:(BOOL)a4;
- (id)p_contentNodeForRelativePageIndex:(unint64_t)a3;
- (id)pageControllerForContentNode:(id)a3;
- (id)pageInfoForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3;
- (id)pageInfoForCenterOfVisibleRectInInteractiveCanvasController:(id)a3;
- (id)pageInfoForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3;
- (id)pageInfoForPageController:(id)a3 pageIndex:(unint64_t)a4 presentationType:(id)a5;
- (id)pageInfoForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)_navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)_navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)_navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)_navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)absolutePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)absolutePageIndexForBodyStorageAnchor:(id)a3;
- (unint64_t)absolutePageIndexForCenterOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3;
- (unint64_t)mostVisibleAbsolutePageIndexForCanvasBoundsRect:(CGRect)a3;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)p_relativeSheetIndexFromCanvasPoint:(CGPoint)a3;
- (unint64_t)pageCount;
- (unint64_t)pageCountForNavigationUnitForPageController:(id)a3;
- (unint64_t)pageCountForPageController:(id)a3 presentationType:(id)a4;
- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3;
- (unint64_t)relativePageIndexForBodyStorage:(id)a3 charIndex:(unint64_t)a4;
- (unint64_t)relativePageIndexForBodyStorage:(id)a3 charIndex:(unint64_t)a4 forceLoad:(BOOL)a5;
- (unint64_t)relativePageIndexForBodyStorageAnchor:(id)a3;
- (unint64_t)relativePageIndexForContentNode:(id)a3;
- (unint64_t)relativePageIndexForStorageAnchor:(id)a3;
- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3;
- (void)clearCTCaches;
- (void)dealloc;
- (void)ensureLayoutThroughRect:(CGRect)a3 pad:(int)a4;
- (void)ensureLayoutThroughRelativePageRange:(_NSRange)a3;
- (void)ensureSectionInfosLaidOut:(id)a3 layoutController:(id)a4;
- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double)a4 padBelow:(double)a5 layoutController:(id)a6;
- (void)layoutContentFromBottom:(double)a3 layoutController:(id)a4;
- (void)p_addPagesInRange:(_NSRange)a3 forceLoad:(BOOL)a4;
- (void)p_clearDataForUnusedContentNodes;
- (void)p_ensureDataForContentNodes;
- (void)p_ensureLayoutThroughRect:(CGRect)a3 pad:(int)a4 withLayoutController:(id)a5;
- (void)p_ensureLayoutThroughRelativePageRange:(_NSRange)a3 withLayoutController:(id)a4;
- (void)p_enumerateRelativePageRange:(_NSRange)a3 acrossContentNodesUsingBlock:(id)a4;
- (void)p_updateSectionInfosForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4;
- (void)pageControllerNeedsLayout:(id)a3;
- (void)setCanvasOriginDelta:(CGPoint)a3;
- (void)setCurrentNavigationUnit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPageControllers:(id)a3;
- (void)setPagePositionController:(id)a3;
- (void)setPresentationType:(id)a3;
- (void)setReflowablePaginationController:(id)a3;
- (void)setSearchTargetProvider:(id)a3;
- (void)setSectionInfos:(id)a3;
- (void)teardown;
- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4;
@end

@implementation THSectionController

- (THSectionController)initWithDelegate:(id)a3 pagePositionController:(id)a4 presentationType:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THSectionController;
  v8 = [(THSectionController *)&v10 init];
  if (v8)
  {
    [(THSectionController *)v8 setPageControllers:+[TSUPointerKeyDictionary dictionary]];
    [(THSectionController *)v8 setSectionInfos:+[TSUPointerKeyDictionary dictionary]];
    [(THSectionController *)v8 setDelegate:a3];
    v8->_presentationType = (THPresentationType *)[a5 copy];
    [(THSectionController *)v8 setPagePositionController:a4];
    -[THSectionController setCanvasOriginDelta:](v8, "setCanvasOriginDelta:", CGPointZero.x, CGPointZero.y);
  }
  return v8;
}

- (void)teardown
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(TSUPointerKeyDictionary *)[(THSectionController *)self sectionInfos] allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setPageController:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(THSectionController *)self setCurrentNavigationUnit:0];
  [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] removeAllObjects];
  [(THSectionController *)self setPageControllers:0];
  [(TSUPointerKeyDictionary *)[(THSectionController *)self sectionInfos] removeAllObjects];
  [(THSectionController *)self setSectionInfos:0];
  [(THSectionController *)self setPresentationType:0];
  [(THSectionController *)self setDelegate:0];
  [(THSectionController *)self setPagePositionController:0];
  [(THSectionController *)self setSearchTargetProvider:0];
}

- (void)dealloc
{
  [(THSectionController *)self teardown];
  if ([(THSectionController *)self pageControllers]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:114 description:@"expected nil value for '%s'", "self.pageControllers"];
  }
  if ([(THSectionController *)self pagePositionController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:115 description:@"expected nil value for '%s'", "self.pagePositionController"];
  }
  if ([(THSectionController *)self presentationType]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THSectionController dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"] lineNumber:116 description:[NSString stringWithFormat:@"expected nil value for '%s'", "self.presentationType"]];
  }
  if ([(THSectionController *)self delegate]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THSectionController dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"] lineNumber:117 description:[NSString stringWithFormat:@"expected nil value for '%s'", "self.delegate"];
  }
  if ([(THSectionController *)self sectionInfos]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:118 description:@"expected nil value for '%s'", "self.sectionInfos"];
  }
  if (self->_searchTargetProvider) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THSectionController dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"] lineNumber:119 description:@"expected nil value for '%s'", "_searchTargetProvider"];
  }
  v3.receiver = self;
  v3.super_class = (Class)THSectionController;
  [(THSectionController *)&v3 dealloc];
}

- (unint64_t)pageCount
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(THSectionController *)self currentContentNodes];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 += (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * i) pageCountForPresentationType:[self presentationType]];
    }
    id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (void)p_enumerateRelativePageRange:(_NSRange)a3 acrossContentNodesUsingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = [(THSectionController *)self currentContentNodes];
  id v8 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(obj);
      }
      long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
      unint64_t v13 = [v12 pageCountForPresentationType:[self presentationType]];
      NSUInteger v14 = length + location;
      if (length + location >= v13) {
        NSUInteger v14 = v13;
      }
      NSUInteger v15 = v14 - location;
      NSUInteger v16 = location < v13 ? location : 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v17 = location < v13 ? v15 : 0;
      if (location < v13) {
        NSUInteger location = 0;
      }
      else {
        location -= v13;
      }
      (*((void (**)(id, void *, NSUInteger, NSUInteger))a4 + 2))(a4, v12, v16, v17);
      BOOL v18 = length > v17;
      length -= v17;
      if (!v18) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (void)p_clearDataForUnusedContentNodes
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_58620;
  v13[3] = &unk_457AB0;
  v13[4] = self;
  id v3 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] keysOfEntriesPassingTest:v13];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v7);
        [(-[THSectionController sectionInfos](self, "sectionInfos")) objectForKey:v8 setPageController:0];
        [-[THSectionController pageControllers](self, "pageControllers") objectForKey:v8] teardown;
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
  -[TSUPointerKeyDictionary removeObjectsForKeys:](-[THSectionController pageControllers](self, "pageControllers"), "removeObjectsForKeys:", [v3 allObjects]);
  -[TSUPointerKeyDictionary removeObjectsForKeys:](-[THSectionController sectionInfos](self, "sectionInfos"), "removeObjectsForKeys:", [v3 allObjects]);
  [(THSectionController *)self setSearchTargetProvider:0];
}

- (void)p_ensureDataForContentNodes
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(THSectionController *)self currentContentNodes];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (![(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:v8])
        {
          id v9 = [(THSectionController *)self newPageControllerForContentNode:v8];
          [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] setObject:v9 forUncopiedKey:v8];

          id v10 = [(THSectionController *)self newSectionInfoForContentNode:v8];
          [v10 setPageController:v9];
          [(TSUPointerKeyDictionary *)[(THSectionController *)self sectionInfos] setObject:v10 forUncopiedKey:v8];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (NSArray)currentContentNodes
{
  v2 = [(THSectionController *)self currentNavigationUnit];

  return [(THNavigationUnit *)v2 contentNodes];
}

- (void)setCurrentNavigationUnit:(id)a3
{
  if (self->mCurrentNavigationUnit != a3)
  {
    id v5 = a3;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [a3 contentNodes];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) retainBodies];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v11 = [(THNavigationUnit *)self->mCurrentNavigationUnit contentNodes];
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        NSUInteger v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) releaseBodies];
          NSUInteger v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }

    self->mCurrentNavigationUnit = (THNavigationUnit *)a3;
    [(THSectionController *)self p_clearDataForUnusedContentNodes];
    [(THSectionController *)self p_ensureDataForContentNodes];
  }
}

- (void)setPresentationType:(id)a3
{
  if (a3)
  {
    if ((objc_msgSend(a3, "isEqualIncludingSize:", -[THSectionController presentationType](self, "presentationType")) & 1) == 0&& objc_msgSend(a3, "isPaginated")&& -[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))
    {

      self->_presentationType = (THPresentationType *)[a3 copyFixingSize];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] allValues];
      id v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v25;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * i) setPresentationType:a3];
          }
          id v7 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v7);
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [(THNavigationUnit *)self->mCurrentNavigationUnit contentNodes];
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) waitUntilFinishedLoadingAndPaginating];
          }
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v12);
      }
    }
  }
  else
  {

    self->_presentationType = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] allValues];
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (k = 0; k != v17; k = (char *)k + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * (void)k) setPresentationType:0];
        }
        id v17 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v17);
    }
  }
}

- (id)pageControllerForContentNode:(id)a3
{
  if (a3)
  {
    id v4 = [(THSectionController *)self pageControllers];
    return [(TSUPointerKeyDictionary *)v4 objectForKey:a3];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController pageControllerForContentNode:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:292 description:@"invalid nil value for '%s'", "contentNode"];
    return 0;
  }
}

- (CGSize)pageSize
{
  v2 = [(THSectionController *)self presentationType];

  [(THPresentationType *)v2 pageSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)preferredCanvasSize
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(THSectionController *)self currentContentNodes];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(THSectionController *)self sectionSizeForContentNode:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        [v3 addObject:[NSValue valueWithCGSize:]];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(THPagePositionController *)[(THSectionController *)self pagePositionController] sequentialSizeFromPageSizes:v3];
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)shouldEnablePaging
{
  v2 = [(THSectionController *)self pagePositionController];

  return [(THPagePositionController *)v2 shouldEnablePaging];
}

- (BOOL)p_showingPagesInNodeContainingRelativePageIndex:(unint64_t)a3
{
  id v4 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] contentNodeForRelativePageIndex:a3 forPresentationType:[(THSectionController *)self presentationType]];
  if (v4) {
    id v4 = [(TSUPointerKeyDictionary *)[(THSectionController *)self sectionInfos] objectForKey:v4];
  }
  return [[v4 pages] count] != 0;
}

- (void)p_addPagesInRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_58F24;
  v4[3] = &unk_457B28;
  v4[4] = self;
  BOOL v5 = a4;
  -[THSectionController p_enumerateRelativePageRange:acrossContentNodesUsingBlock:](self, "p_enumerateRelativePageRange:acrossContentNodesUsingBlock:", a3.location, a3.length, v4);
}

- (void)p_updateSectionInfosForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v16 = 0u;
  long long v17 = 0u;
  if (![(THSectionController *)self shouldEnablePaging])
  {
    length += location;
    NSUInteger location = 0;
  }
  long long v18 = 0uLL;
  long long v19 = 0uLL;
  id v8 = [(TSUPointerKeyDictionary *)[(THSectionController *)self sectionInfos] allValues];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) setPages:[NSArray array]];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  -[THSectionController p_addPagesInRange:forceLoad:](self, "p_addPagesInRange:forceLoad:", location, length, v4);
  [(THSectionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [[-[THSectionController delegate](self, "delegate") additionalVisibleRelativePageIndexesForSectionController:self] mutableCopy];
    [v13 removeIndexesInRange:location, length];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_594B8;
    v14[3] = &unk_457B50;
    v14[4] = self;
    BOOL v15 = v4;
    [v13 enumerateIndexesUsingBlock:v14];
  }
}

- (CGRect)p_expandCanvasRectIfFlow:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (![(THPagePositionController *)[(THSectionController *)self pagePositionController] shouldEnablePaging])
  {
    [(THPagePositionController *)[(THSectionController *)self pagePositionController] pageSize];
    CGFloat v9 = -v8;
    v14.origin.CGFloat x = x;
    v14.origin.double y = y;
    v14.size.CGFloat width = width;
    v14.size.double height = height;
    CGRect v15 = CGRectInset(v14, 0.0, v9);
    CGFloat x = v15.origin.x;
    CGFloat width = v15.size.width;
    *(float *)&v15.origin.CGFloat x = v15.origin.y;
    double y = fmaxf(*(float *)&v15.origin.x, 0.0);
    double height = v15.size.height + v15.origin.y - y;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.CGFloat width = v12;
  result.origin.double y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (id)infosToDisplayForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  -[THSectionController p_updateSectionInfosForRelativePageRange:forceLoad:](self, "p_updateSectionInfosForRelativePageRange:forceLoad:", a3.location, a3.length, a4);
  id v5 = [(TSUPointerKeyDictionary *)[(THSectionController *)self sectionInfos] allValues];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5960C;
  v7[3] = &unk_457B78;
  v7[4] = [(THSectionController *)self currentContentNodes];
  return [v5 sortedArrayUsingComparator:v7];
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3
{
  id v5 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] contentNodeForRelativePageIndex:a3 forPresentationType:[(THSectionController *)self presentationType]];
  unint64_t v6 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] nodeRelativePageIndexInContentNode:v5 forNavigationUnitRelativePageIndex:a3 presentationType:[(THSectionController *)self presentationType]];
  if (v5) {
    id v7 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:v5];
  }
  else {
    id v7 = 0;
  }
  [(THSectionController *)self canvasOriginForPageController:v7];
  [(THPagePositionController *)[(THSectionController *)self pagePositionController] pageOriginForRelativePageIndex:v6];
  TSDAddPoints();
  double v9 = v8;
  double v11 = v10;
  if ([(THSectionControllerDelegate *)[(THSectionController *)self delegate] displaySinglePageChapterSeparately:self]&& [(THSectionControllerDelegate *)[(THSectionController *)self delegate] isTwoUpForSectionController:self]&& (char *)[(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] pageCountForPresentationType:[(THSectionController *)self presentationType]] == (char *)&dword_0 + 1)
  {
    if (v5) {
      id v12 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:v5];
    }
    else {
      id v12 = 0;
    }
    [v12 desiredPageSizeForRelativePageIndex:v6];
    double v14 = v13;
    [(THSectionController *)self sectionSizeForContentNode:v5];
    double v9 = v9 + (v15 - v14) * 0.5;
  }
  double v16 = v9;
  double v17 = v11;
  result.double y = v17;
  result.CGFloat x = v16;
  return result;
}

- (CGRect)canvasRectForRelativePageIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x5012000000;
  double v16 = sub_59944;
  double v17 = nullsub_19;
  long long v18 = &unk_41622E;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v20 = size;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_59954;
  v12[3] = &unk_457BA0;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a3;
  objc_msgSend(objc_msgSend(-[THSectionControllerDelegate documentRootForSectionController:](-[THSectionController delegate](self, "delegate"), "documentRootForSectionController:", self), "accessController"), "performRead:", v12);
  double v4 = v14[6];
  double v5 = v14[7];
  double v6 = v14[8];
  double v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.double height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (unint64_t)relativePageIndexForContentNode:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(THSectionController *)self currentContentNodes];
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  unint64_t v8 = 0;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(v5);
    }
    id v11 = *(id *)(*((void *)&v13 + 1) + 8 * v10);
    if (v11 == a3) {
      return v8;
    }
    v8 += (unint64_t)[v11 pageCountForPresentationType:[self presentationType]];
    if (v7 == (id)++v10)
    {
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return v8;
    }
  }
}

- (CGPoint)sectionOriginForContentNode:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(THSectionController *)self currentContentNodes];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      if (*(id *)(*((void *)&v13 + 1) + 8 * v10) == a3) {
        break;
      }
      -[THSectionController sectionSizeForContentNode:](self, "sectionSizeForContentNode:");
      [v5 addObject:[NSValue valueWithCGSize:]];
      if (v8 == (id)++v10)
      {
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  [(THPagePositionController *)[(THSectionController *)self pagePositionController] sectionOriginWithPrecedingSectionSizes:v5];
  result.double y = v12;
  result.CGFloat x = v11;
  return result;
}

- (TSKSearchTargetProvider)searchTargetProvider
{
  CGPoint result = self->_searchTargetProvider;
  if (!result)
  {
    id v4 = +[NSMutableArray array];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(THSectionController *)self currentContentNodes];
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:[self pageControllerForContentNode:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)]];
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    CGPoint result = (TSKSearchTargetProvider *)[objc_alloc((Class)TSKAggregateSearchTargetProvider) initWithSearchTargetProviders:v4];
    self->_searchTargetProvider = result;
  }
  return result;
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  id v4 = [(THSectionController *)self searchTargetProvider];

  return (unint64_t)[(TSKSearchTargetProvider *)v4 rootSearchTargetCountThroughIndex:a3];
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  id v6 = [(THSectionController *)self searchTargetProvider];

  [(TSKSearchTargetProvider *)v6 withRootSearchTargetAtIndex:a3 executeBlock:a4];
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  long long v10 = [(THSectionController *)self searchTargetProvider];

  return (unint64_t)[(TSKSearchTargetProvider *)v10 nextRootSearchTargetIndexFromIndex:a3 forString:a4 options:a5 inDirection:a6];
}

- (unint64_t)p_relativeSheetIndexFromCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(NSArray *)[(THSectionController *)self currentContentNodes] count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController p_relativeSheetIndexFromCanvasPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:549 description:@"Asking for page of canvas point, but there aren't any content nodes"];
  }
  if (![(NSArray *)[(THSectionController *)self currentContentNodes] count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v6 = [(THPagePositionController *)[(THSectionController *)self pagePositionController] pageHorizontally];
  [(THPagePositionController *)[(THSectionController *)self pagePositionController] pageSize];
  float v7 = y;
  double v8 = fmaxf(v7, 0.0);
  double v10 = v9 * 0.5;
  float v11 = x;
  double v12 = fmaxf(v11, 0.0);
  double v14 = v13 * 0.5;
  if (v6) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
  if (v6) {
    double v16 = v14;
  }
  else {
    double v16 = v8;
  }
  id v17 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v18 = [(THSectionController *)self currentContentNodes];
  id v19 = [(NSArray *)v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v18);
        }
        long long v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [(THSectionController *)self sectionSizeForContentNode:v24];
        double v26 = v25;
        double v28 = v27;
        [(THPagePositionController *)[(THSectionController *)self pagePositionController] sectionOriginWithPrecedingSectionSizes:v17];
        double v30 = v29;
        double v32 = v31;
        unint64_t v33 = [v24 pageCountForPresentationType:[self presentationType]];
        v45.origin.double x = v30;
        v45.origin.double y = v32;
        v45.size.CGFloat width = v26;
        v45.size.double height = v28;
        v44.double x = v15;
        v44.double y = v16;
        if (CGRectContainsPoint(v45, v44))
        {
          unint64_t v35 = -[THPagePositionController relativePageIndexFromCanvasPoint:]([(THSectionController *)self pagePositionController], "relativePageIndexFromCanvasPoint:", v15 - v30, v16 - v32);
          v36 = (char *)(v33 - 1);
          if (v35 < v33 - 1) {
            v36 = (char *)v35;
          }
          return (unint64_t)&v36[v21];
        }
        v21 += v33;
        [v17 addObject:[NSValue valueWithCGSize:v26, v28]];
      }
      id v20 = [(NSArray *)v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v20) {
        continue;
      }
      break;
    }
    uint64_t v34 = ~v33;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v34 = -1;
  }
  id v38 = [[-[NSArray lastObject](-[THSectionController currentContentNodes](self, "currentContentNodes"), "lastObject") pageCountForPresentationType:][THSectionController presentationType](self, "presentationType")];
  if (!v38) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController p_relativeSheetIndexFromCanvasPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:591 description:@"Content node with no pages"];
  }
  return (unint64_t)v38 + v21 + v34;
}

- (_NSRange)relativePageRangeForCanvasRect:(CGRect)a3 pad:(int)a4
{
  char v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    -[THSectionController p_expandCanvasRectIfFlow:](self, "p_expandCanvasRectIfFlow:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    double x = v10;
    double y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
  }
  unint64_t v14 = -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", x, y);
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMaxX(v26) + -0.01;
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  unint64_t v16 = -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", v15, CGRectGetMaxY(v27) + -0.01);
  unint64_t v17 = [(THSectionController *)self pageCount];
  unint64_t v18 = v17;
  if (v16 <= v14) {
    unint64_t v19 = v14;
  }
  else {
    unint64_t v19 = v16;
  }
  if (v19 >= v17) {
    unint64_t v20 = v17 - 1;
  }
  else {
    unint64_t v20 = v19;
  }
  if (v14 >= v20) {
    unint64_t v14 = v20;
  }
  [(THSectionController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THSectionControllerDelegate *)[(THSectionController *)self delegate] sectionControllerNumberOfPagesDisplayed:self])
  {
    id v21 = [(THSectionControllerDelegate *)[(THSectionController *)self delegate] sectionControllerNumberOfPagesDisplayed:self];
  }
  else
  {
    id v21 = &dword_0 + 1;
  }
  uint64_t v22 = v20 - v14 + 1;
  if (v4) {
    unint64_t v14 = THRangeExtendBackward(v14, v22, (unint64_t)v21);
  }
  NSUInteger v23 = v14;
  if ((v4 & 2) != 0)
  {
    NSUInteger v23 = THRangeExtendForward(v14, v22, (uint64_t)v21, v18);
  }
  result.NSUInteger length = v22;
  result.NSUInteger location = v23;
  return result;
}

- (void)p_ensureLayoutThroughRelativePageRange:(_NSRange)a3 withLayoutController:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5A418;
  v4[3] = &unk_457BC8;
  v4[4] = self;
  void v4[5] = a4;
  -[THSectionController p_enumerateRelativePageRange:acrossContentNodesUsingBlock:](self, "p_enumerateRelativePageRange:acrossContentNodesUsingBlock:", a3.location, a3.length, v4);
}

- (void)p_ensureLayoutThroughRect:(CGRect)a3 pad:(int)a4 withLayoutController:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(THSectionController *)self currentContentNodes])
  {
    id v13 = -[THSectionController relativePageRangeForCanvasRect:pad:](self, "relativePageRangeForCanvasRect:pad:", v6, x, y, width, height);
    -[THSectionController p_ensureLayoutThroughRelativePageRange:withLayoutController:](self, "p_ensureLayoutThroughRelativePageRange:withLayoutController:", v13, v12, a5);
  }
}

- (void)ensureLayoutThroughRelativePageRange:(_NSRange)a3
{
}

- (void)ensureLayoutThroughRect:(CGRect)a3 pad:(int)a4
{
}

- (void)ensureSectionInfosLaidOut:(id)a3 layoutController:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [v10 lastPage];
        if (v11) {
          objc_msgSend(objc_msgSend(v10, "pageController"), "layoutThroughRelativePageIndex:layoutController:", objc_msgSend(v11, "relativePageIndexInParent"), a4);
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (unint64_t)mostVisibleAbsolutePageIndexForCanvasBoundsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController mostVisibleAbsolutePageIndexForCanvasBoundsRect:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:686 description:@"Page number calculations performed in flow mode may be incorrect."; {
  v12.origin.CGFloat x = x;
  }
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v13);

  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", MidX, MidY);
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3
{
  id v5 = [(THSectionController *)self currentNavigationUnit];
  id v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 relativePageIndexForAbsolutePageIndex:a3 forPresentationType:v6];
}

- (id)displaySectionInfoForRelativePageIndex:(unint64_t)a3
{
  id v5 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] pageInfoForRelativePageIndex:a3 forPresentationType:[(THSectionController *)self presentationType]];
  if ([v5 parent])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController displaySectionInfoForRelativePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:697 description:@"invalid nil value for '%s'", "pageInfo.parent"];
    if (v5) {
      goto LABEL_3;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController displaySectionInfoForRelativePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:698 description:@"No page info found for navigation unit relative page %lu" a3];
LABEL_3:
  id v6 = objc_alloc_init(THSectionInfo);
  if ([v5 parent]) {
    id v7 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", [v5 parent]);
  }
  else {
    id v7 = 0;
  }
  [(THSectionInfo *)v6 setPageController:v7];
  if (v5) {
    uint64_t v8 = +[NSArray arrayWithObject:v5];
  }
  else {
    uint64_t v8 = +[NSArray array];
  }
  [(THSectionInfo *)v6 setPages:v8];
  [(THSectionInfo *)v6 setAnchorAtOrigin:1];
  -[THSectionController p_ensureLayoutThroughRelativePageRange:withLayoutController:](self, "p_ensureLayoutThroughRelativePageRange:withLayoutController:", a3, 1, 0);

  return v6;
}

- (CGRect)sectionRelativeCanvasRectForRelativePageIndex:(unint64_t)a3
{
  -[THSectionController canvasRectForRelativePageIndex:](self, "canvasRectForRelativePageIndex:");
  double v6 = v5;
  double v8 = v7;
  [(THSectionController *)self sectionOriginForContentNode:[(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] contentNodeForRelativePageIndex:a3 forPresentationType:[(THSectionController *)self presentationType]]];
  TSDSubtractPoints();
  double v11 = v6;
  double v12 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (unint64_t)_navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3
{
  [a3 visibleUnscaledRect];

  return (unint64_t)-[THSectionController relativePageRangeForCanvasRect:pad:](self, "relativePageRangeForCanvasRect:pad:", 0);
}

- (unint64_t)absolutePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 absolutePageIndexForRelativePageIndex:v4 forPresentationType:v6];
}

- (unint64_t)_navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController _navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:734 description:@"Page number calculations performed in flow mode may be incorrect."]; {
  [a3 visibleUnscaledRect];
  }
  TSDCenterOfRect();
  TSDRectWithOriginAndSize();
  TSDCenterOfRect();

  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:");
}

- (unint64_t)absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 absolutePageIndexForRelativePageIndex:v4 forPresentationType:v6];
}

- (unint64_t)_navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController _navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:756 description:@"Page number calculations performed in flow mode may be incorrect."]; {
  [a3 visibleUnscaledRect];
  }
  TSDCenterOfRect();
  TSDRectWithOriginAndSize();
  TSDCenterOfRect();

  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:");
}

- (unint64_t)absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 absolutePageIndexForRelativePageIndex:v4 forPresentationType:v6];
}

- (unint64_t)_navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:(id)a3
{
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController _navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:780 description:@"Page number calculations performed in flow mode may be incorrect."]; {
  [a3 visibleUnscaledRect];
  }
  [(THSectionControllerDelegate *)[(THSectionController *)self delegate] isTwoUpForSectionController:self];
  TSDCenterOfRect();

  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:");
}

- (unint64_t)absolutePageIndexForCenterOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 absolutePageIndexForRelativePageIndex:v4 forPresentationType:v6];
}

- (id)pageInfoForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 pageInfoForRelativePageIndex:v4 forPresentationType:v6];
}

- (id)pageInfoForCenterOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 pageInfoForRelativePageIndex:v4 forPresentationType:v6];
}

- (id)pageInfoForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 pageInfoForRelativePageIndex:v4 forPresentationType:v6];
}

- (id)pageInfoForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THSectionController *)self _navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:a3];
  double v5 = [(THSectionController *)self currentNavigationUnit];
  double v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 pageInfoForRelativePageIndex:v4 forPresentationType:v6];
}

- (id)bodyAnchorForCanvasRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = -[THSectionController relativePageRangeForCanvasRect:pad:](self, "relativePageRangeForCanvasRect:pad:", 0);
  id v9 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] contentNodeForRelativePageIndex:v8 forPresentationType:[(THSectionController *)self presentationType]];
  unint64_t v10 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] nodeRelativePageIndexInContentNode:v9 forNavigationUnitRelativePageIndex:v8 presentationType:[(THSectionController *)self presentationType]];
  if (v9) {
    id v11 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:v9];
  }
  else {
    id v11 = 0;
  }
  [(THSectionController *)self canvasRectForRelativePageIndex:v8];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v11 desiredPageSizeForRelativePageIndex:v10];
  v21.size.CGFloat width = v16;
  v21.size.CGFloat height = v17;
  v21.origin.CGFloat x = v13;
  v21.origin.CGFloat y = v15;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRectIntersection(v21, v22);
  TSDSubtractPoints();
  unint64_t v18 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", v9, objc_msgSend(v9, "nodeUniqueIDForInfo:forPresentationType:", objc_msgSend(v9, "bodyStorageForPresentationType:", -[THSectionController presentationType](self, "presentationType")), -[THSectionController presentationType](self, "presentationType")), objc_msgSend(v11, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:", v10), 1);

  return v18;
}

- (CGRect)rectForBodyAnchor:(id)a3
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  id v9 = [a3 contentNode];
  [v9 waitUntilFinishedLoadingAndPaginating];
  if (v9) {
    id v10 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:v9];
  }
  else {
    id v10 = 0;
  }
  id v11 = [v10 relativePageIndexForCharIndex:[a3 range] forceLayout:1];
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v11;
    if ([(THPagePositionController *)[(THSectionController *)self pagePositionController] shouldEnablePaging])
    {
      unint64_t v13 = [(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] navUnitRelativePageIndexForContentNode:v9 forContentNodeRelativePageIndex:v12 presentationType:[(THSectionController *)self presentationType]];
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(THSectionController *)self canvasRectForRelativePageIndex:v13];
        CGFloat x = v14;
        CGFloat y = v15;
        CGFloat width = v16;
        CGFloat height = v17;
      }
    }
    else
    {
      [v10 originOfCharacterIndex:[a3 range] forRelativePageIndex:v12];
      [(THSectionController *)self canvasOriginForPageController:v10];
      TSDAddPoints();
      CGFloat x = v18;
      CGFloat y = v19;
      [(THPagePositionController *)[(THSectionController *)self pagePositionController] pageSize];
      CGFloat width = v20;
      CGFloat height = v21;
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)rectForContentNode:(id)a3 layout:(id)a4
{
  [(THSectionController *)self canvasOriginForPageController:[(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:a3]];
  objc_msgSend(objc_msgSend(a4, "geometry"), "frame");
  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
  if (!CGRectIsNull(v16))
  {
    TSDAddPoints();
    CGFloat x = v8;
    CGFloat y = v9;
  }
  [(THPagePositionController *)[(THSectionController *)self pagePositionController] pageSize];
  double v11 = v10;
  double v13 = v12;
  double v14 = x;
  double v15 = y;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (unint64_t)absolutePageIndexForBodyStorageAnchor:(id)a3
{
  id v5 = [a3 contentNode];
  if (v5) {
    id v6 = [(TSUPointerKeyDictionary *)[(THSectionController *)self pageControllers] objectForKey:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = [v6 relativePageIndexForCharIndex:[a3 range] forceLayout:1];
  double v8 = [(THSectionController *)self presentationType];

  return (unint64_t)[v5 absolutePageIndexForRelativePageIndex:v7 forPresentationType:v8];
}

- (unint64_t)relativePageIndexForBodyStorageAnchor:(id)a3
{
  unint64_t v4 = [(THSectionController *)self absolutePageIndexForBodyStorageAnchor:a3];
  id v5 = [(THSectionController *)self currentNavigationUnit];
  id v6 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v5 relativePageIndexForAbsolutePageIndex:v4 forPresentationType:v6];
}

- (unint64_t)relativePageIndexForStorageAnchor:(id)a3
{
  id v5 = [a3 contentNode];
  objc_opt_class();
  objc_msgSend(v5, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), -[THSectionController presentationType](self, "presentationType"));
  id v6 = (id)TSUDynamicCast();
  if (!v6) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController relativePageIndexForStorageAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:937 description:@"failed to find storage with anchor's ID"];
  }
  if (v6 == [v5 bodyStorageForPresentationType:[self presentationType]])unint64_t v7 = [self relativePageIndexForBodyStorageAnchor:a3]; {
  else
  }
    unint64_t v7 = -[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", objc_msgSend(v5, "relativePageIndexForInfo:forPresentationType:", v6, -[THSectionController presentationType](self, "presentationType")), -[THSectionController presentationType](self, "presentationType")), -[THSectionController presentationType](self, "presentationType"));
  unint64_t v8 = v7;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:] file:+[NSString stringWithUTF8String:] lineNumber:946 description:@"failed to find page number for storage anchor"];
  }
  return v8;
}

- (id)p_contentNodeForBodyStorage:(id)a3 forceLoad:(BOOL)a4
{
  BOOL v4 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v7 = [(THSectionController *)self currentContentNodes];
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v17;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(v7);
    }
    double v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
    double v13 = [(THSectionController *)self presentationType];
    id v14 = v4
        ? [v12 bodyStorageForPresentationType:v13]
        : objc_msgSend(objc_msgSend(v12, "nodeBodyForPresentationType:", v13), "bodyStorage");
    if (v14 == a3) {
      return v12;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (unint64_t)relativePageIndexForBodyStorage:(id)a3 charIndex:(unint64_t)a4
{
  return [(THSectionController *)self relativePageIndexForBodyStorage:a3 charIndex:a4 forceLoad:1];
}

- (unint64_t)relativePageIndexForBodyStorage:(id)a3 charIndex:(unint64_t)a4 forceLoad:(BOOL)a5
{
  id v7 = [(THSectionController *)self p_contentNodeForBodyStorage:a3 forceLoad:a5];
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = v7;
  id v9 = [[self pageControllerForContentNode:v7] relativePageIndexForCharIndex:a4 forceLayout:1];
  uint64_t v10 = [(THSectionController *)self currentNavigationUnit];
  uint64_t v11 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v10 navUnitRelativePageIndexForContentNode:v8 forContentNodeRelativePageIndex:v9 presentationType:v11];
}

- (id)bodyInfoForStorage:(id)a3 charIndex:(unint64_t)a4
{
  id result = [(THSectionController *)self p_contentNodeForBodyStorage:a3 forceLoad:1];
  if (result)
  {
    id v7 = [(THSectionController *)self pageControllerForContentNode:result];
    return [v7 bodyInfoForCharIndex:a4 forceLayout:1];
  }
  return result;
}

- (id)bodyInfoForStorage:(id)a3 anchoredCharIndex:(unint64_t)a4
{
  id result = [(THSectionController *)self p_contentNodeForBodyStorage:a3 forceLoad:1];
  if (result)
  {
    id v7 = [(THSectionController *)self pageControllerForContentNode:result];
    return [v7 bodyInfoForAnchoredCharIndex:a4 forceLayout:1];
  }
  return result;
}

- (id)newPageControllerForContentNode:(id)a3
{
  id v5 = [THPaginatedPageController alloc];
  id v6 = [(THSectionController *)self reflowablePaginationController];
  id v7 = [(THSectionController *)self presentationType];

  return [(THPaginatedPageController *)v5 initWithDelegate:self contentNode:a3 paginationController:v6 presentationType:v7];
}

- (id)newSectionInfoForContentNode:(id)a3
{
  return objc_alloc_init(THSectionInfo);
}

- (CGSize)sectionSizeForContentNode:(id)a3
{
  id v5 = [a3 pageCountForPresentationType:[self presentationType]];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [a3 startLoading];
    [a3 waitUntilFinishedLoadingAndPaginating];
    id v5 = [a3 pageCountForPresentationType:[self presentationType]];
  }
  [(THPagePositionController *)[(THSectionController *)self pagePositionController] canvasSizeForPageCount:v5];
  double v7 = v6;
  double v9 = v8;
  if ([(THSectionControllerDelegate *)[(THSectionController *)self delegate] displaySinglePageChapterSeparately:self]&& [(THSectionControllerDelegate *)[(THSectionController *)self delegate] isTwoUpForSectionController:self]&& (char *)[(THNavigationUnit *)[(THSectionController *)self currentNavigationUnit] pageCountForPresentationType:[(THSectionController *)self presentationType]] == (char *)&dword_0 + 1)
  {
    double v7 = v7 + v7;
  }
  double v10 = v7;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (id)p_contentNodeForRelativePageIndex:(unint64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(THSectionController *)self currentContentNodes];
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      unint64_t v11 = [v10 pageCountForPresentationType:[self presentationType]];
      BOOL v12 = a3 >= v11;
      a3 -= v11;
      if (!v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController p_contentNodeForRelativePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:1071 description:@"Requested content node for out of bounds page index"];
    return 0;
  }
  return v10;
}

- (id)accessControllerForPageController:(id)a3
{
  id v3 = [(THSectionControllerDelegate *)[(THSectionController *)self delegate] documentRootForSectionController:self];

  return [v3 accessController];
}

- (void)pageControllerNeedsLayout:(id)a3
{
  BOOL v4 = [(THSectionController *)self delegate];

  [(THSectionControllerDelegate *)v4 sectionControllerNeedsLayout:self];
}

- (CGPoint)canvasOriginForPageController:(id)a3
{
  id v4 = [a3 contentNode];

  [(THSectionController *)self sectionOriginForContentNode:v4];
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (BOOL)isCompactFlowPresentationForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 isCompactFlowPresentationForSectionController:self];
}

- (unint64_t)pageCountForNavigationUnitForPageController:(id)a3
{
  id v4 = [(THSectionController *)self currentNavigationUnit];
  double v5 = [(THSectionController *)self presentationType];

  return [(THNavigationUnit *)v4 pageCountForPresentationType:v5];
}

- (BOOL)displaySinglePageChapterSeparatelyForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 displaySinglePageChapterSeparately:self];
}

- (BOOL)isTwoUpForNavigationUnitForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 isTwoUpForSectionController:self];
}

- (unint64_t)pageCountForPageController:(id)a3 presentationType:(id)a4
{
  id v5 = [a3 contentNode];

  return (unint64_t)[v5 pageCountForPresentationType:a4];
}

- (id)bodyStorageForPageController:(id)a3 presentationType:(id)a4
{
  id v5 = [a3 contentNode];

  return [v5 bodyStorageForPresentationType:a4];
}

- (id)pageInfoForPageController:(id)a3 pageIndex:(unint64_t)a4 presentationType:(id)a5
{
  id v7 = [a3 contentNode];

  return [v7 pageAtRelativeIndex:a4 forPresentationType:a5];
}

- (id)layoutControllerForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 layoutControllerForSectionController:self];
}

- (BOOL)pageController:(id)a3 needsAnnotationSourceForLayout:(id)a4
{
  return 1;
}

- (BOOL)allowsDescendersToClipForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 allowsDescendersToClipForSectionController:self];
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 shouldAllowFinishingPartionedAttachmentLayoutForSectionController:self];
}

- (BOOL)shouldScaleFlowLayoutsForPageController:(id)a3
{
  id v4 = [(THSectionController *)self delegate];

  return [(THSectionControllerDelegate *)v4 shouldScaleFlowLayoutsForSectionController:self];
}

- (CGPoint)canvasOriginDeltaForPageController:(id)a3
{
  double x = self->_canvasOriginDelta.x;
  double y = self->_canvasOriginDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)layoutAnchorForContentOffset:(CGPoint)a3
{
  return 0;
}

- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double)a4 padBelow:(double)a5 layoutController:(id)a6
{
  id v6 = +[TSUAssertionHandler currentHandler];
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:]");
  uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"];

  [v6 handleFailureInFunction:v7 file:v8 lineNumber:1163 description:@"layout anchors aren't supported by paginated section controller"];
}

- (void)layoutContentFromBottom:(double)a3 layoutController:(id)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController layoutContentFromBottom:layoutController:]");
  id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:1167 description:@"layout from bottom isn't supported by paginated section controller"];
}

- (_NSRange)firstLineInRect:(CGRect)a3 forBodyAnchor:(id)a4
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController firstLineInRect:forBodyAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm") lineNumber:1171 description:@"not for use by paginated section controller"];
  NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v5 = 0;
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (void)clearCTCaches
{
  v2 = [(THSectionController *)self pageControllers];

  [(TSUPointerKeyDictionary *)v2 enumerateKeysAndObjectsUsingBlock:&stru_457C08];
}

- (THNavigationUnit)currentNavigationUnit
{
  return self->mCurrentNavigationUnit;
}

- (TSUPointerKeyDictionary)pageControllers
{
  return self->mPageControllers;
}

- (void)setPageControllers:(id)a3
{
}

- (TSUPointerKeyDictionary)sectionInfos
{
  return self->mSectionInfos;
}

- (void)setSectionInfos:(id)a3
{
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (THSectionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THSectionControllerDelegate *)a3;
}

- (CGPoint)canvasOriginDelta
{
  double x = self->_canvasOriginDelta.x;
  double y = self->_canvasOriginDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCanvasOriginDelta:(CGPoint)a3
{
  self->_canvasOriginDelta = a3;
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  self->_reflowablePaginationController = (THReflowablePaginationController *)a3;
}

- (THPagePositionController)pagePositionController
{
  return self->_pagePositionController;
}

- (void)setPagePositionController:(id)a3
{
}

- (void)setSearchTargetProvider:(id)a3
{
}

@end