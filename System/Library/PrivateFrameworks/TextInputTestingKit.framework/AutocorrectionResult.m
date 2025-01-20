@interface AutocorrectionResult
+ (BOOL)supportsSecureCoding;
- (AutocorrectionResult)initWithCoder:(id)a3;
- (NSArray)corrected;
- (NSArray)documentStates;
- (NSArray)inlineCompletions;
- (NSArray)input;
- (NSArray)inserted;
- (NSArray)intended;
- (NSArray)intendedTransliteration;
- (NSArray)predicted;
- (NSArray)tags;
- (NSArray)touchEvents;
- (NSArray)touched;
- (NSDictionary)aggdStatistics;
- (NSDictionary)debugData;
- (NSDictionary)pathsForWords;
- (NSDictionary)sourceMetadata;
- (NSNumber)corpusId;
- (NSNumber)numberOfTouches;
- (NSNumber)rank;
- (NSString)context;
- (NSString)seed;
- (NSURL)typologyLogURL;
- (NSURL)typologyTraceLogURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)extractDataFromTypingLog:(id)a3;
- (void)setAggdStatistics:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorpusId:(id)a3;
- (void)setCorrected:(id)a3;
- (void)setDebugData:(id)a3;
- (void)setDocumentStates:(id)a3;
- (void)setInlineCompletions:(id)a3;
- (void)setInput:(id)a3;
- (void)setInserted:(id)a3;
- (void)setIntended:(id)a3;
- (void)setIntendedTransliteration:(id)a3;
- (void)setNumberOfTouches:(id)a3;
- (void)setPathsForWords:(id)a3;
- (void)setPredicted:(id)a3;
- (void)setRank:(id)a3;
- (void)setSeed:(id)a3;
- (void)setSourceMetadata:(id)a3;
- (void)setTags:(id)a3;
- (void)setTagsFromClassifiers:(id)a3;
- (void)setTouchEvents:(id)a3;
- (void)setTouched:(id)a3;
- (void)setTypologyLogURL:(id)a3;
- (void)setTypologyTraceLogURL:(id)a3;
@end

@implementation AutocorrectionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggdStatistics, 0);
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_typologyTraceLogURL, 0);
  objc_storeStrong((id *)&self->_typologyLogURL, 0);
  objc_storeStrong((id *)&self->_corpusId, 0);
  objc_storeStrong((id *)&self->_numberOfTouches, 0);
  objc_storeStrong((id *)&self->_documentStates, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_intendedTransliteration, 0);
  objc_storeStrong((id *)&self->_intended, 0);
  objc_storeStrong((id *)&self->_corrected, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predicted, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_pathsForWords, 0);
  objc_storeStrong((id *)&self->_touchEvents, 0);
  objc_storeStrong((id *)&self->_touched, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setAggdStatistics:(id)a3
{
}

- (NSDictionary)aggdStatistics
{
  return self->_aggdStatistics;
}

- (void)setRank:(id)a3
{
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setTags:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setDebugData:(id)a3
{
}

- (NSDictionary)debugData
{
  return self->_debugData;
}

- (void)setSeed:(id)a3
{
}

- (NSString)seed
{
  return self->_seed;
}

- (void)setTypologyTraceLogURL:(id)a3
{
}

- (NSURL)typologyTraceLogURL
{
  return self->_typologyTraceLogURL;
}

- (void)setTypologyLogURL:(id)a3
{
}

- (NSURL)typologyLogURL
{
  return self->_typologyLogURL;
}

- (void)setCorpusId:(id)a3
{
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (void)setNumberOfTouches:(id)a3
{
}

- (NSNumber)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)setDocumentStates:(id)a3
{
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setInput:(id)a3
{
}

- (NSArray)input
{
  return self->_input;
}

- (void)setIntendedTransliteration:(id)a3
{
}

- (NSArray)intendedTransliteration
{
  return self->_intendedTransliteration;
}

- (void)setIntended:(id)a3
{
}

- (NSArray)intended
{
  return self->_intended;
}

- (void)setCorrected:(id)a3
{
}

- (NSArray)corrected
{
  return self->_corrected;
}

- (void)setInlineCompletions:(id)a3
{
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setPredicted:(id)a3
{
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setInserted:(id)a3
{
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setPathsForWords:(id)a3
{
}

- (NSDictionary)pathsForWords
{
  return self->_pathsForWords;
}

- (void)setTouchEvents:(id)a3
{
}

- (NSArray)touchEvents
{
  return self->_touchEvents;
}

- (void)setTouched:(id)a3
{
}

- (NSArray)touched
{
  return self->_touched;
}

- (void)setSourceMetadata:(id)a3
{
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)extractDataFromTypingLog:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263EFF980] array];
  v7 = [MEMORY[0x263EFF980] array];
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [MEMORY[0x263EFF980] array];
  v10 = [MEMORY[0x263EFF980] array];
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __49__AutocorrectionResult_extractDataFromTypingLog___block_invoke;
  v32 = &unk_265050290;
  v40 = &v41;
  id v12 = v5;
  id v33 = v12;
  id v13 = v9;
  id v34 = v13;
  id v14 = v7;
  id v35 = v14;
  id v15 = v8;
  id v36 = v15;
  id v16 = v10;
  id v37 = v16;
  id v17 = v6;
  id v38 = v17;
  id v18 = v11;
  id v39 = v18;
  [v4 enumerateKeystrokesAndPathsForTokensWithBlock:&v29];
  v19 = objc_msgSend(v12, "copy", v29, v30, v31, v32);
  [(AutocorrectionResult *)self setTouched:v19];

  v20 = (void *)[v14 copy];
  [(AutocorrectionResult *)self setPredicted:v20];

  v21 = (void *)[v15 copy];
  [(AutocorrectionResult *)self setInlineCompletions:v21];

  v22 = (void *)[v13 copy];
  [(AutocorrectionResult *)self setInserted:v22];

  v23 = (void *)[v16 copy];
  [(AutocorrectionResult *)self setDocumentStates:v23];

  v24 = [NSNumber numberWithUnsignedInteger:v42[3]];
  [(AutocorrectionResult *)self setNumberOfTouches:v24];

  v25 = [v4 getDebugData];
  [(AutocorrectionResult *)self setDebugData:v25];

  v26 = (void *)[v17 copy];
  [(AutocorrectionResult *)self setTouchEvents:v26];

  v27 = (void *)[v18 copy];
  [(AutocorrectionResult *)self setPathsForWords:v27];

  v28 = [v4 intendedTransliterationSequence];
  if (v28) {
    [(AutocorrectionResult *)self setIntendedTransliteration:v28];
  }

  _Block_object_dispose(&v41, 8);
}

void __49__AutocorrectionResult_extractDataFromTypingLog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v35 = a3;
  id v39 = [MEMORY[0x263EFF980] array];
  id v38 = [MEMORY[0x263EFF980] array];
  id v37 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263EFF980] array];
  v7 = [MEMORY[0x263EFF980] array];
  v8 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v14 = [v13 touchedKey];
        [v39 addObject:v14];

        id v15 = [v13 insertedKey];
        [v7 addObject:v15];

        id v16 = [v13 predictionBarState];
        [v37 addObject:v16];

        id v17 = [v13 inlineCompletionBarState];
        [v6 addObject:v17];

        uint64_t v18 = [v13 documentState];
        v19 = (void *)v18;
        if (v18) {
          v20 = (__CFString *)v18;
        }
        else {
          v20 = &stru_26F2B7E50;
        }
        [v8 addObject:v20];

        v21 = [v13 touch];
        [v38 addObject:v21];

        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v10);
  }

  v22 = *(void **)(a1 + 32);
  v23 = (void *)[v39 copy];
  [v22 addObject:v23];

  v24 = *(void **)(a1 + 40);
  v25 = (void *)[v7 copy];
  [v24 addObject:v25];

  v26 = *(void **)(a1 + 48);
  v27 = (void *)[v37 copy];
  [v26 addObject:v27];

  v28 = *(void **)(a1 + 56);
  uint64_t v29 = (void *)[v6 copy];
  [v28 addObject:v29];

  uint64_t v30 = *(void **)(a1 + 64);
  v31 = (void *)[v8 copy];
  [v30 addObject:v31];

  v32 = *(void **)(a1 + 72);
  id v33 = (void *)[v38 copy];
  [v32 addObject:v33];

  id v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  if (v35) {
    [*(id *)(a1 + 80) setObject:v35 forKeyedSubscript:v34];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AutocorrectionResult *)self context];
  [v4 encodeObject:v5 forKey:@"ARContext"];

  v6 = [(AutocorrectionResult *)self touched];
  [v4 encodeObject:v6 forKey:@"ARTouched"];

  v7 = [(AutocorrectionResult *)self predicted];
  [v4 encodeObject:v7 forKey:@"ARPredicted"];

  v8 = [(AutocorrectionResult *)self inlineCompletions];
  [v4 encodeObject:v8 forKey:@"ARInlineCompletions"];

  uint64_t v9 = [(AutocorrectionResult *)self documentStates];
  [v4 encodeObject:v9 forKey:@"ARDocumentStates"];

  uint64_t v10 = [(AutocorrectionResult *)self inserted];
  [v4 encodeObject:v10 forKey:@"ARInserted"];

  uint64_t v11 = [(AutocorrectionResult *)self corrected];
  [v4 encodeObject:v11 forKey:@"ARCorrected"];

  id v12 = [(AutocorrectionResult *)self intended];
  [v4 encodeObject:v12 forKey:@"ARIntended"];

  id v13 = [(AutocorrectionResult *)self intendedTransliteration];
  [v4 encodeObject:v13 forKey:@"ARIntendedTransliteration"];

  id v14 = [(AutocorrectionResult *)self input];
  [v4 encodeObject:v14 forKey:@"ARInput"];

  id v15 = [(AutocorrectionResult *)self numberOfTouches];
  [v4 encodeObject:v15 forKey:@"ARNumberOfTouches"];

  id v16 = [(AutocorrectionResult *)self seed];
  [v4 encodeObject:v16 forKey:@"ARSeed"];

  id v17 = [(AutocorrectionResult *)self tags];
  [v4 encodeObject:v17 forKey:@"ARTags"];

  uint64_t v18 = [(AutocorrectionResult *)self rank];
  [v4 encodeObject:v18 forKey:@"ARRank"];

  v19 = (void *)MEMORY[0x263F08900];
  uint64_t v20 = [(AutocorrectionResult *)self debugData];
  v21 = (void *)v20;
  if (v20) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = MEMORY[0x263EFFA78];
  }
  uint64_t v24 = 0;
  v23 = [v19 dataWithJSONObject:v22 options:0 error:&v24];

  [v4 encodeObject:v23 forKey:@"ARDebug"];
}

- (AutocorrectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AutocorrectionResult;
  id v5 = [(AutocorrectionResult *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARContext"];
    [(AutocorrectionResult *)v5 setContext:v9];

    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:@"ARTouched"];
    [(AutocorrectionResult *)v5 setTouched:v10];

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"ARPredicted"];
    [(AutocorrectionResult *)v5 setPredicted:v11];

    id v12 = [v4 decodeObjectOfClasses:v8 forKey:@"ARInlineCompletions"];
    [(AutocorrectionResult *)v5 setInlineCompletions:v12];

    id v13 = [v4 decodeObjectOfClasses:v8 forKey:@"ARDocumentStates"];
    [(AutocorrectionResult *)v5 setDocumentStates:v13];

    id v14 = [v4 decodeObjectOfClasses:v8 forKey:@"ARInserted"];
    [(AutocorrectionResult *)v5 setInserted:v14];

    id v15 = [v4 decodeObjectOfClasses:v8 forKey:@"ARCorrected"];
    [(AutocorrectionResult *)v5 setCorrected:v15];

    id v16 = [v4 decodeObjectOfClasses:v8 forKey:@"ARIntended"];
    [(AutocorrectionResult *)v5 setIntended:v16];

    id v17 = [v4 decodeObjectOfClasses:v8 forKey:@"ARIntendedTransliteration"];
    [(AutocorrectionResult *)v5 setIntendedTransliteration:v17];

    uint64_t v18 = [v4 decodeObjectOfClasses:v8 forKey:@"ARInput"];
    [(AutocorrectionResult *)v5 setInput:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARNumberOfTouches"];
    [(AutocorrectionResult *)v5 setNumberOfTouches:v19];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARSeed"];
    [(AutocorrectionResult *)v5 setSeed:v20];

    v21 = [v4 decodeObjectOfClasses:v8 forKey:@"ARTags"];
    [(AutocorrectionResult *)v5 setTags:v21];

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARRank"];
    [(AutocorrectionResult *)v5 setRank:v22];

    [(AutocorrectionResult *)v5 setAggdStatistics:0];
    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARDebug"];
    uint64_t v26 = 0;
    uint64_t v24 = [MEMORY[0x263F08900] JSONObjectWithData:v23 options:0 error:&v26];
    if ([v24 count]) {
      [(AutocorrectionResult *)v5 setDebugData:v24];
    }
  }
  return v5;
}

- (void)setTagsFromClassifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "doesMatchResult:", self, (void)v13))
        {
          uint64_t v11 = (objc_class *)objc_opt_class();
          id v12 = NSStringFromClass(v11);
          [v5 addObject:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(AutocorrectionResult *)self setTags:v5];
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [(AutocorrectionResult *)self context];
  [v3 appendFormat:@"context: [%@]\n", v4];

  id v5 = [(AutocorrectionResult *)self touched];
  [v3 appendFormat:@"        touched: [%@]\n", v5];

  id v6 = [(AutocorrectionResult *)self inserted];
  [v3 appendFormat:@"       inserted: [%@]\n", v6];

  uint64_t v7 = [(AutocorrectionResult *)self corrected];
  [v3 appendFormat:@"      corrected: [%@]\n", v7];

  uint64_t v8 = [(AutocorrectionResult *)self intended];
  [v3 appendFormat:@"       expected: [%@]\n", v8];

  uint64_t v9 = [(AutocorrectionResult *)self intendedTransliteration];
  [v3 appendFormat:@" expected trans: [%@]\n", v9];

  uint64_t v10 = [(AutocorrectionResult *)self input];
  [v3 appendFormat:@"          input: [%@]\n", v10];

  uint64_t v11 = [(AutocorrectionResult *)self numberOfTouches];
  [v3 appendFormat:@"     numTouches: [%@]\n", v11];

  id v12 = [(AutocorrectionResult *)self seed];
  [v3 appendFormat:@"           seed: %@\n", v12];

  long long v13 = [(AutocorrectionResult *)self rank];
  if ([v13 integerValue] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 appendFormat:@"           rank: %@\n", @"NSNotFound"];
  }
  else
  {
    long long v14 = [(AutocorrectionResult *)self rank];
    long long v15 = [v14 description];
    [v3 appendFormat:@"           rank: %@\n", v15];
  }
  long long v16 = [(AutocorrectionResult *)self aggdStatistics];
  [v3 appendFormat:@" aggdStatistics: %@\n", v16];

  [v3 appendString:@"       failures:"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = [(AutocorrectionResult *)self tags];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [v3 appendFormat:@" %@", *(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

  [v3 appendString:@"\n"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end