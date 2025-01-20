@interface TIDPBiomeNamedEntityTokenRecorder
- (BOOL)report;
- (BOOL)shouldSkipWordEntry:(id)a3;
- (id)delegate;
- (id)filterTokenFrequencies:(id)a3 forTokenClass:(unsigned int)a4;
- (id)givenNameRecordingKey;
- (id)records;
- (id)surnameRecordingKey;
@end

@implementation TIDPBiomeNamedEntityTokenRecorder

- (BOOL)report
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E4E7C3D0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = [(TIDPBiomeNamedEntityTokenRecorder *)self records];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v10 = [v9 word];
        v11 = [v3 objectForKey:v10];

        if (v11)
        {
          v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
        }
        else
        {
          v12 = [NSNumber numberWithInt:1];
        }
        v13 = [v9 word];
        [v3 setObject:v12 forKey:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    v14 = [(TIDPBiomeNamedEntityTokenRecorder *)self filterTokenFrequencies:v3 forTokenClass:68];
    v15 = [(TIDPBiomeNamedEntityTokenRecorder *)self filterTokenFrequencies:v3 forTokenClass:69];
    if ([v14 count] || objc_msgSend(v15, "count"))
    {
      v16 = [(TIDPBiomeNamedEntityTokenRecorder *)self delegate];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        if ([v14 count])
        {
          v18 = [(TIDPBiomeNamedEntityTokenRecorder *)self delegate];
          v19 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
          v20 = [(TIDPBiomeNamedEntityTokenRecorder *)self givenNameRecordingKey];
          [v18 recordTokenFrequency:v14 withLocale:v19 withTokenType:v20];
        }
        if ([v15 count])
        {
          v21 = [(TIDPBiomeNamedEntityTokenRecorder *)self delegate];
          v22 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
          v23 = [(TIDPBiomeNamedEntityTokenRecorder *)self surnameRecordingKey];
          [v21 recordTokenFrequency:v15 withLocale:v22 withTokenType:v23];
        }
      }
      int v24 = 0;
    }
    else
    {
      int v24 = 1;
    }
  }
  else
  {
    int v24 = 1;
  }

  return v24 == 0;
}

- (id)filterTokenFrequencies:(id)a3 forTokenClass:(unsigned int)a4
{
  id v5 = a3;
  uint64_t SharedVocabulary = LMVocabularyGetSharedVocabulary();
  uint64_t v7 = [v5 allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__TIDPBiomeNamedEntityTokenRecorder_filterTokenFrequencies_forTokenClass___block_invoke;
  v12[3] = &__block_descriptor_44_e35_B24__0__NSString_8__NSDictionary_16l;
  v12[4] = SharedVocabulary;
  unsigned int v13 = a4;
  v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:v12];
  v9 = [v7 filteredArrayUsingPredicate:v8];

  v10 = [v5 dictionaryWithValuesForKeys:v9];

  return v10;
}

BOOL __74__TIDPBiomeNamedEntityTokenRecorder_filterTokenFrequencies_forTokenClass___block_invoke(uint64_t a1)
{
  return LMVocabularyGetClassForTokenID() == *(_DWORD *)(a1 + 40);
}

- (id)records
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v4 = [(TIDPRecorder *)self typingSessionAligned];
  id v5 = [v4 alignedEntries];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    uint64_t v28 = *(void *)v37;
    long long v29 = self;
    do
    {
      uint64_t v9 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "originalWord", v28, v29);
        v12 = [v11 editedEntry];
        unsigned int v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v10 originalWord];
        }
        v15 = v14;

        if (![(TIDPBiomeNamedEntityTokenRecorder *)self shouldSkipWordEntry:v15])
        {
          v16 = [v15 acceptedString];
          char v17 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v18 = [v16 componentsSeparatedByCharactersInSet:v17];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v33 != v22) {
                  objc_enumerationMutation(v19);
                }
                int v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                if ([v24 length])
                {
                  v25 = +[TIDPWordRecord word:v24];
                  [v3 addObject:v25];
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v21);
          }

          uint64_t v8 = v28;
          self = v29;
          uint64_t v7 = v30;
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v7);
  }

  v26 = (void *)[v3 copy];

  return v26;
}

- (id)surnameRecordingKey
{
  return (id)MEMORY[0x1F410C878](4, a2);
}

- (id)givenNameRecordingKey
{
  return (id)MEMORY[0x1F410C878](3, a2);
}

- (BOOL)shouldSkipWordEntry:(id)a3
{
  id v3 = [a3 acceptedCandidate];
  BOOL v4 = ([v3 sourceMask] & 8) == 0;

  return v4;
}

- (id)delegate
{
  v9.receiver = self;
  v9.super_class = (Class)TIDPBiomeNamedEntityTokenRecorder;
  id v3 = [(TIDPRecorder *)&v9 delegate];

  if (!v3)
  {
    BOOL v4 = objc_alloc_init(TIDPBiomeReportingDelegate);
    v8.receiver = self;
    v8.super_class = (Class)TIDPBiomeNamedEntityTokenRecorder;
    [(TIDPRecorder *)&v8 setDelegate:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)TIDPBiomeNamedEntityTokenRecorder;
  id v5 = [(TIDPRecorder *)&v7 delegate];

  return v5;
}

@end