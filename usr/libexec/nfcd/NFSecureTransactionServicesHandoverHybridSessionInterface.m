@interface NFSecureTransactionServicesHandoverHybridSessionInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverHybridSessionInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverHybridSessionInterface

+ (id)interface
{
  if (qword_100347378 != -1) {
    dispatch_once(&qword_100347378, &stru_100302EA8);
  }
  v2 = (void *)qword_100347370;

  return v2;
}

- (NFSecureTransactionServicesHandoverHybridSessionInterface)initWithProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  return [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v4 initWithProtocol:a3];
}

- (void)setupInterface
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v4 setupInterface];
  v3 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)self protocolInterface];
  sub_10024F508(v3);
}

@end