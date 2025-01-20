@interface PHACoreDuetDatasetStorage
- (PHACoreDuetDatasetStorage)init;
- (PHACoreDuetDatasetStorage)initWithKnowledgeStore:(id)a3;
- (_DKKnowledgeSaving)knowledgeStore;
- (id)_getEventStreamForDatasetName:(id)a3;
- (id)samplesForDataset:(id)a3 subset:(id)a4;
- (void)addSample:(id)a3 toDataset:(id)a4;
@end

@implementation PHACoreDuetDatasetStorage

- (void).cxx_destruct
{
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (id)_getEventStreamForDatasetName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5B4E8];
  id v4 = a3;
  v5 = [v3 typeForName:@"PFLDatasetSampleSchemaVersion"];
  v6 = [MEMORY[0x1E4F5B520] eventStreamWithName:v4 valueType:v5];

  return v6;
}

- (PHACoreDuetDatasetStorage)initWithKnowledgeStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHACoreDuetDatasetStorage;
  v6 = [(PHACoreDuetDatasetStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
  }

  return v7;
}

- (id)samplesForDataset:(id)a3 subset:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F5B518]);
  v44 = v6;
  objc_super v9 = [(PHACoreDuetDatasetStorage *)self _getEventStreamForDatasetName:v6];
  v57[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  [v8 setEventStreams:v10];

  v11 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:1];
  v56 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  [v8 setSortDescriptors:v12];

  if (v7)
  {
    v13 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithMetadataKey:@"_DKPhotosMetadataKey.subset" andStringValue:v7];
    [v8 setPredicate:v13];
  }
  [v8 setLimit:250];
  v14 = [(PHACoreDuetDatasetStorage *)self knowledgeStore];
  id v50 = 0;
  v15 = [v14 executeQuery:v8 error:&v50];
  id v16 = v50;
  v17 = v16;
  if (v15)
  {
    id v40 = v16;
    v41 = v14;
    id v42 = v8;
    id v43 = v7;
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v39 = v15;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (!v19) {
      goto LABEL_24;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v47;
    while (1)
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v46 + 1) + 8 * v22);
        v24 = [v23 metadata];
        v25 = [v24 objectForKey:@"_DKPhotosMetadataKey.identifier"];

        v26 = [v23 metadata];
        v27 = [v26 objectForKey:@"_DKPhotosMetadataKey.subset"];

        if (v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v28 = [PHACoreDuetDatasetSample alloc];
            v29 = [v23 startDate];
            v30 = [(PHACoreDuetDatasetSample *)v28 initWithIdentifier:v25 andDate:v29 forSubset:v27];

            [v45 addObject:v30];
            goto LABEL_19;
          }
          if (__PXLog_genericOnceToken != -1) {
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_27);
          }
          uint64_t v35 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v53 = v44;
            __int16 v54 = 2112;
            v55 = v25;
            v32 = v35;
            v33 = "Failed to retrieve item from dataset %@. Sample identifier is not a string: %@.";
            uint32_t v34 = 22;
            goto LABEL_22;
          }
        }
        else
        {
          if (__PXLog_genericOnceToken != -1) {
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_23);
          }
          uint64_t v31 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v44;
            v32 = v31;
            v33 = "Failed to retrieve item from dataset %@. Sample identifier is nil.";
            uint32_t v34 = 12;
LABEL_22:
            _os_log_error_impl(&dword_1D21F2000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
          }
        }
LABEL_19:

        ++v22;
      }
      while (v20 != v22);
      uint64_t v36 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
      uint64_t v20 = v36;
      if (!v36)
      {
LABEL_24:

        id v8 = v42;
        id v7 = v43;
        v17 = v40;
        v14 = v41;
        v15 = v39;
        goto LABEL_30;
      }
    }
  }
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_19);
  }
  v37 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v53 = v44;
    __int16 v54 = 2112;
    v55 = v17;
    _os_log_error_impl(&dword_1D21F2000, v37, OS_LOG_TYPE_ERROR, "Failed to query items from dataset %@. Error: %@.", buf, 0x16u);
  }
  id v45 = (id)MEMORY[0x1E4F1CBF0];
LABEL_30:

  return v45;
}

uint64_t __54__PHACoreDuetDatasetStorage_samplesForDataset_subset___block_invoke_25()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__PHACoreDuetDatasetStorage_samplesForDataset_subset___block_invoke_21()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__PHACoreDuetDatasetStorage_samplesForDataset_subset___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)addSample:(id)a3 toDataset:(id)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PHACoreDuetDatasetStorage *)self _getEventStreamForDatasetName:v6];
  objc_super v9 = (void *)MEMORY[0x1E4F5B548];
  v10 = [MEMORY[0x1E4F5B4E8] typeForName:@"PFLDatasetSampleSchemaVersion"];
  v11 = [v9 identifierWithString:@"PFLDatasetSample-v1.0" type:v10];

  v31[0] = @"_DKPhotosMetadataKey.identifier";
  v12 = [v7 identifier];
  v31[1] = @"_DKPhotosMetadataKey.subset";
  v32[0] = v12;
  v13 = [v7 subset];
  v32[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

  v15 = (void *)MEMORY[0x1E4F5B510];
  id v16 = [v7 date];
  uint64_t v17 = [v7 date];

  id v18 = [v15 eventWithStream:v8 startDate:v16 endDate:v17 value:v11 metadata:v14];

  uint64_t v19 = [(PHACoreDuetDatasetStorage *)self knowledgeStore];
  v30 = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  id v23 = 0;
  LOBYTE(v17) = [v19 saveObjects:v20 error:&v23];
  id v21 = v23;

  if ((v17 & 1) == 0)
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_1235);
    }
    uint64_t v22 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v6;
      __int16 v26 = 1024;
      int v27 = 0;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Failed to save sample to dataset %@. OK Value: %d, error: %@.", buf, 0x1Cu);
    }
  }
}

uint64_t __49__PHACoreDuetDatasetStorage_addSample_toDataset___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (PHACoreDuetDatasetStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHACoreDuetDatasetStorage;
  v2 = [(PHACoreDuetDatasetStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5B560] knowledgeStore];
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeSaving *)v3;
  }
  return v2;
}

@end