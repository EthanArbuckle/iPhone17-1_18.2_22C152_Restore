@interface CSDUserActivityCommunicator
- (CSDUserActivity)currentlyBroadcastedActivity;
- (CSDUserActivityCommunicator)init;
- (CSDUserActivityCommunicatorDelegate)delegate;
- (NSMutableDictionary)listeningIdentifiersByActivityType;
- (NSMutableOrderedSet)activityQueue;
- (OS_dispatch_queue)queue;
- (UABestAppSuggestion)mostRecentBestAppSuggestion;
- (UABestAppSuggestionManager)bestAppSuggestionManager;
- (id)_untrackListenedActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4;
- (id)queuedActivitiesOfType:(unsigned int)a3;
- (void)_broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5;
- (void)_listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_stopBroadcastingActivity:(id)a3;
- (void)_stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4;
- (void)_stopListeningForBestAppSuggestionIfAppropriate;
- (void)_trackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_untrackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_updateCurrentlyBroadcastedActivity;
- (void)bestAppSuggestionChanged:(id)a3;
- (void)broadcastActivity:(id)a3;
- (void)broadcastActivity:(id)a3 withTimeout:(double)a4;
- (void)broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5;
- (void)listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)setActivityQueue:(id)a3;
- (void)setBestAppSuggestionManager:(id)a3;
- (void)setCurrentlyBroadcastedActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListeningIdentifiersByActivityType:(id)a3;
- (void)setMostRecentBestAppSuggestion:(id)a3;
- (void)setQueue:(id)a3;
- (void)stopBroadcastingActivity:(id)a3;
- (void)stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4;
@end

@implementation CSDUserActivityCommunicator

- (CSDUserActivityCommunicator)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSDUserActivityCommunicator;
  v2 = [(CSDUserActivityCommunicator *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.useractivitycommunicator", 0);
    [(CSDUserActivityCommunicator *)v2 setQueue:v3];

    v4 = +[NSMutableOrderedSet orderedSet];
    [(CSDUserActivityCommunicator *)v2 setActivityQueue:v4];

    v5 = +[NSMutableDictionary dictionary];
    [(CSDUserActivityCommunicator *)v2 setListeningIdentifiersByActivityType:v5];

    id v6 = objc_alloc_init((Class)UABestAppSuggestionManager);
    [(CSDUserActivityCommunicator *)v2 setBestAppSuggestionManager:v6];

    v7 = [(CSDUserActivityCommunicator *)v2 bestAppSuggestionManager];
    [v7 setDelegate:v2];
  }
  return v2;
}

- (CSDUserActivity)currentlyBroadcastedActivity
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100148EE0;
  v11 = sub_100148EF0;
  id v12 = 0;
  dispatch_queue_t v3 = [(CSDUserActivityCommunicator *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100148EF8;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CSDUserActivity *)v4;
}

- (id)queuedActivitiesOfType:(unsigned int)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100148EE0;
  v14 = sub_100148EF0;
  id v15 = +[NSMutableSet set];
  v5 = [(CSDUserActivityCommunicator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100149048;
  block[3] = &unk_100508590;
  unsigned int v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)broadcastActivity:(id)a3
{
}

- (void)broadcastActivity:(id)a3 withTimeout:(double)a4
{
}

- (void)broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5
{
  id v8 = a3;
  unsigned int v9 = [(CSDUserActivityCommunicator *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100149284;
  v11[3] = &unk_1005085B8;
  v11[4] = self;
  id v12 = v8;
  double v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)stopBroadcastingActivity:(id)a3
{
  id v4 = a3;
  v5 = [(CSDUserActivityCommunicator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014934C;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDUserActivityCommunicator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100149414;
  block[3] = &unk_100507B08;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDUserActivityCommunicator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001494E0;
  block[3] = &unk_100507B08;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDUserActivityCommunicator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001495AC;
  block[3] = &unk_100507B08;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)_updateCurrentlyBroadcastedActivity
{
  dispatch_queue_t v3 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v3);

  currentlyBroadcastedActivity = self->_currentlyBroadcastedActivity;
  v5 = [(CSDUserActivityCommunicator *)self activityQueue];
  id v6 = [v5 firstObject];

  if (currentlyBroadcastedActivity != v6)
  {
    uint64_t v7 = [(CSDUserActivityCommunicator *)self activityQueue];
    id v8 = [v7 firstObject];
    unsigned int v9 = self->_currentlyBroadcastedActivity;
    self->_currentlyBroadcastedActivity = v8;

    id v10 = [(CSDUserActivity *)self->_currentlyBroadcastedActivity userActivity];
    [v10 becomeCurrent];

    unsigned int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = self->_currentlyBroadcastedActivity;
      int v13 = 138412290;
      BOOL v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated currently broadcasted activity to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v8;
      __int16 v23 = 2048;
      double v24 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Queueing activity at beginning of queue: %@ (timeout: %f)", buf, 0x16u);
    }

    id v12 = [(CSDUserActivityCommunicator *)self activityQueue];
    [v12 insertObject:v8 atIndex:0];
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v8;
      __int16 v23 = 2048;
      double v24 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Queueing activity at end of queue: %@ (timeout: %f)", buf, 0x16u);
    }

    id v12 = [(CSDUserActivityCommunicator *)self activityQueue];
    [v12 addObject:v8];
  }

  if (a4 >= 0.0)
  {
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    BOOL v14 = [(CSDUserActivityCommunicator *)self queue];
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10014990C;
    v18 = &unk_100504F10;
    v19 = self;
    id v20 = v8;
    dispatch_after(v13, v14, &v15);
  }
  [(CSDUserActivityCommunicator *)self _updateCurrentlyBroadcastedActivity];
}

- (void)_stopBroadcastingActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dequeueing activity: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [(CSDUserActivityCommunicator *)self activityQueue];
  [v7 removeObject:v4];

  id v8 = [v4 userActivity];
  [v8 invalidate];

  [(CSDUserActivityCommunicator *)self _updateCurrentlyBroadcastedActivity];
}

- (void)_listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    +[CSDUserActivity registerActivityType:v4 dynamicIdentifier:v6];
    [(CSDUserActivityCommunicator *)self _trackListenedActivityType:v4 dynamicIdentifier:v6];
    unsigned int v8 = +[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:v4];
    int v9 = sub_100008DCC();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        BOOL v11 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
        int v13 = 67109634;
        int v14 = v4;
        __int16 v15 = 2112;
        id v16 = v6;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered to listen for activity type %d and dynamic identifier %@ and started listening for best app suggestions, now tracking: %@", (uint8_t *)&v13, 0x1Cu);
      }
      int v9 = [(CSDUserActivityCommunicator *)self bestAppSuggestionManager];
      [v9 startListeningForBestAppSuggestions];
    }
    else if (v10)
    {
      id v12 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
      int v13 = 67109634;
      int v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered to listen for activity type %d and dynamic identifier %@, now tracking: %@", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1003AD35C(v9);
    }
  }
}

- (void)_stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v7);

  +[CSDUserActivity unregisterActivityType:v4 dynamicIdentifier:v6];
  [(CSDUserActivityCommunicator *)self _untrackListenedActivityType:v4 dynamicIdentifier:v6];
  unsigned int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    v10[0] = 67109634;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregistered to listen for activity type %d and dynamic identifier %@, now tracking: %@", (uint8_t *)v10, 0x1Cu);
  }
  if (+[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:v4])
  {
    [(CSDUserActivityCommunicator *)self _stopListeningForBestAppSuggestionIfAppropriate];
  }
}

- (void)_stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    unsigned int v8 = [(CSDUserActivityCommunicator *)self _untrackListenedActivityType:v4 matchingDynamicIdentifierSubstring:v6];
    int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v23 = v4;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unregistering dynamic identifiers of type %d, matching substring %@: %@", buf, 0x1Cu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        int v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          +[CSDUserActivity unregisterActivityType:dynamicIdentifier:](CSDUserActivity, "unregisterActivityType:dynamicIdentifier:", v4, *(void *)(*((void *)&v17 + 1) + 8 * (void)v14), (void)v17);
          int v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    __int16 v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
      *(_DWORD *)buf = 67109378;
      int v23 = v4;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unregistered to listen for activity type %d, now tracking: %@", buf, 0x12u);
    }
    if (+[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:v4])
    {
      [(CSDUserActivityCommunicator *)self _stopListeningForBestAppSuggestionIfAppropriate];
    }
  }
  else
  {
    BOOL v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1003AD3A0(v10);
    }
  }
}

- (void)_stopListeningForBestAppSuggestionIfAppropriate
{
  dispatch_queue_t v3 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
  BOOL v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      if (+[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:](CSDUserActivity, "activityTypeRequiresBestAppSuggestionListener:", [v10 intValue]))
      {
        id v11 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
        id v12 = [v11 objectForKeyedSubscript:v10];
        id v13 = [v12 count];

        if (v13) {
          break;
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Stopped listening for best app suggestions", v15, 2u);
    }

    BOOL v5 = [(CSDUserActivityCommunicator *)self bestAppSuggestionManager];
    [v5 stopListeningForBestAppSuggestions];
  }
}

- (void)_trackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v13 = a4;
  id v6 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:v4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    BOOL v10 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    id v11 = +[NSNumber numberWithUnsignedInt:v4];
    id v12 = [v10 objectForKeyedSubscript:v11];
    [v12 addObject:v13];
  }
  else
  {
    BOOL v10 = +[NSMutableSet setWithObject:v13];
    id v11 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    id v12 = +[NSNumber numberWithUnsignedInt:v4];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (void)_untrackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v20 = a4;
  id v6 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:v4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    BOOL v10 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    id v11 = +[NSNumber numberWithUnsignedInt:v4];
    id v12 = [v10 objectForKeyedSubscript:v11];
    id v13 = v12;
    if (v20) {
      objc_msgSend(v12, "removeObject:");
    }
    else {
      [v12 removeAllObjects];
    }

    int v14 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    __int16 v15 = +[NSNumber numberWithUnsignedInt:v4];
    long long v16 = [v14 objectForKeyedSubscript:v15];
    id v17 = [v16 count];

    if (!v17)
    {
      long long v18 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
      long long v19 = +[NSNumber numberWithUnsignedInt:v4];
      [v18 setObject:0 forKeyedSubscript:v19];
    }
  }
}

- (id)_untrackListenedActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(CSDUserActivityCommunicator *)self queue];
  dispatch_assert_queue_V2(v7);

  id v40 = +[NSMutableArray array];
  uint64_t v8 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
  uint64_t v9 = LSApplicationWorkspace_ptr;
  BOOL v10 = +[NSNumber numberWithUnsignedInt:v4];
  id v11 = [v8 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    id v13 = +[NSNumber numberWithUnsignedInt:v4];
    int v14 = [v12 objectForKeyedSubscript:v13];
    id v15 = [v14 copy];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v42;
      id v38 = v6;
      uint64_t v39 = *(void *)v42;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if ([v21 containsString:v6])
          {
            [v40 addObject:v21];
            id v22 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
            [v9[33] numberWithUnsignedInt:v4];
            v24 = int v23 = v9;
            [v22 objectForKeyedSubscript:v24];
            id v25 = v18;
            id v26 = v16;
            v27 = self;
            v29 = uint64_t v28 = v4;
            [v29 removeObject:v21];

            uint64_t v4 = v28;
            self = v27;
            id v16 = v26;
            id v18 = v25;

            uint64_t v9 = v23;
            id v6 = v38;
            uint64_t v19 = v39;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v18);
    }

    v30 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
    v31 = [v9[33] numberWithUnsignedInt:v4];
    v32 = [v30 objectForKeyedSubscript:v31];
    v33 = v9;
    id v34 = [v32 count];

    if (!v34)
    {
      v35 = [(CSDUserActivityCommunicator *)self listeningIdentifiersByActivityType];
      v36 = [v33[33] numberWithUnsignedInt:v4];
      [v35 setObject:0 forKeyedSubscript:v36];
    }
  }

  return v40;
}

- (void)bestAppSuggestionChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDUserActivityCommunicator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014A848;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (CSDUserActivityCommunicatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDUserActivityCommunicatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableOrderedSet)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (void)setCurrentlyBroadcastedActivity:(id)a3
{
}

- (UABestAppSuggestionManager)bestAppSuggestionManager
{
  return self->_bestAppSuggestionManager;
}

- (void)setBestAppSuggestionManager:(id)a3
{
}

- (UABestAppSuggestion)mostRecentBestAppSuggestion
{
  return self->_mostRecentBestAppSuggestion;
}

- (void)setMostRecentBestAppSuggestion:(id)a3
{
}

- (NSMutableDictionary)listeningIdentifiersByActivityType
{
  return self->_listeningIdentifiersByActivityType;
}

- (void)setListeningIdentifiersByActivityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningIdentifiersByActivityType, 0);
  objc_storeStrong((id *)&self->_mostRecentBestAppSuggestion, 0);
  objc_storeStrong((id *)&self->_bestAppSuggestionManager, 0);
  objc_storeStrong((id *)&self->_currentlyBroadcastedActivity, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end