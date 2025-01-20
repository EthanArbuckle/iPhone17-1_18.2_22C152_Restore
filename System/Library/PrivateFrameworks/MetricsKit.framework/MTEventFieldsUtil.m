@interface MTEventFieldsUtil
+ (id)applyFieldsMap:(id)a3 data:(id)a4 sectionName:(id)a5 error:(id *)a6;
+ (id)mapForSectionName:(id)a3 inFieldsMap:(id)a4;
@end

@implementation MTEventFieldsUtil

+ (id)mapForSectionName:(id)a3 inFieldsMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = [v6 valueForKeyPath:v7];
  v9 = v7;
  if (!v8)
  {
    v9 = [@"custom." stringByAppendingString:v7];

    v8 = [v6 valueForKeyPath:v9];
  }

  return v8;
}

+ (id)applyFieldsMap:(id)a3 data:(id)a4 sectionName:(id)a5 error:(id *)a6
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [a1 mapForSectionName:v12 inFieldsMap:v10];
    if (v25)
    {
      v64 = [MEMORY[0x263EFF9A0] dictionary];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v62 = v12;
        id v63 = v10;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v61 = v25;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v75 objects:v84 count:16];
        if (!v27) {
          goto LABEL_44;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v76;
        unint64_t v30 = 0x263EFF000uLL;
        id v65 = v26;
        while (1)
        {
          uint64_t v31 = 0;
          uint64_t v66 = v28;
          do
          {
            if (*(void *)v76 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v32 = *(void *)(*((void *)&v75 + 1) + 8 * v31);
            v33 = [v26 objectForKeyedSubscript:v32];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v83 = v33;
              id v34 = [*(id *)(v30 + 2240) arrayWithObjects:&v83 count:1];
              if (!v34) {
                goto LABEL_23;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (id v34 = v33) == 0)
              {
LABEL_23:
                id v36 = 0;
                goto LABEL_26;
              }
            }
            uint64_t v35 = v29;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v36 = v34;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v82 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v72;
              while (2)
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v72 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  uint64_t v41 = objc_msgSend(v11, "mt_nullableValueForKeyPathExt:", *(void *)(*((void *)&v71 + 1) + 8 * i));
                  if (v41)
                  {
                    v42 = (void *)v41;
                    [v64 setObject:v41 forKey:v32];

                    goto LABEL_25;
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v71 objects:v82 count:16];
                if (v38) {
                  continue;
                }
                break;
              }
            }
LABEL_25:

            uint64_t v29 = v35;
            id v26 = v65;
            uint64_t v28 = v66;
            unint64_t v30 = 0x263EFF000;
LABEL_26:

            ++v31;
          }
          while (v31 != v28);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v75 objects:v84 count:16];
          if (!v28) {
            goto LABEL_44;
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v62 = v12;
        id v63 = v10;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v61 = v25;
        id v50 = v25;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v68 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = *(void *)(*((void *)&v67 + 1) + 8 * j);
              v56 = objc_msgSend(v11, "mt_nullableValueForKey:", v55);
              if (v56) {
                [v64 setObject:v56 forKey:v55];
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v67 objects:v81 count:16];
          }
          while (v52);
        }
LABEL_44:
        v25 = v61;

        v57 = v64;
        id v12 = v62;
        if (![v64 count])
        {
          v58 = MTMetricsKitOSLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v80 = v62;
            _os_log_impl(&dword_218211000, v58, OS_LOG_TYPE_ERROR, "MetricsKit: No matched fields found in data for fieldsMap section %@", buf, 0xCu);
          }
        }
        v43 = (void *)[v64 copy];
        id v10 = v63;
      }
      else
      {
        if (a6)
        {
          MTError(106, @"fieldsMap section %@ in config sources is not valid", v44, v45, v46, v47, v48, v49, (uint64_t)v12);
          v43 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = 0;
        }
        v57 = v64;
      }
    }
    else if (a6)
    {
      MTError(105, @"fieldsMap section %@ is not found in config sources", v19, v20, v21, v22, v23, v24, (uint64_t)v12);
      v43 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = 0;
    }
  }
  else if (a6)
  {
    MTError(104, @"fieldsMap in config sources is not a dictionary object", v13, v14, v15, v16, v17, v18, v60);
    v43 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

@end