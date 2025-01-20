@interface NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface)initWithProtocol:(id)a3;
- (NSXPCInterface)protocolInterface;
@end

@implementation NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface

- (void).cxx_destruct
{
}

- (NSXPCInterface)protocolInterface
{
  return self->_protocolInterface;
}

- (NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface)initWithProtocol:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface;
  v5 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v4];
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)v5 setupInterface];
  }

  return v5;
}

+ (id)interface
{
  if (qword_1EB4D2010 != -1) {
    dispatch_once(&qword_1EB4D2010, &__block_literal_global_41);
  }
  v2 = (void *)qword_1EB4D2008;
  return v2;
}

void __77__NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface_interface__block_invoke()
{
  v2 = [[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface alloc] initWithProtocol:&unk_1EEF38FF0];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)v2 protocolInterface];
  v1 = (void *)qword_1EB4D2008;
  qword_1EB4D2008 = v0;
}

@end