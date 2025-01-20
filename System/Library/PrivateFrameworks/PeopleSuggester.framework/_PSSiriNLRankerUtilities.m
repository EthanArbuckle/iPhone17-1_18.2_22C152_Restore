@interface _PSSiriNLRankerUtilities
+ (id)knowledgeEventWithContactPriors:(id)a3 interactionId:(id)a4;
@end

@implementation _PSSiriNLRankerUtilities

+ (id)knowledgeEventWithContactPriors:(id)a3 interactionId:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  v32 = [MEMORY[0x1E4F1C9C8] date];
  v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v35 = *(void *)v38;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v37 + 1) + 8 * v8);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v11 = [v9 contactIdentifier];
        v12 = [v9 contact];
        v13 = [v12 givenName];

        v14 = [v9 contact];
        v15 = [v14 familyName];

        [v9 priorScore];
        float v17 = v16;
        int v18 = [v9 rank];
        v19 = [v9 modelName];
        v20 = [v9 modelVersion];
        if (v11) {
          [v10 setObject:v11 forKeyedSubscript:@"contactId"];
        }
        if (v13) {
          [v10 setObject:v13 forKeyedSubscript:@"contactGivenName"];
        }
        if (v15) {
          [v10 setObject:v15 forKeyedSubscript:@"contactFamilyName"];
        }
        if (v17 == 0.0)
        {
          [v10 setObject:&unk_1EF676738 forKeyedSubscript:@"score"];
        }
        else
        {
          *(float *)&double v21 = v17;
          v22 = [NSNumber numberWithFloat:v21];
          [v10 setObject:v22 forKeyedSubscript:@"score"];
        }
        if (v18)
        {
          v23 = objc_msgSend(NSNumber, "numberWithInteger:");
          [v10 setObject:v23 forKeyedSubscript:@"rank"];

          if (!v19) {
            goto LABEL_18;
          }
LABEL_17:
          [v10 setObject:v19 forKeyedSubscript:@"modelName"];
          goto LABEL_18;
        }
        [v10 setObject:&unk_1EF674F40 forKeyedSubscript:@"rank"];
        if (v19) {
          goto LABEL_17;
        }
LABEL_18:
        if (v20) {
          [v10 setObject:v20 forKeyedSubscript:@"modelVersion"];
        }
        [v36 addObject:v10];

        ++v8;
      }
      while (v7 != v8);
      uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      uint64_t v7 = v24;
    }
    while (v24);
  }

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F5B5F0]) initWithIdentifier:@"peopleSuggesterSiriNL" bundleIdentifier:0 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];
  v26 = (void *)MEMORY[0x1E4F5B510];
  v27 = [MEMORY[0x1E4F5B5F8] peopleSuggesterOutputForSiriNLStream];
  v28 = [MEMORY[0x1E4F5B5A8] rankedSuggestions];
  v41 = v28;
  v42 = v36;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v30 = [v26 eventWithStream:v27 source:v25 startDate:v32 endDate:v32 identifierStringValue:v33 metadata:v29];

  return v30;
}

@end