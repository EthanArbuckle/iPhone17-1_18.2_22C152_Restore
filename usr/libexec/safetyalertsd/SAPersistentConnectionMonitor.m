@interface SAPersistentConnectionMonitor
- (BOOL)getReachability;
- (SAPersistentConnectionMonitor)initWithQueue:(id)a3 forNetwork:(int)a4;
- (void)interfaceReachabilityChanged:(id)a3;
- (void)setReachabilityInstance:(void *)a3;
@end

@implementation SAPersistentConnectionMonitor

- (SAPersistentConnectionMonitor)initWithQueue:(id)a3 forNetwork:(int)a4
{
  id v6 = a3;
  if (!a4)
  {
    v7 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    [v7 addDelegate:self queue:v6];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
    [v7 addDelegate:self queue:v6];
LABEL_5:

    goto LABEL_8;
  }
  v8 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 68289026;
    v10[1] = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#saNwReachMonitor,init,invalid type\"}", (uint8_t *)v10, 0x12u);
  }
LABEL_8:
  self->nwType = a4;

  return self;
}

- (void)interfaceReachabilityChanged:(id)a3
{
  id v4 = a3;
  id v6 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v4 isInternetReachable];
    int nwType = self->nwType;
    *(_DWORD *)buf = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 1026;
    unsigned int v21 = v7;
    __int16 v22 = 1026;
    unsigned int v23 = nwType;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,interfaceReachabilityChanged\", \"reachable\":%{public}d, \"type\":%{public}d}", buf, 0x1Eu);
  }

  reachabilityInstance = self->reachabilityInstance;
  if (reachabilityInstance)
  {
    unsigned int v10 = [v4 isInternetReachable];
    unsigned __int8 v15 = v10;
    __int16 v11 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = *((_DWORD *)reachabilityInstance + 30);
      *(_DWORD *)buf = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 1026;
      unsigned int v21 = v12;
      __int16 v22 = 1026;
      unsigned int v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,onNetworkReachabilityChanged\", \"type\":%{public}d, \"isConnected\":%{public}hhd}", buf, 0x1Eu);
    }
    v13 = sub_10003E368();
    double v14 = 0.0;
    if (*((double *)v13 + 7) != 0.0) {
      double v14 = 1.0;
    }
    sub_100070830((unsigned __int8 *)reachabilityInstance + 48, &v15, v14);
  }
}

- (void)setReachabilityInstance:(void *)a3
{
  self->reachabilityInstance = a3;
}

- (BOOL)getReachability
{
  int nwType = self->nwType;
  if (nwType)
  {
    if (nwType != 1) {
      return 0;
    }
    v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
    unsigned __int8 v4 = [v3 isInternetReachable];
  }
  else
  {
    v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    unsigned __int8 v4 = [v3 isInternetReachable];
  }
  BOOL v5 = v4;

  return v5;
}

@end