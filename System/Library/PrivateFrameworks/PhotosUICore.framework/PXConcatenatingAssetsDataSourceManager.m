@interface PXConcatenatingAssetsDataSourceManager
- (PXConcatenatingAssetsDataSourceManager)init;
- (PXConcatenatingAssetsDataSourceManager)initWithDataSourceManagers:(id)a3;
- (id)createInitialDataSource;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXConcatenatingAssetsDataSourceManager

- (PXConcatenatingAssetsDataSourceManager)initWithDataSourceManagers:(id)a3
{
  sub_1A9B21070(0, (unint64_t *)&unk_1E983D9B0);
  uint64_t v3 = sub_1AB23AADC();
  ConcatenatingAssetsDataSourceManager.init(dataSourceManagers:)(v3);
}

- (id)createInitialDataSource
{
  v2 = self;
  id v3 = sub_1AA957BD4();

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if (a4)
  {
    id v7 = a3;
    v8 = self;
    id v9 = sub_1AA957BD4();
    [(PXSectionedDataSourceManager *)v8 setDataSource:v9 changeDetails:0];
  }
}

- (PXConcatenatingAssetsDataSourceManager)init
{
  result = (PXConcatenatingAssetsDataSourceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end