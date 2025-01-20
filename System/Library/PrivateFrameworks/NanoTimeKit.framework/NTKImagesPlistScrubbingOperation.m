@interface NTKImagesPlistScrubbingOperation
- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5;
- (id)supportedExtensions;
@end

@implementation NTKImagesPlistScrubbingOperation

- (id)supportedExtensions
{
  return &unk_1F16EA0D8;
}

- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 URLByDeletingLastPathComponent];
  v10 = [v9 path];
  v11 = +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:v10];

  if (!v11)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.resourceDirectory" code:2003 userInfo:0];
      char v28 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v28 = 0;
    }
    goto LABEL_26;
  }
  v32 = v11;
  v12 = [v11 imageList];
  v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v14)
  {

    goto LABEL_22;
  }
  uint64_t v15 = v14;
  v31 = a5;
  char v16 = 0;
  uint64_t v17 = *(void *)v35;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
      v20 = [v19 objectForKeyedSubscript:@"upAnalysis"];
      if (v20)
      {

LABEL_10:
        v22 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v19];
        [v22 removeObjectForKey:@"upAnalysis"];
        [v22 removeObjectForKey:@"downAnalysis"];
        [v33 addObject:v22];

        char v16 = 1;
        goto LABEL_11;
      }
      v21 = [v19 objectForKeyedSubscript:@"downAnalysis"];

      if (v21) {
        goto LABEL_10;
      }
      [v33 addObject:v19];
LABEL_11:
      ++v18;
    }
    while (v15 != v18);
    uint64_t v23 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
    uint64_t v15 = v23;
  }
  while (v23);

  a5 = v31;
  if (v16)
  {
    v24 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v7;
      _os_log_impl(&dword_1BC5A9000, v24, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Extra analysis data found in plist: '%@'. Will scrub.", buf, 0xCu);
    }

    v11 = v32;
    v25 = [v32 assetCollectionIdentifier];
    v26 = [v8 URLByDeletingLastPathComponent];
    v27 = [v26 path];
    char v28 = NTKPhotosWriteImageListForAssetCollection(v33, v25, v27);

    goto LABEL_25;
  }
LABEL_22:
  v29 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v7;
    _os_log_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Extra analysis data not found in plist: '%@'. Passing through", buf, 0xCu);
  }

  v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v28 = [v25 copyItemAtURL:v7 toURL:v8 error:a5];
  v11 = v32;
LABEL_25:

LABEL_26:
  return v28;
}

@end