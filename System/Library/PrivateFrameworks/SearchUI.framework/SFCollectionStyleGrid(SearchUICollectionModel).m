@interface SFCollectionStyleGrid(SearchUICollectionModel)
- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:;
@end

@implementation SFCollectionStyleGrid(SearchUICollectionModel)

- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[SearchUISectionModel sectionModelWithGridRowModels:numberOfColumns:gridStyle:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithGridRowModels:numberOfColumns:gridStyle:section:expandedCollectionSections:", v10, (int)[a1 numberOfColumns], objc_msgSend(a1, "gridStyle"), v9, v8);

  return v11;
}

@end