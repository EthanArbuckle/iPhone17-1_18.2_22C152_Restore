@interface _RUILoaderSessionDelegateAdapter
- (NSURLSessionTaskDelegate)delegate;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)setDelegate:(id)a3;
@end

@implementation _RUILoaderSessionDelegateAdapter

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(_RUILoaderSessionDelegateAdapter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v16 URLSession:v17 task:v12 willPerformHTTPRedirection:v13 newRequest:v14 completionHandler:v15];
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(_RUILoaderSessionDelegateAdapter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 URLSession:v11 didReceiveChallenge:v8 completionHandler:v9];
  }
}

- (NSURLSessionTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NSURLSessionTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end