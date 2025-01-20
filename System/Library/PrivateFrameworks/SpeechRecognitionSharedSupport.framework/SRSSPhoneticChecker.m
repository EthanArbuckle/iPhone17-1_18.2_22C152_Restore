@interface SRSSPhoneticChecker
- (BOOL)_loadConfusionMatrixFromJsonFile:(id)a3;
- (BOOL)_loadConfusionMatrixWithModelPath:(id)a3 localization:(id)a4;
- (PhoneticLexiconEntry)copyLexiconEntriesForString:(id)a3;
- (SRSSPhoneticChecker)initWithLocaleIdentifier:(id)a3 modelPath:(id)a4;
- (SRSSPhoneticChecker)initWithLocaleIdentifier:(id)a3 modelPath:(id)a4 syncronously:(BOOL)a5;
- (id)_partitionEntriesWithCount:(unint64_t)a3 partitionCount:(unint64_t)a4;
- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4;
- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6;
- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6 maxThreads:(unint64_t)a7;
- (id)phoneDescription:(PhoneSequence *)a3;
- (unsigned)_phoneForString:(id)a3;
- (void)_freeLexicon;
- (void)_freeLexiconEntry:(PhoneticLexiconEntry *)a3;
- (void)_loadLexiconWithModelPath:(id)a3 localization:(id)a4;
- (void)_waitOnLexiconLoad;
- (void)dealloc;
@end

@implementation SRSSPhoneticChecker

- (SRSSPhoneticChecker)initWithLocaleIdentifier:(id)a3 modelPath:(id)a4
{
  return [(SRSSPhoneticChecker *)self initWithLocaleIdentifier:a3 modelPath:a4 syncronously:0];
}

- (SRSSPhoneticChecker)initWithLocaleIdentifier:(id)a3 modelPath:(id)a4 syncronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SRSSPhoneticChecker;
  v11 = [(SRSSPhoneticChecker *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_localeIdentifier, a3);
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    phoneIds = v12->_phoneIds;
    v12->_phoneIds = (NSDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    lexiconWords = v12->_lexiconWords;
    v12->_lexiconWords = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    lexiconEntries = v12->_lexiconEntries;
    v12->_lexiconEntries = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x263EFF980] array];
    regionsToFree = v12->_regionsToFree;
    v12->_regionsToFree = (NSMutableArray *)v19;

    if ([(SRSSPhoneticChecker *)v12 _loadConfusionMatrixWithModelPath:v10 localization:v9])
    {
      v12->_lexiconLoaded = 0;
      if (v5)
      {
        [(SRSSPhoneticChecker *)v12 _loadLexiconWithModelPath:v10 localization:v9];
      }
      else
      {
        v21 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__SRSSPhoneticChecker_initWithLocaleIdentifier_modelPath_syncronously___block_invoke;
        block[3] = &unk_265520110;
        v24 = v12;
        id v25 = v10;
        id v26 = v9;
        dispatch_async(v21, block);
      }
    }
    else
    {
      v12->_lexiconLoaded = 1;
    }
  }

  return v12;
}

void __71__SRSSPhoneticChecker_initWithLocaleIdentifier_modelPath_syncronously___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2611D30E0]();
  [*(id *)(a1 + 32) _loadLexiconWithModelPath:*(void *)(a1 + 40) localization:*(void *)(a1 + 48)];
}

- (void)dealloc
{
  [(SRSSPhoneticChecker *)self _freeLexicon];
  v3.receiver = self;
  v3.super_class = (Class)SRSSPhoneticChecker;
  [(SRSSPhoneticChecker *)&v3 dealloc];
}

- (void)_freeLexicon
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  lexiconEntries = self->_lexiconEntries;
  self->_lexiconEntries = 0;

  lexiconWords = self->_lexiconWords;
  self->_lexiconWords = 0;

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v5 = self->_regionsToFree;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        free(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "pointerValue", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_freeLexiconEntry:(PhoneticLexiconEntry *)a3
{
  if (a3->var1)
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = a3->var0[v4];
      free(v5->var1);
      free(v5);
      ++v4;
    }
    while (v4 < a3->var1);
  }
  free(a3->var0);
  free(a3);
}

- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4
{
  unint64_t v4 = [(SRSSPhoneticChecker *)self guessesForString:a3 maxResults:a4 phoneticWeight:10 priorWeight:1.0 maxThreads:0.5];
  return v4;
}

- (PhoneticLexiconEntry)copyLexiconEntriesForString:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v34 = a3;
  unint64_t v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v35 = [v34 componentsSeparatedByCharactersInSet:v4];

  v44 = [MEMORY[0x263EFF980] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v35;
  uint64_t v37 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v6 = [(NSMutableArray *)self->_lexiconWords indexOfObject:v5];
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = [(_EARUserProfileBuilder *)self->_builder pronunciationsForOrthography:v5];
          if ([v39 count])
          {
            v47 = malloc_type_malloc(0x14uLL, 0x10800401F59AC77uLL);
            unsigned __int8 v7 = [v39 count];
            v47[8] = v7;
            *(void *)v47 = malloc_type_malloc(8 * v7, 0x2004093837F09uLL);
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v41 = v39;
            uint64_t v8 = [v41 countByEnumeratingWithState:&v58 objects:v68 count:16];
            if (v8)
            {
              LODWORD(v48) = 0;
              id v42 = *(id *)v59;
              do
              {
                uint64_t v45 = v8;
                uint64_t v9 = 0;
                uint64_t v48 = (int)v48;
                do
                {
                  if (*(id *)v59 != v42) {
                    objc_enumerationMutation(v41);
                  }
                  long long v10 = *(void **)(*((void *)&v58 + 1) + 8 * v9);
                  long long v11 = malloc_type_malloc(0x10uLL, 0x101004032DCA59EuLL);
                  *(void *)(*(void *)v47 + 8 * v48) = v11;
                  long long v12 = [MEMORY[0x263EFF980] array];
                  uint64_t v13 = [v10 componentsSeparatedByString:@"."];
                  long long v56 = 0u;
                  long long v57 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  id v14 = v13;
                  uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v67 count:16];
                  if (v15)
                  {
                    uint64_t v16 = *(void *)v55;
                    do
                    {
                      for (uint64_t j = 0; j != v15; ++j)
                      {
                        if (*(void *)v55 != v16) {
                          objc_enumerationMutation(v14);
                        }
                        v18 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", *(void *)(*((void *)&v54 + 1) + 8 * j)));
                        [v12 addObject:v18];
                      }
                      uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v67 count:16];
                    }
                    while (v15);
                  }

                  size_t v19 = [v12 count];
                  *(unsigned char *)long long v11 = v19;
                  v11[1] = malloc_type_malloc(v19, 0x100004077774924uLL);
                  if (v19)
                  {
                    for (uint64_t k = 0; k != v19; ++k)
                    {
                      v21 = [v12 objectAtIndexedSubscript:k];
                      *(unsigned char *)(v11[1] + k) = [v21 intValue];
                    }
                  }
                  v22 = [MEMORY[0x263F08D40] valueWithPointer:v47];
                  [v44 addObject:v22];

                  ++v48;
                  ++v9;
                }
                while (v9 != v45);
                uint64_t v8 = [v41 countByEnumeratingWithState:&v58 objects:v68 count:16];
              }
              while (v8);
            }
          }
          else
          {
            id v41 = v39;
          }
        }
        else
        {
          id v41 = [(NSMutableArray *)self->_lexiconEntries objectAtIndex:v6];
          objc_msgSend(v44, "addObject:");
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v37);
  }

  v49 = [MEMORY[0x263EFF980] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v43 = v44;
  uint64_t v23 = [v43 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v23)
  {
    unint64_t v46 = 0;
    uint64_t v24 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v51 != v24) {
          objc_enumerationMutation(v43);
        }
        uint64_t v26 = [*(id *)(*((void *)&v50 + 1) + 8 * m) pointerValue];
        unint64_t v27 = v46 * *(unsigned __int8 *)(v26 + 8);
        unint64_t v28 = 8 / v46;
        if (v27 < 9) {
          unint64_t v28 = *(unsigned __int8 *)(v26 + 8);
        }
        else {
          unint64_t v27 = 8 / v46 * v46;
        }
        if (v46)
        {
          unint64_t v29 = v28;
        }
        else
        {
          unint64_t v27 = *(unsigned __int8 *)(v26 + 8);
          unint64_t v29 = v27;
        }
        if (v27 >= 8) {
          uint64_t v30 = 8;
        }
        else {
          uint64_t v30 = v27;
        }
        v31 = [NSNumber numberWithUnsignedInteger:v29];
        [v49 addObject:v31];
        unint64_t v46 = v30;
      }
      uint64_t v23 = [v43 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v23);
  }
  else
  {
    unint64_t v46 = 0;
  }

  v32 = (PhoneticLexiconEntry *)malloc_type_malloc(0x14uLL, 0x10800401F59AC77uLL);
  v32->var1 = v46;
  v32->var0 = (PhoneSequence **)malloc_type_malloc(8 * v46, 0x80040B8603338uLL);

  return v32;
}

- (id)_partitionEntriesWithCount:(unint64_t)a3 partitionCount:(unint64_t)a4
{
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  if (a4)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = a3 / a4;
    unint64_t v10 = a3 % a4 + a3 / a4;
    do
    {
      if (v7) {
        unint64_t v11 = v9;
      }
      else {
        unint64_t v11 = v10;
      }
      long long v12 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v8, v11);
      [v6 addObject:v12];
      v8 += v11;

      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

- (id)phoneDescription:(PhoneSequence *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3->var0)
  {
    unint64_t v5 = 0;
    uint64_t v6 = &stru_270B0E880;
    do
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      obuint64_t j = [(NSDictionary *)self->_phoneIds allKeys];
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            unint64_t v11 = [(NSDictionary *)self->_phoneIds objectForKeyedSubscript:v10];
            if ([v11 intValue] == a3->var1[v5])
            {
              long long v12 = [(__CFString *)v6 stringByAppendingString:v10];

              uint64_t v13 = [v12 stringByAppendingString:@"."];

              uint64_t v6 = (__CFString *)v13;
            }
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v7);
      }

      ++v5;
    }
    while (v5 < a3->var0);
  }
  else
  {
    uint64_t v6 = &stru_270B0E880;
  }
  NSLog(&stru_270B0E8A0.isa, v6);
  return v6;
}

- (void)_waitOnLexiconLoad
{
  while (!self->_lexiconLoaded)
    usleep(0x3E8u);
}

- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6
{
  uint64_t v6 = [(SRSSPhoneticChecker *)self guessesForString:a3 maxResults:a4 phoneticWeight:8 priorWeight:a5 maxThreads:a6];
  return v6;
}

- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6 maxThreads:(unint64_t)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v31 = a3;
  [(SRSSPhoneticChecker *)self _waitOnLexiconLoad];
  if ((unint64_t)[(NSMutableArray *)self->_lexiconEntries count] >= 0x3E8)
  {
    unint64_t v28 = [(SRSSPhoneticChecker *)self copyLexiconEntriesForString:v31];
    group = dispatch_group_create();
    uint64_t v30 = [MEMORY[0x263EFF980] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v13 = [(SRSSPhoneticChecker *)self _partitionEntriesWithCount:[(NSMutableArray *)self->_lexiconEntries count] partitionCount:a7];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
    unint64_t v27 = self;
    if (v14)
    {
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v13);
          }
          unint64_t v17 = a4;
          uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          long long v19 = [MEMORY[0x263EFF980] array];
          v20 = v13;
          [v30 addObject:v19];
          uint64_t v21 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke;
          block[3] = &unk_265520180;
          void block[4] = v18;
          block[5] = v27;
          double v36 = a5;
          double v37 = a6;
          v35 = v28;
          id v33 = v19;
          a4 = v17;
          unint64_t v38 = v17;
          id v34 = v31;
          id v22 = v19;
          dispatch_group_async(group, v21, block);

          uint64_t v13 = v20;
        }
        uint64_t v14 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v14);
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    [(SRSSPhoneticChecker *)v27 _freeLexiconEntry:v28];
    uint64_t v23 = [v30 valueForKeyPath:@"@unionOfArrays.self"];
    long long v12 = [v23 sortedArrayUsingComparator:&__block_literal_global_55];

    if ([v12 count] > a4)
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, a4);
      uint64_t v25 = [v12 objectsAtIndexes:v24];

      long long v12 = (void *)v25;
    }
  }
  else
  {
    long long v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

void __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke(uint64_t a1)
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_2;
  v7[3] = &unk_265520158;
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v10 = v14;
  uint64_t v11 = v2;
  long long v12 = *(_OWORD *)(a1 + 72);
  objc_super v3 = *(void **)(a1 + 32);
  unint64_t v4 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 88);
  id v8 = v5;
  uint64_t v13 = v6;
  id v9 = *(id *)(a1 + 56);
  [v3 enumerateIndexesUsingBlock:v7];

  _Block_object_dispose(v14, 8);
}

void __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  id v58 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a2];
  long long v57 = [*(id *)(*(void *)(v3 + 32) + 24) objectAtIndexedSubscript:a2];
  uint64_t v4 = [v57 pointerValue];
  uint64_t v5 = *(void *)(v3 + 64);
  if (v5)
  {
    uint64_t v6 = v4;
    unint64_t v7 = 0;
    long double v8 = 0.0;
    double v9 = 1.79769313e308;
    double v10 = 0.0;
    uint64_t v59 = v4;
    uint64_t v60 = v3;
    do
    {
      if (v7 >= *(unsigned __int8 *)(v5 + 8)) {
        break;
      }
      if (*(unsigned char *)(v6 + 8))
      {
        uint64_t v11 = 0;
        unint64_t v61 = v7;
        long long v62 = *(unsigned char **)(*(void *)v5 + 8 * v7);
        do
        {
          uint64_t v63 = v11;
          long long v12 = *(unsigned __int8 **)(*(void *)v6 + 8 * v11);
          uint64_t v13 = *(void *)(*(void *)(v3 + 32) + 48);
          uint64_t v64 = *(void *)(*(void *)(v3 + 32) + 40);
          unint64_t v14 = *v62;
          unint64_t v15 = *v12;
          if (v14 <= v15) {
            uint64_t v16 = *v12;
          }
          else {
            uint64_t v16 = *v62;
          }
          if (v14 <= v15) {
            unint64_t v17 = v12;
          }
          else {
            unint64_t v17 = v62;
          }
          if (v14 >= v15) {
            int v18 = *v12;
          }
          else {
            int v18 = *v62;
          }
          if (v14 <= v15) {
            long long v12 = v62;
          }
          long long v19 = (unsigned __int8 *)*((void *)v12 + 1);
          v20 = (unsigned __int8 *)*((void *)v17 + 1);
          uint64_t v21 = (v18 + 1);
          id v22 = (double *)malloc_type_malloc((8 * (v21 + v21 * v16)), 0x100004000313F17uLL);
          bzero(v22, (8 * (v21 + v21 * v16)));
          if (v18)
          {
            if (v15 >= v14) {
              unint64_t v23 = v14;
            }
            else {
              unint64_t v23 = v15;
            }
            uint64_t v24 = v19;
            uint64_t v25 = v22;
            do
            {
              unsigned int v26 = *v24++;
              double v27 = *v25 + *(double *)(v13 + 8 * v64 * (unint64_t)v26);
              v25 += v16;
              *uint64_t v25 = v27;
              --v23;
            }
            while (v23);
          }
          if (v16)
          {
            unint64_t v28 = v22 + 1;
            double v29 = *v22;
            if (v15 <= v14) {
              unint64_t v30 = v14;
            }
            else {
              unint64_t v30 = v15;
            }
            id v31 = v20;
            do
            {
              unsigned int v32 = *v31++;
              double v29 = v29 + *(double *)(v13 + 8 * v32);
              *v28++ = v29;
              --v30;
            }
            while (v30);
          }
          if (v18)
          {
            uint64_t v33 = v16;
            id v34 = v22;
            uint64_t v35 = 1;
            do
            {
              double v36 = v34;
              double v37 = v20;
              uint64_t v38 = v16;
              long long v39 = v34;
              do
              {
                unsigned int v40 = *v37++;
                unsigned int v41 = v64 * v19[v35 - 1];
                double v42 = *(double *)(v13 + 8 * v41);
                double v43 = *(double *)(v13 + 8 * v40);
                unsigned int v44 = v41 + v40;
                double v45 = v39[1];
                ++v39;
                double v46 = v42 + v45;
                double v47 = v43 + v36[v16];
                if (v46 >= v47) {
                  double v46 = v47;
                }
                if (*(double *)(v13 + 8 * v44) + *v36 < v46) {
                  double v46 = *(double *)(v13 + 8 * v44) + *v36;
                }
                v36[v33 + 1] = v46;
                double v36 = v39;
                --v38;
              }
              while (v38);
              ++v35;
              id v34 = (double *)((char *)v34 + v33 * 8);
            }
            while (v35 != v21);
          }
          double v48 = v22[(v21 * v16)];
          free(v22);
          if (v48 >= 100.0)
          {
            uint64_t v6 = v59;
            uint64_t v3 = v60;
          }
          else
          {
            if (v48 < v9) {
              double v9 = v48;
            }
            uint64_t v6 = v59;
            uint64_t v3 = v60;
            long double v8 = *(double *)(v59 + 12);
            double v49 = v48 * *(double *)(v60 + 72);
            long double v50 = log(v8);
            double v51 = *(double *)(v60 + 80);
            long double v52 = -(v49 + -v50 * v51);
            LOBYTE(v51) = *v62;
            double v53 = exp(v52 / (double)*(unint64_t *)&v51);
            if (v53 > v10) {
              double v10 = v53;
            }
          }
          unint64_t v7 = v61;
          uint64_t v11 = v63 + 1;
        }
        while (v63 + 1 < (unint64_t)*(unsigned __int8 *)(v6 + 8));
        uint64_t v5 = *(void *)(v3 + 64);
      }
      ++v7;
    }
    while (v5);
    if (v9 < 100.0
      && (v10 > *(double *)(*(void *)(*(void *)(v3 + 56) + 8) + 24)
       || (unint64_t)[*(id *)(v3 + 40) count] < *(void *)(v3 + 88))
      && [v58 compare:*(void *)(v3 + 48)])
    {
      long long v54 = objc_opt_new();
      [v54 setScore:v10];
      [v54 setText:v58];
      [v54 setPrior:(double)v8];
      [v54 setPhoneticSimilarity:v9];
      [*(id *)(v3 + 40) addObject:v54];
      if ((unint64_t)[*(id *)(v3 + 40) count] > *(void *)(v3 + 88))
      {
        [*(id *)(v3 + 40) sortUsingComparator:&__block_literal_global];
        [*(id *)(v3 + 40) removeLastObject];
      }
      long long v55 = [*(id *)(v3 + 40) lastObject];
      [v55 score];
      *(void *)(*(void *)(*(void *)(v3 + 56) + 8) + 24) = v56;
    }
  }
}

uint64_t __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  double v7 = v6;
  [v5 score];
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 score];
    double v11 = v10;
    [v5 score];
    if (v11 < v12) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

uint64_t __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  double v7 = v6;
  [v5 score];
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 score];
    double v11 = v10;
    [v5 score];
    if (v11 < v12) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

- (unsigned)_phoneForString:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_phoneIds objectForKey:v4];
  double v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 intValue];
  }
  else
  {
    phoneIds = self->_phoneIds;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSDictionary count](phoneIds, "count"));
    [(NSDictionary *)phoneIds setValue:v9 forKey:v4];

    double v10 = [(NSDictionary *)self->_phoneIds objectForKey:v4];
    unsigned __int8 v7 = [v10 intValue];
    double v6 = v10;
  }

  return v7;
}

- (BOOL)_loadConfusionMatrixWithModelPath:(id)a3 localization:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v21 = a4;
  double v6 = NSURL;
  uint64_t v24 = v5;
  v30[0] = v5;
  v30[1] = @"mini.json";
  unsigned __int8 v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  uint64_t v25 = [v6 fileURLWithPathComponents:v7];

  id v29 = 0;
  unint64_t v23 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v25 options:0 error:&v29];
  id v22 = v29;
  if (v22)
  {
    double v8 = 0;
  }
  else if ([v23 length])
  {
    id v28 = 0;
    double v8 = [MEMORY[0x263F08900] JSONObjectWithData:v23 options:0 error:&v28];
    id v22 = v28;
  }
  else
  {
    double v8 = 0;
    id v22 = 0;
  }
  uint64_t v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"phonetic-match-building", v8);
  unsigned int v26 = [v9 objectForKeyedSubscript:@"phonomap-file"];

  if ([v26 length])
  {
    double v10 = [v24 stringByAppendingPathComponent:v26];
    goto LABEL_8;
  }
  double v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 URLForResource:@"phonomaps" withExtension:@"plist"];

  if (v13)
  {
    unint64_t v14 = [NSDictionary dictionaryWithContentsOfURL:v13];
    unint64_t v15 = [v14 objectForKey:v21];
    if (![v15 length])
    {
      uint64_t v16 = [v21 componentsSeparatedByString:@"_"];
      unint64_t v17 = [v16 firstObject];

      if ([v17 length])
      {
        uint64_t v18 = [v14 objectForKey:v17];

        unint64_t v15 = (void *)v18;
      }
    }
    if ([v15 length])
    {
      long long v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v10 = [v19 pathForResource:v15 ofType:@"fst"];

LABEL_8:
      std::string::basic_string[abi:ne180100]<0>(v27, (char *)[v10 UTF8String]);
      operator new();
    }
  }
  return 0;
}

- (BOOL)_loadConfusionMatrixFromJsonFile:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SRSSPhoneticChecker *)self _phoneForString:@"_"];
  id v33 = 0;
  id v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4 options:0 error:&v33];
  id v6 = v33;
  if (v6)
  {
    id v7 = v6;
LABEL_3:
    double v8 = 0;
    BOOL v9 = 0;
    goto LABEL_20;
  }
  if (![v5 length])
  {
    id v7 = 0;
    goto LABEL_3;
  }
  id v32 = 0;
  double v8 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v32];
  id v7 = v32;
  id v21 = [v8 objectForKey:@"recs"];
  id v22 = [v8 objectForKey:@"refs"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v21;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        [(SRSSPhoneticChecker *)self _phoneForString:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v22;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        [(SRSSPhoneticChecker *)self _phoneForString:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v15);
  }

  unint64_t v18 = [(NSDictionary *)self->_phoneIds count];
  self->_phoneCount = v18;
  self->_confusionMatrix = (double *)malloc_type_malloc(8 * v18 * v18, 0xC6529EA5uLL);
  long long v19 = [v8 objectForKey:@"confusionMatrix"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __56__SRSSPhoneticChecker__loadConfusionMatrixFromJsonFile___block_invoke;
  v23[3] = &unk_2655201A8;
  v23[4] = self;
  [v19 enumerateKeysAndObjectsUsingBlock:v23];

  BOOL v9 = 1;
LABEL_20:

  return v9;
}

void __56__SRSSPhoneticChecker__loadConfusionMatrixFromJsonFile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a3;
  id v5 = [a2 componentsSeparatedByString:@" "];
  [v16 doubleValue];
  double v7 = v6;
  if ((unint64_t)[v5 count] <= 1) {
    NSLog(&cfstr_UnexpectedEntr.isa);
  }
  double v8 = *(void **)(a1 + 32);
  BOOL v9 = [v5 objectAtIndexedSubscript:0];
  unsigned int v10 = [v8 _phoneForString:v9];

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v5 objectAtIndexedSubscript:1];
  unsigned int v13 = [v11 _phoneForString:v12];

  uint64_t v14 = *(void *)(a1 + 32);
  unint64_t v15 = *(void *)(v14 + 40);
  if (v15 <= v10 || v15 <= v13) {
    NSLog(&cfstr_UnexpectedPhon.isa);
  }
  else {
    *(double *)(*(void *)(v14 + 48) + 8 * (v13 + v15 * v10)) = -v7;
  }
}

- (void)_loadLexiconWithModelPath:(id)a3 localization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  double v8 = (void *)[objc_alloc(MEMORY[0x263F14020]) initWithLocalization:v7];
  BOOL v9 = [v6 stringByAppendingPathComponent:@"mini.json"];
  unsigned int v10 = [v6 stringByAppendingPathComponent:@"ncs"];
  uint64_t v11 = [v10 stringByAppendingPathComponent:@"en_US_napg.json"];
  uint64_t v12 = [v10 stringByAppendingPathComponent:@"vocdelta.voc"];
  unsigned int v13 = [v10 stringByAppendingPathComponent:@"pg.voc"];
  uint64_t v14 = [v10 stringByAppendingPathComponent:@"mrec.psh"];
  unint64_t v15 = (_EARUserProfileBuilder *)[objc_alloc(MEMORY[0x263F3B430]) initWithConfiguration:v9 language:@"en_US" overrides:0 sdapiOverrides:v11 emptyVoc:v12 pgVoc:v13 paramsetHolder:v14];
  builder = self->_builder;
  self->_builder = v15;

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__SRSSPhoneticChecker__loadLexiconWithModelPath_localization___block_invoke;
  v17[3] = &unk_2655201D0;
  v17[4] = self;
  v17[5] = v18;
  v17[6] = v22;
  v17[7] = v26;
  v17[8] = v30;
  v17[9] = v20;
  v17[10] = v23;
  v17[11] = v27;
  v17[12] = v21;
  v17[13] = v25;
  v17[14] = v29;
  v17[15] = v19;
  v17[16] = v24;
  v17[17] = v28;
  [v8 enumerateCompletionsForPrefix:&stru_270B0E880 usingBlock:v17];
  self->_lexiconLoaded = 1;
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
}

void __62__SRSSPhoneticChecker__loadLexiconWithModelPath_localization___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v45 = a2;
  context = (void *)MEMORY[0x2611D30E0]();
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0x9C41uLL) {
    *a3 = 1;
  }
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = [v45 string];
  double v46 = [v5 pronunciationsForOrthography:v6];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  uint64_t v9 = v8 + 1;
  if ((unint64_t)(v8 + 1) > *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(void *)(v7 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 5000;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = malloc_type_malloc(0x186A0uLL, 0x10800401F59AC77uLL);
    unsigned int v10 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v11 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    [v10 addObject:v11];

    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v7 + 24);
    uint64_t v9 = v8 + 1;
  }
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  *(void *)(v7 + 24) = v9;
  *(unsigned char *)(v12 + 20 * v8 + 8) = [v46 count];
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if ((unint64_t)([v46 count] + v13) > *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5000;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = malloc_type_malloc(0x9C40uLL, 0x2004093837F09uLL);
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 56);
    unint64_t v15 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
    [v14 addObject:v15];
  }
  uint64_t v49 = v12 + 20 * v8;
  *(void *)uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
                 + 8 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v46 count];
  [v45 probability];
  *(long double *)(v49 + 12) = exp(v16);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v46;
  uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v50)
  {
    LODWORD(v52) = 0;
    uint64_t v48 = *(void *)v58;
    do
    {
      uint64_t v51 = 0;
      uint64_t v52 = (int)v52;
      do
      {
        if (*(void *)v58 != v48) {
          objc_enumerationMutation(obj);
        }
        unint64_t v17 = *(void **)(*((void *)&v57 + 1) + 8 * v51);
        unint64_t v18 = [MEMORY[0x263EFF980] array];
        long long v19 = [v17 componentsSeparatedByString:@"."];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v54 != v22) {
                objc_enumerationMutation(v20);
              }
              long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(*(id *)(a1 + 32), "_phoneForString:", *(void *)(*((void *)&v53 + 1) + 8 * i)));
              [v18 addObject:v24];
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v61 count:16];
          }
          while (v21);
        }

        uint64_t v25 = *(void *)(*(void *)(a1 + 96) + 8);
        uint64_t v26 = *(void *)(v25 + 24);
        uint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) > *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
        {
          *(void *)(v25 + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 5000;
          *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = malloc_type_malloc(0x13880uLL, 0x101004032DCA59EuLL);
          long long v28 = *(void **)(*(void *)(a1 + 32) + 56);
          long long v29 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)];
          [v28 addObject:v29];

          uint64_t v25 = *(void *)(*(void *)(a1 + 96) + 8);
          uint64_t v26 = *(void *)(v25 + 24);
          uint64_t v27 = v26 + 1;
        }
        uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        *(void *)(v25 + 24) = v27;
        uint64_t v31 = [v18 count];
        id v32 = (unsigned char *)(v30 + 16 * v26);
        unsigned char *v32 = v31;
        uint64_t v33 = *(void *)(*(void *)(a1 + 120) + 8);
        uint64_t v34 = *(void *)(v33 + 24);
        if ((unint64_t)(v34 + v31) > *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24))
        {
          *(void *)(v33 + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 5000;
          *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = malloc_type_malloc(0x1388uLL, 0x100004077774924uLL);
          uint64_t v35 = *(void **)(*(void *)(a1 + 32) + 56);
          uint64_t v36 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24)];
          [v35 addObject:v36];

          uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
        }
        uint64_t v37 = v30 + 16 * v26;
        *(void *)(v37 + 8) = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + v34;
        uint64_t v38 = (void *)(v37 + 8);
        *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += v31;
        if (v31)
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            unsigned int v40 = [v18 objectAtIndexedSubscript:j];
            *(unsigned char *)(*v38 + j) = [v40 intValue];
          }
        }
        *(void *)(*(void *)v49 + 8 * v52) = v32;

        ++v51;
        ++v52;
      }
      while (v51 != v50);
      uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v50);
  }

  unsigned int v41 = [MEMORY[0x263F08D40] valueWithPointer:v49];
  double v42 = *(void **)(*(void *)(a1 + 32) + 16);
  double v43 = [v45 string];
  [v42 addObject:v43];

  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v41];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_regionsToFree, 0);
  objc_storeStrong((id *)&self->_phoneIds, 0);
  objc_storeStrong((id *)&self->_lexiconEntries, 0);
  objc_storeStrong((id *)&self->_lexiconWords, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end