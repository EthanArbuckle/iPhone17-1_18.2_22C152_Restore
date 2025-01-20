@interface PXFavoritesSettings
+ (id)favoritesSubmoduleWithFavoritesSettingsKeyPath:(id)a3 delegate:(id)a4;
+ (id)sharedInstance;
+ (id)transientProperties;
- (BOOL)isFavoriteSettings:(id)a3;
- (NSArray)favoritesSettingsClassNames;
- (PXFavoritesSettingsDelegate)delegate;
- (id)_keyForFavoriteExistingAtIndex:(int64_t)a3;
- (id)_keyForFavoriteNameAtIndex:(int64_t)a3;
- (id)parentSettings;
- (id)valueForKey:(id)a3;
- (void)_notifyChange;
- (void)_performBlockAfterLoadingAccessorySettings:(id)a3;
- (void)_requestFavoriteSettingsAtIndex:(int64_t)a3 fromViewController:(id)a4 resultHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setFavoritesSettingsClassNames:(id)a3;
- (void)setIsFavorite:(BOOL)a3 settings:(id)a4;
@end

@implementation PXFavoritesSettings

+ (id)favoritesSubmoduleWithFavoritesSettingsKeyPath:(id)a3 delegate:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v5 = a4;
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:50];
  v6 = +[PXFavoritesSettings sharedInstance];
  v28 = v5;
  [v6 setDelegate:v5];
  for (uint64_t i = 0; i != 50; ++i)
  {
    v8 = [v6 _keyForFavoriteNameAtIndex:i];
    v9 = (void *)MEMORY[0x1E4F28F60];
    v10 = [v6 _keyForFavoriteExistingAtIndex:i];
    v11 = objc_msgSend(v9, "predicateWithFormat:", @"%K != 0", v10);

    v12 = [MEMORY[0x1E4F94130] row];
    v13 = [v12 titleKeyPath:v8];
    v14 = [v13 condition:v11];
    v15 = (void *)MEMORY[0x1E4F94190];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke;
    v31[3] = &unk_1E5DD08B0;
    id v16 = v6;
    id v32 = v16;
    uint64_t v33 = i;
    v17 = [v15 actionWithHandler:v31];
    v18 = [v14 action:v17];
    [v30 addObject:v18];
  }
  v19 = [MEMORY[0x1E4F94160] sectionWithRows:v30 title:@"Favorites"];
  v20 = (void *)MEMORY[0x1E4F28F60];
  v21 = [v16 _keyForFavoriteExistingAtIndex:0];
  v22 = objc_msgSend(v20, "predicateWithFormat:", @"%K != 0", v21);

  v23 = (void *)MEMORY[0x1E4F94160];
  v34[0] = v19;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v25 = [v23 moduleWithTitle:0 contents:v24];
  v26 = [v23 submoduleWithModule:v25 childSettingsKeyPath:v29 condition:v22];

  return v26;
}

uint64_t __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke_2;
  v9[3] = &unk_1E5DC5D00;
  id v10 = v4;
  id v7 = v4;
  [v6 _requestFavoriteSettingsAtIndex:v5 fromViewController:v7 resultHandler:v9];

  return 1;
}

void __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v5 = [v2 navigationController];
    id v4 = objc_msgSend(MEMORY[0x1E4FB1EC0], "px_viewControllerWithSettings:", v3);

    [v5 pushViewController:v4 animated:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesSettingsClassNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)favoritesSettingsClassNames
{
  return self->_favoritesSettingsClassNames;
}

- (void)setDelegate:(id)a3
{
}

- (PXFavoritesSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFavoritesSettingsDelegate *)WeakRetained;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PXFavoritesSettings_valueForKey___block_invoke;
  aBlock[3] = &unk_1E5DC5D78;
  id v5 = v4;
  id v20 = v5;
  v21 = &v22;
  v6 = (unsigned int (**)(void *, __CFString *))_Block_copy(aBlock);
  id v7 = [(PXFavoritesSettings *)self favoritesSettingsClassNames];
  if (v6[2](v6, @"favoriteName"))
  {
    unint64_t v8 = v23[3];
    if (v8 >= [v7 count])
    {
      v12 = 0;
    }
    else
    {
      v9 = [v7 objectAtIndexedSubscript:v23[3]];
      Class v10 = NSClassFromString(v9);
      if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
      {
        v11 = [(objc_class *)v10 settingsControllerModule];
        v12 = [v11 valueForKey:@"title"];
      }
      else
      {
        v12 = [NSString stringWithFormat:@"(%@)", v9];
        if (!self->_didEncounterUnknownSettingsClassName)
        {
          self->_didEncounterUnknownSettingsClassName = 1;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __35__PXFavoritesSettings_valueForKey___block_invoke_2;
          v18[3] = &unk_1E5DD36F8;
          v18[4] = self;
          [(PXFavoritesSettings *)self _performBlockAfterLoadingAccessorySettings:v18];
        }
      }
    }
    v15 = &stru_1F00B0030;
    if (v12) {
      v15 = v12;
    }
    v14 = v15;
  }
  else
  {
    if (v6[2](v6, @"hasFavorite"))
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", v23[3] < (unint64_t)objc_msgSend(v7, "count"));
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)PXFavoritesSettings;
      uint64_t v13 = [(PXFavoritesSettings *)&v17 valueForKey:v5];
    }
    v14 = (__CFString *)v13;
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __35__PXFavoritesSettings_valueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) hasPrefix:v3];
  if (v4)
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "substringFromIndex:", objc_msgSend(v3, "length"));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 integerValue];
  }
  return v4;
}

uint64_t __35__PXFavoritesSettings_valueForKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyChange];
}

- (void)_performBlockAfterLoadingAccessorySettings:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFavoritesSettings *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__PXFavoritesSettings__performBlockAfterLoadingAccessorySettings___block_invoke;
    v6[3] = &unk_1E5DD3128;
    id v7 = v4;
    [v5 favoritesSettings:self loadAccessorySettingsWithCompletionHandler:v6];
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __66__PXFavoritesSettings__performBlockAfterLoadingAccessorySettings___block_invoke(uint64_t a1)
{
}

- (id)_keyForFavoriteExistingAtIndex:(int64_t)a3
{
  id v3 = (void *)[[NSString alloc] initWithFormat:@"%@%li", @"hasFavorite", a3];
  return v3;
}

- (id)_keyForFavoriteNameAtIndex:(int64_t)a3
{
  id v3 = (void *)[[NSString alloc] initWithFormat:@"%@%li", @"favoriteName", a3];
  return v3;
}

- (void)_requestFavoriteSettingsAtIndex:(int64_t)a3 fromViewController:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  Class v10 = [(PXFavoritesSettings *)self favoritesSettingsClassNames];
  v11 = [v10 objectAtIndexedSubscript:a3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DC5D28;
  id v12 = v11;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  v14 = (uint64_t (**)(void))_Block_copy(aBlock);
  if ((v14[2]() & 1) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_2;
    v15[3] = &unk_1E5DC89D0;
    id v20 = v14;
    id v16 = v12;
    int64_t v21 = a3;
    id v17 = v10;
    v18 = self;
    id v19 = v8;
    [(PXFavoritesSettings *)self _performBlockAfterLoadingAccessorySettings:v15];
  }
}

uint64_t __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke(uint64_t a1)
{
  Class v2 = NSClassFromString(*(NSString **)(a1 + 32));
  char v3 = objc_opt_respondsToSelector();
  if (v3)
  {
    id v4 = [(objc_class *)v2 sharedInstance];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return v3 & 1;
}

void __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_2(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0)
  {
    Class v2 = (void *)MEMORY[0x1E4FB1418];
    char v3 = [NSString stringWithFormat:@"The class ”%@” doesn't appear to exist anymore.", *(void *)(a1 + 32)];
    id v4 = [v2 alertControllerWithTitle:@"Couldn't find internal settings" message:v3 preferredStyle:1];

    id v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v4 addAction:v5];

    v6 = (void *)MEMORY[0x1E4FB1410];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_3;
    v11[3] = &unk_1E5DC5D50;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = v7;
    uint64_t v13 = v9;
    uint64_t v14 = v8;
    Class v10 = [v6 actionWithTitle:@"Remove" style:2 handler:v11];
    [v4 addAction:v10];

    [*(id *)(a1 + 56) presentViewController:v4 animated:1 completion:0];
  }
}

void __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v2 removeObjectAtIndex:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setFavoritesSettingsClassNames:v2];
}

- (void)_notifyChange
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 50; ++i)
  {
    id v5 = [(PXFavoritesSettings *)self _keyForFavoriteNameAtIndex:i];
    [v3 addObject:v5];

    v6 = [(PXFavoritesSettings *)self _keyForFavoriteExistingAtIndex:i];
    [v3 addObject:v6];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PXFavoritesSettings *)self willChangeValueForKey:*(void *)(*((void *)&v23 + 1) + 8 * j)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * k);
        -[PXFavoritesSettings didChangeValueForKey:](self, "didChangeValueForKey:", v17, (void)v19);
        [(PTSettings *)self invalidateValueForKey:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [(PXSettings *)self save];
  v18 = [(PXFavoritesSettings *)self delegate];
  [v18 favoritesSettingsDidChangeFavorites:self];
}

- (void)setFavoritesSettingsClassNames:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  id v4 = self->_favoritesSettingsClassNames;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      favoritesSettingsClassNames = self->_favoritesSettingsClassNames;
      self->_favoritesSettingsClassNames = v6;

      [(PXSettings *)self save];
      [(PXFavoritesSettings *)self _notifyChange];
    }
  }
}

- (void)setIsFavorite:(BOOL)a3 settings:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXFavoritesSettings *)self favoritesSettingsClassNames];
  uint64_t v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v13 = v10;

  v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  if (v4) {
    [v13 insertObject:v12 atIndex:0];
  }
  else {
    [v13 removeObject:v12];
  }
  [(PXFavoritesSettings *)self setFavoritesSettingsClassNames:v13];
}

- (BOOL)isFavoriteSettings:(id)a3
{
  id v4 = a3;
  char v5 = [(PXFavoritesSettings *)self favoritesSettingsClassNames];
  id v6 = (objc_class *)objc_opt_class();

  id v7 = NSStringFromClass(v6);
  LOBYTE(v6) = [v5 containsObject:v7];

  return (char)v6;
}

- (id)parentSettings
{
  return 0;
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXFavoritesSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_214664 != -1) {
    dispatch_once(&transientProperties_onceToken_214664, block);
  }
  id v2 = (void *)transientProperties_transientProperties_214665;
  return v2;
}

void __42__PXFavoritesSettings_transientProperties__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXFavoritesSettings;
  v1 = objc_msgSendSuper2(&v5, sel_transientProperties);
  id v2 = NSStringFromSelector(sel_delegate);
  uint64_t v3 = [v1 setByAddingObject:v2];
  id v4 = (void *)transientProperties_transientProperties_214665;
  transientProperties_transientProperties_214665 = v3;
}

+ (id)sharedInstance
{
  os_unfair_lock_lock(&PXSettingsSharedInstanceLock);
  if (!sharedInstance_sharedInstance_214669)
  {
    uint64_t v3 = [a1 createSharedInstance];
    id v4 = (void *)sharedInstance_sharedInstance_214669;
    sharedInstance_sharedInstance_214669 = v3;
  }
  os_unfair_lock_unlock(&PXSettingsSharedInstanceLock);
  objc_super v5 = (void *)sharedInstance_sharedInstance_214669;
  return v5;
}

@end