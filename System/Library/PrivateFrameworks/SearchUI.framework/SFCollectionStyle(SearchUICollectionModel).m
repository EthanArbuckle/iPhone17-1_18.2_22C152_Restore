@interface SFCollectionStyle(SearchUICollectionModel)
- (SearchUISectionModel)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:;
@end

@implementation SFCollectionStyle(SearchUICollectionModel)

- (SearchUISectionModel)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  return +[SearchUISectionModel sectionModelWithRows:a3 drawPlattersIfNecessary:1 section:a4 expandedCollectionSections:a5];
}

@end