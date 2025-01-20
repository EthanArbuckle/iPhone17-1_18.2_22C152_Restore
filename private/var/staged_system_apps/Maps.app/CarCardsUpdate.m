@interface CarCardsUpdate
- (BOOL)_shouldClearConfiguration:(id)a3 beforeUpdate:(id)a4;
- (BOOL)hasUpdates;
- (BOOL)isAnimated;
- (CarCardsUpdate)init;
- (CarCardsUpdateDelegate)delegate;
- (GroupAnimation)parentAnimation;
- (id)pendingDeletedConfigurationForKey:(id)a3;
- (id)pendingDeletedConfigurations;
- (unint64_t)decrementNestCounter;
- (unint64_t)incrementNestCounter;
- (void)_applyAndPerformLayoutForConfigurations:(id)a3 allowAnimations:(BOOL)a4;
- (void)_configurations:(id)a3 getVisible:(id *)a4 hidden:(id *)a5;
- (void)_markConfigurations:(id)a3 asTransitioning:(BOOL)a4;
- (void)_performLayoutAllowingAnimations:(BOOL)a3;
- (void)_runUpdatesForConfigurations:(id)a3 allowAnimations:(BOOL)a4;
- (void)_runUpdatesForConfigurations:(id)a3 allowAnimations:(BOOL)a4 layoutReloads:(id *)a5 contentReloads:(id *)a6 otherReloads:(id *)a7;
- (void)addCompletionBlock:(id)a3;
- (void)deleteCardConfiguration:(id)a3;
- (void)insertCardConfiguration:(id)a3 block:(id)a4;
- (void)reloadCardConfiguration:(id)a3 block:(id)a4;
- (void)run;
- (void)runCompletionBlocks;
- (void)setAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setParentAnimation:(id)a3;
- (void)validateUpdatesUsingBlock:(id)a3;
@end

@implementation CarCardsUpdate

- (CarCardsUpdate)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarCardsUpdate;
  v2 = [(CarCardsUpdate *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deletionsByKey = v2->_deletionsByKey;
    v2->_deletionsByKey = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    reloadsByKey = v2->_reloadsByKey;
    v2->_reloadsByKey = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    insertionsByKey = v2->_insertionsByKey;
    v2->_insertionsByKey = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v9;

    uint64_t v11 = +[NSMapTable weakToStrongObjectsMapTable];
    updatesByConfiguration = v2->_updatesByConfiguration;
    v2->_updatesByConfiguration = (NSMapTable *)v11;
  }
  return v2;
}

- (BOOL)hasUpdates
{
  return [(NSMutableDictionary *)self->_deletionsByKey count]
      || [(NSMutableDictionary *)self->_reloadsByKey count]
      || [(NSMutableDictionary *)self->_insertionsByKey count] != 0;
}

- (unint64_t)incrementNestCounter
{
  unint64_t v2 = self->_nestCounter + 1;
  self->_nestCounter = v2;
  return v2;
}

- (unint64_t)decrementNestCounter
{
  unint64_t nestCounter = self->_nestCounter;
  if (!nestCounter) {
    return 0;
  }
  unint64_t result = nestCounter - 1;
  self->_unint64_t nestCounter = nestCounter - 1;
  return result;
}

- (void)addCompletionBlock:(id)a3
{
  if (a3)
  {
    completionBlocks = self->_completionBlocks;
    id v5 = [a3 copy];
    id v4 = objc_retainBlock(v5);
    [(NSMutableArray *)completionBlocks addObject:v4];
  }
}

- (void)runCompletionBlocks
{
  id v3 = [(NSMutableArray *)self->_completionBlocks copy];
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        uint64_t v11 = [(NSMutableDictionary *)self->_deletionsByKey allValues];
        v12 = [(NSMutableDictionary *)self->_reloadsByKey allValues];
        v13 = [(NSMutableDictionary *)self->_insertionsByKey allValues];
        (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v11, v12, v13);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)pendingDeletedConfigurationForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_deletionsByKey objectForKeyedSubscript:a3];
}

- (id)pendingDeletedConfigurations
{
  return [(NSMutableDictionary *)self->_deletionsByKey allValues];
}

- (void)deleteCardConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  if (v5)
  {
    id v6 = sub_100B4A6B0();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      [(NSMutableDictionary *)self->_insertionsByKey removeObjectForKey:v5];
      [(NSMutableDictionary *)self->_reloadsByKey removeObjectForKey:v5];
      [(NSMapTable *)self->_updatesByConfiguration removeObjectForKey:v4];
      [(NSMutableDictionary *)self->_deletionsByKey setObject:v4 forKeyedSubscript:v5];
      goto LABEL_13;
    }
    id v7 = self;
    if (!v7)
    {
      v12 = @"<nil>";
      goto LABEL_11;
    }
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [(CarCardsUpdate *)v7 performSelector:"accessibilityIdentifier"];
      uint64_t v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_11:
    v13 = [v4 key];
    *(_DWORD *)buf = 138543618;
    long long v15 = v12;
    __int16 v16 = 2112;
    long long v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Adding deletion for \"%@\"", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
}

- (void)reloadCardConfiguration:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 key];
  if (!v8) {
    goto LABEL_12;
  }
  [(NSMutableDictionary *)self->_deletionsByKey removeObjectForKey:v8];
  [(NSMutableDictionary *)self->_insertionsByKey removeObjectForKey:v8];
  v9 = sub_100B4A6B0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = self;
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      v13 = [(CarCardsUpdate *)v10 performSelector:"accessibilityIdentifier"];
      long long v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        long long v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_8;
      }
    }
    long long v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_8:

    __int16 v16 = [v6 key];
    *(_DWORD *)buf = 138543618;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Adding reload for \"%@\"", buf, 0x16u);
  }
  if (v7)
  {
    updatesByConfiguration = self->_updatesByConfiguration;
    id v18 = objc_retainBlock(v7);
    [(NSMapTable *)updatesByConfiguration setObject:v18 forKey:v6];
  }
  [(NSMutableDictionary *)self->_reloadsByKey setObject:v6 forKeyedSubscript:v8];
LABEL_12:
}

- (void)insertCardConfiguration:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 key];
  if (!v8) {
    goto LABEL_23;
  }
  [(NSMutableDictionary *)self->_deletionsByKey removeObjectForKey:v8];
  unsigned __int8 v9 = [v6 isHidden];
  uint64_t v10 = sub_100B4A6B0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v9 & 1) == 0)
  {
    if (!v11)
    {
LABEL_22:

      [(CarCardsUpdate *)self reloadCardConfiguration:v6 block:v7];
      goto LABEL_23;
    }
    v23 = self;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      v26 = [(CarCardsUpdate *)v23 performSelector:"accessibilityIdentifier"];
      v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_21;
      }
    }
    v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_21:

    v29 = [v6 key];
    *(_DWORD *)buf = 138543618;
    v31 = v28;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Attempted insert of \"%@\" is already visible, assuming reload instead", buf, 0x16u);

    goto LABEL_22;
  }
  if (v11)
  {
    v12 = self;
    v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      long long v15 = [(CarCardsUpdate *)v12 performSelector:"accessibilityIdentifier"];
      __int16 v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        long long v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_9;
      }
    }
    long long v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

    uint64_t v18 = [v6 key];
    v19 = (void *)v18;
    CFStringRef v20 = @"block";
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    __int16 v32 = 2112;
    if (!v7) {
      CFStringRef v20 = @"no block";
    }
    uint64_t v33 = v18;
    __int16 v34 = 2112;
    CFStringRef v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Adding insertion for \"%@\" with %@", buf, 0x20u);
  }
  if (v7)
  {
    updatesByConfiguration = self->_updatesByConfiguration;
    id v22 = objc_retainBlock(v7);
    [(NSMapTable *)updatesByConfiguration setObject:v22 forKey:v6];
  }
  [(NSMutableDictionary *)self->_insertionsByKey setObject:v6 forKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_reloadsByKey removeObjectForKey:v8];
LABEL_23:
}

- (void)validateUpdatesUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v19 = 0;
    CFStringRef v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v5 = [(NSMutableDictionary *)self->_deletionsByKey allValues];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100B4AE9C;
    v16[3] = &unk_101319070;
    id v6 = v4;
    v16[4] = self;
    id v17 = v6;
    uint64_t v18 = &v19;
    [v5 enumerateObjectsUsingBlock:v16];
    if (!*((unsigned char *)v20 + 24))
    {
      id v7 = [(NSMutableDictionary *)self->_reloadsByKey allValues];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100B4AF74;
      v13[3] = &unk_101319070;
      id v8 = v6;
      v13[4] = self;
      id v14 = v8;
      long long v15 = &v19;
      [v7 enumerateObjectsUsingBlock:v13];
      if (!*((unsigned char *)v20 + 24))
      {
        unsigned __int8 v9 = [(NSMutableDictionary *)self->_insertionsByKey allValues];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100B4B05C;
        v10[3] = &unk_101319070;
        v10[4] = self;
        id v11 = v8;
        v12 = &v19;
        [v9 enumerateObjectsUsingBlock:v10];
      }
    }

    _Block_object_dispose(&v19, 8);
  }
}

- (void)run
{
  if (![(CarCardsUpdate *)self hasUpdates])
  {
    v12 = sub_100B4A6B0();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_98:

      [(CarCardsUpdate *)self runCompletionBlocks];
      return;
    }
    v13 = self;
    if (!v13)
    {
      uint64_t v18 = @"<nil>";
      goto LABEL_97;
    }
    id v14 = (objc_class *)objc_opt_class();
    long long v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [(CarCardsUpdate *)v13 performSelector:"accessibilityIdentifier"];
      id v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        uint64_t v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_20;
      }
    }
    uint64_t v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_20:

LABEL_97:
    *(_DWORD *)buf = 138543362;
    v289 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Nothing to update, run completion blocks and exit", buf, 0xCu);

    goto LABEL_98;
  }
  if (!self->_animated)
  {
LABEL_12:
    int v11 = 0;
    goto LABEL_22;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    id v3 = sub_100B4A6B0();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      goto LABEL_12;
    }
    id v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CarCardsUpdate *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        unsigned __int8 v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_10;
      }
    }
    unsigned __int8 v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_10:

    uint64_t v10 = v9;
    *(_DWORD *)buf = 138543362;
    v289 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running cards update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  int v11 = 1;
LABEL_22:
  uint64_t v19 = [(NSMutableDictionary *)self->_deletionsByKey allValues];
  CFStringRef v20 = [(NSMutableDictionary *)self->_reloadsByKey allValues];
  v232 = [(NSMutableDictionary *)self->_insertionsByKey allValues];
  uint64_t v21 = sub_100B4A6B0();
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    goto LABEL_29;
  }
  char v22 = self;
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  if (objc_opt_respondsToSelector())
  {
    v25 = [(CarCardsUpdate *)v22 performSelector:"accessibilityIdentifier"];
    v26 = v25;
    if (v25 && ![v25 isEqualToString:v24])
    {
      v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

      goto LABEL_28;
    }
  }
  v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_28:

  v28 = v27;
  CFStringRef v29 = (const __CFString *)[v19 count];
  id v30 = [v20 count];
  id v31 = [v232 count];
  *(_DWORD *)buf = 138544130;
  v289 = v28;
  __int16 v290 = 2048;
  CFStringRef v291 = v29;
  __int16 v292 = 2048;
  id v293 = v30;
  __int16 v294 = 2048;
  id v295 = v31;
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] %lu deletions, %lu reloads, %lu insertions", buf, 0x2Au);

LABEL_29:
  if (![v232 count]) {
    goto LABEL_38;
  }
  __int16 v32 = sub_100B4A6B0();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = self;
    __int16 v34 = (objc_class *)objc_opt_class();
    CFStringRef v35 = NSStringFromClass(v34);
    if (objc_opt_respondsToSelector())
    {
      v36 = [(CarCardsUpdate *)v33 performSelector:"accessibilityIdentifier"];
      v37 = v36;
      if (v36 && ![v36 isEqualToString:v35])
      {
        v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v37];

        goto LABEL_36;
      }
    }
    v38 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_36:

    v39 = v38;
    CFStringRef v40 = (const __CFString *)[v232 count];
    *(_DWORD *)buf = 138543618;
    v289 = v39;
    __int16 v290 = 2048;
    CFStringRef v291 = v40;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}@] %lu insertions, perform updates immediately", buf, 0x16u);
  }
  [(CarCardsUpdate *)self _runUpdatesForConfigurations:v232 allowAnimations:0];
LABEL_38:
  id v286 = 0;
  id v285 = 0;
  [(CarCardsUpdate *)self _configurations:v19 getVisible:&v286 hidden:&v285];
  id v228 = v286;
  id v41 = v285;
  v227 = v41;
  if ([v41 count])
  {
    id v42 = [v41 count];
    BOOL v43 = v42 == [v19 count];
  }
  else
  {
    BOOL v43 = 0;
  }
  id v284 = 0;
  id v283 = 0;
  [(CarCardsUpdate *)self _configurations:v20 getVisible:&v284 hidden:&v283];
  id v231 = v284;
  id v44 = v283;
  v230 = v44;
  if ([v44 count])
  {
    id v45 = [v44 count];
    id v46 = [v20 count];
    if (v11)
    {
      if (v45 == v46 && v43 && ![v232 count])
      {
        v47 = sub_100B4A6B0();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
LABEL_53:

          int v11 = 0;
          goto LABEL_54;
        }
        v48 = self;
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        if (objc_opt_respondsToSelector())
        {
          v51 = [(CarCardsUpdate *)v48 performSelector:"accessibilityIdentifier"];
          v52 = v51;
          if (v51 && ![v51 isEqualToString:v50])
          {
            v53 = +[NSString stringWithFormat:@"%@<%p, %@>", v50, v48, v52];

            goto LABEL_52;
          }
        }
        v53 = +[NSString stringWithFormat:@"%@<%p>", v50, v48];
LABEL_52:

        v54 = v53;
        *(_DWORD *)buf = 138543362;
        v289 = v54;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%{public}@] Only updates are hidden reloads or deletions, not animating", buf, 0xCu);

        goto LABEL_53;
      }
    }
  }
LABEL_54:
  if ([v19 count])
  {
    v55 = [(CarCardsUpdate *)self delegate];
    [v55 cardsUpdate:self prepareForUpdate:0 withCardConfigurations:v19];
  }
  if ([v20 count])
  {
    v56 = [(CarCardsUpdate *)self delegate];
    [v56 cardsUpdate:self prepareForUpdate:1 withCardConfigurations:v20];
  }
  if ([v232 count])
  {
    v57 = [(CarCardsUpdate *)self delegate];
    [v57 cardsUpdate:self prepareForUpdate:2 withCardConfigurations:v232];
  }
  v58 = sub_100B4A6B0();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    v59 = self;
    v60 = (objc_class *)objc_opt_class();
    v61 = NSStringFromClass(v60);
    if (objc_opt_respondsToSelector())
    {
      v62 = [(CarCardsUpdate *)v59 performSelector:"accessibilityIdentifier"];
      v63 = v62;
      if (v62 && ![v62 isEqualToString:v61])
      {
        v64 = +[NSString stringWithFormat:@"%@<%p, %@>", v61, v59, v63];

        goto LABEL_66;
      }
    }
    v64 = +[NSString stringWithFormat:@"%@<%p>", v61, v59];
LABEL_66:

    v65 = v64;
    v66 = v65;
    CFStringRef v67 = @"not ";
    if (v11) {
      CFStringRef v67 = &stru_101324E70;
    }
    *(_DWORD *)buf = 138543618;
    v289 = v65;
    __int16 v290 = 2112;
    CFStringRef v291 = v67;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%{public}@] Updates will %@run animated", buf, 0x16u);
  }
  v229 = v19;

  if (v11)
  {
    v68 = [(CarCardsUpdate *)self parentAnimation];
    if (v68)
    {
      v69 = [(CarCardsUpdate *)self parentAnimation];
      [v69 duration];
      double v71 = v70;
    }
    else
    {
      double v71 = 1.0;
    }

    if (![v230 count])
    {
LABEL_109:
      if (![v227 count]) {
        goto LABEL_125;
      }
      v103 = sub_100B4A6B0();
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
LABEL_117:

        long long v273 = 0u;
        long long v274 = 0u;
        long long v271 = 0u;
        long long v272 = 0u;
        id v112 = v227;
        id v113 = [v112 countByEnumeratingWithState:&v271 objects:v300 count:16];
        if (v113)
        {
          id v114 = v113;
          uint64_t v115 = *(void *)v272;
          do
          {
            for (i = 0; i != v114; i = (char *)i + 1)
            {
              if (*(void *)v272 != v115) {
                objc_enumerationMutation(v112);
              }
              [*(id *)(*((void *)&v271 + 1) + 8 * i) reset];
            }
            id v114 = [v112 countByEnumeratingWithState:&v271 objects:v300 count:16];
          }
          while (v114);
        }

LABEL_125:
        if (![v232 count]) {
          goto LABEL_177;
        }
        v117 = sub_100B4A6B0();
        if (!os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
        {
LABEL_176:

          [(CarCardsUpdate *)self _applyAndPerformLayoutForConfigurations:v232 allowAnimations:0];
LABEL_177:
          id v270 = 0;
          id v269 = 0;
          id v268 = 0;
          [(CarCardsUpdate *)self _runUpdatesForConfigurations:v231 allowAnimations:0 layoutReloads:&v270 contentReloads:&v269 otherReloads:&v268];
          id v226 = v270;
          id v152 = v269;
          id v153 = v268;
          id v223 = v153;
          v224 = v152;
          if (![v20 count]) {
            goto LABEL_189;
          }
          v154 = sub_100B4A6B0();
          if (!os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
          {
LABEL_188:

LABEL_189:
            v167 = sub_100B4A6B0();
            if (!os_log_type_enabled(v167, OS_LOG_TYPE_INFO)) {
              goto LABEL_199;
            }
            v168 = self;
            if (!v168)
            {
              v173 = @"<nil>";
              goto LABEL_198;
            }
            v169 = (objc_class *)objc_opt_class();
            v170 = NSStringFromClass(v169);
            if (objc_opt_respondsToSelector())
            {
              v171 = [(CarCardsUpdate *)v168 performSelector:"accessibilityIdentifier"];
              v172 = v171;
              if (v171 && ![v171 isEqualToString:v170])
              {
                v173 = +[NSString stringWithFormat:@"%@<%p, %@>", v170, v168, v172];

                goto LABEL_196;
              }
            }
            v173 = +[NSString stringWithFormat:@"%@<%p>", v170, v168];
LABEL_196:

LABEL_198:
            v174 = v173;
            *(_DWORD *)buf = 138543362;
            v289 = v174;
            _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "[%{public}@] Starting animated update chain", buf, 0xCu);

            id v152 = v224;
LABEL_199:
            double v175 = v71 * 0.25;

            +[NSMutableArray arrayWithCapacity:3];
            v262[0] = _NSConcreteStackBlock;
            v262[1] = 3221225472;
            v262[2] = sub_100B4D594;
            v262[3] = &unk_101319098;
            id v176 = (id)objc_claimAutoreleasedReturnValue();
            id v263 = v176;
            v264 = self;
            id v265 = v19;
            id v266 = v20;
            id v177 = v232;
            id v267 = v177;
            v225 = objc_retainBlock(v262);
            v178 = TransitDirectionsExpandStopsCollectionViewCell;
            if ([v231 count])
            {
              v179 = +[GroupAnimation animation];
              [v179 setDuration:v71 * 0.25];
              [v179 setOptions:0x20000];
              if ([v152 count])
              {
                v260[0] = _NSConcreteStackBlock;
                v260[1] = 3221225472;
                v260[2] = sub_100B4DAA0;
                v260[3] = &unk_1012E5D58;
                v260[4] = self;
                id v261 = v152;
                v258[0] = _NSConcreteStackBlock;
                v258[1] = 3221225472;
                v258[2] = sub_100B4DC54;
                v258[3] = &unk_1012E6160;
                v258[4] = self;
                id v259 = v261;
                [v179 addAnimations:v260 completion:v258];
              }
              if ([v226 count])
              {
                v256[0] = _NSConcreteStackBlock;
                v256[1] = 3221225472;
                v256[2] = sub_100B4DDF4;
                v256[3] = &unk_1012E5D58;
                v256[4] = self;
                id v257 = v226;
                v254[0] = _NSConcreteStackBlock;
                v254[1] = 3221225472;
                v254[2] = sub_100B4E004;
                v254[3] = &unk_1012E6160;
                v254[4] = self;
                id v255 = v257;
                [v179 addAnimations:v256 completion:v254];
              }
              if ([v153 count])
              {
                v252[0] = _NSConcreteStackBlock;
                v252[1] = 3221225472;
                v252[2] = sub_100B4E1B4;
                v252[3] = &unk_1012E6160;
                v252[4] = self;
                id v253 = v153;
                [v179 addAnimations:0 completion:v252];
              }
              [v179 addAnimations:0 completion:v225];
              [v176 addObject:v179];

              double v180 = v71;
              v178 = TransitDirectionsExpandStopsCollectionViewCell;
            }
            else
            {
              double v180 = v71 - v175;
            }
            double v181 = v71 * 0.5;
            if ([v228 count] || objc_msgSend(v226, "count") || objc_msgSend(v177, "count"))
            {
              v182 = [&v178[69] animation];
              [v182 setDuration:v181];
              [v182 setSpringDamping:0.800000012];
              [v182 setInitialVelocity:0.100000001];
              [v182 setOptions:0];
              if ([v228 count])
              {
                v250[0] = _NSConcreteStackBlock;
                v250[1] = 3221225472;
                v250[2] = sub_100B4E354;
                v250[3] = &unk_1012E5D58;
                v250[4] = self;
                id v251 = v228;
                v248[0] = _NSConcreteStackBlock;
                v248[1] = 3221225472;
                v248[2] = sub_100B4E5A0;
                v248[3] = &unk_1012E6160;
                v248[4] = self;
                id v249 = v251;
                [v182 addAnimations:v250 completion:v248];
              }
              if ([v226 count])
              {
                v246[0] = _NSConcreteStackBlock;
                v246[1] = 3221225472;
                v246[2] = sub_100B4E7CC;
                v246[3] = &unk_1012E5D58;
                v246[4] = self;
                id v247 = v226;
                [v182 addAnimations:v246 completion:0];
              }
              id v152 = v224;
              if ([v177 count])
              {
                v244[0] = _NSConcreteStackBlock;
                v244[1] = 3221225472;
                v244[2] = sub_100B4E990;
                v244[3] = &unk_1012E5D58;
                v244[4] = self;
                id v245 = v177;
                [v182 addAnimations:v244 completion:0];
              }
              if ([v182 hasAnimations])
              {
                v243[0] = _NSConcreteStackBlock;
                v243[1] = 3221225472;
                v243[2] = sub_100B4EBE8;
                v243[3] = &unk_1012E5D08;
                v243[4] = self;
                [v182 addAnimations:v243 completion:v225];
              }
              [v176 addObject:v182];
            }
            else
            {
              double v180 = v180 - v181;
            }
            if ([v152 count])
            {
              v183 = [&v178[69] animation];
              [v183 setDuration:v175];
              [v183 setOptions:0x10000];
              if ([v152 count])
              {
                v241[0] = _NSConcreteStackBlock;
                v241[1] = 3221225472;
                v241[2] = sub_100B4EBF4;
                v241[3] = &unk_1012E5D58;
                v241[4] = self;
                id v242 = v152;
                v239[0] = _NSConcreteStackBlock;
                v239[1] = 3221225472;
                v239[2] = sub_100B4EDA8;
                v239[3] = &unk_1012E6160;
                v239[4] = self;
                id v240 = v242;
                [v183 addAnimations:v241 completion:v239];
              }
              [v183 addAnimations:0 completion:v225];
              [v176 addObject:v183];
            }
            else
            {
              double v180 = v180 - v175;
            }
            v184 = +[NSPredicate predicateWithFormat:@"isEmpty == NO"];
            [v176 filterUsingPredicate:v184];

            if ([v176 count])
            {
              uint64_t v185 = [(CarCardsUpdate *)self parentAnimation];
              if (!v185
                || (v186 = (void *)v185,
                    [(CarCardsUpdate *)self parentAnimation],
                    v187 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v188 = [v187 hasStarted],
                    v187,
                    v186,
                    (v188 & 1) != 0))
              {
                v189 = sub_100B4A6B0();
                if (!os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
                {
LABEL_256:

                  v211 = [v176 firstObject];
                  [v211 runWithCurrentOptions];

LABEL_279:
                  goto LABEL_280;
                }
                v190 = self;
                if (!v190)
                {
                  v195 = @"<nil>";
                  goto LABEL_255;
                }
                v191 = (objc_class *)objc_opt_class();
                v192 = NSStringFromClass(v191);
                if (objc_opt_respondsToSelector())
                {
                  v193 = [(CarCardsUpdate *)v190 performSelector:"accessibilityIdentifier"];
                  v194 = v193;
                  if (v193 && ![v193 isEqualToString:v192])
                  {
                    v195 = +[NSString stringWithFormat:@"%@<%p, %@>", v192, v190, v194];

                    goto LABEL_235;
                  }
                }
                v195 = +[NSString stringWithFormat:@"%@<%p>", v192, v190];
LABEL_235:

LABEL_255:
                v210 = v195;
                *(_DWORD *)buf = 138543362;
                v289 = v210;
                _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "[%{public}@] Running first animation", buf, 0xCu);

                id v152 = v224;
                goto LABEL_256;
              }
              v203 = sub_100B4A6B0();
              if (!os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
              {
LABEL_271:

                long long v237 = 0u;
                long long v238 = 0u;
                long long v235 = 0u;
                long long v236 = 0u;
                id v214 = v176;
                id v215 = [v214 countByEnumeratingWithState:&v235 objects:v287 count:16];
                if (v215)
                {
                  id v216 = v215;
                  uint64_t v217 = *(void *)v236;
                  do
                  {
                    for (j = 0; j != v216; j = (char *)j + 1)
                    {
                      if (*(void *)v236 != v217) {
                        objc_enumerationMutation(v214);
                      }
                      uint64_t v219 = *(void *)(*((void *)&v235 + 1) + 8 * (void)j);
                      v220 = [(CarCardsUpdate *)self parentAnimation];
                      [v220 addChildAnimation:v219];
                    }
                    id v216 = [v214 countByEnumeratingWithState:&v235 objects:v287 count:16];
                  }
                  while (v216);
                }

                v221 = [(CarCardsUpdate *)self parentAnimation];
                [v221 setDuration:v180];

                v222 = [(CarCardsUpdate *)self parentAnimation];
                v233[0] = _NSConcreteStackBlock;
                v233[1] = 3221225472;
                v233[2] = sub_100B4EF8C;
                v233[3] = &unk_1012E5D08;
                id v234 = v214;
                [v222 addPreparation:v233];

                uint64_t v19 = v229;
                id v153 = v223;
                id v152 = v224;
                goto LABEL_279;
              }
              v204 = self;
              if (!v204)
              {
                v209 = @"<nil>";
                goto LABEL_270;
              }
              v205 = (objc_class *)objc_opt_class();
              v206 = NSStringFromClass(v205);
              if (objc_opt_respondsToSelector())
              {
                v207 = [(CarCardsUpdate *)v204 performSelector:"accessibilityIdentifier"];
                v208 = v207;
                if (v207 && ![v207 isEqualToString:v206])
                {
                  v209 = +[NSString stringWithFormat:@"%@<%p, %@>", v206, v204, v208];

                  goto LABEL_251;
                }
              }
              v209 = +[NSString stringWithFormat:@"%@<%p>", v206, v204];
LABEL_251:

LABEL_270:
              v213 = v209;
              *(_DWORD *)buf = 138543362;
              v289 = v213;
              _os_log_impl((void *)&_mh_execute_header, v203, OS_LOG_TYPE_INFO, "[%{public}@] Scheduling animation to run with parent", buf, 0xCu);

              goto LABEL_271;
            }
            v196 = sub_100B4A6B0();
            if (!os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
            {
LABEL_260:

              [(CarCardsUpdate *)self runCompletionBlocks];
              goto LABEL_279;
            }
            v197 = self;
            if (!v197)
            {
              v202 = @"<nil>";
              goto LABEL_259;
            }
            v198 = (objc_class *)objc_opt_class();
            v199 = NSStringFromClass(v198);
            if (objc_opt_respondsToSelector())
            {
              v200 = [(CarCardsUpdate *)v197 performSelector:"accessibilityIdentifier"];
              v201 = v200;
              if (v200 && ![v200 isEqualToString:v199])
              {
                v202 = +[NSString stringWithFormat:@"%@<%p, %@>", v199, v197, v201];

                goto LABEL_243;
              }
            }
            v202 = +[NSString stringWithFormat:@"%@<%p>", v199, v197];
LABEL_243:

            id v152 = v224;
LABEL_259:

            v212 = v202;
            *(_DWORD *)buf = 138543362;
            v289 = v212;
            _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_ERROR, "[%{public}@] No animations were created, run completion blocks and exit", buf, 0xCu);

            uint64_t v19 = v229;
            goto LABEL_260;
          }
          v155 = self;
          if (!v155)
          {
            v160 = @"<nil>";
            goto LABEL_187;
          }
          v156 = (objc_class *)objc_opt_class();
          v157 = NSStringFromClass(v156);
          if (objc_opt_respondsToSelector())
          {
            v158 = [(CarCardsUpdate *)v155 performSelector:"accessibilityIdentifier"];
            v159 = v158;
            if (v158 && ![v158 isEqualToString:v157])
            {
              v160 = +[NSString stringWithFormat:@"%@<%p, %@>", v157, v155, v159];

              goto LABEL_185;
            }
          }
          v160 = +[NSString stringWithFormat:@"%@<%p>", v157, v155];
LABEL_185:

LABEL_187:
          v161 = v160;
          CFStringRef v162 = (const __CFString *)[v231 count];
          id v163 = [v20 count];
          id v164 = [v226 count];
          id v152 = v224;
          id v165 = [v224 count];
          id v166 = [v153 count];
          *(_DWORD *)buf = 138544642;
          v289 = v161;
          __int16 v290 = 2048;
          CFStringRef v291 = v162;
          __int16 v292 = 2048;
          id v293 = v163;
          __int16 v294 = 2048;
          id v295 = v164;
          __int16 v296 = 2048;
          id v297 = v165;
          __int16 v298 = 2048;
          id v299 = v166;
          _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_INFO, "[%{public}@] %lu/%lu reloads are visible (%lu layout, %lu content, %lu other)", buf, 0x3Eu);

          uint64_t v19 = v229;
          goto LABEL_188;
        }
        v118 = self;
        if (!v118)
        {
          v123 = @"<nil>";
          goto LABEL_175;
        }
        v119 = (objc_class *)objc_opt_class();
        v120 = NSStringFromClass(v119);
        if (objc_opt_respondsToSelector())
        {
          v121 = [(CarCardsUpdate *)v118 performSelector:"accessibilityIdentifier"];
          v122 = v121;
          if (v121 && ![v121 isEqualToString:v120])
          {
            v123 = +[NSString stringWithFormat:@"%@<%p, %@>", v120, v118, v122];

            goto LABEL_133;
          }
        }
        v123 = +[NSString stringWithFormat:@"%@<%p>", v120, v118];
LABEL_133:

LABEL_175:
        v150 = v123;
        CFStringRef v151 = (const __CFString *)[v232 count];
        *(_DWORD *)buf = 138543618;
        v289 = v150;
        __int16 v290 = 2048;
        CFStringRef v291 = v151;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_INFO, "[%{public}@] %lu insertions, perform layout immediately", buf, 0x16u);

        goto LABEL_176;
      }
      v104 = self;
      v105 = (objc_class *)objc_opt_class();
      v106 = NSStringFromClass(v105);
      if (objc_opt_respondsToSelector())
      {
        v107 = [(CarCardsUpdate *)v104 performSelector:"accessibilityIdentifier"];
        v108 = v107;
        if (v107 && ![v107 isEqualToString:v106])
        {
          v109 = +[NSString stringWithFormat:@"%@<%p, %@>", v106, v104, v108];

          goto LABEL_116;
        }
      }
      v109 = +[NSString stringWithFormat:@"%@<%p>", v106, v104];
LABEL_116:

      v110 = v109;
      CFStringRef v111 = (const __CFString *)[v230 count];
      *(_DWORD *)buf = 138543618;
      v289 = v110;
      __int16 v290 = 2048;
      CFStringRef v291 = v111;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "[%{public}@] %lu hidden deletions, remove immediately", buf, 0x16u);

      goto LABEL_117;
    }
    v94 = sub_100B4A6B0();
    if (!os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
    {
LABEL_108:

      [(CarCardsUpdate *)self _runUpdatesForConfigurations:v230 allowAnimations:0];
      [(CarCardsUpdate *)self _applyAndPerformLayoutForConfigurations:v230 allowAnimations:0];
      goto LABEL_109;
    }
    v95 = self;
    v96 = (objc_class *)objc_opt_class();
    v97 = NSStringFromClass(v96);
    if (objc_opt_respondsToSelector())
    {
      v98 = [(CarCardsUpdate *)v95 performSelector:"accessibilityIdentifier"];
      v99 = v98;
      if (v98 && ![v98 isEqualToString:v97])
      {
        v100 = +[NSString stringWithFormat:@"%@<%p, %@>", v97, v95, v99];

        goto LABEL_107;
      }
    }
    v100 = +[NSString stringWithFormat:@"%@<%p>", v97, v95];
LABEL_107:

    v101 = v100;
    CFStringRef v102 = (const __CFString *)[v230 count];
    *(_DWORD *)buf = 138543618;
    v289 = v101;
    __int16 v290 = 2048;
    CFStringRef v291 = v102;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "[%{public}@] %lu hidden reloads, perform layout immediately", buf, 0x16u);

    goto LABEL_108;
  }
  v72 = sub_100B4A6B0();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    v73 = self;
    v74 = (objc_class *)objc_opt_class();
    v75 = NSStringFromClass(v74);
    if (objc_opt_respondsToSelector())
    {
      v76 = [(CarCardsUpdate *)v73 performSelector:"accessibilityIdentifier"];
      v77 = v76;
      if (v76 && ![v76 isEqualToString:v75])
      {
        v78 = +[NSString stringWithFormat:@"%@<%p, %@>", v75, v73, v77];

        goto LABEL_78;
      }
    }
    v78 = +[NSString stringWithFormat:@"%@<%p>", v75, v73];
LABEL_78:

    v79 = v78;
    CFStringRef v80 = (const __CFString *)[v19 count];
    *(_DWORD *)buf = 138543618;
    v289 = v79;
    __int16 v290 = 2048;
    CFStringRef v291 = v80;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "[%{public}@] %lu deletions will reset immediately", buf, 0x16u);
  }
  long long v281 = 0u;
  long long v282 = 0u;
  long long v279 = 0u;
  long long v280 = 0u;
  id v81 = v19;
  id v82 = [v81 countByEnumeratingWithState:&v279 objects:v302 count:16];
  if (v82)
  {
    id v83 = v82;
    uint64_t v84 = *(void *)v280;
    do
    {
      for (k = 0; k != v83; k = (char *)k + 1)
      {
        if (*(void *)v280 != v84) {
          objc_enumerationMutation(v81);
        }
        [*(id *)(*((void *)&v279 + 1) + 8 * (void)k) reset];
      }
      id v83 = [v81 countByEnumeratingWithState:&v279 objects:v302 count:16];
    }
    while (v83);
  }

  if ([v81 count])
  {
    v86 = [(CarCardsUpdate *)self delegate];
    [v86 cardsUpdate:self finalizeUpdate:0 withCardConfigurations:v81];
  }
  v87 = sub_100B4A6B0();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    v88 = self;
    if (!v88)
    {
      v93 = @"<nil>";
      goto LABEL_135;
    }
    v89 = (objc_class *)objc_opt_class();
    v90 = NSStringFromClass(v89);
    if (objc_opt_respondsToSelector())
    {
      v91 = [(CarCardsUpdate *)v88 performSelector:"accessibilityIdentifier"];
      v92 = v91;
      if (v91 && ![v91 isEqualToString:v90])
      {
        v93 = +[NSString stringWithFormat:@"%@<%p, %@>", v90, v88, v92];

        goto LABEL_95;
      }
    }
    v93 = +[NSString stringWithFormat:@"%@<%p>", v90, v88];
LABEL_95:

LABEL_135:
    v124 = v93;
    CFStringRef v125 = (const __CFString *)[v20 count];
    *(_DWORD *)buf = 138543618;
    v289 = v124;
    __int16 v290 = 2048;
    CFStringRef v291 = v125;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "[%{public}@] %lu reloads, will update immediately", buf, 0x16u);
  }
  [(CarCardsUpdate *)self _runUpdatesForConfigurations:v20 allowAnimations:1];
  if ([v20 count]) {
    [(CarCardsUpdate *)self _applyAndPerformLayoutForConfigurations:v20 allowAnimations:1];
  }
  if ([v20 count])
  {
    v126 = [(CarCardsUpdate *)self delegate];
    [v126 cardsUpdate:self finalizeUpdate:1 withCardConfigurations:v20];
  }
  v127 = sub_100B4A6B0();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
  {
    v128 = self;
    if (!v128)
    {
      v133 = @"<nil>";
      goto LABEL_149;
    }
    v129 = (objc_class *)objc_opt_class();
    v130 = NSStringFromClass(v129);
    if (objc_opt_respondsToSelector())
    {
      v131 = [(CarCardsUpdate *)v128 performSelector:"accessibilityIdentifier"];
      v132 = v131;
      if (v131 && ![v131 isEqualToString:v130])
      {
        v133 = +[NSString stringWithFormat:@"%@<%p, %@>", v130, v128, v132];

        goto LABEL_147;
      }
    }
    v133 = +[NSString stringWithFormat:@"%@<%p>", v130, v128];
LABEL_147:

LABEL_149:
    v134 = v133;
    CFStringRef v135 = (const __CFString *)[v232 count];
    *(_DWORD *)buf = 138543618;
    v289 = v134;
    __int16 v290 = 2048;
    CFStringRef v291 = v135;
    _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_INFO, "[%{public}@] %lu insertions, will unhide immediately", buf, 0x16u);
  }
  long long v277 = 0u;
  long long v278 = 0u;
  long long v275 = 0u;
  long long v276 = 0u;
  id v136 = v232;
  id v137 = [v136 countByEnumeratingWithState:&v275 objects:v301 count:16];
  if (v137)
  {
    id v138 = v137;
    uint64_t v139 = *(void *)v276;
    do
    {
      for (m = 0; m != v138; m = (char *)m + 1)
      {
        if (*(void *)v276 != v139) {
          objc_enumerationMutation(v136);
        }
        [*(id *)(*((void *)&v275 + 1) + 8 * (void)m) setHidden:0];
      }
      id v138 = [v136 countByEnumeratingWithState:&v275 objects:v301 count:16];
    }
    while (v138);
  }

  if ([v136 count]) {
    [(CarCardsUpdate *)self _applyAndPerformLayoutForConfigurations:v136 allowAnimations:1];
  }
  if ([v136 count])
  {
    v141 = [(CarCardsUpdate *)self delegate];
    [v141 cardsUpdate:self finalizeUpdate:2 withCardConfigurations:v136];
  }
  v142 = sub_100B4A6B0();
  if (!os_log_type_enabled(v142, OS_LOG_TYPE_INFO)) {
    goto LABEL_171;
  }
  v143 = self;
  if (!v143)
  {
    v148 = @"<nil>";
    goto LABEL_170;
  }
  v144 = (objc_class *)objc_opt_class();
  v145 = NSStringFromClass(v144);
  if (objc_opt_respondsToSelector())
  {
    v146 = [(CarCardsUpdate *)v143 performSelector:"accessibilityIdentifier"];
    v147 = v146;
    if (v146 && ![v146 isEqualToString:v145])
    {
      v148 = +[NSString stringWithFormat:@"%@<%p, %@>", v145, v143, v147];

      goto LABEL_168;
    }
  }
  v148 = +[NSString stringWithFormat:@"%@<%p>", v145, v143];
LABEL_168:

LABEL_170:
  v149 = v148;
  *(_DWORD *)buf = 138543362;
  v289 = v149;
  _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_INFO, "[%{public}@] Updates completed, running completion blocks.", buf, 0xCu);

LABEL_171:
  [(CarCardsUpdate *)self runCompletionBlocks];
LABEL_280:
}

- (void)_runUpdatesForConfigurations:(id)a3 allowAnimations:(BOOL)a4
{
}

- (void)_runUpdatesForConfigurations:(id)a3 allowAnimations:(BOOL)a4 layoutReloads:(id *)a5 contentReloads:(id *)a6 otherReloads:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  v13 = v12;
  if (a6)
  {
    id v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    long long v15 = 0;
    if (a7) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v14 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  long long v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
  if (a7)
  {
LABEL_4:
    __int16 v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    goto LABEL_8;
  }
LABEL_7:
  __int16 v16 = 0;
LABEL_8:
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100B4F1D8;
  v23[3] = &unk_1012E98D8;
  id v17 = v13;
  id v24 = v17;
  v25 = self;
  id v18 = v15;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v16;
  id v28 = v20;
  uint64_t v21 = objc_retainBlock(v23);
  char v22 = v21;
  if (!v10)
  {
    +[UIView performWithoutAnimation:v21];
    if (!v19) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  ((void (*)(void *))v21[2])(v21);
  if (v19) {
LABEL_12:
  }
    *a6 = v19;
LABEL_13:
  if (v18) {
    *a5 = v18;
  }
  if (v20) {
    *a7 = v20;
  }
}

- (BOOL)_shouldClearConfiguration:(id)a3 beforeUpdate:(id)a4
{
  id v5 = (void (**)(id, CarCardConfiguration *))a4;
  id v6 = a3;
  id v7 = [[CarCardConfiguration alloc] initWithKey:@"dummyConfiguration" carSceneType:0];
  v5[2](v5, v7);

  id v8 = [(CarCardConfiguration *)v7 content];
  unsigned __int8 v9 = [v6 content];

  if (v8 == v9) {
    LOBYTE(v10) = 0;
  }
  else {
    unint64_t v10 = ([(CarCardConfiguration *)v7 invalidationState] >> 1) & 1;
  }

  return v10;
}

- (void)_performLayoutAllowingAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B4F4F0;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  id v4 = objc_retainBlock(v6);
  id v5 = v4;
  if (v3) {
    ((void (*)(void *))v4[2])(v4);
  }
  else {
    +[UIView performWithoutAnimation:v4];
  }
}

- (void)_applyAndPerformLayoutForConfigurations:(id)a3 allowAnimations:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  unint64_t v10 = sub_100B4F614;
  int v11 = &unk_1012E5D58;
  id v12 = self;
  id v5 = a3;
  id v13 = v5;
  id v6 = objc_retainBlock(&v8);
  id v7 = v6;
  if (v4) {
    ((void (*)(void ***))v6[2])(v6);
  }
  else {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6, v8, v9, v10, v11, v12);
  }
}

- (void)_markConfigurations:(id)a3 asTransitioning:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setTransitioning:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_configurations:(id)a3 getVisible:(id *)a4 hidden:(id *)a5
{
  id v7 = a3;
  if (!v7) {
    goto LABEL_8;
  }
  id v12 = v7;
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"hidden == YES"];
  uint64_t v9 = [v12 filteredArrayUsingPredicate:v8];
  if (![v9 count])
  {
    id v11 = v12;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v10 = [v12 mutableCopy];
  [v10 removeObjectsInArray:v9];
  id v11 = [v10 copy];

  if (a4) {
LABEL_4:
  }
    *a4 = v11;
LABEL_5:
  if (a5) {
    *a5 = v9;
  }

  id v7 = v12;
LABEL_8:
}

- (CarCardsUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarCardsUpdateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (GroupAnimation)parentAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);

  return (GroupAnimation *)WeakRetained;
}

- (void)setParentAnimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAnimation);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_updatesByConfiguration, 0);
  objc_storeStrong((id *)&self->_insertionsByKey, 0);
  objc_storeStrong((id *)&self->_reloadsByKey, 0);

  objc_storeStrong((id *)&self->_deletionsByKey, 0);
}

@end