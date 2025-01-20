@interface PNPersonPromoterEvaluation
+ (BOOL)createDirectoryIfNotExitAtURL:(id)a3;
+ (BOOL)exportPhotoLibrary:(id)a3 toURL:(id)a4 forPeople:(id)a5 error:(id *)a6;
+ (BOOL)exportPhotoLibrary:(id)a3 toURL:(id)a4 forPeopleType:(unint64_t)a5 error:(id *)a6;
+ (id)_peopleClustersDictionaryForPeople:(id)a3 withPhotoLibrary:(id)a4;
+ (id)openPhotoLibraryAtURL:(id)a3;
+ (void)peopleClusteringWithParameter:(id)a3 photoLibrary:(id)a4 directoryURL:(id)a5 delegate:(id)a6;
@end

@implementation PNPersonPromoterEvaluation

+ (BOOL)exportPhotoLibrary:(id)a3 toURL:(id)a4 forPeople:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x263F08850]);
  v14 = [v11 URLByDeletingLastPathComponent];
  v15 = [v14 path];
  char v16 = [v13 fileExistsAtPath:v15];

  if (v16)
  {
    id v17 = 0;
  }
  else
  {
    id v24 = 0;
    [v13 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v17 = v24;
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initWithURL:v11 append:0];
  v19 = v18;
  if (v17 || !v18)
  {
    BOOL v22 = 0;
    if (a6) {
      *a6 = v17;
    }
  }
  else
  {
    [v18 open];
    v20 = [a1 _peopleClustersDictionaryForPeople:v12 withPhotoLibrary:v10];
    uint64_t v21 = [MEMORY[0x263F08AC0] writePropertyList:v20 toStream:v19 format:100 options:0 error:a6];
    BOOL v22 = v21 != 0;
    [v19 close];
    if (!v21) {
      [v13 removeItemAtURL:v11 error:0];
    }
  }
  return v22;
}

+ (id)_peopleClustersDictionaryForPeople:(id)a3 withPhotoLibrary:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v61 = a4;
  id v53 = [MEMORY[0x263EFF9A0] dictionary];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v5;
  uint64_t v54 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v73;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v73 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v6;
        v7 = *(void **)(*((void *)&v72 + 1) + 8 * v6);
        v55 = (void *)MEMORY[0x25A2E0AC0]();
        v57 = v7;
        v8 = objc_msgSend(v61, "pn_fetchFacesForPerson:", v7);
        v59 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v58 = v8;
        uint64_t v62 = [v58 countByEnumeratingWithState:&v68 objects:v87 count:16];
        if (v62)
        {
          uint64_t v60 = *(void *)v69;
          do
          {
            for (uint64_t i = 0; i != v62; ++i)
            {
              if (*(void *)v69 != v60) {
                objc_enumerationMutation(v58);
              }
              id v10 = *(void **)(*((void *)&v68 + 1) + 8 * i);
              id v11 = [v10 localIdentifier];
              v86 = v11;
              id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
              id v13 = objc_msgSend(v61, "pn_fetchAssetsForFaceLocalIdentifiers:", v12);
              v14 = [v13 fetchedObjects];
              v15 = [v14 firstObject];

              char v16 = [v15 cloudIdentifier];
              if ([v16 length]) {
                [v15 cloudIdentifier];
              }
              else {
              id v17 = [v15 localIdentifier];
              }

              v18 = [MEMORY[0x263F14D18] uuidFromLocalIdentifier:v17];
              if (v17)
              {
                unint64_t v19 = [v15 pixelWidth];
                unint64_t v20 = [v15 pixelHeight];
                if (v19 <= v20) {
                  unint64_t v21 = v20;
                }
                else {
                  unint64_t v21 = v19;
                }
                float v22 = (float)v21;
                v85[0] = v18;
                v84[0] = @"id";
                v84[1] = @"filename";
                uint64_t v23 = [v15 filename];
                v65 = (void *)v23;
                if (v23) {
                  id v24 = (__CFString *)v23;
                }
                else {
                  id v24 = &stru_270753580;
                }
                v85[1] = v24;
                v84[2] = @"originalFilename";
                uint64_t v25 = [v15 originalFilename];
                v66 = v18;
                v67 = v17;
                v26 = (void *)v25;
                if (v25) {
                  v27 = (__CFString *)v25;
                }
                else {
                  v27 = &stru_270753580;
                }
                v85[2] = v27;
                v84[3] = @"centerX_normalized";
                v28 = NSNumber;
                [v10 centerX];
                v64 = objc_msgSend(v28, "numberWithDouble:");
                v85[3] = v64;
                v84[4] = @"centerY_normalized";
                v29 = NSNumber;
                [v10 centerY];
                v63 = objc_msgSend(v29, "numberWithDouble:");
                v85[4] = v63;
                v84[5] = @"size_normalized";
                v30 = NSNumber;
                [v10 size];
                v31 = objc_msgSend(v30, "numberWithDouble:");
                v85[5] = v31;
                v84[6] = @"centerX";
                v32 = NSNumber;
                [v10 centerX];
                v34 = objc_msgSend(v32, "numberWithDouble:", v33 * (double)(unint64_t)objc_msgSend(v15, "pixelWidth"));
                v85[6] = v34;
                v84[7] = @"centerY";
                v35 = NSNumber;
                [v10 centerY];
                v37 = objc_msgSend(v35, "numberWithDouble:", v36 * (double)(unint64_t)objc_msgSend(v15, "pixelHeight"));
                v85[7] = v37;
                v84[8] = @"size";
                v38 = NSNumber;
                [v10 size];
                v40 = [v38 numberWithDouble:v39 * v22];
                v85[8] = v40;
                v84[9] = @"pixelWidth";
                v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "pixelWidth"));
                v85[9] = v41;
                v84[10] = @"pixelHeight";
                v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "pixelHeight"));
                v85[10] = v42;
                v43 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:11];

                v18 = v66;
                [v59 addObject:v43];

                id v17 = v67;
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                v44 = [v10 localIdentifier];
                v45 = [v57 localIdentifier];
                *(_DWORD *)buf = 138412802;
                v79 = v15;
                __int16 v80 = 2112;
                v81 = v44;
                __int16 v82 = 2112;
                v83 = v45;
                _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No identifier for asset: %@, face identifier: %@, person identifier: %@", buf, 0x20u);
              }
            }
            uint64_t v62 = [v58 countByEnumeratingWithState:&v68 objects:v87 count:16];
          }
          while (v62);
        }

        v46 = [v57 anonymizedName];
        if ([v46 length]) {
          [v57 anonymizedName];
        }
        else {
        v47 = [v57 localIdentifier];
        }

        v76[0] = @"verified";
        v48 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v57, "isVerified"));
        v76[1] = @"assets";
        v77[0] = v48;
        v77[1] = v59;
        v49 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
        [v53 setObject:v49 forKeyedSubscript:v47];

        uint64_t v6 = v56 + 1;
      }
      while (v56 + 1 != v54);
      uint64_t v54 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
    }
    while (v54);
  }

  return v53;
}

+ (BOOL)exportPhotoLibrary:(id)a3 toURL:(id)a4 forPeopleType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x263F08850]);
  id v13 = [v11 URLByDeletingLastPathComponent];
  v14 = [v13 path];
  char v15 = [v12 fileExistsAtPath:v14];

  if (v15)
  {
    id v16 = 0;
  }
  else
  {
    id v24 = 0;
    [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v16 = v24;
  }
  id v17 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initWithURL:v11 append:0];
  v18 = v17;
  if (v16 || !v17)
  {
    BOOL v22 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else
  {
    [v17 open];
    unint64_t v19 = objc_msgSend(v10, "pn_fetchPersonsWithType:", a5);
    unint64_t v20 = [a1 _peopleClustersDictionaryForPeople:v19 withPhotoLibrary:v10];
    uint64_t v21 = [MEMORY[0x263F08AC0] writePropertyList:v20 toStream:v18 format:100 options:0 error:a6];
    BOOL v22 = v21 != 0;
    [v18 close];
    if (!v21) {
      [v12 removeItemAtURL:v11 error:0];
    }
  }
  return v22;
}

+ (BOOL)createDirectoryIfNotExitAtURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08850]);
  char v11 = 0;
  id v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v11];

  if (v6)
  {
    if (v11)
    {
      char v7 = 1;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error output path exists and it is not a directory", buf, 2u);
      char v7 = v11 != 0;
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    id v10 = 0;
    char v7 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error occured creating output directory: %@", buf, 0xCu);
    }
  }
  return v7;
}

+ (void)peopleClusteringWithParameter:(id)a3 photoLibrary:(id)a4 directoryURL:(id)a5 delegate:(id)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v62 = a1;
  id v63 = a6;
  if ([a1 createDirectoryIfNotExitAtURL:v12])
  {
    id v13 = objc_opt_new();
    [v13 setDateFormat:@"yyyyMMdd_HHmmss"];
    uint64_t v14 = [MEMORY[0x263EFF910] date];
    id v61 = [v13 stringFromDate:v14];

    char v15 = (void *)MEMORY[0x25A2E0AC0]();
    id v16 = [[PNPersonClusterManager alloc] initWithPhotoLibrary:v11];
    id v17 = [v12 URLByAppendingPathComponent:@"Baseline_FaceGroup.plist"];
    id v70 = 0;
    char v18 = [v17 checkResourceIsReachableAndReturnError:&v70];
    id v19 = v70;
    unint64_t v20 = v19;
    id v60 = v11;
    if (v18)
    {
      id v21 = v19;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v72 = @"Baseline_FaceGroup.plist";
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
      }
      id v69 = v20;
      char v22 = [v62 exportPhotoLibrary:v16 toURL:v17 forPeopleType:0 error:&v69];
      id v21 = v69;

      if ((v22 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v72 = @"Baseline_FaceGroup.plist";
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not export: %@", buf, 0xCu);
      }
    }
    uint64_t v23 = [v12 URLByAppendingPathComponent:@"Baseline_verified.plist"];

    id v68 = v21;
    char v24 = [v23 checkResourceIsReachableAndReturnError:&v68];
    id v25 = v68;

    v59 = v13;
    if (v24)
    {
      id v26 = v25;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v72 = @"Baseline_verified.plist";
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
      }
      id v67 = v25;
      char v27 = [v62 exportPhotoLibrary:v16 toURL:v23 forPeopleType:1 error:&v67];
      id v26 = v67;

      if ((v27 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v72 = @"Baseline_verified.plist";
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not export: %@", buf, 0xCu);
      }
    }
    id v11 = v60;

    if ([v10 isValid])
    {
      [v10 startValue];
      double v29 = v28;
      uint64_t v30 = [v10 endValue];
      if (v29 <= v31)
      {
        v32 = &_os_log_internal;
        do
        {
          context = (void *)MEMORY[0x25A2E0AC0](v30);
          double v33 = objc_alloc_init(PNPersonPromoterProfile);
          v34 = objc_alloc_init(PNPersonDeduperProfile);
          v35 = [v10 name];
          NSSelectorFromString(v35);

          if (objc_opt_respondsToSelector())
          {
            double v36 = [NSNumber numberWithDouble:v29];
            v37 = [v10 name];
            [(PNPersonDeduperProfile *)v34 setValue:v36 forKey:v37];
          }
          v38 = [[PNPersonPromoter alloc] initWithPhotoLibrary:v11 andDelegate:v63];
          [(PNPersonPromoter *)v38 setPromoterProfile:v33];
          [(PNPersonPromoter *)v38 setDeduperProfile:v34];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            double v39 = [v10 name];
            *(_DWORD *)buf = 138412546;
            long long v72 = v39;
            __int16 v73 = 2048;
            double v74 = v29;
            _os_log_impl(&dword_25934C000, v32, OS_LOG_TYPE_DEFAULT, "Running promoter with %@ = %lf...", buf, 0x16u);
          }
          id v40 = [(PNPersonPromoter *)v38 evaluatePersonPromoterWithUpdateBlock:&__block_literal_global_940];
          v41 = [(PNPersonPromoter *)v38 personClusterManager];
          v42 = NSString;
          v43 = v10;
          v44 = [v10 name];
          v45 = [v42 stringWithFormat:@"%@_%.2f/Graph_%@_verified.plist", v44, *(void *)&v29, v61, v59];

          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v72 = v45;
            _os_log_impl(&dword_25934C000, v32, OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
          }
          id v46 = v12;
          v47 = [v12 URLByAppendingPathComponent:v45];
          id v66 = 0;
          [v62 exportPhotoLibrary:v41 toURL:v47 forPeopleType:1 error:&v66];
          id v48 = v66;

          if (v48 && os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v72 = v45;
            __int16 v73 = 2112;
            double v74 = *(double *)&v48;
            _os_log_impl(&dword_25934C000, v32, OS_LOG_TYPE_DEFAULT, "Could not save people clusters to %@: %@", buf, 0x16u);
          }

          [v43 incrementValue];
          double v29 = v29 + v49;
          uint64_t v30 = [v43 endValue];
          id v11 = v60;
          id v12 = v46;
          id v10 = v43;
        }
        while (v29 <= v50);
      }
    }
    else
    {
      v51 = (void *)MEMORY[0x25A2E0AC0]();
      uint64_t v52 = [[PNPersonPromoter alloc] initWithPhotoLibrary:v60 andDelegate:v63];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Evaluating promoter...", buf, 2u);
      }
      id v53 = [(PNPersonPromoter *)v52 evaluatePersonPromoterWithUpdateBlock:&__block_literal_global_249];
      uint64_t v54 = [(PNPersonPromoter *)v52 personClusterManager];
      v55 = [NSString stringWithFormat:@"Graph_%@_verified.plist", v61];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v72 = v55;
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
      }
      id v56 = v12;
      v57 = [v12 URLByAppendingPathComponent:v55];
      id v65 = 0;
      [v62 exportPhotoLibrary:v54 toURL:v57 forPeople:v53 error:&v65];
      id v58 = v65;

      if (v58 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        long long v72 = v55;
        __int16 v73 = 2112;
        double v74 = *(double *)&v58;
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not save people clusters to %@: %@", buf, 0x16u);
      }

      id v12 = v56;
    }
  }
}

+ (id)openPhotoLibraryAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F14E98]) initWithPhotoLibraryURL:v3];
  if ([v4 isSystemPhotoLibrary])
  {
    id v15 = 0;
    int v5 = [v4 openAndWaitWithUpgrade:0 error:&v15];
    id v6 = v15;
    if (v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v3;
        char v7 = &_os_log_internal;
        id v8 = "Using system library at %@";
LABEL_8:
        _os_log_impl(&dword_25934C000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      id v11 = &_os_log_internal;
      id v12 = "Unable to open system photo library: %@";
LABEL_18:
      _os_log_error_impl(&dword_25934C000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
    }
  }
  else
  {
    [MEMORY[0x263F14E98] enableMultiLibraryMode];
    id v14 = 0;
    int v9 = [v4 openAndWaitWithUpgrade:1 error:&v14];
    id v6 = v14;
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v3;
        char v7 = &_os_log_internal;
        id v8 = "Using library at %@";
        goto LABEL_8;
      }
LABEL_9:

      id v10 = v4;
      goto LABEL_14;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      id v11 = &_os_log_internal;
      id v12 = "Failed to open library. Error: %@";
      goto LABEL_18;
    }
  }

  id v10 = 0;
LABEL_14:

  return v10;
}

@end