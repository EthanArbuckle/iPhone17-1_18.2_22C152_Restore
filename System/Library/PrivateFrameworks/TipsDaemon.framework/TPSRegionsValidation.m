@interface TPSRegionsValidation
- (TPSRegionsValidation)initWithTargetRegions:(id)a3 excludeRegions:(id)a4;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSRegionsValidation

- (TPSRegionsValidation)initWithTargetRegions:(id)a3 excludeRegions:(id)a4
{
  id v6 = a4;
  v7 = [a3 valueForKeyPath:@"lowercaseString"];
  v8 = [v6 valueForKeyPath:@"lowercaseString"];

  v11.receiver = self;
  v11.super_class = (Class)TPSRegionsValidation;
  v9 = [(TPSInclusivityValidation *)&v11 initWithTargetValues:v7 excludeValues:v8];

  return v9;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(TPSRegionsValidation *)self targetRegions];
  if ([v5 count])
  {

LABEL_4:
    v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v9 = [v8 objectForKey:*MEMORY[0x1E4F1C400]];
    v10 = [v9 lowercaseString];

    objc_super v11 = [(TPSRegionsValidation *)self targetRegions];
    if ([v11 count])
    {
      v12 = [(TPSRegionsValidation *)self targetRegions];
      int v13 = [v12 containsObject:v10];
    }
    else
    {
      int v13 = 1;
    }

    v14 = [(TPSRegionsValidation *)self excludeRegions];
    int v15 = [v14 containsObject:v10];

    uint64_t v16 = v13 & (v15 ^ 1u);
    v17 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_opt_class();
      id v19 = v18;
      v20 = [(TPSRegionsValidation *)self targetRegions];
      v21 = [v20 componentsJoinedByString:@","];
      v22 = [(TPSRegionsValidation *)self excludeRegions];
      v23 = [v22 componentsJoinedByString:@","];
      int v24 = 138413314;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v10;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 1024;
      int v33 = v16;
      _os_log_debug_impl(&dword_1E4492000, v17, OS_LOG_TYPE_DEBUG, "%@ - checking device region: %@, target regions: %@, exclude regions: %@. Valid: %d", (uint8_t *)&v24, 0x30u);
    }
    goto LABEL_10;
  }
  id v6 = [(TPSRegionsValidation *)self excludeRegions];
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_4;
  }
  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[TPSRegionsValidation validateWithCompletion:]((uint64_t)self, v10);
  }
  uint64_t v16 = 1;
LABEL_10:

  v4[2](v4, v16, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude region(s) is specified.", (uint8_t *)&v4, 0xCu);
}

@end