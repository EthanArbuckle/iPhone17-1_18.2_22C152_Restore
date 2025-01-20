@interface TIDPNamedEntityTokenRecorder
- (BOOL)report;
- (id)delegate;
- (id)recordingKey;
- (id)records;
@end

@implementation TIDPNamedEntityTokenRecorder

- (BOOL)report
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(TIDPRecorder *)self characterExplodedRecords];
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v23 + 1) + 8 * v5);
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v8 = [(TIDPNamedEntityTokenRecorder *)self records];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [*(id *)(*((void *)&v19 + 1) + 8 * v12) toDPWordRecord];
              [v7 addObject:v13];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }

        v14 = (void *)[v7 copy];
        if ([v14 count])
        {
          v15 = [(TIDPNamedEntityTokenRecorder *)self delegate];
          [v15 record:v14];
        }
        ++v5;
      }
      while (v5 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  return 1;
}

- (id)records
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(TIDPRecorder *)self typingSessionAligned];
  uint64_t v5 = [v4 alignedEntries];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = v8;
      uint64_t v11 = v7;
      uint64_t v12 = [(TIDPRecorder *)self typingSessionAligned];
      v13 = [v12 alignedEntries];
      v7 = [v13 objectAtIndexedSubscript:v9];

      v14 = [v7 originalWord];
      v8 = [v14 acceptedString];

      v15 = [v7 originalWord];
      uint64_t v16 = [v15 acceptedCandidate];

      id v17 = (id)v16;
      LODWORD(v16) = [v17 sourceMask] & 8;
      LODWORD(v16) = v16 | [v17 sourceMask] & 0x10;

      if (v16)
      {
        uint64_t v18 = +[TIDPWordRecord word:v8 atPosition:&unk_1F3FA7C10];
        [v3 addObject:v18];
      }
      ++v9;
      long long v19 = [(TIDPRecorder *)self typingSessionAligned];
      long long v20 = [v19 alignedEntries];
      unint64_t v21 = [v20 count];
    }
    while (v9 < v21);
  }
  long long v22 = (void *)[v3 copy];

  return v22;
}

- (id)recordingKey
{
  v2 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
  id v3 = [@"com.apple.TextInput.AddressBookNameMatch." stringByAppendingString:v2];

  return v3;
}

- (id)delegate
{
  v11.receiver = self;
  v11.super_class = (Class)TIDPNamedEntityTokenRecorder;
  id v3 = [(TIDPRecorder *)&v11 delegate];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5F498]);
    uint64_t v5 = [(TIDPNamedEntityTokenRecorder *)self recordingKey];
    uint64_t v6 = (void *)[v4 initWithKey:v5];

    v10.receiver = self;
    v10.super_class = (Class)TIDPNamedEntityTokenRecorder;
    [(TIDPRecorder *)&v10 setDelegate:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)TIDPNamedEntityTokenRecorder;
  v7 = [(TIDPRecorder *)&v9 delegate];

  return v7;
}

@end