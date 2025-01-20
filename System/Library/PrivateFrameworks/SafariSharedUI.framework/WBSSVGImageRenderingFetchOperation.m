@interface WBSSVGImageRenderingFetchOperation
- (CGSize)webViewSize;
- (WBSSVGImageRenderingFetchOperation)initWithRequest:(id)a3;
- (WBSSVGImageRenderingFetchOperation)initWithRequest:(id)a3 completionHandler:(id)a4;
- (id)_htmlStringWithImageElementString:(id)a3;
- (id)_htmlStringWithSVGContent:(id)a3;
- (id)_htmlStringWithURL:(id)a3;
- (id)completionHandler;
- (id)webViewConfiguration;
- (void)_didCompleteWithImage:(id)a3;
- (void)_didRenderImage:(id)a3;
- (void)_loadSVGFileURL:(id)a3;
- (void)_loadingTimerDidTimeout:(id)a3;
- (void)_renderNextImage;
- (void)_takeSnapshotAndFinish;
- (void)didFailFetchWithError:(id)a3;
- (void)didFinishNavigation;
- (void)willClearWebView;
@end

@implementation WBSSVGImageRenderingFetchOperation

- (WBSSVGImageRenderingFetchOperation)initWithRequest:(id)a3
{
  return 0;
}

- (WBSSVGImageRenderingFetchOperation)initWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  id v8 = a4;
  v9 = [(WBSSiteMetadataFetchOperation *)&v19 initWithRequest:v7];
  if (v9)
  {
    uint64_t v10 = MEMORY[0x1AD115160](v8);

    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = (id)v10;

    v12 = objc_msgSend(v7, "svgContent", v19.receiver, v19.super_class);

    if (!v12)
    {
      v13 = [v7 urls];
      v14 = (void *)[v13 mutableCopy];
      v15 = v14;
      if (!v14)
      {
        v16 = (void *)MEMORY[0x1E4F1CA48];
        v4 = [v7 url];
        v15 = [v16 arrayWithObject:v4];
      }
      objc_storeStrong((id *)&v9->_remainingURLs, v15);
      if (!v14)
      {
      }
    }
    v17 = v9;
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
  return v9;
}

- (id)_htmlStringWithURL:(id)a3
{
  v4 = NSString;
  v5 = [a3 absoluteString];
  v6 = objc_msgSend(v5, "safari_stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets");
  id v7 = [v4 stringWithFormat:@"<img class=\"image\" src=\"%@\" onerror=\"this.error = true\">", v6];
  id v8 = [(WBSSVGImageRenderingFetchOperation *)self _htmlStringWithImageElementString:v7];

  return v8;
}

- (id)_htmlStringWithSVGContent:(id)a3
{
  v4 = [NSString stringWithFormat:@"<div class=\"image\">%@</div>", a3];
  v5 = [(WBSSVGImageRenderingFetchOperation *)self _htmlStringWithImageElementString:v4];

  return v5;
}

- (id)_htmlStringWithImageElementString:(id)a3
{
  id v4 = a3;
  v5 = [(WBSSiteMetadataFetchOperation *)self request];
  [v5 imageSize];
  objc_msgSend(NSString, "stringWithFormat:", @"<style>body { margin: 0 } .image { width: %zdpx;height: %zdpx;}</style>",
    (uint64_t)v6,
  id v8 = (uint64_t)v7);
  objc_msgSend(NSString, "stringWithFormat:", @"<html><head>%@%@</head><body>%@</body></html>", @"<script>window.didEncounterRenderingError = function() {    let elem = document.querySelector(\".image\");    return !elem || elem.error;}</script>",
    v8,
  v9 = v4);

  return v9;
}

- (void)_loadSVGFileURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke;
  block[3] = &unk_1E5E44A00;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithContentsOfURL:*(void *)(a1 + 32) usedEncoding:0 error:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke_2;
  v4[3] = &unk_1E5E41598;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v6);
}

void __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = [WeakRetained webView];
      id v4 = [v6 _htmlStringWithSVGContent:*(void *)(a1 + 32)];
      id v5 = (id)[v3 loadHTMLString:v4 baseURL:0];
    }
    else
    {
      [WeakRetained _didRenderImage:0];
    }
    id WeakRetained = v6;
  }
}

- (void)_renderNextImage
{
  if (!self->_remainingURLs)
  {
    id v11 = [(WBSWebViewMetadataFetchOperation *)self webView];
    id v5 = [(WBSSiteMetadataFetchOperation *)self request];
    id v8 = [v5 svgContent];
    id v9 = [(WBSSVGImageRenderingFetchOperation *)self _htmlStringWithSVGContent:v8];
    id v10 = (id)[v11 loadHTMLString:v9 baseURL:0];

    goto LABEL_5;
  }
  [(NSTimer *)self->_loadingTimeoutTimer invalidate];
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__loadingTimerDidTimeout_ selector:0 userInfo:0 repeats:30.0];
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = v3;

  id v11 = [(NSMutableArray *)self->_remainingURLs firstObject];
  [(NSMutableArray *)self->_remainingURLs removeObjectAtIndex:0];
  if (objc_msgSend(v11, "safari_isHTTPFamilyURL"))
  {
    id v5 = [(WBSWebViewMetadataFetchOperation *)self webView];
    id v6 = [(WBSSVGImageRenderingFetchOperation *)self _htmlStringWithURL:v11];
    id v7 = (id)[v5 loadHTMLString:v6 baseURL:v11];

LABEL_5:
    goto LABEL_6;
  }
  if ([v11 isFileURL]) {
    [(WBSSVGImageRenderingFetchOperation *)self _loadSVGFileURL:v11];
  }
  else {
    [(WBSSVGImageRenderingFetchOperation *)self _didRenderImage:0];
  }
LABEL_6:
}

- (void)_takeSnapshotAndFinish
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F46698]);
  [(WBSSVGImageRenderingFetchOperation *)self webViewSize];
  objc_msgSend(v3, "setRect:", 0.0, 0.0, v4, v5);
  [v3 setSnapshotWidth:&unk_1F0341838];
  if (objc_opt_respondsToSelector()) {
    [v3 _setUsesTransparentBackground:1];
  }
  objc_initWeak(&location, self);
  id v6 = [(WBSWebViewMetadataFetchOperation *)self webView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke;
  v8[3] = &unk_1E5E44F48;
  objc_copyWeak(&v10, &location);
  id v7 = v3;
  id v9 = v7;
  [v6 evaluateJavaScript:@"window.didEncounterRenderingError()" completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_2(v8, v6);
      }
      [WeakRetained didFailFetchWithError:v6];
    }
    else
    {
      id v9 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;

      if (v11 && objc_msgSend(v11, "safari_isNSBoolean") && !objc_msgSend(v11, "BOOLValue"))
      {
        v13 = [WeakRetained webView];
        uint64_t v14 = *(void *)(a1 + 32);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_26;
        v15[3] = &unk_1E5E44F20;
        objc_copyWeak(&v16, (id *)(a1 + 40));
        [v13 takeSnapshotWithConfiguration:v14 completionHandler:v15];

        objc_destroyWeak(&v16);
      }
      else
      {
        v12 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_1((uint64_t)v9, v12);
        }
        [WeakRetained didFailFetchWithError:0];
      }
    }
  }
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_26_cold_1(v9, v6);
      }
      [v8 didFailFetchWithError:v6];
    }
    else
    {
      [WeakRetained _didRenderImage:v5];
    }
  }
}

- (void)_didCompleteWithImage:(id)a3
{
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  id v5 = a3;
  [(NSTimer *)loadingTimeoutTimer invalidate];
  id completionHandler = (void (**)(id, void *))self->_completionHandler;
  id v7 = [WBSSVGImageRenderingResponse alloc];
  id v8 = [(WBSSiteMetadataFetchOperation *)self request];
  id v9 = [v8 url];
  id v10 = [(WBSSVGImageRenderingResponse *)v7 initWithURL:v9 image:v5];

  completionHandler[2](completionHandler, v10);
  [(WBSWebViewMetadataFetchOperation *)self clearWebView];
  [(WBSSiteMetadataFetchOperation *)self _setStatus:2];
}

- (void)_loadingTimerDidTimeout:(id)a3
{
  if (self->_loadingTimeoutTimer == a3 && [a3 isValid])
  {
    loadingTimeoutTimer = self->_loadingTimeoutTimer;
    self->_loadingTimeoutTimer = 0;

    id v5 = [(WBSWebViewMetadataFetchOperation *)self webView];
    [v5 stopLoading];

    [(WBSSVGImageRenderingFetchOperation *)self _didRenderImage:0];
  }
}

- (void)_didRenderImage:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4 || (v5 = [(NSMutableArray *)self->_remainingURLs count], id v4 = 0, !v5)) {
    [(WBSSVGImageRenderingFetchOperation *)self _didCompleteWithImage:v4];
  }
  else {
    [(WBSSVGImageRenderingFetchOperation *)self _renderNextImage];
  }
}

- (id)webViewConfiguration
{
  v4.receiver = self;
  v4.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  v2 = [(WBSWebViewMetadataFetchOperation *)&v4 webViewConfiguration];
  [v2 _setAllowsJavaScriptMarkup:1];
  [v2 _setNeedsStorageAccessFromFileURLsQuirk:0];
  return v2;
}

- (CGSize)webViewSize
{
  v2 = [(WBSSiteMetadataFetchOperation *)self request];
  [v2 imageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)willClearWebView
{
  v2.receiver = self;
  v2.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v2 willClearWebView];
}

- (void)didFailFetchWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v4 didFailFetchWithError:a3];
  [(WBSSVGImageRenderingFetchOperation *)self _didCompleteWithImage:0];
}

- (void)didFinishNavigation
{
  v3.receiver = self;
  v3.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  [(WBSWebViewMetadataFetchOperation *)&v3 didFinishNavigation];
  [(WBSSVGImageRenderingFetchOperation *)self _takeSnapshotAndFinish];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_remainingURLs, 0);
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "SVG rendering failed with unexpected result: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Check for successful SVG rendering failed with error: %{public}@", v7, v8, v9, v10, 2u);
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_26_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Snapshotting SVG content failed with error: %{public}@", v7, v8, v9, v10, 2u);
}

@end