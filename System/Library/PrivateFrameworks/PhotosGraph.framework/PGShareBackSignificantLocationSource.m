@interface PGShareBackSignificantLocationSource
- (BOOL)prepareSourceWithGraph:(id)a3;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
@end

@implementation PGShareBackSignificantLocationSource

- (void).cxx_destruct
{
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v7 = a3;
  v8 = [(PGShareBackSource *)self loggingConnection];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  homeNodes = self->_homeNodes;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__PGShareBackSignificantLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke;
  v17[3] = &unk_1E68E9A38;
  id v18 = v7;
  id v19 = v8;
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v13 = v7;
  [(MANodeCollection *)homeNodes enumerateNodesUsingBlock:v17];
  v14 = v20;
  id v15 = v11;

  return v15;
}

void __92__PGShareBackSignificantLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 coordinate];
  uint64_t v29 = v6;
  uint64_t v30 = v7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "location", v23, v24, (void)v25);
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "coordinate", 0, 0);
          uint64_t v23 = v15;
          uint64_t v24 = v16;
          CLLocationCoordinate2DGetDistanceFrom();
          if (v17 <= 200.0)
          {
            id v18 = *(NSObject **)(a1 + 40);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v5;
              _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGShareBackSignificantLocationSource] Matched home %@", buf, 0xCu);
            }
            id v19 = [PGShareBackSuggesterResult alloc];
            uint64_t v20 = *(void *)(a1 + 32);
            v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", v23, v24);
            v22 = [(PGShareBackSuggesterResult *)v19 initWithInputs:v20 processingValue:2048 momentNodes:v21];

            [*(id *)(a1 + 48) addObject:v22];
            *a3 = 1;

            goto LABEL_14;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(PGShareBackSource *)self loggingConnection];
  uint64_t v6 = [v4 meNodeCollection];

  uint64_t v7 = [v6 homeNodes];
  homeNodes = self->_homeNodes;
  self->_homeNodes = v7;

  unint64_t v9 = [(MAElementCollection *)self->_homeNodes count];
  if (!v9 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[PGShareBackSignificantLocationSource] No home available", v11, 2u);
  }

  return v9 != 0;
}

@end