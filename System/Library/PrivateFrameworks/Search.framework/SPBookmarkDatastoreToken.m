@interface SPBookmarkDatastoreToken
- (BOOL)cancelled;
- (SPBookmarkDatastore)store;
- (SPBookmarkDatastoreToken)initWithStore:(id)a3;
- (unint64_t)type;
- (void)begin:(id)a3;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPBookmarkDatastoreToken

- (SPBookmarkDatastoreToken)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPBookmarkDatastoreToken;
  v6 = [(SPBookmarkDatastoreToken *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v7->_type = 3;
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
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v55 = *(_OWORD *)v5;
  long long v56 = v6;
  uint64_t v57 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPBookmarkDatastoreToken begin:]";
  si_tracing_log_span_begin();
  v10 = [v4 queryContext];
  v11 = [v10 getTrimmedSearchString];
  id v12 = [v11 mutableCopy];

  int v13 = SSEnableSpotlightTopHitPersonalizedRanking();
  id location = 0;
  objc_initWeak(&location, v4);
  v14 = [v10 disabledBundles];
  uint64_t v15 = PRSRankingSafariBundleString;
  if ([v14 containsObject:PRSRankingSafariBundleString])
  {

LABEL_6:
    v18 = +[SDController workQueue];
    v52[1] = _NSConcreteStackBlock;
    v52[2] = (id)3221225472;
    v52[3] = sub_10002F228;
    v52[4] = &unk_100091E40;
    objc_copyWeak(&v53, &location);
    v52[5] = self;
    md_tracing_dispatch_async_propagating();

    objc_destroyWeak(&v53);
    goto LABEL_24;
  }
  char v16 = looksLikeURL();

  if ((v16 & 1) == 0) {
    goto LABEL_6;
  }
  if ([v12 containsString:@"://"])
  {
    id v17 = v12;
  }
  else
  {
    id v17 = +[NSString stringWithFormat:@"https://%@", v12];
  }
  id v19 = v17;
  v49 = +[NSURL URLWithString:v17];
  v48 = v19;
  if (v49
    && ([v49 scheme], (v20 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([v49 host],
        v21 = objc_claimAutoreleasedReturnValue(),
        BOOL v22 = v21 == 0,
        v21,
        v20,
        !v22))
  {
    v23 = objc_opt_new();
    v47 = objc_opt_new();
    v46 = objc_opt_new();
    [v46 setIconType:1];
    [v47 setThumbnail:v46];
    v24 = +[SFRichText textWithString:v12];
    [v47 setTitle:v24];

    v25 = +[SFPunchout punchoutWithURL:v49];
    v61 = v25;
    v26 = +[NSArray arrayWithObjects:&v61 count:1];
    [v47 setPunchoutOptions:v26];

    v27 = +[SFRichText textWithString:v12];
    v60 = v27;
    v28 = +[NSArray arrayWithObjects:&v60 count:1];
    [v47 setDescriptions:v28];

    v29 = objc_opt_new();
    [v23 setInlineCard:v29];

    v59 = v47;
    v30 = +[NSArray arrayWithObjects:&v59 count:1];
    v31 = [v23 inlineCard];
    [v31 setCardSections:v30];

    [v23 setContentURL:v48];
    [v23 setApplicationBundleIdentifier:v15];
    [v23 setSectionBundleIdentifier:v15];
    [v23 setResultBundleId:PRSRankingUserTypedURLBundleString];
    [v23 setType:2];
    objc_msgSend(v23, "setQueryId:", objc_msgSend(v4, "queryIdent"));
    v32 = [@"userTypedURL-" stringByAppendingString:v12];
    [v23 setIdentifier:v32];

    [v23 setProtectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication];
    if ((v13 & 1) == 0)
    {
      [v23 setIsSafariTopHit:1];
      [v23 setTopHit:SSSetTopHitWithReasonString()];
    }
    [v23 setForceNoTopHit:0];
    v33 = [v49 host];
    [v23 setCompletion:v33];

    uint64_t v34 = SSCompactRankingAttrsAlloc();
    SSCompactRankingAttrsUpdateValue();
    SSCompactRankingAttrsUpdateValue();
    SSCompactRankingAttrsUpdateValue();
    id v35 = [objc_alloc((Class)PRSRankingItem) initWithAttrs:v34];
    [v23 setRankingItem:v35];

    if (v13)
    {
      v36 = [v23 rankingItem];
      objc_msgSend(v36, "setBundleIDType:", (unint64_t)objc_msgSend(v36, "bundleIDType") | 0x80);
    }
    v37 = objc_opt_new();
    [v37 setMaxInitiallyVisibleResults:1];
    [v37 setBundleIdentifier:v15];
    v38 = +[LSApplicationProxy applicationProxyForIdentifier:v15];
    v39 = [v38 localizedName];
    [v37 setTitle:v39];

    v58 = v23;
    v40 = +[NSArray arrayWithObjects:&v58 count:1];
    [v37 setResults:v40];

    if (v13) {
      [v37 setDomain:1];
    }
    if (!self->_cancelled)
    {
      v41 = +[SDController workQueue];
      objc_copyWeak(v51, &location);
      id v50 = v37;
      md_tracing_dispatch_async_propagating();

      objc_destroyWeak(v51);
    }
  }
  else
  {
    v42 = +[SDController workQueue];
    v51[1] = _NSConcreteStackBlock;
    v51[2] = (id)3221225472;
    v51[3] = sub_10002F280;
    v51[4] = &unk_100091E40;
    objc_copyWeak(v52, &location);
    v51[5] = self;
    md_tracing_dispatch_async_propagating();

    v43 = SPLogForSPLogCategoryDefault();
    os_log_type_t v44 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v43, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v19;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Failed to create URL from query %@", buf, 0xCu);
    }

    objc_destroyWeak(v52);
  }

LABEL_24:
  objc_destroyWeak(&location);

  si_tracing_log_span_end();
  long long v45 = v56;
  *(_OWORD *)uint64_t v5 = v55;
  *(_OWORD *)(v5 + 16) = v45;
  *(void *)(v5 + 32) = v57;
}

- (SPBookmarkDatastore)store
{
  return (SPBookmarkDatastore *)objc_getProperty(self, a2, 16, 1);
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