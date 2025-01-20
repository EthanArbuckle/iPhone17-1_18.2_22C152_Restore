@interface NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface

+ (id)interface
{
  if (qword_1EB4D2030 != -1) {
    dispatch_once(&qword_1EB4D2030, &__block_literal_global_77);
  }
  v2 = (void *)qword_1EB4D2028;
  return v2;
}

void __79__NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface_interface__block_invoke()
{
  v2 = [[NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface alloc] initWithProtocol:&unk_1EEF39220];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)v2 protocolInterface];
  v1 = (void *)qword_1EB4D2028;
  qword_1EB4D2028 = v0;
}

- (NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface)initWithProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface;
  return [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v4 initWithProtocol:a3];
}

- (void)setupInterface
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v4 setupInterface];
  v3 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)self protocolInterface];
  SetNFTNEPCallbackProtocolConformance(v3);
}

@end