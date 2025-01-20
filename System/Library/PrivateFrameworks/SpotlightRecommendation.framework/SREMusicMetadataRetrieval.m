@interface SREMusicMetadataRetrieval
- (id)parseAnswer:(id)a3 withAllAnswers:(id)a4;
- (id)retrieveMusicMetadata:(id)a3 error:(id *)a4;
- (void)extractAlbumMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5;
- (void)extractArtistMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5;
- (void)extractGenreMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5;
@end

@implementation SREMusicMetadataRetrieval

- (id)retrieveMusicMetadata:(id)a3 error:(id *)a4
{
  v93[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v68 = objc_opt_new();
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v70 = v7;
  v71 = (void *)v6;
  if ([v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = objc_alloc(MEMORY[0x263F4E8A0]);
      [v5 objectAtIndexedSubscript:v8];
      v11 = id v10 = v5;
      v12 = [v11 stringValue];
      unint64_t v13 = v8 + 1;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"adamId_%lu", v8 + 1);
      v15 = (void *)[v9 initWithValue:v12 arg:v14];

      v7 = v70;
      id v5 = v10;
      uint64_t v6 = (uint64_t)v71;
      [v71 addObject:v15];
      v16 = NSString;
      v17 = [v5 objectAtIndexedSubscript:v8];
      v18 = [v16 stringWithFormat:@"-a adamId_%lu=%@", v13, v17];

      [v70 addObject:v18];
      unint64_t v8 = v13;
    }
    while (v13 < [v5 count]);
  }
  v19 = (void *)[objc_alloc(MEMORY[0x263F4E8B0]) initWithIntent:@"MusicEntitySearch" args:v6 score:&unk_270B178C8];
  id v20 = objc_alloc(MEMORY[0x263F4E8B8]);
  v93[0] = v19;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:1];
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 10 * objc_msgSend(v5, "count"));
  v23 = (void *)[v20 initWithIntents:v21 query:&stru_270B15510 limit:v22 offset:&unk_270B178C8];

  v24 = [v7 componentsJoinedByString:@" "];
  v25 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v90 = (uint64_t)v24;
    _os_log_impl(&dword_25E363000, v25, OS_LOG_TYPE_DEFAULT, "Starting knosis service call: %@", buf, 0xCu);
  }

  v26 = [v68 executeIntent:v23 error:a4];
  v27 = logForCSLogCategoryRecs();
  v28 = v27;
  if (v26)
  {
    v63 = v24;
    v64 = v23;
    v65 = v19;
    v67 = v5;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [v26 status];
      v30 = [v26 answers];
      uint64_t v31 = [v30 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v90 = v29;
      __int16 v91 = 2048;
      uint64_t v92 = v31;
      _os_log_impl(&dword_25E363000, v28, OS_LOG_TYPE_DEFAULT, "Parsing Knosis response. status=%ld answers.count = %ld", buf, 0x16u);
    }
    v32 = (void *)MEMORY[0x263EFF9A0];
    v33 = [v26 answers];
    v28 = objc_msgSend(v32, "dictionaryWithCapacity:", objc_msgSend(v33, "count"));

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v66 = v26;
    v34 = [v26 answers];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v80 objects:v88 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v81 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          v40 = [v39 answerId];
          [v28 setObject:v39 forKey:v40];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v80 objects:v88 count:16];
      }
      while (v36);
    }

    v41 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v67, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v42 = [v66 answers];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v76 objects:v87 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v77 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [(SREMusicMetadataRetrieval *)self parseAnswer:*(void *)(*((void *)&v76 + 1) + 8 * j) withAllAnswers:v28];
          v48 = v47;
          if (v47)
          {
            v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v47, "trackId"));
            [v41 setObject:v48 forKey:v49];

            v50 = logForCSLogCategoryRecs();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
              [(SREMusicMetadataRetrieval *)v85 retrieveMusicMetadata:&v86 error:v50];
            }
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v76 objects:v87 count:16];
      }
      while (v44);
    }

    id v5 = v67;
    v51 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v67, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v52 = v67;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v73 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = [v41 objectForKey:*(void *)(*((void *)&v72 + 1) + 8 * k)];
          if (v57) {
            [v51 addObject:v57];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v54);
    }

    v58 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v59 = [v51 count];
      uint64_t v60 = [v52 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v90 = v59;
      __int16 v91 = 2048;
      uint64_t v92 = v60;
      _os_log_impl(&dword_25E363000, v58, OS_LOG_TYPE_DEFAULT, "End Knosis response parse. Got %ld/%ld music candidates with metadata.", buf, 0x16u);
    }

    v61 = v71;
    v23 = v64;
    v19 = v65;
    v24 = v63;
    v26 = v66;
  }
  else
  {
    v61 = v71;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[SREMusicMetadataRetrieval retrieveMusicMetadata:error:]((uint64_t *)a4, v28);
    }
    v51 = 0;
  }

  return v51;
}

- (id)parseAnswer:(id)a3 withAllAnswers:(id)a4
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v68 = a4;
  uint64_t v6 = objc_alloc_init(SREMusicCandidate);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v66 = v5;
  obuint64_t j = [v5 parents];
  uint64_t v71 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
  if (v71)
  {
    uint64_t v70 = *(void *)v96;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v96 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v72 = v7;
        unint64_t v8 = *(void **)(*((void *)&v95 + 1) + 8 * v7);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v76 = [v8 facts];
        uint64_t v9 = [v76 countByEnumeratingWithState:&v91 objects:v104 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v92;
          uint64_t v73 = *(void *)v92;
          do
          {
            uint64_t v12 = 0;
            uint64_t v74 = v10;
            do
            {
              if (*(void *)v92 != v11) {
                objc_enumerationMutation(v76);
              }
              unint64_t v13 = *(void **)(*((void *)&v91 + 1) + 8 * v12);
              v14 = [v13 predicateId];
              int v15 = [v14 isEqualToString:@"PS72"];

              if (v15)
              {
                long long v89 = 0u;
                long long v90 = 0u;
                long long v87 = 0u;
                long long v88 = 0u;
                v16 = [v13 qualifiers];
                uint64_t v17 = [v16 countByEnumeratingWithState:&v87 objects:v103 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v88;
                  do
                  {
                    for (uint64_t i = 0; i != v18; ++i)
                    {
                      if (*(void *)v88 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      v21 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                      v22 = [v21 predicateId];
                      int v23 = [v22 isEqualToString:@"PS69"];

                      if (v23)
                      {
                        v24 = [v21 objectID];
                        -[SREMusicCandidate setTrackId:](v6, "setTrackId:", [v24 integerValue]);

                        if ([(SREMusicCandidate *)v6 trackId] > 0) {
                          goto LABEL_24;
                        }
                        v25 = logForCSLogCategoryRecs();
                        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                        {
                          v26 = [v21 objectID];
                          *(_DWORD *)buf = 138412290;
                          v102 = v26;
                          _os_log_impl(&dword_25E363000, v25, OS_LOG_TYPE_DEFAULT, "*warn* Failed to convert adam ID to a positive integer:%@", buf, 0xCu);
                        }
                      }
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v87 objects:v103 count:16];
                  }
                  while (v18);
                }
LABEL_24:

                uint64_t v11 = v73;
                uint64_t v10 = v74;
              }
              ++v12;
            }
            while (v12 != v10);
            uint64_t v10 = [v76 countByEnumeratingWithState:&v91 objects:v104 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v72 + 1;
      }
      while (v72 + 1 != v71);
      uint64_t v71 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
    }
    while (v71);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v27 = [v66 facts];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v83 objects:v100 count:16];
  uint64_t v29 = self;
  v30 = v68;
  if (!v28)
  {
LABEL_69:

    goto LABEL_70;
  }
  uint64_t v31 = v28;
  int v32 = 0;
  uint64_t v78 = *(void *)v84;
  long long v75 = v27;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v84 != v78) {
        objc_enumerationMutation(v27);
      }
      v34 = *(void **)(*((void *)&v83 + 1) + 8 * v33);
      uint64_t v35 = [v34 predicateId];
      int v36 = [v35 isEqualToString:@"PS1"];

      if (v36)
      {
        uint64_t v37 = [v34 objectID];
        char v38 = [v37 isEqualToString:@"SB44"];

        if ((v38 & 1) == 0) {
          goto LABEL_69;
        }
        int v32 = 1;
      }
      else
      {
        v39 = [v34 predicateId];
        int v40 = [v39 isEqualToString:@"PS33"];

        if (v40)
        {
          v41 = [v34 objectID];
          [(SREMusicCandidate *)v6 setTrackName:v41];
LABEL_43:

          goto LABEL_44;
        }
        v42 = [v34 predicateId];
        int v43 = [v42 isEqualToString:@"PS137"];

        if (v43)
        {
          [(SREMusicMetadataRetrieval *)v29 extractArtistMetadataFromFact:v34 withAllAnswers:v30 toCandidate:v6];
          goto LABEL_44;
        }
        uint64_t v44 = [v34 predicateId];
        int v45 = [v44 isEqualToString:@"PS486"];

        if (v45)
        {
          v41 = [v34 objectID];
          [(SREMusicCandidate *)v6 setArtworkURL:v41];
          goto LABEL_43;
        }
        int v77 = v32;
        v46 = [v34 predicateId];
        int v47 = [v46 isEqualToString:@"PS106"];

        if (v47)
        {
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          v48 = [v34 qualifiers];
          uint64_t v49 = [v48 countByEnumeratingWithState:&v79 objects:v99 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v80;
            while (2)
            {
              for (uint64_t j = 0; j != v50; ++j)
              {
                if (*(void *)v80 != v51) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v53 = *(void **)(*((void *)&v79 + 1) + 8 * j);
                uint64_t v54 = [v53 predicateId];
                int v55 = [v54 isEqualToString:@"PS3"];

                if (v55)
                {
                  v58 = [v53 objectID];
                  -[SREMusicCandidate setTrackTimeMillis:](v6, "setTrackTimeMillis:", [v58 integerValue]);

                  goto LABEL_59;
                }
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v79 objects:v99 count:16];
              if (v50) {
                continue;
              }
              break;
            }
          }
LABEL_59:

          uint64_t v29 = self;
          v30 = v68;
          v27 = v75;
        }
        else
        {
          v56 = [v34 predicateId];
          int v57 = [v56 isEqualToString:@"PS123"];

          if (v57)
          {
            [(SREMusicMetadataRetrieval *)v29 extractAlbumMetadataFromFact:v34 withAllAnswers:v30 toCandidate:v6];
          }
          else
          {
            uint64_t v59 = [v34 predicateId];
            int v60 = [v59 isEqualToString:@"PS358"];

            if (v60)
            {
              [(SREMusicCandidate *)v6 setTrackExplicitness:1];
            }
            else
            {
              v61 = [v34 predicateId];
              int v62 = [v61 isEqualToString:@"PS10"];

              if (v62) {
                [(SREMusicMetadataRetrieval *)v29 extractGenreMetadataFromFact:v34 withAllAnswers:v30 toCandidate:v6];
              }
            }
          }
        }
        int v32 = v77;
      }
LABEL_44:
      ++v33;
    }
    while (v33 != v31);
    uint64_t v63 = [v27 countByEnumeratingWithState:&v83 objects:v100 count:16];
    uint64_t v31 = v63;
  }
  while (v63);

  if (v32 && [(SREMusicCandidate *)v6 trackId] >= 1)
  {
    v64 = v6;
    goto LABEL_71;
  }
LABEL_70:
  v64 = 0;
LABEL_71:

  return v64;
}

- (void)extractArtistMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v32 = a4;
  id v8 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = [v7 qualifiers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v38 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
      int v15 = [v14 predicateId];
      char v16 = [v15 isEqualToString:@"PS16"];

      if (v16) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v17 = [v14 objectID];

    if (!v17) {
      goto LABEL_22;
    }
    uint64_t v18 = [v32 objectForKey:v17];
    uint64_t v19 = v18;
    if (v18)
    {
      v30 = v18;
      uint64_t v31 = v8;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v20 = [v18 facts];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v26 = [v25 predicateId];
            int v27 = [v26 isEqualToString:@"PS33"];

            if (v27)
            {
              uint64_t v29 = [v25 objectID];
              id v8 = v31;
              [v31 setArtistName:v29];

              goto LABEL_25;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      id v20 = logForCSLogCategoryRecs();
      id v8 = v31;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v43 = v17;
        _os_log_impl(&dword_25E363000, v20, OS_LOG_TYPE_DEFAULT, "*warn* Performer name not found. Performer md=%@", buf, 0xCu);
      }
LABEL_25:
      uint64_t v19 = v30;
    }
    else
    {
      id v20 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v43 = v17;
        _os_log_impl(&dword_25E363000, v20, OS_LOG_TYPE_DEFAULT, "*warn* Performer answer not found. Performer md=%@", buf, 0xCu);
      }
    }
  }
  else
  {
LABEL_9:

LABEL_22:
    uint64_t v17 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v7 objectID];
      *(_DWORD *)buf = 138412290;
      int v43 = v28;
      _os_log_impl(&dword_25E363000, v17, OS_LOG_TYPE_DEFAULT, "*warn* Performer MD not found. Performer fact=%@", buf, 0xCu);
    }
  }
}

- (void)extractAlbumMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v54 = a4;
  id v8 = a5;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v53 = v7;
  uint64_t v9 = [v7 qualifiers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v79;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v79 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v78 + 1) + 8 * v13);
      int v15 = [v14 predicateId];
      char v16 = [v15 isEqualToString:@"PS53"];

      if (v16) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v78 objects:v88 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v17 = [v14 objectID];

    if (!v17) {
      goto LABEL_50;
    }
    uint64_t v18 = [v54 objectForKey:v17];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v51 = v17;
      id v52 = v18;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v20 = [v18 facts];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v74 objects:v85 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v75 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            v26 = [v25 predicateId];
            int v27 = [v26 isEqualToString:@"PS33"];

            if (v27)
            {
              uint64_t v28 = [v25 objectID];
              [v8 setCollectionName:v28];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v74 objects:v85 count:16];
        }
        while (v22);
      }

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v19 = v52;
      uint64_t v29 = [v52 parents];
      uint64_t v57 = [v29 countByEnumeratingWithState:&v70 objects:v84 count:16];
      if (v57)
      {
        obuint64_t j = v29;
        uint64_t v56 = *(void *)v71;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v71 != v56) {
              objc_enumerationMutation(obj);
            }
            uint64_t v58 = v30;
            uint64_t v31 = *(void **)(*((void *)&v70 + 1) + 8 * v30);
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            id v61 = [v31 facts];
            uint64_t v32 = [v61 countByEnumeratingWithState:&v66 objects:v83 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v67;
              uint64_t v59 = *(void *)v67;
              do
              {
                uint64_t v35 = 0;
                uint64_t v60 = v33;
                do
                {
                  if (*(void *)v67 != v34) {
                    objc_enumerationMutation(v61);
                  }
                  long long v36 = *(void **)(*((void *)&v66 + 1) + 8 * v35);
                  long long v37 = [v36 predicateId];
                  int v38 = [v37 isEqualToString:@"PS72"];

                  if (v38)
                  {
                    long long v64 = 0u;
                    long long v65 = 0u;
                    long long v62 = 0u;
                    long long v63 = 0u;
                    long long v39 = [v36 qualifiers];
                    uint64_t v40 = [v39 countByEnumeratingWithState:&v62 objects:v82 count:16];
                    if (v40)
                    {
                      uint64_t v41 = v40;
                      uint64_t v42 = *(void *)v63;
                      do
                      {
                        for (uint64_t j = 0; j != v41; ++j)
                        {
                          if (*(void *)v63 != v42) {
                            objc_enumerationMutation(v39);
                          }
                          uint64_t v44 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                          uint64_t v45 = [v44 predicateId];
                          int v46 = [v45 isEqualToString:@"PS69"];

                          if (v46)
                          {
                            int v47 = [v44 objectID];
                            objc_msgSend(v8, "setCollectionId:", objc_msgSend(v47, "integerValue"));

                            if ([v8 collectionId] > 0) {
                              goto LABEL_44;
                            }
                            v48 = logForCSLogCategoryRecs();
                            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                            {
                              uint64_t v49 = [v44 objectID];
                              *(_DWORD *)buf = 138412290;
                              long long v87 = v49;
                              _os_log_impl(&dword_25E363000, v48, OS_LOG_TYPE_DEFAULT, "*warn* Failed to convert adam ID to integer:%@", buf, 0xCu);
                            }
                          }
                        }
                        uint64_t v41 = [v39 countByEnumeratingWithState:&v62 objects:v82 count:16];
                      }
                      while (v41);
                    }
LABEL_44:

                    uint64_t v34 = v59;
                    uint64_t v33 = v60;
                  }
                  ++v35;
                }
                while (v35 != v33);
                uint64_t v33 = [v61 countByEnumeratingWithState:&v66 objects:v83 count:16];
              }
              while (v33);
            }

            uint64_t v30 = v58 + 1;
          }
          while (v58 + 1 != v57);
          uint64_t v57 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
        }
        while (v57);
        uint64_t v19 = v52;
        uint64_t v50 = v53;
        uint64_t v17 = v51;
        uint64_t v29 = obj;
      }
      else
      {
        uint64_t v50 = v53;
        uint64_t v17 = v51;
      }
    }
    else
    {
      uint64_t v29 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v87 = v17;
        _os_log_impl(&dword_25E363000, v29, OS_LOG_TYPE_DEFAULT, "*warn* Album answer not found. Album md=%@", buf, 0xCu);
      }
      uint64_t v50 = v53;
    }

    goto LABEL_57;
  }
LABEL_9:

LABEL_50:
  uint64_t v17 = logForCSLogCategoryRecs();
  uint64_t v50 = v53;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v53 objectID];
    *(_DWORD *)buf = 138412290;
    long long v87 = v19;
    _os_log_impl(&dword_25E363000, v17, OS_LOG_TYPE_DEFAULT, "*warn* Album MD not found. Album fact=%@", buf, 0xCu);
LABEL_57:
  }
}

- (void)extractGenreMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 objectID];
  if (v10)
  {
    uint64_t v11 = [v8 objectForKey:v10];
    uint64_t v12 = v11;
    if (v11)
    {
      int v27 = v9;
      id v28 = v8;
      id v29 = v7;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v13 = [v11 facts];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v19 = [v18 predicateId];
            int v20 = [v19 isEqualToString:@"PS33"];

            if (v20)
            {
              id v9 = v27;
              uint64_t v23 = [v27 genreIDs];

              if (v23)
              {
                v24 = [v27 genreIDs];
                v25 = [v18 objectID];
                v26 = [v24 arrayByAddingObject:v25];
                [v27 setGenreIDs:v26];
              }
              else
              {
                v24 = [v18 objectID];
                uint64_t v34 = v24;
                v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
                [v27 setGenreIDs:v25];
              }
              id v8 = v28;
              id v7 = v29;

              goto LABEL_23;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      uint64_t v13 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v37 = v10;
        _os_log_impl(&dword_25E363000, v13, OS_LOG_TYPE_DEFAULT, "*warn* Genre name not found. Genre md=%@", buf, 0xCu);
      }
      id v8 = v28;
      id v7 = v29;
      id v9 = v27;
      goto LABEL_23;
    }
    uint64_t v13 = logForCSLogCategoryRecs();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_23:

      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    long long v37 = v10;
    uint64_t v21 = "*warn* Genre answer not found. Genre md=%@";
    uint64_t v22 = v13;
LABEL_20:
    _os_log_impl(&dword_25E363000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_23;
  }
  uint64_t v12 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v7 objectID];
    *(_DWORD *)buf = 138412290;
    long long v37 = v13;
    uint64_t v21 = "*warn* Genre MD not found. Genre fact=%@";
    uint64_t v22 = v12;
    goto LABEL_20;
  }
LABEL_24:
}

- (void)retrieveMusicMetadata:(uint64_t *)a1 error:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "GDXPCKnosisService execution failed. error=%@", (uint8_t *)&v3, 0xCu);
}

- (void)retrieveMusicMetadata:(void *)a3 error:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 debugString];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_25E363000, a4, OS_LOG_TYPE_DEBUG, "Metadata parsed for candidate: %@", a1, 0xCu);
}

@end