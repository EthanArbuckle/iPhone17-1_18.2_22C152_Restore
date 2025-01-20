@interface SAOnBehalfOfMultiple
- (SAOnBehalfOfMultiple)init;
- (id)displayString;
- (void)addProximateName:(uint64_t)a3 proximatePid:(void *)a4 originName:(int)a5 originPid:(int)a6 count:;
@end

@implementation SAOnBehalfOfMultiple

- (SAOnBehalfOfMultiple)init
{
  v6.receiver = self;
  v6.super_class = (Class)SAOnBehalfOfMultiple;
  v2 = [(SAOnBehalfOfMultiple *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    proximateProcesses = v2->_proximateProcesses;
    v2->_proximateProcesses = v3;
  }
  return v2;
}

- (id)displayString
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a1[2])
  {
    v1 = a1;
    context = (void *)MEMORY[0x1C18A6A20]();
    v3 = objc_msgSend(objc_getProperty(v1, v2, 16, 1), "keysSortedByValueUsingComparator:", &__block_literal_global_226);
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v50 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(objc_getProperty(v1, v5, 16, 1), "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v3;
    uint64_t v51 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v51)
    {
      v48 = v1;
      uint64_t v49 = *(void *)v56;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v56 != v49) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(objc_getProperty(v1, v6, 16, 1), "objectForKeyedSubscript:", *(void *)(*((void *)&v55 + 1) + 8 * v7));
          v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
          v10 = v8;
          if (v8)
          {
            uint64_t v52 = v7;
            objc_msgSend(objc_getProperty(v8, v9, 24, 1), "sortUsingSelector:", sel_compare_);
            v12 = objc_msgSend(objc_getProperty(v10, v11, 32, 1), "keysSortedByValueUsingComparator:", &__block_literal_global_11);
            id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
            v54 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(objc_getProperty(v10, v14, 32, 1), "count"));
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v53 = v12;
            uint64_t v15 = [v53 countByEnumeratingWithState:&v59 objects:v64 count:16];
            if (v15)
            {
              uint64_t v17 = v15;
              uint64_t v18 = *(void *)v60;
              do
              {
                uint64_t v19 = 0;
                do
                {
                  if (*(void *)v60 != v18) {
                    objc_enumerationMutation(v53);
                  }
                  objc_msgSend(objc_getProperty(v10, v16, 32, 1), "objectForKeyedSubscript:", *(void *)(*((void *)&v59 + 1) + 8 * v19));
                  v20 = (unsigned int *)objc_claimAutoreleasedReturnValue();
                  v22 = v20;
                  if (v20)
                  {
                    objc_msgSend(objc_getProperty(v20, v21, 24, 1), "sortUsingSelector:", sel_compare_);
                    id v24 = [NSString alloc];
                    v25 = v10;
                    uint64_t v26 = v22[2];
                    if (v26 == 1) {
                      v27 = "";
                    }
                    else {
                      v27 = "s";
                    }
                    id v28 = objc_getProperty(v22, v23, 16, 1);
                    v30 = [objc_getProperty(v22 v29:24, 1), "componentsJoinedByString:", @", "];
                    uint64_t v45 = v26;
                    v10 = v25;
                    v31 = (void *)[v24 initWithFormat:@"%u sample%s originated by %@ [%@]", v45, v27, v28, v30];
                  }
                  else
                  {
                    v31 = 0;
                  }
                  [v54 addObject:v31];

                  ++v19;
                }
                while (v17 != v19);
                uint64_t v32 = [v53 countByEnumeratingWithState:&v59 objects:v64 count:16];
                uint64_t v17 = v32;
              }
              while (v32);
            }

            id v34 = [NSString alloc];
            uint64_t v35 = v10[2];
            if (v35 == 1) {
              v36 = "";
            }
            else {
              v36 = "s";
            }
            id v37 = objc_getProperty(v10, v33, 16, 1);
            v39 = [objc_getProperty(v10 v38:24, 1), "componentsJoinedByString:", @", "];
            v40 = [v54 componentsJoinedByString:@", "];
            v41 = (void *)[v34 initWithFormat:@"%u sample%s %@ [%@] (%@)", v35, v36, v37, v39, v40];

            v1 = v48;
            uint64_t v7 = v52;
          }
          else
          {
            v41 = 0;
          }
          [v50 addObject:v41];

          ++v7;
        }
        while (v7 != v51);
        uint64_t v42 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        uint64_t v51 = v42;
      }
      while (v42);
    }

    v43 = [v50 componentsJoinedByString:@", "];
  }
  else
  {
    v43 = 0;
  }
  return v43;
}

uint64_t __37__SAOnBehalfOfMultiple_displayString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  SEL v5 = a3;
  uint64_t v7 = v5;
  if (v4)
  {
    unsigned int v8 = v4[2];
    if (v5)
    {
LABEL_3:
      unsigned int v9 = v5[2];
      goto LABEL_4;
    }
  }
  else
  {
    unsigned int v8 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  unsigned int v9 = 0;
LABEL_4:
  if (v8 < v9)
  {
    uint64_t v10 = 1;
    goto LABEL_16;
  }
  if (v4)
  {
    unsigned int v11 = v4[2];
    if (v5)
    {
LABEL_8:
      unsigned int v12 = v5[2];
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v11 = 0;
    if (v5) {
      goto LABEL_8;
    }
  }
  unsigned int v12 = 0;
LABEL_9:
  if (v11 <= v12)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v15 = Property;
    if (v7) {
      id v16 = objc_getProperty(v7, v14, 16, 1);
    }
    else {
      id v16 = 0;
    }
    uint64_t v10 = [v15 compare:v16];
  }
  else
  {
    uint64_t v10 = -1;
  }
LABEL_16:

  return v10;
}

- (void)addProximateName:(uint64_t)a3 proximatePid:(void *)a4 originName:(int)a5 originPid:(int)a6 count:
{
  HIDWORD(v55) = a5;
  id v58 = a2;
  id v11 = a4;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v10, 16, 1), "objectForKeyedSubscript:", v58);
    id v13 = (SAProximateProcess *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = a6;
    if (v13) {
      goto LABEL_7;
    }
    id v13 = [SAProximateProcess alloc];
    id v14 = v58;
    if (v13)
    {
      v59.receiver = v13;
      v59.super_class = (Class)SAProximateProcess;
      id v13 = (SAProximateProcess *)objc_msgSendSuper2(&v59, sel_init);
      if (v13)
      {
        uint64_t v15 = [v14 copy];
        name = v13->_name;
        v13->_name = (NSString *)v15;

        uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        pids = v13->_pids;
        v13->_pids = v17;

        uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        originProcesses = v13->_originProcesses;
        v13->_originProcesses = v19;
      }
    }

    char v21 = 1;
    objc_msgSend(objc_getProperty(a1, v22, 16, 1), "setObject:forKeyedSubscript:", v13, v14);
    if (v13)
    {
LABEL_7:
      id Property = objc_getProperty(v13, v12, 24, 1);
      char v21 = 0;
    }
    else
    {
      id Property = 0;
    }
    id v24 = NSNumber;
    id v25 = Property;
    uint64_t v26 = [v24 numberWithInt:a3];
    char v27 = [v25 containsObject:v26];

    if ((v27 & 1) == 0)
    {
      if (v21) {
        id v29 = 0;
      }
      else {
        id v29 = objc_getProperty(v13, v28, 24, 1);
      }
      v30 = NSNumber;
      id v31 = v29;
      uint64_t v32 = [v30 numberWithInt:a3];
      [v31 addObject:v32];
    }
    if (v21) {
      id v33 = 0;
    }
    else {
      id v33 = objc_getProperty(v13, v28, 32, 1);
    }
    objc_msgSend(v33, "objectForKeyedSubscript:", v11, v55);
    uint64_t v35 = (SAOriginProcess *)objc_claimAutoreleasedReturnValue();
    if (v35) {
      goto LABEL_21;
    }
    uint64_t v35 = [SAOriginProcess alloc];
    id v36 = v11;
    if (v35)
    {
      v59.receiver = v35;
      v59.super_class = (Class)SAOriginProcess;
      uint64_t v35 = (SAOriginProcess *)objc_msgSendSuper2(&v59, sel_init);
      if (v35)
      {
        uint64_t v37 = [v36 copy];
        SEL v38 = v35->_name;
        v35->_name = (NSString *)v37;

        v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v40 = v35->_pids;
        v35->_pids = v39;
      }
    }

    id v42 = (v21 & 1) != 0 ? 0 : objc_getProperty(v13, v41, 32, 1);
    [v42 setObject:v35 forKeyedSubscript:v36];
    if (v35)
    {
LABEL_21:
      id v43 = v11;
      id v44 = objc_getProperty(v35, v34, 24, 1);
      char v45 = 0;
    }
    else
    {
      id v43 = v11;
      id v44 = 0;
      char v45 = 1;
    }
    v46 = NSNumber;
    id v47 = v44;
    v48 = [v46 numberWithInt:v57];
    char v49 = [v47 containsObject:v48];

    if ((v49 & 1) == 0)
    {
      if (v45) {
        id v51 = 0;
      }
      else {
        id v51 = objc_getProperty(v35, v50, 24, 1);
      }
      uint64_t v52 = NSNumber;
      id v53 = v51;
      v54 = [v52 numberWithInt:v57];
      [v53 addObject:v54];
    }
    a1[2] += v56;
    if ((v21 & 1) == 0) {
      v13->_count += v56;
    }
    if ((v45 & 1) == 0) {
      v35->_count += v56;
    }

    id v11 = v43;
  }
}

- (void).cxx_destruct
{
}

@end