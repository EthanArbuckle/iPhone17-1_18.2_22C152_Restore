@interface NESMAlwaysOnSession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)supportsDefaultDrop;
- (NESMAlwaysOnSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)copyExtendedStatus;
- (int)type;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)handleCaptiveNetworkPluginsChanged;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleWakeup;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatus:(int)a3;
@end

@implementation NESMAlwaysOnSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_VPNSessionRetryCounters, 0);
  objc_storeStrong((id *)&self->_VPNSessions, 0);
  objc_storeStrong((id *)&self->_lastStartMessage, 0);
  objc_storeStrong((id *)&self->_CTClient, 0);
  objc_storeStrong((id *)&self->_IDSNexusDomain, 0);

  objc_storeStrong((id *)&self->_IDSNexusPathEvaluator, 0);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed: %@", (uint8_t *)&v6, 0xCu);
  }

  sub_100005C1C((uint64_t)self);
  [(NESMAlwaysOnSession *)self handleNetworkDetectionNotification:1];
}

- (BOOL)supportsDefaultDrop
{
  return 1;
}

- (void)handleInstalledAppsChanged
{
  [(NESMAlwaysOnSession *)self handleNetworkDetectionNotification:2];
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006090;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleCaptiveNetworkPluginsChanged
{
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 5 && ((1 << a3) & 0x27) != 0)
  {
    block[7] = v3;
    block[8] = v4;
    int v6 = [(NESMSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000652C;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 360, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;
  if (v14 == v10)
  {
    unsigned int v15 = [v9 isEqualToString:@"path"];

    if (!v15) {
      goto LABEL_30;
    }
    if (self) {
      id v17 = objc_getProperty(self, v16, 360, 1);
    }
    else {
      id v17 = 0;
    }
    v18 = [v17 path];
    if ([v18 status] == (id)1)
    {
      if (self) {
        unint64_t IDSNexusIfIndex = self->_IDSNexusIfIndex;
      }
      else {
        unint64_t IDSNexusIfIndex = 0;
      }
      v20 = [v18 interface];
      id v21 = [v20 interfaceIndex];

      if ((id)IDSNexusIfIndex == v21) {
        goto LABEL_29;
      }
      v22 = ne_log_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        if (self) {
          unint64_t v23 = self->_IDSNexusIfIndex;
        }
        else {
          unint64_t v23 = 0;
        }
        v24 = [v18 interface];
        int v38 = 134218240;
        unint64_t v39 = v23;
        __int16 v40 = 2048;
        id v41 = [v24 interfaceIndex];
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "IDS Nexus interface changed %ld -> %ld", (uint8_t *)&v38, 0x16u);
      }
      v25 = [v18 interface];
      id v26 = [v25 interfaceIndex];
      if (self) {
        self->_unint64_t IDSNexusIfIndex = (unint64_t)v26;
      }

      v27 = [(NESMSession *)self policySession];
      v28 = [v18 interface];
      v29 = [v28 interfaceName];
      char v30 = sub_100045A38((uint64_t)v27, v29);

      if (v30) {
        goto LABEL_29;
      }
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = [v18 interface];
        v33 = [v32 interfaceName];
        int v38 = 138412290;
        unint64_t v39 = (unint64_t)v33;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to add IDS Nexus policy for %@", (uint8_t *)&v38, 0xCu);
      }
    }
    else
    {
      v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v38) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "IDS Nexus interface unusable", (uint8_t *)&v38, 2u);
      }

      if (self) {
        self->_unint64_t IDSNexusIfIndex = 0;
      }
      v35 = [(NESMSession *)self policySession];
      char v37 = sub_100031FA0(v35, v36);

      if (v37) {
        goto LABEL_29;
      }
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v38) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", (uint8_t *)&v38, 2u);
      }
    }

LABEL_29:
    goto LABEL_30;
  }

LABEL_30:
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  v5 = [(NESMSession *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006F34;
  v6[3] = &unk_1000C6B78;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)setStatus:(int)a3
{
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v79 = self;
    __int16 v80 = 2080;
    v81 = "-[NESMAlwaysOnSession setStatus:]";
    __int16 v82 = 2080;
    uint64_t v83 = ne_session_status_to_string();
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (new status %s)", buf, 0x20u);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  int v6 = &selRef_setLastPrimaryInterface_;
  if (self) {
    id Property = objc_getProperty(self, v5, 400, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  id v9 = [v8 countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v72;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v72 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v71 + 1) + 8 * (void)v13);
        if (self) {
          id v15 = objc_getProperty(self, v10, *((int *)v6 + 417), 1);
        }
        else {
          id v15 = 0;
        }
        v16 = [v15 objectForKeyedSubscript:v14];
        id v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v18 = [v16 interfaceName];
          v19 = (const char *)[v16 connectCount];
          id v20 = [v16 connectedCount];
          id v21 = [v16 disconnectedCount];
          *(_DWORD *)buf = 138413058;
          v79 = v18;
          __int16 v80 = 2048;
          v81 = v19;
          __int16 v82 = 2048;
          uint64_t v83 = (uint64_t)v20;
          __int16 v84 = 2048;
          id v85 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "AlwaysOn Stats [%@]: connect %ld, connected %ld, disconnected %ld", buf, 0x2Au);

          int v6 = &selRef_setLastPrimaryInterface_;
        }

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v22 = [v8 countByEnumeratingWithState:&v71 objects:v86 count:16];
      id v11 = v22;
    }
    while (v22);
  }

  v77[1] = 0;
  v77[0] = 0;
  unint64_t v23 = [(NESMSession *)self configuration];
  v24 = [v23 identifier];
  [v24 getUUIDBytes:v77];

  switch(a3)
  {
    case 1:
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      if (self) {
        id v42 = objc_getProperty(self, v25, *((int *)v6 + 417), 1);
      }
      else {
        id v42 = 0;
      }
      id v43 = v42;
      id v44 = [v43 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v44)
      {
        id v46 = v44;
        uint64_t v47 = *(void *)v67;
        do
        {
          v48 = 0;
          do
          {
            if (*(void *)v67 != v47) {
              objc_enumerationMutation(v43);
            }
            uint64_t v49 = *(void *)(*((void *)&v66 + 1) + 8 * (void)v48);
            if (self) {
              id v50 = objc_getProperty(self, v45, *((int *)v6 + 417), 1);
            }
            else {
              id v50 = 0;
            }
            v51 = [v50 objectForKeyedSubscript:v49];
            unsigned int v52 = [v51 status];

            if (v52 != 1)
            {

              return;
            }
            v48 = (char *)v48 + 1;
          }
          while (v46 != v48);
          id v53 = [v43 countByEnumeratingWithState:&v66 objects:v76 count:16];
          id v46 = v53;
        }
        while (v53);
      }

      v54 = [(NESMSession *)self policySession];
      sub_1000319BC((uint64_t)v54);

      if (self && self->_stopped)
      {
        v56 = ne_log_obj();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v79 = self;
          __int16 v80 = 2080;
          v81 = "-[NESMAlwaysOnSession setStatus:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: DISCONNECTED", buf, 0x16u);
        }

        v65.receiver = self;
        v65.super_class = (Class)NESMAlwaysOnSession;
        [(NESMSession *)&v65 setStatus:1];
      }
      else
      {
        v55 = ne_log_obj();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v79 = self;
          __int16 v80 = 2080;
          v81 = "-[NESMAlwaysOnSession setStatus:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: REASSERTING", buf, 0x16u);
        }

        v64.receiver = self;
        v64.super_class = (Class)NESMAlwaysOnSession;
        [(NESMSession *)&v64 setStatus:4];
      }
      break;
    case 2:
    case 4:
    case 5:
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      if (self) {
        id v26 = objc_getProperty(self, v25, *((int *)v6 + 417), 1);
      }
      else {
        id v26 = 0;
      }
      id v27 = v26;
      id v28 = [v27 countByEnumeratingWithState:&v60 objects:v75 count:16];
      if (v28)
      {
        id v30 = v28;
        uint64_t v31 = *(void *)v61;
        do
        {
          v32 = 0;
          do
          {
            if (*(void *)v61 != v31) {
              objc_enumerationMutation(v27);
            }
            uint64_t v33 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v32);
            if (self) {
              id v34 = objc_getProperty(self, v29, *((int *)v6 + 417), 1);
            }
            else {
              id v34 = 0;
            }
            v35 = [v34 objectForKeyedSubscript:v33];
            unsigned int v36 = [v35 status];

            if (v36 == 3)
            {

              return;
            }
            v32 = (char *)v32 + 1;
          }
          while (v30 != v32);
          id v37 = [v27 countByEnumeratingWithState:&v60 objects:v75 count:16];
          id v30 = v37;
        }
        while (v37);
      }

      int v38 = [(NESMSession *)self policySession];
      sub_1000319BC((uint64_t)v38);

      unint64_t v39 = ne_log_obj();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v57 = ne_session_status_to_string();
        *(_DWORD *)buf = 138412802;
        v79 = self;
        __int16 v80 = 2080;
        v81 = "-[NESMAlwaysOnSession setStatus:]";
        __int16 v82 = 2080;
        uint64_t v83 = v57;
        _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: %s", buf, 0x20u);
      }

      v59.receiver = self;
      v59.super_class = (Class)NESMAlwaysOnSession;
      [(NESMSession *)&v59 setStatus:a3];
      break;
    case 3:
      __int16 v40 = ne_log_obj();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v79 = self;
        __int16 v80 = 2080;
        v81 = "-[NESMAlwaysOnSession setStatus:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: CONNECTED", buf, 0x16u);
      }

      v70.receiver = self;
      v70.super_class = (Class)NESMAlwaysOnSession;
      [(NESMSession *)&v70 setStatus:3];
      id v41 = [(NESMSession *)self policySession];
      sub_1000318B0((uint64_t)v41);

      break;
    default:
      return;
  }
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  id v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v18 = self;
    __int16 v19 = 2080;
    id v20 = "-[NESMAlwaysOnSession handleChangeEventForInterface:newFlags:previousFlags:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 1024;
    int v24 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (ifName %@, flags %X)", buf, 0x26u);
  }

  v16.receiver = self;
  v16.super_class = (Class)NESMAlwaysOnSession;
  [(NESMSession *)&v16 handleChangeEventForInterface:v8 newFlags:a4 previousFlags:a5];
  id v10 = [(NESMSession *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000797C;
  v12[3] = &unk_1000C6980;
  v12[4] = self;
  id v13 = v8;
  unint64_t v14 = a4;
  unint64_t v15 = a5;
  id v11 = v8;
  dispatch_async(v10, v12);
}

- (id)copyExtendedStatus
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v3, 400, 1);
    }
    else {
      id Property = 0;
    }
    id obj = Property;
    id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v24;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
          if (self) {
            id v12 = objc_getProperty(self, v7, 400, 1);
          }
          else {
            id v12 = 0;
          }
          id v13 = [v12 objectForKeyedSubscript:v11];
          unint64_t v14 = [v13 queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100009328;
          block[3] = &unk_1000C6958;
          id v20 = v13;
          id v21 = v4;
          uint64_t v22 = v11;
          id v15 = v13;
          dispatch_sync(v14, block);

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v16 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        id v8 = v16;
      }
      while (v16);
    }
  }
  return v4;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t v28 = a3;
  xpc_object_t xdict = xpc_dictionary_create_reply(v28);
  if (a4 == 2)
  {
    self = [(NESMAlwaysOnSession *)self copyExtendedStatus];
    if (self)
    {
LABEL_13:
      long long v25 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(xdict, "SessionInfo", v25);
    }
  }
  else if (a4 == 1)
  {
    if (self)
    {
      uint64_t v67 = 0;
      long long v68 = &v67;
      uint64_t v69 = 0x3032000000;
      objc_super v70 = sub_100009918;
      long long v71 = sub_100009928;
      id v72 = 0;
      uint64_t v63 = 0;
      objc_super v64 = &v63;
      uint64_t v65 = 0x2020000000;
      uint64_t v66 = 0;
      uint64_t v59 = 0;
      long long v60 = &v59;
      uint64_t v61 = 0x2020000000;
      uint64_t v62 = 0;
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x2020000000;
      uint64_t v58 = 0;
      uint64_t v51 = 0;
      unsigned int v52 = &v51;
      uint64_t v53 = 0x2020000000;
      uint64_t v54 = 0;
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      uint64_t v50 = 0;
      uint64_t v43 = 0;
      id v44 = &v43;
      uint64_t v45 = 0x2020000000;
      uint64_t v46 = 0;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = objc_getProperty(self, v6, 400, 1);
      id v8 = [obj countByEnumeratingWithState:&v39 objects:v77 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v40;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v40 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            id v12 = objc_getProperty(self, v7, 400, 1);
            id v13 = [v12 objectForKeyedSubscript:v11];

            unint64_t v14 = [v13 queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100009930;
            block[3] = &unk_1000C54D0;
            id v31 = v13;
            v32 = &v67;
            uint64_t v33 = &v63;
            id v34 = &v59;
            v35 = &v55;
            unsigned int v36 = &v51;
            id v37 = &v47;
            int v38 = &v43;
            id v15 = v13;
            dispatch_sync(v14, block);
          }
          id v8 = [obj countByEnumeratingWithState:&v39 objects:v77 count:16];
        }
        while (v8);
      }

      uint64_t v75 = kSCEntNetVPN;
      v73[0] = @"BytesIn";
      id v16 = +[NSNumber numberWithUnsignedLongLong:v64[3]];
      v74[0] = v16;
      v73[1] = @"BytesOut";
      id v17 = +[NSNumber numberWithUnsignedLongLong:v60[3]];
      v74[1] = v17;
      v73[2] = @"PacketsIn";
      v18 = +[NSNumber numberWithUnsignedLongLong:v56[3]];
      v74[2] = v18;
      v73[3] = @"PacketsOut";
      __int16 v19 = +[NSNumber numberWithUnsignedLongLong:v52[3]];
      v74[3] = v19;
      v73[4] = @"ErrorsIn";
      id v20 = +[NSNumber numberWithUnsignedLongLong:v48[3]];
      v74[4] = v20;
      v73[5] = @"ErrorsOut";
      id v21 = +[NSNumber numberWithUnsignedLongLong:v44[3]];
      v74[5] = v21;
      uint64_t v22 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:6];
      v76 = v22;
      uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      long long v24 = (void *)v68[5];
      v68[5] = v23;

      self = (NESMAlwaysOnSession *)(id)v68[5];
      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
    }
    if (self) {
      goto LABEL_13;
    }
  }
  xpc_dictionary_get_remote_connection(v28);
  long long v26 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v26, xdict);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    [(NESMSession *)self setConfiguration:0];
    [(NESMSession *)self setConfigurationSignature:0];
    sub_100006570(self);
    goto LABEL_15;
  }
  unsigned int v5 = [(NESMSession *)self status];
  if (self && v5 == 4 && self->_stopped)
  {
    id v6 = [(NESMSession *)self configuration];
    if (![v6 isEnabled])
    {
      unsigned int v7 = [v4 isEnabled];

      if (!v7) {
        goto LABEL_10;
      }
      self->_stopped = 0;
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = self;
        __int16 v18 = 2080;
        __int16 v19 = "-[NESMAlwaysOnSession handleUpdateConfiguration:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@:%s: Enabling config in Reasserting state, clearing STOPPED", buf, 0x16u);
      }
    }
  }
LABEL_10:
  v15.receiver = self;
  v15.super_class = (Class)NESMAlwaysOnSession;
  if (![(NESMSession *)&v15 handleUpdateConfiguration:v4])
  {
LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  sub_100006570(self);
  id v8 = [v4 alwaysOnVPN];
  unsigned int v9 = [v8 isEnabled];

  if (v9)
  {
    id v10 = [(NESMSession *)self queue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009D28;
    v13[3] = &unk_1000C6C38;
    v13[4] = self;
    id v14 = v4;
    dispatch_async(v10, v13);
  }
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (void)handleWakeup
{
  uint64_t v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A0A8;
  block[3] = &unk_1000C6C60;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self)
  {
    self->_stopped = 1;
    objc_setProperty_atomic(self, a2, 0, 392);
    v26.receiver = self;
    v26.super_class = (Class)NESMAlwaysOnSession;
    [(NESMSession *)&v26 handleStopMessageWithReason:v3];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id Property = objc_getProperty(self, v5, 400, 1);
  }
  else
  {
    v26.receiver = 0;
    v26.super_class = (Class)NESMAlwaysOnSession;
    [(NESMSession *)&v26 handleStopMessageWithReason:*(void *)&a3];
    id Property = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  id obj = Property;
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    do
    {
      BOOL v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v11);
        if (self) {
          id v13 = objc_getProperty(self, v8, 400, 1);
        }
        else {
          id v13 = 0;
        }
        id v14 = [v13 objectForKeyedSubscript:v12];
        objc_super v15 = [v14 queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000A4F8;
        block[3] = &unk_1000C6DD8;
        id v20 = v14;
        int v21 = v3;
        id v16 = v14;
        dispatch_async(v15, block);

        BOOL v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v9 = v17;
    }
    while (v17);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_setProperty_atomic(self, v4, v5, 392);
    self->_stopped = 0;
    v26.receiver = self;
    v26.super_class = (Class)NESMAlwaysOnSession;
    [(NESMSession *)&v26 handleStartMessage:v5];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id Property = objc_getProperty(self, v6, 400, 1);
  }
  else
  {
    v26.receiver = 0;
    v26.super_class = (Class)NESMAlwaysOnSession;
    [(NESMSession *)&v26 handleStartMessage:v5];
    id Property = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  id v8 = Property;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v13);
        if (self) {
          id v15 = objc_getProperty(self, v10, 400, 1);
        }
        else {
          id v15 = 0;
        }
        id v16 = [v15 objectForKeyedSubscript:v14];
        if ([v16 state] == (id)1)
        {
          id v17 = [v16 queue];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10000A768;
          v19[3] = &unk_1000C6C38;
          id v20 = v16;
          id v21 = v5;
          dispatch_async(v17, v19);
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v18 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v11 = v18;
    }
    while (v18);
  }
}

- (void)handleInitializeState
{
  v23.receiver = self;
  v23.super_class = (Class)NESMAlwaysOnSession;
  [(NESMSession *)&v23 handleInitializeState];
  sub_100005C1C((uint64_t)self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v3, 400, 1);
  }
  else {
    id Property = 0;
  }
  id obj = Property;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v9);
        if (self) {
          id v11 = objc_getProperty(self, v6, 400, 1);
        }
        else {
          id v11 = 0;
        }
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];
        id v13 = [v12 queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000A96C;
        block[3] = &unk_1000C6C60;
        id v18 = v12;
        id v14 = v12;
        dispatch_async(v13, block);

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v15 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      id v7 = v15;
    }
    while (v15);
  }
}

- (int)type
{
  return 3;
}

- (void)dealloc
{
  if (self)
  {
    if (objc_getProperty(self, a2, 360, 1))
    {
      [objc_getProperty(self, v3, 360, 1) removeObserver:self forKeyPath:@"path"];
      objc_setProperty_atomic(self, v4, 0, 360);
    }
    self->_unint64_t IDSNexusIfIndex = 0;
    id v5 = [(NESMSession *)self policySession];
    char v7 = sub_100031FA0(v5, v6);

    if ((v7 & 1) == 0)
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", buf, 2u);
      }
    }
    objc_setProperty_atomic(self, v8, 0, 376);
  }
  v10.receiver = self;
  v10.super_class = (Class)NESMAlwaysOnSession;
  [(NESMSession *)&v10 dealloc];
}

- (NESMAlwaysOnSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)NESMAlwaysOnSession;
  uint64_t v8 = [(NESMSession *)&v53 initWithConfiguration:v6 andServer:v7];
  id v9 = v8;
  if (!v8) {
    goto LABEL_41;
  }
  v8->_retryIntervalMin = 5;
  v8->_retryIntervalMax = 600;
  v8->_retryIntervalMultipler = 2;
  v8->_retriesMax = 3;
  VPNSessions = v8->_VPNSessions;
  v8->_VPNSessions = 0;

  v9->_stopped = 1;
  id v11 = [NESMPolicySession alloc];
  uint64_t v12 = [v6 identifier];
  id v13 = [v6 grade];
  if (v11) {
    id v11 = (NESMPolicySession *)sub_100031564((id *)&v11->super.isa, v12, 3, v13, (void *)1, (void *)1);
  }
  [(NESMSession *)v9 setPolicySession:v11];

  sub_10007FEB0(v9);
  id v14 = ne_log_large_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v55 = v9;
    __int16 v56 = 2080;
    uint64_t v57 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@:%s: Configuration %@", buf, 0x20u);
  }

  id v15 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  if (!v15)
  {
    id v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v55 = v9;
      __int16 v56 = 2080;
      uint64_t v57 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
      id v31 = "%@:%s: Failed to allocate VPN sessions";
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
    }
LABEL_46:

    uint64_t v45 = 0;
    goto LABEL_47;
  }
  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  if (!v16)
  {
    id v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v55 = v9;
      __int16 v56 = 2080;
      uint64_t v57 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
      id v31 = "%@:%s: Failed to allocate VPN session retry counters";
      goto LABEL_32;
    }
    goto LABEL_46;
  }
  id v17 = v16;
  objc_storeStrong((id *)&v9->_VPNSessionRetryCounters, v16);
  if (nwi_state_copy())
  {
    unsigned int interface_names = nwi_state_get_interface_names();
    if (interface_names && (long long v19 = malloc_type_calloc(interface_names, 8uLL, 0x50040EE9192B6uLL)) != 0)
    {
      long long v20 = v19;
      uint64_t v51 = v17;
      unsigned int v52 = v15;
      unsigned int v21 = nwi_state_get_interface_names();
      uint64_t v50 = v20;
      if (v21)
      {
        objc_super v23 = (uint64_t *)v20;
        long long v24 = 0;
        uint64_t v25 = v21;
        *(void *)&long long v22 = 138412802;
        long long v49 = v22;
        do
        {
          uint64_t v26 = *v23;
          if (*v23
            && nwi_state_get_ifstate()
            && !nwi_ifstate_get_vpn_server()
            && (nwi_ifstate_get_flags() & 3) != 0
            && (nwi_ifstate_get_flags() & 4) != 0)
          {
            xpc_object_t v28 = +[NSString stringWithUTF8String:v26];
            id v27 = sub_1000084A0((NESMIKEv2VPNSession *)v9, v28);

            if (v27)
            {
              if ([v52 count])
              {
                [v27 setIsSecondaryInterface:1];
                [v27 setIsSecondaryConnection:1];
              }
              v29 = v28;
              [v52 setObject:v27 forKeyedSubscript:v28];
              id v30 = ne_log_obj();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v49;
                uint64_t v55 = v9;
                __int16 v56 = 2080;
                uint64_t v57 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
                __int16 v58 = 2112;
                id v59 = v29;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@:%s: Set up VPN Session over %@", buf, 0x20u);
              }

              xpc_object_t v28 = v29;
            }
          }
          else
          {
            id v27 = v24;
          }
          ++v23;
          long long v24 = v27;
          --v25;
        }
        while (v25);
      }
      else
      {
        id v27 = 0;
      }
      free(v50);
      id v17 = v51;
      id v15 = v52;
    }
    else
    {
      id v27 = 0;
    }
    nwi_state_release();
  }
  else
  {
    id v27 = 0;
  }
  objc_storeStrong((id *)&v9->_VPNSessions, v15);
  sub_1000086FC(v9, v32);
  id v33 = [objc_alloc((Class)NEPolicySession) initWithSessionName:@"AOVPN control"];
  [(NESMSession *)v9 setControlPolicySession:v33];

  id v34 = [(NESMSession *)v9 controlPolicySession];

  if (!v34)
  {
    uint64_t v46 = ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
LABEL_45:

      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    uint64_t v47 = "Failed to create the control policy session";
LABEL_49:
    _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_45;
  }
  v35 = [(NESMSession *)v9 controlPolicySession];
  [v35 setPriority:100];

  unsigned int v36 = [(NESMSession *)v9 controlPolicySession];
  [v36 lockSessionToCurrentProcess];

  id v37 = [objc_alloc((Class)NEPolicySession) initWithSessionName:@"AOVPN high"];
  [(NESMSession *)v9 setHighPolicySession:v37];

  int v38 = [(NESMSession *)v9 highPolicySession];

  if (!v38)
  {
    uint64_t v46 = ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    uint64_t v47 = "Failed to create AOVPN high policy session";
    goto LABEL_49;
  }
  long long v39 = [(NESMSession *)v9 highPolicySession];
  [v39 setPriority:400];

  long long v40 = [(NESMSession *)v9 highPolicySession];
  [v40 lockSessionToCurrentProcess];

  v9->_carrierBundleIMSUseIPSec = 0;
  v9->_carrierBundleNATKeepAliveIntervalOverCell = 110;
  id v41 = objc_alloc((Class)CoreTelephonyClient);
  long long v42 = [(NESMSession *)v9 queue];
  uint64_t v43 = (CoreTelephonyClient *)[v41 initWithQueue:v42];
  CTClient = v9->_CTClient;
  v9->_CTClient = v43;

  [(CoreTelephonyClient *)v9->_CTClient setDelegate:v9];
LABEL_41:
  uint64_t v45 = v9;
LABEL_47:

  return v45;
}

+ (BOOL)hasRequiredFrameworks
{
  if (!objc_opt_class()) {
    return 0;
  }
  sub_100052AE8();
  v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = v2[8] & 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end