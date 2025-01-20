@interface PGShareBackSuggesterResult
+ (id)momentNodesForSuggesterResults:(id)a3;
- (NSArray)suggesterInputs;
- (NSSet)momentNodes;
- (PGShareBackSuggesterResult)initWithInputs:(id)a3 processingValue:(unsigned __int16)a4 momentNodes:(id)a5;
- (id)description;
- (unsigned)processingValue;
@end

@implementation PGShareBackSuggesterResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_suggesterInputs, 0);
}

- (unsigned)processingValue
{
  return self->_processingValue;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (NSArray)suggesterInputs
{
  return self->_suggesterInputs;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGShareBackSuggesterResult;
  v4 = [(PGShareBackSuggesterResult *)&v9 description];
  [(PGShareBackSuggesterResult *)self processingValue];
  v5 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v6 = [(PGShareBackSuggesterResult *)self momentNodes];
  v7 = [v3 stringWithFormat:@"%@ - Reason: %@ - momentNodes: %@", v4, v5, v6];

  return v7;
}

- (PGShareBackSuggesterResult)initWithInputs:(id)a3 processingValue:(unsigned __int16)a4 momentNodes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGShareBackSuggesterResult;
  v10 = [(PGShareBackSuggesterResult *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    suggesterInputs = v10->_suggesterInputs;
    v10->_suggesterInputs = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    momentNodes = v10->_momentNodes;
    v10->_momentNodes = (NSSet *)v13;

    v10->_processingValue = a4;
  }

  return v10;
}

+ (id)momentNodesForSuggesterResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "momentNodes", (void)v12);
        [v4 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end