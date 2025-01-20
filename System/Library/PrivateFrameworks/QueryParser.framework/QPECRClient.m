@interface QPECRClient
+ (id)sharedClient;
- (BOOL)coolDownECRClientSyncWithError:(id *)a3;
- (BOOL)warmUpECRClientSyncWithError:(id *)a3;
- (QPECRClient)init;
- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4;
- (id)visualIdentifierViewWithError:(id *)a3;
- (id)visualIdentifiersWithQuery:(id)a3 entityFilterType:(int64_t)a4 error:(id *)a5;
- (id)visualIdentifiersWithText:(id)a3 allowPrefixSearch:(BOOL)a4 entityFilterType:(int64_t)a5 includeInferredNames:(BOOL)a6 allowGroundingToNamesAndEmails:(BOOL)a7 error:(id *)a8;
- (void)clearVisualIdentifierView;
- (void)cooldownAsync;
- (void)cooldownSync;
- (void)warmUpAsync;
- (void)warmUpSync;
@end

@implementation QPECRClient

uint64_t __26__QPECRClient_warmUpAsync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) warmUpSync];
}

- (void)warmUpAsync
{
  qos_class_t v3 = qos_class_self();
  v4 = dispatch_get_global_queue(v3, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__QPECRClient_warmUpAsync__block_invoke;
  block[3] = &unk_264706060;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)visualIdentifierViewWithError:(id *)a3
{
  p_viewLock = &self->_viewLock;
  os_unfair_lock_lock(&self->_viewLock);
  view = self->_view;
  p_view = &self->_view;
  v8 = view;
  if (!v8)
  {
    v9 = [MEMORY[0x263F4E8E0] defaultService];
    id v12 = 0;
    v8 = [v9 visualIdentifierViewWithError:&v12];
    id v10 = v12;
    objc_storeStrong((id *)p_view, v8);
    if (a3) {
      *a3 = v10;
    }
  }
  os_unfair_lock_unlock(p_viewLock);
  return v8;
}

- (void)warmUpSync
{
  id v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  qos_class_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_224D85000, v4, v5, "Unable to warmup %@: %@", v6, v7, v8, v9, v10);
}

+ (id)sharedClient
{
  return +[QPXPCECRClient sharedClient];
}

- (QPECRClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)QPECRClient;
  result = [(QPECRClient *)&v3 init];
  if (result) {
    result->_viewLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)warmUpECRClientSyncWithError:(id *)a3
{
  return 0;
}

- (BOOL)coolDownECRClientSyncWithError:(id *)a3
{
  return 0;
}

- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)visualIdentifiersWithQuery:(id)a3 entityFilterType:(int64_t)a4 error:(id *)a5
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc(MEMORY[0x263F4E888]);
  uint8_t v10 = &unk_26D83EC68;
  if (a4 == 2) {
    uint8_t v10 = &unk_26D83EC80;
  }
  if (a4 == 1) {
    v11 = &unk_26D83EC98;
  }
  else {
    v11 = v10;
  }
  v67 = v8;
  v95[1] = 0;
  v66 = (void *)[v9 initWithText:v8 entityClassFilter:v11 spans:0 mode:0 constraint:0 includeInferredNames:1];
  id v12 = -[QPECRClient resolveEntitiesWithRequest:error:](self, "resolveEntitiesWithRequest:error:");
  id v13 = 0;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    *a5 = v13;
  }
  else
  {
    v16 = [v12 rankedResults];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      v95[0] = 0;
      v76 = [(QPECRClient *)self visualIdentifierViewWithError:v95];
      id v18 = v95[0];
      if (v18)
      {
        v19 = v18;
        v15 = 0;
        *a5 = v18;
      }
      else
      {
        v15 = [MEMORY[0x263EFF9A0] dictionary];
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id obj = [v12 rankedResults];
        uint64_t v20 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v92;
          v69 = v15;
          v70 = v12;
          uint64_t v68 = *(void *)v92;
          do
          {
            uint64_t v23 = 0;
            uint64_t v71 = v21;
            do
            {
              if (*(void *)v92 != v22) {
                objc_enumerationMutation(obj);
              }
              v24 = *(void **)(*((void *)&v91 + 1) + 8 * v23);
              v25 = [v24 span];
              v26 = [v25 text];

              v27 = [v24 span];
              [v27 range];
              uint64_t v29 = v28;

              if ([v26 length]) {
                BOOL v30 = v29 == 0;
              }
              else {
                BOOL v30 = 1;
              }
              if (!v30)
              {
                uint64_t v74 = v23;
                v31 = [v24 span];
                uint64_t v32 = [v31 range];
                uint64_t v34 = objc_msgSend(v26, "substringWithRange:", v32, v33);

                v35 = [v15 objectForKeyedSubscript:v34];

                if (!v35)
                {
                  v36 = [MEMORY[0x263EFF9A0] dictionary];
                  [v15 setObject:v36 forKeyedSubscript:v34];
                }
                v73 = (void *)v34;
                v82 = [v15 objectForKeyedSubscript:v34];
                long long v87 = 0u;
                long long v88 = 0u;
                long long v89 = 0u;
                long long v90 = 0u;
                id v75 = [v24 rankedItems];
                uint64_t v78 = [v75 countByEnumeratingWithState:&v87 objects:v98 count:16];
                if (v78)
                {
                  uint64_t v77 = *(void *)v88;
                  do
                  {
                    uint64_t v37 = 0;
                    do
                    {
                      if (*(void *)v88 != v77) {
                        objc_enumerationMutation(v75);
                      }
                      uint64_t v80 = v37;
                      v38 = *(void **)(*((void *)&v87 + 1) + 8 * v37);
                      v39 = [v38 entityID];
                      v40 = [v39 stringValue];
                      v41 = [v76 personForIdentifier:v40];

                      long long v85 = 0u;
                      long long v86 = 0u;
                      long long v83 = 0u;
                      long long v84 = 0u;
                      v79 = v41;
                      id v81 = [v41 visualIdentifiers];
                      uint64_t v42 = [v81 countByEnumeratingWithState:&v83 objects:v97 count:16];
                      if (v42)
                      {
                        uint64_t v43 = v42;
                        uint64_t v44 = *(void *)v84;
                        do
                        {
                          for (uint64_t i = 0; i != v43; ++i)
                          {
                            if (*(void *)v84 != v44) {
                              objc_enumerationMutation(v81);
                            }
                            v46 = [*(id *)(*((void *)&v83 + 1) + 8 * i) componentsSeparatedByString:@"/"];
                            v47 = [v46 firstObject];
                            uint64_t v48 = [v47 length];

                            if (v48)
                            {
                              v49 = [v46 firstObject];
                              v50 = [v82 objectForKeyedSubscript:v49];

                              v51 = [v50 firstObject];
                              [v51 doubleValue];
                              double v53 = v52;

                              v54 = [v50 lastObject];
                              [v54 doubleValue];
                              double v56 = v55;

                              [v38 nameScore];
                              if (v57 > v53)
                              {
                                [v38 nameScore];
                                double v53 = v58;
                              }
                              [v38 confirmationConfidence];
                              if (v59 > v56)
                              {
                                [v38 confirmationConfidence];
                                double v56 = v60;
                              }
                              v61 = [NSNumber numberWithDouble:v53];
                              v96[0] = v61;
                              v62 = [NSNumber numberWithDouble:v56];
                              v96[1] = v62;
                              v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:2];
                              v64 = [v46 firstObject];
                              [v82 setObject:v63 forKeyedSubscript:v64];
                            }
                          }
                          uint64_t v43 = [v81 countByEnumeratingWithState:&v83 objects:v97 count:16];
                        }
                        while (v43);
                      }

                      uint64_t v37 = v80 + 1;
                    }
                    while (v80 + 1 != v78);
                    uint64_t v78 = [v75 countByEnumeratingWithState:&v87 objects:v98 count:16];
                  }
                  while (v78);
                }

                v15 = v69;
                id v12 = v70;
                uint64_t v22 = v68;
                uint64_t v21 = v71;
                v26 = v73;
                uint64_t v23 = v74;
              }

              ++v23;
            }
            while (v23 != v21);
            uint64_t v21 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
          }
          while (v21);
        }

        v19 = 0;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x263EFFA78];
    }
    v14 = 0;
  }

  return v15;
}

- (id)visualIdentifiersWithText:(id)a3 allowPrefixSearch:(BOOL)a4 entityFilterType:(int64_t)a5 includeInferredNames:(BOOL)a6 allowGroundingToNamesAndEmails:(BOOL)a7 error:(id *)a8
{
  BOOL v98 = a7;
  BOOL v9 = a6;
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v13 = a3;
  v14 = v13;
  if (a4)
  {
    v15 = v13;
  }
  else
  {
    v15 = [v13 stringByAppendingString:@" "];
  }
  id v16 = objc_alloc(MEMORY[0x263F4E888]);
  uint64_t v17 = &unk_26D83EC68;
  if (a5 == 2) {
    uint64_t v17 = &unk_26D83EC80;
  }
  if (a5 == 1) {
    id v18 = &unk_26D83EC98;
  }
  else {
    id v18 = v17;
  }
  v19 = (void *)[v16 initWithText:v15 entityClassFilter:v18 spans:0 mode:3 constraint:0 includeInferredNames:v9];
  id v134 = 0;
  uint64_t v20 = [(QPECRClient *)self resolveEntitiesWithRequest:v19 error:&v134];
  id v21 = v134;
  uint64_t v22 = v21;
  if (v21)
  {
    uint64_t v23 = 0;
    *a8 = v21;
  }
  else
  {
    long long v87 = v19;
    long long v88 = v20;
    v24 = [v20 rankedResults];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      id v133 = 0;
      v97 = [(QPECRClient *)self visualIdentifierViewWithError:&v133];
      id v26 = v133;
      v27 = v26;
      if (v26)
      {
        uint64_t v23 = 0;
        *a8 = v26;
      }
      else
      {
        long long v86 = v15;
        v104 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v28 = [MEMORY[0x263EFF980] array];
        uint64_t v29 = [MEMORY[0x263EFF980] array];
        BOOL v30 = [MEMORY[0x263EFF980] array];
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        id obj = [v20 rankedResults];
        uint64_t v91 = [obj countByEnumeratingWithState:&v129 objects:v144 count:16];
        if (v91)
        {
          uint64_t v90 = *(void *)v130;
          v95 = v29;
          v96 = v28;
          long long v94 = v30;
          do
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v130 != v90) {
                objc_enumerationMutation(obj);
              }
              uint64_t v92 = v31;
              uint64_t v32 = *(void **)(*((void *)&v129 + 1) + 8 * v31);
              long long v125 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              id v93 = [v32 rankedItems];
              uint64_t v100 = [v93 countByEnumeratingWithState:&v125 objects:v143 count:16];
              if (v100)
              {
                uint64_t v99 = *(void *)v126;
                do
                {
                  uint64_t v33 = 0;
                  do
                  {
                    if (*(void *)v126 != v99) {
                      objc_enumerationMutation(v93);
                    }
                    uint64_t v102 = v33;
                    uint64_t v34 = *(void **)(*((void *)&v125 + 1) + 8 * v33);
                    v35 = [v34 entityID];
                    v36 = [v35 stringValue];
                    uint64_t v37 = [v97 personForIdentifier:v36];

                    long long v123 = 0u;
                    long long v124 = 0u;
                    long long v121 = 0u;
                    long long v122 = 0u;
                    v101 = v37;
                    id v103 = [v37 visualIdentifiers];
                    uint64_t v38 = [v103 countByEnumeratingWithState:&v121 objects:v142 count:16];
                    if (v38)
                    {
                      uint64_t v39 = v38;
                      uint64_t v40 = *(void *)v122;
                      do
                      {
                        for (uint64_t i = 0; i != v39; ++i)
                        {
                          if (*(void *)v122 != v40) {
                            objc_enumerationMutation(v103);
                          }
                          uint64_t v42 = [*(id *)(*((void *)&v121 + 1) + 8 * i) componentsSeparatedByString:@"/"];
                          uint64_t v43 = [v42 firstObject];
                          uint64_t v44 = [v43 length];

                          if (v44)
                          {
                            v45 = [v42 firstObject];
                            v46 = [v104 objectForKeyedSubscript:v45];

                            v47 = [v46 firstObject];
                            [v47 doubleValue];
                            double v49 = v48;

                            v50 = [v46 lastObject];
                            [v50 doubleValue];
                            double v52 = v51;

                            [v34 nameScore];
                            if (v53 > v49)
                            {
                              [v34 nameScore];
                              double v49 = v54;
                            }
                            [v34 confirmationConfidence];
                            if (v55 > v52)
                            {
                              [v34 confirmationConfidence];
                              double v52 = v56;
                            }
                            double v57 = [NSNumber numberWithDouble:v49];
                            v141[0] = v57;
                            double v58 = [NSNumber numberWithDouble:v52];
                            v141[1] = v58;
                            double v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:2];
                            double v60 = [v42 firstObject];
                            [v104 setObject:v59 forKeyedSubscript:v60];
                          }
                        }
                        uint64_t v39 = [v103 countByEnumeratingWithState:&v121 objects:v142 count:16];
                      }
                      while (v39);
                    }

                    uint64_t v29 = v95;
                    uint64_t v28 = v96;
                    BOOL v30 = v94;
                    if (v98)
                    {
                      long long v119 = 0u;
                      long long v120 = 0u;
                      long long v117 = 0u;
                      long long v118 = 0u;
                      v61 = [v101 names];
                      uint64_t v62 = [v61 countByEnumeratingWithState:&v117 objects:v140 count:16];
                      if (v62)
                      {
                        uint64_t v63 = v62;
                        uint64_t v64 = *(void *)v118;
                        do
                        {
                          for (uint64_t j = 0; j != v63; ++j)
                          {
                            if (*(void *)v118 != v64) {
                              objc_enumerationMutation(v61);
                            }
                            [v96 addObject:*(void *)(*((void *)&v117 + 1) + 8 * j)];
                          }
                          uint64_t v63 = [v61 countByEnumeratingWithState:&v117 objects:v140 count:16];
                        }
                        while (v63);
                      }

                      long long v115 = 0u;
                      long long v116 = 0u;
                      long long v113 = 0u;
                      long long v114 = 0u;
                      v66 = [v101 emails];
                      uint64_t v67 = [v66 countByEnumeratingWithState:&v113 objects:v139 count:16];
                      if (v67)
                      {
                        uint64_t v68 = v67;
                        uint64_t v69 = *(void *)v114;
                        do
                        {
                          for (uint64_t k = 0; k != v68; ++k)
                          {
                            if (*(void *)v114 != v69) {
                              objc_enumerationMutation(v66);
                            }
                            [v95 addObject:*(void *)(*((void *)&v113 + 1) + 8 * k)];
                          }
                          uint64_t v68 = [v66 countByEnumeratingWithState:&v113 objects:v139 count:16];
                        }
                        while (v68);
                      }

                      long long v111 = 0u;
                      long long v112 = 0u;
                      long long v109 = 0u;
                      long long v110 = 0u;
                      uint64_t v71 = [v101 phoneNumbers];
                      uint64_t v72 = [v71 countByEnumeratingWithState:&v109 objects:v138 count:16];
                      if (v72)
                      {
                        uint64_t v73 = v72;
                        uint64_t v74 = *(void *)v110;
                        do
                        {
                          for (uint64_t m = 0; m != v73; ++m)
                          {
                            if (*(void *)v110 != v74) {
                              objc_enumerationMutation(v71);
                            }
                            [v94 addObject:*(void *)(*((void *)&v109 + 1) + 8 * m)];
                          }
                          uint64_t v73 = [v71 countByEnumeratingWithState:&v109 objects:v138 count:16];
                        }
                        while (v73);
                      }

                      long long v107 = 0u;
                      long long v108 = 0u;
                      long long v105 = 0u;
                      long long v106 = 0u;
                      v76 = [v101 phoneNumbers];
                      uint64_t v77 = [v76 countByEnumeratingWithState:&v105 objects:v137 count:16];
                      if (v77)
                      {
                        uint64_t v78 = v77;
                        uint64_t v79 = *(void *)v106;
                        do
                        {
                          for (uint64_t n = 0; n != v78; ++n)
                          {
                            if (*(void *)v106 != v79) {
                              objc_enumerationMutation(v76);
                            }
                            [v94 addObject:*(void *)(*((void *)&v105 + 1) + 8 * n)];
                          }
                          uint64_t v78 = [v76 countByEnumeratingWithState:&v105 objects:v137 count:16];
                        }
                        while (v78);
                      }
                    }
                    uint64_t v33 = v102 + 1;
                  }
                  while (v102 + 1 != v100);
                  uint64_t v100 = [v93 countByEnumeratingWithState:&v125 objects:v143 count:16];
                }
                while (v100);
              }

              uint64_t v31 = v92 + 1;
            }
            while (v92 + 1 != v91);
            uint64_t v91 = [obj countByEnumeratingWithState:&v129 objects:v144 count:16];
          }
          while (v91);
        }

        v135[0] = @"visualIdentifier";
        id v81 = (void *)[v104 copy];
        v136[0] = v81;
        v135[1] = @"personNames";
        v82 = (void *)[v28 copy];
        v136[1] = v82;
        v135[2] = @"personEmails";
        long long v83 = (void *)[v29 copy];
        v136[2] = v83;
        v135[3] = @"personPhoneNumbers";
        long long v84 = (void *)[v30 copy];
        v136[3] = v84;
        uint64_t v23 = [NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:4];

        v27 = 0;
        v15 = v86;
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v22 = 0;
    v19 = v87;
    uint64_t v20 = v88;
  }

  return v23;
}

- (void)cooldownSync
{
  id v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_224D85000, v4, v5, "Unable to cooldown %@: %@", v6, v7, v8, v9, v10);
}

- (void)cooldownAsync
{
  qos_class_t v3 = qos_class_self();
  uint64_t v4 = dispatch_get_global_queue(v3, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__QPECRClient_cooldownAsync__block_invoke;
  block[3] = &unk_264706060;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __28__QPECRClient_cooldownAsync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cooldownSync];
}

- (void)clearVisualIdentifierView
{
  p_viewLocuint64_t k = &self->_viewLock;
  os_unfair_lock_lock(&self->_viewLock);
  view = self->_view;
  self->_view = 0;

  os_unfair_lock_unlock(p_viewLock);
}

- (void).cxx_destruct
{
}

@end