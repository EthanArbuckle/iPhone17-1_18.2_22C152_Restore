@interface SDSuggestionBrowser
+ (id)asyncBrowserWithSessionID:(id)a3 context:(id)a4 queue:(id)a5 timeout:(double)a6;
+ (id)browserWithSessionID:(id)a3 context:(id)a4;
+ (void)initializeCache;
- (BOOL)canExpectSuggestions;
- (BOOL)isAsynchronous;
- (NSArray)duetSuggestions;
- (NSArray)peopleSuggestionNodes;
- (NSArray)peopleSuggestions;
- (NSArray)suggestions;
- (NSString)sessionID;
- (OS_dispatch_queue)primedSuggestionsQueue;
- (OS_dispatch_queue)queue;
- (SDSuggestionBrowser)initWithSessionID:(id)a3 context:(id)a4 asynchronous:(BOOL)a5 queue:(id)a6 timeout:(double)a7;
- (SDSuggestionBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (_PSPredictionContext)predictionContext;
- (_PSSuggester)suggester;
- (double)timeout;
- (id)_createAttachmentsForURLsBeingShared:(id)a3 typeIdentifiersBeingShared:(id)a4 photosAssetIDs:(id)a5 processedImageResultsData:(id)a6 sandboxExtensionsByfileURLPath:(id)a7;
- (id)_createPeopleSuggestionNodesForSuggestions:(id)a3;
- (id)_createPeopleSuggestionsForSuggestions:(id)a3;
- (id)_createPlaceholderSuggestions;
- (id)_createPredictionContextWithContext:(id)a3;
- (id)_createSuggestionsForDuetSuggestions:(id)a3;
- (id)_extractTextFromFileURL:(id)a3;
- (id)_extractTextFromPDFFileURL:(id)a3;
- (id)_extractTextFromTextFileURL:(id)a3;
- (id)_peopleSuggestionForIdentifier:(id)a3 outIndex:(int64_t *)a4;
- (id)_peopleSuggestionNodeForNodeIdentifier:(id)a3 outIndex:(int64_t *)a4;
- (void)_didFetchDuetSuggestions:(id)a3;
- (void)_fetchDuetSuggestionsWithPreheating:(BOOL)a3;
- (void)_fetchSuggestionsIfNeeded;
- (void)_loadIconForSuggestionNode:(id)a3 outIcon:(CGImage *)a4 outIconData:(id *)a5;
- (void)_provideFeedbackForNodeAtIndex:(id)a3 bundleID:(id)a4 suggestion:(id)a5 selectedActionBundleID:(id)a6 abandoned:(BOOL)a7;
- (void)provideFeedbackForNodeAtIndex:(id)a3 bundleID:(id)a4 selectedActionBundleID:(id)a5 abandoned:(BOOL)a6;
- (void)provideFeedbackForPeopleSuggestion:(id)a3;
- (void)provideFeedbackForPeopleSuggestionIdentifier:(id)a3;
- (void)provideFeedbackForPeopleSuggestionNodeIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuetSuggestions:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setPeopleSuggestionNodes:(id)a3;
- (void)setPeopleSuggestions:(id)a3;
- (void)setPredictionContext:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)suggestLessPeopleSuggestionIdentifier:(id)a3;
@end

@implementation SDSuggestionBrowser

+ (void)initializeCache
{
  id v2 = sub_1000DCFF0();
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[SDStatusMonitor shareSheetMaxSuggestions]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 initializePSSuggesterCacheWithMaxSuggestionCount:v3];
}

+ (id)asyncBrowserWithSessionID:(id)a3 context:(id)a4 queue:(id)a5 timeout:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithSessionID:v12 context:v11 asynchronous:1 queue:v10 timeout:a6];

  return v13;
}

+ (id)browserWithSessionID:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithSessionID:v7 context:v6 asynchronous:0 queue:0 timeout:0.0];

  return v8;
}

- (SDSuggestionBrowser)initWithSessionID:(id)a3 context:(id)a4 asynchronous:(BOOL)a5 queue:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v39.receiver = self;
  v39.super_class = (Class)SDSuggestionBrowser;
  v15 = [(SDSuggestionBrowser *)&v39 init];
  if (v15)
  {
    v16 = (NSString *)[v12 copy];
    sessionID = v15->_sessionID;
    v15->_sessionID = v16;

    if (_os_feature_enabled_impl())
    {
      objc_storeStrong((id *)&v15->_queue, a6);
      v15->_isAsynchronous = a5;
      v15->_timeout = a7;
    }
    uint64_t v18 = [(SDSuggestionBrowser *)v15 _createPredictionContextWithContext:v13];
    predictionContext = v15->_predictionContext;
    v15->_predictionContext = (_PSPredictionContext *)v18;

    [(_PSPredictionContext *)v15->_predictionContext setSessionID:v12];
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2050000000;
    v20 = (void *)qword_10097FEC8;
    uint64_t v48 = qword_10097FEC8;
    if (!qword_10097FEC8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472;
      v42 = sub_1000E07A4;
      v43 = &unk_1008CA038;
      v44 = &v45;
      sub_1000E07A4((uint64_t)buf);
      v20 = (void *)v46[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v45, 8);
    v22 = [v21 defaultConfiguration];
    [v22 setMaximumNumberOfSuggestions:+[SDStatusMonitor shareSheetMaxSuggestions](SDStatusMonitor, "shareSheetMaxSuggestions")];
    v23 = (_PSSuggester *)[objc_alloc((Class)sub_1000DCFF0()) initWithDaemonUsingConfiguration:v22];
    suggester = v15->_suggester;
    v15->_suggester = v23;

    v25 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.sharingd.suggestionBrowser.primedSuggestions", v25);
    primedSuggestionsQueue = v15->_primedSuggestionsQueue;
    v15->_primedSuggestionsQueue = (OS_dispatch_queue *)v26;

    if (v15->_isAsynchronous)
    {
      v28 = share_sheet_log();
      v29 = share_sheet_log();
      os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, v15);

      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "CandidatesForShareSheetRanking", " enableTelemetry=YES ", buf, 2u);
      }

      v31 = [(_PSSuggester *)v15->_suggester candidatesForShareSheetRanking];
      v32 = share_sheet_log();
      v33 = share_sheet_log();
      os_signpost_id_t v34 = os_signpost_id_make_with_pointer(v33, v15);

      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v34, "CandidatesForShareSheetRanking", " enableTelemetry=YES ", buf, 2u);
      }

      id v35 = [v31 count];
      v15->_canExpectSuggestions = v35 != 0;
      if (v35)
      {
        uint64_t v36 = [(SDSuggestionBrowser *)v15 _createPlaceholderSuggestions];
        suggestions = v15->_suggestions;
        v15->_suggestions = (NSArray *)v36;
      }
    }
    else
    {
      v15->_canExpectSuggestions = 1;
    }
    [(SDSuggestionBrowser *)v15 _fetchDuetSuggestionsWithPreheating:1];
  }
  return v15;
}

- (id)_createPredictionContextWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v5 = (void *)qword_10097FED0;
  uint64_t v23 = qword_10097FED0;
  if (!qword_10097FED0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v25 = sub_1000E07FC;
    dispatch_queue_t v26 = &unk_1008CA038;
    v27 = &v20;
    sub_1000E07FC((uint64_t)&buf);
    v5 = (void *)v21[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v20, 8);
  id v7 = objc_alloc_init(v6);
  [v7 setShowPotentialFamilyMembers:[v4 shouldSuggestFamilyMembers:v20]];
  [v7 setIsSharePlayAvailable:[v4 isSharePlayAvailable]];
  if ([v4 supportsCollaboration]) {
    uint64_t v8 = _os_feature_enabled_impl();
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setIsCollaborationAvailable:v8];
  v9 = [v4 peopleSuggestionBundleIds];
  [v7 setSuggestionsFilteredByBundleIds:v9];

  id v10 = [v4 urlsBeingShared];
  id v11 = [v4 typeIdentifiersBeingShared];
  id v12 = [v4 photosAssetIDs];
  id v13 = [v4 processedImageResultsData];
  id v14 = [v4 sandboxExtensionsByfileURLPath];
  v15 = [(SDSuggestionBrowser *)self _createAttachmentsForURLsBeingShared:v10 typeIdentifiersBeingShared:v11 photosAssetIDs:v12 processedImageResultsData:v13 sandboxExtensionsByfileURLPath:v14];

  v16 = share_sheet_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attachments in PredictionContext for People Suggestion = %{private}@", (uint8_t *)&buf, 0xCu);
  }

  [v7 setAttachments:v15];
  v17 = [v4 bundleID];
  [v7 setBundleID:v17];

  uint64_t v18 = +[NSDate date];
  [v7 setSuggestionDate:v18];

  return v7;
}

- (id)_createAttachmentsForURLsBeingShared:(id)a3 typeIdentifiersBeingShared:(id)a4 photosAssetIDs:(id)a5 processedImageResultsData:(id)a6 sandboxExtensionsByfileURLPath:(id)a7
{
  id v45 = a3;
  id v44 = a4;
  id v43 = a5;
  id v51 = a6;
  id v47 = a7;
  id v11 = +[NSMutableArray array];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2050000000;
  id v12 = (void *)qword_10097FED8;
  uint64_t v71 = qword_10097FED8;
  if (!qword_10097FED8)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000E0854;
    v77 = &unk_1008CA038;
    v78 = &v68;
    sub_1000E0854((uint64_t)buf);
    id v12 = (void *)v69[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v68, 8);
  if (v13)
  {
    if ([v45 count])
    {
      long long v66 = 0uLL;
      long long v67 = 0uLL;
      long long v64 = 0uLL;
      long long v65 = 0uLL;
      id v14 = v44;
      id v15 = [v14 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v65;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v65 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            if ([v18 hasSuffix:@"url"])
            {
              id v19 = v18;
              goto LABEL_18;
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v64 objects:v75 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      id v19 = 0;
LABEL_18:

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = v45;
      id v50 = [obj countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (v50)
      {
        uint64_t v49 = *(void *)v61;
        do
        {
          for (j = 0; j != v50; j = (char *)j + 1)
          {
            if (*(void *)v61 != v49) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            if ([v19 hasSuffix:@"file-url"])
            {
              v24 = [(SDSuggestionBrowser *)self _extractTextFromFileURL:v23];
            }
            else
            {
              v24 = 0;
            }
            id v25 = [[v13 alloc] initWithCreationDate:0 UTI:v19 photoLocalIdentifier:0 identifier:0 cloudIdentifier:0 contentURL:v23 contentText:v24];
            if (objc_opt_respondsToSelector())
            {
              id v26 = v25;
              v27 = [v23 path];
              v28 = [v47 objectForKeyedSubscript:v27];

              if (v28)
              {
                v29 = share_sheet_log();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  id v30 = [v28 length];
                  *(_DWORD *)long long buf = 134218243;
                  *(void *)&buf[4] = v30;
                  *(_WORD *)&buf[12] = 2113;
                  *(void *)&buf[14] = v23;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "adding urlSandboxExtension with length:%lu for url attachment:%{private}@", buf, 0x16u);
                }

                [v26 setContentURLSandboxExtension:v28];
              }
            }
            [v11 addObject:v25];
            if (((v51 != 0) & [v19 hasSuffix:@"file-url"]) == 1)
            {
              id v31 = [[v13 alloc] initWithCreationDate:0 UTI:@"SDShareSheetImageAnalysisIdentifier" photoLocalIdentifier:0 identifier:0 cloudIdentifier:0 contentURL:v23 contentText:v24 imageData:v51];

              [v11 addObject:v31];
            }
            else
            {
              id v31 = v25;
            }
          }
          id v50 = [obj countByEnumeratingWithState:&v60 objects:v74 count:16];
        }
        while (v50);
      }
    }
    else
    {
      long long v58 = 0uLL;
      long long v59 = 0uLL;
      long long v56 = 0uLL;
      long long v57 = 0uLL;
      id v32 = v44;
      id v33 = [v32 countByEnumeratingWithState:&v56 objects:v73 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v57;
        do
        {
          for (k = 0; k != v33; k = (char *)k + 1)
          {
            if (*(void *)v57 != v34) {
              objc_enumerationMutation(v32);
            }
            id v36 = [[v13 alloc] initWithCreationDate:0 UTI:*(void *)(*((void *)&v56 + 1) + 8 * (void)k) photoLocalIdentifier:0 identifier:0 cloudIdentifier:0 contentURL:0 contentText:0];
            [v11 addObject:v36];
          }
          id v33 = [v32 countByEnumeratingWithState:&v56 objects:v73 count:16];
        }
        while (v33);
      }

      if (!v51) {
        goto LABEL_48;
      }
      id v19 = [[v13 alloc] initWithCreationDate:0 UTI:@"SDShareSheetImageAnalysisIdentifier" photoLocalIdentifier:0 identifier:0 cloudIdentifier:0 contentURL:0 contentText:0 imageData:v51];
      [v11 addObject:v19];
    }

LABEL_48:
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v37 = v43;
    id v38 = [v37 countByEnumeratingWithState:&v52 objects:v72 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v53;
      do
      {
        for (m = 0; m != v38; m = (char *)m + 1)
        {
          if (*(void *)v53 != v39) {
            objc_enumerationMutation(v37);
          }
          id v41 = [[v13 alloc] initWithCreationDate:0 UTI:0 photoLocalIdentifier:*(void *)(*((void *)&v52 + 1) + 8 * (void)m) identifier:0 cloudIdentifier:0 contentURL:0 contentText:0];
          [v11 addObject:v41];
        }
        id v38 = [v37 countByEnumeratingWithState:&v52 objects:v72 count:16];
      }
      while (v38);
    }

    id v21 = [v11 copy];
    goto LABEL_56;
  }
  uint64_t v20 = share_sheet_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1000E095C(v20);
  }

  id v21 = &__NSArray0__struct;
LABEL_56:

  return v21;
}

- (id)_extractTextFromFileURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  if (([v5 isEqualToString:@"rtf"] & 1) != 0
    || [v5 isEqualToString:@"txt"])
  {
    uint64_t v6 = [(SDSuggestionBrowser *)self _extractTextFromTextFileURL:v4];
LABEL_4:
    id v7 = (void *)v6;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"pdf"])
  {
    uint64_t v6 = [(SDSuggestionBrowser *)self _extractTextFromPDFFileURL:v4];
    goto LABEL_4;
  }
  id v7 = 0;
LABEL_5:

  return v7;
}

- (id)_extractTextFromTextFileURL:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = +[NSFileHandle fileHandleForReadingFromURL:v3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v11 = 0;
    uint64_t v6 = [v4 readDataUpToLength:102400 error:&v11];
    id v7 = v11;

    if ([v6 length])
    {
      uint64_t v6 = v6;
      uint64_t v8 = +[NSString stringWithCString:[v6 bytes] encoding:4];
    }
    else
    {
      if (v7)
      {
        v9 = share_sheet_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000E0A08();
        }
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000E09A0();
    }
    uint64_t v8 = 0;
    id v7 = v5;
  }

  return v8;
}

- (id)_extractTextFromPDFFileURL:(id)a3
{
  return 0;
}

- (void)setSuggestions:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_suggestions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_suggestions, a3);
    [(SDSuggestionBrowser *)self setPeopleSuggestionNodes:0];
    [(SDSuggestionBrowser *)self setPeopleSuggestions:0];
    id v5 = v6;
  }
}

- (NSArray)peopleSuggestionNodes
{
  [(SDSuggestionBrowser *)self _fetchSuggestionsIfNeeded];
  peopleSuggestionNodes = self->_peopleSuggestionNodes;
  if (!peopleSuggestionNodes)
  {
    id v4 = [(SDSuggestionBrowser *)self suggestions];
    id v5 = [(SDSuggestionBrowser *)self _createPeopleSuggestionNodesForSuggestions:v4];
    uint64_t v6 = self->_peopleSuggestionNodes;
    self->_peopleSuggestionNodes = v5;

    peopleSuggestionNodes = self->_peopleSuggestionNodes;
  }

  return peopleSuggestionNodes;
}

- (NSArray)peopleSuggestions
{
  [(SDSuggestionBrowser *)self _fetchSuggestionsIfNeeded];
  peopleSuggestions = self->_peopleSuggestions;
  if (!peopleSuggestions)
  {
    id v4 = [(SDSuggestionBrowser *)self suggestions];
    id v5 = [(SDSuggestionBrowser *)self _createPeopleSuggestionsForSuggestions:v4];
    uint64_t v6 = self->_peopleSuggestions;
    self->_peopleSuggestions = v5;

    peopleSuggestions = self->_peopleSuggestions;
  }

  return peopleSuggestions;
}

- (id)_createPlaceholderSuggestions
{
  int64_t v2 = +[SDStatusMonitor shareSheetMaxSuggestions];
  for (i = +[NSMutableArray arrayWithCapacity:v2];
  {
    id v4 = +[SDSuggestion placeholderSuggestion];
    [i addObject:v4];
  }
  id v5 = [i copy];

  return v5;
}

- (id)_createSuggestionsForDuetSuggestions:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [SDSuggestion alloc];
        id v12 = -[SDSuggestion initWithSuggestion:](v11, "initWithSuggestion:", v10, (void)v17);
        id v13 = [(SDSuggestion *)v12 displayName];
        if (v13)
        {
        }
        else
        {
          id v14 = [(SDSuggestion *)v12 formattedHandles];

          if (!v14) {
            goto LABEL_10;
          }
        }
        [v4 addObject:v12];
LABEL_10:
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = [v4 copy];

  return v15;
}

- (id)_createPeopleSuggestionNodesForSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  id location = 0;
  objc_initWeak(&location, self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [[SDSuggestionNode alloc] initWithSuggestion:v10];
        if (([v10 isPlaceholder] & 1) == 0)
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000DE758;
          v14[3] = &unk_1008CCF08;
          objc_copyWeak(&v15, &location);
          [(SDSuggestionNode *)v11 setLoadIconHandler:v14];
          objc_destroyWeak(&v15);
        }
        [v5 addObject:v11];
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  id v12 = [v5 copy];
  objc_destroyWeak(&location);

  return v12;
}

- (id)_createPeopleSuggestionsForSuggestions:(id)a3
{
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SDSuggestionBrowser *)self suggestions];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) createPeopleSuggestion];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (void)_didFetchDuetSuggestions:(id)a3
{
  id v4 = a3;
  [(SDSuggestionBrowser *)self setDuetSuggestions:v4];
  id v5 = [(SDSuggestionBrowser *)self _createSuggestionsForDuetSuggestions:v4];

  [(SDSuggestionBrowser *)self setSuggestions:v5];
  if ([(SDSuggestionBrowser *)self isAsynchronous])
  {
    id v6 = [(SDSuggestionBrowser *)self delegate];
    [v6 suggestionBrowserDidUpdateSuggestions:self];
  }
}

- (void)_fetchSuggestionsIfNeeded
{
  id v3 = [(SDSuggestionBrowser *)self suggestions];

  if (!v3)
  {
    id v4 = [(SDSuggestionBrowser *)self primedSuggestionsQueue];
    dispatch_sync(v4, &stru_1008CCF28);

    id v5 = [(SDSuggestionBrowser *)self suggestions];

    if (!v5)
    {
      [(SDSuggestionBrowser *)self _fetchDuetSuggestionsWithPreheating:0];
    }
  }
}

- (void)_fetchDuetSuggestionsWithPreheating:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SDStatusMonitor sharedMonitor];
  unsigned int v6 = [v5 disablePeopleSuggestions];

  if (v6)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "People suggestions are disabled", buf, 2u);
    }

LABEL_14:
    [(SDSuggestionBrowser *)self setSuggestions:&__NSArray0__struct];
    return;
  }
  int v8 = [(SDSuggestionBrowser *)self canExpectSuggestions];
  v9 = share_sheet_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) == 0)
  {
    if (v10)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "People suggestions are not expected.", buf, 2u);
    }

    goto LABEL_14;
  }
  if (v10)
  {
    id v11 = [(SDSuggestionBrowser *)self sessionID];
    *(_DWORD *)long long buf = 138412290;
    double v39 = *(double *)&v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling into PeopleSuggester for session ID %@", buf, 0xCu);
  }
  id v12 = share_sheet_log();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  sub_1000DEA74(v13, 1, v3, [(SDSuggestionBrowser *)self isAsynchronous]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000DF00C;
  v36[3] = &unk_1008CCF50;
  BOOL v37 = v3;
  v36[4] = self;
  v36[5] = v13;
  long long v14 = objc_retainBlock(v36);
  if ([(SDSuggestionBrowser *)self isAsynchronous])
  {
    long long v15 = [(SDSuggestionBrowser *)self queue];
    [(SDSuggestionBrowser *)self timeout];
    if (v16 <= 0.0)
    {
      double v18 = 1.79769313e308;
    }
    else
    {
      [(SDSuggestionBrowser *)self timeout];
      double v18 = v17;
    }
    uint64_t v23 = share_sheet_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "fetch people suggestions asynchronously with timeout:%f", buf, 0xCu);
    }

    suggester = self->_suggester;
    predictionContext = self->_predictionContext;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000DF160;
    v33[3] = &unk_1008CCFA0;
    v33[4] = self;
    id v34 = v15;
    id v35 = v14;
    id v26 = v14;
    long long v19 = v15;
    [(_PSSuggester *)suggester asyncSuggestInteractionsFromContext:predictionContext timeout:v33 completionHandler:v18];
  }
  else
  {
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_1000DF2FC;
    id v30 = &unk_1008CAD20;
    id v31 = self;
    id v32 = v14;
    long long v19 = v14;
    long long v20 = objc_retainBlock(&v27);
    id v21 = v20;
    if (v3)
    {
      uint64_t v22 = [(SDSuggestionBrowser *)self primedSuggestionsQueue];
      dispatch_async(v22, v21);
    }
    else
    {
      ((void (*)(void ***))v20[2])(v20);
    }
  }
}

- (void)_loadIconForSuggestionNode:(id)a3 outIcon:(CGImage *)a4 outIconData:(id *)a5
{
  int v8 = [a3 suggestion];
  v9 = [v8 image];

  if (v9)
  {
    BOOL v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 displayName];
      *(_DWORD *)long long buf = 138412290;
      int64_t v44 = (int64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Contact %@ is a donated suggestion, fetching from intents", buf, 0xCu);
    }
    id v12 = [v8 conversationIdentifier];
    os_signpost_id_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v8 derivedIntentIdentifier];
    }
    long long v15 = v14;

    double v16 = [v8 image];
    double v17 = [(SDSuggestionBrowser *)self helperConnection];
    double v18 = sub_100050B78(v16, v15, 0, v17);

    if (v18)
    {
      long long v19 = 0;
      goto LABEL_18;
    }
    long long v20 = share_sheet_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000E0B20((uint64_t)v15, v8, v20);
    }
  }
  id v21 = [v8 recipients];
  id v22 = [v21 count];

  if ((unint64_t)v22 < 2)
  {
    id v34 = [SharingXPCHelperContactIcon alloc];
    id v35 = [v8 recipients];
    id v36 = [v35 firstObject];
    BOOL v37 = [v36 contact];
    uint64_t v23 = [(SharingXPCHelperContactIcon *)v34 initWithContact:v37 iconData:0 atIndex:0 cacheLookupKey:0];

    id v41 = v23;
    id v38 = +[NSArray arrayWithObjects:&v41 count:1];
    double v39 = [(SDSuggestionBrowser *)self helperConnection];
    sub_100050D60(v38, v39);
    id v30 = (SharingXPCHelperGroupContactIcon *)objc_claimAutoreleasedReturnValue();

    long long v15 = [(SharingXPCHelperGroupContactIcon *)v30 firstObject];
  }
  else
  {
    uint64_t v23 = [v8 contacts];
    v24 = [(SharingXPCHelperContactIcon *)v23 count];
    id v25 = [v8 transientContactsCount];
    id v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v27 = v24 - v25;
      uint64_t v28 = [v8 recipients];
      id v29 = [v28 count];
      *(_DWORD *)long long buf = 134218240;
      int64_t v44 = v27;
      __int16 v45 = 2048;
      id v46 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received %ld out of %ld contacts from group recipients", buf, 0x16u);
    }
    id v30 = [[SharingXPCHelperGroupContactIcon alloc] initWithContacts:v23 iconData:0 atIndex:0 cacheLookupKey:0];
    v42 = v30;
    id v31 = +[NSArray arrayWithObjects:&v42 count:1];
    id v32 = [(SDSuggestionBrowser *)self helperConnection];
    id v33 = sub_100050DD4(v31, v32);

    long long v15 = [v33 firstObject];
  }
  long long v19 = (CGImage *)[v15 icon];
  double v18 = [v15 iconData];
LABEL_18:

  *a4 = v19;
  id v40 = v18;
  *a5 = v40;
}

- (void)_provideFeedbackForNodeAtIndex:(id)a3 bundleID:(id)a4 suggestion:(id)a5 selectedActionBundleID:(id)a6 abandoned:(BOOL)a7
{
  BOOL v7 = a7;
  unint64_t v12 = (unint64_t)a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  double v16 = +[UIActivity _activityImageForActionRepresentationImage:0];
  [v16 size];
  double v18 = v17;
  long long v19 = +[UIScreen mainScreen];
  [v19 bounds];
  uint64_t v21 = v20;

  id v22 = [(SDSuggestionBrowser *)self duetSuggestions];
  if (v7)
  {
    id v23 = [sub_1000DFA28() abandonment];
    goto LABEL_12;
  }
  if (!v12)
  {
    if (v14)
    {
      id v27 = objc_alloc((Class)sub_1000DFA28());
      uint64_t v28 = 0;
      unint64_t v29 = v14;
    }
    else
    {
      if (v15)
      {
        id v27 = objc_alloc((Class)sub_1000DFA28());
        uint64_t v28 = 1;
        unint64_t v29 = 0;
        id v30 = v15;
        goto LABEL_11;
      }
      if (!v13) {
        goto LABEL_19;
      }
      id v27 = objc_alloc((Class)sub_1000DFA28());
      uint64_t v28 = 4;
      unint64_t v29 = 0;
    }
    id v30 = v13;
LABEL_11:
    id v23 = [v27 initWithType:v28 suggestion:v29 transportBundleID:v30];
LABEL_12:
    id v26 = v23;
    if (v23) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  id v24 = objc_alloc((Class)sub_1000DFA28());
  id v25 = [v22 objectAtIndexedSubscript:[v12 unsignedIntValue]];
  id v26 = [v24 initWithType:0 suggestion:v25 transportBundleID:v13];

  if (v26)
  {
LABEL_13:
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000DFB0C;
    v36[3] = &unk_1008CCFC8;
    id v31 = v26;
    BOOL v37 = v31;
    id v38 = self;
    id v39 = v22;
    uint64_t v40 = v21;
    double v41 = v18 + 10.0;
    id v32 = objc_retainBlock(v36);
    id v33 = v32;
    if (v12 | v14)
    {
      ((void (*)(void *))v32[2])(v32);
    }
    else
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000DFCA4;
      v34[3] = &unk_1008CCFF0;
      id v35 = v32;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v34);
    }
    goto LABEL_21;
  }
LABEL_19:
  id v31 = share_sheet_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
    sub_1000E0BE4(v31);
  }
LABEL_21:
}

- (void)provideFeedbackForNodeAtIndex:(id)a3 bundleID:(id)a4 selectedActionBundleID:(id)a5 abandoned:(BOOL)a6
{
}

- (void)provideFeedbackForPeopleSuggestionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v5 = [(SDSuggestionBrowser *)self _peopleSuggestionForIdentifier:v4 outIndex:&v14];
  if (v5)
  {
    unsigned int v6 = +[NSNumber numberWithInteger:v14];
    BOOL v7 = [v5 transportBundleIdentifier];
    [(SDSuggestionBrowser *)self provideFeedbackForNodeAtIndex:v6 bundleID:v7 selectedActionBundleID:0 abandoned:0];
  }
  else
  {
    unsigned int v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000E0C28((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)provideFeedbackForPeopleSuggestionNodeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v5 = [(SDSuggestionBrowser *)self _peopleSuggestionNodeForNodeIdentifier:v4 outIndex:&v14];
  if (v5)
  {
    unsigned int v6 = +[NSNumber numberWithInteger:v14];
    BOOL v7 = [v5 bundleID];
    [(SDSuggestionBrowser *)self provideFeedbackForNodeAtIndex:v6 bundleID:v7 selectedActionBundleID:0 abandoned:0];
  }
  else
  {
    unsigned int v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000E0C94((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)provideFeedbackForPeopleSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleID];
  [(SDSuggestionBrowser *)self _provideFeedbackForNodeAtIndex:0 bundleID:v5 suggestion:v4 selectedActionBundleID:0 abandoned:0];
}

- (void)suggestLessPeopleSuggestionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SDSuggestionBrowser *)self peopleSuggestionNodes];
  id v6 = [v5 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v7 = [(SDSuggestionBrowser *)self peopleSuggestionNodes];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          [v6 removeObject:v12];
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(SDSuggestionBrowser *)self setPeopleSuggestionNodes:v6];
}

- (id)_peopleSuggestionForIdentifier:(id)a3 outIndex:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_1000E01A0;
  long long v19 = sub_1000E01B0;
  id v20 = 0;
  BOOL v7 = [(SDSuggestionBrowser *)self peopleSuggestions];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E01B8;
  v11[3] = &unk_1008CD018;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  unsigned int v14 = a4;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_peopleSuggestionNodeForNodeIdentifier:(id)a3 outIndex:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_1000E01A0;
  long long v19 = sub_1000E01B0;
  id v20 = 0;
  BOOL v7 = [(SDSuggestionBrowser *)self peopleSuggestionNodes];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E03AC;
  v11[3] = &unk_1008CD040;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  unsigned int v14 = a4;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)isAsynchronous
{
  return self->_isAsynchronous;
}

- (SDSuggestionBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDSuggestionBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helperConnection);

  return (SDXPCHelperConnection *)WeakRetained;
}

- (void)setHelperConnection:(id)a3
{
}

- (void)setPeopleSuggestions:(id)a3
{
}

- (void)setPeopleSuggestionNodes:(id)a3
{
}

- (OS_dispatch_queue)primedSuggestionsQueue
{
  return self->_primedSuggestionsQueue;
}

- (_PSSuggester)suggester
{
  return self->_suggester;
}

- (_PSPredictionContext)predictionContext
{
  return self->_predictionContext;
}

- (void)setPredictionContext:(id)a3
{
}

- (NSArray)duetSuggestions
{
  return self->_duetSuggestions;
}

- (void)setDuetSuggestions:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (BOOL)canExpectSuggestions
{
  return self->_canExpectSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_duetSuggestions, 0);
  objc_storeStrong((id *)&self->_predictionContext, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_primedSuggestionsQueue, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionNodes, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end