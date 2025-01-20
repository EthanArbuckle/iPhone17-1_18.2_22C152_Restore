@interface PMLTrackerParsecAdapter
+ (BOOL)_writeDataForTransparency:(id)a3;
+ (id)wrappedMessage:(id)a3;
- (void)postMetricId:(unsigned int)a3 message:(id)a4;
@end

@implementation PMLTrackerParsecAdapter

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = +[PMLTrackerParsecAdapter wrappedMessage:v4];
  if ([(id)objc_opt_class() _writeDataForTransparency:v5])
  {
    v6 = [v5 data];
    v7 = (void *)[objc_alloc(MEMORY[0x263F67860]) initWithType:5 data:v6];
    v8 = PML_LogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v6 length];
      _os_log_debug_impl(&dword_2212A0000, v8, OS_LOG_TYPE_DEBUG, "Sending %@ (size: %tu) to Parsec.", (uint8_t *)&v12, 0x16u);
    }
    v9 = [MEMORY[0x263F36D68] sharedSession];
    [v9 sendCustomFeedback:v7];
  }
  else
  {
    v6 = PML_LogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_2212A0000, v6, OS_LOG_TYPE_ERROR, "Failed writing analytics log for data transparency. Skip upload", (uint8_t *)&v12, 2u);
    }
  }
}

+ (id)wrappedMessage:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setEvaluation:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 setLogRegWeights:v3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 setLogRegGradient:v3];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 setLinRegFeatureMatrix:v3];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v4 setLinRegObjectiveFeatures:v3];
          }
          else
          {
            v5 = PML_LogHandle();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v8 = v3;
              _os_log_error_impl(&dword_2212A0000, v5, OS_LOG_TYPE_ERROR, "Unsupported proto buf message: %@", buf, 0xCu);
            }

            [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Unsupported proto buf message: %@", v3 format];
          }
        }
      }
    }
  }

  return v4;
}

+ (BOOL)_writeDataForTransparency:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08900];
  id v4 = [a3 dictionaryRepresentation];
  id v12 = 0;
  v5 = [v3 dataWithJSONObject:v4 options:1 error:&v12];
  id v6 = v12;

  if (v5)
  {
    id v11 = v5;
    char v7 = OSAWriteLogForSubmission();
    id v8 = v11;
  }
  else
  {
    id v8 = PML_LogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v10;
      _os_log_error_impl(&dword_2212A0000, v8, OS_LOG_TYPE_ERROR, "Error serializing trystero envelope to JSON: %@", buf, 0xCu);
    }
    char v7 = 0;
  }

  return v7;
}

uint64_t __53__PMLTrackerParsecAdapter__writeDataForTransparency___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
}

@end