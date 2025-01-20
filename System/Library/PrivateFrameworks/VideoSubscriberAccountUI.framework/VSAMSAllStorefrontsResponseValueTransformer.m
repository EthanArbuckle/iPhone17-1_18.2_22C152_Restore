@interface VSAMSAllStorefrontsResponseValueTransformer
- (id)transformedValue:(id)a3;
@end

@implementation VSAMSAllStorefrontsResponseValueTransformer

- (id)transformedValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Handling response %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 ratingsStoreFronts];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v12 = objc_alloc_init(VSStorefront);
          v13 = [v11 storeFrontID];
          [(VSStorefront *)v12 setIdentitifer:v13];

          v14 = [v11 name];
          [(VSStorefront *)v12 setDisplayName:v14];

          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VSAMSAllStorefrontsResponseValueTransformer transformedValue:]((uint64_t)v3, v6);
    }
  }

  if ([v5 count])
  {
    v15 = (void *)MEMORY[0x263F1E208];
    v16 = (void *)[v5 copy];
    uint64_t v17 = [v15 failableWithObject:v16];
  }
  else
  {
    v18 = VSErrorLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VSAMSAllStorefrontsResponseValueTransformer transformedValue:](v18);
    }

    v16 = VSPrivateError();
    uint64_t v17 = [MEMORY[0x263F1E208] failableWithError:v16];
  }
  v19 = (void *)v17;

  return v19;
}

- (void)transformedValue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "No storefronts.  Will fail as unexpected data response.", v1, 2u);
}

- (void)transformedValue:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Unexpected response type: %@", (uint8_t *)&v2, 0xCu);
}

@end