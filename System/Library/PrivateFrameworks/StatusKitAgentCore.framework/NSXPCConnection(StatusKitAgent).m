@interface NSXPCConnection(StatusKitAgent)
- (id)sk_stringArrayValueForEntitlement:()StatusKitAgent;
- (id)sk_stringValueForEntitlement:()StatusKitAgent;
- (uint64_t)sk_BOOLeanValueForEntitlement:()StatusKitAgent;
@end

@implementation NSXPCConnection(StatusKitAgent)

- (id)sk_stringArrayValueForEntitlement:()StatusKitAgent
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "valueForEntitlement:");
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v1;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v2 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  v9 = (void *)[v2 copy];

  return v9;
}

- (uint64_t)sk_BOOLeanValueForEntitlement:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "valueForEntitlement:");
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)sk_stringValueForEntitlement:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "valueForEntitlement:");
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end