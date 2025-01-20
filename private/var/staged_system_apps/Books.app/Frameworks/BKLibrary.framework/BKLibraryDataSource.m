@interface BKLibraryDataSource
- (BKLibraryManager)libraryManager;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSString)identifier;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetsWithCompletion:(id)a3;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setIdentifier:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setRank:(int64_t)a3;
@end

@implementation BKLibraryDataSource

- (int64_t)coverSourceRank
{
  return 0;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v3 = a3;
  +[NSException raise:NSInvalidArgumentException format:@"This is an abstract class. Don't call this method"];
  id v5 = +[NSError errorWithDomain:@"kBKLibraryDataSourceDomain" code:kBKLibraryDataSourceErrorAbstractMethodError userInfo:0];
  v4 = (void (**)(id, void, id))objc_retainBlock(v3);

  if (v4) {
    v4[2](v4, 0, v5);
  }
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void, void *))objc_retainBlock(a4);
  if (v5)
  {
    v4 = +[NSError errorWithDomain:@"kBKLibraryDataSourceDomain" code:kBKLibraryDataSourceErrorAbstractMethodError userInfo:0];
    v5[2](v5, 0, v4);
  }
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v6 = objc_retainBlock(a5);
  if (v6)
  {
    id v5 = +[NSError errorWithDomain:@"kBKLibraryDataSourceDomain" code:kBKLibraryDataSourceErrorAbstractMethodError userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v5);
  }
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v6 = (void (**)(id, void, void *))objc_retainBlock(a5);
  if (v6)
  {
    id v5 = +[NSError errorWithDomain:@"kBKLibraryDataSourceDomain" code:kBKLibraryDataSourceErrorAbstractMethodError userInfo:0];
    v6[2](v6, 0, v5);
  }
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end