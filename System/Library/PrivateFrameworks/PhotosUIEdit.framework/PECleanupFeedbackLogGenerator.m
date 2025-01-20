@interface PECleanupFeedbackLogGenerator
+ (id)logForCompositionController:(id)a3;
@end

@implementation PECleanupFeedbackLogGenerator

+ (id)logForCompositionController:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  v5 = [v3 inpaintAdjustmentController];
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "appendFormat:", @"Cleanup Operations: %d", objc_msgSend(v5, "operationCount"));
    v7 = [v6 adjustment];
    v8 = [v7 objectForKeyedSubscript:@"operations"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = v6;
        id v31 = v3;
        v32 = v4;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v29 = v8;
        id obj = v8;
        uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)v38;
          do
          {
            uint64_t v15 = 0;
            uint64_t v33 = v10;
            do
            {
              if (*(void *)v38 != v14) {
                objc_enumerationMutation(obj);
              }
              v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = (void *)[objc_alloc(MEMORY[0x263F5D5E8]) initWithDictionary:v16];
                v18 = v17;
                if (v17)
                {
                  int v19 = v13;
                  int v20 = v11;
                  uint64_t v21 = v12;
                  int v22 = [v17 isTapSelect];
                  int v23 = [v18 isTargetPoints];
                  int v24 = [v18 isFilledBrushStroke];
                  if ([v18 mode] == 2) {
                    uint64_t v25 = (v36 + 1);
                  }
                  else {
                    uint64_t v25 = v36;
                  }
                  uint64_t v36 = v25;
                  v26 = [v16 objectForKeyedSubscript:@"mode"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    char v27 = [v26 integerValue];
                  }
                  else {
                    char v27 = 0;
                  }
                  uint64_t v35 = (v35 + v22);
                  uint64_t v11 = (v20 + v23);
                  uint64_t v13 = (v19 + v24);
                  uint64_t v12 = (v27 & 1) + v21;

                  uint64_t v10 = v33;
                }
              }
              ++v15;
            }
            while (v10 != v15);
            uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v13 = 0;
        }

        v4 = v32;
        objc_msgSend(v32, "appendFormat:", @"\nTaps: %d", v35);
        objc_msgSend(v32, "appendFormat:", @"\nLassoes: %d", v13);
        objc_msgSend(v32, "appendFormat:", @"\nBrushstrokes: %d", v36);
        objc_msgSend(v32, "appendFormat:", @"\nOn Demand: %d", v11);
        objc_msgSend(v32, "appendFormat:", @"\nRedactions: %d", v12);
        v6 = v30;
        id v3 = v31;
        v8 = v29;
      }
    }
  }
  return v4;
}

@end