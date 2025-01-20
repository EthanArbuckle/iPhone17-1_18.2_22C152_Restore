@interface CPXIDSRelay
- (CPXIDSRelay)init;
- (IDSService)service;
- (NSMutableDictionary)highPriorityPortConnections;
- (NSMutableDictionary)lowPriorityPortConnections;
- (NSMutableDictionary)wifiPortConnections;
- (OS_dispatch_queue)queue;
- (id)sendMessage:(id)a3 messageDictionary:(id)a4;
- (unsigned)acquirePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5;
- (unsigned)releasePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5;
- (void)handleGenericCPXConnection:(id)a3;
@end

@implementation CPXIDSRelay

- (CPXIDSRelay)init
{
  v16.receiver = self;
  v16.super_class = (Class)CPXIDSRelay;
  v2 = [(CPXIDSRelay *)&v16 init];
  if (!v2) {
    goto LABEL_4;
  }
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  highPriorityPortConnections = v2->_highPriorityPortConnections;
  v2->_highPriorityPortConnections = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  lowPriorityPortConnections = v2->_lowPriorityPortConnections;
  v2->_lowPriorityPortConnections = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  wifiPortConnections = v2->_wifiPortConnections;
  v2->_wifiPortConnections = v7;

  dispatch_queue_t v9 = dispatch_queue_create("CPXIDSRelayQueue", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v9;

  v11 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.companionproxy"];
  service = v2->_service;
  v2->_service = v11;

  v13 = v2->_service;
  if (v13)
  {
    [(IDSService *)v13 addDelegate:v2 queue:v2->_queue];
LABEL_4:
    v14 = v2;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v18 = @"com.apple.private.alloy.companionproxy";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create CPXIDSRelay service for %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (unsigned)acquirePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (!a5 || a4)
  {
    if (a4) {
      [(CPXIDSRelay *)self lowPriorityPortConnections];
    }
    else {
    uint64_t v8 = [(CPXIDSRelay *)self highPriorityPortConnections];
    }
  }
  else
  {
    uint64_t v8 = [(CPXIDSRelay *)self wifiPortConnections];
  }
  dispatch_queue_t v9 = (void *)v8;
  v10 = +[NSNumber numberWithUnsignedInteger:a3];
  v11 = [v9 objectForKey:v10];
  uint64_t v12 = [v11 unsignedIntValue] + 1;

  v13 = +[NSNumber numberWithUnsignedInt:v12];
  v14 = +[NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v13 forKey:v14];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v16 = @"High";
    if (v6) {
      CFStringRef v16 = @"Low";
    }
    int v18 = 138413058;
    CFStringRef v19 = v16;
    CFStringRef v17 = @"WiFi";
    __int16 v20 = 2112;
    if (!v5) {
      CFStringRef v17 = @"Bluetooth";
    }
    CFStringRef v21 = v17;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Number of %@ Priority port connections for preferred link (%@) upon acquire of %lu: %@", (uint8_t *)&v18, 0x2Au);
  }

  return v12;
}

- (unsigned)releasePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (!a5 || a4)
  {
    if (a4) {
      [(CPXIDSRelay *)self lowPriorityPortConnections];
    }
    else {
    uint64_t v8 = [(CPXIDSRelay *)self highPriorityPortConnections];
    }
  }
  else
  {
    uint64_t v8 = [(CPXIDSRelay *)self wifiPortConnections];
  }
  dispatch_queue_t v9 = (void *)v8;
  v10 = +[NSNumber numberWithUnsignedInteger:a3];
  v11 = [v9 objectForKey:v10];
  uint64_t v12 = [v11 unsignedIntValue] - 1;

  if (v12)
  {
    v13 = +[NSNumber numberWithUnsignedInt:v12];
    v14 = +[NSNumber numberWithUnsignedInteger:a3];
    [v9 setObject:v13 forKey:v14];
  }
  else
  {
    v13 = +[NSNumber numberWithUnsignedInteger:a3];
    [v9 removeObjectForKey:v13];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v16 = @"High";
    if (v6) {
      CFStringRef v16 = @"Low";
    }
    int v18 = 138413058;
    CFStringRef v19 = v16;
    CFStringRef v17 = @"WiFi";
    __int16 v20 = 2112;
    if (!v5) {
      CFStringRef v17 = @"Bluetooth";
    }
    CFStringRef v21 = v17;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Number of %@ Priority port connections for preferred link (%@) upon release of %lu: %@", (uint8_t *)&v18, 0x2Au);
  }

  return v12;
}

- (id)sendMessage:(id)a3 messageDictionary:(id)a4
{
  uint64_t v5 = IDSDefaultPairedDevice;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSSet setWithObject:v5];
  v24[0] = IDSSendMessageOptionTimeoutKey;
  v24[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v25[0] = &off_1000152D8;
  v25[1] = &__kCFBooleanTrue;
  dispatch_queue_t v9 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  v10 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0];

  id v16 = 0;
  id v17 = 0;
  unsigned __int8 v11 = [v7 sendData:v10 toDestinations:v8 priority:300 options:v9 identifier:&v17 error:&v16];

  id v12 = v17;
  id v13 = v16;
  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v12;
    __int16 v20 = 2112;
    CFStringRef v21 = v10;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS send failed (id: %@, data: %@): %@", buf, 0x20u);
  }
  id v14 = v12;

  return v14;
}

- (void)handleGenericCPXConnection:(id)a3
{
  id v3 = a3;
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = sub_100005824;
  v144 = sub_100005834;
  id v145 = 0;
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x3032000000;
  v137 = sub_100005824;
  v138 = sub_100005834;
  id v139 = 0;
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = sub_100005824;
  v132 = sub_100005834;
  id v133 = 0;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x3032000000;
  v125 = sub_100005824;
  v126 = sub_100005834;
  id v127 = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  v121[3] = 0;
  v120[0] = 0;
  v120[1] = v120;
  v120[2] = 0x2020000000;
  v120[3] = 0;
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x2020000000;
  uint64_t v115 = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x2020000000;
  v111[3] = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x2020000000;
  v110[3] = 0;
  int v58 = fcntl((int)[v3 localSocket], 3, 0);
  int v56 = fcntl((int)[v3 bridgeSocket], 3, 0);
  id v59 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.companion_proxy"];
  v4 = [v59 arrayForKey:@"ServiceSocketLogging"];
  v57 = v4;
  if (v4)
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v5 = v4;
    char v6 = 0;
    id v7 = [v5 countByEnumeratingWithState:&v106 objects:v154 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v107;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v107 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          unsigned __int8 v11 = [v3 serviceName];
          LODWORD(v10) = [v10 isEqualToString:v11];

          if (v10)
          {
            id v12 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            {
              id v13 = [v3 serviceName];
              sub_10000CCE8(v13, v152, &v153);
            }

            char v6 = 1;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v106 objects:v154 count:16];
      }
      while (v7);
    }

    char v14 = v6 & 1;
  }
  else
  {
    char v14 = 0;
  }
  unsigned int v15 = [v59 BOOLForKey:@"EnableSocketDataLogging"];
  char v16 = v15;
  if (v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000CCA0();
  }
  if (v58 == -1 || fcntl((int)[v3 localSocket], 4, v58 | 4u) == -1)
  {
    id v40 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = [v3 localSocket];
      int v42 = *__error();
      v43 = __error();
      v44 = strerror(*v43);
      *(_DWORD *)buf = 67109634;
      unsigned int v147 = v41;
      __int16 v148 = 1024;
      int v149 = v42;
      __int16 v150 = 2080;
      v151 = v44;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "fcntl failed on local socket %d: %d (%s)", buf, 0x18u);
    }
    goto LABEL_32;
  }
  if (v56 == -1 || fcntl((int)[v3 bridgeSocket], 4, v56 | 4u) == -1)
  {
    id v45 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v46 = [v3 bridgeSocket];
      int v47 = *__error();
      v48 = __error();
      v49 = strerror(*v48);
      *(_DWORD *)buf = 67109634;
      unsigned int v147 = v46;
      __int16 v148 = 1024;
      int v149 = v47;
      __int16 v150 = 2080;
      v151 = v49;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "fcntl failed on bridge socket %d: %d (%s)", buf, 0x18u);
    }
LABEL_32:

    goto LABEL_33;
  }
  uintptr_t v17 = (int)[v3 localSocket];
  int v18 = dispatch_get_global_queue(0, 0);
  dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v17, 0, v18);
  __int16 v20 = (void *)v141[5];
  v141[5] = (uint64_t)v19;

  if (!v141[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create local read dispatch source", buf, 2u);
    }
    goto LABEL_33;
  }
  CFStringRef v21 = malloc_type_malloc(0x4000uLL, 0x122EBC5EuLL);
  v117[3] = (uint64_t)v21;
  __int16 v22 = v141[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000583C;
  handler[3] = &unk_100014568;
  v99 = v121;
  id v23 = v3;
  id v98 = v23;
  char v104 = v14;
  v100 = &v116;
  v101 = &v140;
  char v105 = v16;
  v102 = v111;
  v103 = &v128;
  dispatch_source_set_event_handler(v22, handler);
  __int16 v24 = v141[5];
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_100005C48;
  v92[3] = &unk_100014590;
  v94 = &v128;
  v95 = &v134;
  id v25 = v23;
  id v93 = v25;
  v96 = &v116;
  dispatch_source_set_cancel_handler(v24, v92);
  dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, (int)[v25 bridgeSocket], 0, v18);
  v27 = (void *)v129[5];
  v129[5] = (uint64_t)v26;

  v28 = v129[5];
  if (!v28)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create local write dispatch source", buf, 2u);
    }

    goto LABEL_33;
  }
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100005CD0;
  v83[3] = &unk_100014568;
  v85 = v121;
  id v29 = v25;
  id v84 = v29;
  v86 = v111;
  char v90 = v14;
  char v91 = v16;
  v87 = &v140;
  v88 = &v116;
  v89 = &v128;
  dispatch_source_set_event_handler(v28, v83);
  dispatch_source_t v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)[v29 bridgeSocket], 0, v18);
  v31 = (void *)v135[5];
  v135[5] = (uint64_t)v30;

  if (!v135[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create bridge read dispatch source", buf, 2u);
    }

    goto LABEL_33;
  }
  v32 = malloc_type_malloc(0x4000uLL, 0xC739D7BEuLL);
  v113[3] = (uint64_t)v32;
  v33 = v135[5];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100006014;
  v74[3] = &unk_100014568;
  v76 = v120;
  id v34 = v29;
  id v75 = v34;
  char v81 = v14;
  v77 = &v112;
  v78 = &v134;
  char v82 = v16;
  v79 = v110;
  v80 = &v122;
  dispatch_source_set_event_handler(v33, v74);
  v35 = v135[5];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100006394;
  v69[3] = &unk_100014590;
  v71 = &v122;
  v72 = &v140;
  id v36 = v34;
  id v70 = v36;
  v73 = &v112;
  dispatch_source_set_cancel_handler(v35, v69);
  dispatch_source_t v37 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, (int)[v36 localSocket], 0, v18);
  v38 = (void *)v123[5];
  v123[5] = (uint64_t)v37;

  v39 = v123[5];
  if (v39)
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10000641C;
    v60[3] = &unk_100014568;
    v62 = v120;
    id v61 = v36;
    v63 = v110;
    char v67 = v14;
    char v68 = v16;
    v64 = &v134;
    v65 = &v112;
    v66 = &v122;
    dispatch_source_set_event_handler(v39, v60);
    dispatch_resume((dispatch_object_t)v141[5]);
    dispatch_resume((dispatch_object_t)v135[5]);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create bridge write dispatch source", buf, 2u);
  }

  if (!v39)
  {
LABEL_33:
    v50 = [v3 localCompletion];
    v50[2]();

    v51 = [v3 bridgeCompletion];
    v51[2]();

    v52 = v117;
    v53 = (void *)v117[3];
    if (v53)
    {
      free(v53);
      v52 = v117;
    }
    v52[3] = 0;
    v54 = v113;
    v55 = (void *)v113[3];
    if (v55)
    {
      free(v55);
      v54 = v113;
    }
    v54[3] = 0;
  }

  _Block_object_dispose(v110, 8);
  _Block_object_dispose(v111, 8);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(v120, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(&v122, 8);

  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v134, 8);

  _Block_object_dispose(&v140, 8);
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)highPriorityPortConnections
{
  return self->_highPriorityPortConnections;
}

- (NSMutableDictionary)lowPriorityPortConnections
{
  return self->_lowPriorityPortConnections;
}

- (NSMutableDictionary)wifiPortConnections
{
  return self->_wifiPortConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiPortConnections, 0);
  objc_storeStrong((id *)&self->_lowPriorityPortConnections, 0);
  objc_storeStrong((id *)&self->_highPriorityPortConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end