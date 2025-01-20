@interface PKPaymentAuthorizationErrorStateParam
+ (id)paramWithError:(id)a3;
+ (id)paramWithError:(id)a3 clientFailure:(BOOL)a4;
+ (id)paramWithError:(id)a3 paymentOffersError:(BOOL)a4;
- (BOOL)isClientFailure;
- (BOOL)isPaymentOffersError;
- (NSError)error;
- (id)description;
- (void)setClientFailure:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setPaymentOffersError:(BOOL)a3;
@end

@implementation PKPaymentAuthorizationErrorStateParam

+ (id)paramWithError:(id)a3
{
  return (id)[a1 paramWithError:a3 clientFailure:0];
}

+ (id)paramWithError:(id)a3 clientFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 param];
  [v7 setError:v6];

  [v7 setClientFailure:v4];
  return v7;
}

+ (id)paramWithError:(id)a3 paymentOffersError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 param];
  [v7 setError:v6];

  [v7 setPaymentOffersError:v4];
  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  if (self->_clientFailure) {
    BOOL v4 = @"YES";
  }
  else {
    BOOL v4 = @"NO";
  }
  [v3 appendFormat:@"clientFailure: '%@'; ", v4];
  if (self->_paymentOffersError) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"paymentOffersError: '%@'; ", v5];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isClientFailure
{
  return self->_clientFailure;
}

- (void)setClientFailure:(BOOL)a3
{
  self->_clientFailure = a3;
}

- (BOOL)isPaymentOffersError
{
  return self->_paymentOffersError;
}

- (void)setPaymentOffersError:(BOOL)a3
{
  self->_paymentOffersError = a3;
}

- (void).cxx_destruct
{
}

@end