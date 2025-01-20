@interface PLPrimaryResourceDataStoreKeyHelper
- (PLPrimaryResourceDataStoreKeyHelper)initWithPathManager:(id)a3;
- (void)dealloc;
@end

@implementation PLPrimaryResourceDataStoreKeyHelper

- (PLPrimaryResourceDataStoreKeyHelper)initWithPathManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLPrimaryResourceDataStoreKeyHelper;
  v6 = [(PLPrimaryResourceDataStoreKeyHelper *)&v19 init];
  if (v6)
  {
    if (!v5)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v6, @"PLPrimaryResourceDataStore.m", 187, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
    }
    v7 = [v5 photoDirectoryWithType:1];
    v8 = [v5 photoDirectoryWithType:9];
    v9 = [v5 photoDirectoryWithType:10];
    v10 = [v5 photoDirectoryWithType:12];
    v11 = [v5 photoDirectoryWithType:18];
    v12 = [v5 photoDirectoryWithType:4];
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v7, &v6->bundleBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v12, &v6->originalsBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v8, &v6->rendersBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v9, &v6->derivativesBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v10, &v6->masterThumbsBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v11, &v6->computeBaseData);
    id v13 = +[PLThumbnailManager masterThumbFilename];
    v14 = (const char *)[v13 UTF8String];

    size_t v15 = strlen(v14);
    v16 = (char *)malloc_type_calloc(v15 + 1, 1uLL, 0x716AB79uLL);
    v6->masterThumbFilenameData = v16;
    strcpy(v16, v14);
  }
  return v6;
}

char *__59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(void *a1, char **a2)
{
  v3 = (const char *)[a1 UTF8String];
  size_t v4 = strlen(v3);
  id v5 = (char *)malloc_type_calloc(v4 + 1, 1uLL, 0x45D3FD29uLL);
  *a2 = v5;
  return strcpy(v5, v3);
}

- (void)dealloc
{
  free(self->originalsBaseData);
  self->originalsBaseData = 0;
  free(self->rendersBaseData);
  self->rendersBaseData = 0;
  free(self->derivativesBaseData);
  self->derivativesBaseData = 0;
  free(self->masterThumbsBaseData);
  self->masterThumbsBaseData = 0;
  free(self->computeBaseData);
  self->computeBaseData = 0;
  free(self->masterThumbFilenameData);
  self->masterThumbFilenameData = 0;
  free(self->bundleBaseData);
  self->bundleBaseData = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLPrimaryResourceDataStoreKeyHelper;
  [(PLPrimaryResourceDataStoreKeyHelper *)&v3 dealloc];
}

@end