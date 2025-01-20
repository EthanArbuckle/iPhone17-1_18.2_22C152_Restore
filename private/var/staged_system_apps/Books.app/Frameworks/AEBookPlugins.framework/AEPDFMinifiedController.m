@interface AEPDFMinifiedController
- (AEAssetMinibarViewController)minifiedControllerMinibarViewController;
- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate;
- (AEAssetViewController)minifiedControllerLoadedAssetViewController;
- (AEPDFBookHelper)helper;
- (AEPDFMinifiedController)initWithHelper:(id)a3;
- (BOOL)minifiedControllerAnimateFromMinibarIfPossible;
- (BOOL)minifiedControllerShouldPreloadAssetViewController;
- (BOOL)minifiedControllerShouldUnloadAssetViewController;
- (id)minifiedControllerStateConforminigToProtocol:(id)a3;
- (void)minifiedControllerDidCloseAssetFully;
- (void)minifiedControllerSaveState;
- (void)minifiedControllerWillUnloadAsset;
- (void)setHelper:(id)a3;
- (void)setMinifiedControllerDelegate:(id)a3;
- (void)setMinifiedControllerLoadedAssetViewController:(id)a3;
@end

@implementation AEPDFMinifiedController

- (AEPDFMinifiedController)initWithHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEPDFMinifiedController;
  v6 = [(AEPDFMinifiedController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_helper, a3);
  }

  return v7;
}

- (void)minifiedControllerDidCloseAssetFully
{
  v3 = [(AEPDFMinifiedController *)self helper];
  id v10 = [v3 url];

  v4 = +[AEPdfCache sharedInstance];
  id v5 = [v4 copyCacheObjectForURL:v10];

  v6 = [v5 document];
  unsigned int v7 = [v6 isEncrypted];

  v8 = +[AEPdfCache sharedInstance];
  [v8 removeCacheObjectForURL:v10];

  if (v7)
  {
    objc_super v9 = [(AEPDFMinifiedController *)self minifiedControllerDelegate];
    [v9 minifiedControllerRequestClose:self error:0];
  }
}

- (void)minifiedControllerWillUnloadAsset
{
  v3 = [(AEPDFMinifiedController *)self minifiedControllerLoadedAssetViewController];
  [v3 close:0];

  v4 = [(AEPDFMinifiedController *)self minifiedControllerLoadedAssetViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AEPDFMinifiedController *)self minifiedControllerLoadedAssetViewController];
    [v6 assetViewControllerWillUnload];
  }
}

- (BOOL)minifiedControllerShouldPreloadAssetViewController
{
  return 0;
}

- (BOOL)minifiedControllerShouldUnloadAssetViewController
{
  return 0;
}

- (AEAssetMinibarViewController)minifiedControllerMinibarViewController
{
  return 0;
}

- (BOOL)minifiedControllerAnimateFromMinibarIfPossible
{
  return 0;
}

- (id)minifiedControllerStateConforminigToProtocol:(id)a3
{
  return (id)BUProtocolCast();
}

- (void)minifiedControllerSaveState
{
  id v2 = [(AEPDFMinifiedController *)self minifiedControllerLoadedAssetViewController];
  [v2 saveStateClosing:0];
}

- (AEAssetViewController)minifiedControllerLoadedAssetViewController
{
  return self->_minifiedControllerLoadedAssetViewController;
}

- (void)setMinifiedControllerLoadedAssetViewController:(id)a3
{
}

- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minifiedControllerDelegate);

  return (AEAssetMinifiedControllerDelegate *)WeakRetained;
}

- (void)setMinifiedControllerDelegate:(id)a3
{
}

- (AEPDFBookHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_destroyWeak((id *)&self->_minifiedControllerDelegate);

  objc_storeStrong((id *)&self->_minifiedControllerLoadedAssetViewController, 0);
}

@end