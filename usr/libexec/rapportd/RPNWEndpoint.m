@interface RPNWEndpoint
+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7;
+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4 immediate:(BOOL)a5;
+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4;
+ (id)findEndpoint:(id)a3;
+ (id)listEndpointsForDiscoverySession:(id)a3;
+ (void)ageOutEndpointMapping:(id)a3;
+ (void)clearEndpointMappings:(id)a3;
+ (void)endpointTimerFired;
+ (void)initialize;
+ (void)listEndpoints:(id)a3;
+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3;
+ (void)startEndpointTimer;
+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 agentClientPID:(int)a6 applicationService:(id)a7 discoverySessionID:(id)a8;
- (BOOL)browseSession;
- (BOOL)removeDiscoverySession:(id)a3 lastEntry:(BOOL *)a4;
- (BOOL)seenBySession:(id)a3;
- (BOOL)shouldAutomapListener;
- (NSDate)ageOutTimeout;
- (NSMutableArray)sessions;
- (NSString)applicationService;
- (NSUUID)endpointUUID;
- (RPCompanionLinkDevice)device;
- (RPNWEndpoint)init;
- (RPNWEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7;
- (id)description;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)setAgeOutTimeout:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setBrowseSession:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setSessions:(id)a3;
- (void)setShouldAutomapListener:(BOOL)a3;
- (void)startAgeOutTimer;
@end

@implementation RPNWEndpoint

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)qword_100142D78;
    qword_100142D78 = (uint64_t)v4;

    +[RPNWEndpoint startEndpointTimer];
  }
}

- (RPNWEndpoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNWEndpoint;
  v2 = [(RPNWEndpoint *)&v6 init];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (RPNWEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)RPNWEndpoint;
  v16 = [(RPNWEndpoint *)&v21 init];
  v17 = v16;
  if (v16)
  {
    [(RPNWEndpoint *)v16 setDevice:v12];
    [(RPNWEndpoint *)v17 setApplicationService:v13];
    [(RPNWEndpoint *)v17 setEndpointUUID:v14];
    [(RPNWEndpoint *)v17 setShouldAutomapListener:v7];
    id v18 = objc_alloc_init((Class)NSMutableArray);
    [(RPNWEndpoint *)v17 setSessions:v18];

    if (v15)
    {
      [(RPNWEndpoint *)v17 addSession:v15];
      [(RPNWEndpoint *)v17 setBrowseSession:1];
    }
    v19 = v17;
  }

  return v17;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWEndpoint;
  [(RPNWEndpoint *)&v2 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"RPNWEndpoint[%@:%@] '%@'", self->_applicationService, self->_endpointUUID, self->_device];
  ageOutTimeout = self->_ageOutTimeout;
  if (ageOutTimeout)
  {
    v5 = +[NSDate now];
    [(NSDate *)ageOutTimeout timeIntervalSinceDate:v5];
    double v7 = v6;

    if (v7 >= 0.0)
    {
      double v10 = v7;
      CFStringRef v8 = @" ageOut=%.0fs ";
    }
    else
    {
      CFStringRef v8 = @" ageOut=stale ";
    }
    [v3 appendFormat:v8, v10];
  }

  return v3;
}

- (void)startAgeOutTimer
{
  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    v5 = self;
    LogPrintF();
  }
  +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 180.0, v5);
  id v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  ageOutTimeout = self->_ageOutTimeout;
  self->_ageOutTimeout = v3;
}

- (void)addSession:(id)a3
{
  [(NSMutableArray *)self->_sessions addObject:a3];
  ageOutTimeout = self->_ageOutTimeout;
  self->_ageOutTimeout = 0;
}

- (BOOL)seenBySession:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_sessions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isEqual:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)removeDiscoverySession:(id)a3 lastEntry:(BOOL *)a4
{
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_sessions;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqual:", v6, (void)v13))
        {
          [(NSMutableArray *)self->_sessions removeObject:v11];
          LODWORD(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (a4) {
    *a4 = 0;
  }
  if (v8)
  {
    if (![(NSMutableArray *)self->_sessions count] && self->_browseSession)
    {
      [(RPNWEndpoint *)self startAgeOutTimer];
      if (a4) {
        *a4 = 1;
      }
    }
  }

  return (char)v8;
}

+ (id)listEndpointsForDiscoverySession:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)qword_100142D78;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [(id)qword_100142D78 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if ([v10 seenBySession:v3])
        {
          long long v11 = [v10 description];
          [v4 appendFormat:@"  %@\n", v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)startEndpointTimer
{
  objc_super v2 = +[RPNWNetworkAgent sharedNetworkAgent];
  id v3 = [v2 dispatchQueue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  id v5 = (void *)qword_100142D80;
  qword_100142D80 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100142D80, &stru_1001230D0);
  CUDispatchTimerSet();
  id v6 = qword_100142D80;

  dispatch_activate(v6);
}

+ (void)endpointTimerFired
{
  long long v15 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)qword_100142D78;
  id v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v7 = [(id)qword_100142D78 objectForKeyedSubscript:v6];
        uint64_t v8 = [v7 ageOutTimeout];
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          long long v10 = +[NSDate now];
          long long v11 = [v7 ageOutTimeout];
          long long v12 = [v10 earlierDate:v11];
          long long v13 = [v7 ageOutTimeout];

          if (v12 == v13)
          {
            if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              [v15 addObject:v6, v7];
            }
            else
            {
              [v15 addObject:v6, v14];
            }
          }
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }

  [(id)qword_100142D78 removeObjectsForKeys:v15];
}

+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3
{
  id v3 = a3;
  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v3;
    LogPrintF();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)qword_100142D78;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(id)qword_100142D78 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i) withObject:v10];
        [v9 removeDiscoverySession:v3 lastEntry:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7
{
  BOOL v41 = a7;
  id v10 = a3;
  id v11 = a4;
  long long v12 = (RPNWEndpoint *)a5;
  id v13 = a6;
  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    id v39 = v10;
    id v40 = v13;
    v37 = v12;
    id v38 = v11;
    LogPrintF();
  }
  v42 = v12;
  id v43 = v13;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v14 = (RPNWEndpoint *)(id)qword_100142D78;
  id v15 = [(RPNWEndpoint *)v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [(id)qword_100142D78 objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * i), v37, v38, v39, v40];
        long long v20 = [v19 device];
        if ([v20 isEqualToDevice:v10])
        {
          objc_super v21 = [v19 endpointUUID];
          unsigned int v22 = [v21 isEqual:v11];

          if (v22)
          {
            if (dword_100141AF0 <= 40 && (dword_100141AF0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v23 = v43;
            v24 = v11;
            v25 = v42;
            if (v43 && ([v19 seenBySession:v43] & 1) == 0)
            {
              [v19 addSession:v43];
              BOOL v26 = 1;
            }
            else
            {
              BOOL v26 = 0;
            }

            goto LABEL_50;
          }
        }
        else
        {
        }
      }
      id v16 = [(RPNWEndpoint *)v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v23 = v43;
  if (!v43)
  {
    if (dword_100141AF0 <= 40 && (dword_100141AF0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v44 = +[NSMutableArray array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v27 = (id)qword_100142D78;
    id v28 = [v27 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v46;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v46 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
          v33 = [(id)qword_100142D78 objectForKeyedSubscript:v32];
          if (([v33 browseSession] & 1) == 0)
          {
            v34 = [v33 device];
            unsigned __int8 v35 = [v34 isEqualToDevice:v10];

            if ((v35 & 1) == 0)
            {
              if (dword_100141AF0 <= 40 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
                [v44 addObject:v32, v33];
              }
              else
              {
                [v44 addObject:v32, v37];
              }
            }
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v29);
    }

    [(id)qword_100142D78 removeObjectsForKeys:v44];
    +[RPNWConnection stopAllOutgoingConnectionsNotForPeer:v10];

    v23 = 0;
  }
  v25 = v42;
  v24 = v11;
  long long v14 = [[RPNWEndpoint alloc] initWithDevice:v10 applicationService:v42 endpointID:v11 discoverySessionID:v23 shouldAutomapListener:v41];
  if (dword_100141AF0 <= 40 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    v37 = v14;
    LogPrintF();
  }
  [objc_msgSend((id)qword_100142D78, "setObject:forKeyedSubscript:", v14, v11, v37);
  BOOL v26 = 1;
LABEL_50:

  return v26;
}

+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v5;
    LogPrintF();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)qword_100142D78;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    char v17 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [(id)qword_100142D78 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i), v16];
        id v13 = [v12 device];
        if ([v13 isEqualToDevice:v5])
        {
          unsigned int v14 = [v12 seenBySession:v6];

          if (v14)
          {
            if (dword_100141AF0 <= 40 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
            {
              id v16 = v12;
              LogPrintF();
            }
            [v12 setDevice:v5, v16];
            char v17 = 1;
          }
        }
        else
        {
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  else
  {
    char v17 = 0;
  }

  return v17 & 1;
}

+ (void)ageOutEndpointMapping:(id)a3
{
  id v3 = a3;
  id v10 = v3;
  if (dword_100141AF0 <= 30)
  {
    if (dword_100141AF0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v10, v4))
    {
      id v9 = v3;
      LogPrintF();
      id v3 = v10;
    }
  }
  id v5 = +[RPNWEndpoint findEndpoint:](RPNWEndpoint, "findEndpoint:", v3, v9);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 sessions];
    id v8 = [v7 count];

    if (v8)
    {
      if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize())) {
LABEL_12:
      }
        LogPrintF();
    }
    else
    {
      [v6 startAgeOutTimer];
    }
  }
  else if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_12;
  }
}

+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4 immediate:(BOOL)a5
{
  BOOL v23 = a5;
  id v7 = a3;
  id v8 = a4;
  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    id v20 = a1;
    id v21 = v7;
    LogPrintF();
  }
  unsigned int v22 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = (id)qword_100142D78;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    LOBYTE(v24) = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v15 = [(id)qword_100142D78 objectForKeyedSubscript:v14];
        id v16 = [v15 device];
        if ([v16 isEqualToDevice:v7])
        {
          unsigned int v17 = [v15 seenBySession:v8];

          if (v17)
          {
            char v25 = 0;
            unsigned int v24 = [v15 removeDiscoverySession:v8 lastEntry:&v25];
            if (v23)
            {
              if (v24) {
                BOOL v18 = v25 == 0;
              }
              else {
                BOOL v18 = 1;
              }
              if (!v18) {
                [v22 addObject:v14];
              }
            }
          }
        }
        else
        {
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  [(id)qword_100142D78 removeObjectsForKeys:v22];
  return v24 & 1;
}

+ (void)clearEndpointMappings:(id)a3
{
  id v3 = a3;
  id v13 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)qword_100142D78;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(id)qword_100142D78 objectForKeyedSubscript:v9];
        id v11 = [v10 device];
        unsigned int v12 = [v11 isEqualToDevice:v3];

        if (v12) {
          [v13 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(id)qword_100142D78 removeObjectsForKeys:v13];
}

+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 agentClientPID:(int)a6 applicationService:(id)a7 discoverySessionID:(id)a8
{
  id v29 = a3;
  long long v28 = (void (**)(id, void *))a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  id v15 = v13;
  id v16 = v14;
  v31 = (void *)nw_array_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)qword_100142D78;
  id v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  uint64_t v30 = v13;
  if (v17)
  {
    id v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(obj);
        }
        unsigned int v22 = [(id)qword_100142D78 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * i), v26, v27];
        if ([v22 seenBySession:v16])
        {
          BOOL v23 = +[RPNWPeer createNWEndpointForEndpoint:v22 agentID:v12 applicationService:v15];
          if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v26 = (unsigned __int16)v19;
            long long v27 = v23;
            LogPrintF();
            ++v19;
            id v15 = v30;
          }
          nw_array_append();
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    id v24 = v29;
    id v25 = objc_alloc_init((Class)NSMutableString);
    [v25 appendFormat:@"%p", v24];

    nw_array_get_count();
    LogPrintF();
  }
  v28[2](v28, v31);
}

+ (id)findEndpoint:(id)a3
{
  id v3 = a3;
  if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v3;
    LogPrintF();
  }
  id v4 = [(id)qword_100142D78 objectForKeyedSubscript:v3, v7];
  if (v4)
  {
    if (dword_100141AF0 <= 30 && (dword_100141AF0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = v4;
  }

  return v4;
}

+ (void)listEndpoints:(id)a3
{
  id v3 = a3;
  [v3 appendString:@"Discovered Endpoints\n"];
  p_inst_props = &OBJC_PROTOCOL___NFConnectionHandoverReceiverDelegate.inst_props;
  if ([(id)qword_100142D78 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)qword_100142D78;
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v17 = *(void *)v23;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(obj);
          }
          id v8 = p_inst_props;
          uint64_t v9 = [(__objc2_prop_list *)p_inst_props[431] objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)v7)];
          id v10 = [v9 description];
          [v3 appendFormat:@"  %@\n", v10];

          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v11 = [v9 sessions];
          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              id v15 = 0;
              do
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v3 appendFormat:@"  + Discovered by session '%@'\n", *(void *)(*((void *)&v18 + 1) + 8 * (void)v15)];
                id v15 = (char *)v15 + 1;
              }
              while (v13 != v15);
              id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v13);
          }

          id v7 = (char *)v7 + 1;
          p_inst_props = v8;
        }
        while (v7 != v6);
        id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [v3 appendString:@"  <empty>\n"];
  }
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (BOOL)browseSession
{
  return self->_browseSession;
}

- (void)setBrowseSession:(BOOL)a3
{
  self->_browseSession = a3;
}

- (BOOL)shouldAutomapListener
{
  return self->_shouldAutomapListener;
}

- (void)setShouldAutomapListener:(BOOL)a3
{
  self->_shouldAutomapListener = a3;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (NSDate)ageOutTimeout
{
  return self->_ageOutTimeout;
}

- (void)setAgeOutTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageOutTimeout, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end