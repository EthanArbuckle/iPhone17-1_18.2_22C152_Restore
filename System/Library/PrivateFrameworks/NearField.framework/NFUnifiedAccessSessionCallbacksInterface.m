@interface NFUnifiedAccessSessionCallbacksInterface
+ (id)interface;
- (void)setupInterface;
@end

@implementation NFUnifiedAccessSessionCallbacksInterface

+ (id)interface
{
  if (qword_1EB4D1F90 != -1) {
    dispatch_once(&qword_1EB4D1F90, &__block_literal_global_31);
  }
  v2 = (void *)qword_1EB4D1F88;
  return v2;
}

void __53__NFUnifiedAccessSessionCallbacksInterface_interface__block_invoke()
{
  v2 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)[NFUnifiedAccessSessionCallbacksInterface alloc] initWithProtocol:&unk_1EEF466C0];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)v2 protocolInterface];
  v1 = (void *)qword_1EB4D1F88;
  qword_1EB4D1F88 = v0;
}

- (void)setupInterface
{
  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionCallbacksInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v2 setupInterface];
}

@end