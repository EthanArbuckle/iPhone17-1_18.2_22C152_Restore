@interface PXDisplayTitleInfo
+ (id)displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 defaultTitle:(id)a5 defaultTitleCategory:(int64_t)a6 titleKey:(id)a7 titleCategoryKey:(id)a8 defaultSubtitle:(id)a9 subtitleKey:(id)a10 simulatedLoadingDelay:(double)a11 preferredAttributesPromise:(id)a12;
- (BOOL)useVerboseSmartDescription;
- (NSString)description;
- (NSString)fontName;
- (NSString)subtitle;
- (NSString)title;
- (PHAssetCollection)_assetCollection;
- (PXDisplayTitleInfo)init;
- (PXDisplayTitleInfo)initWithAssetCollection:(id)a3 useVerboseSmartDescription:(BOOL)a4;
- (PXDisplayTitleInfo)initWithTitle:(id)a3 subtitle:(id)a4 fontName:(id)a5;
- (void)_setAssetCollection:(id)a3;
- (void)_updatePropertiesFromAssetCollection;
- (void)performChanges:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)setFontName:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseVerboseSmartDescription:(BOOL)a3;
@end

@implementation PXDisplayTitleInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetCollection, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setUseVerboseSmartDescription:(BOOL)a3
{
  self->_useVerboseSmartDescription = a3;
}

- (BOOL)useVerboseSmartDescription
{
  return self->_useVerboseSmartDescription;
}

- (PHAssetCollection)_assetCollection
{
  return self->__assetCollection;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p, title=%@, subtitle=%@, fontName=%@>", objc_opt_class(), self, self->_title, self->_subtitle, self->_fontName];
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v8 = a3;
  v4 = [(PXDisplayTitleInfo *)self _assetCollection];
  if (v4)
  {
    v5 = [v8 changeDetailsForObject:v4];
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectAfterChanges];

      if (v7)
      {
        [(PXDisplayTitleInfo *)self _setAssetCollection:v7];
        v4 = (void *)v7;
      }
      else
      {
        v4 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }
}

- (void)setFontName:(id)a3
{
  id v8 = (NSString *)a3;
  v4 = self->_fontName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      fontName = self->_fontName;
      self->_fontName = v6;

      [(PXDisplayTitleInfo *)self signalChange:4];
    }
  }
}

- (void)setSubtitle:(id)a3
{
  id v8 = (NSString *)a3;
  v4 = self->_subtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      [(PXDisplayTitleInfo *)self signalChange:2];
    }
  }
}

- (void)setTitle:(id)a3
{
  id v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXDisplayTitleInfo *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayTitleInfo;
  [(PXDisplayTitleInfo *)&v3 performChanges:a3];
}

- (void)_updatePropertiesFromAssetCollection
{
  v4 = [(PXDisplayTitleInfo *)self _assetCollection];
  uint64_t v5 = [v4 assetCollectionType];
  unint64_t v6 = v5;
  if (v4)
  {
    if (v5 == 6)
    {
      id v7 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        if ([(PXDisplayTitleInfo *)self useVerboseSmartDescription]) {
          [v4 verboseSmartDescription];
        }
        else {
        id v8 = [v4 smartDescription];
        }
        v9 = [v4 dateDescription];

        goto LABEL_8;
      }
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v20);
      v21 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v13 handleFailureInMethod:a2, self, @"PXDisplayTitleInfo.m", 70, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v15, v21 object file lineNumber description];

LABEL_15:
      goto LABEL_4;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXDisplayTitleInfo.m", 66, @"missing asset collection %@", self object file lineNumber description];

    if (v6 == 6)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      [v13 handleFailureInMethod:a2, self, @"PXDisplayTitleInfo.m", 70, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v15 object file lineNumber description];
      goto LABEL_15;
    }
  }
  id v8 = [v4 localizedTitle];
  v9 = [v4 localizedSubtitle];
  if (v6 > 8 || ((1 << v6) & 0x130) == 0)
  {
LABEL_8:
    v10 = [off_1E5DA7230 defaultHelper];
    uint64_t v11 = objc_msgSend(v10, "titleForDisplayableText:titleCategory:options:", v8, objc_msgSend(v4, "titleCategory"), 1);

    id v8 = (void *)v11;
  }
  v16 = [v4 titleFontName];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__PXDisplayTitleInfo__updatePropertiesFromAssetCollection__block_invoke;
  v22[3] = &unk_1E5DCEA60;
  id v23 = v8;
  id v24 = v9;
  id v25 = v16;
  id v17 = v16;
  id v18 = v9;
  id v19 = v8;
  [(PXDisplayTitleInfo *)self performChanges:v22];
}

void __58__PXDisplayTitleInfo__updatePropertiesFromAssetCollection__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setSubtitle:a1[5]];
  [v4 setFontName:a1[6]];
}

- (void)_setAssetCollection:(id)a3
{
  uint64_t v5 = (PHAssetCollection *)a3;
  if (self->__assetCollection != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->__assetCollection, a3);
    [(PXDisplayTitleInfo *)self _updatePropertiesFromAssetCollection];
    uint64_t v5 = v6;
  }
}

- (PXDisplayTitleInfo)initWithAssetCollection:(id)a3 useVerboseSmartDescription:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(PXDisplayTitleInfo *)self initWithTitle:&stru_1F00B0030 subtitle:0 fontName:&stru_1F00B0030];
  id v9 = v7;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v10 = v9;

    if (v10)
    {
      if (v8)
      {
        objc_storeStrong((id *)&v8->__assetCollection, a3);
        uint64_t v11 = [(PHAssetCollection *)v8->__assetCollection photoLibrary];
        objc_msgSend(v11, "px_registerChangeObserver:", v8);

        [(PXDisplayTitleInfo *)v8 setUseVerboseSmartDescription:v4];
        [(PXDisplayTitleInfo *)v8 _updatePropertiesFromAssetCollection];
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "[PXDisplayTitleInfo] unsupported asset collection: %@", (uint8_t *)&v14, 0xCu);
  }

  id v10 = 0;
LABEL_10:

  return v8;
}

- (PXDisplayTitleInfo)initWithTitle:(id)a3 subtitle:(id)a4 fontName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PXDisplayTitleInfo;
  uint64_t v11 = [(PXDisplayTitleInfo *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    v13 = (void *)v12;
    if (v12) {
      int v14 = (__CFString *)v12;
    }
    else {
      int v14 = &stru_1F00B0030;
    }
    objc_storeStrong((id *)&v11->_title, v14);

    uint64_t v15 = [v9 copy];
    uint64_t v16 = (void *)v15;
    if (v15) {
      id v17 = (__CFString *)v15;
    }
    else {
      id v17 = &stru_1F00B0030;
    }
    objc_storeStrong((id *)&v11->_subtitle, v17);

    uint64_t v18 = [v10 copy];
    fontName = v11->_fontName;
    v11->_fontName = (NSString *)v18;
  }
  return v11;
}

- (PXDisplayTitleInfo)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayTitleInfo.m", 26, @"%s is not available as initializer", "-[PXDisplayTitleInfo init]");

  abort();
}

+ (id)displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 defaultTitle:(id)a5 defaultTitleCategory:(int64_t)a6 titleKey:(id)a7 titleCategoryKey:(id)a8 defaultSubtitle:(id)a9 subtitleKey:(id)a10 simulatedLoadingDelay:(double)a11 preferredAttributesPromise:(id)a12
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a12;
  if (v21)
  {
    id v24 = v21;
  }
  else
  {
    id v24 = [v17 localizedSubtitle];
  }
  id v25 = v24;
  v26 = v17;
  v38 = v20;
  uint64_t v27 = [MEMORY[0x1E4F38EE8] titleFontNameForTitleCategory:a4];
  if (v23)
  {
    v28 = v19;
    v29 = [[PXDisplayTitleInfo alloc] initWithTitle:@" " subtitle:@" " fontName:v27];
    v35 = (void *)v27;
    if (displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__onceToken != -1) {
      dispatch_once(&displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__onceToken, &__block_literal_global_271083);
    }
    v37 = v29;
    objc_initWeak(location, v29);
    v30 = displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__backgroundQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2;
    block[3] = &unk_1E5DCEAB0;
    id v40 = v28;
    id v41 = v18;
    v31 = v38;
    id v42 = v38;
    v47[1] = (id)a6;
    id v43 = v22;
    id v44 = v25;
    id v46 = v23;
    id v45 = v17;
    v47[2] = *(id *)&a11;
    objc_copyWeak(v47, location);
    dispatch_async(v30, block);
    objc_destroyWeak(v47);

    objc_destroyWeak(location);
    v32 = v35;
  }
  else
  {
    v28 = v19;
    v33 = PLUIGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v26;
      _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_DEFAULT, "No preferred attributes promise for asset collection %@", (uint8_t *)location, 0xCu);
    }

    v37 = [[PXDisplayTitleInfo alloc] initWithTitle:v18 subtitle:v21 fontName:v27];
    v32 = (void *)v27;
    v31 = v38;
  }

  return v37;
}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 96)];
  [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];

  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:*(void *)(a1 + 56)];
  BOOL v4 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  uint64_t v5 = PLUIGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v7;
    __int16 v29 = 2112;
    v30 = v4;
    id v8 = "Preferred attributes for asset collection %@: %@";
    id v9 = v5;
    uint32_t v10 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v11;
    id v8 = "Preferred attributes promise returned nothing for asset collection %@";
    id v9 = v5;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  if (*(double *)(a1 + 104) > 0.0) {
    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:");
  }
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 96);
  id v14 = *(id *)(a1 + 64);
  if (v4)
  {
    uint64_t v15 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    uint64_t v16 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v13 = [v16 integerValue];

    uint64_t v17 = [v4 objectForKeyedSubscript:*(void *)(a1 + 56)];

    id v12 = (id)v15;
    id v14 = (id)v17;
  }
  id v18 = [MEMORY[0x1E4F38EE8] titleFontNameForTitleCategory:v13];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_224;
  v22[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v26, (id *)(a1 + 88));
  id v23 = v12;
  id v24 = v14;
  id v25 = v18;
  id v19 = v18;
  id v20 = v14;
  id v21 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v22);

  objc_destroyWeak(&v26);
}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_224(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2_225;
  v3[3] = &unk_1E5DCEA60;
  id v4 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  [WeakRetained performChanges:v3];
}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2_225(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setSubtitle:a1[5]];
  [v4 setFontName:a1[6]];
}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.preferredattributespromise", v0);
  v2 = (void *)displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__backgroundQueue;
  displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__backgroundQueue = (uint64_t)v1;
}

@end