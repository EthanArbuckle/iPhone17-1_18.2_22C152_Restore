@interface WBSHistoryServiceURLCompletion
- (BOOL)queryVisitCounts:(id)a3 outVisitCountScore:(int64_t *)a4 outDailyVisitCounts:(id *)a5 outWeeklyVisitCounts:(id *)a6;
- (WBSHistoryServiceURLCompletion)init;
- (double)lastVisitTimeForURLString:(id)a3;
- (id).cxx_construct;
- (id)_endOfRedirectChain:(id)a3;
- (id)_warmUpWithDatabase:(id)a3;
- (id)warmUpWithDatabase:(id)a3;
- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9;
- (void)noteRedirectFromURLString:(id)a3 toURLString:(id)a4;
- (void)recordVisit:(id)a3 sourceVisit:(id)a4 title:(id)a5 loadSuccessful:(BOOL)a6 origin:(int64_t)a7 increaseVisitCount:(BOOL)a8 score:(int)a9 statusCode:(int64_t)a10;
- (void)removeURLStrings:(id)a3;
- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationGroup:(id)a6 enumerationBlock:(id)a7;
- (void)updateItemWithLatestVisit:(id)a3 database:(id)a4;
- (void)updateURLString:(id)a3 autocompleteTriggerData:(id)a4;
- (void)updateVisit:(id)a3 oldScore:(int)a4 newScore:(int)a5 completionHandler:(id)a6;
- (void)updateVisit:(id)a3 title:(id)a4 databaseID:(id)a5;
@end

@implementation WBSHistoryServiceURLCompletion

- (id)warmUpWithDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSHistoryServiceURLCompletion_warmUpWithDatabase___block_invoke;
  block[3] = &unk_1E5C9A498;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_barrier_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

- (WBSHistoryServiceURLCompletion)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSHistoryServiceURLCompletion;
  v2 = [(WBSHistoryServiceURLCompletion *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("WBSHistoryServiceURLCompletion", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

void __53__WBSHistoryServiceURLCompletion_warmUpWithDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _warmUpWithDatabase:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_warmUpWithDatabase:(id)a3
{
  v93[19] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:v57, @"SELECT history_items.id, history_items.url, history_visits.title, redirect_destination, load_successful, visit_time, visit_count_score, status_code, daily_visit_counts, weekly_visit_counts, autocomplete_triggers, origin FROM history_items INNER JOIN history_visits ON history_visits.id = safari_latest_visit_for (history_items.id)" query];
  if (v3)
  {
    v54 = v3;
    id v4 = (sqlite3_stmt *)[v3 handle];
    long long v79 = 0u;
    long long v80 = 0u;
    int v81 = 1065353216;
    long long v76 = 0u;
    long long v77 = 0u;
    int v78 = 1065353216;
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x5812000000;
    v71 = __Block_byref_object_copy__27;
    v72 = __Block_byref_object_dispose__28;
    v53 = (char *)v73 + 8;
    memset(v73, 0, sizeof(v73));
    uint64_t v74 = 0;
    int v75 = 1065353216;
    v62 = objc_alloc_init(WBSMemoryPressureMonitor);
    p_map = (SafariShared::URLCompletionEntryMap *)&self->_map;
    while (1)
    {
      if ([(WBSMemoryPressureMonitor *)v62 pressured]) {
        goto LABEL_16;
      }
      int v5 = sqlite3_step(v4);
      if (v5 != 100) {
        break;
      }
      __p[0] = 0;
      __p[0] = (void *)sqlite3_column_int64(v4, 0);
      id v6 = sqlite3_column_text(v4, 1);
      int v7 = sqlite3_column_bytes(v4, 1);
      if (v6)
      {
        int v8 = v7;
        if (strncmp((const char *)v6, "data:", 5uLL))
        {
          sqlite3_int64 v61 = sqlite3_column_int64(v4, 6);
          v60 = sqlite3_column_blob(v4, 8);
          int v9 = sqlite3_column_bytes(v4, 8);
          uint64_t v10 = v9;
          if ((v9 & 3) != 0) {
            uint64_t v10 = 0;
          }
          uint64_t v59 = v10;
          v58 = sqlite3_column_blob(v4, 9);
          int v11 = sqlite3_column_bytes(v4, 9);
          if ((v11 & 3) != 0) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = v11;
          }
          v13 = sqlite3_column_blob(v4, 10);
          int v14 = sqlite3_column_bytes(v4, 10);
          BOOL v15 = sqlite3_column_int(v4, 4) != 0;
          BOOL v16 = sqlite3_column_int64(v4, 11) == 0;
          id v17 = sqlite3_column_text(v4, 2);
          int v18 = sqlite3_column_bytes(v4, 2);
          double v19 = sqlite3_column_double(v4, 5);
          sqlite3_column_int64(v4, 7);
          uint64_t v20 = WBSStatusCodeGroupFromStatusCode();
          *(void *)buf = v6;
          *(void *)&buf[8] = v8;
          *(void *)&buf[16] = v61;
          v85[0] = v60;
          v85[1] = v59;
          v85[2] = v58;
          v85[3] = v12;
          v85[4] = v13;
          v85[5] = v14;
          BOOL v86 = v15;
          BOOL v87 = v16;
          v88 = v17;
          v89 = (void *)v18;
          double v90 = v19;
          BOOL v91 = v20 == 4;
          SafariShared::URLCompletionEntryBuilder::validateVisitedCountsIfNeeded((SafariShared::URLCompletionEntryBuilder *)buf);
          SafariShared::URLCompletionEntryMap::insert(p_map, (SafariShared::URLCompletionEntryBuilder *)buf, 1);
          id v67 = (id)objc_claimAutoreleasedReturnValue();
          std::__hash_table<std::__hash_value_type<long long,NSString * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,NSString * {__strong}>>>::__emplace_unique_key_args<long long,long long &,NSString * {__strong}&>((uint64_t)(v69 + 6), (unint64_t *)__p, __p, &v67);
          sqlite3_int64 v66 = 0;
          sqlite3_int64 v66 = sqlite3_column_int64(v4, 3);
          if (v66)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v79, (unint64_t *)&v66, &v66);
            std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_multi<long long &,long long &>(&v76, (unint64_t *)&v66, __p);
          }
        }
      }
    }
    if (v5 == 101)
    {
LABEL_16:
      [v54 invalidate];
      v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.6(v21);
      }
      if ([(WBSMemoryPressureMonitor *)v62 pressured])
      {
        *(void *)buf = -1;
        __p[0] = buf;
        SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<long long &>>(v57, 0, @"SELECT count(*) FROM history_items", (sqlite3_int64 **)__p);
        v22 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          [(WBSHistoryServiceURLCompletion *)(uint64_t *)p_map _warmUpWithDatabase:v22];
        }
      }
      if (*((void *)&v77 + 1))
      {
        id v23 = objc_alloc(MEMORY[0x1E4F97FA0]);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:sn180100]((uint64_t)buf);
        std::__put_character_sequence[abi:sn180100]<char,std::char_traits<char>>(&buf[16], (uint64_t)"SELECT id, history_item FROM history_visits WHERE id IN (", 57);
        v24 = &v80;
        for (char i = 1; ; char i = 0)
        {
          v24 = *(long long **)v24;
          if (!v24) {
            break;
          }
          if ((i & 1) == 0)
          {
            LOBYTE(__p[0]) = 44;
            std::__put_character_sequence[abi:sn180100]<char,std::char_traits<char>>(&buf[16], (uint64_t)__p, 1);
          }
          std::ostream::operator<<();
        }
        std::__put_character_sequence[abi:sn180100]<char,std::char_traits<char>>(&buf[16], (uint64_t)")", 1);
        v28 = NSString;
        std::stringbuf::str[abi:sn180100]<std::allocator<char>>((uint64_t)v85, __p);
        if (v83 >= 0) {
          v29 = __p;
        }
        else {
          v29 = (void **)__p[0];
        }
        v30 = [v28 stringWithUTF8String:v29];
        if (v83 < 0) {
          operator delete(__p[0]);
        }
        *(void *)buf = *MEMORY[0x1E4FBA408];
        uint64_t v31 = *(void *)(MEMORY[0x1E4FBA408] + 72);
        *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x1E4FBA408] + 64);
        *(void *)&buf[16] = v31;
        v85[0] = MEMORY[0x1E4FBA470] + 16;
        if (v92 < 0) {
          operator delete(v89);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x1AD0C4710](v93);
        v32 = (void *)[v23 initWithDatabase:v57 query:v30];

        if (!v32)
        {
          v50 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]();
          }

          v27 = [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
          goto LABEL_66;
        }
        v33 = (sqlite3_stmt *)[v32 handle];
        while (1)
        {
          int v34 = sqlite3_step(v33);
          v35 = v32;
          if (v34 != 100) {
            break;
          }
          __p[0] = 0;
          __p[0] = (void *)sqlite3_column_int64(v33, 0);
          id v67 = 0;
          id v67 = (id)sqlite3_column_int64(v33, 1);
          v36 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__equal_range_multi<long long>(&v76, (unint64_t *)__p);
          v38 = v37;
          *(void *)buf = &v67;
          id v39 = (id)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v69 + 6), (unint64_t *)&v67, (uint64_t)&std::piecewise_construct, (void **)buf)[3];
          v40 = v39;
          if (v39)
          {
            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __54__WBSHistoryServiceURLCompletion__warmUpWithDatabase___block_invoke;
            v63[3] = &unk_1E5C9D610;
            v65 = &v68;
            v63[4] = self;
            id v64 = v39;
            id v41 = std::for_each[abi:sn180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<long long,long long>,void *> *>>,void({block_pointer} {__strong})(std::pair<long long,long long> const&)>(v36, v38, v63);
          }
        }
        if (v34 == 101)
        {
          [v32 invalidate];
          v43 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.4((uint64_t *)&v77 + 1, v43);
            v35 = v32;
          }
          v44 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = *(void *)p_map;
            if (*(void *)p_map) {
              uint64_t v45 = *(unsigned int *)(v45 - 12);
            }
            unint64_t value = self->_map._extras.__table_.__p2_.__value_;
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v45;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = value;
            _os_log_impl(&dword_1A6B5F000, v44, OS_LOG_TYPE_INFO, "Ready (%zi) (%zi)", buf, 0x16u);
          }
          v27 = 0;

LABEL_66:
          _Block_object_dispose(&v68, 8);
          std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)v53);
          std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v76);
          std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v79);
          goto LABEL_67;
        }
        v51 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]();
        }

        v27 = [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
        v54 = v32;
      }
      else
      {
        v47 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          uint64_t v48 = *(void *)p_map;
          if (*(void *)p_map) {
            uint64_t v48 = *(unsigned int *)(v48 - 12);
          }
          unint64_t v49 = self->_map._extras.__table_.__p2_.__value_;
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v49;
          _os_log_impl(&dword_1A6B5F000, v47, OS_LOG_TYPE_INFO, "Ready (%zi) (%zi)", buf, 0x16u);
        }
        v27 = 0;
      }
    }
    else
    {
      v42 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]();
      }

      v27 = [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
    }

    goto LABEL_66;
  }
  v26 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]();
  }

  v27 = [v57 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]"];
LABEL_67:

  return v27;
}

void __54__WBSHistoryServiceURLCompletion__warmUpWithDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8) + 48;
  int v5 = (void *)(a2 + 8);
  id v4 = (NSString *)(id)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v3, (unint64_t *)(a2 + 8), (uint64_t)&std::piecewise_construct, &v5)[3];
  if (v4)
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__emplace_multi<NSString * const {__strong}&,NSString * {__strong}&>((void *)(*(void *)(a1 + 32) + 64), (id *)(a1 + 40), (id *)&v4);
    SafariShared::URLCompletionEntryMap::setNextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)(*(void *)(a1 + 32) + 16), v4, *(NSString **)(a1 + 40));
  }
}

- (void)updateItemWithLatestVisit:(id)a3 database:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:v6, @"SELECT url, visit_count_score, daily_visit_counts, weekly_visit_counts, autocomplete_triggers, status_code FROM history_items WHERE id = ?" query];
  if (!v7)
  {
    uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v6 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:]"];
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:]();
    }
    goto LABEL_9;
  }
  uint64_t v8 = [v5 itemID];
  [v7 bindInt64:v8 atParameterIndex:1];
  int v9 = (sqlite3_stmt *)[v7 handle];
  int v10 = sqlite3_step(v9);
  if (v10 == 100)
  {
    id v13 = [v5 title];
    __s = (char *)[v13 UTF8String];

    uint64_t v31 = sqlite3_column_blob(v9, 0);
    int v30 = sqlite3_column_bytes(v9, 0);
    sqlite3_int64 v29 = sqlite3_column_int64(v9, 1);
    v28 = sqlite3_column_blob(v9, 2);
    int v14 = sqlite3_column_bytes(v9, 2);
    uint64_t v15 = v14;
    if ((v14 & 3) != 0) {
      uint64_t v15 = 0;
    }
    uint64_t v27 = v15;
    v26 = sqlite3_column_blob(v9, 3);
    int v16 = sqlite3_column_bytes(v9, 3);
    uint64_t v17 = v16;
    if ((v16 & 3) != 0) {
      uint64_t v17 = 0;
    }
    uint64_t v25 = v17;
    int v18 = sqlite3_column_blob(v9, 4);
    int v19 = sqlite3_column_bytes(v9, 4);
    char v20 = [v5 loadSuccessful];
    BOOL v21 = [v5 origin] == 0;
    if (__s) {
      size_t v22 = strlen(__s);
    }
    else {
      size_t v22 = 0;
    }
    [v5 visitTime];
    uint64_t v24 = v23;
    sqlite3_column_int64(v9, 5);
    *(void *)buf = v31;
    uint64_t v35 = v30;
    sqlite3_int64 v36 = v29;
    v37 = v28;
    uint64_t v38 = v27;
    id v39 = v26;
    uint64_t v40 = v25;
    id v41 = v18;
    uint64_t v42 = v19;
    char v43 = v20;
    BOOL v44 = v21;
    uint64_t v45 = __s;
    size_t v46 = v22;
    uint64_t v47 = v24;
    BOOL v48 = WBSStatusCodeGroupFromStatusCode() == 4;
    SafariShared::URLCompletionEntryBuilder::validateVisitedCountsIfNeeded((SafariShared::URLCompletionEntryBuilder *)buf);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3812000000;
    v33[3] = __Block_byref_object_copy__40;
    v33[4] = __Block_byref_object_dispose__41;
    v33[5] = 0;
    SafariShared::URLCompletionEntryBuilder::buildEntry((SafariShared::URLCompletionEntryBuilder *)buf);
  }
  if (v10 != 101)
  {
    uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v6 lastErrorWithMethodName:"-[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:]"];
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:]();
    }
LABEL_9:

    goto LABEL_21;
  }
  int v11 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:](buf, [v5 databaseID], v8, v11);
  }

LABEL_21:
}

void __69__WBSHistoryServiceURLCompletion_updateItemWithLatestVisit_database___block_invoke(void *a1)
{
}

- (void)updateURLString:(id)a3 autocompleteTriggerData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSHistoryServiceURLCompletion_updateURLString_autocompleteTriggerData___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(queue, block);
}

void __74__WBSHistoryServiceURLCompletion_updateURLString_autocompleteTriggerData___block_invoke(uint64_t a1)
{
}

- (void)noteRedirectFromURLString:(id)a3 toURLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSHistoryServiceURLCompletion_noteRedirectFromURLString_toURLString___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async(queue, block);
}

void __72__WBSHistoryServiceURLCompletion_noteRedirectFromURLString_toURLString___block_invoke(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__emplace_multi<NSString * const {__strong}&,NSString * {__strong}&>((void *)(*(void *)(a1 + 32) + 64), (id *)(a1 + 40), (id *)(a1 + 48));
  uint64_t v2 = *(NSString **)(a1 + 40);
  uint64_t v3 = (SafariShared::URLCompletionEntryMap *)(*(void *)(a1 + 32) + 16);
  id v4 = *(NSString **)(a1 + 48);
  SafariShared::URLCompletionEntryMap::setNextItemInRedirectChainOfItem(v3, v4, v2);
}

- (BOOL)queryVisitCounts:(id)a3 outVisitCountScore:(int64_t *)a4 outDailyVisitCounts:(id *)a5 outWeeklyVisitCounts:(id *)a6
{
  id v10 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  sqlite3_int64 v29 = __Block_byref_object_copy__25;
  int v30 = __Block_byref_object_dispose__25;
  id v31 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__25;
  uint64_t v24 = __Block_byref_object_dispose__25;
  id v25 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__WBSHistoryServiceURLCompletion_queryVisitCounts_outVisitCountScore_outDailyVisitCounts_outWeeklyVisitCounts___block_invoke;
  v14[3] = &unk_1E5C9D660;
  v14[4] = self;
  id v15 = v10;
  int v16 = &v32;
  uint64_t v17 = &v26;
  int v18 = &v20;
  int v19 = a4;
  id v12 = v10;
  dispatch_sync(queue, v14);
  *a5 = (id) v27[5];
  *a6 = (id) v21[5];
  LOBYTE(a6) = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return (char)a6;
}

void __111__WBSHistoryServiceURLCompletion_queryVisitCounts_outVisitCountScore_outDailyVisitCounts_outWeeklyVisitCounts___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = (uint64_t *)(a1[4] + 16);
  id v4 = (void *)a1[9];
  id v13 = 0;
  id v14 = 0;
  BOOL v5 = SafariShared::URLCompletionEntryMap::queryVisitCounts(v3, v2, v4, &v14, &v13);
  id v6 = v14;
  id v7 = v13;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(a1[8] + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

- (void)recordVisit:(id)a3 sourceVisit:(id)a4 title:(id)a5 loadSuccessful:(BOOL)a6 origin:(int64_t)a7 increaseVisitCount:(BOOL)a8 score:(int)a9 statusCode:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__WBSHistoryServiceURLCompletion_recordVisit_sourceVisit_title_loadSuccessful_origin_increaseVisitCount_score_statusCode___block_invoke;
  block[3] = &unk_1E5C9D688;
  block[4] = self;
  id v24 = v16;
  BOOL v30 = a6;
  int64_t v27 = a10;
  int64_t v28 = a7;
  BOOL v31 = a8;
  int v29 = a9;
  id v25 = v18;
  id v26 = v17;
  id v20 = v17;
  id v21 = v18;
  id v22 = v16;
  dispatch_barrier_async(queue, block);
}

void __122__WBSHistoryServiceURLCompletion_recordVisit_sourceVisit_title_loadSuccessful_origin_increaseVisitCount_score_statusCode___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBSStatusCodeGroupFromStatusCode();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) urlString];
  BOOL v5 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) visitTime];
  SafariShared::URLCompletionEntryMap::recordVisit((uint64_t *)(v3 + 16), v4, v5, *(unsigned __int8 *)(a1 + 84), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 85), *(_DWORD *)(a1 + 80), v2 == 4, v6);

  if (*(void *)(a1 + 56))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) urlString];
    id v11 = [*(id *)(a1 + 56) urlString];
    std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__emplace_multi<NSString * {__strong},NSString * {__strong}>((void *)(v7 + 64), (const void **)&v12, (uint64_t *)&v11);

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 56) urlString];
    uint64_t v10 = [*(id *)(a1 + 40) urlString];
    SafariShared::URLCompletionEntryMap::setNextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)(v8 + 16), v9, v10);
  }
}

- (void)updateVisit:(id)a3 title:(id)a4 databaseID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__WBSHistoryServiceURLCompletion_updateVisit_title_databaseID___block_invoke;
  v15[3] = &unk_1E5C9B5C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_barrier_async(queue, v15);
}

void __63__WBSHistoryServiceURLCompletion_updateVisit_title_databaseID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v5 = [*(id *)(a1 + 40) urlString];
  [*(id *)(a1 + 40) visitTime];
  SafariShared::URLCompletionEntryMap::updateItemTitle((SafariShared::URLCompletionEntryMap *)(v2 + 16), v5, v4, *(NSString **)(a1 + 48), v3);
}

- (void)updateVisit:(id)a3 oldScore:(int)a4 newScore:(int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9AFE0;
  v15[4] = self;
  id v16 = v10;
  int v18 = a4;
  int v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_barrier_async(queue, v15);
}

void __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke(uint64_t a1)
{
  BOOL v9 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) urlString];
  [*(id *)(a1 + 40) visitTime];
  SafariShared::URLCompletionEntryMap::updateItemScore((SafariShared::URLCompletionEntryMap *)(v2 + 16), v3, v4, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), &v9);

  BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C9AF18;
  id v7 = *(id *)(a1 + 48);
  BOOL v8 = v9;
  dispatch_async(v5, v6);
}

uint64_t __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)removeURLStrings:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__WBSHistoryServiceURLCompletion_removeURLStrings___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

void __51__WBSHistoryServiceURLCompletion_removeURLStrings___block_invoke(uint64_t a1)
{
}

- (double)lastVisitTimeForURLString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSHistoryServiceURLCompletion_lastVisitTimeForURLString___block_invoke;
  block[3] = &unk_1E5C9A498;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__WBSHistoryServiceURLCompletion_lastVisitTimeForURLString___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = SafariShared::URLCompletionEntryMap::lastVisitTime((SafariShared::URLCompletionEntryMap *)(*(void *)(a1 + 32) + 16), *(NSString **)(a1 + 40));
}

- (id)_endOfRedirectChain:(id)a3
{
  id v4 = (NSString *)a3;
  p_map = &self->_map;
  uint64_t v6 = 16;
  while (1)
  {
    SafariShared::URLCompletionEntryMap::nextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)p_map, v4);
    double v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      break;
    }

    id v4 = v7;
    if (!--v6) {
      goto LABEL_6;
    }
  }
  double v7 = v4;
LABEL_6:
  return v7;
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationGroup:(id)a6 enumerationBlock:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x6012000000;
  v28[3] = __Block_byref_object_copy__44;
  v28[4] = __Block_byref_object_dispose__45;
  v28[5] = 256;
  memset(&v28[6], 0, 40);
  int v29 = 1065353216;
  id v14 = a6;
  dispatch_queue_t v15 = dispatch_queue_create("WBSHistoryServiceURLCompletion.redundancyPreventer", 0);
  id v16 = (void *)v28[6];
  v28[6] = v15;

  queue = self->_queue;
  if (threadCountToEnumerateConcurrently(void)::onceToken != -1) {
    dispatch_once(&threadCountToEnumerateConcurrently(void)::onceToken, &__block_literal_global_106);
  }
  int v18 = threadCountToEnumerateConcurrently(void)::threadCount;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __113__WBSHistoryServiceURLCompletion_searchForUserTypedString_options_currentTime_enumerationGroup_enumerationBlock___block_invoke;
  v21[3] = &unk_1E5C9D6B0;
  id v25 = v28;
  unint64_t v26 = a4;
  id v22 = v12;
  uint64_t v23 = self;
  double v27 = a5;
  id v24 = v13;
  id v19 = v13;
  id v20 = v12;
  SafariShared::URLCompletionEntryMap::enumerateConcurrently((uint64_t)&self->_map, v14, queue, v18, v21);

  _Block_object_dispose(v28, 8);
  std::__hash_table<NSString * {__strong},std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::allocator<NSString * {__strong}>>::~__hash_table((uint64_t)&v28[7]);
}

void __113__WBSHistoryServiceURLCompletion_searchForUserTypedString_options_currentTime_enumerationGroup_enumerationBlock___block_invoke(void *a1, uint64_t a2)
{
  id v4 = *(NSString **)(a2 + 24);
  BOOL v5 = (NSString *)a1[4];
  uint64_t v6 = (WBSURLCompletionUserTypedString *)a1[8];
  double v7 = (__CFString *)*(id *)(a2 + 16);
  LOBYTE(v4) = SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions(v7, v4, v5, v6);

  if (v4)
  {
    id v8 = (void *)a1[5];
    id v9 = *(id *)a2;
    id v10 = [v8 _endOfRedirectChain:v9];
    CFTypeRef v18 = v10;

    uint64_t v11 = *(void *)(a1[7] + 8);
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    id v12 = *(NSObject **)(v11 + 48);
    char v23 = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN12SafariShared32URLCompletionRedundancyPreventer22shouldProcessURLStringEP8NSString_block_invoke;
    block[3] = &unk_1E5C9D750;
    void block[5] = v11 + 48;
    block[6] = v10;
    block[4] = &v20;
    dispatch_sync(v12, block);
    LODWORD(v9) = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    if (v9)
    {
      id v13 = [[WBSHistoryServiceURLCompletionMatchData alloc] initWithLastVisitWasFailure:*(void *)(a2 + 48) >= 0 visitWasFromThisDevice:(*(void *)(a2 + 48) >> 59) & 1 visitWasClientError:(*(void *)(a2 + 48) >> 58) & 1];
      id v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      SafariShared::URLCompletionEntryMap::addURLCompletionMatchEntryToArray((uint64_t *)(a1[5] + 16), v13, v14, v10);
      dispatch_queue_t v15 = std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__equal_range_multi<NSString * {__strong}>((void *)(a1[5] + 64), &v18);
      id v17 = v16;
      while (v15 != v17)
      {
        SafariShared::URLCompletionEntryMap::addURLCompletionMatchEntryToArray((uint64_t *)(a1[5] + 16), v13, v14, v15[3]);
        dispatch_queue_t v15 = (uint64_t **)*v15;
      }
      if ([v14 count])
      {
        [(WBSHistoryServiceURLCompletionMatchData *)v13 setEntries:v14];
        (*(void (**)(void))(a1[6] + 16))();
      }

      id v10 = (void *)v18;
    }
  }
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = (void (**)(void, void, void))v18;
  if (a3)
  {
    BOOL v30 = (void (**)(void, void, void))v18;
    uint64_t v20 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x4812000000;
    v48[3] = __Block_byref_object_copy__50;
    v48[4] = __Block_byref_object_dispose__51;
    v48[5] = &unk_1A6DD304D;
    memset(v49, 0, 24);
    v46[0] = 0;
    v46[1] = (void **)v46;
    v46[2] = (void **)0x2020000000;
    int v47 = 0x800000;
    if ((a7 & 2) != 0)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v21 = v16;
    if ((a7 & 1) != 0
      && -[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpressionOnce != -1)
    {
      dispatch_once(&-[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpressionOnce, &__block_literal_global_69);
    }
    dispatch_group_t v22 = dispatch_group_create();
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryServiceURLCompletion.computeFrequentlyVisitedSites", 0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C9D728;
    unint64_t v42 = a4;
    block[4] = self;
    dispatch_group_t v35 = v22;
    id v36 = v17;
    double v44 = a8;
    id v37 = v21;
    dispatch_queue_t v38 = v23;
    id v39 = v20;
    uint64_t v40 = v46;
    unint64_t v43 = a7;
    id v41 = v48;
    unint64_t v45 = a3;
    id v25 = v20;
    unint64_t v26 = v23;
    double v27 = v22;
    int64_t v28 = queue;
    id v16 = v21;
    dispatch_group_async(v27, v28, block);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_5;
    v31[3] = &unk_1E5C9C9B0;
    id v19 = v30;
    uint64_t v32 = v30;
    v33 = v48;
    dispatch_group_notify(v27, v26, v31);

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v48, 8);
    v46[0] = (void **)v49;
    std::vector<WBSHistoryServiceURLCompletionMatchEntry * {__strong}>::__destroy_vector::operator()[abi:sn180100](v46);
  }
  else
  {
    int v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void, void *))v19)[2](v19, 0, v29);
  }
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(log(in|out|on)|sign(in|out|on)|authenticat)" options:1 error:0];
  v1 = (void *)-[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpression;
  -[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpression = v0;
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (!v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v3) {
      unint64_t v4 = *(unsigned int *)(v3 - 12);
    }
    else {
      unint64_t v4 = 0;
    }
    *(float *)&double v5 = (float)(unint64_t)WBSTopSitesMinimumVisitCountThreshold(v4);
    LODWORD(v2) = +[WBSHistoryVisit scoreForWeightedVisitCount:v5];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v8 = *(void **)(v7 + 8);
  if (threadCountToEnumerateConcurrently(void)::onceToken != -1) {
    dispatch_once(&threadCountToEnumerateConcurrently(void)::onceToken, &__block_literal_global_106);
  }
  int v9 = threadCountToEnumerateConcurrently(void)::threadCount;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_3;
  v16[3] = &unk_1E5C9D700;
  int v27 = v2;
  id v17 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v24 = *(void *)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v18 = v10;
  uint64_t v19 = v11;
  uint64_t v25 = *(void *)(a1 + 112);
  id v20 = v12;
  id v21 = *(id *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 72);
  id v13 = (id)v15;
  long long v22 = v15;
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v23 = *(void *)(a1 + 88);
  uint64_t v26 = v14;
  SafariShared::URLCompletionEntryMap::enumerateConcurrently(v7 + 16, v6, v8, v9, v16);
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 32))
  {
    int v34 = *(_DWORD *)(a2 + 48);
    if (*(_DWORD *)(a1 + 120) <= v34)
    {
      id v4 = *(id *)a2;
      double v5 = objc_msgSend(v4, "safari_canonicalURLStringForFrequentlyVisitedSites");
      if ((*(void *)(a2 + 48) & 0x8000000000000000) != 0
        || (uint64_t v6 = *(void **)(a1 + 32)) != 0 && ([v6 containsObject:v5] & 1) != 0)
      {
        uint64_t v7 = *(void **)(a1 + 40);
        if ((!v7 || ([v7 containsObject:v5] & 1) == 0)
          && ((objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", @"http:") & 1) != 0
           || objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", @"https:"))
          && ((*(unsigned char *)(a1 + 96) & 1) == 0
           || objc_msgSend((id)-[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpression, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) == 0x7FFFFFFFFFFFFFFFLL))
        {
          id v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v4);
          int v9 = [v8 host];
          if (v9)
          {
            SafariShared::URLCompletionEntryMap::visitedMoreThanOnceStatistics((SafariShared::URLCompletionEntryMap *)(*(void *)(a1 + 48) + 16), (NSString *)v4);
            float v10 = WBSTopSitesScore();
            if (v10 > 0.0)
            {
              uint64_t v11 = [WBSHistoryServiceURLCompletionMatchEntry alloc];
              id v12 = *(id *)a2;
              uint64_t v13 = *(void *)(a2 + 24);
              id v14 = v12;
              *(float *)&double v15 = v10;
              id v16 = [(WBSHistoryServiceURLCompletionMatchEntry *)v11 initWithURLString:v14 title:v13 topSitesScore:v34 visitCountScore:v15];

              id v17 = *(NSObject **)(a1 + 56);
              id v18 = *(NSObject **)(a1 + 64);
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_4;
              v25[3] = &unk_1E5C9D6D8;
              float v33 = v10;
              uint64_t v19 = *(void *)(a1 + 96);
              id v20 = *(void **)(a1 + 72);
              uint64_t v29 = *(void *)(a1 + 80);
              uint64_t v31 = v19;
              id v26 = v20;
              id v21 = v9;
              uint64_t v22 = *(void *)(a1 + 88);
              id v27 = v21;
              int64_t v28 = v16;
              uint64_t v23 = *(void *)(a1 + 112);
              uint64_t v30 = v22;
              uint64_t v32 = v23;
              uint64_t v24 = v16;
              dispatch_group_async(v17, v18, v25);
            }
          }
        }
      }
    }
  }
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_4(uint64_t a1)
{
  if (*(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > *(float *)(a1 + 88)) {
    return;
  }
  if ((*(unsigned char *)(a1 + 72) & 2) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v2)
    {
      float v3 = *(float *)(a1 + 88);
      id v26 = v2;
      [v2 topSitesScore];
      if (v3 < v4)
      {

        return;
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v7 = *(void ***)(v5 + 48);
      uint64_t v6 = *(void ***)(v5 + 56);
      uint64_t v2 = v26;
      if (v7 != v6)
      {
        while (*v7 != v26)
        {
          if (++v7 == v6)
          {
            uint64_t v7 = *(void ***)(v5 + 56);
            break;
          }
        }
      }
      if (v7 != v6)
      {
        std::__unwrap_and_dispatch[abi:sn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,WBSHistoryServiceURLCompletionMatchEntry * {__strong}*,WBSHistoryServiceURLCompletionMatchEntry * {__strong}*,WBSHistoryServiceURLCompletionMatchEntry * {__strong}*,0>(v7 + 1, v6, v7);
        uint64_t v9 = v8;
        for (uint64_t i = *(void *)(v5 + 56); i != v9; i -= 8)
        {
          uint64_t v11 = *(void **)(i - 8);
        }
        *(void *)(v5 + 56) = v9;
        uint64_t v2 = v26;
      }
    }

    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id v14 = *(uint64_t **)(v12 + 48);
  uint64_t v13 = *(uint64_t **)(v12 + 56);
  if (*(void *)(a1 + 80) <= (unint64_t)(v13 - v14))
  {
    if (v14 == v13) {
      goto LABEL_34;
    }
    [(id)*(v13 - 1) topSitesScore];
    if (v15 > *(float *)(a1 + 88)) {
      return;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v17 = *(void *)(v16 + 56);
    if (*(void *)(v16 + 48) == v17) {
      goto LABEL_34;
    }

    *(void *)(v16 + 56) = v17 - 8;
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v14 = *(uint64_t **)(v12 + 48);
    uint64_t v13 = *(uint64_t **)(v12 + 56);
  }
  id v18 = (void *)(v12 + 48);
  if (v13 != v14)
  {
    unint64_t v19 = v13 - v14;
    do
    {
      id v20 = (WBSHistoryServiceURLCompletionMatchEntry **)&v14[v19 >> 1];
      uint64_t v22 = *v20;
      id v21 = v20 + 1;
      if (WBSHistoryServiceURLCompletionMatchEntrySorter(*(WBSHistoryServiceURLCompletionMatchEntry **)(a1 + 48), v22))
      {
        v19 >>= 1;
      }
      else
      {
        id v14 = (uint64_t *)v21;
        v19 += ~(v19 >> 1);
      }
    }
    while (v19);
    uint64_t v13 = v14;
  }
  std::vector<WBSHistoryServiceURLCompletionMatchEntry * {__strong}>::insert(v18, v13, (id *)(a1 + 48));
  uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48);
  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 56);
  if (*(void *)(a1 + 80) <= (unint64_t)((v23 - v24) >> 3))
  {
    if (v24 != v23)
    {
      [*(id *)(v23 - 8) topSitesScore];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v25;
      return;
    }
LABEL_34:
    __break(1u);
  }
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::~__hash_table((uint64_t)&self->_redirectSources);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>>>::~__hash_table((uint64_t)&self->_map._extras);
  m_table = (id *)self->_map._map.var0.m_table;
  if (m_table) {
    WTF::HashTable<SafariShared::URLCompletionEntryKey,SafariShared::URLCompletionEntry,SafariShared::URLCompletionEntryKeyExtractor,SafariShared::URLCompletionEntryHash,SafariShared::URLCompletionEntryValueTraits,SafariShared::URLCompletionEntryKeyTraits>::deallocateTable(m_table, v3);
  }
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_warmUpWithDatabase:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to fetch URLs and Page's title from database: %{public}@", v6);
}

- (void)_warmUpWithDatabase:.cold.2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to resolve indirections from database: %{public}@", v6);
}

- (void)_warmUpWithDatabase:.cold.3()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to Warm Up: %{public}@", v6);
}

- (void)_warmUpWithDatabase:(uint64_t *)a1 .cold.4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Resolved indirections (%zi)", (uint8_t *)&v3, 0xCu);
}

- (void)_warmUpWithDatabase:(os_log_t)log .cold.5(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  if (*a1) {
    uint64_t v3 = *(unsigned int *)(v3 - 12);
  }
  uint64_t v4 = *a2;
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_fault_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_FAULT, "The warmup procedure was interrupted by a memory pressure warning; Loaded %zi, Total database is %zi",
    (uint8_t *)&v5,
    0x16u);
}

- (void)_warmUpWithDatabase:(os_log_t)log .cold.6(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Loaded URLs and titles", v1, 2u);
}

- (void)updateItemWithLatestVisit:database:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to initialize statement to fetch item corresponding to visit: %{public}@", v6);
}

- (void)updateItemWithLatestVisit:database:.cold.2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to fetch item corresponding to visit: %{public}@", v6);
}

- (void)updateItemWithLatestVisit:(uint64_t)a3 database:(os_log_t)log .cold.3(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Could not find item corresponding to visit %lld (with item ID %lld)", buf, 0x16u);
}

@end