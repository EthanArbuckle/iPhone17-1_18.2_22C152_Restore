@interface IPPEndpoint
- (IPPEndpoint)initWithSession:(id)a3 endpoint:(id)a4;
- (IPPSession)session;
- (PKPrinterBonjourEndpoint)endpoint;
@end

@implementation IPPEndpoint

- (IPPEndpoint)initWithSession:(id)a3 endpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPPEndpoint;
  v9 = [(IPPEndpoint *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_endpoint, a4);
  }

  return v10;
}

- (IPPSession)session
{
  return (IPPSession *)objc_getProperty(self, a2, 8, 1);
}

- (PKPrinterBonjourEndpoint)endpoint
{
  return (PKPrinterBonjourEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end