@interface PKPaymentAuthorizationInterfaceManager
+ (id)paymentInterfaceForContext:(id)a3 configuration:(id)a4 error:(id *)a5;
@end

@implementation PKPaymentAuthorizationInterfaceManager

+ (id)paymentInterfaceForContext:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PKPaymentAuthorizationPaymentUIInterface alloc] initWithContext:v7 configuration:v6];

  return v8;
}

@end