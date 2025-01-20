@interface UIAssetManager
@end

@implementation UIAssetManager

uint64_t __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (!*(unsigned char *)(a1 + 64)
    || (v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "objectForKey:", +[_UIImageCacheKey keyWithName:configuration:](_UIImageCacheKey, "keyWithName:configuration:", a2, *(void *)(a1 + 32))), uint64_t v7 = (uint64_t)v6, (a3 & 1) == 0)&& (objc_msgSend(v6, "isSymbolImage") & 1) != 0|| !v7)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 40) + 116) & 6) != 4
      || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_effectiveTraitCollectionForImageLookup"), "userInterfaceIdiom") != 3|| (v8 = objc_msgSend(*(id *)(a1 + 40), "_carPlayAssetManager"), *(void **)(a1 + 40) == v8)|| (uint64_t v7 = objc_msgSend(v8, "imageNamed:configuration:cachingOptions:attachCatalogImage:", a2, *(void *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 65))) == 0)
    {
      v9 = (void *)[*(id *)(a1 + 32) _effectiveTraitCollectionForImageLookup];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 64);
      unint64_t v44 = -1;
      uint64_t v45 = v10;
      double v11 = _UICurrentImageTraitCollectionDisplayScale();
      if (v11 == 0.0) {
        double v11 = 1.0;
      }
      double v43 = v11;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v12 = [v9 horizontalSizeClass];
      uint64_t v13 = [v9 verticalSizeClass];
      +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, v9, &v43, 0, &v44, 0, &v42, &v41, &v45, 0);
      uint64_t v14 = 0;
      if (v44 <= 5) {
        uint64_t v14 = qword_186B9DAA8[v44];
      }
      uint64_t v15 = 5;
      if (v45) {
        uint64_t v15 = 0;
      }
      if (v45 == 1) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = v15;
      }
      uint64_t v17 = [*(id *)(a1 + 32) locale];
      v18 = *(unsigned __int8 **)(a1 + 40);
      unsigned int v19 = v18[116];
      uint64_t v20 = a2;
      if ((v19 & 8) != 0)
      {
        v21 = (void *)[MEMORY[0x1E4F97AB0] infoForName:*(void *)(a1 + 48) allowsPrivate:(v19 >> 4) & 1 locale:v17];
        if (!v21) {
          return 0;
        }
        uint64_t v20 = [v21 name];
        v18 = *(unsigned __int8 **)(a1 + 40);
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_2;
      v24[3] = &unk_1E530D138;
      char v38 = a3;
      id v25 = *(id *)(a1 + 32);
      v26 = v18;
      double v31 = v43;
      uint64_t v32 = v14;
      uint64_t v33 = v16;
      uint64_t v27 = v20;
      uint64_t v28 = v17;
      char v39 = *(unsigned char *)(a1 + 66);
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v29 = a2;
      uint64_t v30 = v22;
      uint64_t v34 = v42;
      uint64_t v35 = v41;
      uint64_t v36 = v12;
      uint64_t v37 = v13;
      char v40 = *(unsigned char *)(a1 + 65);
      return objc_msgSend(v18, "_lookUpObjectForTraitCollection:objectAccessor:", objc_msgSend(v25, "_effectiveTraitCollectionForImageLookup"), v24);
    }
  }
  return v7;
}

uint64_t __88___UIAssetManager__performLookUpObjectForTraitCollection_outNamedLookup_objectAccessor___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(*(id *)(a1 + 32), "_translateAppearanceNameToNative:", a2));
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      *a3 = 1;
    }
  }
  return result;
}

uint64_t __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(unsigned char *)(a1 + 136)) {
    goto LABEL_13;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  double v28 = 0.0;
  v6 = [(UIImageConfiguration *)+[UIImageSymbolConfiguration unspecifiedConfiguration] configurationByApplyingConfiguration:*(void *)(a1 + 32)];
  [(UIImageConfiguration *)v6 _deriveGlyphSize:&v30 weight:&v29 pointSize:&v28];
  uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 40) + 16) namedVectorGlyphWithName:*(void *)(a1 + 48) scaleFactor:*(void *)(a1 + 88) deviceIdiom:*(void *)(a1 + 96) layoutDirection:v30 glyphSize:v29 glyphWeight:a2 glyphPointSize:*(double *)(a1 + 80) appearanceName:v28 locale:*(void *)(a1 + 56)];
  if (!v7) {
    goto LABEL_13;
  }
  v8 = v7;
  uint64_t v9 = [v7 layoutDirection];
  if (v9 && v9 != *(void *)(a1 + 96))
  {
    if ([v8 isFlippable])
    {
      uint64_t v10 = 1;
      goto LABEL_9;
    }
    v6 = (UIImageConfiguration *)_UIImageConfigurationWithFlippedLayoutDirection(v6);
  }
  uint64_t v10 = 0;
LABEL_9:
  uint64_t v11 = objc_msgSend(v8, "UIImageWithAsset:configuration:flippedHorizontally:", objc_msgSend(*(id *)(a1 + 40), "_assetForName:", *(void *)(a1 + 64)), v6, v10);
  uint64_t v12 = v11;
  if (*(unsigned char *)(a1 + 137) && v11)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v6;
    return v12;
  }
  if (v11) {
    return v12;
  }
LABEL_13:
  uint64_t v13 = *(void *)(a1 + 40);
  if ((*(unsigned char *)(v13 + 116) & 8) != 0) {
    return 0;
  }
  uint64_t v14 = [*(id *)(v13 + 16) namedLookupWithName:*(void *)(a1 + 64) scaleFactor:*(void *)(a1 + 88) deviceIdiom:*(void *)(a1 + 104) deviceSubtype:*(void *)(a1 + 112) displayGamut:*(void *)(a1 + 96) layoutDirection:*(void *)(a1 + 120) sizeClassHorizontal:*(double *)(a1 + 80) sizeClassVertical:*(void *)(a1 + 128) appearanceName:a2 locale:*(void *)(a1 + 56)];
  if (!v14) {
    return 0;
  }
  uint64_t v15 = (void *)v14;
  if (!_isKindOfCUINamedLayerStack___CUINamedLayerStackClass) {
    _isKindOfCUINamedLayerStack___CUINamedLayerStackClass = objc_opt_class();
  }
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = (void *)[*(id *)(a1 + 40) _assetForName:*(void *)(a1 + 64)];
    uint64_t v12 = [v15 flattenedUIImageWithAsset:v16 configuration:*(void *)(a1 + 32)];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_3;
    v24[3] = &unk_1E530D110;
    v24[7] = *(void *)(a1 + 80);
    uint64_t v17 = *(void *)(a1 + 96);
    v24[8] = *(void *)(a1 + 88);
    long long v25 = *(_OWORD *)(a1 + 104);
    uint64_t v26 = v17;
    long long v27 = *(_OWORD *)(a1 + 120);
    uint64_t v18 = *(void *)(a1 + 56);
    void v24[4] = *(void *)(a1 + 64);
    v24[5] = a2;
    v24[6] = v18;
    [v16 _setRebuildStackImage:v24];
    return v12;
  }
  id v20 = *(id *)(a1 + 32);
  if (a3) {
    *a3 = v15;
  }
  uint64_t v21 = [v15 layoutDirection];
  if (v21 && v21 != *(void *)(a1 + 96))
  {
    if ([v15 isFlippable])
    {
      uint64_t v22 = 1;
      goto LABEL_29;
    }
    id v20 = _UIImageConfigurationWithFlippedLayoutDirection(v20);
  }
  uint64_t v22 = 0;
LABEL_29:
  v23 = objc_msgSend(v15, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", objc_msgSend(*(id *)(a1 + 40), "_assetForName:", *(void *)(a1 + 64)), v20, v22, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", *(void *)(a1 + 64), *(void *)(a1 + 88), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 96), *(void *)(a1 + 120), *(double *)(a1 + 80), *(void *)(a1 + 128), a2, *(void *)(a1 + 56)));
  uint64_t v12 = (uint64_t)v23;
  if (*(unsigned char *)(a1 + 138)) {
    objc_setAssociatedObject(v23, &CUINamedImageKey, v15, (void *)1);
  }
  return v12;
}

uint64_t __33___UIAssetManager__assetForName___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _assetFromMapForName:*(void *)(a1 + 40) lock:0];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [[UIImageAsset alloc] _initWithAssetName:*(void *)(a1 + 40) forManager:*(void *)(a1 + 32)];
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  uint64_t result = [*(id *)(a1 + 32) _insertAssetIntoMap:v2 forName:*(void *)(a1 + 40) lock:0];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __52___UIAssetManager__insertAssetIntoMap_forName_lock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _assetFromMapForName:*(void *)(a1 + 40) lock:0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(void *)(v3 + 40))
  {
    *(void *)(v3 + 40) = *(void *)(a1 + 48);
    id v4 = +[_UIImageAssetMapEnvelope wrapAsset:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(*(void *)(a1 + 32) + 80);
    return [v6 setObject:v4 forKey:v5];
  }
  return result;
}

id __45___UIAssetManager__assetFromMapForName_lock___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 80) objectForKey:a1[5]];
  if (result)
  {
    id result = (id)[result imageAsset];
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    if (!*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      uint64_t v3 = a1[5];
      id v4 = *(void **)(a1[4] + 80);
      return (id)[v4 removeObjectForKey:v3];
    }
  }
  return result;
}

uint64_t __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke(void *a1, void *a2)
{
  [a2 setDisplayGamut:a1[4]];
  [a2 setUserInterfaceIdiom:a1[5]];
  [a2 setUserInterfaceStyle:a1[6]];
  uint64_t v4 = a1[7];
  return [a2 setAccessibilityContrast:v4];
}

uint64_t __43___UIAssetManager_preferredTraitCollection__block_invoke(uint64_t a1, void *a2)
{
  [a2 setDisplayScale:*(double *)(*(void *)(a1 + 32) + 40)];
  [a2 setUserInterfaceIdiom:*(void *)(*(void *)(a1 + 32) + 32)];
  [a2 setLayoutDirection:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
  return [a2 setDisplayGamut:v4];
}

uint64_t __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke_2(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result = [*(id *)(a1[4] + 16) colorWithName:a1[5] displayGamut:a1[6] deviceIdiom:a1[7] appearanceName:a2];
  if (a3)
  {
    if (result) {
      *a3 = result;
    }
  }
  return result;
}

uint64_t __37___UIAssetManager__assetManagerCache__block_invoke()
{
  qword_1EB264AE8 = (uint64_t)objc_alloc_init((Class)off_1E52D51F0);
  [(id)qword_1EB264AE8 setClearsCacheOnApplicationBackground:0];
  v0 = (void *)qword_1EB264AE8;
  return [v0 setClearsCacheOnLowMemoryWarnings:0];
}

id __42___UIAssetManager__defaultAppearanceNames__block_invoke()
{
  v1[1] = *MEMORY[0x1E4F143B8];
  v1[0] = @"UIAppearanceAny";
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:1];
  qword_1EB264B50 = (uint64_t)result;
  return result;
}

id __40___UIAssetManager_sharedRuntimeAssetMap__block_invoke()
{
  id result = (id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  qword_1EB264B40 = (uint64_t)result;
  return result;
}

uint64_t __39___UIAssetManager_sharedRuntimeCatalog__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F5E058]) initWithName:@"Shared Image Catalog"];
  qword_1EB264B30 = result;
  return result;
}

uint64_t __39___UIAssetManager__carPlayAssetManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = [_UIAssetManager alloc];
  uint64_t result = -[_UIAssetManager initWithName:inBundle:idiom:](v2, "initWithName:inBundle:idiom:", @"UIKit_Stark_Artwork", [MEMORY[0x1E4F28B50] bundleWithPath:_UIKitResourceBundlePath(@"CarPlayArtwork.bundle")], 3);
  qword_1EB264AF8 = result;
  if (result)
  {
    uint64_t v4 = (void *)result;
    [*(id *)(a1 + 32) preferredScale];
    objc_msgSend(v4, "setPreferredScale:");
    uint64_t result = objc_msgSend((id)qword_1EB264AF8, "setPreferredTraitCollection:", objc_msgSend(*(id *)(a1 + 32), "preferredTraitCollection"));
    *(unsigned char *)(qword_1EB264AF8 + 116) |= 5u;
  }
  return result;
}

uint64_t __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_3(uint64_t result, void *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      uint64_t result = [*(id *)(a3 + 16) namedLookupWithName:*(void *)(result + 32) scaleFactor:*(void *)(result + 64) deviceIdiom:*(void *)(result + 72) deviceSubtype:*(void *)(result + 80) displayGamut:*(void *)(result + 88) layoutDirection:*(void *)(result + 96) sizeClassHorizontal:*(double *)(result + 56) sizeClassVertical:*(void *)(result + 104) appearanceName:*(void *)(result + 40) locale:*(void *)(result + 48)];
      if (result)
      {
        uint64_t v4 = result;
        if (!_isKindOfCUINamedLayerStack___CUINamedLayerStackClass) {
          _isKindOfCUINamedLayerStack___CUINamedLayerStackClass = objc_opt_class();
        }
        uint64_t result = objc_opt_isKindOfClass();
        if (result)
        {
          return [a2 _setLayerStack:v4];
        }
      }
    }
  }
  return result;
}

uint64_t __50___UIAssetManager_imageNamed_scale_idiom_subtype___block_invoke(uint64_t a1, void *a2)
{
  [a2 setDisplayScale:*(double *)(a1 + 40)];
  [a2 setUserInterfaceIdiom:*(void *)(a1 + 48)];
  [a2 _setNSIntegerValue:*(void *)(a1 + 56) forTraitToken:0x1ED3F5BC8];
  [a2 setDisplayGamut:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 64);
  return [a2 setLayoutDirection:v4];
}

uint64_t __41___UIAssetManager__clearCachedResources___block_invoke(uint64_t a1)
{
  return [(id)UIApp _endBackgroundTask:*(void *)(a1 + 32)];
}

@end