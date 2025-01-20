@interface WLKTopShelfRequestOperation
- (NSArray)items;
- (WLKTopShelfRequestOperation)init;
- (WLKTopShelfRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4;
- (void)processResponse;
@end

@implementation WLKTopShelfRequestOperation

- (WLKTopShelfRequestOperation)init
{
  return [(WLKTopShelfRequestOperation *)self initWithQueryParameters:0 options:1];
}

- (WLKTopShelfRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithDouble:15.0];
  v9 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"browse/topShelf" queryParameters:v7 httpMethod:0 headers:0 caller:0 timeout:v8 options:a4 clientProtocolVersion:&unk_1F13D9878];

  v12.receiver = self;
  v12.super_class = (Class)WLKTopShelfRequestOperation;
  v10 = [(WLKUTSNetworkRequestOperation *)&v12 initWithRequestProperties:v9];

  return v10;
}

- (void)processResponse
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  v4 = objc_msgSend(v3, "wlk_arrayForKey:", @"items");
  uint64_t v5 = +[WLKChannelsResponse parseChannelsFromPayload:v3];
  v6 = (void *)v5;
  if (v5)
  {
    v10 = @"WLKModelContextKeyChannels";
    v11[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  v8 = +[WLKBrowseItem browseItemsWithDictionaries:v4 context:v7];
  items = self->_items;
  self->_items = v8;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end