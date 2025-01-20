@interface MTIDConfig
- (MTIDConfig)initWithDictionary:(id)a3;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)clientIdNamespacesByTopic;
- (NSMutableDictionary)userIdNamespacesByTopic;
- (NSString)defaultClientIdNamespace;
- (NSString)defaultUserIdNamespace;
- (NSString)performanceTopic;
- (id)allKnownSchemes;
- (id)dictionaryRepresentation;
- (id)namespaceForTopic:(id)a3 idType:(int64_t)a4;
- (id)schemeForNamespace:(id)a3;
- (unint64_t)calculateCombinedHashForNamespaces:(id)a3;
- (void)setCache:(id)a3;
- (void)setClientIdNamespacesByTopic:(id)a3;
- (void)setDefaultClientIdNamespace:(id)a3;
- (void)setDefaultUserIdNamespace:(id)a3;
- (void)setPerformanceTopic:(id)a3;
- (void)setUserIdNamespacesByTopic:(id)a3;
@end

@implementation MTIDConfig

- (MTIDConfig)initWithDictionary:(id)a3
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v100.receiver = self;
  v100.super_class = (Class)MTIDConfig;
  v5 = [(MTIDConfig *)&v100 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v4 = (id)MEMORY[0x263EFFA78];
    }
    uint64_t v6 = [v4 objectForKeyedSubscript:@"performanceTopic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MTIDConfig *)v5 setPerformanceTopic:v6];
    }
    v80 = (void *)v6;
    v7 = [v4 objectForKeyedSubscript:@"schemes"];
    objc_opt_class();
    id v81 = v4;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v7 = (void *)MEMORY[0x263EFFA68];
    }
    v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    [(MTIDConfig *)v5 setCache:v8];

    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTIDConfig *)v5 setUserIdNamespacesByTopic:v9];

    v10 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTIDConfig *)v5 setClientIdNamespacesByTopic:v10];

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v96 objects:v103 count:16];
    v83 = v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v97;
      uint64_t v82 = *(void *)v97;
      do
      {
        uint64_t v15 = 0;
        uint64_t v85 = v13;
        do
        {
          if (*(void *)v97 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v96 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [v16 objectForKeyedSubscript:@"namespace"];
            if (v17)
            {
              [(MTIDConfig *)v5 cache];
              v19 = v18 = v16;
              v20 = [[MTIDScheme alloc] initWithNamespace:v17 options:v18];
              v21 = v17;
              v22 = v20;
              v87 = v21;
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v20);

              v86 = v18;
              v23 = [v18 objectForKeyedSubscript:@"topics"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(MTIDScheme *)v22 setTopics:v23];
                long long v94 = 0u;
                long long v95 = 0u;
                long long v92 = 0u;
                long long v93 = 0u;
                v84 = v23;
                id v24 = v23;
                uint64_t v25 = [v24 countByEnumeratingWithState:&v92 objects:v102 count:16];
                if (v25)
                {
                  uint64_t v26 = v25;
                  uint64_t v27 = *(void *)v93;
                  do
                  {
                    for (uint64_t i = 0; i != v26; ++i)
                    {
                      if (*(void *)v93 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      uint64_t v29 = *(void *)(*((void *)&v92 + 1) + 8 * i);
                      uint64_t v30 = [(MTIDScheme *)v22 idType];
                      v31 = [(MTIDScheme *)v22 idNamespace];
                      if (v30 == 2) {
                        [(MTIDConfig *)v5 userIdNamespacesByTopic];
                      }
                      else {
                      v32 = [(MTIDConfig *)v5 clientIdNamespacesByTopic];
                      }
                      [v32 setObject:v31 forKeyedSubscript:v29];
                    }
                    uint64_t v26 = [v24 countByEnumeratingWithState:&v92 objects:v102 count:16];
                  }
                  while (v26);
                }

                uint64_t v14 = v82;
                id v11 = v83;
                v23 = v84;
              }
              v33 = [v86 objectForKeyedSubscript:@"default"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 BOOLValue])
              {
                [(MTIDScheme *)v22 setIsDefault:1];
                v34 = [(MTIDConfig *)v5 defaultUserIdNamespace];
                if (v34)
                {

LABEL_33:
                  v35 = [(MTIDConfig *)v5 defaultClientIdNamespace];
                  if (v35)
                  {
                  }
                  else if ([(MTIDScheme *)v22 idType] == 1)
                  {
                    [(MTIDConfig *)v5 setDefaultClientIdNamespace:v87];
                  }
                }
                else
                {
                  if ([(MTIDScheme *)v22 idType] != 2) {
                    goto LABEL_33;
                  }
                  [(MTIDConfig *)v5 setDefaultUserIdNamespace:v87];
                }
              }

              uint64_t v13 = v85;
              v17 = v87;
            }
          }
          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v96 objects:v103 count:16];
      }
      while (v13);
    }

    v36 = [(MTIDConfig *)v5 defaultUserIdNamespace];

    if (!v36)
    {
      v37 = NSString;
      v38 = +[MTFrameworkEnvironment sharedEnvironment];
      v39 = [v38 hostProcessBundleIdentifier];
      v40 = [v37 stringWithFormat:@"%@.user", v39];
      [(MTIDConfig *)v5 setDefaultUserIdNamespace:v40];

      v41 = [(MTIDConfig *)v5 cache];
      v42 = [(MTIDConfig *)v5 defaultUserIdNamespace];
      v43 = [v41 objectForKeyedSubscript:v42];

      if (!v43)
      {
        v44 = [MTIDScheme alloc];
        v45 = [(MTIDConfig *)v5 defaultUserIdNamespace];
        v46 = [(MTIDScheme *)v44 initWithNamespace:v45 type:2];
        v47 = [(MTIDConfig *)v5 cache];
        v48 = [(MTIDConfig *)v5 defaultUserIdNamespace];
        [v47 setObject:v46 forKeyedSubscript:v48];
      }
      v49 = [(MTIDConfig *)v5 cache];
      v50 = [(MTIDConfig *)v5 defaultUserIdNamespace];
      v51 = [v49 objectForKeyedSubscript:v50];
      [v51 setIsDefault:1];
    }
    v52 = [(MTIDConfig *)v5 defaultClientIdNamespace];

    if (!v52)
    {
      v53 = NSString;
      v54 = +[MTFrameworkEnvironment sharedEnvironment];
      v55 = [v54 hostProcessBundleIdentifier];
      v56 = [v53 stringWithFormat:@"%@.client", v55];
      [(MTIDConfig *)v5 setDefaultClientIdNamespace:v56];

      v57 = [(MTIDConfig *)v5 cache];
      v58 = [(MTIDConfig *)v5 defaultClientIdNamespace];
      v59 = [v57 objectForKeyedSubscript:v58];

      if (!v59)
      {
        v60 = [MTIDScheme alloc];
        v61 = [(MTIDConfig *)v5 defaultClientIdNamespace];
        v62 = [(MTIDScheme *)v60 initWithNamespace:v61 type:1];
        v63 = [(MTIDConfig *)v5 cache];
        v64 = [(MTIDConfig *)v5 defaultClientIdNamespace];
        [v63 setObject:v62 forKeyedSubscript:v64];
      }
      v65 = [(MTIDConfig *)v5 cache];
      v66 = [(MTIDConfig *)v5 defaultClientIdNamespace];
      v67 = [v65 objectForKeyedSubscript:v66];
      [v67 setIsDefault:1];
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v68 = [(MTIDConfig *)v5 cache];
    uint64_t v69 = [v68 countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v89;
      do
      {
        for (uint64_t j = 0; j != v70; ++j)
        {
          if (*(void *)v89 != v71) {
            objc_enumerationMutation(v68);
          }
          uint64_t v73 = *(void *)(*((void *)&v88 + 1) + 8 * j);
          v74 = [(MTIDConfig *)v5 cache];
          v75 = [v74 objectForKeyedSubscript:v73];

          v76 = [v75 correlations];
          uint64_t v77 = [v76 count];

          if (v77)
          {
            v78 = [v75 correlations];
            objc_msgSend(v75, "setCorrelationHash:", -[MTIDConfig calculateCombinedHashForNamespaces:](v5, "calculateCombinedHashForNamespaces:", v78));
          }
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v88 objects:v101 count:16];
      }
      while (v70);
    }

    id v4 = v81;
  }

  return v5;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (NSMutableDictionary)userIdNamespacesByTopic
{
  return self->_userIdNamespacesByTopic;
}

- (NSMutableDictionary)clientIdNamespacesByTopic
{
  return self->_clientIdNamespacesByTopic;
}

- (NSString)defaultUserIdNamespace
{
  return self->_defaultUserIdNamespace;
}

- (NSString)defaultClientIdNamespace
{
  return self->_defaultClientIdNamespace;
}

- (unint64_t)calculateCombinedHashForNamespaces:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(MTIDConfig *)self cache];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];
        v7 ^= [v12 hash];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)namespaceForTopic:(id)a3 idType:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    unint64_t v7 = [(MTIDConfig *)self userIdNamespacesByTopic];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8)
    {
      id v9 = [(MTIDConfig *)self defaultUserIdNamespace];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  unint64_t v7 = [(MTIDConfig *)self clientIdNamespacesByTopic];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
LABEL_5:
    id v9 = v8;
    uint64_t v8 = v9;
    goto LABEL_7;
  }
  id v9 = [(MTIDConfig *)self defaultClientIdNamespace];
LABEL_7:
  uint64_t v10 = v9;

  return v10;
}

- (void)setUserIdNamespacesByTopic:(id)a3
{
}

- (void)setPerformanceTopic:(id)a3
{
}

- (void)setDefaultUserIdNamespace:(id)a3
{
}

- (void)setDefaultClientIdNamespace:(id)a3
{
}

- (void)setClientIdNamespacesByTopic:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (id)schemeForNamespace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MTIDConfig *)v5 cache];
  unint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    uint64_t v8 = v7;
    objc_sync_exit(v5);
  }
  else
  {
    id v9 = [[MTIDScheme alloc] initWithNamespace:v4 options:0];
    uint64_t v10 = [(MTIDConfig *)v5 cache];
    [v10 setObject:v9 forKeyedSubscript:v4];

    objc_sync_exit(v5);
    uint64_t v8 = v9;
  }

  return v8;
}

- (NSString)performanceTopic
{
  return self->_performanceTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultClientIdNamespace, 0);
  objc_storeStrong((id *)&self->_defaultUserIdNamespace, 0);
  objc_storeStrong((id *)&self->_clientIdNamespacesByTopic, 0);
  objc_storeStrong((id *)&self->_userIdNamespacesByTopic, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_performanceTopic, 0);
}

- (id)allKnownSchemes
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTIDConfig *)v2 cache];
  id v4 = [v3 allValues];

  objc_sync_exit(v2);

  return v4;
}

- (id)dictionaryRepresentation
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"schemes";
  v2 = [(MTIDConfig *)self allKnownSchemes];
  v3 = objc_msgSend(v2, "mt_map:", &__block_literal_global_10);
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

uint64_t __38__MTIDConfig_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

@end