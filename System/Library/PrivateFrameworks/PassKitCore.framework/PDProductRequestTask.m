@interface PDProductRequestTask
- (PKPaymentWebServiceRequest)request;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation PDProductRequestTask

- (PKPaymentWebServiceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end