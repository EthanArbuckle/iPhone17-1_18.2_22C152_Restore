@interface UAFAssetConfiguration
+ (BOOL)isValid:(id)a3 validUsageTypes:(id)a4 error:(id *)a5;
- (BOOL)ignoreOSCompatibility;
- (NSArray)expansions;
- (NSDictionary)trialMATargetingTemplate;
- (NSString)name;
- (NSString)trialMAAssetType;
- (NSString)trialNamespace;
- (UAFAssetConfiguration)initWithDictionary:(id)a3;
- (id)getAutoAssetSpecifier:(id)a3;
- (id)getTrialFactorFallbackName:(id)a3;
- (id)getTrialFactorName:(id)a3;
- (void)setExpansions:(id)a3;
- (void)setIgnoreOSCompatibility:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTrialMAAssetType:(id)a3;
- (void)setTrialMATargetingTemplate:(id)a3;
- (void)setTrialNamespace:(id)a3;
@end

@implementation UAFAssetConfiguration

- (NSString)name
{
  return self->_name;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (NSString)trialMAAssetType
{
  return self->_trialMAAssetType;
}

- (id)getAutoAssetSpecifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(UAFAssetConfiguration *)self expansions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) getAutoAssetSpecifier:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSArray)expansions
{
  return self->_expansions;
}

- (id)getTrialFactorName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(UAFAssetConfiguration *)self expansions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) getTrialFactorName:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (UAFAssetConfiguration)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UAFAssetConfiguration;
  v5 = [(UAFAssetConfiguration *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AssetName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"TrialNamespace"];
    trialNamespace = v5->_trialNamespace;
    v5->_trialNamespace = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"TrialMAAssetType"];
    trialMAAssetType = v5->_trialMAAssetType;
    v5->_trialMAAssetType = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"TrialMATargetingTemplate"];
    trialMATargetingTemplate = v5->_trialMATargetingTemplate;
    v5->_trialMATargetingTemplate = (NSDictionary *)v12;

    long long v14 = [v4 objectForKeyedSubscript:@"IgnoreOSCompatibility"];
    v5->_ignoreOSCompatibility = [v14 BOOLValue];
    long long v15 = (NSArray *)objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"Expansions", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[UAFAssetExpansion alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * v20)];
          [(NSArray *)v15 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v18);
    }

    expansions = v5->_expansions;
    v5->_expansions = v15;

    v23 = v5;
  }

  return v5;
}

+ (BOOL)isValid:(id)a3 validUsageTypes:(id)a4 error:(id *)a5
{
  v162[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!+[UAFConfiguration isValidValue:v7 key:@"AssetName" kind:objc_opt_class() required:1 error:a5])
  {
    if (a5)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v161[0] = *MEMORY[0x263F08320];
        v22 = [NSString stringWithFormat:@"Unknown Asset is invalid"];
        v161[1] = *MEMORY[0x263F08608];
        v162[0] = v22;
        v162[1] = *a5;
        v23 = NSDictionary;
        v24 = (void **)v162;
        long long v25 = v161;
        uint64_t v26 = 2;
      }
      else
      {
        uint64_t v159 = *MEMORY[0x263F08320];
        v22 = [NSString stringWithFormat:@"Unknown Asset is invalid"];
        v160 = v22;
        v23 = NSDictionary;
        v24 = &v160;
        long long v25 = &v159;
        uint64_t v26 = 1;
      }
      v43 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
      *a5 = [v21 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v43];
    }
    long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
      _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s Unknown Asset is invalid", buf, 0xCu);
    }
    goto LABEL_77;
  }
  if (!+[UAFConfiguration isValidValue:v7 key:@"TrialNamespace" kind:objc_opt_class() required:0 error:a5])
  {
    if (a5)
    {
      long long v27 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v157[0] = *MEMORY[0x263F08320];
        long long v28 = NSString;
        objc_super v29 = [v7 objectForKeyedSubscript:@"AssetName"];
        v30 = [v28 stringWithFormat:@"Asset \"%@\" is invalid", v29];
        v157[1] = *MEMORY[0x263F08608];
        v158[0] = v30;
        v158[1] = *a5;
        uint64_t v31 = NSDictionary;
        v32 = (void **)v158;
        v33 = v157;
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v155 = *MEMORY[0x263F08320];
        v44 = NSString;
        objc_super v29 = [v7 objectForKeyedSubscript:@"AssetName"];
        v30 = [v44 stringWithFormat:@"Asset \"%@\" is invalid", v29];
        v156 = v30;
        uint64_t v31 = NSDictionary;
        v32 = &v156;
        v33 = &v155;
        uint64_t v34 = 1;
      }
      v45 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
      *a5 = [v27 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v45];
    }
    long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_77;
    }
    v46 = [v7 objectForKeyedSubscript:@"AssetName"];
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    __int16 v126 = 2112;
    v127 = v46;
    goto LABEL_76;
  }
  if (!+[UAFConfiguration isValidValue:v7 key:@"TrialMAAssetType" kind:objc_opt_class() required:0 error:a5])
  {
    if (a5)
    {
      v35 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v153[0] = *MEMORY[0x263F08320];
        v36 = NSString;
        v37 = [v7 objectForKeyedSubscript:@"AssetName"];
        v38 = [v36 stringWithFormat:@"Asset \"%@\" is invalid", v37];
        v153[1] = *MEMORY[0x263F08608];
        v154[0] = v38;
        v154[1] = *a5;
        v39 = NSDictionary;
        v40 = (void **)v154;
        v41 = v153;
        uint64_t v42 = 2;
      }
      else
      {
        uint64_t v151 = *MEMORY[0x263F08320];
        v56 = NSString;
        v37 = [v7 objectForKeyedSubscript:@"AssetName"];
        v38 = [v56 stringWithFormat:@"Asset \"%@\" is invalid", v37];
        v152 = v38;
        v39 = NSDictionary;
        v40 = &v152;
        v41 = &v151;
        uint64_t v42 = 1;
      }
      v57 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:v42];
      *a5 = [v35 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v57];
    }
    long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_77;
    }
    v46 = [v7 objectForKeyedSubscript:@"AssetName"];
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    __int16 v126 = 2112;
    v127 = v46;
    goto LABEL_76;
  }
  BOOL v9 = 0;
  if (!+[UAFConfiguration isValidValue:v7 key:@"IgnoreOSCompatibility" kind:objc_opt_class() required:0 error:a5])goto LABEL_79; {
  if (!+[UAFConfiguration isValidValue:v7 key:@"TrialMATargetingTemplate" kind:objc_opt_class() required:0 error:a5])
  }
  {
    if (a5)
    {
      v47 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v149[0] = *MEMORY[0x263F08320];
        v48 = NSString;
        v49 = [v7 objectForKeyedSubscript:@"AssetName"];
        v50 = [v48 stringWithFormat:@"Asset \"%@\" is invalid", v49];
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
        v74 = NSString;
        v49 = [v7 objectForKeyedSubscript:@"AssetName"];
        v50 = [v74 stringWithFormat:@"Asset \"%@\" is invalid", v49];
        v148 = v50;
        v52 = NSDictionary;
        v53 = &v148;
        v54 = &v147;
        uint64_t v55 = 1;
      }
      v75 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:v55];
      *a5 = [v47 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v75];
    }
    long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_77;
    }
    v46 = [v7 objectForKeyedSubscript:@"AssetName"];
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    __int16 v126 = 2112;
    v127 = v46;
    goto LABEL_76;
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:@"TrialMATargetingTemplate"];

  if (v10)
  {
    v11 = [v7 objectForKeyedSubscript:@"TrialMATargetingTemplate"];
    BOOL v12 = +[UAFConfiguration isValidValue:v11 key:@"MetadataAttribute" kind:objc_opt_class() required:1 error:a5];

    if (!v12)
    {
      if (a5)
      {
        v58 = (void *)MEMORY[0x263F087E8];
        if (*a5)
        {
          v145[0] = *MEMORY[0x263F08320];
          v59 = NSString;
          v60 = [v7 objectForKeyedSubscript:@"AssetName"];
          v61 = [v59 stringWithFormat:@"Asset \"%@\" is invalid", v60];
          v145[1] = *MEMORY[0x263F08608];
          v146[0] = v61;
          v146[1] = *a5;
          v62 = NSDictionary;
          v63 = (void **)v146;
          v64 = v145;
          uint64_t v65 = 2;
        }
        else
        {
          uint64_t v143 = *MEMORY[0x263F08320];
          v99 = NSString;
          v60 = [v7 objectForKeyedSubscript:@"AssetName"];
          v61 = [v99 stringWithFormat:@"Asset \"%@\" is invalid", v60];
          v144 = v61;
          v62 = NSDictionary;
          v63 = &v144;
          v64 = &v143;
          uint64_t v65 = 1;
        }
        v100 = [v62 dictionaryWithObjects:v63 forKeys:v64 count:v65];
        *a5 = [v58 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v100];
      }
      long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_77;
      }
      v46 = [v7 objectForKeyedSubscript:@"AssetName"];
      *(_DWORD *)buf = 136315394;
      v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
      __int16 v126 = 2112;
      v127 = v46;
      goto LABEL_76;
    }
    long long v13 = [v7 objectForKeyedSubscript:@"TrialMATargetingTemplate"];
    BOOL v14 = +[UAFConfiguration isValidValue:v13 key:@"ValueExpansion" kind:objc_opt_class() required:1 error:a5];

    if (!v14)
    {
      if (a5)
      {
        v76 = (void *)MEMORY[0x263F087E8];
        if (*a5)
        {
          v141[0] = *MEMORY[0x263F08320];
          v77 = NSString;
          v78 = [v7 objectForKeyedSubscript:@"AssetName"];
          v79 = [v77 stringWithFormat:@"Asset \"%@\" is invalid", v78];
          v141[1] = *MEMORY[0x263F08608];
          v142[0] = v79;
          v142[1] = *a5;
          v80 = NSDictionary;
          v81 = (void **)v142;
          v82 = v141;
          uint64_t v83 = 2;
        }
        else
        {
          uint64_t v139 = *MEMORY[0x263F08320];
          v103 = NSString;
          v78 = [v7 objectForKeyedSubscript:@"AssetName"];
          v79 = [v103 stringWithFormat:@"Asset \"%@\" is invalid", v78];
          v140 = v79;
          v80 = NSDictionary;
          v81 = &v140;
          v82 = &v139;
          uint64_t v83 = 1;
        }
        v104 = [v80 dictionaryWithObjects:v81 forKeys:v82 count:v83];
        *a5 = [v76 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v104];
      }
      long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_77;
      }
      v46 = [v7 objectForKeyedSubscript:@"AssetName"];
      *(_DWORD *)buf = 136315394;
      v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
      __int16 v126 = 2112;
      v127 = v46;
      goto LABEL_76;
    }
  }
  if (!+[UAFConfiguration isValidValue:v7 key:@"Expansions" kind:objc_opt_class() required:0 error:a5])
  {
    if (a5)
    {
      v66 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v137[0] = *MEMORY[0x263F08320];
        v67 = NSString;
        v68 = [v7 objectForKeyedSubscript:@"AssetName"];
        v69 = [v67 stringWithFormat:@"Asset \"%@\" is invalid", v68];
        v137[1] = *MEMORY[0x263F08608];
        v138[0] = v69;
        v138[1] = *a5;
        v70 = NSDictionary;
        v71 = (void **)v138;
        v72 = v137;
        uint64_t v73 = 2;
      }
      else
      {
        uint64_t v135 = *MEMORY[0x263F08320];
        v101 = NSString;
        v68 = [v7 objectForKeyedSubscript:@"AssetName"];
        v69 = [v101 stringWithFormat:@"Asset \"%@\" is invalid", v68];
        v136 = v69;
        v70 = NSDictionary;
        v71 = &v136;
        v72 = &v135;
        uint64_t v73 = 1;
      }
      v102 = [v70 dictionaryWithObjects:v71 forKeys:v72 count:v73];
      *a5 = [v66 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v102];
    }
    long long v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_77;
    }
    v46 = [v7 objectForKeyedSubscript:@"AssetName"];
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    __int16 v126 = 2112;
    v127 = v46;
LABEL_76:
    _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s Asset \"%@\" is invalid", buf, 0x16u);

LABEL_77:
    BOOL v9 = 0;
    goto LABEL_78;
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v15 = [v7 objectForKeyedSubscript:@"Expansions"];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v116 objects:v134 count:16];
  if (!v16)
  {
    BOOL v9 = 1;
    goto LABEL_78;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v117;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v117 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void *)(*((void *)&v116 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          v115 = (void *)MEMORY[0x263F087E8];
          if (*a5)
          {
            v132[0] = *MEMORY[0x263F08320];
            v84 = NSString;
            v85 = [v7 objectForKeyedSubscript:@"AssetName"];
            v86 = [v84 stringWithFormat:@"Asset \"%@\" is not expected kind \"%@\"", v85, objc_opt_class()];
            v132[1] = *MEMORY[0x263F08608];
            v133[0] = v86;
            v133[1] = *a5;
            v87 = NSDictionary;
            v88 = (void **)v133;
            v89 = v132;
            uint64_t v90 = 2;
          }
          else
          {
            uint64_t v130 = *MEMORY[0x263F08320];
            v106 = NSString;
            v85 = [v7 objectForKeyedSubscript:@"AssetName"];
            v86 = [v106 stringWithFormat:@"Asset \"%@\" is not expected kind \"%@\"", v85, objc_opt_class()];
            v131 = v86;
            v87 = NSDictionary;
            v88 = &v131;
            v89 = &v130;
            uint64_t v90 = 1;
          }
          v107 = [v87 dictionaryWithObjects:v88 forKeys:v89 count:v90];
          *a5 = [v115 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v107];
        }
        v108 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v109 = [v7 objectForKeyedSubscript:@"AssetName"];
          v110 = objc_opt_class();
          *(_DWORD *)buf = 136315650;
          v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
          __int16 v126 = 2112;
          v127 = v109;
          __int16 v128 = 2112;
          v129 = v110;
          id v111 = v110;
          _os_log_impl(&dword_23797A000, v108, OS_LOG_TYPE_DEFAULT, "%s Asset \"%@\" is not expected kind \"%@\"", buf, 0x20u);
        }
        goto LABEL_88;
      }
      if (!+[UAFAssetExpansion isValid:v20 validUsageTypes:v8 error:a5])
      {
        if (a5)
        {
          v91 = (void *)MEMORY[0x263F087E8];
          if (*a5)
          {
            v122[0] = *MEMORY[0x263F08320];
            v92 = NSString;
            v93 = [v7 objectForKeyedSubscript:@"AssetName"];
            v94 = [v92 stringWithFormat:@"Asset \"%@\" is invalid", v93];
            v122[1] = *MEMORY[0x263F08608];
            v123[0] = v94;
            v123[1] = *a5;
            v95 = NSDictionary;
            v96 = (void **)v123;
            v97 = v122;
            uint64_t v98 = 2;
          }
          else
          {
            uint64_t v120 = *MEMORY[0x263F08320];
            v112 = NSString;
            v93 = [v7 objectForKeyedSubscript:@"AssetName"];
            v94 = [v112 stringWithFormat:@"Asset \"%@\" is invalid", v93];
            v121 = v94;
            v95 = NSDictionary;
            v96 = &v121;
            v97 = &v120;
            uint64_t v98 = 1;
          }
          v113 = [v95 dictionaryWithObjects:v96 forKeys:v97 count:v98];
          *a5 = [v91 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v113];
        }
        v108 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v114 = [v7 objectForKeyedSubscript:@"AssetName"];
          *(_DWORD *)buf = 136315394;
          v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
          __int16 v126 = 2112;
          v127 = v114;
          _os_log_impl(&dword_23797A000, v108, OS_LOG_TYPE_DEFAULT, "%s Asset \"%@\" is invalid", buf, 0x16u);
        }
LABEL_88:

        goto LABEL_77;
      }
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v116 objects:v134 count:16];
    BOOL v9 = 1;
    if (v17) {
      continue;
    }
    break;
  }
LABEL_78:

LABEL_79:
  return v9;
}

- (id)getTrialFactorFallbackName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(UAFAssetConfiguration *)self expansions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) getTrialFactorFallbackName:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)setName:(id)a3
{
}

- (void)setTrialNamespace:(id)a3
{
}

- (void)setTrialMAAssetType:(id)a3
{
}

- (BOOL)ignoreOSCompatibility
{
  return self->_ignoreOSCompatibility;
}

- (void)setIgnoreOSCompatibility:(BOOL)a3
{
  self->_ignoreOSCompatibility = a3;
}

- (void)setExpansions:(id)a3
{
}

- (NSDictionary)trialMATargetingTemplate
{
  return self->_trialMATargetingTemplate;
}

- (void)setTrialMATargetingTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMATargetingTemplate, 0);
  objc_storeStrong((id *)&self->_expansions, 0);
  objc_storeStrong((id *)&self->_trialMAAssetType, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end