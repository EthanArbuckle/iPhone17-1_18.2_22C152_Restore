@interface TIDPBiomeUnigramTokenRecorder
- (BOOL)report;
- (id)delegate;
- (id)recordingKey;
- (id)records;
@end

@implementation TIDPBiomeUnigramTokenRecorder

- (BOOL)report
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E4E7C3D0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(TIDPBiomeUnigramTokenRecorder *)self records];
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
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
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
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v14 = [v3 count];
  if (v14)
  {
    v15 = [(TIDPBiomeUnigramTokenRecorder *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(TIDPBiomeUnigramTokenRecorder *)self delegate];
      v18 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
      v19 = [(TIDPBiomeUnigramTokenRecorder *)self recordingKey];
      [v17 recordTokenFrequency:v3 withLocale:v18 withTokenType:v19];
    }
  }

  return v14 != 0;
}

- (id)records
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v4 = [(TIDPRecorder *)self typingSessionAligned];
  uint64_t v5 = [v4 alignedEntries];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v63;
    v9 = off_1E6E28000;
    uint64_t v48 = *(void *)v63;
    v49 = v5;
    do
    {
      uint64_t v10 = 0;
      uint64_t v50 = v7;
      do
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v62 + 1) + 8 * v10);
        v12 = [v11 originalWord];
        v13 = [v12 editedEntry];
        uint64_t v14 = v13;
        uint64_t v55 = v10;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v11 originalWord];
        }
        char v16 = v15;

        id v17 = v16;
        v18 = [v17 acceptedString];
        uint64_t v19 = [v18 length];

        v20 = v17;
        if (v19)
        {
          v21 = [v17 acceptedString];
          char v22 = [v21 _containsEmoji];

          v20 = v17;
          if ((v22 & 1) == 0)
          {
            long long v23 = [v17 keyboardState];
            long long v24 = [v23 textInputTraits];
            v54 = v17;
            uint64_t v25 = [v24 autocorrectionType];

            BOOL v26 = v25 == 1;
            id v17 = v54;
            if (v26) {
              goto LABEL_30;
            }
            uint64_t v27 = [v54 acceptedString];
            __int16 v61 = 8217;
            uint64_t v28 = [NSString stringWithCharacters:&v61 length:1];
            [v27 rangeOfString:v28];
            v52 = (void *)v28;
            if (v29)
            {
              uint64_t v30 = [v27 stringByReplacingOccurrencesOfString:v28 withString:@"'"];

              uint64_t v27 = (void *)v30;
            }
            v31 = [MEMORY[0x1E4F28E58] punctuationCharacterSet];
            [v31 removeCharactersInString:@"'-"];
            v51 = v31;
            v32 = [v27 stringByTrimmingCharactersInSet:v31];

            v53 = v32;
            if ([v32 length])
            {
              v33 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              v34 = [v32 componentsSeparatedByCharactersInSet:v33];

              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              id obj = v34;
              uint64_t v35 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v58;
                do
                {
                  for (uint64_t i = 0; i != v36; ++i)
                  {
                    if (*(void *)v58 != v37) {
                      objc_enumerationMutation(obj);
                    }
                    v39 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                    if ([v39 length])
                    {
                      id v40 = objc_alloc_init(v9[98]);
                      [v40 setAcceptedString:v39];
                      if ([(TIDPRecorder *)self isWordEntryReallyOOV:v40 caseSensitive:1])
                      {
                        [v39 lowercaseString];
                        v41 = self;
                        id v42 = v3;
                        v44 = v43 = v9;
                        v45 = +[TIDPWordRecord word:v44];

                        v9 = v43;
                        id v3 = v42;
                        self = v41;
                      }
                      else
                      {
                        v45 = +[TIDPWordRecord word:v39];
                      }
                      [v3 addObject:v45];
                    }
                  }
                  uint64_t v36 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
                }
                while (v36);
              }

              uint64_t v5 = v49;
              uint64_t v7 = v50;
              uint64_t v8 = v48;
              id v17 = v54;
            }

            v20 = v53;
          }
        }

LABEL_30:
        uint64_t v10 = v55 + 1;
      }
      while (v55 + 1 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v7);
  }

  v46 = (void *)[v3 copy];

  return v46;
}

- (id)recordingKey
{
  return (id)MEMORY[0x1F410C878](1, a2);
}

- (id)delegate
{
  v9.receiver = self;
  v9.super_class = (Class)TIDPBiomeUnigramTokenRecorder;
  id v3 = [(TIDPRecorder *)&v9 delegate];

  if (!v3)
  {
    v4 = objc_alloc_init(TIDPBiomeReportingDelegate);
    v8.receiver = self;
    v8.super_class = (Class)TIDPBiomeUnigramTokenRecorder;
    [(TIDPRecorder *)&v8 setDelegate:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)TIDPBiomeUnigramTokenRecorder;
  uint64_t v5 = [(TIDPRecorder *)&v7 delegate];

  return v5;
}

@end