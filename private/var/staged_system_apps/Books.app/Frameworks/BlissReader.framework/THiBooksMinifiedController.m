@interface THiBooksMinifiedController
- (AEAssetMinibarViewController)minifiedControllerMinibarViewController;
- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate;
- (AEAssetViewController)minifiedControllerLoadedAssetViewController;
- (BOOL)minifiedControllerAnimateFromMinibarIfPossible;
- (BOOL)minifiedControllerShouldPreloadAssetViewController;
- (BOOL)minifiedControllerShouldUnloadAssetViewController;
- (THAEHelper)helper;
- (THiBooksMinifiedController)initWithHelper:(id)a3;
- (id)minifiedControllerStateConforminigToProtocol:(id)a3;
- (void)minifiedControllerSaveState;
- (void)minifiedControllerWillUnloadAsset;
- (void)setHelper:(id)a3;
- (void)setMinifiedControllerDelegate:(id)a3;
- (void)setMinifiedControllerLoadedAssetViewController:(id)a3;
@end

@implementation THiBooksMinifiedController

- (THiBooksMinifiedController)initWithHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)THiBooksMinifiedController;
  v6 = [(THiBooksMinifiedController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_helper, a3);
  }

  return v7;
}

- (void)minifiedControllerWillUnloadAsset
{
  v3 = [(THiBooksMinifiedController *)self minifiedControllerLoadedAssetViewController];
  [v3 close:0];

  v4 = [(THiBooksMinifiedController *)self minifiedControllerLoadedAssetViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(THiBooksMinifiedController *)self minifiedControllerLoadedAssetViewController];
    [v6 assetViewControllerWillUnload];
  }
}

- (BOOL)minifiedControllerShouldPreloadAssetViewController
{
  return 1;
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
  id v2 = [(THiBooksMinifiedController *)self minifiedControllerLoadedAssetViewController];
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

- (THAEHelper)helper
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