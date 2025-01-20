@interface RPNWNearbyInvitationEndpoint
+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6;
+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4;
+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4;
+ (id)findEndpoint:(id)a3;
+ (id)listEndpointsForDiscoverySession:(id)a3;
+ (void)clearEndpointMappings:(id)a3;
+ (void)initialize;
+ (void)listEndpoints:(id)a3;
+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3;
+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 applicationService:(id)a6 discoverySessionID:(id)a7;
- (BOOL)browseSession;
- (BOOL)removeDiscoverySession:(id)a3;
- (BOOL)seenBySession:(id)a3;
- (NSMutableArray)sessions;
- (NSString)applicationService;
- (NSUUID)endpointUUID;
- (RPNWNearbyInvitationEndpoint)init;
- (RPNWNearbyInvitationEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6;
- (RPNearbyInvitationDevice)device;
- (id)description;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)setApplicationService:(id)a3;
- (void)setBrowseSession:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation RPNWNearbyInvitationEndpoint

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)qword_100142D10;
    qword_100142D10 = (uint64_t)v4;
  }
}

- (RPNWNearbyInvitationEndpoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNWNearbyInvitationEndpoint;
  v2 = [(RPNWNearbyInvitationEndpoint *)&v6 init];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (RPNWNearbyInvitationEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RPNWNearbyInvitationEndpoint;
  v14 = [(RPNWNearbyInvitationEndpoint *)&v19 init];
  v15 = v14;
  if (v14)
  {
    [(RPNWNearbyInvitationEndpoint *)v14 setDevice:v10];
    [(RPNWNearbyInvitationEndpoint *)v15 setApplicationService:v11];
    [(RPNWNearbyInvitationEndpoint *)v15 setEndpointUUID:v12];
    id v16 = objc_alloc_init((Class)NSMutableArray);
    [(RPNWNearbyInvitationEndpoint *)v15 setSessions:v16];

    if (v13)
    {
      [(RPNWNearbyInvitationEndpoint *)v15 addSession:v13];
      [(RPNWNearbyInvitationEndpoint *)v15 setBrowseSession:1];
    }
    v17 = v15;
  }

  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWNearbyInvitationEndpoint;
  [(RPNWNearbyInvitationEndpoint *)&v2 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"RPNWNearbyInvitationEndpoint[%@:%@] '%@'", self->_applicationService, self->_endpointUUID, self->_device];

  return v3;
}

- (void)addSession:(id)a3
{
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

- (BOOL)removeDiscoverySession:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_sessions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", v4, (void)v13))
        {
          [(NSMutableArray *)self->_sessions removeObject:v10];

          [(NSMutableArray *)self->_sessions count];
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (id)listEndpointsForDiscoverySession:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)qword_100142D10;
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
        long long v10 = [(id)qword_100142D10 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if ([v10 seenBySession:v3])
        {
          BOOL v11 = [v10 description];
          [v4 appendFormat:@"  %@\n", v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3
{
  id v3 = a3;
  if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    id v13 = v3;
    LogPrintF();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [[(id)qword_100142D10 allKeys:v13];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
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
        long long v10 = [(id)qword_100142D10 objectForKeyedSubscript:v9];
        if ([v10 removeDiscoverySession:v3])
        {
          BOOL v11 = (void *)qword_100142D10;
          uint64_t v18 = v9;
          long long v12 = +[NSArray arrayWithObjects:&v18 count:1];
          [v11 removeObjectsForKeys:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }
}

+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = (RPNWNearbyInvitationEndpoint *)a5;
  id v12 = a6;
  if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    id v32 = v9;
    id v33 = v12;
    v30 = v11;
    id v31 = v10;
    LogPrintF();
  }
  id v34 = v12;
  v35 = v11;
  id v36 = v10;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  p_inst_props = &OBJC_PROTOCOL___NFConnectionHandoverReceiverDelegate.inst_props;
  long long v14 = (RPNWNearbyInvitationEndpoint *)(id)qword_100142D10;
  id v15 = [(RPNWNearbyInvitationEndpoint *)v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = -[__objc2_prop_list objectForKeyedSubscript:](p_inst_props[418], "objectForKeyedSubscript:", *(void *)(*((void *)&v37 + 1) + 8 * i), v30, v31, v32, v33);
        v20 = [v19 device];
        if ([v20 isEqualToDevice:v9])
        {
          [v19 endpointUUID];
          v21 = p_inst_props;
          v23 = v22 = v14;
          unsigned int v24 = [v23 isEqual:v36];

          long long v14 = v22;
          p_inst_props = v21;

          if (v24)
          {
            if (dword_1001417F0 <= 40 && (dword_1001417F0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v25 = v35;
            v26 = v36;
            v27 = v34;
            if (v34 && ([v19 seenBySession:v34] & 1) == 0)
            {
              [v19 addSession:v34];
              BOOL v28 = 1;
            }
            else
            {
              BOOL v28 = 0;
            }

            goto LABEL_30;
          }
        }
        else
        {
        }
      }
      id v16 = [(RPNWNearbyInvitationEndpoint *)v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v25 = v35;
  v26 = v36;
  v27 = v34;
  long long v14 = [[RPNWNearbyInvitationEndpoint alloc] initWithDevice:v9 applicationService:v35 endpointID:v36 discoverySessionID:v34];
  if (dword_1001417F0 <= 40 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    v30 = v14;
    LogPrintF();
  }
  -[__objc2_prop_list setObject:forKeyedSubscript:](p_inst_props[418], "setObject:forKeyedSubscript:", v14, v36, v30);
  BOOL v28 = 1;
LABEL_30:

  return v28;
}

+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v5;
    LogPrintF();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)qword_100142D10;
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
        id v12 = [(id)qword_100142D10 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i), v16];
        id v13 = [v12 device];
        if ([v13 isEqualToDevice:v5])
        {
          unsigned int v14 = [v12 seenBySession:v6];

          if (v14)
          {
            if (dword_1001417F0 <= 40 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
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

+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    id v19 = a1;
    id v20 = v6;
    LogPrintF();
  }
  long long v21 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = (id)qword_100142D10;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    char v22 = 0;
    uint64_t v11 = *(void *)v24;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v12);
        unsigned int v14 = [(id)qword_100142D10 objectForKeyedSubscript:v13];
        id v15 = [v14 device];
        if ([v15 isEqualToDevice:v6])
        {
          unsigned int v16 = [v14 seenBySession:v7];

          if (v16)
          {
            if ([v14 removeDiscoverySession:v7])
            {
              [v21 addObject:v13];
              char v22 = 1;
            }
            else
            {
              char v22 = 0;
            }
          }
        }
        else
        {
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v17 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v10 = v17;
    }
    while (v17);
  }
  else
  {
    char v22 = 0;
  }

  [(id)qword_100142D10 removeObjectsForKeys:v21];
  return v22 & 1;
}

+ (void)clearEndpointMappings:(id)a3
{
  id v3 = a3;
  uint64_t v13 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)qword_100142D10;
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
        id v10 = [(id)qword_100142D10 objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 device];
        unsigned int v12 = [v11 isEqualToDevice:v3];

        if (v12) {
          [v13 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(id)qword_100142D10 removeObjectsForKeys:v13];
}

+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 applicationService:(id)a6 discoverySessionID:(id)a7
{
  id v28 = a3;
  v27 = (void (**)(id, void *))a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = v12;
  id v15 = v13;
  v30 = (void *)nw_array_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)qword_100142D10;
  id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  v29 = v12;
  if (v16)
  {
    id v17 = v16;
    int v18 = 0;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = [(id)qword_100142D10 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i), v25, v26];
        if ([v21 seenBySession:v15])
        {
          char v22 = +[RPNWNearbyInvitationPeer createNWEndpointForEndpoint:v21 agentID:v11 applicationService:v14];
          if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v25 = (unsigned __int16)v18;
            long long v26 = v22;
            LogPrintF();
            ++v18;
            id v14 = v29;
          }
          nw_array_append();
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    id v23 = v28;
    id v24 = objc_alloc_init((Class)NSMutableString);
    [v24 appendFormat:@"%p", v23];

    nw_array_get_count();
    LogPrintF();
  }
  v27[2](v27, v30);
}

+ (id)findEndpoint:(id)a3
{
  id v3 = a3;
  if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v3;
    LogPrintF();
  }
  id v4 = [(id)qword_100142D10 objectForKeyedSubscript:v3, v7];
  if (v4)
  {
    if (dword_1001417F0 <= 30 && (dword_1001417F0 != -1 || _LogCategory_Initialize())) {
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
  if ([(id)qword_100142D10 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)qword_100142D10;
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
          uint64_t v9 = [(__objc2_prop_list *)p_inst_props[418] objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)v7)];
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

- (RPNearbyInvitationDevice)device
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

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end