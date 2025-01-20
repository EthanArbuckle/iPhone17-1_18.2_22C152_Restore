@interface PSPeopleSuggestionsMetricsInferenceEvent
- (PSPeopleSuggestionsMetricsInferenceEvent)initWithIdentifier:(id)a3 responseType:(int64_t)a4 suggestions:(id)a5;
- (_PSPeopleSuggestionsMetricsInferenceEventInternal)underlyingObject;
@end

@implementation PSPeopleSuggestionsMetricsInferenceEvent

- (PSPeopleSuggestionsMetricsInferenceEvent)initWithIdentifier:(id)a3 responseType:(int64_t)a4 suggestions:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PSPeopleSuggestionsMetricsInferenceEvent;
  v10 = [(PSPeopleSuggestionsMetricsInferenceEvent *)&v27 init];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "underlyingObject", (void)v23);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v14);
  }

  v18 = [_PSPeopleSuggestionsMetricsInferenceEventInternal alloc];
  v19 = (void *)[v11 copy];
  uint64_t v20 = [(_PSPeopleSuggestionsMetricsInferenceEventInternal *)v18 initWithId:v8 responseType:a4 suggestions:v19];
  underlyingObject = v10->_underlyingObject;
  v10->_underlyingObject = (_PSPeopleSuggestionsMetricsInferenceEventInternal *)v20;

  return v10;
}

- (_PSPeopleSuggestionsMetricsInferenceEventInternal)underlyingObject
{
  return (_PSPeopleSuggestionsMetricsInferenceEventInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end