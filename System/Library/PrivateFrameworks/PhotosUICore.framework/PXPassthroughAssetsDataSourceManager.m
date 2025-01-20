@interface PXPassthroughAssetsDataSourceManager
- (PXPassthroughAssetsDataSourceManager)init;
- (PXPassthroughAssetsDataSourceManager)initWithDataSource:(id)a3;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
@end

@implementation PXPassthroughAssetsDataSourceManager

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXPassthroughAssetsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v4 setDataSource:a3 changeDetails:a4];
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a4, a3);
}

- (PXPassthroughAssetsDataSourceManager)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPassthroughAssetsDataSourceManager.m", 23, @"%s is not available as initializer", "-[PXPassthroughAssetsDataSourceManager init]");

  abort();
}

- (PXPassthroughAssetsDataSourceManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPassthroughAssetsDataSourceManager;
  v5 = [(PXSectionedDataSourceManager *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PXPassthroughAssetsDataSourceManager *)v5 setDataSource:v4 changeDetails:0];
  }

  return v6;
}

@end