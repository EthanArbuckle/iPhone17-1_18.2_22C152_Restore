@interface WFDesktopFileLocation
+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5;
+ (id)subpathFromURL:(id)a3 item:(id)a4;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFDesktopFileLocation

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v4 = a3;
  v5 = +[WFFileLocationUtilities desktopDirectory];
  v6 = objc_msgSend(v4, "wf_relativePathFromURL:", v5);

  return v6;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  if (!a4) {
    return 0;
  }
  v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a5;
  id v9 = a3;
  v10 = [v7 arrayWithObject:a4];
  v11 = [v10 arrayByAddingObjectsFromArray:v8];

  LOBYTE(v10) = +[WFFileLocationUtilities isFileURL:v9 withParentItems:v11 insideFolderType:0];
  return (char)v10;
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
    char v6 = +[WFFileLocationUtilities desktopDirectory];
    v7 = [(WFFileLocation *)self relativeSubpath];
    id v8 = [v6 URLByAppendingPathComponent:v7];

    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      id v9 = [(WFFileProviderLocation *)self fileProviderDomainID];
      v10 = [(WFFileLocation *)self relativeSubpath];
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