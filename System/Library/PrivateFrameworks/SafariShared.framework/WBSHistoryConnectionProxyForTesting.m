@interface WBSHistoryConnectionProxyForTesting
- (WBSHistoryConnectionProxyForTesting)initWithListenerEndpoint:(id)a3;
- (id)_createConnection;
@end

@implementation WBSHistoryConnectionProxyForTesting

- (WBSHistoryConnectionProxyForTesting)initWithListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSHistoryConnectionProxyForTesting;
  v6 = [(WBSHistoryConnectionProxy *)&v8 init];

  return v6;
}

- (id)_createConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_listenerEndpoint];
  return v2;
}

- (void).cxx_destruct
{
}

@end