@interface MSVArtworkServiceOperation
- (MSVArtworkServiceOperation)initWithArtworkRequest:(id)a3;
- (MSVArtworkServiceRequest)request;
- (NSError)operationError;
- (NSString)debugMessage;
- (void)setDebugMessage:(id)a3;
- (void)setOperationError:(id)a3;
@end

@implementation MSVArtworkServiceOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_debugMessage, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
}

- (MSVArtworkServiceRequest)request
{
  return self->_request;
}

- (void)setDebugMessage:(id)a3
{
  self->_debugMessage = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSString)debugMessage
{
  return self->_debugMessage;
}

- (void)setOperationError:(id)a3
{
}

- (NSError)operationError
{
  return self->_operationError;
}

- (MSVArtworkServiceOperation)initWithArtworkRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSVArtworkServiceOperation;
  v6 = [(MSVArtworkServiceOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

@end