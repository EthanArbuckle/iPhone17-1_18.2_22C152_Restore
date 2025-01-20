@interface SagaImportController
- (BOOL)includesBookmarkable;
- (BOOL)processDAAPFileAtURL:(id)a3;
- (BOOL)shouldRestart;
- (NSDictionary)cloudIDToLyricsTokenMap;
- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap;
- (NSString)currentPaginationToken;
- (SagaImportController)init;
- (unsigned)currentItemCount;
- (unsigned)processedItemCount;
- (unsigned)totalItemCount;
@end

@implementation SagaImportController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableCloudIDToLyricsTokenMap, 0);

  objc_storeStrong((id *)&self->_currentPaginationToken, 0);
}

- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap
{
  return self->_mutableCloudIDToLyricsTokenMap;
}

- (BOOL)includesBookmarkable
{
  return self->_includesBookmarkable;
}

- (NSString)currentPaginationToken
{
  return self->_currentPaginationToken;
}

- (unsigned)processedItemCount
{
  return self->_processedItemCount;
}

- (unsigned)currentItemCount
{
  return self->_currentItemCount;
}

- (unsigned)totalItemCount
{
  return self->_totalItemCount;
}

- (BOOL)shouldRestart
{
  return self->_shouldRestart;
}

- (BOOL)processDAAPFileAtURL:(id)a3
{
  v4 = +[NSInputStream inputStreamWithURL:a3];
  id v5 = [objc_alloc((Class)DKDAAPParser) initWithStream:v4];
  v6 = objc_alloc_init(SagaImportControllerParserDelegate);
  [(SagaImportControllerParserDelegate *)v6 setMutableCloudIDToLyricsTokenMap:self->_mutableCloudIDToLyricsTokenMap];
  [v5 setDelegate:v6];
  [v5 parse];
  self->_shouldRestart = [(SagaImportControllerParserDelegate *)v6 shouldRestart];
  self->_totalItemCount = [(SagaImportControllerParserDelegate *)v6 totalItemCount];
  unsigned int v7 = [(SagaImportControllerParserDelegate *)v6 currentItemCount];
  unsigned int v8 = self->_processedItemCount + v7;
  self->_currentItemCount = v7;
  self->_processedItemCount = v8;
  v9 = [(SagaImportControllerParserDelegate *)v6 currentPaginationToken];
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = v9;

  self->_includesBookmarkable = [(SagaImportControllerParserDelegate *)v6 includesBookmarkable];
  return 1;
}

- (NSDictionary)cloudIDToLyricsTokenMap
{
  id v2 = [(NSMutableDictionary *)self->_mutableCloudIDToLyricsTokenMap copy];

  return (NSDictionary *)v2;
}

- (SagaImportController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SagaImportController;
  id v2 = [(SagaImportController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    mutableCloudIDToLyricsTokenMap = v2->_mutableCloudIDToLyricsTokenMap;
    v2->_mutableCloudIDToLyricsTokenMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end