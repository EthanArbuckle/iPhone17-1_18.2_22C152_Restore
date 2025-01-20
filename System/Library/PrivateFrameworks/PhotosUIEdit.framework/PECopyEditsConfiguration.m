@interface PECopyEditsConfiguration
- (NSArray)settings;
- (PECopyEditsConfiguration)initWithCompositionController:(id)a3 asset:(id)a4;
- (PICompositionController)compositionController;
- (id)result;
@end

@implementation PECopyEditsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (NSArray)settings
{
  return self->_settings;
}

- (id)result
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = [PECopyEditsConfigurationResult alloc];
  v4 = [(PECopyEditsConfiguration *)self compositionController];
  v5 = [(PECopyEditsConfigurationResult *)v3 initWithCompositionController:v4];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v23 = self;
  id obj = [(PECopyEditsConfiguration *)self settings];
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        unint64_t v11 = [v10 identifier];
        if (v11 <= 9)
        {
          if (v11 == 6)
          {
            -[PECopyEditsConfigurationResult setSmartCopyEnabled:](v5, "setSmartCopyEnabled:", [v10 enabled]);
          }
          else if (([v10 enabled] & 1) == 0)
          {
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            v12 = [v10 compositionKeys];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v26;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v26 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
                  v18 = [(PECopyEditsConfigurationResult *)v5 compositionController];
                  [v18 removeAdjustmentWithKey:v17];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v14);
            }
          }
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }

  v20 = [(PECopyEditsConfiguration *)v23 settings];
  v21 = +[PEAnalyticsUtility analyticPayloadForCopyEditsSettings:v20];
  [(PECopyEditsConfigurationResult *)v5 setAnalyticsPayload:v21];

  return v5;
}

- (PECopyEditsConfiguration)initWithCompositionController:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PECopyEditsConfiguration;
  uint64_t v9 = [(PECopyEditsConfiguration *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_compositionController, a3);
    unint64_t v11 = +[PECopyEditsSetting allSettings];
    id v15 = v7;
    id v16 = v8;
    uint64_t v12 = PFFilter();
    settings = v10->_settings;
    v10->_settings = (NSArray *)v12;
  }
  return v10;
}

uint64_t __64__PECopyEditsConfiguration_initWithCompositionController_asset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isApplicableToCompositionController:*(void *)(a1 + 32) asset:*(void *)(a1 + 40)];
}

@end