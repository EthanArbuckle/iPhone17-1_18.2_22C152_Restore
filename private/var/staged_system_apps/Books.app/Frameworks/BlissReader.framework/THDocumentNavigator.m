@interface THDocumentNavigator
- (BOOL)canNavigateByBookDirection:(int)a3 bookGranularity:(int)a4;
- (BOOL)canNavigateByHistoryDirection:(int)a3;
- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4;
- (BOOL)followLink:(id)a3;
- (BOOL)followLink:(id)a3 animated:(BOOL)a4;
- (BOOL)followingAnchor;
- (BOOL)isPageLocationValid:(id)a3;
- (BOOL)isScrollingAcrossSections;
- (BOOL)jumpToPageLocation:(id)a3 touchHistory:(BOOL)a4 minor:(BOOL)a5;
- (BOOL)p_followDocumentAnchor:(id)a3 pulse:(BOOL)a4;
- (BOOL)restorePlaceholderWithOverrideLocation:(id)a3;
- (BOOL)visitedPagesAfterOpening;
- (CGRect)rectForFlowAnchor;
- (THDocumentLinkResolver)documentLinkResolver;
- (THDocumentNavigator)initWithDocumentRoot:(id)a3 interactiveCanvasController:(id)a4;
- (THDocumentNavigatorDelegate)delegate;
- (THDocumentRoot)documentRoot;
- (THInteractiveCanvasController)interactiveCanvasController;
- (THModelStorageAnchor)cachedFlowAnchorForRect;
- (THPageSpotHistory)pagespotHistory;
- (THSectionController)sectionController;
- (_NSRange)bodyRangeForStorageAnchorInFlow:(id)a3 sectionController:(id)a4;
- (_NSRange)currentAbsolutePageIndexRange;
- (_NSRange)p_bodyRangeForPossiblyAttachedInfo:(id)a3 body:(id)a4;
- (_NSRange)p_bodyRangeForStorageAnchorInFlow:(id)a3;
- (_NSRange)p_flowPivotRangeForBodyAnchor:(id)a3;
- (id)currentBookspotLocation;
- (id)currentContentNode;
- (id)currentPageInfo;
- (id)currentPageInfoForBookmarksUsingViewCenter:(BOOL)a3;
- (id)currentPageInfoForEndOfVisibleCanvas;
- (id)currentPageLocation;
- (id)currentPageLocationForCenterOfVisibleRectInInteractiveCanvasController;
- (id)linkForURL:(id)a3 inContentNode:(id)a4;
- (id)linkForURL:(id)a3 inStorage:(id)a4;
- (id)p_anchorForLink:(id)a3;
- (id)p_bodyStorageAnchorForAbsolutePageIndex:(unint64_t)a3;
- (id)p_bodyStorageAnchorForFlow;
- (id)p_bodyStorageAnchorForFlowInRect:(CGRect)a3;
- (id)pageLocationForAbsolutePageIndex:(unint64_t)a3;
- (id)pageNumberStringForLink:(id)a3;
- (id)readingProgress;
- (id)readingProgressAllowSample:(BOOL)a3;
- (id)storageAnchorForAbsolutePageIndex:(unint64_t)a3;
- (id)storageAnchorForBookmarksUsingViewCenter:(BOOL)a3;
- (id)storageAnchorForCurrentPage;
- (unint64_t)absolutePageIndexForBeginningOfSection;
- (unint64_t)absolutePageIndexForEndOfPreviousSection;
- (unint64_t)absolutePageIndexForEndOfSection;
- (unint64_t)absolutePageIndexForLink:(id)a3;
- (unint64_t)absolutePageIndexForNextSection;
- (unint64_t)absolutePageIndexForPreviousSection;
- (unint64_t)currentAbsolutePageIndex;
- (unint64_t)currentAbsolutePageIndexForBeginningOfVisibleCanvas;
- (unint64_t)currentAbsolutePageIndexForBookmarksUsingViewCenter:(BOOL)a3;
- (unint64_t)currentAbsolutePageIndexForEndOfVisibleCanvas;
- (unint64_t)currentChapterIndex;
- (unint64_t)currentNavigationUnitRelativePageIndex;
- (unint64_t)lastAbsolutePageIndex;
- (unint64_t)nextVisibleAbsolutePageNumber;
- (unint64_t)previousVisibleAbsolutePageNumber;
- (unint64_t)relativePageIndexForLink:(id)a3;
- (void)clearFlowAnchorCache;
- (void)dealloc;
- (void)navigateByBookDirection:(int)a3 bookGranularity:(int)a4;
- (void)navigateByHistoryDirection:(int)a3;
- (void)p_jumpToAnnotationAnchor:(id)a3 pulse:(BOOL)a4;
- (void)p_jumpToContentNodeAnchor:(id)a3;
- (void)p_jumpToPageAnchor:(id)a3;
- (void)p_jumpToStorageAnchor:(id)a3 pulse:(BOOL)a4;
- (void)p_jumpWithBlock:(id)a3 andPulseStorageAnchor:(id)a4;
- (void)p_jumpWithBlock:(id)a3 annotation:(id)a4 noteSelectionRange:(_NSRange)a5;
- (void)p_pulseStorageAnchor:(id)a3;
- (void)p_resolveLink:(id)a3 andCallBlock:(id)a4;
- (void)p_scrollToAbsolutePageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)savePlaceholder;
- (void)scrollToNextSection;
- (void)scrollToPreviousSection;
- (void)setCachedFlowAnchorForRect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentLinkResolver:(id)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setFollowingAnchor:(BOOL)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setIsScrollingAcrossSections:(BOOL)a3;
- (void)setPagespotHistory:(id)a3;
- (void)setRectForFlowAnchor:(CGRect)a3;
- (void)setVisibleAbsolutePhysicalPageIndex:(unint64_t)a3;
- (void)setVisibleAbsolutePhysicalPageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setVisitedPagesAfterOpening:(BOOL)a3;
@end

@implementation THDocumentNavigator

- (THDocumentNavigator)initWithDocumentRoot:(id)a3 interactiveCanvasController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THDocumentNavigator;
  v6 = [(THDocumentNavigator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(THDocumentNavigator *)v6 setDocumentRoot:a3];
    v7->_interactiveCanvasController = (THInteractiveCanvasController *)a4;
    [(THBookspotHistoryStack *)[(THDocumentRoot *)v7->_documentRoot bookspotHistoryStack] setDelegate:v7];
  }
  return v7;
}

- (void)dealloc
{
  if ([(THBookspotHistoryStack *)[(THDocumentRoot *)self->_documentRoot bookspotHistoryStack] delegate] == self)[(THBookspotHistoryStack *)[(THDocumentRoot *)self->_documentRoot bookspotHistoryStack] setDelegate:0]; {

  }
  v3.receiver = self;
  v3.super_class = (Class)THDocumentNavigator;
  [(THDocumentNavigator *)&v3 dealloc];
}

- (void)setDocumentRoot:(id)a3
{
  documentRoot = self->_documentRoot;
  if (documentRoot != a3)
  {

    self->_documentRoot = (THDocumentRoot *)a3;
    self->_documentLinkResolver = [[THDocumentLinkResolver alloc] initWithDocumentRoot:a3];
  }
}

- (THSectionController)sectionController
{
  return (THSectionController *)[(THDocumentNavigatorDelegate *)self->_delegate sectionControllerForDocumentNavigator:self];
}

- (void)p_resolveLink:(id)a3 andCallBlock:(id)a4
{
  id v5 = a3;
  if (([a3 isPageLink] & 1) != 0
    || ([v5 isChapterGuidLink] & 1) != 0
    || [v5 isChapterLink])
  {
    unint64_t v7 = [(THDocumentLinkResolver *)[(THDocumentNavigator *)self documentLinkResolver] absolutePageNumberFromCustomLink:v5 presentationType:[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType]];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    unint64_t v8 = v7;
    id v9 = [(THModelNode *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] rootNode] contentNodeForRelativePageIndex:v7 forPresentationType:[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType]];
    v10 = (void (*)(id, unint64_t, id, id))*((void *)a4 + 2);
    id v11 = a4;
    unint64_t v12 = v8;
    goto LABEL_7;
  }
  id v13 = [(THDocumentLinkResolver *)[(THDocumentNavigator *)self documentLinkResolver] absoluteLink:v5 withContentNode:[(THDocumentNavigator *)self currentContentNode]];
  if (v13)
  {
    id v5 = v13;
    id v14 = [(THDocumentLinkResolver *)[(THDocumentNavigator *)self documentLinkResolver] contentNodeFromLink:v13];
    if (v14)
    {
      id v15 = v14;
      if ([v14 nodeBodyExists])
      {
        +[THContentLinkResolver navigableAnchorFromLink:v5 withContentNode:v15 presentationType:[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType]];
        objc_opt_class();
        uint64_t v16 = TSUDynamicCast();
        unint64_t v17 = v16
            ? [(THDocumentRoot *)self->_documentRoot absolutePageIndexForStorageAnchor:v16]: [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel] absolutePageIndexForContentNodeRelativePageIndex:0 inContentNode:v15 forPresentationType:+[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]]];
        unint64_t v12 = v17;
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = (void (*)(id, unint64_t, id, id))*((void *)a4 + 2);
          id v11 = a4;
          id v9 = v15;
LABEL_7:
          v10(v11, v12, v9, v5);
        }
      }
    }
  }
}

- (unint64_t)absolutePageIndexForLink:(id)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1BC8D4;
  v5[3] = &unk_45A958;
  v5[4] = &v6;
  [(THDocumentNavigator *)self p_resolveLink:a3 andCallBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)pageNumberStringForLink:(id)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_1BC9C4;
  v10 = sub_1BC9D4;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1BC9E0;
  v5[3] = &unk_45A980;
  v5[4] = self;
  void v5[5] = &v6;
  [(THDocumentNavigator *)self p_resolveLink:a3 andCallBlock:v5];
  unint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)followLink:(id)a3
{
  return [(THDocumentNavigator *)self followLink:a3 animated:1];
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isRelative]) {
    id v7 = [(THDocumentNavigator *)self p_anchorForLink:a3];
  }
  else {
    id v7 = [(THDocumentLinkResolver *)[(THDocumentNavigator *)self documentLinkResolver] anchorFromAbsoluteLink:a3 presentationType:[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType]];
  }
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:v4];
    BOOL v10 = [(THDocumentNavigator *)self followAnchor:v8 pulse:1];
    +[UIView setAnimationsEnabled:v9];
    return v10;
  }
  else
  {
    [(THDocumentNavigator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self failedToFollowLink:a3];
    }
    return 0;
  }
}

- (void)clearFlowAnchorCache
{
  self->_cachedFlowAnchorForRect = 0;
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  BOOL v4 = a4;
  [(THDocumentNavigator *)self setFollowingAnchor:1];
  if ([a3 contentNode])
  {
    id v7 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel];
    id v8 = [(NSArray *)[(THDocumentNavigationModel *)v7 navigationUnits] indexOfObject:[(THDocumentNavigationModel *)v7 navigationUnitContainingContentNode:[(THDocumentNavigator *)self currentContentNode]]];
    id v9 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](v7, "navigationUnits"), "indexOfObject:", -[THDocumentNavigationModel navigationUnitContainingContentNode:](v7, "navigationUnitContainingContentNode:", [a3 contentNode]));
    id v10 = v9;
    BOOL v11 = v8 == (id)0x7FFFFFFFFFFFFFFFLL || v8 == v9;
    int v12 = !v11;
    if (v11)
    {
      if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v13 = [(THDocumentNavigator *)self p_followDocumentAnchor:a3 pulse:v4];
        goto LABEL_23;
      }
    }
    else
    {
      [(THDocumentNavigator *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self willChangeFromChapterAtIndex:v8 toChapterAtIndex:v10];
      }
    }
    [(THDocumentNavigator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      -[THDocumentNavigatorDelegate documentNavigator:willChangeFromContentNode:toContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willChangeFromContentNode:toContentNode:", self, -[THDocumentNavigator currentContentNode](self, "currentContentNode"), [a3 contentNode]);
    }
    BOOL v13 = [(THDocumentNavigator *)self p_followDocumentAnchor:a3 pulse:v4];
    if (v12)
    {
      [(THDocumentNavigator *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self didChangeFromChapterAtIndex:v8 toChapterAtIndex:v10];
      }
    }
    [(THDocumentNavigator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      -[THDocumentNavigatorDelegate documentNavigator:didChangeFromContentNode:toContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didChangeFromContentNode:toContentNode:", self, -[THDocumentNavigator currentContentNode](self, "currentContentNode"), [a3 contentNode]);
    }
  }
  else
  {
    [(THDocumentNavigator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self failedToFollowAnchor:a3 pulse:v4];
    }
    BOOL v13 = 0;
  }
LABEL_23:
  [(THDocumentNavigator *)self setFollowingAnchor:0];

  self->_cachedFlowAnchorForRect = 0;
  return v13;
}

- (BOOL)p_followDocumentAnchor:(id)a3 pulse:(BOOL)a4
{
  BOOL v4 = a4;
  if (![a3 contentNode]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_followDocumentAnchor:pulse:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m") lineNumber:290 description:@"Attempt to follow nil contentNode anchor."];
  }
  if (![a3 contentNode]) {
    return 0;
  }
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (!v7)
  {
    objc_opt_class();
    uint64_t v8 = TSUDynamicCast();
    if (v8)
    {
      [(THDocumentNavigator *)self p_jumpToAnnotationAnchor:v8 pulse:v4];
      goto LABEL_12;
    }
    objc_opt_class();
    uint64_t v9 = TSUDynamicCast();
    if (v9)
    {
      [(THDocumentNavigator *)self p_jumpToPageAnchor:v9];
      goto LABEL_12;
    }
    objc_opt_class();
    uint64_t v10 = TSUDynamicCast();
    if (v10)
    {
      [(THDocumentNavigator *)self p_jumpToContentNodeAnchor:v10];
      goto LABEL_12;
    }
    return 0;
  }
  [(THDocumentNavigator *)self p_jumpToStorageAnchor:v7 pulse:v4];
LABEL_12:
  BOOL v11 = 1;
  [(THDocumentNavigator *)self setVisitedPagesAfterOpening:1];
  return v11;
}

- (void)p_scrollToAbsolutePageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel];
  id v8 = [(THDocumentNavigationModel *)v7 contentNodeForAbsolutePageIndex:a3];
  [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self willNavigateToAbsolutePageIndex:a3 inContentNode:v8];
  id v9 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
  if (v8)
  {
    id v10 = v9;
    if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
    {
      BOOL v11 = [(THDocumentNavigationModel *)v7 navigationUnitRelativePageIndexForAbsolutePageIndex:a3 forPresentationType:v10];
      [(THDocumentNavigator *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        unsigned int v12 = [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigatorIsInTwoPageMode:self];
        unint64_t v13 = a3 - 1;
        id v14 = v11 - 1;
        if ((v11 & 1) == 0)
        {
          id v14 = v11;
          unint64_t v13 = a3;
        }
        if (v12)
        {
          BOOL v11 = v14;
          a3 = v13;
        }
      }
      [(THSectionController *)[(THDocumentNavigator *)self sectionController] canvasRectForRelativePageIndex:v11];
    }
    else
    {
      id v23 = [v8 storageAnchorForNodeRelativePageIndex:[v8 relativePageIndexForAbsolutePageIndex:a3 forPresentationType:v10]];
      [v23 setAbsolutePageIndex:a3];
      [(THSectionController *)[(THDocumentNavigator *)self sectionController] rectForBodyAnchor:v23];
    }
    double x = v15;
    double y = v16;
    double width = v17;
    double height = v18;
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  v24 = [(THDocumentNavigator *)self delegate];

  -[THDocumentNavigatorDelegate documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:](v24, "documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:", self, a3, v4, 0, x, y, width, height);
}

- (void)setVisibleAbsolutePhysicalPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    [(THDocumentNavigator *)self p_scrollToAbsolutePageIndex:a3 animated:1];
  }
  else
  {
    +[CATransaction begin];
    [(THDocumentNavigator *)self p_scrollToAbsolutePageIndex:a3 animated:0];
    +[CATransaction commit];
  }
}

- (void)setVisibleAbsolutePhysicalPageIndex:(unint64_t)a3
{
  [(THDocumentNavigator *)self setVisibleAbsolutePhysicalPageIndex:a3 animated:0];

  [(THDocumentNavigator *)self setVisitedPagesAfterOpening:1];
}

- (unint64_t)relativePageIndexForLink:(id)a3
{
  -[THDocumentNavigator p_anchorForLink:](self, "p_anchorForLink:");
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(THDocumentNavigator *)self sectionController];
    return [(THSectionController *)v7 relativePageIndexForBodyStorageAnchor:v6];
  }
  else
  {
    id v9 = [(THDocumentLinkResolver *)[(THDocumentNavigator *)self documentLinkResolver] contentNodeFromLink:a3];
    if (v9)
    {
      id v10 = v9;
      if ([(THDocumentNavigator *)self sectionController]) {
        BOOL v11 = [(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType];
      }
      else {
        BOOL v11 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
      }
      unsigned int v12 = v11;
      unint64_t v13 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel];
      return [(THDocumentNavigationModel *)v13 navigationUnitRelativePageIndexForContentNodeRelativePageIndex:0 inContentNode:v10 forPresentationType:v12];
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
}

- (id)currentContentNode
{
  unint64_t v3 = [(THDocumentNavigator *)self currentNavigationUnitRelativePageIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v5 = v3;
  uint64_t v6 = [(THSectionController *)[(THDocumentNavigator *)self sectionController] currentNavigationUnit];
  id v7 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];

  return [(THNavigationUnit *)v6 contentNodeForRelativePageIndex:v5 forPresentationType:v7];
}

- (unint64_t)currentAbsolutePageIndexForBeginningOfVisibleCanvas
{
  if (![(THDocumentNavigator *)self sectionController]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    unint64_t v3 = [(THDocumentNavigator *)self sectionController];
    BOOL v4 = [(THDocumentNavigator *)self interactiveCanvasController];
    return [(THSectionController *)v3 absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:v4];
  }
  id v6 = [(THDocumentNavigator *)self currentPageLocation];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v6 absolutePhysicalPageIndex];
}

- (unint64_t)currentAbsolutePageIndexForEndOfVisibleCanvas
{
  if (![(THDocumentNavigator *)self sectionController]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    unint64_t v3 = [(THDocumentNavigator *)self sectionController];
    BOOL v4 = [(THDocumentNavigator *)self interactiveCanvasController];
    return [(THSectionController *)v3 absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:v4];
  }
  id v6 = [(THDocumentNavigator *)self currentPageLocation];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v6 absolutePhysicalPageIndex];
}

- (unint64_t)currentAbsolutePageIndex
{
  if (![(THDocumentNavigator *)self visitedPagesAfterOpening]
    || ![(THDocumentNavigator *)self sectionController])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    unint64_t v3 = [(THDocumentNavigator *)self sectionController];
    BOOL v4 = [(THDocumentNavigator *)self interactiveCanvasController];
    return [(THSectionController *)v3 absolutePageIndexForCenterOfVisibleRectInInteractiveCanvasController:v4];
  }
  id v5 = [[-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController") canvasView] enclosingScrollView];
  [v5 contentOffset];
  double v7 = v6;
  [v5 contentSize];
  double v9 = v8;
  [v5 frame];
  if (v7 >= 25.0)
  {
    if (v7 < v9 - v10 + -25.0) {
      goto LABEL_13;
    }
    id v11 = [[-[NSArray lastObject](-[THNavigationUnit contentNodes](-[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit"), "contentNodes"), "lastObject") pagesForPresentationType:+[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode"), "context"))] lastObject];
    if (!v11) {
      goto LABEL_13;
    }
LABEL_12:
    unint64_t result = (unint64_t)[v11 absolutePageIndex];
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    goto LABEL_13;
  }
  id v11 = [[[[-[NSArray firstObject](-[THNavigationUnit contentNodes](-[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit"), "contentNodes"), "firstObject") pagesForPresentationType:[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode"), "context"))] firstObject];
  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
  id v12 = [(THDocumentNavigator *)self currentPageLocation];
  if (!v12) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v13 = v12;
  unint64_t result = (unint64_t)[v12 absolutePhysicalPageIndex];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    return result;
  }
  id v14 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel] contentNodeForPageLocation:v13];
  if (!v14) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  double v15 = +[THModelStorageAnchor storageAnchorWithContentNode:v14 pageLocation:v13];
  double v16 = [(THDocumentNavigator *)self documentRoot];

  return [(THDocumentRoot *)v16 absolutePageIndexForStorageAnchor:v15];
}

- (id)currentPageInfoForEndOfVisibleCanvas
{
  id result = [(THDocumentNavigator *)self sectionController];
  if (result)
  {
    if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
    {
      BOOL v4 = [(THDocumentNavigator *)self sectionController];
      id v5 = [(THDocumentNavigator *)self interactiveCanvasController];
      return [(THSectionController *)v4 pageInfoForSecondQuadrantOfVisibleRectInInteractiveCanvasController:v5];
    }
    else
    {
      id v6 = +[THPresentationType flowPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
      id v7 = [(THDocumentNavigator *)self currentContentNode];
      return [v7 pageAtRelativeIndex:0 forPresentationType:v6];
    }
  }
  return result;
}

- (id)currentPageInfo
{
  if (![(THDocumentNavigator *)self visitedPagesAfterOpening]
    || ![(THDocumentNavigator *)self sectionController])
  {
    return 0;
  }
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    unint64_t v3 = [(THDocumentNavigator *)self sectionController];
    BOOL v4 = [(THDocumentNavigator *)self interactiveCanvasController];
    return [(THSectionController *)v3 pageInfoForCenterOfVisibleRectInInteractiveCanvasController:v4];
  }
  else
  {
    id v5 = +[THPresentationType flowPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
    id v6 = [(THDocumentNavigator *)self currentContentNode];
    return [v6 pageAtRelativeIndex:0 forPresentationType:v5];
  }
}

- (id)currentBookspotLocation
{
  id v3 = [(THDocumentNavigator *)self storageAnchorForCurrentPage];
  if (v3)
  {
    BOOL v4 = +[THPageLocation pageLocationWithStorageAnchor:v3];
    if ([(THPageLocation *)v4 absolutePhysicalPageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      [(THPageLocation *)v4 setAbsolutePhysicalPageIndex:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] absolutePageIndexForStorageAnchor:v3]];
    }
    return v4;
  }
  else
  {
    id v6 = [[THPageLocation alloc] initWithAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
    return v6;
  }
}

- (_NSRange)currentAbsolutePageIndexRange
{
  if (![(THDocumentNavigator *)self sectionController]) {
    goto LABEL_6;
  }
  if (![(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    id v5 = [(THDocumentNavigator *)self currentPageLocation];
    if (v5)
    {
      unint64_t v3 = (unint64_t)[v5 absolutePhysicalPageIndex];
LABEL_7:
      BOOL v4 = (unsigned char *)(&dword_0 + 1);
      goto LABEL_8;
    }
LABEL_6:
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  unint64_t v3 = [(THSectionController *)[(THDocumentNavigator *)self sectionController] absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:[(THDocumentNavigator *)self interactiveCanvasController]];
  BOOL v4 = (char *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:[(THDocumentNavigator *)self interactiveCanvasController]]- v3+ 1;
LABEL_8:
  NSUInteger v6 = v3;
  result.length = (NSUInteger)v4;
  result.location = v6;
  return result;
}

- (BOOL)jumpToPageLocation:(id)a3 touchHistory:(BOOL)a4 minor:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (a4) {
    [(THBookspotHistoryStack *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack] recordCurrentLocationInHistory];
  }
  id v9 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel] contentNodeForPageLocation:a3];
  if (v9)
  {
    [(THDocumentNavigator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self willJumpToPageLocation:a3];
    }
    if ([a3 storageUID])
    {
      double v10 = [[THModelStorageAnchor alloc] initWithContentNode:v9 pageLocation:a3];
      if ([(THBookDescription *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookDescription] isEpub])
      {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v11 = (uint64_t)[a3 absolutePhysicalPageIndex];
      }
      [(THModelStorageAnchor *)v10 setAbsolutePageIndex:v11];
      [(THDocumentNavigator *)self followAnchor:v10 pulse:0];
    }
    else
    {
      id v12 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelNode *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] rootNode] context]];
      -[THDocumentNavigator followAnchor:pulse:](self, "followAnchor:pulse:", -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", v9, objc_msgSend(v9, "relativePageIndexForAbsolutePageIndex:forPresentationType:", objc_msgSend(a3, "absolutePhysicalPageIndex"), v12), v12), 0);
    }
    [(THDocumentNavigator *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self didJumpToPageLocation:a3];
    }
    if (v6) {
      [(THBookspotHistoryStack *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack] gotoBookspot:a3 minor:v5];
    }
    id v13 = [a3 copy];
    id v14 = +[NSNotificationCenter defaultCenter];
    double v15 = THNavigationHistoryDidChangeNotification;
    v17[0] = @"pageLocation";
    v17[1] = @"minor";
    v18[0] = v13;
    v18[1] = +[NSNumber numberWithBool:v5];
    [(NSNotificationCenter *)v14 postNotificationName:v15 object:+[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2]];
  }
  return v9 != 0;
}

- (unint64_t)currentAbsolutePageIndexForBookmarksUsingViewCenter:(BOOL)a3
{
  if (a3) {
    return [(THDocumentNavigator *)self currentAbsolutePageIndex];
  }
  else {
    return [(THDocumentNavigator *)self currentAbsolutePageIndexForEndOfVisibleCanvas];
  }
}

- (id)currentPageInfoForBookmarksUsingViewCenter:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated]|| ![(THBookDescription *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookDescription] isEpub])
  {
    if (v3)
    {
      return [(THDocumentNavigator *)self currentPageInfo];
    }
    else
    {
      return [(THDocumentNavigator *)self currentPageInfoForEndOfVisibleCanvas];
    }
  }
  else
  {
    id result = [(THSectionController *)[(THDocumentNavigator *)self sectionController] currentNavigationUnit];
    if (result)
    {
      id v6 = [(THDocumentNavigator *)self p_bodyStorageAnchorForFlow];
      +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
      id v7 = [v6 contentNode];
      return [v7 pageInfoForStorageAnchor:forPresentationType:];
    }
  }
  return result;
}

- (unint64_t)currentChapterIndex
{
  BOOL v3 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel];
  id v4 = [(THDocumentNavigator *)self currentContentNode];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = v4;
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = [(THDocumentNavigationModel *)v3 navigationUnits];
  id v7 = [(THDocumentNavigationModel *)v3 navigationUnitContainingContentNode:v5];

  return [(NSArray *)v6 indexOfObject:v7];
}

- (id)p_bodyStorageAnchorForAbsolutePageIndex:(unint64_t)a3
{
  id v5 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel] contentNodeForAbsolutePageIndex:a3];
  id v6 = [v5 relativePageIndexForAbsolutePageIndex:a3 forPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
  id v7 = [v5 storageAnchorForNodeRelativePageIndex:v6];
  [v7 setNodeRelativePageIndex:v6];
  return v7;
}

- (id)p_bodyStorageAnchorForFlow
{
  [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] visibleUnscaledRect];

  return -[THDocumentNavigator p_bodyStorageAnchorForFlowInRect:](self, "p_bodyStorageAnchorForFlowInRect:");
}

- (id)p_bodyStorageAnchorForFlowInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(THDocumentNavigator *)self rectForFlowAnchor];
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  if (!CGRectEqualToRect(v18, v19)
    || ![(THDocumentNavigator *)self cachedFlowAnchorForRect]
    || [(THDocumentNavigator *)self followingAnchor])
  {
    id v8 = -[THSectionController bodyAnchorForCanvasRect:]([(THDocumentNavigator *)self sectionController], "bodyAnchorForCanvasRect:", x, y, width, height);
    id v9 = [(THDocumentNavigator *)self p_flowPivotRangeForBodyAnchor:v8];
    uint64_t v11 = v10;
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_bodyStorageAnchorForFlowInRect:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m") lineNumber:778 description:@"Failed to find a flow pivot range."];
    }
    id v12 = [v8 contentNode];
    id v13 = [v12 relativePageIndexForBodyCharacterIndex:v9];

    self->_cachedFlowAnchorForRect = 0;
    id v14 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v12, [v8 storageUID], v9, v11);
    self->_cachedFlowAnchorForRect = v14;
    [(THModelStorageAnchor *)v14 setNodeRelativePageIndex:v13];
    -[THDocumentNavigator setRectForFlowAnchor:](self, "setRectForFlowAnchor:", x, y, width, height);
  }
  double v15 = [(THDocumentNavigator *)self cachedFlowAnchorForRect];

  return v15;
}

- (id)storageAnchorForCurrentPage
{
  if (![(THDocumentNavigator *)self sectionController]) {
    return 0;
  }
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    unint64_t v3 = [(THDocumentNavigator *)self currentAbsolutePageIndex];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    return [(THDocumentNavigator *)self p_bodyStorageAnchorForAbsolutePageIndex:v3];
  }
  else
  {
    return [(THDocumentNavigator *)self p_bodyStorageAnchorForFlow];
  }
}

- (id)storageAnchorForAbsolutePageIndex:(unint64_t)a3
{
  if (![(THDocumentNavigator *)self sectionController]) {
    return 0;
  }
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    return [(THDocumentNavigator *)self p_bodyStorageAnchorForAbsolutePageIndex:a3];
  }
  else
  {
    return [(THDocumentNavigator *)self p_bodyStorageAnchorForFlow];
  }
}

- (id)storageAnchorForBookmarksUsingViewCenter:(BOOL)a3
{
  BOOL v3 = a3;
  id result = [(THDocumentNavigator *)self sectionController];
  if (result)
  {
    if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
    {
      unint64_t v6 = [(THDocumentNavigator *)self currentAbsolutePageIndexForBookmarksUsingViewCenter:v3];
      return [(THDocumentNavigator *)self p_bodyStorageAnchorForAbsolutePageIndex:v6];
    }
    else
    {
      return [(THDocumentNavigator *)self p_bodyStorageAnchorForFlow];
    }
  }
  return result;
}

- (id)currentPageLocationForCenterOfVisibleRectInInteractiveCanvasController
{
  [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] visibleUnscaledRect];
  id v3 = -[THDocumentNavigator p_bodyStorageAnchorForFlowInRect:](self, "p_bodyStorageAnchorForFlowInRect:");
  if (v3)
  {
    return +[THPageLocation pageLocationWithStorageAnchor:v3];
  }
  else
  {
    unint64_t v5 = [(THDocumentNavigator *)self currentAbsolutePageIndex];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      unint64_t v6 = [[THPageLocation alloc] initWithAbsolutePageIndex:v5];
      return v6;
    }
  }
}

- (id)currentPageLocation
{
  id v3 = [(THDocumentNavigator *)self storageAnchorForCurrentPage];
  if (v3)
  {
    return +[THPageLocation pageLocationWithStorageAnchor:v3];
  }
  else
  {
    unint64_t v5 = [(THDocumentNavigator *)self currentAbsolutePageIndex];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      unint64_t v6 = [[THPageLocation alloc] initWithAbsolutePageIndex:v5];
      return v6;
    }
  }
}

- (id)pageLocationForAbsolutePageIndex:(unint64_t)a3
{
  id v4 = -[THDocumentNavigator storageAnchorForAbsolutePageIndex:](self, "storageAnchorForAbsolutePageIndex:");
  if (v4)
  {
    return +[THPageLocation pageLocationWithStorageAnchor:v4];
  }
  else if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  else
  {
    unint64_t v6 = [[THPageLocation alloc] initWithAbsolutePageIndex:a3];
    return v6;
  }
}

- (id)readingProgress
{
  return [(THDocumentNavigator *)self readingProgressAllowSample:0];
}

- (id)readingProgressAllowSample:(BOOL)a3
{
  if ([(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] reflowablePaginationController]&& ![(THReflowablePaginationController *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] reflowablePaginationController] paginationComplete])
  {
    return 0;
  }
  id result = [(THDocumentNavigator *)self currentPageLocation];
  if (!result) {
    return result;
  }
  id v6 = result;
  if (!a3
    && [(THBookDescription *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookDescription] isSample])
  {
    return 0;
  }
  unint64_t v7 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel] pageCount];
  if (!v7) {
    return &off_499008;
  }
  *(float *)&double v8 = (float)(unint64_t)[v6 absolutePhysicalPageIndex] / (float)v7;

  return +[NSNumber numberWithFloat:v8];
}

- (id)linkForURL:(id)a3 inStorage:(id)a4
{
  id v6 = [(THNavigationUnit *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] currentNavigationUnit] contentNodeForInfo:a4];

  return [(THDocumentNavigator *)self linkForURL:a3 inContentNode:v6];
}

- (id)linkForURL:(id)a3 inContentNode:(id)a4
{
  unint64_t v7 = (NSString *)[a3 absoluteString];
  if (![a3 scheme])
  {
    if ([(NSString *)v7 hasPrefix:@"OPS/"]) {
      unint64_t v7 = [(NSString *)v7 substringFromIndex:4];
    }
    if (a4)
    {
      double v8 = [@"apub:///0/0/0/" stringByAppendingString:[a4 applePubRelativePath]];
      if ([(NSString *)v7 characterAtIndex:0] != 35) {
        double v8 = [[+[NSURL URLWithString:[(NSString *)v8 stringByAppendingString:@"/../"]] standardizedURL] absoluteString];
      }
      unint64_t v7 = [(NSString *)v8 stringByAppendingString:v7];
    }
  }
  id v9 = [[THModelLink alloc] initWithTarget:v7 context:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];

  return v9;
}

- (_NSRange)p_flowPivotRangeForBodyAnchor:(id)a3
{
  if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_flowPivotRangeForBodyAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m") lineNumber:1009 description:@"Attempting to calculate flow pivot text for rotation when not in flow mode."];
  }
  id v5 = [a3 range];
  BOOL v7 = v6;
  if (![(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isPaginated])
  {
    double v8 = [(THDocumentNavigator *)self sectionController];
    [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] visibleUnscaledRect];
    id v9 = -[THSectionController firstLineInRect:forBodyAnchor:](v8, "firstLineInRect:forBodyAnchor:", a3);
    uint64_t v11 = (uint64_t)v9 + v10 - 1;
    if (!v10) {
      uint64_t v11 = (uint64_t)v9;
    }
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v7 = v10 != 0;
      id v5 = (id)v11;
    }
  }
  NSUInteger v12 = (NSUInteger)v5;
  NSUInteger v13 = v7;
  result.length = v13;
  result.location = v12;
  return result;
}

- (unint64_t)currentNavigationUnitRelativePageIndex
{
  unint64_t v3 = [(THDocumentNavigator *)self currentAbsolutePageIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = v3;
  BOOL v6 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel];
  id v7 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];

  return [(THDocumentNavigationModel *)v6 navigationUnitRelativePageIndexForAbsolutePageIndex:v5 forPresentationType:v7];
}

- (void)p_jumpToContentNodeAnchor:(id)a3
{
  if (a3)
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "contentNode"), "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
    -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, v5, [a3 contentNode]);
    if ([(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] isCorrupt])
    {
      BOOL v6 = [(THDocumentNavigator *)self delegate];
      -[THDocumentNavigatorDelegate documentNavigatorBookIsCorrupt:](v6, "documentNavigatorBookIsCorrupt:", self, v7, v8, v9, v10, v11, v12, v13);
    }
    else
    {
      id v14 = [[[a3 contentNode] pageCountForPresentationType:[self sectionController].presentationType];
      if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = (uint64_t)v14;
      }
      -[THSectionController ensureLayoutThroughRelativePageRange:]([(THDocumentNavigator *)self sectionController], "ensureLayoutThroughRelativePageRange:", 0, v15);
      -[THSectionController sectionOriginForContentNode:](-[THDocumentNavigator sectionController](self, "sectionController"), "sectionOriginForContentNode:", [a3 contentNode]);
      if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        double v18 = v16;
        double v19 = v17;
        -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, v5, [a3 contentNode]);
        v20 = [(THDocumentNavigator *)self delegate];
        -[THDocumentNavigatorDelegate documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:](v20, "documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:", self, v5, 0, 0, v18, v19, 1.0, 1.0);
      }
    }
  }
}

- (void)p_jumpToPageAnchor:(id)a3
{
  if (a3)
  {
    id v4 = [a3 absolutePageIndex];
    [(THDocumentNavigator *)self setVisibleAbsolutePhysicalPageIndex:v4 animated:1];
  }
}

- (id)p_anchorForLink:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_1BC9C4;
  double v10 = sub_1BC9D4;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1BEAE0;
  v5[3] = &unk_45A9A8;
  void v5[5] = a3;
  void v5[6] = &v6;
  v5[4] = self;
  [(THDocumentNavigator *)self p_resolveLink:a3 andCallBlock:v5];
  unint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)p_jumpToStorageAnchor:(id)a3 pulse:(BOOL)a4
{
  if (!a3) {
    return;
  }
  BOOL v4 = a4;
  id v7 = [a3 contentNode];
  if ([(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] isCorrupt])
  {
    uint64_t v8 = [(THDocumentNavigator *)self delegate];
    [(THDocumentNavigatorDelegate *)v8 documentNavigatorBookIsCorrupt:self];
    return;
  }
  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated")&& [a3 absolutePageIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v32 = [a3 absolutePageIndex];
    [(THDocumentNavigator *)self p_scrollToAbsolutePageIndex:v32 animated:0];
  }
  else
  {
    id v9 = [v7 bodyStorageForPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
    if (!v9) {
      id v9 = [v7 bodyStorageForPresentationType:[THPresentationType flowPresentationTypeInContext:[THDocumentRoot context][THDocumentNavigator documentRoot](self, "documentRoot")]];
    }
    if (objc_msgSend(objc_msgSend(v7, "nodeUniqueIDForInfo:", v9), "isEqual:", objc_msgSend(a3, "storageUID")))
    {
      if ([(THBookDescription *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookDescription] isEpub])
      {
        unint64_t v10 = 0;
      }
      else
      {
        unint64_t v10 = [(THSectionController *)[(THDocumentNavigator *)self sectionController] absolutePageIndexForBodyStorageAnchor:a3];
      }
      [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self willNavigateToAbsolutePageIndex:v10 inContentNode:v7];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1BF3A0;
      v56[3] = &unk_458E48;
      v56[4] = self;
      v56[5] = a3;
      BOOL v57 = v4;
      if (v4) {
        id v33 = a3;
      }
      else {
        id v33 = 0;
      }
      v34 = v56;
LABEL_34:
      v35 = self;
LABEL_35:
      [(THDocumentNavigator *)v35 p_jumpWithBlock:v34 andPulseStorageAnchor:v33];
      return;
    }
    id v11 = [v7 infoForNodeUniqueID:[a3 storageUID] forPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
    if (!v11) {
      return;
    }
    id v12 = v11;
    double v13 = [(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType];
    if ([(THPresentationType *)v13 isFlow])
    {
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      id v17 = [v7 infoForNodeUniqueID:[a3 storageUID] forPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
      CGFloat v18 = height;
      CGFloat v19 = width;
      CGFloat v20 = y;
      CGFloat x = CGRectZero.origin.x;
      if (v17)
      {
        id v22 = v17;
        id v23 = 0;
        do
        {
          objc_opt_class();
          v24 = (void *)TSUClassAndProtocolCast();
          id v22 = [v22 parentInfo:&OBJC_PROTOCOL___TSDInfo];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v23 = v22;
          }
        }
        while (v22);
        CGFloat v18 = height;
        CGFloat v19 = width;
        CGFloat v20 = y;
        CGFloat x = CGRectZero.origin.x;
        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v23)
          {
            uint64_t v52 = 0;
            v53 = &v52;
            uint64_t v54 = 0x2020000000;
            uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v25 = objc_opt_class();
            id v26 = [v24 range];
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_1BF43C;
            v51[3] = &unk_45A9D0;
            v51[4] = v23;
            v51[5] = &v52;
            [v24 enumerateAttachmentsOfClass:v25 inTextRange:v26 usingBlock:v27];
            CGFloat v18 = height;
            CGFloat v19 = width;
            CGFloat v20 = y;
            CGFloat x = CGRectZero.origin.x;
            if (v53[3] != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, [a3 absolutePageIndex], objc_msgSend(a3, "contentNode"));
              [(THSectionController *)[(THDocumentNavigator *)self sectionController] rectForBodyAnchor:+[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v7, 0, v53[3], 1)];
              CGFloat x = v28;
              CGFloat v20 = v29;
              CGFloat v19 = v30;
              CGFloat v18 = v31;
            }
            _Block_object_dispose(&v52, 8);
          }
          else
          {
            -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, [a3 absolutePageIndex], objc_msgSend(a3, "contentNode"));
            [(THSectionController *)[(THDocumentNavigator *)self sectionController] rectForContentNode:v7 layout:[(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] validatedLayoutForInfo:v24]];
            CGFloat x = v37;
            CGFloat v20 = v38;
            CGFloat v19 = v39;
            CGFloat v18 = v40;
          }
        }
      }
      v59.origin.CGFloat x = x;
      v59.origin.CGFloat y = v20;
      v59.size.CGFloat width = v19;
      v59.size.CGFloat height = v18;
      v61.origin.CGFloat x = CGRectZero.origin.x;
      v61.origin.CGFloat y = y;
      v61.size.CGFloat width = width;
      v61.size.CGFloat height = height;
      if (CGRectEqualToRect(v59, v61))
      {
        id v41 = [(THDocumentNavigator *)self p_bodyRangeForStorageAnchorInFlow:a3];
        if (v41 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_jumpToStorageAnchor:pulse:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m") lineNumber:1234 description:@"Failed to find bodyRange in flow for targetStorageAnchor %@", a3];
        }
        else
        {
          v43 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v7, 0, v41, v42);
          -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, [a3 absolutePageIndex], objc_msgSend(a3, "contentNode"));
          [(THSectionController *)[(THDocumentNavigator *)self sectionController] rectForBodyAnchor:v43];
          CGFloat x = v44;
          CGFloat v20 = v45;
          CGFloat v19 = v46;
          CGFloat v18 = v47;
        }
      }
      v60.origin.CGFloat x = x;
      v60.origin.CGFloat y = v20;
      v60.size.CGFloat width = v19;
      v60.size.CGFloat height = v18;
      v62.origin.CGFloat x = CGRectZero.origin.x;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      v62.size.CGFloat height = height;
      if (!CGRectEqualToRect(v60, v62))
      {
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1BF494;
        v49[3] = &unk_45A9F8;
        v49[4] = self;
        v49[5] = a3;
        *(CGFloat *)&v49[6] = x;
        *(CGFloat *)&v49[7] = v20;
        *(CGFloat *)&v49[8] = v19;
        *(CGFloat *)&v49[9] = v18;
        BOOL v50 = v4;
        v34 = v49;
        v35 = self;
        id v33 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      if ([(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] reflowablePaginationController])
      {
        id v36 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] absolutePageIndexForStorageAnchor:a3];
      }
      else
      {
        id v36 = [v7 absolutePageIndexForRelativePageIndex:[v7 relativePageIndexForInfo:v12 forPresentationType:v13] forPresentationType:v13];
      }
      if (v36 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1BF4FC;
        v48[3] = &unk_457250;
        v48[4] = self;
        v48[5] = v36;
        if (v4) {
          id v33 = a3;
        }
        else {
          id v33 = 0;
        }
        v34 = v48;
        goto LABEL_34;
      }
    }
  }
}

- (void)p_jumpToAnnotationAnchor:(id)a3 pulse:(BOOL)a4
{
  if (a3)
  {
    id v6 = objc_msgSend(a3, "annotation", _NSConcreteStackBlock, 3221225472, sub_1BF5C4, &unk_457250, self, objc_msgSend(a3, "absolutePageIndex"));
    id v7 = [a3 noteRange];
    -[THDocumentNavigator p_jumpWithBlock:annotation:noteSelectionRange:](self, "p_jumpWithBlock:annotation:noteSelectionRange:", &v9, v6, v7, v8);
  }
}

- (void)p_jumpWithBlock:(id)a3 andPulseStorageAnchor:(id)a4
{
  if (a3)
  {
    id v7 = [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self willJumpToStorageAnchor:a4];
    (*((void (**)(id))a3 + 2))(a3);
    if (a4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1BF75C;
      v11[3] = &unk_456E38;
      v11[4] = self;
      v11[5] = a4;
      [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] performBlockAfterNextLayout:v11];
      [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] layoutInvalidated];
      [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] layoutIfNeeded];
      if ([(THPresentationType *)[(THSectionController *)[(THDocumentNavigator *)self sectionController] presentationType] isFlow])
      {
        (*((void (**)(id))a3 + 2))(a3);
      }
    }
    [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self didJumpToStorageAnchor:a4 withWillJumpReturn:v7];
  }
  else
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_jumpWithBlock:andPulseStorageAnchor:]");
    unint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:1299 description:@"Requested a jump without providing jump instructions."];
  }
}

- (void)p_jumpWithBlock:(id)a3 annotation:(id)a4 noteSelectionRange:(_NSRange)a5
{
  if (a3)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    id v10 = [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self willJumpToStorageAnchor:0];
    (*((void (**)(id))a3 + 2))(a3);
    if (a4)
    {
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v15[0] = 0;
        v15[1] = v15;
        v15[2] = 0x3052000000;
        v15[3] = sub_1BC9C4;
        v15[4] = sub_1BC9D4;
        v15[5] = self;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1BF95C;
        v14[3] = &unk_45AA20;
        v14[4] = self;
        v14[5] = a4;
        v14[6] = v15;
        v14[7] = location;
        v14[8] = length;
        [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] performBlockAfterNextLayout:v14];
        [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] layoutInvalidated];
        [(THInteractiveCanvasController *)[(THDocumentNavigator *)self interactiveCanvasController] layoutIfNeeded];
        _Block_object_dispose(v15, 8);
      }
    }
    [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigator:self didJumpToStorageAnchor:0 withWillJumpReturn:v10];
  }
  else
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_jumpWithBlock:annotation:noteSelectionRange:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:1362 description:@"Requested a jump without providing jump instructions."];
  }
}

- (void)p_pulseStorageAnchor:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "contentNode"), "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [(THDocumentNavigator *)self interactiveCanvasController];
    id v9 = [a3 range];
    -[THInteractiveCanvasController pulseStorage:range:](v7, "pulseStorage:range:", v6, v9, v8);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_pulseStorageAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m") lineNumber:1393 description:@"Failed to find a storage for anchor %@", a3];
  }
}

- (_NSRange)p_bodyRangeForStorageAnchorInFlow:(id)a3
{
  uint64_t v5 = [(THDocumentNavigator *)self sectionController];

  id v6 = [(THDocumentNavigator *)self bodyRangeForStorageAnchorInFlow:a3 sectionController:v5];
  result.NSUInteger length = v7;
  result.NSUInteger location = (NSUInteger)v6;
  return result;
}

- (_NSRange)bodyRangeForStorageAnchorInFlow:(id)a3 sectionController:(id)a4
{
  id v7 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
  id v8 = +[THPresentationType flowPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] context]];
  id v9 = [a3 contentNode];
  [v9 infoForNodeUniqueID:[a3 storageUID] forPresentationType:v7];
  objc_opt_class();
  uint64_t v10 = TSUClassAndProtocolCast();
  if (!v10)
  {
    [v9 infoForNodeUniqueID:[a3 storageUID] forPresentationType:v8];
    objc_opt_class();
    uint64_t v10 = TSUClassAndProtocolCast();
  }
  NSUInteger v11 = (NSUInteger)-[THDocumentNavigator p_bodyRangeForPossiblyAttachedInfo:body:](self, "p_bodyRangeForPossiblyAttachedInfo:body:", v10, objc_msgSend(objc_msgSend(a3, "contentNode", &OBJC_PROTOCOL___TSDInfo), "bodyStorageForPresentationType:", objc_msgSend(a4, "presentationType")));
  NSUInteger v13 = v12;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = objc_msgSend(objc_msgSend(a3, "contentNode"), "relativePageIndexForInfo:forPresentationType:", v10, v7);
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    id v15 = objc_msgSend(objc_msgSend(a3, "contentNode", 0x7FFFFFFFFFFFFFFFLL), "relativePageIndexForInfo:forPresentationType:", v10, v8);
    id v14 = v15;
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL && v10)
    {
      id v16 = objc_msgSend(objc_msgSend(a3, "contentNode", 0x7FFFFFFFFFFFFFFFLL), "pageAtRelativeIndex:forPresentationType:", 0, v8);
      if (v16 && (id)TSDTopmostInfoFromInfo() == v16)
      {
        id v14 = 0;
        goto LABEL_12;
      }
    }
    else if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_12:
      id v17 = [v9 storageAnchorForNodeRelativePageIndex:v14];
      if (v17)
      {
        NSUInteger v11 = (NSUInteger)[v17 range];
        NSUInteger v13 = v18;
      }
      else
      {
        NSUInteger v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_15;
    }
    id v14 = [a3 nodeRelativePageIndex];
    NSUInteger v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
LABEL_15:
  NSUInteger v19 = v13;
  result.NSUInteger length = v19;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)p_bodyRangeForPossiblyAttachedInfo:(id)a3 body:(id)a4
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3010000000;
  NSUInteger v19 = &unk_41622E;
  long long v20 = xmmword_3447B0;
  objc_opt_class();
  TSDTopmostOwningAttachmentFromInfo();
  uint64_t v5 = (void *)TSUDynamicCast();
  if (v5)
  {
    id v6 = [v5 findCharIndex];
    id v7 = v17;
    uint64_t v8 = 1;
    v17[4] = (uint64_t)v6;
    v7[5] = 1;
  }
  else
  {
    uint64_t v9 = TSDTopmostInfoFromInfo();
    uint64_t v10 = objc_opt_class();
    id v11 = [a4 range];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1BFE94;
    v15[3] = &unk_45A9D0;
    v15[4] = v9;
    v15[5] = &v16;
    [a4 enumerateAttachmentsOfClass:v10 inTextRange:v11 usingBlock:v12 v15];
    id v6 = (id)v17[4];
    uint64_t v8 = v17[5];
  }
  _Block_object_dispose(&v16, 8);
  NSUInteger v13 = (NSUInteger)v6;
  NSUInteger v14 = v8;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (unint64_t)lastAbsolutePageIndex
{
  objc_opt_class();
  [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] rootNode];
  id v3 = [[TSUDynamicCast() childNodes] lastObject];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v4 = [v3 absolutePageRangeForPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (&v4[v5]) {
    return (unint64_t)&v4[v5 - 1];
  }
  return 0;
}

- (unint64_t)absolutePageIndexForPreviousSection
{
  id v3 = [(THDocumentNavigator *)self currentContentNode];
  objc_opt_class();
  [v3 parent];
  BOOL v4 = (void *)TSUDynamicCast();
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    id v6 = v4;
    id v7 = [v4 absolutePageRangeForPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v5 = (unint64_t)v7;
      if (v7 >= (id)[(THDocumentNavigator *)self currentAbsolutePageIndexForBeginningOfVisibleCanvas])
      {
        objc_opt_class();
        [v6 previousSibling];
        uint64_t v8 = (void *)TSUDynamicCast();
        if (v8) {
          return (unint64_t)[-[THDocumentNavigator sectionController](self, "sectionController") presentationType];
        }
        else {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)absolutePageIndexForEndOfPreviousSection
{
  id v3 = [(THDocumentNavigator *)self currentContentNode];
  objc_opt_class();
  [v3 parent];
  uint64_t v4 = TSUDynamicCast();
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = (void *)v4;
  objc_opt_class();
  [v5 previousSibling];
  id v6 = (void *)TSUDynamicCast();
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    id v8 = [v6 absolutePageRangeForPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL && v9 != 0) {
      return (unint64_t)v8 + v9 - 1;
    }
  }
  return v7;
}

- (unint64_t)absolutePageIndexForNextSection
{
  id v3 = [(THDocumentNavigator *)self currentContentNode];
  objc_opt_class();
  [v3 parent];
  uint64_t v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v4 nextSibling];
  unint64_t v5 = (void *)TSUDynamicCast();
  if (v5) {
    return (unint64_t)[-[THDocumentNavigator sectionController](self, "sectionController") presentationType];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)nextVisibleAbsolutePageNumber
{
  [(THDocumentNavigator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    id v3 = (char *)[(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] visiblePageCountForDocumentNavigator:self];
  }
  else {
    id v3 = (unsigned char *)(&dword_0 + 1);
  }
  unint64_t v4 = [(THDocumentNavigator *)self currentAbsolutePageIndex];
  if (&v3[v4] <= (char *)[(THDocumentNavigator *)self lastAbsolutePageIndex]) {
    return (unint64_t)&v3[v4];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)previousVisibleAbsolutePageNumber
{
  [(THDocumentNavigator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    id v3 = [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] visiblePageCountForDocumentNavigator:self];
  }
  else {
    id v3 = &dword_0 + 1;
  }
  unint64_t v4 = [(THDocumentNavigator *)self currentAbsolutePageIndex];
  unint64_t v5 = [(THDocumentNavigator *)self absolutePageIndexForBeginningOfSection];
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return v6;
  }
  if (v4 > v5)
  {
    unint64_t v6 = v5;
    if (v4 < (unint64_t)v3 + v5) {
      return v6;
    }
  }
  if (v4 != v5)
  {
    unint64_t v6 = v4 - (void)v3;
    if (v4 < (unint64_t)v3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    return v6;
  }

  return [(THDocumentNavigator *)self absolutePageIndexForEndOfPreviousSection];
}

- (unint64_t)absolutePageIndexForBeginningOfSection
{
  id v3 = [(THDocumentNavigator *)self currentContentNode];
  objc_opt_class();
  [v3 parent];
  unint64_t v4 = (void *)TSUDynamicCast();
  if (v4) {
    return (unint64_t)[-[THDocumentNavigator sectionController](self, "sectionController") presentationType];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)absolutePageIndexForEndOfSection
{
  id v3 = [(THDocumentNavigator *)self currentContentNode];
  objc_opt_class();
  [v3 parent];
  unint64_t v4 = (void *)TSUDynamicCast();
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    id v6 = [v4 absolutePageRangeForPresentationType:[-[THDocumentNavigator sectionController](self, "sectionController") presentationType]];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != 0) {
      return (unint64_t)v6 + v7 - 1;
    }
  }
  return v5;
}

- (BOOL)canNavigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  if ([(THDocumentNavigator *)self currentAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      unint64_t v7 = [(THDocumentNavigator *)self lastAbsolutePageIndex];
      switch(a4)
      {
        case 0:
          id v8 = +[TSUAssertionHandler currentHandler];
          uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator canNavigateByBookDirection:bookGranularity:]");
          uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"];
          id v11 = v8;
          uint64_t v12 = v9;
          uint64_t v13 = 1697;
          goto LABEL_8;
        case 1:
          BOOL result = [(THDocumentNavigator *)self nextVisibleAbsolutePageNumber] <= v7;
          break;
        case 2:
          unint64_t v17 = [(THDocumentNavigator *)self absolutePageIndexForBeginningOfSection];
          goto LABEL_18;
        case 3:
          unint64_t v17 = [(THDocumentNavigator *)self absolutePageIndexForNextSection];
          goto LABEL_18;
        case 4:
          goto LABEL_11;
        default:
          return 0;
      }
      return result;
    }
    return 0;
  }
  switch(a4)
  {
    case 0:
      id v14 = +[TSUAssertionHandler currentHandler];
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator canNavigateByBookDirection:bookGranularity:]");
      uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"];
      id v11 = v14;
      uint64_t v12 = v15;
      uint64_t v13 = 1738;
LABEL_8:
      [v11 handleFailureInFunction:v12 file:v10 lineNumber:v13 description:@"Not implemented."];
      return 0;
    case 1:
      unint64_t v17 = [(THDocumentNavigator *)self previousVisibleAbsolutePageNumber];
      goto LABEL_18;
    case 2:
      unint64_t v17 = [(THDocumentNavigator *)self absolutePageIndexForEndOfSection];
      goto LABEL_18;
    case 3:
      unint64_t v17 = [(THDocumentNavigator *)self absolutePageIndexForPreviousSection];
LABEL_18:
      BOOL result = v17 != 0x7FFFFFFFFFFFFFFFLL;
      break;
    case 4:
LABEL_11:
      BOOL result = 1;
      break;
    default:
      return 0;
  }
  return result;
}

- (void)scrollToNextSection
{
  [(THDocumentNavigator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THDocumentNavigator *)self setIsScrollingAcrossSections:1];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1C0730;
    v4[3] = &unk_457250;
    v4[4] = self;
    v4[5] = [(THDocumentNavigator *)self absolutePageIndexForNextSection];
    [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigatorWillScrollToNextSection:self completionBlock:v4];
  }
  else
  {
    unint64_t v3 = [(THDocumentNavigator *)self absolutePageIndexForNextSection];
    [(THDocumentNavigator *)self setVisibleAbsolutePhysicalPageIndex:v3];
  }
}

- (void)scrollToPreviousSection
{
  [(THDocumentNavigator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THDocumentNavigator *)self setIsScrollingAcrossSections:1];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1C0854;
    v4[3] = &unk_457250;
    v4[4] = self;
    v4[5] = [(THDocumentNavigator *)self previousVisibleAbsolutePageNumber];
    [(THDocumentNavigatorDelegate *)[(THDocumentNavigator *)self delegate] documentNavigatorWillScrollToPreviousSection:self completionBlock:v4];
  }
  else
  {
    unint64_t v3 = [(THDocumentNavigator *)self previousVisibleAbsolutePageNumber];
    [(THDocumentNavigator *)self setVisibleAbsolutePhysicalPageIndex:v3];
  }
}

- (BOOL)canNavigateByHistoryDirection:(int)a3
{
  if ([(THDocumentNavigator *)self currentAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      unint64_t v5 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack];
      return [(THBookspotHistoryStack *)v5 hasNextBookspot];
    }
    return 0;
  }
  unint64_t v7 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack];

  return [(THBookspotHistoryStack *)v7 hasPrevBookspot];
}

- (void)navigateByHistoryDirection:(int)a3
{
  if ([(THDocumentNavigator *)self currentAbsolutePageIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 2)
    {
      id v6 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack];
      [(THBookspotHistoryStack *)v6 gotoPrevBookspot];
    }
    else if (a3 == 1)
    {
      unint64_t v5 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack];
      [(THBookspotHistoryStack *)v5 gotoNextBookspot];
    }
  }
}

- (void)navigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  if ([(THDocumentNavigator *)self currentAbsolutePageIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 2)
    {
      switch(a4)
      {
        case 0:
          id v13 = +[TSUAssertionHandler currentHandler];
          id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator navigateByBookDirection:bookGranularity:]");
          uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"];
          uint64_t v10 = v13;
          id v11 = v14;
          uint64_t v12 = 1933;
LABEL_8:
          [v10 handleFailureInFunction:v11 file:v9 lineNumber:v12 description:@"Not implemented."];
          return;
        case 1:
          unint64_t v21 = [(THDocumentNavigator *)self previousVisibleAbsolutePageNumber];
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v17 = v21;
            if (v21 >= [(THDocumentNavigator *)self absolutePageIndexForBeginningOfSection])
            {
LABEL_30:
              long long v20 = self;
              unint64_t v19 = v17;
              goto LABEL_31;
            }
            [(THDocumentNavigator *)self scrollToPreviousSection];
          }
          return;
        case 2:
          unint64_t v18 = [(THDocumentNavigator *)self absolutePageIndexForBeginningOfSection];
          goto LABEL_21;
        case 3:
          unint64_t v18 = [(THDocumentNavigator *)self absolutePageIndexForPreviousSection];
LABEL_21:
          if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
            return;
          }
LABEL_23:
          unint64_t v19 = v18;
          long long v20 = self;
LABEL_31:
          [(THDocumentNavigator *)v20 setVisibleAbsolutePhysicalPageIndex:v19 animated:1];
          break;
        case 4:
          long long v20 = self;
          unint64_t v19 = 0;
          goto LABEL_31;
        default:
          return;
      }
    }
    else if (a3 == 1)
    {
      switch(a4)
      {
        case 0:
          id v7 = +[TSUAssertionHandler currentHandler];
          id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator navigateByBookDirection:bookGranularity:]");
          uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"];
          uint64_t v10 = v7;
          id v11 = v8;
          uint64_t v12 = 1878;
          goto LABEL_8;
        case 1:
          unint64_t v15 = [(THDocumentNavigator *)self lastAbsolutePageIndex];
          unint64_t v16 = [(THDocumentNavigator *)self nextVisibleAbsolutePageNumber];
          if (v16 > v15) {
            return;
          }
          unint64_t v17 = v16;
          if (v16 <= [(THDocumentNavigator *)self absolutePageIndexForEndOfSection]) {
            goto LABEL_30;
          }
          [(THDocumentNavigator *)self scrollToNextSection];
          break;
        case 2:
          unint64_t v18 = [(THDocumentNavigator *)self absolutePageIndexForEndOfSection];
          goto LABEL_21;
        case 3:
          unint64_t v18 = [(THDocumentNavigator *)self absolutePageIndexForNextSection];
          goto LABEL_21;
        case 4:
          unint64_t v18 = [(THDocumentNavigator *)self lastAbsolutePageIndex];
          goto LABEL_23;
        default:
          return;
      }
    }
  }
}

- (BOOL)isPageLocationValid:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 absolutePhysicalPageIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v6 = [a3 absolutePhysicalPageIndex];
  return v6 < (id)[(THDocumentNavigationModel *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] navigationModel] pageCount];
}

- (BOOL)restorePlaceholderWithOverrideLocation:(id)a3
{
  if (![(THDocumentNavigator *)self documentRoot]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:] file:+[NSString stringWithUTF8String:] lineNumber:2002 description:@"invalid nil value for '%s'", "self.documentRoot"];
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [(THAnnotationStorageController *)[(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] annotationController] getPlaceholder:&v10 andPageHistory:&v9];
  unsigned int v5 = [(THDocumentNavigator *)self isPageLocationValid:v10];
  if (v5 && v9)
  {
    id v6 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] bookspotHistoryStack];
    [(THBookspotHistoryStack *)v6 resetWithDictionaryRepresentation:v9];
  }
  if (!a3 || (BOOL v7 = 1, ![(THDocumentNavigator *)self followAnchor:a3 pulse:1]))
  {
    if (v5)
    {
      return [(THDocumentNavigator *)self jumpToPageLocation:v10 touchHistory:v9 == 0 minor:1];
    }
    else
    {
      [(THDocumentNavigator *)self setVisitedPagesAfterOpening:0];
      return 0;
    }
  }
  return v7;
}

- (void)savePlaceholder
{
  if (![(THDocumentNavigator *)self documentRoot]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentNavigator savePlaceholder]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"] lineNumber:2038 description:@"invalid nil value for '%s'", "self.documentRoot"];
  }
  unint64_t v3 = [(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] annotationController];
  if ([(THDocumentRoot *)[(THDocumentNavigator *)self documentRoot] isCorrupt]
    || (id v4 = [(THDocumentNavigator *)self currentPageLocation],
        id v5 = [(THDocumentNavigator *)self storageAnchorForCurrentPage],
        id v6 = -[THBookspotHistoryStack dictionaryRepresentation](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "dictionaryRepresentation"), ![v4 absolutePhysicalPageIndex]))
  {
    id v8 = v3;
    id v9 = 0;
    id v10 = 0;
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 contentNode];
    id v8 = v3;
    id v9 = v4;
    id v10 = v6;
  }

  [(THAnnotationStorageController *)v8 setPlaceholder:v9 pageHistoryDictionary:v10 withContentNode:v7];
}

- (THDocumentNavigatorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THDocumentNavigatorDelegate *)a3;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (THDocumentLinkResolver)documentLinkResolver
{
  return self->_documentLinkResolver;
}

- (void)setDocumentLinkResolver:(id)a3
{
}

- (BOOL)isScrollingAcrossSections
{
  return self->_isScrollingAcrossSections;
}

- (void)setIsScrollingAcrossSections:(BOOL)a3
{
  self->_isScrollingAcrossSections = a3;
}

- (BOOL)visitedPagesAfterOpening
{
  return self->_visitedPagesAfterOpening;
}

- (void)setVisitedPagesAfterOpening:(BOOL)a3
{
  self->_visitedPagesAfterOpening = a3;
}

- (THPageSpotHistory)pagespotHistory
{
  return self->_pagespotHistory;
}

- (void)setPagespotHistory:(id)a3
{
}

- (THModelStorageAnchor)cachedFlowAnchorForRect
{
  return self->_cachedFlowAnchorForRect;
}

- (void)setCachedFlowAnchorForRect:(id)a3
{
}

- (CGRect)rectForFlowAnchor
{
  double x = self->_rectForFlowAnchor.origin.x;
  double y = self->_rectForFlowAnchor.origin.y;
  double width = self->_rectForFlowAnchor.size.width;
  double height = self->_rectForFlowAnchor.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectForFlowAnchor:(CGRect)a3
{
  self->_rectForFlowAnchor = a3;
}

- (BOOL)followingAnchor
{
  return self->_followingAnchor;
}

- (void)setFollowingAnchor:(BOOL)a3
{
  self->_followingAnchor = a3;
}

@end