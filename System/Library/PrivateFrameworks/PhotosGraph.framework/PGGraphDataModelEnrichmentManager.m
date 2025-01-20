@interface PGGraphDataModelEnrichmentManager
+ (NSArray)lightWeightEnrichmentProcessors;
+ (id)_allEnrichmentProcessorsWithTailorOptions:(unint64_t)a3;
+ (id)backgroundEnrichmentProcessors;
+ (id)enrichmentProcessorsForDataModelEnrichmentContext:(unint64_t)a3;
+ (id)liveUpdateEnrichmentProcessors;
- (BOOL)_enrichDataModelWithGraphUpdateInventory:(id)a3 error:(id *)a4 progressBlock:(id)a5;
- (BOOL)enrichDataModelForHighlightUUIDs:(id)a3 withError:(id *)a4 progressBlock:(id)a5;
- (BOOL)enrichDataModelWithError:(id *)a3 progressBlock:(id)a4;
- (BOOL)forceRun;
- (CLSCurationContext)curationContext;
- (NSArray)enrichmentProcessors;
- (PGGraphDataModelEnrichmentManager)initWithManager:(id)a3 enrichmentContext:(unint64_t)a4;
- (PGGraphDataModelEnrichmentManager)initWithManager:(id)a3 enrichmentProcessors:(id)a4;
- (PGGraphDataModelEnrichmentManagerDelegate)delegate;
- (PGManager)manager;
- (unint64_t)enrichmentContext;
- (void)setDelegate:(id)a3;
- (void)setForceRun:(BOOL)a3;
@end

@implementation PGGraphDataModelEnrichmentManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_enrichmentProcessors, 0);
}

- (void)setForceRun:(BOOL)a3
{
  self->_forceRun = a3;
}

- (BOOL)forceRun
{
  return self->_forceRun;
}

- (void)setDelegate:(id)a3
{
}

- (PGGraphDataModelEnrichmentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PGGraphDataModelEnrichmentManagerDelegate *)WeakRetained;
}

- (PGManager)manager
{
  return self->_manager;
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (unint64_t)enrichmentContext
{
  return self->_enrichmentContext;
}

- (NSArray)enrichmentProcessors
{
  return self->_enrichmentProcessors;
}

- (BOOL)_enrichDataModelWithGraphUpdateInventory:(id)a3 error:(id *)a4 progressBlock:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v48 = a5;
  if ([(NSArray *)self->_enrichmentProcessors count])
  {
    if (!a4)
    {
      uint64_t v64 = 0;
      a4 = (id *)&v64;
    }
    v43 = a4;
    oslog = [(PGManager *)self->_manager enrichmentLoggingConnection];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v8 = self->_enrichmentProcessors;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v9)
    {
      char v10 = 0;
      uint64_t v11 = *(void *)v61;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v61 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

            goto LABEL_18;
          }
          if (v10) {
            char v10 = 1;
          }
          else {
            char v10 = [v13 requiresValidGraph];
          }
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v60 objects:v72 count:16];
        if (v9) {
          continue;
        }
        break;
      }

      if ((v10 & 1) == 0) {
        goto LABEL_24;
      }
LABEL_18:
      if (![(PGManager *)self->_manager isReadyWithError:v43])
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          manager = self->_manager;
          id v39 = *v43;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = manager;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v39;
          _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "DataModelEnrichment failed because DataModelEnrichmentManager has no graph - graph manager: %@, error: %@", buf, 0x16u);
        }
        char v46 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    else
    {

LABEL_24:
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "DataModelEnrichmentManager skip graph is ready check", buf, 2u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v71 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = oslog;
    os_signpost_id_t v16 = os_signpost_id_generate(v15);
    v17 = v15;
    v18 = v17;
    os_signpost_id_t spid = v16;
    unint64_t v42 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v65 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EnrichDataModelWithEnrichmentProcessors", "", v65, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v40 = mach_absolute_time();
    unint64_t v19 = [(NSArray *)self->_enrichmentProcessors count];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obj = self->_enrichmentProcessors;
    v20 = 0;
    uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (!v21)
    {
      char v46 = 1;
LABEL_48:

      id v31 = v20;
      id *v43 = v31;
      uint64_t v32 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v35 = v18;
      v36 = v35;
      if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)v65 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v36, OS_SIGNPOST_INTERVAL_END, spid, "EnrichDataModelWithEnrichmentProcessors", "", v65, 2u);
      }

      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 136315394;
        v66 = "EnrichDataModelWithEnrichmentProcessors";
        __int16 v67 = 2048;
        double v68 = (float)((float)((float)((float)(v32 - v40) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v65, 0x16u);
      }
      [WeakRetained enrichmentManager:self didFinishEnrichmentSuccessfully:v46 & 1];

      _Block_object_dispose(buf, 8);
      goto LABEL_54;
    }
    double v22 = 1.0 / (double)v19;
    uint64_t v49 = *(void *)v56;
    double v23 = 0.0;
    char v46 = 1;
LABEL_31:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v56 != v49) {
        objc_enumerationMutation(obj);
      }
      v25 = *(char **)(*((void *)&v55 + 1) + 8 * v24);
      v26 = (void *)MEMORY[0x1D25FED50]();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 138412290;
        v66 = v25;
        _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "DataModelEnrichment - enriching data model with processor: %@", v65, 0xCu);
      }
      if (!self->_forceRun
        && WeakRetained
        && ![WeakRetained enrichmentManager:self shouldRunProcessor:v25])
      {
        goto LABEL_42;
      }
      curationContext = self->_curationContext;
      v28 = self->_manager;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __98__PGGraphDataModelEnrichmentManager__enrichDataModelWithGraphUpdateInventory_error_progressBlock___block_invoke;
      v50[3] = &unk_1E68EEE68;
      double v53 = v23;
      double v54 = v22;
      id v51 = v48;
      v52 = buf;
      [v25 enrichDataModelWithManager:v28 curationContext:curationContext graphUpdateInventory:v47 progressBlock:v50];
      if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
        break;
      }
      uint64_t v29 = +[PGError errorForCode:-4];

      [WeakRetained enrichmentManager:self didCancelProcessor:v25];
      char v46 = 0;
      int v30 = 0;
      v20 = (void *)v29;
LABEL_43:
      if (!v30) {
        goto LABEL_48;
      }
      if (v21 == ++v24)
      {
        uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v69 count:16];
        if (!v21) {
          goto LABEL_48;
        }
        goto LABEL_31;
      }
    }
    [WeakRetained enrichmentManager:self didRunProcessor:v25];

LABEL_42:
    double v23 = v22 + v23;
    int v30 = 1;
    goto LABEL_43;
  }
  char v46 = 1;
LABEL_55:

  return v46 & 1;
}

uint64_t __98__PGGraphDataModelEnrichmentManager__enrichDataModelWithGraphUpdateInventory_error_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + *(double *)(a1 + 56) * a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a2;
  return result;
}

- (BOOL)enrichDataModelWithError:(id *)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [PGGraphUpdate alloc];
  v8 = [(PGManager *)self->_manager photoLibrary];
  uint64_t v9 = [(PGGraphUpdate *)v7 initWithPhotoLibrary:v8 updateType:4];

  [(PGGraphUpdate *)v9 setIsResumingFullAnalysis:1];
  LOBYTE(a3) = [(PGGraphDataModelEnrichmentManager *)self _enrichDataModelWithGraphUpdateInventory:v9 error:a3 progressBlock:v6];

  return (char)a3;
}

- (BOOL)enrichDataModelForHighlightUUIDs:(id)a3 withError:(id *)a4 progressBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  char v10 = [PGGraphUpdate alloc];
  uint64_t v11 = [(PGManager *)self->_manager photoLibrary];
  v12 = [(PGGraphUpdate *)v10 initWithPhotoLibrary:v11 updateType:0];

  [(PGGraphUpdate *)v12 setIsResumingFullAnalysis:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
        unint64_t v19 = [PGGraphHighlightChange alloc];
        v20 = -[PGGraphHighlightChange initWithHighlightUUID:updateTypes:](v19, "initWithHighlightUUID:updateTypes:", v18, 127, (void)v23);
        [(PGGraphUpdate *)v12 addChange:v20];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  BOOL v21 = [(PGGraphDataModelEnrichmentManager *)self _enrichDataModelWithGraphUpdateInventory:v12 error:a4 progressBlock:v9];
  return v21;
}

- (PGGraphDataModelEnrichmentManager)initWithManager:(id)a3 enrichmentProcessors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphDataModelEnrichmentManager;
  id v9 = [(PGGraphDataModelEnrichmentManager *)&v16 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enrichmentProcessors, a4);
    objc_storeStrong((id *)&v10->_manager, a3);
    v10->_enrichmentContext = 0;
    id v11 = objc_alloc(MEMORY[0x1E4F8E768]);
    v12 = [(PGManager *)v10->_manager photoLibrary];
    uint64_t v13 = [v11 initWithPhotoLibrary:v12];
    curationContext = v10->_curationContext;
    v10->_curationContext = (CLSCurationContext *)v13;

    v10->_forceRun = 0;
  }

  return v10;
}

- (PGGraphDataModelEnrichmentManager)initWithManager:(id)a3 enrichmentContext:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[PGGraphDataModelEnrichmentManager enrichmentProcessorsForDataModelEnrichmentContext:a4];
  id v8 = [(PGGraphDataModelEnrichmentManager *)self initWithManager:v6 enrichmentProcessors:v7];

  if (v8) {
    v8->_enrichmentContext = a4;
  }

  return v8;
}

+ (id)enrichmentProcessorsForDataModelEnrichmentContext:(unint64_t)a3
{
  if (a3 == 3)
  {
    v3 = [a1 liveUpdateEnrichmentProcessors];
  }
  else if (a3 == 1)
  {
    v3 = [a1 backgroundEnrichmentProcessors];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

+ (id)liveUpdateEnrichmentProcessors
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PGGraphPeopleSuggestionEnrichmentProcessor);
  v3 = -[PGGraphPhotosHighlightEnrichmentProcessor initWithHighlightTailorOptions:]([PGGraphPhotosHighlightEnrichmentProcessor alloc], "initWithHighlightTailorOptions:", 255, v2);
  v9[1] = v3;
  v4 = objc_alloc_init(PGGraphHighlightCollectionEnrichmentProcessor);
  v9[2] = v4;
  v5 = objc_alloc_init(PGGraphAssetRevGeocodeEnrichmentProcessor);
  v9[3] = v5;
  id v6 = objc_alloc_init(PGGraphSearchEnrichmentProcessor);
  v9[4] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (NSArray)lightWeightEnrichmentProcessors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [[PGGraphPhotosHighlightEnrichmentProcessor alloc] initWithHighlightTailorOptions:255];
  v7[0] = v2;
  v3 = objc_alloc_init(PGGraphHighlightCollectionEnrichmentProcessor);
  v7[1] = v3;
  v4 = objc_alloc_init(PGGraphAssetRevGeocodeEnrichmentProcessor);
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (id)_allEnrichmentProcessorsWithTailorOptions:(unint64_t)a3
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(PGGraphPeopleSuggestionEnrichmentProcessor);
  v5 = -[PGGraphPhotosHighlightEnrichmentProcessor initWithHighlightTailorOptions:]([PGGraphPhotosHighlightEnrichmentProcessor alloc], "initWithHighlightTailorOptions:", a3, v4);
  v13[1] = v5;
  id v6 = objc_alloc_init(PGGraphHighlightCollectionEnrichmentProcessor);
  v13[2] = v6;
  id v7 = objc_alloc_init(PGGraphSearchEnrichmentProcessor);
  v13[3] = v7;
  id v8 = objc_alloc_init(PGGraphAssetRevGeocodeEnrichmentProcessor);
  v13[4] = v8;
  id v9 = objc_alloc_init(PGGraphUserBehaviorEnrichmentProcessor);
  v13[5] = v9;
  char v10 = objc_alloc_init(PGGraphPortraitDonationEnrichmentProcessor);
  v13[6] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];

  return v11;
}

+ (id)backgroundEnrichmentProcessors
{
  return (id)[a1 _allEnrichmentProcessorsWithTailorOptions:255];
}

@end