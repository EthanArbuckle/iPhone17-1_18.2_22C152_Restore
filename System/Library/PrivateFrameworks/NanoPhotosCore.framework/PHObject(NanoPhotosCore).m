@interface PHObject(NanoPhotosCore)
+ (id)npto_localIdentifiersWithUUIDs:()NanoPhotosCore;
- (id)npto_uuid;
- (void)npto_setUUID:()NanoPhotosCore;
@end

@implementation PHObject(NanoPhotosCore)

+ (id)npto_localIdentifiersWithUUIDs:()NanoPhotosCore
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "UUIDString", (void)v15);
        v12 = [a1 localIdentifierWithUUID:v11];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];
  return v13;
}

- (id)npto_uuid
{
  v2 = objc_getAssociatedObject(a1, sel_npto_uuid);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08C38]);
    id v4 = (void *)MEMORY[0x263F14E78];
    v5 = [a1 localIdentifier];
    id v6 = [v4 uuidFromLocalIdentifier:v5];
    v2 = (void *)[v3 initWithUUIDString:v6];
  }
  return v2;
}

- (void)npto_setUUID:()NanoPhotosCore
{
}

@end