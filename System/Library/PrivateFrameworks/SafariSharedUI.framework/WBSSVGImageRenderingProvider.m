@interface WBSSVGImageRenderingProvider
- (BOOL)_requestIsValid:(id)a3;
- (BOOL)canHandleRequest:(id)a3;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)setProviderDelegate:(id)a3;
- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4;
- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSSVGImageRenderingProvider

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_requestIsValid:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 url];
  if ((objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) != 0
    || ([v4 isFileURL] & 1) != 0
    || ([v3 svgContent],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v6))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9 = [v3 urls];
    if ([v9 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ((objc_msgSend(v15, "safari_isHTTPFamilyURL", (void)v16) & 1) == 0
              && ![v15 isFileURL])
            {
              BOOL v7 = 0;
              goto LABEL_19;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      BOOL v7 = 1;
LABEL_19:
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  *a4 = [(WBSSVGImageRenderingProvider *)self _requestIsValid:a3];
  return 0;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  v8[3] = &unk_1E5E44F98;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [WeakRetained siteMetadataProvider:self didReceiveResponse:0 forRequest:v7 beginOperationUsingBlock:v8];
}

WBSSVGImageRenderingFetchOperation *__79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(int8x16_t *a1)
{
  v2 = [WBSSVGImageRenderingFetchOperation alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke_2;
  v6[3] = &unk_1E5E44F70;
  int8x16_t v5 = a1[2];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v3 = [(WBSSVGImageRenderingFetchOperation *)v2 initWithRequest:(id)v5.i64[0] completionHandler:v6];
  [(WBSWebViewMetadataFetchOperation *)v3 setDelegate:a1[2].i64[1]];

  return v3;
}

void __79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained siteMetadataProvider:*(void *)(a1 + 32) didReceiveResponse:v4 ofType:0 didReceiveNewData:0 forRequest:*(void *)(a1 + 40)];
}

- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  p_providerDelegate = &self->_providerDelegate;
  id v11 = a6;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:getWebViewOfSize:withConfiguration:completionHandler:", self, v12, v11, width, height);
}

- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4
{
  p_providerDelegate = &self->_providerDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  [WeakRetained siteMetadataProvider:self didFinishUsingWebView:v6];
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (void)setProviderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end