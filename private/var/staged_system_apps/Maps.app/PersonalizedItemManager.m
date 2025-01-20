@interface PersonalizedItemManager
- (BOOL)updateInProgress;
- (BOOL)updatesPaused;
- (NSArray)allItems;
- (NSArray)itemGroups;
- (NSArray)itemSources;
- (NSArray)previousItemGroups;
- (NSArray)previousItems;
- (PersonalizedItemClientRankingFunction)_clientRankingFunction;
- (PersonalizedItemManager)init;
- (PersonalizedItemPriorityFunction)_priorityFunction;
- (id)_itemsFilteredBySearchableString:(id)a3 predicate:(id)a4;
- (id)itemsContainingSearchableString:(id)a3;
- (id)itemsMatchingSearchableString:(id)a3;
- (void)_gatherItemsWithShouldCancel:(id)a3 completion:(id)a4;
- (void)_recalculateIfNeeded;
- (void)_setNeedsRecalculation;
- (void)addItemSource:(id)a3;
- (void)addObserver:(id)a3;
- (void)fetchAllItems:(id)a3;
- (void)fetchItemsGroups:(id)a3;
- (void)removeItemSource:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setClientRankingFunction:(id)a3;
- (void)setItemSources:(id)a3;
- (void)setPriorityFunction:(id)a3;
- (void)setUpdatesPaused:(BOOL)a3;
@end

@implementation PersonalizedItemManager

- (NSArray)itemGroups
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100103FA8;
  v10 = sub_100104860;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100109234;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)allItems
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100103FA8;
  v10 = sub_100104860;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001093F4;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010905C;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

- (PersonalizedItemManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)PersonalizedItemManager;
  v2 = [(PersonalizedItemManager *)&v21 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("PersonalizedItemManager.lock", v3);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("PersonalizedItemManager.calculationQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSMutableArray array];
    itemSources = v2->_itemSources;
    v2->_itemSources = (NSMutableArray *)v9;

    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v11;

    clientRankingFunction = v2->_clientRankingFunction;
    v2->_clientRankingFunction = 0;

    uint64_t v14 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution];
    priorityFunction = v2->_priorityFunction;
    v2->_priorityFunction = (PersonalizedItemPriorityFunction *)v14;

    uint64_t v16 = +[NSMutableArray array];
    itemCompletions = v2->_itemCompletions;
    v2->_itemCompletions = (NSMutableArray *)v16;

    uint64_t v18 = +[NSMutableArray array];
    itemGroupCompletions = v2->_itemGroupCompletions;
    v2->_itemGroupCompletions = (NSMutableArray *)v18;
  }
  return v2;
}

- (void)_setNeedsRecalculation
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071374;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(lock, block);
  [(PersonalizedItemManager *)self _recalculateIfNeeded];
}

- (void)_recalculateIfNeeded
{
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100103FA8;
  v24 = sub_100104860;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D164;
  block[3] = &unk_1012F9348;
  block[4] = self;
  void block[5] = &v16;
  block[6] = v26;
  block[7] = &v20;
  dispatch_sync(lock, block);
  if (*((unsigned char *)v17 + 24))
  {
    dispatch_queue_t v4 = (void *)v21[5];
    if (v4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = v4;
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v28 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v12;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) personalizedItemManagerWillChangeItems:self];
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [v5 countByEnumeratingWithState:&v11 objects:v28 count:16];
        }
        while (v6);
      }
    }
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006E31C;
    v10[3] = &unk_1012F14D0;
    v10[4] = self;
    v10[5] = v26;
    v10[6] = &v20;
    dispatch_async(queue, v10);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
}

- (void)setItemSources:(id)a3
{
  id v4 = &__NSArray0__struct;
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  lock = self->_lock;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1000E0150;
  long long v11 = &unk_1012E5D58;
  id v12 = v5;
  long long v13 = self;
  id v7 = v5;
  dispatch_sync(lock, &v8);
  [(PersonalizedItemManager *)self _setNeedsRecalculation];
}

- (void)_gatherItemsWithShouldCancel:(id)a3 completion:(id)a4
{
  id v6 = (unsigned int (**)(void))a3;
  id v103 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x3032000000;
  v158 = sub_100103FA8;
  v159 = sub_100104860;
  id v160 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030198;
  block[3] = &unk_1012E73F0;
  void block[5] = &v155;
  block[4] = self;
  dispatch_sync(lock, block);
  v109 = v6;
  LODWORD(v6) = ((uint64_t (*)(unsigned int (**)(void)))v6[2])(v6);
  id v8 = sub_1000EC2B4();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Cancelling gather items before starting", buf, 2u);
    }

    (*((void (**)(id, void, void))v103 + 2))(v103, 0, 0);
    goto LABEL_155;
  }
  if (v9)
  {
    v10 = self;
    long long v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      long long v13 = [(PersonalizedItemManager *)v10 performSelector:"accessibilityIdentifier"];
      long long v14 = v13;
      if (v13 && ([v13 isEqualToString:v12] & 1) == 0)
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_11;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_11:

    *(_DWORD *)buf = 138412290;
    id v170 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Starting to gather items...", buf, 0xCu);
  }
  [@"com.apple.Maps" UTF8String];
  uint64_t v16 = GEOFindOrCreateLog();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  uint64_t v18 = v16;
  char v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "GatherItems", "", buf, 2u);
  }

  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_1000EF2E4;
  v151[3] = &unk_1012E69C0;
  v99 = v19;
  v152 = v99;
  os_signpost_id_t v153 = v17;
  v101 = objc_retainBlock(v151);
  uint64_t v20 = [(id)v156[5] sortedArrayUsingComparator:&stru_1012F9400];
  objc_super v21 = (void *)v156[5];
  v156[5] = v20;

  uint64_t v22 = sub_1000EC2B4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = (id)v156[5];
    v24 = v23;
    if (v23)
    {
      if ([v23 count])
      {
        id v25 = [v24 componentsJoinedByString:@", "];
        v26 = +[NSString stringWithFormat:@"<%p> [%@]", v24, v25];
      }
      else
      {
        v26 = +[NSString stringWithFormat:@"<%p> (empty)", v24];
      }
    }
    else
    {
      v26 = @"<nil>";
    }

    *(_DWORD *)buf = 138412290;
    id v170 = v26;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "- Sorted sources: %@", buf, 0xCu);
  }
  v116 = +[NSMutableArray array];
  int v27 = +[NSMutableDictionary dictionary];
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id obj = (id)v156[5];
  id v98 = [obj countByEnumeratingWithState:&v147 objects:v173 count:16];
  if (v98)
  {
    uint64_t v100 = *(void *)v148;
LABEL_24:
    uint64_t v102 = 0;
LABEL_25:
    if (*(void *)v148 != v100) {
      objc_enumerationMutation(obj);
    }
    v106 = *(void **)(*((void *)&v147 + 1) + 8 * v102);
    v28 = [v106 allItems];
    id v29 = [v28 copy];

    id v30 = [v29 count];
    v31 = sub_1000EC2B4();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (!v32) {
        goto LABEL_48;
      }
      id v33 = v106;
      if (!v33)
      {
        v38 = @"<nil>";
        goto LABEL_45;
      }
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      if (objc_opt_respondsToSelector())
      {
        v36 = [v33 performSelector:"accessibilityIdentifier"];
        v37 = v36;
        if (v36 && ([v36 isEqualToString:v35] & 1) == 0)
        {
          v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v37];

          goto LABEL_35;
        }
      }
      v38 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_35:

LABEL_45:
      *(_DWORD *)buf = 138412546;
      id v170 = v38;
      __int16 v171 = 2112;
      id v172 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "- %@: all items = %@", buf, 0x16u);

      goto LABEL_48;
    }
    if (!v32) {
      goto LABEL_48;
    }
    id v39 = v106;
    if (!v39)
    {
      v44 = @"<nil>";
      goto LABEL_47;
    }
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    if (objc_opt_respondsToSelector())
    {
      v42 = [v39 performSelector:"accessibilityIdentifier"];
      v43 = v42;
      if (v42 && ([v42 isEqualToString:v41] & 1) == 0)
      {
        v44 = +[NSString stringWithFormat:@"%@<%p, %@>", v41, v39, v43];

        goto LABEL_43;
      }
    }
    v44 = +[NSString stringWithFormat:@"%@<%p>", v41, v39];
LABEL_43:

LABEL_47:
    *(_DWORD *)buf = 138412290;
    id v170 = v44;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "- %@: no items", buf, 0xCu);

LABEL_48:
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v108 = v29;
    id v104 = [v108 countByEnumeratingWithState:&v143 objects:v168 count:16];
    if (!v104) {
      goto LABEL_117;
    }
    uint64_t v105 = *(void *)v144;
LABEL_50:
    uint64_t v111 = 0;
    while (1)
    {
      if (*(void *)v144 != v105) {
        objc_enumerationMutation(v108);
      }
      v112 = *(void **)(*((void *)&v143 + 1) + 8 * v111);
      if (v109[2]())
      {
        v97 = sub_1000EC2B4();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "- Cancelling gather items partway", buf, 2u);
        }

        ((void (*)(void))v101[2])();
        (*((void (**)(id, void, void))v103 + 2))(v103, 0, 0);

        goto LABEL_154;
      }
      v110 = [v112 keys];
      if ([v106 sourceType] == (id)1)
      {
        id v45 = +[NSMutableSet setWithObject:v112];
        [v116 addObject:v45];
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        id v46 = v110;
        id v47 = [v46 countByEnumeratingWithState:&v139 objects:v167 count:16];
        if (v47)
        {
          uint64_t v48 = *(void *)v140;
          do
          {
            for (i = 0; i != v47; i = (char *)i + 1)
            {
              if (*(void *)v140 != v48) {
                objc_enumerationMutation(v46);
              }
              uint64_t v50 = *(void *)(*((void *)&v139 + 1) + 8 * i);
              v51 = [v27 objectForKeyedSubscript:v50];
              BOOL v52 = v51 == 0;

              if (v52) {
                [v27 setObject:v45 forKeyedSubscript:v50];
              }
            }
            id v47 = [v46 countByEnumeratingWithState:&v139 objects:v167 count:16];
          }
          while (v47);
        }
        goto LABEL_115;
      }
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v114 = v110;
      id v53 = [v114 countByEnumeratingWithState:&v135 objects:v166 count:16];
      if (!v53)
      {

        goto LABEL_104;
      }
      id v54 = 0;
      uint64_t v117 = *(void *)v136;
      do
      {
        v55 = 0;
        do
        {
          if (*(void *)v136 != v117) {
            objc_enumerationMutation(v114);
          }
          v56 = *(void **)(*((void *)&v135 + 1) + 8 * (void)v55);
          v57 = sub_1000EC2B4();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            id v58 = v112;
            if (v112)
            {
              v59 = (objc_class *)objc_opt_class();
              v60 = NSStringFromClass(v59);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_76;
              }
              v61 = [v58 performSelector:"accessibilityIdentifier"];
              v62 = v61;
              if (v61 && ([v61 isEqualToString:v60] & 1) == 0)
              {
                v63 = +[NSString stringWithFormat:@"%@<%p, %@>", v60, v58, v62];
              }
              else
              {

LABEL_76:
                v63 = +[NSString stringWithFormat:@"%@<%p>", v60, v58];
              }
            }
            else
            {
              v63 = @"<nil>";
            }

            *(_DWORD *)buf = 138412546;
            id v170 = v63;
            __int16 v171 = 2112;
            id v172 = v56;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "PersonalizedItem: %@ is mapped to : %@", buf, 0x16u);
          }
          id v64 = [v27 objectForKeyedSubscript:v56];
          v65 = v64;
          if (v64) {
            BOOL v66 = v64 == v54;
          }
          else {
            BOOL v66 = 1;
          }
          if (!v66)
          {
            if (v54)
            {
              [v54 unionSet:v64];
              id v67 = [v116 indexOfObject:v65];
              id v68 = [v116 indexOfObject:v54];
              if (v68 >= v67)
              {
                [v116 removeObjectAtIndex:v68];
                [v116 setObject:v54 atIndexedSubscript:v67];
              }
              else
              {
                [v116 removeObjectAtIndex:v67];
              }
              [v27 setObject:v54 forKeyedSubscript:v56];
              long long v133 = 0u;
              long long v134 = 0u;
              long long v131 = 0u;
              long long v132 = 0u;
              v69 = [v27 allKeysForObject:v65];
              id v70 = [v69 countByEnumeratingWithState:&v131 objects:v165 count:16];
              if (v70)
              {
                uint64_t v71 = *(void *)v132;
                do
                {
                  for (j = 0; j != v70; j = (char *)j + 1)
                  {
                    if (*(void *)v132 != v71) {
                      objc_enumerationMutation(v69);
                    }
                    [v27 setObject:v54 forKeyedSubscript:*(void *)(*((void *)&v131 + 1) + 8 * (void)j)];
                  }
                  id v70 = [v69 countByEnumeratingWithState:&v131 objects:v165 count:16];
                }
                while (v70);
              }
            }
            else
            {
              id v54 = v64;
            }
          }

          v55 = (char *)v55 + 1;
        }
        while (v55 != v53);
        id v73 = [v114 countByEnumeratingWithState:&v135 objects:v166 count:16];
        id v53 = v73;
      }
      while (v73);

      if (v54)
      {
        id v45 = v54;
        [v45 addObject:v112];
        id v46 = v45;
        goto LABEL_105;
      }
LABEL_104:
      id v46 = +[NSMutableSet setWithObject:v112];
      [v116 addObject:v46];
      id v45 = 0;
LABEL_105:
      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v74 = v114;
      id v75 = [v74 countByEnumeratingWithState:&v127 objects:v164 count:16];
      if (v75)
      {
        uint64_t v76 = *(void *)v128;
        do
        {
          for (k = 0; k != v75; k = (char *)k + 1)
          {
            if (*(void *)v128 != v76) {
              objc_enumerationMutation(v74);
            }
            uint64_t v78 = *(void *)(*((void *)&v127 + 1) + 8 * (void)k);
            v79 = [v27 objectForKeyedSubscript:v78];
            BOOL v80 = v79 == 0;

            if (v80) {
              [v27 setObject:v46 forKeyedSubscript:v78];
            }
          }
          id v75 = [v74 countByEnumeratingWithState:&v127 objects:v164 count:16];
        }
        while (v75);
      }

LABEL_115:
      if ((id)++v111 == v104)
      {
        id v104 = [v108 countByEnumeratingWithState:&v143 objects:v168 count:16];
        if (v104) {
          goto LABEL_50;
        }
LABEL_117:

        if ((id)++v102 == v98)
        {
          id v81 = [obj countByEnumeratingWithState:&v147 objects:v173 count:16];
          id v98 = v81;
          if (!v81) {
            break;
          }
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
  }

  id obj = +[NSMutableArray array];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v108 = v116;
  id v115 = [v108 countByEnumeratingWithState:&v123 objects:v163 count:16];
  if (v115)
  {
    uint64_t v113 = *(void *)v124;
    while (2)
    {
      for (m = 0; m != v115; m = (char *)m + 1)
      {
        if (*(void *)v124 != v113) {
          objc_enumerationMutation(v108);
        }
        v82 = *(void **)(*((void *)&v123 + 1) + 8 * (void)m);
        if (v109[2]())
        {
          v96 = sub_1000EC2B4();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "- Cancelling gather items partway", buf, 2u);
          }

          ((void (*)(void))v101[2])();
          (*((void (**)(id, void, void))v103 + 2))(v103, 0, 0);
          goto LABEL_154;
        }
        v83 = +[NSMutableArray array];
        v84 = +[NSMutableArray array];
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id v85 = v82;
        id v86 = [v85 countByEnumeratingWithState:&v119 objects:v162 count:16];
        if (v86)
        {
          uint64_t v87 = *(void *)v120;
          do
          {
            for (n = 0; n != v86; n = (char *)n + 1)
            {
              if (*(void *)v120 != v87) {
                objc_enumerationMutation(v85);
              }
              v89 = *(void **)(*((void *)&v119 + 1) + 8 * (void)n);
              if ((objc_opt_respondsToSelector() & 1) != 0
                && ([v89 eventDate], (v90 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                [v84 addObject:v89];
              }
              else
              {
                [v83 addObject:v89];
                v90 = 0;
              }
            }
            id v86 = [v85 countByEnumeratingWithState:&v119 objects:v162 count:16];
          }
          while (v86);
        }

        [v84 sortUsingComparator:&stru_1012F9440];
        v91 = [v84 firstObject];
        if (v91) {
          [v83 addObject:v91];
        }
        v92 = [[PersonalizedCompoundItem alloc] initWithItems:v83];
        v93 = sub_1000EC2B4();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v170 = v92;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "- - Create compound item: %@", buf, 0xCu);
        }

        [obj addObject:v92];
      }
      id v115 = [v108 countByEnumeratingWithState:&v123 objects:v163 count:16];
      if (v115) {
        continue;
      }
      break;
    }
  }

  v94 = sub_1000EC2B4();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v170 = obj;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "- Finalized compound items: %@", buf, 0xCu);
  }

  v95 = [[PersonalizedCompoundItemGroup alloc] initWithItems:obj];
  v161 = v95;
  id v108 = +[NSArray arrayWithObjects:&v161 count:1];

  ((void (*)(void))v101[2])();
  (*((void (**)(id, id, id))v103 + 2))(v103, obj, v108);
LABEL_154:

LABEL_155:
  _Block_object_dispose(&v155, 8);
}

- (void)setClientRankingFunction:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007DA548;
  block[3] = &unk_1012EC608;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  BOOL v9 = &v10;
  dispatch_sync(lock, block);
  if (*((unsigned char *)v11 + 24)) {
    [(PersonalizedItemManager *)self _setNeedsRecalculation];
  }

  _Block_object_dispose(&v10, 8);
}

- (PersonalizedItemClientRankingFunction)_clientRankingFunction
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = sub_100103FA8;
  uint64_t v10 = sub_100104860;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007DA680;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PersonalizedItemClientRankingFunction *)v3;
}

- (void)setPriorityFunction:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution];
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007DA79C;
  block[3] = &unk_1012EC608;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  BOOL v9 = &v10;
  dispatch_sync(lock, block);
  if (*((unsigned char *)v11 + 24)) {
    [(PersonalizedItemManager *)self _setNeedsRecalculation];
  }

  _Block_object_dispose(&v10, 8);
}

- (PersonalizedItemPriorityFunction)_priorityFunction
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = sub_100103FA8;
  uint64_t v10 = sub_100104860;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007DA8D4;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PersonalizedItemPriorityFunction *)v3;
}

- (void)addItemSource:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007DA9E4;
    block[3] = &unk_1012ECFC0;
    BOOL v9 = &v10;
    block[4] = self;
    id v8 = v4;
    dispatch_sync(lock, block);
    if (!*((unsigned char *)v11 + 24)) {
      [(PersonalizedItemManager *)self _setNeedsRecalculation];
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)removeItemSource:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007DAB50;
  block[3] = &unk_1012ECFC0;
  BOOL v9 = &v10;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  dispatch_sync(lock, block);
  if (*((unsigned char *)v11 + 24)) {
    [(PersonalizedItemManager *)self _setNeedsRecalculation];
  }

  _Block_object_dispose(&v10, 8);
}

- (void)setUpdatesPaused:(BOOL)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007DAC98;
  block[3] = &unk_1012F9320;
  BOOL v6 = a3;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(lock, block);
  if (*((unsigned char *)v8 + 24)) {
    [(PersonalizedItemManager *)self _recalculateIfNeeded];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007DAE24;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

- (NSArray)previousItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100103FA8;
  char v10 = sub_100104860;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007DAF20;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)previousItemGroups
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100103FA8;
  char v10 = sub_100104860;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007DB098;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)fetchAllItems:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007DB1B8;
  v7[3] = &unk_1012E76E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

- (void)fetchItemsGroups:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007DB37C;
  v7[3] = &unk_1012E76E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

- (BOOL)updateInProgress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007DB554;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)itemsMatchingSearchableString:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"SELF LIKE[cdl] %@", v4];
  uint64_t v6 = [(PersonalizedItemManager *)self _itemsFilteredBySearchableString:v4 predicate:v5];

  return v6;
}

- (id)itemsContainingSearchableString:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"SELF contains[cdl] %@", v4];
  uint64_t v6 = [(PersonalizedItemManager *)self _itemsFilteredBySearchableString:v4 predicate:v5];

  return v6;
}

- (id)_itemsFilteredBySearchableString:(id)a3 predicate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [(PersonalizedItemManager *)self allItems];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [v12 searchableStrings];
        long long v14 = [v13 filteredArrayUsingPredicate:v5];
        if ([v14 count])
        {
          v15 = [v12 mapItem];

          if (v15) {
            [v6 addObject:v12];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v16 = [v6 copy];

  return v16;
}

- (NSArray)itemSources
{
  return &self->_itemSources->super;
}

- (BOOL)updatesPaused
{
  return self->_updatesPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityFunction, 0);
  objc_storeStrong((id *)&self->_clientRankingFunction, 0);
  objc_storeStrong((id *)&self->_itemGroupCompletions, 0);
  objc_storeStrong((id *)&self->_itemCompletions, 0);
  objc_storeStrong((id *)&self->_itemGroups, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_itemSources, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end