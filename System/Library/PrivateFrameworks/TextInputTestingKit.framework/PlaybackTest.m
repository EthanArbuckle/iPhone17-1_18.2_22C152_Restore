@interface PlaybackTest
+ (id)loadFromPlaybackFile:(id)a3;
+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4;
+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5;
+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5;
+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4;
+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5;
- (id)expected;
- (id)intended;
@end

@implementation PlaybackTest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expected, 0);
  objc_storeStrong((id *)&self->_intended, 0);
}

- (id)expected
{
  return self->_expected;
}

- (id)intended
{
  return self->_intended;
}

+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  id v16 = 0;
  v7 = [NSString stringWithContentsOfFile:a3 encoding:4 error:&v16];
  id v8 = v16;
  if (v7)
  {
    v9 = [MEMORY[0x263EFF980] array];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__PlaybackTest_loadFromTextInputFile_withCatenation_addWordSpacing___block_invoke;
    v12[3] = &unk_2650502B8;
    BOOL v14 = a4;
    BOOL v15 = a5;
    id v10 = v9;
    id v13 = v10;
    [v7 enumerateLinesUsingBlock:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __68__PlaybackTest_loadFromTextInputFile_withCatenation_addWordSpacing___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a2;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v8 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v8 length])
  {
    v6 = +[PlaybackTest sentenceToTransliteratedPlaybackTest:v8 withCatenation:*(unsigned __int8 *)(a1 + 40) addWordSpacing:*(unsigned __int8 *)(a1 + 41)];
    if (v6) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
  return MEMORY[0x270F9A790]();
}

+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4
{
  id v4 = +[PlaybackTest sentenceToTransliteratedPlaybackTest:a3 withCatenation:a4 addWordSpacing:0];
  if (v4)
  {
    v5 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a3;
  v7 = [v6 componentsSeparatedByString:@"|"];
  id v8 = [v7 objectAtIndex:1];
  v9 = [v7 objectAtIndex:0];
  id v10 = (void *)MEMORY[0x263EFF980];
  v11 = [v8 componentsSeparatedByString:@" "];
  v12 = [v10 arrayWithArray:v11];

  id v13 = (void *)MEMORY[0x263EFF980];
  BOOL v14 = [v9 componentsSeparatedByString:@" "];
  BOOL v15 = [v13 arrayWithArray:v14];

  [v12 removeObjectsInArray:&unk_26F2C9EA0];
  [v15 removeObjectsInArray:&unk_26F2C9EB8];
  if (v5)
  {
    id v16 = [v12 arrayInterspersingSpaceStringsBetweenObjects];
    uint64_t v17 = [v16 mutableCopy];

    v18 = [v15 arrayInterspersingSpaceStringsBetweenObjects];
    uint64_t v19 = [v18 mutableCopy];

    BOOL v15 = (void *)v19;
    v12 = (void *)v17;
  }
  uint64_t v20 = [v15 count];
  if (v20 == [v12 count])
  {
    v62 = v9;
    v57 = v8;
    v58 = v7;
    id v59 = v6;
    v21 = [v12 objectAtIndex:0];
    uint64_t v22 = [v15 objectAtIndex:0];
    if ((unint64_t)[v12 count] >= 2 && objc_msgSend(v21, "length") == 1)
    {
      if ([v21 caseInsensitiveCompare:v22])
      {
        v23 = [v12 objectAtIndex:1];
        v24 = [v15 objectAtIndex:1];
        uint64_t v25 = [v23 caseInsensitiveCompare:v24];

        if (v25)
        {
          v26 = [MEMORY[0x263F089D8] stringWithString:v21];
          v27 = [v12 objectAtIndex:1];
          [v26 appendString:v27];

          v28 = [MEMORY[0x263F089D8] stringWithString:v22];
          v29 = [v15 objectAtIndex:1];
          [v28 appendString:v29];

          [v12 replaceObjectAtIndex:0 withObject:v26];
          [v12 removeObjectAtIndex:1];
          [v15 replaceObjectAtIndex:0 withObject:v28];
          [v15 removeObjectAtIndex:1];
        }
      }
    }
    v60 = (void *)v22;
    v61 = v21;
    if ([v12 count])
    {
      unint64_t v30 = 0;
      unint64_t v31 = 0x263F08000uLL;
      do
      {
        v32 = [v12 objectAtIndex:v30];
        v33 = [v15 objectAtIndex:v30];
        uint64_t v34 = [v32 length] - 1;
        uint64_t v35 = [v33 length];
        if (v34 >= 1)
        {
          uint64_t v36 = v35;
          v37 = [*(id *)(v31 + 1800) punctuationCharacterSet];
          if (objc_msgSend(v37, "characterIsMember:", objc_msgSend(v32, "characterAtIndex:", v34)))
          {
            uint64_t v38 = v36 - 1;
            v39 = [*(id *)(v31 + 1800) punctuationCharacterSet];
            int v40 = objc_msgSend(v39, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", v38));

            if (!v40)
            {
              unint64_t v31 = 0x263F08000;
              goto LABEL_17;
            }
            v37 = [v32 substringToIndex:v34];
            v41 = [v32 substringFromIndex:v34];
            v42 = [v33 substringToIndex:v38];
            v43 = [v33 substringFromIndex:v38];
            [v12 replaceObjectAtIndex:v30 withObject:v41];
            [v12 insertObject:v37 atIndex:v30];
            [v15 replaceObjectAtIndex:v30 withObject:v43];
            [v15 insertObject:v42 atIndex:v30++];

            unint64_t v31 = 0x263F08000;
          }
        }
LABEL_17:

        ++v30;
      }
      while (v30 < [v12 count]);
    }
    if (a4)
    {
      v44 = [MEMORY[0x263EFF980] array];
      v45 = [MEMORY[0x263EFF980] array];
      if ([v12 count])
      {
        unint64_t v46 = 0;
        BOOL v47 = 0;
        do
        {
          v48 = [v12 objectAtIndex:v46];
          v49 = [v15 objectAtIndex:v46];
          uint64_t v50 = [v48 caseInsensitiveCompare:v49];
          BOOL v51 = v50 != 0;
          if (v50)
          {
            if (v47)
            {
              v52 = [v44 lastObject];
              [v52 appendString:v48];

              v53 = [v45 lastObject];
              [v53 appendString:v49];
            }
            else
            {
              v54 = [MEMORY[0x263F089D8] stringWithString:v48];
              [v44 addObject:v54];

              v53 = [MEMORY[0x263F089D8] stringWithString:v49];
              [v45 addObject:v53];
            }
          }
          else
          {
            [v44 addObject:v48];
            [v45 addObject:v49];
          }

          ++v46;
          BOOL v47 = v51;
        }
        while (v46 < [v12 count]);
      }

      BOOL v15 = v45;
      v12 = v44;
    }
    else
    {
      v45 = v15;
      v44 = v12;
    }
    v7 = v58;
    id v6 = v59;
    id v8 = v57;
    v55 = +[PlaybackTest testsWithIntendedOutput:v45 expectedOutput:v44];

    v9 = v62;
  }
  else
  {
    NSLog(&cfstr_Transliteratio_2.isa, v6);
    v55 = 0;
  }

  return v55;
}

+ (id)loadFromPlaybackFile:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[TTKTestCaseReader loadFromPath:v3];
  if (v4)
  {
    id v24 = v3;
    id v27 = [MEMORY[0x263EFF980] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = v4;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v9 = [MEMORY[0x263EFF980] array];
          id v10 = [MEMORY[0x263EFF980] array];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v11 = [v8 records];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                uint64_t v17 = [v16 inputText];
                [v9 addObject:v17];

                v18 = [v16 primaryIntendedText];
                [v10 addObject:v18];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v13);
          }

          uint64_t v19 = (void *)[v9 copy];
          uint64_t v20 = (void *)[v10 copy];
          v21 = +[PlaybackTest testsWithIntendedOutput:v19 expectedOutput:v20];

          [v27 addObject:v21];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v6);
    }

    id v4 = v23;
    id v3 = v24;
  }
  else
  {
    NSLog(&cfstr_InputPathForPl.isa, v3);
    id v27 = 0;
  }

  return v27;
}

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4
{
  return (id)[a1 testsWithIntendedOutput:a3 expectedOutput:a4 corpusId:0];
}

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(PlaybackTest);
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intended, a3);
    objc_storeStrong((id *)&v10->_expected, a4);
    uint64_t v11 = [v7 componentsJoinedByString:&stru_26F2B7E50];
    input = v10->super._input;
    v10->super._input = (NSString *)v11;
  }
  return v10;
}

@end