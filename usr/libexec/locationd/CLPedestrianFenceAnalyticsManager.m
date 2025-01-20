@interface CLPedestrianFenceAnalyticsManager
- (BOOL)isAnySessionActive;
- (CLPedestrianFenceAnalyticsManager)init;
- (NSMutableArray)completedSessionsAwaitingPackets;
- (NSMutableDictionary)activeFenceSessions;
- (NSMutableDictionary)activeIntervalEvents;
- (NSMutableDictionary)activeOdometryClients;
- (NSMutableDictionary)fenceHistoryPerSession;
- (id).cxx_construct;
- (id)aggregateStatsFromPacket:(unint64_t)a3 to:(unint64_t)a4 useAOPDuration:(BOOL)a5;
- (void)cleanupPackets;
- (void)completeIntervalEventForClient:(id)a3 endingAt:(unint64_t)a4 setNew:(BOOL)a5;
- (void)createIntervalEventStartingAt:(unint64_t)a3;
- (void)dealloc;
- (void)endSessionForClient:(id)a3 startingAtTime:(double)a4 stoppingAtTime:(double)a5 sequenceNumber:(unint64_t)a6;
- (void)feedInertialOdometryPacket:(const InertialOdometryAnalytics *)a3 atTime:;
- (void)odometryClient:(id)a3 requestInterval:(double)a4 sequenceNumber:(unint64_t)a5;
- (void)processSingleFenceAnalyticsData:(id)a3;
- (void)sendAnalyticsForAllReadySessions;
- (void)setActiveFenceSessions:(id)a3;
- (void)setActiveIntervalEvents:(id)a3;
- (void)setActiveOdometryClients:(id)a3;
- (void)setCompletedSessionsAwaitingPackets:(id)a3;
- (void)setFenceHistoryPerSession:(id)a3;
- (void)startSessionForClient:(id)a3 sequenceNumber:(unint64_t)a4;
@end

@implementation CLPedestrianFenceAnalyticsManager

- (CLPedestrianFenceAnalyticsManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLPedestrianFenceAnalyticsManager;
  v2 = [(CLPedestrianFenceAnalyticsManager *)&v4 init];
  if (v2)
  {
    v2->_activeOdometryClients = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_activeIntervalEvents = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_activeFenceSessions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_fenceHistoryPerSession = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_completedSessionsAwaitingPackets = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_timestampLastLog = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  self->_activeOdometryClients = 0;
  self->_activeIntervalEvents = 0;

  self->_activeFenceSessions = 0;
  self->_fenceHistoryPerSession = 0;

  self->_completedSessionsAwaitingPackets = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceAnalyticsManager;
  [(CLPedestrianFenceAnalyticsManager *)&v3 dealloc];
}

- (void)processSingleFenceAnalyticsData:(id)a3
{
  if ([a3 hasValidData])
  {
    id v5 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "objectForKeyedSubscript:", [a3 clientIdentifier]);
    if (!v5)
    {
      id v5 = +[NSMutableArray array];
      -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "setObject:forKeyedSubscript:", v5, [a3 clientIdentifier]);
    }
    v10[0] = @"timestamp";
    [a3 timeFenceStart];
    v10[1] = @"isFenceStartEvent";
    v11[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v11[1] = &__kCFBooleanTrue;
    [v5 addObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2)];
    v8[0] = @"timestamp";
    [a3 timeFenceExit];
    v8[1] = @"isFenceStartEvent";
    v9[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v9[1] = &__kCFBooleanFalse;
    [v5 addObject:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2)];
    AnalyticsSendEventLazy();
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_1022DB128);
    }
    v6 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Analytics] Invalid fence metadata received, skipping", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_1022DB128);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager processSingleFenceAnalyticsData:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)startSessionForClient:(id)a3 sequenceNumber:(unint64_t)a4
{
  v6 = +[NSNumber numberWithUnsignedLongLong:a4];
  v7 = [(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions];

  [(NSMutableDictionary *)v7 setObject:v6 forKeyedSubscript:a3];
}

- (void)endSessionForClient:(id)a3 startingAtTime:(double)a4 stoppingAtTime:(double)a5 sequenceNumber:(unint64_t)a6
{
  id v11 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self fenceHistoryPerSession] objectForKeyedSubscript:a3];
  id v12 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions] objectForKeyedSubscript:a3];
  if (v12)
  {
    id v33 = v12;
    unint64_t v34 = a6;
    id v35 = a3;
    id v13 = [v11 sortedArrayUsingComparator:&stru_1022DB108];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v14)
    {
      id v15 = v14;
      unint64_t v16 = 0;
      int v17 = 0;
      uint64_t v18 = *(void *)v37;
      double v19 = 0.0;
      double v20 = 0.0;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v13);
          }
          v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"isFenceStartEvent"), "BOOLValue"))
          {
            if (v17)
            {
              ++v17;
            }
            else
            {
              [objc_msgSend(v22, "objectForKeyedSubscript:", @"timestamp") doubleValue];
              double v19 = v24;
              int v17 = 1;
            }
          }
          else
          {
            ++v16;
            if (!--v17)
            {
              [objc_msgSend(v22, "objectForKeyedSubscript:", @"timestamp") doubleValue];
              double v20 = v20 + v23 - v19;
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v15);
    }
    else
    {
      unint64_t v16 = 0;
      double v20 = 0.0;
    }
    id v26 = +[NSMutableDictionary dictionary];
    v41[0] = v35;
    v40[0] = @"fenceId";
    v40[1] = @"sessionDuration";
    double v27 = a5 - a4;
    v41[1] = +[NSNumber numberWithDouble:v27];
    v40[2] = @"totalDurationInFence";
    v41[2] = +[NSNumber numberWithDouble:v20];
    v40[3] = @"totalFenceCrossingCount";
    v41[3] = +[NSNumber numberWithUnsignedLong:v16];
    v40[4] = @"fenceTriggerRate";
    v41[4] = +[NSNumber numberWithDouble:(double)v16 * 3600.0 / v27];
    v41[5] = v33;
    v40[5] = @"sequenceNumberStart";
    v40[6] = @"sequenceNumberEnd";
    v28 = +[NSNumber numberWithUnsignedLongLong:v34];
    v40[7] = @"metricType";
    v41[6] = v28;
    v41[7] = &off_102392F00;
    [v26 addEntriesFromDictionary:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 8)];
    if (v16)
    {
      [v26 setObject:[NSNumber numberWithDouble:v20 / (double)v16] forKeyedSubscript:@"avgTimeInFence"];
      if (v16 != 1)
      {
        [objc_msgSend(objc_msgSend(objc_msgSend(v13, "firstObject"), "objectForKey:", @"timestamp"), "doubleValue");
        double v30 = v29;
        [objc_msgSend(objc_msgSend(objc_msgSend(v13, "lastObject"), "objectForKey:", @"timestamp"), "doubleValue");
        [v26 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v31 - v30 - v20) / (double)(v16 - 1)) forKeyedSubscript:@"avgTimeBetweenFences"];
      }
    }
    [(NSMutableArray *)[(CLPedestrianFenceAnalyticsManager *)self completedSessionsAwaitingPackets] addObject:v26];
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions] removeObjectForKey:v35];
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self fenceHistoryPerSession] removeObjectForKey:v35];
    [(CLPedestrianFenceAnalyticsManager *)self sendAnalyticsForAllReadySessions];
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_1022DB128);
    }
    v25 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = a3;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[Analytics] Can't end fence session for client %{public}@ that never started", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_1022DB128);
      }
      int v43 = 138543362;
      id v44 = a3;
      v32 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:]", "%s\n", v32);
      if (v32 != (char *)buf) {
        free(v32);
      }
    }
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self fenceHistoryPerSession] removeObjectForKey:a3];
  }
}

- (void)feedInertialOdometryPacket:(const InertialOdometryAnalytics *)a3 atTime:
{
  objc_super v4 = v3;
  long long v7 = *(_OWORD *)&a3->var14;
  long long v20 = *(_OWORD *)&a3->var10;
  long long v21 = v7;
  long long v22 = *(_OWORD *)&a3->var18;
  LOBYTE(v23) = a3[1].var5;
  long long v8 = *(_OWORD *)a3->var6;
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  long long v17 = v8;
  long long v9 = *(_OWORD *)&a3->var8[2];
  long long v18 = *(_OWORD *)&a3->var6[4];
  long long v19 = v9;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v11 = sub_100A61950((uint64_t **)&self->_odometryPackets, (unint64_t *)(&a3->var4 + 1));
  *((_OWORD *)v11 + 4) = v20;
  *((_OWORD *)v11 + 5) = v21;
  *((_OWORD *)v11 + 6) = v22;
  v11[14] = v23;
  *(_OWORD *)id v11 = *(_OWORD *)buf;
  *((_OWORD *)v11 + 1) = v17;
  *((_OWORD *)v11 + 2) = v18;
  *((_OWORD *)v11 + 3) = v19;
  v11[15] = v4;
  *((CFAbsoluteTime *)v11 + 16) = Current;
  [(CLPedestrianFenceAnalyticsManager *)self sendAnalyticsForAllReadySessions];
  if (self->_odometryPackets.__tree_.__pair3_.__value_ >= 0x5DD)
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_1022DB128);
    }
    id v12 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[Analytics] Too many packets accumulated, purging them", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_1022DB128);
      }
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager feedInertialOdometryPacket:atTime:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    left = self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_odometryPackets.__tree_.__pair1_;
    sub_100589514(left);
    p_pair1[-1].__value_.__left_ = p_pair1;
    p_pair1->__value_.__left_ = 0;
    p_pair1[1].__value_.__left_ = 0;
  }
}

- (void)odometryClient:(id)a3 requestInterval:(double)a4 sequenceNumber:(unint64_t)a5
{
  id v9 = +[NSMutableDictionary dictionary];
  v30[0] = @"eventTime";
  [+[NSDate date] timeIntervalSince1970];
  v31[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v31[1] = a3;
  v30[1] = @"identifier";
  v30[2] = @"odometryEvent";
  if (a4 == 0.0) {
    CFStringRef v10 = @"stop";
  }
  else {
    CFStringRef v10 = @"start";
  }
  v31[2] = v10;
  [v9 addEntriesFromDictionary:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3)];
  if (a4 != 0.0)
  {
    v22[0] = @"updateInterval";
    v23[0] = +[NSNumber numberWithDouble:a4];
    v22[1] = @"sequenceNumberStart";
    v23[1] = +[NSNumber numberWithUnsignedLongLong:a5];
    v22[2] = @"timeSessionStart";
    v23[2] = +[NSNumber numberWithDouble:sub_10016C458()];
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] setObject:+[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3] forKeyedSubscript:a3];
    [(CLPedestrianFenceAnalyticsManager *)self completeIntervalEventForClient:a3 endingAt:a5 setNew:1];
LABEL_21:
    [v9 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4) forKeyedSubscript:@"updateInterval"];
    sub_1000FC494((uint64_t)v9, (uint64_t)"InertialOdometryPowerMetric");
    return;
  }
  id v11 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] objectForKey:a3];
  if (v11)
  {
    id v12 = v11;
    [(CLPedestrianFenceAnalyticsManager *)self completeIntervalEventForClient:a3 endingAt:a5 setNew:0];
    v25[0] = a3;
    v24[0] = @"clientId";
    v24[1] = @"updateRate";
    [objc_msgSend(v12, "objectForKeyedSubscript:", @"updateInterval") doubleValue];
    double v14 = v13;
    double v15 = 0.0;
    if (v14 != 0.0)
    {
      if (v14 <= 1.0) {
        double v15 = 1.0 / v14;
      }
      else {
        double v15 = -v14;
      }
    }
    v25[1] = +[NSNumber numberWithDouble:v15];
    v24[2] = @"sessionDuration";
    double v18 = sub_10016C458();
    [objc_msgSend(v12, "objectForKeyedSubscript:", @"timeSessionStart") doubleValue];
    v25[2] = +[NSNumber numberWithDouble:v18 - v19];
    v24[3] = @"sequenceNumberStart";
    v25[3] = [v12 objectForKeyedSubscript:];
    v24[4] = @"sequenceNumberEnd";
    v24[5] = @"metricType";
    v25[4] = +[NSNumber numberWithUnsignedLongLong:a5];
    v25[5] = &off_102392F18;
    id v20 = [+[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6] mutableCopy];
    [(NSMutableArray *)[(CLPedestrianFenceAnalyticsManager *)self completedSessionsAwaitingPackets] addObject:v20];

    [objc_msgSend(v12, "objectForKeyedSubscript:", @"updateInterval") doubleValue];
    a4 = v21;
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] removeObjectForKey:a3];
    [(CLPedestrianFenceAnalyticsManager *)self sendAnalyticsForAllReadySessions];
    goto LABEL_21;
  }
  if (qword_1024192D0 != -1) {
    dispatch_once(&qword_1024192D0, &stru_1022DB128);
  }
  unint64_t v16 = qword_1024192D8;
  if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Analytics] Can't end fence session for client %{public}@ that never started", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_1022DB128);
    }
    int v26 = 138543362;
    id v27 = a3;
    long long v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager odometryClient:requestInterval:sequenceNumber:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
}

- (BOOL)isAnySessionActive
{
  return [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions] count]|| [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] count] != 0;
}

- (void)createIntervalEventStartingAt:(unint64_t)a3
{
  if ([(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions] count])
  {
    [(CLPedestrianFenceAnalyticsManager *)self completeIntervalEventForClient:@"fenceClient" endingAt:a3 setNew:1];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients];
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CLPedestrianFenceAnalyticsManager *)self completeIntervalEventForClient:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) endingAt:a3 setNew:1];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)sendAnalyticsForAllReadySessions
{
  if (self->_odometryPackets.__tree_.__pair3_.__value_)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_odometryPackets.__tree_.__pair1_;
    if (left)
    {
      do
      {
        objc_super v4 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)left[1];
      }
      while (left);
    }
    else
    {
      id v5 = &self->_odometryPackets.__tree_.__pair1_;
      do
      {
        objc_super v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)v5[2].__value_.__left_;
        BOOL v6 = *v4 == v5;
        id v5 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v4;
      }
      while (v6);
    }
    unint64_t v46 = (unint64_t)v4[4];
    id v43 = +[NSMutableArray array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v47 = self;
    obj = [(CLPedestrianFenceAnalyticsManager *)self completedSessionsAwaitingPackets];
    id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v73 count:16];
    if (v7)
    {
      p_odometryPackets = (uint64_t **)&self->_odometryPackets;
      uint64_t v45 = *(void *)v50;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v8);
          uint64_t v10 = [[objc_msgSend(v9, "objectForKeyedSubscript:", @"sequenceNumberEnd") unsignedShortValue];
          unint64_t v11 = v10 - 1;
          if (v46 < v10 - 1) {
            goto LABEL_52;
          }
          unint64_t v12 = [[v9 objectForKeyedSubscript:@"sequenceNumberStart"] unsignedShortValue];
          unint64_t v48 = v12;
          unsigned int v13 = [[v9 objectForKeyedSubscript:@"metricType"] intValue];
          [v9 removeObjectForKey:@"sequenceNumberStart"];
          [v9 removeObjectForKey:@"sequenceNumberEnd"];
          if (!v13) {
            [v9 removeObjectForKey:@"metricType"];
          }
          id v14 = [(CLPedestrianFenceAnalyticsManager *)v47 aggregateStatsFromPacket:v12 to:v10 useAOPDuration:v13 == 2];
          [v9 addEntriesFromDictionary:v14];
          double v15 = sub_10016C458();
          double v16 = v15;
          if (v13 == 2 && v15 - v47->_timestampLastLog <= 0.5) {
            goto LABEL_49;
          }
          long long v17 = (uint64_t *)p_pair1->__value_.__left_;
          if (!p_pair1->__value_.__left_)
          {
            id v20 = 0;
            goto LABEL_32;
          }
          double v18 = p_pair1->__value_.__left_;
          do
          {
            unint64_t v19 = v18[4];
            if (v19 <= v12)
            {
              if (v19 >= v12)
              {
                id v20 = sub_100A61950(p_odometryPackets, &v48)[15];
                long long v17 = (uint64_t *)p_pair1->__value_.__left_;
                if (p_pair1->__value_.__left_) {
                  goto LABEL_27;
                }
LABEL_32:
                double v23 = 0;
                goto LABEL_33;
              }
              ++v18;
            }
            double v18 = (void *)*v18;
          }
          while (v18);
          id v20 = 0;
          if (!v17) {
            goto LABEL_32;
          }
LABEL_27:
          double v21 = v17;
          while (2)
          {
            unint64_t v22 = v21[4];
            if (v11 < v22)
            {
LABEL_31:
              double v21 = (uint64_t *)*v21;
              if (!v21) {
                goto LABEL_32;
              }
              continue;
            }
            break;
          }
          if (v22 < v11)
          {
            ++v21;
            goto LABEL_31;
          }
          do
          {
            while (1)
            {
              double v30 = (uint64_t **)v17;
              unint64_t v31 = v17[4];
              if (v11 >= v31) {
                break;
              }
              long long v17 = *v30;
              if (!*v30)
              {
                v32 = v30;
                goto LABEL_60;
              }
            }
            if (v31 >= v11) {
              goto LABEL_61;
            }
            long long v17 = v30[1];
          }
          while (v17);
          v32 = v30 + 1;
LABEL_60:
          id v33 = (char *)operator new(0xB0uLL);
          *((void *)v33 + 4) = v11;
          *(_OWORD *)(v33 + 40) = 0u;
          *(_OWORD *)(v33 + 56) = 0u;
          *(_OWORD *)(v33 + 72) = 0u;
          *(_OWORD *)(v33 + 88) = 0u;
          *(_OWORD *)(v33 + 104) = 0u;
          *(_OWORD *)(v33 + 120) = 0u;
          *(_OWORD *)(v33 + 136) = 0u;
          *(_OWORD *)(v33 + 152) = 0u;
          *((void *)v33 + 21) = 0;
          sub_1000EDF90(p_odometryPackets, (uint64_t)v30, v32, (uint64_t *)v33);
          double v30 = (uint64_t **)v33;
LABEL_61:
          double v23 = v30[21];
LABEL_33:
          if (qword_1024192D0 != -1) {
            dispatch_once(&qword_1024192D0, &stru_1022DB128);
          }
          double v24 = qword_1024192D8;
          if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
          {
            v25 = "unexpected";
            if (v13 == 2) {
              v25 = "interval";
            }
            if (v13 == 1) {
              v25 = "odometrySession";
            }
            if (v13) {
              int v26 = v25;
            }
            else {
              int v26 = "fenceSession";
            }
            if (v13) {
              CFStringRef v27 = @"clientId";
            }
            else {
              CFStringRef v27 = @"fenceId";
            }
            v28 = +[NSString stringWithUTF8String:v26];
            id v29 = [v9 objectForKeyedSubscript:v27];
            *(_DWORD *)buf = 138544386;
            v64 = v28;
            __int16 v65 = 2114;
            id v66 = v29;
            __int16 v67 = 2050;
            v68 = v20;
            __int16 v69 = 2050;
            v70 = v23;
            __int16 v71 = 2114;
            id v72 = v14;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Analytics] type,%{public}@,client,%{public}@,from,%{public}f,to,%{public}f: %{public}@", buf, 0x34u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024192D0 != -1) {
              dispatch_once(&qword_1024192D0, &stru_1022DB128);
            }
            unint64_t v34 = "unexpected";
            if (v13 == 2) {
              unint64_t v34 = "interval";
            }
            if (v13 == 1) {
              unint64_t v34 = "odometrySession";
            }
            if (v13) {
              id v35 = v34;
            }
            else {
              id v35 = "fenceSession";
            }
            if (v13) {
              CFStringRef v36 = @"clientId";
            }
            else {
              CFStringRef v36 = @"fenceId";
            }
            long long v37 = +[NSString stringWithUTF8String:v35];
            id v38 = [v9 objectForKeyedSubscript:v36];
            int v53 = 138544386;
            v54 = v37;
            __int16 v55 = 2114;
            id v56 = v38;
            __int16 v57 = 2050;
            v58 = v20;
            __int16 v59 = 2050;
            v60 = v23;
            __int16 v61 = 2114;
            id v62 = v14;
            long long v39 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions]", "%s\n", v39);
            if (v39 != (char *)buf) {
              free(v39);
            }
          }
          v47->_timestampLastLog = v16;
          if (v13 == 2)
          {
LABEL_49:
            if ([[objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"clientId"), "isEqualToString:", @"fenceClient") boolValue] == 0)goto LABEL_50; {
          }
            }
          else
          {
LABEL_50:
            +[NSDictionary dictionaryWithDictionary:v9];
            AnalyticsSendEventLazy();
          }
          [v43 addObject:v9];
LABEL_52:
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v8 != v7);
        id v40 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v73 count:16];
        id v7 = v40;
      }
      while (v40);
    }
    [(NSMutableArray *)[(CLPedestrianFenceAnalyticsManager *)v47 completedSessionsAwaitingPackets] removeObjectsInArray:v43];
    [(CLPedestrianFenceAnalyticsManager *)v47 cleanupPackets];
  }
}

- (id)aggregateStatsFromPacket:(unint64_t)a3 to:(unint64_t)a4 useAOPDuration:(BOOL)a5
{
  char v53 = 0;
  memset(v52, 0, sizeof(v52));
  *(_DWORD *)((char *)&v52[4] + 1) = 2139095039;
  *(_DWORD *)((char *)&v52[5] + 1) = 2139095039;
  unint64_t v51 = a3;
  if (a3 >= a4) {
    return &__NSDictionary0__struct;
  }
  unint64_t v6 = a3;
  BOOL v44 = a5;
  uint64_t v50 = 0;
  unsigned __int16 v8 = 0;
  p_odometryPackets = (uint64_t **)&self->_odometryPackets;
  int v9 = 0;
  float v10 = 0.0;
  float v11 = 0.0;
  uint64_t v46 = 2139095039;
  uint64_t v48 = 2139095039;
  double v49 = 0.0;
  float v12 = 0.0;
  float v13 = 0.0;
  float v47 = 0.0;
  float v14 = 0.0;
  float v15 = 0.0;
  do
  {
    for (i = self->_odometryPackets.__tree_.__pair1_.__value_.__left_; i; i = (void *)*i)
    {
      unint64_t v17 = i[4];
      if (v6 >= v17)
      {
        if (v17 >= v6)
        {
          id v20 = sub_100A61950(p_odometryPackets, &v51);
          for (uint64_t j = 0; j != 20; j += 4)
          {
            float v22 = *(float *)((char *)v20 + j + 13);
            *(float *)(((unint64_t)v52 | 0xD) + j) = v22 + *(float *)(((unint64_t)v52 | 0xD) + j);
            float v15 = v15 + v22;
          }
          uint64_t v23 = 0;
          float v14 = *(float *)((char *)v20 + 33) + *(float *)((char *)&v52[2] + 1);
          *(float *)((char *)&v52[2] + 1) = v14;
          do
          {
            *(float *)((char *)&v52[2] + v23 + 5) = *(float *)((char *)v20 + v23 + 37)
                                                  + *(float *)((char *)&v52[2] + v23 + 5);
            v23 += 4;
          }
          while (v23 != 20);
          int8x8_t v24 = *(int8x8_t *)((char *)v20 + 65);
          *(float32x2_t *)((char *)&v52[3] + 9) = vadd_f32(*(float32x2_t *)((char *)v20 + 57), *(float32x2_t *)((char *)&v52[3] + 9));
          *(int8x8_t *)((char *)&v52[4] + 1) = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v24.u32[1], *(unsigned int *)((char *)&v52[4] + 1)), (float32x2_t)__PAIR64__(*(unsigned int *)((char *)&v52[4] + 5), v24.u32[0])), v24, *(int8x8_t *)((char *)&v52[4] + 1));
          int8x8_t v25 = *(int8x8_t *)((char *)v20 + 81);
          *(float32x2_t *)((char *)&v52[4] + 9) = vadd_f32(*(float32x2_t *)((char *)v20 + 73), *(float32x2_t *)((char *)&v52[4] + 9));
          *(int8x8_t *)((char *)&v52[5] + 1) = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v25.u32[1], *(unsigned int *)((char *)&v52[5] + 1)), (float32x2_t)__PAIR64__(*(unsigned int *)((char *)&v52[5] + 5), v25.u32[0])), v25, *(int8x8_t *)((char *)&v52[5] + 1));
          float v10 = *(float *)((char *)v20 + 89) + *(float *)((char *)&v52[5] + 9);
          *(float *)((char *)&v52[5] + 9) = v10;
          v8 += *(_WORD *)((char *)v20 + 93);
          LOWORD(v50) = v50 + *(_WORD *)((char *)v20 + 95);
          WORD2(v50) += *(_WORD *)((char *)v20 + 97);
          float v47 = *(float *)((char *)&v52[3] + 9);
          uint64_t v48 = *(void *)((char *)&v52[4] + 1);
          float v13 = *(float *)((char *)&v52[3] + 13);
          double v49 = *(double *)((char *)&v52[4] + 9);
          float v11 = *(float *)((char *)&v52[4] + 13);
          float v12 = *(float *)((char *)&v52[4] + 5);
          uint64_t v46 = *(void *)((char *)&v52[5] + 1);
          int v9 = *(_DWORD *)((char *)&v52[5] + 5);
          goto LABEL_22;
        }
        ++i;
      }
    }
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_1022DB128);
    }
    double v18 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Missing packet with sequence number: %{public}llu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_1022DB128);
      }
      int v54 = 134349056;
      unint64_t v55 = v6;
      unint64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceAnalyticsManager aggregateStatsFromPacket:to:useAOPDuration:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
LABEL_22:
    unint64_t v51 = ++v6;
  }
  while (v6 != a4);
  if (v15 < 0.1) {
    return &__NSDictionary0__struct;
  }
  id v26 = +[NSMutableDictionary dictionary];
  if (v44)
  {
    *(float *)&double v27 = v15;
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27) forKeyedSubscript:@"sessionDuration"];
  }
  float v28 = 100.0 / v15;
  *(float *)&double v27 = v28 * *(float *)((char *)v52 + 13);
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27) forKeyedSubscript:@"percentTimeInNull"];
  *(float *)&double v29 = v28 * *(float *)((char *)&v52[1] + 1);
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29) forKeyedSubscript:@"percentTimeInKM"];
  *(float *)&double v30 = v28 * *(float *)((char *)&v52[1] + 5);
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30) forKeyedSubscript:@"percentTimeInPDR"];
  *(float *)&double v31 = v28 * *(float *)((char *)&v52[1] + 9);
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31) forKeyedSubscript:@"percentTimeInPDRSemiStatic"];
  *(float *)&double v32 = v28 * *(float *)((char *)&v52[1] + 13);
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32) forKeyedSubscript:@"percentTimeInStatic"];
  *(float *)&double v33 = v28 * v14;
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33) forKeyedSubscript:@"percentTimeInPedestrian"];
  if (v14 > 0.0)
  {
    *(float *)&double v34 = (float)(100.0 / v14) * *(float *)((char *)&v52[2] + 5);
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34) forKeyedSubscript:@"percentTimePlacementIsUnknown"];
    *(float *)&double v35 = (float)(100.0 / v14) * *(float *)((char *)&v52[2] + 9);
    [v26 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35)] forKeyedSubscript:@"percentTimePlacementIsOnBody"];
    *(float *)&double v36 = (float)(100.0 / v14) * *(float *)((char *)&v52[2] + 13);
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36) forKeyedSubscript:@"percentTimePlacementIsViewing"];
    *(float *)&double v37 = (float)(100.0 / v14) * *(float *)((char *)&v52[3] + 1);
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v37) forKeyedSubscript:@"percentTimePlacementIsArmSwing"];
    *(float *)&double v38 = (float)(100.0 / v14) * *(float *)((char *)&v52[3] + 5);
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38) forKeyedSubscript:@"percentTimePlacementIsLegSwing"];
  }
  *(float *)&double v34 = sqrtf((float)(v13 * v13) + (float)(v47 * v47));
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34) forKeyedSubscript:@"horizontalDisplacement"];
  HIDWORD(v39) = HIDWORD(v48);
  *(float *)&double v39 = v12 - *(float *)&v48;
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v39) forKeyedSubscript:@"maxDeltaElevation"];
  [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v49) forKeyedSubscript:@"distanceTraveled"];
  double v40 = *(float *)&v49;
  if (*(float *)&v49 > 0.000001)
  {
    *(float *)&double v40 = (float)(100.0 / *(float *)&v49) * (float)(*(float *)&v49 - v11);
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40) forKeyedSubscript:@"percentDisplacementInKM"];
    *(float *)&double v41 = (float)(100.0 / *(float *)&v49) * v11;
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v41) forKeyedSubscript:@"percentDisplacementInPDR"];
  }
  if (v8)
  {
    *(float *)&double v40 = v10 / (float)v8;
    [v26 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40) forKeyedSubscript:@"avgSpeed"];
    [v26 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", *(double *)&v46)] forKeyedSubscript:@"minSpeed"];
    LODWORD(v42) = v9;
    [v26 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v42)] forKeyedSubscript:@"maxSpeed"];
  }
  [v26 setObject:[+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v50) forKeyedSubscript:@"dotJumpCount"];
  [v26 setObject:[+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD2(v50))] forKeyedSubscript:@"placementTransitionCount"];
  return v26;
}

- (void)completeIntervalEventForClient:(id)a3 endingAt:(unint64_t)a4 setNew:(BOOL)a5
{
  BOOL v5 = a5;
  if (-[NSMutableDictionary objectForKey:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "objectForKey:", a3)&& objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "objectForKeyedSubscript:", a3), "unsignedLongLongValue") != (id)a4)
  {
    id v9 = +[NSMutableDictionary dictionary];
    v15[0] = a3;
    v14[0] = @"clientId";
    v14[1] = @"sequenceNumberStart";
    v15[1] = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeIntervalEvents] objectForKeyedSubscript:a3];
    v14[2] = @"sequenceNumberEnd";
    v14[3] = @"metricType";
    v15[2] = +[NSNumber numberWithUnsignedLongLong:a4];
    v15[3] = &off_102392F30;
    [v9 addEntriesFromDictionary:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4)];
    id v10 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] objectForKeyedSubscript:a3];
    if (v10)
    {
      [objc_msgSend(v10, "objectForKeyedSubscript:", @"updateInterval") doubleValue];
      double v12 = v11;
      double v13 = 0.0;
      if (v12 != 0.0)
      {
        if (v12 <= 1.0) {
          double v13 = 1.0 / v12;
        }
        else {
          double v13 = -v12;
        }
      }
      [v9 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13) forKeyedSubscript:@"updateRate"];
    }
    [(NSMutableArray *)[(CLPedestrianFenceAnalyticsManager *)self completedSessionsAwaitingPackets] addObject:v9];
  }
  if (v5) {
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeIntervalEvents] setObject:+[NSNumber numberWithUnsignedLongLong:a4] forKeyedSubscript:a3];
  }
  else {
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeIntervalEvents] removeObjectForKey:a3];
  }
}

- (void)cleanupPackets
{
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] allValues];
  id v4 = [v3 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v43;
    unint64_t v6 = -1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned __int16 v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (v6 >= [v8[@"sequenceNumberStart"] unsignedShortValue])unint64_t v6 = [v8[@"sequenceNumberStart"] unsignedShortValue]; {
      }
        }
      id v4 = [v3 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v6 = -1;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions] allValues];
  id v10 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v10; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
        if (v6 >= [v13 unsignedShortValue]) {
          unint64_t v6 = [v13 unsignedShortValue];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v10);
  }
  if (![(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeFenceSessions] count]&& ![(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeOdometryClients] count])
  {
    [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeIntervalEvents] removeAllObjects];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = [(NSMutableDictionary *)[(CLPedestrianFenceAnalyticsManager *)self activeIntervalEvents] allValues];
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      for (k = 0; k != v15; k = (char *)k + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v14);
        }
        double v18 = *(void **)(*((void *)&v34 + 1) + 8 * (void)k);
        if (v6 >= [v18 unsignedShortValue]) {
          unint64_t v6 = [v18 unsignedShortValue];
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v15);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v19 = [(CLPedestrianFenceAnalyticsManager *)self completedSessionsAwaitingPackets];
  id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (m = 0; m != v20; m = (char *)m + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void **)(*((void *)&v30 + 1) + 8 * (void)m);
        if (v6 >= [v23 objectForKeyedSubscript:@"sequenceNumberStart"][unsignedShortValue])unint64_t v6 = [v23 objectForKeyedSubscript:@"sequenceNumberStart"][unsignedShortValue]; {
      }
        }
      id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v20);
  }
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)self->_odometryPackets.__tree_.__begin_node_;
  if (begin_node != &self->_odometryPackets.__tree_.__pair1_)
  {
    do
    {
      left = (CLPedestrianFenceAnalyticsManager *)begin_node[1].__value_.__left_;
      if (begin_node[4].__value_.__left_ >= (void *)v6)
      {
        if (left)
        {
          do
          {
            double v27 = left;
            left = (CLPedestrianFenceAnalyticsManager *)left->super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            double v27 = (CLPedestrianFenceAnalyticsManager *)begin_node[2].__value_.__left_;
            BOOL v28 = v27->super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v27;
          }
          while (!v28);
        }
      }
      else
      {
        id v26 = (CLPedestrianFenceAnalyticsManager **)begin_node;
        if (left)
        {
          do
          {
            double v27 = left;
            left = (CLPedestrianFenceAnalyticsManager *)left->super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            double v27 = v26[2];
            BOOL v28 = v27->super.isa == (Class)v26;
            id v26 = (CLPedestrianFenceAnalyticsManager **)v27;
          }
          while (!v28);
        }
        if (self->_odometryPackets.__tree_.__begin_node_ == begin_node) {
          self->_odometryPackets.__tree_.__begin_node_ = v27;
        }
        double v29 = (uint64_t *)self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
        --self->_odometryPackets.__tree_.__pair3_.__value_;
        sub_1000F0AA4(v29, (uint64_t *)begin_node);
        operator delete(begin_node);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v27;
    }
    while (v27 != (CLPedestrianFenceAnalyticsManager *)&self->_odometryPackets.__tree_.__pair1_);
  }
}

- (NSMutableDictionary)activeOdometryClients
{
  return self->_activeOdometryClients;
}

- (void)setActiveOdometryClients:(id)a3
{
}

- (NSMutableDictionary)activeIntervalEvents
{
  return self->_activeIntervalEvents;
}

- (void)setActiveIntervalEvents:(id)a3
{
}

- (NSMutableDictionary)activeFenceSessions
{
  return self->_activeFenceSessions;
}

- (void)setActiveFenceSessions:(id)a3
{
}

- (NSMutableArray)completedSessionsAwaitingPackets
{
  return self->_completedSessionsAwaitingPackets;
}

- (void)setCompletedSessionsAwaitingPackets:(id)a3
{
}

- (NSMutableDictionary)fenceHistoryPerSession
{
  return self->_fenceHistoryPerSession;
}

- (void)setFenceHistoryPerSession:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

@end