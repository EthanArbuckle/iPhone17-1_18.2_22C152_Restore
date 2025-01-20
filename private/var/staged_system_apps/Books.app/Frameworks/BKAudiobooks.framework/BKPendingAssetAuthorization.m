@interface BKPendingAssetAuthorization
- (AVURLAsset)asset;
- (BKPendingAssetAuthorization)initWithAsset:(id)a3 completion:(id)a4;
- (id)completion;
- (void)setAsset:(id)a3;
- (void)setCompletion:(id)a3;
@end

@implementation BKPendingAssetAuthorization

- (BKPendingAssetAuthorization)initWithAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKPendingAssetAuthorization;
  v8 = [(BKPendingAssetAuthorization *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(BKPendingAssetAuthorization *)v8 setAsset:v6];
    [(BKPendingAssetAuthorization *)v9 setCompletion:v7];
  }

  return v9;
}

- (AVURLAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end