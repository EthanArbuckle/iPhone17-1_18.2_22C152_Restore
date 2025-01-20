@interface NDNewsServiceConnectionClientProxy
- (NDNewsServiceClient)client;
- (void)serviceHasNewTodayResults;
- (void)setClient:(id)a3;
@end

@implementation NDNewsServiceConnectionClientProxy

- (void)serviceHasNewTodayResults
{
  id v2 = [(NDNewsServiceConnectionClientProxy *)self client];
  [v2 serviceHasNewTodayResults];
}

- (NDNewsServiceClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (NDNewsServiceClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end