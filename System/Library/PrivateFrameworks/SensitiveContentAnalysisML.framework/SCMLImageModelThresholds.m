@interface SCMLImageModelThresholds
+ (id)_createThresholdDictionaryWithError:(id *)a3;
+ (id)_validateScoreThresholdsJson:(id)a3 error:(id *)a4;
+ (id)instance;
- (NSDictionary)_thresholdDict;
- (NSError)_loadError;
- (SCMLImageModelThresholds)init;
- (double)thresholdForLabel:(id)a3 classificationMode:(unint64_t)a4 modelVersion:(id)a5 error:(id *)a6;
- (void)set_loadError:(id)a3;
- (void)set_thresholdDict:(id)a3;
@end

@implementation SCMLImageModelThresholds

+ (id)_validateScoreThresholdsJson:(id)a3 error:(id *)a4
{
  v5 = v45[13] = *MEMORY[0x263EF8340];
  if (!v5) {
    goto LABEL_38;
  }
  {
    v45[0] = @"1.5.0";
    v45[1] = @"1.6.0";
    v45[2] = @"1.6.1";
    v45[3] = @"1.7.0";
    v45[4] = @"1.7.1";
    v45[5] = @"1.7.2";
    v45[6] = @"1.7.3";
    v45[7] = @"1.7.4";
    v45[8] = @"1.7.5";
    v45[9] = @"1.7.6";
    v45[10] = @"1.7.7";
    v45[11] = @"1.7.8";
    v45[12] = @"1.7.9";
    [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:13];
  }
  {
LABEL_38:
    id v19 = 0;
    goto LABEL_39;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v22 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (!v22) {
    goto LABEL_34;
  }
  uint64_t v24 = *(void *)v39;
  while (2)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v39 != v24) {
        objc_enumerationMutation(obj);
      }
      v27 = v6 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * i)];

      if (!v27)
      {

LABEL_37:
        goto LABEL_38;
      }
      {

        goto LABEL_37;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v29 = v27;
      uint64_t v21 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v21)
      {
        uint64_t v23 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v29);
            }
            v8 = v7 = [v29 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * j)];

            if (!v8
                  v10 = objc_claimAutoreleasedReturnValue(),
                  [v10 allValues],
                  v11 = objc_claimAutoreleasedReturnValue(),
                  v11,
                  v10,
                  (v12 & 1) == 0))
            {
              id v13 = v8;
LABEL_36:

              goto LABEL_37;
            }
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v13 = v8;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v42 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v31;
              while (2)
              {
                for (uint64_t k = 0; k != v14; ++k)
                {
                  if (*(void *)v31 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  id v17 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * k)];
                  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v18 = v17;
                  }
                  else
                  {
                    id v18 = 0;
                  }

                  if (!v18)
                  {

                    goto LABEL_36;
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v42 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v21 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_34:

  id v19 = obj;
LABEL_39:

  return v19;
}

+ (id)_createThresholdDictionaryWithError:(id *)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = NSURL;
  v7 = [v5 resourcePath];
  v23[0] = v7;
  v23[1] = @"Models/ImageModel/operating_thresholds_versioned.json";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v9 = [v6 fileURLWithPathComponents:v8];

  v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
  id v22 = 0;
  v11 = [MEMORY[0x263F08900] JSONObjectWithData:v10 options:0 error:&v22];
  id v12 = v22;
  if (v11)
  {
    id v13 = [a1 _validateScoreThresholdsJson:v11 error:a3];
  }
  else
  {
    uint64_t v14 = +[SCMLLog handler];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SCMLImageModelThresholds _createThresholdDictionaryWithError:]((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)instance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SCMLImageModelThresholds_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SCMLImageModelThresholds instance]::onceToken != -1) {
    dispatch_once(&+[SCMLImageModelThresholds instance]::onceToken, block);
  }
  v2 = (void *)+[SCMLImageModelThresholds instance]::sharedCoder;

  return v2;
}

uint64_t __36__SCMLImageModelThresholds_instance__block_invoke(uint64_t a1)
{
  +[SCMLImageModelThresholds instance]::sharedCoder = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (SCMLImageModelThresholds)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCMLImageModelThresholds;
  v2 = [(SCMLImageModelThresholds *)&v8 init];
  if (v2)
  {
    id v7 = 0;
    v3 = +[SCMLImageModelThresholds _createThresholdDictionaryWithError:&v7];
    id v4 = v7;
    [(SCMLImageModelThresholds *)v2 set_thresholdDict:v3];

    if (v4)
    {
      v5 = (void *)[v4 copy];
      [(SCMLImageModelThresholds *)v2 set_loadError:v5];
    }
    else
    {
      [(SCMLImageModelThresholds *)v2 set_loadError:0];
    }
  }
  return v2;
}

- (double)thresholdForLabel:(id)a3 classificationMode:(unint64_t)a4 modelVersion:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(SCMLImageModelThresholds *)self _loadError];

  if (!v12)
  {
    if ([v10 hasPrefix:@"otgx_"])
    {
      uint64_t v15 = +[SCMLImageLabelCoder instance];
      uint64_t v16 = [v15 decodeFromP1:v10];

      id v10 = (id)v16;
    }
    uint64_t v17 = [(SCMLImageModelThresholds *)self _thresholdDict];
    uint64_t v14 = [v17 objectForKey:v11];

    if (v14)
    {
      uint64_t v18 = +[SCMLImageLabelCoder instance];
      uint64_t v19 = [v18 encodeToHex:v10];

      uint64_t v20 = [v14 objectForKey:v19];
      uint64_t v21 = v20;
      if (v20) {
        id v22 = {;
      }
        uint64_t v23 = [NSNumber numberWithUnsignedInteger:a4];
        uint64_t v24 = [v22 objectForKeyedSubscript:v23];

        v25 = [(_anonymous_namespace_ *)v21 objectForKey:v24];
        v26 = v25;
        if (v25)
        {
          [v25 doubleValue];
          double v13 = v27;
        }
        else
        {
          long long v40 = +[SCMLLog handler];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            -[SCMLImageModelThresholds thresholdForLabel:classificationMode:modelVersion:error:](a4, v40);
          }

          double v13 = 1.1;
        }
      }
      else
      {
        uint64_t v24 = +[SCMLLog handler];
        double v13 = 1.1;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[SCMLImageModelThresholds thresholdForLabel:classificationMode:modelVersion:error:]((uint64_t)v10, v24, v34, v35, v36, v37, v38, v39);
        }
      }
    }
    else
    {
      uint64_t v19 = +[SCMLLog handler];
      double v13 = 1.1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SCMLImageModelThresholds thresholdForLabel:classificationMode:modelVersion:error:]((uint64_t)v11, v19, v28, v29, v30, v31, v32, v33);
      }
    }

    goto LABEL_20;
  }
  double v13 = 1.1;
  if (a6)
  {
    uint64_t v14 = [(SCMLImageModelThresholds *)self _loadError];
    *a6 = (id)[v14 copy];
LABEL_20:
  }
  return v13;
}

- (NSDictionary)_thresholdDict
{
  return self->__thresholdDict;
}

- (void)set_thresholdDict:(id)a3
{
}

- (NSError)_loadError
{
  return self->__loadError;
}

- (void)set_loadError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadError, 0);

  objc_storeStrong((id *)&self->__thresholdDict, 0);
}

+ (void)_createThresholdDictionaryWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)thresholdForLabel:(uint64_t)a3 classificationMode:(uint64_t)a4 modelVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)thresholdForLabel:(uint64_t)a3 classificationMode:(uint64_t)a4 modelVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)thresholdForLabel:(int)a1 classificationMode:(NSObject *)a2 modelVersion:error:.cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "Unsupported classification mode: %d", (uint8_t *)v2, 8u);
}

@end