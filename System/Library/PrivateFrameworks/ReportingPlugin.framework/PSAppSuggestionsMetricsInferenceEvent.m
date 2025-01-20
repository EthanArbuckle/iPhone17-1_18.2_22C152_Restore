@interface PSAppSuggestionsMetricsInferenceEvent
- (PSAppSuggestionsMetricsInferenceEvent)initWithIdentifier:(id)a3 suggestions:(id)a4;
- (_PSAppSuggestionsMetricsInferenceEventInternal)underlyingObject;
@end

@implementation PSAppSuggestionsMetricsInferenceEvent

- (PSAppSuggestionsMetricsInferenceEvent)initWithIdentifier:(id)a3 suggestions:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PSAppSuggestionsMetricsInferenceEvent;
  v8 = [(PSAppSuggestionsMetricsInferenceEvent *)&v25 init];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v14), "underlyingObject", (void)v21);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v12);
  }

  v16 = [_PSAppSuggestionsMetricsInferenceEventInternal alloc];
  v17 = (void *)[v9 copy];
  uint64_t v18 = [(_PSAppSuggestionsMetricsInferenceEventInternal *)v16 initWithId:v6 suggestions:v17];
  underlyingObject = v8->_underlyingObject;
  v8->_underlyingObject = (_PSAppSuggestionsMetricsInferenceEventInternal *)v18;

  return v8;
}

- (_PSAppSuggestionsMetricsInferenceEventInternal)underlyingObject
{
  return (_PSAppSuggestionsMetricsInferenceEventInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end