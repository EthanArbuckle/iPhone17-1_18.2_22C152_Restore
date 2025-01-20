@interface TabDocumentForPageTest
- (BOOL)allowsNetworkAccess;
- (BOOL)autoFillControllerShouldCollectFormMetadataForTesting:(id)a3;
- (id)createTabDocumentView;
- (id)createWebViewConfiguration;
- (id)metadataHandler;
- (void)_webViewWebProcessDidCrash:(id)a3;
- (void)autoFillController:(id)a3 didCollectFormMetadataForTesting:(id)a4 forURL:(id)a5;
- (void)autoFillController:(id)a3 didFailFormMetadataForTesting:(id)a4;
- (void)setAllowsNetworkAccess:(BOOL)a3;
- (void)setFixedWebViewSize:(CGSize)a3 completionHandler:(id)a4;
- (void)setMetadataHandler:(id)a3;
@end

@implementation TabDocumentForPageTest

- (id)createTabDocumentView
{
  v2 = objc_alloc_init(TabDocumentViewForPageTest);
  return v2;
}

- (void)setFixedWebViewSize:(CGSize)a3 completionHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(TabDocument *)self view];
  objc_msgSend(v8, "setFixedWebViewSize:completionHandler:", v7, width, height);
}

- (void)setMetadataHandler:(id)a3
{
  v5 = (void *)MEMORY[0x1E4E42950](a3, a2);
  id metadataHandler = self->_metadataHandler;
  self->_id metadataHandler = v5;

  if (a3) {
    id v7 = self;
  }
  else {
    id v7 = 0;
  }
  id v8 = [(TabDocument *)self autoFillController];
  [v8 setTestController:v7];
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)TabDocumentForPageTest;
  [(TabDocument *)&v9 _webViewWebProcessDidCrash:a3];
  v4 = [(TabDocument *)self autoFillController];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F992E8];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = @"WebContent process crashed";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v5 errorWithDomain:v6 code:1 userInfo:v7];
  [(TabDocumentForPageTest *)self autoFillController:v4 didFailFormMetadataForTesting:v8];
}

- (BOOL)autoFillControllerShouldCollectFormMetadataForTesting:(id)a3
{
  return self->_metadataHandler != 0;
}

- (void)autoFillController:(id)a3 didCollectFormMetadataForTesting:(id)a4 forURL:(id)a5
{
  id metadataHandler = (void (**)(id, id, void))self->_metadataHandler;
  if (metadataHandler)
  {
    metadataHandler[2](metadataHandler, a4, 0);
    id v7 = self->_metadataHandler;
    self->_id metadataHandler = 0;
  }
}

- (void)autoFillController:(id)a3 didFailFormMetadataForTesting:(id)a4
{
  id metadataHandler = (void (**)(id, void, id))self->_metadataHandler;
  if (metadataHandler)
  {
    metadataHandler[2](metadataHandler, 0, a4);
    id v6 = self->_metadataHandler;
    self->_id metadataHandler = 0;
  }
}

- (id)createWebViewConfiguration
{
  v7.receiver = self;
  v7.super_class = (Class)TabDocumentForPageTest;
  v3 = [(TabDocument *)&v7 createWebViewConfiguration];
  v4 = v3;
  if (self->_allowsNetworkAccess)
  {
    [v3 _setAllowedNetworkHosts:0];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CAD0] set];
    [v4 _setAllowedNetworkHosts:v5];
  }
  return v4;
}

- (id)metadataHandler
{
  return self->_metadataHandler;
}

- (BOOL)allowsNetworkAccess
{
  return self->_allowsNetworkAccess;
}

- (void)setAllowsNetworkAccess:(BOOL)a3
{
  self->_allowsNetworkAccess = a3;
}

- (void).cxx_destruct
{
}

@end