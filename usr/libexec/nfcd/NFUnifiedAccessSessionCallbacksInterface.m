@interface NFUnifiedAccessSessionCallbacksInterface
+ (id)interface;
- (void)setupInterface;
@end

@implementation NFUnifiedAccessSessionCallbacksInterface

+ (id)interface
{
  if (qword_100347708 != -1) {
    dispatch_once(&qword_100347708, &stru_100308800);
  }
  v2 = (void *)qword_100347700;

  return v2;
}

- (void)setupInterface
{
  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionCallbacksInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *)&v2 setupInterface];
}

@end