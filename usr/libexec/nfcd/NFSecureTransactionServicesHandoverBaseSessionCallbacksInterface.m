@interface NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface)initWithProtocol:(id)a3;
- (NSXPCInterface)protocolInterface;
@end

@implementation NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface

+ (id)interface
{
  if (qword_100347500 != -1) {
    dispatch_once(&qword_100347500, &stru_1003063D8);
  }
  v2 = (void *)qword_1003474F8;

  return v2;
}

- (NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface)initWithProtocol:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface;
  v5 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:v4];
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)v5 setupInterface];
  }

  return v5;
}

- (NSXPCInterface)protocolInterface
{
  return self->_protocolInterface;
}

- (void).cxx_destruct
{
}

@end