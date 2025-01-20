@interface WFDownloadsFileLocation
+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5;
+ (id)subpathFromURL:(id)a3 item:(id)a4;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFDownloadsFileLocation

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
  v11.receiver = self;
  v11.super_class = (Class)WFDownloadsFileLocation;
  id v4 = [(WFFileProviderLocation *)&v11 resolveCrossDeviceItemIDWithError:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = +[WFFileLocationUtilities iCloudDownloadsDirectory];
    v8 = [(WFFileLocation *)self relativeSubpath];
    id v6 = [v7 URLByAppendingPathComponent:v8];

    if (v6) {
      id v9 = v6;
    }
  }
  return v6;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v4 = a3;
  v5 = +[WFFileLocationUtilities downloadsDirectory];
  id v6 = objc_msgSend(v4, "wf_relativePathFromURL:", v5);

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
  objc_super v11 = [v10 arrayByAddingObjectsFromArray:v8];

  LOBYTE(v10) = +[WFFileLocationUtilities isFileURL:v9 withParentItems:v11 insideFolderType:2];
  return (char)v10;
}

@end