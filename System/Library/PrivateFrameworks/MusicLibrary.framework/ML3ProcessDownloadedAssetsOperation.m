@interface ML3ProcessDownloadedAssetsOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_processArtworkIdentifier:(id)a3 artworkToken:(id)a4 artworkType:(int64_t)a5 mediaType:(unsigned int)a6 sourceType:(int64_t)a7;
- (BOOL)_processContainerAsset:(id)a3 forSource:(int)a4 withError:(id *)a5;
- (BOOL)_processGeniusPlist:(id)a3 geniusIDString:(id)a4 geniusChecksum:(int64_t)a5;
- (BOOL)_processTrackAsset:(id)a3 forSource:(int)a4 withError:(id *)a5;
- (ML3ProcessDownloadedAssetsOperation)initWithLibrary:(id)a3 writer:(id)a4;
- (double)_videoSnapshotTimeForMediaType:(unsigned int)a3;
- (int64_t)_artworkSourceFromTrackSource:(int)a3;
- (unint64_t)type;
@end

@implementation ML3ProcessDownloadedAssetsOperation

- (int64_t)_artworkSourceFromTrackSource:(int)a3
{
  if ((a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1B04DCCB0[a3 - 1];
  }
}

- (BOOL)_processGeniusPlist:(id)a3 geniusIDString:(id)a4 geniusChecksum:(int64_t)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 objectForKey:@"genius_metadata"];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v10;
        _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Unhandled genius metadata format: %{public}@", buf, 0xCu);
      }

      v10 = 0;
    }
  }
  uint64_t v12 = [v8 objectForKey:@"genius_similarities"];
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = v13;
      goto LABEL_13;
    }
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v51 = v13;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Unhandled genius similarities format: %{public}@", buf, 0xCu);
    }
  }
  v43 = 0;
LABEL_13:
  v15 = [(ML3DatabaseOperation *)self transaction];
  v16 = [v15 connection];
  uint64_t v17 = [v9 longLongValue];

  unint64_t v18 = 0x1E4F1C000uLL;
  if (v10)
  {
    id v41 = v8;
    v19 = [NSNumber numberWithLongLong:v17];
    v49[0] = v19;
    v20 = [NSNumber numberWithLongLong:a5];
    v49[1] = v20;
    v49[2] = v10;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    v22 = int64_t v21 = a5;
    id v46 = 0;
    char v23 = objc_msgSend(v16, "executeUpdate:withParameters:error:", @"INSERT OR REPLACE INTO genius_metadata (genius_id, checksum, data) VALUES (?, ?, ?);",
            v22,
            &v46);
    id v24 = v46;

    if (v23)
    {
      v40 = v15;
      v25 = [NSNumber numberWithLongLong:v21];
      v48[0] = v25;
      v26 = [NSNumber numberWithLongLong:v17];
      v48[1] = v26;
      unint64_t v18 = 0x1E4F1C000uLL;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
      id v45 = v24;
      char v28 = objc_msgSend(v16, "executeUpdate:withParameters:error:", @"UPDATE item_extra SET pending_genius_checksum = ? WHERE genius_id = ?;",
              v27,
              &v45);
      id v29 = v45;

      if (v28)
      {
        BOOL v30 = 1;
        v15 = v40;
        id v8 = v41;
        goto LABEL_25;
      }
      v31 = os_log_create("com.apple.amp.medialibrary", "Default");
      id v8 = v41;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v29;
        _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to update genius checksum. err=%{public}@", buf, 0xCu);
      }
      id v24 = v29;
      v15 = v40;
    }
    else
    {
      unint64_t v18 = 0x1E4F1C000;
      v31 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v24;
        _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to update genius metadata. err=%{public}@", buf, 0xCu);
      }
      id v8 = v41;
    }

    BOOL v30 = 0;
    id v29 = v24;
  }
  else
  {
    id v29 = 0;
    BOOL v30 = 1;
  }
LABEL_25:
  if (v43)
  {
    v42 = v10;
    v32 = v15;
    v33 = [NSNumber numberWithLongLong:v17];
    v47[0] = v33;
    v47[1] = v43;
    v34 = [*(id *)(v18 + 2424) arrayWithObjects:v47 count:2];
    id v44 = v29;
    v35 = v16;
    char v36 = objc_msgSend(v16, "executeUpdate:withParameters:error:", @"INSERT OR REPLACE INTO genius_similarities (genius_id, data) VALUES (?, ?);",
            v34,
            &v44);
    id v37 = v44;

    if (v36)
    {
      BOOL v30 = 1;
      v15 = v32;
    }
    else
    {
      v38 = os_log_create("com.apple.amp.medialibrary", "Default");
      v15 = v32;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v37;
        _os_log_impl(&dword_1B022D000, v38, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to update genius similarities. err=%{public}@", buf, 0xCu);
      }

      BOOL v30 = 0;
    }
    v16 = v35;
    v10 = v42;
  }
  else
  {
    id v37 = v29;
  }

  return v30;
}

- (double)_videoSnapshotTimeForMediaType:(unsigned int)a3
{
  BOOL v3 = a3 == 0x2000 || a3 == 512;
  double result = 105.0;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (BOOL)_processArtworkIdentifier:(id)a3 artworkToken:(id)a4 artworkType:(int64_t)a5 mediaType:(unsigned int)a6 sourceType:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = +[ML3MusicLibrary artworkRelativePathFromToken:v13];
  v15 = [(ML3DatabaseOperation *)self library];
  int v16 = [v15 hasOriginalArtworkForRelativePath:v14];

  if (!v16)
  {
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v31 = 0;
    int64_t v21 = [v20 attributesOfItemAtPath:v12 error:&v31];
    id v18 = v31;

    if (v21)
    {
      if ((unint64_t)[v21 fileSize] < 0x1900001)
      {
        v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
        v27 = [(ML3DatabaseOperation *)self library];
        char v28 = [v27 importOriginalArtworkFromFileURL:v22 withArtworkToken:v13 artworkType:a5 sourceType:a7 mediaType:v8];

        if (v28)
        {
          char v19 = 1;
LABEL_18:

          goto LABEL_19;
        }
        id v29 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = (uint64_t)v13;
          _os_log_impl(&dword_1B022D000, v29, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Failed to insert new artwork for token: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        v22 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v21 fileSize];
          *(_DWORD *)buf = 134217984;
          uint64_t v33 = v23;
          id v24 = "[ML3ProcessDownloadedAssetsOperation] Artwork file too big: %llu bytes. Discarding.";
          v25 = v22;
          uint32_t v26 = 12;
LABEL_11:
          _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
        }
      }
    }
    else
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = (uint64_t)v12;
        __int16 v34 = 2114;
        id v35 = v18;
        id v24 = "[ML3ProcessDownloadedAssetsOperation] Could not read file attributes for %{public}@: %{public}@";
        v25 = v22;
        uint32_t v26 = 22;
        goto LABEL_11;
      }
    }
    char v19 = 0;
    goto LABEL_18;
  }
  uint64_t v17 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = (uint64_t)v13;
    _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Artwork already exists on disk, checking database consistency (artworkToken: %{public}@)", buf, 0xCu);
  }

  id v18 = [(ML3DatabaseOperation *)self library];
  char v19 = [v18 importExistingOriginalArtworkWithArtworkToken:v13 artworkType:a5 sourceType:a7 mediaType:v8];
LABEL_19:

  return v19;
}

- (BOOL)_processContainerAsset:(id)a3 forSource:(int)a4 withError:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetPersistentIdKey"];
  uint64_t v8 = [v7 longLongValue];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetArtworkPathKey"];

  if (v10 && [v9 fileExistsAtPath:v10])
  {
    v11 = [(ML3DatabaseOperation *)self library];
    id v12 = +[ML3ComparisonPredicate predicateWithProperty:@"container_pid" equalToInt64:v8];
    id v13 = +[ML3Entity anyInLibrary:v11 predicate:v12];

    if (v13)
    {
      v14 = [[ML3ArtworkTokenSet alloc] initWithEntity:v13 artworkType:5];
      v15 = [(ML3ArtworkTokenSet *)v14 artworkTokenForSource:300];
      if (v15)
      {
        [(ML3ProcessDownloadedAssetsOperation *)self _processArtworkIdentifier:v10 artworkToken:v15 artworkType:5 mediaType:8 sourceType:300];
      }
      else
      {
        int v16 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] No artwork token - skiping", (uint8_t *)&v18, 2u);
        }
      }
    }
    else
    {
      v14 = (ML3ArtworkTokenSet *)os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134217984;
        uint64_t v19 = v8;
        _os_log_impl(&dword_1B022D000, &v14->super, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to find container with pid %lld - skipping", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  return 1;
}

- (BOOL)_processTrackAsset:(id)a3 forSource:(int)a4 withError:(id *)a5
{
  v89[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetPersistentIdKey"];
  uint64_t v9 = [v8 longLongValue];

  v10 = [ML3Track alloc];
  v11 = [(ML3DatabaseOperation *)self library];
  uint64_t v72 = v9;
  id v12 = [(ML3Entity *)v10 initWithPersistentID:v9 inLibrary:v11];

  v89[0] = @"chapter.chapter_data";
  v89[1] = @"media_type";
  v89[2] = @"item_extra.genius_id";
  v89[3] = @"item_extra.pending_genius_checksum";
  v89[4] = @"lyrics.pending_checksum";
  v89[5] = @"lyrics.checksum";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:6];
  v14 = [(ML3Entity *)v12 getValuesForProperties:v13];

  uint64_t v15 = [v14 valueForKey:@"lyrics.pending_checksum"];
  int v16 = (void *)v15;
  uint64_t v17 = &unk_1F0910F60;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  id v18 = v17;

  v76 = v14;
  uint64_t v19 = [v14 valueForKey:@"lyrics.checksum"];
  uint64_t v20 = [v19 longLongValue];

  uint64_t v21 = [v18 longLongValue];
  v22 = [MEMORY[0x1E4F1CA48] array];
  v77 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetLyricsPathKey"];
  v74 = (void *)v23;
  if (v23 && (uint64_t v24 = v23, [v7 fileExistsAtPath:v23]))
  {
    v25 = v7;
    id v82 = 0;
    uint32_t v26 = [NSString stringWithContentsOfFile:v24 encoding:4 error:&v82];
    id v27 = v82;
    char v28 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v84 = v72;
      __int16 v85 = 2114;
      uint64_t v86 = (uint64_t)v74;
      __int16 v87 = 2114;
      id v88 = v27;
      _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] extracted lyrics for track: %lld from %{public}@ with error %{public}@", buf, 0x20u);
    }

    v7 = v25;
  }
  else
  {
    uint32_t v26 = 0;
  }
  uint64_t v29 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetTrackPathKey"];
  v75 = v18;
  v73 = (void *)v29;
  if (v29)
  {
    uint64_t v30 = v29;
    if ([v7 fileExistsAtPath:v29])
    {
      v68 = v22;
      id v31 = v7;
      v32 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetProtectionTypeKey"];
      uint64_t v33 = [v32 integerValue];

      [(ML3Track *)v12 populateLocationPropertiesWithPath:v30 protectionType:v33];
      v7 = v31;
      if (v20 == v21)
      {
        v22 = v68;
      }
      else
      {
        v22 = v68;
        if (!v26)
        {
          __int16 v34 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v84 = v72;
            _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] extracting new lyrics for track: %lld from the asset", buf, 0xCu);
          }

          id v35 = (void *)MEMORY[0x1E4F166C8];
          uint64_t v36 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v73 isDirectory:0];
          id v37 = [v35 assetWithURL:v36];

          if (v37)
          {
            uint32_t v26 = [v37 lyrics];
          }
          else
          {
            uint32_t v26 = 0;
          }
        }
      }
    }
  }
  if (v26)
  {
    [v22 addObject:v18];
    [v22 addObject:v26];
    [v77 addObject:@"lyrics.checksum"];
    [v77 addObject:@"lyrics.lyrics"];
  }
  v38 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadSourceContainerIDKey"];
  if (v38)
  {
    [v22 addObject:v38];
    [v77 addObject:@"download_source_container_pid"];
  }
  if ([v22 count])
  {
    [(ML3Entity *)v12 setValues:v22 forProperties:v77];
    v39 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v84 = (uint64_t)v22;
      __int16 v85 = 2048;
      uint64_t v86 = v72;
      v40 = "[ML3ProcessDownloadedAssetsOperation] updated values=%{public}@ for track:%lld";
      id v41 = v39;
      uint32_t v42 = 22;
LABEL_29:
      _os_log_impl(&dword_1B022D000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
    }
  }
  else
  {
    v39 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v84 = v72;
      v40 = "[ML3ProcessDownloadedAssetsOperation] track: %lld has no updated lyrics or enclosing container pid";
      id v41 = v39;
      uint32_t v42 = 12;
      goto LABEL_29;
    }
  }

  v43 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetArtworkPathKey"];
  if (v43 && [v7 fileExistsAtPath:v43])
  {
    v65 = v7;
    id v44 = [v76 objectForKey:@"media_type"];
    uint64_t v45 = [v44 unsignedIntValue];

    id v46 = self;
    v47 = [v76 objectForKey:@"chapter.chapter_data"];
    v69 = v12;
    v48 = [[ML3ArtworkTokenSet alloc] initWithEntity:v12 artworkType:1];
    int64_t v49 = [(ML3ProcessDownloadedAssetsOperation *)self _artworkSourceFromTrackSource:a4];
    v67 = v48;
    v50 = [(ML3ArtworkTokenSet *)v48 artworkTokenForSource:v49];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __78__ML3ProcessDownloadedAssetsOperation__processTrackAsset_forSource_withError___block_invoke;
      v78[3] = &unk_1E5FB2948;
      uint64_t v80 = v72;
      v78[4] = self;
      id v79 = v43;
      int v81 = v45;
      id v46 = self;
      +[MLITChapterTOC enumerateChapterTimesInFlattenedChapterData:v47 usingBlock:v78];
    }
    if (v50)
    {
      [(ML3ProcessDownloadedAssetsOperation *)v46 _processArtworkIdentifier:v43 artworkToken:v50 artworkType:1 mediaType:v45 sourceType:v49];
    }
    else
    {
      id v51 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v51, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] No artwork token - skiping", buf, 2u);
      }
    }
    [(ML3ProcessDownloadedAssetsOperation *)v46 _videoSnapshotTimeForMediaType:v45];
    v7 = v65;
    if (v52 >= 0.0)
    {
      double v53 = v52;
      if ([(ML3Track *)v69 needsVideoSnapshot]) {
        [(ML3Track *)v69 createVideoSnapshotAtTime:v53];
      }
    }

    id v12 = v69;
  }
  v54 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetGeniusDataPathKey"];
  if (v54)
  {
    v55 = v7;
    if ([v7 fileExistsAtPath:v54])
    {
      v70 = v12;
      v56 = [v76 objectForKey:@"item_extra.pending_genius_checksum"];
      uint64_t v57 = [v56 longLongValue];

      v58 = [v76 objectForKey:@"item_extra.genius_id"];
      if (v58)
      {
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v54];
        if (v59)
        {
          os_log_t v60 = (os_log_t)v59;
          BOOL v61 = [(ML3ProcessDownloadedAssetsOperation *)self _processGeniusPlist:v59 geniusIDString:v58 geniusChecksum:v57];
LABEL_56:

          id v12 = v70;
          goto LABEL_57;
        }
        v62 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v84 = v72;
          _os_log_impl(&dword_1B022D000, v62, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to parse genius data for track %lld - skiping", buf, 0xCu);
        }

        os_log_t v60 = 0;
      }
      else
      {
        os_log_t v60 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v84 = v72;
          _os_log_impl(&dword_1B022D000, v60, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] No genius id in data for track %lld - skiping", buf, 0xCu);
        }
      }
      BOOL v61 = 1;
      goto LABEL_56;
    }
  }
  else
  {
    v55 = v7;
  }
  BOOL v61 = 1;
LABEL_57:
  v63 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetTrackPropertiesKey"];
  if (_NSIsNSDictionary() && [v63 count]) {
    [(ML3Entity *)v12 setValuesForPropertiesWithDictionary:v63];
  }

  return v61;
}

void __78__ML3ProcessDownloadedAssetsOperation__processTrackAsset_forSource_withError___block_invoke(uint64_t a1, double a2)
{
  +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", *(void *)(a1 + 48));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = [NSString stringWithFormat:@"%@-%.f", *(void *)(a1 + 40), a2 * 1000.0];
  [v4 _processArtworkIdentifier:v5 artworkToken:v6 artworkType:3 mediaType:*(unsigned int *)(a1 + 56) sourceType:300];
}

- (BOOL)_execute:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = [(ML3DatabaseOperation *)self attributes];
  v5 = [v4 objectForKey:@"MLDatabaseOperationAttributeTrackSourceKey"];
  unsigned int v31 = [v5 intValue];

  uint64_t v30 = self;
  id v6 = [(ML3DatabaseOperation *)self attributes];
  v7 = [v6 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetsListKey"];

  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v40 = v31;
    *(_WORD *)&v40[4] = 2048;
    *(void *)&v40[6] = [v7 count];
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Beginning process assets operation with source %d (%lu downloads)", buf, 0x12u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v10 = v9;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v11)
  {
    id v13 = 0;
    BOOL v14 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  id v13 = 0;
  BOOL v14 = 0;
  uint64_t v15 = *(void *)v35;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v35 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
      id v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v40 = v17;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Processing asset download: %{public}@", buf, 0xCu);
      }

      uint64_t v19 = [v17 objectForKey:@"MLDatabaseOperationAttributeDownloadedAssetEntityTypeKey"];
      uint64_t v20 = [v19 integerValue];

      if (v20 == 1)
      {
        v32 = v13;
        BOOL v14 = [(ML3ProcessDownloadedAssetsOperation *)v30 _processContainerAsset:v17 forSource:v31 withError:&v32];
        uint64_t v21 = v32;
        goto LABEL_14;
      }
      if (!v20)
      {
        uint64_t v33 = v13;
        BOOL v14 = [(ML3ProcessDownloadedAssetsOperation *)v30 _processTrackAsset:v17 forSource:v31 withError:&v33];
        uint64_t v21 = v33;
LABEL_14:
        v22 = v13;
        id v13 = v21;
        goto LABEL_15;
      }
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v40 = v17;
        _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] got unknown entity type. attrs=%{public}@", buf, 0xCu);
      }
LABEL_15:

      ++v16;
    }
    while (v12 != v16);
    uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    uint64_t v12 = v23;
  }
  while (v23);
LABEL_22:

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v25 = v24;
  uint32_t v26 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v40 = v14;
    *(_WORD *)&v40[4] = 2048;
    *(double *)&v40[6] = v25 - v10;
    _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Process assets operation success=%d in %.3f seconds", buf, 0x12u);
  }

  if (a3) {
    *a3 = v13;
  }

  return v14;
}

- (unint64_t)type
{
  return 7;
}

- (ML3ProcessDownloadedAssetsOperation)initWithLibrary:(id)a3 writer:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ML3ProcessDownloadedAssetsOperation;
  v4 = [(ML3DatabaseOperation *)&v7 initWithLibrary:a3 writer:a4];
  v5 = v4;
  if (v4) {
    [(ML3ProcessDownloadedAssetsOperation *)v4 setQualityOfService:-1];
  }
  return v5;
}

@end