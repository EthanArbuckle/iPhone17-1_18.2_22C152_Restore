@interface NFSecureTransactionServicesHandoverSessionCallbacksInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverSessionCallbacksInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverSessionCallbacksInterface

+ (id)interface
{
  if (qword_1003473A8 != -1) {
    dispatch_once(&qword_1003473A8, &stru_100303288);
  }
  v2 = (void *)qword_1003473A0;

  return v2;
}

- (NFSecureTransactionServicesHandoverSessionCallbacksInterface)initWithProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  return [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v4 initWithProtocol:a3];
}

- (void)setupInterface
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v4 setupInterface];
  v3 = [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)self protocolInterface];
  sub_10024F6FC(v3);
}

@end