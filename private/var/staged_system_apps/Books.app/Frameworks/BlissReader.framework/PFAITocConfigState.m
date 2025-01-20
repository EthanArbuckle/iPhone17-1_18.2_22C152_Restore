@interface PFAITocConfigState
- (BOOL)isCancelled;
- (BOOL)isTOC;
- (BOOL)isWidgetEntry:(id)a3;
- (Class)drawablePlacementClass;
- (NSString)nodeGUID;
- (PFAIDocOrientationState)paginatedState;
- (PFAIOperationLoadDelegate)loadDelegate;
- (PFAITocConfigState)initWithDocumentRoot:(id)a3 nodeBody:(id)a4 tocTile:(id)a5 archive:(id)a6 documentEntryUri:(id)a7;
- (THModelContentNodeBody)thNodeBody;
- (THTOCTileModel)tocTile;
- (TSSStylesheet)stylesheet;
- (id)currentHtmlDocMediaState;
- (id)pageDrawableList;
- (id)pageInfo;
- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5;
- (void)dealloc;
- (void)setLoadDelegate:(id)a3;
- (void)setNodeGUID:(id)a3;
@end

@implementation PFAITocConfigState

- (PFAITocConfigState)initWithDocumentRoot:(id)a3 nodeBody:(id)a4 tocTile:(id)a5 archive:(id)a6 documentEntryUri:(id)a7
{
  v12.receiver = self;
  v12.super_class = (Class)PFAITocConfigState;
  v10 = [(PFXHtmlReaderState *)&v12 initWithDocumentRoot:a3 contentNode:0 entry:a7 inArchive:a6];
  if (v10)
  {
    v10->mNodeBody = (THModelContentNodeBody *)a4;
    v10->mTocTile = (THTOCTileModel *)a5;
    v10->mPaginatedState = (PFAIDocOrientationState *)-[PFAIDocOrientationState initWitContentNodeBody:presentationType:readerState:]([PFAIDocOrientationState alloc], "initWitContentNodeBody:presentationType:readerState:", a4, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", [a3 context]), v10);
    v10->mPageDrawableList = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAITocConfigState;
  [(PFXHtmlReaderState *)&v3 dealloc];
}

- (id)currentHtmlDocMediaState
{
  return self->mPaginatedState;
}

- (BOOL)isCancelled
{
  if (self->mWasCancelled) {
    BOOL result = 1;
  }
  else {
    BOOL result = [(PFAIOperationLoadDelegate *)self->mLoadDelegate operationShouldCancelLoad];
  }
  self->mWasCancelled = result;
  return result;
}

- (id)pageInfo
{
  if ((char *)[(NSArray *)[(THModelContentNodeBody *)self->mNodeBody pages] count] != (char *)&dword_0 + 1) {
    return 0;
  }
  objc_super v3 = [(THModelContentNodeBody *)self->mNodeBody pages];

  return [(NSArray *)v3 objectAtIndex:0];
}

- (id)pageDrawableList
{
  return self->mPageDrawableList;
}

- (BOOL)isTOC
{
  return 1;
}

- (BOOL)isWidgetEntry:(id)a3
{
  int v4 = xmlStrEqual((const xmlChar *)[a3 xmlElementName], (const xmlChar *)"object");
  if (v4)
  {
    v5 = (const xmlChar *)[a3 xmlValueForAttribute:"type"];
    LOBYTE(v4) = v5
              && ((v6 = v5, xmlStrEqual(v5, (const xmlChar *)PFXCommonApubWidgetMimeType[0]))
               || xmlStrEqual(v6, (const xmlChar *)PFXCommonApubTocMimeType[0]));
  }
  return v4;
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  v8 = [(PFAIDocOrientationState *)self->mPaginatedState contentNodeBody];
  v9 = [(THModelContentNodeBody *)v8 nodeUniqueIDForInfo:a3];
  if (!v9)
  {
    id v10 = [a5 xmlElementId];
    if (!v10
      || (v11 = +[NSString stringWithXmlString:v10]) == 0
      || (v9 = v11, [a4 length])
      && (v9 = +[NSString stringWithFormat:@"%@-%@", v9, a4]) == 0)
    {
      v9 = +[NSString stringWithUUID];
    }
    [(THModelContentNodeBody *)v8 setNodeUniqueID:v9 forInfo:a3];
  }
  return v9;
}

- (TSSStylesheet)stylesheet
{
  return [(THModelContentNodeBody *)self->mNodeBody stylesheet];
}

- (THModelContentNodeBody)thNodeBody
{
  return self->mNodeBody;
}

- (THTOCTileModel)tocTile
{
  return self->mTocTile;
}

- (NSString)nodeGUID
{
  return self->mNodeGUID;
}

- (void)setNodeGUID:(id)a3
{
}

- (PFAIOperationLoadDelegate)loadDelegate
{
  return self->mLoadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->mLoadDelegate = (PFAIOperationLoadDelegate *)a3;
}

- (PFAIDocOrientationState)paginatedState
{
  return self->mPaginatedState;
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class();
}

@end