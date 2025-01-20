@interface PXSearchResultsSection
+ (id)_stringForCategory:(unint64_t)a3;
+ (id)sectionTitleForCategoryMask:(unint64_t)a3;
+ (unint64_t)_sectionTypeForCategory:(unint64_t)a3;
+ (unint64_t)sectionTypeForCategoryMask:(unint64_t)a3 isMomentSection:(BOOL)a4 isTopAssetSection:(BOOL)a5;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isSorted;
- (NSArray)searchResults;
- (NSArray)sortDescriptors;
- (NSDictionary)debugDictionary;
- (NSMutableArray)mutableSearchResults;
- (NSMutableSet)mutableSearchResultUUIDs;
- (NSString)title;
- (PXSearchResultsSection)init;
- (PXSearchResultsSection)initWithTitle:(id)a3 withSectionType:(unint64_t)a4;
- (id)description;
- (unint64_t)maxVisibleItemsInCollapsedSection;
- (unint64_t)sectionType;
- (unint64_t)totalCount;
- (unint64_t)visibleCount;
- (void)addSearchResult:(id)a3;
- (void)removeSearchResult:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setSorted:(BOOL)a3;
@end

@implementation PXSearchResultsSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSearchResultUUIDs, 0);
  objc_storeStrong((id *)&self->_mutableSearchResults, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSMutableSet)mutableSearchResultUUIDs
{
  return self->_mutableSearchResultUUIDs;
}

- (void)setSorted:(BOOL)a3
{
  self->_sorted = a3;
}

- (BOOL)isSorted
{
  return self->_sorted;
}

- (NSMutableArray)mutableSearchResults
{
  return self->_mutableSearchResults;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSString)title
{
  return self->_title;
}

- (id)description
{
  v2 = [(PXSearchResultsSection *)self debugDictionary];
  v3 = [v2 description];

  return v3;
}

- (NSDictionary)debugDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"%@:%p", v6, self];
  [v3 setObject:v7 forKeyedSubscript:@"self"];

  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PXSearchResultsSection isExpandable](self, "isExpandable"));
  [v3 setObject:v8 forKeyedSubscript:@"expandable"];

  v9 = [NSNumber numberWithBool:self->_expanded];
  [v3 setObject:v9 forKeyedSubscript:@"isExpanded"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXSearchResultsSection visibleCount](self, "visibleCount"));
  [v3 setObject:v10 forKeyedSubscript:@"visibleCount"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXSearchResultsSection totalCount](self, "totalCount"));
  [v3 setObject:v11 forKeyedSubscript:@"totalCount"];

  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = [(PXSearchResultsSection *)self searchResults];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v20 + 1) + 8 * i) debugDictionary];
        if (v18) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  [v3 setObject:v12 forKeyedSubscript:@"searchResults"];
  return (NSDictionary *)v3;
}

- (unint64_t)totalCount
{
  v2 = [(PXSearchResultsSection *)self mutableSearchResults];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)visibleCount
{
  unint64_t v3 = [(PXSearchResultsSection *)self mutableSearchResults];
  unint64_t v4 = [v3 count];

  unint64_t v5 = [(PXSearchResultsSection *)self maxVisibleItemsInCollapsedSection];
  BOOL v6 = [(PXSearchResultsSection *)self isExpanded];
  if (v4 >= v5) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v6) {
    return v4;
  }
  else {
    return v7;
  }
}

- (BOOL)isExpandable
{
  unint64_t v3 = [(PXSearchResultsSection *)self maxVisibleItemsInCollapsedSection];
  unint64_t v4 = [(PXSearchResultsSection *)self mutableSearchResults];
  LOBYTE(v3) = [v4 count] > v3;

  return v3;
}

- (void)removeSearchResult:(id)a3
{
  id v11 = a3;
  if ([v11 itemType] == 2)
  {
    unint64_t v4 = [v11 assetUUIDs];
    id v5 = [v4 lastObject];
LABEL_5:
    unint64_t v7 = v5;
    goto LABEL_7;
  }
  BOOL v6 = [v11 collectionUUID];
  if (v6)
  {
    id v5 = v6;
    unint64_t v4 = v5;
    goto LABEL_5;
  }
  v8 = [v11 assetUUIDs];
  unint64_t v7 = [v8 lastObject];

  unint64_t v4 = 0;
LABEL_7:

  if ([v7 length])
  {
    v9 = [(PXSearchResultsSection *)self mutableSearchResultUUIDs];
    [v9 removeObject:v7];

    v10 = [(PXSearchResultsSection *)self mutableSearchResults];
    [v10 removeObject:v11];
  }
}

- (void)addSearchResult:(id)a3
{
  id v13 = a3;
  if ([v13 itemType] == 2)
  {
    unint64_t v4 = [v13 assetUUIDs];
    id v5 = [v4 lastObject];
  }
  else
  {
    BOOL v6 = [v13 collectionUUID];
    if (!v6)
    {
      v8 = [v13 assetUUIDs];
      unint64_t v7 = [v8 lastObject];

      unint64_t v4 = 0;
      goto LABEL_7;
    }
    id v5 = v6;
    unint64_t v4 = v5;
  }
  unint64_t v7 = v5;
LABEL_7:

  if ([v7 length])
  {
    v9 = [(PXSearchResultsSection *)self mutableSearchResultUUIDs];
    char v10 = [v9 containsObject:v7];

    if ((v10 & 1) == 0)
    {
      id v11 = [(PXSearchResultsSection *)self mutableSearchResults];
      [v11 addObject:v13];

      v12 = [(PXSearchResultsSection *)self mutableSearchResultUUIDs];
      [v12 addObject:v7];

      [(PXSearchResultsSection *)self setSorted:0];
    }
  }
}

- (NSArray)searchResults
{
  if (![(PXSearchResultsSection *)self isSorted] && [(NSArray *)self->_sortDescriptors count])
  {
    unint64_t v3 = [(PXSearchResultsSection *)self mutableSearchResults];
    [v3 sortUsingDescriptors:self->_sortDescriptors];

    [(PXSearchResultsSection *)self setSorted:1];
  }
  unint64_t v4 = [(PXSearchResultsSection *)self mutableSearchResults];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (unint64_t)maxVisibleItemsInCollapsedSection
{
  return 3;
}

- (PXSearchResultsSection)initWithTitle:(id)a3 withSectionType:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchResultsSection;
  unint64_t v7 = [(PXSearchResultsSection *)&v15 init];
  if (!a4) {
    PXAssertGetLog();
  }
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_sectionType = a4;
    uint64_t v10 = objc_opt_new();
    mutableSearchResults = v7->_mutableSearchResults;
    v7->_mutableSearchResults = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    mutableSearchResultUUIDs = v7->_mutableSearchResultUUIDs;
    v7->_mutableSearchResultUUIDs = (NSMutableSet *)v12;
  }
  return v7;
}

- (PXSearchResultsSection)init
{
  unint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSearchResultsSection.m", 312, @"%s is not available as initializer", "-[PXSearchResultsSection init]");

  abort();
}

+ (unint64_t)_sectionTypeForCategory:(unint64_t)a3
{
  unint64_t result = 16;
  if ((uint64_t)a3 <= 1599)
  {
    if ((uint64_t)a3 > 1299)
    {
      if ((uint64_t)a3 > 1399)
      {
        if (a3 - 1500 <= 0x29 && ((1 << (a3 + 36)) & 0x300C0300C03) != 0) {
          return 7;
        }
        unint64_t v4 = 6;
        unint64_t v5 = 15;
        if (a3 != 1401) {
          unint64_t v5 = 16;
        }
        BOOL v7 = a3 == 1400;
        goto LABEL_59;
      }
      if ((uint64_t)a3 <= 1319)
      {
        if (a3 - 1300 < 2) {
          return 2;
        }
        if (a3 == 1310) {
          return 0;
        }
      }
      else
      {
        unint64_t v9 = 3;
        if (a3 - 1330 >= 2) {
          unint64_t v9 = 16;
        }
        if (a3 - 1320 >= 2) {
          return v9;
        }
        else {
          return 4;
        }
      }
    }
    else
    {
      if ((uint64_t)a3 <= 1099)
      {
        if ((uint64_t)a3 > 1002)
        {
          if (a3 - 1003 >= 4) {
            return result;
          }
          return 0;
        }
        if (!a3) {
          return 0;
        }
        unint64_t v4 = 11;
        unint64_t v5 = 18;
        if (a3 != 1001) {
          unint64_t v5 = 16;
        }
        BOOL v7 = a3 == 1000;
        goto LABEL_59;
      }
      if (a3 - 1100 <= 7)
      {
        if (a3 != 1103) {
          return 8;
        }
        return 0;
      }
      switch(a3)
      {
        case 0x4B0uLL:
          unint64_t result = 12;
          break;
        case 0x4B1uLL:
          unint64_t result = 17;
          break;
        case 0x4B2uLL:
          unint64_t result = 9;
          break;
        case 0x4B3uLL:
        case 0x4B4uLL:
        case 0x4B5uLL:
          unint64_t result = 10;
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    if ((uint64_t)a3 <= 1999)
    {
      if ((uint64_t)a3 > 1899)
      {
        if (a3 - 1900 < 0x14) {
          return 14;
        }
        return result;
      }
      if ((a3 - 1600 > 0xB || ((1 << (a3 - 64)) & 0xC03) == 0) && a3 - 1800 >= 4)
      {
        unint64_t v8 = a3 - 1700;
LABEL_40:
        if (v8 >= 2) {
          return result;
        }
      }
      return 0;
    }
    if ((uint64_t)a3 > 2499)
    {
      if ((uint64_t)a3 <= 2699)
      {
        if (a3 - 2500 < 2) {
          return 0;
        }
        unint64_t v8 = a3 - 2600;
        goto LABEL_40;
      }
      if (a3 == 2700 || a3 == 2800) {
        return 0;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 2299)
      {
        unint64_t v4 = 6;
        unint64_t v5 = 20;
        uint64_t v6 = 13;
        if (a3 != 2200) {
          uint64_t v6 = 16;
        }
        if (a3 != 2100) {
          unint64_t v5 = v6;
        }
        BOOL v7 = a3 == 2000;
LABEL_59:
        if (v7) {
          return v4;
        }
        else {
          return v5;
        }
      }
      if (a3 - 2400 < 2) {
        return 19;
      }
      if (a3 == 2300) {
        return 0;
      }
    }
  }
  return result;
}

+ (unint64_t)sectionTypeForCategoryMask:(unint64_t)a3 isMomentSection:(BOOL)a4 isTopAssetSection:(BOOL)a5
{
  if (a5) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = 5;
  }
  if (!a4 && !a5)
  {
    switch(a3)
    {
      case 0x100uLL:
        return 6;
      case 0x8000000uLL:
        return 21;
      case 0x1000uLL:
        return 15;
      default:
        BOOL v7 = PLSearchIndexCategoriesForCategoryMask();
        uint64_t v10 = 0;
        id v11 = &v10;
        uint64_t v12 = 0x2020000000;
        uint64_t v13 = 0;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __87__PXSearchResultsSection_sectionTypeForCategoryMask_isMomentSection_isTopAssetSection___block_invoke;
        v9[3] = &unk_1E5DB6098;
        v9[4] = &v10;
        v9[5] = a1;
        [v7 enumerateIndexesUsingBlock:v9];
        unint64_t v5 = v11[3];
        _Block_object_dispose(&v10, 8);

        break;
    }
  }
  return v5;
}

uint64_t __87__PXSearchResultsSection_sectionTypeForCategoryMask_isMomentSection_isTopAssetSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 40) _sectionTypeForCategory:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)_stringForCategory:(unint64_t)a3
{
  unint64_t v3 = 0;
  if ((uint64_t)a3 > 1399)
  {
    if ((uint64_t)a3 <= 1899)
    {
      if (a3 - 1500 <= 0x29 && ((1 << (a3 + 36)) & 0x300C0300C03) != 0)
      {
        unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_SCENE";
        goto LABEL_41;
      }
      if (a3 != 1400)
      {
        if (a3 != 1401) {
          goto LABEL_42;
        }
        unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_MEMORIES";
        goto LABEL_41;
      }
    }
    else
    {
      if ((uint64_t)a3 > 2099)
      {
        if (a3 - 2400 >= 2)
        {
          if (a3 == 2100)
          {
            unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_FILENAME";
          }
          else
          {
            if (a3 != 2200) {
              goto LABEL_42;
            }
            unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_SAVED_FROM_APP";
          }
          goto LABEL_41;
        }
        uint64_t v6 = @"PXSharedLibrary_SearchResultSectionTitle_Library";
        goto LABEL_34;
      }
      if (a3 - 1900 < 0x14)
      {
        unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_MEDIA_TYPES";
        goto LABEL_41;
      }
      if (a3 != 2000) {
        goto LABEL_42;
      }
    }
    unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_ALBUMS";
    goto LABEL_41;
  }
  if ((uint64_t)a3 > 1099)
  {
    if (a3 - 1100 < 8)
    {
      unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_DATES";
      goto LABEL_41;
    }
    if (a3 - 1100 <= 8)
    {
      switch(a3)
      {
        case 0x4B0uLL:
          unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_KEYWORDS";
          break;
        case 0x4B1uLL:
          unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_TITLES";
          break;
        case 0x4B2uLL:
          unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_DESCRIPTIONS";
          break;
        case 0x4B3uLL:
        case 0x4B4uLL:
        case 0x4B5uLL:
          unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_OCR_TEXT";
          break;
        default:
          JUMPOUT(0);
      }
      goto LABEL_41;
    }
    char v4 = a3 - 20;
    if (a3 - 1300 > 0x1F) {
      goto LABEL_42;
    }
    if (((1 << v4) & 3) != 0)
    {
      unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_PEOPLE";
LABEL_41:
      unint64_t v3 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
      goto LABEL_42;
    }
    if (((1 << v4) & 0x300000) == 0)
    {
      if (((1 << v4) & 0xC0000000) == 0) {
        goto LABEL_42;
      }
      unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_PETS";
      goto LABEL_41;
    }
    uint64_t v6 = @"PXSharedLibrary_SearchResultSectionTitle_SharedBy";
LABEL_34:
    unint64_t v3 = PXLocalizedSharedLibraryString(v6);
    goto LABEL_42;
  }
  if (a3 - 1 < 0xE || a3 - 1000 < 3)
  {
    unint64_t v5 = @"SEARCH_RESULT_SECTION_HEADER_PLACES";
    goto LABEL_41;
  }
LABEL_42:
  return v3;
}

+ (id)sectionTitleForCategoryMask:(unint64_t)a3
{
  unint64_t v5 = PLSearchIndexCategoriesForCategoryMask();
  uint64_t v6 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PXSearchResultsSection_sectionTitleForCategoryMask___block_invoke;
  v12[3] = &unk_1E5DB6070;
  id v14 = a1;
  SEL v15 = a2;
  id v13 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:v12];
  unint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_71026];
  unint64_t v9 = PXLocalizedStringFromTable(@"SEARCH_CATEGORY_DELIMITER", @"PhotosUICore");
  uint64_t v10 = [v8 componentsJoinedByString:v9];

  return v10;
}

void __54__PXSearchResultsSection_sectionTitleForCategoryMask___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [*(id *)(a1 + 40) _stringForCategory:a2];
  if (![v3 length]) {
    PXAssertGetLog();
  }
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __54__PXSearchResultsSection_sectionTitleForCategoryMask___block_invoke_191(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

@end