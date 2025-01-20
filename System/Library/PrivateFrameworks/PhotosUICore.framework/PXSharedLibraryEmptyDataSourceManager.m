@interface PXSharedLibraryEmptyDataSourceManager
- (id)createInitialDataSource;
- (id)fetchExiting;
- (id)fetchPreview;
- (id)fetchSharedLibrary;
- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation PXSharedLibraryEmptyDataSourceManager

- (id)fetchExiting
{
  return 0;
}

- (id)fetchSharedLibrary
{
  return 0;
}

- (id)fetchPreview
{
  return 0;
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 237, @"Invalid parameter not satisfying: %@", @"shareURL" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 238, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1002, @"Failed to fetch shared library for URL in the PXSharedLibraryEmptyDataSourceManager");
  v7[2](v7, 0, v8);
}

- (id)createInitialDataSource
{
  v2 = objc_alloc_init(PXSharedLibraryEmptyDataSource);
  return v2;
}

@end