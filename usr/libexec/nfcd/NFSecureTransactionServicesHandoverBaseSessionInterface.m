@interface NFSecureTransactionServicesHandoverBaseSessionInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverBaseSessionInterface)initWithProtocol:(id)a3;
- (NSXPCInterface)protocolInterface;
@end

@implementation NFSecureTransactionServicesHandoverBaseSessionInterface

+ (id)interface
{
  if (qword_1003474F0 != -1) {
    dispatch_once(&qword_1003474F0, &stru_1003063B8);
  }
  v2 = (void *)qword_1003474E8;

  return v2;
}

- (NFSecureTransactionServicesHandoverBaseSessionInterface)initWithProtocol:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionInterface;
  v5 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:v4];
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    [(NFSecureTransactionServicesHandoverBaseSessionInterface *)v5 setupInterface];
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