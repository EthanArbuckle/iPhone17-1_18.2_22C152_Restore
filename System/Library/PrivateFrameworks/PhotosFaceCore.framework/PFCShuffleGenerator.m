@interface PFCShuffleGenerator
- (PFCShuffleGenerator)init;
- (PFCShuffleGenerator)initWithPhotoLibrary:(id)a3 targetShuffleSize:(int64_t)a4;
- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4;
- (id)shuffleForNonPersonSubtypes:(id)a3 requireMinimumShuffleCount:(BOOL)a4;
- (id)shuffleForSubtype:(unsigned __int16)a3 persons:(id)a4 requireMinimumShuffleCount:(BOOL)a5;
- (id)shuffles;
- (void)generateShuffles;
- (void)generateShufflesV2;
@end

@implementation PFCShuffleGenerator

- (PFCShuffleGenerator)init
{
  v3 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v4 = [(PFCShuffleGenerator *)self initWithPhotoLibrary:v3 targetShuffleSize:64];

  return v4;
}

- (PFCShuffleGenerator)initWithPhotoLibrary:(id)a3 targetShuffleSize:(int64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PFCShuffleGenerator;
  v8 = [(PFCShuffleGenerator *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    int64_t v10 = 16;
    v9->_shuffleMinimumSuggestionRequired = 16;
    if ((unint64_t)a4 > 0x10) {
      int64_t v10 = a4;
    }
    v9->_targetShuffleSize = v10;
    v11 = [[PFCShuffleDataSource alloc] initWithPhotoLibrary:v9->_photoLibrary];
    dataSource = v9->_dataSource;
    v9->_dataSource = v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    shuffles = v9->_shuffles;
    v9->_shuffles = (NSMutableArray *)v13;

    [(PFCShuffleGenerator *)v9 generateShufflesV2];
  }

  return v9;
}

- (id)shuffles
{
  v2 = (void *)[(NSMutableArray *)self->_shuffles copy];
  return v2;
}

- (void)generateShufflesV2
{
  v58[1] = *MEMORY[0x263EF8340];
  v3 = [(PFCShuffleDataSource *)self->_dataSource sortedTopAmbientPeople];
  v4 = (void *)[v3 mutableCopy];

  if ((unint64_t)[v4 count] >= 2)
  {
    v5 = [v4 firstObject];
    [v4 removeObjectAtIndex:0];
    v6 = [MEMORY[0x263EFFA08] setWithObject:v5];
    id v7 = [(PFCShuffleGenerator *)self shuffleForSubtype:804 persons:v6 requireMinimumShuffleCount:1];
    if (v7)
    {
      [(NSMutableArray *)self->_shuffles addObject:v7];
      v8 = pfc_shuffle_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = (uint64_t)v5;
        _os_log_impl(&dword_25932E000, v8, OS_LOG_TYPE_INFO, "Did generate VIP shuffle for person: %@", buf, 0xCu);
      }
    }
  }
  v9 = [MEMORY[0x263EFF980] array];
  if ([&unk_27072E250 count])
  {
    unint64_t v10 = 1;
    while (1)
    {
      v11 = [&unk_27072E250 objectAtIndex:v10 - 1];
      unint64_t v12 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self->_dataSource, "numberOfSuggestionsForShuffleSubtype:persons:", (unsigned __int16)[v11 unsignedIntegerValue], 0);
      if (v12 >= 0x10) {
        break;
      }
LABEL_23:

      if (v10++ >= [&unk_27072E250 count]) {
        goto LABEL_25;
      }
    }
    unint64_t v13 = v12;
    if (v12 >= self->_targetShuffleSize)
    {
      v58[0] = v11;
      v18 = (void *)MEMORY[0x263EFF8C0];
      v19 = (void **)v58;
    }
    else
    {
      if (v10 < [&unk_27072E250 count])
      {
        v14 = [&unk_27072E250 objectAtIndex:v10];
        unint64_t v15 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self->_dataSource, "numberOfSuggestionsForShuffleSubtype:persons:", (unsigned __int16)[v14 unsignedIntegerValue], 0);
        if (v15 > 0xF)
        {
          if (v15 + v13 >= self->_targetShuffleSize)
          {
            v55[0] = v11;
            v55[1] = v14;
            objc_super v16 = (void *)MEMORY[0x263EFF8C0];
            v17 = (void **)v55;
            uint64_t v20 = 2;
            goto LABEL_21;
          }
          v54 = v11;
          objc_super v16 = (void *)MEMORY[0x263EFF8C0];
          v17 = &v54;
        }
        else
        {
          v56 = v11;
          objc_super v16 = (void *)MEMORY[0x263EFF8C0];
          v17 = &v56;
        }
        uint64_t v20 = 1;
LABEL_21:
        v21 = [v16 arrayWithObjects:v17 count:v20];
        [v9 addObject:v21];

        goto LABEL_22;
      }
      v57 = v11;
      v18 = (void *)MEMORY[0x263EFF8C0];
      v19 = &v57;
    }
    v14 = [v18 arrayWithObjects:v19 count:1];
    [v9 addObject:v14];
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
  v25 = v23;
  if (!v24) {
    goto LABEL_50;
  }
  uint64_t v26 = v24;
  v44 = v4;
  int v27 = 0;
  char v28 = 0;
  char v29 = 0;
  char v30 = 0;
  uint64_t v31 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v46 != v31) {
        objc_enumerationMutation(v23);
      }
      v33 = [(PFCShuffleGenerator *)self shuffleForNonPersonSubtypes:*(void *)(*((void *)&v45 + 1) + 8 * i) requireMinimumShuffleCount:1];
      if (v33)
      {
        [(NSMutableArray *)self->_shuffles addObject:v33];
        if (v30)
        {
          char v30 = 1;
          if ((v29 & 1) == 0) {
            goto LABEL_33;
          }
LABEL_35:
          char v29 = 1;
        }
        else
        {
          char v30 = [v33 pets];
          if (v29) {
            goto LABEL_35;
          }
LABEL_33:
          char v29 = [v33 nature];
        }
        ++v27;
        if (v28) {
          char v28 = 1;
        }
        else {
          char v28 = [v33 cityscape];
        }
      }
    }
    uint64_t v26 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
  }
  while (v26);

  v4 = v44;
  if (v27 >= 2)
  {
    unint64_t v34 = [v44 count];
    v25 = [MEMORY[0x263EFFA08] set];
    if ([v44 count])
    {
      if (v34 >= 5) {
        uint64_t v35 = 5;
      }
      else {
        uint64_t v35 = v34;
      }
      v36 = (void *)MEMORY[0x263EFFA08];
      v37 = objc_msgSend(v44, "subarrayWithRange:", 0, v35);
      uint64_t v38 = [v36 setWithArray:v37];

      v25 = (void *)v38;
    }
    v39 = [[PFCShuffle alloc] initWithPeople:v25 pets:v30 & 1 nature:v29 & 1 cityscape:v28 & 1];
    [(NSMutableArray *)self->_shuffles insertObject:v39 atIndex:0];
    v40 = pfc_shuffle_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v39;
      _os_log_impl(&dword_25932E000, v40, OS_LOG_TYPE_INFO, "[PFCShuffleGenerator]: Generated everything shuffle: %@", buf, 0xCu);
    }

LABEL_50:
  }
  v41 = pfc_shuffle_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [(NSMutableArray *)self->_shuffles count];
    shuffles = self->_shuffles;
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v42;
    __int16 v51 = 2112;
    v52 = shuffles;
    _os_log_impl(&dword_25932E000, v41, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator]: Generated %ld shuffles\n%@", buf, 0x16u);
  }
}

- (void)generateShuffles
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [(PFCShuffleDataSource *)self->_dataSource topAmbientPeople];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    BOOL v9 = 0;
  }
  else
  {
    v5 = pfc_shuffle_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(PFCShuffleDataSource *)self->_dataSource topAmbientPeople];
      *(_DWORD *)buf = 134217984;
      uint64_t v41 = [v6 count];
      _os_log_impl(&dword_25932E000, v5, OS_LOG_TYPE_INFO, "Processing shuffle for %lu top people", buf, 0xCu);
    }
    id v7 = [(PFCShuffleDataSource *)self->_dataSource topAmbientPeople];
    v8 = [(PFCShuffleGenerator *)self shuffleForSubtype:804 persons:v7 requireMinimumShuffleCount:0];

    BOOL v9 = v8 != 0;
    if (v8)
    {
      unint64_t v10 = pfc_shuffle_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = (uint64_t)v8;
        _os_log_impl(&dword_25932E000, v10, OS_LOG_TYPE_INFO, "Did generate top people shuffle: %@", buf, 0xCu);
      }

      [(NSMutableArray *)self->_shuffles addObject:v8];
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v11 = [(PFCShuffleDataSource *)self->_dataSource topAmbientPeople];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v37;
    *(void *)&long long v13 = 138412290;
    long long v35 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v18 = pfc_shuffle_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v35;
          uint64_t v41 = v17;
          _os_log_impl(&dword_25932E000, v18, OS_LOG_TYPE_INFO, "Processing shuffle for person id: %@", buf, 0xCu);
        }

        v19 = [MEMORY[0x263EFFA08] setWithObject:v17];
        uint64_t v20 = [(PFCShuffleGenerator *)self shuffleForSubtype:804 persons:v19 requireMinimumShuffleCount:1];
        if (v20)
        {
          v21 = pfc_shuffle_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            uint64_t v41 = v17;
            _os_log_impl(&dword_25932E000, v21, OS_LOG_TYPE_INFO, "Did generate shuffle for person: %@", buf, 0xCu);
          }

          [(NSMutableArray *)self->_shuffles addObject:v20];
          BOOL v9 = 1;
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v14);
  }

  v22 = [(PFCShuffleGenerator *)self shuffleForSubtype:803 persons:0 requireMinimumShuffleCount:1];
  unsigned int v23 = v9;
  if (v22)
  {
    uint64_t v24 = pfc_shuffle_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25932E000, v24, OS_LOG_TYPE_INFO, "Did generate shuffle for pets", buf, 2u);
    }

    [(NSMutableArray *)self->_shuffles addObject:v22];
    if (v9) {
      unsigned int v23 = 2;
    }
    else {
      unsigned int v23 = 1;
    }
  }
  v25 = -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 801, 0, 1, v35);

  if (v25)
  {
    uint64_t v26 = pfc_shuffle_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25932E000, v26, OS_LOG_TYPE_INFO, "Did generate shuffle for nature", buf, 2u);
    }

    [(NSMutableArray *)self->_shuffles addObject:v25];
    ++v23;
  }
  int v27 = [(PFCShuffleGenerator *)self shuffleForSubtype:802 persons:0 requireMinimumShuffleCount:1];

  if (v27)
  {
    char v28 = pfc_shuffle_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25932E000, v28, OS_LOG_TYPE_INFO, "Did generate shuffle for cities", buf, 2u);
    }

    [(NSMutableArray *)self->_shuffles addObject:v27];
    ++v23;
  }
  if (v23 >= 2)
  {
    char v29 = pfc_shuffle_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25932E000, v29, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] producing consolidated shuffle as well", buf, 2u);
    }

    if (v9) {
      [(PFCShuffleDataSource *)self->_dataSource topAmbientPeople];
    }
    else {
    char v30 = [MEMORY[0x263EFFA08] set];
    }
    uint64_t v31 = [[PFCShuffle alloc] initWithPeople:v30 pets:v22 != 0 nature:v25 != 0 cityscape:v27 != 0];
    [(NSMutableArray *)self->_shuffles insertObject:v31 atIndex:0];
  }
  v32 = pfc_shuffle_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [(NSMutableArray *)self->_shuffles count];
    shuffles = self->_shuffles;
    *(_DWORD *)buf = 134218242;
    uint64_t v41 = v33;
    __int16 v42 = 2112;
    v43 = shuffles;
    _os_log_impl(&dword_25932E000, v32, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator]: Generated %ld shuffles\n%@", buf, 0x16u);
  }
}

- (id)shuffleForNonPersonSubtypes:(id)a3 requireMinimumShuffleCount:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4) {
    unint64_t v7 = 16;
  }
  else {
    unint64_t v7 = 1;
  }
  v8 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v28 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v31;
    *(void *)&long long v10 = 138412290;
    long long v27 = v10;
LABEL_6:
    uint64_t v14 = 0;
    while (2)
    {
      uint64_t v15 = v12;
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v14), "unsignedIntegerValue", v27);
      unint64_t v17 = [(PFCShuffleDataSource *)self->_dataSource numberOfSuggestionsForShuffleSubtype:v16 persons:0];
      v18 = PHSuggestionStringWithSubtype();
      [v8 addObject:v18];
      if (v17 >= v7)
      {
        int v19 = v16 - 801;
        uint64_t v12 = 1;
        switch(v19)
        {
          case 0:
            LODWORD(v28) = 1;
            goto LABEL_16;
          case 1:
            HIDWORD(v28) = 1;
            goto LABEL_16;
          case 2:
            goto LABEL_17;
          case 3:
            goto LABEL_23;
          default:
            uint64_t v20 = pfc_shuffle_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              long long v35 = v18;
              _os_log_error_impl(&dword_25932E000, v20, OS_LOG_TYPE_ERROR, "[PFCShuffleGenerator] bad shuffle subtype: %@", buf, 0xCu);
            }

LABEL_16:
            uint64_t v12 = v15;
LABEL_17:

            if (v11 != ++v14) {
              continue;
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
            if (!v11) {
              goto LABEL_25;
            }
            goto LABEL_6;
        }
      }
      break;
    }
    v21 = pfc_shuffle_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PFCShuffleGenerator shuffleForNonPersonSubtypes:requireMinimumShuffleCount:]((uint64_t)v18, v21);
    }

LABEL_23:
    v22 = 0;
    unsigned int v23 = obj;
    goto LABEL_29;
  }
  uint64_t v28 = 0;
  LODWORD(v12) = 0;
LABEL_25:

  unsigned int v23 = [v8 componentsJoinedByString:@","];
  uint64_t v24 = pfc_shuffle_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v35 = v23;
    _os_log_impl(&dword_25932E000, v24, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] Generated shuffle for subtypes (%@)", buf, 0xCu);
  }

  if ((v12 | v28 | HIDWORD(v28)))
  {
    v25 = [PFCShuffle alloc];
    v18 = [MEMORY[0x263EFFA08] set];
    v22 = [(PFCShuffle *)v25 initWithPeople:v18 pets:v12 & 1 nature:v28 & 1 cityscape:BYTE4(v28) & 1];
LABEL_29:

    goto LABEL_30;
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (id)shuffleForSubtype:(unsigned __int16)a3 persons:(id)a4 requireMinimumShuffleCount:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = PHSuggestionStringWithSubtype();
  long long v10 = pfc_shuffle_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_25932E000, v10, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] Fetching suggestion with subtype (%@), personLocalIdentifiers %@", (uint8_t *)&v24, 0x16u);
  }

  if (v5) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = 1;
  }
  if ([(PFCShuffleDataSource *)self->_dataSource hasSuggestionsForShuffleSubtype:v6 persons:v8 minimumCount:v11])
  {
    switch((int)v6)
    {
      case 801:
        uint64_t v12 = [PFCShuffle alloc];
        uint64_t v13 = [MEMORY[0x263EFFA08] set];
        uint64_t v14 = v12;
        uint64_t v15 = v13;
        uint64_t v16 = 0;
        uint64_t v17 = 1;
        goto LABEL_16;
      case 802:
        uint64_t v20 = [PFCShuffle alloc];
        uint64_t v13 = [MEMORY[0x263EFFA08] set];
        uint64_t v14 = v20;
        uint64_t v15 = v13;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v21 = 1;
        goto LABEL_17;
      case 803:
        v22 = [PFCShuffle alloc];
        uint64_t v13 = [MEMORY[0x263EFFA08] set];
        uint64_t v14 = v22;
        uint64_t v15 = v13;
        uint64_t v16 = 1;
        uint64_t v17 = 0;
LABEL_16:
        uint64_t v21 = 0;
LABEL_17:
        int v19 = [(PFCShuffle *)v14 initWithPeople:v15 pets:v16 nature:v17 cityscape:v21];

        break;
      case 804:
        int v19 = [[PFCShuffle alloc] initWithPeople:v8 pets:0 nature:0 cityscape:0];
        break;
      default:
        v18 = pfc_shuffle_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:]((uint64_t)v9, v18);
        }
        goto LABEL_13;
    }
  }
  else
  {
    v18 = pfc_shuffle_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v9;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_25932E000, v18, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] No suggestions for subtype (%@), personLocalIdentifiers %@", (uint8_t *)&v24, 0x16u);
    }
LABEL_13:

    int v19 = 0;
  }

  return v19;
}

- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4
{
  unsigned int v4 = a3;
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v20[0] = v8;
  uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:0];
  v20[1] = v9;
  long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  [v7 setSortDescriptors:v10];

  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v19[0] = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", v4);
  v19[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  uint64_t v15 = (void *)[v11 initWithArray:v14];

  if (v6)
  {
    uint64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"context", v6];
    [v15 addObject:v16];
  }
  uint64_t v17 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v15];
  [v7 setPredicate:v17];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffles, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)shuffleForNonPersonSubtypes:(uint64_t)a1 requireMinimumShuffleCount:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25932E000, a2, OS_LOG_TYPE_ERROR, "[PFCShuffleGenerator] Not enough suggestions for subtype (%@)", (uint8_t *)&v2, 0xCu);
}

- (void)shuffleForSubtype:(uint64_t)a1 persons:(NSObject *)a2 requireMinimumShuffleCount:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25932E000, a2, OS_LOG_TYPE_ERROR, "[PFCShuffleGenerator] bad shuffle subtype: %@", (uint8_t *)&v2, 0xCu);
}

@end