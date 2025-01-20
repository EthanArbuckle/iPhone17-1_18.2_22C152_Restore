@interface PPEventMetricsLogger
+ (BOOL)supportsSecureCoding;
+ (id)defaultLogger;
+ (unint64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4;
- (BOOL)_incrementInteractionForEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (BOOL)_removeInteractionsSummaryLogsFromLogsAndResetStoreAge:(id)a3;
- (BOOL)resetLogs;
- (BOOL)storeToDisk;
- (PPEventMetricsLogger)init;
- (PPEventMetricsLogger)initWithCoder:(id)a3;
- (PPEventMetricsLogger)initWithFileName:(id)a3;
- (double)_storeAge;
- (id)_createRTCReporting;
- (id)_descriptionForActionType:(unsigned __int16)a3;
- (id)_descriptionForInterface:(unsigned __int16)a3;
- (id)_descriptionForPPRTCCategory:(unsigned __int16)a3;
- (id)_interactionAttributesForEventHighlight:(id)a3;
- (id)_interactionKeyForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4;
- (id)allowedLogFromLog:(id)a3;
- (id)eventsAndExtraordinaryEventsDictFromDate:(id)a3;
- (id)loggedInteractionsSummaryMetrics;
- (id)logsToSend;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)logEventInteractionForEventHighlight:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logNewInteractionSummaryWithDictionary:(id)a3;
- (void)sendRTCLogsWithCompletion:(id)a3;
- (void)updateAndScheduleDiskWrite;
@end

@implementation PPEventMetricsLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsWriteQueue, 0);
  objc_storeStrong((id *)&self->_persistenceTimerSource, 0);
  objc_storeStrong((id *)&self->_loggedInteractionsSummary, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)dealloc
{
  v3 = pp_events_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger going away now", buf, 2u);
  }

  pthread_mutex_destroy(&self->_lock);
  dispatch_source_cancel((dispatch_source_t)self->_persistenceTimerSource);
  v4.receiver = self;
  v4.super_class = (Class)PPEventMetricsLogger;
  [(PPEventMetricsLogger *)&v4 dealloc];
}

- (id)loggedInteractionsSummaryMetrics
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objc_super v4 = (void *)[(NSMutableArray *)self->_loggedInteractionsSummary copy];
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (id)_descriptionForPPRTCCategory:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 1) > 0xAu) {
    return @"unknown";
  }
  else {
    return off_1E65D54A0[(unsigned __int16)(a3 + 1)];
  }
}

- (id)_descriptionForActionType:(unsigned __int16)a3
{
  if (a3 > 4u) {
    return @"unknown";
  }
  else {
    return off_1E65D5478[a3];
  }
}

- (id)_descriptionForInterface:(unsigned __int16)a3
{
  if (a3 > 0xAu) {
    return @"unknown";
  }
  else {
    return off_1E65D5420[a3];
  }
}

- (id)_interactionKeyForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v7 = [NSString alloc];
  v8 = [(PPEventMetricsLogger *)self _descriptionForInterface:v5];
  v9 = [(PPEventMetricsLogger *)self _descriptionForActionType:v4];
  v10 = (void *)[v7 initWithFormat:@"%@_%@", v8, v9];

  return v10;
}

- (id)_interactionAttributesForEventHighlight:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 features];

  id v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @",");
  v8 = (void *)[v5 initWithFormat:@"[%@]", v7, @"rankingFeatures"];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  return v9;
}

- (BOOL)_incrementInteractionForEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(PPEventMetricsLogger *)self _interactionKeyForInterface:v6 actionType:v5];
  v10 = pp_events_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138412546;
    v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: log and increment interaction key: %@, for eventIdentifier: %@", (uint8_t *)&v24, 0x16u);
  }

  pthread_mutex_lock(&self->_lock);
  if ([(NSMutableArray *)self->_loggedInteractionsSummary count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      v12 = [(NSMutableArray *)self->_loggedInteractionsSummary objectAtIndexedSubscript:v11];
      v13 = [v12 objectForKeyedSubscript:@"eventIdentifier"];
      int v14 = [v13 isEqualToString:v8];

      loggedInteractionsSummary = self->_loggedInteractionsSummary;
      if (v14) {
        break;
      }
      if (++v11 >= (unint64_t)[(NSMutableArray *)loggedInteractionsSummary count]) {
        goto LABEL_7;
      }
    }
    v18 = NSNumber;
    v19 = [(NSMutableArray *)loggedInteractionsSummary objectAtIndexedSubscript:v11];
    v20 = [v19 objectForKeyedSubscript:v9];
    v21 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + 1);
    v22 = [(NSMutableArray *)self->_loggedInteractionsSummary objectAtIndexedSubscript:v11];
    [v22 setObject:v21 forKeyedSubscript:v9];

    pthread_mutex_unlock(&self->_lock);
    [(PPEventMetricsLogger *)self updateAndScheduleDiskWrite];
    BOOL v17 = 1;
  }
  else
  {
LABEL_7:
    pthread_mutex_unlock(&self->_lock);
    v16 = pp_events_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: can't find eventIdentifier in loggedInteractionsSummary dictionary", (uint8_t *)&v24, 2u);
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (void)logEventInteractionForEventHighlight:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [v8 eventIdentifier];
  if ([(PPEventMetricsLogger *)self _incrementInteractionForEventIdentifier:v9 interface:v6 actionType:v5])
  {

LABEL_8:
    __int16 v26 = pp_events_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v27 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: No endDate for event", v27, 2u);
    }

    goto LABEL_11;
  }
  v10 = [v8 endDate];

  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = [v8 endDate];
  uint64_t v12 = [v8 endDate];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = objc_opt_new();
    int v15 = +[PPEventMetricsLogger numberOfDaysBetweenDate:v14 andDate:v11];

    if (v15 >= 366)
    {
      v16 = objc_opt_new();
      [v16 setYear:1];
      BOOL v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v18 = objc_opt_new();
      uint64_t v19 = [v17 dateByAddingComponents:v16 toDate:v18 options:0];

      uint64_t v11 = (void *)v19;
    }
  }
  v20 = [(PPEventMetricsLogger *)self _interactionAttributesForEventHighlight:v8];
  v21 = (void *)[v20 mutableCopy];

  v22 = [(PPEventMetricsLogger *)self _descriptionForPPRTCCategory:8];
  [v21 setObject:v22 forKeyedSubscript:@"categoryLog"];

  [v21 setObject:v11 forKeyedSubscript:@"expirationDate"];
  v23 = objc_opt_new();
  [v21 setObject:v23 forKeyedSubscript:@"creationDate"];

  int v24 = [v8 eventIdentifier];
  [v21 setObject:v24 forKeyedSubscript:@"eventIdentifier"];

  v25 = [(PPEventMetricsLogger *)self _interactionKeyForInterface:v6 actionType:v5];
  [v21 setObject:&unk_1F2568D50 forKeyedSubscript:v25];

  [(PPEventMetricsLogger *)self logNewInteractionSummaryWithDictionary:v21];
LABEL_11:
}

- (id)allowedLogFromLog:(id)a3
{
  id v3 = a3;
  [v3 removeObjectForKey:@"eventIdentifier"];
  [v3 removeObjectForKey:@"expirationDate"];
  return v3;
}

- (id)logsToSend
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v14 = (id)objc_opt_new();
  if ([(NSMutableArray *)self->_loggedInteractionsSummary count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      id v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_loggedInteractionsSummary, "objectAtIndexedSubscript:", v3, p_lock);
      uint64_t v5 = [v4 objectForKeyedSubscript:@"categoryLog"];
      uint64_t v6 = [(PPEventMetricsLogger *)self _descriptionForPPRTCCategory:8];
      if (([v5 isEqualToString:v6] & 1) == 0) {
        break;
      }
      id v7 = objc_opt_new();
      id v8 = [(NSMutableArray *)self->_loggedInteractionsSummary objectAtIndexedSubscript:v3];
      v9 = [v8 objectForKeyedSubscript:@"expirationDate"];
      uint64_t v10 = [v7 compare:v9];

      if (v10 == 1)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
        id v4 = [(NSMutableArray *)self->_loggedInteractionsSummary objectAtIndexedSubscript:v3];
        uint64_t v5 = (void *)[v11 initWithDictionary:v4 copyItems:1];
        [v14 addObject:v5];
LABEL_7:
      }
      if (++v3 >= (unint64_t)[(NSMutableArray *)self->_loggedInteractionsSummary count]) {
        goto LABEL_9;
      }
    }

    goto LABEL_7;
  }
LABEL_9:
  pthread_mutex_unlock(p_lock);
  return v14;
}

- (BOOL)_removeInteractionsSummaryLogsFromLogsAndResetStoreAge:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_storeCreationDate = v5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableArray removeObject:](self->_loggedInteractionsSummary, "removeObject:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  pthread_mutex_unlock(&self->_lock);
  BOOL v11 = [(PPEventMetricsLogger *)self storeToDisk];

  return v11;
}

- (double)_storeAge
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 - self->_storeCreationDate;
  pthread_mutex_unlock(p_lock);
  return v5;
}

- (BOOL)resetLogs
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  double v4 = (NSMutableArray *)objc_opt_new();
  loggedInteractionsSummary = self->_loggedInteractionsSummary;
  self->_loggedInteractionsSummary = v4;

  pthread_mutex_unlock(p_lock);
  return [(PPEventMetricsLogger *)self storeToDisk];
}

- (id)eventsAndExtraordinaryEventsDictFromDate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    double v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v5 = objc_opt_new();
    [v5 setDay:-7];
    id v6 = [v4 dateByAddingComponents:v5 toDate:v3 options:0];
    if (v6)
    {
      uint64_t v7 = +[PPLocalEventStore defaultStore];
      uint64_t v8 = [v7 eventHighlightsFrom:v6 to:v3 options:1];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        LODWORD(v12) = 0;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v12 = v12
                + objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "isExtraordinary", (void)v19);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v11);
      }
      else
      {
        uint64_t v12 = 0;
      }

      v23[0] = @"eventHighlightsCount";
      long long v16 = [NSNumber numberWithInt:v12];
      v23[1] = @"ekEventsCount";
      v24[0] = v16;
      BOOL v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v9, "count"));
      v24[1] = v17;
      long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    }
    else
    {
      uint64_t v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v4;
        __int16 v28 = 2112;
        v29 = v5;
        __int16 v30 = 2112;
        id v31 = v3;
        _os_log_fault_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_FAULT, "eventsAndExtraordinaryEventsDictFromDate failed to get startDate from c:%@ add:%@ d:%@", buf, 0x20u);
      }
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)logNewInteractionSummaryWithDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = pp_events_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: log new interaction summary: %@", (uint8_t *)&v6, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  [(NSMutableArray *)self->_loggedInteractionsSummary addObject:v4];
  pthread_mutex_unlock(&self->_lock);
  [(PPEventMetricsLogger *)self updateAndScheduleDiskWrite];
}

- (void)updateAndScheduleDiskWrite
{
  id v3 = pp_events_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: updating and scheduling disk write", buf, 2u);
  }

  id v4 = pp_events_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: updating and scheduling disk write for real", v7, 2u);
  }

  persistenceTimerSource = self->_persistenceTimerSource;
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(persistenceTimerSource, v6, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  [v5 encodeObject:self->_path forKey:@"path"];
  [v5 encodeObject:self->_loggedInteractionsSummary forKey:@"loggedInteractionsSummary"];
  dispatch_time_t v6 = [NSNumber numberWithDouble:self->_storeCreationDate];
  [v5 encodeObject:v6 forKey:@"storeCreationDate"];

  pthread_mutex_unlock(p_lock);
}

- (PPEventMetricsLogger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PPEventMetricsLogger *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    long long v16 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    BOOL v17 = [v4 decodeObjectOfClasses:v16 forKey:@"loggedInteractionsSummary"];
    uint64_t v18 = v17;
    if (v17) {
      long long v19 = v17;
    }
    else {
      long long v19 = (NSMutableArray *)objc_opt_new();
    }
    loggedInteractionsSummary = v5->_loggedInteractionsSummary;
    v5->_loggedInteractionsSummary = v19;

    long long v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeCreationDate"];
    [v21 doubleValue];
    v5->_storeCreationDate = v22;

    if (v5->_storeCreationDate == 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v5->_storeCreationDate = v23;
    }
  }
  return v5;
}

- (void)sendRTCLogsWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = pp_events_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPEventMetricsLogger: Sending privacy-aware suggestions log over the network", buf, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  uint64_t v6 = [(PPEventMetricsLogger *)self logsToSend];
  pthread_mutex_unlock(&self->_lock);
  BOOL v7 = [v6 count] == 0;
  id v8 = pp_events_log_handle();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPEventMetricsLogger: No RTC logs to send this time. Skipping.", buf, 2u);
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v6 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_debug_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEBUG, "PPEventMetricsLogger: Selected logs (%lu): %@", buf, 0x16u);
    }

    uint64_t v10 = [(PPEventMetricsLogger *)self _createRTCReporting];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v23 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__PPEventMetricsLogger_sendRTCLogsWithCompletion___block_invoke;
    v13[3] = &unk_1E65D5400;
    BOOL v17 = v4;
    id v14 = v6;
    uint64_t v15 = self;
    id v11 = v10;
    id v16 = v11;
    uint64_t v18 = buf;
    long long v19 = v20;
    [v11 startConfigurationWithCompletionHandler:v13];

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __50__PPEventMetricsLogger_sendRTCLogsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v29 = [v3 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (!v29) {
      goto LABEL_22;
    }
    char v30 = 0;
    uint64_t v5 = *(void *)v34;
    *(void *)&long long v4 = 138412290;
    long long v26 = v4;
    uint64_t v27 = *(void *)v34;
    id v28 = v3;
    while (1)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "mutableCopy", v26);
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v10 = [v7 objectForKeyedSubscript:@"expirationDate"];
        id v11 = [v9 eventsAndExtraordinaryEventsDictFromDate:v10];

        if (v11) {
          [v8 addEntriesFromDictionary:v11];
        }
        uint64_t v12 = [*(id *)(a1 + 40) allowedLogFromLog:v8];
        uint64_t v13 = *(void **)(a1 + 48);
        id v32 = 0;
        char v14 = [v13 sendMessageWithCategory:8 type:0 payload:v12 error:&v32];
        id v15 = v32;
        if (v14)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          if (v30)
          {
            char v30 = 1;
            goto LABEL_20;
          }
          v37 = @"storeAge";
          BOOL v17 = NSNumber;
          uint64_t v18 = *(void **)(a1 + 48);
          [*(id *)(a1 + 40) _storeAge];
          long long v19 = objc_msgSend(v17, "numberWithDouble:");
          v38 = v19;
          char v30 = 1;
          long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          id v31 = v15;
          LOBYTE(v18) = [v18 sendMessageWithCategory:2 type:0 payload:v20 error:&v31];
          id v21 = v31;

          if (v18)
          {
            id v15 = v21;
            uint64_t v5 = v27;
            id v3 = v28;
            goto LABEL_20;
          }
          id v16 = pp_default_log_handle();
          uint64_t v5 = v27;
          id v3 = v28;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            id v40 = v21;
            _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: Unable to send logs for storeAge: %@", buf, 0xCu);
          }
          char v30 = 1;
          id v15 = v21;
        }
        else
        {
          id v16 = pp_default_log_handle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            id v40 = v15;
            _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: Unable to send logs: %@", buf, 0xCu);
          }
        }

LABEL_20:
      }
      uint64_t v29 = [v3 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (!v29)
      {
LABEL_22:

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) flushMessages];
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
          {
            [*(id *)(a1 + 40) _removeInteractionsSummaryLogsFromLogsAndResetStoreAge:*(void *)(a1 + 32)];
          }
          else
          {
            uint64_t v24 = pp_default_log_handle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "PPEventMetricsLogger: Unable to flush logs", buf, 2u);
            }
          }
        }
        char v23 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
        return v23();
      }
    }
  }
  double v22 = pp_events_log_handle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, "PPEventMetricsLogger: No RTC backends found, no logs will be sent at this time.", buf, 2u);
  }

  char v23 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v23();
}

- (id)_createRTCReporting
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = [NSNumber numberWithInt:CFAbsoluteTimeGetCurrent()];
  uint64_t v3 = *MEMORY[0x1E4F94660];
  v13[0] = *MEMORY[0x1E4F94658];
  v13[1] = v3;
  v14[0] = &unk_1F2568D20;
  v14[1] = &unk_1F2568D38;
  uint64_t v4 = *MEMORY[0x1E4F94648];
  v13[2] = *MEMORY[0x1E4F94680];
  v13[3] = v4;
  v14[2] = v2;
  v14[3] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  uint64_t v6 = *MEMORY[0x1E4F94690];
  v11[0] = *MEMORY[0x1E4F94688];
  v11[1] = v6;
  v12[0] = @"Suggestions";
  v12[1] = @"com.apple.PersonalizationPortrait";
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v8 = objc_alloc(MEMORY[0x1E4F94620]);
  uint64_t v9 = (void *)[v8 initWithSessionInfo:v5 userInfo:v7 frameworksToCheck:MEMORY[0x1E4F1CBF0]];

  return v9;
}

- (BOOL)storeToDisk
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = pp_events_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    int v9 = 138412290;
    uint64_t v10 = path;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPEventMetricsLogger: Persisting some logs to disk! path: %@", (uint8_t *)&v9, 0xCu);
  }

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  char v7 = [v6 writeToFile:self->_path atomically:0];
  pthread_mutex_unlock(p_lock);

  return v7;
}

- (PPEventMetricsLogger)initWithFileName:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PPEventMetricsLogger *)self init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (PPEventMetricsLogger)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PPEventMetricsLogger;
  v2 = [(PPEventMetricsLogger *)&v19 init];
  uint64_t v3 = v2;
  if (v2)
  {
    path = v2->_path;
    v2->_path = 0;

    uint64_t v5 = objc_opt_new();
    loggedInteractionsSummary = v3->_loggedInteractionsSummary;
    v3->_loggedInteractionsSummary = (NSMutableArray *)v5;

    char v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.suggestd.pp-interactions-write-queue", v7);
    interactionsWriteQueue = v3->_interactionsWriteQueue;
    v3->_interactionsWriteQueue = (OS_dispatch_queue *)v8;

    v20.__sig = 0;
    *(void *)v20.__opaque = 0;
    pthread_mutexattr_init(&v20);
    pthread_mutexattr_settype(&v20, 2);
    pthread_mutex_init(&v3->_lock, &v20);
    pthread_mutexattr_destroy(&v20);
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    uint64_t v12 = dispatch_queue_create("pp-rtc-persist", v11);

    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
    persistenceTimerSource = v3->_persistenceTimerSource;
    v3->_persistenceTimerSource = (OS_dispatch_source *)v13;

    v20.__sig = 0;
    objc_initWeak((id *)&v20, v3);
    id v15 = v3->_persistenceTimerSource;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __28__PPEventMetricsLogger_init__block_invoke;
    v17[3] = &unk_1E65DC540;
    objc_copyWeak(&v18, (id *)&v20);
    dispatch_source_set_event_handler(v15, v17);
    dispatch_resume((dispatch_object_t)v3->_persistenceTimerSource);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)&v20);
  }
  return v3;
}

void __28__PPEventMetricsLogger_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained storeToDisk];
}

+ (unint64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  int v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v10 = [v9 components:16 fromDate:v7 toDate:v6 options:0];

  unint64_t v11 = [v10 day];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultLogger
{
  if (defaultLogger_onceToken != -1) {
    dispatch_once(&defaultLogger_onceToken, &__block_literal_global_3852);
  }
  v2 = (void *)defaultLogger_sharedLogger;
  return v2;
}

void __37__PPEventMetricsLogger_defaultLogger__block_invoke()
{
  v0 = +[PPPaths topDirectory];
  v1 = [v0 stringByAppendingPathComponent:@"pp-privacyAwareLogging.ser"];

  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v2 fileExistsAtPath:v1])
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = [v3 attributesOfItemAtPath:v1 error:0];
    uint64_t v5 = [v4 fileSize];

    if (v5)
    {
      id v6 = pp_events_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Attempt to read stored logs", buf, 2u);
      }

      id v7 = objc_alloc(MEMORY[0x1E4F28DC0]);
      id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v1];
      int v9 = (void *)[v7 initForReadingFromData:v8 error:0];

      [v9 setDecodingFailurePolicy:0];
      uint64_t v10 = [v9 decodeTopLevelObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8] error:0];
      unint64_t v11 = (void *)defaultLogger_sharedLogger;
      defaultLogger_sharedLogger = v10;

      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v12 = pp_events_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v15 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEBUG, "New logging store", v15, 2u);
  }

  dispatch_source_t v13 = [[PPEventMetricsLogger alloc] initWithFileName:v1];
  char v14 = (void *)defaultLogger_sharedLogger;
  defaultLogger_sharedLogger = (uint64_t)v13;

LABEL_10:
}

@end