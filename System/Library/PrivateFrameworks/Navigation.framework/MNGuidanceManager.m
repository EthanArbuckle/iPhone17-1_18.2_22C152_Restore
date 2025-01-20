@interface MNGuidanceManager
- (BOOL)_considerArrivalAnnouncements;
- (BOOL)_considerChargingAnnouncements;
- (BOOL)_considerGetOnRouteAnnouncements;
- (BOOL)_considerOtherSpecialAnnouncements;
- (BOOL)_considerStartingAnnouncements;
- (BOOL)_eventWasSpoken:(id)a3;
- (BOOL)_hasPersistentEvents;
- (BOOL)_isEVChargingEvent:(id)a3;
- (BOOL)_isInArrivalState;
- (BOOL)_isValidEvent:(id)a3;
- (BOOL)_updateDisplayStringArgument:(id)a3 event:(id)a4;
- (BOOL)_updateSpokenStringArgument:(id)a3 event:(id)a4;
- (BOOL)isInPreArrivalState;
- (BOOL)repeatLastGuidanceAnnouncement:(id)a3;
- (BOOL)shouldShowChargingInfo;
- (GEOComposedRoute)route;
- (MNGuidanceManager)initWithNavigationSessionState:(id)a3 audioManager:(id)a4 isReconnecting:(BOOL)a5 announcementsToIgnore:(id)a6;
- (MNGuidanceManagerDelegate)delegate;
- (MNLocation)location;
- (MNNavigationSessionState)navigationSessionState;
- (NSArray)events;
- (double)_adjustedVehicleSpeed;
- (double)_distanceToEndOfRoute;
- (double)_distanceToManeuverStart;
- (double)_distanceToRouteCoordinate:(id)a3;
- (double)_headingForArEvent:(id)a3;
- (double)_timeRemainingForEvent:(id)a3;
- (double)_timeUntilEventTrigger:(id)a3;
- (double)durationOfEvent:(id)a3 announcementIndex:(unint64_t)a4 distance:(double)a5;
- (double)speed;
- (double)timeSinceLastAnnouncement;
- (double)timeUntilNextAnnouncement;
- (id)_arrivalARGuidanceEventsForLeg:(unint64_t)a3;
- (id)_closestContinueAREventToRouteCoordinate:(id)a3;
- (id)_createArGuidanceInfosForEvent:(id)a3 forStep:(id)a4;
- (id)_durationsForEvent:(id)a3;
- (id)_evaluatedStringsForEvent:(id)a3 signStrings:(id)a4 shouldUpdateFormatStrings:(BOOL)a5 argumentHandler:(id)a6;
- (id)_junctionViewEvents;
- (id)_nextJunctionViewGuidanceEvent;
- (id)_nextLaneGuidanceEvent;
- (id)_selectAnnouncementForEvent:(id)a3 withTimeRemaining:(double)a4 selectedVariantIndex:(unint64_t *)a5;
- (id)_serverStringDictionaryForChargingEvent:(id)a3;
- (id)_serverStringDictionaryForEvent:(id)a3 distance:(double)a4 validDistance:(double)a5 spoken:(BOOL)a6 waypoints:(id)a7;
- (id)_signForGuidanceEvent:(id)a3 isPrimary:(BOOL)a4 shouldOverridePrimaryDistances:(BOOL)a5 distance:(double *)a6;
- (id)_sortedSignEventsFromValidSignEvents:(id)a3;
- (id)_specialAREvents:(int)a3 forLeg:(unint64_t)a4;
- (id)_specialNavTrayEvents:(int)a3 forLeg:(unint64_t)a4;
- (id)_specialSignEvents:(int)a3 forLeg:(unint64_t)a4;
- (id)_specialSpokenEvents:(int)a3 forLegIndex:(unint64_t)a4;
- (id)_spokenEventsRemainingInStep;
- (id)_spokenStringForEvent:(id)a3 waypointCategory:(int)a4;
- (id)_validEventsForARGuidance;
- (id)_validEventsForSignGuidance:(BOOL *)a3;
- (int)_indexForEventUUID:(id)a3;
- (int)_maneuverTypeForAREvent:(id)a3;
- (unint64_t)_announcementStageForEvent:(id)a3;
- (unint64_t)_trafficColorForRoute:(id)a3 routeCoordinate:(id)a4;
- (unint64_t)currentLegIndex;
- (void)_considerARGuidance;
- (void)_considerAnnouncements;
- (void)_considerHaptics;
- (void)_considerJunctionViewGuidance;
- (void)_considerLaneGuidance;
- (void)_considerNavTrayGuidance;
- (void)_considerPersistence;
- (void)_considerSignGuidance;
- (void)_filterValidEvents;
- (void)_handleJunctionViewInfo:(id)a3;
- (void)_initSpecialGuidanceEventsForRoute:(id)a3;
- (void)_markEventSpoken:(id)a3;
- (void)_notifyAnalyticsForNewEvents:(id)a3 previousEvents:(id)a4;
- (void)_notifySpeechEvent:(id)a3 waypointCategory:(int)a4 startingVariantIndex:(unint64_t)a5;
- (void)_planAnnouncements;
- (void)_resetLastAnnouncementTime;
- (void)dealloc;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setIsInPreArrivalState:(BOOL)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)setLocation:(id)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)setShouldShowChargingInfo:(BOOL)a3;
- (void)setSpeed:(double)a3;
- (void)stop;
- (void)updateDestination:(id)a3;
- (void)updateGuidanceForLocation:(id)a3 navigatorState:(int)a4;
- (void)updateSessionStateForReroute:(id)a3 reason:(unint64_t)a4 location:(id)a5;
@end

@implementation MNGuidanceManager

- (MNGuidanceManager)initWithNavigationSessionState:(id)a3 audioManager:(id)a4 isReconnecting:(BOOL)a5 announcementsToIgnore:(id)a6
{
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10
    && ([v10 currentRouteInfo], v13 = objc_claimAutoreleasedReturnValue(), v13, v13)
    && (v50.receiver = self,
        v50.super_class = (Class)MNGuidanceManager,
        v14 = [(MNGuidanceManager *)&v50 init],
        (self = v14) != 0))
  {
    objc_storeStrong((id *)&v14->_audioManager, a4);
    v15 = objc_alloc_init(MNAnnouncementEngine);
    announcementEngine = self->_announcementEngine;
    self->_announcementEngine = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    announcementsSpoken = self->_announcementsSpoken;
    self->_announcementsSpoken = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    exclusiveSetAnnouncementsSpoken = self->_exclusiveSetAnnouncementsSpoken;
    self->_exclusiveSetAnnouncementsSpoken = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hapticsTriggered = self->_hapticsTriggered;
    self->_hapticsTriggered = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    feedback = self->_feedback;
    self->_feedback = v23;

    [(MNGuidanceManager *)self _resetLastAnnouncementTime];
    *(_WORD *)&self->_hasBeenOnRouteOnce = 256;
    self->_isInPreArrivalState = 0;
    currentLaneGuidanceEvent = self->_currentLaneGuidanceEvent;
    self->_currentLaneGuidanceEvent = 0;

    signInfo = self->_signInfo;
    self->_signInfo = 0;

    [(MNGuidanceManager *)self setNavigationSessionState:v10];
    v27 = [(MNGuidanceManager *)self route];
    [(MNGuidanceManager *)self _initSpecialGuidanceEventsForRoute:v27];

    if (v7)
    {
      id v45 = v11;
      v28 = [(MNGuidanceManager *)self _specialSpokenEvents:1 forLegIndex:0];
      v29 = [v28 firstObject];
      [(MNGuidanceManager *)self _markEventSpoken:v29];

      v30 = [(MNGuidanceManager *)self _specialSpokenEvents:2 forLegIndex:0];
      v31 = [v30 firstObject];
      [(MNGuidanceManager *)self _markEventSpoken:v31];

      v32 = [(NSMutableDictionary *)self->_specialSignEvents objectForKeyedSubscript:&unk_1F0E35058];
      [v32 setObject:0 forKeyedSubscript:&unk_1F0E35070];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v33 = v12;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v47;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v47 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v46 + 1) + 8 * v37);
            v39 = +[MNTimeManager currentDate];
            [(NSMutableDictionary *)self->_announcementsSpoken setObject:v39 forKeyedSubscript:v38];

            ++v37;
          }
          while (v35 != v37);
          uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v53 count:16];
        }
        while (v35);
      }

      v40 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = self->_announcementsSpoken;
        *(_DWORD *)buf = 138412290;
        v52 = v41;
        _os_log_impl(&dword_1B542B000, v40, OS_LOG_TYPE_INFO, "ⓖ Restarting guidance after a navd reconnection. Ignoring announcements: %@", buf, 0xCu);
      }

      id v11 = v45;
    }
    v42 = +[MNTimeManager sharedManager];
    [v42 registerObserver:self];

    self = self;
    v43 = self;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (void)_initSpecialGuidanceEventsForRoute:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    specialSpokenEvents = self->_specialSpokenEvents;
    p_specialSpokenEvents = &self->_specialSpokenEvents;
    self->_specialSpokenEvents = v5;

    BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
    specialSignEvents = self->_specialSignEvents;
    p_specialSignEvents = &self->_specialSignEvents;
    self->_specialSignEvents = v7;

    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    specialNavTrayEvents = self->_specialNavTrayEvents;
    p_specialNavTrayEvents = &self->_specialNavTrayEvents;
    self->_specialNavTrayEvents = v9;

    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    specialAREvents = self->_specialAREvents;
    p_specialAREvents = &self->_specialAREvents;
    self->_specialAREvents = v11;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v32 = v4;
    id obj = [v4 composedGuidanceEvents];
    uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (!v13) {
      goto LABEL_22;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    unint64_t v16 = 0x1E4F28000uLL;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v18 isSpecial])
        {
          char v19 = [v18 hasSpokenGuidance];
          v20 = (id *)p_specialSpokenEvents;
          if ((v19 & 1) == 0)
          {
            char v21 = [v18 hasSignGuidance];
            v20 = (id *)p_specialSignEvents;
            if ((v21 & 1) == 0)
            {
              v22 = [v18 navTrayTitleString];
              if (v22)
              {

                v20 = (id *)p_specialNavTrayEvents;
              }
              else
              {
                v23 = [v18 navTrayDetailString];

                v20 = (id *)p_specialNavTrayEvents;
                if (!v23)
                {
                  int v24 = [v18 hasArGuidance];
                  v20 = (id *)p_specialAREvents;
                  if (!v24) {
                    continue;
                  }
                }
              }
            }
          }
          id v25 = *v20;
          if (v25)
          {
            v26 = v25;
            v27 = objc_msgSend(*(id *)(v16 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v18, "legIndex"));
            v28 = [v26 objectForKeyedSubscript:v27];
            if (!v28)
            {
              v28 = objc_opt_new();
              [v26 setObject:v28 forKeyedSubscript:v27];
            }
            unint64_t v29 = v16;
            v30 = objc_msgSend(*(id *)(v16 + 3792), "numberWithInt:", objc_msgSend(v18, "composedGuidanceEventType"));
            v31 = [v28 objectForKeyedSubscript:v30];
            if (!v31)
            {
              v31 = objc_opt_new();
              [v28 setObject:v31 forKeyedSubscript:v30];
            }
            [v31 addObject:v18];

            unint64_t v16 = v29;
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v14)
      {
LABEL_22:

        id v4 = v32;
        break;
      }
    }
  }
}

- (void)dealloc
{
  v3 = +[MNTimeManager sharedManager];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MNGuidanceManager;
  [(MNGuidanceManager *)&v4 dealloc];
}

- (void)reset
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  junctionViewImageLoader = self->_junctionViewImageLoader;
  self->_junctionViewImageLoader = 0;

  events = self->_events;
  self->_events = 0;

  eventIndexes = self->_eventIndexes;
  self->_eventIndexes = 0;

  nextEvent = self->_nextEvent;
  self->_nextEvent = 0;

  signInfo = self->_signInfo;
  self->_signInfo = 0;

  lastAnnouncementEvent = self->_lastAnnouncementEvent;
  self->_lastAnnouncementEvent = 0;

  self->_canSpeakReturnToRouteAnnouncement = 1;
  [(MNGuidanceManager *)self _resetLastAnnouncementTime];
  [(NSMutableDictionary *)self->_feedback removeAllObjects];
  v9 = [MEMORY[0x1E4F1CA80] setWithCapacity:6];
  for (uint64_t i = 0; i != 6; ++i)
  {
    uint64_t v11 = dword_1B5542B60[i];
    id v12 = [(MNGuidanceManager *)self _specialSpokenEvents:v11 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
    uint64_t v13 = [v12 firstObject];

    if ([(MNGuidanceManager *)self _eventWasSpoken:v13])
    {
      uint64_t v14 = [NSNumber numberWithInt:v11];
      [v9 addObject:v14];
    }
  }
  if ([(MNGuidanceManager *)self currentLegIndex])
  {
    uint64_t v15 = [(MNGuidanceManager *)self _specialSpokenEvents:1 forLegIndex:0];
    unint64_t v16 = [v15 firstObject];

    if ([(MNGuidanceManager *)self _eventWasSpoken:v16]) {
      [v9 addObject:&unk_1F0E35070];
    }
  }
  [(NSMutableDictionary *)self->_announcementsSpoken removeAllObjects];
  [(NSMutableSet *)self->_exclusiveSetAnnouncementsSpoken removeAllObjects];
  [(NSMutableDictionary *)self->_hapticsTriggered removeAllObjects];
  v17 = [(MNGuidanceManager *)self route];
  [(MNGuidanceManager *)self _initSpecialGuidanceEventsForRoute:v17];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "unsignedIntegerValue", (void)v25), 0);
        int v24 = [v23 firstObject];

        [(MNGuidanceManager *)self _markEventSpoken:v24];
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }
}

- (void)_resetLastAnnouncementTime
{
  +[MNTimeManager currentTime];
  self->_timeLastAnnouncementStarted = v3;
  self->_timeLastAnnouncementEnded = v3;
}

- (NSArray)events
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  events = self->_events;
  if (!events)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA48];
    v5 = [(MNGuidanceManager *)self route];
    v6 = [v5 composedGuidanceEvents];
    BOOL v7 = [v4 arrayWithArray:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [(MNGuidanceManager *)self route];
    v9 = [v8 enrouteNotices];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) guidanceEvents];
          [(NSMutableArray *)v7 addObjectsFromArray:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)v7 sortUsingSelector:sel_compare_];
    uint64_t v15 = self->_events;
    self->_events = v7;

    events = self->_events;
  }
  return (NSArray *)events;
}

- (GEOComposedRoute)route
{
  v2 = [(MNGuidanceManager *)self navigationSessionState];
  double v3 = [v2 currentRouteInfo];
  objc_super v4 = [v3 route];

  return (GEOComposedRoute *)v4;
}

- (unint64_t)currentLegIndex
{
  uint64_t v3 = [(MNGuidanceManager *)self navigationSessionState];
  if (v3
    && (objc_super v4 = (void *)v3,
        [(MNGuidanceManager *)self navigationSessionState],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 targetLegIndex],
        v5,
        v4,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = [(MNGuidanceManager *)self navigationSessionState];
    uint64_t v9 = [v8 targetLegIndex];
  }
  else
  {
    location = self->_location;
    if (!location) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    v8 = [(MNLocation *)location routeMatch];
    uint64_t v9 = [v8 legIndex];
  }
  unint64_t v10 = v9;

  return v10;
}

- (void)stop
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = MNGetMNGuidanceManagerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    objc_super v4 = "-[MNGuidanceManager stop]";
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "ⓖ %s", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)repeatLastGuidanceAnnouncement:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNGuidanceManagerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v30 = "-[MNGuidanceManager repeatLastGuidanceAnnouncement:]";
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "ⓖ %s", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_location, a3);
  [(MNGuidanceManager *)self _adjustedVehicleSpeed];
  self->_speed = v7;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = self->_validEvents;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "announcements", (void)v24);
        uint64_t v16 = [v15 count];

        if (v16) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    [v8 sortUsingSelector:sel_comparePriority_];
    long long v17 = [v8 firstObject];
    long long v18 = self;
    long long v19 = v17;
    uint64_t v20 = 0;
  }
  else
  {
    lastAnnouncementEvent = self->_lastAnnouncementEvent;
    if (!lastAnnouncementEvent)
    {
      BOOL v22 = 0;
      goto LABEL_17;
    }
    long long v17 = [(MNAnnouncementPlanEvent *)lastAnnouncementEvent event];
    long long v18 = self;
    long long v19 = v17;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:](v18, "_notifySpeechEvent:waypointCategory:startingVariantIndex:", v19, 0, v20, (void)v24);

  BOOL v22 = 1;
LABEL_17:

  return v22;
}

- (void)updateDestination:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = MNGetMNGuidanceManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[MNGuidanceManager updateDestination:]";
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "ⓖ %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)updateSessionStateForReroute:(id)a3 reason:(unint64_t)a4 location:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = 0;
  char v11 = 1;
  switch(a4)
  {
    case 5uLL:
      int v10 = 0;
      self->_isInPreArrivalState = 0;
      break;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xBuLL:
      int v10 = 1;
      break;
    case 0xFuLL:
      char v11 = 0;
      int v10 = 0;
      break;
    default:
      break;
  }
  [(MNGuidanceManager *)self setNavigationSessionState:v8];
  [(MNGuidanceManager *)self reset];
  if (v9) {
    objc_storeStrong((id *)&self->_location, a5);
  }
  if (v10)
  {
    uint64_t v12 = [(MNGuidanceManager *)self _specialSpokenEvents:1 forLegIndex:0];
    uint64_t v13 = [v12 firstObject];

    uint64_t v14 = [(MNGuidanceManager *)self route];
    uint64_t v15 = [v14 destination];
    -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:", v13, [v15 waypointCategory], 0x7FFFFFFFFFFFFFFFLL);
  }
  if (v9) {
    char v16 = v11;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0 && [v9 state] == 1)
  {
    long long v17 = [v9 routeMatch];
    [v17 routeCoordinate];

    long long v18 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = GEOPolylineCoordinateAsFullString();
      *(_DWORD *)buf = 138412290;
      long long v39 = v19;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "Updating guidance manager for new route. New location is on route, so suppressing guidance events up to [%@].", buf, 0xCu);
    }
    unint64_t v20 = [v9 stepIndex];
    if (v20 <= 1) {
      unint64_t v21 = 1;
    }
    else {
      unint64_t v21 = v20;
    }
    id v32 = v8;
    BOOL v22 = [v8 currentRouteInfo];
    v23 = [v22 route];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v31 = v23;
    long long v24 = [v23 composedGuidanceEvents];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          unint64_t v29 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v29 hasSpokenGuidance])
          {
            if (([v29 isSpecial] & 1) == 0 && objc_msgSend(v29, "stepIndex") <= v21)
            {
              if ([v29 stepIndex] != v21
                || ([v29 startValidRouteCoordinate], GEOPolylineCoordinateIsABeforeB()))
              {
                uint64_t v30 = MNGetMNGuidanceManagerLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v39 = v29;
                  _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_INFO, "Suppressing guidance event: \"%@\"", buf, 0xCu);
                }

                [(MNGuidanceManager *)self _markEventSpoken:v29];
              }
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v26);
    }

    id v8 = v32;
  }
}

- (void)updateGuidanceForLocation:(id)a3 navigatorState:(int)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_location, a3);
  [(MNGuidanceManager *)self _adjustedVehicleSpeed];
  self->_speed = v7;
  [(MNGuidanceManager *)self _filterValidEvents];
  if (![(NSMutableArray *)self->_validEvents count])
  {
    id v8 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)char v16 = 0;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "ⓖ No valid guidance events found.", v16, 2u);
    }
  }
  junctionViewImageLoader = self->_junctionViewImageLoader;
  if (!junctionViewImageLoader)
  {
    int v10 = objc_alloc_init(MNJunctionViewImageLoader);
    char v11 = self->_junctionViewImageLoader;
    self->_junctionViewImageLoader = v10;

    uint64_t v12 = self->_junctionViewImageLoader;
    uint64_t v13 = [(MNGuidanceManager *)self _junctionViewEvents];
    [(MNJunctionViewImageLoader *)v12 setJunctionViewEvents:v13];

    junctionViewImageLoader = self->_junctionViewImageLoader;
  }
  [(MNGuidanceManager *)self _distanceToEndOfRoute];
  -[MNJunctionViewImageLoader updateForLocation:remainingDistanceOnRoute:](junctionViewImageLoader, "updateForLocation:remainingDistanceOnRoute:", v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained guidanceManagerBeginGuidanceUpdate:self];

  [(MNGuidanceManager *)self _considerAnnouncements];
  [(MNGuidanceManager *)self _considerHaptics];
  [(MNGuidanceManager *)self _considerLaneGuidance];
  [(MNGuidanceManager *)self _considerSignGuidance];
  [(MNGuidanceManager *)self _considerNavTrayGuidance];
  [(MNGuidanceManager *)self _considerPersistence];
  [(MNGuidanceManager *)self _considerJunctionViewGuidance];
  [(MNGuidanceManager *)self _considerARGuidance];
  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 guidanceManagerEndGuidanceUpdate:self];
}

- (void)_filterValidEvents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  validEvents = self->_validEvents;
  self->_validEvents = v3;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(MNGuidanceManager *)self events];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(MNGuidanceManager *)self _isValidEvent:v10]) {
          [(NSMutableArray *)self->_validEvents addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_specialNavTrayEvents:(int)a3 forLeg:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  specialNavTrayEvents = self->_specialNavTrayEvents;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v7 = [(NSMutableDictionary *)specialNavTrayEvents objectForKeyedSubscript:v6];
  uint64_t v8 = [NSNumber numberWithInt:v4];
  id v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (void)_considerAnnouncements
{
  int v3 = [(MNGuidanceManager *)self delegate];
  char v4 = [v3 isCurrentlySpeaking];

  if ((v4 & 1) == 0)
  {
    id v5 = [(MNGuidanceManager *)self delegate];
    char v6 = [v5 guidanceManagerIsRerouting];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(MNGuidanceManager *)self navigationSessionState];
      if ([v7 arrivalState] == 5)
      {
        uint64_t v8 = [(MNGuidanceManager *)self location];
        id v9 = [v8 routeMatch];
        uint64_t v10 = [v9 step];
        int v11 = [v10 transportType];
        long long v12 = [(MNGuidanceManager *)self route];
        int v13 = [v12 transportType];

        if (v11 != v13) {
          return;
        }
      }
      else
      {
      }
      if (![(MNGuidanceManager *)self _considerStartingAnnouncements]
        && ![(MNGuidanceManager *)self _considerGetOnRouteAnnouncements]
        && ![(MNGuidanceManager *)self _considerChargingAnnouncements]
        && ![(MNGuidanceManager *)self _considerArrivalAnnouncements]
        && ![(MNGuidanceManager *)self _considerOtherSpecialAnnouncements])
      {
        [(MNGuidanceManager *)self _planAnnouncements];
      }
    }
  }
}

- (BOOL)_considerStartingAnnouncements
{
  if ([(MNGuidanceManager *)self currentLegIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  char v4 = [(MNGuidanceManager *)self _specialSpokenEvents:1 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
  id v5 = [v4 firstObject];

  if (v5 && ![(MNGuidanceManager *)self _eventWasSpoken:v5])
  {
    char v6 = [(MNGuidanceManager *)self route];
    uint64_t v7 = [v6 destination];
    -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:", v5, [v7 waypointCategory], 0x7FFFFFFFFFFFFFFFLL);

    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_considerGetOnRouteAnnouncements
{
  if ([(MNGuidanceManager *)self currentLegIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  char v4 = [(MNGuidanceManager *)self _specialSpokenEvents:2 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
  id v5 = [v4 firstObject];

  if (!v5 || [(MNGuidanceManager *)self _eventWasSpoken:v5])
  {
    BOOL v3 = 0;
  }
  else
  {
    [(MNGuidanceManager *)self timeSinceLastAnnouncement];
    double v7 = v6;
    BOOL v8 = [(MNAudioManager *)self->_audioManager voiceGuidanceEnabled];
    if (v7 > 0.5 || !v8)
    {
      id v9 = [(MNGuidanceManager *)self delegate];
      int v10 = [v9 navigationState];

      if (v10 == 1) {
        [(MNGuidanceManager *)self _notifySpeechEvent:v5 waypointCategory:0 startingVariantIndex:0x7FFFFFFFFFFFFFFFLL];
      }
      else {
        [(MNGuidanceManager *)self _markEventSpoken:v5];
      }
    }
    BOOL v3 = 1;
  }

  return v3;
}

- (BOOL)_considerChargingAnnouncements
{
  if ([(MNGuidanceManager *)self currentLegIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = [(MNGuidanceManager *)self route];
    int v4 = [v3 isEVRoute];

    if (v4)
    {
      if (self->_shouldShowChargingInfo
        || ([(MNGuidanceManager *)self delegate],
            id v5 = objc_claimAutoreleasedReturnValue(),
            int v6 = [v5 navigationState],
            v5,
            v6 == 7))
      {
        double v7 = [(MNGuidanceManager *)self _specialSpokenEvents:14 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
        BOOL v8 = [v7 firstObject];

        if (![(MNGuidanceManager *)self _eventWasSpoken:v8])
        {
          if (self->_shouldShowChargingInfo)
          {
            if (v8)
            {
              [(MNGuidanceManager *)self _notifySpeechEvent:v8 waypointCategory:0 startingVariantIndex:0x7FFFFFFFFFFFFFFFLL];
              goto LABEL_9;
            }
          }
          else
          {
            int v10 = [(MNGuidanceManager *)self delegate];
            int v11 = [v10 navigationState];

            if (v11 != 7)
            {
              long long v12 = [(MNGuidanceManager *)self _specialSpokenEvents:13 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
              int v13 = [v12 firstObject];

              if (v13 && ![(MNGuidanceManager *)self _eventWasSpoken:v13])
              {
                [(MNGuidanceManager *)self _notifySpeechEvent:v13 waypointCategory:0 startingVariantIndex:0x7FFFFFFFFFFFFFFFLL];

                goto LABEL_9;
              }
            }
          }
          BOOL v9 = 0;
          goto LABEL_16;
        }
LABEL_9:
        BOOL v9 = 1;
LABEL_16:

        return v9;
      }
    }
  }
  return 0;
}

- (BOOL)_considerArrivalAnnouncements
{
  if ([(MNGuidanceManager *)self currentLegIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_isInPreArrivalState || (BOOL v3 = [(MNGuidanceManager *)self _isInArrivalState]))
  {
    if ([(MNGuidanceManager *)self _isInArrivalState]) {
      uint64_t v4 = 11;
    }
    else {
      uint64_t v4 = 12;
    }
    id v5 = [(MNGuidanceManager *)self _specialSpokenEvents:v4 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
    int v6 = [v5 firstObject];

    if (v6 && ![(MNGuidanceManager *)self _eventWasSpoken:v6])
    {
      double v7 = [(MNGuidanceManager *)self navigationSessionState];
      BOOL v8 = [v7 currentWaypoint];

      -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:", v6, [v8 waypointCategory], 0x7FFFFFFFFFFFFFFFLL);
    }

    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_considerOtherSpecialAnnouncements
{
  if ([(MNGuidanceManager *)self currentLegIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v4 = [(MNGuidanceManager *)self delegate];
  unsigned int v5 = [v4 navigationState];

  if (v5 > 8) {
    return 0;
  }
  BOOL result = 1;
  if (((1 << v5) & 0x161) != 0) {
    return result;
  }
  if (((1 << v5) & 0x1A) == 0)
  {
    *(_WORD *)&self->_hasBeenOnRouteOnce = 257;
    return 0;
  }
  int v6 = [(MNGuidanceManager *)self _specialSpokenEvents:3 forLegIndex:[(MNGuidanceManager *)self currentLegIndex]];
  double v7 = [v6 firstObject];

  if (v7 && self->_hasBeenOnRouteOnce && self->_canSpeakReturnToRouteAnnouncement)
  {
    [(MNGuidanceManager *)self _notifySpeechEvent:v7 waypointCategory:0 startingVariantIndex:0x7FFFFFFFFFFFFFFFLL];
    self->_canSpeakReturnToRouteAnnouncement = 0;
  }

  return 1;
}

- (void)_planAnnouncements
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[MNTimeManager currentDate];
  double v4 = COERCE_DOUBLE(objc_alloc_init(MEMORY[0x1E4F1CA48]));
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  unsigned int v5 = self->_validEvents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v90;
    v75 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v90 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        int v11 = [v10 announcements];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          [v10 repetitionInterval];
          if (v13 > 0.0 && [(MNGuidanceManager *)self _eventWasSpoken:v10])
          {
            announcementsSpoken = self->_announcementsSpoken;
            id v15 = [v10 uniqueID];
            uint64_t v16 = [(NSMutableDictionary *)announcementsSpoken objectForKeyedSubscript:v15];

            [v3 timeIntervalSinceDate:v16];
            double v18 = v17;
            [v10 repetitionInterval];
            if (v18 >= v19)
            {
              unint64_t v20 = self->_announcementsSpoken;
              [v10 uniqueID];
              unint64_t v21 = self;
              double v22 = v4;
              long long v24 = v23 = v3;
              [(NSMutableDictionary *)v20 removeObjectForKey:v24];

              BOOL v3 = v23;
              double v4 = v22;
              self = v21;
              unsigned int v5 = v75;
            }
          }
          if (![(MNGuidanceManager *)self _eventWasSpoken:v10]) {
            [*(id *)&v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v89 objects:v100 count:16];
    }
    while (v7);
  }

  double v25 = [(MNGuidanceManager *)self _spokenEventsRemainingInStep];
  if ([*(id *)&v4 count]
    || [*(id *)&v25 count]
    && ([(MNGuidanceManager *)self timeUntilNextAnnouncement], v72 == 1.79769313e308))
  {
    uint64_t v26 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      double v96 = v4;
      _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_DEBUG, "ⓖ Valid spoken events : %{private}@", buf, 0xCu);
    }
    v76 = v3;

    uint64_t v27 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      double v96 = v25;
      _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_DEBUG, "ⓖ Remaining events : %{private}@", buf, 0xCu);
    }

    long long v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)&v25, "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    double v74 = v25;
    id v29 = *(id *)&v25;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v99 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v86 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v34 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          long long v35 = [(MNGuidanceManager *)self _durationsForEvent:v34];
          long long v36 = [v34 uniqueID];
          [v28 setObject:v35 forKey:v36];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v85 objects:v99 count:16];
      }
      while (v31);
    }

    double Current = CFAbsoluteTimeGetCurrent();
    announcementEngine = self->_announcementEngine;
    [(MNGuidanceManager *)self _distanceToEndOfRoute];
    double v40 = v39;
    double speed = self->_speed;
    lastAnnouncementEvent = self->_lastAnnouncementEvent;
    [(MNGuidanceManager *)self timeSinceLastAnnouncement];
    [(MNAnnouncementEngine *)announcementEngine planForEvents:v29 distance:lastAnnouncementEvent speed:v28 previousEvent:v40 timeSinceLastEvent:speed durations:v43];
    double v44 = CFAbsoluteTimeGetCurrent();
    id v45 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      long long v46 = [(MNAnnouncementEngine *)self->_announcementEngine plan];
      *(_DWORD *)buf = 134218243;
      double v96 = (v44 - Current) * 1000.0;
      __int16 v97 = 2113;
      v98 = v46;
      _os_log_impl(&dword_1B542B000, v45, OS_LOG_TYPE_DEBUG, "ⓖ Planned announcements in %.2fms : %{private}@", buf, 0x16u);
    }
    long long v47 = [(MNAnnouncementEngine *)self->_announcementEngine nextEvent];
    long long v48 = v47;
    if (v47)
    {
      long long v49 = [v47 event];
      int v50 = [*(id *)&v4 containsObject:v49];

      if (v50)
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v51 = [(MNAnnouncementEngine *)self->_announcementEngine plan];
        v52 = [v51 plannedEvents];

        uint64_t v53 = [v52 countByEnumeratingWithState:&v81 objects:v94 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v82;
LABEL_34:
          uint64_t v56 = 0;
          while (1)
          {
            if (*(void *)v82 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v81 + 1) + 8 * v56);
            if (v57 == v48) {
              break;
            }
            if (([*(id *)(*((void *)&v81 + 1) + 8 * v56) includeInPlan] & 1) == 0)
            {
              v58 = [v57 event];
              [(MNGuidanceManager *)self _markEventSpoken:v58];
            }
            if (v54 == ++v56)
            {
              uint64_t v54 = [v52 countByEnumeratingWithState:&v81 objects:v94 count:16];
              if (v54) {
                goto LABEL_34;
              }
              break;
            }
          }
        }

        v59 = [v48 event];
        -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:", v59, 0, [v48 variantIndex]);
      }
    }
    v73 = v48;
    nextEvent = self->_nextEvent;
    self->_nextEvent = 0;

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v61 = [(MNAnnouncementEngine *)self->_announcementEngine plan];
    v62 = [v61 plannedEvents];

    uint64_t v63 = [v62 countByEnumeratingWithState:&v77 objects:v93 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v78;
      while (2)
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v78 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          if ([v67 includeInPlan])
          {
            v68 = [v67 event];
            BOOL v69 = [(MNGuidanceManager *)self _eventWasSpoken:v68];

            if (!v69)
            {
              v70 = [v67 event];
              v71 = self->_nextEvent;
              self->_nextEvent = v70;

              goto LABEL_54;
            }
          }
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v77 objects:v93 count:16];
        if (v64) {
          continue;
        }
        break;
      }
    }
LABEL_54:

    double v25 = v74;
    BOOL v3 = v76;
  }
}

- (id)_spokenEventsRemainingInStep
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MNLocation *)self->_location routeMatch];
  double v4 = [v3 step];
  [v4 endRouteCoordinate];

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unsigned int v5 = [(MNGuidanceManager *)self events];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v11 = [v10 announcements];
        if ([v11 count]) {
          BOOL v12 = [(MNGuidanceManager *)self _eventWasSpoken:v10];
        }
        else {
          BOOL v12 = 1;
        }

        double v13 = [(MNLocation *)self->_location routeMatch];
        [v13 routeCoordinate];
        [v10 endValidRouteCoordinate];
        uint64_t v14 = GEOPolylineCoordinateCompare();

        [v10 startValidRouteCoordinate];
        uint64_t v15 = GEOPolylineCoordinateCompare();
        if (!v12 && v14 == -1 && v15 == -1 && ([v10 isSpecial] & 1) == 0)
        {
          [(MNLocation *)self->_location speed];
          if (objc_msgSend(v10, "isValidForSpeed:")) {
            [v18 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__MNGuidanceManager__spokenEventsRemainingInStep__block_invoke;
  v19[3] = &unk_1E60F7AB0;
  v19[4] = self;
  [v18 sortUsingComparator:v19];
  return v18;
}

uint64_t __49__MNGuidanceManager__spokenEventsRemainingInStep__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareFactoringInSpeed:speed:", *(double *)(*(void *)(a1 + 32) + 224));
}

- (void)_notifySpeechEvent:(id)a3 waypointCategory:(int)a4 startingVariantIndex:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(MNGuidanceManager *)self _markEventSpoken:v8];
  +[MNTimeManager currentTime];
  self->_timeLastAnnouncementStarted = v9;
  int v10 = [MNAnnouncementPlanEvent alloc];
  [(MNGuidanceManager *)self _distanceToEndOfRoute];
  double v12 = v11;
  double speed = self->_speed;
  uint64_t v14 = [(MNGuidanceManager *)self _durationsForEvent:v8];
  uint64_t v15 = [(MNAnnouncementPlanEvent *)v10 initWithEvent:v8 distance:v14 speed:v12 durations:speed];
  lastAnnouncementEvent = self->_lastAnnouncementEvent;
  self->_lastAnnouncementEvent = v15;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v17 = [(MNGuidanceManager *)self _spokenStringForEvent:v8 waypointCategory:v6];
    id v18 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v8 composedGuidanceEventType];
      if (v19 >= 0xF)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
        long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v20 = off_1E60F7CC0[(int)v19];
      }
      long long v24 = v20;
      if (v6 >= 0xE)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v25 = off_1E60F7C08[(int)v6];
      }
      *(_DWORD *)buf = 138412803;
      *(void *)uint64_t v37 = v24;
      *(_WORD *)&v37[8] = 2112;
      *(void *)&v37[10] = v25;
      __int16 v38 = 2113;
      double v39 = v17;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "ⓖ Requesting announcement with event type (%@) and waypoint category (%@): %{private}@", buf, 0x20u);
    }
    uint64_t v26 = [v8 spokenStrings];
    [v26 count];

    long long v23 = self->_lastAnnouncementEvent;
    uint64_t v22 = 0;
  }
  else
  {
    [(MNGuidanceManager *)self _timeRemainingForEvent:v8];
    uint64_t v34 = 0;
    double v17 = -[MNGuidanceManager _selectAnnouncementForEvent:withTimeRemaining:selectedVariantIndex:](self, "_selectAnnouncementForEvent:withTimeRemaining:selectedVariantIndex:", v8, &v34);
    long long v21 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      *(_DWORD *)uint64_t v37 = v34;
      *(_WORD *)&v37[4] = 2113;
      *(void *)&v37[6] = v17;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_DEFAULT, "ⓖ Requesting announcement with variant index (%d): %{private}@", buf, 0x12u);
    }

    uint64_t v22 = v34;
    long long v23 = self->_lastAnnouncementEvent;
  }
  [(MNAnnouncementPlanEvent *)v23 setVariantIndex:v22];
  id v35 = v8;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:v27 previousEvents:0];

  long long v28 = [(MNGuidanceManager *)self delegate];
  [v28 guidanceManager:self willProcessSpeechEvent:v8];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __78__MNGuidanceManager__notifySpeechEvent_waypointCategory_startingVariantIndex___block_invoke;
  v32[3] = &unk_1E60F7AD8;
  v32[4] = self;
  id v33 = v8;
  id v29 = v8;
  uint64_t v30 = (void *)MEMORY[0x1BA99B3A0](v32);
  uint64_t v31 = [(MNGuidanceManager *)self delegate];
  objc_msgSend(v31, "guidanceManager:announce:isImportant:shortPromptType:stage:completionBlock:", self, v17, objc_msgSend(v29, "isImportant"), MNInstructionsShortPromptTypeForManeuver(objc_msgSend(v29, "maneuverType"), objc_msgSend(v29, "drivingSide")), -[MNGuidanceManager _announcementStageForEvent:](self, "_announcementStageForEvent:", v29), v30);
}

void __78__MNGuidanceManager__notifySpeechEvent_waypointCategory_startingVariantIndex___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  +[MNTimeManager currentTime];
  *(void *)(*(void *)(a1 + 32) + 112) = v4;
  if (a2 < 9)
  {
    unsigned int v5 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = off_1E60F7C78[a2];
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v6;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "⒢ Announcement not spoken, MNAudioCompletionStatus code=%@", buf, 0xCu);
    }
    double v17 = *(void **)(*(void *)(a1 + 32) + 240);
    id v18 = [*(id *)(a1 + 40) uniqueID];
    uint64_t v16 = [v17 objectForKeyedSubscript:v18];

    if (!v16) {
      goto LABEL_15;
    }
    [v16 startTime];
    objc_msgSend(v16, "setEndTime:");
LABEL_14:
    uint64_t v19 = [*(id *)(a1 + 32) delegate];
    [v19 guidanceManager:*(void *)(a1 + 32) updatedGuidanceEventFeedback:v16];

LABEL_15:
    goto LABEL_16;
  }
  if (a2 - 9 < 2)
  {
    uint64_t v7 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (a2 == 10) {
        id v8 = "sound effect";
      }
      else {
        id v8 = "speech";
      }
      double v9 = *(double **)(a1 + 32);
      double v10 = v9[14] - v9[13];
      double v11 = [v9 route];
      double v12 = [*(id *)(*(void *)(a1 + 32) + 216) routeMatch];
      objc_msgSend(v11, "stepDistanceFromPoint:toPoint:", objc_msgSend(v12, "routeCoordinate"), objc_msgSend(*(id *)(a1 + 40), "endValidRouteCoordinate"));
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = (void *)v8;
      __int16 v23 = 2048;
      double v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓖ Finished %s announcement in %.2f seconds, with %.2f meters to go", buf, 0x20u);
    }
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 240);
    uint64_t v15 = [*(id *)(a1 + 40) uniqueID];
    uint64_t v16 = [v14 objectForKeyedSubscript:v15];

    if (!v16) {
      goto LABEL_15;
    }
    [v16 setEndTime:CFAbsoluteTimeGetCurrent()];
    [*(id *)(a1 + 32) _distanceToManeuverStart];
    objc_msgSend(v16, "setEndDistance:");
    goto LABEL_14;
  }
LABEL_16:
  long long v20 = [*(id *)(a1 + 32) delegate];
  [v20 guidanceManager:*(void *)(a1 + 32) didProcessSpeechEvent:*(void *)(a1 + 40)];
}

- (unint64_t)_announcementStageForEvent:(id)a3
{
  id v3 = a3;
  if ([v3 hasSpokenGuidance])
  {
    uint64_t v4 = [v3 composedGuidanceEventType] - 4;
    if (v4 <= 4) {
      unint64_t v5 = v4 + 1;
    }
    else {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_spokenStringForEvent:(id)a3 waypointCategory:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 spokenStrings];
  if ([v7 count])
  {
    id v8 = [v7 firstObject];
    unint64_t v9 = [v7 count];
    if (v4 && v9 >= 2)
    {
      double v10 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v6 composedGuidanceEventType];
        if (v11 >= 0xF)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
          double v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v12 = off_1E60F7CC0[(int)v11];
        }
        uint64_t v13 = v12;
        if (v4 >= 0xE)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
          uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v14 = off_1E60F7D38[(int)v4 - 1];
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v13;
        __int16 v27 = 2112;
        long long v28 = v14;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Requested announcement from event (%@) with a waypoint category of (%@), but there are multiple spoken variants. This probably means Routing is still sending the old style variant lists for this event.", buf, 0x16u);
      }
      if ([v7 count] <= (unint64_t)(int)v4) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = (int)v4;
      }
      uint64_t v16 = [v7 objectAtIndexedSubscript:v15];

      id v8 = (__CFString *)v16;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__MNGuidanceManager__spokenStringForEvent_waypointCategory___block_invoke;
    v23[3] = &unk_1E60F7B00;
    v23[4] = self;
    id v24 = v6;
    double v17 = [(__CFString *)v8 optionsWithArgumentHandler:v23];
    id v18 = [(__CFString *)v8 stringResultWithOptions:v17];
    if (([v18 success] & 1) == 0)
    {
      uint64_t v19 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        long long v20 = [v18 string];
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        long long v28 = v8;
        _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_FAULT, "ⓖ Error building spoken string, probably because some arguments were not handled.\nResult: %@\nOriginal string: %@", buf, 0x16u);
      }
    }
    long long v21 = [v18 string];
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

uint64_t __60__MNGuidanceManager__spokenStringForEvent_waypointCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateSpokenStringArgument:a2 event:*(void *)(a1 + 40)];
}

- (id)_selectAnnouncementForEvent:(id)a3 withTimeRemaining:(double)a4 selectedVariantIndex:(unint64_t *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 spokenStrings];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    double v10 = 0;
    unint64_t v11 = 0;
    if (a4 == 1.79769313e308) {
      double v12 = -1.0;
    }
    else {
      double v12 = a4;
    }
    do
    {
      uint64_t v13 = [v7 spokenStrings];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v11];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __88__MNGuidanceManager__selectAnnouncementForEvent_withTimeRemaining_selectedVariantIndex___block_invoke;
      v39[3] = &unk_1E60F7B00;
      v39[4] = self;
      id v15 = v7;
      id v40 = v15;
      uint64_t v16 = [v14 optionsWithArgumentHandler:v39];
      double v17 = [v14 stringResultWithOptions:v16];
      if ([v17 success])
      {
        uint64_t v18 = [v17 string];

        [(MNAudioManager *)self->_audioManager durationOf:v18];
        double v20 = v19;
        long long v21 = MNGetMNGuidanceManagerLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v42 = v11;
          *(_WORD *)&v42[4] = 2048;
          *(double *)&v42[6] = v20;
          *(_WORD *)&v42[14] = 2048;
          *(double *)&v42[16] = v12;
          _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_DEBUG, "ⓖ Considering announcement %d with duration %.1f, time remaining %.1f", buf, 0x1Cu);
        }

        BOOL v22 = v20 <= a4;
        double v10 = (void *)v18;
      }
      else
      {
        __int16 v23 = MNGetMNGuidanceManagerLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          id v24 = [v17 string];
          *(_DWORD *)buf = 138412546;
          *(void *)v42 = v24;
          *(_WORD *)&v42[8] = 2112;
          *(void *)&v42[10] = v14;
          _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_FAULT, "ⓖ Error building spoken string, probably because some arguments were not handled.\nResult: %@\nOriginal string: %@", buf, 0x16u);
        }
        BOOL v22 = 0;
      }

      if (v22) {
        break;
      }
      ++v11;
      __int16 v25 = [v15 spokenStrings];
      unint64_t v26 = [v25 count];
    }
    while (v11 < v26);
  }
  else
  {
    unint64_t v11 = 0;
    double v10 = 0;
  }
  __int16 v27 = [v7 spokenStrings];
  unint64_t v28 = [v27 count];

  if (v11 >= v28)
  {
    uint64_t v32 = [v7 spokenStrings];
    unint64_t v11 = [v32 count] - 1;

    uint64_t v29 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v42 = v11;
      _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEBUG, "ⓖ Selected announcement %d (not short enough)", buf, 8u);
    }
  }
  else
  {
    uint64_t v29 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = [v7 announcements];
      int v31 = [v30 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v42 = v11;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v31;
      _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEBUG, "ⓖ Selected announcement %d (%d variant(s))", buf, 0xEu);
    }
  }

  *a5 = v11;
  id v33 = [v7 spokenStrings];
  uint64_t v34 = [v33 objectAtIndexedSubscript:v11];
  int v35 = [v34 isPrivate];

  if (v35)
  {
    uint64_t v36 = objc_msgSend(v10, "_navigation_stringByMarkingAsPrivateText");

    double v10 = (void *)v36;
  }

  return v10;
}

uint64_t __88__MNGuidanceManager__selectAnnouncementForEvent_withTimeRemaining_selectedVariantIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateSpokenStringArgument:a2 event:*(void *)(a1 + 40)];
}

- (BOOL)_updateSpokenStringArgument:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 type];
  BOOL v9 = 0;
  if (v8 > 9)
  {
    switch(v8)
    {
      case 10:
        id v24 = [(MNGuidanceManager *)self route];
        __int16 v25 = [v24 legs];
        unint64_t v26 = objc_msgSend(v25, "objectAtIndexedSubscript:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
        uint64_t v14 = [v26 destination];

        __int16 v27 = [v6 token];
        LODWORD(v25) = [v27 isEqualToString:@"{Name}"];

        if (v25)
        {
          uint64_t v28 = [v14 navAnnouncementName];
        }
        else
        {
          uint64_t v36 = [v6 token];
          int v37 = [v36 isEqualToString:@"{Address}"];

          if (!v37)
          {
LABEL_22:

            goto LABEL_27;
          }
          uint64_t v28 = [v14 navAnnouncementAddress];
        }
        double v17 = (void *)v28;
        __int16 v38 = [v6 stringFormat];
        [v38 setOverrideValue:v17];

LABEL_21:
        goto LABEL_22;
      case 13:
        uint64_t v29 = [v6 token];
        int v30 = [v29 isEqualToString:@"{ChargePercentage}"];

        if (v30)
        {
          int v31 = [(MNGuidanceManager *)self route];
          uint64_t v32 = [v31 mutableData];
          uint64_t v14 = objc_msgSend(v32, "chargingStationInfoForLegIndex:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));

          [v14 batteryPercentageAfterCharging];
          float v34 = v33;
          double v17 = [v6 percentageFormat];
          *(float *)&double v35 = v34;
          [v17 setOverrideValue:v35];
          goto LABEL_21;
        }
        goto LABEL_27;
      case 18:
        uint64_t v18 = [v6 substitutionFormat];
        double v19 = [(MNGuidanceManager *)self route];
        double v20 = [v19 waypoints];

        unint64_t v21 = [v18 waypointIndex];
        if (v21 >= [v20 count]) {
          [v20 lastObject];
        }
        else {
        double v39 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v18, "waypointIndex"));
        }
        uint64_t v40 = [v39 waypointCategory];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __55__MNGuidanceManager__updateSpokenStringArgument_event___block_invoke;
        v43[3] = &unk_1E60F7B28;
        id v44 = v39;
        id v41 = v39;
        [v18 setSubstitutionForWaypointCategory:v40 handler:v43];

        goto LABEL_25;
    }
  }
  else
  {
    if ((v8 - 3) < 2)
    {
      double v10 = [v6 token];
      int v11 = [v10 isEqualToString:@"{ChargeDuration}"];

      if (v11)
      {
        double v12 = [(MNGuidanceManager *)self route];
        uint64_t v13 = [v12 mutableData];
        uint64_t v14 = objc_msgSend(v13, "chargingStationInfoForLegIndex:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));

        [v14 chargingTime];
        double v16 = v15;
        double v17 = [v6 durationFormat];
        [v17 setOverrideValue:v16];
        goto LABEL_21;
      }
LABEL_27:
      BOOL v9 = 1;
      goto LABEL_28;
    }
    if (v8 == 1)
    {
      uint64_t v18 = [v6 distanceFormat];
      [v18 setFormatOptions:28];
      if ([v7 isSpecial]) {
        goto LABEL_26;
      }
      BOOL v22 = [v6 token];
      int v23 = [v22 isEqualToString:@"{distance}"];

      if (!v23) {
        goto LABEL_26;
      }
      -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v7 coordinateForDistanceStrings]);
      double v20 = objc_msgSend(MEMORY[0x1E4F28E28], "_geo_distanceMeasurementForMeters:");
      [v18 setOverrideValue:v20];
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
  }
LABEL_28:

  return v9;
}

id __55__MNGuidanceManager__updateSpokenStringArgument_event___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 32) bestSpokenName];
    if (!v7) {
      goto LABEL_5;
    }
    int v8 = [*(id *)(a1 + 32) bestSpokenName];
    BOOL v9 = [v6 firstObject];
    double v10 = [v9 stringFormat];
    [v10 setOverrideValue:v8];
  }
  id v7 = v5;
LABEL_5:

  return v7;
}

- (id)_serverStringDictionaryForEvent:(id)a3 distance:(double)a4 validDistance:(double)a5 spoken:(BOOL)a6 waypoints:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a7;
  if ([(MNGuidanceManager *)self _isEVChargingEvent:v12])
  {
    uint64_t v14 = [(MNGuidanceManager *)self _serverStringDictionaryForChargingEvent:v12];
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F1C9E8];
    double v16 = [(MNGuidanceManager *)self navigationSessionState];
    double v17 = [v16 currentWaypoint];
    uint64_t v14 = objc_msgSend(v15, "_navigation_serverStringDictionaryForDistance:validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:", v13, v17, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"), v8, objc_msgSend(v12, "hasArGuidance"), a4, a5);
  }
  return v14;
}

- (id)_serverStringDictionaryForChargingEvent:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(MNGuidanceManager *)self route];
  id v5 = [v4 mutableData];
  id v6 = objc_msgSend(v5, "chargingStationInfoForLegIndex:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));

  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v6 chargingTime];
  BOOL v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v7 setObject:v8 forKeyedSubscript:@"{ChargeDuration}"];

  [v6 batteryPercentageAfterCharging];
  BOOL v9 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v7 setObject:v9 forKeyedSubscript:@"{ChargePercentage}"];

  id v12 = @"{fromOrigin}";
  v13[0] = v7;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v10;
}

- (id)_durationsForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 spokenStrings];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MNGuidanceManager__durationsForEvent___block_invoke;
  v9[3] = &unk_1E60F7B50;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "_geo_map:", v9);

  return v7;
}

id __40__MNGuidanceManager__durationsForEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __40__MNGuidanceManager__durationsForEvent___block_invoke_2;
  id v13 = &unk_1E60F7B00;
  id v4 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v4;
  id v5 = a2;
  id v6 = [v5 optionsWithArgumentHandler:&v10];
  id v7 = objc_msgSend(v5, "stringWithOptions:", v6, v10, v11, v12, v13, v14);

  [*(id *)(*(void *)(a1 + 32) + 8) durationOf:v7];
  BOOL v8 = objc_msgSend(NSNumber, "numberWithDouble:");

  return v8;
}

uint64_t __40__MNGuidanceManager__durationsForEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateSpokenStringArgument:a2 event:*(void *)(a1 + 40)];
}

- (void)_considerHaptics
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(MNAnnouncementPlanEvent *)self->_lastAnnouncementEvent event];
  if ([v3 hasHaptics])
  {
    hapticsTriggered = self->_hapticsTriggered;
    id v5 = [(MNAnnouncementPlanEvent *)self->_lastAnnouncementEvent event];
    id v6 = [v5 uniqueID];
    id v7 = [(NSMutableDictionary *)hapticsTriggered objectForKey:v6];

    if (!v7)
    {
      BOOL v8 = [(MNAnnouncementPlanEvent *)self->_lastAnnouncementEvent event];
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v8 = 0;
LABEL_6:
  if (self->_nextEvent)
  {
    [(MNGuidanceManager *)self timeUntilNextAnnouncement];
    double v10 = v9;
    if (!v8 && [(GEOComposedGuidanceEvent *)self->_nextEvent hasHaptics] && v10 <= 2.0) {
      BOOL v8 = self->_nextEvent;
    }
    if ([(GEOComposedGuidanceEvent *)self->_nextEvent hasHaptics]) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 3;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained guidanceManager:self willAnnounce:v11 inSeconds:v10];
  }
  if (v8)
  {
    id v13 = self->_hapticsTriggered;
    uint64_t v14 = [(GEOComposedGuidanceEvent *)v8 uniqueID];
    id v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

    if (!v15)
    {
      double v16 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        BOOL v22 = v8;
        _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_INFO, "ⓖ Triggering haptics: %@", (uint8_t *)&v21, 0xCu);
      }

      double v17 = +[MNTimeManager currentDate];
      uint64_t v18 = self->_hapticsTriggered;
      double v19 = [(GEOComposedGuidanceEvent *)v8 uniqueID];
      [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "guidanceManager:triggerHaptics:", self, -[GEOComposedGuidanceEvent maneuverType](v8, "maneuverType"));
    }
  }
}

- (void)_considerLaneGuidance
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MNGuidanceManager *)self _nextLaneGuidanceEvent];
  id v4 = v3;
  if (v3)
  {
    -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v3 coordinateForDistanceStrings]);
    double v6 = v5;
    -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v4 endValidRouteCoordinate]);
    double v8 = v7;
    double v9 = [(MNGuidanceManager *)self navigationSessionState];
    double v10 = [v9 currentWaypoint];
    v42[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    int v37 = [(MNGuidanceManager *)self _serverStringDictionaryForEvent:v4 distance:0 validDistance:v11 spoken:v6 waypoints:v8];

    id v12 = [v4 uniqueID];
    LODWORD(v11) = [(MNGuidanceManager *)self _indexForEventUUID:v12];

    id v13 = [MNGuidanceLaneInfo alloc];
    uint64_t v14 = [v4 uniqueID];
    uint64_t v15 = [v4 isLaneGuidanceForManeuver];
    double v16 = [v4 lanes];
    double v17 = [v4 laneTitles];
    uint64_t v18 = [v4 laneInstructions];
    double v19 = [v37 objectForKeyedSubscript:@"{fromOrigin}"];
    LODWORD(v36) = v11;
    id v20 = [(MNGuidanceLaneInfo *)v13 initWithID:v14 isForManeuver:v15 lanes:v16 titles:v17 instructions:v18 variableOverrides:v19 distanceDetailLevel:0 composedGuidanceEventIndex:v36];

    int v21 = [v4 primaryLaneStrings];
    BOOL v22 = [(MNGuidanceManager *)self _evaluatedStringsForEvent:v4 signStrings:v21 shouldUpdateFormatStrings:1 argumentHandler:0];
    [(MNGuidanceLaneInfo *)v20 setPrimaryStrings:v22];

    uint64_t v23 = [v4 secondaryLaneStrings];
    id v24 = [(MNGuidanceManager *)self _evaluatedStringsForEvent:v4 signStrings:v23 shouldUpdateFormatStrings:1 argumentHandler:0];
    [(MNGuidanceLaneInfo *)v20 setSecondaryStrings:v24];

    if (self->_currentLaneGuidanceEvent)
    {
      if (!self->_isInPreArrivalState)
      {
        __int16 v25 = MNGetMNGuidanceManagerLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = (GEOComposedGuidanceEvent *)v4;
          unint64_t v26 = "ⓖ Replacing lane guidance with: %@";
LABEL_14:
          _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (!self->_isInPreArrivalState)
    {
      __int16 v25 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = (GEOComposedGuidanceEvent *)v4;
        unint64_t v26 = "ⓖ Adding lane guidance: %@";
        goto LABEL_14;
      }
LABEL_15:

      objc_storeStrong((id *)&self->_currentLaneGuidanceEvent, v4);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained guidanceManager:self showLaneDirections:v20];
    }
    double v39 = v4;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    goto LABEL_17;
  }
  if (self->_currentLaneGuidanceEvent)
  {
    __int16 v27 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      currentLaneGuidanceEvent = self->_currentLaneGuidanceEvent;
      *(_DWORD *)buf = 138412290;
      id v41 = currentLaneGuidanceEvent;
      _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_INFO, "ⓖ Removing lane guidance: %@", buf, 0xCu);
    }

    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    int v30 = [(GEOComposedGuidanceEvent *)self->_currentLaneGuidanceEvent uniqueID];
    [v29 guidanceManager:self hideLaneDirectionsForId:v30];

    int v31 = self->_currentLaneGuidanceEvent;
    self->_currentLaneGuidanceEvent = 0;
  }
  id v20 = 0;
  uint64_t v32 = 0;
LABEL_17:
  if (!self->_previousLaneGuidanceEvent)
  {
    [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:v32 previousEvents:0];
    if (!v4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  previousLaneGuidanceEvent = self->_previousLaneGuidanceEvent;
  float v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&previousLaneGuidanceEvent count:1];
  [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:v32 previousEvents:v34];

  if (v4) {
LABEL_19:
  }

LABEL_20:
  double v35 = self->_previousLaneGuidanceEvent;
  self->_previousLaneGuidanceEvent = (GEOComposedGuidanceEvent *)v4;
}

- (id)_nextLaneGuidanceEvent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_validEvents;
  id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        double v7 = objc_msgSend(v6, "lanes", (void)v10);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_considerSignGuidance
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v29 = 0;
  id v3 = [(MNGuidanceManager *)self _validEventsForSignGuidance:&v29];
  if ([v3 count])
  {
    uint64_t v4 = [(MNGuidanceManager *)self _sortedSignEventsFromValidSignEvents:v3];
    if (![v4 count])
    {
LABEL_16:

      goto LABEL_17;
    }
    __int16 v25 = v3;
    double v5 = [(MNGuidanceSignInfo *)self->_signInfo primarySign];
    uint64_t v6 = [v5 uniqueID];

    double v7 = [(MNGuidanceSignInfo *)self->_signInfo secondarySign];
    unint64_t v26 = [v7 uniqueID];

    double v28 = 0.0;
    if ([v4 count])
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:0];
      uint64_t v9 = [v8 stepIndex];
      long long v10 = [(MNGuidanceManager *)self _signForGuidanceEvent:v8 isPrimary:1 shouldOverridePrimaryDistances:v29 distance:&v28];
    }
    else
    {
      long long v10 = 0;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    double v27 = 0.0;
    long long v11 = 0;
    long long v12 = (void *)v6;
    if ((unint64_t)[v4 count] >= 2)
    {
      long long v13 = [v4 objectAtIndexedSubscript:1];
      long long v11 = [(MNGuidanceManager *)self _signForGuidanceEvent:v13 isPrimary:0 shouldOverridePrimaryDistances:v29 distance:&v27];
    }
    uint64_t v14 = [MNGuidanceSignInfo alloc];
    uint64_t v15 = [(MNGuidanceSignInfo *)v14 initWithPrimarySign:v10 secondarySign:v11 stepIndex:v9 primaryDistance:v28 secondaryDistance:v27 timeUntilPrimarySign:v28 / self->_speed timeUntilSecondarySign:v27 / self->_speed];
    signInfo = self->_signInfo;
    self->_signInfo = v15;

    double v17 = [(MNGuidanceSignInfo *)self->_signInfo primarySign];
    uint64_t v18 = [v17 uniqueID];
    if (+[MNComparison isValue:v6 equalTo:v18])
    {
      double v19 = [(MNGuidanceSignInfo *)self->_signInfo secondarySign];
      id v20 = [v19 uniqueID];
      BOOL v21 = +[MNComparison isValue:v26 equalTo:v20];

      long long v12 = (void *)v6;
      id v3 = v25;
      if (v21)
      {
LABEL_15:
        [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:v4 previousEvents:self->_previousSignEvents];
        objc_storeStrong((id *)&self->_previousSignEvents, v4);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained guidanceManager:self updateSignsWithInfo:self->_signInfo];

        goto LABEL_16;
      }
    }
    else
    {

      id v3 = v25;
    }
    BOOL v22 = MNGetMNGuidanceManagerLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = self->_signInfo;
      *(_DWORD *)buf = 138412290;
      int v31 = v23;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_INFO, "ⓖ New sign guidance: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
LABEL_17:
}

- (id)_validEventsForSignGuidance:(BOOL *)a3
{
  double v5 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    *a3 = 0;
    uint64_t v6 = [(MNGuidanceManager *)self delegate];
    int v7 = [v6 navigationState];

    switch(v7)
    {
      case 1:
      case 8:
        if (!self->_isInPreArrivalState)
        {
          uint64_t v8 = [(MNGuidanceManager *)self _specialSignEvents:1 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
          uint64_t v9 = v8;
          if (!self->_hasBeenOnRouteOnce && [v8 count])
          {
            [(NSMutableArray *)v5 addObjectsFromArray:v9];
            goto LABEL_16;
          }
          long long v10 = [(MNGuidanceManager *)self _specialSignEvents:3 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
          long long v11 = [v10 firstObject];

          if (v11)
          {
            [(NSMutableArray *)v5 addObject:v11];
            *a3 = 1;
          }

          goto LABEL_17;
        }
        break;
      case 2:
        if (!self->_isInPreArrivalState && !self->_shouldShowChargingInfo)
        {
          self->_hasBeenOnRouteOnce = 1;
          uint64_t v9 = v5;
          double v5 = self->_validEvents;
          goto LABEL_17;
        }
        break;
      case 3:
        if (!self->_isInPreArrivalState)
        {
          long long v12 = [(MNGuidanceManager *)self _specialSignEvents:3 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
          uint64_t v9 = [v12 firstObject];

          if (v9)
          {
            [(NSMutableArray *)v5 addObject:v9];
LABEL_16:
            *a3 = 1;
          }
LABEL_17:
        }
        break;
      default:
        break;
    }
    if (self->_shouldShowChargingInfo)
    {
      uint64_t v13 = 14;
    }
    else
    {
      uint64_t v14 = [(MNGuidanceManager *)self delegate];
      int v15 = [v14 navigationState];

      if (v15 != 7) {
        goto LABEL_27;
      }
      if (self->_shouldShowChargingInfo) {
        uint64_t v13 = 14;
      }
      else {
        uint64_t v13 = 13;
      }
    }
    double v16 = [(MNGuidanceManager *)self _specialSignEvents:v13 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
    double v17 = [v16 firstObject];

    if (v17) {
      [(NSMutableArray *)v5 addObject:v17];
    }

LABEL_27:
    uint64_t v18 = [(MNGuidanceManager *)self delegate];
    if ([v18 navigationState] != 6)
    {
      double v19 = [(MNGuidanceManager *)self delegate];
      if ([v19 navigationState] != 7)
      {
        BOOL isInPreArrivalState = self->_isInPreArrivalState;

        if (!isInPreArrivalState) {
          goto LABEL_45;
        }
LABEL_31:
        id v20 = [(MNGuidanceManager *)self _specialSignEvents:12 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
        BOOL v21 = [v20 firstObject];

        BOOL v22 = [(MNGuidanceManager *)self _specialSignEvents:11 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
        uint64_t v23 = [v22 firstObject];

        if (v21)
        {
          BOOL v24 = [(NSArray *)self->_previousSignEvents containsObject:v21];
          __int16 v25 = v21;
          if (v24) {
            goto LABEL_43;
          }
          if (v23)
          {
            BOOL v26 = [(NSArray *)self->_previousSignEvents containsObject:v23];
            __int16 v25 = v23;
            if (!v26)
            {
              if (self->_isInPreArrivalState) {
                __int16 v25 = v21;
              }
              else {
                __int16 v25 = v23;
              }
            }
            goto LABEL_43;
          }
          __int16 v25 = v21;
          if (self->_isInPreArrivalState) {
LABEL_43:
          }
            [(NSMutableArray *)v5 addObject:v25];
        }
        else if (v23)
        {
          [(NSArray *)self->_previousSignEvents containsObject:v23];
          __int16 v25 = v23;
          goto LABEL_43;
        }

        goto LABEL_45;
      }
    }
    goto LABEL_31;
  }
LABEL_45:
  double v28 = v5;

  return v28;
}

- (id)_specialSignEvents:(int)a3 forLeg:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  specialSignEvents = self->_specialSignEvents;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v9 = [(NSMutableDictionary *)specialSignEvents objectForKeyedSubscript:v8];
  long long v10 = [NSNumber numberWithInt:v5];
  long long v11 = [v9 objectForKeyedSubscript:v10];

  uint64_t v12 = [v11 count];
  if (a4 && !v12)
  {
    uint64_t v13 = [(NSMutableDictionary *)self->_specialSignEvents objectForKeyedSubscript:&unk_1F0E35058];
    uint64_t v14 = [NSNumber numberWithInt:v5];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    long long v11 = (void *)v15;
  }
  return v11;
}

- (id)_sortedSignEventsFromValidSignEvents:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSignGuidance", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_19];
  return v4;
}

uint64_t __58__MNGuidanceManager__sortedSignEventsFromValidSignEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 stackRanking];
  if (v6 >= [v5 stackRanking])
  {
    unint64_t v8 = [v4 stackRanking];
    uint64_t v7 = v8 > [v5 stackRanking];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)_signForGuidanceEvent:(id)a3 isPrimary:(BOOL)a4 shouldOverridePrimaryDistances:(BOOL)a5 distance:(double *)a6
{
  BOOL v7 = a5;
  BOOL v53 = a4;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v54 = [v8 signDetails];
  uint64_t v9 = [v8 shieldInfo];

  if (v9)
  {
    long long v10 = [v8 shieldInfo];
    v51 = [v10 shield];

    long long v11 = [v8 shieldInfo];
    int v12 = [v11 shieldType];

    long long v13 = [v8 shieldInfo];
    int v50 = [v13 name];
  }
  else
  {
    int v50 = 0;
    v51 = 0;
    int v12 = 0;
  }
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v8 coordinateForDistanceStrings]);
  double v15 = fmax(v14, 0.0);
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v8 endValidRouteCoordinate]);
  double v17 = fmax(v16, 0.0);
  if (!v53) {
    goto LABEL_15;
  }
  if ([v8 composedGuidanceEventType] == 11
    || [v8 composedGuidanceEventType] == 12)
  {
    uint64_t v18 = [(MNGuidanceManager *)self navigationSessionState];
    double v19 = [v18 currentWaypoint];

    int v20 = [v19 waypointCategory];
    if ([v54 count] <= (unint64_t)v20)
    {
      if (![v54 count])
      {
LABEL_12:

        goto LABEL_13;
      }
      BOOL v21 = [v54 firstObject];
      v62 = v21;
      BOOL v22 = &v62;
    }
    else
    {
      BOOL v21 = [v54 objectAtIndexedSubscript:v20];
      v63[0] = v21;
      BOOL v22 = (void **)v63;
    }
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

    uint64_t v54 = (void *)v23;
    goto LABEL_12;
  }
LABEL_13:
  if (v7)
  {
    BOOL v24 = [(MNLocation *)self->_location routeMatch];
    [v24 distanceFromRoute];
    double v17 = v25;

    double v15 = v17;
  }
LABEL_15:
  *a6 = v15;
  BOOL v26 = [(MNGuidanceManager *)self navigationSessionState];
  double v27 = [v26 currentWaypoint];
  v61 = v27;
  double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  long long v49 = [(MNGuidanceManager *)self _serverStringDictionaryForEvent:v8 distance:0 validDistance:v28 spoken:v15 waypoints:v17];

  unsigned __int8 v29 = [v8 signTitles];
  if ([v29 count])
  {
  }
  else
  {
    BOOL v30 = [v54 count] == 0;

    if (v30)
    {
      double v39 = 0;
      goto LABEL_24;
    }
  }
  v52 = 0;
  BOOL v31 = [v8 transportType] == 2;
  uint64_t v57 = 0;
  v58 = (double *)&v57;
  uint64_t v59 = 0x2020000000;
  unint64_t v60 = 0xBFF0000000000000;
  if (v53)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __93__MNGuidanceManager__signForGuidanceEvent_isPrimary_shouldOverridePrimaryDistances_distance___block_invoke;
    v56[3] = &unk_1E60F7B98;
    v56[4] = &v57;
    *(double *)&v56[5] = v17;
    *(double *)&v56[6] = v15;
    v52 = (void *)MEMORY[0x1BA99B3A0](v56);
  }
  uint64_t v32 = [MNGuidanceSignDescription alloc];
  double v33 = [v8 uniqueID];
  float v34 = [v8 signTitles];
  double v35 = [v49 objectForKeyedSubscript:@"{fromOrigin}"];
  uint64_t v36 = [v8 maneuverJunction];
  int v37 = [v8 artworkOverride];
  __int16 v38 = [v8 uniqueID];
  LODWORD(v48) = [(MNGuidanceManager *)self _indexForEventUUID:v38];
  LODWORD(v47) = v12;
  double v39 = [(MNGuidanceSignDescription *)v32 initWithID:v33 titles:v34 details:v54 variableOverrides:v35 distanceDetailLevel:(2 * v31) junction:v36 artworkOverride:v37 shieldText:v51 shieldID:v47 shieldStringID:v50 composedGuidanceEventIndex:v48];

  uint64_t v40 = [v8 primarySignStrings];
  id v41 = [(MNGuidanceManager *)self _evaluatedStringsForEvent:v8 signStrings:v40 shouldUpdateFormatStrings:1 argumentHandler:v52];
  [(MNGuidanceSignDescription *)v39 setPrimaryStrings:v41];

  v42 = [v8 secondarySignStrings];
  uint64_t v43 = [(MNGuidanceManager *)self _evaluatedStringsForEvent:v8 signStrings:v42 shouldUpdateFormatStrings:1 argumentHandler:0];
  [(MNGuidanceSignDescription *)v39 setSecondaryStrings:v43];

  [(MNGuidanceSignDescription *)v39 setIsStaticText:v58[3] < 0.0];
  if (v53 && v58[3] >= 0.0)
  {
    -[MNGuidanceSignDescription setRemainingDistance:](v39, "setRemainingDistance:");
    id v44 = objc_msgSend(MEMORY[0x1E4F28E28], "_geo_distanceMeasurementForMeters:", v58[3]);
    id v45 = GEORoundedDistanceMeasurement();
    [(MNGuidanceSignDescription *)v39 setDisplayRemainingDistance:v45];
  }
  _Block_object_dispose(&v57, 8);
LABEL_24:

  return v39;
}

void __93__MNGuidanceManager__signForGuidanceEvent_isPrimary_shouldOverridePrimaryDistances_distance___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 type] == 1)
  {
    id v3 = [v6 token];
    int v4 = [v3 isEqualToString:@"{valid_distance}"];

    uint64_t v5 = 48;
    if (v4) {
      uint64_t v5 = 40;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + v5);
  }
}

- (id)_evaluatedStringsForEvent:(id)a3 signStrings:(id)a4 shouldUpdateFormatStrings:(BOOL)a5 argumentHandler:(id)a6
{
  BOOL v25 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v8 = a4;
  id v9 = a6;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          double v15 = [v14 defaultOptions];
          double v16 = [v15 arguments];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __101__MNGuidanceManager__evaluatedStringsForEvent_signStrings_shouldUpdateFormatStrings_argumentHandler___block_invoke;
          v27[3] = &unk_1E60F7BC0;
          v27[4] = self;
          id v28 = v26;
          id v29 = v9;
          double v17 = objc_msgSend(v16, "_geo_compactMap:", v27);

          [v15 setArguments:v17];
          [v15 setShouldUpdateFormatStrings:v25];
          uint64_t v18 = [v14 composedStringWithOptions:v15];
          if (v18)
          {
            [v23 addObject:v18];
          }
          else
          {
            double v19 = MNGetMNGuidanceManagerLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              double v35 = v14;
              _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_FAULT, "ⓖ Error evaluating string: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v11);
    }

    id v8 = v21;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

id __101__MNGuidanceManager__evaluatedStringsForEvent_signStrings_shouldUpdateFormatStrings_argumentHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _updateDisplayStringArgument:v3 event:*(void *)(a1 + 40)])
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = v3;
    if (v4)
    {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
      uint64_t v5 = v3;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)_updateDisplayStringArgument:(id)a3 event:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 type];
  if (v8 > 10)
  {
    BOOL v15 = 0;
    if (v8 == 11 || v8 == 15) {
      goto LABEL_22;
    }
  }
  else
  {
    if (v8 == 1)
    {
      double v17 = [v6 distanceFormat];
      [v17 setFormatOptions:1];
      uint64_t v18 = [(MNGuidanceManager *)self route];
      int v19 = [v18 transportType];

      if (v19 == 2) {
        objc_msgSend(v17, "setFormatOptions:", objc_msgSend(v17, "formatOptions") | 2);
      }
      int v20 = [v6 token];
      int v21 = [v20 isEqualToString:@"{valid_distance}"];

      if (v21) {
        uint64_t v22 = [v7 endValidRouteCoordinate];
      }
      else {
        uint64_t v22 = [v7 coordinateForDistanceStrings];
      }
      [(MNGuidanceManager *)self _distanceToRouteCoordinate:v22];
      double v27 = objc_msgSend(MEMORY[0x1E4F28E28], "_geo_distanceMeasurementForMeters:");
      [v17 setOverrideValue:v27];

      goto LABEL_21;
    }
    if (v8 == 10)
    {
      id v9 = [(MNGuidanceManager *)self route];
      uint64_t v10 = [v9 legs];
      uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
      uint64_t v12 = [v11 destination];

      long long v13 = [v6 token];
      LODWORD(v10) = [v13 isEqualToString:@"{Name}"];

      if (v10)
      {
        uint64_t v14 = [v12 navDisplayName];
      }
      else
      {
        id v23 = [v6 token];
        int v24 = [v23 isEqualToString:@"{Address}"];

        if (!v24)
        {
LABEL_18:

LABEL_21:
          BOOL v15 = 1;
          goto LABEL_22;
        }
        uint64_t v14 = [v12 navDisplayAddress];
      }
      BOOL v25 = (void *)v14;
      id v26 = [v6 stringFormat];
      [v26 setOverrideValue:v25];

      goto LABEL_18;
    }
  }
  double v16 = MNGetMNGuidanceManagerLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    int v29 = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_FAULT, "ⓖ Unhandled argument for display string: %@", (uint8_t *)&v29, 0xCu);
  }

  BOOL v15 = 0;
LABEL_22:

  return v15;
}

- (void)_considerARGuidance
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(MNGuidanceManager *)self _validEventsForARGuidance];
  if ([v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
          uint64_t v11 = [(MNGuidanceManager *)self route];
          uint64_t v12 = objc_msgSend(v11, "stepAtIndex:", objc_msgSend(v10, "stepIndex"));

          long long v13 = [(MNGuidanceManager *)self _createArGuidanceInfosForEvent:v10 forStep:v12];
          [v4 addObjectsFromArray:v13];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v7);
    }

    if (!+[MNComparison isValue:v4 equalTo:self->_arEvents])
    {
      uint64_t v14 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BOOL v15 = [v4 valueForKey:@"debugDescription"];
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v15;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_INFO, "ⓖ New ar guidance events: %@", buf, 0xCu);
      }
    }
    if (objc_msgSend(v4, "count", (void)v17))
    {
      objc_storeStrong((id *)&self->_arEvents, v4);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained guidanceManager:self updateSignsWithARInfo:self->_arEvents];
    }
  }
}

- (id)_createArGuidanceInfosForEvent:(id)a3 forStep:(id)a4
{
  v153[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v129 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:1];
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v6 coordinateForDistanceStrings]);
  double v9 = fmax(v8, 0.0);
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v6 endValidRouteCoordinate]);
  double v11 = fmax(v10, 0.0);
  uint64_t v12 = [(MNGuidanceManager *)self navigationSessionState];
  long long v13 = [v12 currentWaypoint];
  v153[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:1];
  v128 = [(MNGuidanceManager *)self _serverStringDictionaryForEvent:v6 distance:0 validDistance:v14 spoken:v9 waypoints:v11];

  if ([v6 arType] == 1)
  {
    BOOL v15 = (MNGuidanceARInfo *)objc_opt_new();
    double v16 = [(MNGuidanceManager *)self route];
    uint64_t v17 = objc_msgSend(v16, "legIndexForStepIndex:", objc_msgSend(v7, "stepIndex"));

    long long v18 = [(MNGuidanceManager *)self route];
    long long v19 = [v18 legs];
    long long v20 = [v19 objectAtIndex:v17];
    uint64_t v135 = [v20 startRouteCoordinate];

    uint64_t v21 = [v6 gapRanges];
    v127 = v7;
    v140 = v15;
    v142 = self;
    if (v21
      && (uint64_t v22 = (void *)v21,
          [v6 gapRanges],
          id v23 = objc_claimAutoreleasedReturnValue(),
          uint64_t v24 = [v23 count],
          v23,
          v22,
          v24))
    {
      uint64_t v25 = [v7 startRouteCoordinate];
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v125 = v6;
      id obj = [v6 gapRanges];
      uint64_t v137 = [obj countByEnumeratingWithState:&v145 objects:v152 count:16];
      if (v137)
      {
        uint64_t v132 = *(void *)v146;
        unsigned int v26 = *MEMORY[0x1E4F64198];
        unint64_t v27 = (unint64_t)*(unsigned int *)(MEMORY[0x1E4F64198] + 4) << 32;
        do
        {
          for (uint64_t i = 0; i != v137; ++i)
          {
            if (*(void *)v146 != v132) {
              objc_enumerationMutation(obj);
            }
            int v29 = *(void **)(*((void *)&v145 + 1) + 8 * i);
            id v30 = [(MNGuidanceManager *)self route];
            objc_msgSend(v30, "routeCoordinateForDistance:afterRouteCoordinate:", v135, (float)objc_msgSend(v29, "startValidDistanceOffsetCm") * 0.01);
            unsigned int v31 = GEOPolylineCoordinateNearestIndex();

            unint64_t v143 = 0;
            unint64_t v144 = 0;
            char IsInvalid = GEOPolylineCoordinateIsInvalid();
            LODWORD(v33) = vcvtms_u32_f32(*((float *)&v25 + 1)) + v25;
            unint64_t v34 = (unint64_t)COERCE_UNSIGNED_INT(*((float *)&v25 + 1) - floorf(*((float *)&v25 + 1))) << 32;
            if (IsInvalid)
            {
              unint64_t v34 = v27;
              uint64_t v33 = v26;
            }
            else
            {
              uint64_t v33 = v33;
            }
            unint64_t v35 = v34 | v33;
            int v36 = GEOPolylineCoordinateIsInvalid();
            if (v36) {
              uint64_t v37 = v26;
            }
            else {
              uint64_t v37 = v31;
            }
            if (v36) {
              unint64_t v38 = v27;
            }
            else {
              unint64_t v38 = 0;
            }
            unint64_t v143 = v35;
            unint64_t v144 = v38 | v37;
            double v39 = [MEMORY[0x1E4F29238] valueWithBytes:&v143 objCType:"{GEOPolylineCoordinateRange={?=If}{?=If}}"];
            BOOL v15 = v140;
            [(MNGuidanceARInfo *)v140 addObject:v39];

            uint64_t v40 = [(MNGuidanceManager *)self route];
            uint64_t v25 = objc_msgSend(v40, "routeCoordinateForDistance:afterRouteCoordinate:", v135, (float)objc_msgSend(v29, "endValidDistanceOffsetCm") * 0.01);
          }
          uint64_t v137 = [obj countByEnumeratingWithState:&v145 objects:v152 count:16];
        }
        while (v137);
      }

      id v6 = v125;
    }
    else
    {
      uint64_t v61 = [v7 startRouteCoordinate];
      [v7 endRouteCoordinate];
      unsigned int v62 = GEOPolylineCoordinateNearestIndex();
      if (GEOPolylineCoordinateIsInvalid())
      {
        unsigned int v64 = *MEMORY[0x1E4F64198];
        uint64_t v63 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
        uint64_t v65 = v63;
        unsigned int v66 = *MEMORY[0x1E4F64198];
      }
      else
      {
        *(float *)&unsigned int v67 = *((float *)&v61 + 1) - floorf(*((float *)&v61 + 1));
        unsigned int v66 = vcvtms_u32_f32(*((float *)&v61 + 1)) + v61;
        unsigned int v64 = *MEMORY[0x1E4F64198];
        uint64_t v65 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
        uint64_t v63 = v67;
      }
      unint64_t v68 = v66 | (unint64_t)(v63 << 32);
      int v69 = GEOPolylineCoordinateIsInvalid();
      uint64_t v70 = v65 << 32;
      if (v69) {
        uint64_t v71 = v64;
      }
      else {
        uint64_t v71 = v62;
      }
      if (!v69) {
        uint64_t v70 = 0;
      }
      unint64_t v143 = v68;
      unint64_t v144 = v70 | v71;
      double v72 = [MEMORY[0x1E4F29238] valueWithBytes:&v143 objCType:"{GEOPolylineCoordinateRange={?=If}{?=If}}"];
      [(MNGuidanceARInfo *)v15 addObject:v72];
    }
    if ([(MNGuidanceARInfo *)v15 count])
    {
      uint64_t v73 = 0;
      unint64_t v74 = 0;
      do
      {
        v75 = [(MNGuidanceARInfo *)v15 objectAtIndex:v74];
        unint64_t v143 = 0;
        unint64_t v144 = 0;
        v138 = v75;
        [v75 getValue:&v143];
        v133 = [MNGuidanceARInfo alloc];
        id obja = [v6 uniqueID];
        uint64_t v76 = [v6 arType];
        uint64_t v77 = [(MNGuidanceManager *)self _maneuverTypeForAREvent:v6];
        long long v78 = [v6 arInstruction];
        long long v79 = [v128 objectForKeyedSubscript:@"{fromOrigin}"];
        [v6 arArrowLabel];
        v81 = uint64_t v80 = v73;
        long long v82 = [v127 maneuverRoadName];
        uint64_t v83 = [v127 stepIndex];
        uint64_t v84 = v77;
        BOOL v15 = v140;
        long long v85 = -[MNGuidanceARInfo initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:](v133, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:", obja, v76, v84, v78, v79, v81, v143, v144, v82, v83);

        uint64_t v86 = v80;
        self = v142;

        [(MNGuidanceARInfo *)v85 setPriority:[(MNGuidanceARInfo *)v140 count] + v80];
        long long v87 = [v6 arInstructionString];

        if (v87)
        {
          long long v88 = [v6 arInstructionString];
          v151 = v88;
          long long v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
          long long v90 = [(MNGuidanceManager *)v142 _evaluatedStringsForEvent:v6 signStrings:v89 shouldUpdateFormatStrings:0 argumentHandler:0];
          long long v91 = [v90 firstObject];
          [(MNGuidanceARInfo *)v85 setInstructionString:v91];
        }
        [v129 addObject:v85];

        ++v74;
        uint64_t v73 = v86 - 1;
      }
      while (v74 < [(MNGuidanceARInfo *)v140 count]);
    }
    long long v92 = [v6 gapRanges];
    v93 = [v92 lastObject];

    id v7 = v127;
    if (v93)
    {
      v94 = [(MNGuidanceManager *)self route];
      unint64_t v95 = objc_msgSend(v94, "routeCoordinateForDistance:afterRouteCoordinate:", v135, (float)objc_msgSend(v93, "startValidDistanceOffsetCm") * 0.01);

      LODWORD(v94) = [v6 endValidRouteCoordinate];
      if (GEOPolylineCoordinateNearestIndex() == v94)
      {
        unint64_t v96 = HIDWORD(v95);
        v126 = v6;
        if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
        {
          LODWORD(v143) = 0;
          if (modff(*((float *)&v95 + 1), (float *)&v143) > 0.0)
          {
            LODWORD(v96) = v143;
            LODWORD(v95) = v95 + 1;
          }
        }
        __int16 v97 = [(MNGuidanceManager *)self _closestContinueAREventToRouteCoordinate:v95 | ((unint64_t)v96 << 32)];
        v98 = [(MNGuidanceManager *)self route];
        v99 = objc_msgSend(v98, "stepAtIndex:", objc_msgSend(v97, "stepIndex"));
        uint64_t v100 = [v99 startRouteCoordinate];
        uint64_t v101 = [(MNGuidanceManager *)self route];
        v139 = v97;
        v102 = objc_msgSend(v101, "stepAtIndex:", objc_msgSend(v97, "stepIndex"));
        [v102 endRouteCoordinate];
        unsigned int v103 = GEOPolylineCoordinateNearestIndex();
        if (GEOPolylineCoordinateIsInvalid())
        {
          LODWORD(v100) = *MEMORY[0x1E4F64198];
          uint64_t v104 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
          uint64_t v105 = v104;
          unsigned int v106 = *MEMORY[0x1E4F64198];
        }
        else
        {
          unsigned int v106 = vcvtms_u32_f32(*((float *)&v100 + 1)) + v100;
          LODWORD(v100) = *MEMORY[0x1E4F64198];
          uint64_t v105 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
          uint64_t v104 = COERCE_UNSIGNED_INT(*((float *)&v100 + 1) - floorf(*((float *)&v100 + 1)));
        }
        unint64_t v136 = v106 | (unint64_t)(v104 << 32);
        int v107 = GEOPolylineCoordinateIsInvalid();
        uint64_t v108 = v105 << 32;
        if (v107) {
          uint64_t v109 = v100;
        }
        else {
          uint64_t v109 = v103;
        }
        if (!v107) {
          uint64_t v108 = 0;
        }
        uint64_t v134 = v108 | v109;

        v110 = [MNGuidanceARInfo alloc];
        v111 = [v126 uniqueID];
        uint64_t v112 = [v97 arType];
        uint64_t v113 = [(MNGuidanceManager *)self _maneuverTypeForAREvent:v126];
        v114 = [v126 arInstruction];
        v115 = [v139 arArrowLabel];
        v116 = [v127 maneuverRoadName];
        v117 = -[MNGuidanceARInfo initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:](v110, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:", v111, v112, v113, v114, v128, v115, v136, v134, v116, [v127 stepIndex]);

        id v6 = v126;
        [(MNGuidanceARInfo *)v117 setPriority:0];
        v118 = [v126 arInstructionString];

        if (v118)
        {
          v119 = [v126 arInstructionString];
          v150 = v119;
          v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
          v121 = [(MNGuidanceManager *)v142 _evaluatedStringsForEvent:v126 signStrings:v120 shouldUpdateFormatStrings:0 argumentHandler:0];
          v122 = [v121 firstObject];
          [(MNGuidanceARInfo *)v117 setInstructionString:v122];
        }
        [v129 addObject:v117];

        id v7 = v127;
        BOOL v15 = v140;
      }
    }
  }
  else
  {
    if ([v6 arType] != 2) {
      goto LABEL_57;
    }
    v141 = [MNGuidanceARInfo alloc];
    id v41 = [v6 uniqueID];
    uint64_t v42 = [v6 arType];
    uint64_t v43 = [(MNGuidanceManager *)self _maneuverTypeForAREvent:v6];
    id v44 = [v6 arInstruction];
    [v6 arArrowLabel];
    v46 = id v45 = v6;
    uint64_t v47 = [(MNGuidanceManager *)self route];
    [v7 endRouteCoordinate];
    [v47 pointAt:GEOPolylineCoordinateNearestIndex()];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    uint64_t v54 = [v7 maneuverRoadName];
    [(MNGuidanceManager *)self _headingForArEvent:v45];
    BOOL v15 = -[MNGuidanceARInfo initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinate:maneuverRoadName:heading:stepIndex:](v141, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinate:maneuverRoadName:heading:stepIndex:", v41, v42, v43, v44, v128, v46, v49, v51, v53, v55, v54, [v7 stepIndex]);

    id v6 = v45;
    uint64_t v56 = [v45 arInstructionString];

    if (v56)
    {
      uint64_t v57 = [v45 arInstructionString];
      v149 = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v149 count:1];
      uint64_t v59 = [(MNGuidanceManager *)self _evaluatedStringsForEvent:v45 signStrings:v58 shouldUpdateFormatStrings:0 argumentHandler:0];
      unint64_t v60 = [v59 firstObject];
      [(MNGuidanceARInfo *)v15 setInstructionString:v60];
    }
    [v129 addObject:v15];
  }

LABEL_57:
  v123 = [v129 array];

  return v123;
}

- (id)_validEventsForARGuidance
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", -[NSMutableArray count](self->_validEvents, "count"));
  uint64_t v4 = [(MNLocation *)self->_location routeMatch];
  unint64_t v5 = [v4 stepIndex];

  uint64_t UInteger = GEOConfigGetUInteger();
  id v7 = [(MNGuidanceManager *)self delegate];
  unsigned int v8 = [v7 navigationState];

  if (v8 <= 8)
  {
    if (((1 << v8) & 0x11A) != 0)
    {
      if (v5 > 1 || self->_hasBeenOnRouteOnce)
      {
        unint64_t v9 = UInteger + v5;
        double v10 = [(MNGuidanceManager *)self route];
        unint64_t v11 = [v10 stepsCount] - 1;

        if (v9 >= v11)
        {
          uint64_t v12 = [(MNGuidanceManager *)self _arrivalARGuidanceEventsForLeg:[(MNGuidanceManager *)self currentLegIndex]];
          [v3 addObjectsFromArray:v12];
        }
        long long v13 = [(MNLocation *)self->_location routeMatch];
        uint64_t v14 = -[MNGuidanceManager _closestContinueAREventToRouteCoordinate:](self, "_closestContinueAREventToRouteCoordinate:", [v13 routeCoordinate]);

        if (v14) {
          [v3 addObject:v14];
        }
        goto LABEL_23;
      }
      unsigned int v26 = [(MNGuidanceManager *)self _specialAREvents:1 forLeg:[(MNGuidanceManager *)self currentLegIndex]];
      unint64_t v27 = [(MNGuidanceManager *)self route];
      if ((unint64_t)[v27 stepsCount] <= 1)
      {
      }
      else
      {
        id v28 = [(MNLocation *)self->_location routeMatch];
        [v28 distanceFromRoute];
        double v30 = v29;
        GEOConfigGetDouble();
        double v32 = v31;

        if (v30 < v32)
        {
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v33 = v26;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:v68 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v59;
            while (2)
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v59 != v36) {
                  objc_enumerationMutation(v33);
                }
                unint64_t v38 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                if ([v38 arType] == 1)
                {
                  [v3 addObject:v38];
                  goto LABEL_50;
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v68 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }
LABEL_50:

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          double v39 = self->_events;
          uint64_t v45 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v54 objects:v67 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v46; ++j)
              {
                if (*(void *)v55 != v47) {
                  objc_enumerationMutation(v39);
                }
                double v49 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                if ([v49 stepIndex] == 1
                  && [v49 hasArGuidance]
                  && [v49 arType] == 2)
                {
                  [v3 addObject:v49];
                }
              }
              uint64_t v46 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v54 objects:v67 count:16];
            }
            while (v46);
          }
LABEL_61:

          goto LABEL_24;
        }
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      double v39 = v26;
      uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v51;
        while (2)
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v51 != v42) {
              objc_enumerationMutation(v39);
            }
            id v44 = *(void **)(*((void *)&v50 + 1) + 8 * k);
            if (objc_msgSend(v44, "arType", (void)v50) == 2)
            {
              [v3 addObject:v44];
              goto LABEL_61;
            }
          }
          uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
          if (v41) {
            continue;
          }
          break;
        }
      }
      goto LABEL_61;
    }
    if (v8 != 2)
    {
      if (v8 != 6) {
        goto LABEL_24;
      }
LABEL_22:
      uint64_t v14 = [(MNGuidanceManager *)self _arrivalARGuidanceEventsForLeg:[(MNGuidanceManager *)self currentLegIndex]];
      [v3 addObjectsFromArray:v14];
LABEL_23:

      goto LABEL_24;
    }
    self->_hasBeenOnRouteOnce = 1;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    BOOL v15 = self->_validEvents;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v63;
      do
      {
        for (uint64_t m = 0; m != v17; ++m)
        {
          if (*(void *)v63 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v62 + 1) + 8 * m);
          if ([v20 hasArGuidance]) {
            [v3 addObject:v20];
          }
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v17);
    }

    unint64_t v21 = UInteger + v5;
    uint64_t v22 = [(MNGuidanceManager *)self route];
    unint64_t v23 = [v22 stepsCount] - 1;

    if (v21 >= v23) {
      goto LABEL_22;
    }
  }
LABEL_24:
  uint64_t v24 = objc_msgSend(v3, "array", (void)v50);

  return v24;
}

- (id)_closestContinueAREventToRouteCoordinate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_events;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "startValidRouteCoordinate", (void)v11);
        if (GEOPolylineCoordinateIsABeforeOrEqualToB())
        {
          [v8 endValidRouteCoordinate];
          if (GEOPolylineCoordinateIsABeforeB())
          {
            if ([v8 arType] == 1)
            {
              id v9 = v8;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_13:

  return v9;
}

- (id)_arrivalARGuidanceEventsForLeg:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F0E35088, &unk_1F0E350A0, &unk_1F0E350B8, &unk_1F0E350D0, &unk_1F0E350E8, 0);
  id v15 = (id)objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_events;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 legIndex] == a3)
        {
          if ([v11 hasArGuidance])
          {
            if ([v11 arType] == 2)
            {
              long long v12 = objc_msgSend(NSNumber, "numberWithInt:", -[MNGuidanceManager _maneuverTypeForAREvent:](self, "_maneuverTypeForAREvent:", v11));
              int v13 = [v5 containsObject:v12];

              if (v13) {
                [v15 addObject:v11];
              }
            }
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v15;
}

- (id)_specialAREvents:(int)a3 forLeg:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  specialAREvents = self->_specialAREvents;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v7 = [(NSMutableDictionary *)specialAREvents objectForKeyedSubscript:v6];
  uint64_t v8 = [NSNumber numberWithInt:v4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (int)_maneuverTypeForAREvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasArGuidance])
  {
    if ([v3 composedGuidanceEventType] == 1)
    {
      int v4 = 17;
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v5 = objc_msgSend(v3, "arInstruction", 0);
      uint64_t v6 = [v5 formatTokens];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([v11 type] == 15)
            {
              long long v12 = [v11 maneuverValue];
              int v4 = [v12 maneuverType];

              goto LABEL_15;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      int v4 = [v3 maneuverType];
    }
  }
  else
  {
    int v4 = 0;
  }
LABEL_15:

  return v4;
}

- (double)_headingForArEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MNGuidanceManager *)self route];
  uint64_t v6 = objc_msgSend(v5, "stepAtIndex:", objc_msgSend(v4, "stepIndex"));

  double v7 = -1.0;
  if ([v4 hasArGuidance] && v6)
  {
    uint64_t v8 = [v6 startRouteCoordinate];
    unsigned int v9 = [v6 endRouteCoordinate];
    if ([v4 arType] == 2)
    {
      double v10 = [v6 getNextStep];

      if (v10)
      {
        [v6 endRouteCoordinate];
        uint64_t v8 = GEOPolylineCoordinateNearestIndex();
        long long v11 = [v6 getNextStep];
        [v11 endRouteCoordinate];
        unsigned int v9 = GEOPolylineCoordinateNearestIndex();
      }
      else
      {
        uint64_t v8 = v9 - 1;
      }
    }
    GEOConfigGetDouble();
    double v13 = v12;
    GEOConfigGetDouble();
    double v15 = v14;
    long long v16 = [(MNGuidanceManager *)self route];
    [v16 courseAtRouteCoordinateIndex:v8];
    double v7 = v17;

    uint64_t v18 = (v8 + 1);
    if (v18 < v9)
    {
      unsigned int v19 = v9 - 2;
      do
      {
        long long v20 = [(MNGuidanceManager *)self route];
        [v20 courseAtRouteCoordinateIndex:v8];
        double v7 = v21;

        uint64_t v22 = [(MNGuidanceManager *)self route];
        [v22 distanceBetweenIndex:v8 andIndex:v18];
        double v24 = v23;

        if (v24 > v15) {
          break;
        }
        uint64_t v25 = [(MNGuidanceManager *)self route];
        [v25 courseAtRouteCoordinateIndex:(v8 + 1)];
        GEOAngleDifferenceDegrees();
        double v27 = v26;

        double v28 = -v27;
        if (v27 >= 0.0) {
          double v28 = v27;
        }
        ++v18;
        BOOL v29 = v28 < v13 || v19 == v8;
        uint64_t v8 = (v8 + 1);
      }
      while (!v29);
    }
  }

  return v7;
}

- (void)_considerNavTrayGuidance
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(MNGuidanceManager *)self navigationSessionState];
  int v4 = [v3 navigationState];

  if (v4 == 7)
  {
    uint64_t v5 = [(MNGuidanceManager *)self navigationSessionState];
    uint64_t v6 = -[MNGuidanceManager _specialNavTrayEvents:forLeg:](self, "_specialNavTrayEvents:forLeg:", 14, [v5 targetLegIndex]);

    if ((unint64_t)[v6 count] >= 2)
    {
      double v7 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        uint64_t v18 = @"CHARGING_AT_STATION";
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Found multiple nav tray guidance events for guidance event type '%@'. This is a Routing error. Using the first one found.", (uint8_t *)&v17, 0xCu);
      }
    }
    uint64_t v8 = [v6 firstObject];
    unsigned int v9 = [(GEOComposedGuidanceEvent *)self->_activeNavTrayGuidanceEvent uniqueID];
    double v10 = [v8 uniqueID];
    unint64_t v11 = v9;
    unint64_t v12 = v10;
    if (v11 | v12)
    {
      double v13 = (void *)v12;
      char v14 = [(id)v11 isEqual:v12];

      if ((v14 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, v8);
        if (v8) {
          double v15 = [[MNNavTrayGuidanceEvent alloc] initWithGuidanceEvent:v8];
        }
        else {
          double v15 = 0;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained guidanceManager:self didUpdateNavTrayGuidance:v15];
      }
    }
  }
}

- (void)_considerPersistence
{
  BOOL v3 = [(MNGuidanceManager *)self _hasPersistentEvents];
  if (self->_hasPersistentEvents != v3)
  {
    self->_hasPersistentEvents = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained guidanceManager:self usePersistentDisplay:self->_hasPersistentEvents];
  }
}

- (BOOL)_hasPersistentEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_validEvents;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isSticky", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_considerJunctionViewGuidance
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MNGuidanceManager *)self _nextJunctionViewGuidanceEvent];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 uniqueID];
    uint64_t v6 = [(GEOComposedGuidanceEvent *)self->_currentJunctionViewGuidanceEvent uniqueID];
    if ([v5 isEqual:v6])
    {
    }
    else
    {
      long long v10 = [v4 uniqueID];
      unint64_t v11 = [(GEOComposedGuidanceEvent *)self->_pendingJunctionViewGuidanceEvent uniqueID];
      char v12 = [v10 isEqual:v11];

      if ((v12 & 1) == 0)
      {
        double v13 = MNGetMNGuidanceManagerLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          char v14 = [(GEOComposedGuidanceEvent *)self->_currentJunctionViewGuidanceEvent uniqueID];
          double v15 = [(GEOComposedGuidanceEvent *)self->_pendingJunctionViewGuidanceEvent uniqueID];
          *(_DWORD *)buf = 138412802;
          BOOL v29 = v4;
          __int16 v30 = 2112;
          double v31 = v14;
          __int16 v32 = 2112;
          id v33 = v15;
          _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "ⓖ Requesting new junction view: %@ | previous: %@ | pending: %@", buf, 0x20u);
        }
        objc_storeStrong((id *)&self->_pendingJunctionViewGuidanceEvent, v4);
        objc_initWeak((id *)buf, self);
        junctionViewImageLoader = self->_junctionViewImageLoader;
        int v17 = [v4 junctionView];
        uint64_t v18 = [v4 uniqueID];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __50__MNGuidanceManager__considerJunctionViewGuidance__block_invoke;
        v25[3] = &unk_1E60F7BE8;
        objc_copyWeak(&v26, (id *)buf);
        [(MNJunctionViewImageLoader *)junctionViewImageLoader imagesForJunctionView:v17 eventID:v18 handler:v25];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    if (self->_currentJunctionViewGuidanceEvent)
    {
      long long v7 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        long long v8 = [(GEOComposedGuidanceEvent *)self->_currentJunctionViewGuidanceEvent uniqueID];
        *(_DWORD *)buf = 138412290;
        BOOL v29 = v8;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓖ Removing displayed junction view: %@", buf, 0xCu);
      }
      if (self->_currentJunctionViewGuidanceEvent)
      {
        currentJunctionViewGuidanceEvent = self->_currentJunctionViewGuidanceEvent;
        long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&currentJunctionViewGuidanceEvent count:1];
        [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:0 previousEvents:v9];
      }
      else
      {
        [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:0 previousEvents:0];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      long long v20 = [(GEOComposedGuidanceEvent *)self->_currentJunctionViewGuidanceEvent uniqueID];
      [WeakRetained guidanceManager:self hideJunctionViewForId:v20];

      double v21 = self->_currentJunctionViewGuidanceEvent;
      self->_currentJunctionViewGuidanceEvent = 0;
    }
    if (self->_pendingJunctionViewGuidanceEvent)
    {
      uint64_t v22 = MNGetMNGuidanceManagerLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        double v23 = [(GEOComposedGuidanceEvent *)self->_pendingJunctionViewGuidanceEvent uniqueID];
        *(_DWORD *)buf = 138412290;
        BOOL v29 = v23;
        _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_INFO, "ⓖ Removing pending junction view: %@", buf, 0xCu);
      }
      pendingJunctionViewGuidanceEvent = self->_pendingJunctionViewGuidanceEvent;
      self->_pendingJunctionViewGuidanceEvent = 0;
    }
  }
}

void __50__MNGuidanceManager__considerJunctionViewGuidance__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleJunctionViewInfo:v3];
}

- (id)_nextJunctionViewGuidanceEvent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_validEvents;
  id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = objc_msgSend(v6, "junctionView", (void)v9);

        if (v7)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_handleJunctionViewInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uniqueID];
  uint64_t v6 = [(GEOComposedGuidanceEvent *)self->_pendingJunctionViewGuidanceEvent uniqueID];
  char v7 = [v5 isEqual:v6];

  long long v8 = MNGetMNGuidanceManagerLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      long long v10 = [(GEOComposedGuidanceEvent *)self->_pendingJunctionViewGuidanceEvent uniqueID];
      long long v11 = [(GEOComposedGuidanceEvent *)self->_currentJunctionViewGuidanceEvent uniqueID];
      *(_DWORD *)buf = 138412546;
      double v21 = v10;
      __int16 v22 = 2112;
      double v23 = v11;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "ⓖ Showing junction view: %@ | previous: %@", buf, 0x16u);
    }
    long long v8 = self->_currentJunctionViewGuidanceEvent;
    objc_storeStrong((id *)&self->_currentJunctionViewGuidanceEvent, self->_pendingJunctionViewGuidanceEvent);
    pendingJunctionViewGuidanceEvent = self->_pendingJunctionViewGuidanceEvent;
    self->_pendingJunctionViewGuidanceEvent = 0;

    currentJunctionViewGuidanceEvent = self->_currentJunctionViewGuidanceEvent;
    if (currentJunctionViewGuidanceEvent)
    {
      uint64_t v19 = self->_currentJunctionViewGuidanceEvent;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      if (v8) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if (v8)
      {
LABEL_6:
        uint64_t v18 = v8;
        double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:v14 previousEvents:v15];

        if (!currentJunctionViewGuidanceEvent)
        {
LABEL_8:
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained guidanceManager:self showJunctionView:v4];
LABEL_11:

          goto LABEL_12;
        }
LABEL_7:

        goto LABEL_8;
      }
    }
    [(MNGuidanceManager *)self _notifyAnalyticsForNewEvents:v14 previousEvents:0];
    if (!currentJunctionViewGuidanceEvent) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v9)
  {
    id WeakRetained = [v4 uniqueID];
    int v17 = [(GEOComposedGuidanceEvent *)self->_pendingJunctionViewGuidanceEvent uniqueID];
    *(_DWORD *)buf = 138412546;
    double v21 = WeakRetained;
    __int16 v22 = 2112;
    double v23 = v17;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "ⓖ Junction view info was received for request %@, but a newer junction view info was requested: %@", buf, 0x16u);

    goto LABEL_11;
  }
LABEL_12:
}

- (id)_junctionViewEvents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(MNGuidanceManager *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 hasJunctionView])
        {
          [v9 startValidRouteCoordinate];
          if (GEOPolylineCoordinateIsValid()) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
}

- (BOOL)_isInArrivalState
{
  id v3 = [(MNGuidanceManager *)self delegate];
  if ([v3 navigationState] == 7)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(MNGuidanceManager *)self delegate];
    BOOL v4 = [v5 navigationState] == 6;
  }
  return v4;
}

- (id)_specialSpokenEvents:(int)a3 forLegIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  specialSpokenEvents = self->_specialSpokenEvents;
  long long v8 = [NSNumber numberWithUnsignedInteger:a4];
  BOOL v9 = [(NSMutableDictionary *)specialSpokenEvents objectForKeyedSubscript:v8];
  long long v10 = [NSNumber numberWithInt:v5];
  long long v11 = [v9 objectForKeyedSubscript:v10];

  uint64_t v12 = [v11 count];
  if (a4 && !v12)
  {
    long long v13 = [(NSMutableDictionary *)self->_specialSpokenEvents objectForKeyedSubscript:&unk_1F0E35058];
    long long v14 = [NSNumber numberWithInt:v5];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    long long v11 = (void *)v15;
  }
  return v11;
}

- (BOOL)_eventWasSpoken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    announcementsSpoken = self->_announcementsSpoken;
    uint64_t v7 = [v4 uniqueID];
    long long v8 = [(NSMutableDictionary *)announcementsSpoken objectForKeyedSubscript:v7];

    if (v8)
    {
      char v9 = 1;
    }
    else
    {
      exclusiveSetAnnouncementsSpoken = self->_exclusiveSetAnnouncementsSpoken;
      long long v11 = [v5 exclusiveSetIdentifier];
      char v9 = [(NSMutableSet *)exclusiveSetAnnouncementsSpoken containsObject:v11];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_markEventSpoken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = [v4 exclusiveSetIdentifier];

    if (v5)
    {
      exclusiveSetAnnouncementsSpoken = self->_exclusiveSetAnnouncementsSpoken;
      uint64_t v7 = [v11 exclusiveSetIdentifier];
      [(NSMutableSet *)exclusiveSetAnnouncementsSpoken addObject:v7];
    }
    long long v8 = +[MNTimeManager currentDate];
    announcementsSpoken = self->_announcementsSpoken;
    long long v10 = [v11 uniqueID];
    [(NSMutableDictionary *)announcementsSpoken setObject:v8 forKeyedSubscript:v10];

    id v4 = v11;
  }
}

- (double)_adjustedVehicleSpeed
{
  [(CLLocation *)self->_location _navigation_speedAccuracy];
  if (v3 < 0.0) {
    double v3 = 0.2;
  }
  if (v3 <= 5.0) {
    double v4 = v3;
  }
  else {
    double v4 = 5.0;
  }
  [(MNLocation *)self->_location speed];
  return fmax(v5 + v4, 6.94444444);
}

- (BOOL)_isValidEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isSpecial]) {
    goto LABEL_10;
  }
  double v5 = [(MNLocation *)self->_location routeMatch];
  int v6 = [v5 isGoodMatch];

  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = [(MNGuidanceManager *)self delegate];
  int v8 = [v7 navigationState];

  if (v8 != 2) {
    goto LABEL_10;
  }
  [(MNLocation *)self->_location speed];
  if (v9 >= 0.0)
  {
    [(MNLocation *)self->_location speed];
    if (!objc_msgSend(v4, "isValidForSpeed:")) {
      goto LABEL_10;
    }
  }
  long long v10 = [(MNLocation *)self->_location routeMatch];
  [v10 routeCoordinate];

  if (![v4 hasArGuidance])
  {
    uint64_t v15 = [(MNLocation *)self->_location routeMatch];
    uint64_t v16 = [v15 step];

    if (v16)
    {
      if ([v4 stepIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v16 stepIndex];
        if (v17 != [v4 stepIndex])
        {
          char IsABeforeB = 0;
          goto LABEL_16;
        }
      }
      [v16 routeCoordinateRange];
      GEOPolylineCoordinateIsABeforeB();
      GEOPolylineCoordinateIsABeforeB();
      GEOPolylineCoordinateIsABeforeB();
    }
    [v4 startValidRouteCoordinate];
    [v4 endValidRouteCoordinate];
    char IsABeforeB = GEOPolylineCoordinateWithinRange();
LABEL_16:

    goto LABEL_17;
  }
  id v11 = [(MNGuidanceManager *)self route];
  GEOConfigGetDouble();
  objc_msgSend(v11, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v4, "startValidRouteCoordinate"), v12);

  uint64_t v13 = [v4 legIndex];
  if (v13 != [(MNGuidanceManager *)self currentLegIndex]
    || !GEOPolylineCoordinateIsABeforeOrEqualToB())
  {
LABEL_10:
    char IsABeforeB = 0;
    goto LABEL_17;
  }
  [v4 endValidRouteCoordinate];
  char IsABeforeB = GEOPolylineCoordinateIsABeforeB();
LABEL_17:

  return IsABeforeB;
}

- (BOOL)_isEVChargingEvent:(id)a3
{
  id v4 = a3;
  if ([v4 composedGuidanceEventType] - 13 > 1)
  {
    BOOL v9 = 0;
  }
  else
  {
    double v5 = [(MNGuidanceManager *)self route];
    int v6 = [v5 legs];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "legIndex"));

    int v8 = [v7 chargingStationInfo];
    BOOL v9 = v8 != 0;
  }
  return v9;
}

- (int)_indexForEventUUID:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!self->_eventIndexes)
  {
    int v8 = (NSDictionary *)objc_opt_new();
    BOOL v9 = [(MNGuidanceManager *)self route];
    long long v10 = [v9 composedGuidanceEvents];

    if ([v10 count])
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = [NSNumber numberWithUnsignedInteger:v11];
        uint64_t v13 = [v10 objectAtIndexedSubscript:v11];
        long long v14 = [v13 uniqueID];
        [(NSDictionary *)v8 setObject:v12 forKeyedSubscript:v14];

        ++v11;
      }
      while (v11 < [v10 count]);
    }
    eventIndexes = self->_eventIndexes;
    self->_eventIndexes = v8;

    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    int v7 = 0;
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  int v6 = [(NSDictionary *)self->_eventIndexes objectForKeyedSubscript:v5];
  int v7 = [v6 intValue];

LABEL_9:
  return v7;
}

- (double)_timeRemainingForEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 composedGuidanceEventType];
  if (v5 > 0xB || ((1 << v5) & 0x80E) == 0)
  {
    [v4 endDistanceForSpeed:self->_speed];
    double v9 = v8;
    [(MNGuidanceManager *)self _distanceToEndOfRoute];
    double v7 = fmax(v10 - v9, 0.0) / self->_speed;
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  return v7;
}

- (double)timeSinceLastAnnouncement
{
  +[MNTimeManager currentTime];
  return v3 - self->_timeLastAnnouncementEnded;
}

- (double)timeUntilNextAnnouncement
{
  if (!self->_nextEvent) {
    return 1.79769313e308;
  }
  -[MNGuidanceManager _timeUntilEventTrigger:](self, "_timeUntilEventTrigger:");
  return fmax(v2, 0.0);
}

- (double)_timeUntilEventTrigger:(id)a3
{
  id v4 = a3;
  double speed = self->_speed;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __44__MNGuidanceManager__timeUntilEventTrigger___block_invoke;
  uint64_t v15 = &unk_1E60F65E8;
  uint64_t v16 = self;
  id v17 = v4;
  id v6 = v4;
  [v6 triggerDistanceForSpeed:&v12 andDuration:speed];
  double v8 = v7;
  [(MNGuidanceManager *)self _distanceToEndOfRoute];
  double v10 = (v9 - v8) / self->_speed;

  return v10;
}

uint64_t __44__MNGuidanceManager__timeUntilEventTrigger___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [v1 _distanceToEndOfRoute];
  return objc_msgSend(v1, "durationOfEvent:announcementIndex:distance:", v2, 0);
}

- (double)_distanceToRouteCoordinate:(id)a3
{
  unsigned int v5 = [(MNGuidanceManager *)self route];
  id v6 = [(MNLocation *)self->_location routeMatch];
  objc_msgSend(v5, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v6, "routeCoordinate"), a3);
  double v8 = v7;

  double result = 0.0;
  if (v8 >= 0.0) {
    return v8;
  }
  return result;
}

- (double)_distanceToManeuverStart
{
  double v3 = [(MNLocation *)self->_location routeMatch];
  id v4 = [v3 step];
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v4 maneuverStartRouteCoordinate]);
  double v6 = v5;

  return v6;
}

- (double)_distanceToEndOfRoute
{
  double v3 = [(MNGuidanceManager *)self route];
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", [v3 endRouteCoordinate]);
  double v5 = v4;

  return v5;
}

- (double)durationOfEvent:(id)a3 announcementIndex:(unint64_t)a4 distance:(double)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = [v8 announcements];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    [v8 distanceForStrings];
    double v13 = fmax(a5 - v12, 0.0);
    [v8 endValidDistance];
    double v15 = fmax(a5 - v14, 0.0);
    uint64_t v16 = [(MNGuidanceManager *)self route];
    id v17 = [v16 destination];
    v30[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v19 = [(MNGuidanceManager *)self navigationSessionState];
    long long v20 = [v19 currentWaypoint];
    double v21 = objc_msgSend(v11, "_navigation_serverStringDictionaryForDistance:validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:", v18, v20, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"), 1, 0, v13, v15);

    char v29 = 1;
    __int16 v22 = NSString;
    double v23 = [v8 announcements];
    uint64_t v24 = [v23 objectAtIndexedSubscript:a4];
    uint64_t v25 = objc_msgSend(v22, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:", v24, 0, 1, 1, v21, &v29);

    if (v29)
    {
      [(MNAudioManager *)self->_audioManager durationOf:v25];
      double v27 = v26;
    }
    else
    {
      double v27 = 978307200.0;
    }
  }
  else
  {
    double v27 = 978307200.0;
  }

  return v27;
}

- (void)_notifyAnalyticsForNewEvents:(id)a3 previousEvents:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v55;
    uint64_t v49 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        feedbacuint64_t k = self->_feedback;
        double v13 = [v11 uniqueID];
        double v14 = [(NSMutableDictionary *)feedback objectForKey:v13];

        if (!v14)
        {
          double v15 = [[MNGuidanceEventFeedback alloc] initWithEvent:v11];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          -[MNGuidanceEventFeedback setStartTime:](v15, "setStartTime:");
          int v16 = [v11 stepID];
          id v17 = [(MNLocation *)self->_location routeMatch];
          uint64_t v18 = [v17 step];
          int v19 = [v18 stepID];

          if (v16 == v19)
          {
            [(MNGuidanceManager *)self _distanceToManeuverStart];
            -[MNGuidanceEventFeedback setStartDistance:](v15, "setStartDistance:");
          }
          [(MNLocation *)self->_location speed];
          -[MNGuidanceEventFeedback setVehicleSpeed:](v15, "setVehicleSpeed:");
          long long v20 = [(MNGuidanceManager *)self route];
          double v21 = [(MNLocation *)self->_location routeMatch];
          -[MNGuidanceEventFeedback setTrafficColor:](v15, "setTrafficColor:", -[MNGuidanceManager _trafficColorForRoute:routeCoordinate:](self, "_trafficColorForRoute:routeCoordinate:", v20, [v21 routeCoordinate]));

          if ([v11 hasSpokenGuidance]) {
            [(MNGuidanceEventFeedback *)v15 setSelectedPrimaryStringIndex:[(MNAnnouncementPlanEvent *)self->_lastAnnouncementEvent variantIndex]];
          }
          if ([v11 hasJunctionView])
          {
            __int16 v22 = [v11 junctionView];
            double v23 = [v22 imageIds];
            uint64_t v24 = (void *)[v23 copy];
            [(MNGuidanceEventFeedback *)v15 setJunctionViewImageIDs:v24];
          }
          if ([v11 source] == 3)
          {
            unint64_t v25 = [v11 enrouteNoticeIndex];
            double v26 = [(MNGuidanceManager *)self route];
            double v27 = [v26 enrouteNotices];
            unint64_t v28 = [v27 count];

            if (v25 < v28)
            {
              char v29 = [(MNGuidanceManager *)self route];
              __int16 v30 = [v29 enrouteNotices];
              double v31 = objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v11, "enrouteNoticeIndex"));

              __int16 v32 = [v31 trafficCamera];
              id v33 = v32;
              if (v32)
              {
                uint64_t v34 = [v32 identifier];
                [(MNGuidanceEventFeedback *)v15 setEnrouteNoticeIdentifier:v34];

                -[MNGuidanceEventFeedback setTrafficCameraType:](v15, "setTrafficCameraType:", [v33 type]);
              }
            }
          }
          uint64_t v35 = self->_feedback;
          uint64_t v36 = [v11 uniqueID];
          [(NSMutableDictionary *)v35 setObject:v15 forKeyedSubscript:v36];

          uint64_t v37 = [(MNGuidanceManager *)self delegate];
          [v37 guidanceManager:self newGuidanceEventFeedback:v15];

          uint64_t v9 = v49;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v8);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v38 = v48;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        if (([v6 containsObject:v43] & 1) == 0)
        {
          id v44 = self->_feedback;
          uint64_t v45 = [v43 uniqueID];
          uint64_t v46 = [(NSMutableDictionary *)v44 objectForKeyedSubscript:v45];

          if (v46)
          {
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            objc_msgSend(v46, "setEndTime:");
            [(MNGuidanceManager *)self _distanceToManeuverStart];
            objc_msgSend(v46, "setEndDistance:");
            uint64_t v47 = [(MNGuidanceManager *)self delegate];
            [v47 guidanceManager:self updatedGuidanceEventFeedback:v46];
          }
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v40);
  }
}

- (unint64_t)_trafficColorForRoute:(id)a3 routeCoordinate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v4 = objc_msgSend(a3, "traffic", 0);
  double v5 = [v4 routeTrafficColors];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    unint64_t v9 = 4;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      unint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      [v11 routeCoordinate];
      if (GEOPolylineCoordinateIsABeforeB()) {
        break;
      }
      unint64_t v9 = [v11 color];
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v9 = 4;
  }

  return v9;
}

- (MNGuidanceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNGuidanceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInPreArrivalState
{
  return self->_isInPreArrivalState;
}

- (void)setIsInPreArrivalState:(BOOL)a3
{
  self->_BOOL isInPreArrivalState = a3;
}

- (BOOL)shouldShowChargingInfo
{
  return self->_shouldShowChargingInfo;
}

- (void)setShouldShowChargingInfo:(BOOL)a3
{
  self->_shouldShowChargingInfo = a3;
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_double speed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_validEvents, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_currentJunctionViewGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_pendingJunctionViewGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_junctionViewImageLoader, 0);
  objc_storeStrong((id *)&self->_previousLaneGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_previousSignEvents, 0);
  objc_storeStrong((id *)&self->_arEvents, 0);
  objc_storeStrong((id *)&self->_signInfo, 0);
  objc_storeStrong((id *)&self->_hapticsTriggered, 0);
  objc_storeStrong((id *)&self->_lastAnnouncementEvent, 0);
  objc_storeStrong((id *)&self->_nextEvent, 0);
  objc_storeStrong((id *)&self->_eventIndexes, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_specialAREvents, 0);
  objc_storeStrong((id *)&self->_specialNavTrayEvents, 0);
  objc_storeStrong((id *)&self->_specialSignEvents, 0);
  objc_storeStrong((id *)&self->_specialSpokenEvents, 0);
  objc_storeStrong((id *)&self->_exclusiveSetAnnouncementsSpoken, 0);
  objc_storeStrong((id *)&self->_announcementsSpoken, 0);
  objc_storeStrong((id *)&self->_announcementEngine, 0);
  objc_storeStrong((id *)&self->_audioManager, 0);
}

@end