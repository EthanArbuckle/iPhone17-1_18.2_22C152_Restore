@interface NTKKaleidoscopeResourcesManifest
- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4;
- (unint64_t)maxCompatibleVersion;
- (unint64_t)maxNumberOfPhotos;
- (unint64_t)minCompatibleVersion;
@end

@implementation NTKKaleidoscopeResourcesManifest

- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"localIdentifier"];
  if (!v6
    || (v7 = (void *)v6,
        [v5 objectForKeyedSubscript:@"localIdentifier"],
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) == 0))
  {
    v18 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v20 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
    v21 = [v20 lastPathComponent];
    v22 = [v5 objectForKeyedSubscript:@"localIdentifier"];
    int v25 = 138412546;
    v26 = v21;
    __int16 v27 = 2112;
    v28 = v22;
    _os_log_error_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid image list item identifier: %@", (uint8_t *)&v25, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
    v12 = [v11 lastPathComponent];
    v13 = [v5 objectForKeyedSubscript:@"localIdentifier"];
    int v25 = 138412546;
    v26 = v12;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: validating image list item: %@", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:@"imageURL"];
  if (!v14
    || (v15 = (void *)v14,
        [v5 objectForKeyedSubscript:@"imageURL"],
        v16 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v17 = objc_opt_isKindOfClass(),
        v16,
        v15,
        (v17 & 1) == 0))
  {
    v18 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v20 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
    v21 = [v20 lastPathComponent];
    v23 = [v5 objectForKeyedSubscript:@"imageURL"];
    int v25 = 138412802;
    v26 = v21;
    __int16 v27 = 2112;
    v28 = v23;
    __int16 v29 = 2112;
    v30 = @"imageURL";
    _os_log_error_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", (uint8_t *)&v25, 0x20u);

    goto LABEL_13;
  }
  v18 = [v5 objectForKeyedSubscript:@"imageURL"];
  if (![(NTKBasePhotoResourcesManifest *)self resourceWithName:v18 isValidMediaAssetOfType:&unk_1F16E9CA0 withMinFileSize:1000 maxFileSize:2000000])
  {
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  BOOL v19 = [(NTKBasePhotoResourcesManifest *)self resourceWithNameIsValidImage:v18];
LABEL_15:

  return v19;
}

- (unint64_t)minCompatibleVersion
{
  return 1;
}

- (unint64_t)maxCompatibleVersion
{
  return 1;
}

- (unint64_t)maxNumberOfPhotos
{
  return 1;
}

@end