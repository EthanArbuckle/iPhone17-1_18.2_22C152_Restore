@interface _PSContactEmbeddingDataCollectionUtilities
+ (id)prepareAllEventsFromContactEmbeddingsDict:(id)a3;
+ (id)prepareEventArrayFromEmbeddingDict:(id)a3 forUser:(id)a4 sessionId:(id)a5;
+ (id)prepareEventFromContactEmbedding:(id)a3 contactId:(id)a4;
@end

@implementation _PSContactEmbeddingDataCollectionUtilities

+ (id)prepareEventFromContactEmbedding:(id)a3 contactId:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  v34 = objc_alloc_init(ContactEmbeddingAnalysisPETNeuralNetEmbedding);
  id v35 = v5;
  v6 = [v5 objectForKey:@"last_layer_before_activation"];
  uint64_t v7 = [v6 count];
  v32 = &v30;
  v8 = (char *)&v30 - ((4 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * i) floatValue];
        *(_DWORD *)&v8[4 * v12 + 4 * i] = v15;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
      v12 += i;
    }
    while (v11);
  }

  [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)v34 setEmbeddings:v8 count:v7];
  v16 = objc_alloc_init(ContactEmbeddingAnalysisPETNeuralNetEmbedding);
  v17 = [v35 objectForKey:@"last_layer_after_activation"];
  uint64_t v31 = [v17 count];
  v18 = (char *)&v30 - ((4 * v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * j) floatValue];
        *(_DWORD *)&v18[4 * v22 + 4 * j] = v25;
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
      v22 += j;
    }
    while (v21);
  }

  [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)v16 setEmbeddings:v18 count:v31];
  v26 = objc_alloc_init(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent);
  v27 = v33;
  [(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent *)v26 setContactId:v33];
  v28 = v34;
  [(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent *)v26 setEmbeddingsBeforeActivation:v34];
  [(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent *)v26 setEmbeddingsAfterActivation:v16];

  return v26;
}

+ (id)prepareAllEventsFromContactEmbeddingsDict:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKey:", v11, (void)v16);
        uint64_t v13 = [a1 prepareEventFromContactEmbedding:v12 contactId:v11];
        [v5 setObject:v13 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return v14;
}

+ (id)prepareEventArrayFromEmbeddingDict:(id)a3 forUser:(id)a4 sessionId:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)v10 setContactEmbeddings:v11];
  [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)v10 setUserId:v8];
  [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)v10 setSessinobd:v9];

  return v10;
}

@end