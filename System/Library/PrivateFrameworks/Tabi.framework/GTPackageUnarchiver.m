@interface GTPackageUnarchiver
+ (BOOL)unarchivePackages:(id)a3 into:(id)a4 error:(id *)a5;
@end

@implementation GTPackageUnarchiver

+ (BOOL)unarchivePackages:(id)a3 into:(id)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v58 = 0;
  objc_storeStrong(&v58, a4);
  v57 = a5;
  id v37 = (id)[MEMORY[0x263F08850] defaultManager];
  [v37 createDirectoryAtPath:v58 withIntermediateDirectories:1 attributes:0 error:a5];

  if (*a5)
  {
    char v60 = 0;
    int v56 = 1;
  }
  else
  {
    uint64_t v55 = 0;
    memset(__b, 0, sizeof(__b));
    id v33 = location[0];
    uint64_t v34 = [v33 countByEnumeratingWithState:__b objects:v71 count:16];
    if (v34)
    {
      uint64_t v30 = *(void *)__b[2];
      uint64_t v31 = 0;
      unint64_t v32 = v34;
      while (1)
      {
        uint64_t v29 = v31;
        if (*(void *)__b[2] != v30) {
          objc_enumerationMutation(v33);
        }
        id v54 = *(id *)(__b[1] + 8 * v31);
        id v26 = v58;
        id v27 = (id)[v54 identifier];
        id v52 = (id)objc_msgSend(v26, "stringByAppendingPathComponent:");

        id v28 = (id)[MEMORY[0x263F08850] defaultManager];
        [v28 createDirectoryAtPath:v52 withIntermediateDirectories:1 attributes:0 error:v57];

        if (*v57)
        {
          char v60 = 0;
          int v56 = 1;
        }
        else
        {
          uint64_t v51 = 0;
          uint64_t v51 = BOMCopierNew();
          id v50 = (id)[MEMORY[0x263EFF980] array];
          BOMCopierSetUserData();
          BOMCopierSetCopyFileFinishedHandler();
          BOMCopierSetFatalErrorHandler();
          v69 = @"extractPKZip";
          uint64_t v70 = MEMORY[0x263EFFA88];
          id v49 = (id)[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          double v48 = 0.0;
          [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
          double v48 = v5;
          id v47 = (id)[v54 fileURL];
          if (v47)
          {
            int v44 = 0;
            [v47 fileSystemRepresentation];
            [v52 fileSystemRepresentation];
            int v44 = BOMCopierCopyWithOptions();
            double v43 = 0.0;
            [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
            double v43 = v6;
            BOMCopierFree();
            if (v44)
            {
              os_log_t v40 = (os_log_t)APDefaultLog();
              os_log_type_t v39 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v15 = v40;
                uint64_t v8 = [v50 count];
                __os_log_helper_16_2_3_8_0_8_0_8_66((uint64_t)v64, v8, COERCE__INT64(v43 - v48), (uint64_t)v52);
                _os_log_error_impl(&dword_25E8A5000, v15, v39, "failed to extract %lu files from zip archive in %.2fs to %{public}@", v64, 0x20u);
              }
              objc_storeStrong((id *)&v40, 0);
              v11 = (void *)MEMORY[0x263F087E8];
              uint64_t v62 = *MEMORY[0x263F08320];
              v10 = NSString;
              id v14 = (id)[v54 identifier];
              id v13 = (id)[v10 stringWithFormat:@"Failed to extract resource %@", v14];
              id v63 = v13;
              id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62);
              id *v57 = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", @"GTPackageUnarchiverErrorDomain", 1);

              char v60 = 0;
              int v56 = 1;
            }
            else
            {
              v55 += [v50 count];
              os_log_t v42 = (os_log_t)APDefaultLog();
              os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v16 = v42;
                os_log_type_t v17 = v41;
                uint64_t v7 = [v50 count];
                __os_log_helper_16_2_3_8_0_8_0_8_66((uint64_t)v65, v7, COERCE__INT64(v43 - v48), (uint64_t)v52);
                _os_log_impl(&dword_25E8A5000, v16, v17, "successfully extracted %lu files from zip archive in %.2fs to %{public}@", v65, 0x20u);
              }
              objc_storeStrong((id *)&v42, 0);
              int v56 = 0;
            }
          }
          else
          {
            os_log_t oslog = (os_log_t)APDefaultLog();
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v24 = type;
              id v25 = (id)[v54 identifier];
              __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v25);
              _os_log_error_impl(&dword_25E8A5000, log, v24, "Failed to extract resource %@ due to missing on-disk URL.", v68, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v19 = (void *)MEMORY[0x263F087E8];
            uint64_t v66 = *MEMORY[0x263F08320];
            v18 = NSString;
            id v22 = (id)[v54 identifier];
            id v21 = (id)[v18 stringWithFormat:@"Failed to extract resource %@ due to missing on-disk URL.", v22];
            id v67 = v21;
            id v20 = (id)[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
            id *v57 = (id)objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"GTPackageUnarchiverErrorDomain", 2);

            char v60 = 0;
            int v56 = 1;
          }
          objc_storeStrong(&v47, 0);
          objc_storeStrong(&v49, 0);
          objc_storeStrong(&v50, 0);
        }
        objc_storeStrong(&v52, 0);
        if (v56) {
          break;
        }
        ++v31;
        if (v29 + 1 >= v32)
        {
          uint64_t v31 = 0;
          unint64_t v32 = [v33 countByEnumeratingWithState:__b objects:v71 count:16];
          if (!v32) {
            goto LABEL_24;
          }
        }
      }
    }
    else
    {
LABEL_24:
      int v56 = 0;
    }

    if (!v56)
    {
      os_log_t v38 = (os_log_t)APDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_0_8_66((uint64_t)v61, v55, (uint64_t)v58);
        _os_log_impl(&dword_25E8A5000, v38, OS_LOG_TYPE_DEFAULT, "finished unzipping %lu total files to %{public}@", v61, 0x16u);
      }
      objc_storeStrong((id *)&v38, 0);
      char v60 = 1;
      int v56 = 1;
    }
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v60 & 1;
}

@end