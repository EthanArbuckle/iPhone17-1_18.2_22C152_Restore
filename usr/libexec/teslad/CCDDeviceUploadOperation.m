@interface CCDDeviceUploadOperation
- (BOOL)operationExecuting;
- (BOOL)operationFinished;
- (NSError)error;
- (NSMutableData)responseData;
- (NSURLSession)urlSession;
- (id)deviceUploadCompletionBlock;
- (void)completeOperationWithResponse:(id)a3 error:(id)a4;
- (void)setDeviceUploadCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setOperationExecuting:(BOOL)a3;
- (void)setOperationFinished:(BOOL)a3;
- (void)setResponseData:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation CCDDeviceUploadOperation

- (void)completeOperationWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CCDDeviceUploadOperation *)self deviceUploadCompletionBlock];

  if (v8)
  {
    if (v7)
    {
      v9 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    v10 = [(CCDDeviceUploadOperation *)self deviceUploadCompletionBlock];
    ((void (**)(void, id, id))v10)[2](v10, v6, v7);
  }
  else
  {
    v11 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No completion block, canceling operation", (uint8_t *)&v12, 2u);
    }
    [(CCDDeviceUploadOperation *)self cancel];
  }
}

- (id)deviceUploadCompletionBlock
{
  return *(id *)(&self->_operationFinished + 2);
}

- (void)setDeviceUploadCompletionBlock:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_deviceUploadCompletionBlock + 3);
}

- (void)setError:(id)a3
{
}

- (BOOL)operationExecuting
{
  return BYTE3(self->super._httpResponseContentType);
}

- (void)setOperationExecuting:(BOOL)a3
{
  BYTE3(self->super._httpResponseContentType) = a3;
}

- (BOOL)operationFinished
{
  return BYTE4(self->super._httpResponseContentType);
}

- (void)setOperationFinished:(BOOL)a3
{
  BYTE4(self->super._httpResponseContentType) = a3;
}

- (NSMutableData)responseData
{
  return *(NSMutableData **)((char *)&self->_error + 3);
}

- (void)setResponseData:(id)a3
{
}

- (NSURLSession)urlSession
{
  return *(NSURLSession **)((char *)&self->_responseData + 3);
}

- (void)setUrlSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_responseData + 3), 0);
  objc_storeStrong((id *)((char *)&self->_error + 3), 0);
  objc_storeStrong((id *)((char *)&self->_deviceUploadCompletionBlock + 3), 0);

  objc_storeStrong((id *)(&self->_operationFinished + 2), 0);
}

@end