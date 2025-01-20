@interface UAFAssetSetSubscription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id)a3 error:(id *)a4;
- (NSDate)expiration;
- (NSDictionary)assetSets;
- (NSDictionary)usageAliases;
- (NSString)name;
- (UAFAssetSetSubscription)initWithCoder:(id)a3;
- (UAFAssetSetSubscription)initWithName:(id)a3 assetSets:(id)a4 usageAliases:(id)a5;
- (UAFAssetSetSubscription)initWithName:(id)a3 assetSets:(id)a4 usageAliases:(id)a5 expires:(id)a6;
- (id)description;
- (id)expirationAsString;
- (id)init:(id)a3 assetSets:(id)a4 usageAliases:(id)a5;
- (id)propertiesAsDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UAFAssetSetSubscription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_usageAliases, 0);
  objc_storeStrong((id *)&self->_assetSets, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (UAFAssetSetSubscription)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"assetSets"];

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"usageAliases"];

    if (!(v9 | v13))
    {
      v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = [(NSString *)self->_name UTF8String];
        *(_DWORD *)buf = 136315394;
        v20 = "-[UAFAssetSetSubscription initWithCoder:]";
        __int16 v21 = 2080;
        v22 = v18;
        _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Decoding of the subscription %s failed: both asset sets and usage aliases are nil", buf, 0x16u);
      }
    }
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
    self = (UAFAssetSetSubscription *)[(UAFAssetSetSubscription *)self init:v5 assetSets:v9 usageAliases:v13 expires:v15];

    v16 = self;
  }
  else
  {
    uint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[UAFAssetSetSubscription initWithCoder:]";
      _os_log_error_impl(&dword_23797A000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%s Decoding of the asset set subscription name failed", buf, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

- (UAFAssetSetSubscription)initWithName:(id)a3 assetSets:(id)a4 usageAliases:(id)a5 expires:(id)a6
{
  id v11 = a3;
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UAFAssetSetSubscription;
  v15 = [(UAFAssetSetSubscription *)&v19 init];
  p_isa = (id *)&v15->super.isa;
  if (v15 && v12 | v13)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    if (v12) {
      objc_storeStrong(p_isa + 2, a4);
    }
    if (v13) {
      objc_storeStrong(p_isa + 3, a5);
    }
    objc_storeStrong(p_isa + 4, a6);
    v17 = p_isa;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(UAFAssetSetSubscription *)self name];
  v5 = [(UAFAssetSetSubscription *)self assetSets];
  v6 = [(UAFAssetSetSubscription *)self usageAliases];
  uint64_t v7 = [(UAFAssetSetSubscription *)self expirationAsString];
  v8 = [v3 stringWithFormat:@"Subscription '%@' with assetSets %@ and usageAliases %@ expires: %@", v4, v5, v6, v7];

  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)assetSets
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)usageAliases
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)expirationAsString
{
  v3 = [(UAFAssetSetSubscription *)self expiration];

  if (v3)
  {
    id v4 = objc_opt_new();
    v5 = [MEMORY[0x263EFFA18] localTimeZone];
    [v4 setTimeZone:v5];

    v6 = [(UAFAssetSetSubscription *)self expiration];
    uint64_t v7 = [v4 stringFromDate:v6];
  }
  else
  {
    uint64_t v7 = @"never";
  }

  return v7;
}

- (NSDate)expiration
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (id)init:(id)a3 assetSets:(id)a4 usageAliases:(id)a5
{
  return [(UAFAssetSetSubscription *)self initWithName:a3 assetSets:a4 usageAliases:a5 expires:0];
}

- (UAFAssetSetSubscription)initWithName:(id)a3 assetSets:(id)a4 usageAliases:(id)a5
{
  return [(UAFAssetSetSubscription *)self initWithName:a3 assetSets:a4 usageAliases:a5 expires:0];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_assetSets forKey:@"assetSets"];
  [v5 encodeObject:self->_usageAliases forKey:@"usageAliases"];
  [v5 encodeObject:self->_expiration forKey:@"expiration"];
}

- (id)propertiesAsDictionary
{
  v13[4] = *MEMORY[0x263EF8340];
  v3 = [(UAFAssetSetSubscription *)self expirationAsString];
  v12[0] = @"name";
  id v4 = [(UAFAssetSetSubscription *)self name];
  if (v4)
  {
    id v5 = [(UAFAssetSetSubscription *)self name];
  }
  else
  {
    id v5 = &stru_26EA999B8;
  }
  v13[0] = v5;
  v12[1] = @"assetSets";
  v6 = [(UAFAssetSetSubscription *)self assetSets];
  if (v6)
  {
    uint64_t v7 = [(UAFAssetSetSubscription *)self assetSets];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA78];
  }
  v13[1] = v7;
  v12[2] = @"usageAliases";
  v8 = [(UAFAssetSetSubscription *)self usageAliases];
  if (v8)
  {
    uint64_t v9 = [(UAFAssetSetSubscription *)self usageAliases];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA78];
  }
  v12[3] = @"expiration";
  v13[2] = v9;
  v13[3] = v3;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (v8) {

  }
  if (v6) {
  if (v4)
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (UAFAssetSetSubscription *)a3;
  v6 = v5;
  if (v5)
  {
    if (self == v5)
    {
      char v14 = 1;
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      v8 = [(UAFAssetSetSubscription *)v7 name];
      uint64_t v9 = [(UAFAssetSetSubscription *)self name];
      if (![v8 isEqualToString:v9])
      {
        char v14 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v10 = [(UAFAssetSetSubscription *)v7 assetSets];
      if (v10
        || ([(UAFAssetSetSubscription *)self assetSets],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v11 = [(UAFAssetSetSubscription *)v7 assetSets];
        unint64_t v12 = [(UAFAssetSetSubscription *)self assetSets];
        v34 = v11;
        if (([v11 isEqual:v12] & 1) == 0)
        {

          char v14 = 0;
LABEL_34:
          if (!v10) {

          }
          goto LABEL_37;
        }
        v31 = v12;
        int v13 = 1;
      }
      else
      {
        int v13 = 0;
      }
      v15 = [(UAFAssetSetSubscription *)v7 usageAliases];
      if (v15
        || ([(UAFAssetSetSubscription *)self usageAliases],
            (v27 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = v10;
        v17 = v15;
        v18 = v3;
        objc_super v19 = [(UAFAssetSetSubscription *)v7 usageAliases];
        v32 = [(UAFAssetSetSubscription *)self usageAliases];
        v33 = v19;
        if (![v19 isEqual:v32])
        {
          char v14 = 0;
          v3 = v18;
          v15 = v17;
          v10 = v16;
LABEL_29:

          goto LABEL_30;
        }
        int v29 = 1;
        int v30 = v13;
        v3 = v18;
        v15 = v17;
        v10 = v16;
      }
      else
      {
        int v29 = 0;
        int v30 = v13;
        v27 = 0;
      }
      v20 = [(UAFAssetSetSubscription *)v7 expiration];
      if (v20
        || ([(UAFAssetSetSubscription *)self expiration], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v28 = v3;
        __int16 v21 = [(UAFAssetSetSubscription *)v7 expiration];
        v22 = [(UAFAssetSetSubscription *)self expiration];
        char v14 = [v21 isEqual:v22];

        if (v20)
        {

          if (v29)
          {
            v3 = v28;
            int v13 = v30;
            goto LABEL_29;
          }
          v3 = v28;
          int v13 = v30;
LABEL_30:
          if (!v15) {

          }
          if (v13)
          {
          }
          goto LABEL_34;
        }
        v3 = v28;
        uint64_t v23 = v26;
      }
      else
      {
        uint64_t v23 = 0;
        char v14 = 1;
      }

      int v13 = v30;
      if (v29) {
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  char v14 = 0;
LABEL_38:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(NSDictionary *)self->_assetSets hash] ^ v3;
  uint64_t v5 = [(NSDictionary *)self->_usageAliases hash];
  return v4 ^ v5 ^ [(NSDate *)self->_expiration hash];
}

- (BOOL)isValid:(id)a3 error:(id *)a4
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    id v6 = +[UAFConfigurationManager defaultManager];
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = [(UAFAssetSetSubscription *)self assetSets];
  uint64_t v7 = [obj countByEnumeratingWithState:&v102 objects:v132 count:16];
  v93 = self;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v103;
    id v89 = v6;
    v90 = a4;
    uint64_t v87 = *(void *)v103;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v88 = v8;
      do
      {
        if (*(void *)v103 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v102 + 1) + 8 * v10);
        uint64_t v12 = [v6 getAssetSet:v11];
        if (!v12)
        {
          if (v90)
          {
            v68 = (void *)MEMORY[0x263F087E8];
            if (*v90)
            {
              v130[0] = *MEMORY[0x263F08320];
              v69 = NSString;
              v70 = [(UAFAssetSetSubscription *)self name];
              v71 = [v69 stringWithFormat:@"Subscription %@ references unknown asset set %@", v70, v11];
              v130[1] = *MEMORY[0x263F08608];
              id v72 = *v90;
              v131[0] = v71;
              v131[1] = v72;
              v73 = NSDictionary;
              v74 = (void **)v131;
              v75 = v130;
              uint64_t v76 = 2;
            }
            else
            {
              uint64_t v128 = *MEMORY[0x263F08320];
              v84 = NSString;
              v70 = [(UAFAssetSetSubscription *)self name];
              v71 = [v84 stringWithFormat:@"Subscription %@ references unknown asset set %@", v70, v11];
              v129 = v71;
              v73 = NSDictionary;
              v74 = &v129;
              v75 = &v128;
              uint64_t v76 = 1;
            }
            v85 = [v73 dictionaryWithObjects:v74 forKeys:v75 count:v76];
            id *v90 = [v68 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v85];

            self = v93;
          }
          int v13 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
          v24 = obj;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v79 = [(UAFAssetSetSubscription *)self name];
            *(_DWORD *)buf = 136315650;
            v116 = "-[UAFAssetSetSubscription isValid:error:]";
            __int16 v117 = 2112;
            v118 = v79;
            __int16 v119 = 2112;
            v120 = v11;
            v80 = "%s Subscription %@ references unknown asset set %@";
LABEL_62:
            _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, v80, buf, 0x20u);
          }
          goto LABEL_38;
        }
        int v13 = v12;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        char v14 = [(UAFAssetSetSubscription *)self assetSets];
        v15 = v11;
        v16 = [v14 objectForKeyedSubscript:v11];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v98 objects:v127 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v99;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v99 != v19) {
                objc_enumerationMutation(v16);
              }
              __int16 v21 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              v22 = [v13 usageTypes];
              char v23 = [v22 containsObject:v21];

              if ((v23 & 1) == 0)
              {
                v36 = v15;
                if (v90)
                {
                  v37 = (void *)MEMORY[0x263F087E8];
                  if (*v90)
                  {
                    v125[0] = *MEMORY[0x263F08320];
                    v38 = NSString;
                    v39 = [(UAFAssetSetSubscription *)v93 name];
                    v40 = [v38 stringWithFormat:@"Subscription %@ references unknown usage type %@ in asset set %@", v39, v21, v15];
                    v125[1] = *MEMORY[0x263F08608];
                    id v41 = *v90;
                    v126[0] = v40;
                    v126[1] = v41;
                    v42 = NSDictionary;
                    v43 = (void **)v126;
                    v44 = v125;
                    uint64_t v45 = 2;
                  }
                  else
                  {
                    uint64_t v123 = *MEMORY[0x263F08320];
                    v46 = NSString;
                    v39 = [(UAFAssetSetSubscription *)v93 name];
                    v40 = [v46 stringWithFormat:@"Subscription %@ references unknown usage type %@ in asset set %@", v39, v21, v15];
                    v124 = v40;
                    v42 = NSDictionary;
                    v43 = &v124;
                    v44 = &v123;
                    uint64_t v45 = 1;
                  }
                  v47 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:v45];
                  id *v90 = [v37 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v47];
                }
                v48 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
                v24 = obj;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  v67 = [(UAFAssetSetSubscription *)v93 name];
                  *(_DWORD *)buf = 136315906;
                  v116 = "-[UAFAssetSetSubscription isValid:error:]";
                  __int16 v117 = 2112;
                  v118 = v67;
                  __int16 v119 = 2112;
                  v120 = v21;
                  __int16 v121 = 2112;
                  v122 = v36;
                  _os_log_error_impl(&dword_23797A000, v48, OS_LOG_TYPE_ERROR, "%s Subscription %@ references unknown usage type %@ in asset set %@", buf, 0x2Au);
                }
                id v6 = v89;
                goto LABEL_38;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v98 objects:v127 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        ++v10;
        id v6 = v89;
        self = v93;
        uint64_t v9 = v87;
      }
      while (v10 != v88);
      uint64_t v8 = [obj countByEnumeratingWithState:&v102 objects:v132 count:16];
      a4 = v90;
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v24 = [(UAFAssetSetSubscription *)self usageAliases];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v94 objects:v114 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    v91 = a4;
    uint64_t v27 = *(void *)v95;
LABEL_21:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v95 != v27) {
        objc_enumerationMutation(v24);
      }
      int v29 = *(void **)(*((void *)&v94 + 1) + 8 * v28);
      uint64_t v30 = [v6 getUsageAlias:v29];
      if (!v30) {
        break;
      }
      int v13 = v30;
      v31 = [(UAFAssetSetSubscription *)self usageAliases];
      v32 = [v31 objectForKeyedSubscript:v29];

      v33 = [v13 values];
      v34 = [v33 objectForKeyedSubscript:v32];

      if (!v34)
      {
        if (v91)
        {
          id v58 = v6;
          v59 = (void *)MEMORY[0x263F087E8];
          if (*v91)
          {
            v108[0] = *MEMORY[0x263F08320];
            v60 = NSString;
            v61 = [(UAFAssetSetSubscription *)v93 name];
            v62 = [v60 stringWithFormat:@"Subscription %@ references unknown value %@ in usage type %@", v61, v32, v29];
            v108[1] = *MEMORY[0x263F08608];
            v109[0] = v62;
            v109[1] = *v91;
            v63 = NSDictionary;
            v64 = (void **)v109;
            v65 = v108;
            uint64_t v66 = 2;
          }
          else
          {
            uint64_t v106 = *MEMORY[0x263F08320];
            v81 = NSString;
            v61 = [(UAFAssetSetSubscription *)v93 name];
            v62 = [v81 stringWithFormat:@"Subscription %@ references unknown value %@ in usage type %@", v61, v32, v29];
            v107 = v62;
            v63 = NSDictionary;
            v64 = &v107;
            v65 = &v106;
            uint64_t v66 = 1;
          }
          v82 = [v63 dictionaryWithObjects:v64 forKeys:v65 count:v66];
          id *v91 = [v59 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v82];

          id v6 = v58;
        }
        v83 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          v86 = [(UAFAssetSetSubscription *)v93 name];
          *(_DWORD *)buf = 136315906;
          v116 = "-[UAFAssetSetSubscription isValid:error:]";
          __int16 v117 = 2112;
          v118 = v86;
          __int16 v119 = 2112;
          v120 = v32;
          __int16 v121 = 2112;
          v122 = v29;
          _os_log_error_impl(&dword_23797A000, v83, OS_LOG_TYPE_ERROR, "%s Subscription %@ references unknown value %@ in usage type %@", buf, 0x2Au);
        }
        goto LABEL_38;
      }

      ++v28;
      self = v93;
      if (v26 == v28)
      {
        uint64_t v26 = [v24 countByEnumeratingWithState:&v94 objects:v114 count:16];
        BOOL v35 = 1;
        if (v26) {
          goto LABEL_21;
        }
        goto LABEL_39;
      }
    }
    if (v91)
    {
      v50 = (void *)MEMORY[0x263F087E8];
      if (*v91)
      {
        v112[0] = *MEMORY[0x263F08320];
        v51 = NSString;
        v52 = [(UAFAssetSetSubscription *)self name];
        v53 = [v51 stringWithFormat:@"Subscription %@ references unknown usage alias %@", v52, v29];
        v112[1] = *MEMORY[0x263F08608];
        v113[0] = v53;
        v113[1] = *v91;
        v54 = NSDictionary;
        v55 = (void **)v113;
        v56 = v112;
        uint64_t v57 = 2;
      }
      else
      {
        uint64_t v110 = *MEMORY[0x263F08320];
        v77 = NSString;
        v52 = [(UAFAssetSetSubscription *)self name];
        v53 = [v77 stringWithFormat:@"Subscription %@ references unknown usage alias %@", v52, v29];
        v111 = v53;
        v54 = NSDictionary;
        v55 = &v111;
        v56 = &v110;
        uint64_t v57 = 1;
      }
      v78 = [v54 dictionaryWithObjects:v55 forKeys:v56 count:v57];
      id *v91 = [v50 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v78];

      self = v93;
    }
    int v13 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v79 = [(UAFAssetSetSubscription *)self name];
      *(_DWORD *)buf = 136315650;
      v116 = "-[UAFAssetSetSubscription isValid:error:]";
      __int16 v117 = 2112;
      v118 = v79;
      __int16 v119 = 2112;
      v120 = v29;
      v80 = "%s Subscription %@ references unknown usage alias %@";
      goto LABEL_62;
    }
LABEL_38:

    BOOL v35 = 0;
  }
  else
  {
    BOOL v35 = 1;
  }
LABEL_39:

  return v35;
}

@end