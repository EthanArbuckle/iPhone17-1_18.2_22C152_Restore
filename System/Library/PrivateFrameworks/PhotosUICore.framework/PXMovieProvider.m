@interface PXMovieProvider
- (BOOL)canPlayMovie;
- (BOOL)ppt_runTest:(id)a3 options:(id)a4;
- (PHAsset)keyAsset;
- (PHAssetCollection)assetCollection;
- (PXDiagnosticsItemProvider)diagnosticsItemProvider;
- (PXMovieProvider)init;
- (PXMovieProvider)initWithAssetCollection:(id)a3;
- (PXMovieProvider)initWithAssetCollection:(id)a3 keyAsset:(id)a4;
- (PXMovieProviderDelegate)delegate;
- (UIViewController)movieViewController;
- (void)setDelegate:(id)a3;
@end

@implementation PXMovieProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setDelegate:(id)a3
{
}

- (PXMovieProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXMovieProviderDelegate *)WeakRetained;
}

- (BOOL)ppt_runTest:(id)a3 options:(id)a4
{
  return 0;
}

- (PXDiagnosticsItemProvider)diagnosticsItemProvider
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXMovieProvider.m" lineNumber:50 description:@"This class should be never be used directly"];

  return 0;
}

- (BOOL)canPlayMovie
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXMovieProvider.m" lineNumber:45 description:@"This class should be never be used directly"];

  return 0;
}

- (UIViewController)movieViewController
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXMovieProvider.m" lineNumber:40 description:@"This class should be never be used directly"];

  return 0;
}

- (PXMovieProvider)initWithAssetCollection:(id)a3 keyAsset:(id)a4
{
  id v7 = a4;
  v8 = [(PXMovieProvider *)self initWithAssetCollection:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_keyAsset, a4);
  }

  return v9;
}

- (PXMovieProvider)initWithAssetCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMovieProvider;
  v6 = [(PXMovieProvider *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
  }

  return v7;
}

- (PXMovieProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMovieProvider.m", 20, @"%s is not available as initializer", "-[PXMovieProvider init]");

  abort();
}

@end