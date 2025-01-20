@interface PXAnalyticsFeatureUsageCountDestination
- (PHPhotoLibrary)photoLibrary;
- (void)processEvent:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PXAnalyticsFeatureUsageCountDestination

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)processEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXAnalyticsFeatureUsageCountDestination *)self photoLibrary];

  if (v5)
  {
    v6 = [v4 name];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F56438]];

    if (v7)
    {
      v8 = (void *)[v4 copyRawPayload];
      if ([v8 count])
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v19);
              [v9 setObject:v16 forKeyedSubscript:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v12);
        }

        v17 = [(PXAnalyticsFeatureUsageCountDestination *)self photoLibrary];
        v18 = [v17 photoAnalysisClient];
        [v18 recordFeatureUsageFromCounts:v9 reply:&__block_literal_global_131742];
      }
    }
  }
}

void __56__PXAnalyticsFeatureUsageCountDestination_processEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLUIGetLog();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      int v7 = "PXAnalyticsFeatureUsageCountDestination - recordFeatureUsageCounts completed";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    int v7 = "PXAnalyticsFeatureUsageCountDestination - recordFeatureUsageCounts failed. Error: %@";
    v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (void)setPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

    if (WeakRetained) {
      PXAssertGetLog();
    }
  }
  objc_storeWeak((id *)&self->_photoLibrary, v4);
}

@end