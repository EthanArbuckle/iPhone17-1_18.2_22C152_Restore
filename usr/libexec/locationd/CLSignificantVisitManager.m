@interface CLSignificantVisitManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)armed;
- (BOOL)clientInterestStoreGetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int *)a5;
- (BOOL)clientInterestStoreSetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int)a5;
- (BOOL)interestForClientKey:(const char *)a3 outInterest:(int *)a4;
- (BOOL)interestTypeForClientKey:(const char *)a3 outType:(int *)a4;
- (BOOL)isClientWithKeyInterested:(id)a3;
- (BOOL)leeching;
- (BOOL)monitoring;
- (CLClientAuthorizationCacheProtocol)clientAuthorizationCache;
- (CLClientManagerPublicProtocol)clientManager;
- (CLRoutineMonitorServiceProtocol)routineMonitor;
- (CLSignificantVisitManager)init;
- (NSMutableArray)recentVisits;
- (id).cxx_construct;
- (id)authorizationDateForClientWithKey:(id)a3;
- (id)keyForClient:(id)a3;
- (unint64_t)currentJournalIdentifier;
- (void)actOnPendingDeleteForClientKey:(id)a3;
- (void)beginService;
- (void)checkForMonitoring;
- (void)clientAuthDate;
- (void)clientInterest;
- (void)connectClient:(id)a3 withKey:(id)a4;
- (void)deliverVisit:(id)a3 toClient:(id)a4;
- (void)disconnectClient:(id)a3;
- (void)endService;
- (void)ensureMonitoringWithType:(int)a3;
- (void)ensureStop;
- (void)flushAll;
- (void)flushAuthDates;
- (void)flushInterest;
- (void)migrateClientInterestData;
- (void)notifyClientsOfVisit:(id)a3;
- (void)onAuthDateStoreTimer;
- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onInterestStoreTimer;
- (void)onVisit:(id)a3;
- (void)performBlockWhenArmed:(id)a3;
- (void)removeInterestForClientKey:(id)a3;
- (void)removeOldVisits;
- (void)sendVisitsToClient:(id)a3;
- (void)setArmed:(BOOL)a3;
- (void)setClientAuthDate:(void *)a3;
- (void)setClientAuthorizationCache:(id)a3;
- (void)setClientInterest:(void *)a3;
- (void)setClientManager:(id)a3;
- (void)setCurrentJournalIdentifier:(unint64_t)a3;
- (void)setLeeching:(BOOL)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setRecentVisits:(id)a3;
- (void)setRoutineMonitor:(id)a3;
- (void)settingsDidChange:(id)a3;
- (void)simulateVisit:(id)a3;
- (void)startMonitoringSignificantVisitsForClient:(id)a3 type:(int)a4;
- (void)stopMonitoringSignificantVisitsForClient:(id)a3;
@end

@implementation CLSignificantVisitManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247E1D8 != -1) {
    dispatch_once(&qword_10247E1D8, &stru_1022CA520);
  }
  return (id)qword_10247E1D0;
}

+ (BOOL)isSupported
{
  return 0;
}

- (CLSignificantVisitManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSignificantVisitManager;
  return [(CLSignificantVisitManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSignificantVisitManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLSignificantVisitManagerClientProtocol];
}

- (void)beginService
{
  [CLSignificantVisitManager universe][self universe]silo
  objc_super v3 = (CLSettingsMirror *)[objc_alloc((Class)CLSettingsMirror) initInUniverse:self.universe];
  self->fSettings = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007F7ADC;
  v4[3] = &unk_1022C85A0;
  v4[4] = self;
  [(CLSettingsMirror *)v3 setSettingsChangeHandler:v4];
  [(CLSignificantVisitManager *)self universe];
  sub_1007E0344();
}

- (void)endService
{
  [self universe].silo
  [(CLSignificantVisitManager *)self ensureStop];
  (*(void (**)(void))(*(void *)[(CLSignificantVisitManager *)self clientInterest] + 960))();
  (*(void (**)(void))(*(void *)[(CLSignificantVisitManager *)self clientAuthDate] + 960))();
  [(CLSignificantVisitManager *)self flushAll];
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  v4 = [(CLSignificantVisitManager *)self clientInterest];
  if (v4) {
    (*(void (**)(void *))(*(void *)v4 + 8))(v4);
  }
  [(CLSignificantVisitManager *)self setClientInterest:0];
  unint64_t v5 = [(CLSignificantVisitManager *)self clientAuthDate];
  if (v5) {
    (*(void (**)(void *))(*(void *)v5 + 8))(v5);
  }
  [(CLSignificantVisitManager *)self setClientAuthDate:0];
  [(CLSignificantVisitManager *)self setClientAuthorizationCache:0];
  [(CLSignificantVisitManager *)self setRecentVisits:0];
  [(CLSignificantVisitManager *)self setRoutineMonitor:0];
  p_pair1 = &self->_clientToKey.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)self->_clientToKey.__tree_.__begin_node_;
  if (begin_node != &self->_clientToKey.__tree_.__pair1_)
  {
    do
    {

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v9 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v10 = v9->__value_.__left_ == begin_node;
          begin_node = v9;
        }
        while (!v10);
      }
      begin_node = v9;
    }
    while (v9 != p_pair1);
  }
  sub_1000F5BB0((uint64_t)&self->_clientToKey, (void *)self->_clientToKey.__tree_.__pair1_.__value_.__left_);
  self->_clientToKey.__tree_.__pair1_.__value_.__left_ = 0;
  self->_clientToKey.__tree_.__pair3_.__value_ = 0;
  self->_clientToKey.__tree_.__begin_node_ = p_pair1;
  fSettings = self->fSettings;
}

- (void)flushAuthDates
{
  v2 = [(CLSignificantVisitManager *)self clientAuthDate];
  if (((*(uint64_t (**)(void *))(*(void *)v2 + 944))(v2) & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    objc_super v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#slv Could not store client auth dates\"}", (uint8_t *)&v5, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    v4 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Could not store client auth dates", "{\"msg%{public}.0s\":\"#slv Could not store client auth dates\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)flushInterest
{
  v2 = [(CLSignificantVisitManager *)self clientInterest];
  if (((*(uint64_t (**)(void *))(*(void *)v2 + 944))(v2) & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    objc_super v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#slv Could not store significant location visit clients\"}", (uint8_t *)&v5, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    v4 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Could not store significant location visit clients", "{\"msg%{public}.0s\":\"#slv Could not store significant location visit clients\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)flushAll
{
  [(CLSignificantVisitManager *)self flushAuthDates];

  [(CLSignificantVisitManager *)self flushInterest];
}

- (void)ensureMonitoringWithType:(int)a3
{
  [self universe].silo
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA5A8);
  }
  int v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 1026;
    int v19 = a3;
    __int16 v20 = 1026;
    unsigned int v21 = [(CLSignificantVisitManager *)self monitoring];
    __int16 v22 = 1026;
    unsigned int v23 = [(CLSignificantVisitManager *)self leeching];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#slv ensureMonitoringWithType\", \"type\":%{public}d, \"monitoring\":%{public}hhd, \"leeching\":%{public}hhd}", (uint8_t *)&v14, 0x24u);
  }
  if (a3 == 1)
  {
    if (![(CLSignificantVisitManager *)self leeching])
    {
      v11 = [(CLSignificantVisitManager *)self routineMonitor];
      [(CLRoutineMonitorServiceProtocol *)v11 startLeechingVisitsForClient:CLISP_ME_TOKEN];
      [(CLSignificantVisitManager *)self setLeeching:1];
      if ([(CLSignificantVisitManager *)self monitoring])
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CA5A8);
        }
        v12 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289026;
          int v15 = 0;
          __int16 v16 = 2082;
          v17 = "";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Currently monitoring. Stop monitoring and switch to leeching\"}", (uint8_t *)&v14, 0x12u);
        }
        v13 = [(CLSignificantVisitManager *)self routineMonitor];
        [(CLRoutineMonitorServiceProtocol *)v13 stopMonitoringVisitsForClient:CLISP_ME_TOKEN];
        [(CLSignificantVisitManager *)self setMonitoring:0];
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
      v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        BOOL v10 = "{\"msg%{public}.0s\":\"#slv Begin leeching\"}";
        goto LABEL_29;
      }
    }
  }
  else if (!a3 && ![(CLSignificantVisitManager *)self monitoring])
  {
    int v6 = [(CLSignificantVisitManager *)self routineMonitor];
    [(CLRoutineMonitorServiceProtocol *)v6 startMonitoringVisitsForClient:CLISP_ME_TOKEN];
    [(CLSignificantVisitManager *)self setMonitoring:1];
    if ([(CLSignificantVisitManager *)self leeching])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
      __int16 v7 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Currently leeching. Stop leeching and switch to monitoring\"}", (uint8_t *)&v14, 0x12u);
      }
      v8 = [(CLSignificantVisitManager *)self routineMonitor];
      [(CLRoutineMonitorServiceProtocol *)v8 stopLeechingVisitsForClient:CLISP_ME_TOKEN];
      [(CLSignificantVisitManager *)self setLeeching:0];
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      BOOL v10 = "{\"msg%{public}.0s\":\"#slv Begin monitoring\"}";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0x12u);
    }
  }
}

- (void)ensureStop
{
  [self universe].silo
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA5A8);
  }
  objc_super v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    v11 = "";
    __int16 v12 = 1026;
    unsigned int v13 = [(CLSignificantVisitManager *)self monitoring];
    __int16 v14 = 1026;
    unsigned int v15 = [(CLSignificantVisitManager *)self leeching];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#slv ensureStop\", \"monitoring\":%{public}hhd, \"leeching\":%{public}hhd}", buf, 0x1Eu);
  }
  if ([(CLSignificantVisitManager *)self monitoring]
    || [(CLSignificantVisitManager *)self leeching])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#slv Stop monitoring or leeching", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
      __int16 v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSignificantVisitManager ensureStop]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CLSignificantVisitManager *)self setRecentVisits:+[NSMutableArray array]];
    if ([(CLSignificantVisitManager *)self monitoring])
    {
      int v5 = [(CLSignificantVisitManager *)self routineMonitor];
      [(CLRoutineMonitorServiceProtocol *)v5 stopMonitoringVisitsForClient:CLISP_ME_TOKEN];
      [(CLSignificantVisitManager *)self setMonitoring:0];
    }
    if ([(CLSignificantVisitManager *)self leeching])
    {
      int v6 = [(CLSignificantVisitManager *)self routineMonitor];
      [(CLRoutineMonitorServiceProtocol *)v6 stopLeechingVisitsForClient:CLISP_ME_TOKEN];
      [(CLSignificantVisitManager *)self setLeeching:0];
    }
  }
}

- (void)removeOldVisits
{
  v2 = [(CLSignificantVisitManager *)self recentVisits];
  objc_super v3 = +[NSPredicate predicateWithBlock:&stru_1022CA560];

  [(NSMutableArray *)v2 filterUsingPredicate:v3];
}

- (BOOL)isClientWithKeyInterested:(id)a3
{
  int v10 = 0;
  if (!-[CLSignificantVisitManager interestForClientKey:outInterest:](self, "interestForClientKey:outInterest:", [a3 UTF8String], &v10)|| v10)
  {
    LOBYTE(v7) = v10 == 1;
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      id v5 = [a3 UTF8String];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2082;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Client in store with no interest\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    int v6 = qword_102419538;
    BOOL v7 = os_signpost_enabled((os_log_t)qword_102419538);
    if (v7)
    {
      id v8 = [a3 UTF8String];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2082;
      id v16 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Client in store with no interest", "{\"msg%{public}.0s\":\"#slv Client in store with no interest\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)sendVisitsToClient:(id)a3
{
  [self universe].silo
  id v5 = [(CLSignificantVisitManager *)self keyForClient:a3];
  if (v5)
  {
    int v6 = v5;
    if ([(CLSignificantVisitManager *)self isClientWithKeyInterested:v5])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
      BOOL v7 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 68289282;
        __int16 v22 = 2082;
        unsigned int v23 = "";
        __int16 v24 = 2082;
        id v25 = [v6 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Client is interested\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
      [(CLSignificantVisitManager *)self removeOldVisits];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = [(CLSignificantVisitManager *)self recentVisits];
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            [(CLSignificantVisitManager *)self deliverVisit:*(void *)(*((void *)&v16 + 1) + 8 * i) toClient:a3];
          }
          id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
      __int16 v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 68289282;
        __int16 v22 = 2082;
        unsigned int v23 = "";
        __int16 v24 = 2082;
        id v25 = [v6 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Client has no interest\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    __int16 v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289026;
      __int16 v22 = 2082;
      unsigned int v23 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Can't deliver visit to client that hasn't connected\"}", (uint8_t *)&buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    __int16 v14 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      uint64_t buf = 68289026;
      __int16 v22 = 2082;
      unsigned int v23 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Can't deliver visit to client that hasn't connected", "{\"msg%{public}.0s\":\"#slv Can't deliver visit to client that hasn't connected\"}", (uint8_t *)&buf, 0x12u);
    }
  }
}

- (void)deliverVisit:(id)a3 toClient:(id)a4
{
  [self universe].silo
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007F909C;
  v7[3] = &unk_10229FF28;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  [(CLSignificantVisitManager *)self performBlockWhenArmed:v7];
}

- (void)performBlockWhenArmed:(id)a3
{
  [self universe].silo
  if ([(CLSignificantVisitManager *)self armed])
  {
    id v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    int v6 = [(CLSignificantVisitManager *)self clientAuthorizationCache];
    [(CLClientAuthorizationCacheProtocol *)v6 notifyWhenCacheIsPopulatedWithReply:a3];
  }
}

- (id)keyForClient:(id)a3
{
  [self universe].silo
  left = (CLSignificantVisitManager *)self->_clientToKey.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return 0;
  }
  p_pair1 = (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_;
  do
  {
    unint64_t value = left->_clientToKey.__tree_.__pair3_.__value_;
    BOOL v8 = value >= (unint64_t)a3;
    if (value >= (unint64_t)a3) {
      p_clientManagerClient = (CLSignificantVisitManager **)left;
    }
    else {
      p_clientManagerClient = (CLSignificantVisitManager **)&left->_clientManagerClient;
    }
    if (v8) {
      p_pair1 = left;
    }
    left = *p_clientManagerClient;
  }
  while (*p_clientManagerClient);
  if (p_pair1 == (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_
    || p_pair1->_clientToKey.__tree_.__pair3_.__value_ > (unint64_t)a3)
  {
    return 0;
  }
  uint64_t v11 = p_pair1->fSettings;

  return v11;
}

- (void)connectClient:(id)a3 withKey:(id)a4
{
  id v15 = a3;
  [self universe].silo
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA5A8);
  }
  BOOL v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v17 = 2082;
    long long v18 = "";
    __int16 v19 = 2082;
    id v20 = [a4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Client is connecting\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  left = (CLSignificantVisitManager *)self->_clientToKey.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_;
    do
    {
      unint64_t value = left->_clientToKey.__tree_.__pair3_.__value_;
      BOOL v11 = value >= (unint64_t)a3;
      if (value >= (unint64_t)a3) {
        p_clientManagerClient = (CLSignificantVisitManager **)left;
      }
      else {
        p_clientManagerClient = (CLSignificantVisitManager **)&left->_clientManagerClient;
      }
      if (v11) {
        p_pair1 = left;
      }
      left = *p_clientManagerClient;
    }
    while (*p_clientManagerClient);
    if (p_pair1 != (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_
      && p_pair1->_clientToKey.__tree_.__pair3_.__value_ <= (unint64_t)a3)
    {
    }
  }
  *(void *)uint64_t buf = &v15;
  sub_10017C9B0((uint64_t **)&self->_clientToKey, (unint64_t *)&v15, (uint64_t)&unk_101D0B290, (uint64_t **)buf)[5] = (uint64_t)a4;
  id v13 = v15;
  id v14 = a4;
  [(CLSignificantVisitManager *)self sendVisitsToClient:v15];
}

- (void)startMonitoringSignificantVisitsForClient:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [CLSignificantVisitManager universe][self universe].silo
  id v7 = [(CLSignificantVisitManager *)self keyForClient:a3];
  if (v7)
  {
    BOOL v8 = v7;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    id v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 2082;
      __int16 v17 = [v8 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Client start\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:](self, "clientInterestStoreSetValueForClientKey:parameterKey:value:", [v8 UTF8String], "interest", 1);
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:](self, "clientInterestStoreSetValueForClientKey:parameterKey:value:", [v8 UTF8String], "type", v4);
    [(CLSignificantVisitManager *)self flushInterest];
    if ([(CLSignificantVisitManager *)self authorizationDateForClientWithKey:v8])
    {
      sub_100134750(&__p, (char *)[v8 UTF8String]);
      sub_10000FF54(&__p, (uint64_t)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      sub_1007D1098();
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    id v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Tried to start monitoring for a client that isn't connected\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    BOOL v11 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Tried to start monitoring for a client that isn't connected", "{\"msg%{public}.0s\":\"#slv Tried to start monitoring for a client that isn't connected\"}", buf, 0x12u);
    }
  }
}

- (void)stopMonitoringSignificantVisitsForClient:(id)a3
{
  [self universe].silo
  id v5 = [(CLSignificantVisitManager *)self keyForClient:a3];
  if (v5)
  {
    int v6 = v5;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      __int16 v14 = 2082;
      id v15 = [v6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv client stop\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&v10, 0x1Cu);
    }
    [(CLSignificantVisitManager *)self removeInterestForClientKey:v6];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    BOOL v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Tried to stop monitoring for a client that isn't connected\"}", (uint8_t *)&v10, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    id v9 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Tried to stop monitoring for a client that isn't connected", "{\"msg%{public}.0s\":\"#slv Tried to stop monitoring for a client that isn't connected\"}", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (void)removeInterestForClientKey:(id)a3
{
  int v5 = 0;
  -[CLSignificantVisitManager interestForClientKey:outInterest:](self, "interestForClientKey:outInterest:", [a3 UTF8String], &v5);
  if (v5 == 1)
  {
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:](self, "clientInterestStoreSetValueForClientKey:parameterKey:value:", [a3 UTF8String], "interest", 2);
    [(CLSignificantVisitManager *)self flushAll];
    [(CLSignificantVisitManager *)self actOnPendingDeleteForClientKey:a3];
    [(CLSignificantVisitManager *)self checkForMonitoring];
  }
}

- (void)actOnPendingDeleteForClientKey:(id)a3
{
  [self universe].silo
  int v7 = 0;
  -[CLSignificantVisitManager interestForClientKey:outInterest:](self, "interestForClientKey:outInterest:", [a3 UTF8String], &v7);
  if (v7 != 2) {
    sub_101A6FE24();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007F9E5C;
  v6[3] = &unk_1022CA588;
  v6[4] = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007F9EAC;
  v5[3] = &unk_10229FEB0;
  v5[4] = self;
  v5[5] = a3;
  [(CLClientManagerPublicProtocol *)[(CLSignificantVisitManager *)self clientManager] doAsync:v6 withReply:v5];
}

- (void)simulateVisit:(id)a3
{
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022CA5C8);
  }
  int v5 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    BOOL v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Sending simulated visit to clients\"}", (uint8_t *)v6, 0x12u);
  }
  [(CLSignificantVisitManager *)self notifyClientsOfVisit:a3];
}

- (void)disconnectClient:(id)a3
{
  [self universe].silo
  p_clientToKey = &self->_clientToKey;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)p_clientToKey->__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &p_clientToKey->__tree_.__pair1_;
    do
    {
      unint64_t v8 = (unint64_t)left[4].__value_.__left_;
      BOOL v9 = v8 >= (unint64_t)a3;
      if (v8 >= (unint64_t)a3) {
        int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> **)left;
      }
      else {
        int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> **)&left[1];
      }
      if (v9) {
        p_pair1 = left;
      }
      left = *v10;
    }
    while (*v10);
    if (p_pair1 != &p_clientToKey->__tree_.__pair1_)
    {
      id v11 = p_pair1[4].__value_.__left_;
      if (v11 <= a3)
      {

        sub_1000F0A30((uint64_t **)p_clientToKey, (uint64_t *)p_pair1);
        operator delete(p_pair1);
      }
    }
  }
}

- (void)notifyClientsOfVisit:(id)a3
{
  [self universe].silo
  if (!a3) {
    sub_101A6FFA8();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007FA18C;
  v5[3] = &unk_10229FEB0;
  v5[4] = a3;
  v5[5] = self;
  [(CLSignificantVisitManager *)self performBlockWhenArmed:v5];
}

- (id)authorizationDateForClientWithKey:(id)a3
{
  [self universe].silo
  if (![(CLSignificantVisitManager *)self armed])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    int v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv #warning Can't produce a meaningful authorization date before arming is complete.  Returning nil\"}", buf, 0x12u);
    }
    return 0;
  }
  if ((objc_msgSend(-[CLClientAuthorizationCacheProtocol syncgetAuthorizationContextIfClientIsNonZonal:](-[CLSignificantVisitManager clientAuthorizationCache](self, "clientAuthorizationCache"), "syncgetAuthorizationContextIfClientIsNonZonal:", a3), "isAuthorizedForServiceTypeMask:", 64) & 1) == 0)
  {
    sub_1004CF7DC((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"), (const char *)[a3 UTF8String], 0xFFFFFFFFLL);
    [(CLSignificantVisitManager *)self flushAuthDates];
    return 0;
  }
  *(void *)uint64_t buf = 0;
  if (sub_1000A699C((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"), (const char *)[a3 UTF8String], buf))return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)buf); {
  [objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo") currentLatchedAbsoluteTimestamp];
  }
  int v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  unint64_t v8 = [(CLSignificantVisitManager *)self clientAuthDate];
  BOOL v9 = (const char *)[a3 UTF8String];
  [(NSDate *)v5 timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;
  sub_10016332C((uint64_t)v8, v9, &v11);
  [(CLSignificantVisitManager *)self flushAuthDates];
  return v5;
}

- (void)checkForMonitoring
{
  [CLSignificantVisitManager universe][self universe].silo
  if ([(CLSignificantVisitManager *)self armed])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    objc_super v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#slv Checking if SLV should be active\"}", buf, 0x12u);
    }
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    sub_1004CFF34((uint64_t)[(CLSignificantVisitManager *)self clientInterest]);
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CA5A8);
  }
  uint64_t v4 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v9 = 2082;
    uint64_t v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Not checking for monitoring... not armed\"}", buf, 0x12u);
  }
}

- (void)migrateClientInterestData
{
  [self universe].silo
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  sub_1004CFF34((uint64_t)[(CLSignificantVisitManager *)self clientInterest]);
}

- (BOOL)interestForClientKey:(const char *)a3 outInterest:(int *)a4
{
  [self universe].silo

  return [(CLSignificantVisitManager *)self clientInterestStoreGetValueForClientKey:a3 parameterKey:"interest" value:a4];
}

- (BOOL)interestTypeForClientKey:(const char *)a3 outType:(int *)a4
{
  [self universe].silo

  return [(CLSignificantVisitManager *)self clientInterestStoreGetValueForClientKey:a3 parameterKey:"type" value:a4];
}

- (BOOL)clientInterestStoreGetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int *)a5
{
  [CLSignificantVisitManager universe:self silo];
  sub_1000E9354(v11);
  if (sub_100012960((uint64_t)[(CLSignificantVisitManager *)self clientInterest], a3, v11)) {
    char v9 = sub_10006EF84((uint64_t)v11, a4, a5);
  }
  else {
    char v9 = 0;
  }
  sub_10013F3C4(v11);
  return v9;
}

- (BOOL)clientInterestStoreSetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int)a5
{
  int v11 = a5;
  [CLSignificantVisitManager universe][self universe].silo
  sub_1000E9354(v10);
  sub_100012960((uint64_t)[(CLSignificantVisitManager *)self clientInterest], a3, v10);
  BOOL v8 = sub_1000EA838((uint64_t)v10, a4, &v11)
    && sub_1004D3878((uint64_t)[(CLSignificantVisitManager *)self clientInterest], a3, (uint64_t)v10);
  sub_10013F3C4(v10);
  return v8;
}

- (void)onVisit:(id)a3
{
  [self universe].silo
  if (a3)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    uint64_t v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2113;
      id v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Received visit from routined\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
    [(CLSignificantVisitManager *)self notifyClientsOfVisit:a3];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    uint64_t v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v8, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
    }
    uint64_t v7 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Attempting to notify nil visit", "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe:a3 universe:a4 universe:a5 silo];
  switch(a3)
  {
    case 0:
    case 4:
      if (*((_DWORD *)a4 + 47) != 1)
      {
        sub_1004CEFA0((uint64_t)[(CLSignificantVisitManager *)self clientAuthDate]);
        [(CLSignificantVisitManager *)self flushAuthDates];
        [(CLSignificantVisitManager *)self ensureStop];
      }
      break;
    case 1:
      sub_1000A7FBC((uint64_t)a4, (uint64_t)&__p);
      if (v15 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      [(CLSignificantVisitManager *)self removeInterestForClientKey:+[NSString stringWithUTF8String:p_p]];
      if (SHIBYTE(v15) < 0) {
        operator delete(__p);
      }
      break;
    case 2:
      [(CLSignificantVisitManager *)self checkForMonitoring];
      break;
    default:
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CA5A8);
      }
      int v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        std::string __p = (void *)68289282;
        __int16 v12 = 2082;
        id v13 = "";
        __int16 v14 = 1026;
        int v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv received unhandled notification\", \"notification\":%{public}d}", (uint8_t *)&__p, 0x18u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CA5A8);
        }
      }
      __int16 v10 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        std::string __p = (void *)68289282;
        __int16 v12 = 2082;
        id v13 = "";
        __int16 v14 = 1026;
        int v15 = a3;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv received unhandled notification", "{\"msg%{public}.0s\":\"#slv received unhandled notification\", \"notification\":%{public}d}", (uint8_t *)&__p, 0x18u);
      }
      break;
  }
}

- (void)onInterestStoreTimer
{
  [self universe].silo
  uint64_t v3 = [(CLSignificantVisitManager *)self clientInterest];

  sub_10053D700(v3);
}

- (void)onAuthDateStoreTimer
{
  [self universe].silo
  uint64_t v3 = [(CLSignificantVisitManager *)self clientAuthDate];

  sub_10053D700(v3);
}

- (void)settingsDidChange:(id)a3
{
  if ([a3 dictionaryForKey:@"SpoofSignificantVisit" defaultValue:0])
  {
    [a3 doubleForKey:@"Latitude" defaultValue:34.076452];
    CLLocationDegrees v6 = v5;
    [a3 doubleForKey:@"Longitude" defaultValue:-118.429474];
    CLLocationDegrees v8 = v7;
    [a3 doubleForKey:@"Accuracy" defaultValue:54.321];
    double v10 = v9;
    [objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo") currentLatchedAbsoluteTimestamp];
    int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    __int16 v12 = +[NSDate distantFuture];
    [objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo") currentLatchedAbsoluteTimestamp];
    id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [a3 doubleForKey:@"ArrivalTimestamp" defaultValue:0.0];
    if (v14 != 0.0) {
      int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    [a3 doubleForKey:@"DepartureTimestamp" defaultValue:0.0];
    if (v15 != 0.0) {
      int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    [a3 doubleForKey:@"DetectionTimestamp" defaultValue:0.0];
    if (v16 != 0.0) {
      int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    id v17 = objc_alloc((Class)CLVisit);
    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v6, v8);
    id v19 = [v17 initWithCoordinate:v11 horizontalAccuracy:v12 arrivalDate:v13 departureDate:v18.latitude longitude:v18.longitude detectionDate:v10];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CA5A8);
    }
    id v20 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 68289283;
      v21[1] = 0;
      __int16 v22 = 2082;
      unsigned int v23 = "";
      __int16 v24 = 2113;
      id v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Spoofing a Significant Visit\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)v21, 0x1Cu);
    }
    [(CLSignificantVisitManager *)self notifyClientsOfVisit:v19];
  }
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (BOOL)leeching
{
  return self->_leeching;
}

- (void)setLeeching:(BOOL)a3
{
  self->_leeching = a3;
}

- (void)clientInterest
{
  return self->_clientInterest;
}

- (void)setClientInterest:(void *)a3
{
  self->_clientInterest = a3;
}

- (void)clientAuthDate
{
  return self->_clientAuthDate;
}

- (void)setClientAuthDate:(void *)a3
{
  self->_clientAuthDate = a3;
}

- (CLClientAuthorizationCacheProtocol)clientAuthorizationCache
{
  return self->_clientAuthorizationCache;
}

- (void)setClientAuthorizationCache:(id)a3
{
}

- (NSMutableArray)recentVisits
{
  return self->_recentVisits;
}

- (void)setRecentVisits:(id)a3
{
}

- (CLRoutineMonitorServiceProtocol)routineMonitor
{
  return self->_routineMonitor;
}

- (void)setRoutineMonitor:(id)a3
{
}

- (CLClientManagerPublicProtocol)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
}

- (BOOL)armed
{
  return self->_armed;
}

- (void)setArmed:(BOOL)a3
{
  self->_armed = a3;
}

- (unint64_t)currentJournalIdentifier
{
  return self->_currentJournalIdentifier;
}

- (void)setCurrentJournalIdentifier:(unint64_t)a3
{
  self->_currentJournalIdentifier = a3;
}

- (void).cxx_destruct
{
  sub_1000F5BB0((uint64_t)&self->_clientToKey, (void *)self->_clientToKey.__tree_.__pair1_.__value_.__left_);
  unint64_t value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

@end