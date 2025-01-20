@interface SREMusicRetrieval
- (BOOL)isMusicRecEligible:(id)a3;
- (NSLocale)locale;
- (OS_dispatch_queue)queue;
- (SREMusicRetrieval)initWithLocale:(id)a3 queue:(id)a4 error:(id *)a5;
- (id)_parseQueryString:(id)a3;
- (id)_removeRecentlyPlayedCandidateAdamIDs:(id)a3 recentPlayed:(id)a4;
- (id)candidatesHandler;
- (id)completionHandler;
- (void)_callCompletionHandler:(id)a3;
- (void)_callMetadataEndpointWithAdamIDs:(id)a3 queryIntent:(id)a4;
- (void)retrieveMusicWithQuery:(id)a3 queryID:(unint64_t)a4;
- (void)setCandidatesHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLocale:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SREMusicRetrieval

- (SREMusicRetrieval)initWithLocale:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SREMusicRetrieval;
  v10 = [(SREMusicRetrieval *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_locale, a3);
    objc_storeStrong((id *)&v11->_queue, a4);
  }

  return v11;
}

- (BOOL)isMusicRecEligible:(id)a3
{
  v4 = [(SREMusicRetrieval *)self _parseQueryString:a3];
  if (v4)
  {
    v5 = [(SREMusicRetrieval *)self locale];
    v6 = [v5 localeIdentifier];
    char v7 = [v6 isEqualToString:@"en_US"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)retrieveMusicWithQuery:(id)a3 queryID:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [(SREMusicRetrieval *)self locale];
  id v8 = [v7 localeIdentifier];
  char v9 = [v8 isEqualToString:@"en_US"];

  if (v9)
  {
    v10 = [(SREMusicRetrieval *)self _parseQueryString:v6];
    v11 = logForCSLogCategoryRecs();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.6();
      }

      objc_super v13 = objc_alloc_init(SREMusicFeatureExtraction);
      v14 = logForCSLogCategoryRecs();
      v15 = v14;
      unint64_t v16 = a4 - 1;
      if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25E363000, v15, OS_SIGNPOST_INTERVAL_BEGIN, a4, "SREFeatureExtractionLatency", (const char *)&unk_25E375C65, buf, 2u);
      }

      id v48 = 0;
      v17 = [(SREMusicFeatureExtraction *)v13 retrieveNowPlayingHistoryWithLength:10 error:&v48];
      id v18 = v48;
      v19 = logForCSLogCategoryRecs();
      v20 = v19;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25E363000, v20, OS_SIGNPOST_INTERVAL_END, a4, "SREFeatureExtractionLatency", (const char *)&unk_25E375C65, buf, 2u);
      }

      v21 = logForCSLogCategoryRecs();
      v22 = v21;
      if (!v17 || v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[SREMusicRetrieval retrieveMusicWithQuery:queryID:]();
        }

        [(SREMusicRetrieval *)self _callCompletionHandler:v18];
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.5();
        }

        v23 = +[SREMusicRetrievalModel sharedInstance];
        if (v23)
        {
          v24 = [v10 genres];
          uint64_t v25 = [v24 count];

          if (v25)
          {
            memset(v47, 0, sizeof(v47));
            v26 = [v10 genres];
            if ([v26 countByEnumeratingWithState:v47 objects:v49 count:16]) {
              v27 = (__CFString *)**((id **)&v47[0] + 1);
            }
            else {
              v27 = &stru_270B15510;
            }
          }
          else
          {
            v27 = &stru_270B15510;
          }
          v45 = v13;
          v32 = logForCSLogCategoryRecs();
          v33 = v32;
          if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_25E363000, v33, OS_SIGNPOST_INTERVAL_BEGIN, a4, "SREModelInferrenceLatency", (const char *)&unk_25E375C65, buf, 2u);
          }

          v46 = v27;
          v44 = [[SREMusicModelQuery alloc] initWithGenreID:v27];
          v34 = objc_msgSend(v23, "inferenceWithSequence:query:error:", v17);
          id v18 = 0;
          v35 = logForCSLogCategoryRecs();
          v36 = v35;
          if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_25E363000, v36, OS_SIGNPOST_INTERVAL_END, a4, "SREModelInferrenceLatency", (const char *)&unk_25E375C65, buf, 2u);
          }

          v37 = logForCSLogCategoryRecs();
          v38 = v37;
          if (v34)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.4();
            }

            v39 = [(SREMusicRetrieval *)self _removeRecentlyPlayedCandidateAdamIDs:v34 recentPlayed:v17];

            v40 = logForCSLogCategoryRecs();
            v41 = v40;
            if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_25E363000, v41, OS_SIGNPOST_INTERVAL_BEGIN, a4, "SREMedaDataFetchingLatency", (const char *)&unk_25E375C65, buf, 2u);
            }

            [(SREMusicRetrieval *)self _callMetadataEndpointWithAdamIDs:v39 queryIntent:v10];
            v42 = logForCSLogCategoryRecs();
            v43 = v42;
            if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_25E363000, v43, OS_SIGNPOST_INTERVAL_END, a4, "SREMedaDataFetchingLatency", (const char *)&unk_25E375C65, buf, 2u);
            }
          }
          else
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[SREMusicRetrieval retrieveMusicWithQuery:queryID:]((uint64_t)v18, v38);
            }

            [(SREMusicRetrieval *)self _callCompletionHandler:v18];
          }
          objc_super v13 = v45;
        }
        else
        {
          v31 = logForCSLogCategoryRecs();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[SREMusicRetrieval retrieveMusicWithQuery:queryID:]();
          }

          id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.SREMusicRetrieval" code:-1 userInfo:0];
          [(SREMusicRetrieval *)self _callCompletionHandler:v18];
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25E363000, v12, OS_LOG_TYPE_DEFAULT, "Music recommendation skipped because of no music intent.", buf, 2u);
      }

      [(SREMusicRetrieval *)self _callCompletionHandler:0];
    }
  }
  else
  {
    v28 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(SREMusicRetrieval *)self locale];
      v30 = [v29 localeIdentifier];
      *(_DWORD *)buf = 138412290;
      v51 = v30;
      _os_log_impl(&dword_25E363000, v28, OS_LOG_TYPE_DEFAULT, "Music recommendation skipped for locale: %@", buf, 0xCu);
    }
    [(SREMusicRetrieval *)self _callCompletionHandler:0];
  }
}

- (void)_callMetadataEndpointWithAdamIDs:(id)a3 queryIntent:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v7 genres];
    uint64_t v9 = [v8 count];

    if (v9) {
      unint64_t v10 = 200;
    }
    else {
      unint64_t v10 = 25;
    }
    id v11 = v6;
    v47 = self;
    id v48 = v6;
    if ([v11 count] > v10)
    {
      uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", 0, v10);

      id v11 = (id)v12;
    }
    id v60 = 0;
    v45 = objc_alloc_init(SREMusicMetadataRetrieval);
    v46 = v11;
    objc_super v13 = [(SREMusicMetadataRetrieval *)v45 retrieveMusicMetadata:v11 error:&v60];
    id v44 = v60;
    v49 = [MEMORY[0x263EFF980] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v51 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v57 != v51) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v18 = [v17 genreIDs];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v69 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v53;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v53 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * j);
                v24 = [v7 genres];
                LOBYTE(v23) = [v24 containsObject:v23];

                if (v23)
                {
                  int v25 = 0;
                  goto LABEL_22;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v52 objects:v69 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }
          int v25 = 1;
LABEL_22:

          v26 = [v7 genres];
          uint64_t v27 = [v26 count];

          if (v25 && v27)
          {
            v28 = logForCSLogCategoryRecs();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = [v17 trackId];
              v30 = [v17 trackName];
              v31 = [v17 genresDebugString];
              *(_DWORD *)buf = 134218498;
              uint64_t v62 = v29;
              __int16 v63 = 2112;
              v64 = v30;
              __int16 v65 = 2112;
              v66 = v31;
              _os_log_impl(&dword_25E363000, v28, OS_LOG_TYPE_DEFAULT, "Recommendation candidate got filtered by genre mismatch. ADAM ID: %ld  name:%@  genre:%@", buf, 0x20u);
            }
LABEL_33:

            continue;
          }
          v32 = [v17 artworkURL];
          uint64_t v33 = [v32 length];

          v28 = logForCSLogCategoryRecs();
          BOOL v34 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if (!v33)
          {
            if (v34)
            {
              uint64_t v39 = [v17 trackId];
              v40 = [v17 artworkURL];
              *(_DWORD *)buf = 134218242;
              uint64_t v62 = v39;
              __int16 v63 = 2112;
              v64 = v40;
              _os_log_impl(&dword_25E363000, v28, OS_LOG_TYPE_DEFAULT, "Skipped recommendation candidate %lu with invalid artworkURL: %@", buf, 0x16u);
            }
            goto LABEL_33;
          }
          if (v34)
          {
            uint64_t v35 = [v17 trackId];
            v36 = [v17 trackName];
            v37 = [v17 genresDebugString];
            v38 = [v17 artistName];
            *(_DWORD *)buf = 134218754;
            uint64_t v62 = v35;
            __int16 v63 = 2112;
            v64 = v36;
            __int16 v65 = 2112;
            v66 = v37;
            __int16 v67 = 2112;
            v68 = v38;
            _os_log_impl(&dword_25E363000, v28, OS_LOG_TYPE_DEFAULT, "Music Recs Result: %ld %@ Genre=%@ ARTIST_NAME=%@", buf, 0x2Au);
          }
          [v49 addObject:v17];
          if ((unint64_t)[v49 count] > 2) {
            goto LABEL_36;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v15);
    }
LABEL_36:

    v41 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      -[SREMusicRetrieval _callMetadataEndpointWithAdamIDs:queryIntent:]();
    }

    id v6 = v48;
    if ([v49 count])
    {
      v42 = [(SREMusicRetrieval *)v47 candidatesHandler];
      ((void (**)(void, void *))v42)[2](v42, v49);
    }
    [(SREMusicRetrieval *)v47 _callCompletionHandler:0];
  }
  else
  {
    v43 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E363000, v43, OS_LOG_TYPE_DEFAULT, "Music recommendation metadata call skipped due to no candidates.", buf, 2u);
    }

    [(SREMusicRetrieval *)self _callCompletionHandler:0];
  }
}

- (id)_parseQueryString:(id)a3
{
  v24[164] = *MEMORY[0x263EF8340];
  id v18 = a3;
  v3 = +[SREQueryIntent queryIntentWithGenres:MEMORY[0x263EFFA68]];
  v4 = +[SREQueryIntent queryIntentWithGenres:&unk_270B178E0];
  uint64_t v5 = +[SREQueryIntent queryIntentWithGenres:&unk_270B178F8];
  uint64_t v6 = +[SREQueryIntent queryIntentWithGenres:&unk_270B17910];
  uint64_t v21 = +[SREQueryIntent queryIntentWithGenres:&unk_270B17928];
  id v7 = +[SREQueryIntent queryIntentWithGenres:&unk_270B17940];
  uint64_t v19 = +[SREQueryIntent queryIntentWithGenres:&unk_270B17958];
  id v8 = +[SREQueryIntent queryIntentWithGenres:&unk_270B17970];
  uint64_t v20 = +[SREQueryIntent queryIntentWithGenres:&unk_270B17988];
  v22 = +[SREQueryIntent queryIntentWithGenres:&unk_270B179A0];
  uint64_t v9 = +[SREQueryIntent queryIntentWithGenres:&unk_270B179B8];
  unint64_t v10 = +[SREQueryIntent queryIntentWithGenres:&unk_270B179D0];
  id v11 = +[SREQueryIntent queryIntentWithGenres:&unk_270B179E8];
  v23[0] = @"music";
  v23[1] = @"musi";
  v24[0] = v3;
  v24[1] = v3;
  v23[2] = @"play music";
  v23[3] = @"play musi";
  v24[2] = v3;
  v24[3] = v3;
  v23[4] = @"song";
  v23[5] = @"play song";
  v24[4] = v3;
  v24[5] = v3;
  v23[6] = @"play a song";
  v23[7] = @"songs";
  v24[6] = v3;
  v24[7] = v3;
  v23[8] = @"play songs";
  v23[9] = @"hiphop";
  v24[8] = v3;
  v24[9] = v4;
  v23[10] = @"hip hop";
  v23[11] = @"hip-hop";
  v24[10] = v4;
  v24[11] = v4;
  v23[12] = @"hiphop music";
  v23[13] = @"hip hop music";
  v24[12] = v4;
  v24[13] = v4;
  v23[14] = @"hip-hop music";
  v23[15] = @"hiphop musi";
  v24[14] = v4;
  v24[15] = v4;
  v23[16] = @"hip hop musi";
  v23[17] = @"hip-hop musi";
  v24[16] = v4;
  v24[17] = v4;
  v23[18] = @"hiphop song";
  v23[19] = @"hip hop song";
  v24[18] = v4;
  v24[19] = v4;
  v23[20] = @"hip-hop song";
  v23[21] = @"hiphop songs";
  v24[20] = v4;
  v24[21] = v4;
  v23[22] = @"hip hop songs";
  v23[23] = @"hip-hop songs";
  v24[22] = v4;
  v24[23] = v4;
  v23[24] = @"play hiphop";
  v23[25] = @"play hip hop";
  v24[24] = v4;
  v24[25] = v4;
  v23[26] = @"play hip-hop";
  v23[27] = @"play hiphop music";
  v24[26] = v4;
  v24[27] = v4;
  v23[28] = @"play hip hop music";
  v23[29] = @"play hip-hop music";
  v24[28] = v4;
  v24[29] = v4;
  v23[30] = @"play hiphop musi";
  v23[31] = @"play hip hop musi";
  v24[30] = v4;
  v24[31] = v4;
  v23[32] = @"play hip-hop musi";
  v23[33] = @"play hiphop song";
  v24[32] = v4;
  v24[33] = v4;
  v23[34] = @"play hip hop song";
  v23[35] = @"play hip-hop song";
  v24[34] = v4;
  v24[35] = v4;
  v23[36] = @"play hiphop songs";
  v23[37] = @"play hip hop songs";
  v24[36] = v4;
  v24[37] = v4;
  v23[38] = @"play hip-hop songs";
  v23[39] = @"rap";
  v24[38] = v4;
  v24[39] = v4;
  v23[40] = @"rap music";
  v23[41] = @"rap musi";
  v24[40] = v4;
  v24[41] = v4;
  v23[42] = @"rap song";
  v23[43] = @"rap songs";
  v24[42] = v4;
  v24[43] = v4;
  v23[44] = @"play rap";
  v23[45] = @"play rap music";
  v24[44] = v4;
  v24[45] = v4;
  v23[46] = @"play rap song";
  v23[47] = @"play rap songs";
  v24[46] = v4;
  v24[47] = v4;
  v23[48] = @"pop music";
  v23[49] = @"pop musi";
  v17 = (void *)v5;
  v24[48] = v5;
  v24[49] = v5;
  v23[50] = @"play pop music";
  v23[51] = @"pop song";
  v24[50] = v5;
  v24[51] = v5;
  v23[52] = @"play pop song";
  v23[53] = @"pop songs";
  v24[52] = v5;
  v24[53] = v5;
  v23[54] = @"play pop songs";
  v23[55] = @"rock music";
  v24[54] = v5;
  unint64_t v16 = (void *)v6;
  v24[55] = v6;
  v23[56] = @"rock musi";
  v23[57] = @"play rock";
  v24[56] = v6;
  v24[57] = v6;
  v23[58] = @"play rock music";
  v23[59] = @"rock song";
  v24[58] = v6;
  v24[59] = v6;
  v23[60] = @"play rock song";
  v23[61] = @"rock songs";
  v24[60] = v6;
  v24[61] = v6;
  v23[62] = @"play rock songs";
  v23[63] = @"alternative music";
  v24[62] = v6;
  v24[63] = v21;
  v23[64] = @"alternative musi";
  v24[64] = v21;
  v23[65] = @"play alternative music";
  v24[65] = v21;
  v23[66] = @"alternative song";
  v24[66] = v21;
  v23[67] = @"play alternative song";
  v24[67] = v21;
  v23[68] = @"alternative songs";
  v24[68] = v21;
  v23[69] = @"play alternative songs";
  v24[69] = v21;
  v23[70] = @"r&b";
  v24[70] = v7;
  v23[71] = @"rhythm and blues";
  v24[71] = v7;
  v23[72] = @"r&b music";
  v24[72] = v7;
  v23[73] = @"r&b musi";
  v24[73] = v7;
  v23[74] = @"play r&b music";
  v24[74] = v7;
  v23[75] = @"r&b song";
  v24[75] = v7;
  v23[76] = @"play r&b song";
  v24[76] = v7;
  v23[77] = @"r&b songs";
  v24[77] = v7;
  v23[78] = @"play r&b songs";
  v24[78] = v7;
  v23[79] = @"soul music";
  v24[79] = v7;
  v23[80] = @"soul musi";
  v24[80] = v7;
  v23[81] = @"play soul music";
  v24[81] = v7;
  v23[82] = @"soul song";
  v24[82] = v7;
  v23[83] = @"play soul song";
  v24[83] = v7;
  v23[84] = @"soul songs";
  v24[84] = v7;
  v23[85] = @"play soul songs";
  v24[85] = v7;
  v23[86] = @"country music";
  v24[86] = v19;
  v23[87] = @"country musi";
  v24[87] = v19;
  v23[88] = @"play country music";
  v24[88] = v19;
  v23[89] = @"country song";
  v24[89] = v19;
  v23[90] = @"play country song";
  v24[90] = v19;
  v23[91] = @"country songs";
  v24[91] = v19;
  v23[92] = @"play country songs";
  v24[92] = v19;
  v23[93] = @"soundtrack";
  v24[93] = v8;
  v23[94] = @"soundtracks";
  v24[94] = v8;
  v23[95] = @"soundtrack music";
  v24[95] = v8;
  v23[96] = @"soundtrack musi";
  v24[96] = v8;
  v23[97] = @"play soundtrack";
  v24[97] = v8;
  v23[98] = @"play soundtracks";
  v24[98] = v8;
  v23[99] = @"play soundtrack music";
  v24[99] = v8;
  v23[100] = @"soundtrack song";
  v24[100] = v8;
  v23[101] = @"play soundtrack song";
  v24[101] = v8;
  v23[102] = @"soundtrack songs";
  v24[102] = v8;
  v23[103] = @"play soundtrack songs";
  v24[103] = v8;
  v23[104] = @"dance music";
  v24[104] = v20;
  v23[105] = @"dance musi";
  v24[105] = v20;
  v23[106] = @"play dance music";
  v24[106] = v20;
  v23[107] = @"dance song";
  v24[107] = v20;
  v23[108] = @"play dance song";
  v24[108] = v20;
  v23[109] = @"dance songs";
  v24[109] = v20;
  v23[110] = @"play dance songs";
  v24[110] = v20;
  v23[111] = @"electronic music";
  v24[111] = v22;
  v23[112] = @"electronic musi";
  v24[112] = v22;
  v23[113] = @"play electronic music";
  v24[113] = v22;
  v23[114] = @"electronic song";
  v24[114] = v22;
  v23[115] = @"play electronic song";
  v24[115] = v22;
  v23[116] = @"electronic songs";
  v24[116] = v22;
  v23[117] = @"play electronic songs";
  v24[117] = v22;
  v23[118] = @"children music";
  v24[118] = v9;
  v23[119] = @"child music";
  v24[119] = v9;
  v23[120] = @"children's music";
  v24[120] = v9;
  v23[121] = @"play children music";
  v24[121] = v9;
  v23[122] = @"play child music";
  v24[122] = v9;
  v23[123] = @"play children's music";
  v24[123] = v9;
  v23[124] = @"children song";
  v24[124] = v9;
  v23[125] = @"child song";
  v24[125] = v9;
  v23[126] = @"children's song";
  v24[126] = v9;
  v23[127] = @"play children song";
  v24[127] = v9;
  v23[128] = @"play child song";
  v24[128] = v9;
  v23[129] = @"play children's song";
  v24[129] = v9;
  v23[130] = @"children songs";
  v24[130] = v9;
  v23[131] = @"child songs";
  v24[131] = v9;
  v23[132] = @"children's songs";
  v24[132] = v9;
  v23[133] = @"play children songs";
  v24[133] = v9;
  v23[134] = @"play child songs";
  v24[134] = v9;
  v23[135] = @"play children's songs";
  v24[135] = v9;
  v23[136] = @"kids music";
  v24[136] = v9;
  v23[137] = @"play kids music";
  v24[137] = v9;
  v23[138] = @"kid's music";
  v24[138] = v9;
  v23[139] = @"play kid's music";
  v24[139] = v9;
  v23[140] = @"kids song";
  v24[140] = v9;
  v23[141] = @"play kids song";
  v24[141] = v9;
  v23[142] = @"kid's song";
  v24[142] = v9;
  v23[143] = @"play kid's song";
  v24[143] = v9;
  v23[144] = @"kids songs";
  v24[144] = v9;
  v23[145] = @"play kids songs";
  v24[145] = v9;
  v23[146] = @"kid's songs";
  v24[146] = v9;
  v23[147] = @"play kid's songs";
  v24[147] = v9;
  v23[148] = @"jazz";
  v24[148] = v10;
  v23[149] = @"jazz music";
  v24[149] = v10;
  v23[150] = @"jazz musi";
  v24[150] = v10;
  v23[151] = @"play jazz";
  v24[151] = v10;
  v23[152] = @"play jazz music";
  v24[152] = v10;
  v23[153] = @"jazz song";
  v24[153] = v10;
  v23[154] = @"play jazz song";
  v24[154] = v10;
  v23[155] = @"jazz songs";
  v24[155] = v10;
  v23[156] = @"play jazz songs";
  v24[156] = v10;
  v23[157] = @"classical music";
  v24[157] = v11;
  v23[158] = @"classical musi";
  v23[159] = @"play classical music";
  v23[160] = @"classical song";
  v23[161] = @"play classical song";
  v23[162] = @"classical songs";
  v23[163] = @"play classical songs";
  v24[158] = v11;
  v24[159] = v11;
  v24[160] = v11;
  v24[161] = v11;
  v24[162] = v11;
  v24[163] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:164];
  objc_super v13 = [v18 lowercaseString];

  uint64_t v14 = [v12 objectForKey:v13];

  return v14;
}

- (id)_removeRecentlyPlayedCandidateAdamIDs:(id)a3 recentPlayed:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [MEMORY[0x263EFF9C0] setWithCapacity:10];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v12), "adamID", v23));
        [v7 addObject:v13];

        if ((unint64_t)[v7 count] > 9) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v5;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v20, v23))
          {
            uint64_t v21 = logForCSLogCategoryRecs();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v33 = v20;
              _os_log_impl(&dword_25E363000, v21, OS_LOG_TYPE_DEFAULT, "Music recommendation candidate got removed due to recently played. AdamID=%@", buf, 0xCu);
            }
          }
          else
          {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v17);
    }

    id v6 = v23;
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

- (void)_callCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SREMusicRetrieval__callCompletionHandler___block_invoke;
  v7[3] = &unk_265522BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__SREMusicRetrieval__callCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (id)candidatesHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCandidatesHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->completionHandler, 0);
  objc_storeStrong(&self->candidatesHandler, 0);
}

- (void)retrieveMusicWithQuery:queryID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_25E363000, v0, OS_LOG_TYPE_ERROR, "Music recommendation dropped because of feature extraction failure.", v1, 2u);
}

- (void)retrieveMusicWithQuery:queryID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_25E363000, v0, OS_LOG_TYPE_ERROR, "Music recommendation dropped because of no shared model instance.", v1, 2u);
}

- (void)retrieveMusicWithQuery:(uint64_t)a1 queryID:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "Music recommendation dropped because of model inference error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)retrieveMusicWithQuery:queryID:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E363000, v0, v1, "Music retrieval starting post processing.", v2, v3, v4, v5, v6);
}

- (void)retrieveMusicWithQuery:queryID:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E363000, v0, v1, "Music retrieval starting model inference.", v2, v3, v4, v5, v6);
}

- (void)retrieveMusicWithQuery:queryID:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E363000, v0, v1, "Music retrieval starting feature extraction.", v2, v3, v4, v5, v6);
}

- (void)_callMetadataEndpointWithAdamIDs:queryIntent:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E363000, v0, v1, "======================= End of a Music Recs Retrieval =======================", v2, v3, v4, v5, v6);
}

@end