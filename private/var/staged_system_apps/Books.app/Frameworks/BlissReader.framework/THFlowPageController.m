@interface THFlowPageController
- (BOOL)allowsDescendersToClip;
- (BOOL)cachedPageLayoutValidated;
- (BOOL)needsAnnotationSourceForLayout:(id)a3;
- (BOOL)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 originalContentOffset:(CGPoint)a5 targetContentOffset:(CGPoint *)a6;
- (CGPoint)originOfCharacterIndex:(unint64_t)a3 forRelativePageIndex:(unint64_t)a4;
- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3 pageFrame:(CGRect)a4;
- (CGRect)i_rectForBodyIndex:(unint64_t)a3;
- (CGRect)i_rectForPageLayout;
- (CGRect)i_rectForSectionLayout;
- (CGRect)p_overriddenBodyFrame;
- (CGRect)rectForAnchor;
- (CGSize)desiredPageSizeForRelativePageIndex:(unint64_t)a3;
- (CGSize)widgetStackMaxContainerSizeForSize:(CGSize)a3;
- (THFlowPageController)initWithDelegate:(id)a3 layoutObserver:(id)a4 contentNode:(id)a5 presentationType:(id)a6;
- (THModelBodyTextInfo)bodyInfo;
- (THModelContentNode)contentNode;
- (THModelFlowPageInfo)pageInfo;
- (THModelStorageAnchor)cachedAnchorForRect;
- (THPageControllerDelegate)delegate;
- (THPagePositionController)pagePositionController;
- (THPresentationType)presentationType;
- (_NSRange)firstLineInRect:(CGRect)a3 fromCharIndex:(unint64_t)a4;
- (_NSRange)i_textRangeForBodyIndex:(unint64_t)a3;
- (const)i_topicHintsAfterPageIndex:(unint64_t)a3;
- (const)i_topicHintsPriorToPageIndex:(unint64_t)a3;
- (double)bodyOffset;
- (double)bodyTopAtIndex:(unint64_t)a3;
- (double)i_gutterOverhang;
- (id).cxx_construct;
- (id)bodyAnchorForRect:(CGRect)a3;
- (id)bodyAnchorForRect:(CGRect)a3 onMissReturnClosestBody:(BOOL)a4;
- (id)bodyInfoForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (id)bodyInfoForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (id)i_columnAfterPageIndex:(unint64_t)a3;
- (id)i_columnPriorToPageIndex:(unint64_t)a3;
- (id)i_firstChildHintAfterPageIndex:(unint64_t)a3;
- (id)i_infoForBodyIndex:(unint64_t)a3;
- (id)i_pageHintForPageIndex:(unint64_t)a3;
- (id)pageInfoForRelativePageIndex:(unint64_t)a3;
- (unint64_t)bodyIndexClosestToPoint:(CGPoint)a3;
- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4;
- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4 onMissReturnClosestBody:(BOOL)a5;
- (unint64_t)i_bodyCount;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)pageCount;
- (unint64_t)relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (unint64_t)relativePageIndexForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3;
- (void)dealloc;
- (void)i_inflateColumnsInBodyLayout:(id)a3;
- (void)i_registerPageLayout:(id)a3;
- (void)i_setGutterOverhang:(double)a3;
- (void)i_setHeight:(double)a3 forBodyIndex:(unint64_t)a4;
- (void)i_setPageHintSize:(CGSize)a3 forRelativePageIndex:(unint64_t)a4;
- (void)i_trimPageAtIndex:(unint64_t)a3 toCharIndex:(unint64_t)a4 inTarget:(id)a5 removeAutoNumberFootnoteCount:(unint64_t)a6;
- (void)i_unregisterPageLayout:(id)a3;
- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double *)a4 padBelow:(double *)a5;
- (void)layoutContentFromBottom:(double *)a3;
- (void)layoutContentFromTop:(double *)a3;
- (void)p_ensureLoaded;
- (void)p_withPageLayoutPerformBlock:(id)a3;
- (void)prepareForLayout;
- (void)setCachedAnchorForRect:(id)a3;
- (void)setCachedPageLayoutValidated:(BOOL)a3;
- (void)setContentNode:(id)a3;
- (void)setPresentationType:(id)a3;
- (void)setRectForAnchor:(CGRect)a3;
- (void)teardown;
- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4;
@end

@implementation THFlowPageController

- (THFlowPageController)initWithDelegate:(id)a3 layoutObserver:(id)a4 contentNode:(id)a5 presentationType:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)THFlowPageController;
  v10 = [(THFlowPageController *)&v14 init];
  if (v10)
  {
    if ([a5 pageCountForPresentationType:a6] != (char *)&dword_0 + 1) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController initWithDelegate:layoutObserver:contentNode:presentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:84 description:@"flow mode only supports one page per section"];
    }
    v10->_delegate = (THPageControllerDelegate *)a3;
    v10->_layoutObserver = (THFlowLayoutObserver *)a4;
    v10->_contentNode = (THModelContentNode *)a5;
    v10->_presentationType = (THPresentationType *)a6;
    v10->_drawablesLayoutController = [[THOffscreenLayoutController alloc] initWithCanvas:0];
    [(THOffscreenLayoutController *)v10->_drawablesLayoutController setLayoutIsCompactWidth:[(THPresentationType *)[(THFlowPageController *)v10 presentationType] isCompactWidth]];
    [(THOffscreenLayoutController *)v10->_drawablesLayoutController setLayoutIsCompactHeight:[(THPresentationType *)[(THFlowPageController *)v10 presentationType] isCompactHeight]];
    [(THOffscreenLayoutController *)v10->_drawablesLayoutController setDelegate:v10];
    v11 = objc_alloc_init(THSectionInfo);
    v10->_offscreenSectionInfo = v11;
    [(THSectionInfo *)v11 setPageController:v10];
    CGSize size = CGRectZero.size;
    v10->_rectForAnchor.origin = CGRectZero.origin;
    v10->_rectForAnchor.CGSize size = size;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_delegate
    || self->_drawablesLayoutController
    || self->_offscreenSectionInfo
    || self->_contentNode
    || self->_pageInfo
    || self->_bodyInfo
    || self->_presentationType)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:108 description:@"should have called -teardown on flow page controller"];
  }

  self->_cachedAnchorForRect = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFlowPageController;
  [(THFlowPageController *)&v3 dealloc];
}

- (CGSize)widgetStackMaxContainerSizeForSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(THPresentationType *)[(THFlowPageController *)self presentationType] pageSize];
  double v6 = fmin(height, v5 + 10.0 * -2.0);
  double v7 = width;
  result.double height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)prepareForLayout
{
  objc_sync_enter(self);
  [(THFlowPageController *)self p_ensureLoaded];

  objc_sync_exit(self);
}

- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double *)a4 padBelow:(double *)a5
{
  objc_sync_enter(self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_11885C;
  v9[3] = &unk_459A78;
  v9[4] = a3;
  v9[5] = a4;
  v9[6] = a5;
  [(THFlowPageController *)self p_withPageLayoutPerformBlock:v9];
  objc_sync_exit(self);
}

- (void)layoutContentFromBottom:(double *)a3
{
  objc_sync_enter(self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1189C4;
  v5[3] = &unk_459A98;
  v5[4] = a3;
  [(THFlowPageController *)self p_withPageLayoutPerformBlock:v5];
  objc_sync_exit(self);
}

- (void)layoutContentFromTop:(double *)a3
{
  objc_sync_enter(self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_118A70;
  v5[3] = &unk_459A98;
  v5[4] = a3;
  [(THFlowPageController *)self p_withPageLayoutPerformBlock:v5];
  objc_sync_exit(self);
}

- (id)bodyAnchorForRect:(CGRect)a3
{
  return -[THFlowPageController bodyAnchorForRect:onMissReturnClosestBody:](self, "bodyAnchorForRect:onMissReturnClosestBody:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)bodyAnchorForRect:(CGRect)a3 onMissReturnClosestBody:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_sync_enter(self);
  [(THFlowPageController *)self rectForAnchor];
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (!CGRectEqualToRect(v15, v16) || ![(THFlowPageController *)self cachedAnchorForRect])
  {
    unint64_t v10 = -[THFlowPageController firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:](self, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:", 0, v4, x, y, width, height);
    id v11 = [(THModelContentNode *)self->_contentNode nodeUniqueIDForInfo:[(THModelBodyTextInfo *)[(THFlowPageController *)self bodyInfo] bodyStorage] forPresentationType:self->_presentationType];

    self->_cachedAnchorForRect = 0;
    self->_cachedAnchorForRect = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", self->_contentNode, v11, v10, 1);
    -[THFlowPageController setRectForAnchor:](self, "setRectForAnchor:", x, y, width, height);
  }
  objc_sync_exit(self);
  v12 = [(THFlowPageController *)self cachedAnchorForRect];

  return v12;
}

- (unint64_t)bodyIndexClosestToPoint:(CGPoint)a3
{
  double y = a3.y;
  [(THFlowPageController *)self bodyOffset];
  double v6 = v5;
  objc_sync_enter(self);
  if (self->_isLoaded)
  {
    begin = self->_bodyHints.__begin_;
    end = self->_bodyHints.__end_;
    if (begin == end)
    {
      unint64_t v9 = 0;
    }
    else
    {
      unint64_t v9 = 0;
      unint64_t v10 = self->_bodyHints.__begin_;
      do
      {
        if (y - v6 < *(double *)v10 + *((double *)v10 + 1)) {
          break;
        }
        ++v9;
        unint64_t v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v10 + 40);
      }
      while (v10 != end);
    }
    unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3) - 1;
    if (v9 >= v12) {
      unint64_t v11 = v12;
    }
    else {
      unint64_t v11 = v9;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  objc_sync_exit(self);
  return v11;
}

- (double)bodyOffset
{
  [(THFlowPageController *)self p_overriddenBodyFrame];
  return v2;
}

- (double)bodyTopAtIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  double v5 = 0.0;
  if (self->_isLoaded)
  {
    begin = self->_bodyHints.__begin_;
    unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
    if (v7 <= a3)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController bodyTopAtIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:226 description:@"invalid body index"];
      begin = self->_bodyHints.__begin_;
      unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
    }
    if (v7 > a3) {
      double v5 = *((double *)begin + 5 * a3);
    }
  }
  objc_sync_exit(self);
  [(THFlowPageController *)self bodyOffset];
  return v5 + v8;
}

- (_NSRange)firstLineInRect:(CGRect)a3 fromCharIndex:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v15 = 0;
  CGRect v16 = &v15;
  uint64_t v17 = 0x4012000000;
  v18 = sub_118F04;
  v19 = nullsub_23;
  v20 = &unk_41622E;
  long long v21 = xmmword_3447B0;
  objc_sync_enter(self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_118F14;
  v14[3] = &unk_459AC0;
  v14[4] = &v15;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  v14[9] = a4;
  [(THFlowPageController *)self p_withPageLayoutPerformBlock:v14];
  objc_sync_exit(self);
  NSUInteger v10 = v16[6];
  NSUInteger v11 = v16[7];
  _Block_object_dispose(&v15, 8);
  NSUInteger v12 = v10;
  NSUInteger v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 originalContentOffset:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y = a4.y;
  if (fabs(a4.y) <= 0.2) {
    return 0;
  }
  double v8 = a5.y;
  [(THPageControllerDelegate *)self->_delegate canvasOriginForPageController:self];
  if (self->_bodyHints.__end_ == self->_bodyHints.__begin_) {
    return 0;
  }
  double v12 = v11;
  CGFloat x = a6->x;
  double v14 = a6->y;
  unint64_t v15 = 1;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    unint64_t v17 = v15 - 1;
    [(THFlowPageController *)self i_rectForBodyIndex:v15 - 1];
    double v19 = v12 + v18;
    double v21 = v20 + v12 + v18;
    if (v19 < v14 && v21 > v14) {
      break;
    }
    if (v21 < v14) {
      uint64_t v23 = v15 - 1;
    }
    else {
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v19 > v14) {
      uint64_t v24 = v15 - 1;
    }
    else {
      uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (y > 0.0) {
      uint64_t v23 = v24;
    }
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v16 = v23;
    }
    if (v15++ >= 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - self->_bodyHints.__begin_) >> 3)) {
      goto LABEL_26;
    }
  }
  if (y < 0.0)
  {
LABEL_28:
    [(THFlowPageController *)self i_rectForBodyIndex:v17];
    double v27 = v12 + v30;
    goto LABEL_29;
  }
  if (y <= 0.0
    || v17 >= 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - self->_bodyHints.__begin_) >> 3) - 1
    || ([(THFlowPageController *)self i_rectForBodyIndex:v15],
        double v27 = v12 + v26,
        [a3 frame],
        v27 >= v8 + v28))
  {
LABEL_26:
    unint64_t v17 = v16;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    goto LABEL_28;
  }
LABEL_29:
  a6->CGFloat x = x;
  a6->double y = v27;
  return 1;
}

- (THPagePositionController)pagePositionController
{
  return (THPagePositionController *)[(THPageControllerDelegate *)self->_delegate pagePositionControllerForPageController:self];
}

- (unint64_t)pageCount
{
  return 1;
}

- (void)teardown
{
  objc_sync_enter(self);
  self->_delegate = 0;
  [(THOffscreenLayoutController *)self->_drawablesLayoutController setDelegate:0];

  self->_drawablesLayoutController = 0;
  self->_offscreenSectionInfo = 0;

  self->_contentNode = 0;
  self->_presentationType = 0;

  self->_pageInfo = 0;
  self->_bodyInfo = 0;
  begin = self->_bodyHints.__begin_;
  end = self->_bodyHints.__end_;
  while (begin != end)
  {

    *((void *)begin + 4) = 0;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 40);
  }

  objc_sync_exit(self);
}

- (id)pageInfoForRelativePageIndex:(unint64_t)a3
{
  if (a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageController pageInfoForRelativePageIndex:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"] lineNumber:379 description:@"only one page in flow mode"];
  }

  return [(THFlowPageController *)self pageInfo];
}

- (id)bodyInfoForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  end = self->_bodyHints.__end_;
  if (end != begin)
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3);
    do
    {
      unint64_t v9 = v8 >> 1;
      NSUInteger v10 = (char *)begin + 40 * (v8 >> 1);
      unint64_t v11 = *((void *)v10 + 3) + *((void *)v10 + 2);
      double v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 40);
      v8 += ~(v8 >> 1);
      if (v11 <= a3) {
        begin = v12;
      }
      else {
        unint64_t v8 = v9;
      }
    }
    while (v8);
  }
  if (begin == end)
  {
    uint64_t v16 = 0;
  }
  else
  {
    unint64_t v13 = *((void *)begin + 2);
    BOOL v15 = a3 >= v13;
    unint64_t v14 = a3 - v13;
    BOOL v15 = !v15 || v14 >= *((void *)begin + 3);
    if (v15) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageController bodyInfoForCharIndex:forceLayout:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"] lineNumber:392 description:@"found the wrong body hint"];
    }
    objc_opt_class();
    uint64_t v16 = (void *)TSUCheckedDynamicCast();
  }
  objc_sync_exit(self);
  return v16;
}

- (id)bodyInfoForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  return [(THFlowPageController *)self bodyInfoForCharIndex:a3 forceLayout:a4];
}

- (unint64_t)relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  return 0;
}

- (unint64_t)relativePageIndexForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  return 0;
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4
{
  return -[THFlowPageController firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:](self, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4 onMissReturnClosestBody:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  objc_sync_enter(self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_11954C;
  v17[3] = &unk_459AE8;
  v17[4] = &v18;
  *(CGFloat *)&v17[5] = x;
  *(CGFloat *)&v17[6] = y;
  *(CGFloat *)&v17[7] = width;
  *(CGFloat *)&v17[8] = height;
  [(THFlowPageController *)self p_withPageLayoutPerformBlock:v17];
  unint64_t v11 = v19;
  uint64_t v12 = v19[3];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_119588;
    v16[3] = &unk_459AE8;
    *(CGFloat *)&v16[5] = x;
    *(CGFloat *)&v16[6] = y;
    *(CGFloat *)&v16[7] = width;
    *(CGFloat *)&v16[8] = height;
    v16[4] = &v18;
    [(THFlowPageController *)self p_withPageLayoutPerformBlock:v16];
    unint64_t v11 = v19;
    uint64_t v12 = v19[3];
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    v11[3] = 0;
  }
  objc_sync_exit(self);
  unint64_t v14 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3 forRelativePageIndex:(unint64_t)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x4012000000;
  unint64_t v14 = sub_1198EC;
  BOOL v15 = nullsub_24;
  uint64_t v16 = &unk_41622E;
  CGPoint v17 = CGPointZero;
  objc_sync_enter(self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1198FC;
  v10[3] = &unk_459B10;
  v10[4] = &v11;
  v10[5] = a3;
  [(THFlowPageController *)self p_withPageLayoutPerformBlock:v10];
  objc_sync_exit(self);
  double v6 = v12[6];
  double v7 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v8 = v6;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGSize)desiredPageSizeForRelativePageIndex:(unint64_t)a3
{
  if (a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController desiredPageSizeForRelativePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:485 description:@"only one page in flow mode"];
  }
  objc_sync_enter(self);
  [(THPagePositionController *)[(THFlowPageController *)self pagePositionController] pageSize];
  double v5 = v4;
  if (self->_isLoaded)
  {
    double v6 = 0.0;
    if ([(THModelFlowPageInfo *)[(THFlowPageController *)self pageInfo] hasBodyFlow]) {
      double v6 = *((double *)self->_bodyHints.__end_ - 5) + *((double *)self->_bodyHints.__end_ - 4);
    }
    [(THFlowPageController *)self bodyOffset];
    double v8 = v7;
    [(THModelPageInfo *)[(THFlowPageController *)self pageInfo] autosizeMargin];
    float v10 = v6 + v8 + v9 + 20.0 + self->_gutterOverhang;
    double v11 = ceilf(v10);
  }
  else
  {
    double v11 = 5000.0;
  }
  objc_sync_exit(self);
  double v12 = v5;
  double v13 = v11;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3 pageFrame:(CGRect)a4
{
  double v5 = [(THFlowPageController *)self pagePositionController];

  [(THPagePositionController *)v5 pageOriginForRelativePageIndex:a3];
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  return 0;
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController withRootSearchTargetAtIndex:executeBlock:]");
  double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:529 description:@"flow page controller can't search yet"];
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  return a3;
}

- (unint64_t)i_bodyCount
{
  objc_sync_enter(self);
  if (!self->_isLoaded) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_bodyCount]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:545 description:@"don't know body count before being loaded"];
  }
  unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - self->_bodyHints.__begin_) >> 3);
  objc_sync_exit(self);
  return v3;
}

- (CGRect)i_rectForBodyIndex:(unint64_t)a3
{
  [(THFlowPageController *)self p_overriddenBodyFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v14 <= a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_rectForBodyIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:557 description:@"no height for this body index"];
    begin = self->_bodyHints.__begin_;
    unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v14 > a3)
  {
    [(THFlowPageController *)self bodyOffset];
    BOOL v15 = (double *)((char *)begin + 40 * a3);
    double v12 = v15[1];
    double v8 = v16 + *v15;
  }
  objc_sync_exit(self);
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)i_setHeight:(double)a3 forBodyIndex:(unint64_t)a4
{
  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v8 <= a4)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_setHeight:forBodyIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:573 description:@"no height for this body index"];
    begin = self->_bodyHints.__begin_;
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v8 > a4)
  {
    double v9 = a3 - *((double *)begin + 5 * a4 + 1);
    if (v9 != 0.0)
    {
      [(THFlowLayoutObserver *)self->_layoutObserver flowPageControllerWillChangeContentHeight:self];
      end = self->_bodyHints.__end_;
      double v11 = (double *)((char *)self->_bodyHints.__begin_ + 40 * a4);
      v11[1] = a3;
      for (i = v11 + 5; i != (double *)end; i += 5)
        double *i = v9 + *i;
    }
  }

  objc_sync_exit(self);
}

- (_NSRange)i_textRangeForBodyIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v6 <= a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_textRangeForBodyIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:598 description:@"no text range for this body index"];
    begin = self->_bodyHints.__begin_;
    unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v6 <= a3)
  {
    NSUInteger v8 = 0;
    NSUInteger v9 = 0;
  }
  else
  {
    double v7 = (char *)begin + 40 * a3;
    NSUInteger v9 = *((void *)v7 + 2);
    NSUInteger v8 = *((void *)v7 + 3);
  }
  objc_sync_exit(self);
  NSUInteger v10 = v9;
  NSUInteger v11 = v8;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)i_infoForBodyIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v6 <= a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_infoForBodyIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:614 description:@"no info for this body index"];
    begin = self->_bodyHints.__begin_;
    unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v6 <= a3) {
    double v7 = 0;
  }
  else {
    double v7 = (void *)*((void *)begin + 5 * a3 + 4);
  }
  objc_sync_exit(self);
  return v7;
}

- (double)i_gutterOverhang
{
  return self->_gutterOverhang;
}

- (void)i_setGutterOverhang:(double)a3
{
  objc_sync_enter(self);
  self->_gutterOverhang = a3;

  objc_sync_exit(self);
}

- (CGRect)i_rectForPageLayout
{
  [(THFlowPageController *)self desiredPageSizeForRelativePageIndex:0];

  TSDRectWithSize();
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (id)i_pageHintForPageIndex:(unint64_t)a3
{
  return 0;
}

- (void)i_setPageHintSize:(CGSize)a3 forRelativePageIndex:(unint64_t)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_setPageHintSize:forRelativePageIndex:]");
  unint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:652 description:@"flow page controller doesn't want to be told the page size"];
}

- (void)i_trimPageAtIndex:(unint64_t)a3 toCharIndex:(unint64_t)a4 inTarget:(id)a5 removeAutoNumberFootnoteCount:(unint64_t)a6
{
  id v6 = +[TSUAssertionHandler currentHandler];
  double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:]");
  NSUInteger v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"];

  [v6 handleFailureInFunction:v7 file:v8 lineNumber:657 description:@"flow page controller doesn't support trimming"];
}

- (id)i_columnPriorToPageIndex:(unint64_t)a3
{
  return 0;
}

- (id)i_firstChildHintAfterPageIndex:(unint64_t)a3
{
  return 0;
}

- (id)i_columnAfterPageIndex:(unint64_t)a3
{
  return 0;
}

- (void)i_inflateColumnsInBodyLayout:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_inflateColumnsInBodyLayout:]");
  double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:680 description:@"flow page controller doesn't support inflation"];
}

- (void)i_registerPageLayout:(id)a3
{
  objc_sync_enter(self);
  double v5 = (THModelFlowPageInfo *)[a3 info];
  if (v5 != [(THFlowPageController *)self pageInfo]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_registerPageLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:686 description:@"page is from different section"];
  }
  cachedPageLayout = self->_cachedPageLayout;
  if (cachedPageLayout
    && (objc_msgSend(-[THFlowPageLayout layoutController](cachedPageLayout, "layoutController"), "isLayoutOffscreen") & 1) == 0)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_registerPageLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:687 description:@"should only have one onscreen layout at a time"];
  }
  if (objc_msgSend(-[THFlowPageLayout layoutController](self->_cachedPageLayout, "layoutController"), "isLayoutOffscreen"))
  {
    [(THOffscreenLayoutController *)self->_drawablesLayoutController setInfos:+[NSArray array]];
    [(THOffscreenLayoutController *)self->_drawablesLayoutController validateLayouts];
  }
  self->_cachedPageLayout = (THFlowPageLayout *)a3;
  [(THFlowPageController *)self setCachedPageLayoutValidated:0];

  objc_sync_exit(self);
}

- (void)i_unregisterPageLayout:(id)a3
{
  objc_sync_enter(self);
  double v5 = (THModelFlowPageInfo *)[a3 info];
  if (v5 != [(THFlowPageController *)self pageInfo]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageController i_unregisterPageLayout:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"] lineNumber:704 description:@"page is from different section"];
  }
  if (self->_cachedPageLayout != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_unregisterPageLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:705 description:@"should only have one page layout at a time"];
  }
  self->_cachedPageLayout = 0;

  self->_cachedAnchorForRect = 0;
  [(THFlowPageController *)self setCachedPageLayoutValidated:0];
  -[THFlowPageController setRectForAnchor:](self, "setRectForAnchor:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  objc_sync_exit(self);
}

- (CGRect)i_rectForSectionLayout
{
  objc_sync_enter(self);
  [(THPageControllerDelegate *)self->_delegate canvasOriginForPageController:self];
  [(THFlowPageController *)self desiredPageSizeForRelativePageIndex:0];
  TSDRectWithOriginAndSize();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_sync_exit(self);
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)needsAnnotationSourceForLayout:(id)a3
{
  return 1;
}

- (BOOL)allowsDescendersToClip
{
  double v3 = [(THFlowPageController *)self delegate];

  return [(THPageControllerDelegate *)v3 allowsDescendersToClipForPageController:self];
}

- (const)i_topicHintsAfterPageIndex:(unint64_t)a3
{
  return 0;
}

- (const)i_topicHintsPriorToPageIndex:(unint64_t)a3
{
  return 0;
}

- (THModelFlowPageInfo)pageInfo
{
  CGRect result = self->_pageInfo;
  if (!result)
  {
    objc_opt_class();
    [(THModelContentNode *)self->_contentNode pageAtRelativeIndex:0 forPresentationType:[(THFlowPageController *)self presentationType]];
    double v4 = (THModelFlowPageInfo *)TSUDynamicCast();
    self->_pageInfo = v4;
    double v5 = v4;
    CGRect result = self->_pageInfo;
    if (!result)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController pageInfo]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:756 description:@"invalid nil value for '%s'", "_pageInfo"];
      return self->_pageInfo;
    }
  }
  return result;
}

- (THModelBodyTextInfo)bodyInfo
{
  CGRect result = self->_bodyInfo;
  if (!result)
  {
    double v4 = [(THModelPageInfo *)[(THFlowPageController *)self pageInfo] modelBodyInfos];
    if ((char *)[(NSArray *)v4 count] != (char *)&dword_0 + 1) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageController bodyInfo]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"] lineNumber:767 description:@"should only have one body info in flow"];
    }
    objc_opt_class();
    [(NSArray *)v4 lastObject];
    double v5 = (THModelBodyTextInfo *)TSUDynamicCast();
    self->_bodyInfo = v5;
    double v6 = v5;
    CGRect result = self->_bodyInfo;
    if (!result)
    {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageController bodyInfo]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"] lineNumber:771 description:@"invalid nil value for '%s'", "_bodyInfo"];
      return self->_bodyInfo;
    }
  }
  return result;
}

- (CGRect)p_overriddenBodyFrame
{
  [(-[THModelBodyTextInfo geometry](-[THFlowPageController bodyInfo](self, "bodyInfo"), "geometry")) boundsBeforeRotation];
  layoutObserver = self->_layoutObserver;

  -[THFlowLayoutObserver flowPageController:overrideForBodyFrame:](layoutObserver, "flowPageController:overrideForBodyFrame:", self);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)p_ensureLoaded
{
  if (!self->_isLoaded)
  {
    double v3 = [(THModelBodyTextInfo *)[(THFlowPageController *)self bodyInfo] bodyStorage];
    double v4 = (char *)[(THWPStorage *)v3 paragraphCount];
    if (v4)
    {
      double v5 = v4;
      unint64_t v6 = 0;
      p_bodyHints = &self->_bodyHints;
      double v8 = 0.0;
      do
      {
        unsigned int v9 = [(THPageControllerDelegate *)[(THFlowPageController *)self delegate] isCompactFlowPresentationForPageController:self];
        unint64_t v10 = 5;
        if (v9) {
          unint64_t v10 = 1;
        }
        if (v10 >= (unint64_t)&v5[-v6]) {
          unint64_t v11 = (unint64_t)&v5[-v6];
        }
        else {
          unint64_t v11 = v10;
        }
        id v12 = -[THWPStorage textRangeForParagraphsInRange:](v3, "textRangeForParagraphsInRange:", v6, v11);
        uint64_t v14 = v13;
        BOOL v15 = [[THFlowBodyChunkInfo alloc] initWithBodyInfo:[(THFlowPageController *)self bodyInfo]];
        double v16 = v15;
        end = self->_bodyHints.__end_;
        value = self->_bodyHints.__end_cap_.__value_;
        if (end >= value)
        {
          unint64_t v20 = 0xCCCCCCCCCCCCCCCDLL * ((end - p_bodyHints->__begin_) >> 3);
          unint64_t v21 = v20 + 1;
          if (v20 + 1 > 0x666666666666666) {
            sub_3D1D0();
          }
          unint64_t v22 = 0xCCCCCCCCCCCCCCCDLL * ((value - p_bodyHints->__begin_) >> 3);
          if (2 * v22 > v21) {
            unint64_t v21 = 2 * v22;
          }
          if (v22 >= 0x333333333333333) {
            unint64_t v23 = 0x666666666666666;
          }
          else {
            unint64_t v23 = v21;
          }
          if (v23) {
            uint64_t v24 = (char *)sub_11AFEC((uint64_t)&self->_bodyHints.__end_cap_, v23);
          }
          else {
            uint64_t v24 = 0;
          }
          v25 = &v24[40 * v20];
          *(double *)v25 = v8;
          *((void *)v25 + 1) = 0x4087700000000000;
          *((void *)v25 + 2) = v12;
          *((void *)v25 + 3) = v14;
          *((void *)v25 + 4) = v16;
          begin = self->_bodyHints.__begin_;
          double v26 = self->_bodyHints.__end_;
          double v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v25;
          if (v26 != begin)
          {
            do
            {
              long long v29 = *(_OWORD *)((char *)v26 - 40);
              long long v30 = *(_OWORD *)((char *)v26 - 24);
              *((void *)v28 - 1) = *((void *)v26 - 1);
              *(_OWORD *)((char *)v28 - 24) = v30;
              *(_OWORD *)((char *)v28 - 40) = v29;
              double v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v28 - 40);
              double v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 - 40);
            }
            while (v26 != begin);
            double v26 = p_bodyHints->__begin_;
          }
          double v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v25 + 40);
          self->_bodyHints.__begin_ = v28;
          self->_bodyHints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v25 + 40);
          self->_bodyHints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v24[40 * v23];
          if (v26) {
            operator delete(v26);
          }
        }
        else
        {
          *(double *)end = v8;
          *((void *)end + 1) = 0x4087700000000000;
          *((void *)end + 2) = v12;
          double v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 40);
          *((void *)end + 3) = v14;
          *((void *)end + 4) = v15;
        }
        self->_bodyHints.__end_ = v19;
        double v8 = v8 + 750.0;
        v6 += v11;
      }
      while (v6 < (unint64_t)v5);
    }
    self->_isLoaded = 1;
  }
}

- (void)p_withPageLayoutPerformBlock:(id)a3
{
  [(THFlowPageController *)self p_ensureLoaded];
  cachedPageLayout = self->_cachedPageLayout;
  if (cachedPageLayout)
  {
    if (![(THFlowPageController *)self cachedPageLayoutValidated])
    {
      if (objc_opt_respondsToSelector()) {
        id v6 = [(THFlowLayoutObserver *)self->_layoutObserver flowPageController:self isEdgeObscured:2];
      }
      else {
        id v6 = 0;
      }
      [(THFlowPageLayout *)cachedPageLayout setMaxXEdgeObscured:v6];
      [cachedPageLayout layoutController].validateOrderedLayouts:[NSArray arrayWithObject:cachedPageLayout]];
      [(THFlowPageController *)self setCachedPageLayoutValidated:1];
    }
  }
  else
  {
    [(THSectionInfo *)self->_offscreenSectionInfo setPages:+[NSArray arrayWithObject:[(THFlowPageController *)self pageInfo]]];
    [(THOffscreenLayoutController *)self->_drawablesLayoutController setInfos:+[NSArray arrayWithObject:self->_offscreenSectionInfo]];
    [(THOffscreenLayoutController *)self->_drawablesLayoutController validateLayouts];
    cachedPageLayout = self->_cachedPageLayout;
    [(THFlowPageController *)self setCachedPageLayoutValidated:0];
    if (!cachedPageLayout)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController p_withPageLayoutPerformBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm") lineNumber:849 description:@"should have found or created a page layout"];
      cachedPageLayout = 0;
    }
  }
  double v7 = (void (*)(id, THFlowPageLayout *))*((void *)a3 + 2);

  v7(a3, cachedPageLayout);
}

- (THPageControllerDelegate)delegate
{
  return self->_delegate;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
}

- (THModelStorageAnchor)cachedAnchorForRect
{
  return self->_cachedAnchorForRect;
}

- (void)setCachedAnchorForRect:(id)a3
{
}

- (CGRect)rectForAnchor
{
  double x = self->_rectForAnchor.origin.x;
  double y = self->_rectForAnchor.origin.y;
  double width = self->_rectForAnchor.size.width;
  double height = self->_rectForAnchor.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectForAnchor:(CGRect)a3
{
  self->_rectForAnchor = a3;
}

- (BOOL)cachedPageLayoutValidated
{
  return self->_cachedPageLayoutValidated;
}

- (void)setCachedPageLayoutValidated:(BOOL)a3
{
  self->_cachedPageLayoutValidated = a3;
}

- (void).cxx_destruct
{
  begin = self->_bodyHints.__begin_;
  if (begin)
  {
    self->_bodyHints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

@end