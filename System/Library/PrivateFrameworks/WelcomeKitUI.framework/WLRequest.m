@interface WLRequest
- (WLRequestDelegate)delegate;
- (void)request:(id)a3 redirect:(BOOL)a4;
- (void)sessionDidFinish:(id)a3 response:(id)a4 error:(id)a5 redirect:(BOOL)a6;
- (void)setDelegate:(id)a3;
@end

@implementation WLRequest

- (void)request:(id)a3 redirect:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v7 setTLSMinimumSupportedProtocolVersion:771];
  [v7 setTLSMaximumSupportedProtocolVersion:772];
  [v7 setHTTPMaximumConnectionsPerHost:1];
  v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v7];
  v9 = (void *)MEMORY[0x263F08BD8];
  v10 = [NSURL URLWithString:v6];
  v11 = [v9 requestWithURL:v10 cachePolicy:1 timeoutInterval:10.0];

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __30__WLRequest_request_redirect___block_invoke;
  v13[3] = &unk_264870830;
  objc_copyWeak(&v14, &location);
  BOOL v15 = a4;
  v12 = [v8 dataTaskWithRequest:v11 completionHandler:v13];
  [v12 resume];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __30__WLRequest_request_redirect___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__WLRequest_request_redirect___block_invoke_2;
  block[3] = &unk_264870808;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  char v18 = *(unsigned char *)(a1 + 40);
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v17);
}

void __30__WLRequest_request_redirect___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained sessionDidFinish:*(void *)(a1 + 32) response:*(void *)(a1 + 40) error:*(void *)(a1 + 48) redirect:*(unsigned __int8 *)(a1 + 64)];
}

- (void)sessionDidFinish:(id)a3 response:(id)a4 error:(id)a5 redirect:(BOOL)a6
{
  BOOL v6 = a6;
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    BOOL v14 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = v10;
    uint64_t v16 = [WeakRetained statusCode];
    if (!v6 || (unint64_t)(v16 - 301) > 1)
    {
      BOOL v14 = (unint64_t)(v16 - 200) < 0x64;
      if ((unint64_t)(v16 - 200) >= 0x64)
      {
        id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"WLRequest" code:3 userInfo:0];
      }
      else
      {
        id v13 = 0;
      }

      if (!v13) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v17 = [WeakRetained allHeaderFields];
    char v18 = [v17 objectForKey:@"Location"];
    if ([v18 length])
    {
      [(WLRequest *)self request:v18 redirect:1];

      goto LABEL_12;
    }
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"WLRequest" code:2 userInfo:0];
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"WLRequest" code:1 userInfo:0];
  }
  BOOL v14 = 0;
  if (v13)
  {
LABEL_10:
    _WLLog();
  }
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained requestDidFinish:v14];
LABEL_12:
}

- (WLRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WLRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end