@interface PUFilmstripDataSourceConverter
- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6;
@end

@implementation PUFilmstripDataSourceConverter

- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([*a4 isEqualToString:@"PUTileKindItemContentFilmStripIndicator"])
  {
    v11 = [v10 indicatorInfos];
    unint64_t v12 = [v11 count];
    BOOL v13 = v12 >= [*a3 indexAtPosition:0];
  }
  else
  {
    uint64_t v14 = [v9 numberOfIndexes];
    BOOL v13 = v14 == [v10 numberOfIndexes];
  }

  return v13;
}

@end