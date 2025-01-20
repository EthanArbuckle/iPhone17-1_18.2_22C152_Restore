@interface ICCloudContentTasteUpdateOperation
- (ICCloudContentTasteUpdateItem)requestItem;
- (ICCloudContentTasteUpdateOperation)init;
- (ICCloudContentTasteUpdateOperation)initWithContentTasteUpdateItem:(id)a3 invalidateLocalCache:(BOOL)a4 configuration:(id)a5 operationIdentifier:(id)a6;
- (ICCloudContentTasteUpdateResponse)contentTasteUpdateResponse;
- (NSError)error;
- (NSString)operationIdentifier;
- (id)_contentTasteUpdateResponseWithServerResponse:(id)a3 expirationDate:(id)a4 revisionID:(unint64_t)a5 isCachedResponse:(BOOL)a6;
- (id)_prepareCachedResponseFromResponse:(id)a3 byAddingResponseTimeIntervalKey:(BOOL)a4 withResponseTimeInterval:(id)a5;
- (void)_getPBData:(id *)a3 includedContentTasteItemUpdates:(id *)a4 fromContentTasteUpdateItems:(id)a5;
- (void)_getStoreAdamIDLikedState:(id *)a3 playlistGlobalIDLikedState:(id *)a4 artistStoreAdamIDLikedState:(id *)a5;
- (void)_prepareContentTasteResponse:(id *)a3 withContentTasteItems:(id *)a4 fromCachedContentTasteResponseItems:(id)a5 includedContentTasteItems:(id)a6;
- (void)_setCachedContentTasteResponse:(id)a3;
- (void)_updateContentTasteForAlbumArtistItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6;
- (void)_updateContentTasteForGlobalPlaylists:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6;
- (void)_updateContentTasteForMediaItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6;
- (void)main;
- (void)setError:(id)a3;
@end

@implementation ICCloudContentTasteUpdateOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTasteUpdateResponse, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_operationIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_contentTasteItem, 0);
}

- (ICCloudContentTasteUpdateResponse)contentTasteUpdateResponse
{
  return self->_contentTasteUpdateResponse;
}

- (void)setError:(id)a3
{
}

- (void)_updateContentTasteForGlobalPlaylists:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v54 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating content taste for %lu global playlists", buf, 0xCu);
  }

  if ([v10 count])
  {
    v34 = self;
    v35 = (void (**)(void, void, void, void))v13;
    v15 = [v10 allKeys];
    double v16 = COERCE_DOUBLE([v15 mutableCopy]);

    v36 = v11;
    v40 = [v11 checkoutReaderConnection];
    +[NSDate timeIntervalSinceReferenceDate];
    double v18 = v17;
    v37 = +[ML3DatabaseStatementRenderer defaultRenderer];
    v39 = +[NSMutableArray array];
    v38 = +[NSMutableArray array];
    id v19 = [*(id *)&v16 count];
    if (v19)
    {
      unint64_t v20 = (unint64_t)v19;
      do
      {
        v21 = v10;
        if (v20 >= 0xFA) {
          *(void *)&double v22 = 250;
        }
        else {
          double v22 = *(double *)&v20;
        }
        v23 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          id v54 = (id)v20;
          __int16 v55 = 2048;
          double v56 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "processing playlists with pendingplayListCount: %lu, currentBatchCount: %lu", buf, 0x16u);
        }

        v24 = [v37 statementWithPrefix:@"SELECT container_pid, liked_state, cloud_global_id FROM container WHERE cloud_global_id", *(void *)&v22 inParameterCount];
        v25 = objc_msgSend(*(id *)&v16, "subarrayWithRange:", (char *)objc_msgSend(*(id *)&v16, "count") - v20, *(void *)&v22);
        v26 = [v40 executeQuery:v24 withParameters:v25];

        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100115620;
        v48[3] = &unk_1001BE8A8;
        id v49 = *(id *)&v16;
        id v10 = v21;
        id v50 = v21;
        id v51 = v39;
        id v52 = v38;
        [v26 enumerateRowsWithBlock:v48];
        v20 -= *(void *)&v22;
      }
      while (*(double *)&v20 != 0.0);
    }
    id v11 = v36;
    [v36 checkInDatabaseConnection:v40];
    unsigned int v27 = [(ICCloudContentTasteUpdateOperation *)v34 isCancelled];
    v28 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      id v13 = v35;
      if (v29)
      {
        *(_DWORD *)buf = 138543362;
        id v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ is cancelled", buf, 0xCu);
      }

      if (v35) {
        v35[2](v35, 0, 0, 0);
      }
    }
    else
    {
      id v13 = v35;
      if (v29)
      {
        id v30 = [*(id *)&v16 count];
        *(_DWORD *)buf = 134218242;
        id v54 = v30;
        __int16 v55 = 2112;
        double v56 = v16;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Playlist Import [Count:(%lu) - Ids:(%@)]", buf, 0x16u);
      }

      if ([*(id *)&v16 count])
      {
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100115828;
        v41[3] = &unk_1001BE9C0;
        v46 = v35;
        v41[4] = v34;
        id v42 = v10;
        id v43 = v39;
        id v44 = v38;
        id v45 = *(id *)&v16;
        double v47 = v18;
        [v12 addNonLibraryOwnedPlaylistsWithGlobalIDs:v45 completion:v41];
      }
      else
      {
        v31 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [*(id *)&v16 count];
          +[NSDate timeIntervalSinceReferenceDate];
          *(_DWORD *)buf = 134218240;
          id v54 = v32;
          __int16 v55 = 2048;
          double v56 = v33 - v18;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Finished loading content taste for %lu playlists in %3f seconds", buf, 0x16u);
        }

        if (v35) {
          ((void (**)(void, void *, void *, void))v35)[2](v35, v39, v38, 0);
        }
      }
    }
  }
  else if (v13)
  {
    (*((void (**)(id, void, void, void))v13 + 2))(v13, 0, 0, 0);
  }
}

- (void)_updateContentTasteForMediaItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6
{
  id v63 = a3;
  id v52 = a4;
  id v49 = a5;
  id v51 = a6;
  v9 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v63 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating content taste for %lu items", (uint8_t *)&buf, 0xCu);
  }

  if ([v63 count])
  {
    v62 = [v52 checkoutReaderConnection];
    +[NSDate timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = [v63 allKeys];
    id v13 = [v12 mutableCopy];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v96 = 0x3032000000;
    v97 = sub_1001167F8;
    v98 = sub_100116808;
    id v99 = 0;
    v59 = +[NSMutableArray array];
    v60 = +[NSMutableArray array];
    v53 = +[NSMutableArray array];
    id v54 = +[NSMutableArray array];
    v61 = +[ML3DatabaseStatementRenderer defaultRenderer];
    id v50 = [v52 valueForDatabaseProperty:@"NonMediaItemStoreAdamIds"];
    if ([v50 length])
    {
      v14 = [v50 componentsSeparatedByString:@"$"];
      uint64_t v15 = [v14 valueForKey:@"longLongValue"];
      double v16 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v15;

      [v13 removeObjectsInArray:*(void *)(*((void *)&buf + 1) + 40)];
      double v17 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [*(id *)(*((void *)&buf + 1) + 40) count];
        uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v91 = 134218242;
        *(void *)&v91[4] = v18;
        *(_WORD *)&v91[12] = 2112;
        *(void *)&v91[14] = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing [Count:(%lu), items:(%@)] non media items from import list", v91, 0x16u);
      }
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"store_item_id", @"subscription_store_item_id", 0);
    id v57 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
    if (v57)
    {
      uint64_t v56 = *(void *)v88;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v88 != v56) {
            objc_enumerationMutation(obj);
          }
          unint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v87 + 1) + 8 * i);
          v21 = [v13 count];
          for (j = objc_msgSend(@"SELECT item_pid, liked_state, store_item_id, subscription_store_item_id, store_saga_id, is_subscription FROM item_store JOIN item_stats USING (item_pid) WHERE ", "stringByAppendingString:", v20);
          {
            if ((unint64_t)v21 >= 0xFA) {
              uint64_t v23 = 250;
            }
            else {
              uint64_t v23 = (uint64_t)v21;
            }
            v24 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v91 = 134218498;
              *(void *)&v91[4] = v21;
              *(_WORD *)&v91[12] = 2048;
              *(void *)&v91[14] = v23;
              *(_WORD *)&v91[22] = 2112;
              v92 = v20;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "processing tracks with pendingItemCount: %lu, currentBatchCount: %lu for property: %@", v91, 0x20u);
            }

            v25 = [v61 statementWithPrefix:j inParameterCount:v23];
            v26 = objc_msgSend(v13, "subarrayWithRange:", (unsigned char *)objc_msgSend(v13, "count") - v21, v23);
            unsigned int v27 = [v62 executeQuery:v25 withParameters:v26];
            v82[0] = _NSConcreteStackBlock;
            v82[1] = 3221225472;
            v82[2] = sub_100116810;
            v82[3] = &unk_1001BE948;
            v82[4] = v20;
            id v83 = v13;
            id v84 = v63;
            id v85 = v59;
            id v86 = v60;
            [v27 enumerateRowsWithBlock:v82];
          }
        }
        id v57 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
      }
      while (v57);
    }

    for (k = [v13 count]; k; k -= v29)
    {
      if ((unint64_t)k >= 0xFA) {
        uint64_t v29 = 250;
      }
      else {
        uint64_t v29 = (uint64_t)k;
      }
      id v30 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v91 = 134218240;
        *(void *)&v91[4] = k;
        *(_WORD *)&v91[12] = 2048;
        *(void *)&v91[14] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "processing albums with pendingItemCount: %lu, currentBatchCount: %lu", v91, 0x16u);
      }

      v31 = [v61 statementWithPrefix:@"SELECT album_pid, liked_state, store_playlist_id, item_store.item_pid, item_store.store_saga_id, item_store.is_subscription FROM album JOIN item_store ON (album.representative_item_pid == item_store.ROWID) WHERE item_store.store_playlist_id", v29 inParameterCount];
      id v32 = objc_msgSend(v13, "subarrayWithRange:", (unsigned char *)objc_msgSend(v13, "count") - k, v29);
      double v33 = [v62 executeQuery:v31 withParameters:v32];

      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100116C24;
      v77[3] = &unk_1001BE8A8;
      id v78 = v13;
      id v79 = v63;
      id v80 = v53;
      id v81 = v54;
      [v33 enumerateRowsWithBlock:v77];
    }
    [v52 checkInDatabaseConnection:v62];
    unsigned int v34 = [(ICCloudContentTasteUpdateOperation *)self isCancelled];
    v35 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v36)
      {
        *(_DWORD *)v91 = 138543362;
        *(void *)&v91[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ is cancelled", v91, 0xCu);
      }

      if (!v51) {
        goto LABEL_44;
      }
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
    }
    else
    {
      if (v36)
      {
        id v41 = [v60 count];
        id v42 = [v54 count];
        id v43 = (uint64_t (*)(uint64_t, uint64_t))[v13 count];
        *(_DWORD *)v91 = 134218754;
        *(void *)&v91[4] = v41;
        *(_WORD *)&v91[12] = 2048;
        *(void *)&v91[14] = v42;
        *(_WORD *)&v91[22] = 2048;
        v92 = v43;
        LOWORD(v93) = 2112;
        *(void *)((char *)&v93 + 2) = v13;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "updated [tracks:(%lu) albums:(%lu)] new items to import[count:(%lu) items:(%@)]", v91, 0x2Au);
      }

      if ([v13 count])
      {
        *(void *)v91 = 0;
        *(void *)&v91[8] = v91;
        *(void *)&v91[16] = 0x3032000000;
        v92 = sub_1001167F8;
        *(void *)&long long v93 = sub_100116808;
        *((void *)&v93 + 1) = 0;
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_100116F68;
        v64[3] = &unk_1001BE970;
        id v65 = v13;
        id v73 = v51;
        id v66 = v59;
        id v67 = v60;
        id v68 = v53;
        id v69 = v54;
        v70 = self;
        id v71 = v52;
        id v72 = v63;
        p_long long buf = &buf;
        v75 = v91;
        double v76 = v11;
        [v49 addStoreItemIDs:v65 andAddTracksToCloudLibrary:0 withCompletion:v64];

        _Block_object_dispose(v91, 8);
LABEL_44:

        _Block_object_dispose(&buf, 8);
        goto LABEL_45;
      }
      id v45 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = [v13 count];
        +[NSDate timeIntervalSinceReferenceDate];
        *(_DWORD *)v91 = 134218240;
        *(void *)&v91[4] = v46;
        *(_WORD *)&v91[12] = 2048;
        *(double *)&v91[14] = v47 - v11;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Finished loading content taste for %lu items/albums in %3f seconds", v91, 0x16u);
      }

      v37 = v59;
      v38 = v60;
      v39 = v53;
      v40 = v54;
      if (!v51) {
        goto LABEL_44;
      }
    }
    (*((void (**)(id, void *, void *, void *, void *, void, void))v51 + 2))(v51, v37, v38, v39, v40, 0, 0);
    goto LABEL_44;
  }
  if (v51) {
    (*((void (**)(id, void, void, void, void, void, void))v51 + 2))(v51, 0, 0, 0, 0, 0, 0);
  }
LABEL_45:
}

- (void)_updateContentTasteForAlbumArtistItems:(id)a3 musicLibrary:(id)a4 mediaLibrary:(id)a5 withCompletion:(id)a6
{
  id v9 = a3;
  id v48 = a4;
  id v44 = a5;
  id v47 = a6;
  uint64_t v10 = (uint64_t)[v9 count];
  double v11 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating content taste for %lu album artists", (uint8_t *)&buf, 0xCu);
  }

  if (v10)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v13 = v12;
    id v51 = [v48 checkoutReaderConnection];
    v14 = [v9 allKeys];
    id v15 = [v14 mutableCopy];

    id v50 = +[NSMutableArray array];
    id v49 = +[NSMutableArray array];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v76 = 0x3032000000;
    v77 = sub_1001167F8;
    id v78 = sub_100116808;
    id v79 = 0;
    id v45 = [v48 valueForDatabaseProperty:@"ArtistsMatchingDifferentStoreAdamIds"];
    if ([v45 length])
    {
      id v16 = objc_alloc((Class)NSSet);
      uint64_t v17 = objc_opt_class();
      id v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
      id v46 = MSVUnarchivedObjectOfClasses();

      if (_NSIsNSArray())
      {
        [v15 removeObjectsInArray:v46];
        uint64_t v10 = (uint64_t)[v15 count];
        uint64_t v19 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v46 count];
          *(_DWORD *)id v80 = 134218498;
          *(void *)&v80[4] = v20;
          *(_WORD *)&v80[12] = 2112;
          *(void *)&v80[14] = v46;
          *(_WORD *)&v80[22] = 1024;
          LODWORD(v81) = v10;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Removing [Count:(%lu), artists:(%@)] mapped to different store_ids, pendingItemsCount=%d", v80, 0x1Cu);
        }

LABEL_13:
        if (v10 >= 1)
        {
          do
          {
            if ((unint64_t)v10 >= 0xFA) {
              uint64_t v21 = 250;
            }
            else {
              uint64_t v21 = v10;
            }
            double v22 = +[ML3DatabaseStatementRenderer defaultRenderer];
            uint64_t v23 = [v22 statementWithPrefix:@"SELECT album_artist_pid, liked_state, cloud_universal_library_id, store_id FROM album_artist WHERE store_id ", v21 inParameterCount];
            v24 = objc_msgSend(v15, "subarrayWithRange:", (char *)objc_msgSend(v15, "count") - v10, v21);
            v25 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v80 = 134218240;
              *(void *)&v80[4] = v10;
              *(_WORD *)&v80[12] = 2048;
              *(void *)&v80[14] = v21;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "processing album artists with pendingItemCount: %lu, currentBatchCount: %lu", v80, 0x16u);
            }

            v26 = [v51 executeQuery:v23 withParameters:v24];
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_100118134;
            v66[3] = &unk_1001BE8A8;
            id v67 = v15;
            id v68 = v9;
            id v69 = v50;
            id v70 = v49;
            [v26 enumerateRowsWithBlock:v66];

            BOOL v27 = v10 <= v21;
            v10 -= v21;
          }
          while (!v27);
        }
        [v48 checkInDatabaseConnection:v51];
        if ([(ICCloudContentTasteUpdateOperation *)self isCancelled])
        {
          v28 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v80 = 138543362;
            *(void *)&v80[4] = self;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ is cancelled", v80, 0xCu);
          }

          if (!v47) {
            goto LABEL_37;
          }
          uint64_t v29 = 0;
          id v30 = 0;
          uint64_t v31 = 0;
        }
        else
        {
          if ([v15 count])
          {
            +[NSMutableArray array];
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_1001183F0;
            v64[3] = &unk_1001BE8D0;
            id v33 = (id)objc_claimAutoreleasedReturnValue();
            id v65 = v33;
            [v15 enumerateObjectsUsingBlock:v64];
            uint64_t v71 = 0;
            id v72 = &v71;
            uint64_t v73 = 0x2050000000;
            unsigned int v34 = (void *)qword_1001F3AA8;
            uint64_t v74 = qword_1001F3AA8;
            if (!qword_1001F3AA8)
            {
              *(void *)id v80 = _NSConcreteStackBlock;
              *(void *)&v80[8] = 3221225472;
              *(void *)&v80[16] = sub_100118510;
              id v81 = &unk_1001BE9E8;
              v82 = &v71;
              sub_100118510((uint64_t)v80);
              unsigned int v34 = (void *)v72[3];
            }
            v35 = v34;
            _Block_object_dispose(&v71, 8);
            id v36 = [[v35 alloc] initUsingLocalDeviceLibraryDestinationWithImportElements:v33 referralObject:0 usingLocalLibraryDestination:0 usingCloudLibraryDestination:0];
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_1001185D8;
            v52[3] = &unk_1001BE920;
            id v37 = v33;
            id v53 = v37;
            id v61 = v47;
            id v54 = self;
            id v55 = v48;
            id v56 = v9;
            id v57 = v50;
            id v58 = v49;
            id v59 = v15;
            double v63 = v13;
            id v60 = v46;
            p_long long buf = &buf;
            [v44 performStoreAlbumArtistLibraryImport:v36 withCompletion:v52];

            goto LABEL_37;
          }
          v38 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            id v39 = [v15 count];
            +[NSDate timeIntervalSinceReferenceDate];
            *(_DWORD *)id v80 = 134218240;
            *(void *)&v80[4] = v39;
            *(_WORD *)&v80[12] = 2048;
            *(double *)&v80[14] = v40 - v13;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Finished loading content taste for %lu album artists in %3f seconds", v80, 0x16u);
          }

          [v15 addObjectsFromArray:v46];
          if ([v15 count])
          {
            uint64_t v41 = MSVArchivedDataWithRootObject();
            id v42 = *(void **)(*((void *)&buf + 1) + 40);
            *(void *)(*((void *)&buf + 1) + 40) = v41;
          }
          if (!v47) {
            goto LABEL_37;
          }
          uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
          id v30 = v49;
          uint64_t v29 = v50;
        }
        (*((void (**)(id, void *, void *, uint64_t, void))v47 + 2))(v47, v29, v30, v31, 0);
LABEL_37:

        _Block_object_dispose(&buf, 8);
        goto LABEL_38;
      }

      [v48 databaseConnectionAllowingWrites:1 withBlock:&stru_1001BE880];
    }
    id v46 = 0;
    goto LABEL_13;
  }
  if (v47) {
    (*((void (**)(id, void, void, void, void))v47 + 2))(v47, 0, 0, 0, 0);
  }
LABEL_38:
}

- (void)_prepareContentTasteResponse:(id *)a3 withContentTasteItems:(id *)a4 fromCachedContentTasteResponseItems:(id)a5 includedContentTasteItems:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = objc_alloc_init((Class)NSMutableSet);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100119144;
  v41[3] = &unk_1001BE840;
  id v28 = objc_alloc_init((Class)NSMutableSet);
  id v42 = v28;
  id v27 = v11;
  id v43 = v27;
  double v12 = objc_retainBlock(v41);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (((unsigned int (*)(void *, uint64_t))v12[2])(v12, v18))
        {
          objc_msgSend(v9, "addObject:", v18, v27, v28);
          [v10 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v15);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v7;
  id v20 = [v19 countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        if (((unsigned int (*)(void *, uint64_t))v12[2])(v12, v24))
        {
          [v9 addObject:v24];
          [v10 addObject:v24];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v21);
  }

  id v32 = 0;
  [(ICCloudContentTasteUpdateOperation *)self _getPBData:&v32 includedContentTasteItemUpdates:0 fromContentTasteUpdateItems:v10];
  id v25 = v32;
  v26 = v25;
  if (a3) {
    *a3 = v25;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (id)_prepareCachedResponseFromResponse:(id)a3 byAddingResponseTimeIntervalKey:(BOOL)a4 withResponseTimeInterval:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 userInfo];
  id v10 = [v9 mutableCopy];

  if (v5)
  {
    if (v7)
    {
      if (!v10) {
        id v10 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
      }
      [v10 setObject:v7 forKey:@"_MediaContentTasteUpdateResponseTimeIntervalSinceReferenceDate"];
    }
  }
  else
  {
    [v10 removeObjectForKey:@"_MediaContentTasteUpdateResponseTimeIntervalSinceReferenceDate"];
    if (![v10 count])
    {

      id v10 = 0;
    }
  }
  id v11 = objc_alloc((Class)NSCachedURLResponse);
  double v12 = [v8 response];
  id v13 = [v8 data];
  id v14 = [v8 storagePolicy];

  id v15 = [v11 initWithResponse:v12 data:v13 userInfo:v10 storagePolicy:v14];

  return v15;
}

- (void)_setCachedContentTasteResponse:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudContentTasteResponseCacheManager sharedCloudContentTasteResponseCacheManager];
  [v5 setCachedContentTasteUpdateResponse:v4 forConnectionConfiguration:self->_configuration];
}

- (void)_getStoreAdamIDLikedState:(id *)a3 playlistGlobalIDLikedState:(id *)a4 artistStoreAdamIDLikedState:(id *)a5
{
  id v30 = +[NSMutableDictionary dictionary];
  id v28 = +[NSMutableDictionary dictionary];
  id v29 = +[NSMutableDictionary dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v27 = self;
  v6 = [(ICCloudContentTasteUpdateResponse *)self->_contentTasteUpdateResponse contentTasteItems];
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v11 storeID];
        id v13 = [v11 contentTasteType];
        id v14 = v13;
        uint64_t v15 = 1;
        if (v13 == (id)1) {
          uint64_t v15 = 2;
        }
        if (v13 == (id)2) {
          uint64_t v16 = 3;
        }
        else {
          uint64_t v16 = v15;
        }
        uint64_t v17 = [v11 updateActionTimeStamp];
        if (!v12)
        {
          uint64_t v18 = [v11 globalPlaylistID];
          if (![v18 length]) {
            goto LABEL_22;
          }
          id v19 = +[NSNumber numberWithInteger:v16];
          v35[0] = v19;
          v35[1] = v17;
          id v20 = +[NSArray arrayWithObjects:v35 count:2];
          id v21 = v29;
          uint64_t v22 = v20;
          uint64_t v23 = v18;
          goto LABEL_21;
        }
        if ([v11 contentTasteItem] != (id)8)
        {
          uint64_t v18 = +[NSNumber numberWithInteger:v16];
          v36[0] = v18;
          v36[1] = v17;
          id v19 = +[NSArray arrayWithObjects:v36 count:2];
          id v20 = +[NSNumber numberWithLongLong:v12];
          id v21 = v30;
LABEL_20:
          uint64_t v22 = v19;
          uint64_t v23 = v20;
LABEL_21:
          [v21 setObject:v22 forKey:v23];

          goto LABEL_22;
        }
        if (v14 != (id)1)
        {
          uint64_t v18 = +[NSNumber numberWithInteger:v16];
          v37[0] = v18;
          v37[1] = v17;
          id v19 = +[NSArray arrayWithObjects:v37 count:2];
          id v20 = +[NSNumber numberWithLongLong:v12];
          id v21 = v28;
          goto LABEL_20;
        }
        uint64_t v18 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          long long v39 = v27;
          __int16 v40 = 2114;
          uint64_t v41 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip setting tasteType for content taste item=%{public}@", buf, 0x16u);
        }
LABEL_22:
      }
      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v8);
  }

  if (a3) {
    *a3 = v30;
  }
  if (a4) {
    *a4 = v29;
  }
  if (a5) {
    *a5 = v28;
  }
}

- (id)_contentTasteUpdateResponseWithServerResponse:(id)a3 expirationDate:(id)a4 revisionID:(unint64_t)a5 isCachedResponse:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = [[ICCloudContentTastePBFusePreferences alloc] initWithData:v10];
  __int16 v40 = v11;
  unint64_t v39 = a5;
  long long v37 = self;
  long long v38 = v12;
  if (!v12)
  {
    id v14 = 0;
LABEL_6:
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  id v13 = v12->_preferences;
  id v14 = v13;
  if (!v13 || ![(NSMutableArray *)v13 count]) {
    goto LABEL_6;
  }
  uint64_t v15 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)v14 count]];
LABEL_7:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v14;
  id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (!v16) {
    goto LABEL_46;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v43;
  do
  {
    id v19 = 0;
    do
    {
      if (*(void *)v43 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v19);
      id v21 = objc_alloc_init(ICCloudContentTasteUpdateItem);
      uint64_t v22 = v21;
      if (v20)
      {
        [(ICCloudContentTasteUpdateItem *)v21 setStoreID:*(void *)(v20 + 16)];
        int v23 = *(_DWORD *)(v20 + 40);
        if (v23 == 2) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = v23 == 1;
        }
        [(ICCloudContentTasteUpdateItem *)v22 setContentTasteType:v24];
        if ((*(unsigned char *)(v20 + 48) & 8) != 0)
        {
          int v26 = *(_DWORD *)(v20 + 44);
          uint64_t v27 = 4;
          if (v26 != 46) {
            uint64_t v27 = 0;
          }
          if (v26 == 20) {
            uint64_t v27 = 8;
          }
          if (v26 == 5) {
            uint64_t v27 = 2;
          }
          uint64_t v28 = 3;
          if (v26 != 2) {
            uint64_t v28 = 0;
          }
          if (v26 == 1) {
            uint64_t v28 = 1;
          }
          if (v26 <= 4) {
            uint64_t v25 = v28;
          }
          else {
            uint64_t v25 = v27;
          }
        }
        else
        {
          uint64_t v25 = 0;
        }
        [(ICCloudContentTasteUpdateItem *)v22 setContentTasteItem:v25];
        uint64_t v29 = *(void *)(v20 + 8);
      }
      else
      {
        [(ICCloudContentTasteUpdateItem *)v21 setStoreID:0];
        [(ICCloudContentTasteUpdateItem *)v22 setContentTasteType:0];
        [(ICCloudContentTasteUpdateItem *)v22 setContentTasteItem:0];
        uint64_t v29 = 0;
      }
      id v30 = +[NSDate dateWithTimeIntervalSince1970:(double)(uint64_t)((double)v29 / 1000.0)];
      [(ICCloudContentTasteUpdateItem *)v22 setUpdateActionTimeStamp:v30];

      if ((id)[(ICCloudContentTasteUpdateItem *)v22 contentTasteItem] == (id)4)
      {
        if (v20) {
          long long v31 = *(void **)(v20 + 32);
        }
        else {
          long long v31 = 0;
        }
LABEL_35:
        id v32 = v31;
        [(ICCloudContentTasteUpdateItem *)v22 setGlobalPlaylistID:v32];

        goto LABEL_37;
      }
      if (![(ICCloudContentTasteUpdateItem *)v22 contentTasteItem]
        && ![(ICCloudContentTasteUpdateItem *)v22 storeID])
      {
        if (v20)
        {
          long long v31 = *(void **)(v20 + 32);
          if (v31) {
            goto LABEL_35;
          }
        }
      }
LABEL_37:
      [v15 addObject:v22];

      id v19 = (char *)v19 + 1;
    }
    while (v17 != v19);
    id v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    id v17 = v33;
  }
  while (v33);
LABEL_46:

  long long v34 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste_Oversize");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138544386;
    id v47 = v37;
    __int16 v48 = 2114;
    id v49 = v15;
    __int16 v50 = 2114;
    id v51 = v40;
    __int16 v52 = 2048;
    unint64_t v53 = v39;
    __int16 v54 = 1024;
    BOOL v55 = v6;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ prepared %{public}@ content taste update items with expiration date %{public}@, revisionID %llu, isCached %d from server response", buf, 0x30u);
  }

  long long v35 = objc_alloc_init(ICCloudContentTasteUpdateResponse);
  [(ICCloudContentTasteUpdateResponse *)v35 setContentTasteItems:v15];
  [(ICCloudContentTasteUpdateResponse *)v35 setExpirationDate:v40];
  [(ICCloudContentTasteUpdateResponse *)v35 setCachedResponse:v6];
  [(ICCloudContentTasteUpdateResponse *)v35 setResponseRevisionID:v39];

  return v35;
}

- (void)_getPBData:(id *)a3 includedContentTasteItemUpdates:(id *)a4 fromContentTasteUpdateItems:(id)a5
{
  id v32 = a3;
  id v6 = a5;
  id v7 = v6;
  id v33 = a4;
  if (v6 && [v6 count])
  {
    if (a4)
    {
      id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count", v32));
  }
  else
  {
    uint64_t v9 = 0;
    id v8 = 0;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v13);
        uint64_t v15 = objc_alloc_init(ICCloudContentTastePBFuseItemPreference);
        id v16 = [v14 storeID];
        if (v15)
        {
          *(unsigned char *)&v15->_has |= 2u;
          v15->_adamId = (int64_t)v16;
          id v17 = [v14 globalPlaylistID];
          objc_storeStrong((id *)&v15->_externalId, v17);

          id v18 = [v14 contentTasteType];
          int v19 = v18 == (id)1;
          if (v18 == (id)2) {
            int v19 = 2;
          }
          v15->_preference = v19;
          *(unsigned char *)&v15->_has |= 8u;
          v15->_preferenceType = 0;
        }
        else
        {
          [v14 globalPlaylistID];

          [v14 contentTasteType];
        }
        uint64_t v20 = objc_msgSend(v14, "updateActionTimeStamp", v32);
        [v20 timeIntervalSinceNow];
        double v22 = v21;

        if (v15)
        {
          *(unsigned char *)&v15->_has |= 4u;
          v15->_createdOffsetMillis = 1000 * (uint64_t)fmax(-v22, 0.0);
        }
        int v23 = [v14 updateActionTimeStamp];
        [v23 timeIntervalSince1970];
        double v25 = v24;

        if (v15)
        {
          *(unsigned char *)&v15->_has |= 1u;
          v15->_int64_t actionTimestampMillis = (uint64_t)(v25 * 1000.0);
        }
        int v26 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          if (v15) {
            int64_t actionTimestampMillis = v15->_actionTimestampMillis;
          }
          else {
            int64_t actionTimestampMillis = 0;
          }
          *(_DWORD *)long long buf = 138543874;
          uint64_t v41 = self;
          __int16 v42 = 2114;
          long long v43 = v14;
          __int16 v44 = 2048;
          int64_t v45 = actionTimestampMillis;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding content taste item=%{public}@. actionTimestampMillis=%lld", buf, 0x20u);
        }

        [v9 addObject:v15];
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v28 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      id v11 = v28;
    }
    while (v28);
  }

  uint64_t v29 = v32;
  if (v32)
  {
    if (![v9 count])
    {
      *id v32 = 0;
      if (!v33) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    id v30 = objc_alloc_init(ICCloudContentTastePBFusePreferences);
    long long v31 = v30;
    if (v30) {
      objc_storeStrong((id *)&v30->_preferences, v9);
    }
    *uint64_t v29 = [(ICCloudContentTastePBFusePreferences *)v31 data];
  }
  if (v33) {
LABEL_36:
  }
    *id v33 = v8;
LABEL_37:
}

- (void)main
{
  if ([(ICCloudContentTasteUpdateOperation *)self isCancelled])
  {
    v3 = +[NSError errorWithDomain:ICErrorDomain code:-7004 userInfo:0];
    error = self->_error;
    self->_error = v3;
    _objc_release_x1(v3, error);
  }
  else
  {
    id v5 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
    id v6 = objc_alloc((Class)ICStoreRequestContext);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10011A32C;
    v23[3] = &unk_1001BE6B0;
    id v7 = v5;
    id v24 = v7;
    id v8 = [v6 initWithBlock:v23];
    uint64_t v9 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v7];
    unsigned int v10 = [v9 privacyAcknowledgementRequiredForMusic];

    if (v10)
    {
      id v11 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        int v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping content tast update because privacy acknowledgement is required", buf, 0xCu);
      }

      uint64_t v12 = +[NSError errorWithDomain:ICErrorDomain code:-7007 userInfo:0];
      id v13 = self->_error;
      self->_error = v12;
    }
    else
    {
      +[NSDate timeIntervalSinceReferenceDate];
      uint64_t v15 = v14;
      dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
      id v17 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        int v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting content taste update for media entities", buf, 0xCu);
      }

      id v18 = +[ICURLBagProvider sharedBagProvider];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10011A3A0;
      v19[3] = &unk_1001BE818;
      v19[4] = self;
      uint64_t v22 = v15;
      id v20 = v8;
      dispatch_semaphore_t v21 = v16;
      id v13 = v16;
      [v18 getBagForRequestContext:v20 withCompletionHandler:v19];

      dispatch_semaphore_wait(&v13->super, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

- (NSError)error
{
  return self->_error;
}

- (ICCloudContentTasteUpdateItem)requestItem
{
  return self->_contentTasteItem;
}

- (NSString)operationIdentifier
{
  return self->_operationIdentifier;
}

- (ICCloudContentTasteUpdateOperation)initWithContentTasteUpdateItem:(id)a3 invalidateLocalCache:(BOOL)a4 configuration:(id)a5 operationIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICCloudContentTasteUpdateOperation;
  uint64_t v14 = [(ICCloudContentTasteUpdateOperation *)&v19 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contentTasteItem, a3);
    v15->_invalidateLocalCache = a4;
    objc_storeStrong((id *)&v15->_configuration, a5);
    objc_storeStrong((id *)&v15->_operationIdentifier, a6);
    dispatch_semaphore_t v16 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v15->_operationQueue;
    v15->_operationQueue = v16;

    [(NSOperationQueue *)v15->_operationQueue setName:@"com.apple.iTunesCloud.ICUpdateContentTasteOperation.operationQueue"];
    [(NSOperationQueue *)v15->_operationQueue setMaxConcurrentOperationCount:3];
  }

  return v15;
}

- (ICCloudContentTasteUpdateOperation)init
{
  return 0;
}

@end