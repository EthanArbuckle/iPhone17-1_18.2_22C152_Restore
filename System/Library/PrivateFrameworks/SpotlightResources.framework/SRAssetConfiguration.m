@interface SRAssetConfiguration
+ (id)configuration;
- (BOOL)isValidLocale:(id)a3 deliveryType:(id)a4;
- (SRAssetConfiguration)init;
- (id)assetTypes;
- (id)contentTypesForClient:(id)a3;
- (id)debugDescription;
- (unsigned)supportedLocalesVersion;
- (void)clear;
- (void)setLocales:(id)a3;
- (void)setProperties:(id)a3 client:(id)a4;
@end

@implementation SRAssetConfiguration

- (id)assetTypes
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_properties;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v8 = objc_alloc_init(SRAssetType);
        [(SRAssetType *)v8 setAssetType:v7];
        v9 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v7];
        v10 = [v9 objectForKeyedSubscript:@"XPCName"];
        [(SRAssetType *)v8 setXpcName:v10];

        v11 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v7];
        v12 = [v11 objectForKeyedSubscript:@"DeliveryTypes"];
        [(SRAssetType *)v8 setContentTypeMap:v12];

        [(SRAssetType *)v8 setDeliveryTypeMap:self->_deliveryTypeMap];
        v13 = [(SRAssetType *)v8 contentTypeMap];
        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x263EFFA08]);
          id v15 = [(SRAssetType *)v8 contentTypeMap];
          v16 = [v15 allKeys];
          v17 = (void *)[v14 initWithArray:v16];
          [(SRAssetType *)v8 setDeliveryTypes:v17];
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x263EFFA08]);
          [(SRAssetType *)v8 setDeliveryTypes:v15];
        }

        v18 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v7];
        v19 = [v18 objectForKeyedSubscript:@"CompatibilityVersion"];
        if (v19)
        {
          v20 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v7];
          v21 = [v20 objectForKeyedSubscript:@"CompatibilityVersion"];
          -[SRAssetType setCompatibilityVersion:](v8, "setCompatibilityVersion:", [v21 integerValue]);
        }
        else
        {
          [(SRAssetType *)v8 setCompatibilityVersion:-1];
        }

        [v24 addObject:v8];
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  return v24;
}

- (id)contentTypesForClient:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_clientMap objectForKeyedSubscript:a3];
}

+ (id)configuration
{
  v2 = objc_alloc_init(SRAssetConfiguration);
  return v2;
}

- (SRAssetConfiguration)init
{
  v16.receiver = self;
  v16.super_class = (Class)SRAssetConfiguration;
  v2 = [(SRAssetConfiguration *)&v16 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v2->_properties;
    v2->_properties = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    contentTypeMap = v2->_contentTypeMap;
    v2->_contentTypeMap = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clientMap = v2->_clientMap;
    v2->_clientMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deliveryTypeMap = v2->_deliveryTypeMap;
    v2->_deliveryTypeMap = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    deliveryTypes = v2->_deliveryTypes;
    v2->_deliveryTypes = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    localeMap = v2->_localeMap;
    v2->_localeMap = v13;

    v2->_localesVersion = 0;
  }
  return v2;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)[&stru_270B18FF0 mutableCopy];
  uint64_t v4 = v3;
  if (self->_properties) {
    [v3 appendFormat:@"properties: %@\n\n", self->_properties];
  }
  if (self->_contentTypeMap) {
    [v4 appendFormat:@"contentTypeMap: %@\n\n", self->_contentTypeMap];
  }
  if (self->_clientMap) {
    [v4 appendFormat:@"clientMap: %@\n\n", self->_clientMap];
  }
  if (self->_deliveryTypeMap) {
    [v4 appendFormat:@"deliveryTypeMap: %@\n\n", self->_deliveryTypeMap];
  }
  if (self->_deliveryTypes) {
    [v4 appendFormat:@"deliveryTypes: %@\n\n", self->_deliveryTypes];
  }
  if (self->_localeMap) {
    [v4 appendFormat:@"localeMap: %@\n", self->_localeMap];
  }
  return v4;
}

- (void)setProperties:(id)a3 client:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"AssetType"];
  v9 = [v6 objectForKeyedSubscript:@"AssetProperties"];
  id v10 = [v9 objectForKeyedSubscript:@"_XPCName"];
  v11 = [v9 objectForKeyedSubscript:@"_CompatibilityVersion"];
  v12 = [v6 objectForKeyedSubscript:@"DeliveryTypes"];
  id v66 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (!v10) {
    id v10 = v8;
  }
  if (v8 && v12)
  {
    id v59 = v10;
    v60 = v9;
    v58 = v11;
    id v62 = v6;
    v63 = v12;
    id v64 = v7;
    if (v10 && v11)
    {
      v13 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];

      if (!v13)
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [(NSMutableDictionary *)self->_properties setObject:v14 forKeyedSubscript:v8];
      }
      id v15 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
      [v15 setObject:v10 forKeyedSubscript:@"XPCName"];

      objc_super v16 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
      [v16 setObject:v11 forKeyedSubscript:@"CompatibilityVersion"];

      v17 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
      v18 = [v17 objectForKeyedSubscript:@"DeliveryTypes"];

      if (!v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v20 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
        [v20 setObject:v19 forKeyedSubscript:@"DeliveryTypes"];
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v21 = v12;
      obuint64_t j = (id)[v21 countByEnumeratingWithState:&v83 objects:v90 count:16];
      if (obj)
      {
        uint64_t v67 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != obj; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v84 != v67) {
              objc_enumerationMutation(v21);
            }
            uint64_t v23 = *(void *)(*((void *)&v83 + 1) + 8 * i);
            id v24 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
            long long v25 = [v24 objectForKeyedSubscript:@"DeliveryTypes"];
            long long v26 = [v25 objectForKeyedSubscript:v23];

            if (!v26)
            {
              id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
              long long v28 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
              v29 = [v28 objectForKeyedSubscript:@"DeliveryTypes"];
              [v29 setObject:v27 forKeyedSubscript:v23];
            }
            uint64_t v30 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];
            v31 = [v30 objectForKeyedSubscript:@"DeliveryTypes"];
            v32 = [v31 objectForKeyedSubscript:v23];
            v33 = [v21 objectForKeyedSubscript:v23];
            [v32 addObjectsFromArray:v33];
          }
          obuint64_t j = (id)[v21 countByEnumeratingWithState:&v83 objects:v90 count:16];
        }
        while (obj);
      }

      id v7 = v64;
    }
    v61 = v8;
    v34 = [(NSMutableDictionary *)self->_clientMap objectForKeyedSubscript:v7];

    if (!v34)
    {
      id v35 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(NSMutableDictionary *)self->_clientMap setObject:v35 forKeyedSubscript:v7];
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obja = v12;
    uint64_t v68 = [obja countByEnumeratingWithState:&v79 objects:v89 count:16];
    if (v68)
    {
      uint64_t v65 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v80 != v65) {
            objc_enumerationMutation(obja);
          }
          uint64_t v37 = *(void *)(*((void *)&v79 + 1) + 8 * j);
          [(NSMutableSet *)self->_deliveryTypes addObject:v37];
          v38 = [obja objectForKeyedSubscript:v37];
          [v66 addObjectsFromArray:v38];

          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          v39 = [obja objectForKeyedSubscript:v37];
          uint64_t v40 = [v39 countByEnumeratingWithState:&v75 objects:v88 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v76;
            do
            {
              for (uint64_t k = 0; k != v41; ++k)
              {
                if (*(void *)v76 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void *)(*((void *)&v75 + 1) + 8 * k);
                v45 = [(NSMutableDictionary *)self->_deliveryTypeMap objectForKeyedSubscript:v44];

                if (!v45)
                {
                  id v46 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                  [(NSMutableDictionary *)self->_deliveryTypeMap setObject:v46 forKeyedSubscript:v44];
                }
                v47 = [(NSMutableDictionary *)self->_deliveryTypeMap objectForKeyedSubscript:v44];
                [v47 addObject:v37];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v75 objects:v88 count:16];
            }
            while (v41);
          }
        }
        uint64_t v68 = [obja countByEnumeratingWithState:&v79 objects:v89 count:16];
      }
      while (v68);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v48 = v66;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v71 objects:v87 count:16];
    id v7 = v64;
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v72;
      do
      {
        for (uint64_t m = 0; m != v50; ++m)
        {
          if (*(void *)v72 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void *)(*((void *)&v71 + 1) + 8 * m);
          v54 = [(NSMutableDictionary *)self->_contentTypeMap objectForKeyedSubscript:v53];

          if (!v54)
          {
            id v55 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            [(NSMutableDictionary *)self->_contentTypeMap setObject:v55 forKeyedSubscript:v53];
          }
          v56 = [(NSMutableDictionary *)self->_contentTypeMap objectForKeyedSubscript:v53];
          [v56 addObject:v64];

          v57 = [(NSMutableDictionary *)self->_clientMap objectForKeyedSubscript:v64];
          [v57 addObject:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v71 objects:v87 count:16];
      }
      while (v50);
    }

    v8 = v61;
    id v6 = v62;
    id v10 = v59;
    v9 = v60;
    v11 = v58;
    v12 = v63;
  }
}

- (void)setLocales:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToString:@"Version"])
        {
          id v10 = [v4 objectForKeyedSubscript:@"Version"];
          self->_localesVersion = [v10 unsignedIntValue];
        }
        else
        {
          id v10 = [v4 objectForKeyedSubscript:v9];
          [(NSMutableDictionary *)self->_localeMap setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)isValidLocale:(id)a3 deliveryType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  char v9 = 0;
  if (v6 && v7)
  {
    if (self->_localesVersion)
    {
      id v10 = [(NSMutableDictionary *)self->_localeMap objectForKeyedSubscript:v7];
      char v9 = [v10 containsObject:v6];
    }
    else
    {
      char v9 = 1;
    }
  }

  return v9;
}

- (void)clear
{
  [(NSMutableDictionary *)self->_properties removeAllObjects];
  [(NSMutableDictionary *)self->_contentTypeMap removeAllObjects];
  [(NSMutableDictionary *)self->_clientMap removeAllObjects];
  deliveryTypeMap = self->_deliveryTypeMap;
  [(NSMutableDictionary *)deliveryTypeMap removeAllObjects];
}

- (unsigned)supportedLocalesVersion
{
  return self->_localesVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeMap, 0);
  objc_storeStrong((id *)&self->_deliveryTypes, 0);
  objc_storeStrong((id *)&self->_deliveryTypeMap, 0);
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_storeStrong((id *)&self->_contentTypeMap, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end