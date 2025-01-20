@interface PUTilingDataSourceConverter
- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6;
@end

@implementation PUTilingDataSourceConverter

- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6
{
  id v6 = *a3;
  v7 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
  LOBYTE(v6) = [v6 isEqual:v7];

  return (char)v6;
}

@end