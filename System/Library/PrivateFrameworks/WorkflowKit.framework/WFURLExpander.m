@interface WFURLExpander
+ (void)expandURL:(id)a3 completionHandler:(id)a4;
- (NSURL)URL;
- (id)completionHandler;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)finishWithURL:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setURL:(id)a3;
- (void)start;
@end

@implementation WFURLExpander

+ (void)expandURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = WFAppTransportSecuredURL();

  [v7 setURL:v8];
  [v7 setCompletionHandler:v5];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__WFURLExpander_expandURL_completionHandler___block_invoke;
  block[3] = &unk_1E6558B28;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __45__WFURLExpander_expandURL_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  objc_msgSend(a4, "cancel", a3);
  id v7 = [(WFURLExpander *)self URL];
  [(WFURLExpander *)self finishWithURL:v7 error:0];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9 = (void (**)(id, id))a7;
  id v10 = a6;
  id v14 = (id)[v10 mutableCopy];
  id v11 = [v10 URL];

  v12 = WFAppTransportSecuredURL();
  [v14 setURL:v12];

  v13 = [v14 URL];
  [(WFURLExpander *)self setURL:v13];

  v9[2](v9, v14);
}

- (void)finishWithURL:(id)a3 error:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(WFURLExpander *)self completionHandler];
  [(WFURLExpander *)self setCompletionHandler:0];
  v8 = [v19 host];
  int v9 = [v8 hasSuffix:@"medium.com"];

  if (v9)
  {
    id v10 = [&unk_1F2317C88 arrayByAddingObject:@"source"];
  }
  else
  {
    id v10 = &unk_1F2317C88;
  }
  id v11 = objc_msgSend(v19, "dc_queryDictionary");
  v12 = [v11 allKeys];
  v13 = [v12 firstObjectCommonWithArray:v10];

  if (v13)
  {
    id v14 = (void *)[v11 mutableCopy];
    [v14 removeObjectsForKeys:v10];
    v15 = [MEMORY[0x1E4F29088] componentsWithURL:v19 resolvingAgainstBaseURL:0];
    if ([v14 count])
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "dc_queryStringWithQueryDictionary:", v14);
      [v15 setQuery:v16];
    }
    else
    {
      [v15 setQuery:0];
    }
    uint64_t v18 = [v15 URL];

    id v17 = (id)v18;
  }
  else
  {
    id v17 = v19;
  }
  id v20 = v17;
  v7[2](v7);
}

- (void)start
{
  v3 = (void *)MEMORY[0x1E4F28E88];
  v4 = [(WFURLExpander *)self URL];
  id v10 = [v3 requestWithURL:v4];

  [v10 _setNonAppInitiated:1];
  id v5 = (void *)MEMORY[0x1E4F290E0];
  id v6 = objc_msgSend(MEMORY[0x1E4F290F0], "wf_defaultSessionConfiguration");
  id v7 = [MEMORY[0x1E4F28F08] mainQueue];
  v8 = [v5 sessionWithConfiguration:v6 delegate:self delegateQueue:v7];

  int v9 = [v8 dataTaskWithRequest:v10];
  [v9 resume];
}

@end