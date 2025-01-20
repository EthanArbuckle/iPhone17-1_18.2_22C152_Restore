@interface MFMessageURLConnectionDelegate
- (EFFuture)future;
- (MFMessageURLConnectionDelegate)init;
- (NSURLResponse)response;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)dealloc;
@end

@implementation MFMessageURLConnectionDelegate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageURLConnectionDelegate;
  [(MFMessageURLConnectionDelegate *)&v3 dealloc];
}

- (MFMessageURLConnectionDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFMessageURLConnectionDelegate;
  v2 = [(MFMessageURLConnectionDelegate *)&v4 init];
  if (v2) {
    v2->_promise = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
  }
  return v2;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  self->_response = (NSURLResponse *)a5;
  v7 = (void (*)(id, uint64_t))*((void *)a6 + 2);
  v7(a6, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  responseBody = self->_responseBody;
  if (responseBody)
  {
    -[NSMutableData appendData:](responseBody, "appendData:", a5, a4);
  }
  else
  {
    self->_responseBody = (NSMutableData *)objc_msgSend(a5, "mutableCopy", a3, a4);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  promise = self->_promise;
  if (a5) {
    -[EFPromise finishWithError:](promise, "finishWithError:", a5, a4);
  }
  else {
    -[EFPromise finishWithResult:](promise, "finishWithResult:", self->_responseBody, a4);
  }
}

- (EFFuture)future
{
  return (EFFuture *)[(EFPromise *)self->_promise future];
}

- (NSURLResponse)response
{
  return self->_response;
}

@end