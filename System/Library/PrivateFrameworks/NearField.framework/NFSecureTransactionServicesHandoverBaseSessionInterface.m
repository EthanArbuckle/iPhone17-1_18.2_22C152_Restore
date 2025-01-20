@interface NFSecureTransactionServicesHandoverBaseSessionInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverBaseSessionInterface)initWithProtocol:(id)a3;
- (NSXPCInterface)protocolInterface;
@end

@implementation NFSecureTransactionServicesHandoverBaseSessionInterface

+ (id)interface
{
  if (qword_1EB4D2000 != -1) {
    dispatch_once(&qword_1EB4D2000, &__block_literal_global_5);
  }
  v2 = (void *)_MergedGlobals_18;
  return v2;
}

void __68__NFSecureTransactionServicesHandoverBaseSessionInterface_interface__block_invoke()
{
  v2 = [[NFSecureTransactionServicesHandoverBaseSessionInterface alloc] initWithProtocol:&unk_1EEF42448];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)v2 protocolInterface];
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v0;
}

- (NFSecureTransactionServicesHandoverBaseSessionInterface)initWithProtocol:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionInterface;
  v5 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v4];
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