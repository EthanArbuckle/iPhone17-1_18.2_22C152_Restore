@interface PPTopicExtractionPlugin
+ (id)sharedInstance;
- (PPTopicExtractionPlugin)init;
- (PPTopicExtractionPlugin)initWithTopicDissector:(id)a3;
- (id)_topicContainersForText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 groupId:(id)a6 documentId:(id)a7 contactHandles:(id)a8 weight:(double)a9 isOutgoing:(BOOL)a10;
- (id)extractionsFromText:(id)a3 bundleId:(id)a4;
@end

@implementation PPTopicExtractionPlugin

- (void).cxx_destruct
{
}

- (id)extractionsFromText:(id)a3 bundleId:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v44 = a4;
  v8 = objc_opt_new();
  v9 = +[PPConfiguration sharedInstance];
  char v10 = [v9 isMultilingual];

  v45 = v7;
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F89D60];
    v12 = [MEMORY[0x1E4F89FC8] preferredLanguages];
    v13 = [v11 detectLanguageFromTextHeuristicallyWithLanguages:v7 languages:v12 defaultLanguage:0];

    v14 = (void *)MEMORY[0x1E4F1CA20];
    if (v13)
    {
      int v15 = 0;
      v16 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CA20];
  }
  v4 = [v14 currentLocale];
  v16 = [v4 languageCode];
  v13 = 0;
  int v15 = 1;
LABEL_6:
  v17 = [v14 componentsFromLocaleIdentifier:v16];
  v43 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  if (v15)
  {
  }
  id v18 = objc_alloc(MEMORY[0x1E4F89F40]);
  v19 = objc_opt_new();
  v20 = [v19 UUIDString];
  v21 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v22 = [v18 initWithBundleId:v44 groupId:0 documentId:v20 date:v21 relevanceDate:0 contactHandles:0 language:v43 metadata:0];

  v23 = +[PPConfiguration sharedInstance];
  uint64_t v24 = [v23 extractionAlgorithmsForBundleId:v44 sourceLanguage:v43 conservative:0 domain:0];

  v25 = +[PPConfiguration sharedInstance];
  uint64_t v26 = [v25 extractionAlgorithmsForBundleId:v44 sourceLanguage:v43 conservative:0 domain:1];

  v40 = (void *)v26;
  v41 = (void *)v24;
  v42 = (void *)v22;
  v27 = [(PPTopicDissector *)self->_dissector topicsInText:v45 isPlainText:1 source:v22 cloudSync:0 language:v43 topicAlgorithms:v24 namedEntityAlgorithms:1.0 weight:v26];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v47;
    do
    {
      uint64_t v31 = 0;
      v32 = v8;
      do
      {
        if (*(void *)v47 != v30) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v46 + 1) + 8 * v31);
        v34 = [v33 topics];
        if (v34)
        {
          v35 = [v33 topics];
          v36 = [v33 source];
          v37 = +[PPLocalTopicStore recordsForTopics:source:algorithm:](PPLocalTopicStore, "recordsForTopics:source:algorithm:", v35, v36, [v33 topicAlgorithm]);
        }
        else
        {
          v37 = 0;
        }

        v38 = (void *)[objc_alloc(MEMORY[0x1E4F89E20]) initWithNamedEntityRecords:0 topicRecords:v37];
        v8 = [v32 merge:v38];

        ++v31;
        v32 = v8;
      }
      while (v29 != v31);
      uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v29);
  }

  return v8;
}

- (id)_topicContainersForText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 groupId:(id)a6 documentId:(id)a7 contactHandles:(id)a8 weight:(double)a9 isOutgoing:(BOOL)a10
{
  BOOL v41 = a4;
  id v15 = a3;
  v16 = PPConfiguration;
  id v17 = a8;
  id v39 = a7;
  id v18 = a6;
  id v19 = a5;
  v20 = +[PPConfiguration sharedInstance];
  LOBYTE(a7) = [v20 isMultilingual];

  if (a7)
  {
    v21 = (void *)MEMORY[0x1E4F89D60];
    uint64_t v22 = [MEMORY[0x1E4F89FC8] preferredLanguages];
    v23 = [v21 detectLanguageFromTextHeuristicallyWithLanguages:v15 languages:v22 defaultLanguage:0];

    uint64_t v24 = (void *)MEMORY[0x1E4F1CA20];
    if (v23)
    {
      int v25 = 0;
      uint64_t v26 = v23;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CA20];
  }
  v16 = [v24 currentLocale];
  uint64_t v26 = [(__objc2_class *)v16 languageCode];
  v23 = 0;
  int v25 = 1;
LABEL_6:
  v27 = [v24 componentsFromLocaleIdentifier:v26];
  uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  if (v25)
  {
  }
  if (a9 == 1.79769313e308) {
    a9 = 1.0;
  }
  uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F48]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v15, "length"), 0, (unsigned __int16)objc_msgSend(v17, "count"), a10);
  id v30 = objc_alloc(MEMORY[0x1E4F89F40]);
  uint64_t v31 = objc_opt_new();
  v32 = (void *)[v30 initWithBundleId:v19 groupId:v18 documentId:v39 date:v31 relevanceDate:0 contactHandles:v17 language:v28 metadata:v29];

  v33 = +[PPConfiguration sharedInstance];
  v34 = [v33 extractionAlgorithmsForBundleId:v19 sourceLanguage:v28 conservative:0 domain:0];

  v35 = +[PPConfiguration sharedInstance];
  v36 = [v35 extractionAlgorithmsForBundleId:v19 sourceLanguage:v28 conservative:0 domain:1];

  v37 = [(PPTopicDissector *)self->_dissector topicsInText:v15 isPlainText:v41 source:v32 cloudSync:1 language:v28 topicAlgorithms:v34 namedEntityAlgorithms:a9 weight:v36];

  return v37;
}

- (PPTopicExtractionPlugin)init
{
  v3 = +[PPTopicDissector sharedInstance];
  v4 = [(PPTopicExtractionPlugin *)self initWithTopicDissector:v3];

  return v4;
}

- (PPTopicExtractionPlugin)initWithTopicDissector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPTopicExtractionPlugin;
  v6 = [(PPTopicExtractionPlugin *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dissector, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken4_13413 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken4_13413, &__block_literal_global_13414);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_13415;
  return v2;
}

void __41__PPTopicExtractionPlugin_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_13415;
  sharedInstance__pasExprOnceResult_13415 = v1;
}

@end