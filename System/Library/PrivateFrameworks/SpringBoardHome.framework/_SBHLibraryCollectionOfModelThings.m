@interface _SBHLibraryCollectionOfModelThings
- (BOOL)examineModelValidityWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconImageCache)iconImageCache;
- (SBHIconModel)iconModel;
- (SBHLibraryCategoryMapProvider)categoryMapProvider;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (SBRootFolder)rootFolder;
- (_SBHLibraryCollectionOfModelThings)initWithIconViewProvider:(id)a3 iconModel:(id)a4 rootFolder:(id)a5 listLayoutProvider:(id)a6 iconImageCache:(id)a7 folderIconImageCache:(id)a8 categoryMapProvider:(id)a9;
@end

@implementation _SBHLibraryCollectionOfModelThings

- (_SBHLibraryCollectionOfModelThings)initWithIconViewProvider:(id)a3 iconModel:(id)a4 rootFolder:(id)a5 listLayoutProvider:(id)a6 iconImageCache:(id)a7 folderIconImageCache:(id)a8 categoryMapProvider:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)_SBHLibraryCollectionOfModelThings;
  v22 = [(_SBHLibraryCollectionOfModelThings *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_iconViewProvider, v15);
    objc_storeWeak((id *)&v23->_iconModel, v16);
    objc_storeWeak((id *)&v23->_rootFolder, v17);
    objc_storeWeak((id *)&v23->_listLayoutProvider, v18);
    objc_storeWeak((id *)&v23->_iconImageCache, v19);
    objc_storeWeak((id *)&v23->_folderIconImageCache, v20);
    objc_storeWeak((id *)&v23->_categoryMapProvider, v21);
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = v4;
    id WeakRetained = objc_loadWeakRetained(v4 + 1);
    id v9 = objc_loadWeakRetained((id *)&self->_iconViewProvider);
    char v25 = BSEqualObjects();

    id v10 = objc_loadWeakRetained(v7 + 2);
    id v11 = objc_loadWeakRetained((id *)&self->_iconModel);
    LOBYTE(WeakRetained) = BSEqualObjects();

    id v12 = objc_loadWeakRetained(v7 + 3);
    id v13 = objc_loadWeakRetained((id *)&self->_rootFolder);
    LOBYTE(v10) = BSEqualObjects();

    id v14 = objc_loadWeakRetained(v7 + 4);
    id v15 = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
    LOBYTE(v12) = BSEqualObjects();

    id v16 = objc_loadWeakRetained(v7 + 5);
    id v17 = objc_loadWeakRetained((id *)&self->_iconImageCache);
    LOBYTE(v14) = BSEqualObjects();

    id v18 = objc_loadWeakRetained(v7 + 6);
    id v19 = objc_loadWeakRetained((id *)&self->_folderIconImageCache);
    char v20 = BSEqualObjects();

    id v21 = objc_loadWeakRetained(v7 + 7);
    id v22 = objc_loadWeakRetained((id *)&self->_categoryMapProvider);
    LOBYTE(v7) = BSEqualObjects();

    char v23 = v25 & WeakRetained & v10 & v12 & v14 & v20 & v7;
  }
  else
  {
    char v23 = 0;
  }

  return v23;
}

- (BOOL)examineModelValidityWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);

  id v6 = objc_loadWeakRetained((id *)&self->_iconModel);
  id v7 = objc_loadWeakRetained((id *)&self->_rootFolder);

  id v8 = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
  id v9 = objc_loadWeakRetained((id *)&self->_iconImageCache);

  id v10 = objc_loadWeakRetained((id *)&self->_folderIconImageCache);
  id v11 = objc_loadWeakRetained((id *)&self->_categoryMapProvider);

  if (WeakRetained) {
    BOOL v12 = v6 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v18 = v12 || v7 == 0 || v8 == 0 || v9 == 0 || v10 == 0 || v11 == 0;
  if (a3 && v18)
  {
    char v23 = a3;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = v20;
    if (WeakRetained)
    {
      if (v6) {
        goto LABEL_26;
      }
    }
    else
    {
      [v20 addObject:@"_iconViewProvider"];
      if (v6)
      {
LABEL_26:
        if (v7) {
          goto LABEL_27;
        }
        goto LABEL_35;
      }
    }
    [v21 addObject:@"_iconModel"];
    if (v7)
    {
LABEL_27:
      if (v8) {
        goto LABEL_28;
      }
      goto LABEL_36;
    }
LABEL_35:
    [v21 addObject:@"_rootFolder"];
    if (v8)
    {
LABEL_28:
      if (v9) {
        goto LABEL_29;
      }
      goto LABEL_37;
    }
LABEL_36:
    [v21 addObject:@"_listLayoutProvider"];
    if (v9)
    {
LABEL_29:
      if (v10) {
        goto LABEL_30;
      }
      goto LABEL_38;
    }
LABEL_37:
    [v21 addObject:@"_iconImageCache"];
    if (v10)
    {
LABEL_30:
      if (v11)
      {
LABEL_31:
        [v19 setObject:v21 forKeyedSubscript:@"missingModelItems"];
        id *v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHLibraryErrorDomain" code:1 userInfo:v19];

        return v18 ^ 1;
      }
LABEL_39:
      [v21 addObject:@"_categoryMapProvider"];
      goto LABEL_31;
    }
LABEL_38:
    [v21 addObject:@"_folderIconImageCache"];
    if (v11) {
      goto LABEL_31;
    }
    goto LABEL_39;
  }
  return v18 ^ 1;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBHIconModel)iconModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconModel);
  return (SBHIconModel *)WeakRetained;
}

- (SBRootFolder)rootFolder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootFolder);
  return (SBRootFolder *)WeakRetained;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
  return (SBIconListLayoutProvider *)WeakRetained;
}

- (SBHIconImageCache)iconImageCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  return (SBHIconImageCache *)WeakRetained;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconImageCache);
  return (SBFolderIconImageCache *)WeakRetained;
}

- (SBHLibraryCategoryMapProvider)categoryMapProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_categoryMapProvider);
  return (SBHLibraryCategoryMapProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_categoryMapProvider);
  objc_destroyWeak((id *)&self->_folderIconImageCache);
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_destroyWeak((id *)&self->_rootFolder);
  objc_destroyWeak((id *)&self->_iconModel);
  objc_destroyWeak((id *)&self->_iconViewProvider);
}

@end