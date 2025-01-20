@interface GuidanceObserver
- (GuidanceObserver)init;
- (NSMutableDictionary)classicSignIDs;
- (id)_orderedUpdateKinds;
- (id)_signRepeatableUpdateKeys;
- (unint64_t)currentArrivalState;
- (void)_clearAllGuidance;
- (void)_eachGuidanceOutput:(id)a3;
- (void)_eachGuidanceOutput:(id)a3 ignorePaused:(BOOL)a4;
- (void)_performRepeatableUpdateForKey:(id)a3 onEachGuidanceOutput:(id)a4;
- (void)_prepareForActiveNavigationIfNeeded;
- (void)_processARInfosUpdate:(id)a3;
- (void)_processHideJunctionViewInfo;
- (void)_processHideLaneInfo;
- (void)_processPendingUpdates;
- (void)_processShowJunctionViewInfo:(id)a3;
- (void)_processShowLaneInfo:(id)a3;
- (void)_processSignInfo:(id)a3;
- (void)_processUsePersistentDisplay;
- (void)_removeAllRepeatableUpdates;
- (void)_removeAllRepeatableUpdatesForKeys:(id)a3;
- (void)_removeRepeatableUpdateForKey:(id)a3;
- (void)_repeatAllUpdates;
- (void)_repeatAllUpdatesWithTarget:(id)a3 selector:(SEL)a4;
- (void)_tearDownNavigationIfNeeded;
- (void)_updateArrivalStateWithService:(id)a3;
- (void)_updateDestinationDisplayName;
- (void)_updateDisplayETA;
- (void)addOutlet:(id)a3 forOwner:(id)a4;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationService:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8;
- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4;
- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showJunctionView:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationServiceDidCancelReroute:(id)a3;
- (void)navigationServiceDidHideSecondaryStep:(id)a3;
- (void)navigationServiceEndGuidanceUpdate:(id)a3;
- (void)navigationServiceWillReroute:(id)a3;
- (void)pauseUpdates;
- (void)removeOutlet:(id)a3;
- (void)repeatAllUpdatesForOutlet:(id)a3;
- (void)resumeUpdates;
- (void)setClassicSignIDs:(id)a3;
- (void)setCurrentArrivalState:(unint64_t)a3;
@end

@implementation GuidanceObserver

- (void)_tearDownNavigationIfNeeded
{
  v3 = +[MNNavigationService sharedService];
  unsigned __int8 v4 = [v3 isInNavigatingState];

  if ((v4 & 1) == 0)
  {
    destinationDisplayName = self->_destinationDisplayName;
    self->_destinationDisplayName = 0;

    [(GuidanceObserver *)self _clearAllGuidance];
  }
}

- (void)_clearAllGuidance
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "(%@) _clearAllGuidance", (uint8_t *)&v8, 0xCu);
  }

  [(NSMutableDictionary *)self->_guidanceUpdates removeAllObjects];
  currentLaneInfo = self->_currentLaneInfo;
  self->_currentLaneInfo = 0;

  currentJunctionViewInfo = self->_currentJunctionViewInfo;
  self->_currentJunctionViewInfo = 0;

  currentSignInfo = self->_currentSignInfo;
  self->_currentSignInfo = 0;

  currentARInfos = self->_currentARInfos;
  self->_currentARInfos = 0;

  self->_needsUpdate = 0;
  *(_DWORD *)&self->_secondarySignVisible = 0;
}

- (GuidanceObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)GuidanceObserver;
  v2 = [(GuidanceObserver *)&v11 init];
  if (v2)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "(%@) init", buf, 0xCu);
    }

    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    outlets = v2->_outlets;
    v2->_outlets = (NSHashTable *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    guidanceUpdates = v2->_guidanceUpdates;
    v2->_guidanceUpdates = (NSMutableDictionary *)v6;

    [(GuidanceObserver *)v2 _prepareForActiveNavigationIfNeeded];
    int v8 = +[MNNavigationService sharedService];
    [v8 registerObserver:v2];

    v9 = +[MNNavigationService sharedService];
    v2->_currentArrivalState = (unint64_t)[v9 arrivalState];
  }
  return v2;
}

- (void)_prepareForActiveNavigationIfNeeded
{
  id v5 = +[MNNavigationService sharedService];
  if ([v5 isInNavigatingState])
  {
    if (!self->_destinationDisplayName) {
      [(GuidanceObserver *)self _updateDestinationDisplayName];
    }
    v3 = +[UIScreen mainScreen];
    uint64_t v4 = [v3 currentMode];
    [v4 size];
    +[NavJunctionViewController updateJunctionImageSizeForScreenSize:](NavJunctionViewController, "updateJunctionImageSizeForScreenSize:");
  }
  else
  {
    [(GuidanceObserver *)self _tearDownNavigationIfNeeded];
  }
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "(%@) dealloc", buf, 0xCu);
  }

  [(GuidanceObserver *)self _tearDownNavigationIfNeeded];
  uint64_t v4 = +[MNNavigationService sharedService];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)GuidanceObserver;
  [(GuidanceObserver *)&v5 dealloc];
}

- (NSMutableDictionary)classicSignIDs
{
  classicSignIDs = self->_classicSignIDs;
  if (!classicSignIDs)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_opt_new();
    objc_super v5 = self->_classicSignIDs;
    self->_classicSignIDs = v4;

    classicSignIDs = self->_classicSignIDs;
  }

  return classicSignIDs;
}

- (void)setCurrentArrivalState:(unint64_t)a3
{
  if (self->_currentArrivalState != a3)
  {
    objc_super v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = sub_10078D488(self->_currentArrivalState);
      v7 = sub_10078D488(a3);
      *(_DWORD *)buf = 138412802;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "(%@) will update arrival state from: %@ to: %@", buf, 0x20u);
    }
    self->_currentArrivalState = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100C2A0C8;
    v8[3] = &unk_10131BBC0;
    v8[4] = a3;
    [(GuidanceObserver *)self _eachGuidanceOutput:v8];
    if (a3 - 4 >= 2)
    {
      if (a3 == 1)
      {
        [(GuidanceObserver *)self _updateDestinationDisplayName];
        [(GuidanceObserver *)self _updateDisplayETA];
      }
    }
    else
    {
      [(GuidanceObserver *)self _removeAllRepeatableUpdates];
    }
  }
}

- (void)addOutlet:(id)a3 forOwner:(id)a4
{
  id v5 = a3;
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    int v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "(%@) adding outlet: %@", (uint8_t *)&v7, 0x16u);
  }

  [(NSHashTable *)self->_outlets addObject:v5];
}

- (void)removeOutlet:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "(%@) removing outlet: %@", (uint8_t *)&v6, 0x16u);
  }

  [(NSHashTable *)self->_outlets removeObject:v4];
}

- (id)_orderedUpdateKinds
{
  if (qword_101610B78 != -1) {
    dispatch_once(&qword_101610B78, &stru_10131BBE0);
  }
  v2 = (void *)qword_101610B70;

  return v2;
}

- (id)_signRepeatableUpdateKeys
{
  v4[0] = @"recalculating";
  v4[1] = @"primaryOrProceedToRouteManeuver";
  v4[2] = @"secondaryManeuver";
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (void)_performRepeatableUpdateForKey:(id)a3 onEachGuidanceOutput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GuidanceObserver *)self _eachGuidanceOutput:v6];
  id v8 = [v6 copy];

  [(NSMutableDictionary *)self->_guidanceUpdates setObject:v8 forKeyedSubscript:v7];
}

- (void)_eachGuidanceOutput:(id)a3
{
}

- (void)_eachGuidanceOutput:(id)a3 ignorePaused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void))a3;
  if (!self->_paused || v4)
  {
    id v8 = [(NSHashTable *)self->_outlets copy];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          v6[2](v6, *(void *)(*((void *)&v14 + 1) + 8 * i));
        }
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_removeRepeatableUpdateForKey:(id)a3
{
}

- (void)_removeAllRepeatableUpdatesForKeys:(id)a3
{
}

- (void)_removeAllRepeatableUpdates
{
}

- (void)repeatAllUpdatesForOutlet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(GuidanceObserver *)self _orderedUpdateKinds];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [(NSMutableDictionary *)self->_guidanceUpdates objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)];
          id v11 = (void *)v10;
          if (v10) {
            (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [(NSMutableDictionary *)self->_guidanceUpdates objectForKeyedSubscript:@"secondaryManeuver"];

    if (!v12) {
      [v4 hideSecondaryManeuver];
    }
  }
}

- (void)_repeatAllUpdatesWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(GuidanceObserver *)self _orderedUpdateKinds];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(NSMutableDictionary *)self->_guidanceUpdates objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v11)];
        long long v13 = v12;
        if (v12)
        {
          id v14 = objc_retainBlock(v12);
          [v6 performSelector:a4 withObject:v14];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_repeatAllUpdates
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "(%@) _repeatAllUpdates", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(GuidanceObserver *)self _orderedUpdateKinds];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMutableDictionary *)self->_guidanceUpdates objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        if (v9) {
          [(GuidanceObserver *)self _eachGuidanceOutput:v9 ignorePaused:1];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)pauseUpdates
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "(%@) pauseUpdates", (uint8_t *)&v4, 0xCu);
  }

  self->_paused = 1;
}

- (void)resumeUpdates
{
  if (self->_paused)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "(%@) resumeUpdates", (uint8_t *)&v4, 0xCu);
    }

    self->_paused = 0;
    [(GuidanceObserver *)self _repeatAllUpdates];
  }
}

- (void)_processPendingUpdates
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    long long v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_processPendingUpdates (%@)", (uint8_t *)&v9, 0xCu);
  }

  if (self->_needsUpdate)
  {
    int v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      currentSignInfo = self->_currentSignInfo;
      int v9 = 138412290;
      long long v10 = (GuidanceObserver *)currentSignInfo;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_processSignInfo: %@", (uint8_t *)&v9, 0xCu);
    }

    [(GuidanceObserver *)self _processSignInfo:self->_currentSignInfo];
    if (self->_currentLaneInfo)
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        currentLaneInfo = self->_currentLaneInfo;
        int v9 = 138412290;
        long long v10 = (GuidanceObserver *)currentLaneInfo;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_processShowLaneInfo: %@", (uint8_t *)&v9, 0xCu);
      }

      [(GuidanceObserver *)self _processShowLaneInfo:self->_currentLaneInfo];
    }
    else if (self->_shouldHideLaneGuidanceThisUpdate)
    {
      id v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_processHideLaneInfo", (uint8_t *)&v9, 2u);
      }

      [(GuidanceObserver *)self _processHideLaneInfo];
      self->_shouldHideLaneGuidanceThisUpdate = 0;
    }
    if (self->_needsJunctionViewUpdate)
    {
      if (self->_currentJunctionViewInfo)
      {
        -[GuidanceObserver _processShowJunctionViewInfo:](self, "_processShowJunctionViewInfo:");
      }
      else if (self->_shouldHideJunctionViewThisUpdate)
      {
        [(GuidanceObserver *)self _processHideJunctionViewInfo];
        self->_shouldHideJunctionViewThisUpdate = 0;
      }
    }
    [(GuidanceObserver *)self _processUsePersistentDisplay];
    if (self->_needsARInfosUpdate) {
      [(GuidanceObserver *)self _processARInfosUpdate:self->_currentARInfos];
    }
    *(_WORD *)&self->_needsUpdate = 0;
    self->_needsARInfosUpdate = 0;
  }
}

- (void)_processSignInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 primarySign];
    if (v6)
    {
    }
    else
    {
      uint64_t v7 = [v5 secondarySign];

      if (!v7) {
        goto LABEL_22;
      }
    }
    uint64_t v8 = +[MNNavigationService sharedService];
    int v9 = [v5 primarySign];
    long long v10 = [v9 junction];
    v115 = self;
    v110 = (void *)v8;
    if ([v10 numElements])
    {
      id v11 = objc_alloc((Class)MKJunction);
      long long v12 = [v5 primarySign];
      long long v13 = [v12 junction];
      id v116 = [v11 initWithJunction:v13];
    }
    else
    {
      id v116 = 0;
    }

    id v14 = [GuidanceManeuverArtwork alloc];
    long long v15 = [v5 primarySign];
    long long v16 = [v15 junction];
    id v17 = [v16 maneuverType];
    long long v18 = [v5 primarySign];
    v19 = [v18 junction];
    id v20 = [v19 drivingSide];
    v21 = [v5 primarySign];
    v22 = [v21 artworkOverride];
    v117 = [(GuidanceManeuverArtwork *)v14 initWithManeuver:v17 junction:v116 drivingSide:v20 artworkDataSource:v22];

    v23 = [v5 primarySign];
    v24 = [v23 primaryStrings];
    id v25 = [v24 count];

    if (v25)
    {
      v26 = [v5 primarySign];
      v27 = [v26 primaryStrings];
      uint64_t v114 = sub_100099700(v27, &stru_10131BC20);

      id v28 = [v5 primarySign];
      v29 = [v28 secondaryStrings];
      uint64_t v113 = sub_100099700(v29, &stru_10131BC40);
    }
    else
    {
      id v30 = objc_alloc((Class)MKServerFormattedStringParameters);
      v31 = [v5 primarySign];
      id v32 = [v31 distanceDetailLevel];
      v33 = [v5 primarySign];
      v34 = [v33 variableOverrides];
      id v35 = [v30 initWithInstructionsDistanceDetailLevel:v32 variableOverrides:v34];

      v36 = [v5 primarySign];
      v37 = [v36 titles];
      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472;
      v129[2] = sub_100C2B9B0;
      v129[3] = &unk_1012EB0E8;
      id v38 = v35;
      id v130 = v38;
      uint64_t v114 = sub_100099700(v37, v129);

      v39 = [v5 primarySign];
      v40 = [v39 details];
      v127[0] = _NSConcreteStackBlock;
      v127[1] = 3221225472;
      v127[2] = sub_100C2BA18;
      v127[3] = &unk_1012EB0E8;
      id v128 = v38;
      id v28 = v38;
      uint64_t v113 = sub_100099700(v40, v127);
    }
    v41 = [(GuidanceObserver *)v115 _signRepeatableUpdateKeys];
    [(GuidanceObserver *)v115 _removeAllRepeatableUpdatesForKeys:v41];

    v42 = [v5 primarySign];
    id v43 = [v42 shieldID];
    v44 = [v5 primarySign];
    v45 = [v44 shieldStringID];
    v46 = [v5 primarySign];
    v47 = [v46 shieldText];
    uint64_t v48 = +[NavSignShieldInfo shieldWithID:v43 stringID:v45 text:v47];

    v49 = [NavSignManeuverGuidanceInfo alloc];
    v50 = [v5 primarySign];
    v51 = [v50 uniqueID];
    v53 = (void *)v113;
    v52 = (void *)v114;
    v109 = (void *)v48;
    v54 = [(NavSignManeuverGuidanceInfo *)v49 initWithSignID:v51 maneuverArtwork:v117 majorTextAlternatives:v114 minorTextAlternatives:v113 shieldInfo:v48];

    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472;
    v124[2] = sub_100C2BA80;
    v124[3] = &unk_10131BC68;
    v55 = v54;
    v125 = v55;
    id v56 = v110;
    id v126 = v56;
    [(GuidanceObserver *)v115 _performRepeatableUpdateForKey:@"primaryOrProceedToRouteManeuver" onEachGuidanceOutput:v124];
    v57 = [v5 secondarySign];

    if (v57)
    {
      v107 = v55;
      id v108 = v56;
      v58 = [v5 secondarySign];
      v59 = [v58 junction];
      if ([v59 numElements])
      {
        id v60 = objc_alloc((Class)MKJunction);
        v61 = [v5 secondarySign];
        v62 = [v61 junction];
        id v63 = [v60 initWithJunction:v62];
      }
      else
      {
        id v63 = 0;
      }

      v111 = [GuidanceManeuverArtwork alloc];
      v66 = [v5 secondarySign];
      v67 = [v66 junction];
      id v68 = [v67 maneuverType];
      v69 = [v5 secondarySign];
      v70 = [v69 junction];
      id v71 = [v70 drivingSide];
      v72 = [v5 secondarySign];
      v73 = [v72 artworkOverride];
      v106 = v63;
      v105 = [(GuidanceManeuverArtwork *)v111 initWithManeuver:v68 junction:v63 drivingSide:v71 artworkDataSource:v73];

      v74 = [v5 secondarySign];
      v75 = [v74 primaryStrings];
      id v76 = [v75 count];

      if (v76)
      {
        v77 = [v5 secondarySign];
        v78 = [v77 primaryStrings];
        v112 = sub_100099700(v78, &stru_10131BC88);

        id v79 = [v5 secondarySign];
        v80 = [v79 secondaryStrings];
        v81 = sub_100099700(v80, &stru_10131BCA8);
      }
      else
      {
        id v82 = objc_alloc((Class)MKServerFormattedStringParameters);
        v83 = [v5 secondarySign];
        id v84 = [v83 distanceDetailLevel];
        v85 = [v5 secondarySign];
        v86 = [v85 variableOverrides];
        id v87 = [v82 initWithInstructionsDistanceDetailLevel:v84 variableOverrides:v86];

        v88 = [v5 secondarySign];
        v89 = [v88 titles];
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = sub_100C2BB8C;
        v122[3] = &unk_1012EB0E8;
        id v90 = v87;
        id v123 = v90;
        v112 = sub_100099700(v89, v122);

        v91 = [v5 secondarySign];
        v92 = [v91 details];
        v120[0] = _NSConcreteStackBlock;
        v120[1] = 3221225472;
        v120[2] = sub_100C2BBF4;
        v120[3] = &unk_1012EB0E8;
        id v121 = v90;
        id v79 = v90;
        v81 = sub_100099700(v92, v120);

        v80 = v123;
      }

      v93 = [v5 secondarySign];
      id v94 = [v93 shieldID];
      v95 = [v5 secondarySign];
      v96 = [v95 shieldStringID];
      v97 = [v5 secondarySign];
      v98 = [v97 shieldText];
      v99 = +[NavSignShieldInfo shieldWithID:v94 stringID:v96 text:v98];

      v100 = [NavSignManeuverGuidanceInfo alloc];
      v101 = [v5 secondarySign];
      v102 = [v101 uniqueID];
      v103 = [(NavSignManeuverGuidanceInfo *)v100 initWithSignID:v102 maneuverArtwork:v105 majorTextAlternatives:v112 minorTextAlternatives:v81 shieldInfo:v99];

      v115->_secondarySignVisible = 1;
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472;
      v118[2] = sub_100C2BC5C;
      v118[3] = &unk_10131BCD0;
      v119 = v103;
      v104 = v103;
      [(GuidanceObserver *)v115 _performRepeatableUpdateForKey:@"secondaryManeuver" onEachGuidanceOutput:v118];

      v64 = v116;
      v53 = (void *)v113;
      v52 = (void *)v114;
      id v56 = v108;
      v65 = v109;
      v55 = v107;
    }
    else
    {
      v64 = v116;
      v65 = (void *)v48;
      if (v115->_secondarySignVisible)
      {
        v115->_secondarySignVisible = 0;
        [(GuidanceObserver *)v115 _eachGuidanceOutput:&stru_10131BD10];
        [(GuidanceObserver *)v115 _removeRepeatableUpdateForKey:@"secondaryManeuver"];
      }
    }
  }
LABEL_22:
}

- (void)_processShowLaneInfo:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C2BD1C;
  v5[3] = &unk_10131BCD0;
  id v6 = a3;
  id v4 = v6;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"showLaneGuidanceInfo" onEachGuidanceOutput:v5];
  [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"hideLaneGuidanceInfo"];
}

- (void)_processHideLaneInfo
{
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"hideLaneGuidanceInfo" onEachGuidanceOutput:&stru_10131BD30];

  [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"showLaneGuidanceInfo"];
}

- (void)_processShowJunctionViewInfo:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C2BF78;
  v5[3] = &unk_10131BCD0;
  id v6 = a3;
  id v4 = v6;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"showJunctionViewInfo" onEachGuidanceOutput:v5];
  [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"hideJunctionViewInfo"];
}

- (void)_processHideJunctionViewInfo
{
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"hideJunctionViewInfo" onEachGuidanceOutput:&stru_10131BD50];

  [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"showJunctionViewInfo"];
}

- (void)_processUsePersistentDisplay
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C2C15C;
  v3[3] = &unk_10131BD78;
  objc_copyWeak(&v4, &location);
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"usePersistentDisplay" onEachGuidanceOutput:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_processARInfosUpdate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C2C270;
  v5[3] = &unk_10131BCD0;
  id v6 = a3;
  id v4 = v6;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"ARSignInfos" onEachGuidanceOutput:v5];
}

- (void)_updateDestinationDisplayName
{
  v3 = +[MNNavigationService sharedService];
  id v4 = [v3 route];
  id v5 = [v4 legIndexForStepIndex:[v3 stepIndex]];
  id v6 = [v4 legs];
  id v7 = [v6 count];
  uint64_t v8 = [v4 legs];
  int v9 = v8;
  if (v5 >= v7) {
    [v8 lastObject];
  }
  else {
  long long v10 = [v8 objectAtIndexedSubscript:v5];
  }

  id v11 = [v10 destination];
  long long v12 = [v11 navDisplayName];

  p_destinationDisplayName = &self->_destinationDisplayName;
  unint64_t v14 = self->_destinationDisplayName;
  unint64_t v15 = v12;
  if (v15 | v14)
  {
    unsigned __int8 v17 = [(id)v14 isEqual:v15];

    objc_storeStrong((id *)&self->_destinationDisplayName, v12);
    if ((v17 & 1) == 0)
    {
      [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"destinationDisplayName"];
      objc_initWeak(&location, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100C2C4DC;
      v18[3] = &unk_10131BD78;
      objc_copyWeak(&v19, &location);
      [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"destinationDisplayName" onEachGuidanceOutput:v18];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    long long v16 = *p_destinationDisplayName;
    *p_destinationDisplayName = 0;
  }
}

- (void)_updateDisplayETA
{
  v3 = +[MNNavigationService sharedService];
  if ([v3 navigationState] == 5)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [GuidanceETA alloc];
    id v6 = [v3 displayEtaInfo];
    id v7 = [v3 remainingDistanceInfo];
    uint64_t v8 = [v3 batteryChargeInfo];
    int v9 = [v3 upcomingStop];
    long long v10 = [v9 timezone];
    id v4 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v5, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v6, v7, v8, v10, [v3 navigationTransportType]);
  }
  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    long long v16 = self;
    __int16 v17 = 2112;
    long long v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "(%@) _updateDisplayETA to: %@", buf, 0x16u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100C2C750;
  v13[3] = &unk_10131BCD0;
  unint64_t v14 = v4;
  long long v12 = v4;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"remainingTotalTimeAndDistance" onEachGuidanceOutput:v13];
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating())
  {
    [(GuidanceObserver *)self _prepareForActiveNavigationIfNeeded];
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v6 = a3;
  if (MNNavigationServiceStateChangedFromNavigatingToStopped())
  {
    [(GuidanceObserver *)self _eachGuidanceOutput:&stru_10131BD98];
    [(GuidanceObserver *)self _removeAllRepeatableUpdates];
    [(GuidanceObserver *)self _tearDownNavigationIfNeeded];
    [(NSHashTable *)self->_outlets removeAllObjects];
  }
  [(GuidanceObserver *)self _updateArrivalStateWithService:v6];
}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C2C8B8;
  void v4[3] = &unk_10131BDB8;
  BOOL v5 = a4;
  [(GuidanceObserver *)self _eachGuidanceOutput:v4];
}

- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4
{
  self->_usePersistentDisplay = a4;
  self->_needsUpdate = 1;
}

- (void)navigationServiceWillReroute:(id)a3
{
  id v4 = [(GuidanceObserver *)self _signRepeatableUpdateKeys];
  [(GuidanceObserver *)self _removeAllRepeatableUpdatesForKeys:v4];

  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"recalculating" onEachGuidanceOutput:&stru_10131BDD8];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = objc_opt_new();
  [(GuidanceObserver *)self setClassicSignIDs:v9];

  [(GuidanceObserver *)self _updateDestinationDisplayName];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C2CAA0;
  v10[3] = &unk_10131BD78;
  objc_copyWeak(&v11, &location);
  [(GuidanceObserver *)self _eachGuidanceOutput:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  BOOL v5 = [(GuidanceObserver *)self _signRepeatableUpdateKeys];
  [(GuidanceObserver *)self _removeAllRepeatableUpdatesForKeys:v5];

  [(GuidanceObserver *)self _eachGuidanceOutput:&stru_10131BDF8];
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  id v4 = [(GuidanceObserver *)self _signRepeatableUpdateKeys];
  [(GuidanceObserver *)self _removeAllRepeatableUpdatesForKeys:v4];

  [(GuidanceObserver *)self _eachGuidanceOutput:&stru_10131BE18];
}

- (void)navigationServiceEndGuidanceUpdate:(id)a3
{
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    self->_usingSignInfo = 1;
    id v7 = v6;
    objc_storeStrong((id *)&self->_currentSignInfo, a4);
    id v6 = v7;
    self->_needsUpdate = 1;
  }
}

- (void)navigationService:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = sub_100099700(v5, &stru_10131BE58);
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Got AR guidance infos: %@", (uint8_t *)&v10, 0xCu);
    }
    id v8 = (NSArray *)[v5 copy];
    currentARInfos = self->_currentARInfos;
    self->_currentARInfos = v8;

    self->_needsARInfosUpdate = 1;
    self->_needsUpdate = 1;
  }
}

- (void)_updateArrivalStateWithService:(id)a3
{
  id v4 = [a3 arrivalState];

  [(GuidanceObserver *)self setCurrentArrivalState:v4];
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[GuidanceObserver _updateArrivalStateWithService:](self, "_updateArrivalStateWithService:", a3, a4, a5, a6);
  [(GuidanceObserver *)self _updateDisplayETA];

  [(GuidanceObserver *)self _removeAllRepeatableUpdates];
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v6 = (MNGuidanceLaneInfo *)a4;
  if (v6 && self->_currentLaneInfo != v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)&self->_currentLaneInfo, a4);
    id v6 = v7;
    self->_shouldHideLaneGuidanceThisUpdate = 0;
    self->_needsUpdate = 1;
  }
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  if (a4)
  {
    currentLaneInfo = self->_currentLaneInfo;
    self->_currentLaneInfo = 0;

    self->_shouldHideLaneGuidanceThisUpdate = 1;
    self->_needsUpdate = 1;
  }
}

- (void)navigationService:(id)a3 showJunctionView:(id)a4
{
  id v6 = a3;
  id v7 = (MNGuidanceJunctionViewInfo *)a4;
  if (v7)
  {
    currentJunctionViewInfo = self->_currentJunctionViewInfo;
    if (currentJunctionViewInfo != v7)
    {
      int v9 = [(MNGuidanceJunctionViewInfo *)currentJunctionViewInfo uniqueID];
      int v10 = [(MNGuidanceJunctionViewInfo *)v7 uniqueID];
      unsigned __int8 v11 = [v9 isEqual:v10];

      if ((v11 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_currentJunctionViewInfo, a4);
        self->_shouldHideJunctionViewThisUpdate = 0;
        *(_WORD *)&self->_needsUpdate = 257;
      }
    }
  }
  else
  {
    long long v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No junction view info received from nav service.", v13, 2u);
    }
  }
}

- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4
{
  if (a4)
  {
    currentJunctionViewInfo = self->_currentJunctionViewInfo;
    self->_currentJunctionViewInfo = 0;

    self->_shouldHideJunctionViewThisUpdate = 1;
    *(_WORD *)&self->_needsUpdate = 257;
  }
}

- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  long long v12 = +[MNNavigationService sharedService];
  unsigned int v13 = [v12 navigationState];

  if (v13 != 5)
  {
    [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"recalculating"];
    [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"remainingManeuverTimeAndDistance"];
    unint64_t v14 = [v10 route];
    unint64_t v15 = [v14 steps];
    id v16 = [v15 count];

    if ((unint64_t)v16 > a6)
    {
      __int16 v17 = [v10 route];
      long long v18 = [v17 steps];
      id v19 = [v18 objectAtIndexedSubscript:a6];

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100C2D2D4;
      v21[3] = &unk_10131BE80;
      double v24 = a4;
      id v22 = v11;
      id v23 = v19;
      id v20 = v19;
      [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"primaryOrProceedToRouteManeuver" onEachGuidanceOutput:v21];
    }
  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = [v10 route];
  long long v12 = [v11 steps];
  id v13 = [v12 count];

  if ((unint64_t)v13 > a6)
  {
    unint64_t v14 = [v10 route];
    unint64_t v15 = [v14 steps];
    id v16 = [v15 objectAtIndexedSubscript:a6];

    __int16 v17 = [v16 contentsForContext:1];
    long long v18 = [v17 stringForDistance:a4];
    id v19 = [v18 mkServerFormattedString];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100C2D46C;
    v22[3] = &unk_10131BEA8;
    double v25 = a5;
    double v26 = a4;
    id v23 = v19;
    id v24 = v16;
    unint64_t v27 = a6;
    id v20 = v16;
    id v21 = v19;
    [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"remainingManeuverTimeAndDistance" onEachGuidanceOutput:v22];
  }
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  id v14 = a4;
  self->_usingSignInfo = 0;
  id v15 = a7;
  id v16 = a5;
  __int16 v17 = [(GuidanceObserver *)self classicSignIDs];
  long long v18 = +[NSNumber numberWithUnsignedInteger:a9];
  id v19 = [v17 objectForKeyedSubscript:v18];

  if (!v19)
  {
    id v20 = +[NSUUID UUID];
    id v21 = [(GuidanceObserver *)self classicSignIDs];
    id v22 = +[NSNumber numberWithUnsignedInteger:a9];
    [v21 setObject:v20 forKeyedSubscript:v22];
  }
  if ([v14 junctionElements]) {
    id v23 = [objc_alloc((Class)MKJunction) initWithType:[v14 junctionType] maneuver:[v14 maneuverType] drivingSide:v10 elements:[v14 junctionElements] count:[v14 junctionElementsCount]];
  }
  else {
    id v23 = 0;
  }
  id v24 = [GuidanceManeuverArtwork alloc];
  id v25 = [v14 maneuverType];
  double v26 = [v14 artworkOverride];
  unint64_t v27 = [(GuidanceManeuverArtwork *)v24 initWithManeuver:v25 junction:v23 drivingSide:v10 artworkDataSource:v26];

  id v28 = sub_100099700(v16, &stru_10131BEC8);

  v29 = [(GuidanceObserver *)self _signRepeatableUpdateKeys];
  [(GuidanceObserver *)self _removeAllRepeatableUpdatesForKeys:v29];

  id v30 = +[NavSignShieldInfo shieldWithID:a6 stringID:0 text:v15];

  v31 = [NavSignManeuverGuidanceInfo alloc];
  id v32 = [(GuidanceObserver *)self classicSignIDs];
  v33 = +[NSNumber numberWithUnsignedInteger:a9];
  v34 = [v32 objectForKeyedSubscript:v33];
  id v35 = [(NavSignManeuverGuidanceInfo *)v31 initWithSignID:v34 maneuverArtwork:v27 majorTextAlternatives:0 minorTextAlternatives:v28 shieldInfo:v30];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100C2D7C8;
  v38[3] = &unk_10131BEF0;
  v39 = v35;
  unint64_t v40 = a9;
  v36 = v35;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"primaryOrProceedToRouteManeuver" onEachGuidanceOutput:v38];
}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C2D848;
  void v4[3] = &unk_10131BBC0;
  void v4[4] = a4;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"announcementStage" onEachGuidanceOutput:v4];
}

- (void)navigationService:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  id v13 = a4;
  id v14 = a7;
  id v15 = a5;
  id v16 = [(GuidanceObserver *)self classicSignIDs];
  __int16 v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 stepID]);
  long long v18 = [v16 objectForKeyedSubscript:v17];

  if (!v18)
  {
    id v19 = +[NSUUID UUID];
    id v20 = [(GuidanceObserver *)self classicSignIDs];
    id v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 stepID]);
    [v20 setObject:v19 forKeyedSubscript:v21];
  }
  if ([v13 junctionElements]) {
    id v22 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithType:maneuver:drivingSide:elements:count:", objc_msgSend(v13, "junctionType"), objc_msgSend(v13, "maneuverType"), v8, objc_msgSend(v13, "junctionElements"), objc_msgSend(v13, "junctionElementsCount"));
  }
  else {
    id v22 = 0;
  }
  id v23 = [GuidanceManeuverArtwork alloc];
  id v24 = [v13 maneuverType];
  id v25 = [v13 artworkOverride];
  double v26 = [(GuidanceManeuverArtwork *)v23 initWithManeuver:v24 junction:v22 drivingSide:v8 artworkDataSource:v25];

  unint64_t v27 = sub_100099700(v15, &stru_10131BF10);

  id v28 = +[NavSignShieldInfo shieldWithID:v10 stringID:0 text:v14];

  v29 = [NavSignManeuverGuidanceInfo alloc];
  id v30 = [(GuidanceObserver *)self classicSignIDs];
  v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 stepID]);
  id v32 = [v30 objectForKeyedSubscript:v31];
  v33 = [(NavSignManeuverGuidanceInfo *)v29 initWithSignID:v32 maneuverArtwork:v26 majorTextAlternatives:0 minorTextAlternatives:v27 shieldInfo:v28];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100C2DB88;
  v35[3] = &unk_10131BCD0;
  v36 = v33;
  v34 = v33;
  [(GuidanceObserver *)self _performRepeatableUpdateForKey:@"secondaryManeuver" onEachGuidanceOutput:v35];
}

- (void)navigationServiceDidHideSecondaryStep:(id)a3
{
  [(GuidanceObserver *)self _eachGuidanceOutput:&stru_10131BF30];

  [(GuidanceObserver *)self _removeRepeatableUpdateForKey:@"secondaryManeuver"];
}

- (void)setClassicSignIDs:(id)a3
{
}

- (unint64_t)currentArrivalState
{
  return self->_currentArrivalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classicSignIDs, 0);
  objc_storeStrong((id *)&self->_currentJunctionViewInfo, 0);
  objc_storeStrong((id *)&self->_currentLaneInfo, 0);
  objc_storeStrong((id *)&self->_currentARInfos, 0);
  objc_storeStrong((id *)&self->_currentSignInfo, 0);
  objc_storeStrong((id *)&self->_destinationDisplayName, 0);
  objc_storeStrong((id *)&self->_outlets, 0);

  objc_storeStrong((id *)&self->_guidanceUpdates, 0);
}

@end