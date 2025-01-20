@interface ICSAPSessionVerifySignatureOperation
- (NSData)signatureData;
- (NSMutableData)data;
- (id)responseHandler;
- (void)executeWithSAPContext:(id)a3;
- (void)finishWithSAPContextPreparationError:(id)a3;
- (void)setData:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSignatureData:(id)a3;
@end

@implementation ICSAPSessionVerifySignatureOperation

- (void)executeWithSAPContext:(id)a3
{
  signatureData = self->_signatureData;
  data = self->_data;
  id v12 = 0;
  unsigned int v7 = [a3 processResponseWithSignatureData:signatureData data:data error:&v12];
  id v8 = v12;
  v9 = v8;
  if ((v7 & 1) == 0 && !v8)
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  responseHandler = (void (**)(id, void, void *))self->_responseHandler;
  if (responseHandler)
  {
    if (v9) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v7;
    }
    responseHandler[2](responseHandler, v11, v9);
  }
  [(ICSAPSessionAbstractOperation *)self finishWithError:v9];
}

- (void)setSignatureData:(id)a3
{
}

- (void)setResponseHandler:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_signatureData, 0);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (NSMutableData)data
{
  return self->_data;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)finishWithSAPContextPreparationError:(id)a3
{
  id v4 = a3;
  responseHandler = (void (**)(id, void, id))self->_responseHandler;
  id v6 = v4;
  if (responseHandler)
  {
    responseHandler[2](responseHandler, 0, v4);
    id v4 = v6;
  }
  [(ICSAPSessionAbstractOperation *)self finishWithError:v4];
}

@end