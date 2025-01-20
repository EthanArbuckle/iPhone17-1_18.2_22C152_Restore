@interface PDExpressMutationRequest
- (PDExpressMutationRequest)init;
@end

@implementation PDExpressMutationRequest

- (PDExpressMutationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressMutationRequest;
  result = [(PDExpressMutationRequest *)&v3 init];
  if (result) {
    result->_userInitiated = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cardTypeRemovalCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_expressPassConfiguration, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end