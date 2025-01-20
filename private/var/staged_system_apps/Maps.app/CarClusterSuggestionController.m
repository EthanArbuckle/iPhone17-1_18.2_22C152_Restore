@interface CarClusterSuggestionController
- (BOOL)isCarPlaySessionConnected;
- (BOOL)isNavigating;
- (BOOL)shouldSuggestTurnCard;
- (BOOL)shouldUsePersistentDisplay;
- (CARSession)currentSession;
- (CarClusterSuggestionController)init;
- (NSArray)currentlySuggestingURLs;
- (NSString)debugDescription;
- (void)_cancelStopSuggestingTurnCardTimerIfNeeded;
- (void)_clear;
- (void)_scheduleStopSuggestingTurnCardTimerIfNeeded;
- (void)_sendOneTimeTurnCardSuggestion;
- (void)_sendSuggestionIfNeeded;
- (void)_startSuggestingTurnCard;
- (void)_stopSuggestingTurnCard;
- (void)_stopSuggestingTurnCardTimerFired;
- (void)_supportedUrlsChanged:(id)a3;
- (void)_updateCurrentSuggestions;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)navigationServiceDidEnterPreArrivalState:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCurrentlySuggestingURLs:(id)a3;
- (void)setIsCarPlaySessionConnected:(BOOL)a3;
- (void)setIsNavigating:(BOOL)a3;
- (void)setShouldSuggestTurnCard:(BOOL)a3;
- (void)setUsePersistentDisplay:(BOOL)a3;
@end

@implementation CarClusterSuggestionController

- (CarClusterSuggestionController)init
{
  v17.receiver = self;
  v17.super_class = (Class)CarClusterSuggestionController;
  v2 = [(CarClusterSuggestionController *)&v17 init];
  if (v2)
  {
    v3 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v3;

    [(CARSessionStatus *)v2->_carSessionStatus addSessionObserver:v2];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_supportedUrlsChanged:" name:@"CRInstrumentClusterURLsDidChangeNotification" object:0];

    v6 = +[NSURL URLWithString:@"maps:/car/instrumentcluster/instructioncard"];
    v19 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v19 count:1];
    turnCardSuggestURLs = v2->_turnCardSuggestURLs;
    v2->_turnCardSuggestURLs = (NSArray *)v7;

    v9 = +[NSURL URLWithString:@"maps:/car/instrumentcluster/map"];
    v18[0] = v9;
    v10 = +[NSURL URLWithString:@"maps:/car/instrumentcluster"];
    v18[1] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v18 count:2];
    mapBasedSuggestURLs = v2->_mapBasedSuggestURLs;
    v2->_mapBasedSuggestURLs = (NSArray *)v11;

    v13 = [(CarClusterSuggestionController *)v2 currentSession];
    v2->_isCarPlaySessionConnected = v13 != 0;

    v14 = +[MNNavigationService sharedService];
    [v14 registerObserver:v2];

    v15 = +[MNNavigationService sharedService];
    [v15 state];
    [(CarClusterSuggestionController *)v2 setIsNavigating:MNNavigationServiceStateIsNavigating()];

    [(CarClusterSuggestionController *)v2 _updateCurrentSuggestions];
  }
  return v2;
}

- (void)dealloc
{
  [(CarClusterSuggestionController *)self _cancelStopSuggestingTurnCardTimerIfNeeded];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(CARSessionStatus *)self->_carSessionStatus removeSessionObserver:self];
  v4 = +[MNNavigationService sharedService];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CarClusterSuggestionController;
  [(CarClusterSuggestionController *)&v5 dealloc];
}

- (CARSession)currentSession
{
  return (CARSession *)[(CARSessionStatus *)self->_carSessionStatus currentSession];
}

- (void)setIsCarPlaySessionConnected:(BOOL)a3
{
  if (self->_isCarPlaySessionConnected != a3)
  {
    self->_isCarPlaySessionConnected = a3;
    v4 = sub_100577AA4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_isCarPlaySessionConnected) {
        objc_super v5 = @"YES";
      }
      else {
        objc_super v5 = @"NO";
      }
      v6 = v5;
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "isCarPlaySessionConnected set to: %@", (uint8_t *)&v7, 0xCu);
    }
    [(CarClusterSuggestionController *)self _sendSuggestionIfNeeded];
  }
}

- (void)setIsNavigating:(BOOL)a3
{
  if (self->_isNavigating != a3)
  {
    BOOL v3 = a3;
    self->_isNavigating = a3;
    objc_super v5 = sub_100577AA4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      int v7 = v6;
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "isNavigating set to: %@", (uint8_t *)&v8, 0xCu);
    }
    [(CarClusterSuggestionController *)self _updateCurrentSuggestions];
  }
}

- (void)setShouldSuggestTurnCard:(BOOL)a3
{
  if (self->_shouldSuggestTurnCard != a3)
  {
    BOOL v3 = a3;
    self->_shouldSuggestTurnCard = a3;
    objc_super v5 = sub_100577AA4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      int v7 = v6;
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "shouldSuggestTurnCard set to: %@", (uint8_t *)&v8, 0xCu);
    }
    [(CarClusterSuggestionController *)self _updateCurrentSuggestions];
  }
}

- (void)setUsePersistentDisplay:(BOOL)a3
{
  if (self->_usePersistentDisplay != a3)
  {
    BOOL v3 = a3;
    self->_usePersistentDisplay = a3;
    objc_super v5 = sub_100577AA4();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v7 = [(CarClusterSuggestionController *)self debugDescription];
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "usePersistentDisplay set to YES. Canceling timer and sending suggestion. Current state: %@", (uint8_t *)&v9, 0xCu);
      }
      [(CarClusterSuggestionController *)self _startSuggestingTurnCard];
    }
    else
    {
      if (v6)
      {
        int v8 = [(CarClusterSuggestionController *)self debugDescription];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "usePersistentDisplay set to NO. Scheduling timer. Current state: %@", (uint8_t *)&v9, 0xCu);
      }
      [(CarClusterSuggestionController *)self _cancelStopSuggestingTurnCardTimerIfNeeded];
      [(CarClusterSuggestionController *)self _scheduleStopSuggestingTurnCardTimerIfNeeded];
    }
  }
}

- (void)setCurrentlySuggestingURLs:(id)a3
{
  id v5 = a3;
  currentlySuggestingURLs = self->_currentlySuggestingURLs;
  unint64_t v7 = (unint64_t)v5;
  id v8 = currentlySuggestingURLs;
  if (v7 | (unint64_t)v8)
  {
    int v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentlySuggestingURLs, a3);
      uint64_t v11 = sub_100577AA4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_currentlySuggestingURLs;
        v13 = v12;
        if (v12)
        {
          if ([(NSArray *)v12 count])
          {
            v14 = [(NSArray *)v13 componentsJoinedByString:@", "];
            v15 = +[NSString stringWithFormat:@"<%p> [%@]", v13, v14];
          }
          else
          {
            v15 = +[NSString stringWithFormat:@"<%p> (empty)", v13];
          }
        }
        else
        {
          v15 = @"<nil>";
        }

        *(_DWORD *)buf = 138412290;
        objc_super v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "currentlySuggestingURLs set to %@", buf, 0xCu);
      }
      [(CarClusterSuggestionController *)self _sendSuggestionIfNeeded];
    }
  }
}

- (NSString)debugDescription
{
  BOOL v3 = self->_currentlySuggestingURLs;
  v4 = v3;
  if (v3)
  {
    if ([(NSArray *)v3 count])
    {
      id v5 = [(NSArray *)v4 componentsJoinedByString:@", "];
      BOOL v6 = +[NSString stringWithFormat:@"<%p> [%@]", v4, v5];
    }
    else
    {
      BOOL v6 = +[NSString stringWithFormat:@"<%p> (empty)", v4];
    }
  }
  else
  {
    BOOL v6 = @"<nil>";
  }

  if (self->_shouldSuggestTurnCard) {
    unint64_t v7 = @"YES";
  }
  else {
    unint64_t v7 = @"NO";
  }
  if (self->_isNavigating) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  if (self->_usePersistentDisplay) {
    int v9 = @"YES";
  }
  else {
    int v9 = @"NO";
  }
  p_lastGuidanceEventId = &self->_lastGuidanceEventId;
  lastGuidanceEventId = self->_lastGuidanceEventId;
  if (p_lastGuidanceEventId[1]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = v12;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  objc_super v17 = [(NSUUID *)lastGuidanceEventId UUIDString];
  v18 = +[NSString stringWithFormat:@"_currentlySuggestingURLs: %@, _shouldSuggestTurnCard: %@, _isNavigating: %@, usePersistentDisplay: %@, timerActive: %@, currentSignInfo: %@", v6, v16, v15, v14, v13, v17];

  return (NSString *)v18;
}

- (void)_scheduleStopSuggestingTurnCardTimerIfNeeded
{
  if (!self->_stopSuggestingTurnCardTimer)
  {
    if (self->_usePersistentDisplay)
    {
      BOOL v3 = sub_100577AA4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = [(CarClusterSuggestionController *)self debugDescription];
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "scheduleStopSuggestingTurnCardTimerIfNeeded aborted, because _usePersistentDisplay is set. Current state: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      id v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_stopSuggestingTurnCardTimerFired" selector:0 userInfo:0 repeats:10.0];
      stopSuggestingTurnCardTimer = self->_stopSuggestingTurnCardTimer;
      self->_stopSuggestingTurnCardTimer = v5;
    }
  }
}

- (void)_cancelStopSuggestingTurnCardTimerIfNeeded
{
  stopSuggestingTurnCardTimer = self->_stopSuggestingTurnCardTimer;
  if (stopSuggestingTurnCardTimer)
  {
    [(NSTimer *)stopSuggestingTurnCardTimer invalidate];
    v4 = self->_stopSuggestingTurnCardTimer;
    self->_stopSuggestingTurnCardTimer = 0;
  }
}

- (void)_stopSuggestingTurnCardTimerFired
{
  BOOL usePersistentDisplay = self->_usePersistentDisplay;
  v4 = sub_100577AA4();
  id v5 = v4;
  if (usePersistentDisplay)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = [(CarClusterSuggestionController *)self debugDescription];
      int v8 = 138412290;
      int v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "timer fired despite _usePersistentDisplay set to yes, currentState: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = [(CarClusterSuggestionController *)self debugDescription];
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "timer fired, currentState: %@", (uint8_t *)&v8, 0xCu);
    }
    [(CarClusterSuggestionController *)self _cancelStopSuggestingTurnCardTimerIfNeeded];
    [(CarClusterSuggestionController *)self _stopSuggestingTurnCard];
  }
}

- (void)_sendOneTimeTurnCardSuggestion
{
  BOOL v3 = sub_100577AA4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_sendOneTimeTurnCardSuggestion, will cancel current stop suggestion timer.", v4, 2u);
  }

  [(CarClusterSuggestionController *)self _cancelStopSuggestingTurnCardTimerIfNeeded];
  [(CarClusterSuggestionController *)self _startSuggestingTurnCard];
  [(CarClusterSuggestionController *)self _scheduleStopSuggestingTurnCardTimerIfNeeded];
}

- (void)_startSuggestingTurnCard
{
  if ([(NSArray *)self->_turnCardSuggestURLs count])
  {
    if (self->_stopSuggestingTurnCardTimer)
    {
      BOOL v3 = sub_100577AA4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_startSuggestingTurnCard, will cancel current stop suggestion timer.", buf, 2u);
      }

      [(CarClusterSuggestionController *)self _cancelStopSuggestingTurnCardTimerIfNeeded];
    }
    v4 = sub_100577AA4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_startSuggestingTurnCard will start suggesting if not already suggesting", v6, 2u);
    }

    [(CarClusterSuggestionController *)self setShouldSuggestTurnCard:1];
  }
  else
  {
    id v5 = sub_100577AA4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "_turnCardSuggestURLs is empty, not sending suggestUI.", v8, 2u);
    }
  }
}

- (void)_stopSuggestingTurnCard
{
  [(CarClusterSuggestionController *)self _cancelStopSuggestingTurnCardTimerIfNeeded];
  BOOL v3 = sub_100577AA4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_stopSuggestingTurnCard will stop suggesting if not already stopped", v4, 2u);
  }

  [(CarClusterSuggestionController *)self setShouldSuggestTurnCard:0];
}

- (void)_updateCurrentSuggestions
{
  BOOL v3 = +[NSMutableArray array];
  id v5 = v3;
  if (self->_shouldSuggestTurnCard)
  {
    [v3 addObjectsFromArray:self->_turnCardSuggestURLs];
    BOOL v3 = v5;
  }
  if (self->_isNavigating)
  {
    [v5 addObjectsFromArray:self->_mapBasedSuggestURLs];
    BOOL v3 = v5;
  }
  id v4 = [v3 copy];
  [(CarClusterSuggestionController *)self setCurrentlySuggestingURLs:v4];
}

- (void)_sendSuggestionIfNeeded
{
  BOOL v3 = [(CarClusterSuggestionController *)self currentSession];

  id v4 = sub_100577AA4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      BOOL v6 = self->_currentlySuggestingURLs;
      int v7 = v6;
      if (v6)
      {
        if ([(NSArray *)v6 count])
        {
          int v8 = [(NSArray *)v7 componentsJoinedByString:@", "];
          int v9 = +[NSString stringWithFormat:@"<%p> [%@]", v7, v8];
        }
        else
        {
          int v9 = +[NSString stringWithFormat:@"<%p> (empty)", v7];
        }
      }
      else
      {
        int v9 = @"<nil>";
      }

      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_sendSuggestionIfNeeded is sending the following URLs: %@", buf, 0xCu);
    }
    id v4 = [(CarClusterSuggestionController *)self currentSession];
    [v4 suggestUI:self->_currentlySuggestingURLs];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_sendSuggestionIfNeeded tried to send suggestUI but session was nil.", buf, 2u);
  }
}

- (void)_clear
{
  self->_isNavigating = 0;
  [(CarClusterSuggestionController *)self _stopSuggestingTurnCard];
  lastGuidanceEventId = self->_lastGuidanceEventId;
  self->_lastGuidanceEventId = 0;
}

- (void)_supportedUrlsChanged:(id)a3
{
  id v4 = sub_100577AA4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_supportedUrlsChanged: supported URLs changed, resending suggestUI.", v5, 2u);
  }

  [(CarClusterSuggestionController *)self _sendSuggestionIfNeeded];
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100577AA4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sessionDidConnect: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CarClusterSuggestionController *)self setIsCarPlaySessionConnected:1];
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100577AA4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sessionDidDisconnect: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CarClusterSuggestionController *)self setIsCarPlaySessionConnected:0];
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating())
  {
    int v6 = sub_100577AA4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "navigationService changed state to .Navigating.", buf, 2u);
    }

    [(CarClusterSuggestionController *)self setIsNavigating:1];
    [(CarClusterSuggestionController *)self _sendOneTimeTurnCardSuggestion];
  }
  else if (MNNavigationServiceStateChangedFromNavigatingToStopped())
  {
    id v7 = sub_100577AA4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "navigationService changed state to .Stopped. Clearing out", v8, 2u);
    }

    [(CarClusterSuggestionController *)self setIsNavigating:0];
    [(CarClusterSuggestionController *)self _clear];
  }
}

- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = sub_100577AA4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = +[NSNumber numberWithBool:v4];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "navigationService updated usePersistentDisplay : %@", (uint8_t *)&v8, 0xCu);
  }
  [(CarClusterSuggestionController *)self setUsePersistentDisplay:v4];
}

- (void)navigationServiceDidEnterPreArrivalState:(id)a3
{
  BOOL v4 = sub_100577AA4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "navigationService didEnterPreArrivalState, sending suggestion update.", v5, 2u);
  }

  [(CarClusterSuggestionController *)self _startSuggestingTurnCard];
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = [a4 primarySign];
  signed int v8 = [v7 composedGuidanceEventIndex];

  int v9 = [v6 route];
  unsigned __int8 v10 = [v9 composedGuidanceEvents];
  id v11 = [v10 count];

  if ((unint64_t)v11 <= v8)
  {
    v14 = sub_100577AA4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "navigationService updateSignsWithInfo, navd sent incorrect guidanceEventIndex.", (uint8_t *)&v23, 2u);
    }
  }
  else
  {
    v12 = [v6 route];
    v13 = [v12 composedGuidanceEvents];
    v14 = [v13 objectAtIndexedSubscript:v8];

    if (v14)
    {
      v15 = [(NSUUID *)self->_lastGuidanceEventId UUIDString];
      v16 = [v14 uniqueID];
      objc_super v17 = [v16 UUIDString];
      unsigned __int8 v18 = [v15 isEqualToString:v17];

      if ((v18 & 1) == 0)
      {
        v19 = [v14 uniqueID];
        lastGuidanceEventId = self->_lastGuidanceEventId;
        self->_lastGuidanceEventId = v19;

        v21 = sub_100577AA4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [(NSUUID *)self->_lastGuidanceEventId UUIDString];
          int v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "navigationService updateSignsWithInfo new guidanceEvent: %@, sending suggestion update.", (uint8_t *)&v23, 0xCu);
        }
        [(CarClusterSuggestionController *)self _sendOneTimeTurnCardSuggestion];
      }
    }
  }
}

- (BOOL)shouldSuggestTurnCard
{
  return self->_shouldSuggestTurnCard;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (BOOL)shouldUsePersistentDisplay
{
  return self->_usePersistentDisplay;
}

- (BOOL)isCarPlaySessionConnected
{
  return self->_isCarPlaySessionConnected;
}

- (NSArray)currentlySuggestingURLs
{
  return self->_currentlySuggestingURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySuggestingURLs, 0);
  objc_storeStrong((id *)&self->_stopSuggestingTurnCardTimer, 0);
  objc_storeStrong((id *)&self->_lastGuidanceEventId, 0);
  objc_storeStrong((id *)&self->_mapBasedSuggestURLs, 0);
  objc_storeStrong((id *)&self->_turnCardSuggestURLs, 0);

  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end