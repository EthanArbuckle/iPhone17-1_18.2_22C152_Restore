@interface WLKRemoveFromPlayHistoryRequestOperation
- (NSString)deleteID;
- (WLKRemoveFromPlayHistoryRequestOperation)initWithItemID:(id)a3;
@end

@implementation WLKRemoveFromPlayHistoryRequestOperation

- (WLKRemoveFromPlayHistoryRequestOperation)initWithItemID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [NSString stringWithFormat:@"play-history/%@", v5];
    v7 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v6 queryParameters:0 httpMethod:@"DELETE" httpBody:0 headers:&unk_1F13D9990 caller:0 timeout:0 apiVersion:&unk_1F13D9608 options:0];
    v12.receiver = self;
    v12.super_class = (Class)WLKRemoveFromPlayHistoryRequestOperation;
    v8 = [(WLKUTSNetworkRequestOperation *)&v12 initWithRequestProperties:v7];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_deleteID, a3);
    }
    self = v9;

    v10 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"delete ID is required"];
    v10 = 0;
  }

  return v10;
}

- (NSString)deleteID
{
  return self->_deleteID;
}

- (void).cxx_destruct
{
}

@end