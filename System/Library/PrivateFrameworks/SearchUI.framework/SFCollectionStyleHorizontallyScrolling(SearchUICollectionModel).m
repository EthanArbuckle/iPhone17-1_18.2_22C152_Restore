@interface SFCollectionStyleHorizontallyScrolling(SearchUICollectionModel)
- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:;
@end

@implementation SFCollectionStyleHorizontallyScrolling(SearchUICollectionModel)

- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[SearchUISectionModel sectionModelWithScrollingRowModels:numberOfRows:section:](SearchUISectionModel, "sectionModelWithScrollingRowModels:numberOfRows:section:", v7, (int)[a1 numberOfRows], v6);

  v9 = [v8 rowModels];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = v8;
  }
  else
  {
    v12 = SearchUIGeneralLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[SFCollectionStyleHorizontallyScrolling(SearchUICollectionModel) searchUISectionModelForCardRowModels:section:expandedCollectionSections:](v6, v12);
    }

    id v11 = 0;
  }

  return v11;
}

- (void)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [a1 collectionSection];
  v4 = [v3 title];
  v5 = [v4 text];
  int v6 = 138412290;
  id v7 = v5;
  _os_log_fault_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_FAULT, "failed to generate scrollable card section for %@", (uint8_t *)&v6, 0xCu);
}

@end