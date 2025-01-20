@interface PUAssetsDataSourceManager
- (PUAssetsDataSource)assetsDataSource;
- (PUAssetsDataSourceManagerDelegate)delegate;
- (void)setAssetsDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PUAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUAssetsDataSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAssetsDataSourceManagerDelegate *)WeakRetained;
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void)setAssetsDataSource:(id)a3
{
  v5 = (PUAssetsDataSource *)a3;
  v6 = v5;
  if (self->_assetsDataSource != v5)
  {
    v10 = v5;
    BOOL v7 = -[PUTilingDataSource isEqual:](v5, "isEqual:");
    v6 = v10;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_assetsDataSource, a3);
      v8 = [(PUAssetsDataSourceManager *)self delegate];
      v9 = [(PUAssetsDataSourceManager *)self assetsDataSource];
      [v8 assetsDataSourceManager:self didChangeAssetsDataSource:v9];

      v6 = v10;
    }
  }
}

@end