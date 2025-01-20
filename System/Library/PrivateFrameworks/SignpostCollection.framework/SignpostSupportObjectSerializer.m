@interface SignpostSupportObjectSerializer
- (BOOL)_hasProcessingBlocks;
- (BOOL)redactPrivacySensitiveData;
- (BOOL)serializeLogArchiveWithPath:(id)a3 startDate:(id)a4 endDate:(id)a5 errorOut:(id *)a6;
- (BOOL)serializeNotificationsWithIntervalTimeoutInSeconds:(unint64_t)a3 errorOut:(id *)a4;
- (NSMutableArray)outstandingLogMessage;
- (NSMutableArray)outstandingSignpostObjects;
- (SignpostSerializationFilterConfiguration)filterConfiguration;
- (SignpostSupportObjectExtractor)extractor;
- (SignpostSupportObjectSerializer)init;
- (id)_dataArrayForSignpostSupportObjectArray:(id)a3 errorOut:(id *)a4;
- (id)_sanityCheckParameters;
- (id)serializedLogMessageBlock;
- (id)serializedSignpostEventBlock;
- (unint64_t)maxBatchSize;
- (unint64_t)maxBytesSize;
- (void)setExtractor:(id)a3;
- (void)setFilterConfiguration:(id)a3;
- (void)setMaxBatchSize:(unint64_t)a3;
- (void)setMaxBytesSize:(unint64_t)a3;
- (void)setOutstandingLogMessage:(id)a3;
- (void)setOutstandingSignpostObjects:(id)a3;
- (void)setRedactPrivacySensitiveData:(BOOL)a3;
- (void)setSerializedLogMessageBlock:(id)a3;
- (void)setSerializedSignpostEventBlock:(id)a3;
@end

@implementation SignpostSupportObjectSerializer

- (id)_dataArrayForSignpostSupportObjectArray:(id)a3 errorOut:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SignpostSupportObjectSerializer *)self redactPrivacySensitiveData];
  v23[1] = 0;
  v7 = _SignpostSupportSerializationDataFromObjectArray();
  id v8 = 0;
  id v9 = v8;
  if (v7)
  {
    unint64_t v10 = [v7 length];
    if (v10 <= [(SignpostSupportObjectSerializer *)self maxBytesSize])
    {
      v24[0] = v7;
      id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    }
    else
    {
      v11 = [MEMORY[0x263EFF980] array];
      unint64_t v12 = (unint64_t)[v6 count] >> 1;
      v13 = objc_msgSend(v6, "subarrayWithRange:", 0, v12);
      if (![v13 count])
      {

        v13 = 0;
      }
      v23[0] = v9;
      v14 = [(SignpostSupportObjectSerializer *)self _dataArrayForSignpostSupportObjectArray:v13 errorOut:v23];
      id v15 = v23[0];

      if (v14)
      {
        [v11 addObjectsFromArray:v14];
        v16 = objc_msgSend(v6, "subarrayWithRange:", v12, objc_msgSend(v6, "count") - v12);
        id v22 = v15;
        [(SignpostSupportObjectSerializer *)self _dataArrayForSignpostSupportObjectArray:v16 errorOut:&v22];
        v18 = v17 = v11;
        id v9 = v22;

        if (v18)
        {
          [v17 addObjectsFromArray:v18];
          v19 = v17;
          id v20 = v17;
        }
        else
        {
          v19 = v17;
          id v20 = 0;
          if (a4) {
            *a4 = (id)[v9 copy];
          }
        }

        v11 = v19;
      }
      else
      {
        id v20 = 0;
        if (a4) {
          *a4 = (id)[v15 copy];
        }
        id v9 = v15;
      }
    }
  }
  else
  {
    id v20 = 0;
    if (a4) {
      *a4 = (id)[v8 copy];
    }
  }

  return v20;
}

- (SignpostSupportObjectSerializer)init
{
  v9.receiver = self;
  v9.super_class = (Class)SignpostSupportObjectSerializer;
  v2 = [(SignpostSupportObjectSerializer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_maxBatchSize = xmmword_21DE7B0C0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    outstandingLogMessage = v3->_outstandingLogMessage;
    v3->_outstandingLogMessage = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    outstandingSignpostObjects = v3->_outstandingSignpostObjects;
    v3->_outstandingSignpostObjects = (NSMutableArray *)v6;
  }
  return v3;
}

- (BOOL)_hasProcessingBlocks
{
  v3 = [(SignpostSupportObjectSerializer *)self serializedSignpostEventBlock];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SignpostSupportObjectSerializer *)self serializedLogMessageBlock];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)_sanityCheckParameters
{
  if ([(SignpostSupportObjectSerializer *)self maxBatchSize])
  {
    if ([(SignpostSupportObjectSerializer *)self maxBytesSize])
    {
      if ([(SignpostSupportObjectSerializer *)self _hasProcessingBlocks])
      {
        v3 = 0;
        goto LABEL_9;
      }
      BOOL v4 = @"No processing blocks specified";
    }
    else
    {
      BOOL v4 = @"Invalid maxBytesSize of 0";
    }
  }
  else
  {
    BOOL v4 = @"Invalid maxBatchSize of 0";
  }
  v3 = [MEMORY[0x263F087E8] errorWithCode:2 description:v4];
LABEL_9:
  return v3;
}

- (BOOL)serializeLogArchiveWithPath:(id)a3 startDate:(id)a4 endDate:(id)a5 errorOut:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(SignpostSupportObjectSerializer *)self _sanityCheckParameters];
  v14 = v13;
  if (!v13)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F6C5A8]);
    [v16 setDisableGeneratorProcessing:1];
    objc_initWeak(location, self);
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__2;
    v61 = __Block_byref_object_dispose__2;
    id v62 = 0;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke;
    v55[3] = &unk_264487FE0;
    objc_copyWeak(&v56, location);
    v55[4] = &v57;
    v38 = (void *)MEMORY[0x223C1AFE0](v55);
    v17 = [(SignpostSupportObjectSerializer *)self serializedSignpostEventBlock];

    if (v17)
    {
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_2;
      v52[3] = &unk_264488008;
      objc_copyWeak(&v54, location);
      id v18 = v38;
      id v53 = v18;
      [v16 setEndEventProcessingBlock:v52];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_3;
      v49[3] = &unk_264488008;
      objc_copyWeak(&v51, location);
      id v50 = v18;
      v19 = (void *)MEMORY[0x223C1AFE0](v49);
      [v16 setBeginEventProcessingBlock:v19];
      [v16 setEmitEventProcessingBlock:v19];

      objc_destroyWeak(&v51);
      objc_destroyWeak(&v54);
    }
    id v20 = [(SignpostSupportObjectSerializer *)self serializedLogMessageBlock];

    if (v20)
    {
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_4;
      v46[3] = &unk_264488030;
      objc_copyWeak(&v48, location);
      id v47 = v38;
      [v16 setLogMessageProcessingBlock:v46];

      objc_destroyWeak(&v48);
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_5;
    v44[3] = &unk_264488058;
    objc_copyWeak(&v45, location);
    v44[4] = &v57;
    v21 = (void *)MEMORY[0x223C1AFE0](v44);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_6;
    v40[3] = &unk_264488080;
    v42 = &v57;
    objc_copyWeak(&v43, location);
    id v37 = v21;
    id v41 = v37;
    [v16 setProcessingCompletionBlock:v40];
    id v22 = [(SignpostSupportObjectSerializer *)self filterConfiguration];
    v23 = [v22 subsystemCategoryFilter];
    [v16 setSubsystemCategoryFilter:v23];

    v24 = [(SignpostSupportObjectSerializer *)self filterConfiguration];
    v25 = [v24 uniquePidFilter];
    [v16 setUniquePidFilter:v25];

    v26 = [(SignpostSupportObjectSerializer *)self filterConfiguration];
    v27 = [v26 pidFilter];
    [v16 setPidFilter:v27];

    v28 = [(SignpostSupportObjectSerializer *)self filterConfiguration];
    v29 = [v28 processNameFilter];
    [v16 setProcessNameFilter:v29];

    uint64_t v30 = [v16 subsystemCategoryFilter];
    [(id)v30 _fixupToSupportFramerateCalculation];

    id v39 = 0;
    LOBYTE(v30) = [v16 processLogArchiveWithPath:v10 startDate:v11 endDate:v12 errorOut:&v39];
    id v31 = v39;
    v32 = [MEMORY[0x263EFF980] array];
    [(SignpostSupportObjectSerializer *)self setOutstandingSignpostObjects:v32];

    v33 = [MEMORY[0x263EFF980] array];
    [(SignpostSupportObjectSerializer *)self setOutstandingLogMessage:v33];

    if (v30)
    {
      v34 = (void *)v58[5];
      if (!v34)
      {
        BOOL v15 = 1;
        goto LABEL_18;
      }
      if (a6)
      {
        v35 = (void *)[v34 copy];
LABEL_15:
        BOOL v15 = 0;
        *a6 = v35;
LABEL_18:

        objc_destroyWeak(&v43);
        objc_destroyWeak(&v45);

        objc_destroyWeak(&v56);
        _Block_object_dispose(&v57, 8);

        objc_destroyWeak(location);
        goto LABEL_19;
      }
    }
    else if (a6)
    {
      v35 = (void *)[v31 copy];
      goto LABEL_15;
    }
    BOOL v15 = 0;
    goto LABEL_18;
  }
  BOOL v15 = 0;
  if (a6) {
    *a6 = v13;
  }
LABEL_19:

  return v15;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  [v7 addObject:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v10 = [v7 count];
  if (v10 >= [WeakRetained maxBatchSize])
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v12 + 40);
    v13 = [WeakRetained _dataArrayForSignpostSupportObjectArray:v7 errorOut:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            if (!v8[2](v8, *(void *)(*((void *)&v20 + 1) + 8 * v18)))
            {

              goto LABEL_14;
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      objc_msgSend(v7, "removeAllObjects", (void)v20);
      uint64_t v11 = 1;
    }
    else
    {
LABEL_14:
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSyntheticIntervalEvent])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [WeakRetained outstandingSignpostObjects];
    id v8 = [WeakRetained serializedSignpostEventBlock];
    uint64_t v4 = (*(uint64_t (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v3, v7, v8);
  }
  return v4;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [WeakRetained outstandingSignpostObjects];
  id v8 = [WeakRetained serializedSignpostEventBlock];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v4, v7, v8);

  return v9;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [WeakRetained outstandingLogMessage];
  id v8 = [WeakRetained serializedLogMessageBlock];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v4, v7, v8);

  return v9;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  if (v5 && [v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v8 + 40);
    uint64_t v9 = [WeakRetained _dataArrayForSignpostSupportObjectArray:v5 errorOut:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v10 = 0;
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        while (2)
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            if (!v6[2](v6, *(void *)(*((void *)&v17 + 1) + 8 * v15)))
            {
              uint64_t v10 = 0;
              goto LABEL_16;
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      uint64_t v10 = 1;
LABEL_16:
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v3 = [WeakRetained serializedLogMessageBlock];

    if (!v3) {
      goto LABEL_12;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [WeakRetained outstandingLogMessage];
    uint64_t v6 = [WeakRetained serializedLogMessageBlock];
    LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

    if (v4)
    {
LABEL_12:
      id v7 = [WeakRetained serializedSignpostEventBlock];

      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [WeakRetained outstandingSignpostObjects];
        uint64_t v10 = [WeakRetained serializedSignpostEventBlock];
        (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)serializeNotificationsWithIntervalTimeoutInSeconds:(unint64_t)a3 errorOut:(id *)a4
{
  return 0;
}

- (unint64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (void)setMaxBatchSize:(unint64_t)a3
{
  self->_maxBatchSize = a3;
}

- (unint64_t)maxBytesSize
{
  return self->_maxBytesSize;
}

- (void)setMaxBytesSize:(unint64_t)a3
{
  self->_maxBytesSize = a3;
}

- (id)serializedSignpostEventBlock
{
  return self->_serializedSignpostEventBlock;
}

- (void)setSerializedSignpostEventBlock:(id)a3
{
}

- (id)serializedLogMessageBlock
{
  return self->_serializedLogMessageBlock;
}

- (void)setSerializedLogMessageBlock:(id)a3
{
}

- (BOOL)redactPrivacySensitiveData
{
  return self->_redactPrivacySensitiveData;
}

- (void)setRedactPrivacySensitiveData:(BOOL)a3
{
  self->_redactPrivacySensitiveData = a3;
}

- (SignpostSerializationFilterConfiguration)filterConfiguration
{
  return self->_filterConfiguration;
}

- (void)setFilterConfiguration:(id)a3
{
}

- (NSMutableArray)outstandingSignpostObjects
{
  return self->_outstandingSignpostObjects;
}

- (void)setOutstandingSignpostObjects:(id)a3
{
}

- (NSMutableArray)outstandingLogMessage
{
  return self->_outstandingLogMessage;
}

- (void)setOutstandingLogMessage:(id)a3
{
}

- (SignpostSupportObjectExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_outstandingLogMessage, 0);
  objc_storeStrong((id *)&self->_outstandingSignpostObjects, 0);
  objc_storeStrong((id *)&self->_filterConfiguration, 0);
  objc_storeStrong(&self->_serializedLogMessageBlock, 0);
  objc_storeStrong(&self->_serializedSignpostEventBlock, 0);
}

@end