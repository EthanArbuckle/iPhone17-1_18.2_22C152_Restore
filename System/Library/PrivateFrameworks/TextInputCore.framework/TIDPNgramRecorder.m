@interface TIDPNgramRecorder
+ (void)enumerateNgramsFromSession:(id)a3 n:(unint64_t)a4 usingBlock:(id)a5;
- (BOOL)report;
- (BOOL)shouldDonateNgramSampleRandomly;
- (TIDPNgramRecorder)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5 shouldDonateNgramSampleRandomly:(BOOL)a6;
- (id)_normalizedWordEntryStringForWordEntry:(id)a3;
- (id)delegate;
- (id)randomRecords;
- (id)randomRecordsLimitedByCount:(unint64_t)a3;
- (id)recordingKey;
- (id)records;
- (void)setShouldDonateNgramSampleRandomly:(BOOL)a3;
@end

@implementation TIDPNgramRecorder

- (void)setShouldDonateNgramSampleRandomly:(BOOL)a3
{
  self->_shouldDonateNgramSampleRandomly = a3;
}

- (BOOL)shouldDonateNgramSampleRandomly
{
  return self->_shouldDonateNgramSampleRandomly;
}

- (id)_normalizedWordEntryStringForWordEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 originalWord];
  LOBYTE(self) = [(TIDPRecorder *)self isWordEntryReallyOOV:v5 caseSensitive:0];

  if (self)
  {
    v6 = @"u_token";
  }
  else
  {
    v7 = [v4 originalWord];
    v8 = [v7 acceptedString];

    v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v10 = [v8 stringByTrimmingCharactersInSet:v9];
    v6 = [v10 lowercaseString];
  }

  return v6;
}

- (BOOL)report
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E4E7C3D0](self, a2);
  v36 = self;
  if ([(TIDPNgramRecorder *)self shouldDonateNgramSampleRandomly]) {
    [(TIDPNgramRecorder *)self randomRecords];
  }
  else {
  v3 = [(TIDPNgramRecorder *)self records];
  }
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v50;
    do
    {
      uint64_t v8 = 0;
      v9 = v6;
      do
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v49 + 1) + 8 * v8);
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v56 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v46 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v45 + 1) + 8 * i) codedWord];
              if (v17) {
                [v11 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v56 count:16];
          }
          while (v14);
        }

        v18 = [v12 firstObject];
        v6 = [v18 coderVersion];

        [v40 addObject:v11];
        ++v8;
        v9 = v6;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v19 = (void *)[v40 copy];
  uint64_t v20 = [v19 count];
  if (v20)
  {
    uint64_t v34 = v20;
    v35 = v19;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obja = v19;
    uint64_t v21 = [obja countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(obja);
          }
          uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          uint64_t v26 = objc_msgSend(v6, "UUIDString", v34, v35);
          v27 = (void *)v26;
          v28 = @"UNKNOWN_VERSION";
          if (v26) {
            v28 = (__CFString *)v26;
          }
          v29 = v28;

          v30 = [(TIDPNgramRecorder *)v36 delegate];
          v53 = @"VersionHash";
          v54 = v29;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          [v30 record:v25 metadata:v31];
        }
        uint64_t v22 = [obja countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v22);
    }

    uint64_t v20 = v34;
    v19 = v35;
  }
  BOOL v32 = v20 != 0;

  return v32;
}

- (id)randomRecordsLimitedByCount:(unint64_t)a3
{
  uint64_t v5 = [(TIDPNgramRecorder *)self records];
  if ([v5 count] <= a3)
  {
    id v15 = v5;
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:a3];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    uint64_t v8 = [(TIDPNgramRecorder *)self records];
    uint32_t v9 = [v8 count];

    while ([v6 count] < a3)
    {
      unint64_t v10 = arc4random_uniform(v9);
      id v11 = [NSNumber numberWithInteger:v10];
      char v12 = [v6 containsObject:v11];

      if ((v12 & 1) == 0 && [v5 count] >= v10)
      {
        uint64_t v13 = [v5 objectAtIndex:v10];
        [v7 addObject:v13];
        uint64_t v14 = [NSNumber numberWithInteger:v10];
        [v6 addObject:v14];
      }
    }
    id v15 = (id)[v7 copy];
  }

  return v15;
}

- (id)randomRecords
{
  return [(TIDPNgramRecorder *)self randomRecordsLimitedByCount:1];
}

- (id)records
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(TIDPRecorder *)self wordCoder];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = objc_opt_class();
    v6 = [(TIDPRecorder *)self typingSessionAligned];
    unint64_t v7 = [(TIDPNgramRecorderCascading *)self n];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __28__TIDPNgramRecorder_records__block_invoke;
    id v15 = &unk_1E6E2DD70;
    v16 = self;
    id v17 = v4;
    id v8 = v4;
    [v5 enumerateNgramsFromSession:v6 n:v7 usingBlock:&v12];

    uint32_t v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15, v16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
      *(_DWORD *)buf = 136315394;
      v19 = "-[TIDPNgramRecorder records]";
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  Not recording n-grams for locale '%@' because a valid word coder could not be loaded.", buf, 0x16u);
    }
    uint32_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

void __28__TIDPNgramRecorder_records__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint32_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        if ([v9 isStandaloneString])
        {
          unint64_t v10 = [v9 wordString];
        }
        else
        {
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = [v9 wordEntryAligned];
          unint64_t v10 = [v11 _normalizedWordEntryStringForWordEntry:v12];
        }
        ++v8;
        uint64_t v13 = [NSNumber numberWithUnsignedInteger:v6 + v8];
        uint64_t v14 = [*(id *)(a1 + 32) wordCoder];
        id v15 = +[TIDPWordRecord word:v10 atPosition:v13 coder:v14];

        [v17 addObject:v15];
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      v6 += v8;
    }
    while (v5);
  }

  [*(id *)(a1 + 40) addObject:v17];
}

- (id)delegate
{
  v11.receiver = self;
  v11.super_class = (Class)TIDPNgramRecorder;
  id v3 = [(TIDPRecorder *)&v11 delegate];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5F480]);
    uint64_t v5 = [(TIDPNgramRecorder *)self recordingKey];
    uint64_t v6 = (void *)[v4 initWithKey:v5];

    v10.receiver = self;
    v10.super_class = (Class)TIDPNgramRecorder;
    [(TIDPRecorder *)&v10 setDelegate:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)TIDPNgramRecorder;
  uint64_t v7 = [(TIDPRecorder *)&v9 delegate];

  return v7;
}

- (id)recordingKey
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.TextInput.WordNgrams.%lu.", -[TIDPNgramRecorderCascading n](self, "n"));
  id v4 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
  uint64_t v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (TIDPNgramRecorder)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5 shouldDonateNgramSampleRandomly:(BOOL)a6
{
  BOOL v6 = a6;
  v10.receiver = self;
  v10.super_class = (Class)TIDPNgramRecorder;
  uint64_t v7 = [(TIDPNgramRecorderCascading *)&v10 initWithTypingSession:a3 aligned:a4 n:a5];
  uint64_t v8 = v7;
  if (v7) {
    [(TIDPNgramRecorder *)v7 setShouldDonateNgramSampleRandomly:v6];
  }
  return v8;
}

+ (void)enumerateNgramsFromSession:(id)a3 n:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, unsigned char *))a5;
  objc_super v9 = [v7 alignedEntries];
  uint64_t v10 = [v9 count];

  if (v10 && v10 + 2 >= a4)
  {
    unint64_t v29 = a4;
    objc_super v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    uint64_t v12 = [[TIDPNgramWordEntryPair alloc] initWithWordString:@"<s>"];
    [v11 addObject:v12];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v30 = v7;
    uint64_t v13 = [v7 alignedEntries];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v19 = [v18 originalWord];
          long long v20 = [v19 acceptedString];

          if (v20)
          {
            long long v21 = [[TIDPNgramWordEntryPair alloc] initWithWordString:v20 wordEntryAligned:v18];
            [v11 addObject:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }

    uint64_t v22 = [[TIDPNgramWordEntryPair alloc] initWithWordString:@"</s>"];
    [v11 addObject:v22];

    unint64_t v23 = [v11 count];
    if (v23 < a4) {
      a4 = v23;
    }
    char v31 = 0;
    [v11 count];
    unint64_t v24 = 0;
    uint64_t v25 = 0;
    do
    {
      uint64_t v26 = v25;
      uint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v29];

      if (a4)
      {
        unint64_t v27 = 0;
        do
        {
          if (v27 >= [v11 count] - 1) {
            break;
          }
          v28 = [v11 objectAtIndexedSubscript:v24 + v27];
          [v25 addObject:v28];

          ++v27;
        }
        while (a4 != v27);
      }
      v8[2](v8, v25, &v31);
      ++v24;
    }
    while (v24 <= [v11 count] - a4 && !v31);

    id v7 = v30;
  }
}

@end