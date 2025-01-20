@interface WBSTouchIconWebProcessPlugInPageController
- (WBSTouchIconObserver)touchIconObserver;
- (id)_extractFaviconURLsIncludingDefaultURLs:(BOOL)a3 didExtractNonDefaultIconURLs:(BOOL *)a4;
- (id)_extractTouchIconURLsIncludingDefaultURLs:(BOOL)a3 didExtractNonDefaultIconURLs:(BOOL *)a4;
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didHandleOnloadEventsForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didInitiateLoadForResource:(unint64_t)a5 request:(id)a6 pageIsProvisionallyLoading:(BOOL)a7;
@end

@implementation WBSTouchIconWebProcessPlugInPageController

- (WBSTouchIconObserver)touchIconObserver
{
  touchIconObserver = self->_touchIconObserver;
  if (touchIconObserver)
  {
    v3 = touchIconObserver;
  }
  else
  {
    v5 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F03673D0];
    v6 = [(WBSWebProcessPlugInPageController *)self browserContextController];
    v7 = [v6 _remoteObjectRegistry];
    v8 = [v7 remoteObjectProxyWithInterface:v5];
    v9 = self->_touchIconObserver;
    self->_touchIconObserver = v8;

    v3 = self->_touchIconObserver;
  }
  return v3;
}

- (id)_extractTouchIconURLsIncludingDefaultURLs:(BOOL)a3 didExtractNonDefaultIconURLs:(BOOL *)a4
{
  BOOL v5 = a3;
  v6 = [(WBSWebProcessPlugInPageController *)self mainFrame];
  v7 = [[WBSMetadataExtractor alloc] initWithWebProcessPlugInFrame:v6];
  v8 = [v6 URL];
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [(WBSMetadataExtractor *)v7 appleTouchIconURLs];
  BOOL v11 = [v10 count] != 0;
  [v9 addObjectsFromArray:v10];
  if (v5)
  {
    v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"/apple-touch-icon-precomposed.png" relativeToURL:v8];
    [v9 addObject:v12];

    v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"/apple-touch-icon.png" relativeToURL:v8];
    [v9 addObject:v13];
  }
  if (a4) {
    *a4 = v11;
  }

  return v9;
}

- (id)_extractFaviconURLsIncludingDefaultURLs:(BOOL)a3 didExtractNonDefaultIconURLs:(BOOL *)a4
{
  BOOL v5 = a3;
  v6 = [(WBSWebProcessPlugInPageController *)self mainFrame];
  v7 = [[WBSMetadataExtractor alloc] initWithWebProcessPlugInFrame:v6];
  v8 = [v6 URL];
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [(WBSMetadataExtractor *)v7 faviconURLs];
  BOOL v11 = [v10 count] != 0;
  [v9 addObjectsFromArray:v10];
  if (v5)
  {
    v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"/favicon.ico" relativeToURL:v8];
    [v9 addObject:v12];
  }
  if (a4) {
    *a4 = v11;
  }

  return v9;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didInitiateLoadForResource:(unint64_t)a5 request:(id)a6 pageIsProvisionallyLoading:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = [a3 mainFrame];

  if (v12 == v11 && v7)
  {
    self->_mainFrameMainResourceId = a5;
    self->_didRecieveDidHandleOnloadEventsForFrameCallback = 0;
    self->_shouldExtractIconsWhenRecievingDidHandleOnloadEventsForFrameCallback = 0;
  }
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  if (self->_mainFrameMainResourceId == a5)
  {
    BOOL v7 = objc_msgSend(a6, "mutableCopy", a3, a4);
    [v7 setHTTPShouldHandleCookies:0];
    [v7 setAttribution:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  return v7;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mainFrame];

  if (v7 == v6)
  {
    char v18 = 0;
    v8 = [(WBSTouchIconWebProcessPlugInPageController *)self _extractTouchIconURLsIncludingDefaultURLs:1 didExtractNonDefaultIconURLs:&v18];
    char v17 = 0;
    v9 = [(WBSTouchIconWebProcessPlugInPageController *)self _extractFaviconURLsIncludingDefaultURLs:1 didExtractNonDefaultIconURLs:&v17];
    v10 = [(WBSTouchIconWebProcessPlugInPageController *)self touchIconObserver];
    id v11 = [(WBSWebProcessPlugInPageController *)self mainFrame];
    id v12 = [v11 URL];
    [v10 didFetchTouchIconURLs:v8 andFaviconURLs:v9 forURL:v12];

    if (!v18 || !v17)
    {
      if (self->_didRecieveDidHandleOnloadEventsForFrameCallback)
      {
        uint64_t v13 = [(WBSTouchIconWebProcessPlugInPageController *)self _extractTouchIconURLsIncludingDefaultURLs:0 didExtractNonDefaultIconURLs:0];

        v14 = [(WBSTouchIconWebProcessPlugInPageController *)self touchIconObserver];
        v15 = [(WBSWebProcessPlugInPageController *)self mainFrame];
        v16 = [v15 URL];
        [v14 didFetchTouchIconURLs:v13 andFaviconURLs:v9 forURL:v16];

        v8 = (void *)v13;
      }
      else
      {
        self->_shouldExtractIconsWhenRecievingDidHandleOnloadEventsForFrameCallback = 1;
      }
    }
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didHandleOnloadEventsForFrame:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mainFrame];

  if (v7 == v6)
  {
    self->_didRecieveDidHandleOnloadEventsForFrameCallback = 1;
    if (self->_shouldExtractIconsWhenRecievingDidHandleOnloadEventsForFrameCallback)
    {
      id v12 = [(WBSTouchIconWebProcessPlugInPageController *)self _extractTouchIconURLsIncludingDefaultURLs:1 didExtractNonDefaultIconURLs:0];
      v8 = [(WBSTouchIconWebProcessPlugInPageController *)self _extractFaviconURLsIncludingDefaultURLs:1 didExtractNonDefaultIconURLs:0];
      v9 = [(WBSTouchIconWebProcessPlugInPageController *)self touchIconObserver];
      v10 = [(WBSWebProcessPlugInPageController *)self mainFrame];
      id v11 = [v10 URL];
      [v9 didFetchTouchIconURLs:v12 andFaviconURLs:v8 forURL:v11];
    }
  }
}

- (void).cxx_destruct
{
}

@end