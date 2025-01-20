@interface PNTextEmbeddingService
+ (id)modelVersion;
+ (id)textEmbeddingSPIVersion;
- (PNTextEmbeddingService)init;
- (void)prewarmWithCompletionHandler:(id)a3;
- (void)requestTextEmbeddings:(id)a3 completionHandler:(id)a4;
@end

@implementation PNTextEmbeddingService

- (void).cxx_destruct
{
}

- (void)requestTextEmbeddings:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_alloc_init((Class)getMADTextEmbeddingRequestClass());
    if (v8)
    {
      if (!self->_madService)
      {
        v9 = [getMADServiceClass() service];
        madService = self->_madService;
        self->_madService = v9;
      }
      [v8 setComputeThreshold:1];
      v11 = self->_madService;
      v20[0] = v8;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __66__PNTextEmbeddingService_requestTextEmbeddings_completionHandler___block_invoke;
      v16[3] = &unk_26544EE98;
      id v17 = v8;
      id v18 = v6;
      id v13 = v7;
      id v19 = v13;
      LODWORD(v11) = [(MADService *)v11 performRequests:v12 text:v18 identifier:0 completionHandler:v16];

      if (v11 == -1)
      {
        v14 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"[PNTextEmbeddingService] Text embedding generation service request failed.");
        (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v14);
      }
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"[PNTextEmbeddingService] Failed to create MADTextEmbeddingRequest.");
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    (*((void (**)(id, id, void))v7 + 2))(v7, v8, 0);
  }
}

void __66__PNTextEmbeddingService_requestTextEmbeddings_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a2 != -1)
  {
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v10 = [*(id *)(a1 + 32) embeddingResults];
    if (!v10) {
      goto LABEL_3;
    }
    v11 = (void *)v10;
    v12 = [*(id *)(a1 + 32) embeddingResults];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [*(id *)(a1 + 40) count];

    if (v13 == v14)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      obuint64_t j = [*(id *)(a1 + 32) embeddingResults];
      uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v50)
      {
        uint64_t v49 = *(void *)v52;
        v48 = v15;
LABEL_9:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v51 + 1) + 8 * v16);
          id v18 = [v17 embedding];
          if (!v18) {
            break;
          }
          id v19 = v18;
          v20 = [v18 data];
          uint64_t v21 = [v19 count];
          uint64_t v22 = [v19 type];
          v23 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v21];
          if (v22 == 2)
          {
            uint64_t v35 = [v20 bytes];
            if (v21)
            {
              uint64_t v36 = v35;
              for (uint64_t i = 0; i != v21; ++i)
              {
                id v38 = objc_alloc(NSNumber);
                LODWORD(v39) = *(_DWORD *)(v36 + 4 * i);
                v40 = (void *)[v38 initWithFloat:v39];
                [v23 insertObject:v40 atIndex:i];
              }
            }
          }
          else
          {
            if (v22 != 1)
            {
              v46 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"[PNTextEmbeddingService] Found unknown element type in generation result: (%lu).", 0);
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

              goto LABEL_30;
            }
            uint64_t v24 = [v20 bytes];
            if (v21)
            {
              uint64_t v25 = v24;
              for (uint64_t j = 0; j != v21; ++j)
              {
                id v27 = objc_alloc(NSNumber);
                _H0 = *(_WORD *)(v25 + 2 * j);
                __asm { FCVT            S0, H0 }
                v34 = (void *)[v27 initWithFloat:_D0];
                [v23 insertObject:v34 atIndex:j];
              }
            }
          }
          if (objc_opt_respondsToSelector())
          {
            v41 = [v17 calibrationVersion];
          }
          else
          {
            v41 = 0;
          }
          v42 = [PNTextEmbeddingResultWithBiasScale alloc];
          v43 = [v17 bias];
          v44 = [v17 scale];
          v45 = [(PNTextEmbeddingResultWithBiasScale *)v42 initWithEmbedding:v23 calibrationVersion:v41 bias:v43 scale:v44];

          v15 = v48;
          [v48 addObject:v45];

          if (++v16 == v50)
          {
            uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
            if (v50) {
              goto LABEL_9;
            }
            goto LABEL_27;
          }
        }
        id v19 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"[PNTextEmbeddingService] Found empty text embedding generation result.");
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_30:

        goto LABEL_31;
      }
LABEL_27:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_31:
      id v6 = 0;
    }
    else
    {
LABEL_3:
      id v7 = (void *)MEMORY[0x263F087E8];
      id v8 = [v6 localizedDescription];
      v9 = objc_msgSend(v7, "pn_genericErrorWithUnderlyingError:localizedDescription:", v6, @"[PNTextEmbeddingService] Text embedding generation failed: %@", v8);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)prewarmWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_madService)
  {
    id v5 = [getMADServiceClass() service];
    madService = self->_madService;
    self->_madService = v5;
  }
  id v7 = objc_alloc_init((Class)getMADTextEmbeddingRequestClass());
  id v8 = v7;
  if (v7)
  {
    [v7 setComputeThreshold:1];
    v9 = self->_madService;
    v16[0] = v8;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__PNTextEmbeddingService_prewarmWithCompletionHandler___block_invoke;
    v14[3] = &unk_26544F5A0;
    id v11 = v4;
    id v15 = v11;
    LODWORD(v9) = [(MADService *)v9 prewarmTextRequests:v10 completionHandler:v14];

    if (v9 == -1)
    {
      v12 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"[PNTextEmbeddingService] Failed to prewarm embedding model.");
      (*((void (**)(id, void *))v11 + 2))(v11, v12);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "pn_genericErrorWithLocalizedDescription:", @"[PNTextEmbeddingService] Failed to create MADTextEmbeddingRequest for prewarming.");
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
  }
}

uint64_t __55__PNTextEmbeddingService_prewarmWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PNTextEmbeddingService)init
{
  v6.receiver = self;
  v6.super_class = (Class)PNTextEmbeddingService;
  v2 = [(PNTextEmbeddingService *)&v6 init];
  v3 = v2;
  if (v2)
  {
    madService = v2->_madService;
    v2->_madService = 0;
  }
  return v3;
}

+ (id)textEmbeddingSPIVersion
{
  return &unk_27076A3B0;
}

+ (id)modelVersion
{
  return (id)[MEMORY[0x263F5D958] currentUnifiedEmbeddingVersion];
}

@end