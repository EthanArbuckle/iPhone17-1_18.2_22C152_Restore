@interface WBSAsynchronousRequestHelper
- (WBSAsynchronousRequestHelper)initWithRequest:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)cancel;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)sendRequest;
@end

@implementation WBSAsynchronousRequestHelper

- (WBSAsynchronousRequestHelper)initWithRequest:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WBSAsynchronousRequestHelper;
  v11 = [(WBSAsynchronousRequestHelper *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    uint64_t v13 = [v10 copy];
    id handler = v12->_handler;
    v12->_id handler = (id)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F18D80]) initWithRequest:v8 delegate:v12 startImmediately:0];
    connection = v12->_connection;
    v12->_connection = (NSURLConnection *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)dealloc
{
  [(NSURLConnection *)self->_connection cancel];
  v3.receiver = self;
  v3.super_class = (Class)WBSAsynchronousRequestHelper;
  [(WBSAsynchronousRequestHelper *)&v3 dealloc];
}

- (void)sendRequest
{
  connection = self->_connection;
  v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(NSURLConnection *)connection scheduleInRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];

  [(NSURLConnection *)self->_connection start];
  objc_storeStrong(&self->_lifetimeExtender, self);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  [(NSURLConnection *)self->_connection cancel];
  v6 = _Block_copy(self->_handler);
  v7 = self->_response;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__WBSAsynchronousRequestHelper_connection_didFailWithError___block_invoke;
  v13[3] = &unk_1E615B8D8;
  id v15 = v5;
  id v16 = v6;
  v14 = v7;
  id v9 = v5;
  id v10 = v7;
  id v11 = v6;
  [(NSOperationQueue *)queue addOperationWithBlock:v13];
  id lifetimeExtender = self->_lifetimeExtender;
  self->_id lifetimeExtender = 0;
}

uint64_t __60__WBSAsynchronousRequestHelper_connection_didFailWithError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6 = a4;
  response = self->_response;
  p_response = &self->_response;
  if (!response)
  {
    id v9 = v6;
    objc_storeStrong((id *)p_response, a4);
    id v6 = v9;
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  data = self->_data;
  if (data)
  {
    [(NSMutableData *)data appendData:a4];
  }
  else
  {
    id v6 = (NSMutableData *)objc_msgSend(a4, "mutableCopy", a3);
    v7 = self->_data;
    self->_data = v6;
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  [(NSURLConnection *)self->_connection cancel];
  v4 = _Block_copy(self->_handler);
  id v5 = self->_response;
  id v6 = self->_data;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__WBSAsynchronousRequestHelper_connectionDidFinishLoading___block_invoke;
  v12[3] = &unk_1E615B8D8;
  v14 = v6;
  id v15 = v4;
  uint64_t v13 = v5;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  [(NSOperationQueue *)queue addOperationWithBlock:v12];
  id lifetimeExtender = self->_lifetimeExtender;
  self->_id lifetimeExtender = 0;
}

uint64_t __59__WBSAsynchronousRequestHelper_connectionDidFinishLoading___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)cancel
{
  [(NSURLConnection *)self->_connection cancel];
  id handler = self->_handler;
  v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:89 userInfo:0];
  (*((void (**)(id, void, void, void *))handler + 2))(handler, 0, 0, v4);

  id lifetimeExtender = self->_lifetimeExtender;
  self->_id lifetimeExtender = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lifetimeExtender, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end