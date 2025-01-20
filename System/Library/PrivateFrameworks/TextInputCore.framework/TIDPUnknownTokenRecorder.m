@interface TIDPUnknownTokenRecorder
- (BOOL)report;
- (id)delegate;
- (id)recordingKey;
- (id)records;
@end

@implementation TIDPUnknownTokenRecorder

- (BOOL)report
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4E7C3D0](self, a2);
  v29 = self;
  [(TIDPRecorder *)self characterExplodedRecords];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v27 = v3;
    v6 = 0;
    uint64_t v7 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      v9 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v34 + 1) + 8 * v8);
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v30 + 1) + 8 * i) codedWord];
              if (v17) {
                [v11 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
          }
          while (v14);
        }

        v18 = [v12 firstObject];
        v6 = [v18 coderVersion];

        v19 = (void *)[v11 copy];
        if ([v19 count])
        {
          uint64_t v20 = [v6 UUIDString];
          v21 = (void *)v20;
          v22 = @"UNKNOWN_VERSION";
          if (v20) {
            v22 = (__CFString *)v20;
          }
          v23 = v22;

          v24 = [(TIDPUnknownTokenRecorder *)v29 delegate];
          v38 = @"VersionHash";
          v39 = v23;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

          [v24 record:v19 metadata:v25];
        }

        ++v8;
        v9 = v6;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v5);

    v3 = v27;
  }

  return 1;
}

- (id)records
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(TIDPRecorder *)self characterCoder];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [(TIDPRecorder *)self typingSessionAligned];
    v6 = [v5 alignedEntries];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      v9 = 0;
      do
      {
        id v10 = v9;
        v11 = [(TIDPRecorder *)self typingSessionAligned];
        id v12 = [v11 alignedEntries];
        v9 = [v12 objectAtIndexedSubscript:v8];

        uint64_t v13 = [v9 originalWord];
        LODWORD(v12) = [(TIDPRecorder *)self isWordEntryReallyOOV:v13 caseSensitive:0];

        if (v12)
        {
          uint64_t v14 = [v9 originalWord];
          uint64_t v15 = [v14 acceptedString];
          v16 = [(TIDPRecorder *)self characterCoder];
          v17 = +[TIDPWordRecord word:v15 atPosition:&unk_1F3FA7CA0 coder:v16];

          [v4 addObject:v17];
        }
        ++v8;
        v18 = [(TIDPRecorder *)self typingSessionAligned];
        v19 = [v18 alignedEntries];
        unint64_t v20 = [v19 count];
      }
      while (v8 < v20);
    }
    v21 = (void *)[v4 copy];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      v22 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
      int v24 = 136315394;
      v25 = "-[TIDPUnknownTokenRecorder records]";
      __int16 v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  Not recording unknown tokens for locale '%@' because a valid character coder could not be loaded.", (uint8_t *)&v24, 0x16u);
    }
    v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

- (id)recordingKey
{
  v2 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
  v3 = [@"com.apple.TextInput.UnknownToken." stringByAppendingString:v2];

  return v3;
}

- (id)delegate
{
  v11.receiver = self;
  v11.super_class = (Class)TIDPUnknownTokenRecorder;
  v3 = [(TIDPRecorder *)&v11 delegate];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5F480]);
    uint64_t v5 = [(TIDPUnknownTokenRecorder *)self recordingKey];
    v6 = (void *)[v4 initWithKey:v5];

    v10.receiver = self;
    v10.super_class = (Class)TIDPUnknownTokenRecorder;
    [(TIDPRecorder *)&v10 setDelegate:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)TIDPUnknownTokenRecorder;
  uint64_t v7 = [(TIDPRecorder *)&v9 delegate];

  return v7;
}

@end