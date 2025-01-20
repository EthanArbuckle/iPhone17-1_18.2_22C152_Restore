@interface NESMIKEv2VPNFallbackSession
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (id)copyExtendedStatus;
- (int)type;
- (void)dropServer;
- (void)handleChangeEventForFallback:(BOOL)a3;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)install;
- (void)installPended;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatus:(int)a3;
- (void)uninstall;
@end

@implementation NESMIKEv2VPNFallbackSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationOperationArray, 0);
  objc_storeStrong((id *)&self->_primaryCellularInterface, 0);

  objc_storeStrong((id *)&self->_childSessions, 0);
}

- (void)dropServer
{
  v3 = [(NESMSession *)self server];
  [v3 removeObserver:self forKeyPath:@"primaryCellularInterface"];

  v4.receiver = self;
  v4.super_class = (Class)NESMIKEv2VPNFallbackSession;
  [(NESMSession *)&v4 dropServer];
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  objc_super v4 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  v7 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v6, 24, 1);
  }
  v8 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000864FC;
  block[3] = &unk_1000C6B78;
  block[4] = v4;
  block[5] = a3;
  dispatch_async(v8, block);

  if (v4) {
    id v10 = objc_getProperty(v4, v9, 360, 1);
  }
  else {
    id v10 = 0;
  }
  v11 = [v10 objectAtIndexedSubscript:1];
  v13 = v11;
  if (v11) {
    v11 = objc_getProperty(v11, v12, 24, 1);
  }
  v14 = [v11 queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100086578;
  v15[3] = &unk_1000C6B78;
  v15[4] = v4;
  v15[5] = a3;
  dispatch_async(v14, v15);
}

- (void)uninstall
{
  if (!self || !objc_getProperty(self, a2, 408, 1))
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    v30 = (NESMIKEv2VPNFallbackSession *)"-[NESMIKEv2VPNFallbackSession uninstall]";
    v24 = "%s called with null self.configurationOperationArray";
    v25 = v11;
    uint32_t v26 = 12;
LABEL_26:
    _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, v24, buf, v26);
    goto LABEL_23;
  }
  if (!objc_msgSend(objc_getProperty(self, v3, 408, 1), "count"))
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v24 = "request uninstall configuration operation array is empty";
    v25 = v11;
    uint32_t v26 = 2;
    goto LABEL_26;
  }
  v5 = [objc_getProperty(self, v4, 408, 1) objectAtIndexedSubscript:0];
  v7 = v5;
  if (!v5 || v5[2].isa != (Class)2)
  {
    v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
    }
    goto LABEL_21;
  }
  id Property = objc_getProperty(v5, v6, 24, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v9, 24, 1);
  }
  id v10 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086950;
  block[3] = &unk_1000C6C60;
  v11 = v7;
  v28 = v11;
  dispatch_async(v10, block);

  v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_getProperty(v11, v13, 24, 1);
    *(_DWORD *)buf = 138412546;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ uninstalling session %@", buf, 0x16u);
  }

  v16 = objc_getProperty(v11, v15, 24, 1);
  if (v16) {
    v16[4] = 1;
  }
  [objc_getProperty(self, v17, 408, 1) removeObject:v11];

  self->_installState = 1;
  if (objc_msgSend(objc_getProperty(self, v18, 408, 1), "count"))
  {
    uint64_t v20 = [objc_getProperty(self, v19, 408, 1) objectAtIndexedSubscript:0];
    v22 = v20;
    if (v20)
    {
      uint64_t v23 = *(void *)(v20 + 16);
      if (v23 == 2)
      {
        sub_100086EFC(self, v21);
      }
      else if (v23 == 3)
      {
        sub_1000869BC(self, v21);
      }
    }
LABEL_21:

    v11 = v7;
  }
LABEL_23:
}

- (void)installPended
{
  if (!self || !objc_getProperty(self, a2, 408, 1))
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315138;
    v30 = (NESMIKEv2VPNFallbackSession *)"-[NESMIKEv2VPNFallbackSession installPended]";
    v24 = "%s called with null self.configurationOperationArray";
    v25 = v11;
    uint32_t v26 = 12;
LABEL_21:
    _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, v24, buf, v26);
    goto LABEL_25;
  }
  if (!objc_msgSend(objc_getProperty(self, v3, 408, 1), "count"))
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v24 = "request install configuration operation array is empty";
    v25 = v11;
    uint32_t v26 = 2;
    goto LABEL_21;
  }
  v5 = [objc_getProperty(self, v4, 408, 1) objectAtIndexedSubscript:0];
  v7 = v5;
  if (!v5 || v5[2].isa != (Class)3)
  {
    v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
    }
    goto LABEL_24;
  }
  id Property = objc_getProperty(v5, v6, 24, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v9, 24, 1);
  }
  id v10 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087844;
  block[3] = &unk_1000C6C60;
  v11 = v7;
  v28 = v11;
  dispatch_async(v10, block);

  v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_getProperty(v11, v13, 24, 1);
    *(_DWORD *)buf = 138412546;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@, pending session %@", buf, 0x16u);
  }

  v16 = objc_getProperty(v11, v15, 24, 1);
  if (v16) {
    v16[4] = 4;
  }
  [objc_getProperty(self, v17, 408, 1) removeObject:v11];

  self->_installState = 4;
  if (objc_msgSend(objc_getProperty(self, v18, 408, 1), "count"))
  {
    uint64_t v20 = [objc_getProperty(self, v19, 408, 1) objectAtIndexedSubscript:0];
    v22 = v20;
    if (v20)
    {
      uint64_t v23 = *(void *)(v20 + 16);
      if (v23 == 2)
      {
        sub_100086EFC(self, v21);
      }
      else if (v23 == 3)
      {
        sub_1000869BC(self, v21);
      }
    }
LABEL_24:

    v11 = v7;
  }
LABEL_25:
}

- (void)install
{
  if (self && objc_getProperty(self, a2, 408, 1))
  {
    if (objc_msgSend(objc_getProperty(self, v3, 408, 1), "count"))
    {
      v6 = [objc_getProperty(self, v4, 408, 1) objectAtIndexedSubscript:0];
      v8 = v6;
      if (v6 && v6[2] == 3)
      {
        id Property = objc_getProperty(v6, v7, 24, 1);
        if (Property) {
          id Property = objc_getProperty(Property, v10, 24, 1);
        }
        v11 = [Property queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100087E08;
        block[3] = &unk_1000C6C60;
        id v12 = v8;
        id v42 = v12;
        dispatch_async(v11, block);

        v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = objc_getProperty(v12, v14, 24, 1);
          *(_DWORD *)buf = 138412546;
          v45 = self;
          __int16 v46 = 2112;
          id v47 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@, installed session %@", buf, 0x16u);
        }

        v17 = objc_getProperty(v12, v16, 24, 1);
        if (v17) {
          v17[4] = 5;
        }
        [objc_getProperty(self, v18, 408, 1) removeObject:v12];

        self->_installState = 5;
        if (!objc_msgSend(objc_getProperty(self, v19, 408, 1), "count")) {
          goto LABEL_23;
        }
        uint64_t v21 = [[objc_getProperty(self, v20, 408, 1) objectAtIndexedSubscript:0];
        uint64_t v23 = v21;
        if (v21)
        {
          uint64_t v24 = *(void *)(v21 + 16);
          if (v24 == 2)
          {
            sub_100086EFC(self, v22);
          }
          else if (v24 == 3)
          {
            sub_1000869BC(self, v22);
          }
        }
      }
      else
      {
        uint64_t v23 = ne_log_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
        }
      }

LABEL_23:
      return;
    }
    uint64_t v26 = 0;
    char v27 = 1;
    *(void *)&long long v5 = 138412546;
    long long v40 = v5;
    do
    {
      char v28 = v27;
      v29 = [objc_getProperty(self, v4, 360, 1) objectAtIndexedSubscript:v26];
      if (v29)
      {
        uint64_t v30 = v29[4];

        if (v30 == 4)
        {
          __int16 v31 = [objc_getProperty(self, v4, 360, 1) objectAtIndexedSubscript:v26];
          v33 = v31;
          if (v31) {
            __int16 v31 = objc_getProperty(v31, v32, 24, 1);
          }
          v34 = [v31 queue:v40];
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_100087D90;
          v43[3] = &unk_1000C6B78;
          v43[4] = self;
          v43[5] = v26;
          dispatch_async(v34, v43);

          v35 = ne_log_obj();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v37 = [objc_getProperty(self, v36, 360, 1) objectAtIndexedSubscript:v26];
            *(_DWORD *)buf = v40;
            v45 = self;
            __int16 v46 = 2112;
            id v47 = v37;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ installing pending session %@", buf, 0x16u);
          }
          v39 = [objc_getProperty(self, v38, 360, 1) objectAtIndexedSubscript:v26];
          if (v39) {
            v39[4] = 5;
          }
        }
      }
      char v27 = 0;
      uint64_t v26 = 1;
    }
    while ((v28 & 1) != 0);
    self->_installState = 5;
  }
  else
  {
    v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = (NESMIKEv2VPNFallbackSession *)"-[NESMIKEv2VPNFallbackSession install]";
      _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "%s called with null self.configurationOperationArray", buf, 0xCu);
    }
  }
}

- (void)setStatus:(int)a3
{
  long long v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = self;
    __int16 v21 = 2080;
    v22 = "-[NESMIKEv2VPNFallbackSession setStatus:]";
    __int16 v23 = 2080;
    uint64_t v24 = ne_session_status_to_string();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@:%s: Enter (new status %s)", buf, 0x20u);
  }

  if (self) {
    id Property = objc_getProperty(self, v6, 360, 1);
  }
  else {
    id Property = 0;
  }
  v8 = [Property objectAtIndexedSubscript:0];
  if (v8) {
    int v9 = v8[2];
  }
  else {
    int v9 = 0;
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 360, 1);
  }
  else {
    id v11 = 0;
  }
  id v12 = [v11 objectAtIndexedSubscript:1];
  if (v12) {
    uint64_t v13 = v12[2];
  }
  else {
    uint64_t v13 = 0;
  }

  uint64_t v14 = sub_100088078((uint64_t)self, v9, v13);
  uint64_t v15 = sub_100088078((uint64_t)self, a3, v14);
  SEL v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = ne_session_status_to_string();
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = self;
    __int16 v21 = 2080;
    v22 = "-[NESMIKEv2VPNFallbackSession setStatus:]";
    __int16 v23 = 2080;
    uint64_t v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@:%s: Status to Client: %s", buf, 0x20u);
  }

  v18.receiver = self;
  v18.super_class = (Class)NESMIKEv2VPNFallbackSession;
  [(NESMSession *)&v18 setStatus:v15];
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  objc_super v4 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  id Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24, 1);
  }
  v8 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000883DC;
  block[3] = &unk_1000C6DD8;
  void block[4] = v4;
  int v18 = a3;
  dispatch_async(v8, block);

  if (v4) {
    id v10 = objc_getProperty(v4, v9, 360, 1);
  }
  else {
    id v10 = 0;
  }
  id v11 = [v10 objectAtIndexedSubscript:1];
  uint64_t v13 = v11;
  if (v11) {
    id v11 = objc_getProperty(v11, v12, 24, 1);
  }
  uint64_t v14 = [v11 queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100088458;
  v15[3] = &unk_1000C6DD8;
  v15[4] = v4;
  int v16 = a3;
  dispatch_async(v14, v15);
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  int v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v22 = self;
    __int16 v23 = 2080;
    uint64_t v24 = "-[NESMIKEv2VPNFallbackSession handleChangeEventForInterface:newFlags:previousFlags:]";
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 1024;
    int v28 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (ifName %@, flags %X)", buf, 0x26u);
  }

  if (self) {
    id Property = objc_getProperty(self, v10, 360, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = [Property objectAtIndexedSubscript:0];
  uint64_t v14 = v12;
  if (v12) {
    id v12 = objc_getProperty(v12, v13, 24, 1);
  }
  uint64_t v15 = [v12 queue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008868C;
  v17[3] = &unk_1000C6980;
  v17[4] = self;
  id v18 = v8;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v16 = v8;
  dispatch_async(v15, v17);
}

- (id)copyExtendedStatus
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  uint64_t v3 = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  long long v5 = (void *)v3;
  if (v3 && *(_DWORD *)(v3 + 8) == 3
    || (!v2 ? (id v7 = 0) : (id v7 = objc_getProperty(v2, v4, 360, 1)),
        [v7 objectAtIndexedSubscript:1],
        (id v8 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_13:
    if (v2) {
      id Property = objc_getProperty(v2, v6, 360, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  int v9 = v8[2];

  if (v9 != 3) {
    goto LABEL_13;
  }
  if (v2) {
    id Property = objc_getProperty(v2, v6, 360, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v11 = 1;
LABEL_16:
  id v12 = [Property objectAtIndexedSubscript:v11];
  uint64_t v14 = v12;
  if (v12) {
    id v12 = objc_getProperty(v12, v13, 24, 1);
  }
  id v15 = [v12 copyExtendedStatus];

  if (!v15)
  {
    id v16 = 0;
    goto LABEL_41;
  }
  id v16 = [v15 mutableCopy];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"VPN"];
  int v18 = isa_nsdictionary();

  if (v18)
  {
    unint64_t v19 = [v16 objectForKeyedSubscript:@"VPN"];
    id v20 = [v19 mutableCopy];
  }
  else
  {
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if ([(NESMSession *)v2 status] == 3)
  {
    __int16 v21 = +[NSNumber numberWithUnsignedLongLong:[(NESMSession *)v2 connectTime]];
    CFStringRef v22 = @"ConnectTime";
LABEL_27:
    [v20 setObject:v21 forKeyedSubscript:v22];

    goto LABEL_28;
  }
  if ([(NESMSession *)v2 status] != 2)
  {
    __int16 v21 = +[NSNumber numberWithInt:[(NESMSession *)v2 lastStopReason]];
    CFStringRef v22 = @"LastCause";
    goto LABEL_27;
  }
LABEL_28:
  [v16 setObject:v20 forKeyedSubscript:@"VPN"];
  __int16 v23 = [v16 objectForKeyedSubscript:@"ConnectionStatistics"];
  int v24 = isa_nsdictionary();

  if (v24)
  {
    __int16 v25 = [v16 objectForKeyedSubscript:@"ConnectionStatistics"];
    id v26 = [v25 mutableCopy];
  }
  else
  {
    id v26 = objc_alloc_init((Class)NSMutableDictionary);
  }
  __int16 v27 = +[NSNumber numberWithInteger:[(NESMSession *)v2 connectCount]];
  [v26 setObject:v27 forKeyedSubscript:@"ConnectCount"];

  int v28 = +[NSNumber numberWithInteger:[(NESMSession *)v2 connectedCount]];
  [v26 setObject:v28 forKeyedSubscript:@"ConnectedCount"];

  v29 = +[NSNumber numberWithInteger:[(NESMSession *)v2 disconnectedCount]];
  [v26 setObject:v29 forKeyedSubscript:@"DisconnectedCount"];

  uint64_t v30 = +[NSNumber numberWithUnsignedLongLong:[(NESMSession *)v2 maxConnectTime]];
  [v26 setObject:v30 forKeyedSubscript:@"MaxConnectTime"];

  [v16 setObject:v26 forKeyedSubscript:@"ConnectionStatistics"];
  __int16 v31 = +[NSNumber numberWithInt:[(NESMSession *)v2 status]];
  [v16 setObject:v31 forKeyedSubscript:@"NEStatus"];

  id v32 = +[NSNumber numberWithInt:[(NESMSession *)v2 SCNCStatus]];
  [v16 setObject:v32 forKeyedSubscript:@"Status"];

  v33 = [(NESMSession *)v2 lastDisconnectError];
  if (v33)
  {
    id v40 = 0;
    v34 = +[NSKeyedArchiver archivedDataWithRootObject:v33 requiringSecureCoding:1 error:&v40];
    id v35 = v40;
    if (v34)
    {
      [v16 setObject:v34 forKeyedSubscript:@"LastDisconnectError"];
    }
    else
    {
      v36 = ne_log_obj();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to serialize the last disconnect error: %@", buf, 0xCu);
      }
    }
  }
  v37 = [(NESMSession *)v2 lastStatusChangeTime];

  if (v37)
  {
    SEL v38 = [(NESMSession *)v2 lastStatusChangeTime];
    [v16 setObject:v38 forKeyedSubscript:@"LastStatusChangeTime"];
  }
LABEL_41:

  return v16;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 != 2)
  {
    id v8 = xdict;
    if (a4 != 1) {
      goto LABEL_23;
    }
    xpc_object_t v53 = reply;
    if (!self)
    {
      id v28 = 0;
LABEL_21:
      xpc_object_t reply = v53;
      id v8 = xdict;
      if (!v28) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    int v9 = &selRef_setLastPrimaryInterface_;
    id Property = [objc_getProperty(self, v6, 360, 1) objectAtIndexedSubscript:0];
    id v12 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v11, 24, 1);
    }
    id v13 = [Property copyStatistics];

    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"VPN"];
      id v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 objectForKeyedSubscript:@"BytesIn"];
        int v18 = (char *)[v17 unsignedLongLongValue];

        unint64_t v19 = [v16 objectForKeyedSubscript:@"BytesOut"];
        id v20 = (char *)[v19 unsignedLongLongValue];

        __int16 v21 = [v16 objectForKeyedSubscript:@"PacketsIn"];
        id v50 = [v21 unsignedLongLongValue];

        CFStringRef v22 = [v16 objectForKeyedSubscript:@"PacketsOut"];
        __int16 v23 = (char *)[v22 unsignedLongLongValue];

        int v24 = [v16 objectForKeyedSubscript:@"ErrorsIn"];
        __int16 v25 = (char *)[v24 unsignedLongLongValue];

        id v26 = [v16 objectForKeyedSubscript:@"ErrorsOut"];
        __int16 v27 = (char *)[v26 unsignedLongLongValue];

        int v9 = &selRef_setLastPrimaryInterface_;
        goto LABEL_13;
      }
    }
    else
    {
      id v16 = 0;
    }
    int v18 = 0;
    id v20 = 0;
    id v50 = 0;
    __int16 v23 = 0;
    __int16 v25 = 0;
    __int16 v27 = 0;
LABEL_13:
    v29 = [objc_getProperty(self, v14, *((int *)v9 + 698), 1) objectAtIndexedSubscript:1];
    __int16 v31 = v29;
    if (v29) {
      v29 = objc_getProperty(v29, v30, 24, 1);
    }
    id v32 = [v29 copyStatistics:v50];

    v52 = v32;
    if (v32)
    {
      v33 = [v32 objectForKeyedSubscript:@"VPN"];

      if (v33)
      {
        v34 = [v33 objectForKeyedSubscript:@"BytesIn"];
        int v18 = &v18[(void)[v34 unsignedLongLongValue]];

        id v35 = [v33 objectForKeyedSubscript:@"BytesOut"];
        id v20 = &v20[(void)[v35 unsignedLongLongValue]];

        v36 = [v33 objectForKeyedSubscript:@"PacketsIn"];
        v37 = &v51[(void)[v36 unsignedLongLongValue]];

        SEL v38 = [v33 objectForKeyedSubscript:@"PacketsOut"];
        __int16 v23 = &v23[(void)[v38 unsignedLongLongValue]];

        v39 = [v33 objectForKeyedSubscript:@"ErrorsIn"];
        __int16 v25 = &v25[(void)[v39 unsignedLongLongValue]];

        id v40 = [v33 objectForKeyedSubscript:@"ErrorsOut"];
        __int16 v27 = &v27[(void)[v40 unsignedLongLongValue]];

        id v16 = v33;
LABEL_20:
        uint64_t v57 = kSCEntNetVPN;
        v55[0] = @"BytesIn";
        v41 = +[NSNumber numberWithUnsignedLongLong:v18];
        v56[0] = v41;
        v55[1] = @"BytesOut";
        id v42 = +[NSNumber numberWithUnsignedLongLong:v20];
        v56[1] = v42;
        v55[2] = @"PacketsIn";
        v43 = +[NSNumber numberWithUnsignedLongLong:v37];
        v56[2] = v43;
        v55[3] = @"PacketsOut";
        v44 = +[NSNumber numberWithUnsignedLongLong:v23];
        v56[3] = v44;
        v55[4] = @"ErrorsIn";
        v45 = +[NSNumber numberWithUnsignedLongLong:v25];
        v56[4] = v45;
        v55[5] = @"ErrorsOut";
        __int16 v46 = +[NSNumber numberWithUnsignedLongLong:v27];
        v56[5] = v46;
        id v47 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:6];
        v58 = v47;
        id v28 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];

        goto LABEL_21;
      }
      id v16 = 0;
    }
    v37 = v51;
    goto LABEL_20;
  }
  id v28 = [(NESMIKEv2VPNFallbackSession *)self copyExtendedStatus];
  id v8 = xdict;
  if (v28)
  {
LABEL_22:
    v48 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, "SessionInfo", v48);

    id v8 = xdict;
  }
LABEL_23:
  xpc_dictionary_get_remote_connection(v8);
  v49 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v49, reply);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v38.receiver = self;
    v38.super_class = (Class)NESMIKEv2VPNFallbackSession;
    if (![(NESMSession *)&v38 handleUpdateConfiguration:v5])
    {
      BOOL v30 = 0;
      goto LABEL_23;
    }
    if (self) {
      id Property = objc_getProperty(self, v6, 360, 1);
    }
    else {
      id Property = 0;
    }
    id v8 = [Property objectAtIndexedSubscript:0];
    id v10 = v8;
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 24, 1);
    }
    uint64_t v11 = [v8 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100089740;
    block[3] = &unk_1000C6C38;
    id v12 = v5;
    id v36 = v12;
    v37 = self;
    dispatch_async(v11, block);

    if (self) {
      id v14 = objc_getProperty(self, v13, 360, 1);
    }
    else {
      id v14 = 0;
    }
    id v15 = [v14 objectAtIndexedSubscript:1];
    uint64_t v17 = v15;
    if (v15) {
      id v15 = objc_getProperty(v15, v16, 24, 1);
    }
    int v18 = [v15 queue];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10008982C;
    v32[3] = &unk_1000C6C38;
    id v33 = v12;
    v34 = self;
    dispatch_async(v18, v32);
  }
  else
  {
    if (self) {
      id v19 = objc_getProperty(self, v4, 360, 1);
    }
    else {
      id v19 = 0;
    }
    id v20 = [v19 objectAtIndexedSubscript:0];
    CFStringRef v22 = v20;
    if (v20) {
      id v20 = objc_getProperty(v20, v21, 24, 1);
    }
    __int16 v23 = [v20 queue];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000894B8;
    v40[3] = &unk_1000C6C60;
    v40[4] = self;
    dispatch_async(v23, v40);

    if (self) {
      id v25 = objc_getProperty(self, v24, 360, 1);
    }
    else {
      id v25 = 0;
    }
    id v26 = [v25 objectAtIndexedSubscript:1];
    id v28 = v26;
    if (v26) {
      id v26 = objc_getProperty(v26, v27, 24, 1);
    }
    v29 = [v26 queue];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000895FC;
    v39[3] = &unk_1000C6C60;
    v39[4] = self;
    dispatch_async(v29, v39);
  }
  BOOL v30 = 1;
LABEL_23:

  return v30;
}

- (void)handleUserSwitch
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  id Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24, 1);
  }
  v6 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089A8C;
  block[3] = &unk_1000C6C60;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2) {
    id v8 = objc_getProperty(v2, v7, 360, 1);
  }
  else {
    id v8 = 0;
  }
  int v9 = [v8 objectAtIndexedSubscript:1];
  uint64_t v11 = v9;
  if (v9) {
    int v9 = objc_getProperty(v9, v10, 24, 1);
  }
  id v12 = [v9 queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100089AF8;
  v13[3] = &unk_1000C6C60;
  v13[4] = v2;
  dispatch_async(v12, v13);
}

- (void)handleUserLogout
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  id Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24, 1);
  }
  v6 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089CD8;
  block[3] = &unk_1000C6C60;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2) {
    id v8 = objc_getProperty(v2, v7, 360, 1);
  }
  else {
    id v8 = 0;
  }
  int v9 = [v8 objectAtIndexedSubscript:1];
  uint64_t v11 = v9;
  if (v9) {
    int v9 = objc_getProperty(v9, v10, 24, 1);
  }
  id v12 = [v9 queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100089D44;
  v13[3] = &unk_1000C6C60;
  v13[4] = v2;
  dispatch_async(v12, v13);
}

- (void)handleSleepTime:(double)a3
{
  objc_super v4 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  id Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  id v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24, 1);
  }
  id v8 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089F30;
  block[3] = &unk_1000C6B78;
  void block[4] = v4;
  *(double *)&void block[5] = a3;
  dispatch_async(v8, block);

  if (v4) {
    id v10 = objc_getProperty(v4, v9, 360, 1);
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = [v10 objectAtIndexedSubscript:1];
  id v13 = v11;
  if (v11) {
    uint64_t v11 = objc_getProperty(v11, v12, 24, 1);
  }
  id v14 = [v11 queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100089FAC;
  v15[3] = &unk_1000C6B78;
  v15[4] = v4;
  *(double *)&void v15[5] = a3;
  dispatch_async(v14, v15);
}

- (BOOL)handleSleep
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  id Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24, 1);
  }
  v6 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A1C8;
  block[3] = &unk_1000C6C60;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2)
  {
    ++v2->_sleepAckCount;
    id v8 = objc_getProperty(v2, v7, 360, 1);
  }
  else
  {
    id v8 = 0;
  }
  int v9 = [v8 objectAtIndexedSubscript:1];
  uint64_t v11 = v9;
  if (v9) {
    int v9 = objc_getProperty(v9, v10, 24, 1);
  }
  id v12 = [v9 queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008A234;
  v14[3] = &unk_1000C6C60;
  v14[4] = v2;
  dispatch_async(v12, v14);

  if (v2) {
    ++v2->_sleepAckCount;
  }
  return 1;
}

- (void)handleWakeup
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  }
  id Property = [(NESMIKEv2VPNFallbackSession *)self objectAtIndexedSubscript:0];
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24, 1);
  }
  v6 = [Property queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A414;
  block[3] = &unk_1000C6C60;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2) {
    id v8 = objc_getProperty(v2, v7, 360, 1);
  }
  else {
    id v8 = 0;
  }
  int v9 = [v8 objectAtIndexedSubscript:1];
  uint64_t v11 = v9;
  if (v9) {
    int v9 = objc_getProperty(v9, v10, 24, 1);
  }
  id v12 = [v9 queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008A480;
  v13[3] = &unk_1000C6C60;
  v13[4] = v2;
  dispatch_async(v12, v13);
}

- (void)handleStopMessageWithReason:(int)a3
{
  v21.receiver = self;
  v21.super_class = (Class)NESMIKEv2VPNFallbackSession;
  -[NESMSession handleStopMessageWithReason:](&v21, "handleStopMessageWithReason:");
  if (self) {
    id Property = objc_getProperty(self, v5, 360, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectAtIndexedSubscript:0];
  int v9 = v7;
  if (v7) {
    id v7 = objc_getProperty(v7, v8, 24, 1);
  }
  id v10 = [v7 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A690;
  block[3] = &unk_1000C6DD8;
  void block[4] = self;
  int v20 = a3;
  dispatch_async(v10, block);

  if (self) {
    id v12 = objc_getProperty(self, v11, 360, 1);
  }
  else {
    id v12 = 0;
  }
  id v13 = [v12 objectAtIndexedSubscript:1];
  id v15 = v13;
  if (v13) {
    id v13 = objc_getProperty(v13, v14, 24, 1);
  }
  id v16 = [v13 queue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008A70C;
  v17[3] = &unk_1000C6DD8;
  v17[4] = self;
  int v18 = a3;
  dispatch_async(v16, v17);
}

- (void)handleStartMessage:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 360, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectAtIndexedSubscript:0];
  int v9 = v7;
  if (v7) {
    id v7 = objc_getProperty(v7, v8, 24, 1);
  }
  id v10 = [v7 state];

  if (v10 == (id)1)
  {
    if (self) {
      id v12 = objc_getProperty(self, v11, 360, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = [v12 objectAtIndexedSubscript:0];
    id v15 = v13;
    if (v13) {
      id v13 = objc_getProperty(v13, v14, 24, 1);
    }
    id v16 = [v13 queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008A8DC;
    v17[3] = &unk_1000C6C38;
    v17[4] = self;
    id v18 = v5;
    dispatch_async(v16, v17);
  }
}

- (void)handleInitializeState
{
  v17.receiver = self;
  v17.super_class = (Class)NESMIKEv2VPNFallbackSession;
  [(NESMSession *)&v17 handleInitializeState];
  if (self) {
    id Property = objc_getProperty(self, v3, 360, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = [Property objectAtIndexedSubscript:0];
  id v7 = v5;
  if (v5) {
    id v5 = objc_getProperty(v5, v6, 24, 1);
  }
  id v8 = [v5 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008AAF0;
  block[3] = &unk_1000C6C60;
  void block[4] = self;
  dispatch_async(v8, block);

  if (self) {
    id v10 = objc_getProperty(self, v9, 360, 1);
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = [v10 objectAtIndexedSubscript:1];
  id v13 = v11;
  if (v11) {
    uint64_t v11 = objc_getProperty(v11, v12, 24, 1);
  }
  id v14 = [v11 queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008AB5C;
  v15[3] = &unk_1000C6C60;
  v15[4] = self;
  dispatch_async(v14, v15);
}

- (int)type
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008ACA8;
  block[3] = &unk_1000C6958;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);
}

- (void)handleChangeEventForFallback:(BOOL)a3
{
  id v5 = [(NESMSession *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008B6C8;
  v6[3] = &unk_1000C6D38;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

@end