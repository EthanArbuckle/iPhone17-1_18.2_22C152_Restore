@interface PRSCoreDuet
- (PRSCoreDuet)initWithStreamName:(id)a3;
- (_DKEventStream)spotlightStream;
- (_DKKnowledgeStore)knowledgeStore;
- (id)getRankedCategoriesDictionaryWithPredictionWindow:(double)a3 predictionInterval:(double)a4;
- (void)addResultCategoryAndGroupToHistory:(id)a3 groupName:(id)a4 error:(id)a5;
- (void)setKnowledgeStore:(id)a3;
- (void)setSpotlightStream:(id)a3;
@end

@implementation PRSCoreDuet

- (PRSCoreDuet)initWithStreamName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSCoreDuet;
  v5 = [(PRSCoreDuet *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F5B560] knowledgeStore];
    knowledgeStore = v5->_knowledgeStore;
    v5->_knowledgeStore = (_DKKnowledgeStore *)v6;

    v8 = (void *)MEMORY[0x1E4F5B520];
    v9 = [MEMORY[0x1E4F5B498] type];
    uint64_t v10 = [v8 eventStreamWithName:v4 valueType:v9];
    spotlightStream = v5->_spotlightStream;
    v5->_spotlightStream = (_DKEventStream *)v10;
  }
  return v5;
}

- (id)getRankedCategoriesDictionaryWithPredictionWindow:(double)a3 predictionInterval:(double)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a4];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = (void *)MEMORY[0x1E4F5B540];
  spotlightStream = self->_spotlightStream;
  v28 = (void *)v6;
  v29 = (void *)v5;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v6];
  uint64_t v10 = [v7 histogramQueryForStream:spotlightStream interval:v9];

  v27 = (void *)v10;
  v11 = [(_DKKnowledgeStore *)self->_knowledgeStore executeQuery:v10 error:0];
  v12 = [v11 histogram];
  objc_super v13 = (void *)[v12 mutableCopy];
  v26 = v11;
  unint64_t v14 = [v11 countOverAllValues];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v15 = [v12 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        if (v14)
        {
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v21 = [v12 objectForKey:v20];
          [v21 doubleValue];
          v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:v22 / (double)v14];
          [v13 setValue:v23 forKey:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }

  v24 = (void *)[v13 copy];
  return v24;
}

- (void)addResultCategoryAndGroupToHistory:(id)a3 groupName:(id)a4 error:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v7;
  }
  v11 = (void *)MEMORY[0x1E4F1C9C8];
  id v12 = v10;
  objc_super v13 = [v11 date];
  unint64_t v14 = [MEMORY[0x1E4F5B510] eventWithStream:self->_spotlightStream startDate:v13 endDate:v13 identifierStringValue:v12 metadata:0];

  knowledgeStore = self->_knowledgeStore;
  v17[0] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  LOBYTE(knowledgeStore) = [(_DKKnowledgeStore *)knowledgeStore saveObjects:v16 error:0];

  if ((knowledgeStore & 1) == 0) {
    NSLog(&cfstr_ErrorSavingEng.isa);
  }
}

- (_DKKnowledgeStore)knowledgeStore
{
  return (_DKKnowledgeStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKnowledgeStore:(id)a3
{
}

- (_DKEventStream)spotlightStream
{
  return (_DKEventStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSpotlightStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightStream, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end