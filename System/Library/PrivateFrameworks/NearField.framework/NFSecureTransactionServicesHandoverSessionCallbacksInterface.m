@interface NFSecureTransactionServicesHandoverSessionCallbacksInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverSessionCallbacksInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverSessionCallbacksInterface

+ (id)interface
{
  if (qword_1EB4D1FF0 != -1) {
    dispatch_once(&qword_1EB4D1FF0, &__block_literal_global_50);
  }
  v2 = (void *)qword_1EB4D1FE8;
  return v2;
}

void __73__NFSecureTransactionServicesHandoverSessionCallbacksInterface_interface__block_invoke()
{
  v2 = [[NFSecureTransactionServicesHandoverSessionCallbacksInterface alloc] initWithProtocol:&unk_1EEF40BA0];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)v2 protocolInterface];
  v1 = (void *)qword_1EB4D1FE8;
  qword_1EB4D1FE8 = v0;
}

- (void)setupInterface
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v4 setupInterface];
  v3 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)self protocolInterface];
  SetNFTNEPCallbackProtocolConformance(v3);
}

- (NFSecureTransactionServicesHandoverSessionCallbacksInterface)initWithProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  return [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v4 initWithProtocol:a3];
}

@end