@interface NSArray(Foundation_Extensions)
- (void)muDeepMutableCopy;
@end

@implementation NSArray(Foundation_Extensions)

- (void)muDeepMutableCopy
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_17;
            }
          }
          v10 = objc_msgSend(v9, "muDeepMutableCopy", v13, (void)v14);
        }
        else if ([v9 conformsToProtocol:&unk_26C19FA70])
        {
          v10 = [v9 mutableCopy];
        }
        else if ([v9 conformsToProtocol:&unk_26C19F9A8])
        {
          v10 = [v9 copy];
        }
        else
        {
          v10 = v9;
        }
        v11 = v10;
        if (v10)
        {
          [v2 addObject:v10];
          goto LABEL_19;
        }
LABEL_17:
        v11 = +[PPKImageWriter log]();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v9;
          _os_log_impl(&dword_20C2D7000, v11, OS_LOG_TYPE_DEFAULT, "Unable to copy object for [NSMutableArray muDeepMutableCopy]: %@", buf, 0xCu);
        }
LABEL_19:
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  return v2;
}

@end