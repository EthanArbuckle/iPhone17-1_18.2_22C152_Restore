@interface NCSupplementaryViewPrototypeRecipe
+ (id)_sharedInstance;
+ (void)registerRecipeWithDelegate:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NCSupplementaryViewPrototypeRecipe)init;
- (NCSupplementaryViewPrototypeRecipeDelegate)delegate;
- (NSMutableDictionary)lastModifiedDatesByGroupingIdentifiers;
- (id)_mostRecentDateForGroupingIdentifier:(id)a3;
- (id)_supplementaryViewsTestRecipeWithDelegate:(id)a3;
- (int64_t)_compareByAgeForViewController:(id)a3 otherViewController:(id)a4;
- (unint64_t)prototypeRecipeViewController:(id)a3 requestsCountForGroupWithIdentifier:(id)a4;
- (void)_presentSupplementaryViewController;
- (void)_registerRecipeWithDelegate:(id)a3;
- (void)_setSortComparatorsForContainer:(id)a3;
- (void)_updateGroupLastModifiedDateForViewController:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)recipeMenuViewController:(id)a3 requestsInsertContentViewController:(id)a4;
- (void)requestsInsertForPrototypeRecipeViewController:(id)a3;
- (void)requestsRemovalForPrototypeRecipeViewController:(id)a3;
- (void)requestsUpdateForPrototypeRecipeViewController:(id)a3;
- (void)requestsUpdatePositionIfNeededForPrototypeRecipeViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastModifiedDatesByGroupingIdentifiers:(id)a3;
@end

@implementation NCSupplementaryViewPrototypeRecipe

- (NCSupplementaryViewPrototypeRecipe)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCSupplementaryViewPrototypeRecipe;
  v2 = [(NCSupplementaryViewPrototypeRecipe *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastModifiedDatesByGroupingIdentifiers = v2->_lastModifiedDatesByGroupingIdentifiers;
    v2->_lastModifiedDatesByGroupingIdentifiers = v3;
  }
  return v2;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)_sharedInstance___sharedInstance;

  return v2;
}

void __53__NCSupplementaryViewPrototypeRecipe__sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NCSupplementaryViewPrototypeRecipe);
  v1 = (void *)_sharedInstance___sharedInstance;
  _sharedInstance___sharedInstance = (uint64_t)v0;
}

+ (void)registerRecipeWithDelegate:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _sharedInstance];
  [v4 _registerRecipeWithDelegate:v3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCSupplementaryViewPrototypeRecipe;
  if (-[NCSupplementaryViewPrototypeRecipe respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", [v4 selector]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [v4 invokeWithTarget:WeakRetained];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)NCSupplementaryViewPrototypeRecipe;
      [(NCSupplementaryViewPrototypeRecipe *)&v6 forwardInvocation:v4];
    }
  }
}

- (void)requestsRemovalForPrototypeRecipeViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v5 = [WeakRetained testRecipeSupplementaryViewsContainer];
  [v5 removeSupplementaryViewController:v4];
}

- (void)requestsUpdateForPrototypeRecipeViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v5 = [WeakRetained testRecipeSupplementaryViewsContainer];
  objc_super v6 = [v4 configuration];
  [v5 updateSupplementaryViewController:v4 withConfiguration:v6];
}

- (void)requestsInsertForPrototypeRecipeViewController:(id)a3
{
  id v4 = a3;
  [(NCSupplementaryViewPrototypeRecipe *)self _updateGroupLastModifiedDateForViewController:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained testRecipeSupplementaryViewsContainer];
  objc_super v6 = [v4 configuration];
  [v5 insertSupplementaryViewController:v4 withConfiguration:v6];
}

- (void)requestsUpdatePositionIfNeededForPrototypeRecipeViewController:(id)a3
{
  id v4 = a3;
  [(NCSupplementaryViewPrototypeRecipe *)self _updateGroupLastModifiedDateForViewController:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained testRecipeSupplementaryViewsContainer];
  [v5 updatePositionIfNeededForSupplementaryViewController:v4];
}

- (unint64_t)prototypeRecipeViewController:(id)a3 requestsCountForGroupWithIdentifier:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = [WeakRetained testRecipeSupplementaryViewsContainer];
  objc_super v8 = [v7 supplementaryViewControllersByGroupingIdentifiers];
  v9 = [v8 objectForKey:v5];

  unint64_t v10 = [v9 count];
  return v10;
}

- (void)recipeMenuViewController:(id)a3 requestsInsertContentViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_super v6 = [WeakRetained testRecipeSupplementaryViewsContainer];
  v7 = [v5 configuration];
  [v6 insertSupplementaryViewController:v5 withConfiguration:v7];
}

- (void)_registerRecipeWithDelegate:(id)a3
{
  id v4 = a3;
  [(NCSupplementaryViewPrototypeRecipe *)self setDelegate:v4];
  id v7 = [(NCSupplementaryViewPrototypeRecipe *)self _supplementaryViewsTestRecipeWithDelegate:v4];

  +[PTDomain registerTestRecipe:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v6 = [WeakRetained testRecipeSupplementaryViewsContainer];
  [(NCSupplementaryViewPrototypeRecipe *)self _setSortComparatorsForContainer:v6];
}

- (void)_setSortComparatorsForContainer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke;
  v7[3] = &unk_1E6A95338;
  objc_copyWeak(&v8, &location);
  [v4 setViewControllerSortComparator:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke_2;
  v5[3] = &unk_1E6A95360;
  objc_copyWeak(&v6, &location);
  [v4 setGroupSortComparator:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = [WeakRetained _compareByAgeForViewController:v5 otherViewController:v6];

  return v8;
}

uint64_t __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [&unk_1F2F846A0 indexOfObject:v5];
    unint64_t v9 = [&unk_1F2F846A0 indexOfObject:v6];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          v11 = [WeakRetained lastModifiedDatesByGroupingIdentifiers];
          v12 = [v11 objectForKey:v5];

          v13 = [WeakRetained lastModifiedDatesByGroupingIdentifiers];
          v14 = [v13 objectForKey:v6];

          uint64_t v7 = [v14 compare:v12];
        }
        else
        {
          uint64_t v7 = -1;
        }
      }
      else if (v9 < v8)
      {
        uint64_t v7 = 1;
      }
      else
      {
        uint64_t v7 = -1;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (id)_mostRecentDateForGroupingIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained testRecipeSupplementaryViewsContainer];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "supplementaryViewControllersByGroupingIdentifiers", 0);
  unint64_t v8 = [v7 objectForKey:v4];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v9)
  {

LABEL_14:
    v11 = [MEMORY[0x1E4F1C9C8] now];
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  v11 = 0;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dateModified];
      v15 = v14;
      if (!v11 || [v14 compare:v11] == 1)
      {
        id v16 = v15;

        v11 = v16;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v10);

  if (!v11) {
    goto LABEL_14;
  }
LABEL_15:

  return v11;
}

- (int64_t)_compareByAgeForViewController:(id)a3 otherViewController:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dateModified];
  uint64_t v7 = [v5 dateModified];

  int64_t v8 = [v6 compare:v7];
  return v8;
}

- (void)_presentSupplementaryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained testRecipeSupplementaryViewsContainer];

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [v4 supplementaryViewControllers];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__NCSupplementaryViewPrototypeRecipe__presentSupplementaryViewController__block_invoke;
  v8[3] = &unk_1E6A95388;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  if (!*((unsigned char *)v10 + 24))
  {
    id v6 = objc_alloc_init(NCSupplementaryViewPrototypeRecipeMenuViewController);
    uint64_t v7 = [(NCSupplementaryViewPrototypeRecipeViewController *)v6 configuration];
    [v4 insertSupplementaryViewController:v6 withConfiguration:v7];

    [(NCSupplementaryViewPrototypeRecipeViewController *)v6 setDelegate:self];
  }
  _Block_object_dispose(&v9, 8);
}

void __73__NCSupplementaryViewPrototypeRecipe__presentSupplementaryViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)_updateGroupLastModifiedDateForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 configuration];
  id v10 = [v5 groupingIdentifier];

  id v6 = [v4 dateModified];

  if (v10 && v6)
  {
    uint64_t v7 = -[NSMutableDictionary objectForKey:](self->_lastModifiedDatesByGroupingIdentifiers, "objectForKey:");
    int64_t v8 = v6;
    if (v7)
    {
      if ([v6 compare:v7] == 1) {
        int64_t v8 = v6;
      }
      else {
        int64_t v8 = v7;
      }
    }
    id v9 = v8;

    [(NSMutableDictionary *)self->_lastModifiedDatesByGroupingIdentifiers setObject:v9 forKey:v10];
    id v6 = v9;
  }
}

- (id)_supplementaryViewsTestRecipeWithDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  id v5 = (void *)MEMORY[0x1E4F94120];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__NCSupplementaryViewPrototypeRecipe__supplementaryViewsTestRecipeWithDelegate___block_invoke;
  v8[3] = &unk_1E6A92FE0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  id v6 = [v5 recipeWithTitle:@"Add/Remove Supplementary Views in Notifications List" increaseAction:v8 decreaseAction:&__block_literal_global_22];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __80__NCSupplementaryViewPrototypeRecipe__supplementaryViewsTestRecipeWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _presentSupplementaryViewController];
    id WeakRetained = v3;
  }
}

- (NCSupplementaryViewPrototypeRecipeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSupplementaryViewPrototypeRecipeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)lastModifiedDatesByGroupingIdentifiers
{
  return self->_lastModifiedDatesByGroupingIdentifiers;
}

- (void)setLastModifiedDatesByGroupingIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDatesByGroupingIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end