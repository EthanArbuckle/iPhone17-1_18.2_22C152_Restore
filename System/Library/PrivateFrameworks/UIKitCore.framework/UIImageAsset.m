@interface UIImageAsset
+ (BOOL)supportsSecureCoding;
+ (id)_dynamicAssetNamed:(id)a3 generator:(id)a4;
- (BOOL)_containsImagesInPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CUINamedLayerStack)_layerStack;
- (NSString)assetName;
- (UIImage)imageWithConfiguration:(UIImageConfiguration *)configuration;
- (UIImage)imageWithTraitCollection:(UITraitCollection *)traitCollection;
- (UIImageAsset)init;
- (UIImageAsset)initWithCoder:(NSCoder *)coder;
- (UITraitCollection)_defaultTraitCollection;
- (_UIAssetManager)_assetManager;
- (id)_cachedRenditionWithSize:(CGSize)a3 tintColor:(id)a4 traitCollection:(id)a5 bold:(BOOL)a6 drawMode:(unsigned int)a7;
- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4;
- (id)_initWithAssetName:(id)a3 forManager:(id)a4;
- (id)_nameForStoringRuntimeRegisteredImagesInMutableCatalog;
- (id)_performLookUpRegisteredObjectForTraitCollection:(id)a3 withAccessorWithAppearanceName:(id)a4;
- (id)_rebuildStackImage;
- (id)_renditionCache:(BOOL)a3;
- (id)_symbolConfiguration;
- (id)_unpinObserver;
- (id)_unsafe_mutableCatalog;
- (id)_withLock_imageWithConfiguration:(id)a3;
- (id)_withLock_lookUpRegisteredObjectForTraitCollection:(id)a3 withAccessorWithAppearanceName:(id)a4;
- (id)_withLock_mutableCatalog;
- (id)_withLock_registeredAppearanceNames;
- (id)_withLock_updateAssetFromBlockGenerationWithConfiguration:(id)a3 resolvedCatalogImage:(id)a4;
- (id)creationBlock;
- (unint64_t)hash;
- (void)_cacheRendition:(id)a3 forSize:(CGSize)a4 tintColor:(id)a5 traitCollection:(id)a6 bold:(BOOL)a7 drawMode:(unsigned int)a8;
- (void)_disconnectFromAssetManager;
- (void)_registerImage:(id)a3 withConfiguration:(id)a4;
- (void)_setLayerStack:(id)a3;
- (void)_setRebuildStackImage:(id)a3;
- (void)_setUnpinObserver:(id)a3;
- (void)_unregisterImageWithDescription:(id)a3;
- (void)_unsafe_registerImage:(id)a3 withConfiguration:(id)a4;
- (void)_withLock_registerImage:(id)a3 withConfiguration:(id)a4;
- (void)_withLock_unregisterImageWithDescription:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)registerImage:(UIImage *)image withTraitCollection:(UITraitCollection *)traitCollection;
- (void)setAssetName:(id)a3;
- (void)setCreationBlock:(id)a3;
- (void)set_assetManager:(id)a3;
- (void)unregisterImageWithConfiguration:(UIImageConfiguration *)configuration;
- (void)unregisterImageWithTraitCollection:(UITraitCollection *)traitCollection;
@end

@implementation UIImageAsset

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = (void *)v5[10];
    v7 = self->_assetName;
    v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8) {
        goto LABEL_21;
      }
      int v10 = [(NSBundle *)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_22;
      }
    }
    v11 = (void *)v5[2];
    v7 = self->_containingBundle;
    v12 = v11;
    if (v7 == v12)
    {

LABEL_15:
      v13 = [(UIImageAsset *)self _assetManager];
      v14 = [v5 _assetManager];
      v7 = v13;
      v15 = v14;
      v9 = v15;
      if (v7 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v7 && v15) {
          LOBYTE(v10) = [(NSBundle *)v7 isEqual:v15];
        }
      }

      goto LABEL_21;
    }
    v9 = v12;
    LOBYTE(v10) = 0;
    if (v7 && v12)
    {
      int v10 = [(NSBundle *)v7 isEqual:v12];

      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  LOBYTE(v10) = 0;
LABEL_23:

  return v10;
}

- (UIImage)imageWithConfiguration:(UIImageConfiguration *)configuration
{
  p_lock = &self->_lock;
  v5 = configuration;
  os_unfair_lock_lock(p_lock);
  v6 = [(UIImageAsset *)self _withLock_imageWithConfiguration:v5];

  os_unfair_lock_unlock(p_lock);
  return (UIImage *)v6;
}

- (id)_withLock_imageWithConfiguration:(id)a3
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v4 = self;
  id v5 = a3;
  v6 = [(UIImageAsset *)v4 _defaultTraitCollection];
  v7 = v6;
  if (v6) {
    v8 = (void *)[v6 imageConfiguration];
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  int v10 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v5, v9);

  v11 = [v10 _effectiveTraitCollectionForImageLookup];
  uint64_t v63 = 0;
  v64 = (id *)&v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__112;
  v67 = __Block_byref_object_dispose__112;
  id v68 = 0;
  uint64_t v61 = 0;
  double v62 = 0.0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v57 = 0;
  unint64_t v58 = 0;
  uint64_t v56 = 0;
  uint64_t v55 = [v11 layoutDirection];
  uint64_t v12 = [v11 horizontalSizeClass];
  uint64_t v13 = [v11 verticalSizeClass];
  +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, v11, &v62, &v61, &v58, &v57, &v59, &v60, &v55, &v56);
  uint64_t v14 = [(UIImageAsset *)v4 _assetManager];
  v15 = (void *)v14;
  if (*(unsigned char *)&v4->_assetFlags)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke;
    aBlock[3] = &unk_1E52F1A48;
    aBlock[4] = v4;
    *(double *)&aBlock[5] = v62;
    aBlock[6] = v61;
    aBlock[7] = v59;
    aBlock[8] = v60;
    aBlock[9] = v56;
    aBlock[10] = v12;
    aBlock[11] = v13;
    v47 = _Block_copy(aBlock);
    v24 = [(UIImageAsset *)v4 _withLock_lookUpRegisteredObjectForTraitCollection:v11 withAccessorWithAppearanceName:v47];
    v25 = v24;
    if (!v24)
    {
      if (dyld_program_sdk_at_least())
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v49 = __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke_2;
        v50 = &unk_1E52E5180;
        v51 = v4;
        id v52 = v10;
        v53 = &v63;
        v31 = v48;
        os_unfair_lock_lock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
        v49((uint64_t)v31);

        os_unfair_lock_unlock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
      }
      if (!v64[5] && (*(unsigned char *)&v4->_assetFlags & 2) != 0)
      {
        uint64_t v32 = [(UIImageAsset *)v4 _withLock_updateAssetFromBlockGenerationWithConfiguration:v10 resolvedCatalogImage:0];
        id v33 = v64[5];
        v64[5] = (id)v32;
      }
      goto LABEL_29;
    }
    v26 = [v24 configuration];
    v27 = [v26 _effectiveTraitCollectionForImageLookup];
    int v28 = -[UITraitCollection _matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v11, (uint64_t)v27);

    if (v28) {
      goto LABEL_28;
    }
    if (v15)
    {
      v36 = [(UIImageAsset *)v4 assetName];
      v37 = [v15 imageNamed:v36 configuration:v10 cachingOptions:0 attachCatalogImage:1];

      if (!v37)
      {
LABEL_26:

LABEL_27:
        if (v64[5])
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:
        uint64_t v42 = [v25 UIImageWithAsset:v4 configuration:v10 flippedHorizontally:0 optionalVectorImage:0];
        id v43 = v64[5];
        v64[5] = (id)v42;

        _UIImageDecorateFallbackImage(v64[5]);
        goto LABEL_29;
      }
      objc_getAssociatedObject(v37, &CUINamedImageKey);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x1E4F5E048];
      v69[0] = v25;
      v69[1] = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      id v40 = [v46 bestMatchUsingImages:v39 scaleFactor:v61 deviceIdiom:v59 deviceSubtype:v60 displayGamut:v56 layoutDirection:v12 sizeClassHorizontal:v62 sizeClassVertical:v13];

      if (v40 == v38) {
        objc_storeStrong(v64 + 5, v37);
      }
      objc_setAssociatedObject(v37, &CUINamedImageKey, 0, (void *)1);
    }
    else
    {
      if ((*(unsigned char *)&v4->_assetFlags & 2) == 0) {
        goto LABEL_27;
      }
      v37 = [v25 UIImageWithAsset:v4 configuration:v10 flippedHorizontally:0 optionalVectorImage:0];
      uint64_t v41 = [(UIImageAsset *)v4 _withLock_updateAssetFromBlockGenerationWithConfiguration:v10 resolvedCatalogImage:v37];
      id v38 = v64[5];
      v64[5] = (id)v41;
    }

    goto LABEL_26;
  }
  if (v14)
  {
    v16 = [(UIImageAsset *)v4 assetName];
    uint64_t v17 = [v15 imageNamed:v16 configuration:v10 cachingOptions:0 attachCatalogImage:0];
    id v18 = v64[5];
    v64[5] = (id)v17;

    int v19 = dyld_program_sdk_at_least();
    id v20 = v64[5];
    if (v19)
    {
      v21 = [v64[5] configuration];
      uint64_t v22 = [v20 _imageWithImageAsset:v4 configuration:v21];
      id v23 = v64[5];
      v64[5] = (id)v22;
    }
    else
    {
      uint64_t v34 = [v64[5] _imageWithImageAsset:v4];
      id v35 = v64[5];
      v64[5] = (id)v34;
    }
  }
  else if ((*(unsigned char *)&v4->_assetFlags & 2) != 0)
  {
    uint64_t v29 = [(UIImageAsset *)v4 _withLock_updateAssetFromBlockGenerationWithConfiguration:v10 resolvedCatalogImage:0];
    id v30 = v64[5];
    v64[5] = (id)v29;
  }
LABEL_30:
  id v44 = v64[5];

  _Block_object_dispose(&v63, 8);
  return v44;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (_UIAssetManager)_assetManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetManager);
  return (_UIAssetManager *)WeakRetained;
}

- (UITraitCollection)_defaultTraitCollection
{
  return self->_defaultTraitCollection;
}

- (id)_initWithAssetName:(id)a3 forManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIImageAsset;
  v8 = [(UIImageAsset *)&v11 init];
  if (v8)
  {
    id v9 = [v7 bundle];
    CommonInit_1(v8, v6, v7, v9);
  }
  return v8;
}

void __96__UIImageAsset__performLookUpRegisteredObjectForTraitCollection_withAccessorWithAppearanceName___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      *a3 = 1;
    }
  }
}

- (CUINamedLayerStack)_layerStack
{
  v3 = [(UIImageAsset *)self _assetManager];
  layerStack = (void (**)(void *, UIImageAsset *, void *))self->_layerStack;
  if (layerStack) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    layerStack = (void (**)(void *, UIImageAsset *, void *))self->_rebuildStackImage;
    if (layerStack)
    {
      layerStack[2](layerStack, self, v3);
      layerStack = (void (**)(void *, UIImageAsset *, void *))self->_layerStack;
    }
  }
  uint64_t v6 = layerStack;

  return v6;
}

- (UIImage)imageWithTraitCollection:(UITraitCollection *)traitCollection
{
  if (traitCollection) {
    id v4 = [(UITraitCollection *)traitCollection imageConfiguration];
  }
  else {
    id v4 = 0;
  }
  BOOL v5 = v4;
  uint64_t v6 = [(UIImageAsset *)self imageWithConfiguration:v5];

  return (UIImage *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong(&self->_rebuildStackImage, 0);
  objc_destroyWeak(&self->_unpinObserver);
  objc_storeStrong((id *)&self->_layerStack, 0);
  objc_destroyWeak((id *)&self->_assetManager);
  objc_storeStrong((id *)&self->_defaultTraitCollection, 0);
  objc_storeStrong((id *)&self->_containingBundle, 0);
}

- (void)dealloc
{
  if (*(unsigned char *)&self->_assetFlags)
  {
    v3 = [(UIImageAsset *)self _unsafe_mutableCatalog];
    id v4 = [(UIImageAsset *)self _nameForStoringRuntimeRegisteredImagesInMutableCatalog];
    [v3 removeImagesNamed:v4];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_unpinObserver);

  if (WeakRetained)
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = objc_loadWeakRetained(&self->_unpinObserver);
    [v6 removeObserver:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)UIImageAsset;
  [(UIImageAsset *)&v8 dealloc];
}

- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIImageAsset;
  objc_super v8 = [(UIImageAsset *)&v11 init];
  id v9 = v8;
  if (v8) {
    CommonInit_1(v8, v6, 0, v7);
  }

  return v9;
}

- (id)_withLock_lookUpRegisteredObjectForTraitCollection:(id)a3 withAccessorWithAppearanceName:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6) {
    [(UIImageAsset *)self _performLookUpRegisteredObjectForTraitCollection:v6 withAccessorWithAppearanceName:v7];
  }
  else {
  objc_super v8 = v7[2](v7, 0);
  }

  return v8;
}

- (id)_performLookUpRegisteredObjectForTraitCollection:(id)a3 withAccessorWithAppearanceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(UIImageAsset *)self _withLock_registeredAppearanceNames];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__112;
  v21 = __Block_byref_object_dispose__112;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__UIImageAsset__performLookUpRegisteredObjectForTraitCollection_withAccessorWithAppearanceName___block_invoke;
  v13[3] = &unk_1E52F1A98;
  id v9 = v8;
  id v14 = v9;
  v16 = &v17;
  id v10 = v7;
  id v15 = v10;
  -[UITraitCollection _enumerateThemeAppearanceNamesForLookup:](v6, (uint64_t)v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)_withLock_registerImage:(id)a3 withConfiguration:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  [(UIImageAsset *)self _unsafe_registerImage:v8 withConfiguration:v7];
}

- (id)_withLock_registeredAppearanceNames
{
  v8[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(UIImageAsset *)self _withLock_mutableCatalog];
  id v4 = [v3 appearanceNames];

  if (v4 && [v4 count])
  {
    id v5 = v4;
  }
  else
  {
    v8[0] = @"UIAppearanceAny";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  id v6 = v5;

  return v6;
}

id __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v3, "_withLock_mutableCatalog");
  id v6 = [*(id *)(a1 + 32) _nameForStoringRuntimeRegisteredImagesInMutableCatalog];
  id v7 = [v5 imageWithName:v6 scaleFactor:*(void *)(a1 + 48) deviceIdiom:*(void *)(a1 + 56) deviceSubtype:*(void *)(a1 + 64) displayGamut:*(void *)(a1 + 72) layoutDirection:*(void *)(a1 + 80) sizeClassHorizontal:*(double *)(a1 + 40) sizeClassVertical:*(void *)(a1 + 88) appearanceName:v4];

  return v7;
}

- (id)_withLock_mutableCatalog
{
  os_unfair_lock_assert_owner(&self->_lock);
  return [(UIImageAsset *)self _unsafe_mutableCatalog];
}

- (void)_unsafe_registerImage:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(UIImageAsset *)self _assetManager];
    id v9 = v8;
    if (v8 && ([v8 _managingUIKitAssets] & 1) != 0) {
      goto LABEL_24;
    }
    if (dyld_program_sdk_at_least() & 1) != 0 || ([v6 isSymbolImage])
    {
      id v10 = [v6 content];
      int v11 = [v10 isCGImageOnly];

      if (!v11)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __56__UIImageAsset__unsafe_registerImage_withConfiguration___block_invoke_2;
        v30[3] = &unk_1E52DCB30;
        v30[4] = self;
        id v31 = v6;
        id v32 = v7;
        os_unfair_lock_lock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
        __56__UIImageAsset__unsafe_registerImage_withConfiguration___block_invoke_2((uint64_t)v30);
        os_unfair_lock_unlock((os_unfair_lock_t)&__UIImageAssetRegisterLock);

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v12 = [v6 content];
      char v13 = [v12 isCGImage];

      if ((v13 & 1) == 0) {
        goto LABEL_24;
      }
    }
    id v14 = self;
    id v15 = [v7 _effectiveTraitCollectionForImageLookup];
    v16 = [v15 _namedImageDescription];

    uint64_t v17 = [v6 renderingMode];
    uint64_t v18 = 1;
    if (v17 != 2) {
      uint64_t v18 = 2;
    }
    if (v17 == 1) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v18;
    }
    [v16 setTemplateRenderingMode:v19];
    [v6 alignmentRectInsets];
    objc_msgSend(v16, "setAlignmentEdgeInsets:");
    objc_msgSend(v16, "setResizingMode:", objc_msgSend(v6, "resizingMode") != 0);
    [v6 capInsets];
    if (v23 == 0.0 && v20 == 0.0 && v22 == 0.0 && v21 == 0.0)
    {
      [v16 setImageType:0];
    }
    else
    {
      [v16 setImageType:3];
      [v6 capInsets];
      objc_msgSend(v16, "setEdgeInsets:");
    }
    unint64_t v24 = [v6 imageOrientation];
    if (v24 >= 8) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = (0x75426831u >> (4 * v24)) & 0xF;
    }
    [v16 setExifOrientation:v25];
    v26 = [(UIImageAsset *)v14 _unsafe_mutableCatalog];
    id v27 = v6;
    uint64_t v28 = [v27 CGImage];
    uint64_t v29 = [(UIImageAsset *)v14 _nameForStoringRuntimeRegisteredImagesInMutableCatalog];
    [v26 insertCGImage:v28 withName:v29 andDescription:v16];

    *(unsigned char *)&v14->_assetFlags |= 1u;
    [v27 _setImageAsset:v14];

    goto LABEL_24;
  }
LABEL_25:
}

- (id)_unsafe_mutableCatalog
{
  v2 = [(UIImageAsset *)self _assetManager];
  v3 = v2;
  if (v2) {
    [v2 runtimeCatalog];
  }
  else {
  id v4 = +[_UIAssetManager sharedRuntimeCatalog];
  }

  return v4;
}

- (id)_nameForStoringRuntimeRegisteredImagesInMutableCatalog
{
  v3 = [(UIImageAsset *)self _assetManager];
  if (v3)
  {
    if (!dyld_program_sdk_at_least())
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      int v12 = [v3 _managingUIKitAssets];
      if (has_internal_diagnostics)
      {
        if (v12)
        {
          uint64_t v17 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)double v20 = 0;
            _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Should never try to add variants to a UIKit asset", v20, 2u);
          }
        }
      }
      else if (v12)
      {
        uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_nameForStoringRuntimeRegisteredImagesInMutableCatalog___s_category)+ 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Should never try to add variants to a UIKit asset", buf, 2u);
        }
      }
      char v13 = NSString;
      assetName = self->_assetName;
      id v6 = [v3 carFileName];
      id v15 = [(NSBundle *)self->_containingBundle bundlePath];
      id v10 = [v13 stringWithFormat:@"<image asset '%@' in catalog '%@' in bundle at path '%@'>", assetName, v6, v15];

      goto LABEL_10;
    }
    id v4 = NSString;
    id v5 = self->_assetName;
    id v6 = [(NSBundle *)self->_containingBundle bundlePath];
    [v4 stringWithFormat:@"<image asset '%@' in bundle at path '%@'>", v5, v6];
    id v10 = LABEL_6:;
LABEL_10:

    goto LABEL_11;
  }
  containingBundle = self->_containingBundle;
  id v8 = NSString;
  id v9 = self->_assetName;
  if (containingBundle)
  {
    id v6 = [(NSBundle *)containingBundle bundlePath];
    [v8 stringWithFormat:@"<image asset '%@' in resources for bundle at path '%@'>", v9, v6];
    goto LABEL_6;
  }
  id v10 = [NSString stringWithFormat:@"<runtime image asset '%@'>", v9];
LABEL_11:

  return v10;
}

+ (id)_dynamicAssetNamed:(id)a3 generator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"UIImageAsset.m" lineNumber:148 description:@"assets initialized with _dynamicAssetNamed:generator must provide a block"];
  }
  id v9 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) _initWithAssetName:v7 forManager:0];
  id v10 = v9;
  if (v9)
  {
    [v9 setCreationBlock:v8];
    v10[32] |= 2u;
  }

  return v10;
}

- (UIImageAsset)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIImageAsset;
  v2 = [(UIImageAsset *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v3 UUIDString];
    CommonInit_1(v2, v4, 0, 0);
  }
  return v2;
}

- (UIImageAsset)initWithCoder:(NSCoder *)coder
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = coder;
  id v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageAssetName"];
  objc_super v6 = 0;
  id v7 = 0;
  if ([(NSCoder *)v4 decodeBoolForKey:@"UIImageAssetHadAssetManager"] && v5)
  {
    if ([v5 length])
    {
      objc_super v6 = [MEMORY[0x1E4F28B50] mainBundle];
      if ([(NSCoder *)v4 containsValueForKey:@"UIImageAssetManagerBundlePath"])
      {
        id v8 = (void *)MEMORY[0x1E4F28B50];
        id v9 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageAssetManagerBundlePath"];
        uint64_t v10 = [v8 bundleWithPath:v9];

        objc_super v6 = (void *)v10;
      }
      id v7 = +[_UIAssetManager assetManagerForBundle:v6];
    }
    else
    {
      objc_super v6 = 0;
      id v7 = 0;
    }
  }
  int v11 = [v7 _assetFromMapForName:v5];
  int v12 = v11;
  if (v11)
  {
    char v13 = v11;

LABEL_10:
    CommonInit_1(v13, v5, v7, v6);
LABEL_11:
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIImageAssetHasRegisteredImages"])
    {
      id v31 = v12;
      *(unsigned char *)&v13->_assetFlags |= 1u;
      id v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      id v30 = v32 = v4;
      v16 = -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:");
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            double v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            double v22 = [v21 configuration];
            [(UIImageAsset *)v13 _unsafe_registerImage:v21 withConfiguration:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v18);
      }

      int v12 = v31;
      id v4 = v32;
    }
    goto LABEL_30;
  }
  v37.receiver = self;
  v37.super_class = (Class)UIImageAsset;
  char v13 = [(UIImageAsset *)&v37 init];
  if (!v13)
  {
    CommonInit_1(0, v5, v7, v6);
    goto LABEL_30;
  }
  if (!v5 || ![v5 length])
  {
    double v23 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v24 = [v23 UUIDString];

    id v5 = (void *)v24;
  }
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v25 = [v7 _insertAssetIntoMap:v13 forName:v13->_assetName];
  v26 = v25;
  if (v25 != v13)
  {
    id v27 = v25;

    char v13 = v27;
  }

  CommonInit_1(v13, v5, v7, v6);
  if (v13) {
    goto LABEL_11;
  }
LABEL_30:
  uint64_t v28 = v13;

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIImageAsset *)self assetName];
  [v4 encodeObject:v5 forKey:@"UIImageAssetName"];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(UIImageAsset *)self _assetManager];
  id v8 = v7;
  if (v7)
  {
    if (([v7 _managingUIKitAssets] & 1) == 0)
    {
      [v4 encodeBool:1 forKey:@"UIImageAssetHadAssetManager"];
      id v9 = [v8 bundle];
      uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];

      if (v9 != v10)
      {
        int v11 = [v8 bundle];
        int v12 = [v11 bundlePath];
        [v4 encodeObject:v12 forKey:@"UIImageAssetManagerBundlePath"];
      }
    }
  }
  [v4 encodeBool:*(unsigned char *)&self->_assetFlags & 1 forKey:@"UIImageAssetHasRegisteredImages"];
  if (*(unsigned char *)&self->_assetFlags)
  {
    char v13 = [(UIImageAsset *)self _withLock_mutableCatalog];
    id v14 = [(UIImageAsset *)self _nameForStoringRuntimeRegisteredImagesInMutableCatalog];
    uint64_t v15 = [v13 imagesWithName:v14];

    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          double v23 = [v22 configuration];
          uint64_t v24 = [v22 UIImageWithAsset:self configuration:v23 flippedHorizontally:0 optionalVectorImage:0];

          [v16 addObject:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    [v4 encodeObject:v16 forKey:@"UIImageAssetRegisteredImages"];
    p_lock = &self->_lock;
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_symbolConfiguration
{
  return 0;
}

void __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(*(id *)(a1 + 32), &ImageRegisterKey);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "matchesConfiguration:", *(void *)(a1 + 40), (void)v11))
        {
          uint64_t v8 = [v7 image];
          uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)registerImage:(UIImage *)image withTraitCollection:(UITraitCollection *)traitCollection
{
  objc_super v6 = image;
  if (traitCollection) {
    id v7 = [(UITraitCollection *)traitCollection imageConfiguration];
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = v7;
  [(UIImageAsset *)self _registerImage:v6 withConfiguration:v8];
}

- (void)_unregisterImageWithDescription:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(UIImageAsset *)self _withLock_unregisterImageWithDescription:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_withLock_unregisterImageWithDescription:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v9 = [(UIImageAsset *)self _nameForStoringRuntimeRegisteredImagesInMutableCatalog];
  objc_super v6 = [(UIImageAsset *)self _withLock_mutableCatalog];
  [v6 removeImageNamed:v9 withDescription:v5];

  id v7 = [(UIImageAsset *)self _withLock_mutableCatalog];
  uint64_t v8 = [v7 imagesWithName:v9];

  *(unsigned char *)&self->_assetFlags = *(unsigned char *)&self->_assetFlags & 0xFE | ([v8 count] != 0);
}

- (void)unregisterImageWithConfiguration:(UIImageConfiguration *)configuration
{
  id v5 = [(UIImageConfiguration *)configuration _effectiveTraitCollectionForImageLookup];
  uint64_t v4 = [v5 _namedImageDescription];
  [(UIImageAsset *)self _unregisterImageWithDescription:v4];
}

- (void)unregisterImageWithTraitCollection:(UITraitCollection *)traitCollection
{
  id v4 = [(UITraitCollection *)traitCollection _namedImageDescription];
  [(UIImageAsset *)self _unregisterImageWithDescription:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_assetName hash];
}

- (void)_setLayerStack:(id)a3
{
  id v5 = (CUINamedLayerStack *)a3;
  if (self->_layerStack != v5)
  {
    objc_storeStrong((id *)&self->_layerStack, a3);
    objc_super v6 = [(UIImageAsset *)self _assetManager];
    if (!v5) {
      goto LABEL_7;
    }
    if ([(CUINamedLayerStack *)v5 representsOnDemandContent]
      && v6
      && (id v7 = objc_loadWeakRetained(&self->_unpinObserver), v7, !v7))
    {
      objc_initWeak(&location, self);
      long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      long long v13 = [v6 bundle];
      long long v14 = [MEMORY[0x1E4F28F08] mainQueue];
      uint64_t v15 = *MEMORY[0x1E4F292D0];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __31__UIImageAsset__setLayerStack___block_invoke;
      v17[3] = &unk_1E52F1A70;
      objc_copyWeak(&v18, &location);
      v17[4] = self;
      id v16 = (id)[v12 addObserverForName:v15 object:v13 queue:v14 usingBlock:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else if (([(CUINamedLayerStack *)v5 representsOnDemandContent] & 1) == 0)
    {
LABEL_7:
      p_unpinObserver = &self->_unpinObserver;
      id WeakRetained = objc_loadWeakRetained(p_unpinObserver);

      if (WeakRetained)
      {
        uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v11 = objc_loadWeakRetained(p_unpinObserver);
        [v10 removeObserver:v11];
      }
    }
  }
}

void __31__UIImageAsset__setLayerStack___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v3 removeObserver:v4];
  }
}

- (void)_registerImage:(id)a3 withConfiguration:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(UIImageAsset *)self _withLock_registerImage:v8 withConfiguration:v7];

  os_unfair_lock_unlock(p_lock);
}

void __56__UIImageAsset__unsafe_registerImage_withConfiguration___block_invoke_2(uint64_t a1)
{
  objc_getAssociatedObject(*(id *)(a1 + 32), &ImageRegisterKey);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = (id)objc_opt_new();
    objc_setAssociatedObject(*(id *)(a1 + 32), &ImageRegisterKey, v3, (void *)1);
  }
  id v2 = +[_UIImageAssetLocalRegistration registrationWithImage:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48)];
  [v3 insertObject:v2 atIndex:0];

  *(unsigned char *)(*(void *)(a1 + 32) + 32) |= 1u;
}

- (id)_withLock_updateAssetFromBlockGenerationWithConfiguration:(id)a3 resolvedCatalogImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  id v8 = [(UIImageAsset *)self creationBlock];

  if (v8)
  {
    id v9 = [(UIImageAsset *)self creationBlock];
    uint64_t v10 = ((void (**)(void, UIImageAsset *, id, id))v9)[2](v9, self, v6, v7);
    id v11 = (void *)v10;
    if (v10) {
      long long v12 = (void *)v10;
    }
    else {
      long long v12 = v7;
    }
    id v13 = v12;

    long long v14 = v7;
    if (v13 != v7)
    {
      uint64_t v15 = [v13 _primitiveImageAsset];

      if (!v15)
      {
        uint64_t v16 = [v13 _imageWithImageAsset:self configuration:v6];

        id v13 = (id)v16;
      }
      [(UIImageAsset *)self _withLock_registerImage:v13 withConfiguration:v6];
      long long v14 = v13;
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (BOOL)_containsImagesInPath:(id)a3
{
  return 0;
}

- (void)_disconnectFromAssetManager
{
}

- (id)_renditionCache:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Accessing rendition cache from non-main thread is not safe!", buf, 2u);
      }
    }
    else
    {
      id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_renditionCache____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Accessing rendition cache from non-main thread is not safe!", v10, 2u);
      }
    }
  }
  id v5 = objc_getAssociatedObject(self, (const void *)_renditionCache__key);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = objc_opt_new();
    objc_setAssociatedObject(self, (const void *)_renditionCache__key, v5, (void *)1);
  }
  return v5;
}

- (void)_cacheRendition:(id)a3 forSize:(CGSize)a4 tintColor:(id)a5 traitCollection:(id)a6 bold:(BOOL)a7 drawMode:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  +[_UIImageAssetRenditionCacheKey keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:](_UIImageAssetRenditionCacheKey, "keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:", a5, a6, v9, v8, width, height);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [(UIImageAsset *)self _renditionCache:1];
  [v16 setObject:v15 forKey:v17];
}

- (id)_cachedRenditionWithSize:(CGSize)a3 tintColor:(id)a4 traitCollection:(id)a5 bold:(BOOL)a6 drawMode:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  double height = a3.height;
  double width = a3.width;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(UIImageAsset *)self _renditionCache:0];
  if (v15)
  {
    uint64_t v16 = +[_UIImageAssetRenditionCacheKey keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:](_UIImageAssetRenditionCacheKey, "keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:", v13, v14, v8, v7, width, height);
    id v17 = [v15 objectForKey:v16];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)set_assetManager:(id)a3
{
}

- (id)_unpinObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_unpinObserver);
  return WeakRetained;
}

- (void)_setUnpinObserver:(id)a3
{
}

- (id)_rebuildStackImage
{
  return self->_rebuildStackImage;
}

- (void)_setRebuildStackImage:(id)a3
{
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void)setCreationBlock:(id)a3
{
}

- (void)setAssetName:(id)a3
{
}

@end