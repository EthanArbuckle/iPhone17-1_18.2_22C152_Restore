@interface SFCollectionStyleRow(SearchUICollectionModel)
- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:;
@end

@implementation SFCollectionStyleRow(SearchUICollectionModel)

- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[SearchUISectionModel sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:", v10, [a1 drawPlattersIfNecessary], v9, v8);

  return v11;
}

@end