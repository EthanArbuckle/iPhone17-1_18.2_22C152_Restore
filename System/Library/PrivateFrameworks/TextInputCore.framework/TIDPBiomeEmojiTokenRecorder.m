@interface TIDPBiomeEmojiTokenRecorder
- (BOOL)report;
- (id)delegate;
- (id)recordingKey;
- (id)records;
@end

@implementation TIDPBiomeEmojiTokenRecorder

- (BOOL)report
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E4E7C3D0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(TIDPBiomeEmojiTokenRecorder *)self records];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v22 + 1) + 8 * i) word];
        v10 = [v9 lowercaseString];

        v11 = [v3 objectForKey:v10];
        if (v11)
        {
          v12 = v11;
          v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
        }
        else
        {
          v13 = [NSNumber numberWithInt:1];
        }
        [v3 setObject:v13 forKey:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v14 = [v3 count];
  if (v14)
  {
    v15 = [(TIDPBiomeEmojiTokenRecorder *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(TIDPBiomeEmojiTokenRecorder *)self delegate];
      v18 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
      v19 = [(TIDPBiomeEmojiTokenRecorder *)self recordingKey];
      [v17 recordTokenFrequency:v3 withLocale:v18 withTokenType:v19];
    }
  }

  return v14 != 0;
}

- (id)records
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v4 = [(TIDPRecorder *)self typingSessionAligned];
  uint64_t v5 = [v4 alignedEntries];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    uint64_t v33 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      uint64_t v34 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "originalWord", v33);
        v12 = [v11 editedEntry];
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v10 originalWord];
        }
        v15 = v14;

        char v16 = [v15 acceptedCandidate];
        v17 = [v16 candidate];
        int v18 = [v17 _containsEmoji];

        if (v18)
        {
          v19 = [v15 acceptedCandidate];
          v20 = [v19 candidate];
          v21 = +[TIDPWordRecord word:v20];

          [v3 addObject:v21];
        }
        else
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v21 = [v10 alignedKeyboardInputs];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            v35 = v15;
            uint64_t v24 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v37 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v27 = [v26 string];
                int v28 = [v27 _containsEmoji];

                if (v28)
                {
                  v29 = [v26 string];
                  v30 = +[TIDPWordRecord word:v29];

                  [v3 addObject:v30];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v23);
            uint64_t v8 = v33;
            uint64_t v7 = v34;
            v15 = v35;
          }
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v7);
  }

  v31 = (void *)[v3 copy];

  return v31;
}

- (id)recordingKey
{
  return (id)MEMORY[0x1F410C878](2, a2);
}

- (id)delegate
{
  v9.receiver = self;
  v9.super_class = (Class)TIDPBiomeEmojiTokenRecorder;
  id v3 = [(TIDPRecorder *)&v9 delegate];

  if (!v3)
  {
    v4 = objc_alloc_init(TIDPBiomeReportingDelegate);
    v8.receiver = self;
    v8.super_class = (Class)TIDPBiomeEmojiTokenRecorder;
    [(TIDPRecorder *)&v8 setDelegate:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)TIDPBiomeEmojiTokenRecorder;
  uint64_t v5 = [(TIDPRecorder *)&v7 delegate];

  return v5;
}

@end