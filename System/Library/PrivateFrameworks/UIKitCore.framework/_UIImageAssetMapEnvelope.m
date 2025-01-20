@interface _UIImageAssetMapEnvelope
+ (id)wrapAsset:(id)a3;
- (NSString)assetName;
- (UIImageAsset)imageAsset;
- (id)description;
- (void)setAssetName:(id)a3;
- (void)setImageAsset:(id)a3;
@end

@implementation _UIImageAssetMapEnvelope

- (UIImageAsset)imageAsset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageAsset);
  return (UIImageAsset *)WeakRetained;
}

+ (id)wrapAsset:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIImageAssetMapEnvelope);
  [(_UIImageAssetMapEnvelope *)v4 setImageAsset:v3];
  v5 = [v3 assetName];

  [(_UIImageAssetMapEnvelope *)v4 setAssetName:v5];
  return v4;
}

- (void)setImageAsset:(id)a3
{
}

- (void)setAssetName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_destroyWeak((id *)&self->_imageAsset);
}

- (id)description
{
  id v3 = [(_UIImageAssetMapEnvelope *)self imageAsset];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = [(_UIImageAssetMapEnvelope *)self assetName];
  v8 = (void *)v7;
  v9 = @"For now";
  if (!v3) {
    v9 = @"Nope";
  }
  v10 = [v4 stringWithFormat:@"<%@ %p> asset: %@ valid? %@", v6, self, v7, v9];

  return v10;
}

- (NSString)assetName
{
  return self->_assetName;
}

@end