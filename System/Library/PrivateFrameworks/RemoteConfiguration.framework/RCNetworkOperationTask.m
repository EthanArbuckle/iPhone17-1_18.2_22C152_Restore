@interface RCNetworkOperationTask
- (NSData)data;
- (NSHTTPURLResponse)httpResponse;
- (NSMutableData)dataStore;
- (NSString)identifier;
- (RCNetworkOperationTask)initWithIdentifier:(id)a3;
- (id)completionHandler;
- (void)receiveData:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation RCNetworkOperationTask

- (RCNetworkOperationTask)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCNetworkOperationTask;
  v6 = [(RCNetworkOperationTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    dataStore = v7->_dataStore;
    v7->_dataStore = v8;
  }
  return v7;
}

- (NSData)data
{
  v2 = [(RCNetworkOperationTask *)self dataStore];
  v3 = (void *)[v2 copy];

  return (NSData *)v3;
}

- (void)receiveData:(id)a3
{
  id v4 = a3;
  id v5 = [(RCNetworkOperationTask *)self dataStore];
  [v5 appendData:v4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpResponse:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableData)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end