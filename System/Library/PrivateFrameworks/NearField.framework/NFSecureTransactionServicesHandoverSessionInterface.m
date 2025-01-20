@interface NFSecureTransactionServicesHandoverSessionInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverSessionInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverSessionInterface

+ (id)interface
{
  if (qword_1EB4D1FE0 != -1) {
    dispatch_once(&qword_1EB4D1FE0, &__block_literal_global_3);
  }
  v2 = (void *)_MergedGlobals_17;
  return v2;
}

void __64__NFSecureTransactionServicesHandoverSessionInterface_interface__block_invoke()
{
  v2 = [[NFSecureTransactionServicesHandoverSessionInterface alloc] initWithProtocol:&unk_1EEF468A0];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)v2 protocolInterface];
  v1 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = v0;
}

- (NFSecureTransactionServicesHandoverSessionInterface)initWithProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionInterface;
  return [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v4 initWithProtocol:a3];
}

- (void)setupInterface
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v4 setupInterface];
  v3 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)self protocolInterface];
  SetNFTNEPProtocolConformance(v3);
}

@end