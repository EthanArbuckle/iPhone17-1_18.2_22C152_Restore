@interface TRINamespaceFactorProviderChain
+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4;
+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4 excludingTreatmentLayers:(unint64_t)a5;
+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4 resolver:(id)a5;
- (BOOL)hasAnyTreatmentInLayers:(unint64_t)a3;
- (BOOL)isRegistered;
- (TRINamespaceFactorProviderChain)initWithNamespaceName:(id)a3 typedProviderChain:(id)a4 paths:(id)a5;
- (TRINamespaceFactorProviderChain)initWithNamespaceName:(id)a3 typedProviderChain:(id)a4 paths:(id)a5 excludingTreatmentLayers:(unint64_t)a6;
- (id)_dealiasedFactorLevelForFactorLevel:(id)a3 unaliasedName:(id)a4;
- (id)experimentId;
- (id)factorLevels;
- (id)factorNamesWithObfuscation:(id)a3;
- (id)levelForFactor:(id)a3;
- (id)levelForFactor:(id)a3 outProvider:(id *)a4;
- (id)namespaceName;
- (id)promotableFactorPackId;
- (id)providerForTreatmentLayer:(unint64_t)a3;
- (id)rolloutId;
- (id)treatmentId;
- (int)deploymentId;
- (unsigned)namespaceCompatibilityVersion;
- (unsigned)namespaceId;
- (void)cacheFactorLevels;
- (void)computeTreatmentAssetIndexes:(id *)a3 withAssociatedExperimentIds:(id *)a4 andFactorPackAssetIds:(id *)a5 withAssociatedRolloutDeployments:(id *)a6 withExperimentFactorNames:(id *)a7 andRolloutFactorNames:(id *)a8 forFactors:(id)a9 usingFilter:(id)a10;
- (void)dispose;
@end

@implementation TRINamespaceFactorProviderChain

- (id)levelForFactor:(id)a3 outProvider:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = self->_providerChain;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    location = a4;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = [v12 levelForFactor:v6];
        if (v13)
        {
          if (location) {
            objc_storeStrong(location, v12);
          }
          id v16 = v13;
          goto LABEL_21;
        }
        v14 = [(NSDictionary *)self->_aliasMap objectForKeyedSubscript:v6];

        if (v14)
        {
          v15 = [(NSDictionary *)self->_aliasMap objectForKeyedSubscript:v6];
          id v16 = [v12 levelForFactor:v15];

          if (v16)
          {
            if (location) {
              objc_storeStrong(location, v12);
            }
LABEL_21:

            goto LABEL_26;
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      a4 = location;
      if (v9) {
        continue;
      }
      break;
    }
  }

  if ([(NSArray *)self->_providerChain count])
  {
    if (+[TRIProcessInfo hostingProcessIsTriald]
      && ![(NSString *)self->_namespaceName hasPrefix:@"TRIAL_"])
    {
      v17 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_30:
        namespaceName = self->_namespaceName;
        *(_DWORD *)buf = 138412546;
        v26 = namespaceName;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "Namespace %@ does not provide a factor with name \"%@\".  Please check your factor name against your factor definitions on trial.apple.com.", buf, 0x16u);
      }
    }
    else
    {
      v17 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
    }
  }
  id v16 = 0;
  if (a4)
  {
    v7 = (NSArray *)*a4;
    *a4 = 0;
LABEL_26:
  }
  return v16;
}

- (id)levelForFactor:(id)a3
{
  return [(TRINamespaceFactorProviderChain *)self levelForFactor:a3 outProvider:0];
}

- (id)providerForTreatmentLayer:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      installedProvider = self->_installedProvider;
      goto LABEL_11;
    case 2uLL:
      installedProvider = self->_rolloutProvider;
      goto LABEL_11;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 4uLL:
      installedProvider = self->_experimentProvider;
      goto LABEL_11;
    case 8uLL:
      installedProvider = self->_devOverrideProvider;
      goto LABEL_11;
    default:
      if (a3 == 16)
      {
        installedProvider = self->_bmltProvider;
      }
      else
      {
        if (a3 != 32)
        {
LABEL_6:
          v7 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRINamespaceFactorProviderChain.m", 206, @"Bad layer 0x%llx", a3);

          goto LABEL_12;
        }
        installedProvider = self->_factorPackExperimentProvider;
      }
LABEL_11:
      uint64_t v8 = installedProvider;
LABEL_12:
      return v8;
  }
}

- (TRINamespaceFactorProviderChain)initWithNamespaceName:(id)a3 typedProviderChain:(id)a4 paths:(id)a5 excludingTreatmentLayers:(unint64_t)a6
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v106.receiver = self;
  v106.super_class = (Class)TRINamespaceFactorProviderChain;
  id v11 = a4;
  id v12 = a5;
  v13 = [(TRINamespaceFactorProviderChain *)&v106 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_81;
  }
  v89 = v13;
  objc_storeStrong((id *)&v13->_namespaceName, a3);
  v93 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  id v88 = v12;
  v15 = [v12 namespaceDescriptorsDefaultDir];
  v94 = +[TRINamespaceDescriptor loadWithNamespaceName:v10 fromDirectory:v15];

  id v16 = [v11 lastObject];
  if (v16)
  {
    v17 = [v11 lastObject];
    v18 = [v17 provider];
    v19 = v11;
    int v20 = [v18 namespaceCompatibilityVersion];
  }
  else
  {
    v19 = v11;
    int v20 = 0;
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v87 = v19;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v102 objects:v112 count:16];
  id v86 = v10;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v103;
    p_rolloutProvider = (uint64_t *)&v89->_rolloutProvider;
    v95 = 0;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v103 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        __int16 v27 = [v26 provider];
        int v28 = [v27 namespaceCompatibilityVersion];

        uint64_t v29 = [v26 type];
        if (v28 == v20)
        {
          p_devOverrideProvider = (void **)&v89->_devOverrideProvider;
          switch(v29)
          {
            case 1:
              p_devOverrideProvider = (void **)&v89->_installedProvider;
              goto LABEL_26;
            case 2:
              p_devOverrideProvider = (void **)&v89->_rolloutProvider;
              goto LABEL_26;
            case 3:
            case 5:
            case 6:
            case 7:
              goto LABEL_27;
            case 4:
              p_devOverrideProvider = (void **)&v89->_experimentProvider;
              goto LABEL_26;
            case 8:
              goto LABEL_26;
            default:
              if (v29 == 16)
              {
                p_devOverrideProvider = (void **)&v89->_bmltProvider;
              }
              else
              {
                p_devOverrideProvider = (void **)&v89->_factorPackExperimentProvider;
                if (v29 != 32) {
                  goto LABEL_27;
                }
              }
LABEL_26:
              uint64_t v42 = [v26 provider];
              v43 = *p_devOverrideProvider;
              *p_devOverrideProvider = (void *)v42;

LABEL_27:
              if (([v26 type] & a6) != 0) {
                continue;
              }
              v38 = [v26 provider];
              [(NSArray *)v93 addObject:v38];
              break;
          }
        }
        else
        {
          if (v29 != 2) {
            goto LABEL_18;
          }
          v31 = [v94 upgradeNCVs];
          v32 = NSNumber;
          v33 = [v26 provider];
          v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "namespaceCompatibilityVersion"));
          int v35 = [v31 containsObject:v34];

          if (v35)
          {
            v36 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = [v26 logDesc];
              *(_DWORD *)buf = 138412290;
              id v109 = v37;
              _os_log_impl(&dword_19D909000, v36, OS_LOG_TYPE_DEFAULT, "Namespace factor provider \"%@\" is upgrade compatible. Keeping it in case there's no factor provider matching the download NCV.", buf, 0xCu);
            }
            v38 = v95;
            v95 = v26;
          }
          else
          {
LABEL_18:
            v38 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = [v26 logDesc];
              v40 = [v26 provider];
              int v41 = [v40 namespaceCompatibilityVersion];
              *(_DWORD *)buf = 138412802;
              id v109 = v39;
              __int16 v110 = 1024;
              *(_DWORD *)v111 = v20;
              *(_WORD *)&v111[4] = 1024;
              *(_DWORD *)&v111[6] = v41;
              _os_log_impl(&dword_19D909000, v38, OS_LOG_TYPE_DEFAULT, "Omitting namespace factor provider \"%@\" due to NCV incompatibility (exp %u, act %u).", buf, 0x18u);
            }
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v102 objects:v112 count:16];
    }
    while (v23);

    v44 = (id *)&v89->_rolloutProvider;
    id v12 = v88;
    if (*p_rolloutProvider)
    {
      id v10 = v86;
      id v11 = v87;
      p_isa = (id *)&v89->super.isa;
    }
    else
    {
      id v10 = v86;
      id v11 = v87;
      p_isa = (id *)&v89->super.isa;
      if (v95)
      {
        v46 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = [v95 logDesc];
          *(_DWORD *)buf = 138412290;
          id v109 = v47;
          _os_log_impl(&dword_19D909000, v46, OS_LOG_TYPE_DEFAULT, "Didn't find a download-NCV compatible rollout namespace factor provider. Using upgrade-NCV compatible factor provider instead: \"%@\".", buf, 0xCu);

          id v12 = v88;
        }

        uint64_t v48 = [v95 provider];
        v44 = (id *)&v89->_rolloutProvider;
        v49 = (void *)*p_rolloutProvider;
        uint64_t *p_rolloutProvider = v48;

        if ((a6 & 2) == 0) {
          [(NSArray *)v93 insertObject:*p_rolloutProvider atIndex:0];
        }
      }
    }
  }
  else
  {

    v95 = 0;
    id v12 = v88;
    p_isa = (id *)&v89->super.isa;
    v44 = (id *)&v89->_rolloutProvider;
    id v11 = v19;
  }
  if (![(NSArray *)v93 count])
  {
    v50 = v44;
    v51 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = objc_msgSend(v21, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
      *(_DWORD *)buf = 138412546;
      id v109 = v10;
      __int16 v110 = 2112;
      *(void *)v111 = v52;
      _os_log_impl(&dword_19D909000, v51, OS_LOG_TYPE_DEFAULT, "no factor providers loaded for namespace %@ from directories %@", buf, 0x16u);

      id v12 = v88;
    }

    v44 = v50;
  }
  v53 = p_isa + 3;
  if (!p_isa[3]) {
    goto LABEL_65;
  }
  v91 = v44;
  v96 = (NSDictionary *)objc_opt_new();
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v92 = p_isa + 3;
  v54 = [*v53 factorLevels];
  uint64_t v55 = [v54 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (!v55) {
    goto LABEL_56;
  }
  uint64_t v56 = v55;
  uint64_t v57 = *(void *)v99;
  do
  {
    for (uint64_t j = 0; j != v56; ++j)
    {
      if (*(void *)v99 != v57) {
        objc_enumerationMutation(v54);
      }
      v59 = *(void **)(*((void *)&v98 + 1) + 8 * j);
      v60 = [v59 factor];
      if ([v60 hasAlias])
      {
        v61 = [v59 factor];
        v62 = [v61 alias];
        char v63 = [v62 isEqual:&stru_1EEFB6D68];

        if (v63) {
          continue;
        }
        v60 = [v59 factor];
        v64 = [v60 alias];
        v65 = [v59 factor];
        v66 = [v65 name];
        [(NSDictionary *)v96 setObject:v64 forKeyedSubscript:v66];
      }
    }
    uint64_t v56 = [v54 countByEnumeratingWithState:&v98 objects:v107 count:16];
  }
  while (v56);
LABEL_56:

  v67 = [(NSDictionary *)v96 allKeys];
  unint64_t v68 = [v67 count];
  v69 = [(NSDictionary *)v96 allValues];
  unint64_t v70 = [v69 count];

  if (v68 > v70)
  {
    v71 = TRILogCategory_ClientFramework();
    v53 = v92;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D909000, v71, OS_LOG_TYPE_ERROR, "Found multiple factor names sharing a common alias. Every factor name and any corresponding alias should be unique and 1-1 within a given namespace.", buf, 2u);
    }
    id v10 = v86;
    id v11 = v87;
    id v12 = v88;
    v44 = v91;
    goto LABEL_63;
  }
  v72 = [(NSDictionary *)v96 allKeys];
  unint64_t v73 = [v72 count];
  v74 = [(NSDictionary *)v96 allValues];
  unint64_t v75 = [v74 count];

  BOOL v76 = v73 >= v75;
  id v10 = v86;
  id v11 = v87;
  id v12 = v88;
  v44 = v91;
  v53 = v92;
  if (!v76)
  {
    v71 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D909000, v71, OS_LOG_TYPE_ERROR, "Found multiple aliases for a given factor name. Every factor name and any corresponding alias should be unique and 1-1 within a given namespace.", buf, 2u);
    }
LABEL_63:
  }
  p_isa = (id *)&v89->super.isa;
  aliasMap = v89->_aliasMap;
  v89->_aliasMap = v96;

LABEL_65:
  if ((a6 & 2) != 0) {
    id v78 = 0;
  }
  else {
    id v78 = *v44;
  }
  objc_storeStrong(v44, v78);
  if ((a6 & 0x20) != 0) {
    id v79 = 0;
  }
  else {
    id v79 = p_isa[6];
  }
  objc_storeStrong(p_isa + 6, v79);
  if ((a6 & 4) != 0) {
    id v80 = 0;
  }
  else {
    id v80 = p_isa[5];
  }
  objc_storeStrong(p_isa + 5, v80);
  if (a6) {
    id v81 = 0;
  }
  else {
    id v81 = *v53;
  }
  objc_storeStrong(v53, v81);
  if ((a6 & 0x10) != 0) {
    id v82 = 0;
  }
  else {
    id v82 = p_isa[8];
  }
  objc_storeStrong(p_isa + 8, v82);
  providerChain = v89->_providerChain;
  v89->_providerChain = v93;
  v84 = v93;

  v14 = v89;
LABEL_81:

  return v14;
}

- (TRINamespaceFactorProviderChain)initWithNamespaceName:(id)a3 typedProviderChain:(id)a4 paths:(id)a5
{
  return [(TRINamespaceFactorProviderChain *)self initWithNamespaceName:a3 typedProviderChain:a4 paths:a5 excludingTreatmentLayers:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasMap, 0);
  objc_storeStrong((id *)&self->_bmltProvider, 0);
  objc_storeStrong((id *)&self->_devOverrideProvider, 0);
  objc_storeStrong((id *)&self->_factorPackExperimentProvider, 0);
  objc_storeStrong((id *)&self->_experimentProvider, 0);
  objc_storeStrong((id *)&self->_rolloutProvider, 0);
  objc_storeStrong((id *)&self->_installedProvider, 0);
  objc_storeStrong((id *)&self->_providerChain, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

- (id)factorLevels
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x19F3AD060](self, a2);
  v3 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [(NSArray *)self->_providerChain reverseObjectEnumerator];
  uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v4;
        v5 = *(void **)(*((void *)&v33 + 1) + 8 * v4);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        objc_msgSend(v5, "factorLevels", context);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = [v28 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v30 != v8) {
                objc_enumerationMutation(v28);
              }
              id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              id v11 = (void *)MEMORY[0x19F3AD060]();
              id v12 = v10;
              aliasMap = self->_aliasMap;
              v14 = [v12 factor];
              v15 = [v14 name];
              id v16 = [(NSDictionary *)aliasMap allKeysForObject:v15];

              if (v16 && [v16 count] == 1)
              {
                v17 = [v16 objectAtIndexedSubscript:0];
                uint64_t v18 = [(TRINamespaceFactorProviderChain *)self _dealiasedFactorLevelForFactorLevel:v12 unaliasedName:v17];

                id v12 = (id)v18;
              }
              v19 = [v12 factor];
              int v20 = [v19 name];
              [v3 setObject:v12 forKeyedSubscript:v20];
            }
            uint64_t v7 = [v28 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }

  id v21 = [v3 allValues];

  return v21;
}

+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[TRINamespaceResolver alloc] initWithPaths:v7];
  uint64_t v9 = [a1 factorProviderWithPaths:v7 namespaceName:v6 resolver:v8];

  return v9;
}

+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4 excludingTreatmentLayers:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[TRINamespaceResolver alloc] initWithPaths:v9];
  id v11 = [(TRINamespaceResolver *)v10 resolveFactorProviderChainForNamespaceName:v8 faultOnMissingInstalledFactors:0 installedFactorsAccessible:0];
  id v12 = (void *)[objc_alloc((Class)a1) initWithNamespaceName:v8 typedProviderChain:v11 paths:v9 excludingTreatmentLayers:a5];

  return v12;
}

+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4 resolver:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a5 resolveFactorProviderChainForNamespaceName:v8 faultOnMissingInstalledFactors:1 installedFactorsAccessible:0];
  id v11 = (void *)[objc_alloc((Class)a1) initWithNamespaceName:v8 typedProviderChain:v10 paths:v9];

  return v11;
}

uint64_t __107__TRINamespaceFactorProviderChain_initWithNamespaceName_typedProviderChain_paths_excludingTreatmentLayers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logDesc];
}

- (id)namespaceName
{
  return self->_namespaceName;
}

- (id)experimentId
{
  v2 = [(NSArray *)self->_providerChain firstObject];
  v3 = [v2 experimentId];

  return v3;
}

- (int)deploymentId
{
  v2 = [(NSArray *)self->_providerChain firstObject];
  int v3 = [v2 deploymentId];

  return v3;
}

- (id)treatmentId
{
  v2 = [(NSArray *)self->_providerChain firstObject];
  int v3 = [v2 treatmentId];

  return v3;
}

- (id)rolloutId
{
  return (id)[(TRINamespaceFactorProviding *)self->_rolloutProvider treatmentId];
}

- (unsigned)namespaceCompatibilityVersion
{
  v2 = [(NSArray *)self->_providerChain lastObject];
  unsigned int v3 = [v2 namespaceCompatibilityVersion];

  return v3;
}

- (BOOL)isRegistered
{
  return self->_installedProvider != 0;
}

- (BOOL)hasAnyTreatmentInLayers:(unint64_t)a3
{
  if ((a3 & 1) != 0 && self->_installedProvider
    || (a3 & 2) != 0 && self->_rolloutProvider
    || (a3 & 4) != 0 && self->_experimentProvider
    || (a3 & 0x10) != 0 && self->_bmltProvider)
  {
    return 1;
  }
  if ((a3 & 0x20) != 0) {
    return self->_factorPackExperimentProvider != 0;
  }
  return 0;
}

- (void)cacheFactorLevels
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_providerChain;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cacheFactorLevels", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)computeTreatmentAssetIndexes:(id *)a3 withAssociatedExperimentIds:(id *)a4 andFactorPackAssetIds:(id *)a5 withAssociatedRolloutDeployments:(id *)a6 withExperimentFactorNames:(id *)a7 andRolloutFactorNames:(id *)a8 forFactors:(id)a9 usingFilter:(id)a10
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v13 = a9;
  id v14 = a10;
  location = a3;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 276, @"Invalid parameter not satisfying: %@", @"assetIndexes" object file lineNumber description];

    if (a5)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_74:
      uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
      [v57 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 278, @"Invalid parameter not satisfying: %@", @"factorNames" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
LABEL_75:
      v58 = [MEMORY[0x1E4F28B00] currentHandler];
      [v58 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 279, @"Invalid parameter not satisfying: %@", @"filterBlock" object file lineNumber description];

      goto LABEL_5;
    }
  }
  uint64_t v56 = [MEMORY[0x1E4F28B00] currentHandler];
  [v56 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 277, @"Invalid parameter not satisfying: %@", @"assetIds" object file lineNumber description];

  if (!v13) {
    goto LABEL_74;
  }
LABEL_4:
  if (!v14) {
    goto LABEL_75;
  }
LABEL_5:
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke;
  v99[3] = &unk_1E596B6E8;
  id v15 = v14;
  id v100 = v15;
  v99[4] = self;
  id v16 = (void *)MEMORY[0x19F3AD290](v99);
  uint64_t v17 = objc_opt_new();
  obuint64_t j = (id)objc_opt_new();
  uint64_t v18 = objc_opt_new();
  id v69 = (id)objc_opt_new();
  v19 = (void *)v17;
  id v71 = (id)objc_opt_new();
  int v20 = objc_opt_new();
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke_2;
  v95[3] = &unk_1E596B710;
  v84 = v16;
  long long v98 = v84;
  id v61 = v18;
  id v63 = v18;
  id v96 = v63;
  id v60 = v20;
  id v62 = v20;
  id v97 = v62;
  v85 = (uint64_t (**)(void, void, void, void))MEMORY[0x19F3AD290](v95);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v21 = v13;
  uint64_t v80 = [v21 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (!v80) {
    goto LABEL_63;
  }
  uint64_t v79 = *(void *)v92;
  unint64_t v75 = self;
  BOOL v76 = a5;
  unint64_t v73 = (void *)v17;
  id v74 = v15;
  id v72 = v21;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v92 != v79) {
        objc_enumerationMutation(v21);
      }
      uint64_t v23 = *(void *)(*((void *)&v91 + 1) + 8 * v22);
      uint64_t v24 = (void *)MEMORY[0x19F3AD060]();
      v90 = 0;
      uint64_t v25 = [(TRINamespaceFactorProviderChain *)self levelForFactor:v23 outProvider:&v90];
      v83 = v25;
      if (!v25)
      {
        ((void (*)(void (**)(void), __CFString *, uint64_t, uint64_t))v84[2])(v84, @"Unknown factor", v23, 9);
        goto LABEL_27;
      }
      id v81 = v24;
      if (!v90)
      {
        v52 = v25;
        v53 = [MEMORY[0x1E4F28B00] currentHandler];
        [v53 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 335, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];

        uint64_t v25 = v52;
      }
      uint64_t v26 = [v25 fileOrDirectoryLevelWithIsDir:0];
      id v82 = (void *)v26;
      if (!v26)
      {
        id v28 = v84[2];
LABEL_25:
        v28();
        goto LABEL_26;
      }
      if ((*((unsigned int (**)(id, uint64_t, uint64_t, void))v15 + 2))(v15, v23, v26, 0))
      {
        uint64_t v27 = [(TRINamespaceFactorProviding *)v90 treatmentId];
        if (v27)
        {
        }
        else
        {
          long long v29 = [(TRINamespaceFactorProviding *)v90 rolloutId];

          if (!v29) {
            goto LABEL_26;
          }
        }
        if (([v82 hasAsset] & 1) == 0)
        {
          id v28 = v84[2];
          goto LABEL_25;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((((uint64_t (**)(void, TRINamespaceFactorProviding *, uint64_t, void *))v85)[2](v85, v90, v23, v82) & 1) == 0)goto LABEL_26; {
        }
          }
        else
        {
          long long v30 = [(TRINamespaceFactorProviding *)v90 treatmentId];

          if (!v30)
          {
            long long v35 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v51 = [(TRINamespaceFactorProviding *)v90 experimentId];
              *(_DWORD *)buf = 138412290;
              long long v103 = v51;
              _os_log_error_impl(&dword_19D909000, v35, OS_LOG_TYPE_ERROR, "Provider's treatmentId is unexpectedly nil for experiment %@", buf, 0xCu);
            }
            goto LABEL_26;
          }
          id v78 = [v82 asset];
          long long v31 = [(TRINamespaceFactorProviding *)v90 treatmentId];
          long long v32 = [v19 objectForKeyedSubscript:v31];
          long long v33 = v32;
          if (v32) {
            id v34 = v32;
          }
          else {
            id v34 = (id)objc_opt_new();
          }
          v77 = v34;

          if ([v78 hasCloudKitIndex])
          {
            long long v36 = [v82 asset];
            v37 = v77;
            objc_msgSend(v77, "addIndex:", -[NSObject cloudKitIndex](v36, "cloudKitIndex"));
          }
          else
          {
            long long v36 = TRILogCategory_ClientFramework();
            v37 = v77;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              long long v103 = v82;
              _os_log_impl(&dword_19D909000, v36, OS_LOG_TYPE_DEFAULT, "Level does not have a cloudKitIndex: %{public}@, this usually implies that the asset is coming from an MA reference", buf, 0xCu);
            }
          }

          v38 = [(TRINamespaceFactorProviding *)v90 treatmentId];
          [v19 setObject:v37 forKeyedSubscript:v38];

          uint64_t v39 = [(TRINamespaceFactorProviding *)v90 experimentId];

          if (v39)
          {
            v40 = [(TRINamespaceFactorProviding *)v90 experimentId];
            [obj addObject:v40];
          }
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          int v41 = self->_providerChain;
          uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v86 objects:v101 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v87;
            do
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v87 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v47 = [v46 levelForFactor:v23];
                  uint64_t v48 = v47;
                  if (v47)
                  {
                    v49 = [v47 fileOrDirectoryLevelWithIsDir:0];
                    if (v49) {
                      ((uint64_t (**)(void, void *, uint64_t, void *))v85)[2](v85, v46, v23, v49);
                    }
                    else {
                      ((void (*)(void (**)(void), __CFString *, uint64_t, uint64_t))v84[2])(v84, @"Not file/directory-typed", v23, 10);
                    }
                  }
                }
              }
              uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v86 objects:v101 count:16];
            }
            while (v43);
          }

          self = v75;
          a5 = v76;
          v19 = v73;
          id v15 = v74;
          id v21 = v72;
        }
        if (v90 == self->_rolloutProvider)
        {
          v50 = v71;
          goto LABEL_61;
        }
        if (v90 == self->_experimentProvider)
        {
          v50 = v69;
LABEL_61:
          [v50 addObject:v23];
        }
      }
LABEL_26:

      uint64_t v24 = v81;
LABEL_27:

      ++v22;
    }
    while (v22 != v80);
    uint64_t v54 = [v21 countByEnumeratingWithState:&v91 objects:v104 count:16];
    uint64_t v80 = v54;
  }
  while (v54);
LABEL_63:

  objc_storeStrong(location, v19);
  if (a4) {
    objc_storeStrong(a4, obj);
  }
  objc_storeStrong(a5, v61);
  if (a7) {
    objc_storeStrong(a7, v69);
  }
  if (a8) {
    objc_storeStrong(a8, v71);
  }
  if (a6) {
    objc_storeStrong(a6, v60);
  }
}

void __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  long long v7 = NSString;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = a3;
  id v11 = [v7 stringWithFormat:@"%@, with factor \"%@\" in namespace \"%@\".", a2, v10, v9, v14];
  v15[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v13 = [v6 errorWithDomain:@"TRIGeneralErrorDomain" code:a4 userInfo:v12];
  (*(void (**)(uint64_t, id, void, void *))(v8 + 16))(v8, v10, 0, v13);
}

BOOL __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 treatmentId];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = TRIValidateFactorPackId(v10);
    if (v12)
    {
      id v13 = [v9 asset];
      uint64_t v14 = [v13 assetId];
      id v15 = TRIValidateAssetId(v14);

      BOOL v16 = v15 != 0;
      if (v15)
      {
        uint64_t v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
        uint64_t v18 = v17;
        if (v17) {
          id v19 = v17;
        }
        else {
          id v19 = (id)objc_opt_new();
        }
        int v20 = v19;

        id v21 = [[TRIAssetIdFactorName alloc] initWithAssetId:v15 factorName:v8];
        [v20 addObject:v21];

        long long v29 = v20;
        [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:v12];
        uint64_t v22 = [v7 experimentId];
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          int v24 = [v7 deploymentId];

          if (v24 != -1)
          {
            uint64_t v25 = [TRIRolloutDeployment alloc];
            uint64_t v26 = [v7 experimentId];
            uint64_t v27 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](v25, "initWithRolloutId:deploymentId:", v26, [v7 deploymentId]);

            [*(id *)(a1 + 40) addObject:v27];
          }
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      BOOL v16 = 0;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    BOOL v16 = 0;
  }

  return v16;
}

- (id)promotableFactorPackId
{
  if (self->_experimentProvider) {
    goto LABEL_2;
  }
  rolloutProvider = self->_rolloutProvider;
  if (rolloutProvider)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_2:
      rolloutProvider = 0;
      goto LABEL_3;
    }
    uint64_t v5 = self->_rolloutProvider;
    rolloutProvider = [(TRINamespaceFactorProviding *)v5 treatmentId];

    if (rolloutProvider)
    {
      if ([(TRINamespaceFactorProviding *)v5 promotable])
      {
        uint64_t v6 = [(TRINamespaceFactorProviding *)v5 treatmentId];
        rolloutProvider = TRIValidateFactorPackId(v6);

        if (rolloutProvider) {
          id v7 = rolloutProvider;
        }
      }
      else
      {
        rolloutProvider = 0;
      }
    }
  }
LABEL_3:
  return rolloutProvider;
}

- (id)_dealiasedFactorLevelForFactorLevel:(id)a3 unaliasedName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 descriptor];
  id v10 = [v9 fields];
  uint64_t v11 = [v10 count];

  if (v11 != 2)
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 461, @"Shallow copy of aliased TRIFactorLevel needs updating, not implemented to copy all currently available fields" object file lineNumber description];
  }
  uint64_t v12 = [v7 factor];
  id v13 = [v12 descriptor];
  uint64_t v14 = [v13 fields];
  uint64_t v15 = [v14 count];

  if (v15 != 7)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"TRINamespaceFactorProviderChain.m", 462, @"Shallow copy of aliased TRIFactor needs updating, not implemented to copy all currently available fields" object file lineNumber description];
  }
  BOOL v16 = objc_opt_new();
  uint64_t v17 = [v7 level];
  [v16 setLevel:v17];

  uint64_t v18 = [v16 factor];
  [v18 setName:v8];

  id v19 = [v7 factor];
  int v20 = objc_msgSend(v19, "id_p");
  id v21 = [v16 factor];
  objc_msgSend(v21, "setId_p:", v20);

  uint64_t v22 = [v7 factor];
  uint64_t v23 = [v22 type];
  int v24 = [v16 factor];
  [v24 setType:v23];

  uint64_t v25 = [v7 factor];
  uint64_t v26 = [v25 namespaceId];
  uint64_t v27 = [v16 factor];
  [v27 setNamespaceId:v26];

  id v28 = [v7 factor];
  long long v29 = [v28 namespaceName];
  long long v30 = [v16 factor];
  [v30 setNamespaceName:v29];

  long long v31 = [v7 factor];
  long long v32 = [v31 metadataKeysArray];
  long long v33 = [v16 factor];
  [v33 setMetadataKeysArray:v32];

  id v34 = [v16 factor];
  [v34 setAlias:0];

  return v16;
}

- (id)factorNamesWithObfuscation:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__TRINamespaceFactorProviderChain_factorNamesWithObfuscation___block_invoke;
  v5[3] = &unk_1E596B738;
  v5[4] = self;
  uint64_t v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return v3;
}

id __62__TRINamespaceFactorProviderChain_factorNamesWithObfuscation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v3];
  if (!v4
    || ([*(id *)(a1 + 32) levelForFactor:v4],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        uint64_t v6 = v4,
        !v5))
  {
    uint64_t v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (void)dispose
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_providerChain;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "dispose", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (unsigned)namespaceId
{
  unsigned int v5 = -1;
  uint64_t v3 = TRINamespace_NamespaceId_EnumDescriptor();
  LODWORD(self) = [v3 getValue:&v5 forEnumTextFormatName:self->_namespaceName];

  if (self) {
    return v5;
  }
  else {
    return 0;
  }
}

@end