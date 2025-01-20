@interface THPaginatedPageController
- ($76C9DF09DF30CB4FBD89D11B5573AD82)p_stubHintAtRelativePageIndex:(SEL)a3;
- (BOOL)allowsDescendersToClip;
- (BOOL)caresAboutStorageChanges;
- (BOOL)needsAnnotationSourceForLayout:(id)a3;
- (BOOL)p_generateHintForPageIndex:(unint64_t)a3;
- (BOOL)p_isLayoutComplete;
- (BOOL)shouldAllowFinishingPartionedAttachmentLayout;
- (CGPoint)originOfCharacterIndex:(unint64_t)a3 forRelativePageIndex:(unint64_t)a4;
- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3 pageFrame:(CGRect)a4;
- (CGRect)i_rectForSectionLayout;
- (CGSize)desiredPageSizeForRelativePageIndex:(unint64_t)a3;
- (THBodyTextWrapController)wrapController;
- (THModelContentNode)contentNode;
- (THPageControllerDelegate)delegate;
- (THPageHintController)pageHints;
- (THPagePositionController)pagePositionController;
- (THPaginatedPageController)initWithDelegate:(id)a3 contentNode:(id)a4 paginationController:(id)a5 presentationType:(id)a6;
- (THPresentationType)presentationType;
- (THReflowablePaginationController)paginationController;
- (THWPStorage)bodyStorage;
- (_NSRange)p_anchoredRangeForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5;
- (_NSRange)p_bodyRangeForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5;
- (_NSRange)p_layoutEndAnchoredRange;
- (_NSRange)p_layoutEndRange;
- (const)i_topicHintsAfterPageIndex:(unint64_t)a3;
- (const)i_topicHintsPriorToPageIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)bodyInfoForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (id)bodyInfoForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (id)i_columnAfterPageIndex:(unint64_t)a3;
- (id)i_columnPriorToPageIndex:(unint64_t)a3;
- (id)i_firstChildHintAfterPageIndex:(unint64_t)a3;
- (id)i_pageHintForPageIndex:(unint64_t)a3;
- (id)lineHintsForTarget:(id)a3;
- (id)p_cachedPageLayoutForPageIndex:(unint64_t)a3 preferredLayoutController:(id)a4;
- (id)p_lastValidPageHint;
- (id)p_layoutManager;
- (id)p_pageHintForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5;
- (id)p_pageInfoForPageAtRelativeIndex:(unint64_t)a3;
- (id)p_updateHintAtIndex:(unint64_t)a3 withBodyTargets:(id)a4;
- (id)pageInfoForRelativePageIndex:(unint64_t)a3;
- (id)textWrapper;
- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)p_lastPageIndexWithBodyAfterPageIndex:(unint64_t)a3;
- (unint64_t)p_layoutEndCharIndex;
- (unint64_t)p_nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5;
- (unint64_t)p_previousRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5;
- (unint64_t)p_relativePageIndexFollowingRelativePageIndex:(unint64_t)a3;
- (unint64_t)p_relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4 searchAfterLayoutPoint:(BOOL)a5;
- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 caretAffinity:(int)a4 forceLayout:(BOOL)a5 searchAfterLayoutPoint:(BOOL)a6;
- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 scanBackwardsFromPageIndex:(unint64_t)a4;
- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 scanForwardsFromPageIndex:(unint64_t)a4;
- (unint64_t)p_relativePageIndexPrecedingRelativePageIndex:(unint64_t)a3;
- (unint64_t)pageCount;
- (unint64_t)relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (unint64_t)relativePageIndexForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4;
- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3;
- (void)clearCTCache;
- (void)clearLayout;
- (void)dealloc;
- (void)i_inflateColumnsInBodyLayout:(id)a3;
- (void)i_registerPageLayout:(id)a3;
- (void)i_setPageHintSize:(CGSize)a3 forRelativePageIndex:(unint64_t)a4;
- (void)i_trimPageAtIndex:(unint64_t)a3 toCharIndex:(unint64_t)a4 inTarget:(id)a5 removeAutoNumberFootnoteCount:(unint64_t)a6;
- (void)i_unregisterPageLayout:(id)a3;
- (void)layoutManager:(id)a3 didClearDirtyRangeWithDelta:(int64_t)a4 afterCharIndex:(unint64_t)a5;
- (void)layoutManagerNeedsLayout:(id)a3;
- (void)layoutThroughRelativePageIndex:(unint64_t)a3 layoutController:(id)a4;
- (void)p_bodyLayoutDidLayout:(id)a3;
- (void)p_clearOffscreenLayouts;
- (void)p_destroyBodyLayoutState;
- (void)p_didLayout;
- (void)p_insertPageLayoutIntoCache:(id)a3;
- (void)p_invalidateBodyLayoutOnPageIndex:(unint64_t)a3;
- (void)p_layoutNextPageForLayoutController:(id)a3;
- (void)p_layoutThroughPageIndex:(unint64_t)a3 forLayoutController:(id)a4 clearOffscreenInfos:(BOOL)a5;
- (void)p_layoutWithPageLayout:(id)a3 outDidSync:(BOOL *)a4;
- (void)p_performBlock:(id)a3 withPageLayoutAtRelativeIndex:(unint64_t)a4;
- (void)p_performBlock:(id)a3 withPageLayoutAtRelativeIndex:(unint64_t)a4 preferredLayoutController:(id)a5;
- (void)p_processWidowsAndInflationForLayoutController:(id)a3;
- (void)p_removeOrphanedLayoutsFromCache;
- (void)p_removePageLayoutFromCache:(id)a3;
- (void)p_setNeedsLayoutOnPageIndex:(unint64_t)a3;
- (void)p_updateWithPaginationResults;
- (void)setContentNode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPageHints:(id)a3;
- (void)setPaginationController:(id)a3;
- (void)setPresentationType:(id)a3;
- (void)setWrapController:(id)a3;
- (void)teardown;
- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4;
@end

@implementation THPaginatedPageController

- (THPageHintController)pageHints
{
  objc_sync_enter(self);
  v3 = self->mPageHints;
  objc_sync_exit(self);
  return v3;
}

- (THPaginatedPageController)initWithDelegate:(id)a3 contentNode:(id)a4 paginationController:(id)a5 presentationType:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)THPaginatedPageController;
  v10 = [(THPaginatedPageController *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(THPaginatedPageController *)v10 setDelegate:a3];
    [(THPaginatedPageController *)v11 setContentNode:a4];
    [(THPaginatedPageController *)v11 setPaginationController:a5];
    v11->mPresentationType = (THPresentationType *)[a6 copyFixingSize];
    [(THPaginatedPageController *)v11 setWrapController:objc_alloc_init(THBodyTextWrapController)];
    v11->_drawablesLayoutController = [[THOffscreenLayoutController alloc] initWithCanvas:0];
    [(THOffscreenLayoutController *)v11->_drawablesLayoutController setLayoutIsCompactWidth:[(THPresentationType *)[(THPaginatedPageController *)v11 presentationType] isCompactWidth]];
    [(THOffscreenLayoutController *)v11->_drawablesLayoutController setLayoutIsCompactHeight:[(THPresentationType *)[(THPaginatedPageController *)v11 presentationType] isCompactHeight]];
    v12 = objc_alloc_init(THSectionInfo);
    v11->mOffscreenSectionInfo = v12;
    [(THSectionInfo *)v12 setPageController:v11];
    v11->mPageHints = objc_alloc_init(THPageHintController);
  }
  return v11;
}

- (void)teardown
{
  objc_sync_enter(self);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  begin_node = (THPaginatedPageController *)self->_pageLayoutCache.__tree_.__begin_node_;
  if (begin_node != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_)
  {
    do
    {
      [v3 addObject:begin_node->mWrapController];
      mDelegate = begin_node->mDelegate;
      if (mDelegate)
      {
        do
        {
          mContentNode = (THPaginatedPageController *)mDelegate;
          mDelegate = *(THPageControllerDelegate **)mDelegate;
        }
        while (mDelegate);
      }
      else
      {
        do
        {
          mContentNode = (THPaginatedPageController *)begin_node->mContentNode;
          BOOL v7 = mContentNode->super.isa == (Class)begin_node;
          begin_node = mContentNode;
        }
        while (!v7);
      }
      begin_node = mContentNode;
    }
    while (mContentNode != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) removeFromParent];
      }
      id v8 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(THPaginatedPageController *)self p_destroyBodyLayoutState];
  self->mWrapController = 0;

  self->_bodyLayoutManager = 0;
  self->_drawablesLayoutController = 0;

  self->mOffscreenSectionInfo = 0;
  self->mPageHints = 0;
  [(THPaginatedPageController *)self setPresentationType:0];
  [(THPaginatedPageController *)self setContentNode:0];
  [(THPaginatedPageController *)self setDelegate:0];
  objc_sync_exit(self);
}

- (void)dealloc
{
  if (self->_bodyLayoutManager || self->_drawablesLayoutController || self->mPageHints) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPaginatedPageController dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"] lineNumber:186 description:@"someone forgot to call teardown"];
  }

  self->mWrapController = 0;
  [(THPaginatedPageController *)self setPresentationType:0];
  [(THPaginatedPageController *)self setContentNode:0];
  v3.receiver = self;
  v3.super_class = (Class)THPaginatedPageController;
  [(THPaginatedPageController *)&v3 dealloc];
}

- (void)p_updateWithPaginationResults
{
  if ([(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount])
  {
    [(THPaginatedPageController *)self p_validatePageHints];
  }
  else
  {
    id v3 = [(THReflowablePaginationController *)[(THPaginatedPageController *)self paginationController] paginationResultForContentNode:[(THPaginatedPageController *)self contentNode]];
    if (v3)
    {
      v4 = v3;
      id v10 = objc_msgSend(objc_msgSend(v3, "pageHints"), "mutableCopy");
      self->_firstPageIndexNeedingLayout = (unint64_t)[v10 count];
      if ([v4 pageCount])
      {
        unint64_t v5 = 0;
        do
        {
          if (v5 >= (unint64_t)[v10 count]) {
            break;
          }
          id v6 = [(THPaginatedPageController *)self pageInfoForRelativePageIndex:v5];
          id v7 = [v10 objectAtIndexedSubscript:v5];
          [v6 setPageStartCharIndex:[v7 range]];
          id v8 = (char *)[v7 range];
          [v6 setPageEndCharIndex:&v8[v9]];
          [v7 range];
          ++v5;
        }
        while (v5 < (unint64_t)[v4 pageCount]);
      }
      [(THPageHintController *)[(THPaginatedPageController *)self pageHints] setPageHints:v10];
    }
  }
}

- (void)clearLayout
{
  self->_firstPageIndexNeedingLayout = 0;
  [(THPaginatedPageController *)self p_clearOffscreenLayouts];
  [(TSWPLayoutManager *)self->_bodyLayoutManager clearTypesetterCache];
  [(THPaginatedPageController *)self p_destroyBodyLayoutState];

  self->_bodyLayoutManager = 0;
}

- (void)clearCTCache
{
}

- (void)setPresentationType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualIncludingSize:", -[THPaginatedPageController presentationType](self, "presentationType")) & 1) == 0)
  {
    objc_sync_enter(self);

    self->mPresentationType = (THPresentationType *)[a3 copyFixingSize];
    [(THPaginatedPageController *)self clearLayout];
    objc_sync_exit(self);
  }
}

- (THPagePositionController)pagePositionController
{
  id v3 = [(THPaginatedPageController *)self delegate];

  return (THPagePositionController *)[(THPageControllerDelegate *)v3 pagePositionControllerForPageController:self];
}

- (void)layoutThroughRelativePageIndex:(unint64_t)a3 layoutController:(id)a4
{
  objc_sync_enter(self);
  [(THPaginatedPageController *)self p_updateWithPaginationResults];
  [(THPaginatedPageController *)self p_layoutThroughPageIndex:a3 forLayoutController:a4 clearOffscreenInfos:1];

  objc_sync_exit(self);
}

- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 scanBackwardsFromPageIndex:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  unint64_t v7 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
  if (v7 - 1 < a4) {
    a4 = v7 - 1;
  }
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 < v7)
  {
    unint64_t v9 = v7;
    while (1)
    {
      id v10 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:a4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 range];
        if (!a4) {
          break;
        }
      }
      else
      {
        id v11 = NSInvalidRange[0];
        id v12 = NSInvalidRange[1];
        if (!a4) {
          break;
        }
      }
      if (v11 == NSInvalidRange[0] && v12 == NSInvalidRange[1]) {
        break;
      }
      unint64_t v14 = a3 - (void)v11;
      if ((id)a3 == v11)
      {
        unint64_t v8 = a4;
      }
      else
      {
        BOOL v16 = a3 < (unint64_t)v11 || v14 >= (unint64_t)v12;
        LODWORD(v14) = v8 != 0x7FFFFFFFFFFFFFFFLL && v16;
        if (!v16) {
          unint64_t v8 = a4;
        }
      }
      if (--a4 >= v9 || v14) {
        return v8;
      }
    }
    if ((id)a3 == v11) {
      return a4;
    }
    if (a3 >= (unint64_t)v11 && a3 - (unint64_t)v11 < (unint64_t)v12) {
      return a4;
    }
  }
  return v8;
}

- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 scanForwardsFromPageIndex:(unint64_t)a4
{
  if (!(a4 | a3)) {
    return 0;
  }
  unint64_t v4 = a4;
  unint64_t v7 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
  if (v7 <= v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = v7;
  while (1)
  {
    id v9 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 range];
    }
    else
    {
      id v10 = NSInvalidRange[0];
      id v11 = NSInvalidRange[1];
    }
    if ((id)a3 == v10) {
      break;
    }
    if (a3 >= (unint64_t)v10 && a3 - (unint64_t)v10 < (unint64_t)v11) {
      break;
    }
    if (++v4 >= v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v4;
}

- (unint64_t)relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(self);
  unint64_t v7 = [(THPaginatedPageController *)self p_relativePageIndexForAnchoredCharIndex:a3 forceLayout:v4 searchAfterLayoutPoint:0];
  objc_sync_exit(self);
  return v7;
}

- (unint64_t)relativePageIndexForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(self);
  unint64_t v7 = [(THPaginatedPageController *)self p_relativePageIndexForCharIndex:a3 caretAffinity:0 forceLayout:v4 searchAfterLayoutPoint:1];
  objc_sync_exit(self);
  return v7;
}

- (id)pageInfoForRelativePageIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  id v5 = [(THPaginatedPageController *)self p_pageInfoForPageAtRelativeIndex:a3];
  objc_sync_exit(self);
  return v5;
}

- (id)bodyInfoForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = -[THPaginatedPageController relativePageIndexForCharIndex:forceLayout:](self, "relativePageIndexForCharIndex:forceLayout:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v9 = v7;
  objc_sync_enter(self);
  id v10 = [(THPaginatedPageController *)self p_pageHintForRelativePageIndex:v9 forceLayout:v4 allowAfterLayoutPoint:0];
  if (v10
    && (id v11 = objc_msgSend(-[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:", v9), "modelBodyInfos"), (v12 = (char *)objc_msgSend(v10, "bodyCount")) != 0))
  {
    long long v13 = 0;
    unint64_t v14 = v12 - 1;
    do
    {
      id v8 = [v11 objectAtIndex:v13];
      id v15 = [v10 rangeForBodyIndex:v13];
    }
    while ((a3 - (unint64_t)v15 >= v16 || a3 < (unint64_t)v15) && v14 != v13++);
  }
  else
  {
    id v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (id)bodyInfoForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = -[THPaginatedPageController relativePageIndexForAnchoredCharIndex:forceLayout:](self, "relativePageIndexForAnchoredCharIndex:forceLayout:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v9 = v7;
  objc_sync_enter(self);
  id v10 = [(THPaginatedPageController *)self p_pageHintForRelativePageIndex:v9 forceLayout:v4 allowAfterLayoutPoint:0];
  if (v10
    && (id v11 = objc_msgSend(-[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:", v9), "modelBodyInfos"), (v12 = (char *)objc_msgSend(v10, "bodyCount")) != 0))
  {
    long long v13 = 0;
    unint64_t v14 = v12 - 1;
    do
    {
      id v8 = [v11 objectAtIndex:v13];
      id v15 = [v10 anchoredRangeForBodyIndex:v13];
    }
    while ((a3 - (unint64_t)v15 >= v16 || a3 < (unint64_t)v15) && v14 != v13++);
  }
  else
  {
    id v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (void)p_performBlock:(id)a3 withPageLayoutAtRelativeIndex:(unint64_t)a4
{
  objc_sync_enter(self);
  [(THPaginatedPageController *)self p_layoutThroughPageIndex:a4 forLayoutController:[(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] layoutControllerForPageController:self] clearOffscreenInfos:0];
  [(THPaginatedPageController *)self p_performBlock:a3 withPageLayoutAtRelativeIndex:a4 preferredLayoutController:0];

  objc_sync_exit(self);
}

- (unint64_t)pageCount
{
  id v3 = [(THPaginatedPageController *)self delegate];
  BOOL v4 = [(THPaginatedPageController *)self presentationType];

  return (unint64_t)[(THPageControllerDelegate *)v3 pageCountForPageController:self presentationType:v4];
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3F124;
  v10[3] = &unk_457938;
  v10[4] = &v12;
  CGRect v11 = a3;
  [(THPaginatedPageController *)self p_performBlock:v10 withPageLayoutAtRelativeIndex:a4];
  unint64_t v6 = v13[3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_sync_enter(self);
    uint64_t v7 = *([self p_pageHintForRelativePageIndex:a4 forceLayout:1 allowAfterLayoutPoint:1].firstHint + 4);
    id v8 = v13;
    v13[3] = v7;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:523 description:@"Found no hint for page that was not first"];
        id v8 = v13;
      }
      v8[3] = 0;
    }
    objc_sync_exit(self);
    unint64_t v6 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v6;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3 forRelativePageIndex:(unint64_t)a4
{
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x4012000000;
  uint64_t v12 = sub_3F264;
  long long v13 = nullsub_18;
  uint64_t v14 = &unk_41622E;
  CGPoint v15 = CGPointZero;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3F274;
  v8[3] = &unk_457960;
  v8[4] = &v9;
  v8[5] = a3;
  [(THPaginatedPageController *)self p_performBlock:v8 withPageLayoutAtRelativeIndex:a4];
  double v4 = v10[6];
  double v5 = v10[7];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)desiredPageSizeForRelativePageIndex:(unint64_t)a3
{
  id v3 = [self pageInfoForRelativePageIndex:[self pageInfoForRelativePageIndex:a3]].geometry;

  [v3 size];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3 pageFrame:(CGRect)a4
{
  double width = a4.size.width;
  [(THPagePositionController *)[(THPaginatedPageController *)self pagePositionController] pageOriginForRelativePageIndex:a3];
  double v7 = v6;
  double v9 = v8;
  if ([(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] displaySinglePageChapterSeparatelyForPageController:self]&& [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] isTwoUpForNavigationUnitForPageController:self]&& [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] pageCountForNavigationUnitForPageController:self] == (char *)&dword_0 + 1)
  {
    [(THPaginatedPageController *)self i_rectForSectionLayout];
    double v7 = v7 + (v10 - width) * 0.5;
  }
  double v11 = v7;
  double v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)caresAboutStorageChanges
{
  return 1;
}

- (void)layoutManagerNeedsLayout:(id)a3
{
  objc_sync_enter(self);
  [(THPaginatedPageController *)self p_updateWithPaginationResults];
  double v5 = (char *)[a3 dirtyRange];
  double v6 = v5;
  double v8 = v7;
  if (v5) {
    double v9 = v5 - 1;
  }
  else {
    double v9 = 0;
  }
  unint64_t v10 = [(THPaginatedPageController *)self p_relativePageIndexForCharIndex:v9 caretAffinity:0 forceLayout:0 searchAfterLayoutPoint:0];
  unint64_t v11 = [(THPaginatedPageController *)self p_relativePageIndexForAnchoredCharIndex:v6 forceLayout:0 searchAfterLayoutPoint:0];
  if (v11 >= v10) {
    unint64_t v12 = v10;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  if (self->_firstPageIndexNeedingLayout)
  {
    unint64_t v13 = [(THPaginatedPageController *)self p_layoutEndCharIndex];
    uint64_t v14 = [(char *)[a3 storage] length];
    if (v6 == (char *)v13 && v8 == &v14[-v13])
    {
      firstPageIndexNeedingLayout = (void *)self->_firstPageIndexNeedingLayout;
      if (firstPageIndexNeedingLayout != [THPageHintController pageCount][self pageHints])[TSUAssertionHandler currentHandler][NSString stringWithUTF8String:handleFailureInFunction:file:lineNumber:description:][NSString stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8String:stringWithUTF8
      if (self->_firstPageIndexNeedingLayout != 0x8000000000000000)
      }
LABEL_14:
        [(THPaginatedPageController *)self p_setNeedsLayoutOnPageIndex:"p_setNeedsLayoutOnPageIndex:"];
    }
  }
  [(THPaginatedPageController *)self p_destroyBodyLayoutState];
  if ([(THPaginatedPageController *)self p_isLayoutComplete]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController layoutManagerNeedsLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:614 description:@"layout should not be complete after the layout manager claims to need layout"];
  }

  objc_sync_exit(self);
}

- (id)textWrapper
{
  return [(THPaginatedPageController *)self wrapController];
}

- (id)lineHintsForTarget:(id)a3
{
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    id v4 = [result info];
    return [v4 lineHints];
  }
  return result;
}

- (void)layoutManager:(id)a3 didClearDirtyRangeWithDelta:(int64_t)a4 afterCharIndex:(unint64_t)a5
{
  if (!self->_doingLayout) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:643 description:@"should only clear dirty range during layout"];
  }
  if (a4)
  {
    unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    unint64_t v8 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
    unint64_t v9 = firstPageIndexNeedingLayout + 1;
    if (v9 < v8)
    {
      unint64_t v10 = v8;
      do
      {
        unint64_t v11 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v9];
        if (v11 != +[NSNull null]) {
          [(NSNull *)v11 offsetStartCharIndicesBy:a4];
        }
        ++v9;
      }
      while (v10 != v9);
    }
  }
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayout
{
  id v3 = [(THPaginatedPageController *)self delegate];

  return [(THPageControllerDelegate *)v3 shouldAllowFinishingPartionedAttachmentLayoutForPageController:self];
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  [(THPaginatedPageController *)self layoutThroughRelativePageIndex:a3 layoutController:[(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] layoutControllerForPageController:self]];

  return [(THPaginatedPageController *)self pageCount];
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
}

- (unint64_t)p_nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5
{
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = a3 + 1;
    unint64_t v11 = (char *)-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:");
    unint64_t v9 = (unint64_t)&v11[v12];
    if (&v11[v12] == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_nextRootSearchTargetIndexFromIndex:forString:options:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:693 description:@"this page should have been laid out already"];
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  unint64_t v13 = [(THPaginatedPageController *)self bodyStorage];
  uint64_t v14 = [(THWPStorage *)v13 length];
  if (v9 <= (unint64_t)v14) {
    CGPoint v15 = v14;
  }
  else {
    CGPoint v15 = (unsigned char *)v9;
  }
  if (v9 >= (unint64_t)v14) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = (unsigned char *)v9;
  }
  id v17 = [v13 string:v16 rangeOfString:a4 searchOptions:a5 updatingSearchRange:&v26];
  if (v17 != (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = [(THPaginatedPageController *)self relativePageIndexForCharIndex:v17 forceLayout:1];
  }
  v18 = [(THWPStorage *)v13 length];
  if (v9 <= (unint64_t)v18) {
    v19 = v18;
  }
  else {
    v19 = (unsigned char *)v9;
  }
  if (v9 >= (unint64_t)v18) {
    v20 = v18;
  }
  else {
    v20 = (unsigned char *)v9;
  }
  -[THWPStorage attachmentIndexRangeForTextRange:](v13, "attachmentIndexRangeForTextRange:", v20, v19 - v20);
  if (v21 && v10 < THMinIndex([(THPaginatedPageController *)self pageCount], v8))
  {
    unint64_t v22 = v10;
    do
    {
      id v23 = [(THPaginatedPageController *)self p_anchoredRangeForRelativePageIndex:v22 forceLayout:1 allowAfterLayoutPoint:0];
      if (THSearchModelsForString(-[THWPStorage childEnumeratorForRange:](v13, "childEnumeratorForRange:", v23, v24), (uint64_t)a4, a5))
      {
        unint64_t v8 = v22;
        break;
      }
      ++v22;
    }
    while (v22 < THMinIndex([(THPaginatedPageController *)self pageCount], v8));
  }
  while (v10 < THMinIndex([(THPaginatedPageController *)self pageCount], v8))
  {
    if (THSearchModelChildrenForString((uint64_t)[(THPaginatedPageController *)self pageInfoForRelativePageIndex:v10], (uint64_t)a4, a5))return v10; {
    ++v10;
    }
  }
  return v8;
}

- (unint64_t)p_previousRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5
{
  unint64_t v9 = [(THPaginatedPageController *)self pageCount];
  id v10 = [(THWPStorage *)[(THPaginatedPageController *)self bodyStorage] length];
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = (uint64_t)v10;
    a3 = v9;
  }
  else
  {
    id v13 = [(THPaginatedPageController *)self p_bodyRangeForRelativePageIndex:a3 forceLayout:0 allowAfterLayoutPoint:0];
    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_previousRootSearchTargetIndexFromIndex:forString:options:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:748 description:@"this page should have been laid out already"];
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v12 = (uint64_t)v13;
    }
  }
  uint64_t v14 = [(THPaginatedPageController *)self bodyStorage];
  id v15 = [v14 string:0, v12 rangeOfString:a4 searchOptions:a5 & 0xFFFFFFFFFFFFFFE3 | 4 updatingSearchRange:&v23];
  if (v15 != (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v11 = [(THPaginatedPageController *)self relativePageIndexForCharIndex:v15 forceLayout:1];
  }
  -[THWPStorage attachmentIndexRangeForTextRange:](v14, "attachmentIndexRangeForTextRange:", 0, v12);
  if (v16)
  {
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v17 = 0;
    }
    else {
      unint64_t v17 = v11 + 1;
    }
    unint64_t v18 = a3;
    while (v18 > v17)
    {
      id v19 = [(THPaginatedPageController *)self p_anchoredRangeForRelativePageIndex:--v18 forceLayout:1 allowAfterLayoutPoint:0];
      if (THSearchModelsForString(-[THWPStorage childEnumeratorForRange:](v14, "childEnumeratorForRange:", v19, v20), (uint64_t)a4, a5))goto LABEL_17; {
    }
      }
  }
  unint64_t v18 = v11;
LABEL_17:
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v21 = 0;
  }
  else {
    unint64_t v21 = v18 + 1;
  }
  while (a3 > v21)
  {
    if (THSearchModelChildrenForString((uint64_t)[(THPaginatedPageController *)self pageInfoForRelativePageIndex:--a3], (uint64_t)a4, a5))return a3; {
  }
    }
  return v18;
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  objc_sync_enter(self);
  if (a6 == 1)
  {
    unint64_t v11 = [(THPaginatedPageController *)self p_previousRootSearchTargetIndexFromIndex:a3 forString:a4 options:a5];
  }
  else
  {
    if (a6)
    {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    unint64_t v11 = [(THPaginatedPageController *)self p_nextRootSearchTargetIndexFromIndex:a3 forString:a4 options:a5];
  }
  unint64_t v12 = v11;
LABEL_7:
  objc_sync_exit(self);
  return v12;
}

- (BOOL)p_isLayoutComplete
{
  unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
  return firstPageIndexNeedingLayout == [(THPaginatedPageController *)self pageCount];
}

- (THWPStorage)bodyStorage
{
  id v3 = [(THPaginatedPageController *)self delegate];
  id v4 = [(THPaginatedPageController *)self presentationType];

  return (THWPStorage *)[(THPageControllerDelegate *)v3 bodyStorageForPageController:self presentationType:v4];
}

- (void)p_clearOffscreenLayouts
{
  [(THOffscreenLayoutController *)self->_drawablesLayoutController setInfos:0];
  id v3 = +[NSArray array];
  mOffscreenSectionInfo = self->mOffscreenSectionInfo;

  [(THSectionInfo *)mOffscreenSectionInfo setPages:v3];
}

- (id)p_layoutManager
{
  id result = self->_bodyLayoutManager;
  if (!result)
  {
    id result = [objc_alloc((Class)TSWPLayoutManager) initWithStorage:[self bodyStorage] owner:self];
    self->_bodyLayoutManager = (TSWPLayoutManager *)result;
  }
  return result;
}

- (void)p_setNeedsLayoutOnPageIndex:(unint64_t)a3
{
  [(THPaginatedPageController *)self p_invalidateBodyLayoutOnPageIndex:a3];
  id v4 = [(THPaginatedPageController *)self delegate];

  [(THPageControllerDelegate *)v4 pageControllerNeedsLayout:self];
}

- (void)p_invalidateBodyLayoutOnPageIndex:(unint64_t)a3
{
  if (self->_firstPageIndexNeedingLayout > a3)
  {
    self->_unint64_t firstPageIndexNeedingLayout = a3;
    [(THPaginatedPageController *)self p_destroyBodyLayoutState];
  }
  double v5 = [(THPaginatedPageController *)self pageHints];

  [(THPageHintController *)v5 clearHintsOnRelativePageIndex:a3];
}

- (void)p_destroyBodyLayoutState
{
  if (self->_bodyLayoutState)
  {
    [(TSWPLayoutManager *)self->_bodyLayoutManager destroyLayoutState:"destroyLayoutState:"];
    self->_bodyLayoutState = 0;
  }
}

- (id)p_lastValidPageHint
{
  if (!self->_firstPageIndexNeedingLayout) {
    return 0;
  }
  id v2 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:self->_firstPageIndexNeedingLayout - 1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_lastValidPageHint]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:888 description:@"page hint before _firstPageIndexNeedingLayout isn't a page hint"];
  }
  return v2;
}

- (unint64_t)p_layoutEndCharIndex
{
  id v2 = [(THPaginatedPageController *)self p_layoutEndRange];
  return (unint64_t)v2 + v3;
}

- (_NSRange)p_layoutEndRange
{
  if (!self->_firstPageIndexNeedingLayout) {
    goto LABEL_5;
  }
  id v2 = [[self p_lastValidPageHint] lastHint];
  if (!v2)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutEndRange]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:910 description:@"should have found a last hint"];
LABEL_5:
    NSUInteger v5 = 0;
    NSUInteger v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = v2;
  NSUInteger v4 = v2[4];
  NSUInteger v5 = v3[5];
LABEL_6:
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)p_layoutEndAnchoredRange
{
  if (self->_firstPageIndexNeedingLayout)
  {
    id v2 = [[self p_lastValidPageHint] lastHint];
    if (!v2) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutEndAnchoredRange]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:930 description:@"should have found a last hint"];
    }
    NSUInteger v3 = v2[7];
    NSUInteger v4 = v2[8];
  }
  else
  {
    NSUInteger v4 = 0;
    NSUInteger v3 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)p_stubHintAtRelativePageIndex:(SEL)a3
{
  NSUInteger v4 = self;
  unint64_t v6 = a4 - 1;
  unint64_t v7 = a4 + 1;
  while (--v7)
  {
    self = ($76C9DF09DF30CB4FBD89D11B5573AD82 *)objc_msgSend(objc_msgSend(-[$76C9DF09DF30CB4FBD89D11B5573AD82 pageHints](v4, "pageHints"), "hintForRelativePageIndex:", v6), "lastHint");
    if (self)
    {
      unint64_t v8 = self->var1.length + self->var1.location;
      retstr->var2 = v8;
      retstr->var3.location = v8;
      retstr->var3.length = 0;
      _NSRange var3 = retstr->var3;
      goto LABEL_6;
    }
  }
  retstr->var3.length = 0;
  _NSRange var3 = (_NSRange)0;
  *(_OWORD *)&retstr->var2 = 0u;
LABEL_6:
  retstr->var1 = var3;
  CGSize size = CGRectNull.size;
  retstr->var0.origin = CGRectNull.origin;
  retstr->var0.CGSize size = size;
  retstr->var4 = 0;
  return self;
}

- (id)p_updateHintAtIndex:(unint64_t)a3 withBodyTargets:(id)a4
{
  if (self->_firstPageIndexNeedingLayout != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:974 description:@"updating a surprising page index"];
  }
  unint64_t v6 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
  unint64_t v7 = [(THPaginatedPageController *)self pageHints];
  unint64_t v8 = a3;
  if (v6 <= a3)
  {
    if ([(THPageHintController *)v7 pageCount] != a3) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:983 description:@"updating hints out of order"];
    }
    unint64_t v9 = 0;
    unint64_t v8 = a3;
  }
  else
  {
    unint64_t v9 = [(THPageHintController *)v7 hintForRelativePageIndex:a3];
  }
  id v21 = [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] pageInfoForPageController:self pageIndex:v8 presentationType:[(THPaginatedPageController *)self presentationType]];
  if (!v9 || v9 == (THPageHint *)+[NSNull null])
  {
    unint64_t v9 = [[THPageHint alloc] initWithPageInfo:v21];
    [(THPageHintController *)[(THPaginatedPageController *)self pageHints] setHint:v9 forRelativePageIndex:v8];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [a4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v10)
  {
    [(THPageHint *)v9 setNonEmptyBodyCount:0];
    goto LABEL_29;
  }
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v34;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(a4);
      }
      uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if (!objc_msgSend(objc_msgSend(v14, "columns"), "count"))
      {
        v11 += (uint64_t)i;
        goto LABEL_25;
      }
      __p = 0;
      v31 = 0;
      uint64_t v32 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      id v29 = 0;
      id v29 = +[TSURetainedPointerKeyDictionary dictionary];
      [(-[THPaginatedPageController p_layoutManager](self, "p_layoutManager")) deflateTarget:v14 intoHints:&__p childHints:&v37 anchoredAttachmentPositions:&v29 topicNumbers:[v9 topicNumbers] layoutState:self->_bodyLayoutState];
      if (v31 == __p) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1005 description:@"Failed to deflate into hints"];
      }
      [(THPageHint *)v9 setAnchoredAttachmentPositions:v29 forBodyIndex:(char *)i + v11];
      [(THPageHint *)v9 setHints:&__p forBodyIndex:(char *)i + v11];
      [(THPageHint *)v9 setFirstChildHint:v37 forBodyIndex:(char *)i + v11];
      [(THPageHint *)v9 setLastChildHint:v38 forBodyIndex:(char *)i + v11];
      if (__p)
      {
        v31 = __p;
        operator delete(__p);
      }
    }
    id v10 = [a4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    v11 += (uint64_t)i;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_25:
  [(THPageHint *)v9 setNonEmptyBodyCount:v11];
  if (!v11)
  {
    if (!self)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
LABEL_30:
      v23[2] = v26;
      v23[3] = v27;
      v23[4] = v28;
      v23[0] = v24;
      v23[1] = v25;
      [(THPageHint *)v9 setBodylessStubHint:v23];
      goto LABEL_31;
    }
LABEL_29:
    [(THPaginatedPageController *)self p_stubHintAtRelativePageIndex:a3];
    goto LABEL_30;
  }
LABEL_31:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THPageControllerDelegate *)self->mDelegate wantsPageCharIndicesFilledForPageController:self])
  {
    id v16 = NSInvalidRange[0];
    id v15 = NSInvalidRange[1];
    if (v16 == [(THPageHint *)v9 range] && v15 == v17) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1026 description:@"Failed to get page character range."];
    }
    if (!v21) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1027 description:@"invalid nil value for '%s'", "pageInfo"];
    }
    [v21 setPageStartCharIndex:[v9 range]];
    unint64_t v18 = (char *)[(THPageHint *)v9 range];
    [v21 setPageEndCharIndex:&v18[v19]];
  }
  if (!v9) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1033 description:@"failed to create a page hint"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"] lineNumber:1034 description:@"page hint is the wrong class"];
  }
  if ([(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount] <= a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1035 description:@"we don't have a page hint for this page"];
  }
  return v9;
}

- (BOOL)p_generateHintForPageIndex:(unint64_t)a3
{
  NSUInteger v4 = self;
  id v5 = -[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:");
  unint64_t v6 = [[THPageHint alloc] initWithPageInfo:v5];
  id v7 = [v5 modelBodyInfos];
  unint64_t v8 = (char *)[v7 count];
  if (!v8) {
    goto LABEL_25;
  }
  unint64_t v9 = v8;
  unint64_t v43 = a3;
  v44 = v4;
  id v10 = 0;
  while (1)
  {
    id v11 = [v7 objectAtIndex:v10];
    id v12 = [v11 lineHints];
    if (!v12) {
      break;
    }
    id v13 = v12;
    if (([v12 valid] & 1) == 0) {
      break;
    }
    if ([v13 hintsCount])
    {
      uint64_t v14 = [v13 hints];
      id v15 = (char *)[v13 hints];
      id v16 = &v15[56 * (void)[v13 hintsCount]];
      objc_msgSend(objc_msgSend(v11, "geometry"), "boundsBeforeRotation");
      unint64_t v17 = v14[4];
      uint64_t v18 = *((void *)v16 - 3);
      uint64_t v19 = *((void *)v16 - 2);
      id v20 = [[v11 columnStyle] columnCount];
      memset(&__p, 0, 24);
      id v21 = sub_43484((uint64_t)&__p._numbersForListStyle.__tree_.__pair3_, 1uLL);
      uint64_t v23 = v22;
      unint64_t v24 = v19 + v18;
      BOOL v25 = v17 >= v19 + v18;
      if (v17 <= v19 + v18) {
        unint64_t v26 = v19 + v18;
      }
      else {
        unint64_t v26 = v17;
      }
      if (v25) {
        unint64_t v17 = v24;
      }
      TSDRectWithSize();
      begin_node = (char *)__p._numbersForListStyle.__tree_.__begin_node_;
      left = (char *)__p._numbersForListStyle.__tree_.__pair1_.__value_.__left_;
      *id v21 = v29;
      v21[1] = v30;
      v21[2] = v31;
      v21[3] = v32;
      v21[4] = v17;
      v21[5] = v26 - v17;
      v21[6] = v26;
      v21[7] = v17;
      v21[8] = v26 - v17;
      v21[9] = v20;
      if (left == begin_node)
      {
        uint64_t v37 = v21;
      }
      else
      {
        long long v33 = v21;
        do
        {
          *((_OWORD *)v33 - 5) = *((_OWORD *)left - 5);
          long long v34 = *((_OWORD *)left - 4);
          long long v35 = *((_OWORD *)left - 3);
          long long v36 = *((_OWORD *)left - 1);
          uint64_t v37 = v33 - 10;
          *((_OWORD *)v33 - 2) = *((_OWORD *)left - 2);
          *((_OWORD *)v33 - 1) = v36;
          *((_OWORD *)v33 - 4) = v34;
          *((_OWORD *)v33 - 3) = v35;
          left -= 80;
          v33 -= 10;
        }
        while (left != begin_node);
      }
      __p._numbersForListStyle.__tree_.__begin_node_ = v37;
      __p._numbersForListStyle.__tree_.__pair1_.__value_.__left_ = v21 + 10;
      __p._numbersForListStyle.__tree_.__pair3_.__value_ = (unint64_t)&v21[10 * v23];
      if (begin_node) {
        operator delete(begin_node);
      }
      __p._numbersForListStyle.__tree_.__pair1_.__value_.__left_ = v21 + 10;
      [(THPageHint *)v6 setHints:&__p forBodyIndex:v10++];
      [(THPageHint *)v6 setNonEmptyBodyCount:v10];
      if (__p._numbersForListStyle.__tree_.__begin_node_)
      {
        __p._numbersForListStyle.__tree_.__pair1_.__value_.__left_ = __p._numbersForListStyle.__tree_.__begin_node_;
        operator delete(__p._numbersForListStyle.__tree_.__begin_node_);
      }
      if (v10 != v9) {
        continue;
      }
    }
    BOOL v38 = 1;
    a3 = v43;
    NSUInteger v4 = v44;
    goto LABEL_26;
  }
  NSUInteger v4 = v44;
  id v39 = [(THReflowablePaginationController *)[(THPaginatedPageController *)v44 paginationController] paginationResultForContentNode:[(THPaginatedPageController *)v44 contentNode]];
  if (v39)
  {
    id v40 = [v39 pageHints];

    a3 = v43;
    unint64_t v6 = (THPageHint *)[v40 objectAtIndexedSubscript:v43];
LABEL_25:
    BOOL v38 = 1;
    goto LABEL_26;
  }
  BOOL v38 = 0;
  a3 = v43;
LABEL_26:
  if ([v7 count])
  {
    if (!v38) {
      goto LABEL_37;
    }
  }
  else
  {
    if (v4)
    {
      [(THPaginatedPageController *)v4 p_stubHintAtRelativePageIndex:a3];
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
    }
    v46[2] = v49;
    v46[3] = v50;
    v46[4] = v51;
    v46[0] = v47;
    v46[1] = v48;
    [(THPageHint *)v6 setBodylessStubHint:v46];
    if (!v38) {
      goto LABEL_37;
    }
  }
  TSWPTopicNumberHints::TSWPTopicNumberHints();
  if (a3)
  {
    objc_opt_class();
    [(THPageHintController *)[(THPaginatedPageController *)v4 pageHints] hintForRelativePageIndex:a3 - 1];
    v41 = (void *)TSUDynamicCast();
    if (v41)
    {
      [v41 topicNumbers];
      TSWPTopicNumberHints::operator=();
    }
  }
  TSWPTopicNumberHints::advanceToCharIndex(&__p, *((void *)[(THPageHint *)v6 firstHint] + 4), (TSWPStorage *)[(THPaginatedPageController *)v4 bodyStorage]);
  [(THPageHint *)v6 setTopicNumbers:&__p];
  [(THPageHintController *)[(THPaginatedPageController *)v4 pageHints] setHint:v6 forRelativePageIndex:a3];
  TSWPTopicNumberHints::~TSWPTopicNumberHints(&__p);
LABEL_37:

  return v38;
}

- (void)p_insertPageLayoutIntoCache:(id)a3
{
  if (![a3 layoutController]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPaginatedPageController p_insertPageLayoutIntoCache:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"] lineNumber:1143 description:@"invalid nil value for '%s'", "pageLayout.layoutController"];
  }
  id v5 = objc_msgSend(objc_msgSend(a3, "info"), "relativePageIndexInParent");
  if (self->_pageLayoutCache.__tree_.__pair3_.__value_ >= 0x10) {
    [(THPaginatedPageController *)self p_clearOffscreenLayouts];
  }
  v6[0] = (unint64_t)v5;
  v6[1] = (unint64_t)a3;
  sub_434CC((uint64_t **)&self->_pageLayoutCache, v6);
}

- (void)p_removeOrphanedLayoutsFromCache
{
  TSWPTopicNumberHints __p = 0;
  id v21 = 0;
  uint64_t v22 = 0;
  p_pageLayoutCache = (uint64_t **)&self->_pageLayoutCache;
  begin_node = (THPaginatedPageController *)self->_pageLayoutCache.__tree_.__begin_node_;
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  if (begin_node != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_)
  {
    do
    {
      if (![(THBodyTextWrapController *)begin_node->mWrapController layoutController])
      {
        id v5 = v21;
        if (v21 >= v22)
        {
          id v7 = __p;
          uint64_t v8 = v21 - __p;
          unint64_t v9 = v8 + 1;
          if ((unint64_t)(v8 + 1) >> 61) {
            sub_3D1D0();
          }
          uint64_t v10 = (char *)v22 - (char *)__p;
          if (((char *)v22 - (char *)__p) >> 2 > v9) {
            unint64_t v9 = v10 >> 2;
          }
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v11 = v9;
          }
          if (v11)
          {
            id v12 = (char *)sub_4374C((uint64_t)&v22, v11);
            id v7 = __p;
            id v5 = v21;
          }
          else
          {
            id v12 = 0;
          }
          id v13 = (THPageHintController **)&v12[8 * v8];
          *id v13 = begin_node->mPageHints;
          unint64_t v6 = (unint64_t *)(v13 + 1);
          while (v5 != v7)
          {
            uint64_t v14 = (THPageHintController *)*--v5;
            *--id v13 = v14;
          }
          TSWPTopicNumberHints __p = (unint64_t *)v13;
          uint64_t v22 = (unint64_t *)&v12[8 * v11];
          if (v7) {
            operator delete(v7);
          }
        }
        else
        {
          *id v21 = (unint64_t)begin_node->mPageHints;
          unint64_t v6 = v21 + 1;
        }
        id v21 = v6;
      }
      mDelegate = begin_node->mDelegate;
      if (mDelegate)
      {
        do
        {
          mContentNode = (THModelContentNode *)mDelegate;
          mDelegate = *(THPageControllerDelegate **)mDelegate;
        }
        while (mDelegate);
      }
      else
      {
        do
        {
          mContentNode = begin_node->mContentNode;
          BOOL v17 = *(void *)mContentNode->super.TSPObject_opaque == (void)begin_node;
          begin_node = (THPaginatedPageController *)mContentNode;
        }
        while (!v17);
      }
      begin_node = (THPaginatedPageController *)mContentNode;
    }
    while (mContentNode != (THModelContentNode *)p_pair1);
    uint64_t v19 = __p;
    uint64_t v18 = v21;
    if (__p != v21)
    {
      do
        sub_43784(p_pageLayoutCache, v19++);
      while (v19 != v21);
      uint64_t v18 = __p;
    }
    if (v18) {
      operator delete(v18);
    }
  }
}

- (void)p_removePageLayoutFromCache:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "info"), "relativePageIndexInParent");
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  unint64_t v6 = left;
  if (left)
  {
    unint64_t v9 = p_pair1;
    do
    {
      unint64_t v10 = (unint64_t)v6[4].__value_.__left_;
      BOOL v11 = v10 >= (unint64_t)v5;
      if (v10 >= (unint64_t)v5) {
        id v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)v6;
      }
      else {
        id v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&v6[1];
      }
      if (v11) {
        unint64_t v9 = v6;
      }
      unint64_t v6 = *v12;
    }
    while (*v12);
    if (v9 != p_pair1)
    {
      while (v5 == v9[4].__value_.__left_)
      {
        if (v9[5].__value_.__left_ == a3)
        {
          sub_43898((uint64_t **)&p_pair1[-1], (uint64_t *)v9);
          operator delete(v9);
          return;
        }
        id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v9[1].__value_.__left_;
        if (v13)
        {
          do
          {
            uint64_t v14 = v13;
            id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v13->__value_.__left_;
          }
          while (v13);
        }
        else
        {
          do
          {
            uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v9[2].__value_.__left_;
            BOOL v15 = v14->__value_.__left_ == v9;
            unint64_t v9 = v14;
          }
          while (!v15);
        }
        unint64_t v9 = v14;
        if (v14 == p_pair1) {
          return;
        }
      }
    }
  }
}

- (id)p_cachedPageLayoutForPageIndex:(unint64_t)a3 preferredLayoutController:(id)a4
{
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  left = (char *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return 0;
  }
  uint64_t v8 = &self->_pageLayoutCache.__tree_.__pair1_;
  do
  {
    unint64_t v9 = *((void *)left + 4);
    BOOL v10 = v9 >= a3;
    if (v9 >= a3) {
      BOOL v11 = (char **)left;
    }
    else {
      BOOL v11 = (char **)(left + 8);
    }
    if (v10) {
      uint64_t v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)left;
    }
    left = *v11;
  }
  while (*v11);
  if (v8 == p_pair1 || v8[4].__value_.__left_ != (void *)a3) {
    return 0;
  }
  do
  {
    id v12 = v8[5].__value_.__left_;
    if (!a4 || [v8[5].__value_.__left_ layoutController] == a4) {
      break;
    }
    id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v8[1].__value_.__left_;
    uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)v8;
    if (v13)
    {
      do
      {
        uint64_t v8 = v13;
        id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v13->__value_.__left_;
      }
      while (v13);
    }
    else
    {
      do
      {
        uint64_t v8 = v14[2];
        BOOL v15 = v8->__value_.__left_ == v14;
        uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)v8;
      }
      while (!v15);
    }
  }
  while (v8 != p_pair1 && v8[4].__value_.__left_ == (void *)a3);
  return v12;
}

- (void)p_performBlock:(id)a3 withPageLayoutAtRelativeIndex:(unint64_t)a4 preferredLayoutController:(id)a5
{
  if (self->_firstPageIndexNeedingLayout < a4
    && (![(THPaginatedPageController *)self p_isLayoutComplete]
     || [(THPaginatedPageController *)self pageCount] < a4))
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1256 description:@"trying to generate a layout for a page past where we need layout"];
  }
  id v9 = [(THPaginatedPageController *)self p_cachedPageLayoutForPageIndex:a4 preferredLayoutController:a5];
  if (v9)
  {
    BOOL v10 = v9;
    if ([v9 layoutController])
    {
      objc_msgSend(objc_msgSend(v10, "layoutController"), "validateLayoutWithDependencies:", v10);
      goto LABEL_16;
    }
    [(THPaginatedPageController *)self p_removeOrphanedLayoutsFromCache];
  }
  id v11 = [(THPaginatedPageController *)self p_pageInfoForPageAtRelativeIndex:a4];
  if (v11)
  {
    [(THSectionInfo *)self->mOffscreenSectionInfo setPages:+[NSArray arrayWithObject:v11]];
    [(THOffscreenLayoutController *)self->_drawablesLayoutController setInfos:+[NSArray arrayWithObject:self->mOffscreenSectionInfo]];
    [(THPaginatedPageController *)self p_removeOrphanedLayoutsFromCache];
    [(THOffscreenLayoutController *)self->_drawablesLayoutController validateLayouts];
    id v12 = [(THPaginatedPageController *)self p_cachedPageLayoutForPageIndex:a4 preferredLayoutController:0];
    if (v12)
    {
      BOOL v10 = v12;
      id v13 = [[[v12 info] modelBodyInfos] count];
      if (v13 != objc_msgSend(objc_msgSend(v10, "bodyLayouts"), "count"))
      {
        id v14 = objc_msgSend(objc_msgSend(v10, "bodyLayouts"), "count");
        if (v14 != objc_msgSend(objc_msgSend(objc_msgSend(v10, "info"), "modelBodyInfos"), "count")) {
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL verifyPageLayout(THPageLayout *)"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 116, @"Body layout count = %lu, Body info count = %lu", objc_msgSend(objc_msgSend(v10, "bodyLayouts"), "count"), objc_msgSend(objc_msgSend(objc_msgSend(v10, "info"), "modelBodyInfos"), "count"));
        }
      }
      goto LABEL_16;
    }
  }
  else if (![(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] pageInfoForPageController:self pageIndex:a4 presentationType:[(THPaginatedPageController *)self presentationType]])
  {
    return;
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1304 description:@"should have found or created a page layout"];
  BOOL v10 = 0;
LABEL_16:
  BOOL v15 = (void (*)(id, void *))*((void *)a3 + 2);

  v15(a3, v10);
}

- (id)p_pageInfoForPageAtRelativeIndex:(unint64_t)a3
{
  id v5 = [(THPaginatedPageController *)self delegate];
  unint64_t v6 = [(THPaginatedPageController *)self presentationType];

  return [(THPageControllerDelegate *)v5 pageInfoForPageController:self pageIndex:a3 presentationType:v6];
}

- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 caretAffinity:(int)a4 forceLayout:(BOOL)a5 searchAfterLayoutPoint:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = [(THPaginatedPageController *)self bodyStorage];
  if (a3 && (id v12 = v11, (unint64_t)[(THWPStorage *)v11 length] > a3))
  {
    unsigned int v13 = [(THWPStorage *)v12 characterAtIndex:a3 - 1];
    int v14 = IsParagraphBreakingCharacter();
    if (v13 == 8232) {
      int v15 = 1;
    }
    else {
      int v15 = v14;
    }
  }
  else
  {
    int v15 = 0;
  }
  uint64_t v16 = 0;
  unint64_t v17 = 0;
  if (a4 != 1) {
    int v15 = 1;
  }
  int v26 = v15;
  while (1)
  {
    unint64_t v18 = (unint64_t)[(THPaginatedPageController *)self p_bodyRangeForRelativePageIndex:v17 forceLayout:v7 allowAfterLayoutPoint:v6];
    unint64_t v19 = v18;
    uint64_t v21 = v20;
    if (v18 | v20)
    {
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v6) {
          return v22;
        }
        unint64_t v23 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
        if (a3 < 0x7FFFFFFFFFFFFFFFLL || v17 >= v23) {
          return v22;
        }
        goto LABEL_21;
      }
    }
    else if (![(THModelContentNode *)[(THPaginatedPageController *)self contentNode] isLoaded])
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v19 > a3 && !v6) {
      break;
    }
    if (v19 > a3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_21:
    v16 += v21;
    unint64_t v22 = v17;
    if (v19 + v21 <= a3)
    {
      int v24 = v19 + v21 == a3 ? v26 : 0;
      unint64_t v22 = v19 + v21 == a3 ? v17 : 0x7FFFFFFFFFFFFFFFLL;
      if (v24 == 1)
      {
        if ([(THPaginatedPageController *)self p_isLayoutComplete]
          && v17 == [(THPaginatedPageController *)self p_lastPageIndexWithBodyAfterPageIndex:v17])
        {
          unint64_t v22 = v17;
          if (!(v16 | a3)) {
            return 0;
          }
        }
        else
        {
          unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
    ++v17;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
      return v22;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_relativePageIndexForCharIndex:caretAffinity:forceLayout:searchAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1350 description:@"charIndex is before this page, but we haven't returned yet"];
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)p_lastPageIndexWithBodyAfterPageIndex:(unint64_t)a3
{
  NSUInteger v4 = [(THPaginatedPageController *)self pageHints];
  id v5 = [(THPageHintController *)v4 pageCount];
  do
  {
    if ((unint64_t)v5 <= a3) {
      break;
    }
    --v5;
  }
  while (![v4 hintForRelativePageIndex:v5].bodyCount);
  return (unint64_t)v5;
}

- (id)p_pageHintForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    [(THPaginatedPageController *)self layoutThroughRelativePageIndex:a3 layoutController:[(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] layoutControllerForPageController:self]];
  }
  if (self->_firstPageIndexNeedingLayout <= a3 && !v5) {
    return 0;
  }
  if (!v5
    && [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount] <= a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1421 description:@"we should need layout at this index if we don't have a page hint for it"];
  }
  if ([(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount] <= a3) {
    return 0;
  }
  objc_opt_class();
  [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:a3];
  id result = (id)TSUDynamicCast();
  if (!v5 && !result)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1425 description:@"page hint prior to _firstPageIndexNeedingLayout should be a THPageHint"];
    return 0;
  }
  return result;
}

- (_NSRange)p_bodyRangeForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5
{
  id v5 = [(THPaginatedPageController *)self p_pageHintForRelativePageIndex:a3 forceLayout:a4 allowAfterLayoutPoint:a5];
  if (!v5)
  {
    NSUInteger v15 = 0;
    NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  BOOL v6 = v5;
  BOOL v7 = [v5 firstHint];
  uint64_t v8 = [v6 lastHint];
  id v9 = v8;
  if (!v7)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1443 description:@"invalid nil value for '%s'", "firstHint"];
    if (v9) {
      goto LABEL_4;
    }
LABEL_13:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1444 description:@"invalid nil value for '%s'", "lastHint"];
    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_13;
  }
LABEL_4:
  NSUInteger v10 = v7[4];
  uint64_t v11 = v9[5];
  NSUInteger v12 = v11 + v9[4];
  if (v10 <= v12) {
    uint64_t v13 = v11 + v9[4];
  }
  else {
    uint64_t v13 = v7[4];
  }
  if (v10 >= v12) {
    NSUInteger v14 = v12;
  }
  else {
    NSUInteger v14 = v7[4];
  }
  NSUInteger v15 = v13 - v14;
LABEL_14:
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)p_anchoredRangeForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5
{
  id v5 = [(THPaginatedPageController *)self p_pageHintForRelativePageIndex:a3 forceLayout:a4 allowAfterLayoutPoint:a5];
  if (!v5)
  {
    NSUInteger v15 = 0;
    NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  BOOL v6 = v5;
  BOOL v7 = [v5 firstHint];
  uint64_t v8 = [v6 lastHint];
  id v9 = v8;
  if (!v7)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1462 description:@"invalid nil value for '%s'", "firstHint"];
    if (v9) {
      goto LABEL_4;
    }
LABEL_13:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1463 description:@"invalid nil value for '%s'", "lastHint"];
    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_13;
  }
LABEL_4:
  NSUInteger v10 = v7[7];
  uint64_t v11 = v9[8];
  NSUInteger v12 = v11 + v9[7];
  if (v10 <= v12) {
    uint64_t v13 = v11 + v9[7];
  }
  else {
    uint64_t v13 = v7[7];
  }
  if (v10 >= v12) {
    NSUInteger v14 = v12;
  }
  else {
    NSUInteger v14 = v7[7];
  }
  NSUInteger v15 = v13 - v14;
LABEL_14:
  result.length = v15;
  result.location = v14;
  return result;
}

- (unint64_t)p_relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4 searchAfterLayoutPoint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  for (unint64_t i = 0; ; ++i)
  {
    NSUInteger v10 = (char *)[(THPaginatedPageController *)self p_anchoredRangeForRelativePageIndex:i forceLayout:v6 allowAfterLayoutPoint:v5];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v5) {
        return v14;
      }
      unint64_t v15 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
      if (a3 < 0x7FFFFFFFFFFFFFFFLL || i >= v15) {
        return v14;
      }
      goto LABEL_10;
    }
    if ((unint64_t)v10 > a3 && !v5) {
      break;
    }
    if ((unint64_t)v10 > a3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_10:
    unint64_t v14 = i;
    if ((unint64_t)&v11[v13] <= a3)
    {
      if (&v11[v13] == (char *)a3 && [(THPaginatedPageController *)self p_isLayoutComplete])
      {
        if (i == self->_firstPageIndexNeedingLayout - 1) {
          unint64_t v14 = i;
        }
        else {
          unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      return v14;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_relativePageIndexForAnchoredCharIndex:forceLayout:searchAfterLayoutPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1490 description:@"anchoredCharIndex is before this page, but we haven't returned yet"];
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)p_processWidowsAndInflationForLayoutController:(id)a3
{
  if (a3)
  {
    begin_node = (THPaginatedPageController *)self->_pageLayoutCache.__tree_.__begin_node_;
    p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
    if (begin_node != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_)
    {
      do
      {
        if (begin_node->mPageHints >= (THPageHintController *)self->_firstPageIndexNeedingLayout) {
          break;
        }
        mWrapController = begin_node->mWrapController;
        if ([(THBodyTextWrapController *)mWrapController layoutController] == a3)
        {
          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          id v8 = [(THBodyTextWrapController *)mWrapController bodyLayouts];
          id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v16;
            do
            {
              for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v16 != v10) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * i) processWidowAndInflation];
              }
              id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
            }
            while (v9);
          }
        }
        mDelegate = begin_node->mDelegate;
        if (mDelegate)
        {
          do
          {
            mContentNode = (THModelContentNode *)mDelegate;
            mDelegate = *(THPageControllerDelegate **)mDelegate;
          }
          while (mDelegate);
        }
        else
        {
          do
          {
            mContentNode = begin_node->mContentNode;
            BOOL v14 = *(void *)mContentNode->super.TSPObject_opaque == (void)begin_node;
            begin_node = (THPaginatedPageController *)mContentNode;
          }
          while (!v14);
        }
        begin_node = (THPaginatedPageController *)mContentNode;
      }
      while (mContentNode != (THModelContentNode *)p_pair1);
    }
  }
}

- (void)p_layoutThroughPageIndex:(unint64_t)a3 forLayoutController:(id)a4 clearOffscreenInfos:(BOOL)a5
{
  if (self->_doingLayout) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutThroughPageIndex:forLayoutController:clearOffscreenInfos:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1540 description:@"shouldn't trigger layout during layout"];
  }
  -[THPaginatedPageController p_processWidowsAndInflationForLayoutController:](self, "p_processWidowsAndInflationForLayoutController:", a4, a4, a5);
  if (![(THPaginatedPageController *)self p_isLayoutComplete]
    && self->_firstPageIndexNeedingLayout <= a3)
  {
    unsigned __int8 v8 = [(THPaginatedPageController *)self p_isLayoutComplete];
    if ((v8 & 1) == 0)
    {
      unsigned __int8 v9 = v8;
      while (1)
      {
        [(THPaginatedPageController *)self p_layoutNextPageForLayoutController:a4];
        if (self->_firstPageIndexNeedingLayout > a3) {
          break;
        }
        if ([(THPaginatedPageController *)self p_isLayoutComplete])
        {
          if (v9) {
            goto LABEL_11;
          }
          break;
        }
      }
      [(THPaginatedPageController *)self p_clearOffscreenLayouts];
      [(THPaginatedPageController *)self p_processWidowsAndInflationForLayoutController:a4];
      [(THPaginatedPageController *)self p_didLayout];
    }
  }
LABEL_11:
  if ([(THPaginatedPageController *)self p_isLayoutComplete])
  {
    unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    if (firstPageIndexNeedingLayout < [(THPaginatedPageController *)self pageCount])
    {
      p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        unint64_t v13 = self->_firstPageIndexNeedingLayout;
        BOOL v14 = &self->_pageLayoutCache.__tree_.__pair1_;
        do
        {
          unint64_t v15 = (unint64_t)left[4].__value_.__left_;
          BOOL v16 = v15 >= v13;
          if (v15 >= v13) {
            long long v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)left;
          }
          else {
            long long v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&left[1];
          }
          if (v16) {
            BOOL v14 = left;
          }
          left = *v17;
        }
        while (*v17);
        if (v14 != p_pair1)
        {
          do
          {
            if (v14[4].__value_.__left_ > (void *)a3) {
              break;
            }
            [v14[5].__value_.__left_ validate];
            long long v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v14[1].__value_.__left_;
            if (v18)
            {
              do
              {
                unint64_t v19 = v18;
                long long v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v18->__value_.__left_;
              }
              while (v18);
            }
            else
            {
              do
              {
                unint64_t v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v14[2].__value_.__left_;
                BOOL v20 = v19->__value_.__left_ == v14;
                BOOL v14 = v19;
              }
              while (!v20);
            }
            BOOL v14 = v19;
          }
          while (v19 != p_pair1);
        }
      }
    }
  }
}

- (void)p_bodyLayoutDidLayout:(id)a3
{
  id v5 = [a3 bodyIndexInPageLayout];
  objc_msgSend(objc_msgSend(a3, "geometry"), "size");
  double v7 = v6;
  double v9 = v8;
  id v10 = -[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", objc_msgSend(objc_msgSend(a3, "parent"), "pageIndex"), 0, 1);

  [v10 setSize:v5 forBodyIndex:v7];
}

- (void)p_layoutWithPageLayout:(id)a3 outDidSync:(BOOL *)a4
{
  id v7 = [a3 bodyLayouts];
  id v8 = [(THPaginatedPageController *)self p_layoutManager];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v41;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v41 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8 * v11);
      char v39 = 0;
      id v13 = [v8 layoutIntoTarget:v12 withLayoutState:self->_bodyLayoutState outSync:&v39];
      self->_bodyLayoutState = v13;
      if (v39) {
        *a4 = 1;
      }
      if (!v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  [(THPaginatedPageController *)self p_updateHintAtIndex:self->_firstPageIndexNeedingLayout withBodyTargets:v7];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
    do
    {
      for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v7);
        }
        [(THPaginatedPageController *)self p_bodyLayoutDidLayout:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      id v14 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    BOOL v20 = &self->_pageLayoutCache.__tree_.__pair1_;
    do
    {
      unint64_t v21 = (unint64_t)left[4].__value_.__left_;
      BOOL v22 = v21 >= firstPageIndexNeedingLayout;
      if (v21 >= firstPageIndexNeedingLayout) {
        unint64_t v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)left;
      }
      else {
        unint64_t v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&left[1];
      }
      if (v22) {
        BOOL v20 = left;
      }
      left = *v23;
    }
    while (*v23);
    if (v20 != p_pair1)
    {
      do
      {
        if (v20[4].__value_.__left_ != (void *)self->_firstPageIndexNeedingLayout) {
          break;
        }
        if (v20[5].__value_.__left_ != a3)
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v24 = [v20[5].__value_.__left_ bodyLayouts];
          id v25 = [v24 countByEnumeratingWithState:&v31 objects:v44 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v32;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v32 != v26) {
                  objc_enumerationMutation(v24);
                }
                [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) killColumns];
              }
              id v25 = [v24 countByEnumeratingWithState:&v31 objects:v44 count:16];
            }
            while (v25);
          }
        }
        long long v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v20[1].__value_.__left_;
        if (v28)
        {
          do
          {
            uint64_t v29 = v28;
            long long v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v28->__value_.__left_;
          }
          while (v28);
        }
        else
        {
          do
          {
            uint64_t v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v20[2].__value_.__left_;
            BOOL v30 = v29->__value_.__left_ == v20;
            BOOL v20 = v29;
          }
          while (!v30);
        }
        BOOL v20 = v29;
      }
      while (v29 != p_pair1);
    }
  }
  if ([(THPaginatedPageController *)self p_isLayoutComplete]) {
    [(THPaginatedPageController *)self p_destroyBodyLayoutState];
  }
}

- (void)p_layoutNextPageForLayoutController:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = [(THPaginatedPageController *)self p_cachedPageLayoutForPageIndex:self->_firstPageIndexNeedingLayout preferredLayoutController:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v6 bodyLayouts];
  int v8 = 0;
  id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v8 |= [*(id *)(*((void *)&v18 + 1) + 8 * i) needsInflation] ^ 1;
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  if (v8 & 1 | ![(THPaginatedPageController *)self p_generateHintForPageIndex:self->_firstPageIndexNeedingLayout])
  {
    if (!self->_bodyLayoutState)
    {
      if (self->_firstPageIndexNeedingLayout)
      {
        id v12 = [(THPaginatedPageController *)self p_lastValidPageHint];
        if (v12)
        {
          id v13 = [(THPaginatedPageController *)self p_layoutManager];
          if (objc_msgSend(objc_msgSend(v6, "bodyLayouts"), "count")) {
            id v14 = objc_msgSend(objc_msgSend(v6, "bodyLayouts"), "objectAtIndex:", 0);
          }
          else {
            id v14 = 0;
          }
          self->_bodyLayoutState = [v13 layoutStateForLayoutTarget:v14 afterHint:[v12 lastHint] childHint:[v12 lastChildHint] topicNumbers:[v12 topicNumbers] textIsVertical:0];
        }
      }
    }
    if (self->_doingLayout) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutNextPageForLayoutController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1703 description:@"already laying out a page"];
    }
    self->_doingLayout = 1;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_42428;
    v15[3] = &unk_457988;
    v15[4] = self;
    v15[5] = v16;
    [(THPaginatedPageController *)self p_performBlock:v15 withPageLayoutAtRelativeIndex:self->_firstPageIndexNeedingLayout preferredLayoutController:a3];
    self->_doingLayout = 0;
    _Block_object_dispose(v16, 8);
  }
  else
  {
    [(THPaginatedPageController *)self p_destroyBodyLayoutState];
  }
  ++self->_firstPageIndexNeedingLayout;
}

- (void)p_didLayout
{
  if ([(THPaginatedPageController *)self p_isLayoutComplete])
  {
    unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    unint64_t v4 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount];
    if (firstPageIndexNeedingLayout > v4) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_didLayout]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1751 description:@"should have at least as many page hints as we have pages"];
    }
    if (firstPageIndexNeedingLayout < v4) {
      [(THPageHintController *)[(THPaginatedPageController *)self pageHints] clearHintsOnRelativePageIndex:firstPageIndexNeedingLayout];
    }
    p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      unint64_t v7 = self->_firstPageIndexNeedingLayout;
      int v8 = &self->_pageLayoutCache.__tree_.__pair1_;
      do
      {
        unint64_t v9 = (unint64_t)left[4].__value_.__left_;
        BOOL v10 = v9 >= v7;
        if (v9 >= v7) {
          uint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)left;
        }
        else {
          uint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&left[1];
        }
        if (v10) {
          int v8 = left;
        }
        left = *v11;
      }
      while (*v11);
      if (v8 != p_pair1)
      {
        do
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v12 = [v8[5].__value_.__left_ bodyLayouts];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v20;
            do
            {
              for (unint64_t i = 0; i != v13; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v12);
                }
                [*(id *)(*((void *)&v19 + 1) + 8 * i) killColumns];
              }
              id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v13);
          }
          BOOL v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v8[1].__value_.__left_;
          if (v16)
          {
            do
            {
              char v17 = v16;
              BOOL v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v16->__value_.__left_;
            }
            while (v16);
          }
          else
          {
            do
            {
              char v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v8[2].__value_.__left_;
              BOOL v18 = v17->__value_.__left_ == v8;
              int v8 = v17;
            }
            while (!v18);
          }
          int v8 = v17;
        }
        while (v17 != p_pair1);
      }
    }
  }
}

- (id)i_pageHintForPageIndex:(unint64_t)a3
{
  if ([(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount] <= a3) {
    return 0;
  }
  if ([(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount] <= a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_pageHintForPageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1785 description:@"index past page hint count, but before valid page count"];
  }
  id v5 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v5) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_pageHintForPageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1787 description:@"page hint prior to _firstPageIndexNeedingLayout is not a THPageHint"];
  }
  return v5;
}

- (void)i_setPageHintSize:(CGSize)a3 forRelativePageIndex:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  objc_sync_enter(self);
  [self i_pageHintForPageIndex:a4].setSize(width, height);

  objc_sync_exit(self);
}

- (void)i_trimPageAtIndex:(unint64_t)a3 toCharIndex:(unint64_t)a4 inTarget:(id)a5 removeAutoNumberFootnoteCount:(unint64_t)a6
{
  unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
  if (firstPageIndexNeedingLayout <= a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1804 description:@"trimming on or after where layout is"];
    unint64_t firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
  }
  if (firstPageIndexNeedingLayout - 1 != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1805 description:@"trimming on an unexpected page"];
  }
  id v12 = [[-[THPaginatedPageController pageHints](self, "pageHints") hintForRelativePageIndex:a3] lastColumn];

  [v12 trimToCharIndex:a4 inTarget:a5 removeAutoNumberFootnoteCount:a6];
}

- (id)i_columnPriorToPageIndex:(unint64_t)a3
{
  if (self->_firstPageIndexNeedingLayout >= a3)
  {
    if (!a3) {
      return 0;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_columnPriorToPageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1815 description:@"requesting a column from a page that needs layout"];
  }
  unint64_t v5 = a3 - 1;
  if (![(THPaginatedPageController *)self p_cachedPageLayoutForPageIndex:v5 preferredLayoutController:0]|| ![(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v5]|| (id result = [[THVisibleColumnProxy alloc] initWithPageIndex:v5 pageController:self]) == 0)
  {
    id result = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v5];
    if (result)
    {
      return [result lastColumn];
    }
  }
  return result;
}

- (id)i_columnAfterPageIndex:(unint64_t)a3
{
  if (self->_firstPageIndexNeedingLayout < a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_columnAfterPageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1846 description:@"requesting a column past one page after where we've laid out to / are currently laying out"];
  }
  unint64_t v5 = a3 + 1;
  if (v5 >= [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount]) {
    return 0;
  }
  id v6 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v5];
  if (v6 == +[NSNull null]) {
    return 0;
  }

  return [(NSNull *)v6 firstColumn];
}

- (id)i_firstChildHintAfterPageIndex:(unint64_t)a3
{
  if (self->_firstPageIndexNeedingLayout < a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPaginatedPageController i_firstChildHintAfterPageIndex:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"] lineNumber:1868 description:@"requesting a column past one page after where we've laid out to / are currently laying out"];
  }
  unint64_t v5 = a3 + 1;
  if (v5 >= [(THPageHintController *)[(THPaginatedPageController *)self pageHints] pageCount]) {
    return 0;
  }
  id v6 = [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v5];
  if (v6 == +[NSNull null]) {
    return 0;
  }

  return [(NSNull *)v6 firstChildHint];
}

- (void)i_inflateColumnsInBodyLayout:(id)a3
{
  objc_sync_enter(self);
  if (!self->_doingLayout)
  {
    unsigned int v5 = [a3 pageIndex];
    if (self->_firstPageIndexNeedingLayout <= v5
      && [(THPageHintController *)[(THPaginatedPageController *)self pageHints] hintForRelativePageIndex:v5])
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_inflateColumnsInBodyLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1914 description:@"trying to inflate a page that hasn't been laid out"];
    }
    else
    {
      id v6 = [(THPaginatedPageController *)self i_pageHintForPageIndex:v5];
      if (!v6) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_inflateColumnsInBodyLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1896 description:@"should have a page hint for a page before the first one needing layout"];
      }
      if (v5) {
        id v7 = [(THPaginatedPageController *)self i_pageHintForPageIndex:v5 - 1];
      }
      else {
        id v7 = 0;
      }
      id v8 = [a3 bodyIndexInPageLayout];
      if (v8 < [v6 nonEmptyBodyCount])
      {
        id v9 = [v6 anchoredAttachmentPositionsForBodyChildAtIndex:v8];
        id v10 = [(THPaginatedPageController *)self p_layoutManager];
        if (v6)
        {
          [v6 hintsForBodyIndex:v8];
        }
        else
        {
          TSWPTopicNumberHints __p = 0;
          id v12 = 0;
          uint64_t v13 = 0;
        }
        [v10 inflateTarget:a3 fromHints:&__p childHint:[v7 lastChildHint] anchoredAttachmentPositions:v9 topicNumbers:[v6 topicNumbers]];
        if (__p)
        {
          id v12 = __p;
          operator delete(__p);
        }
        [(THPaginatedPageController *)self p_validatePageHints];
        if (!objc_msgSend(objc_msgSend(a3, "columns"), "count")) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_inflateColumnsInBodyLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1908 description:@"should have created columns unless we're in the process of doing layout"];
        }
      }
      [(THPaginatedPageController *)self p_bodyLayoutDidLayout:a3];
    }
  }
  objc_sync_exit(self);
}

- (void)i_registerPageLayout:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_registerPageLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1923 description:@"can't register or unregister nil"];
  }
  [(THPaginatedPageController *)self p_insertPageLayoutIntoCache:a3];

  objc_sync_exit(self);
}

- (void)i_unregisterPageLayout:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_unregisterPageLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:1931 description:@"can't register or unregister nil"];
  }
  [(THPaginatedPageController *)self p_removePageLayoutFromCache:a3];

  objc_sync_exit(self);
}

- (CGRect)i_rectForSectionLayout
{
  id v3 = [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] pagePositionControllerForPageController:self];
  [v3 pageSizeWithZeroInPagingDirection];
  double v5 = v4;
  double v7 = v6;
  unint64_t v8 = [(THPaginatedPageController *)self pageCount];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ([(THPageHintController *)[(THPaginatedPageController *)self pageHints] hasFullHintForRelativePageIndex:i])
      {
        [(-[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", i)) size];
      }
      else
      {
        [v3 pageSize];
      }
      [v3 offsetSize:v5 inPagingDirectionWithOffset:v7, v11, v12];
      double v5 = v13;
      double v7 = v14;
    }
  }
  [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] canvasOriginForPageController:self];
  [(THPaginatedPageController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] canvasOriginDeltaForPageController:self];
  }
  if ([(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] displaySinglePageChapterSeparatelyForPageController:self]&& [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] isTwoUpForNavigationUnitForPageController:self])
  {
    [(THPageControllerDelegate *)[(THPaginatedPageController *)self delegate] pageCountForNavigationUnitForPageController:self];
  }

  TSDRectWithOriginAndSize();
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)needsAnnotationSourceForLayout:(id)a3
{
  double v5 = [(THPaginatedPageController *)self delegate];

  return [(THPageControllerDelegate *)v5 pageController:self needsAnnotationSourceForLayout:a3];
}

- (BOOL)allowsDescendersToClip
{
  id v3 = [(THPaginatedPageController *)self delegate];

  return [(THPageControllerDelegate *)v3 allowsDescendersToClipForPageController:self];
}

- (unint64_t)p_relativePageIndexPrecedingRelativePageIndex:(unint64_t)a3
{
  if (a3) {
    return a3 - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)p_relativePageIndexFollowingRelativePageIndex:(unint64_t)a3
{
  if (a3 + 1 < [(THPaginatedPageController *)self pageCount]) {
    return a3 + 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (const)i_topicHintsPriorToPageIndex:(unint64_t)a3
{
  if (self->_firstPageIndexNeedingLayout < a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_topicHintsPriorToPageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm") lineNumber:2017 description:@"requesting topicNumberHints from a page that needs layout"];
  }
  unint64_t v5 = [(THPaginatedPageController *)self p_relativePageIndexPrecedingRelativePageIndex:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v7 = [(THPaginatedPageController *)self p_pageHintForRelativePageIndex:v5 forceLayout:0 allowAfterLayoutPoint:0];

  return [v7 topicNumbers];
}

- (const)i_topicHintsAfterPageIndex:(unint64_t)a3
{
  unint64_t v4 = [(THPaginatedPageController *)self p_relativePageIndexFollowingRelativePageIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v6 = [(THPaginatedPageController *)self p_pageHintForRelativePageIndex:v4 forceLayout:0 allowAfterLayoutPoint:0];

  return [v6 topicNumbers];
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

- (void)setContentNode:(id)a3
{
}

- (THPageControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THPageControllerDelegate *)a3;
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (void)setPageHints:(id)a3
{
}

- (THBodyTextWrapController)wrapController
{
  return self->mWrapController;
}

- (void)setWrapController:(id)a3
{
}

- (THReflowablePaginationController)paginationController
{
  return self->_paginationController;
}

- (void)setPaginationController:(id)a3
{
  self->_paginationController = (THReflowablePaginationController *)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = (char *)self + 72;
  return self;
}

@end