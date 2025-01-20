@interface RPNWListener
+ (BOOL)addListenerAgentClient:(id)a3;
+ (id)addDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5;
+ (id)findListenerForAgentClient:(id)a3 sender:(id)a4 browseRequest:(BOOL)a5;
+ (id)findListenerForID:(id)a3 applicationService:(id)a4 fromPeer:(id)a5;
+ (void)initialize;
+ (void)listAllowedApplicationServices:(id)a3;
+ (void)queryDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5;
+ (void)removeListenerForApplicationService:(id)a3;
+ (void)setAutoMapping:(BOOL)a3;
+ (void)startListenerMappingTimeout:(id)a3;
- (BOOL)automapped;
- (BOOL)hasTriggeredConnection;
- (NSDate)ageOutTimeout;
- (NSDate)triggerTime;
- (NSMutableArray)incomingConnections;
- (NSMutableArray)listenerNotifications;
- (NSMutableArray)peerDevices;
- (NSString)applicationService;
- (NSUUID)mappingID;
- (OS_dispatch_source)ageOutListenerTimer;
- (RPNWAgentClient)agentClient;
- (RPNWConnection)triggeredConnection;
- (RPNWListener)init;
- (id)description;
- (id)getConnectionWithID:(id)a3;
- (id)longDescription;
- (id)removeTriggeredConnection;
- (int)pid;
- (void)addIncomingConnection:(id)a3;
- (void)dealloc;
- (void)markConnectionAsTriggered:(id)a3;
- (void)setAgeOutListenerTimer:(id)a3;
- (void)setAgeOutTimeout:(id)a3;
- (void)setAgentClient:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setAutomapped:(BOOL)a3;
- (void)setIncomingConnections:(id)a3;
- (void)setListenerNotifications:(id)a3;
- (void)setMappingID:(id)a3;
- (void)setPeerDevices:(id)a3;
- (void)setPid:(int)a3;
- (void)setTriggerTime:(id)a3;
- (void)setTriggeredConnection:(id)a3;
@end

@implementation RPNWListener

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)qword_100142C70;
    qword_100142C70 = (uint64_t)v4;
  }
}

- (RPNWListener)init
{
  v11.receiver = self;
  v11.super_class = (Class)RPNWListener;
  v2 = [(RPNWListener *)&v11 init];
  if (v2)
  {
    if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
    {
      id v3 = v2;
      id v4 = objc_alloc_init((Class)NSMutableString);
      [v4 appendFormat:@"%p", v3];

      LogPrintF();
    }
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peerDevices = v2->_peerDevices;
    v2->_peerDevices = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    listenerNotifications = v2->_listenerNotifications;
    v2->_listenerNotifications = v7;

    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWListener;
  [(RPNWListener *)&v2 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = self;
  id v5 = objc_alloc_init((Class)NSMutableString);
  [v5 appendFormat:@"%p", v4];

  [v3 appendFormat:@"RPNWListener[%@][%@]=%@ : ", v5, v4->_applicationService, v4->_mappingID];
  ageOutTimeout = v4->_ageOutTimeout;
  if (ageOutTimeout)
  {
    v7 = +[NSDate now];
    [(NSDate *)ageOutTimeout timeIntervalSinceDate:v7];
    uint64_t v9 = v8;

    [v3 appendFormat:@"ageOut=%.0fs ", v9];
  }
  else
  {
    [v3 appendString:@"ageOut=N/A "];
  }
  id v10 = objc_loadWeakRetained((id *)&v4->_agentClient);
  id v11 = objc_alloc_init((Class)NSMutableString);
  [v11 appendFormat:@"%p", v10];

  [v3 appendFormat:@"agentClient=%@ { ", v11];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = v4->_peerDevices;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) name];
        [v3 appendFormat:@"'%@' ", v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [v3 appendString:@"}"];

  return v3;
}

- (id)longDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = [(RPNWListener *)self description];
  [v3 appendString:v4];

  incomingConnections = self->_incomingConnections;
  if (incomingConnections && [(NSMutableArray *)incomingConnections count])
  {
    [v3 appendFormat:@"  Incoming Connections:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_incomingConnections;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v3 appendFormat:@"   + %@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }

  return v3;
}

+ (void)removeListenerForApplicationService:(id)a3
{
  id v3 = a3;
  id v4 = [(id)qword_100142C70 objectForKeyedSubscript:v3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 incomingConnections];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) sendStatusUpdate:2];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(id)qword_100142C70 removeObjectForKey:v3];
}

+ (id)addDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5
{
  id v7 = (RPNWListener *)a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    [v8 name];
    long long v19 = v18 = v7;
    LogPrintF();
  }
  if (v7)
  {
    long long v10 = [(id)qword_100142C70 objectForKeyedSubscript:v7];
    if (v10)
    {
      long long v11 = v10;
      long long v12 = [(RPNWListener *)v10 agentClient];

      if (v12)
      {
        long long v12 = [(RPNWListener *)v11 agentClient];
      }
      else
      {
        [(RPNWListener *)v11 setPid:0];
      }
    }
    else
    {
      long long v11 = objc_alloc_init(RPNWListener);
      [(id)qword_100142C70 setObject:v11 forKeyedSubscript:v7];
      [(RPNWListener *)v11 setApplicationService:v7];
      long long v13 = +[NSUUID UUID];
      [(RPNWListener *)v11 setMappingID:v13];

      long long v12 = +[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:v7];
      if (v12)
      {
        [(RPNWListener *)v11 setAgentClient:v12];
        -[RPNWListener setPid:](v11, "setPid:", [v12 pid]);
      }
      else
      {
        +[RPNWListener startListenerMappingTimeout:v7];
      }
      if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
      {
        v18 = v11;
        LogPrintF();
      }
    }
    long long v14 = [(RPNWListener *)v11 peerDevices];
    [v14 addObject:v8];

    if (v9)
    {
      if (v12)
      {
        if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        long long v15 = [(RPNWListener *)v11 mappingID];
        v9[2](v9, v15, 0);
      }
      else
      {
        if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        long long v15 = [(RPNWListener *)v11 listenerNotifications];
        v16 = objc_retainBlock(v9);
        [v15 addObject:v16];
      }
    }
  }
  else
  {
    if (dword_1001412D0 <= 90 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v11 = 0;
  }

  return v11;
}

+ (void)queryDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    [v8 name];
    v22 = id v20 = v7;
    LogPrintF();
  }
  long long v10 = [[(id)qword_100142C70 objectForKeyedSubscript:v7, v20, v22];
  long long v11 = v10;
  if (!v10
    || ([v10 agentClient], long long v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    if (dword_1001412D0 > 30 || dword_1001412D0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v13 = [v11 peerDevices];
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v18 isEqualToDevice:v8])
        {
          if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
          {
            long long v21 = v18;
            LogPrintF();
          }
          long long v19 = [v11 mappingID:v21];
          v9[2](v9, v19, 0);

          goto LABEL_30;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
LABEL_20:
  }
    LogPrintF();
LABEL_29:
  v9[2](v9, 0, 0);
LABEL_30:
}

+ (BOOL)addListenerAgentClient:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_100142C70;
  id v5 = [v3 applicationService];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
    {
      v29 = [v3 applicationService];
      LogPrintF();
    }
    goto LABEL_47;
  }
  if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    [v3 applicationService];
    v31 = v28 = v6;
    LogPrintF();
  }
  if (objc_msgSend(v6, "pid", v28, v31))
  {
    unsigned int v7 = [v6 pid];
    if (v7 != [v3 pid])
    {
      if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
      {
        id v30 = [v6 pid];
        id v32 = [v3 pid];
        LogPrintF();
      }
      long long v26 = [v3 applicationService:v30, v32];
      +[RPNWListener removeListenerForApplicationService:v26];

LABEL_47:
      BOOL v25 = 0;
      goto LABEL_48;
    }
  }
  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v3;
    id v9 = objc_alloc_init((Class)NSMutableString);
    [v9 appendFormat:@"%p", v8];

    id v30 = v9;
    id v32 = v6;
    LogPrintF();
  }
  long long v10 = [v6 ageOutListenerTimer:v30 withTimeout:v32];

  if (v10)
  {
    if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v11 = [v6 ageOutListenerTimer];
    dispatch_source_cancel(v11);

    [v6 setAgeOutTimeout:0];
    [v6 setAgeOutListenerTimer:0];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v12 = [v6 incomingConnections];
  id v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v38;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) sendStatusUpdate:3];
      }
      id v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v14);
  }

  [v6 setAgentClient:v3];
  [v6 setPid:[v3 pid]];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v17 = [v6 listenerNotifications];
  id v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        long long v23 = [v6 mappingID];
        (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
      }
      id v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v19);
  }

  long long v24 = [v6 listenerNotifications];
  [v24 removeAllObjects];

  BOOL v25 = 1;
LABEL_48:

  return v25;
}

+ (void)startListenerMappingTimeout:(id)a3
{
  id v3 = a3;
  id v4 = [(id)qword_100142C70 objectForKeyedSubscript:v3];
  if (v4)
  {
    if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v4;
      LogPrintF();
    }
    [v4 setAgentClient:0, v13];
    id v5 = +[NSDate dateWithTimeIntervalSinceNow:180.0];
    [v4 setAgeOutTimeout:v5];

    id v6 = +[RPNWNetworkAgent sharedNetworkAgent];
    unsigned int v7 = [v6 dispatchQueue];
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
    [v4 setAgeOutListenerTimer:v8];

    id v9 = [v4 ageOutListenerTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100046388;
    handler[3] = &unk_1001219D0;
    id v10 = v4;
    id v15 = v10;
    id v16 = v3;
    dispatch_source_set_event_handler(v9, handler);

    long long v11 = [v10 ageOutListenerTimer];
    CUDispatchTimerSet();

    long long v12 = [v10 ageOutListenerTimer];
    dispatch_activate(v12);
  }
}

+ (id)findListenerForID:(id)a3 applicationService:(id)a4 fromPeer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    id v10 = +[RPNWNetworkAgent getLogInfo];
    [v9 name];
    v25 = id v24 = v8;
    long long v21 = v10;
    id v23 = v7;
    LogPrintF();
  }
  long long v11 = [(id)qword_100142C70 objectForKeyedSubscript:v8, v21, v23, v24, v25];
  if (!v11)
  {
    if (dword_1001412D0 > 30 || dword_1001412D0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_44;
    }
    goto LABEL_31;
  }
  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v22 = v11;
    LogPrintF();
  }
  if (!objc_msgSend(v11, "automapped", v22))
  {
    long long v12 = [v11 mappingID];
    unsigned __int8 v13 = [v12 isEqual:v7];

    if (v13)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v14 = [v11 peerDevices];
      id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            if ([*(id *)(*((void *)&v26 + 1) + 8 * i) isEqualToDevice:v9])
            {

              goto LABEL_36;
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      if (dword_1001412D0 > 30 || dword_1001412D0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_44;
      }
    }
    else if (dword_1001412D0 > 30 || dword_1001412D0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_44;
    }
LABEL_31:
    LogPrintF();
LABEL_44:
    id v19 = 0;
    goto LABEL_45;
  }
  if (dword_1001412D0 <= 30)
  {
    if (dword_1001412D0 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
LABEL_36:
    if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  id v19 = v11;
LABEL_45:

  return v19;
}

+ (id)findListenerForAgentClient:(id)a3 sender:(id)a4 browseRequest:(BOOL)a5
{
  BOOL v18 = a5;
  id v6 = a3;
  id v7 = a4;
  if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v6;
    LogPrintF();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)qword_100142C70;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = [(id)qword_100142C70 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i), v16];
        id v14 = [v13 agentClient];

        if (v14 == v6)
        {
          if (dword_1001412D0 <= 30 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v17 = [v13 mappingID];
            LogPrintF();
          }
          goto LABEL_31;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (dword_1001412D0 <= 90 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v7 && (byte_100142C78 || v18))
  {
    if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [v6 applicationService:v16];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v13 = +[RPNWListener addDeviceToApplicationServiceMapping:v8 device:v7 completion:0];
LABEL_31:
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)addIncomingConnection:(id)a3
{
  id v4 = a3;
  incomingConnections = self->_incomingConnections;
  id v8 = v4;
  if (!incomingConnections)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_incomingConnections;
    self->_incomingConnections = v6;

    id v4 = v8;
    incomingConnections = self->_incomingConnections;
  }
  [(NSMutableArray *)incomingConnections addObject:v4];
}

- (id)getConnectionWithID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_incomingConnections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 connectionUUID];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasTriggeredConnection
{
  if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_triggeredConnection)
  {
    if (dword_1001412D0 <= 40)
    {
      if (dword_1001412D0 == -1)
      {
        int v7 = _LogCategory_Initialize();
        if (!v7) {
          return v7;
        }
      }
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(v7) = 0;
    return v7;
  }
  triggerTime = self->_triggerTime;
  id v4 = +[NSDate now];
  [(NSDate *)triggerTime timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 < 0.0)
  {
    if (dword_1001412D0 <= 40)
    {
      if (dword_1001412D0 == -1)
      {
        int v7 = _LogCategory_Initialize();
        if (!v7) {
          return v7;
        }
      }
LABEL_15:
      LogPrintF();
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (void)markConnectionAsTriggered:(id)a3
{
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  triggerTime = self->_incomingConnections;
  int v7 = (char *)[(NSMutableArray *)triggerTime countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    id obj = a3;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      unsigned __int8 v11 = 0;
      BOOL v18 = &v8[(void)v9];
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(triggerTime);
        }
        long long v12 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v11) connectionUUID];
        long long v13 = [v5 connectionUUID];
        unsigned __int8 v14 = [v12 isEqual:v13];

        if (v14)
        {

          if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
          {
            id v16 = v5;
            LogPrintF();
          }
          -[NSMutableArray removeObjectAtIndex:](self->_incomingConnections, "removeObjectAtIndex:", &v11[(void)v9], v16);
          objc_storeStrong((id *)&self->_triggeredConnection, obj);
          long long v15 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
          triggerTime = (NSMutableArray *)self->_triggerTime;
          self->_triggerTime = v15;
          goto LABEL_15;
        }
        ++v11;
      }
      while (v8 != v11);
      id v8 = (char *)[(NSMutableArray *)triggerTime countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v9 = v18;
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (id)removeTriggeredConnection
{
  if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = self->_triggeredConnection;
  triggeredConnection = self->_triggeredConnection;
  self->_triggeredConnection = 0;

  triggerTime = self->_triggerTime;
  self->_triggerTime = 0;

  return v3;
}

+ (void)listAllowedApplicationServices:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (byte_100142C78) {
    id v5 = "on";
  }
  else {
    id v5 = "off";
  }
  [v3 appendFormat:@"AutoMapping: %s\n", v5];
  [v4 appendString:@"Allowed Application Services\n"];
  if ([(id)qword_100142C70 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)qword_100142C70;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = [(id)qword_100142C70 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
          long long v12 = [v11 longDescription];
          [v4 appendFormat:@"  %@\n", v12];

          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [v4 appendString:@"  <empty>\n"];
  }
}

+ (void)setAutoMapping:(BOOL)a3
{
  if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  byte_100142C78 = a3;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (NSUUID)mappingID
{
  return self->_mappingID;
}

- (void)setMappingID:(id)a3
{
}

- (NSMutableArray)peerDevices
{
  return self->_peerDevices;
}

- (void)setPeerDevices:(id)a3
{
}

- (NSMutableArray)listenerNotifications
{
  return self->_listenerNotifications;
}

- (void)setListenerNotifications:(id)a3
{
}

- (NSMutableArray)incomingConnections
{
  return self->_incomingConnections;
}

- (void)setIncomingConnections:(id)a3
{
}

- (RPNWConnection)triggeredConnection
{
  return self->_triggeredConnection;
}

- (void)setTriggeredConnection:(id)a3
{
}

- (NSDate)triggerTime
{
  return self->_triggerTime;
}

- (void)setTriggerTime:(id)a3
{
}

- (RPNWAgentClient)agentClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agentClient);

  return (RPNWAgentClient *)WeakRetained;
}

- (void)setAgentClient:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)ageOutTimeout
{
  return self->_ageOutTimeout;
}

- (void)setAgeOutTimeout:(id)a3
{
}

- (OS_dispatch_source)ageOutListenerTimer
{
  return self->_ageOutListenerTimer;
}

- (void)setAgeOutListenerTimer:(id)a3
{
}

- (BOOL)automapped
{
  return self->_automapped;
}

- (void)setAutomapped:(BOOL)a3
{
  self->_automapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageOutListenerTimer, 0);
  objc_storeStrong((id *)&self->_ageOutTimeout, 0);
  objc_destroyWeak((id *)&self->_agentClient);
  objc_storeStrong((id *)&self->_triggerTime, 0);
  objc_storeStrong((id *)&self->_triggeredConnection, 0);
  objc_storeStrong((id *)&self->_incomingConnections, 0);
  objc_storeStrong((id *)&self->_listenerNotifications, 0);
  objc_storeStrong((id *)&self->_peerDevices, 0);
  objc_storeStrong((id *)&self->_mappingID, 0);

  objc_storeStrong((id *)&self->_applicationService, 0);
}

@end