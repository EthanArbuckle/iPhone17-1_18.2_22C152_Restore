@interface BKAudiobookPersistenceMediaLibrary
- (BKAudiobookPersistenceMediaLibrary)init;
- (BOOL)isLocal;
- (NSString)shortName;
- (id)_mediaItemsFromAudiobook:(id)a3;
- (id)_mediaQueryFromAudiobook:(id)a3;
- (id)_representativeItemFromAudibook:(id)a3;
- (id)_storeIDFromAudiobook:(id)a3;
- (int64_t)eventThreshold;
- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4;
- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5;
@end

@implementation BKAudiobookPersistenceMediaLibrary

- (BKAudiobookPersistenceMediaLibrary)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookPersistenceMediaLibrary;
  result = [(BKAudiobookPersistenceMediaLibrary *)&v3 init];
  if (result) {
    result->_accessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (int64_t)eventThreshold
{
  return 1;
}

- (NSString)shortName
{
  return (NSString *)&stru_3D468;
}

- (BOOL)isLocal
{
  return 0;
}

- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isAudiobookPreview])
  {
    id v8 = objc_retainBlock(v7);
    v9 = v8;
    if (v8) {
      (*((void (**)(id, void, void, double))v8 + 2))(v8, 0, 0, 0.0);
    }

    goto LABEL_46;
  }
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v51 = self;
  v11 = [(BKAudiobookPersistenceMediaLibrary *)self _mediaItemsFromAudiobook:v6];
  v12 = [v11 firstObject];
  v13 = [v6 assetID];
  v14 = [v12 dateAccessed];
  v15 = [v12 valueForProperty:];
  v52 = 0;
  double v16 = 0.0;
  if ([v12 hasBeenPlayed])
  {
    if (v15 && v14 != 0)
    {
      [v15 doubleValue];
      double v16 = v18;
      v52 = v14;
      v19 = [v12 valueForProperty:MPMediaItemPropertyPlaybackDuration];
      [v19 doubleValue];
      double v21 = v20;

      if (v16 > v21) {
        double v16 = 0.0;
      }
      v22 = [(BKAudiobookPersistenceMediaLibrary *)v51 logInstance];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v60 = v13;
        __int16 v61 = 2048;
        double v62 = v16;
        __int16 v63 = 2112;
        v64 = v52;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Bookmark time base-case calculation for %@: bookmarkTime=%lf timestamp=%@", buf, 0x20u);
      }
    }
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    v49 = v15;
    v50 = p_accessLock;
    v45 = v14;
    v46 = v12;
    v47 = v11;
    id v48 = v7;
    id v44 = v6;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v11;
    id v23 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v23)
    {
      id v24 = v23;
      v25 = 0;
      char v26 = 0;
      uint64_t v27 = *(void *)v55;
      double v16 = 0.0;
      double v28 = 0.0;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v55 != v27) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v31 = [v30 dateAccessed:v44];
          unsigned int v32 = [v30 hasBeenPlayed];
          v33 = [v30 valueForProperty:MPMediaItemPropertyPlaybackDuration];
          [v33 doubleValue];
          double v35 = v34;

          v36 = [v30 valueForProperty:MPMediaItemPropertyBookmarkTime];
          [v36 doubleValue];
          double v38 = v37;

          if (v38 > v35) {
            double v38 = 0.0;
          }
          if (v32)
          {
            if (!v25 || [v31 compare:v25] == (char *)&dword_0 + 1)
            {
              id v39 = v31;

              v25 = v39;
            }
            double v16 = v28 + v38;
          }
          v26 |= v32;
          double v28 = v28 + v35;
        }
        id v24 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v24);
    }
    else
    {
      v25 = 0;
      char v26 = 0;
      double v16 = 0.0;
    }

    v40 = [(BKAudiobookPersistenceMediaLibrary *)v51 logInstance];
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if (v25 || (v26 & 1) != 0)
    {
      v11 = v47;
      id v7 = v48;
      v12 = v46;
      v14 = v45;
      if (v41)
      {
        *(_DWORD *)buf = 138412546;
        v60 = v13;
        __int16 v61 = 2048;
        double v62 = v16;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Bookmark time for %@ calculated to be %lf on read", buf, 0x16u);
      }

      id v6 = v44;
      if (!v25) {
        goto LABEL_42;
      }
      v40 = v52;
      v52 = v25;
    }
    else
    {
      double v16 = 0.0;
      v11 = v47;
      id v7 = v48;
      v12 = v46;
      v14 = v45;
      if (v41)
      {
        *(_DWORD *)buf = 138412290;
        v60 = v13;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Bookmark time for %@ calculated to be 0 on read because ((lastAccessedDate == nil) && !encounteredTrackWithHasBeenPlayedTrue)", buf, 0xCu);
      }
      id v6 = v44;
    }

LABEL_42:
    v15 = v49;
    p_accessLock = v50;
  }
  os_unfair_lock_unlock(p_accessLock);
  id v42 = objc_retainBlock(v7);
  v43 = v42;
  if (v42) {
    (*((void (**)(id, NSObject *, void, double))v42 + 2))(v42, v52, 0, v16);
  }

LABEL_46:
}

- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 isAudiobookPreview])
  {
    id v10 = objc_retainBlock(v9);
    v11 = v10;
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }

    goto LABEL_38;
  }
  id v43 = v9;
  os_unfair_lock_lock(&self->_accessLock);
  v12 = [(BKAudiobookPersistenceMediaLibrary *)self _mediaItemsFromAudiobook:v8];
  v45 = [v8 assetID];
  v13 = +[NSDate date];
  id v44 = v8;
  [v8 duration];
  if (v14 <= a3) {
    double v15 = v14;
  }
  else {
    double v15 = a3;
  }
  double v16 = [(BKAudiobookPersistenceMediaLibrary *)self logInstance];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v51 = v45;
    *(_WORD *)&v51[8] = 2048;
    *(double *)v52 = v15;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Setting media item bookmark time for %@ to %lf", buf, 0x16u);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v47;
    double v21 = 0.0;
    do
    {
      v22 = 0;
      double v23 = v21;
      do
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        id v24 = *(NSObject **)(*((void *)&v46 + 1) + 8 * (void)v22);
        v25 = [v24 valueForProperty:MPMediaItemPropertyPlaybackDuration];
        [v25 doubleValue];
        double v27 = v26;

        double v21 = v23 + v27;
        if (v15 > v23 + v27)
        {
          [v24 setDateAccessed:v13];
          [v24 setHasBeenPlayed:1];
          [v24 setValue:&off_3E130 forProperty:MPMediaItemPropertyBookmarkTime withCompletionBlock:0];
          double v28 = [(BKAudiobookPersistenceMediaLibrary *)self logInstance];
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          unsigned int v29 = [v17 indexOfObjectIdenticalTo:v24] + 1;
          unsigned int v30 = [v17 count];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = v29;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v30;
          *(_WORD *)v52 = 2112;
          *(void *)&v52[2] = v45;
          v31 = v28;
          unsigned int v32 = "Bookmark is NOT in item %u of %u of %@ on save. Setting hasBeenPlayed:YES, boomarkTime:0";
LABEL_25:
          uint32_t v36 = 24;
          goto LABEL_26;
        }
        if (v23 <= v15 && v15 <= v21)
        {
          [v24 setDateAccessed:v13];
          [v24 setHasBeenPlayed:1];
          v33 = +[NSNumber numberWithDouble:v15 - v23];
          [v24 setValue:v33 forProperty:MPMediaItemPropertyBookmarkTime withCompletionBlock:0];

          double v28 = [(BKAudiobookPersistenceMediaLibrary *)self logInstance];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v34 = [v17 indexOfObjectIdenticalTo:v24] + 1;
            unsigned int v35 = [v17 count];
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v51 = v34;
            *(_WORD *)&v51[4] = 1024;
            *(_DWORD *)&v51[6] = v35;
            *(_WORD *)v52 = 2112;
            *(void *)&v52[2] = v45;
            __int16 v53 = 2048;
            double v54 = v15 - v23;
            v31 = v28;
            unsigned int v32 = "Bookmark is in item %u of %u of %@ on save. hasBeenPlayed:YES localTime:%f";
            uint32_t v36 = 34;
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        if (v23 > v15)
        {
          [v24 setHasBeenPlayed:0];
          [v24 setValue:&off_3E130 forProperty:MPMediaItemPropertyBookmarkTime withCompletionBlock:0];
          double v28 = [(BKAudiobookPersistenceMediaLibrary *)self logInstance];
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          unsigned int v37 = [v17 indexOfObjectIdenticalTo:v24] + 1;
          unsigned int v38 = [v17 count];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = v37;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v38;
          *(_WORD *)v52 = 2112;
          *(void *)&v52[2] = v45;
          v31 = v28;
          unsigned int v32 = "Setting item %u of %u on %@ to hasBeenPlayed:NO boomarkTime:0";
          goto LABEL_25;
        }
        double v28 = [v17 lastObject];
        if (v24 != v28) {
          goto LABEL_27;
        }

        if (vabdd_f64(v15, v21) < 0.00999999978)
        {
          [v24 setDateAccessed:v13];
          [v24 setHasBeenPlayed:1];
          id v39 = +[NSNumber numberWithDouble:v27];
          [v24 setValue:v39 forProperty:MPMediaItemPropertyBookmarkTime withCompletionBlock:0];

          double v28 = [(BKAudiobookPersistenceMediaLibrary *)self logInstance];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v51 = v45;
            v31 = v28;
            unsigned int v32 = "Audiobook bookmark is at end of audiobook %@ on save";
            uint32_t v36 = 12;
LABEL_26:
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, v32, buf, v36);
          }
LABEL_27:
        }
        v22 = (char *)v22 + 1;
        double v23 = v23 + v27;
      }
      while (v19 != v22);
      id v40 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      id v19 = v40;
    }
    while (v40);
  }

  os_unfair_lock_unlock(&self->_accessLock);
  id v9 = v43;
  id v41 = objc_retainBlock(v43);
  id v42 = v41;
  if (v41) {
    (*((void (**)(id, void))v41 + 2))(v41, 0);
  }

  id v8 = v44;
LABEL_38:
}

- (id)_mediaItemsFromAudiobook:(id)a3
{
  objc_super v3 = [(BKAudiobookPersistenceMediaLibrary *)self _mediaQueryFromAudiobook:a3];
  v4 = [v3 items];

  return v4;
}

- (id)_representativeItemFromAudibook:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = BUDynamicCast();

  objc_opt_class();
  v5 = [v4 tracks];
  id v6 = [v5 firstObject];
  id v7 = BUDynamicCast();
  id v8 = [v7 mediaItem];

  return v8;
}

- (id)_mediaQueryFromAudiobook:(id)a3
{
  id v3 = [(BKAudiobookPersistenceMediaLibrary *)self _representativeItemFromAudibook:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 valueForProperty:MPMediaItemPropertyAlbumTitle];
    if (v5)
    {
      id v6 = +[MPMediaQuery bk_audiobooksQuery];
      id v7 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:MPMediaItemPropertyAlbumTitle];
      [v6 addFilterPredicate:v7];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_storeIDFromAudiobook:(id)a3
{
  id v3 = [(BKAudiobookPersistenceMediaLibrary *)self _representativeItemFromAudibook:a3];
  objc_opt_class();
  v4 = [v3 valueForProperty:MPMediaItemPropertyStorePlaylistID];
  v5 = BUDynamicCast();

  objc_opt_class();
  id v6 = [v3 valueForProperty:MPMediaItemPropertyStoreID];
  id v7 = BUDynamicCast();

  if ([v5 unsignedLongLongValue]) {
    id v8 = v5;
  }
  else {
    id v8 = v7;
  }
  id v9 = [v8 stringValue];

  return v9;
}

@end