@interface RMECacheEnumerator
+ (id)getEPLProfilePath;
+ (id)getGcoreSpoolWithCreateIfNecessary:(BOOL)a3;
+ (id)getLogContainer:(BOOL)a3;
+ (id)getLogPathsForSystemDiagnostic;
+ (id)getLogPathsSortedByProcessFrequency;
+ (id)getLogPathsSortedByTime;
- (id)initCacheEnumerator;
- (id)initCacheEnumeratorWithVolume:(id)a3;
- (id)nextValidURL;
@end

@implementation RMECacheEnumerator

- (id)initCacheEnumeratorWithVolume:(id)a3
{
  v4 = (__CFString *)a3;
  v24.receiver = self;
  v24.super_class = (Class)RMECacheEnumerator;
  v5 = [(RMECacheEnumerator *)&v24 init];
  v6 = v5;
  if (v5)
  {
    if (!v4) {
      v4 = @"/";
    }
    objc_storeStrong((id *)&v5->_volume, v4);
    v7 = [NSURL fileURLWithPath:v4 isDirectory:1];
    v8 = +[RMECacheEnumerator getLogContainer:0];
    if (v8
      && (v9 = v8,
          [v8 substringFromIndex:1],
          v10 = objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      v11 = [v7 lastPathComponent];
      int v12 = [v10 hasPrefix:v11];

      if (v12)
      {
        uint64_t v13 = [v7 URLByDeletingLastPathComponent];

        v7 = (void *)v13;
      }
      v14 = [v7 URLByAppendingPathComponent:v10];
      if (v14)
      {
        v15 = [MEMORY[0x263F08850] defaultManager];
        v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:*MEMORY[0x263EFF6A8], *MEMORY[0x263EFF750], *MEMORY[0x263EFF758], *MEMORY[0x263EFF610], nil];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = sub_21E8555B0;
        v21[3] = &unk_2644CA3B0;
        id v22 = v14;
        v23 = v4;
        uint64_t v17 = [v15 enumeratorAtURL:v22 includingPropertiesForKeys:v16 options:5 errorHandler:v21];
        internalEnumerator = v6->_internalEnumerator;
        v6->_internalEnumerator = (NSDirectoryEnumerator *)v17;
      }
      v19 = v6;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)initCacheEnumerator
{
  id v3 = [[RMECacheEnumerator alloc] initCacheEnumeratorWithVolume:0];

  return v3;
}

- (id)nextValidURL
{
  return (id)MEMORY[0x270F9A6D0](self->_internalEnumerator, sel_nextObject);
}

+ (id)getLogPathsSortedByTime
{
  id v2 = [[RMECacheEnumerator alloc] initCacheEnumeratorWithVolume:0];
  id v3 = sub_21E86BF24(1, 0, v2);

  return v3;
}

+ (id)getLogPathsSortedByProcessFrequency
{
  id v2 = [[RMECacheEnumerator alloc] initCacheEnumeratorWithVolume:0];
  id v3 = sub_21E86BF24(1, 0, v2);
  v4 = sub_21E854EBC(v3);

  return v4;
}

+ (id)getLogPathsForSystemDiagnostic
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v2 = [a1 getLogPathsSortedByTime];
  id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = v2;
  v51 = [MEMORY[0x263EFF980] array];
  v56 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-3600.0];
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v64 objects:buf count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v65;
    uint64_t v7 = *MEMORY[0x263EFF610];
    uint64_t v8 = *MEMORY[0x263EFF750];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v65 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x223C32890]();
        int v12 = [NSURL fileURLWithPath:v10];
        id v63 = 0;
        [v12 getResourceValue:&v63 forKey:v7 error:0];
        id v13 = v63;
        if (v13)
        {
          id v62 = 0;
          [v12 getResourceValue:&v62 forKey:v8 error:0];
          id v14 = v62;
          if (v14 && ([v56 compare:v13] == -1 || !objc_msgSend(v56, "compare:", v13)))
          {
            v15 = sub_21E86BDF8(v14);
            if (v15)
            {
              v16 = v15;
              if (sub_21E86B564(v15)) {
                [v53 addObject:v12];
              }
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v64 objects:buf count:16];
    }
    while (v5);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v17 = v53;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:&v68 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v58 + 1) + 8 * j) path];
        [v51 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:&v68 count:16];
    }
    while (v19);
  }

  *(void *)&long long v64 = 0;
  uint64_t v23 = sub_21E856240(v51, 0xF00000uLL, (unint64_t *)&v64);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v73 = 15.0;
    __int16 v74 = 2048;
    double v75 = (double)(unint64_t)v64 * 0.000000953674316;
    __int16 v76 = 2112;
    uint64_t v77 = v23;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Critical Logs Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  v57 = (void *)v23;
  [v52 addObjectsFromArray:v23];
  objc_super v24 = sub_21E854EBC(obj);
  v25 = sub_21E8563E4(v24);

  v54 = v25;
  v26 = sub_21E8565A8(v25, v52);
  *(void *)&long long v58 = 0;
  v50 = v26;
  uint64_t v27 = sub_21E856240(v26, 0xF00000uLL, (unint64_t *)&v58);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v73 = 15.0;
    __int16 v74 = 2048;
    double v75 = (double)(unint64_t)v58 * 0.000000953674316;
    __int16 v76 = 2112;
    uint64_t v77 = v27;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Top Offender Logs Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  v49 = (void *)v27;
  [v52 addObjectsFromArray:v27];
  uint64_t v28 = 15728640 - v58;
  if ((unint64_t)v58 > 0xF00000) {
    uint64_t v28 = 0;
  }
  uint64_t v47 = v28;
  sub_21E8563E4(obj);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v31 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:buf count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v69 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v68 + 1) + 8 * k);
        v37 = [NSURL fileURLWithPath:v36, v47];
        v38 = [v37 pathExtension];
        int v39 = [v38 isEqualToString:@"lite_diag"];

        if (v39) {
          [v30 addObject:v36];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:buf count:16];
    }
    while (v33);
  }

  v40 = sub_21E8565A8(v30, v52);
  *(void *)&long long v68 = 0;
  v41 = sub_21E856240(v40, 0x100000uLL, (unint64_t *)&v68);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v73 = 1.0;
    __int16 v74 = 2048;
    double v75 = (double)(unint64_t)v68 * 0.000000953674316;
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v41;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Recent Lite Diags Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  [v52 addObjectsFromArray:v41, v47];
  uint64_t v42 = 0x100000 - v68;
  if ((unint64_t)v68 > 0x100000) {
    uint64_t v42 = 0;
  }
  unint64_t v43 = v48 + v42 + 14680064;
  v44 = sub_21E8565A8(v31, v52);
  id v63 = 0;
  v45 = sub_21E856240(v44, v43, (unint64_t *)&v63);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v73 = (double)v43 * 0.000000953674316;
    __int16 v74 = 2048;
    double v75 = (double)(unint64_t)v58 * 0.000000953674316;
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v45;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Recent Logs Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  [v52 addObjectsFromArray:v45];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v73 = *(double *)&v52;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Completed List of Files for sysdiagnose: %@", buf, 0xCu);
  }

  return v52;
}

+ (id)getGcoreSpoolWithCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[RMECacheEnumerator getLogContainer:1];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 stringByAppendingString:@"/gcore_spool"];
    uint64_t v7 = v6;
    if (v3)
    {
      id v8 = v6;
      v9 = [MEMORY[0x263F08850] defaultManager];
      char v17 = 0;
      if ([v9 fileExistsAtPath:v8 isDirectory:&v17]) {
        BOOL v10 = v17 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v8;
          _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Directory doesn't exist -> trying to create directory at path: %@", buf, 0xCu);
        }
        id v16 = 0;
        [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v16];
        id v11 = v16;
        int v12 = [MEMORY[0x263F08850] defaultManager];
        int v13 = [v12 fileExistsAtPath:v8 isDirectory:&v17];

        if (!v13 || !v17)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v19 = v8;
            __int16 v20 = 2112;
            id v21 = v11;
            _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error: error creating directory at path %@ %@", buf, 0x16u);
          }

          id v14 = 0;
          goto LABEL_17;
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v8;
          _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Successfully created directory at path %@", buf, 0xCu);
        }
      }
    }
    id v14 = v7;
LABEL_17:

    goto LABEL_19;
  }
  id v14 = 0;
LABEL_19:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);

  objc_storeStrong((id *)&self->_internalEnumerator, 0);
}

+ (id)getLogContainer:(BOOL)a3
{
  if (qword_26AB1E338 != -1) {
    dispatch_once(&qword_26AB1E338, &unk_26CFD26B0);
  }
  BOOL v3 = (void *)qword_26AB1E330;

  return v3;
}

+ (id)getEPLProfilePath
{
  if (qword_26AB1E348 != -1) {
    dispatch_once(&qword_26AB1E348, &unk_26CFD26D0);
  }
  id v2 = (void *)qword_26AB1E340;

  return v2;
}

@end