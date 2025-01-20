@interface FMDNSURLSession
- (FMDURLSessionDelegate)delegate;
- (NSURLSession)session;
- (id)dataTaskWithRequest:(id)a3;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)finishTasksAndInvalidate;
- (void)getAllTasksWithCompletionHandler:(id)a3;
- (void)invalidateAndCancel;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation FMDNSURLSession

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FMDNSURLSession *)self session];
  v9 = [v8 dataTaskWithRequest:v7 completionHandler:v6];

  return v9;
}

- (id)dataTaskWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(FMDNSURLSession *)self session];
  id v6 = [v5 dataTaskWithRequest:v4];

  return v6;
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FMDNSURLSession *)self session];
  v9 = [v8 downloadTaskWithRequest:v7 completionHandler:v6];

  return v9;
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDNSURLSession *)self session];
  [v5 getAllTasksWithCompletionHandler:v4];
}

- (void)finishTasksAndInvalidate
{
  id v2 = [(FMDNSURLSession *)self session];
  [v2 finishTasksAndInvalidate];
}

- (void)invalidateAndCancel
{
  id v2 = [(FMDNSURLSession *)self session];
  [v2 invalidateAndCancel];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a4;
  id v5 = [(FMDNSURLSession *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 URLSession:self didBecomeInvalidWithError:v6];
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  v8 = [(FMDNSURLSession *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 URLSession:self didReceiveChallenge:v9 completionHandler:v7];
  }
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (FMDURLSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDURLSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_session, 0);
}

@end