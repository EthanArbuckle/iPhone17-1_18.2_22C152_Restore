@interface BKLibraryImportMigratedBooksOperation
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKLibraryImportMigratedBooksOperation)initWithLibraryAssetProvider:(id)a3;
- (void)main;
- (void)setLibraryAssetProvider:(id)a3;
@end

@implementation BKLibraryImportMigratedBooksOperation

- (BKLibraryImportMigratedBooksOperation)initWithLibraryAssetProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryImportMigratedBooksOperation;
  v6 = [(BKLibraryImportMigratedBooksOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_libraryAssetProvider, a3);
  }

  return v7;
}

- (void)main
{
  v3 = +[NSURL bu_booksRepositoryURL];
  v4 = [v3 URLByAppendingPathComponent:@"Migrated" isDirectory:1];

  id v5 = +[NSFileManager defaultManager];
  v6 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
      if ([(BKLibraryImportMigratedBooksOperation *)self isCancelled]) {
        break;
      }
      v13 = [(BKLibraryImportMigratedBooksOperation *)self libraryAssetProvider];
      [v13 importURL:v12 openInPlace:0 options:0 completion:0];

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return self->_libraryAssetProvider;
}

- (void)setLibraryAssetProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end