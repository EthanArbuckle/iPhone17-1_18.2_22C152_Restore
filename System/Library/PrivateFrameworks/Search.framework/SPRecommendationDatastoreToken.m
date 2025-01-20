@interface SPRecommendationDatastoreToken
- (BOOL)cancelled;
- (SPRecommendationDatastore)store;
- (SPRecommendationDatastoreToken)initWithStore:(id)a3;
- (id)buildSearchResultWithRecommendations:(id)a3 query:(id)a4;
- (unint64_t)type;
- (void)begin:(id)a3;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPRecommendationDatastoreToken

- (SPRecommendationDatastoreToken)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPRecommendationDatastoreToken;
  v6 = [(SPRecommendationDatastoreToken *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v7->_type = 9;
  }

  return v7;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)begin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 queryContext];
  v6 = [v5 getTrimmedSearchString];
  id v7 = [v6 mutableCopy];

  v8 = +[NSLocale currentLocale];
  objc_super v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("Query Queue", v9);

  v54[0] = 0;
  id v11 = [objc_alloc((Class)SREMusicRetrieval) initWithLocale:v8 queue:v10 error:v54];
  id v12 = v54[0];
  if ([v11 isMusicRecEligible:v7])
  {
    v13 = SSDefaultsGetResources();
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6ee794d6-a63f-11ed-afa1-0242ac120002"];
    objc_msgSend(v13, "logForTrigger:queryID:", v14, objc_msgSend(v5, "queryIdent"));

    LODWORD(v13) = SSShowMusicRec();
    v15 = logForCSLogCategoryRecs();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Starting Music recommendation retrieval.", buf, 2u);
      }

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      v49 = buf;
      uint64_t v50 = 0x3032000000;
      v51 = sub_10000474C;
      v52 = sub_10000475C;
      id v53 = 0;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100004764;
      v47[3] = &unk_100091DF0;
      v47[4] = buf;
      [v11 setCandidatesHandler:v47];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000047D0;
      v45[3] = &unk_100091E18;
      v18 = v17;
      v46 = v18;
      [v11 setCompletionHandler:v45];
      objc_msgSend(v11, "retrieveMusicWithQuery:queryID:", v7, objc_msgSend(v4, "queryIdent"));
      v19 = logForCSLogCategoryRecs();
      id v38 = v12;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100064C20();
      }

      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      v20 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Music recommendation retrieval ended.", v44, 2u);
      }

      v21 = SPLogForSPLogCategoryTelemetry();
      unsigned int v22 = [v4 externalID];
      if (v22 && os_signpost_enabled(v21))
      {
        *(_WORD *)v44 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v22, "recommendationSpotlightLatency", " enableTelemetry=YES ", v44, 2u);
      }

      *(void *)v44 = 0;
      objc_initWeak((id *)v44, v4);
      v23 = (void *)*((void *)v49 + 5);
      if (v23 && [v23 count])
      {
        v37 = [(SPRecommendationDatastoreToken *)self buildSearchResultWithRecommendations:*((void *)v49 + 5) query:v4];
        v24 = objc_opt_new();
        [v24 setPinToTop:1];
        id v25 = v24;
        [v25 setMaxInitiallyVisibleResults:1];
        [v25 setBundleIdentifier:PRSRankingRecommendationSongBundleString];
        [v25 setTitle:@"Apple Music"];
        [v25 setResults:v37];
        if (self->_cancelled)
        {
          v26 = logForCSLogCategoryRecs();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_100064BE0();
          }
        }
        else
        {
          v36 = +[SDController workQueue];
          objc_copyWeak(v42, (id *)v44);
          id v41 = v25;
          md_tracing_dispatch_async_propagating();

          objc_destroyWeak(v42);
        }
      }
      else
      {
        v35 = +[SDController workQueue];
        v42[1] = _NSConcreteStackBlock;
        v42[2] = (id)3221225472;
        v42[3] = sub_100004820;
        v42[4] = &unk_100091E40;
        objc_copyWeak(&v43, (id *)v44);
        v42[5] = self;
        md_tracing_dispatch_async_propagating();

        objc_destroyWeak(&v43);
      }
      objc_destroyWeak((id *)v44);

      _Block_object_dispose(buf, 8);
      id v12 = v38;
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "*warn* Music recommendation retrieval disabled from Trial.", buf, 2u);
      }

      v31 = SPLogForSPLogCategoryTelemetry();
      unsigned int v32 = [v4 externalID];
      if (v32)
      {
        unsigned int v33 = v32;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v33, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v34 = +[SDController workQueue];
      v40 = v4;
      md_tracing_dispatch_async_propagating();

      v18 = v40;
    }
  }
  else
  {
    v27 = SPLogForSPLogCategoryTelemetry();
    unsigned int v28 = [v4 externalID];
    if (v28)
    {
      unsigned int v29 = v28;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, v29, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v30 = +[SDController workQueue];
    v39 = v4;
    md_tracing_dispatch_async_propagating();

    v18 = v39;
  }
}

- (id)buildSearchResultWithRecommendations:(id)a3 query:(id)a4
{
  id v5 = a3;
  id v55 = a4;
  id v53 = +[NSMutableArray arrayWithCapacity:3];
  v54 = +[NSMutableString string];
  unint64_t v6 = 0;
  uint64_t v52 = PRSRankingRecommendationSongBundleString;
  id v56 = v5;
  do
  {
    if (v6 >= (unint64_t)[v5 count]) {
      break;
    }
    id v7 = [v5 objectAtIndexedSubscript:v6];
    v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v7 trackId]);
    objc_msgSend(v54, "appendString:");
    [v54 appendString:@" "];
    v8 = objc_opt_new();
    objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"media:%ld", [v7 trackId]);
    [v8 setIdentifier:v9];

    dispatch_queue_t v10 = [v7 trackName];
    id v11 = +[SFText textWithString:v10];
    [v8 setTitle:v11];

    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"https://music.apple.com/us/album/close-friends/%ld?i=%ld", [v7 collectionId], objc_msgSend(v7, "trackId"));
    [v8 setCompletion:v12];

    id v13 = objc_alloc((Class)NSURL);
    id v14 = [v8 completion];
    id v15 = [v13 initWithString:v14];
    [v8 setUrl:v15];

    [v8 setStoreIdentifier:@"278911476"];
    [v8 setSectionBundleIdentifier:v52];
    [v8 setSectionHeader:@"Apple Music"];
    [v8 setDomainName:@"media"];
    [v8 setMinimumRankOfTopHitToSuppressResult:15];
    [v8 setResultType:@"media"];
    [v8 setResultTemplate:@"generic"];
    [v8 setType:1];
    objc_msgSend(v8, "setQueryId:", objc_msgSend(v55, "queryIdent"));
    id v16 = objc_alloc_init((Class)SFCard);
    id v17 = objc_alloc_init((Class)SFDetailedRowCardSection);
    id v63 = v17;
    v18 = +[NSArray arrayWithObjects:&v63 count:1];
    v57 = v16;
    [v16 setCardSections:v18];

    id v19 = objc_alloc_init((Class)SFOpenPunchoutCommand);
    [v17 setCommand:v19];
    [v19 setCommandDetail:@"open_media"];
    id v20 = objc_alloc_init((Class)SFPunchout);
    [v19 setPunchout:v20];

    v21 = [v19 punchout];
    [v21 setBundleIdentifier:@"com.apple.Music"];

    unsigned int v22 = [v8 url];
    v62 = v22;
    v23 = +[NSArray arrayWithObjects:&v62 count:1];
    v24 = [v19 punchout];
    [v24 setUrls:v23];

    [v17 setType:@"detailed_row"];
    id v25 = objc_alloc((Class)SFURLImage);
    id v26 = objc_alloc((Class)NSURL);
    v27 = [v7 artworkURL];
    id v28 = [v26 initWithString:v27];
    id v29 = [v25 initWithURL:v28];
    [v17 setThumbnail:v29];

    id v30 = objc_alloc_init((Class)SFRichText);
    [v17 setTitle:v30];

    v31 = [v17 title];
    [v31 setStarRating:0.0];

    unsigned int v32 = [v17 title];
    [v32 setMaxLines:2];

    unsigned int v33 = [v17 title];
    v34 = [v7 trackName];
    [v33 setText:v34];

    id v35 = objc_alloc_init((Class)SFRichText);
    v36 = [v7 artistName];
    [v35 setText:v36];

    id v37 = objc_alloc_init((Class)SFRichText);
    id v38 = [v7 collectionName];
    [v37 setText:v38];

    id v39 = objc_alloc_init((Class)SFRichText);
    [v39 setMaxLines:0];
    if ([v7 trackExplicitness]) {
      [v39 setContentAdvisory:@"Explicit"];
    }
    uint64_t v40 = (uint64_t)[v7 trackTimeMillis];
    id v5 = v56;
    if (v40 >= 1000)
    {
      unint64_t v41 = v40 / 1000;
      if ((unint64_t)(v40 / 1000) >> 7 <= 0x2A2)
      {
        if (v41 >= 0xE10) {
          +[NSString stringWithFormat:@"%lu:%02lu:%02lu", v41 / 0xE10, v41 % 0xE10 / 0x3C, v41 % 0x3C];
        }
        else {
        v42 = +[NSString stringWithFormat:@"%lu:%02lu", v41 % 0xE10 / 0x3C, v41 % 0x3C, v51];
        }
        id v43 = objc_alloc_init((Class)SFRichText);
        [v17 setFootnote:v43];

        v44 = [v17 footnote];
        [v44 setText:v42];

        v45 = [v17 footnote];
        [v45 setMaxLines:1];

        id v5 = v56;
      }
    }
    v61[0] = v35;
    v61[1] = v37;
    v61[2] = v39;
    v46 = +[NSArray arrayWithObjects:v61 count:3];
    [v17 setDescriptions:v46];

    [v8 setInlineCard:v57];
    [v53 addObject:v8];

    ++v6;
  }
  while (v6 != 3);
  v47 = os_log_create("com.apple.corespotlight", "recs");
  v48 = (char *)[v55 queryIdent];
  if ((unint64_t)(v48 - 1) < 0xFFFFFFFFFFFFFFFELL)
  {
    os_signpost_id_t v49 = (os_signpost_id_t)v48;
    if (os_signpost_enabled(v47))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v54;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_EVENT, v49, "SRERenderingResults", "AdamIDs: %@", buf, 0xCu);
    }
  }

  return v53;
}

- (SPRecommendationDatastore)store
{
  return (SPRecommendationDatastore *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
}

@end