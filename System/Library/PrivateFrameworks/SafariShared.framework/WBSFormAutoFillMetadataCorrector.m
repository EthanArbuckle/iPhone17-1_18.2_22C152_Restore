@interface WBSFormAutoFillMetadataCorrector
- (BOOL)hasAttemptedToCorrectMetadata:(id)a3;
- (NSString)domain;
- (WBSFormAutoFillMetadataCorrector)init;
- (WBSFormAutoFillMetadataCorrector)initWithDomain:(id)a3;
- (id)bestAvailableMetadataFromControlMetadata:(id)a3;
- (id)bestAvailableMetadataFromMetadata:(id)a3;
- (void)_commonInitWithDomain:(id)a3 correctionsStore:(id)a4;
- (void)enqueueCorrectionsRequestForFormMetadata:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSFormAutoFillMetadataCorrector

- (WBSFormAutoFillMetadataCorrector)initWithDomain:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSFormAutoFillMetadataCorrector;
  v5 = [(WBSFormAutoFillMetadataCorrector *)&v9 init];
  if (v5)
  {
    v6 = +[WBSFormAutoFillCorrectionsSQLiteStore standardStore];
    [(WBSFormAutoFillMetadataCorrector *)v5 _commonInitWithDomain:v4 correctionsStore:v6];

    v7 = v5;
  }

  return v5;
}

- (WBSFormAutoFillMetadataCorrector)init
{
  return [(WBSFormAutoFillMetadataCorrector *)self initWithDomain:0];
}

- (void)_commonInitWithDomain:(id)a3 correctionsStore:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    v7 = (NSString *)[v11 copy];
    domain = self->_domain;
    self->_domain = v7;
  }
  else
  {
    domain = self->_domain;
    self->_domain = (NSString *)&stru_1EFBE3CF8;
  }

  objc_storeStrong((id *)&self->_correctionsStore, a4);
  objc_super v9 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
  classificationToCorrectionsTransformer = self->_classificationToCorrectionsTransformer;
  self->_classificationToCorrectionsTransformer = v9;
}

- (void)enqueueCorrectionsRequestForFormMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v29 = a4;
  objc_initWeak(&location, self);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v24 = [v25 controls];
  v27 = (void *)[v24 count];
  id v6 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[WBSFormAutoFillMetadataCorrector enqueueCorrectionsRequestForFormMetadata:completionHandler:]((uint64_t)v27, v6);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  id obj = v24;
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    char v28 = 0;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v12 = +[WBSFormFieldFingerprinter fingerprintForControlMetadata:v11];
        if (v12)
        {
          v13 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v18 = [v11 fieldName];
            *(_DWORD *)buf = 134218498;
            uint64_t v47 = v8 + i + 1;
            __int16 v48 = 2112;
            v49 = v18;
            __int16 v50 = 2112;
            v51 = v12;
            _os_log_debug_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_DEBUG, "Requesting asynchronous correction of control metadata at index %lu (name = '%@', fingerprint = '%@')", buf, 0x20u);
          }
          correctionsStore = self->_correctionsStore;
          domain = self->_domain;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke;
          v32[3] = &unk_1E5C9B1E8;
          objc_copyWeak(v37, &location);
          id v16 = v12;
          id v33 = v16;
          v35 = v42;
          id v34 = v29;
          v36 = v44;
          v37[1] = v27;
          [(WBSFormAutoFillCorrectionsStore *)correctionsStore getClassificationForFieldWithFingerprint:v16 onDomain:domain completionHandler:v32];

          objc_destroyWeak(v37);
          char v28 = 1;
        }
        else
        {
          v17 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v47 = v8 + i + 1;
            _os_log_debug_impl(&dword_1A6B5F000, v17, OS_LOG_TYPE_DEBUG, "Skipping correction of control metadata at index %lu due to failure to generate fingerprint", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
      v8 += i;
    }
    while (v7);
  }
  else
  {
    char v28 = 0;
  }

  correctedFormMetadataID = self->_correctedFormMetadataID;
  if (!correctedFormMetadataID)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    v22 = self->_correctedFormMetadataID;
    p_correctedFormMetadataID = &self->_correctedFormMetadataID;
    *p_correctedFormMetadataID = (NSMutableSet *)v20;

    correctedFormMetadataID = *p_correctedFormMetadataID;
  }
  v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v25, "uniqueID"));
  [(NSMutableSet *)correctedFormMetadataID addObject:v23];

  if (!((v29 == 0) | v28 & 1))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_3;
    block[3] = &unk_1E5C8D5F0;
    id v31 = v29;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  objc_destroyWeak(&location);
}

void __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C9B1C0;
  objc_copyWeak(v13, (id *)(a1 + 64));
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v7;
  long long v11 = v7;
  v5 = *(void **)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 56);
  v13[1] = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v13);
}

void __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v2 = [WeakRetained[3] transformedValue:*(void *)(a1 + 32)];
    id v3 = WeakRetained[2];
    if (v2)
    {
      if (!v3)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1C998]);
        id v5 = WeakRetained[2];
        WeakRetained[2] = v4;

        id v3 = WeakRetained[2];
      }
      [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
    }
    else
    {
      [v3 removeObjectForKey:*(void *)(a1 + 40)];
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v2) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = *(unsigned char *)(v6 + 24) == 0;
    }
    char v8 = !v7;
    *(unsigned char *)(v6 + 24) = v8;
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void *)(v9 + 24) + 1;
    *(void *)(v9 + 24) = v10;
    if (v10 == *(void *)(a1 + 80)) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasAttemptedToCorrectMetadata:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  correctedFormMetadataID = self->_correctedFormMetadataID;
  if (correctedFormMetadataID)
  {
    BOOL v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "uniqueID"));
    LOBYTE(correctedFormMetadataID) = [(NSMutableSet *)correctedFormMetadataID containsObject:v7];
  }
  return (char)correctedFormMetadataID;
}

- (id)bestAvailableMetadataFromMetadata:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fingerprintsToCorrections)
  {
    uint64_t v6 = [v4 controls];
    uint64_t v7 = [v6 count];
    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      long long v11 = [(WBSFormAutoFillMetadataCorrector *)self bestAvailableMetadataFromControlMetadata:v10];
      uint64_t v12 = v11;
      if (v11 && ([v11 isEqual:v10] & 1) == 0)
      {
        if (!v9) {
          uint64_t v9 = (void *)[v6 mutableCopy];
        }
        [v9 setObject:v12 atIndexedSubscript:v8];
      }

      ++v8;
    }
    while (v7 != v8);
    if (v9)
    {
      id v13 = [v5 formMetadataByReplacingControlsWith:v9];
    }
    else
    {
LABEL_12:
      id v13 = v5;
      uint64_t v9 = 0;
    }

    id v5 = v13;
  }
  return v5;
}

- (id)bestAvailableMetadataFromControlMetadata:(id)a3
{
  id v4 = (WBSFormControlMetadata *)a3;
  if (v4)
  {
    id v5 = +[WBSFormFieldFingerprinter fingerprintForControlMetadata:v4];
    if (v5)
    {
      uint64_t v6 = [(NSCache *)self->_fingerprintsToCorrections objectForKey:v5];
      if ([v6 count])
      {
        uint64_t v7 = [(WBSFormControlMetadata *)v4 dictionaryRepresentation];
        uint64_t v8 = (void *)[v7 mutableCopy];

        [v8 addEntriesFromDictionary:v6];
        uint64_t v9 = [[WBSFormControlMetadata alloc] initWithDictionary:v8];

        id v4 = v9;
      }
    }
  }
  return v4;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_correctedFormMetadataID, 0);
  objc_storeStrong((id *)&self->_classificationToCorrectionsTransformer, 0);
  objc_storeStrong((id *)&self->_fingerprintsToCorrections, 0);
  objc_storeStrong((id *)&self->_correctionsStore, 0);
}

- (void)enqueueCorrectionsRequestForFormMetadata:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Enqueuing correction request for form metadata containing %lu controls", (uint8_t *)&v2, 0xCu);
}

@end