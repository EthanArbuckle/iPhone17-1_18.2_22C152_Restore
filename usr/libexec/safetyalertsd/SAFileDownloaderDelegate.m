@interface SAFileDownloaderDelegate
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
@end

@implementation SAFileDownloaderDelegate

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v18 = a4;
  id v9 = a6;
  v10 = (void (**)(id, void))a7;
  v11 = [v18 originalRequest];
  v12 = [v11 URL];
  v13 = [v12 scheme];
  if ([v13 isEqualToString:@"https"])
  {
    v14 = [v9 URL];
    v15 = [v14 scheme];
    unsigned __int8 v16 = [v15 isEqualToString:@"http"];

    if (v16)
    {
      id v17 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v17 = v9;
LABEL_6:
  ((void (**)(id, id))v10)[2](v10, v17);
}

@end