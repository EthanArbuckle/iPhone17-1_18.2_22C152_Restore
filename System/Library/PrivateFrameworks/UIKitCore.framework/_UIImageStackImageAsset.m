@interface _UIImageStackImageAsset
- (CUICatalog)catalog;
- (NSData)stackData;
- (_UIImageStackImageAsset)initWithContentsOfFile:(id)a3;
- (id)imageWithConfiguration:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setStackData:(id)a3;
@end

@implementation _UIImageStackImageAsset

- (_UIImageStackImageAsset)initWithContentsOfFile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIImageStackImageAsset;
  v5 = [(UIImageAsset *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(UIImageAsset *)v5 setAssetName:v4];
    id v7 = objc_alloc(MEMORY[0x1E4F5E048]);
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v13 = 0;
    uint64_t v9 = [v7 initWithURL:v8 error:&v13];
    id v10 = v13;
    catalog = v6->_catalog;
    v6->_catalog = (CUICatalog *)v9;

    if (!v6->_catalog)
    {

      v6 = 0;
    }
  }
  return v6;
}

- (id)imageWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(UIImageAsset *)self _layerStack];

  if (!v5)
  {
    v6 = [v4 _effectiveTraitCollectionForImageLookup];
    uint64_t v14 = 0;
    double v15 = 0.0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = -1;
    +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, v6, &v15, &v13, 0, 0, &v14, &v12, &v11, 0);
    id v7 = -[CUICatalog defaultLayerStackWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self->_catalog, "defaultLayerStackWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", v13, v14, [v6 horizontalSizeClass], objc_msgSend(v6, "verticalSizeClass"), v15);
    [(UIImageAsset *)self _setLayerStack:v7];
  }
  v8 = [(UIImageAsset *)self _layerStack];
  uint64_t v9 = [v8 flattenedUIImageWithAsset:self configuration:v4];

  return v9;
}

- (CUICatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (NSData)stackData
{
  return self->_stackData;
}

- (void)setStackData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackData, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

@end