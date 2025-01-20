@interface WLKUpNextWidgetRequestOperation
- (WLKUpNextItemCollection)itemCollection;
- (WLKUpNextWidgetRequestOperation)init;
- (WLKUpNextWidgetRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4;
- (void)processResponse;
@end

@implementation WLKUpNextWidgetRequestOperation

- (WLKUpNextWidgetRequestOperation)init
{
  return [(WLKUpNextWidgetRequestOperation *)self initWithQueryParameters:0 options:1];
}

- (WLKUpNextWidgetRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithDouble:15.0];
  v9 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"shelves/up-next-widget" queryParameters:v7 httpMethod:0 headers:0 caller:0 timeout:v8 apiVersion:&unk_1F13D95D8 options:a4];

  v12.receiver = self;
  v12.super_class = (Class)WLKUpNextWidgetRequestOperation;
  v10 = [(WLKUTSNetworkRequestOperation *)&v12 initWithRequestProperties:v9];

  return v10;
}

- (void)processResponse
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WLKUTSNetworkRequestOperation *)self responseDictionary];
  uint64_t v4 = +[WLKChannelsResponse parseChannelsFromPayload:v3];
  v5 = (void *)v4;
  if (v4)
  {
    v9 = @"WLKModelContextKeyChannels";
    v10[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v6 = 0;
  }
  id v7 = [[WLKUpNextItemCollection alloc] initWithDictionary:v3 context:v6];
  itemCollection = self->_itemCollection;
  self->_itemCollection = v7;
}

- (WLKUpNextItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void).cxx_destruct
{
}

@end