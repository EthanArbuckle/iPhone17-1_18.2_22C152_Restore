@interface NFUnifiedAccessSessionInterface
+ (id)interface;
- (void)setupInterface;
@end

@implementation NFUnifiedAccessSessionInterface

+ (id)interface
{
  if (qword_1003476F8 != -1) {
    dispatch_once(&qword_1003476F8, &stru_1003087E0);
  }
  v2 = (void *)qword_1003476F0;

  return v2;
}

- (void)setupInterface
{
  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v2 setupInterface];
}

@end