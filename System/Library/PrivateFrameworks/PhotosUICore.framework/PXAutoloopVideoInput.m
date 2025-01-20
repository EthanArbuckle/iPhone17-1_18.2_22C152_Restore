@interface PXAutoloopVideoInput
+ (id)inputWithAsset:(id)a3 imageURL:(id)a4;
- (AVAsset)asset;
- (NSURL)imageURL;
- (PXAutoloopVideoInput)initWithAsset:(id)a3 imageURL:(id)a4;
@end

@implementation PXAutoloopVideoInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (PXAutoloopVideoInput)initWithAsset:(id)a3 imageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXAutoloopVideoInput;
  v8 = [(PXAutoloopVideoInput *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    asset = v8->_asset;
    v8->_asset = (AVAsset *)v9;

    objc_storeStrong((id *)&v8->_imageURL, a4);
  }

  return v8;
}

+ (id)inputWithAsset:(id)a3 imageURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAsset:v6 imageURL:v5];

  return v7;
}

@end