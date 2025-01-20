@interface PBUIMagicWallpaperEnsure
@end

@implementation PBUIMagicWallpaperEnsure

void ___PBUIMagicWallpaperEnsure_block_invoke()
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)__identifierClassMap;
  __identifierClassMap = (uint64_t)v0;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (![v2 count]) {
    goto LABEL_47;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = MEMORY[0x1C1872020]();
  v49 = v2;
  v5 = [v2 objectAtIndex:0];
  v6 = [v5 stringByAppendingPathComponent:@"ProceduralWallpaper"];
  uint64_t v7 = [v4 stringByAppendingPathComponent:v6];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [v8 contentsOfDirectoryAtPath:v7 error:0];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v70 count:16];
  v53 = (void *)v7;
  if (!v10) {
    goto LABEL_35;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v62;
  uint64_t v50 = *(void *)v62;
  v51 = v9;
  do
  {
    uint64_t v13 = 0;
    uint64_t v54 = v11;
    do
    {
      if (*(void *)v62 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
      v15 = [v14 pathExtension];
      uint64_t v16 = [v15 caseInsensitiveCompare:@"bundle"];

      if (!v16)
      {
        uint64_t v55 = v13;
        v17 = [v53 stringByAppendingPathComponent:v14];
        v18 = [MEMORY[0x1E4F28B50] bundleWithPath:v17];
        v19 = v18;
        if (v18)
        {
          if ([v18 load])
          {
            v52 = v17;
            v20 = [v19 objectForInfoDictionaryKey:@"SBProceduralWallpaperClassNames"];
            v21 = v20;
            if (v20)
            {
              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v69 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v58;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v58 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                    v27 = (void *)[v19 classNamed:v26];
                    if (v27)
                    {
                      v28 = v27;
                      v29 = PBUIMagicWallpaperDictionariesForClass(v27, v19);
                      [v3 addObjectsFromArray:v29];

                      v30 = (void *)__identifierClassMap;
                      v31 = [v28 identifier];
                      [v30 setObject:v28 forKey:v31];
                    }
                    else
                    {
                      v31 = PBUILogCommon();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        v74 = v26;
                        _os_log_error_impl(&dword_1BC4B3000, v31, OS_LOG_TYPE_ERROR, "Unable to load wallpaper class %{public}@, class does not exist in bundle", buf, 0xCu);
                      }
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v69 count:16];
                }
                while (v23);
                uint64_t v12 = v50;
                v9 = v51;
              }
            }
            else
            {
              v34 = PBUILogCommon();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v74 = v52;
                _os_log_error_impl(&dword_1BC4B3000, v34, OS_LOG_TYPE_ERROR, "Unable to load wallpaper plugin, no defined wallpaper class names - %{public}@", buf, 0xCu);
              }

              [v19 unload];
            }
            v17 = v52;
            goto LABEL_32;
          }
          v21 = PBUILogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v17;
            v32 = v21;
            v33 = "Unable to load wallpaper plugin, bundle load failure - %{public}@";
LABEL_27:
            _os_log_error_impl(&dword_1BC4B3000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
          }
        }
        else
        {
          v21 = PBUILogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v17;
            v32 = v21;
            v33 = "Unable to load wallpaper plugin, path is not a bundle - %{public}@";
            goto LABEL_27;
          }
        }
LABEL_32:

        uint64_t v11 = v54;
        uint64_t v13 = v55;
      }
      ++v13;
    }
    while (v13 != v11);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v61 objects:v70 count:16];
  }
  while (v11);
LABEL_35:

  id v35 = v3;
  v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v38 = v35;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v65 objects:buf count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v66 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        v44 = [v43 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];
        char v45 = [v44 isEqualToString:@"360 VR"];
        v46 = v36;
        if ((v45 & 1) == 0)
        {
          if ([v44 isEqualToString:@"Pano VR"]) {
            v46 = v56;
          }
          else {
            v46 = v37;
          }
        }
        [v46 addObject:v43];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v65 objects:buf count:16];
    }
    while (v40);
  }

  v71[0] = @"kSBUIMagicWallpaperPanoVRSectionKey";
  v71[1] = @"kSBUIMagicWallpaper360VRSectionKey";
  v72[0] = v56;
  v72[1] = v36;
  v71[2] = @"kSBUIMagicWallpaperDynamicSectionKey";
  v72[2] = v37;
  uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
  v48 = (void *)__wallpaperEnumeration;
  __wallpaperEnumeration = v47;

  v2 = v49;
LABEL_47:
}

@end