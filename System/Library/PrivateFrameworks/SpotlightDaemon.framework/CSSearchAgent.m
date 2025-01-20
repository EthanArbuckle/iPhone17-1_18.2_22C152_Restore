@interface CSSearchAgent
+ (id)searchAgent;
+ (id)searchAgent:(BOOL)a3 serviceName:(id)a4;
- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3;
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)lostClientConnection:(id)a3 error:(id)a4;
- (MDIndexer)indexer;
- (NSMutableDictionary)searchConnections;
- (id)searchConnection:(id)a3;
- (void)_prepareQueryContext:(id)a3 searchConnection:(id)a4;
- (void)cancelQuery:(id)a3;
- (void)cancelSimpleQuery:(id)a3;
- (void)handleEngagement:(id)a3 forConnection:(id)a4;
- (void)pollResults:(id)a3;
- (void)preheat:(id)a3;
- (void)setIndexer:(id)a3;
- (void)setSearchConnections:(id)a3;
- (void)startQuery:(id)a3;
- (void)startSimpleQuery:(id)a3;
@end

@implementation CSSearchAgent

- (void)startQuery:(id)a3
{
  v149[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = xpc_dictionary_get_remote_connection(v3);
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  v6 = reply;
  if (v4 && reply)
  {
    id val = [(CSSearchAgent *)self searchConnection:v4];
    if (val) {
      uint64_t uint64 = xpc_dictionary_get_uint64(v3, "qid");
    }
    else {
      uint64_t uint64 = 0;
    }
    v10 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = uint64;
      _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "os_signpost_interval_begin qid=%ld", buf, 0xCu);
    }

    uint64_t v11 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v12 = *(_OWORD *)(v11 + 16);
    long long v144 = *(_OWORD *)v11;
    long long v145 = v12;
    uint64_t v146 = *(void *)(v11 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v11 = v13;
    *(void *)(v11 + 8) = spanid;
    *(void *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = "csquery_command_start_query";
    si_tracing_log_span_begin();
    v15 = logForCSLogCategoryQuery();
    v16 = v15;
    if (uint64 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      if (!uint64)
      {
        v9 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21F1CE000, v16, OS_SIGNPOST_INTERVAL_BEGIN, uint64, "CSSearchLatency", (const char *)&unk_21F27672A, buf, 2u);
      }
    }
    string = xpc_dictionary_get_string(v3, "query");
    v18 = string;
    if (!string || !strcmp(string, "false"))
    {
      v9 = 0;
    }
    else
    {
      v19 = xpc_dictionary_get_value(v3, "context");
      v9 = [objc_alloc(MEMORY[0x263F02AD0]) initWithXPCDictionary:v19];

      if (v9)
      {
        v70 = [val bundleID];
        unsigned int v71 = [val searchInternal];
        char v20 = [v9 playback];
        v74 = [NSString stringWithUTF8String:v18];
        if (v20)
        {
          if (!v71)
          {
            unsigned int v71 = 0;
            goto LABEL_54;
          }
          v21 = [v9 clientBundleID];
          v22 = v21;
          if (v21)
          {
            v23 = v21;

            v70 = v23;
          }
          unsigned int v71 = [v9 internal];
LABEL_53:

LABEL_54:
          [v9 setClientBundleID:v70];
          [v9 setInternal:v71];
          v30 = v74;
          uint64_t v31 = [(__CFString *)v30 length];
          v32 = v30;
          if (!v31)
          {

            v32 = @"(true)";
          }
          v65 = v32;

          [(CSSearchAgent *)self _prepareQueryContext:v9 searchConnection:val];
          v33 = [v9 clientBundleID];
          if ([v33 hasPrefix:@"com.apple.omniSearch"])
          {
          }
          else
          {
            int v34 = _os_feature_enabled_impl();

            if (!v34)
            {
              id v63 = 0;
              id v59 = 0;
              goto LABEL_62;
            }
          }
          indexer = self->_indexer;
          v36 = [NSString stringWithUTF8String:v18];
          id v143 = 0;
          id v142 = 0;
          [(MDIndexer *)indexer processSearchString:v36 intoTrimmedString:&v143 andTokens:&v142];
          id v59 = v143;
          id v63 = v142;

          if (objc_opt_respondsToSelector()) {
            [(MDIndexer *)self->_indexer rewriteFirstPassQueryWithQueryString:v65 context:v9 trimmedSearchStringTokens:v63 populateDateSynonyms:1];
          }
LABEL_62:
          int v75 = [v9 live];
          char v62 = [v9 lowPriority];
          int v61 = [v9 qos];
          id v60 = [v9 copy];
          v140[0] = 0;
          v140[1] = v140;
          v140[2] = 0x2020000000;
          char v141 = 0;
          v138[0] = 0;
          v138[1] = v138;
          v138[2] = 0x2020000000;
          char v139 = 0;
          if ([v9 pommes])
          {
            v57 = [v9 bundleIDs];
            v37 = [v9 userQuery];
            char v38 = objc_opt_respondsToSelector();
            uint64_t v39 = [v9 counting];
            v40 = [v9 queryEmbedding];
            BOOL v68 = +[SDPommesFeature usingRewritesForContextBundleIDs:v57 clientBundleID:v70 userQuery:v37 indexSupportsRewrites:v38 & 1 isCounting:v39 embeddingsEnabled:v40 != 0];

            v41 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              int v42 = [v9 rankingType];
              v43 = @"NO";
              if (v68) {
                v44 = @"YES";
              }
              else {
                v44 = @"NO";
              }
              *(_DWORD *)buf = 134218754;
              *(void *)&buf[4] = uint64;
              if (v42 == 1) {
                v45 = @"YES";
              }
              else {
                v45 = @"NO";
              }
              *(void *)&buf[14] = v44;
              *(_WORD *)&buf[12] = 2112;
              *(_WORD *)&buf[22] = 2112;
              if (v75) {
                v43 = @"YES";
              }
              *(void *)&buf[24] = v45;
              LOWORD(v149[0]) = 2112;
              *(void *)((char *)v149 + 2) = v43;
              _os_log_impl(&dword_21F1CE000, v41, OS_LOG_TYPE_INFO, "[rewrite] qid=%ld rewriteAllowed:%@ topHit:%@ live:%@", buf, 0x2Au);
            }
          }
          else
          {
            LOBYTE(v68) = 0;
          }
          v136[0] = 0;
          v136[1] = v136;
          v136[2] = 0x2020000000;
          char v137 = 0;
          v134[0] = 0;
          v134[1] = v134;
          v134[2] = 0x2020000000;
          char v135 = 0;
          v132[0] = 0;
          v132[1] = v132;
          v132[2] = 0x2020000000;
          char v133 = 0;
          v130[0] = 0;
          v130[1] = v130;
          v130[2] = 0x2020000000;
          char v131 = 0;
          v128[0] = 0;
          v128[1] = v128;
          v128[2] = 0x2020000000;
          char v129 = 0;
          id location = 0;
          objc_initWeak(&location, val);
          *(_OWORD *)buf = *(_OWORD *)v11;
          *(_OWORD *)&buf[16] = *(_OWORD *)(v11 + 16);
          v149[0] = *(void *)(v11 + 32);
          v105[0] = MEMORY[0x263EF8330];
          v105[1] = 3221225472;
          v105[2] = __28__CSSearchAgent_startQuery___block_invoke;
          v105[3] = &unk_264509308;
          long long v118 = *(_OWORD *)buf;
          long long v119 = *(_OWORD *)&buf[16];
          uint64_t v120 = v149[0];
          char v123 = v71;
          v58 = &v117;
          objc_copyWeak(&v117, &location);
          v9 = v9;
          BOOL v124 = v68;
          v106 = v9;
          v110 = v140;
          v111 = v136;
          v112 = v132;
          char v125 = v75;
          v113 = v134;
          v114 = v128;
          uint64_t v121 = uint64;
          v115 = v130;
          v56 = v70;
          v107 = v56;
          id v46 = v4;
          id v108 = v46;
          v109 = self;
          char v126 = v62;
          int v122 = v61;
          v116 = v138;
          v47 = (void *)[v105 copy];
          id from = 0;
          objc_initWeak(&from, val);
          v94[0] = MEMORY[0x263EF8330];
          v94[1] = 3221225472;
          v94[2] = __28__CSSearchAgent_startQuery___block_invoke_164;
          v94[3] = &unk_264509330;
          long long v99 = *(_OWORD *)buf;
          long long v100 = *(_OWORD *)&buf[16];
          uint64_t v101 = v149[0];
          char v103 = v75;
          id v48 = v47;
          id v97 = v48;
          id v95 = v6;
          uint64_t v102 = uint64;
          id v96 = v46;
          objc_copyWeak(&v98, &from);
          v49 = (void *)MEMORY[0x223C48320](v94);
          v50 = self->_indexer;
          v79[0] = MEMORY[0x263EF8330];
          v79[1] = 3221225472;
          v79[2] = __28__CSSearchAgent_startQuery___block_invoke_2_167;
          v79[3] = &unk_2645093D0;
          v72 = v50;
          objc_copyWeak(&v87, &from);
          long long v88 = *(_OWORD *)buf;
          long long v89 = *(_OWORD *)&buf[16];
          uint64_t v90 = v149[0];
          uint64_t v91 = uint64;
          v85 = v136;
          BOOL v92 = v68;
          id v69 = v49;
          id v83 = v69;
          v86 = v140;
          id v84 = v48;
          v79[4] = self;
          v80 = v65;
          id v66 = v60;
          id v81 = v66;
          char v93 = v75;
          id v51 = v3;
          id v82 = v51;
          v52 = v72;
          v73 = v80;
          id v76 = v84;
          v53 = [(MDIndexer *)v52 taskForQueryWithQueryString:v80 queryContext:v9 eventHandler:0 resultsHandler:v84 completionHandler:v79];
          if (v53)
          {
            objc_msgSend(val, "setQueryTask:forQueryID:", v53, uint64, v56, &v117, v59);
            [(MDIndexer *)self->_indexer startQueryTask:v53];
          }
          else
          {
            v54 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              uint64_t v55 = xpc_dictionary_get_uint64(v51, "qid");
              -[CSSearchAgent startQuery:]((uint64_t)v51, v147, v55, v54);
            }
          }
          objc_destroyWeak(&v87);

          objc_destroyWeak(&v98);
          objc_destroyWeak(&from);

          objc_destroyWeak(v58);
          objc_destroyWeak(&location);
          _Block_object_dispose(v128, 8);
          _Block_object_dispose(v130, 8);
          _Block_object_dispose(v132, 8);
          _Block_object_dispose(v134, 8);
          _Block_object_dispose(v136, 8);
          _Block_object_dispose(v138, 8);
          _Block_object_dispose(v140, 8);

          if (v53) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        [val overrideMailHitCounts:v9];
        if (![MEMORY[0x263F02B30] journalEnabled]) {
          goto LABEL_54;
        }
        v22 = (void *)[MEMORY[0x263F02B30] copyPlistFromXPCObject:v3];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_53;
        }
        if (v70) {
          int v25 = 1;
        }
        else {
          int v25 = v71;
        }
        if (v25 != 1)
        {
LABEL_52:
          v28 = (void *)MEMORY[0x263F02B30];
          uint64_t pid = xpc_connection_get_pid((xpc_connection_t)v4);
          objc_msgSend(v28, "journalDictionary:toFolderPath:forPID:withLabel:andID:", v22, "/private/tmp", pid, "query", xpc_dictionary_get_uint64(v3, "qid"));
          goto LABEL_53;
        }
        v67 = [v22 objectForKeyedSubscript:@"context"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_51;
        }
        if (v70) {
          [v67 setObject:v70 forKeyedSubscript:@"cbi"];
        }
        if (!v71)
        {
LABEL_51:

          goto LABEL_52;
        }
        v64 = [v67 objectForKeyedSubscript:@"f"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v26 = [v64 unsignedIntValue];
          if (v26) {
            goto LABEL_50;
          }
        }
        else
        {
          int v26 = 0;
        }
        v27 = [NSNumber numberWithUnsignedInt:v26 | 1u];
        [v67 setObject:v27 forKeyedSubscript:@"f"];

LABEL_50:
        goto LABEL_51;
      }
    }
LABEL_30:
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message((xpc_connection_t)v4, v6);
LABEL_31:
    si_tracing_log_span_end();
    long long v24 = v145;
    *(_OWORD *)uint64_t v11 = v144;
    *(_OWORD *)(v11 + 16) = v24;
    *(void *)(v11 + 32) = v146;

LABEL_32:
    goto LABEL_33;
  }
  if (!v4)
  {
    v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSSearchAgent startQuery:](v3);
    }
  }
  if (!v6)
  {
    v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CSSearchAgent startQuery:](v3);
    }
    goto LABEL_32;
  }
LABEL_33:
}

- (id)searchConnection:(id)a3
{
  v4 = +[CSSearchClientConnectionKey keyWithConnection:a3];
  v5 = [(NSMutableDictionary *)self->_searchConnections objectForKeyedSubscript:v4];

  return v5;
}

void __28__CSSearchAgent_startQuery___block_invoke_2_167(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v5 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v60 = *(_OWORD *)v5;
  long long v61 = v6;
  uint64_t v62 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)(a1 + 136);
  long long v8 = *(_OWORD *)(a1 + 120);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(v5 + 16) = v8;
  *(void *)(v5 + 32) = v7;
  long long v9 = *(_OWORD *)(a1 + 120);
  long long v57 = *(_OWORD *)(a1 + 104);
  long long v58 = v9;
  uint64_t v59 = *(void *)(a1 + 136);
  uint64_t v10 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v12 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v10;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v12;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "query task completion handler";
  si_tracing_log_span_begin();
  uint64_t v13 = [WeakRetained queryTask:*(void *)(a1 + 144)];
  v14 = v13;
  v32 = WeakRetained;
  if (v13)
  {
    char v15 = [v13 wasCanceledByClient];
    if (v3) {
      goto LABEL_18;
    }
  }
  else
  {
    char v15 = 1;
    if (v3)
    {
LABEL_18:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) || (v15 & 1) != 0 || !*(unsigned char *)(a1 + 152)) {
    goto LABEL_18;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  v16 = logForCSLogCategoryQuery();
  id from = (id *)(a1 + 96);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void *)(a1 + 144);
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v17;
    _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_INFO, "[rewrite] qid=%ld Requesting rewrite candidates", buf, 0xCu);
  }
  uint64_t v31 = a1;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  v18 = [MEMORY[0x263EFF9A0] dictionary];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v19 = [v14 matchInfo];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = *(id *)(*((void *)&v53 + 1) + 8 * i);
        _MDPlistGetRootPlistObjectFromPlist();
        uint64_t v48 = MEMORY[0x263EF8330];
        uint64_t v49 = 3221225472;
        v50 = __28__CSSearchAgent_startQuery___block_invoke_169;
        id v51 = &unk_264509358;
        id v52 = v18;
        _MDPlistDictionaryIterate();
        CFRelease(v23);
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v20);
  }

  *(_OWORD *)buf = *(_OWORD *)v5;
  long long v64 = *(_OWORD *)(v5 + 16);
  uint64_t v65 = *(void *)(v5 + 32);
  uint64_t v24 = *(void *)(v31 + 40);
  int v25 = *(void **)(*(void *)(v31 + 32) + 56);
  uint64_t v26 = *(void *)(v31 + 48);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __28__CSSearchAgent_startQuery___block_invoke_2_171;
  v33[3] = &unk_2645093A8;
  uint64_t v45 = v65;
  long long v44 = v64;
  long long v43 = *(_OWORD *)buf;
  id v34 = v14;
  id v40 = *(id *)(v31 + 64);
  id v35 = 0;
  char v47 = *(unsigned char *)(v31 + 153);
  id v36 = *(id *)(v31 + 40);
  id v27 = *(id *)(v31 + 48);
  uint64_t v46 = *(void *)(v31 + 144);
  uint64_t v28 = *(void *)(v31 + 32);
  id v37 = v27;
  uint64_t v38 = v28;
  id v41 = *(id *)(v31 + 72);
  id v39 = *(id *)(v31 + 56);
  objc_copyWeak(&v42, from);
  [v25 rewriteQueryWithQueryString:v24 context:v26 matchInfo:v18 rewriteHandler:v33];
  objc_destroyWeak(&v42);

LABEL_19:
  si_tracing_log_span_end();
  long long v29 = v61;
  *(_OWORD *)uint64_t v5 = v60;
  *(_OWORD *)(v5 + 16) = v29;
  *(void *)(v5 + 32) = v62;
}

void __28__CSSearchAgent_startQuery___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v72 = a6;
  uint64_t v10 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v11 = *(_OWORD *)(v10 + 16);
  long long v87 = *(_OWORD *)v10;
  long long v88 = v11;
  uint64_t v89 = *(void *)(v10 + 32);
  uint64_t v12 = *(void *)(a1 + 160);
  long long v13 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v10 + 16) = v13;
  *(void *)(v10 + 32) = v12;
  long long v14 = *(_OWORD *)(a1 + 144);
  long long v84 = *(_OWORD *)(a1 + 128);
  long long v85 = v14;
  uint64_t v86 = *(void *)(a1 + 160);
  uint64_t v15 = *(void *)v10;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v17 = *(void *)(v10 + 8);
  *(void *)uint64_t v10 = v15;
  *(void *)(v10 + 8) = spanid;
  *(void *)(v10 + 16) = v17;
  *(unsigned char *)(v10 + 28) = 102;
  *(void *)(v10 + 32) = "resultsHandler";
  si_tracing_log_span_begin();
  v18 = v72;
  if (!*(unsigned char *)(a1 + 180)) {
    v18 = 0;
  }
  id v70 = v18;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  v19 = 0;
  int v20 = 0;
  BOOL v21 = 0;
  v22 = 0;
  switch(a2)
  {
    case 0u:
    case 6u:
      uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v23 + 24))
      {
        BOOL v24 = 1;
      }
      else
      {
        BOOL v24 = _MDStoreOIDArrayGetVectorCount() != 0;
        uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
      }
      *(unsigned char *)(v23 + 24) = v24;
      BOOL v21 = *(unsigned char *)(a1 + 182) != 0;
      if (!*(unsigned char *)(a1 + 181)) {
        goto LABEL_31;
      }
      v19 = 0;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        goto LABEL_81;
      }
      int v20 = 1;
      goto LABEL_44;
    case 1u:
      if (!*(unsigned char *)(a1 + 181)
        || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
        || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        int v25 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
        if (!*(unsigned char *)(a1 + 181))
        {
          int v20 = 0;
          BOOL v21 = 0;
          v19 = 0;
          v22 = 0;
          goto LABEL_45;
        }
      }
      else
      {
        int v25 = 0;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        goto LABEL_80;
      }
      uint64_t v26 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        __28__CSSearchAgent_startQuery___block_invoke_cold_3();
      }
      goto LABEL_42;
    case 2u:
      if (!v72)
      {
        if (!*(unsigned char *)(a1 + 181)
          || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
          || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          int v25 = 1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        }
        else
        {
          id v63 = [WeakRetained queryTask:*(void *)(a1 + 168)];
          [v63 cancel];

          int v25 = 0;
        }
        if (*(unsigned char *)(a1 + 181) && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          uint64_t v26 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            __28__CSSearchAgent_startQuery___block_invoke_cold_2();
          }
LABEL_42:

          v19 = 0;
          if (v25) {
            goto LABEL_43;
          }
        }
        else
        {
LABEL_80:
          v19 = 0;
          if (v25) {
            goto LABEL_43;
          }
        }
LABEL_81:
        v22 = 0;
        goto LABEL_82;
      }
      if (![*(id *)(a1 + 32) priorityIndexQuery])
      {
LABEL_25:
        v22 = 0;
        v19 = 0;
        goto LABEL_82;
      }
      v19 = 0;
      if (([v72 isEqual:@"Priority"] & 1) == 0) {
        goto LABEL_81;
      }
LABEL_43:
      int v20 = 0;
      BOOL v21 = 0;
LABEL_44:
      v22 = 0;
LABEL_45:
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
        || ([WeakRetained queryTask:*(void *)(a1 + 168)],
            (id v69 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
          goto LABEL_82;
        }
        id v69 = 0;
      }
      xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
      uint64_t v67 = a1 + 168;
      xpc_dictionary_set_uint64(v30, "qid", *(void *)(a1 + 168));
      xpc_dictionary_set_uint64(v30, "t", a2);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
      {
        uint64_t v31 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          __28__CSSearchAgent_startQuery___block_invoke_cold_1(v67, v31, v32, v33, v34, v35, v36, v37);
        }
      }
      else
      {
        if (v22)
        {
          id v38 = v22;
          xpc_dictionary_set_data(v30, "rd", (const void *)[v38 bytes], objc_msgSend(v38, "length"));
        }
        else if (v20)
        {
          [MEMORY[0x263F02B30] dictionary:v30 setPlistBytes:a5 forKey:"rd" sizeKey:"rdl"];
          id v39 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            int v64 = [WeakRetained outBatchCount];
            uint64_t v65 = *(void *)(a1 + 40);
            uint64_t v66 = *(void *)(a1 + 168);
            *(_DWORD *)uint64_t v90 = 67110146;
            *(_DWORD *)&v90[4] = a2;
            *(_WORD *)&v90[8] = 1024;
            *(_DWORD *)&v90[10] = v64;
            *(_WORD *)&v90[14] = 2112;
            *(void *)&v90[16] = v65;
            *(_WORD *)&v90[24] = 2112;
            *(void *)&v90[26] = v72;
            *(_WORD *)&v90[34] = 2048;
            *(void *)&v90[36] = v66;
            _os_log_debug_impl(&dword_21F1CE000, v39, OS_LOG_TYPE_DEBUG, "Found query results, type:%d outBatchCount:%u, clientBundleID:%@, dataclass:%@ qid:%ld", v90, 0x2Cu);
          }
        }
        if (v21)
        {
          unsigned int VectorCount = _MDStoreOIDArrayGetVectorCount();
          Vector = (const void *)_MDStoreOIDArrayGetVector();
          xpc_dictionary_set_data(v30, "od", Vector, 8 * VectorCount);
          id v42 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            int v60 = [WeakRetained outBatchCount];
            uint64_t v61 = *(void *)(a1 + 40);
            uint64_t v62 = *(void *)(a1 + 168);
            *(_DWORD *)uint64_t v90 = 67110146;
            *(_DWORD *)&v90[4] = v60;
            *(_WORD *)&v90[8] = 2048;
            *(void *)&v90[10] = 8 * VectorCount;
            *(_WORD *)&v90[18] = 2112;
            *(void *)&v90[20] = v61;
            *(_WORD *)&v90[28] = 2112;
            *(void *)&v90[30] = v72;
            *(_WORD *)&v90[38] = 2048;
            *(void *)&v90[40] = v62;
            _os_log_debug_impl(&dword_21F1CE000, v42, OS_LOG_TYPE_DEBUG, "Remove query results, outBatchCount:%u, size:%ld, clientBundleID:%@, dataclass:%@ qid: %ld", v90, 0x30u);
          }
        }
        if (v70)
        {
          xpc_object_t v43 = xpc_string_create((const char *)[v70 UTF8String]);
          xpc_dictionary_set_value(v30, "pc", v43);
        }
        uint64_t v31 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v58 = *(void *)(a1 + 40);
          uint64_t v59 = *(void *)(a1 + 168);
          *(_DWORD *)uint64_t v90 = 138412802;
          *(void *)&v90[4] = v58;
          *(_WORD *)&v90[12] = 2112;
          *(void *)&v90[14] = v72;
          *(_WORD *)&v90[22] = 2048;
          *(void *)&v90[24] = v59;
          _os_log_debug_impl(&dword_21F1CE000, v31, OS_LOG_TYPE_DEBUG, "Found query results clientBundleID:%@, dataclass:%@ qid:%ld", v90, 0x20u);
        }
      }

      *(_OWORD *)uint64_t v90 = *(_OWORD *)v10;
      *(_OWORD *)&v90[16] = *(_OWORD *)(v10 + 16);
      *(void *)&v90[32] = *(void *)(v10 + 32);
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __28__CSSearchAgent_startQuery___block_invoke_160;
      v74[3] = &unk_2645092E0;
      id v75 = WeakRetained;
      id v44 = v69;
      uint64_t v45 = *(void *)(a1 + 168);
      id v76 = v44;
      uint64_t v80 = v45;
      id v77 = *(id *)(a1 + 48);
      id v46 = v30;
      uint64_t v47 = *(void *)(a1 + 56);
      id v78 = v46;
      uint64_t v79 = v47;
      long long v81 = *(_OWORD *)v90;
      long long v82 = *(_OWORD *)&v90[16];
      uint64_t v83 = *(void *)&v90[32];
      uint64_t v48 = (void *)MEMORY[0x223C48320](v74);
      if (*(unsigned char *)(a1 + 182) && *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        if (*(unsigned char *)(a1 + 183)) {
          dispatch_qos_class_t v49 = QOS_CLASS_BACKGROUND;
        }
        else {
          dispatch_qos_class_t v49 = *(_DWORD *)(a1 + 176);
        }
        v50 = objc_msgSend(*(id *)(a1 + 56), "queue", v67);
        dispatch_block_t v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v49, 0, v48);
        tracing_dispatch_async();
      }
      else
      {
        v50 = objc_msgSend(*(id *)(a1 + 56), "queue", v67);
        dispatch_block_t v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)*(_DWORD *)(a1 + 176), 0, v48);
        tracing_dispatch_async();
      }

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
      {
        id v52 = logForCSLogCategoryQuery();
        long long v53 = v52;
        os_signpost_id_t v54 = *v68;
        if (*v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21F1CE000, v53, OS_SIGNPOST_INTERVAL_END, v54, "CSSearchLatency", (const char *)&unk_21F27672A, buf, 2u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
      }

LABEL_82:
      si_tracing_log_span_end();
      long long v55 = v88;
      *(_OWORD *)uint64_t v10 = v87;
      *(_OWORD *)(v10 + 16) = v55;
      *(void *)(v10 + 32) = v89;

      return;
    case 3u:
    case 4u:
      goto LABEL_82;
    case 5u:
      *(void *)uint64_t v90 = a3;
      v22 = [MEMORY[0x263EFF8F8] dataWithBytes:v90 length:8];
      int v20 = 0;
      BOOL v21 = 0;
      v19 = 0;
      goto LABEL_45;
    case 7u:
      int v20 = 0;
      v19 = 0;
      v22 = 0;
      BOOL v21 = 1;
      goto LABEL_45;
    case 8u:
      if (a5)
      {
        id v27 = (void *)_MDPlistBytesCopyPlistAtIndex();
        v19 = v27;
        if (v27)
        {
          BOOL v28 = [v27 count] != 0;
          goto LABEL_85;
        }
      }
      else
      {
        v19 = 0;
      }
      BOOL v28 = 0;
LABEL_85:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v28;
      uint64_t v56 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v56 + 24)) {
        BOOL v57 = 1;
      }
      else {
        BOOL v57 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != 0;
      }
      *(unsigned char *)(v56 + 24) = v57;
      if (*(unsigned char *)(a1 + 181))
      {
        v22 = 0;
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
          goto LABEL_82;
        }
        BOOL v21 = 0;
      }
      else
      {
        BOOL v21 = 0;
LABEL_32:
        v22 = 0;
      }
      int v20 = 1;
      goto LABEL_45;
    case 9u:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
      {
        long long v29 = [WeakRetained queryTask:*(void *)(a1 + 168)];
        [v29 addMatchInfo:a5];
      }
      goto LABEL_25;
    case 0xAu:
      goto LABEL_45;
    case 0xBu:
      BOOL v21 = 0;
LABEL_31:
      v19 = 0;
      goto LABEL_32;
    default:
      goto LABEL_81;
  }
}

void __28__CSSearchAgent_startQuery___block_invoke_160(uint64_t a1)
{
  [*(id *)(a1 + 32) _willSendResultsBatch:*(void *)(a1 + 40) qid:*(void *)(a1 + 72)];
  v2 = *(_xpc_connection_s **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  v4 = [*(id *)(a1 + 64) queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 96);
  long long v8 = *(_OWORD *)(a1 + 80);
  v6[2] = __28__CSSearchAgent_startQuery___block_invoke_2;
  v6[3] = &unk_2645092B8;
  long long v9 = v5;
  uint64_t v10 = *(void *)(a1 + 112);
  id v7 = *(id *)(a1 + 32);
  xpc_connection_send_message_with_reply(v2, v3, v4, v6);
}

void __28__CSSearchAgent_startQuery___block_invoke_164(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v13 = *(_OWORD *)v5;
  long long v14 = *(_OWORD *)(v5 + 16);
  uint64_t v15 = *(void *)(v5 + 32);
  uint64_t v6 = *(void *)(a1 + 96);
  long long v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v5 + 16) = v7;
  *(void *)(v5 + 32) = v6;
  uint64_t v8 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v10 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v8;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v10;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "completionHandler";
  si_tracing_log_span_begin();
  if (a2)
  {
    if (*(unsigned char *)(a1 + 112)) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "qid", *(void *)(a1 + 104));
  csquery_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setQueryTask:0 forQueryID:*(void *)(a1 + 104)];

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v13;
  *(_OWORD *)(v5 + 16) = v14;
  *(void *)(v5 + 32) = v15;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SDConnectionConfiguration alloc];
  uint64_t v6 = [(SDConnectionConfiguration *)v5 initWithConnection:v4 isPrivate:sSearchAgentIsPrivate];

  LOBYTE(self) = [(CSSearchAgent *)self addClientConnectionIfAllowedForConfiguration:v6];
  return (char)self;
}

- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CSSearchClientConnection alloc] initWithConnectionConfiguration:v4];
  uint64_t v6 = [(CSSearchClientConnection *)v5 bundleID];
  if (v6)
  {

LABEL_4:
    long long v7 = [v4 connection];
    uint64_t v8 = +[CSSearchClientConnectionKey keyWithConnection:v7];

    long long v9 = [(CSSearchAgent *)self searchConnections];
    [v9 setObject:v5 forKeyedSubscript:v8];

    BOOL v10 = 1;
    goto LABEL_5;
  }
  if ([(CSSearchClientConnection *)v5 searchInternal]) {
    goto LABEL_4;
  }
  id v12 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CSSearchAgent addClientConnectionIfAllowedForConfiguration:](v4);
  }

  BOOL v10 = 0;
LABEL_5:

  return v10;
}

- (NSMutableDictionary)searchConnections
{
  return self->_searchConnections;
}

- (void)_prepareQueryContext:(id)a3 searchConnection:(id)a4
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v6 bundleID];
  char v8 = [v5 internal];
  uint64_t v9 = [v5 bundleIDs];
  BOOL v10 = (void *)v9;
  long long v11 = (void *)MEMORY[0x263EFFA68];
  if (v9) {
    id v12 = (void *)v9;
  }
  else {
    id v12 = (void *)MEMORY[0x263EFFA68];
  }
  id v13 = v12;

  uint64_t v14 = [v5 additionalBundleIDs];
  uint64_t v15 = (void *)v14;
  if (v14) {
    v16 = (void *)v14;
  }
  else {
    v16 = v11;
  }
  id v17 = v16;

  uint64_t v18 = [v5 instantAnswersBundleIDs];
  v19 = (void *)v18;
  if (v18) {
    int v20 = (void *)v18;
  }
  else {
    int v20 = v11;
  }
  id v21 = v20;

  id v84 = v17;
  id v85 = v6;
  long long v82 = v13;
  id v83 = v21;
  if (v8)
  {
    if (([v5 includeUserActivities] & 1) == 0) {
      [v7 hasPrefix:@"com.apple.search"];
    }
    goto LABEL_34;
  }
  if (![v13 count])
  {
    if (([v5 sourceOptions] & 1) != 0
      && ([v6 configuration],
          xpc_object_t v30 = objc_claimAutoreleasedReturnValue(),
          char v31 = [v30 allowMail],
          v30,
          (v31 & 1) != 0))
    {
      uint64_t v32 = &unk_26D0C8EA8;
    }
    else
    {
      id v96 = v7;
      uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v96 count:1];
    }
    [v5 setBundleIDs:v32];

LABEL_34:
    BOOL v36 = 0;
    goto LABEL_49;
  }
  v22 = [v6 allowedBundleIDs];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v23 = v13;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    char v26 = 0;
    uint64_t v27 = *(void *)v91;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v91 != v27) {
          objc_enumerationMutation(v23);
        }
        uint64_t v29 = *(void *)(*((void *)&v90 + 1) + 8 * i);
        if (([v7 isEqualToString:v29] & 1) == 0)
        {
          if (([v22 containsObject:v29] & 1) == 0)
          {
            uint64_t v33 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[CSSearchAgent _prepareQueryContext:searchConnection:]();
            }

            if (v26)
            {
              uint64_t v37 = objc_opt_new();
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              id v38 = v23;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v86 objects:v98 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v87;
                do
                {
                  for (uint64_t j = 0; j != v40; ++j)
                  {
                    if (*(void *)v87 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    uint64_t v43 = *(void *)(*((void *)&v86 + 1) + 8 * j);
                    if (([v22 containsObject:v43] & 1) != 0
                      || [v7 isEqualToString:v43])
                    {
                      [v37 addObject:v7];
                    }
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v86 objects:v98 count:16];
                }
                while (v40);
              }

              [v5 setBundleIDs:v37];
              int v35 = 1;
            }
            else
            {
              id v97 = v7;
              uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v97 count:1];
              [v5 setBundleIDs:v34];

              int v35 = 0;
            }
            goto LABEL_48;
          }
          char v26 = 1;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v90 objects:v99 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v26 = 0;
  }

  int v35 = v26 & 1;
LABEL_48:

  BOOL v36 = v35 != 0;
  id v17 = v84;
  id v6 = v85;
  id v21 = v83;
LABEL_49:
  if ([v5 generateSuggestions])
  {
    if ([v17 count])
    {
      id v44 = [v5 bundleIDs];
      uint64_t v45 = [v44 count];

      if (v45)
      {
        id v46 = [v5 bundleIDs];
        uint64_t v47 = [v46 arrayByAddingObjectsFromArray:v17];
        [v5 setBundleIDs:v47];
      }
    }
  }
  if ([v5 enableInstantAnswers] && objc_msgSend(v21, "count"))
  {
    id v17 = [v5 bundleIDs];
    if (![v17 count])
    {
LABEL_64:

      goto LABEL_65;
    }
    id v48 = v7;
    if (isInstantAnswerAllowed_onceToken != -1) {
      dispatch_once(&isInstantAnswerAllowed_onceToken, &__block_literal_global_10);
    }
    if (isInstantAnswerAllowed_isSearchToolDebugMode
      || ([v48 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v48 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0
      || [v48 hasPrefix:@"com.apple.ondeviceeval"])
    {

LABEL_63:
      id v17 = [v5 bundleIDs];
      dispatch_qos_class_t v49 = [v17 arrayByAddingObjectsFromArray:v21];
      [v5 setBundleIDs:v49];

      goto LABEL_64;
    }
    int v78 = [v48 isEqualToString:@"com.apple.mobilemail"];

    if (v78) {
      goto LABEL_63;
    }
  }
LABEL_65:
  v50 = [v6 configuration];
  objc_msgSend(v5, "setEntitledAttributes:", objc_msgSend(v50, "entitledAttributes"));

  dispatch_block_t v51 = [v6 configuration];
  char v52 = [v51 allowNotifications];

  if (v52)
  {
    long long v53 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[CSSearchAgent _prepareQueryContext:searchConnection:](v5, v53);
    }
  }
  else
  {
    os_signpost_id_t v54 = [v5 disableBundles];
    if (v54)
    {
      long long v55 = [v5 disableBundles];
      long long v53 = [v55 arrayByAddingObject:@"com.apple.usernotificationsd"];
    }
    else
    {
      long long v53 = &unk_26D0C8EC0;
    }

    [v5 setDisableBundles:v53];
  }

  uint64_t v56 = [v5 bundleIDs];
  if ([v56 count])
  {
    BOOL v57 = [v5 bundleIDs];
    char v58 = [v57 containsObject:@"com.apple.mobileslideshow"];

    if (v58) {
      goto LABEL_91;
    }
  }
  else
  {
  }
  uint64_t v59 = [MEMORY[0x263EFF980] array];
  id v17 = v59;
  if ((v8 & 1) == 0) {
    [v59 addObject:@"_kMDItemUserActivityType != \"*\""];
  }
  if (v36) {
    [v17 addObject:@"kMDItemHashtags==*"];
  }
  if (objc_opt_respondsToSelector())
  {
    int v60 = [(MDIndexer *)self->_indexer fileProviderDomainFilterQueries];
    uint64_t v61 = v60;
    if (v60 && [v60 count]) {
      [v17 addObjectsFromArray:v61];
    }
  }
  if ([v17 count])
  {
    uint64_t v62 = [v5 filterQueries];
    if (v62)
    {
      id v63 = [v5 filterQueries];
      int v64 = [v63 arrayByAddingObjectsFromArray:v17];
      [v5 setFilterQueries:v64];
    }
    else
    {
      [v5 setFilterQueries:v17];
    }
  }
LABEL_91:
  uint64_t v65 = [v5 protectionClasses];
  uint64_t v66 = [v5 bundleIDs];
  char v67 = [v66 containsObject:@"com.apple.spotlight.events"];
  if ((v67 & 1) == 0)
  {
    id v17 = [v5 bundleIDs];
    if (![v17 containsObject:@"com.apple.spotlight.contacts"]) {
      goto LABEL_99;
    }
  }
  BOOL v68 = [v5 protectionClasses];
  uint64_t v69 = *MEMORY[0x263F08098];
  if ([v68 containsObject:*MEMORY[0x263F08098]])
  {
LABEL_98:

    if (v67)
    {
LABEL_100:
      v73 = v84;
      id v72 = v85;
      v74 = v83;
      goto LABEL_101;
    }
LABEL_99:

    goto LABEL_100;
  }
  id v70 = [v5 clientBundleID];
  if ([v70 hasPrefix:@"com.apple.omniSearch"])
  {
LABEL_97:

    goto LABEL_98;
  }
  unsigned int v71 = [v5 clientBundleID];
  if ([v71 hasPrefix:@"com.apple.intelligenceflow"])
  {

    goto LABEL_97;
  }
  uint64_t v79 = [v5 clientBundleID];
  char v81 = [v79 hasPrefix:@"com.apple.SpotlightUITests"];

  if ((v67 & 1) == 0) {
  if ((v81 & 1) == 0)
  }
  {
    v73 = v84;
    id v72 = v85;
    v74 = v83;
    if ([v65 count])
    {
      [v65 arrayByAddingObject:v69];
    }
    else
    {
      uint64_t v95 = v69;
      [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
    id v77 = };
    [v5 setProtectionClasses:v77];

    [v5 protectionClasses];
    v65 = uint64_t v66 = v65;
LABEL_101:

    if (!v65) {
      goto LABEL_104;
    }
    goto LABEL_102;
  }
  v73 = v84;
  id v72 = v85;
  v74 = v83;
  if (!v65) {
    goto LABEL_104;
  }
LABEL_102:
  if (![v65 count])
  {
    id v75 = [v72 protectionClass];
    v94 = v75;
    id v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
    [v5 setProtectionClasses:v76];
  }
LABEL_104:
}

void __28__CSSearchAgent_startQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 72);
  long long v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "received XPC reply";
  si_tracing_log_span_begin();
  [*(id *)(a1 + 32) _didReceiveResultsBatchCompletion];
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (_xpc_connection_s *)a5;
  long long v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)char v26 = 136315394;
    *(void *)&v26[4] = a3;
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = xpc_connection_get_pid(v9);
    _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "search %s pid: %d", v26, 0x12u);
  }

  if (!strcmp(a3, "startQuery"))
  {
    [(CSSearchAgent *)self startQuery:v8];
LABEL_19:
    BOOL v11 = 1;
    goto LABEL_20;
  }
  if (!strcmp(a3, "cancelQuery"))
  {
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)char v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    uint64_t v27 = *(void *)(v12 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v13;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "csquery_command_cancel_query";
    si_tracing_log_span_begin();
    [(CSSearchAgent *)self cancelQuery:v8];
    si_tracing_log_span_end();
LABEL_18:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v26;
    *(_OWORD *)(v12 + 16) = *(_OWORD *)&v26[16];
    *(void *)(v12 + 32) = v27;
    goto LABEL_19;
  }
  if (!strcmp(a3, "pollResults"))
  {
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)char v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    uint64_t v27 = *(void *)(v12 + 32);
    uint64_t v15 = si_tracing_calc_traceid();
    uint64_t v16 = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v15;
    *(void *)(v12 + 8) = v16;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "csquery_command_poll_results";
    si_tracing_log_span_begin();
    [(CSSearchAgent *)self pollResults:v8];
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "simpleQuery"))
  {
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)char v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    uint64_t v27 = *(void *)(v12 + 32);
    uint64_t v17 = si_tracing_calc_traceid();
    uint64_t v18 = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v17;
    *(void *)(v12 + 8) = v18;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "csquery_command_start_simple_query";
    si_tracing_log_span_begin();
    [(CSSearchAgent *)self startSimpleQuery:v8];
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "simpleCancel"))
  {
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)char v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    uint64_t v27 = *(void *)(v12 + 32);
    uint64_t v19 = si_tracing_calc_traceid();
    uint64_t v20 = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v19;
    *(void *)(v12 + 8) = v20;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "csquery_command_cancel_simple_query";
    si_tracing_log_span_begin();
    [(CSSearchAgent *)self cancelSimpleQuery:v8];
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "userEngaged"))
  {
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)char v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    uint64_t v27 = *(void *)(v12 + 32);
    uint64_t v21 = si_tracing_calc_traceid();
    uint64_t v22 = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v21;
    *(void *)(v12 + 8) = v22;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "csquery_command_user_engaged";
    si_tracing_log_span_begin();
    [(CSSearchAgent *)self handleEngagement:v8 forConnection:v9];
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "preheat"))
  {
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)char v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    uint64_t v27 = *(void *)(v12 + 32);
    uint64_t v23 = si_tracing_calc_traceid();
    uint64_t v24 = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v23;
    *(void *)(v12 + 8) = v24;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "csquery_command_preheat";
    si_tracing_log_span_begin();
    [(CSSearchAgent *)self preheat:v8];
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

+ (id)searchAgent:(BOOL)a3 serviceName:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__CSSearchAgent_searchAgent_serviceName___block_invoke;
  v10[3] = &unk_264506700;
  BOOL v12 = a3;
  id v11 = v5;
  uint64_t v6 = searchAgent_serviceName__onceToken;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&searchAgent_serviceName__onceToken, v10);
  }
  id v8 = (id)sSearchAgent;

  return v8;
}

uint64_t __41__CSSearchAgent_searchAgent_serviceName___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [CSSearchAgent alloc];
  if (*(void *)(a1 + 32)) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = *MEMORY[0x263F01CC8];
  }
  if (v2)
  {
    uint64_t v5 = [(CSXPCConnection *)v3 initWithServiceName:v4];
    uint64_t v6 = (void *)sSearchAgent;
    sSearchAgent = v5;

    sSearchAgentIsPrivate = 1;
  }
  else
  {
    uint64_t v7 = [(CSXPCConnection *)v3 initMachServiceListenerWithName:v4];
    id v8 = (void *)sSearchAgent;
    sSearchAgent = v7;
  }
  id v9 = objc_opt_new();
  [(id)sSearchAgent setSearchConnections:v9];

  return MEMORY[0x270F4B1C8](CSSearchAgentFieldNameCallback);
}

+ (id)searchAgent
{
  return (id)sSearchAgent;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  uint64_t v5 = +[CSSearchClientConnectionKey keyWithConnection:](CSSearchClientConnectionKey, "keyWithConnection:", a3, a4);
  uint64_t v6 = [(NSMutableDictionary *)self->_searchConnections objectForKeyedSubscript:v5];
  uint64_t v7 = [(CSSearchAgent *)self searchConnections];
  [v7 setObject:0 forKeyedSubscript:v5];

  [v6 cancelQueryTasks];
  return 0;
}

- (void)cancelQuery:(id)a3
{
  xpc_object_t original = a3;
  xpc_dictionary_get_remote_connection(original);
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  uint64_t v6 = reply;
  if (v4 && reply)
  {
    uint64_t v7 = [(CSSearchAgent *)self searchConnection:v4];
    if (v7)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(original, "qid");
      [v7 cancelQueryTask:uint64];
    }
    else
    {
      uint64_t uint64 = 0;
    }
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message(v4, v6);
  }
}

- (void)pollResults:(id)a3
{
  xpc_object_t original = a3;
  xpc_dictionary_get_remote_connection(original);
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  uint64_t v6 = reply;
  if (v4 && reply)
  {
    uint64_t v7 = [(CSSearchAgent *)self searchConnection:v4];
    if (v7)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(original, "qid");
      [v7 pollResultsForQueryTask:uint64];
    }
    else
    {
      uint64_t uint64 = 0;
    }
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message(v4, v6);
  }
}

- (void)preheat:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F02B30];
  uint64_t v6 = xpc_dictionary_get_value(v4, "pcs");
  uint64_t v7 = (void *)[v5 copyNSStringArrayFromXPCArray:v6];

  uint64_t v8 = [v7 count];
  id v9 = logForCSLogCategoryQuery();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (!v10) {
      goto LABEL_7;
    }
    int v18 = 138412290;
    uint64_t v19 = v7;
    id v11 = "query preheat %@";
    BOOL v12 = v9;
    uint32_t v13 = 12;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    LOWORD(v18) = 0;
    id v11 = "query preheat";
    BOOL v12 = v9;
    uint32_t v13 = 2;
  }
  _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v18, v13);
LABEL_7:

  if (objc_opt_respondsToSelector())
  {
    [(MDIndexer *)self->_indexer queryPreheat:v7];
    int64_t v14 = 0;
  }
  else
  {
    int64_t v14 = -1;
  }
  xpc_dictionary_get_remote_connection(v4);
  uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    uint64_t v17 = reply;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "status", v14);
      xpc_connection_send_message(v15, v17);
    }
  }
}

void __28__CSSearchAgent_startQuery___block_invoke_169(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  long long v14 = *a4;
  uint64_t v15 = *((void *)a4 + 2);
  uint64_t IntValue = _MDPlistNumberGetIntValue();
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", a2, v14, v15);
  id v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 longLongValue] + IntValue;

  id v11 = [NSNumber numberWithLongLong:v10];
  BOOL v12 = *(void **)(a1 + 32);
  uint32_t v13 = [NSString stringWithUTF8String:a2];
  [v12 setObject:v11 forKeyedSubscript:v13];
}

void __28__CSSearchAgent_startQuery___block_invoke_2_171(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v8 = *(_OWORD *)(v7 + 16);
  long long v41 = *(_OWORD *)v7;
  long long v42 = v8;
  uint64_t v43 = *(void *)(v7 + 32);
  uint64_t v9 = *(void *)(a1 + 136);
  long long v10 = *(_OWORD *)(a1 + 120);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(v7 + 16) = v10;
  *(void *)(v7 + 32) = v9;
  long long v11 = *(_OWORD *)(a1 + 120);
  long long v38 = *(_OWORD *)(a1 + 104);
  long long v39 = v11;
  uint64_t v40 = *(void *)(a1 + 136);
  uint64_t v12 = *(void *)v7;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v14 = *(void *)(v7 + 8);
  *(void *)uint64_t v7 = v12;
  *(void *)(v7 + 8) = spanid;
  *(void *)(v7 + 16) = v14;
  *(unsigned char *)(v7 + 28) = 102;
  *(void *)(v7 + 32) = "rewriteHandler";
  si_tracing_log_span_begin();
  if (![*(id *)(a1 + 32) wasCanceledByClient])
  {
    uint64_t v15 = [v5 firstObject];
    uint64_t v16 = (void *)v15;
    if (v6 || !v15)
    {
      if (!*(unsigned char *)(a1 + 152))
      {
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v17 = [objc_alloc(MEMORY[0x263F556F0]) initWithSearchQueryString:*(void *)(a1 + 48) searchQueryContext:*(void *)(a1 + 56) score:0.0];

      uint64_t v16 = (void *)v17;
    }
    int v18 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 144);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v5 count];
      _os_log_impl(&dword_21F1CE000, v18, OS_LOG_TYPE_INFO, "[rewrite] qid=%ld Found %lu rewrite candidate", buf, 0x16u);
    }

    *(_OWORD *)buf = *(_OWORD *)v7;
    *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)(v7 + 16);
    uint64_t v46 = *(void *)(v7 + 32);
    uint64_t v20 = *(void **)(*(void *)(a1 + 64) + 56);
    uint64_t v21 = [v16 queryString];
    uint64_t v22 = [v16 searchQueryContext];
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    long long v35 = *(_OWORD *)buf;
    uint64_t v32 = __28__CSSearchAgent_startQuery___block_invoke_174;
    uint64_t v33 = &unk_264509380;
    long long v36 = *(_OWORD *)&buf[16];
    uint64_t v37 = v46;
    uint64_t v23 = *(void *)(a1 + 88);
    id v34 = *(id *)(a1 + 80);
    uint64_t v24 = [v20 taskForQueryWithQueryString:v21 queryContext:v22 eventHandler:0 resultsHandler:v23 completionHandler:&v30];

    if (v24)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(WeakRetained, "setQueryTask:forQueryID:", v24, *(void *)(a1 + 144), v30, v31, v32, v33);

      [*(id *)(*(void *)(a1 + 64) + 56) startQueryTask:v24];
    }
    else
    {
      char v26 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 72), "qid");
        __28__CSSearchAgent_startQuery___block_invoke_2_171_cold_1((uint64_t *)(a1 + 72), v44, uint64, v26);
      }

      (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80), 1, 0, v28);
    }

    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_16:
  si_tracing_log_span_end();
  long long v29 = v42;
  *(_OWORD *)uint64_t v7 = v41;
  *(_OWORD *)(v7 + 16) = v29;
  *(void *)(v7 + 32) = v43;
}

void __28__CSSearchAgent_startQuery___block_invoke_174(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 72);
  long long v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "rewrite query completion handler";
  si_tracing_log_span_begin();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (void)cancelSimpleQuery:(id)a3
{
  xpc_object_t original = a3;
  xpc_dictionary_get_remote_connection(original);
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  uint64_t v6 = reply;
  if (v4 && reply)
  {
    uint64_t v7 = [(CSSearchAgent *)self searchConnection:v4];
    if (v7)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(original, "qid");
      [v7 cancelQueryTask:uint64];
    }
    else
    {
      uint64_t uint64 = 0;
    }
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message(v4, v6);
  }
}

- (void)startSimpleQuery:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5 && reply)
  {
    uint64_t v8 = [(CSSearchAgent *)self searchConnection:v5];
    if (v8) {
      uint64_t uint64 = xpc_dictionary_get_uint64(v4, "qid");
    }
    else {
      uint64_t uint64 = 0;
    }
    uint64_t v10 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v11 = *(_OWORD *)(v10 + 16);
    long long v48 = *(_OWORD *)v10;
    long long v49 = v11;
    uint64_t v50 = *(void *)(v10 + 32);
    uint64_t v12 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v10 = v12;
    *(void *)(v10 + 8) = spanid;
    *(void *)(v10 + 16) = 0;
    *(_DWORD *)(v10 + 24) = uint64;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = "CSSearchAgent::startSimpleQuery";
    si_tracing_log_span_begin();
    if (uint64)
    {
      string = xpc_dictionary_get_string(v4, "query");
      uint64_t v15 = string;
      if (!string || !strcmp(string, "false"))
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v16 = xpc_dictionary_get_value(v4, "context");
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F02AD0]) initWithXPCDictionary:v16];

        if (v17)
        {
          uint64_t v25 = [v8 bundleID];
          uint64_t v18 = [v8 searchInternal];
          [v17 setMaxCount:1];
          [v17 setClientBundleID:v25];
          [v17 setInternal:v18];
          uint64_t v19 = [NSString stringWithUTF8String:v15];
          if (![(__CFString *)v19 length])
          {

            uint64_t v19 = @"true";
          }
          [(CSSearchAgent *)self _prepareQueryContext:v17 searchConnection:v8];
          v46[0] = 0;
          v46[1] = v46;
          v46[2] = 0x2020000000;
          char v47 = 0;
          id location = 0;
          objc_initWeak(&location, v8);
          long long v20 = *(_OWORD *)(v10 + 16);
          long long v42 = *(_OWORD *)v10;
          long long v43 = v20;
          uint64_t v44 = *(void *)(v10 + 32);
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __34__CSSearchAgent_startSimpleQuery___block_invoke;
          v36[3] = &unk_2645093F8;
          long long v38 = v42;
          long long v39 = v20;
          uint64_t v40 = v44;
          v36[4] = v46;
          objc_copyWeak(&v37, &location);
          uint64_t v41 = uint64;
          uint64_t v24 = (void *)[v36 copy];
          id from = 0;
          objc_initWeak(&from, v8);
          indexer = self->_indexer;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __34__CSSearchAgent_startSimpleQuery___block_invoke_2;
          v26[3] = &unk_264509420;
          long long v31 = v42;
          long long v32 = v43;
          uint64_t v33 = v44;
          uint64_t v34 = uint64;
          id v27 = v7;
          long long v29 = v46;
          id v28 = v5;
          objc_copyWeak(&v30, &from);
          uint64_t v21 = [(MDIndexer *)indexer taskForQueryWithQueryString:v19 queryContext:v17 eventHandler:0 resultsHandler:v24 completionHandler:v26];
          if (v21)
          {
            [v8 setQueryTask:v21 forQueryID:uint64];
            [(MDIndexer *)self->_indexer startQueryTask:v21];
          }

          objc_destroyWeak(&v30);
          objc_destroyWeak(&from);

          objc_destroyWeak(&v37);
          objc_destroyWeak(&location);
          _Block_object_dispose(v46, 8);

          if (v21) {
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    xpc_dictionary_set_uint64(v7, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message((xpc_connection_t)v5, v7);
LABEL_17:
    si_tracing_log_span_end();
    long long v22 = v49;
    *(_OWORD *)uint64_t v10 = v48;
    *(_OWORD *)(v10 + 16) = v22;
    *(void *)(v10 + 32) = v50;
  }
}

void __34__CSSearchAgent_startSimpleQuery___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v16 = a6;
  uint64_t v8 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v17 = *(_OWORD *)v8;
  long long v18 = *(_OWORD *)(v8 + 16);
  uint64_t v19 = *(void *)(v8 + 32);
  uint64_t v9 = *(void *)(a1 + 80);
  long long v10 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = v9;
  uint64_t v11 = *(void *)v8;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v13 = *(void *)(v8 + 8);
  *(void *)uint64_t v8 = v11;
  *(void *)(v8 + 8) = spanid;
  *(void *)(v8 + 16) = v13;
  *(unsigned char *)(v8 + 28) = 102;
  *(void *)(v8 + 32) = "resultsHandler";
  si_tracing_log_span_begin();
  if ((!a2 || a2 == 6) && _MDStoreOIDArrayGetVectorCount() >= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v15 = [WeakRetained queryTask:*(void *)(a1 + 88)];

    [v15 cancel];
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v8 = v17;
  *(_OWORD *)(v8 + 16) = v18;
  *(void *)(v8 + 32) = v19;
}

void __34__CSSearchAgent_startSimpleQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v11 = *(_OWORD *)v3;
  long long v12 = *(_OWORD *)(v3 + 16);
  uint64_t v13 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 96);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completionHandler";
  si_tracing_log_span_begin();
  csquery_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "qid", *(void *)(a1 + 104));
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "t", 1uLL);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "exists", *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setQueryTask:0 forQueryID:*(void *)(a1 + 104)];

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(void *)(v3 + 32) = v13;
}

- (void)handleEngagement:(id)a3 forConnection:(id)a4
{
  id v17 = a3;
  uint64_t v6 = [(CSSearchAgent *)self searchConnection:a4];
  char v7 = [v6 searchInternal];
  uint64_t v8 = [v6 bundleID];
  uint64_t v9 = [MEMORY[0x263F02B30] copyNSStringForKey:"qenb" fromXPCDictionary:v17];
  id v10 = (void *)v9;
  if (v7) {
    goto LABEL_5;
  }
  if (!v9 || [v8 isEqual:v9])
  {
    id v11 = v8;

    id v10 = v11;
LABEL_5:
    long long v12 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v17];
    uint64_t v13 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"userquery" fromXPCDictionary:v17];
    uint64_t v14 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"qenr" fromXPCDictionary:v17];
    indexer = self->_indexer;
    id v16 = [MEMORY[0x263EFF910] date];
    [(MDIndexer *)indexer recordEngagementForBundleID:v10 uniqueIdentifier:v14 protectionClass:v12 userQuery:v13 date:v16];
  }
}

- (MDIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
}

- (void)setSearchConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchConnections, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
}

- (void)addClientConnectionIfAllowedForConfiguration:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 connection];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Could not resolve bundle id for %@", v4, v5, v6, v7, v8);
}

- (void)_prepareQueryContext:(void *)a1 searchConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 clientBundleID];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "Notifications allowed for bid: %@", v4, 0xCu);
}

- (void)_prepareQueryContext:searchConnection:.cold.2()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_ERROR, "Client %@ trying to search other bundles (%@) without having entitlement %@", v3, 0x20u);
}

- (void)startQuery:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "startQuery: Failed to create query task for query id %lld, xpc object %@", buf, 0x16u);
}

- (void)startQuery:(void *)a1 .cold.2(void *a1)
{
  xpc_dictionary_get_uint64(a1, "qid");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_2(&dword_21F1CE000, v1, v2, "startQuery: No reply for query id %lld, xpc object %@", v3, v4, v5, v6, v7);
}

- (void)startQuery:(void *)a1 .cold.3(void *a1)
{
  xpc_dictionary_get_uint64(a1, "qid");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_2(&dword_21F1CE000, v1, v2, "startQuery: No remote connection for query id %lld, xpc object %@", v3, v4, v5, v6, v7);
}

void __28__CSSearchAgent_startQuery___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __28__CSSearchAgent_startQuery___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_30();
  _os_log_debug_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_DEBUG, "[rewrite] qid=%ld Rewrite gather ended hasResults:%@", v1, 0x16u);
}

void __28__CSSearchAgent_startQuery___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_6_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_30();
  _os_log_debug_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_DEBUG, "[rewrite] qid=%ld Rewrite finished hasResults:%@", v1, 0x16u);
}

void __28__CSSearchAgent_startQuery___block_invoke_2_171_cold_1(uint64_t *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *a1;
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "[rewrite] qid=%lld startQuery: Failed to create rewrite query task, xpc object %@", buf, 0x16u);
}

@end