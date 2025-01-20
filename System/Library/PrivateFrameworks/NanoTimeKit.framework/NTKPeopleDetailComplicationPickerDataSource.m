@interface NTKPeopleDetailComplicationPickerDataSource
+ (CNContactFormatter)sharedFormatter;
+ (id)_descriptorForRequiredKeysWithDescription:(id)a3;
+ (id)_newDataSourceWithName:(id)a3;
- (BOOL)_favoritesSectionNeeded;
- (BOOL)_isFavoriteAtIndexPath:(id)a3;
- (BOOL)_isMyCardAtIndexPath:(id)a3;
- (BOOL)_itemIsSelectedAtIndexPath:(id)a3;
- (BOOL)_myCardSectionNeeded;
- (CNContact)myCard;
- (CNContactStoreDataSource)allContactsDataSource;
- (NSArray)allFavoriteContacts;
- (NSIndexPath)selectedIndexPath;
- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider;
- (NTKComplicationPickerDetailViewConfiguration)configuration;
- (NTKPeopleDetailComplicationPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4;
- (UITableView)tableView;
- (id)_allContactsSections;
- (id)_allFavoriteContactsSorted;
- (id)_contactAtIndexPath:(id)a3;
- (id)_myCard;
- (id)_sectionIndexTitles;
- (id)complicationItemForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_contactIndexForIdentifier:(id)a3 inContactList:(id)a4;
- (int64_t)_favoritesSectionIndex;
- (int64_t)_firstAllContactsSectionIndex;
- (int64_t)_myCardSectionIndex;
- (int64_t)_numberOfItemsInSection:(int64_t)a3;
- (int64_t)_sectionForTitleIndex:(int64_t)a3;
- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3;
- (int64_t)_totalSectionCount;
- (int64_t)collectionView:(id)a3 sectionForSectionTitleIndex:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadData;
@end

@implementation NTKPeopleDetailComplicationPickerDataSource

+ (CNContactFormatter)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_108);
  }
  v2 = (void *)sharedFormatter_formatter;
  return (CNContactFormatter *)v2;
}

uint64_t __62__NTKPeopleDetailComplicationPickerDataSource_sharedFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedFormatter_formatter;
  sharedFormatter_formatter = v0;

  [(id)sharedFormatter_formatter setStyle:0];
  [(id)sharedFormatter_formatter setEmphasizesPrimaryNameComponent:1];
  v2 = (void *)sharedFormatter_formatter;
  return [v2 setFallbackStyle:-1];
}

- (NTKPeopleDetailComplicationPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKPeopleDetailComplicationPickerDataSource;
  v9 = [(NTKPeopleDetailComplicationPickerDataSource *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableView, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    uint64_t v11 = [(id)objc_opt_class() _newDataSourceWithName:@"NTKPeopleComplicationPickerViewController:allContacts"];
    allContactsDataSource = v10->_allContactsDataSource;
    v10->_allContactsDataSource = (CNContactStoreDataSource *)v11;

    uint64_t v13 = [(NTKPeopleDetailComplicationPickerDataSource *)v10 _allFavoriteContactsSorted];
    allFavoriteContacts = v10->_allFavoriteContacts;
    v10->_allFavoriteContacts = (NSArray *)v13;

    uint64_t v15 = [(NTKPeopleDetailComplicationPickerDataSource *)v10 _myCard];
    myCard = v10->_myCard;
    v10->_myCard = (CNContact *)v15;

    v17 = [v8 listProvider];
    v18 = [[NTKCFaceDetailComplicationCellProvider alloc] initWithTableView:v7 listProvider:v17];
    pickerCellProvider = v10->_pickerCellProvider;
    v10->_pickerCellProvider = v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v10 selector:sel__contactStoreChanged_ name:*MEMORY[0x1E4F1AF80] object:0];
    [v20 addObserver:v10 selector:sel__favoritesChanged_ name:*MEMORY[0x1E4F1AFF0] object:0];
  }
  return v10;
}

- (NSIndexPath)selectedIndexPath
{
  v3 = [(NTKPeopleDetailComplicationPickerDataSource *)self configuration];
  v4 = [v3 listProvider];
  v5 = [v4 pickerSelectedItem];

  v6 = objc_msgSend(v5, "ntk_contactIdentifier");
  if (!v6)
  {
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  id v7 = +[NTKPeopleComplicationContactsCache sharedCache];
  id v8 = [v7 contactForId:v6];

  if (self->_myCard)
  {
    int64_t v9 = [(NTKPeopleDetailComplicationPickerDataSource *)self _myCardSectionIndex];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v16 = v9;
      v17 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v18 = 0;
LABEL_10:
      uint64_t v15 = [v17 indexPathForItem:v18 inSection:v16];
      goto LABEL_11;
    }
  }
  v10 = [(NTKPeopleDetailComplicationPickerDataSource *)self allFavoriteContacts];
  uint64_t v11 = [v10 indexOfObject:v8];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = [(NTKPeopleDetailComplicationPickerDataSource *)self _favoritesSectionIndex];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v16 = v12;
      v17 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v18 = v11;
      goto LABEL_10;
    }
  }
  uint64_t v13 = [(NTKPeopleDetailComplicationPickerDataSource *)self allContactsDataSource];
  v14 = [v13 indexPathForContact:v8];

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v14, "item"), objc_msgSend(v14, "section") + 1);

LABEL_11:
LABEL_12:

  return (NSIndexPath *)v15;
}

- (id)complicationItemForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(NTKPeopleDetailComplicationPickerDataSource *)self _contactAtIndexPath:v4];
  BOOL v6 = [(NTKPeopleDetailComplicationPickerDataSource *)self _isMyCardAtIndexPath:v4]
    || [(NTKPeopleDetailComplicationPickerDataSource *)self _isFavoriteAtIndexPath:v4];
  id v7 = +[NTKPeopleComplication complicationForContact:v5 forPromotedSection:v6];

  return v7;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int64_t v5 = -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:");
  if (v5 == 2)
  {
    id v7 = [(NTKPeopleDetailComplicationPickerDataSource *)self _allContactsSections];
    if (v7)
    {
      unint64_t v8 = a3
         - [(NTKPeopleDetailComplicationPickerDataSource *)self _firstAllContactsSectionIndex];
      if (v8 >= [v7 count])
      {

        return 0;
      }
      int64_t v9 = [v7 objectAtIndexedSubscript:v8];
      [v9 range];
      int64_t v6 = v10;
    }
    else
    {
      int64_t v9 = [(CNContactStoreDataSource *)self->_allContactsDataSource contacts];
      int64_t v6 = [v9 count];
    }

    return v6;
  }
  if (v5 != 1)
  {
    if (!v5) {
      return self->_myCard != 0;
    }
    return 0;
  }
  allFavoriteContacts = self->_allFavoriteContacts;
  return [(NSArray *)allFavoriteContacts count];
}

- (int64_t)_totalSectionCount
{
  v3 = [(NTKPeopleDetailComplicationPickerDataSource *)self _allContactsSections];
  unint64_t v4 = [v3 count];

  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = v5 + [(NTKPeopleDetailComplicationPickerDataSource *)self _myCardSectionNeeded];
  return v6 + [(NTKPeopleDetailComplicationPickerDataSource *)self _favoritesSectionNeeded];
}

- (BOOL)_itemIsSelectedAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKPeopleDetailComplicationPickerDataSource *)self _contactAtIndexPath:v4];
  uint64_t v6 = [v5 identifier];
  id v7 = [(NTKPeopleDetailComplicationPickerDataSource *)self configuration];
  unint64_t v8 = [v7 listProvider];
  int64_t v9 = [v8 pickerSelectedItem];

  int64_t v10 = objc_msgSend(v9, "ntk_contactIdentifier");
  if ([(NTKPeopleDetailComplicationPickerDataSource *)self _isMyCardAtIndexPath:v4]
    || [(NTKPeopleDetailComplicationPickerDataSource *)self _isFavoriteAtIndexPath:v4]
    || objc_msgSend(v9, "ntk_itemType") == 4)
  {
    char v11 = [v6 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_sectionIndexTitles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(NTKPeopleDetailComplicationPickerDataSource *)self _allContactsSections];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v2 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          int64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "title", (void)v12);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  int64_t v10 = objc_msgSend(v3, "copy", (void)v12);

  return v10;
}

- (int64_t)_sectionForTitleIndex:(int64_t)a3
{
  return [(NTKPeopleDetailComplicationPickerDataSource *)self _firstAllContactsSectionIndex]+ a3;
}

- (void)_reloadData
{
}

- (int64_t)collectionView:(id)a3 sectionForSectionTitleIndex:(int64_t)a4
{
  return [(NTKPeopleDetailComplicationPickerDataSource *)self _sectionForTitleIndex:a4];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NTKPeopleDetailComplicationPickerDataSource *)self _numberOfItemsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NTKPeopleDetailComplicationPickerDataSource *)self complicationItemForIndexPath:v5];
  uint64_t v7 = [(NTKPeopleDetailComplicationPickerDataSource *)self pickerCellProvider];
  unint64_t v8 = [v7 cellForItem:v6 atIndexPath:v5];

  BOOL v9 = [(NTKPeopleDetailComplicationPickerDataSource *)self _itemIsSelectedAtIndexPath:v5];
  objc_msgSend(v8, "ntk_setPickerSelected:", v9);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v6 = [(NTKPeopleDetailComplicationPickerDataSource *)self _sectionTypeForSectionIndex:a4];
  switch(v6)
  {
    case 2:
      BOOL v9 = [(NTKPeopleDetailComplicationPickerDataSource *)self _allContactsSections];
      if (v9)
      {
        unint64_t v10 = a4
            - [(NTKPeopleDetailComplicationPickerDataSource *)self _firstAllContactsSectionIndex];
        if (v10 < [v9 count])
        {
          char v11 = [(NTKPeopleDetailComplicationPickerDataSource *)self _allContactsSections];
          long long v12 = [v11 objectAtIndex:v10];
          long long v13 = [v12 title];

          goto LABEL_12;
        }
      }

      break;
    case 1:
      uint64_t v7 = @"COMPLICATION_PICKER_PEOPLE_FAVORITES_SECTION_NAME";
      unint64_t v8 = @"FAVORITES";
      goto LABEL_9;
    case 0:
      uint64_t v7 = @"COMPLICATION_PICKER_PEOPLE_MY_CARD_SECTION_NAME";
      unint64_t v8 = @"MY CARD";
LABEL_9:
      NTKClockFaceLocalizedString(v7, v8);
      long long v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  long long v13 = &stru_1F1635E90;
LABEL_12:
  return v13;
}

- (id)_contactAtIndexPath:(id)a3
{
  id v5 = a3;
  int64_t v6 = -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v5 section]);
  if (v6 == 2)
  {
    uint64_t v8 = [v5 section];
    unint64_t v9 = [v5 row];
    unint64_t v10 = [(NTKPeopleDetailComplicationPickerDataSource *)self _allContactsSections];
    if (v10)
    {
      unint64_t v11 = v8
          - [(NTKPeopleDetailComplicationPickerDataSource *)self _firstAllContactsSectionIndex];
      if (v11 < [v10 count])
      {
        long long v12 = [v10 objectAtIndexedSubscript:v11];
        uint64_t v13 = [v12 range];
        unint64_t v9 = v13 + [v5 row];
      }
    }
    long long v14 = [(CNContactStoreDataSource *)self->_allContactsDataSource contacts];
    if (v9 >= [v14 count])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [v14 objectAtIndexedSubscript:v9];
    }
  }
  else
  {
    if (v6 != 1)
    {
      if (v6) {
        goto LABEL_16;
      }
      uint64_t v7 = self->_myCard;
      goto LABEL_12;
    }
    unint64_t v15 = [v5 row];
    if (v15 < [(NSArray *)self->_allFavoriteContacts count])
    {
      -[NSArray objectAtIndexedSubscript:](self->_allFavoriteContacts, "objectAtIndexedSubscript:", [v5 row]);
      uint64_t v7 = (CNContact *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      id v3 = v7;
      goto LABEL_16;
    }
    id v3 = 0;
  }
LABEL_16:

  return v3;
}

- (int64_t)_contactIndexForIdentifier:(id)a3 inContactList:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "identifier", (void)v17);
        char v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          int64_t v15 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v15 = -1;
LABEL_11:

  return v15;
}

- (int64_t)_myCardSectionIndex
{
  if ([(NTKPeopleDetailComplicationPickerDataSource *)self _myCardSectionNeeded]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_favoritesSectionIndex
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NTKPeopleDetailComplicationPickerDataSource *)self _favoritesSectionNeeded])
  {
    int64_t v4 = [(NTKPeopleDetailComplicationPickerDataSource *)self _myCardSectionIndex];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v4 + 1;
    }
  }
  return v3;
}

- (int64_t)_firstAllContactsSectionIndex
{
  int64_t v3 = [(NTKPeopleDetailComplicationPickerDataSource *)self _favoritesSectionIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    return v3 + 1;
  }
  int64_t v4 = [(NTKPeopleDetailComplicationPickerDataSource *)self _myCardSectionIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v4 + 1;
  }
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  if ([(NTKPeopleDetailComplicationPickerDataSource *)self _myCardSectionIndex] == a3) {
    return 0;
  }
  if ([(NTKPeopleDetailComplicationPickerDataSource *)self _favoritesSectionIndex] == a3) {
    return 1;
  }
  return 2;
}

- (id)_myCard
{
  return +[NTKPeopleComplication myCard];
}

- (id)_allFavoriteContactsSorted
{
  return +[NTKPeopleComplication allValidFavoriteContacts];
}

- (BOOL)_myCardSectionNeeded
{
  return self->_myCard != 0;
}

- (BOOL)_favoritesSectionNeeded
{
  return [(NSArray *)self->_allFavoriteContacts count] != 0;
}

- (id)_allContactsSections
{
  return (id)[(CNContactStoreDataSource *)self->_allContactsDataSource sections];
}

- (BOOL)_isMyCardAtIndexPath:(id)a3
{
  return -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [a3 section]) == 0;
}

- (BOOL)_isFavoriteAtIndexPath:(id)a3
{
  return -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [a3 section]) == 1;
}

+ (id)_newDataSourceWithName:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int64_t v4 = (objc_class *)MEMORY[0x1E4F1B990];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = (void *)tcc_identity_create();
  [v6 setAssumedIdentity:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F1BB98]);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v6];
  uint64_t v10 = (void *)[v8 initWithStore:v9];

  uint64_t v11 = [a1 _descriptorForRequiredKeysWithDescription:v5];

  v14[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v10 setKeysToFetch:v12];

  [v10 setFetchUnified:1];
  return v10;
}

+ (id)_descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NTKPeopleDetailComplicationPickerDataSource__descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E62BFF20;
  id v9 = v3;
  uint64_t v4 = _descriptorForRequiredKeysWithDescription__cn_once_token_0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_descriptorForRequiredKeysWithDescription__cn_once_token_0, block);
  }
  id v6 = (id)_descriptorForRequiredKeysWithDescription__cn_once_object_0;

  return v6;
}

void __89__NTKPeopleDetailComplicationPickerDataSource__descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 1002, v3);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  uint64_t v7 = [v2 descriptorWithKeyDescriptors:v6 description:*(void *)(a1 + 32)];
  id v8 = (void *)_descriptorForRequiredKeysWithDescription__cn_once_object_0;
  _descriptorForRequiredKeysWithDescription__cn_once_object_0 = v7;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NTKComplicationPickerDetailViewConfiguration)configuration
{
  return self->_configuration;
}

- (CNContact)myCard
{
  return self->_myCard;
}

- (NSArray)allFavoriteContacts
{
  return self->_allFavoriteContacts;
}

- (CNContactStoreDataSource)allContactsDataSource
{
  return self->_allContactsDataSource;
}

- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider
{
  return self->_pickerCellProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerCellProvider, 0);
  objc_storeStrong((id *)&self->_allContactsDataSource, 0);
  objc_storeStrong((id *)&self->_allFavoriteContacts, 0);
  objc_storeStrong((id *)&self->_myCard, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end