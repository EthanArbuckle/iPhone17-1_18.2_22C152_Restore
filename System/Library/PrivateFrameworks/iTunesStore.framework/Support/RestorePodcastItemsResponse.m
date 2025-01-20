@interface RestorePodcastItemsResponse
- (NSArray)requestItems;
- (NSArray)responseDownloads;
- (NSError)responseError;
- (id)errorForItemIdentifier:(id)a3;
- (void)dealloc;
- (void)setError:(id)a3 forItemIdentifier:(id)a4;
- (void)setRequestItems:(id)a3;
- (void)setResponseDownloads:(id)a3;
- (void)setResponseError:(id)a3;
@end

@implementation RestorePodcastItemsResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RestorePodcastItemsResponse;
  [(RestorePodcastItemsResponse *)&v3 dealloc];
}

- (id)errorForItemIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_itemErrors objectForKey:a3];

  return v3;
}

- (void)setError:(id)a3 forItemIdentifier:(id)a4
{
  itemErrors = self->_itemErrors;
  if (a3)
  {
    if (!itemErrors)
    {
      itemErrors = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->_itemErrors = itemErrors;
    }
    [(NSMutableDictionary *)itemErrors setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)itemErrors removeObjectForKey:a4];
  }
}

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (NSArray)responseDownloads
{
  return self->_responseDownloads;
}

- (void)setResponseDownloads:(id)a3
{
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

@end