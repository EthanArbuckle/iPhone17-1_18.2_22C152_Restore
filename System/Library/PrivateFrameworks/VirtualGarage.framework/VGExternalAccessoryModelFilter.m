@interface VGExternalAccessoryModelFilter
- (BOOL)allowsVehicleWithModelId:(id)a3 firmwareId:(id)a4 year:(id)a5 model:(id)a6;
- (NSArray)denylist;
- (NSArray)modelIdAllowlist;
- (VGExternalAccessoryModelFilter)init;
- (void)_initializeAllowAndDenylists;
- (void)setDenylist:(id)a3;
- (void)setModelIdAllowlist:(id)a3;
@end

@implementation VGExternalAccessoryModelFilter

- (VGExternalAccessoryModelFilter)init
{
  v5.receiver = self;
  v5.super_class = (Class)VGExternalAccessoryModelFilter;
  v2 = [(VGExternalAccessoryModelFilter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VGExternalAccessoryModelFilter *)v2 _initializeAllowAndDenylists];
  }
  return v3;
}

- (void)_initializeAllowAndDenylists
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  v3 = VGAllowlistPayload();
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    v6 = GEOConfigGetString();
    v7 = [v5 objectForKeyedSubscript:v6];

    unint64_t v8 = 0x263EFF000uLL;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v58 = self;
      v60 = v4;
      v9 = objc_opt_new();
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v68 objects:&v78 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v69 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v9 addObject:v15];
            }
            else
            {
              v16 = VGGetExternalAccessoryModelFilterLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v5;
                _os_log_impl(&dword_214A2C000, v16, OS_LOG_TYPE_FAULT, "Encountered a non-number in payload: %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v68 objects:&v78 count:16];
        }
        while (v12);
      }

      v17 = [v9 copy];
      self = v58;
      v4 = v60;
      unint64_t v8 = 0x263EFF000;
    }
    else
    {
      v9 = VGGetExternalAccessoryModelFilterLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v78 = 138412290;
        v79 = v7;
        _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_FAULT, "Parsing of allowlist failed. allowlistedModelIds were in an unexpected format: %@", (uint8_t *)&v78, 0xCu);
      }
      v17 = 0;
    }

    modelIdAllowlist = self->_modelIdAllowlist;
    self->_modelIdAllowlist = v17;

    v19 = (VGDenylistEntry *)v5;
    v20 = GEOConfigGetString();
    v66 = v19;
    v21 = [(VGDenylistEntry *)v19 objectForKeyedSubscript:v20];

    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v59 = self;
        v61 = v4;
        v62 = objc_opt_new();
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v57 = v21;
        id obj = v21;
        uint64_t v22 = [obj countByEnumeratingWithState:&v68 objects:&v78 count:16];
        if (!v22) {
          goto LABEL_63;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v69;
        uint64_t v63 = *(void *)v69;
        while (1)
        {
          uint64_t v25 = 0;
          uint64_t v64 = v23;
          do
          {
            if (*(void *)v69 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(VGDenylistEntry **)(*((void *)&v68 + 1) + 8 * v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(void *)&long long buf = MEMORY[0x263EF8330];
              *((void *)&buf + 1) = 3221225472;
              v73 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_31;
              v74 = &unk_2642264E0;
              v75 = v66;
              v27 = (void (**)(void, void, void, void, void))MEMORY[0x2166AD0C0](&buf);
              char v28 = 1;
              char v67 = 1;
              v29 = GEOConfigGetString();
              uint64_t v30 = objc_opt_class();
              v31 = ((void (**)(void, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v29, v30, v26, &v67);

              v32 = GEOConfigGetString();
              unint64_t v33 = v8;
              uint64_t v34 = objc_opt_class();
              v35 = ((void (**)(void, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v32, v34, v26, &v67);

              if (v35) {
                char v28 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_33(v35);
              }
              if (v67) {
                char v36 = v28;
              }
              else {
                char v36 = 0;
              }
              char v67 = v36;
              v37 = GEOConfigGetString();
              uint64_t v38 = objc_opt_class();
              v39 = ((void (**)(void, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v37, v38, v26, &v67);

              if (v39) {
                char v40 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_33(v39);
              }
              else {
                char v40 = 1;
              }
              if (v67) {
                char v42 = v40;
              }
              else {
                char v42 = 0;
              }
              char v67 = v42;
              v43 = GEOConfigGetString();
              uint64_t v44 = objc_opt_class();
              v45 = ((void (**)(void, void *, uint64_t, VGDenylistEntry *, char *))v27)[2](v27, v43, v44, v26, &v67);

              if (v45) {
                char v46 = __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_33(v45);
              }
              else {
                char v46 = 1;
              }
              uint64_t v24 = v63;
              if (v67) {
                char v47 = v46;
              }
              else {
                char v47 = 0;
              }
              char v67 = v47;
              if (v47)
              {
                if (v31 || v35 || v39 || v45)
                {
                  v48 = [[VGDenylistEntry alloc] initWithModelId:v31 firmwareIds:v35 years:v39 models:v45];
                  v52 = VGGetExternalAccessoryModelFilterLog();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v76 = 138412290;
                    v77 = v48;
                    _os_log_impl(&dword_214A2C000, v52, OS_LOG_TYPE_INFO, "Adding new entry to iAP2 denylist: %@", v76, 0xCu);
                  }

                  [v62 addObject:v48];
                }
                else
                {
                  VGGetExternalAccessoryModelFilterLog();
                  v48 = (VGDenylistEntry *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v48->super, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v76 = 138412290;
                    v77 = v26;
                    p_super = &v48->super;
                    os_log_type_t v50 = OS_LOG_TYPE_FAULT;
                    v51 = "Encountered a configuration without any parameters: %@. Will skip it.";
                    goto LABEL_56;
                  }
                }
              }
              else
              {
                VGGetExternalAccessoryModelFilterLog();
                v48 = (VGDenylistEntry *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v48->super, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v76 = 138412290;
                  v77 = v26;
                  p_super = &v48->super;
                  os_log_type_t v50 = OS_LOG_TYPE_ERROR;
                  v51 = "Encountered malformed configuration: %@. Will skip it.";
LABEL_56:
                  _os_log_impl(&dword_214A2C000, p_super, v50, v51, v76, 0xCu);
                }
              }

              v41 = v75;
              unint64_t v8 = v33;
              uint64_t v23 = v64;
              goto LABEL_61;
            }
            v41 = VGGetExternalAccessoryModelFilterLog();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v76 = 138412290;
              v77 = v66;
              _os_log_impl(&dword_214A2C000, v41, OS_LOG_TYPE_FAULT, "Encountered a non-dictionary in payload: %@", v76, 0xCu);
            }
LABEL_61:

            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [obj countByEnumeratingWithState:&v68 objects:&v78 count:16];
          if (!v23)
          {
LABEL_63:

            v53 = v62;
            v54 = [v62 copy];
            self = v59;
            v4 = v61;
            v21 = v57;
            goto LABEL_67;
          }
        }
      }
    }
    v53 = VGGetExternalAccessoryModelFilterLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      int v78 = 138412290;
      v79 = v21;
      _os_log_impl(&dword_214A2C000, v53, OS_LOG_TYPE_FAULT, "Parsing of denylist failed. denylistedConfigurations were in an unexpected format: %@", (uint8_t *)&v78, 0xCu);
    }
    v54 = 0;
LABEL_67:

    denylist = self->_denylist;
    self->_denylist = v54;
  }
  else
  {
    v56 = VGGetExternalAccessoryModelFilterLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v78) = 0;
      _os_log_impl(&dword_214A2C000, v56, OS_LOG_TYPE_ERROR, "Parsing of allowlist failed. Payload was nil.", (uint8_t *)&v78, 2u);
    }
  }
}

- (NSArray)modelIdAllowlist
{
  modelIdAllowlist = self->_modelIdAllowlist;
  if (!modelIdAllowlist)
  {
    [(VGExternalAccessoryModelFilter *)self _initializeAllowAndDenylists];
    modelIdAllowlist = self->_modelIdAllowlist;
  }

  return modelIdAllowlist;
}

- (NSArray)denylist
{
  denylist = self->_denylist;
  if (!denylist)
  {
    [(VGExternalAccessoryModelFilter *)self _initializeAllowAndDenylists];
    denylist = self->_denylist;
  }

  return denylist;
}

id __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_31(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a4;
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  if (v10
    && (uint64_t v11 = (void *)v10,
        [v9 objectForKeyedSubscript:v8],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        v11,
        (isKindOfClass & 1) == 0))
  {
    uint64_t v15 = VGGetExternalAccessoryModelFilterLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v18 = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_FAULT, "Encountered an invalid value under key: %@ in payload: %@", (uint8_t *)&v18, 0x16u);
    }

    v14 = 0;
    *a5 = 0;
  }
  else
  {
    v14 = [v9 objectForKeyedSubscript:v8];
  }

  return v14;
}

uint64_t __62__VGExternalAccessoryModelFilter__initializeAllowAndDenylists__block_invoke_33(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)allowsVehicleWithModelId:(id)a3 firmwareId:(id)a4 year:(id)a5 model:(id)a6
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v38 = a4;
  id v39 = a5;
  id v40 = a6;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  long long v11 = [(VGExternalAccessoryModelFilter *)self modelIdAllowlist];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke;
  v44[3] = &unk_264226508;
  id v37 = v10;
  id v45 = v37;
  char v46 = &v47;
  [v11 enumerateObjectsUsingBlock:v44];

  if (*((unsigned char *)v48 + 24))
  {
    long long v12 = [VGDenylistEntry alloc];
    if (v38)
    {
      id v57 = v38;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263EFFA68];
    }
    if (v39)
    {
      id v56 = v39;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    }
    else
    {
      v27 = (void *)MEMORY[0x263EFFA68];
    }
    if (v40)
    {
      id v55 = v40;
      char v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    }
    else
    {
      char v28 = (void *)MEMORY[0x263EFFA68];
    }
    v29 = [(VGDenylistEntry *)v12 initWithModelId:v37 firmwareIds:v13 years:v27 models:v28];
    if (v40) {

    }
    if (v39) {
    if (v38)
    }

    uint64_t v62 = 0;
    uint64_t v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    uint64_t v30 = [(VGExternalAccessoryModelFilter *)self denylist];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke_38;
    v41[3] = &unk_264226530;
    char v36 = v29;
    char v42 = v36;
    v43 = &v62;
    [v30 enumerateObjectsUsingBlock:v41];

    BOOL v31 = *((unsigned char *)v63 + 24) == 0;
    _Block_object_dispose(&v62, 8);
  }
  else
  {
    char v36 = VGGetExternalAccessoryModelFilterLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = self->_modelIdAllowlist;
      v35 = v14;
      if (v14)
      {
        if ([(NSArray *)v14 count])
        {
          uint64_t v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v35, "count"));
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v16 = v35;
          uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v51 objects:&v62 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v52;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v52 != v18) {
                  objc_enumerationMutation(v16);
                }
                id v20 = *(id *)(*((void *)&v51 + 1) + 8 * i);
                if (v20)
                {
                  uint64_t v21 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v20];
                }
                else
                {
                  uint64_t v21 = @"<nil>";
                }

                [v15 addObject:v21];
              }
              uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v51 objects:&v62 count:16];
            }
            while (v17);
          }

          uint64_t v22 = [(NSArray *)v16 componentsJoinedByString:@", "];
          uint64_t v23 = NSString;
          uint64_t v24 = v16;
          uint64_t v25 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v24];

          v26 = [v23 stringWithFormat:@"%@ [%@]", v25, v22];
        }
        else
        {
          v32 = NSString;
          unint64_t v33 = v35;
          uint64_t v15 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v33];

          v26 = [v32 stringWithFormat:@"%@ (empty)", v15];
        }
      }
      else
      {
        v26 = @"<nil>";
      }

      *(_DWORD *)long long buf = 138412546;
      id v59 = v37;
      __int16 v60 = 2112;
      v61 = v26;
      _os_log_impl(&dword_214A2C000, v36, OS_LOG_TYPE_ERROR, "allowsVehicleWithModelId: denied modelId: %@ as it is not in the allowlist: %@", buf, 0x16u);
    }
    BOOL v31 = 0;
  }

  _Block_object_dispose(&v47, 8);
  return v31;
}

uint64_t __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __81__VGExternalAccessoryModelFilter_allowsVehicleWithModelId_firmwareId_year_model___block_invoke_38(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if ([v6 isSupersetOfEntry:*(void *)(a1 + 32)])
  {
    uint64_t v7 = VGGetExternalAccessoryModelFilterLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "allowsVehicleWithModelId: denied entry: %@ as it matches entry from denylist: %@", (uint8_t *)&v9, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setModelIdAllowlist:(id)a3
{
}

- (void)setDenylist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denylist, 0);

  objc_storeStrong((id *)&self->_modelIdAllowlist, 0);
}

@end