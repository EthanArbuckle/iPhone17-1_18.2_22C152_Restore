@interface MTTreatmentProfile
+ (id)treatmentProfileWithConfigData:(id)a3;
- (MTTreatmentProfile)initWithConfigDictionary:(id)a3;
- (NSArray)treatments;
- (id)performTreatments:(id)a3;
- (void)setTreatments:(id)a3;
@end

@implementation MTTreatmentProfile

+ (id)treatmentProfileWithConfigData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (treatmentProfileWithConfigData__onceToken != -1) {
      dispatch_once(&treatmentProfileWithConfigData__onceToken, &__block_literal_global_20);
    }
    id v5 = (id)treatmentProfileWithConfigData__treatmentProfileCache;
    objc_sync_enter(v5);
    v6 = [(id)treatmentProfileWithConfigData__treatmentProfileCache objectForKeyedSubscript:v4];
    if (!v6)
    {
      v6 = [[MTTreatmentProfile alloc] initWithConfigDictionary:v4];
      [(id)treatmentProfileWithConfigData__treatmentProfileCache setObject:v6 forKeyedSubscript:v4];
    }
    objc_sync_exit(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __53__MTTreatmentProfile_treatmentProfileWithConfigData___block_invoke()
{
  treatmentProfileWithConfigData__treatmentProfileCache = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

- (MTTreatmentProfile)initWithConfigDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MTTreatmentProfile;
  id v5 = [(MTTreatmentProfile *)&v25 init];
  if (!v5) {
    goto LABEL_18;
  }
  v6 = [v4 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v6 intValue] > 1)
  {
    v9 = [v4 objectForKeyedSubscript:@"treatments"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218211000, v19, OS_LOG_TYPE_ERROR, "MetricsKit: Treatment profile doesn't have valid treatments configuration", buf, 2u);
        }

        goto LABEL_7;
      }
    }
    v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = +[MTTreatment treatmentWithConfigData:](MTTreatment, "treatmentWithConfigData:", *(void *)(*((void *)&v20 + 1) + 8 * v15), (void)v20);
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v13);
    }

    v17 = (void *)[v10 copy];
    [(MTTreatmentProfile *)v5 setTreatments:v17];

LABEL_18:
    v8 = v5;
    goto LABEL_19;
  }
  v7 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Treatment profile configuration is empty or the format version is not supported", buf, 2u);
  }

LABEL_7:
  v8 = 0;
LABEL_19:

  return v8;
}

- (id)performTreatments:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v4 = a3;
  id v14 = v4;
  id v5 = [(MTTreatmentProfile *)self treatments];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__MTTreatmentProfile_performTreatments___block_invoke;
  v8[3] = &unk_264310C60;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __40__MTTreatmentProfile_performTreatments___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    uint64_t v4 = result;
    *(void *)(*(void *)(*(void *)(v4 + 32) + 8) + 40) = objc_msgSend(a2, "performTreatment:");
    return MEMORY[0x270F9A758]();
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (NSArray)treatments
{
  return self->_treatments;
}

- (void)setTreatments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end