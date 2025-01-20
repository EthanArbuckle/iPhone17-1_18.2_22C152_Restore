@interface _PUIStylePickerHomeScreenCAAsset
- (NSBundle)bundle;
- (NSString)assetName;
- (_PUIStylePickerHomeScreenCAAsset)initWithAssetName:(id)a3 bundle:(id)a4;
- (void)configureAssetPackageView:(id)a3 withColorStops:(id)a4 accentColor:(id)a5;
@end

@implementation _PUIStylePickerHomeScreenCAAsset

- (_PUIStylePickerHomeScreenCAAsset)initWithAssetName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PUIStylePickerHomeScreenCAAsset;
  v9 = [(_PUIStylePickerHomeScreenCAAsset *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetName, a3);
    if (v8)
    {
      v11 = (NSBundle *)v8;
    }
    else
    {
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    }
    bundle = v10->_bundle;
    v10->_bundle = v11;
  }
  return v10;
}

- (void)configureAssetPackageView:(id)a3 withColorStops:(id)a4 accentColor:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(_PUIStylePickerHomeScreenCAAsset *)self assetName];
  v11 = [(_PUIStylePickerHomeScreenCAAsset *)self bundle];
  [v9 updateAsset:v10 bundle:v11];

  v12 = [v9 publishedObjectWithName:@"gradient"];
  v13 = [v9 publishedObjectWithName:@"accented"];

  objc_super v14 = [(_PUIStylePickerHomeScreenCAAsset *)self assetName];
  int v15 = [v14 isEqualToString:@"choice-1"];

  if (v15)
  {
    uint64_t v16 = [v20 count];
  }
  else
  {
    v17 = [(_PUIStylePickerHomeScreenCAAsset *)self assetName];
    int v18 = [v17 isEqualToString:@"choice-3"];

    if (!v18) {
      goto LABEL_9;
    }
    uint64_t v16 = [v20 count];
    if (v8) {
      objc_msgSend(v13, "setContentsMultiplyColor:", objc_msgSend(v8, "CGColor"));
    }
  }
  if (v20 && v16)
  {
    v19 = objc_msgSend(v20, "bs_mapNoNulls:", &__block_literal_global_278);
    [v12 setColors:v19];
  }
LABEL_9:
}

- (NSString)assetName
{
  return self->_assetName;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

@end