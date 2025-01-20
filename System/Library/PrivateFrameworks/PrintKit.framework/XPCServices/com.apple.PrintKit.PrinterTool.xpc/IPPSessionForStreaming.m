@interface IPPSessionForStreaming
- (IPPSessionForStreaming)initWithBundleIdentifier:(id)a3 clientID:(int)a4;
- (void)dealloc;
@end

@implementation IPPSessionForStreaming

- (IPPSessionForStreaming)initWithBundleIdentifier:(id)a3 clientID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPPSessionForStreaming;
  v7 = [(IPPSession *)&v11 _initWithBundleIdentifier:v6 clientID:v4 completeConfiguraton:&stru_100095310];
  if (v7)
  {
    uint64_t v8 = os_transaction_create();
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;
  }
  return v7;
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)IPPSessionForStreaming;
  [(IPPSession *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end