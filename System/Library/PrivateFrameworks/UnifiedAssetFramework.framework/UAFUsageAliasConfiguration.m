@interface UAFUsageAliasConfiguration
+ (BOOL)isValid:(id)a3 assetSetManager:(id)a4 error:(id *)a5;
+ (id)fromContentsOfURL:(id)a3 assetSetManager:(id)a4 error:(id *)a5;
+ (id)supportedFileVersions;
- (NSDictionary)values;
- (NSString)name;
- (UAFConfigurationManager)assetSetManager;
- (UAFUsageAliasConfiguration)initWithDictionary:(id)a3 assetSetManager:(id)a4;
- (id)getAssetSetAssets:(id)a3 usageValue:(id)a4 withSource:(id)a5;
- (id)getAssets:(id)a3;
- (id)getAssets:(id)a3 withSource:(id)a4;
- (id)getAutoAssets:(id)a3;
- (id)getTrialAssets:(id)a3;
- (void)setAssetSetManager:(id)a3;
- (void)setName:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation UAFUsageAliasConfiguration

+ (id)supportedFileVersions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"1.0.0";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)isValid:(id)a3 assetSetManager:(id)a4 error:(id *)a5
{
  uint64_t v166 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = +[UAFUsageAliasConfiguration supportedFileVersions];
  BOOL v10 = +[UAFConfiguration isValid:v7 fileType:@"UsageAliasConfiguration" fileVersions:v9 error:a5];

  if (!v10) {
    goto LABEL_59;
  }
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, @"UsageAliasName", objc_opt_class(), 1, a5)|| !+[UAFConfiguration isValidValue:v7 key:@"UsageAliasValues" kind:objc_opt_class() required:1 error:a5])
  {
    LOBYTE(v10) = 0;
    goto LABEL_59;
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v11 = [v7 objectForKeyedSubscript:@"UsageAliasValues"];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v128 objects:v165 count:16];
  if (!v12)
  {
    LOBYTE(v10) = 1;
    goto LABEL_58;
  }
  uint64_t v13 = *(void *)v129;
  uint64_t v107 = *(void *)v129;
  while (2)
  {
    uint64_t v14 = 0;
    uint64_t v108 = v12;
    do
    {
      if (*(void *)v129 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v110 = v14;
      v15 = *(void **)(*((void *)&v128 + 1) + 8 * v14);
      v16 = [v7 objectForKeyedSubscript:@"UsageAliasValues"];
      v17 = [v16 objectForKeyedSubscript:v15];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v115 = v15;
      if ((isKindOfClass & 1) == 0)
      {
        if (a5)
        {
          v61 = (void *)MEMORY[0x263F087E8];
          if (*a5)
          {
            v163[0] = *MEMORY[0x263F08320];
            v62 = [NSString stringWithFormat:@"UsageAliasValues entry for \"%@\" is not expected kind \"%@\"", v15, objc_opt_class()];
            v163[1] = *MEMORY[0x263F08608];
            id v63 = *a5;
            v164[0] = v62;
            v164[1] = v63;
            v64 = NSDictionary;
            v65 = (void **)v164;
            v66 = v163;
            uint64_t v67 = 2;
          }
          else
          {
            uint64_t v161 = *MEMORY[0x263F08320];
            v62 = [NSString stringWithFormat:@"UsageAliasValues entry for \"%@\" is not expected kind \"%@\"", v15, objc_opt_class()];
            v162 = v62;
            v64 = NSDictionary;
            v65 = &v162;
            v66 = &v161;
            uint64_t v67 = 1;
          }
          v85 = [v64 dictionaryWithObjects:v65 forKeys:v66 count:v67];
          *a5 = [v61 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v85];

          v15 = v115;
        }
        v20 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        v86 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
        __int16 v139 = 2112;
        v140 = v15;
        __int16 v141 = 2112;
        v142 = v86;
        v87 = v86;
        v88 = "%s UsageAliasValues entry for \"%@\" is not expected kind \"%@\"";
        v89 = v20;
        uint32_t v90 = 32;
        goto LABEL_77;
      }
      v19 = [v7 objectForKeyedSubscript:@"UsageAliasValues"];
      v20 = [v19 objectForKeyedSubscript:v15];

      if (![v20 count])
      {
        if (a5)
        {
          v68 = (void *)MEMORY[0x263F087E8];
          if (*a5)
          {
            v159[0] = *MEMORY[0x263F08320];
            v69 = [NSString stringWithFormat:@"UsageAliasValues asset sets for \"%@\" has no values", v15];
            v159[1] = *MEMORY[0x263F08608];
            id v70 = *a5;
            v160[0] = v69;
            v160[1] = v70;
            v71 = NSDictionary;
            v72 = (void **)v160;
            v73 = v159;
            uint64_t v74 = 2;
          }
          else
          {
            uint64_t v157 = *MEMORY[0x263F08320];
            v69 = [NSString stringWithFormat:@"UsageAliasValues asset sets for \"%@\" has no values", v15];
            v158 = v69;
            v71 = NSDictionary;
            v72 = &v158;
            v73 = &v157;
            uint64_t v74 = 1;
          }
          v91 = [v71 dictionaryWithObjects:v72 forKeys:v73 count:v74];
          *a5 = [v68 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v91];

          v15 = v115;
        }
        v87 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 136315394;
        v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
        __int16 v139 = 2112;
        v140 = v15;
        v88 = "%s UsageAliasValues asset sets for \"%@\" has no values";
        v89 = v87;
        uint32_t v90 = 22;
LABEL_77:
        _os_log_impl(&dword_23797A000, v89, OS_LOG_TYPE_DEFAULT, v88, buf, v90);
LABEL_78:

LABEL_57:
        LOBYTE(v10) = 0;
        goto LABEL_58;
      }
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      v20 = v20;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v124 objects:v156 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v125;
        v111 = v20;
        v112 = v11;
        uint64_t v105 = *(void *)v125;
        while (2)
        {
          uint64_t v23 = 0;
          uint64_t v106 = v21;
          do
          {
            if (*(void *)v125 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v109 = v23;
            v24 = *(void **)(*((void *)&v124 + 1) + 8 * v23);
            v25 = [v20 objectForKeyedSubscript:v24];
            objc_opt_class();
            char v26 = objc_opt_isKindOfClass();

            if ((v26 & 1) == 0)
            {
              if (a5)
              {
                v75 = v24;
                v76 = v20;
                id v77 = v8;
                v78 = (void *)MEMORY[0x263F087E8];
                if (*a5)
                {
                  v154[0] = *MEMORY[0x263F08320];
                  v79 = [NSString stringWithFormat:@"UsageAliasValues usages for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"", v24, v115, objc_opt_class()];
                  v154[1] = *MEMORY[0x263F08608];
                  id v80 = *a5;
                  v155[0] = v79;
                  v155[1] = v80;
                  v81 = NSDictionary;
                  v82 = (void **)v155;
                  v83 = v154;
                  uint64_t v84 = 2;
                }
                else
                {
                  uint64_t v152 = *MEMORY[0x263F08320];
                  v79 = [NSString stringWithFormat:@"UsageAliasValues usages for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"", v24, v115, objc_opt_class()];
                  v153 = v79;
                  v81 = NSDictionary;
                  v82 = &v153;
                  v83 = &v152;
                  uint64_t v84 = 1;
                }
                v98 = [v81 dictionaryWithObjects:v82 forKeys:v83 count:v84];
                *a5 = [v78 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v98];

                id v8 = v77;
                v20 = v76;
                v24 = v75;
              }
              v28 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v99 = objc_opt_class();
                *(_DWORD *)buf = 136315906;
                v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
                __int16 v139 = 2112;
                v140 = v24;
                __int16 v141 = 2112;
                v142 = v115;
                __int16 v143 = 2112;
                v144 = v99;
                id v100 = v99;
                _os_log_impl(&dword_23797A000, v28, OS_LOG_TYPE_DEFAULT, "%s UsageAliasValues usages for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"", buf, 0x2Au);
              }
              goto LABEL_56;
            }
            v114 = v24;
            v27 = [v20 objectForKeyedSubscript:v24];
            long long v120 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            v28 = v27;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v120 objects:v151 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v121;
              while (2)
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v121 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v120 + 1) + 8 * i);
                  v34 = [v28 objectForKeyedSubscript:v33];
                  objc_opt_class();
                  char v35 = objc_opt_isKindOfClass();

                  if ((v35 & 1) == 0)
                  {
                    if (a5)
                    {
                      id v48 = v8;
                      v49 = (void *)MEMORY[0x263F087E8];
                      if (*a5)
                      {
                        v149[0] = *MEMORY[0x263F08320];
                        v50 = [NSString stringWithFormat:@"UsageAliasValues usage value for usage \"%@\" for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"", v33, v114, v115, objc_opt_class()];
                        v149[1] = *MEMORY[0x263F08608];
                        id v51 = *a5;
                        v150[0] = v50;
                        v150[1] = v51;
                        v52 = NSDictionary;
                        v53 = (void **)v150;
                        v54 = v149;
                        uint64_t v55 = 2;
                      }
                      else
                      {
                        uint64_t v147 = *MEMORY[0x263F08320];
                        v50 = [NSString stringWithFormat:@"UsageAliasValues usage value for usage \"%@\" for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"", v33, v114, v115, objc_opt_class()];
                        v148 = v50;
                        v52 = NSDictionary;
                        v53 = &v148;
                        v54 = &v147;
                        uint64_t v55 = 1;
                      }
                      v56 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:v55];
                      *a5 = [v49 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v56];

                      id v8 = v48;
                    }
                    v57 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      v58 = objc_opt_class();
                      *(_DWORD *)buf = 136316162;
                      v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
                      __int16 v139 = 2112;
                      v140 = v33;
                      __int16 v141 = 2112;
                      v142 = v114;
                      __int16 v143 = 2112;
                      v144 = v115;
                      __int16 v145 = 2112;
                      v146 = v58;
                      id v59 = v58;
                      _os_log_impl(&dword_23797A000, v57, OS_LOG_TYPE_DEFAULT, "%s UsageAliasValues usage value for usage \"%@\" for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"", buf, 0x34u);
                    }
                    v20 = v111;
                    goto LABEL_56;
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v120 objects:v151 count:16];
                v15 = v115;
                if (v30) {
                  continue;
                }
                break;
              }
            }

            if (v8)
            {
              uint64_t v36 = MEMORY[0x237E26B30]();
              v37 = [v8 getAssetSet:v114];
              context = (void *)v36;
              if (v37)
              {
                v38 = 0;
              }
              else
              {
                v38 = [NSString stringWithFormat:@"UsageAliasValues asset set \"%@\" for value \"%@\" can't be found", v114, v15];
              }
              id v104 = v8;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              obj = v28;
              uint64_t v39 = [obj countByEnumeratingWithState:&v116 objects:v136 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v117;
LABEL_31:
                uint64_t v42 = 0;
                while (1)
                {
                  if (*(void *)v117 != v41) {
                    objc_enumerationMutation(obj);
                  }
                  if (v38) {
                    break;
                  }
                  uint64_t v43 = *(void *)(*((void *)&v116 + 1) + 8 * v42);
                  v44 = [v37 usageTypes];
                  char v45 = [v44 containsObject:v43];

                  if (v45)
                  {
                    v38 = 0;
                  }
                  else
                  {
                    v46 = NSString;
                    v47 = [v37 usageTypes];
                    v38 = [v46 stringWithFormat:@"UsageAliasValues usage \"%@\" in asset set \"%@\" for value \"%@\" not in valid usage types for set \"%@\"", v43, v114, v115, v47, context];
                  }
                  if (v40 == ++v42)
                  {
                    uint64_t v40 = [obj countByEnumeratingWithState:&v116 objects:v136 count:16];
                    if (v40) {
                      goto LABEL_31;
                    }
                    break;
                  }
                }
              }

              id v8 = v104;
              v15 = v115;
              if (v38)
              {
                if (a5)
                {
                  v92 = (void *)MEMORY[0x263F087E8];
                  if (*a5)
                  {
                    v134[0] = *MEMORY[0x263F08320];
                    v93 = [NSString stringWithFormat:@"%@", v38];
                    v134[1] = *MEMORY[0x263F08608];
                    v135[0] = v93;
                    v135[1] = *a5;
                    v94 = NSDictionary;
                    v95 = (void **)v135;
                    v96 = v134;
                    uint64_t v97 = 2;
                  }
                  else
                  {
                    uint64_t v132 = *MEMORY[0x263F08320];
                    v93 = [NSString stringWithFormat:@"%@", v38];
                    v133 = v93;
                    v94 = NSDictionary;
                    v95 = &v133;
                    v96 = &v132;
                    uint64_t v97 = 1;
                  }
                  v101 = [v94 dictionaryWithObjects:v95 forKeys:v96 count:v97];
                  *a5 = [v92 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v101];

                  id v8 = v104;
                }
                v102 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
                v20 = v111;
                if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
                  __int16 v139 = 2112;
                  v140 = v38;
                  _os_log_impl(&dword_23797A000, v102, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
                }

                v28 = obj;
LABEL_56:

                v11 = v112;
                goto LABEL_57;
              }
            }

            uint64_t v23 = v109 + 1;
            uint64_t v22 = v105;
            v20 = v111;
            v11 = v112;
          }
          while (v109 + 1 != v106);
          uint64_t v21 = [v111 countByEnumeratingWithState:&v124 objects:v156 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      uint64_t v14 = v110 + 1;
      uint64_t v13 = v107;
    }
    while (v110 + 1 != v108);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v128 objects:v165 count:16];
    LOBYTE(v10) = 1;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_58:

LABEL_59:
  return v10;
}

+ (id)fromContentsOfURL:(id)a3 assetSetManager:(id)a4 error:(id *)a5
{
  v47[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v33 = 0;
  v9 = [NSDictionary dictionaryWithContentsOfURL:v7 error:&v33];
  id v10 = v33;
  v11 = v10;
  if (a5)
  {
    id v12 = v10;
    *a5 = v12;
    if (v9)
    {
      if (!+[UAFUsageAliasConfiguration isValid:v9 assetSetManager:v8 error:a5])
      {
        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        if (*a5)
        {
          v36[0] = *MEMORY[0x263F08320];
          uint64_t v14 = [NSString stringWithFormat:@"Failed to validate UAFUsageAliasConfiguration dictionary from \"%@\"", v7];
          v36[1] = *MEMORY[0x263F08608];
          v37[0] = v14;
          v37[1] = *a5;
          v15 = NSDictionary;
          v16 = (void **)v37;
          v17 = v36;
          uint64_t v18 = 2;
        }
        else
        {
          uint64_t v34 = *MEMORY[0x263F08320];
          uint64_t v14 = [NSString stringWithFormat:@"Failed to validate UAFUsageAliasConfiguration dictionary from \"%@\"", v7];
          char v35 = v14;
          v15 = NSDictionary;
          v16 = &v35;
          v17 = &v34;
          uint64_t v18 = 1;
        }
        uint64_t v31 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
        *a5 = [v13 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v31];

        goto LABEL_19;
      }
      goto LABEL_10;
    }
    v20 = (void *)MEMORY[0x263F087E8];
    if (v12)
    {
      v46[0] = *MEMORY[0x263F08320];
      uint64_t v21 = [NSString stringWithFormat:@"Failed to load UAFUsageAliasConfiguration dictionary from \"%@\": %@", v7, v12];
      v46[1] = *MEMORY[0x263F08608];
      v47[0] = v21;
      v47[1] = *a5;
      uint64_t v22 = NSDictionary;
      uint64_t v23 = (void **)v47;
      v24 = v46;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v44 = *MEMORY[0x263F08320];
      uint64_t v21 = [NSString stringWithFormat:@"Failed to load UAFUsageAliasConfiguration dictionary from \"%@\": %@", v7, 0];
      char v45 = v21;
      uint64_t v22 = NSDictionary;
      uint64_t v23 = &v45;
      v24 = &v44;
      uint64_t v25 = 1;
    }
    char v26 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
    *a5 = [v20 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v26];
  }
  else if (v9)
  {
    if (!+[UAFUsageAliasConfiguration isValid:v9 assetSetManager:v8 error:0])
    {
LABEL_19:
      v27 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "+[UAFUsageAliasConfiguration fromContentsOfURL:assetSetManager:error:]";
      __int16 v40 = 2112;
      id v41 = v7;
      v28 = "%s Failed to validate UAFUsageAliasConfiguration dictionary from \"%@\"";
      uint64_t v29 = v27;
      uint32_t v30 = 22;
LABEL_25:
      _os_log_error_impl(&dword_23797A000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
      goto LABEL_20;
    }
LABEL_10:
    v19 = [[UAFUsageAliasConfiguration alloc] initWithDictionary:v9 assetSetManager:v8];
    goto LABEL_21;
  }
  v27 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = "+[UAFUsageAliasConfiguration fromContentsOfURL:assetSetManager:error:]";
    __int16 v40 = 2112;
    id v41 = v7;
    __int16 v42 = 2112;
    uint64_t v43 = v11;
    v28 = "%s Failed to load UAFUsageAliasConfiguration dictionary from \"%@\": %@";
    uint64_t v29 = v27;
    uint32_t v30 = 32;
    goto LABEL_25;
  }
LABEL_20:

  v19 = 0;
LABEL_21:

  return v19;
}

- (UAFUsageAliasConfiguration)initWithDictionary:(id)a3 assetSetManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UAFUsageAliasConfiguration;
  id v8 = [(UAFUsageAliasConfiguration *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"UsageAliasName"];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"UsageAliasValues"];
    values = v8->_values;
    v8->_values = (NSDictionary *)v11;

    objc_storeStrong((id *)&v8->_assetSetManager, a4);
    uint64_t v13 = v8;
  }

  return v8;
}

- (id)getTrialAssets:(id)a3
{
  return [(UAFUsageAliasConfiguration *)self getAssets:a3 withSource:@"Trial"];
}

- (id)getAutoAssets:(id)a3
{
  return [(UAFUsageAliasConfiguration *)self getAssets:a3 withSource:@"AutoAsset"];
}

- (id)getAssets:(id)a3
{
  return [(UAFUsageAliasConfiguration *)self getAssets:a3 withSource:@"All"];
}

- (id)getAssetSetAssets:(id)a3 usageValue:(id)a4 withSource:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(UAFUsageAliasConfiguration *)self values];
  id v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    objc_super v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(UAFUsageAliasConfiguration *)self name];
      int v28 = 136315906;
      uint64_t v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      char v35 = v20;
      uint64_t v21 = "%s Can't get %@ assets: Unknown usage value \"%@\" in usage alias \"%@\"";
      uint64_t v22 = v15;
      uint32_t v23 = 42;
LABEL_10:
      _os_log_impl(&dword_23797A000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v28, v23);
LABEL_11:
    }
LABEL_15:
    char v26 = 0;
    goto LABEL_21;
  }
  uint64_t v13 = [(UAFUsageAliasConfiguration *)self assetSetManager];

  if (!v13)
  {
    objc_super v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(UAFUsageAliasConfiguration *)self name];
      int v28 = 136315650;
      uint64_t v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v20;
      uint64_t v21 = "%s Can't get %@ assets: No asset manager present usage alias \"%@\"";
      uint64_t v22 = v15;
      uint32_t v23 = 32;
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  uint64_t v14 = [(UAFUsageAliasConfiguration *)self assetSetManager];
  objc_super v15 = [v14 getAssetSet:v8];

  if (!v15)
  {
    v24 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [(UAFUsageAliasConfiguration *)self name];
      int v28 = 136316162;
      uint64_t v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      char v35 = v25;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEFAULT, "%s Can't get %@ assets for usage value \"%@\" in usage alias \"%@\": Unable to get asset config for asset set \"%@\"", (uint8_t *)&v28, 0x34u);
    }
    objc_super v15 = 0;
    goto LABEL_15;
  }
  if (![v10 isEqualToString:@"AutoAsset"])
  {
    if ([v10 isEqualToString:@"Trial"])
    {
      v16 = [(UAFUsageAliasConfiguration *)self values];
      v17 = [v16 objectForKeyedSubscript:v9];
      uint64_t v18 = [v17 objectForKeyedSubscript:v8];
      uint64_t v19 = [v15 getTrialAssets:v18];
      goto LABEL_20;
    }
    if ([v10 isEqualToString:@"All"])
    {
      v16 = [(UAFUsageAliasConfiguration *)self values];
      v17 = [v16 objectForKeyedSubscript:v9];
      uint64_t v18 = [v17 objectForKeyedSubscript:v8];
      uint64_t v19 = [v15 getAssets:v18];
      goto LABEL_20;
    }
    v20 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315650;
      uint64_t v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_error_impl(&dword_23797A000, v20, OS_LOG_TYPE_ERROR, "%s Unknown asset source %@ for %@", (uint8_t *)&v28, 0x20u);
    }
    goto LABEL_11;
  }
  v16 = [(UAFUsageAliasConfiguration *)self values];
  v17 = [v16 objectForKeyedSubscript:v9];
  uint64_t v18 = [v17 objectForKeyedSubscript:v8];
  uint64_t v19 = [v15 getAutoAssets:v18];
LABEL_20:
  char v26 = (void *)v19;

LABEL_21:

  return v26;
}

- (id)getAssets:(id)a3 withSource:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v22 = self;
  id v23 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = [(UAFUsageAliasConfiguration *)self values];
  v24 = v6;
  id v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [(UAFUsageAliasConfiguration *)v22 getAssetSetAssets:*(void *)(*((void *)&v29 + 1) + 8 * i) usageValue:v24 withSource:v23];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              if (!v11) {
                uint64_t v11 = objc_opt_new();
              }
              uint64_t v19 = [v13 objectForKeyedSubscript:v18];
              [v11 setObject:v19 forKeyedSubscript:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v15);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (UAFConfigurationManager)assetSetManager
{
  return self->_assetSetManager;
}

- (void)setAssetSetManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetManager, 0);
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end