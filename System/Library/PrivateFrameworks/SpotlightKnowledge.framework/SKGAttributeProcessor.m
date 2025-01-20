@interface SKGAttributeProcessor
+ (id)sharedImporterProcessor;
+ (id)sharedProcessor;
- (SKGAttributeProcessor)init;
- (id)addUpdaterAttributesForMDPlistRecord:(id *)a3 bundleID:(id)a4;
- (id)eventsJournalsStats;
- (id)initForImporter;
- (id)processorAttributesForRecord:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 isUpdate:(BOOL)a6;
- (void)checkProcessingReportForBundleIdentifier:(id)a3 flags:(unint64_t)a4 timeout:(unint64_t)a5 completion:(id)a6;
- (void)collectDiagnostics:(id)a3 completion:(id)a4;
- (void)getDocumentUnderstandingProgressReport:(id)a3;
- (void)getEmbeddingProgressReport:(id)a3;
- (void)getSuggestedEventsProgressReport:(id)a3;
- (void)processRecord:(id)a3 referenceIdentifier:(id)a4 protectionClass:(id)a5 processorFlags:(unint64_t)a6 completionHandler:(id)a7;
- (void)setTurboMode:(BOOL)a3;
- (void)updateCheckedInClientWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SKGAttributeProcessor

uint64_t __40__SKGAttributeProcessor_sharedProcessor__block_invoke()
{
  sharedProcessor_sSharedProcessor = objc_alloc_init(SKGAttributeProcessor);
  return MEMORY[0x270F9A758]();
}

- (SKGAttributeProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKGAttributeProcessor;
  v2 = [(SKGAttributeProcessor *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKGProcessorConnection);
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

+ (id)sharedProcessor
{
  if (sharedProcessor_onceToken_0 != -1) {
    dispatch_once(&sharedProcessor_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedProcessor_sSharedProcessor;
  return v2;
}

- (void)updateCheckedInClientWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
}

+ (id)sharedImporterProcessor
{
  if (sharedImporterProcessor_onceToken != -1) {
    dispatch_once(&sharedImporterProcessor_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedImporterProcessor_sSharedProcessor;
  return v2;
}

uint64_t __48__SKGAttributeProcessor_sharedImporterProcessor__block_invoke()
{
  sharedImporterProcessor_sSharedProcessor = [[SKGAttributeProcessor alloc] initForImporter];
  return MEMORY[0x270F9A758]();
}

- (id)initForImporter
{
  v6.receiver = self;
  v6.super_class = (Class)SKGAttributeProcessor;
  v2 = [(SKGAttributeProcessor *)&v6 init];
  if (v2)
  {
    v3 = [[SKGProcessorConnection alloc] initForImporter];
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

- (id)processorAttributesForRecord:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 isUpdate:(BOOL)a6
{
  BOOL v7 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 objectForKeyedSubscript:@"_kMDItemNeedsPriority"];
  if (v13)
  {
    objc_super v6 = [v10 objectForKeyedSubscript:@"_kMDItemNeedsPriority"];
    if (v6 == (void *)*MEMORY[0x263EFFD08]) {
      goto LABEL_13;
    }
  }
  v14 = [v10 objectForKeyedSubscript:@"_kMDItemPrioritySN"];

  if (v13)
  {
  }
  if (v14) {
    goto LABEL_14;
  }
  v13 = [v10 objectForKeyedSubscript:@"_kMDItemNeedsEmbeddings"];
  if (v13)
  {
    objc_super v6 = [v10 objectForKeyedSubscript:@"_kMDItemNeedsEmbeddings"];
    if (v6 == (void *)*MEMORY[0x263EFFD08]) {
      goto LABEL_13;
    }
  }
  v15 = [v10 objectForKeyedSubscript:@"_kMDItemEmbeddingsSN"];

  if (v13)
  {
  }
  if (v15) {
    goto LABEL_14;
  }
  v13 = [v10 objectForKeyedSubscript:@"_kMDItemNeedsSuggestedEvents"];
  if (v13)
  {
    objc_super v6 = [v10 objectForKeyedSubscript:@"_kMDItemNeedsSuggestedEvents"];
    if (v6 == (void *)*MEMORY[0x263EFFD08])
    {
LABEL_13:

LABEL_14:
      id v16 = (id)MEMORY[0x263EFFA78];
      goto LABEL_15;
    }
  }
  v18 = [v10 objectForKeyedSubscript:@"_kMDItemSuggestedEventsSN"];

  if (v13)
  {
  }
  if (v18) {
    goto LABEL_14;
  }
  v19 = +[SKGProcessorContext sharedContext];
  int v20 = [v19 enableKeyphrases];

  if (v20) {
    uint64_t v21 = 4;
  }
  else {
    uint64_t v21 = 0;
  }
  v22 = +[SKGProcessorContext sharedContext];
  int v23 = [v22 enableDocumentUnderstanding];

  if (v23) {
    uint64_t v24 = v21 | 0x20;
  }
  else {
    uint64_t v24 = v21;
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v25 = +[SKGProcessor sharedProcessor];
  int v26 = [v25 updateSKGProcessorAttributes:v16 record:v10 bundleID:v11 protectionClass:v12 isUpdate:v7 processorFlags:v24];

  if (v26)
  {
    v27 = +[SKGProcessor sharedProcessor];
    v28 = (void *)[v27 copyContentURLFromRecord:v10];

    if (v28)
    {
      v29 = +[SKGProcessor sharedProcessor];
      v30 = (void *)[v29 copyContentTypeFromRecord:v10];

      if (v30)
      {
        memset(v57, 0, sizeof(v57));
        v31 = [MEMORY[0x263F1D920] typeWithIdentifier:v30];
        uint64_t v56 = 0;
        if (CSGetDiskVersionForContentURL(v28, v31, (uint64_t)v57, &v56))
        {
          v32 = [NSNumber numberWithUnsignedLongLong:*((void *)&v57[0] + 1)];
          [v16 setObject:v32 forKey:@"_kMDItemContentURLFileVersion"];

          v33 = [NSNumber numberWithUnsignedLongLong:*(void *)&v57[0]];
          [v16 setObject:v33 forKey:@"_kMDItemContentURLFileID"];
        }
      }
    }
  }
  v34 = +[SKGProcessorContext sharedContext];
  int v35 = [v34 enableEmbeddings];

  if (v35)
  {
    v36 = [v10 objectForKeyedSubscript:@"kMDItemEmbeddingVersion"];

    if (!v36)
    {
      v37 = +[SKGProcessor sharedProcessor];
      int v38 = [v37 needsEmbeddingsForRecord:v10 bundleID:v11];

      v39 = +[SKGProcessor sharedProcessor];
      int v40 = [v39 shouldGenerateEmbeddingsForRecord:v10 bundleID:v11];

      if (v38)
      {
        if (v40)
        {
          [v16 setObject:&unk_270B14D70 forKey:@"_kMDItemNeedsEmbeddings"];
          v41 = +[SKGProcessor sharedProcessor];
          int v42 = [v41 needsPriorityForRecord:v10 bundleID:v11];

          if (v42) {
            [v16 setObject:&unk_270B14D70 forKey:@"_kMDItemNeedsPriority"];
          }
        }
        else
        {
          v43 = NSNumber;
          v44 = +[SKGProcessorContext sharedContext];
          v45 = objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v44, "embeddingVersion"));
          [v16 setObject:v45 forKey:@"kMDItemEmbeddingVersion"];
        }
      }
    }
  }
  v46 = +[SKGProcessorContext sharedContext];
  int v47 = [v46 enableSuggestedEvents];

  if (v47)
  {
    v48 = [v10 objectForKeyedSubscript:@"kMDItemSuggestedEventsVersion"];

    if (!v48)
    {
      v49 = +[SKGProcessor sharedProcessor];
      int v50 = [v49 needsSuggestedEventsForRecord:v10 bundleID:v11];

      v51 = +[SKGProcessor sharedProcessor];
      int v52 = [v51 shouldGenerateSuggestedEventsForRecord:v10 bundleID:v11];

      if (v50)
      {
        if (v52)
        {
          [v16 setObject:&unk_270B14D70 forKey:@"_kMDItemNeedsSuggestedEvents"];
        }
        else
        {
          v53 = NSNumber;
          v54 = +[SKGProcessorContext sharedContext];
          v55 = objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v54, "suggestedEventsVersion"));
          [v16 setObject:v55 forKey:@"kMDItemSuggestedEventsVersion"];
        }
      }
    }
  }
LABEL_15:

  return v16;
}

- (id)addUpdaterAttributesForMDPlistRecord:(id *)a3 bundleID:(id)a4
{
  $7726518D93795CC6CECA7AC655D1F67C v9 = *a3;
  id v5 = a4;
  objc_super v6 = (void *)_MDPlistContainerCopyObject();
  BOOL v7 = -[SKGAttributeProcessor processorAttributesForRecord:bundleID:protectionClass:isUpdate:](self, "processorAttributesForRecord:bundleID:protectionClass:isUpdate:", v6, v5, 0, 0, *(_OWORD *)&v9.var0, *(void *)&v9.var2);

  return v7;
}

- (void)processRecord:(id)a3 referenceIdentifier:(id)a4 protectionClass:(id)a5 processorFlags:(unint64_t)a6 completionHandler:(id)a7
{
}

- (void)setTurboMode:(BOOL)a3
{
}

- (void)checkProcessingReportForBundleIdentifier:(id)a3 flags:(unint64_t)a4 timeout:(unint64_t)a5 completion:(id)a6
{
}

- (void)getEmbeddingProgressReport:(id)a3
{
}

- (void)getSuggestedEventsProgressReport:(id)a3
{
}

- (void)getDocumentUnderstandingProgressReport:(id)a3
{
}

- (void)collectDiagnostics:(id)a3 completion:(id)a4
{
}

- (id)eventsJournalsStats
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__SKGAttributeProcessor_eventsJournalsStats__block_invoke;
  v9[3] = &unk_265521030;
  id v11 = &v12;
  id v5 = v3;
  id v10 = v5;
  [(SKGProcessorConnection *)connection eventsJournalsStatsWithCompletion:v9];
  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__SKGAttributeProcessor_eventsJournalsStats__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"journalsStats"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_time_t v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

- (void).cxx_destruct
{
}

@end