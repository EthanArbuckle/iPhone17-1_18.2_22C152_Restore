@interface GCDGameControllerDaemonDelegate
- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4;
- (BOOL)acceptNewConnectionFromMediaRemote:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldKeepRunning;
- (GCDGameControllerDaemonDelegate)init;
- (void)addController:(id)a3 forward:(BOOL)a4;
- (void)appDidEnterBackground;
- (void)appDidEnterBackgroundWithPID:(int)a3;
- (void)appWillEnterForeground;
- (void)appWillEnterForegroundWithPID:(int)a3;
- (void)controllerDidConnect:(id)a3;
- (void)controllerDidDisconnect:(id)a3;
- (void)controllerWithUDID:(unint64_t)a3 setArrayValue:(id)a4 forElement:(int)a5 forward:(BOOL)a6;
- (void)controllerWithUDID:(unint64_t)a3 setValue:(float)a4 forElement:(int)a5 forward:(BOOL)a6;
- (void)dealloc;
- (void)microControllerWithDigitizerX:(float)a3 withY:(float)a4 withTimeStamp:(unint64_t)a5 touchDown:(BOOL)a6;
- (void)microControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 digitizerY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7;
- (void)ping;
- (void)processMicroControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 withY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7;
- (void)removeController:(id)a3 forward:(BOOL)a4;
@end

@implementation GCDGameControllerDaemonDelegate

- (GCDGameControllerDaemonDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)GCDGameControllerDaemonDelegate;
  v2 = [(GCDGameControllerDaemonDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    appConnections = v2->_appConnections;
    v2->_appConnections = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    foregroundAppConnections = v2->_foregroundAppConnections;
    v2->_foregroundAppConnections = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if (sub_100006238())
  {
    uint64_t v3 = sub_100006504();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)GCDGameControllerDaemonDelegate;
  [(GCDGameControllerDaemonDelegate *)&v4 dealloc];
}

- (void)ping
{
  if (sub_100006238())
  {
    v2 = sub_100006504();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ping", v3, 2u);
    }
  }
}

- (BOOL)shouldKeepRunning
{
  return 1;
}

- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100006238())
  {
    v14 = sub_100006504();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "acceptNewConnectionFromGCEnabledApp: %@", (uint8_t *)location, 0xCu);
    }
  }
  objc_super v8 = self->_foregroundAppConnections;
  objc_sync_enter(v8);
  [(NSMutableArray *)self->_foregroundAppConnections addObject:v6];
  objc_sync_exit(v8);

  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GameControllerDaemon];
  [v6 setExportedInterface:v9];

  [v6 setExportedObject:self];
  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GameControllerClientProtocol];
  [v6 setRemoteObjectInterface:v10];

  v11 = self->_appConnections;
  objc_sync_enter(v11);
  [(NSMutableArray *)self->_appConnections addObject:v6];
  objc_sync_exit(v11);

  objc_initWeak(location, v6);
  objc_initWeak(&from, self->_appConnections);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100003198;
  v18 = &unk_10000C340;
  objc_copyWeak(&v20, location);
  objc_copyWeak(&v21, &from);
  v19 = self;
  v12 = objc_retainBlock(&v15);
  [v6 setInvalidationHandler:v12, v15, v16, v17, v18];
  [v6 setInterruptionHandler:v12];
  [v6 resume];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return 1;
}

- (BOOL)acceptNewConnectionFromMediaRemote:(id)a3
{
  objc_super v4 = (NSXPCConnection *)a3;
  if (sub_100006238())
  {
    v12 = sub_100006504();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "acceptNewConnectionFromMediaRemote: %@", (uint8_t *)location, 0xCu);
    }
  }
  uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GameControllerDaemon];
  [(NSXPCConnection *)v4 setExportedInterface:v5];

  [(NSXPCConnection *)v4 setExportedObject:self];
  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GameControllerClientProtocol];
  [(NSXPCConnection *)v4 setRemoteObjectInterface:v6];

  objc_initWeak(location, v4);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000034A4;
  v13[3] = &unk_10000C368;
  objc_copyWeak(&v14, location);
  id v7 = objc_retainBlock(v13);
  [(NSXPCConnection *)v4 setInvalidationHandler:v7];
  [(NSXPCConnection *)v4 setInterruptionHandler:v7];
  [(NSXPCConnection *)v4 resume];
  objc_super v8 = self->_mediaremoted;
  objc_sync_enter(v8);
  mediaremoted = self->_mediaremoted;
  self->_mediaremoted = v4;
  v10 = v4;

  objc_sync_exit(v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(location);
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 processIdentifier];
  objc_super v8 = GCBundleWithPID();
  if (sub_100006238())
  {
    id v14 = sub_100006504();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [v8 resourcePath];
      int v16 = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "New connection '%@' for listener '%@' from %@", (uint8_t *)&v16, 0x20u);
    }
  }
  v9 = [v8 resourcePath];
  unsigned int v10 = [v9 containsString:@"/System/Library/PrivateFrameworks/MediaRemote.framework/Support"];

  if (v10) {
    unsigned __int8 v11 = [(GCDGameControllerDaemonDelegate *)self acceptNewConnectionFromMediaRemote:v7];
  }
  else {
    unsigned __int8 v11 = [(GCDGameControllerDaemonDelegate *)self acceptNewConnection:v7 fromGCEnabledApp:0];
  }
  BOOL v12 = v11;

  return v12;
}

- (void)controllerWithUDID:(unint64_t)a3 setValue:(float)a4 forElement:(int)a5 forward:(BOOL)a6
{
  uint64_t v6 = *(void *)&a5;
  if (sub_100006238())
  {
    id v17 = sub_100006504();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v24 = a3;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 1024;
      int v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "udid:%ld, value:%f, element:%d", buf, 0x1Cu);
    }
  }
  unsigned int v10 = self->_foregroundAppConnections;
  objc_sync_enter(v10);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned __int8 v11 = self->_foregroundAppConnections;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v14) remoteObjectProxyWithErrorHandler:&stru_10000C3A8];
        *(float *)&double v16 = a4;
        [v15 controllerWithUDID:a3 setValue:v6 forElement:v16];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

- (void)controllerWithUDID:(unint64_t)a3 setArrayValue:(id)a4 forElement:(int)a5 forward:(BOOL)a6
{
  uint64_t v6 = *(void *)&a5;
  float v7 = a4.var0[3];
  float v8 = a4.var0[2];
  float v9 = a4.var0[1];
  float v10 = a4.var0[0];
  uint64_t v13 = self->_foregroundAppConnections;
  objc_sync_enter(v13);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = self->_foregroundAppConnections;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = [[*(id *)(*((void *)&v23 + 1) + 8 * (void)v17) remoteObjectProxyWithErrorHandler:&stru_10000C3C8]
        *(float *)&double v19 = v10;
        *(float *)&double v20 = v9;
        *(float *)&double v21 = v8;
        *(float *)&double v22 = v7;
        [v18 controllerWithUDID:a3 setValue0:v6 setValue1:v19 setValue2:v20 setValue3:v21 forElement:v22];

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)microControllerWithDigitizerX:(float)a3 withY:(float)a4 withTimeStamp:(unint64_t)a5 touchDown:(BOOL)a6
{
  if (sub_100006238())
  {
    uint64_t v6 = sub_100006504();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "microControllerWithDigitizerX called unexpectedly. NO-OP", v7, 2u);
    }
  }
}

- (void)microControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 digitizerY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7
{
  BOOL v7 = a7;
  if (sub_100006238())
  {
    double v19 = sub_100006504();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134218752;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      double v23 = a4;
      __int16 v24 = 2048;
      double v25 = a5;
      __int16 v26 = 1024;
      BOOL v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "UDID:%ld, digitizerXY:%.1f,%.1f, touchDown:%d", (uint8_t *)&v20, 0x26u);
    }

    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    double v13 = 0.0;
    double v14 = 0.0;
    id v15 = self;
    unint64_t v16 = a3;
    unint64_t v17 = a6;
    uint64_t v18 = 0;
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  id v15 = self;
  unint64_t v16 = a3;
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  unint64_t v17 = a6;
  uint64_t v18 = 1;
LABEL_8:
  [(GCDGameControllerDaemonDelegate *)v15 processMicroControllerWithUDID:v16 setDigitizerX:v17 withY:v18 withTimeStamp:v13 touchDown:v14];
}

- (void)processMicroControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 withY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7
{
  BOOL v7 = a7;
  double v13 = self->_foregroundAppConnections;
  objc_sync_enter(v13);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v14 = self->_foregroundAppConnections;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      unint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) remoteObjectProxy:v21];
        *(float *)&double v19 = a4;
        *(float *)&double v20 = a5;
        [v18 microControllerWithUDID:a3 setDigitizerX:a6 digitizerY:v7 withTimeStamp:v19 touchDown:v20];

        unint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)controllerDidConnect:(id)a3
{
  id v4 = [a3 object];
  [(GCDGameControllerDaemonDelegate *)self addController:v4 forward:1];
}

- (void)addController:(id)a3 forward:(BOOL)a4
{
  id v6 = a3;
  if (sub_100006238())
  {
    v49 = sub_100006504();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v6;
      __int16 v160 = 2048;
      id v161 = [v6 deviceHash];
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "addController:%@ for hash:%lu", location, 0x16u);
    }
  }
  if (!a4)
  {
    BOOL v7 = self->_appConnections;
    objc_sync_enter(v7);
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    float v8 = self->_appConnections;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v154 objects:v158 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v155;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v155 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [*(id *)(*((void *)&v154 + 1) + 8 * i) remoteObjectProxy];
          [v12 addControllerForAppStoreRemote:v6];
        }
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v154 objects:v158 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
  v72 = [v6 gamepad];
  v70 = [v72 dpad];
  objc_initWeak((id *)location, self);
  id v71 = v6;
  id v13 = [v71 deviceHash];
  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_100004E88;
  v151[3] = &unk_10000C3F0;
  v69 = v152;
  objc_copyWeak(v152, (id *)location);
  v152[1] = v13;
  BOOL v153 = a4;
  double v14 = [v70 down];
  [v14 setValueChangedHandler:v151];

  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472;
  v148[2] = sub_100004EF0;
  v148[3] = &unk_10000C3F0;
  v68 = v149;
  objc_copyWeak(v149, (id *)location);
  v149[1] = v13;
  BOOL v150 = a4;
  id v15 = [v70 right];
  [v15 setValueChangedHandler:v148];

  v145[0] = _NSConcreteStackBlock;
  v145[1] = 3221225472;
  v145[2] = sub_100004F58;
  v145[3] = &unk_10000C3F0;
  v67 = v146;
  objc_copyWeak(v146, (id *)location);
  v146[1] = v13;
  BOOL v147 = a4;
  uint64_t v16 = [v70 left];
  [v16 setValueChangedHandler:v145];

  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_100004FC0;
  v142[3] = &unk_10000C3F0;
  v66 = v143;
  objc_copyWeak(v143, (id *)location);
  v143[1] = v13;
  BOOL v144 = a4;
  unint64_t v17 = [v70 up];
  [v17 setValueChangedHandler:v142];

  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472;
  v139[2] = sub_100005028;
  v139[3] = &unk_10000C3F0;
  v65 = v140;
  objc_copyWeak(v140, (id *)location);
  v140[1] = v13;
  BOOL v141 = a4;
  uint64_t v18 = [v72 buttonA];
  [v18 setValueChangedHandler:v139];

  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472;
  v136[2] = sub_100005090;
  v136[3] = &unk_10000C3F0;
  v64 = v137;
  objc_copyWeak(v137, (id *)location);
  v137[1] = v13;
  BOOL v138 = a4;
  double v19 = [v72 buttonB];
  [v19 setValueChangedHandler:v136];

  v133[0] = _NSConcreteStackBlock;
  v133[1] = 3221225472;
  v133[2] = sub_1000050F8;
  v133[3] = &unk_10000C3F0;
  v63 = v134;
  objc_copyWeak(v134, (id *)location);
  v134[1] = v13;
  BOOL v135 = a4;
  double v20 = [v72 buttonX];
  [v20 setValueChangedHandler:v133];

  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_100005160;
  v130[3] = &unk_10000C3F0;
  v62 = v131;
  objc_copyWeak(v131, (id *)location);
  v131[1] = v13;
  BOOL v132 = a4;
  long long v21 = [v72 buttonY];
  [v21 setValueChangedHandler:v130];

  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_1000051C8;
  v127[3] = &unk_10000C3F0;
  v61 = v128;
  objc_copyWeak(v128, (id *)location);
  v128[1] = v13;
  BOOL v129 = a4;
  long long v22 = [v72 leftShoulder];
  [v22 setValueChangedHandler:v127];

  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_100005230;
  v124[3] = &unk_10000C3F0;
  v60 = v125;
  objc_copyWeak(v125, (id *)location);
  v125[1] = v13;
  BOOL v126 = a4;
  long long v23 = [v72 rightShoulder];
  [v23 setValueChangedHandler:v124];

  long long v24 = [v71 extendedGamepad];
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_100005298;
  v121[3] = &unk_10000C3F0;
  v59 = v122;
  objc_copyWeak(v122, (id *)location);
  v122[1] = v13;
  BOOL v123 = a4;
  double v25 = [v24 leftThumbstick];
  __int16 v26 = [v25 down];
  [v26 setValueChangedHandler:v121];

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_100005300;
  v118[3] = &unk_10000C3F0;
  v58 = v119;
  objc_copyWeak(v119, (id *)location);
  v119[1] = v13;
  BOOL v120 = a4;
  BOOL v27 = [v24 leftThumbstick];
  int v28 = [v27 right];
  [v28 setValueChangedHandler:v118];

  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_100005368;
  v115[3] = &unk_10000C3F0;
  v57 = v116;
  objc_copyWeak(v116, (id *)location);
  v116[1] = v13;
  BOOL v117 = a4;
  v29 = [v24 leftThumbstick];
  v30 = [v29 left];
  [v30 setValueChangedHandler:v115];

  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_1000053D0;
  v112[3] = &unk_10000C3F0;
  v56 = v113;
  objc_copyWeak(v113, (id *)location);
  v113[1] = v13;
  BOOL v114 = a4;
  v31 = [v24 leftThumbstick];
  v32 = [v31 up];
  [v32 setValueChangedHandler:v112];

  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_100005438;
  v109[3] = &unk_10000C3F0;
  v55 = v110;
  objc_copyWeak(v110, (id *)location);
  v110[1] = v13;
  BOOL v111 = a4;
  v33 = [v24 rightThumbstick];
  v34 = [v33 down];
  [v34 setValueChangedHandler:v109];

  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_1000054A0;
  v106[3] = &unk_10000C3F0;
  v54 = v107;
  objc_copyWeak(v107, (id *)location);
  v107[1] = v13;
  BOOL v108 = a4;
  v35 = [v24 rightThumbstick];
  v36 = [v35 right];
  [v36 setValueChangedHandler:v106];

  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_100005508;
  v103[3] = &unk_10000C3F0;
  v53 = v104;
  objc_copyWeak(v104, (id *)location);
  v104[1] = v13;
  BOOL v105 = a4;
  v37 = [v24 rightThumbstick];
  v38 = [v37 left];
  [v38 setValueChangedHandler:v103];

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100005570;
  v100[3] = &unk_10000C3F0;
  v52 = v101;
  objc_copyWeak(v101, (id *)location);
  v101[1] = v13;
  BOOL v102 = a4;
  v39 = [v24 rightThumbstick];
  v40 = [v39 up];
  [v40 setValueChangedHandler:v100];

  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_1000055D8;
  v97[3] = &unk_10000C3F0;
  v51 = v98;
  objc_copyWeak(v98, (id *)location);
  v98[1] = v13;
  BOOL v99 = a4;
  v41 = [v24 leftTrigger];
  [v41 setValueChangedHandler:v97];

  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_100005640;
  v94[3] = &unk_10000C3F0;
  v50 = v95;
  objc_copyWeak(v95, (id *)location);
  v95[1] = v13;
  BOOL v96 = a4;
  v42 = [v24 rightTrigger];
  [v42 setValueChangedHandler:v94];

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1000056A8;
  v91[3] = &unk_10000C3F0;
  objc_copyWeak(v92, (id *)location);
  v92[1] = v13;
  BOOL v93 = a4;
  v43 = [v24 buttonMenu];
  [v43 setValueChangedHandler:v91];

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100005710;
  v88[3] = &unk_10000C3F0;
  objc_copyWeak(v89, (id *)location);
  v89[1] = v13;
  BOOL v90 = a4;
  v44 = [v24 buttonOptions];
  [v44 setValueChangedHandler:v88];

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100005778;
  v85[3] = &unk_10000C3F0;
  objc_copyWeak(v86, (id *)location);
  v86[1] = v13;
  BOOL v87 = a4;
  v45 = [v24 buttonHome];
  [v45 setValueChangedHandler:v85];

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_1000057E0;
  v82[3] = &unk_10000C3F0;
  objc_copyWeak(v83, (id *)location);
  v83[1] = v13;
  BOOL v84 = a4;
  v46 = [v24 leftThumbstickButton];
  [v46 setValueChangedHandler:v82];

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100005848;
  v79[3] = &unk_10000C3F0;
  objc_copyWeak(v80, (id *)location);
  v80[1] = v13;
  BOOL v81 = a4;
  v47 = [v24 rightThumbstickButton];
  [v47 setValueChangedHandler:v79];

  if (([v71 isATVRemote] & 1) == 0)
  {
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000058B0;
    v76[3] = &unk_10000C418;
    objc_copyWeak(v77, (id *)location);
    v77[1] = v13;
    BOOL v78 = a4;
    objc_msgSend(v71, "motion", v95, v98, v101, v104, v107, v110, v113, v116, v119, v122, v125, v128, v131, v134, v137, v140, v143,
      v146,
      v149,
    v48 = v152);
    [v48 setValueChangedHandler:v76];

    objc_destroyWeak(v77);
  }
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100005A88;
  v73[3] = &unk_10000C440;
  objc_copyWeak(v74, (id *)location);
  v74[1] = v13;
  BOOL v75 = a4;
  [v71 setControllerPausedHandler:v73];
  objc_destroyWeak(v74);
  objc_destroyWeak(v80);
  objc_destroyWeak(v83);
  objc_destroyWeak(v86);
  objc_destroyWeak(v89);
  objc_destroyWeak(v92);
  objc_destroyWeak(v50);
  objc_destroyWeak(v51);
  objc_destroyWeak(v52);
  objc_destroyWeak(v53);
  objc_destroyWeak(v54);
  objc_destroyWeak(v55);
  objc_destroyWeak(v56);
  objc_destroyWeak(v57);
  objc_destroyWeak(v58);
  objc_destroyWeak(v59);

  objc_destroyWeak(v60);
  objc_destroyWeak(v61);
  objc_destroyWeak(v62);
  objc_destroyWeak(v63);
  objc_destroyWeak(v64);
  objc_destroyWeak(v65);
  objc_destroyWeak(v66);
  objc_destroyWeak(v67);
  objc_destroyWeak(v68);
  objc_destroyWeak(v69);

  objc_destroyWeak((id *)location);
}

- (void)controllerDidDisconnect:(id)a3
{
  id v4 = [a3 object];
  [(GCDGameControllerDaemonDelegate *)self removeController:v4 forward:1];
}

- (void)removeController:(id)a3 forward:(BOOL)a4
{
  id v6 = a3;
  if (sub_100006238())
  {
    id v13 = sub_100006504();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2048;
      id v22 = [v6 deviceHash];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "removeController:%@ for hash: %lu", buf, 0x16u);
    }
  }
  if (!a4)
  {
    BOOL v7 = self->_appConnections;
    objc_sync_enter(v7);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    float v8 = self->_appConnections;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        unsigned __int8 v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) remoteObjectProxy:v14];
          [v12 removeController:v6];

          unsigned __int8 v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
}

- (void)appWillEnterForeground
{
  if (sub_100006238())
  {
    v2 = sub_100006504();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "appWillEnterForeground", v3, 2u);
    }
  }
}

- (void)appDidEnterBackground
{
  if (sub_100006238())
  {
    v2 = sub_100006504();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "appDidEnterBackground", v3, 2u);
    }
  }
}

- (void)appWillEnterForegroundWithPID:(int)a3
{
  if (sub_100006238())
  {
    id v13 = sub_100006504();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "appWillEnterForegroundWithPID:%d", buf, 8u);
    }
  }
  uint64_t v5 = self->_appConnections;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_appConnections;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "processIdentifier", (void)v14) == a3)
        {
          id v11 = v10;
          goto LABEL_12;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  objc_sync_exit(v5);
  id v12 = self->_foregroundAppConnections;
  objc_sync_enter(v12);
  if (([(NSMutableArray *)self->_foregroundAppConnections containsObject:v11] & 1) == 0) {
    [(NSMutableArray *)self->_foregroundAppConnections addObject:v11];
  }
  objc_sync_exit(v12);
}

- (void)appDidEnterBackgroundWithPID:(int)a3
{
  if (sub_100006238())
  {
    id v13 = sub_100006504();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "appDidEnterBackgroundWithPID:%d", buf, 8u);
    }
  }
  uint64_t v5 = self->_appConnections;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_appConnections;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "processIdentifier", (void)v14) == a3)
        {
          id v11 = v10;
          goto LABEL_12;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  objc_sync_exit(v5);
  id v12 = self->_foregroundAppConnections;
  objc_sync_enter(v12);
  [(NSMutableArray *)self->_foregroundAppConnections removeObject:v11];
  objc_sync_exit(v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaremoted, 0);
  objc_storeStrong((id *)&self->_foregroundAppConnections, 0);

  objc_storeStrong((id *)&self->_appConnections, 0);
}

@end