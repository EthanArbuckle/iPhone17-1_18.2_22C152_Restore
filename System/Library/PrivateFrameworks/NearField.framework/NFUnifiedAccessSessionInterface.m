@interface NFUnifiedAccessSessionInterface
+ (id)interface;
- (void)setupInterface;
@end

@implementation NFUnifiedAccessSessionInterface

+ (id)interface
{
  if (qword_1EB4D1F80 != -1) {
    dispatch_once(&qword_1EB4D1F80, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_14;
  return v2;
}

void __44__NFUnifiedAccessSessionInterface_interface__block_invoke()
{
  v2 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)[NFUnifiedAccessSessionInterface alloc] initWithProtocol:&unk_1EEF46660];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)v2 protocolInterface];
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v0;
}

- (void)setupInterface
{
  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v2 setupInterface];
}

@end