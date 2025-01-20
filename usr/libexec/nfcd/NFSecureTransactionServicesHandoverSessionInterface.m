@interface NFSecureTransactionServicesHandoverSessionInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverSessionInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverSessionInterface

+ (id)interface
{
  if (qword_100347398 != -1) {
    dispatch_once(&qword_100347398, &stru_100303268);
  }
  v2 = (void *)qword_100347390;

  return v2;
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
  sub_10024F508(v3);
}

@end