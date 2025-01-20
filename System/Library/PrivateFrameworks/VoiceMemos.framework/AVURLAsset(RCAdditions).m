@interface AVURLAsset(RCAdditions)
+ (id)rc_preciseTimingAssetWithURL:()RCAdditions;
+ (id)rc_transcriptionDataForURL:()RCAdditions;
+ (uint64_t)rc_updateFile:()RCAdditions withTranscriptionData:error:;
- (BOOL)rc_transcriptionDataExists;
- (id)rc_transcriptionData;
@end

@implementation AVURLAsset(RCAdditions)

+ (uint64_t)rc_updateFile:()RCAdditions withTranscriptionData:error:
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = +[RCMutableMovie movieWithURL:v7 error:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_81);

    v13 = [v12 firstObject];
    if (v13)
    {
      v37 = v12;
      v38 = a5;
      v39 = v8;
      v40 = v7;
      v14 = objc_opt_new();
      v48[0] = [MEMORY[0x1E4F16558] identifierForKey:@"tsrp" keySpace:*MEMORY[0x1E4F15DF0]];
      v48[1] = [MEMORY[0x1E4F16558] identifierForKey:@"com.apple.VoiceMemos.tsrp" keySpace:*MEMORY[0x1E4F15DF8]];
      v15 = [MEMORY[0x1E4F1CAD0] setWithObjects:v48 count:2];
      for (uint64_t i = 1; i != -1; --i)

      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v36 = v13;
      v17 = [v13 metadata];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            v23 = [v22 identifier];
            char v24 = [v15 containsObject:v23];

            if ((v24 & 1) == 0) {
              [v14 addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v19);
      }

      id v8 = v39;
      id v7 = v40;
      if (v39)
      {
        v25 = transcriptionIdentifier([v40 isQuickTime]);
        v26 = (objc_class *)MEMORY[0x1E4F165A0];
        id v27 = v39;
        id v28 = objc_alloc_init(v26);
        v29 = [MEMORY[0x1E4F16558] keyForIdentifier:v25];
        [v28 setKey:v29];

        v30 = [MEMORY[0x1E4F16558] keySpaceForIdentifier:v25];
        [v28 setKeySpace:v30];

        [v28 setIdentifier:v25];
        [v28 setValue:v27];

        [v28 setDataType:*MEMORY[0x1E4F1F020]];
        [v14 addObject:v28];
      }
      v13 = v36;
      [v36 setMetadata:v14];
      uint64_t v31 = objc_msgSend(v10, "rc_writeMovieHeaderWithOptions:error:", 0, v38);
      uint64_t v32 = v31;
      if (v38 && (v31 & 1) == 0)
      {
        v33 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          +[AVURLAsset(RCAdditions) rc_updateFile:withTranscriptionData:error:](v38, v33);
        }
      }
      v12 = v37;
    }
    else
    {
      if (!a5)
      {
        uint64_t v32 = 0;
        goto LABEL_26;
      }
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28588];
      v47 = @"No audio tracks exist";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      [v34 errorWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:-1 userInfo:v14];
      uint64_t v32 = 0;
      *a5 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }

LABEL_26:
    goto LABEL_27;
  }
  uint64_t v32 = 0;
LABEL_27:

  return v32;
}

+ (id)rc_preciseTimingAssetWithURL:()RCAdditions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = *MEMORY[0x1E4F16148];
  v9[0] = MEMORY[0x1E4F1CC38];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = (void *)[v4 initWithURL:v3 options:v5];

  return v6;
}

+ (id)rc_transcriptionDataForURL:()RCAdditions
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F16578] movieWithURL:v3 options:0];
  v5 = [v4 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_91);

  id v7 = [v6 firstObject];
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = [v7 metadata];
    v10 = transcriptionIdentifier([v3 isQuickTime]);
    v11 = firstDataValue((uint64_t)v9, (uint64_t)v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)rc_transcriptionData
{
  v2 = objc_msgSend(a1, "rc_audioTracks");
  id v3 = [v2 firstObject];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 metadata];
    v6 = [a1 URL];
    id v7 = transcriptionIdentifier([v6 isQuickTime]);
    uint64_t v8 = firstDataValue((uint64_t)v5, (uint64_t)v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)rc_transcriptionDataExists
{
  v2 = objc_msgSend(a1, "rc_audioTracks");
  id v3 = [v2 firstObject];
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F16558];
    v6 = [v3 metadata];
    id v7 = [a1 URL];
    uint64_t v8 = transcriptionIdentifier([v7 isQuickTime]);
    v9 = [v5 metadataItemsFromArray:v6 filteredByIdentifier:v8];
    BOOL v10 = [v9 count] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (void)rc_updateFile:()RCAdditions withTranscriptionData:error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "+[AVURLAsset(RCAdditions) rc_updateFile:withTranscriptionData:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- writeMovieHeaderToURL error = %@", (uint8_t *)&v3, 0x16u);
}

@end