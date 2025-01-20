@interface THReflowableContentPaginationOperation
- (BOOL)allowsDescendersToClipForPageController:(id)a3;
- (BOOL)displaySinglePageChapterSeparatelyForPageController:(id)a3;
- (BOOL)isCompactFlowPresentationForPageController:(id)a3;
- (BOOL)isForegroundPagination;
- (BOOL)isTwoUpForNavigationUnitForPageController:(id)a3;
- (BOOL)pageController:(id)a3 needsAnnotationSourceForLayout:(id)a4;
- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForPageController:(id)a3;
- (BOOL)shouldScaleFlowLayoutsForPageController:(id)a3;
- (BOOL)wantsPageCharIndicesFilledForPageController:(id)a3;
- (CGPoint)canvasOriginForPageController:(id)a3;
- (CGSize)pageSizeForPagePositionController:(id)a3;
- (THDocumentRoot)documentRoot;
- (THModelContentNode)contentNode;
- (THModelContentNodeBody)flowModelContentNodeBody;
- (THModelContentNodeBody)paginatedModelContentNodeBody;
- (THModelContentNodeReflowablePaginationResults)paginationResults;
- (THPagePositionController)pagePositionController;
- (THPaginatedPageController)pageController;
- (THPresentationType)presentationType;
- (THReflowableContentPaginationOperation)initWithContentNode:(id)a3 paginationResults:(id)a4 flowModelContentNodeBody:(id)a5 presentationType:(id)a6 documentRoot:(id)a7 isForegroundPagination:(BOOL)a8 delegate:(id)a9;
- (THReflowableContentPaginationOperationDelegate)delegate;
- (id)accessControllerForPageController:(id)a3;
- (id)bodyStorageForPageController:(id)a3 presentationType:(id)a4;
- (id)layoutControllerForPageController:(id)a3;
- (id)p_addPageToContentBody;
- (id)pageInfoForPageController:(id)a3 pageIndex:(unint64_t)a4 presentationType:(id)a5;
- (unint64_t)pageCountForNavigationUnitForPageController:(id)a3;
- (unint64_t)pageCountForPageController:(id)a3 presentationType:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)p_accumulateStorageUIDsForChildrenInObject:(id)a3 forRelativePageIndex:(unint64_t)a4;
- (void)setContentNode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setFlowModelContentNodeBody:(id)a3;
- (void)setIsForegroundPagination:(BOOL)a3;
- (void)setPageController:(id)a3;
- (void)setPagePositionController:(id)a3;
- (void)setPaginatedModelContentNodeBody:(id)a3;
- (void)setPaginationResults:(id)a3;
- (void)setPresentationType:(id)a3;
@end

@implementation THReflowableContentPaginationOperation

- (THReflowableContentPaginationOperation)initWithContentNode:(id)a3 paginationResults:(id)a4 flowModelContentNodeBody:(id)a5 presentationType:(id)a6 documentRoot:(id)a7 isForegroundPagination:(BOOL)a8 delegate:(id)a9
{
  v18.receiver = self;
  v18.super_class = (Class)THReflowableContentPaginationOperation;
  v15 = [(THReflowableContentPaginationOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_contentNode = (THModelContentNode *)a3;
    v15->_documentRoot = (THDocumentRoot *)a7;
    v16->_flowModelContentNodeBody = (THModelContentNodeBody *)a5;
    v16->_presentationType = (THPresentationType *)[a6 copyFixingSize];
    v16->_paginationResults = (THModelContentNodeReflowablePaginationResults *)a4;
    v16->_isForegroundPagination = a8;
    v16->_delegate = (THReflowableContentPaginationOperationDelegate *)a9;
  }
  return v16;
}

- (void)dealloc
{
  self->_documentRoot = 0;
  self->_flowModelContentNodeBody = 0;

  self->_paginatedModelContentNodeBody = 0;
  self->_presentationType = 0;

  self->_pageController = 0;
  self->_pagePositionController = 0;

  self->_paginationResults = 0;
  v3.receiver = self;
  v3.super_class = (Class)THReflowableContentPaginationOperation;
  [(THReflowableContentPaginationOperation *)&v3 dealloc];
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)THReflowableContentPaginationOperation;
  [(THReflowableContentPaginationOperation *)&v3 cancel];
  [(THPaginatedPageController *)self->_pageController teardown];
}

- (void)p_accumulateStorageUIDsForChildrenInObject:(id)a3 forRelativePageIndex:(unint64_t)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a3 childEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        objc_opt_class();
        v12 = (void *)TSUDynamicCast();
        if (v12)
        {
          -[THModelContentNodeReflowablePaginationResults assignRelativePageIndex:toStorageUID:](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "assignRelativePageIndex:toStorageUID:", a4, -[THModelContentNodeBody nodeUniqueIDForInfo:](-[THReflowableContentPaginationOperation flowModelContentNodeBody](self, "flowModelContentNodeBody"), "nodeUniqueIDForInfo:", [v12 containedStorage]));
        }
        else if (objc_opt_respondsToSelector())
        {
          [(THReflowableContentPaginationOperation *)self p_accumulateStorageUIDsForChildrenInObject:v11 forRelativePageIndex:a4];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)main
{
  if (([(THReflowableContentPaginationOperation *)self isCancelled] & 1) == 0)
  {
    self->_pageController = [[THPaginatedPageController alloc] initWithDelegate:self contentNode:self->_contentNode paginationController:0 presentationType:self->_presentationType];
    self->_pagePositionController = (THPagePositionController *)+[THPagePositionController paginatedPositionerWithDelegate:self];
    self->_paginatedModelContentNodeBody = [[THModelContentNodeBody alloc] initWithContext:[(THDocumentRoot *)[(THReflowableContentPaginationOperation *)self documentRoot] context]];
    [(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] setStylesheet:[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self flowModelContentNodeBody] stylesheet]];
    [(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] setBodyStorage:[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self flowModelContentNodeBody] bodyStorage]];
    [(THWPStorage *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] bodyStorage] setFontSize:[(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] fontSize]];
    [(THWPStorage *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] bodyStorage] setUsesApplicationFontScaling:1];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = [(THModelContentNodeBody *)self->_flowModelContentNodeBody infos];
    id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          [(THModelContentNodeBody *)self->_paginatedModelContentNodeBody setNodeUniqueID:[(THModelContentNodeBody *)self->_flowModelContentNodeBody nodeUniqueIDForInfo:*(void *)(*((void *)&v20 + 1) + 8 * (void)v8)] forInfo:*(void *)(*((void *)&v20 + 1) + 8 * (void)v8)];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
    if ([(THReflowableContentPaginationOperation *)self paginationResults])
    {
      if ([(THModelContentNodeReflowablePaginationResults *)[(THReflowableContentPaginationOperation *)self paginationResults] pageCount])
      {
        unint64_t v9 = 0;
        do
        {
          id v10 = [(THReflowableContentPaginationOperation *)self p_addPageToContentBody];
          uint64_t v11 = (char *)[(THModelContentNodeReflowablePaginationResults *)[(THReflowableContentPaginationOperation *)self paginationResults] hintRangeForRelativePageIndex:v9];
          uint64_t v13 = v12;
          [v10 setPageStartCharIndex:v11];
          [v10 setPageEndCharIndex:&v11[v13]];
          ++v9;
        }
        while (v9 < [(THModelContentNodeReflowablePaginationResults *)[(THReflowableContentPaginationOperation *)self paginationResults] pageCount]);
      }
    }
    else
    {
      if (([(THReflowableContentPaginationOperation *)self isCancelled] & 1) == 0)
      {
        long long v14 = objc_alloc_init(THModelContentNodeReflowablePaginationResults);
        self->_paginationResults = v14;
        [(THModelContentNodeReflowablePaginationResults *)v14 setPageCount:1];
        [(THModelContentNodeReflowablePaginationResults *)self->_paginationResults setNodeGUID:[(THModelNode *)[(THReflowableContentPaginationOperation *)self contentNode] nodeGUID]];
        [(THModelContentNodeReflowablePaginationResults *)self->_paginationResults setPresentationType:[(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] copyFixingSize]];
        [(THPaginatedPageController *)[(THReflowableContentPaginationOperation *)self pageController] layoutThroughRelativePageIndex:-1 layoutController:0];
      }
      if (([(THReflowableContentPaginationOperation *)self isCancelled] & 1) == 0)
      {
        [(THModelContentNodeReflowablePaginationResults *)[(THReflowableContentPaginationOperation *)self paginationResults] setPageHints:[(NSArray *)[(THPageHintController *)[(THPaginatedPageController *)[(THReflowableContentPaginationOperation *)self pageController] pageHints] pageHints] mutableCopy]];
        [(THModelContentNodeReflowablePaginationResults *)[(THReflowableContentPaginationOperation *)self paginationResults] setBodyStorageUID:[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] nodeUniqueIDForInfo:[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] bodyStorage]]];
        long long v15 = [(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] bodyStorage];
        uint64_t v16 = objc_opt_class();
        id v17 = [(THWPStorage *)v15 range];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_4C4E8;
        v19[3] = &unk_457A38;
        v19[4] = self;
        -[THWPStorage enumerateAttachmentsOfClass:inTextRange:usingBlock:](v15, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", v16, v17, v18, v19);
      }
    }
  }
  if (([(THReflowableContentPaginationOperation *)self isCancelled] & 1) == 0) {
    [(THReflowableContentPaginationOperationDelegate *)[(THReflowableContentPaginationOperation *)self delegate] contentPaginationOperation:self paginatedNodeBody:[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] forPresentationType:[(THReflowableContentPaginationOperation *)self presentationType]];
  }
  [(THPaginatedPageController *)self->_pageController teardown];
}

- (id)p_addPageToContentBody
{
  id v3 = [(THWGutterDrawableStorage *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] gutterDrawableStorage] context];
  id v4 = [[THModelPageInfo alloc] initWithContext:v3];
  id v5 = objc_alloc((Class)TSDInfoGeometry);
  [(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] pageSize];
  id v6 = [v5 initWithSize:];
  [(THModelPageInfo *)v4 setGeometry:v6];

  [(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] addPageInfo:v4];
  double y = CGPointZero.y;
  [(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] pageSize];
  double v9 = v8;
  double v11 = v10;
  [(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] contentInsets];
  double v15 = v9 - (v13 + v14);
  id v17 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:CGPointZero.x + v13, y + v12, v15, v11 - (v12 + v16)];
  uint64_t v18 = [[THModelBodyTextInfo alloc] initWithContext:v3 geometry:v17];

  id v19 = [objc_alloc((Class)TSSPropertyMap) initWithCapacity:3];
  [v19 setObject:[TSWPPadding padding] forProperty:145];
  uint64_t v20 = [(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] columnCount];
  if (v20 < 2)
  {
    [v19 setObject:[TSWPColumns columns] forProperty:148];
  }
  else
  {
    uint64_t v21 = v20;
    [(THPresentationType *)[(THReflowableContentPaginationOperation *)self presentationType] gutterWidth];
    id v23 = [objc_alloc((Class)TSWPColumns) initWithEqualColumnCount:v21 gapFraction:v22 / v15];
    [v19 setObject:v23 forProperty:148];
  }
  id v24 = [objc_alloc((Class)TSWPColumnStyle) initWithContext:v3 name:0 overridePropertyMap:v19 isVariation:0];
  [(THModelBodyTextInfo *)v18 setColumnStyle:v24];

  [(THModelBodyTextInfo *)v18 setExteriorTextWrap:+[TSDExteriorTextWrap exteriorTextWrap]];
  [(THModelPageInfo *)v4 addBodyBoxInfo:v18 insertContext:0];
  v25 = [(THModelPageInfo *)v4 drawablesZOrder];
  [(THDrawablesZOrder *)v25 addDrawable:[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] bodyStorage]];
  [(THDrawablesZOrder *)v25 addDrawable:v18];
  [(THModelPageInfo *)v4 setParent:[(THReflowableContentPaginationOperation *)self contentNode]];

  return v4;
}

- (CGSize)pageSizeForPagePositionController:(id)a3
{
  id v3 = [(THReflowableContentPaginationOperation *)self presentationType];

  [(THPresentationType *)v3 pageSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)wantsPageCharIndicesFilledForPageController:(id)a3
{
  return 1;
}

- (id)accessControllerForPageController:(id)a3
{
  return 0;
}

- (CGPoint)canvasOriginForPageController:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isCompactFlowPresentationForPageController:(id)a3
{
  return 1;
}

- (unint64_t)pageCountForNavigationUnitForPageController:(id)a3
{
  return 0;
}

- (BOOL)displaySinglePageChapterSeparatelyForPageController:(id)a3
{
  return 0;
}

- (BOOL)isTwoUpForNavigationUnitForPageController:(id)a3
{
  return 0;
}

- (BOOL)allowsDescendersToClipForPageController:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForPageController:(id)a3
{
  return 1;
}

- (BOOL)shouldScaleFlowLayoutsForPageController:(id)a3
{
  return 0;
}

- (unint64_t)pageCountForPageController:(id)a3 presentationType:(id)a4
{
  unint64_t v5 = [(NSArray *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] pages] count];
  if (([(THReflowableContentPaginationOperation *)self isCancelled] & 1) == 0)
  {
    if (v5)
    {
      unint64_t v6 = v5 + 1;
      uint64_t v7 = [(THPageHintController *)[(THPaginatedPageController *)[(THReflowableContentPaginationOperation *)self pageController] pageHints] hintForRelativePageIndex:v5 - 1];
      if (v7)
      {
        double v8 = v7;
        if (v7 != +[NSNull null])
        {
          double v9 = (char *)[(THWPStorage *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] bodyStorage] range];
          double v11 = &v9[v10];
          double v12 = (char *)[(NSNull *)v8 range];
          if (v11 <= &v12[v13]) {
            unint64_t v6 = v5;
          }
        }
      }
    }
    else
    {
      unint64_t v6 = 1;
    }
    if (v6 >= 0xFA0) {
      unint64_t v5 = 4000;
    }
    else {
      unint64_t v5 = v6;
    }
    [(THModelContentNodeReflowablePaginationResults *)[(THReflowableContentPaginationOperation *)self paginationResults] setPageCount:v5];
  }
  return v5;
}

- (id)layoutControllerForPageController:(id)a3
{
  return 0;
}

- (id)bodyStorageForPageController:(id)a3 presentationType:(id)a4
{
  double v4 = [(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody];

  return [(THModelContentNodeBody *)v4 bodyStorage];
}

- (id)pageInfoForPageController:(id)a3 pageIndex:(unint64_t)a4 presentationType:(id)a5
{
  if ([(THReflowableContentPaginationOperation *)self pageController] != a3) {
    return 0;
  }
  if ([(NSArray *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] pages] count] <= a4|| ![(NSArray *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] pages] objectAtIndex:a4])
  {
    unint64_t v8 = [(NSArray *)[(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] pages] count];
    if (v8 <= a4)
    {
      unint64_t v9 = v8;
      do
      {
        [(THReflowableContentPaginationOperation *)self p_addPageToContentBody];
        ++v9;
      }
      while (v9 <= a4);
    }
  }
  uint64_t v10 = [(THModelContentNodeBody *)[(THReflowableContentPaginationOperation *)self paginatedModelContentNodeBody] pages];

  return [(NSArray *)v10 objectAtIndex:a4];
}

- (BOOL)pageController:(id)a3 needsAnnotationSourceForLayout:(id)a4
{
  return 0;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
  self->_contentNode = (THModelContentNode *)a3;
}

- (THModelContentNodeReflowablePaginationResults)paginationResults
{
  return self->_paginationResults;
}

- (void)setPaginationResults:(id)a3
{
}

- (THModelContentNodeBody)flowModelContentNodeBody
{
  return self->_flowModelContentNodeBody;
}

- (void)setFlowModelContentNodeBody:(id)a3
{
}

- (THModelContentNodeBody)paginatedModelContentNodeBody
{
  return self->_paginatedModelContentNodeBody;
}

- (void)setPaginatedModelContentNodeBody:(id)a3
{
}

- (THPaginatedPageController)pageController
{
  return self->_pageController;
}

- (void)setPageController:(id)a3
{
}

- (THPagePositionController)pagePositionController
{
  return self->_pagePositionController;
}

- (void)setPagePositionController:(id)a3
{
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (BOOL)isForegroundPagination
{
  return self->_isForegroundPagination;
}

- (void)setIsForegroundPagination:(BOOL)a3
{
  self->_isForegroundPagination = a3;
}

- (THReflowableContentPaginationOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THReflowableContentPaginationOperationDelegate *)a3;
}

@end