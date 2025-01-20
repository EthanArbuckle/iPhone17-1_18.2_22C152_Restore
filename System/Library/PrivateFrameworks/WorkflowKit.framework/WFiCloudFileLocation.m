@interface WFiCloudFileLocation
+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5;
+ (id)resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:(id)a3 relativeSubpath:(id)a4;
+ (id)subpathFromURL:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFiCloudFileLocation

+ (id)resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:(id)a3 relativeSubpath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v8 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  if (v7 == @"com.apple.CloudDocs.MobileDocumentsFileProvider") {
    goto LABEL_11;
  }
  if (!v7)
  {

    v23 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
    v24 = @"com.apple.CloudDocs.MobileDocumentsFileProviderManaged";

    v19 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
    v25 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
    v22 = 0;
    goto LABEL_20;
  }
  char v9 = [(__CFString *)v7 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

  if (v9)
  {
LABEL_12:
    v20 = +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    v21 = v20;
    if (v20)
    {
      v19 = [v20 URLByAppendingPathComponent:v6];
      if ([(__CFString *)v19 wf_fileExists]) {
        goto LABEL_14;
      }
    }
    v26 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
    goto LABEL_18;
  }
  v10 = v7;
  v11 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  if (v10 == @"com.apple.CloudDocs.iCloudDriveFileProvider")
  {
LABEL_11:

    goto LABEL_12;
  }
  char v12 = [(__CFString *)v10 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"];

  if (v12) {
    goto LABEL_12;
  }
  v13 = v10;
  v14 = @"com.apple.CloudDocs.MobileDocumentsFileProviderManaged";
  if (v13 == @"com.apple.CloudDocs.MobileDocumentsFileProviderManaged") {
    goto LABEL_26;
  }
  char v15 = [(__CFString *)v13 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

  if (v15) {
    goto LABEL_27;
  }
  v16 = v13;
  v17 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  if (v16 == @"com.apple.CloudDocs.iCloudDriveFileProviderManaged")
  {
LABEL_26:
  }
  else
  {
    char v18 = [(__CFString *)v16 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];

    if ((v18 & 1) == 0)
    {
      v19 = 0;
      goto LABEL_23;
    }
  }
LABEL_27:
  v28 = +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
  v21 = v28;
  if (v28)
  {
    v19 = [v28 URLByAppendingPathComponent:v6];
    if (([(__CFString *)v19 wf_fileExists] & 1) == 0)
    {

      goto LABEL_30;
    }
LABEL_14:
    v22 = v21;
    goto LABEL_22;
  }
LABEL_30:
  v26 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
LABEL_18:
  v22 = +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:v26];

  if (!v22)
  {
LABEL_21:
    v19 = 0;
    goto LABEL_22;
  }
  v19 = [v22 URLByAppendingPathComponent:v6];
  if (([(__CFString *)v19 wf_fileExists] & 1) == 0)
  {
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:

LABEL_23:
  return v19;
}

+ (id)subpathFromURL:(id)a3
{
  id v3 = a3;
  v4 = +[WFFileLocationUtilities mobileDocumentsDirectory];
  id v5 = objc_msgSend(v3, "wf_relativePathFromURL:", v4);

  return v5;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = getWFFilesLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 providerDomainID];
    v8 = [v5 providerID];
    int v15 = 136315650;
    v16 = "+[WFiCloudFileLocation canRepresentURL:item:parentItems:]";
    __int16 v17 = 2112;
    char v18 = v7;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Evaluating item with provider domain id: %@ && provider id %@", (uint8_t *)&v15, 0x20u);
  }
  char v9 = WFPossibleMobileDocumentsFileProviderDomainIDs();
  v10 = [v5 providerDomainID];
  if ([v9 containsObject:v10])
  {
    char v11 = 1;
  }
  else
  {
    char v12 = WFPossibleMobileDocumentsFileProviderDomainIDs();
    v13 = [v5 providerID];
    char v11 = [v12 containsObject:v13];
  }
  return v11;
}

- (id)resolveLocationWithError:(id *)a3
{
  v4 = [(WFFileProviderLocation *)self resolveCrossDeviceItemIDWithError:a3];
  if (!v4)
  {
    id v5 = +[WFFileLocationUtilities mobileDocumentsDirectory];
    id v6 = [(WFFileLocation *)self relativeSubpath];
    v4 = [v5 URLByAppendingPathComponent:v6];

    if (!v4)
    {
      v7 = objc_opt_class();
      v8 = [(WFFileProviderLocation *)self fileProviderDomainID];
      char v9 = [(WFFileLocation *)self relativeSubpath];
      v4 = [v7 resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:v8 relativeSubpath:v9];
    }
  }
  return v4;
}

@end