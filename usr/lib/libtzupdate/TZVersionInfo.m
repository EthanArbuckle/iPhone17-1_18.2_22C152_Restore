@interface TZVersionInfo
+ (BOOL)_verifyVersionInfoDictionary:(id)a3;
+ (TZVersionInfo)versionInfoWithDictionary:(id)a3 isPartial:(BOOL)a4;
+ (id)_tzDataVersionFromZoneinfoDirectory:(id)a3 withError:(id *)a4;
+ (id)blankVersionInfo;
+ (id)versionInfoFromContainerDirectory:(id)a3;
+ (id)versionInfoFromDefaultSystem;
- (BOOL)isBlank;
- (NSArray)changedFiles;
- (NSDictionary)alertZones;
- (NSNumber)shouldAlertAll;
- (NSString)bundleVersion;
- (NSString)icuTZSchemaVersion;
- (NSString)tzDataVersion;
- (NSString)versionString;
- (NSURL)diskLocation;
- (id)_initWithVersionInfoDictionary:(id)a3 isPartial:(BOOL)a4;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)setAlertZones:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setChangedFiles:(id)a3;
- (void)setDiskLocation:(id)a3;
- (void)setIcuTZSchemaVersion:(id)a3;
- (void)setShouldAlertAll:(id)a3;
- (void)setTzDataVersion:(id)a3;
@end

@implementation TZVersionInfo

+ (id)versionInfoFromContainerDirectory:(id)a3
{
  id v4 = a3;
  if (!v4 && +[TZDLogging canLogMessageAtLevel:0]) {
    NSLog(&cfstr_SContainerIsNu.isa, "+[TZVersionInfo versionInfoFromContainerDirectory:]");
  }
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  if (v4)
  {
    if (+[TZDLogging canLogMessageAtLevel:2]) {
      NSLog(&cfstr_SInitializingV.isa, "+[TZVersionInfo versionInfoFromContainerDirectory:]", v4);
    }
    v6 = [v4 URLByAppendingPathComponent:@"versions.plist"];
    v7 = [MEMORY[0x263F08850] defaultManager];
    v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      v10 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v6];

      if (v10)
      {

        uint64_t v11 = [v10 objectForKeyedSubscript:@"BundleVersion"];
        if (v11)
        {
          v12 = (void *)v11;
          [v10 setObject:v11 forKeyedSubscript:@"BundleVersion"];

          v13 = [a1 versionInfoWithDictionary:v10 isPartial:0];
        }
        else
        {
          v13 = 0;
        }
        v5 = v10;
        goto LABEL_17;
      }
      v5 = 0;
      if (+[TZDLogging canLogMessageAtLevel:0])
      {
        NSLog(&cfstr_SCouldNotGetCo.isa, "+[TZVersionInfo versionInfoFromContainerDirectory:]", v6);
        v5 = 0;
      }
    }
    else if (+[TZDLogging canLogMessageAtLevel:0])
    {
      NSLog(&cfstr_SDirectoryCont.isa, "+[TZVersionInfo versionInfoFromContainerDirectory:]", v4);
    }
  }
  v13 = 0;
LABEL_17:

  return v13;
}

+ (id)versionInfoFromDefaultSystem
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"DataVersion";
  v3 = [MEMORY[0x263EFFA18] timeZoneDataVersion];
  v7[1] = @"BundleVersion";
  v8[0] = v3;
  v8[1] = @"1.0";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v5 = [a1 versionInfoWithDictionary:v4 isPartial:1];

  return v5;
}

+ (id)blankVersionInfo
{
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SInitializingB.isa, "+[TZVersionInfo blankVersionInfo]");
  }
  uint64_t v3 = MEMORY[0x263EFFA78];

  return (id)[a1 versionInfoWithDictionary:v3 isPartial:1];
}

+ (TZVersionInfo)versionInfoWithDictionary:(id)a3 isPartial:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SInitializingV_0.isa, "+[TZVersionInfo versionInfoWithDictionary:isPartial:]", v6, v4);
  }
  v7 = (void *)[objc_alloc((Class)a1) _initWithVersionInfoDictionary:v6 isPartial:v4];

  return (TZVersionInfo *)v7;
}

- (id)_initWithVersionInfoDictionary:(id)a3 isPartial:(BOOL)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TZVersionInfo;
  v7 = [(TZVersionInfo *)&v22 init];
  if (!v7) {
    goto LABEL_5;
  }
  if (a4
    || +[TZVersionInfo _verifyVersionInfoDictionary:v6])
  {
    changedFiles = v7->_changedFiles;
    v7->_changedFiles = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v9 = [v6 objectForKeyedSubscript:@"AlertZones"];
    alertZones = v7->_alertZones;
    v7->_alertZones = (NSDictionary *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"DataVersion"];
    tzDataVersion = v7->_tzDataVersion;
    v7->_tzDataVersion = (NSString *)v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:@"BundleVersion"];
    bundleVersion = v7->_bundleVersion;
    v7->_bundleVersion = (NSString *)v13;

    uint64_t v15 = [v6 objectForKeyedSubscript:@"ShouldAlertAll"];
    shouldAlertAll = v7->_shouldAlertAll;
    v7->_shouldAlertAll = (NSNumber *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:@"ICUTZSchemaVersion"];
    icuTZSchemaVersion = v7->_icuTZSchemaVersion;
    v7->_icuTZSchemaVersion = (NSString *)v17;

    diskLocation = v7->_diskLocation;
    v7->_diskLocation = 0;

LABEL_5:
    v20 = v7;
    goto LABEL_6;
  }
  v20 = 0;
  if (+[TZDLogging canLogMessageAtLevel:0])
  {
    NSLog(&cfstr_SVersioninfoPl.isa, "-[TZVersionInfo _initWithVersionInfoDictionary:isPartial:]");
    v20 = 0;
  }
LABEL_6:

  return v20;
}

- (NSString)versionString
{
  uint64_t v3 = [(TZVersionInfo *)self tzDataVersion];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    v5 = [(TZVersionInfo *)self bundleVersion];

    if (v5)
    {
      id v6 = NSString;
      v7 = [(TZVersionInfo *)self tzDataVersion];
      v8 = [(TZVersionInfo *)self bundleVersion];
      uint64_t v9 = [v6 stringWithFormat:@"%@.%@", v7, v8];

LABEL_6:
      goto LABEL_8;
    }
  }
  v10 = [(TZVersionInfo *)self tzDataVersion];

  if (v10)
  {
    uint64_t v11 = NSString;
    v7 = [(TZVersionInfo *)self tzDataVersion];
    uint64_t v9 = [v11 stringWithFormat:@"%@", v7];
    goto LABEL_6;
  }
  uint64_t v9 = 0;
LABEL_8:

  return (NSString *)v9;
}

+ (BOOL)_verifyVersionInfoDictionary:(id)a3
{
  v78[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = 0x263FD0000uLL;
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SStartingVersi.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]");
  }
  if (v3)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    v78[0] = @"DataVersion";
    v78[1] = @"BundleVersion";
    v78[2] = @"ICUTZSchemaVersion";
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
    v7 = [v5 setWithArray:v6];

    v8 = (void *)MEMORY[0x263EFFA08];
    v77 = @"ShouldAlertAll";
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    v76 = @"AlertZones";
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
    uint64_t v13 = [v11 setWithArray:v12];

    v14 = [v7 setByAddingObjectsFromSet:v10];
    uint64_t v15 = [v14 setByAddingObjectsFromSet:v13];

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = [v3 allKeys];
    v18 = [v16 setWithArray:v17];

    if ([v18 isEqualToSet:v15])
    {
      v58 = v18;
      v59 = v10;
      v56 = v15;
      v57 = v7;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v19 = v7;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v75 count:16];
      v60 = v13;
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v70;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v70 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v69 + 1) + 8 * i);
            uint64_t v25 = [v3 objectForKeyedSubscript:v24];
            if (v25)
            {
              v26 = (void *)v25;
              v27 = [v3 objectForKeyedSubscript:v24];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                continue;
              }
            }
            unint64_t v4 = 0x263FD0000uLL;
            if (+[TZDLogging canLogMessageAtLevel:2]) {
              NSLog(&cfstr_SKeyIsNotAStri.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]", v24);
            }
            BOOL v29 = 0;
            uint64_t v13 = v60;
            goto LABEL_25;
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v69 objects:v75 count:16];
          BOOL v29 = 1;
          unint64_t v4 = 0x263FD0000;
          uint64_t v13 = v60;
          if (v21) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v29 = 1;
      }
LABEL_25:

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v30 = v59;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        BOOL v54 = v29;
        uint64_t v33 = *(void *)v66;
        while (2)
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v66 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v65 + 1) + 8 * j);
            uint64_t v36 = [v3 objectForKeyedSubscript:v35];
            if (v36)
            {
              v37 = (void *)v36;
              v38 = [v3 objectForKeyedSubscript:v35];
              objc_opt_class();
              char v39 = objc_opt_isKindOfClass();

              if (v39) {
                continue;
              }
            }
            unint64_t v4 = 0x263FD0000uLL;
            if (+[TZDLogging canLogMessageAtLevel:2]) {
              NSLog(&cfstr_SKeyIsNotANumb.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]", v35);
            }
            BOOL v29 = 0;
            uint64_t v13 = v60;
            goto LABEL_38;
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
          if (v32) {
            continue;
          }
          break;
        }
        unint64_t v4 = 0x263FD0000;
        uint64_t v13 = v60;
        v18 = v58;
        BOOL v29 = v54;
      }
      else
      {
LABEL_38:
        v18 = v58;
      }

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v40 = v13;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v61 objects:v73 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        BOOL v55 = v29;
        uint64_t v43 = *(void *)v62;
LABEL_41:
        uint64_t v44 = 0;
        while (1)
        {
          if (*(void *)v62 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v61 + 1) + 8 * v44);
          uint64_t v46 = [v3 objectForKeyedSubscript:v45];
          if (!v46) {
            break;
          }
          v47 = (void *)v46;
          v48 = [v3 objectForKeyedSubscript:v45];
          objc_opt_class();
          char v49 = objc_opt_isKindOfClass();

          if ((v49 & 1) == 0) {
            break;
          }
          if ([v45 isEqualToString:@"AlertZones"])
          {
            v50 = [v3 objectForKeyedSubscript:v45];
            v51 = [v50 allValues];
            uint64_t v52 = [v51 indexOfObjectPassingTest:&__block_literal_global_0];

            if (v52 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v4 = 0x263FD0000uLL;
              if (+[TZDLogging canLogMessageAtLevel:2]) {
                NSLog(&cfstr_SAlertzonesVal.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]");
              }
LABEL_57:
              uint64_t v13 = v60;
              uint64_t v15 = v56;
              v18 = v58;
              BOOL v29 = v55;
              goto LABEL_58;
            }
          }
          if (v42 == ++v44)
          {
            uint64_t v42 = [v40 countByEnumeratingWithState:&v61 objects:v73 count:16];
            if (v42) {
              goto LABEL_41;
            }
            unint64_t v4 = 0x263FD0000;
            goto LABEL_57;
          }
        }
        unint64_t v4 = 0x263FD0000uLL;
        if (+[TZDLogging canLogMessageAtLevel:2]) {
          NSLog(&cfstr_SKeyIsNotADict.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]", v45);
        }
        BOOL v29 = 0;
        uint64_t v13 = v60;
        uint64_t v15 = v56;
        v18 = v58;
      }
      else
      {
        uint64_t v15 = v56;
      }
LABEL_58:

      v7 = v57;
      v10 = v59;
    }
    else
    {
      if (+[TZDLogging canLogMessageAtLevel:2]) {
        NSLog(&cfstr_SVersioninfoKe.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]", v18, v15);
      }
      BOOL v29 = 0;
    }
  }
  else
  {
    if (+[TZDLogging canLogMessageAtLevel:2]) {
      NSLog(&cfstr_SVersioninfoDi.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]");
    }
    BOOL v29 = 0;
  }
  if ([*(id *)(v4 + 1960) canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SPlistVerifica.isa, "+[TZVersionInfo _verifyVersionInfoDictionary:]", v29);
  }

  return v29;
}

BOOL __46__TZVersionInfo__verifyVersionInfoDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    *a4 = 1;
  }
  return (isKindOfClass & 1) == 0;
}

+ (id)_tzDataVersionFromZoneinfoDirectory:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SObtainingVers.isa, "+[TZVersionInfo _tzDataVersionFromZoneinfoDirectory:withError:]", v5);
  }
  if (!v5)
  {
    v10 = 0;
    if (!+[TZDLogging canLogMessageAtLevel:0]) {
      goto LABEL_11;
    }
    NSLog(&cfstr_SDirectoryIsNi.isa, "+[TZVersionInfo _tzDataVersionFromZoneinfoDirectory:withError:]");
    goto LABEL_10;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (!v8)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = [v5 URLByAppendingPathComponent:@"+VERSION"];
  v10 = +[TZUtilities stringWithContentsOfFileAtURL:v9 error:a4];
  if (+[TZDLogging canLogMessageAtLevel:1]) {
    NSLog(&cfstr_SVersionString.isa, "+[TZVersionInfo _tzDataVersionFromZoneinfoDirectory:withError:]", v5, v10);
  }

LABEL_11:

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(TZVersionInfo *)self versionString];
  id v6 = [v4 versionString];

  int64_t v7 = [v5 compare:v6 options:64];
  return v7;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(TZVersionInfo *)self tzDataVersion];
  id v5 = [(TZVersionInfo *)self bundleVersion];
  id v6 = [(TZVersionInfo *)self versionString];
  int64_t v7 = [v3 stringWithFormat:@"TZVersionInfo: tzDataVersion=%@, bundleVersion=%@, versionString=%@", v4, v5, v6];

  return v7;
}

- (BOOL)isBlank
{
  id v3 = [(TZVersionInfo *)self icuTZSchemaVersion];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(TZVersionInfo *)self tzDataVersion];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(TZVersionInfo *)self bundleVersion];
      if (v6)
      {
        BOOL v4 = 0;
      }
      else
      {
        int64_t v7 = [(TZVersionInfo *)self changedFiles];
        if (v7)
        {
          BOOL v4 = 0;
        }
        else
        {
          int v8 = [(TZVersionInfo *)self alertZones];
          if (v8)
          {
            BOOL v4 = 0;
          }
          else
          {
            uint64_t v9 = [(TZVersionInfo *)self versionString];
            if (v9)
            {
              BOOL v4 = 0;
            }
            else
            {
              v10 = [(TZVersionInfo *)self shouldAlertAll];
              if (v10)
              {
                BOOL v4 = 0;
              }
              else
              {
                uint64_t v11 = [(TZVersionInfo *)self diskLocation];
                BOOL v4 = v11 == 0;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

- (NSString)tzDataVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTzDataVersion:(id)a3
{
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)icuTZSchemaVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIcuTZSchemaVersion:(id)a3
{
}

- (NSArray)changedFiles
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChangedFiles:(id)a3
{
}

- (NSDictionary)alertZones
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAlertZones:(id)a3
{
}

- (NSNumber)shouldAlertAll
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setShouldAlertAll:(id)a3
{
}

- (NSURL)diskLocation
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDiskLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskLocation, 0);
  objc_storeStrong((id *)&self->_shouldAlertAll, 0);
  objc_storeStrong((id *)&self->_alertZones, 0);
  objc_storeStrong((id *)&self->_changedFiles, 0);
  objc_storeStrong((id *)&self->_icuTZSchemaVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);

  objc_storeStrong((id *)&self->_tzDataVersion, 0);
}

@end