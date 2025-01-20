@interface _UIAssetManager
+ (double)_watchScreenScale;
+ (id)_assetManagerCache;
+ (id)_sharedRuntimeAssetMapKeyForAssetName:(id)a3 fromFilesInBundle:(id)a4;
+ (id)_sharedRuntimeAssetMapKeyForAssetName:(id)a3 inAssetManager:(id)a4;
+ (id)assetManagerForBundle:(id)a3;
+ (id)newAssetNamed:(id)a3 fromBundle:(id)a4;
+ (id)sharedRuntimeAssetMap;
+ (id)sharedRuntimeCatalog;
+ (int64_t)_userInterfaceIdiomForDeviceClass:(unint64_t)a3;
+ (uint64_t)_convertTraitCollection:(double *)a3 toCUIScale:(void *)a4 CUIIdiom:(unint64_t *)a5 UIKitIdiom:(uint64_t *)a6 UIKitUserInterfaceStyle:(uint64_t *)a7 subtype:(uint64_t *)a8 CUIDisplayGamut:(uint64_t *)a9 UIKitLayoutDirection:(uint64_t *)a10 CUILayoutDirection:;
+ (void)_clearAllCachedImagesAndAssets;
+ (void)_executeUnitTestWithAssetManagerCache:(id)a3;
+ (void)_saveAssetManager:(id)a3 forBundle:(id)a4 lock:(BOOL)a5;
+ (void)clearSharedRuntimeAssetMapForUnitTests;
- (BOOL)_hasMultipleAppearances;
- (BOOL)_imageBelongsToCoreGlyphs:(id)a3;
- (BOOL)_imageBelongsToUIKit:(id)a3;
- (BOOL)_imageIsSystemImage:(id)a3;
- (BOOL)_isSystemAssetManager;
- (BOOL)_managingCoreGlyphs;
- (BOOL)_managingUIKitAssets;
- (CUIMutableCatalog)runtimeCatalog;
- (NSBundle)bundle;
- (NSString)carFileName;
- (UITraitCollection)preferredTraitCollection;
- (_UIAssetManager)initWithName:(id)a3 inBundle:(id)a4 idiom:(int64_t)a5;
- (_UIAssetManager)initWithURL:(id)a3 idiom:(int64_t)a4 error:(id *)a5;
- (double)preferredScale;
- (id)_allImageNames;
- (id)_appearanceNames;
- (id)_assetForName:(id)a3;
- (id)_assetFromMapForName:(id)a3;
- (id)_assetFromMapForName:(id)a3 lock:(BOOL)a4;
- (id)_carPlayAssetManager;
- (id)_catalog;
- (id)_defaultAppearanceNames;
- (id)_initWithName:(id)a3 inBundle:(id)a4 idiom:(int64_t)a5 lock:(BOOL)a6 allowMissingCatalog:(BOOL)a7;
- (id)_insertAssetIntoMap:(id)a3 forName:(id)a4;
- (id)_insertAssetIntoMap:(id)a3 forName:(id)a4 lock:(BOOL)a5;
- (id)_lookUpObjectForTraitCollection:(id)a3 objectAccessor:(id)a4;
- (id)_performLookUpObjectForTraitCollection:(id)a3 outNamedLookup:(id *)a4 objectAccessor:(id)a5;
- (id)_translateAppearanceNameToNative:(id)a3;
- (id)colorNamed:(id)a3 withTraitCollection:(id)a4;
- (id)dataNamed:(id)a3;
- (id)description;
- (id)imageNamed:(id)a3;
- (id)imageNamed:(id)a3 configuration:(id)a4;
- (id)imageNamed:(id)a3 configuration:(id)a4 cachingOptions:(unint64_t)a5 attachCatalogImage:(BOOL)a6;
- (id)imageNamed:(id)a3 idiom:(int64_t)a4;
- (id)imageNamed:(id)a3 idiom:(int64_t)a4 subtype:(unint64_t)a5;
- (id)imageNamed:(id)a3 scale:(double)a4 idiom:(int64_t)a5 subtype:(unint64_t)a6;
- (id)imageNamed:(id)a3 withTrait:(id)a4;
- (id)initManagerWithoutCatalogWithName:(id)a3;
- (id)resolvedColorNamed:(id)a3 withTraitCollection:(id)a4;
- (void)_clearCachedResources;
- (void)_clearCachedResources:(id)a3;
- (void)_disconnectImageAssets;
- (void)_performBlockWithAssetLock:(id)a3;
- (void)dealloc;
- (void)disableCacheFlushing;
- (void)setPreferredScale:(double)a3;
- (void)setPreferredTraitCollection:(id)a3;
@end

@implementation _UIAssetManager

- (id)imageNamed:(id)a3 configuration:(id)a4
{
  if (dyld_program_sdk_at_least())
  {
    id v7 = [(_UIAssetManager *)self _assetFromMapForName:a3];
    if (v7) {
      id v8 = (id)[v7 imageWithConfiguration:a4];
    }
    else {
      id v8 = [(_UIAssetManager *)self imageNamed:a3 configuration:a4 cachingOptions:0 attachCatalogImage:0];
    }
    v13 = v8;
    if (!v8)
    {
      uint64_t v14 = [a3 stringByDeletingPathExtension];
      id v15 = [(_UIAssetManager *)self _assetFromMapForName:v14];
      id v16 = v15
          ? (id)[v15 imageWithConfiguration:a4]
          : [(_UIAssetManager *)self imageNamed:v14 configuration:a4 cachingOptions:0 attachCatalogImage:0];
      v13 = v16;
      if (([v16 _isSymbolImage] & 1) != 0 || !v13)
      {
        if (![(_UIAssetManager *)self _isSystemAssetManager]
          && (*(unsigned char *)&self->_assetManagerFlags & 2) == 0)
        {
          os_unfair_lock_lock(&stru_1EB264AE4);
          v17 = objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "objectForKey:", +[_UIAssetManager _sharedRuntimeAssetMapKeyForAssetName:inAssetManager:](_UIAssetManager, "_sharedRuntimeAssetMapKeyForAssetName:inAssetManager:", v14, self));
          os_unfair_lock_unlock(&stru_1EB264AE4);
          return (id)[v17 imageWithConfiguration:a4];
        }
        return 0;
      }
    }
    return v13;
  }
  v9 = (void *)[a4 _effectiveTraitCollectionForImageLookup];
  if (!v9 || (v10 = v9, [v9 userInterfaceIdiom] == -1)) {
    int64_t preferredIdiom = self->_preferredIdiom;
  }
  else {
    int64_t preferredIdiom = [v10 userInterfaceIdiom];
  }
  return [(_UIAssetManager *)self imageNamed:a3 idiom:preferredIdiom];
}

+ (uint64_t)_convertTraitCollection:(double *)a3 toCUIScale:(void *)a4 CUIIdiom:(unint64_t *)a5 UIKitIdiom:(uint64_t *)a6 UIKitUserInterfaceStyle:(uint64_t *)a7 subtype:(uint64_t *)a8 CUIDisplayGamut:(uint64_t *)a9 UIKitLayoutDirection:(uint64_t *)a10 CUILayoutDirection:
{
  uint64_t v17 = self;
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__convertTraitCollection_toCUIScale_CUIIdiom_UIKitIdiom_UIKitUserInterfaceStyle_subtype_CUIDisplayGamut_UIKitLayoutDirection_CUILayoutDirection_, v17, @"_UIAssetManager.m", 1195, @"Invalid parameter not satisfying: %@", @"scale != NULL");
  }
  [a2 displayScale];
  if (v18 == 0.0)
  {
    double v18 = *a3;
    if (*a3 == 0.0) {
      double v18 = 1.0;
    }
  }
  *a3 = v18;
  unint64_t v19 = [a2 userInterfaceIdiom];
  uint64_t v20 = v19;
  if (a5) {
    *a5 = v19;
  }
  if (v19 > 5)
  {
    uint64_t v21 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v21 = qword_186B9DAA8[v19];
  if (a4) {
LABEL_12:
  }
    *a4 = v21;
LABEL_13:
  uint64_t v22 = [a2 userInterfaceStyle];
  if (a6) {
    *a6 = v22;
  }
  uint64_t v23 = [a2 artworkSubtype];
  if (!v23) {
    uint64_t v23 = __preferredIdiomSubtypeForIdiom(v20);
  }
  *a7 = v23;
  uint64_t v24 = [a2 displayGamut];
  if (v24 == -1) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = v24;
  }
  *a8 = v25;
  uint64_t result = [a2 layoutDirection];
  if (result == -1) {
    uint64_t result = *a9;
  }
  *a9 = result;
  if (a10)
  {
    uint64_t v27 = 5;
    if (result) {
      uint64_t v27 = 0;
    }
    if (result == 1) {
      uint64_t v27 = 4;
    }
    *a10 = v27;
  }
  return result;
}

- (id)imageNamed:(id)a3 configuration:(id)a4 cachingOptions:(unint64_t)a5 attachCatalogImage:(BOOL)a6
{
  if ((*(unsigned char *)&self->_assetManagerFlags & 8) != 0) {
    char v9 = 3;
  }
  else {
    char v9 = a5;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__225;
  v39 = __Block_byref_object_dispose__225;
  uint64_t v40 = 0;
  id v10 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, a4, 0);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v26 = __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke;
  uint64_t v27 = &unk_1E530D160;
  unint64_t v11 = v9 & 2;
  char v32 = v9 & 1;
  id v28 = v10;
  v29 = self;
  BOOL v33 = a6;
  char v34 = v11 >> 1;
  id v30 = a3;
  v31 = &v35;
  if ([(_UIAssetManager *)self _isSystemAssetManager]
    || dyld_program_sdk_at_least())
  {
    v12 = (void *)v26((uint64_t)v25, (uint64_t)a3, 1);
    id v13 = a3;
    if (!v12)
    {
      id v13 = (id)[a3 stringByDeletingPathExtension];
      uint64_t v14 = v26((uint64_t)v25, (uint64_t)v13, 0);
      goto LABEL_10;
    }
  }
  else
  {
    id v13 = (id)[a3 stringByDeletingPathExtension];
    v12 = (void *)v26((uint64_t)v25, (uint64_t)v13, 0);
    if (!v12)
    {
      uint64_t v14 = v26((uint64_t)v25, (uint64_t)a3, 0);
LABEL_10:
      v12 = (void *)v14;
      if (!v14) {
        goto LABEL_26;
      }
    }
  }
  if (v11)
  {
    if ([v12 _isSymbolImage])
    {
      BOOL v15 = 1;
    }
    else
    {
      [+[UIScreen mainScreen] bounds];
      double v17 = v16;
      double v19 = v18;
      [v12 size];
      double v21 = v20;
      [v12 size];
      BOOL v15 = v21 * v22 <= v17 * v19 * 0.125 && (v11 >> 1) != 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  _UIImageDecorateFallbackImage(v12);
  if (v15)
  {
    [(_UICache *)self->_imageCache setObject:v12 forKey:+[_UIImageCacheKey keyWithName:v13 configuration:v10]];
    if (v36[5]) {
      [(_UICache *)self->_imageCache setObject:v12 forKey:+[_UIImageCacheKey keyWithName:configuration:](_UIImageCacheKey, "keyWithName:configuration:", v13)];
    }
    if (v13 != a3)
    {
      +[_UIImageCacheKey keyWithName:a3 configuration:v10];
      [(_UICache *)self->_imageCache setObject:v12 forKey:a3];
    }
  }
LABEL_26:
  _Block_object_dispose(&v35, 8);
  return v12;
}

- (BOOL)_isSystemAssetManager
{
  return (*(unsigned char *)&self->_assetManagerFlags & 0xC) != 0;
}

- (id)_lookUpObjectForTraitCollection:(id)a3 objectAccessor:(id)a4
{
  if (a3)
  {
    uint64_t v6 = 0;
    return [(_UIAssetManager *)self _performLookUpObjectForTraitCollection:a3 outNamedLookup:&v6 objectAccessor:a4];
  }
  else
  {
    v5 = (uint64_t (*)(id, void))*((void *)a4 + 2);
    return (id)v5(a4, 0);
  }
}

- (id)_performLookUpObjectForTraitCollection:(id)a3 outNamedLookup:(id *)a4 objectAccessor:(id)a5
{
  id v9 = [(_UIAssetManager *)self _appearanceNames];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  double v16 = __Block_byref_object_copy__225;
  double v17 = __Block_byref_object_dispose__225;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88___UIAssetManager__performLookUpObjectForTraitCollection_outNamedLookup_objectAccessor___block_invoke;
  v12[3] = &unk_1E530D248;
  v12[4] = self;
  v12[5] = v9;
  v12[6] = a5;
  v12[7] = &v13;
  v12[8] = a4;
  -[UITraitCollection _enumerateThemeAppearanceNamesForLookup:](a3, (uint64_t)v12);
  id v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)_translateAppearanceNameToNative:(id)a3
{
  return a3;
}

- (id)_appearanceNames
{
  v3 = (void *)[(CUICatalog *)self->_catalog appearanceNames];
  if (v3)
  {
    v4 = v3;
    if ([v3 count]) {
      return v4;
    }
  }
  return [(_UIAssetManager *)self _defaultAppearanceNames];
}

- (id)_assetForName:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__225;
  id v10 = __Block_byref_object_dispose__225;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___UIAssetManager__assetForName___block_invoke;
  v5[3] = &unk_1E530D220;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  [(_UIAssetManager *)self _performBlockWithAssetLock:v5];
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_performBlockWithAssetLock:(id)a3
{
  p_assetMapLock = &self->_assetMapLock;
  os_unfair_lock_lock(&self->_assetMapLock);
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_assetMapLock);
}

- (id)_assetFromMapForName:(id)a3 lock:(BOOL)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = __Block_byref_object_copy__225;
  uint64_t v11 = __Block_byref_object_dispose__225;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___UIAssetManager__assetFromMapForName_lock___block_invoke;
  v6[3] = &unk_1E52F2A98;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  if (a4) {
    [(_UIAssetManager *)self _performBlockWithAssetLock:v6];
  }
  else {
    __45___UIAssetManager__assetFromMapForName_lock___block_invoke(v6);
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_insertAssetIntoMap:(id)a3 forName:(id)a4 lock:(BOOL)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__225;
  uint64_t v12 = __Block_byref_object_dispose__225;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___UIAssetManager__insertAssetIntoMap_forName_lock___block_invoke;
  v7[3] = &unk_1E530D1F8;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  v7[7] = &v8;
  if (a5) {
    [(_UIAssetManager *)self _performBlockWithAssetLock:v7];
  }
  else {
    __52___UIAssetManager__insertAssetIntoMap_forName_lock___block_invoke((uint64_t)v7);
  }
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_assetFromMapForName:(id)a3
{
  return [(_UIAssetManager *)self _assetFromMapForName:a3 lock:1];
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (id)resolvedColorNamed:(id)a3 withTraitCollection:(id)a4
{
  if ((((!a4 || (UIDisplayGamut v7 = [a4 displayGamut], v7 == UIDisplayGamutUnspecified))
      && (UIDisplayGamut v7 = -[UITraitCollection displayGamut](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "displayGamut"), !a4)|| (v8 = [a4 userInterfaceIdiom], v8 == UIUserInterfaceIdiomUnspecified))&& (v8 = -[UITraitCollection userInterfaceIdiom](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "userInterfaceIdiom"), !a4)|| (v9 = objc_msgSend(a4, "userInterfaceStyle")) == UIUserInterfaceStyleUnspecified)&& (v9 = -[UITraitCollection userInterfaceStyle](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "userInterfaceStyle"), !a4)|| (v10 = objc_msgSend(a4, "accessibilityContrast"), v10 == UIAccessibilityContrastUnspecified))
  {
    UIAccessibilityContrast v10 = [(UITraitCollection *)[(_UIAssetManager *)self preferredTraitCollection] accessibilityContrast];
  }
  if ((unint64_t)v8 > UIUserInterfaceIdiomMac) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_186B9DAA8[v8];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke;
  v16[3] = &__block_descriptor_64_e27_v16__0___UIMutableTraits__8l;
  if (v7 == UIDisplayGamutUnspecified) {
    UIDisplayGamut v12 = UIDisplayGamutSRGB;
  }
  else {
    UIDisplayGamut v12 = v7;
  }
  v16[4] = v7;
  v16[5] = v8;
  v16[6] = v9;
  v16[7] = v10;
  uint64_t v13 = +[UITraitCollection traitCollectionWithTraits:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke_2;
  v15[3] = &unk_1E530D1D0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v11;
  return _UIColorFromCUINamedColor([(_UIAssetManager *)self _lookUpObjectForTraitCollection:v13 objectAccessor:v15]);
}

- (id)colorNamed:(id)a3 withTraitCollection:(id)a4
{
  if ((!a4 || (UIDisplayGamut v7 = [a4 displayGamut], v7 == UIDisplayGamutUnspecified))
    && (UIDisplayGamut v7 = -[UITraitCollection displayGamut](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "displayGamut"), !a4)|| (v8 = [a4 userInterfaceIdiom], v8 == UIUserInterfaceIdiomUnspecified))
  {
    UIUserInterfaceIdiom v8 = [(UITraitCollection *)[(_UIAssetManager *)self preferredTraitCollection] userInterfaceIdiom];
  }
  uint64_t v9 = 0;
  if (v7 == UIDisplayGamutUnspecified) {
    UIDisplayGamut v10 = UIDisplayGamutSRGB;
  }
  else {
    UIDisplayGamut v10 = v7;
  }
  if ((unint64_t)v8 <= UIUserInterfaceIdiomMac) {
    uint64_t v9 = qword_186B9DAA8[v8];
  }
  uint64_t v11 = _UIColorFromCUINamedColor((void *)[(CUICatalog *)self->_catalog colorWithName:a3 displayGamut:v10 deviceIdiom:v9]);
  if (v11 && [(_UIAssetManager *)self _hasMultipleAppearances])
  {
    UIDisplayGamut v12 = -[UIDynamicCatalogColor initWithName:assetManager:genericColor:]((id *)[UIDynamicCatalogColor alloc], a3, self, v11);
    return v12;
  }
  else
  {
    [(UIColor *)v11 _setDebugName:a3];
    [(UIColor *)v11 _setDebugCatalogBundleIdentifier:[(NSBundle *)self->_bundle bundleIdentifier]];
    return v11;
  }
}

- (UITraitCollection)preferredTraitCollection
{
  uint64_t result = self->_preferredTraitCollection;
  if (!result)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43___UIAssetManager_preferredTraitCollection__block_invoke;
    v4[3] = &unk_1E52F2D18;
    v4[4] = self;
    uint64_t result = +[UITraitCollection traitCollectionWithTraits:v4];
    self->_preferredTraitCollection = result;
  }
  return result;
}

- (BOOL)_hasMultipleAppearances
{
  v3 = (void *)[(CUICatalog *)self->_catalog appearanceNames];
  uint64_t v4 = [v3 count];
  if (v4) {
    LOBYTE(v4) = objc_msgSend(v3, "isEqualToArray:", -[_UIAssetManager _defaultAppearanceNames](self, "_defaultAppearanceNames")) ^ 1;
  }
  return v4;
}

- (id)_defaultAppearanceNames
{
  if (qword_1EB264B58 != -1) {
    dispatch_once(&qword_1EB264B58, &__block_literal_global_113_8);
  }
  return (id)qword_1EB264B50;
}

+ (void)_saveAssetManager:(id)a3 forBundle:(id)a4 lock:(BOOL)a5
{
  if (a4)
  {
    BOOL v5 = a5;
    id v8 = +[_UIAssetManager _assetManagerCache];
    if (v5)
    {
      os_unfair_lock_lock(&_MergedGlobals_1292);
      objc_msgSend(v8, "setObject:forKey:", a3, objc_msgSend(a4, "bundlePath"));
      os_unfair_lock_unlock(&_MergedGlobals_1292);
    }
    else
    {
      uint64_t v9 = [a4 bundlePath];
      [v8 setObject:a3 forKey:v9];
    }
  }
}

+ (id)assetManagerForBundle:(id)a3
{
  id v5 = +[_UIAssetManager _assetManagerCache];
  uint64_t v6 = [a3 bundlePath];
  +[UIScreen mainScreen];
  os_unfair_lock_lock(&_MergedGlobals_1292);
  UIDisplayGamut v7 = (void *)[v5 objectForKey:v6];
  if (!v7)
  {
    id v8 = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithName:inBundle:idiom:lock:allowMissingCatalog:", @"Assets", a3, -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom"), 0, 0);
    UIDisplayGamut v7 = v8;
    if (v8) {
      [v8 disableCacheFlushing];
    }
  }
  os_unfair_lock_unlock(&_MergedGlobals_1292);
  if (objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
    return 0;
  }
  else {
    return v7;
  }
}

+ (id)_assetManagerCache
{
  if (qword_1EB264AF0 != -1) {
    dispatch_once(&qword_1EB264AF0, &__block_literal_global_607);
  }
  return (id)qword_1EB264AE8;
}

- (id)_initWithName:(id)a3 inBundle:(id)a4 idiom:(int64_t)a5 lock:(BOOL)a6 allowMissingCatalog:(BOOL)a7
{
  BOOL v8 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)_UIAssetManager;
  UIDisplayGamut v12 = [(_UIAssetManager *)&v22 init];
  if (v12)
  {
    v12->_assetManagerName = (NSString *)[a3 copy];
    v12->_bundle = (NSBundle *)a4;
    if (+[UIDevice _isWatchCompanion])
    {
      objc_msgSend((id)objc_msgSend((id)getWKInterfaceDeviceClass(), "currentDevice"), "screenScale");
      v12->_preferredScale = v13;
      v12->_preferredGamut = 0;
      v12->_int64_t preferredIdiom = 4;
      UITraitEnvironmentLayoutDirection v14 = [(UITraitCollection *)[+[UIScreen mainScreen] traitCollection] layoutDirection];
    }
    else
    {
      uint64_t v15 = +[UIScreen mainScreen];
      [(UIScreen *)v15 scale];
      v12->_preferredScale = v16;
      v12->_preferredGamut = [(UIScreen *)v15 gamut];
      v12->_int64_t preferredIdiom = a5;
      UITraitEnvironmentLayoutDirection v14 = [(id)UIApp userInterfaceLayoutDirection];
    }
    v12->_preferredLayoutDirectionTrait = v14;
    v12->_preferredIdiomSubtype = __preferredIdiomSubtypeForIdiom(v12->_preferredIdiom);
    v12->_imageCache = (_UICache *)objc_alloc_init((Class)off_1E52D51F0);
    v12->_assetMap = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v12->_assetMapLock._os_unfair_lock_opaque = 0;
    v12->_runtimeCatalogCreationLock._os_unfair_lock_opaque = 0;
    uint64_t v21 = 0;
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F5E048]) initWithName:@"Assets" fromBundle:a4 error:&v21];
    v12->_catalog = (CUICatalog *)v17;
    if (v17 || a7)
    {
      double v19 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v12 selector:sel__clearCachedResources_ name:@"UIApplicationDidReceiveMemoryWarningNotification" object:UIApp];
      [v19 addObserver:v12 selector:sel__clearCachedResources_ name:@"UIApplicationDidEnterBackgroundNotification" object:UIApp];
      +[_UIAssetManager _saveAssetManager:v12 forBundle:a4 lock:v8];
    }
    else
    {

      uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("AssetManager", &_initWithName_inBundle_idiom_lock_allowMissingCatalog____s_category)+ 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = a4;
        __int16 v25 = 2112;
        uint64_t v26 = v21;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Could not load asset catalog from bundle %@: %@", buf, 0x16u);
      }
      +[_UIAssetManager _saveAssetManager:forBundle:lock:](_UIAssetManager, "_saveAssetManager:forBundle:lock:", [MEMORY[0x1E4F1CA98] null], a4, v8);
      return 0;
    }
  }
  return v12;
}

- (BOOL)_imageBelongsToCoreGlyphs:(id)a3
{
  uint64_t v4 = (_UIAssetManager *)objc_msgSend((id)objc_msgSend(a3, "imageAsset"), "_assetManager");
  LOBYTE(v5) = 0;
  if (v4 && v4 == self) {
    return (*(unsigned char *)&self->_assetManagerFlags >> 3) & 1;
  }
  return v5;
}

- (id)dataNamed:(id)a3
{
  return (id)[(CUICatalog *)self->_catalog dataWithName:a3];
}

- (void)disableCacheFlushing
{
  [(_UICache *)self->_imageCache setClearsCacheOnApplicationBackground:0];
  imageCache = self->_imageCache;
  [(_UICache *)imageCache setClearsCacheOnLowMemoryWarnings:0];
}

+ (id)_sharedRuntimeAssetMapKeyForAssetName:(id)a3 inAssetManager:(id)a4
{
  return (id)[NSString stringWithFormat:@"<image asset named '%@' in asset catalog '%@' for bundle '%@' at path '%@'>", a3, objc_msgSend(a4, "carFileName"), objc_msgSend((id)objc_msgSend(a4, "bundle"), "bundleIdentifier"), objc_msgSend((id)objc_msgSend(a4, "bundle"), "bundlePath")];
}

- (NSString)carFileName
{
  v2 = self->_assetManagerName;
  return v2;
}

+ (id)newAssetNamed:(id)a3 fromBundle:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    if (!a4)
    {
      id v30 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "Callers must provide a bundle", buf, 2u);
      }
    }
  }
  else if (!a4)
  {
    v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB264B28) + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Callers must provide a bundle", buf, 2u);
    }
  }
  if (!a3 || ![a3 length]) {
    return 0;
  }
  int v6 = [a3 hasPrefix:@"/"];
  id v7 = a3;
  if (v6) {
    id v7 = (id)[a3 lastPathComponent];
  }
  id v8 = +[_UIAssetManager _sharedRuntimeAssetMapKeyForAssetName:a3 fromFilesInBundle:a4];
  os_unfair_lock_lock(&stru_1EB264AE4);
  uint64_t v9 = objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "objectForKey:", v8);
  if (v9)
  {
    UIDisplayGamut v10 = (void *)v9;
    os_unfair_lock_unlock(&stru_1EB264AE4);
    return v10;
  }
  else
  {
    if (+[UIDevice _isWatch]) {
      char v13 = 1;
    }
    else {
      char v13 = +[UIDevice _isWatchCompanion];
    }
    if (v6) {
      id v14 = 0;
    }
    else {
      id v14 = a4;
    }
    id v15 = _UIImageCollectImagePathsForPath(a3, v14, 0, v13);
    if ([v15 count])
    {
      int v16 = _CFAppVersionCheck();
      if (v6) {
        uint64_t v17 = [a3 stringByDeletingLastPathComponent];
      }
      else {
        uint64_t v17 = [a4 bundlePath];
      }
      uint64_t v18 = v17;
      id v19 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      LODWORD(v18) = [v19 isWritableFileAtPath:v18];

      if (!v18 || v16)
      {
        id v11 = [[_UIPathLazyImageAsset alloc] _initWithAssetName:v7 forFilesInBundle:a4 imagePaths:v15 haveCGCacheImages:v6 ^ 1u];
      }
      else
      {
        id v11 = [[UIImageAsset alloc] _initWithAssetName:v7 forFilesInBundle:a4];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v20 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v33;
          int v23 = v6 ^ 1;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v33 != v22) {
                objc_enumerationMutation(v15);
              }
              __int16 v25 = *(void **)(*((void *)&v32 + 1) + 8 * v24);
              id v26 = _UserInterfaceTraitFromPath(v25);
              if (v26) {
                uint64_t v27 = [v26 imageConfiguration];
              }
              else {
                uint64_t v27 = 0;
              }
              ImageAtPath = (void *)GetImageAtPath(v25, v23, 0.0);
              [v11 _registerImage:ImageAtPath withConfiguration:v27];

              ++v24;
            }
            while (v21 != v24);
            uint64_t v29 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
            uint64_t v21 = v29;
          }
          while (v29);
        }
      }
      objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "setObject:forKey:", v11, v8);
    }
    else
    {
      id v11 = 0;
    }
    os_unfair_lock_unlock(&stru_1EB264AE4);
  }
  return v11;
}

+ (id)sharedRuntimeAssetMap
{
  if (qword_1EB264B48 != -1) {
    dispatch_once(&qword_1EB264B48, &__block_literal_global_97_3);
  }
  return (id)qword_1EB264B40;
}

+ (id)_sharedRuntimeAssetMapKeyForAssetName:(id)a3 fromFilesInBundle:(id)a4
{
  return (id)[NSString stringWithFormat:@"<image asset named %@ from files in bundle '%@' at path '%@'>", a3, objc_msgSend(a4, "bundleIdentifier"), objc_msgSend(a4, "bundlePath")];
}

- (_UIAssetManager)initWithName:(id)a3 inBundle:(id)a4 idiom:(int64_t)a5
{
  return (_UIAssetManager *)[(_UIAssetManager *)self _initWithName:a3 inBundle:a4 idiom:a5 lock:1 allowMissingCatalog:0];
}

+ (id)sharedRuntimeCatalog
{
  if (qword_1EB264B38 != -1) {
    dispatch_once(&qword_1EB264B38, &__block_literal_global_92_2);
  }
  return (id)qword_1EB264B30;
}

+ (int64_t)_userInterfaceIdiomForDeviceClass:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x5Fu >> v3) & 1) != 0) {
    return qword_186B9DAD8[v3];
  }
  uint64_t v4 = +[UIDevice currentDevice];
  return [(UIDevice *)v4 userInterfaceIdiom];
}

- (void)dealloc
{
  v5[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v5[0] = @"UIApplicationDidReceiveMemoryWarningNotification";
  v5[1] = @"UIApplicationDidEnterBackgroundNotification";
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2]);
  [(_UIAssetManager *)self _disconnectImageAssets];

  self->_assetMap = 0;
  self->_runtimeCatalog = 0;

  self->_preferredTraitCollection = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIAssetManager;
  [(_UIAssetManager *)&v4 dealloc];
}

- (void)_disconnectImageAssets
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_assetMapLock = &self->_assetMapLock;
  os_unfair_lock_lock(&self->_assetMapLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  assetMap = self->_assetMap;
  uint64_t v5 = [(NSMapTable *)assetMap countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(assetMap);
        }
        objc_msgSend((id)objc_msgSend(-[NSMapTable objectForKey:](self->_assetMap, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * i)), "imageAsset"), "_disconnectFromAssetManager");
      }
      uint64_t v6 = [(NSMapTable *)assetMap countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  os_unfair_lock_unlock(p_assetMapLock);
}

- (_UIAssetManager)initWithURL:(id)a3 idiom:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v22[0] = *MEMORY[0x1E4F1C628];
  long long v9 = objc_msgSend((id)objc_msgSend(a3, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 1), &v19), "objectForKey:", v22[0]);
  if (v9)
  {
    if ([v9 BOOLValue]) {
      id v7 = (id)[v7 URLByAppendingPathComponent:@"Assets.car"];
    }
  }
  else
  {
    long long v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("_UIAssetManager", &initWithURL_idiom_error____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v7, "absoluteString"), "UTF8String");
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Could not determine whether path is directory: %s", buf, 0xCu);
    }
  }
  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F5E048]) initWithURL:v7 error:&v19];
  if (v12)
  {
    char v13 = (CUICatalog *)v12;
    v18.receiver = self;
    v18.super_class = (Class)_UIAssetManager;
    uint64_t v14 = [(_UIAssetManager *)&v18 init];
    if (v14)
    {
      id v15 = +[UIScreen mainScreen];
      [(UIScreen *)v15 scale];
      v14->_preferredScale = v16;
      v14->_int64_t preferredIdiom = a4;
      v14->_preferredIdiomSubtype = __preferredIdiomSubtypeForIdiom(a4);
      v14->_preferredGamut = [(UIScreen *)v15 gamut];
      v14->_preferredLayoutDirectionTrait = [(id)UIApp userInterfaceLayoutDirection];
      v14->_catalog = v13;
      v14->_runtimeCatalogCreationLock._os_unfair_lock_opaque = 0;
      v14->_assetMap = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v14->_assetMapLock._os_unfair_lock_opaque = 0;
      *(unsigned char *)&v14->_assetManagerFlags |= 2u;
    }
    else
    {
    }
  }
  else
  {
    if (a5) {
      *a5 = v19;
    }

    return 0;
  }
  return v14;
}

- (id)initManagerWithoutCatalogWithName:(id)a3
{
  return [(_UIAssetManager *)self _initWithName:a3 inBundle:0 idiom:-1 lock:0 allowMissingCatalog:1];
}

+ (void)_executeUnitTestWithAssetManagerCache:(id)a3
{
  os_unfair_lock_lock(&_MergedGlobals_1292);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, [a1 _assetManagerCache]);
  os_unfair_lock_unlock(&_MergedGlobals_1292);
}

- (id)_carPlayAssetManager
{
  if ((*(unsigned char *)&self->_assetManagerFlags & 4) == 0) {
    return 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___UIAssetManager__carPlayAssetManager__block_invoke;
  block[3] = &unk_1E52DC580;
  block[4] = self;
  if (qword_1EB264B00 != -1) {
    dispatch_once(&qword_1EB264B00, block);
  }
  return (id)qword_1EB264AF8;
}

- (BOOL)_managingUIKitAssets
{
  return (*(unsigned char *)&self->_assetManagerFlags >> 2) & 1;
}

- (BOOL)_managingCoreGlyphs
{
  return (*(unsigned char *)&self->_assetManagerFlags >> 3) & 1;
}

- (id)imageNamed:(id)a3 scale:(double)a4 idiom:(int64_t)a5 subtype:(unint64_t)a6
{
  int v11 = dyld_program_sdk_at_least();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50___UIAssetManager_imageNamed_scale_idiom_subtype___block_invoke;
  v16[3] = &unk_1E530D188;
  *(double *)&v16[5] = a4;
  v16[6] = a5;
  v16[7] = a6;
  v16[4] = self;
  uint64_t v12 = +[UITraitCollection traitCollectionWithTraits:v16];
  if (v12) {
    uint64_t v13 = [(UITraitCollection *)v12 imageConfiguration];
  }
  else {
    uint64_t v13 = 0;
  }
  if (v11) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 3;
  }
  return [(_UIAssetManager *)self imageNamed:a3 configuration:v13 cachingOptions:v14 attachCatalogImage:0];
}

- (id)imageNamed:(id)a3 idiom:(int64_t)a4 subtype:(unint64_t)a5
{
  return [(_UIAssetManager *)self imageNamed:a3 scale:a4 idiom:a5 subtype:self->_preferredScale];
}

- (id)imageNamed:(id)a3 idiom:(int64_t)a4
{
  return [(_UIAssetManager *)self imageNamed:a3 idiom:a4 subtype:self->_preferredIdiomSubtype];
}

- (id)imageNamed:(id)a3
{
  return [(_UIAssetManager *)self imageNamed:a3 idiom:self->_preferredIdiom];
}

- (id)imageNamed:(id)a3 withTrait:(id)a4
{
  if (a4) {
    a4 = (id)[a4 imageConfiguration];
  }
  return [(_UIAssetManager *)self imageNamed:a3 configuration:a4];
}

- (id)_catalog
{
  v2 = self->_catalog;
  return v2;
}

- (id)_insertAssetIntoMap:(id)a3 forName:(id)a4
{
  return [(_UIAssetManager *)self _insertAssetIntoMap:a3 forName:a4 lock:1];
}

- (CUIMutableCatalog)runtimeCatalog
{
  if ([(_UIAssetManager *)self _isSystemAssetManager]) {
    return 0;
  }
  os_unfair_lock_lock(&self->_runtimeCatalogCreationLock);
  if (!self->_runtimeCatalog)
  {
    objc_super v4 = [(NSString *)[(NSBundle *)self->_bundle bundlePath] stringByAppendingString:@" - runtime catalog"];
    self->_runtimeCatalog = (CUIMutableCatalog *)[objc_alloc(MEMORY[0x1E4F5E058]) initWithName:v4];
  }
  os_unfair_lock_unlock(&self->_runtimeCatalogCreationLock);
  return self->_runtimeCatalog;
}

+ (void)clearSharedRuntimeAssetMapForUnitTests
{
  os_unfair_lock_lock(&stru_1EB264AE4);
  objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "removeAllObjects");
  os_unfair_lock_unlock(&stru_1EB264AE4);
}

- (void)_clearCachedResources:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"UIApplicationDidEnterBackgroundNotification"))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41___UIAssetManager__clearCachedResources___block_invoke;
    void v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = 0;
    uint64_t v4 = [(id)UIApp _beginBackgroundTaskWithName:@"com.apple.asset_manager.cache_resource_cleanup" expirationHandler:v5];
    [(_UIAssetManager *)self _clearCachedResources];
    if (v4) {
      [(id)UIApp _endBackgroundTask:v4];
    }
  }
  else
  {
    [(_UIAssetManager *)self _clearCachedResources];
  }
}

- (void)_clearCachedResources
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CUICatalog *)self->_catalog clearCachedImageResources];
  os_unfair_lock_lock(&stru_1EB264AE4);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = +[_UIAssetManager sharedRuntimeAssetMap];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend((id)objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * i)), "_clearResolvedImageResources");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  os_unfair_lock_unlock(&stru_1EB264AE4);
  os_unfair_lock_lock(&self->_assetMapLock);
  id v8 = NSAllMapTableKeys(self->_assetMap);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * j);
        if (!objc_msgSend(-[NSMapTable objectForKey:](self->_assetMap, "objectForKey:", v13), "imageAsset")) {
          [(NSMapTable *)self->_assetMap removeObjectForKey:v13];
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
  os_unfair_lock_unlock(&self->_assetMapLock);
}

- (BOOL)_imageBelongsToUIKit:(id)a3
{
  if ((*(unsigned char *)&self->_assetManagerFlags & 4) != 0)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(a3, "imageAsset"), "_assetManager");
    if (!v3) {
      return v3;
    }
    if (_UIAssetManager *)v3 == self || (*(unsigned char *)(v3 + 116))
    {
      LOBYTE(v3) = 1;
      return v3;
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)_imageIsSystemImage:(id)a3
{
  if (-[_UIAssetManager _imageBelongsToUIKit:](self, "_imageBelongsToUIKit:")) {
    return 1;
  }
  return [(_UIAssetManager *)self _imageBelongsToCoreGlyphs:a3];
}

- (id)_allImageNames
{
  return (id)[(CUICatalog *)self->_catalog allImageNames];
}

+ (void)_clearAllCachedImagesAndAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&stru_1EB264AE4);
  objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "removeAllObjects");
  os_unfair_lock_unlock(&stru_1EB264AE4);
  os_unfair_lock_lock(&_MergedGlobals_1292);
  v2 = (void *)MEMORY[0x18C108260]();
  id v3 = +[_UIAssetManager _assetManagerCache];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(v3, "cacheKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[v3 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v9 _clearCachedResources];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  objc_msgSend(+[_UIAssetManager _assetManagerCache](_UIAssetManager, "_assetManagerCache"), "removeAllObjects");
  os_unfair_lock_unlock(&_MergedGlobals_1292);
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p (%@)>: scale: %f, idiom: %ld, subtype: %lu", NSStringFromClass(v4), self, self->_assetManagerName, *(void *)&self->_preferredScale, self->_preferredIdiom, self->_preferredIdiomSubtype];
}

+ (double)_watchScreenScale
{
  [+[UIScreen mainScreen] scale];
  double v3 = v2;
  if (!+[UIDevice _isWatchCompanion]) {
    return v3;
  }
  uint64_t v4 = (void *)[(id)getWKInterfaceDeviceClass() currentDevice];
  [v4 screenScale];
  return result;
}

- (double)preferredScale
{
  return self->_preferredScale;
}

- (void)setPreferredScale:(double)a3
{
  self->_preferredScale = a3;
}

- (void)setPreferredTraitCollection:(id)a3
{
}

@end