@interface RestoreDownloadItemsResponse
- (NSArray)requestItems;
- (StoreDownloadQueueResponse)serverResponse;
- (void)dealloc;
- (void)setRequestItems:(id)a3;
- (void)setServerResponse:(id)a3;
- (void)setServerResponseWithError:(id)a3;
@end

@implementation RestoreDownloadItemsResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RestoreDownloadItemsResponse;
  [(RestoreDownloadItemsResponse *)&v3 dealloc];
}

- (void)setServerResponseWithError:(id)a3
{
  self->_serverResponse = [[StoreDownloadQueueResponse alloc] initWithError:a3 userIdentifier:0];
}

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (StoreDownloadQueueResponse)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
}

@end