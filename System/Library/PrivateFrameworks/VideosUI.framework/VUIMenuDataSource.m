@interface VUIMenuDataSource
- (NSArray)genreMenuItems;
- (NSArray)genreTypes;
- (NSArray)mainMenuItems;
- (VUIMenuDataSource)initWithMainMenuItems:(id)a3 genreMenuItems:(id)a4;
- (id)_mainMenuItemsWithDefaultItemsBehavingAsiPhone:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mainMenuItemsWithDefaultItems;
- (id)mainMenuItemsWithDefaultItemsForIphone;
- (void)setGenreMenuItems:(id)a3;
- (void)setGenreTypes:(id)a3;
- (void)setMainMenuItems:(id)a3;
@end

@implementation VUIMenuDataSource

- (VUIMenuDataSource)initWithMainMenuItems:(id)a3 genreMenuItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIMenuDataSource;
  v9 = [(VUIMenuDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainMenuItems, a3);
    objc_storeStrong((id *)&v10->_genreMenuItems, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUIMenuDataSource);
  uint64_t v5 = [(NSArray *)self->_mainMenuItems copy];
  mainMenuItems = v4->_mainMenuItems;
  v4->_mainMenuItems = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_genreMenuItems copy];
  genreMenuItems = v4->_genreMenuItems;
  v4->_genreMenuItems = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_genreTypes copy];
  genreTypes = v4->_genreTypes;
  v4->_genreTypes = (NSArray *)v9;

  return v4;
}

- (id)mainMenuItemsWithDefaultItemsForIphone
{
  return [(VUIMenuDataSource *)self _mainMenuItemsWithDefaultItemsBehavingAsiPhone:1];
}

- (id)mainMenuItemsWithDefaultItems
{
  return [(VUIMenuDataSource *)self _mainMenuItemsWithDefaultItemsBehavingAsiPhone:0];
}

- (id)_mainMenuItemsWithDefaultItemsBehavingAsiPhone:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (+[VUIAuthenticationManager isLibraryOnlyCountry]
    || ([(VUIMenuDataSource *)self genreMenuItems],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    uint64_t v7 = [(VUIMenuDataSource *)self mainMenuItems];
    goto LABEL_4;
  }
  uint64_t v9 = [(VUIMenuDataSource *)self mainMenuItems];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
  v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_120];
  v11 = [v9 filteredArrayUsingPredicate:v10];
  unint64_t v12 = [v9 count];
  unint64_t v13 = [v11 count];
  if (([MEMORY[0x1E4FB3C90] isTV] & 1) != 0
    || ([MEMORY[0x1E4FB3C90] isVision] & 1) != 0
    || ([MEMORY[0x1E4FB3C90] isPhone] & 1) != 0
    || v3)
  {
    if (![v11 count] && v12 > v13) {
      goto LABEL_17;
    }
  }
  else if ((([MEMORY[0x1E4FB3C90] isPad] & 1) != 0 {
          || [MEMORY[0x1E4FB3C90] isMac])
  }
         && ![v11 count])
  {
LABEL_17:
    if ([v7 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v14 = objc_msgSend(&unk_1F3F3E420, "reverseObjectEnumerator", 0);
      v15 = [v14 allObjects];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            [v7 insertObject:*(void *)(*((void *)&v20 + 1) + 8 * i) atIndex:0];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v17);
      }
    }
    else
    {
      [v7 addObjectsFromArray:&unk_1F3F3E420];
    }
  }

LABEL_4:
  return v7;
}

BOOL __68__VUIMenuDataSource__mainMenuItemsWithDefaultItemsBehavingAsiPhone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    BOOL v4 = [v3 intValue] != 5
      && [v3 intValue] != 7
      && [v3 intValue] != 6
      && [v3 intValue] != 8
      && [v3 intValue] != 9;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSArray)mainMenuItems
{
  return self->_mainMenuItems;
}

- (void)setMainMenuItems:(id)a3
{
}

- (NSArray)genreMenuItems
{
  return self->_genreMenuItems;
}

- (void)setGenreMenuItems:(id)a3
{
}

- (NSArray)genreTypes
{
  return self->_genreTypes;
}

- (void)setGenreTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreTypes, 0);
  objc_storeStrong((id *)&self->_genreMenuItems, 0);
  objc_storeStrong((id *)&self->_mainMenuItems, 0);
}

@end