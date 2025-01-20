@interface ICSAPSessionSignDataOperation
- (NSData)data;
- (id)responseHandler;
- (void)executeWithSAPContext:(id)a3;
- (void)finishWithSAPContextPreparationError:(id)a3;
- (void)setData:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation ICSAPSessionSignDataOperation

- (void)executeWithSAPContext:(id)a3
{
  data = self->_data;
  id v12 = 0;
  id v13 = 0;
  char v6 = [a3 signData:data returningSignatureData:&v13 error:&v12];
  id v7 = v13;
  id v8 = v12;
  v9 = v8;
  if ((v6 & 1) == 0 && !v8)
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  responseHandler = (void (**)(id, void, void *))self->_responseHandler;
  if (responseHandler)
  {
    if (v9) {
      id v11 = 0;
    }
    else {
      id v11 = v7;
    }
    ((void (**)(id, id, void *))responseHandler)[2](responseHandler, v11, v9);
  }
  [(ICSAPSessionAbstractOperation *)self finishWithError:v9];
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
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (NSData)data
{
  return self->_data;
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