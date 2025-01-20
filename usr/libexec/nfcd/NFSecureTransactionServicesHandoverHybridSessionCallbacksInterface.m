@interface NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface

+ (id)interface
{
  if (qword_100347388 != -1) {
    dispatch_once(&qword_100347388, &stru_100302EC8);
  }
  v2 = (void *)qword_100347380;

  return v2;
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
  sub_10024F6FC(v3);
}

@end