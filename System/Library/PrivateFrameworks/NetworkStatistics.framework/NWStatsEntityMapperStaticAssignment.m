@interface NWStatsEntityMapperStaticAssignment
- (NWStatsEntityMapperStaticAssignment)init;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
@end

@implementation NWStatsEntityMapperStaticAssignment

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id result = (id)[(NSMutableDictionary *)self->_staticUUIDToBundleIDMap objectForKeyedSubscript:a3];
  if (a4) {
    *a4 = 3;
  }
  return result;
}

- (NWStatsEntityMapperStaticAssignment)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)NWStatsEntityMapperStaticAssignment;
  v2 = [(NWStatsEntityMapperStaticAssignment *)&v19 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    staticUUIDToBundleIDMap = v2->_staticUUIDToBundleIDMap;
    v2->_staticUUIDToBundleIDMap = v3;

    if (v2->_staticUUIDToBundleIDMap)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v5 = objc_msgSend(&unk_26CCB1D98, "allKeys", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            id v11 = objc_alloc(MEMORY[0x263F08C38]);
            v12 = [&unk_26CCB1D98 objectForKeyedSubscript:v10];
            v13 = (void *)[v11 initWithUUIDString:v12];

            [(NSMutableDictionary *)v2->_staticUUIDToBundleIDMap setObject:v10 forKeyedSubscript:v13];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v7);
      }
    }
    else
    {
      v5 = v2;
      v2 = 0;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end