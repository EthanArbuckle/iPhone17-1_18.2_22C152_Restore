@interface WFDocumentFileLocation
+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5;
+ (id)subpathFromURL:(id)a3 item:(id)a4;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFDocumentFileLocation

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v4 = a3;
  v5 = +[WFFileLocationUtilities documentsDirectory];
  v6 = objc_msgSend(v4, "wf_relativePathFromURL:", v5);

  return v6;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  id v15 = a4;
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 arrayWithObjects:&v15 count:1];
  v12 = objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v8, v15, v16);

  BOOL v13 = +[WFFileLocationUtilities isFileURL:v10 withParentItems:v12 insideFolderType:1];
  return v13;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 isUbiquitousItemAtURL:v4];

  return v6 ^ 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  id v4 = [(WFFileProviderLocation *)self resolveCrossDeviceItemIDWithError:a3];
  if (objc_msgSend(v4, "wf_fileExists"))
  {
    id v5 = v4;
  }
  else
  {
    char v6 = +[WFFileLocationUtilities documentsDirectory];
    v7 = [(WFFileLocation *)self relativeSubpath];
    id v8 = [v6 URLByAppendingPathComponent:v7];

    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      id v9 = [(WFFileProviderLocation *)self fileProviderDomainID];
      id v10 = [(WFFileLocation *)self relativeSubpath];
      id v5 = +[WFiCloudFileLocation resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:v9 relativeSubpath:v10];
    }
  }

  return v5;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

@end