@interface PKSharedPaymentWebServiceArchiver
+ (id)sharedPaymentWebServiceArchiver;
- (void)archiveContext:(id)a3;
@end

@implementation PKSharedPaymentWebServiceArchiver

+ (id)sharedPaymentWebServiceArchiver
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)archiveContext:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentService);
  [(PKPaymentService *)v4 setSharedPaymentWebServiceContext:v3];
}

@end