@interface NetworkServiceProxyProvider
- (BOOL)handleNewFlow:(id)a3;
- (BOOL)hasNetworkPath;
- (NetworkServiceProxyProvider)init;
- (id)copyStateForClient:(id)a3 withPeerEndpoint:(id)a4 outWaldoInfo:(id *)a5;
- (id)waldoGetCurrentConfiguration;
- (id)waldoRequiresTFO:(id)a3;
- (void)handleAppMessage:(id)a3 completionHandler:(id)a4;
- (void)handleUsageReport:(id)a3 fromClient:(id)a4;
- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)waldo:(id)a3 didFinishProbingWithSuccess:(BOOL)a4;
- (void)waldo:(id)a3 didFinishSampleProbingWithSuccess:(BOOL)a4;
- (void)waldo:(id)a3 fetchDayPassForURL:(id)a4 ifExpired:(id)a5 session:(id)a6 dataHandler:(id)a7 completionHandler:(id)a8;
- (void)waldoDidSaveToKeychain:(id)a3;
- (void)waldoNeedsPolicyReset;
@end

@implementation NetworkServiceProxyProvider

- (NetworkServiceProxyProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)NetworkServiceProxyProvider;
  v2 = [(NetworkServiceProxyProvider *)&v9 init];
  if (v2)
  {
    uint64_t default_evaluator = nw_path_create_default_evaluator();
    defaultEvaluator = v2->_defaultEvaluator;
    v2->_defaultEvaluator = (OS_nw_path_evaluator *)default_evaluator;

    uint64_t v5 = nw_context_create();
    nwContext = v2->_nwContext;
    v2->_nwContext = (OS_nw_context *)v5;

    v7 = NPGetInternalQueue();
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10000A620;
    v13 = &unk_100105758;
    v14 = v2;
    nw_context_set_idle_handler();

    nw_context_set_isolate_protocol_cache();
  }
  return v2;
}

- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void))a4;
  v6 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v6);

  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    objc_super v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ startProxyWithOptions", (uint8_t *)&v8, 0xCu);
  }

  v5[2](v5, 0);
}

- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v6);

  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ stopProxyWithReason", (uint8_t *)&v10, 0xCu);
  }

  if (self) {
    objc_setProperty_atomic(self, v8, 0, 32);
  }
  objc_super v9 = +[NSPManager sharedManager];
  [v9 stopWithCompletionHandler:v5];
}

- (void)handleAppMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:0];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      v24 = sub_10000B664;
      v25 = &unk_100105528;
      id v26 = v7;
      objc_super v9 = objc_retainBlock(&v22);
      int v10 = [v8 objectForKeyedSubscript:@"MessageType" v22, v23, v24, v25];
      if ([v10 integerValue] == (id)1)
      {
        uint64_t v11 = v9;
        if (self)
        {
          id v12 = v8;
          v13 = NPGetInternalQueue();
          dispatch_assert_queue_V2(v13);

          v14 = [v12 objectForKeyedSubscript:@"Force"];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v14 = 0;
          }
          [v14 BOOLValue];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10000B0D8;
          v27[3] = &unk_100105500;
          v28 = v11;
          v15 = v27;
          v16 = nplog_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting Tuscany refresh", buf, 2u);
          }

          id v17 = objc_alloc_init((Class)NSMutableString);
          objc_setProperty_atomic(self, v18, v17, 48);

          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v30 = 3221225472;
          v31 = sub_10000B19C;
          v32 = &unk_1001056E0;
          v19 = v15;
          v33 = self;
          id v34 = v19;
          sub_10000ABA8((uint64_t)self, buf);
        }
      }
      else
      {
        ((void (*)(void ***, void))v9[2])(v9, 0);
      }
    }
    else
    {
      v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to convert a message to a dictionary", buf, 2u);
      }

      if (v7) {
        (*((void (**)(id, void))v7 + 2))(v7, 0);
      }
    }
  }
  else
  {
    v20 = nplog_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Received invalid message", buf, 2u);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (BOOL)handleNewFlow:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if (self)
    {
      id v6 = NPGetInternalQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A890;
      block[3] = &unk_100105488;
      block[4] = self;
      dispatch_async(v6, block);
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)hasNetworkPath
{
  v3 = [(NetworkServiceProxyProvider *)self defaultPath];
  if (v3)
  {
    id v4 = [(NetworkServiceProxyProvider *)self defaultPath];
    BOOL v5 = [v4 status] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)waldoGetCurrentConfiguration
{
  v2 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v2);

  v3 = sub_10005C0D4();
  id v4 = v3;
  if (v3) {
    v3 = (void *)v3[5];
  }
  BOOL v5 = v3;

  return v5;
}

- (void)waldoNeedsPolicyReset
{
  v2 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v2);

  v3 = sub_10005C0D4();
}

- (void)waldo:(id)a3 fetchDayPassForURL:(id)a4 ifExpired:(id)a5 session:(id)a6 dataHandler:(id)a7 completionHandler:(id)a8
{
  id v22 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [v14 delegate];
  if (v17)
  {
    uint64_t v18 = sub_10005C0D4();
    v19 = (void *)v18;
    if (v18) {
      v20 = *(void **)(v18 + 40);
    }
    else {
      v20 = 0;
    }
    id v21 = v20;
    [v17 setIgnoreInvalidCerts:[v21 ignoreInvalidCerts]];
  }
  sub_10000B90C((uint64_t)self, v22, v13, v14, v15, v16);
}

- (void)waldoDidSaveToKeychain:(id)a3
{
  v3 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v3);

  sub_10005C0D4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_10006AE90((uint64_t)v4);
}

- (void)waldo:(id)a3 didFinishProbingWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v6);

  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 identifier];
    int v9 = 138412546;
    int v10 = v8;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Probing finished with success: %d", (uint8_t *)&v9, 0x12u);
  }
}

- (void)waldo:(id)a3 didFinishSampleProbingWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v6);

  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 identifier];
    int v9 = 138412546;
    int v10 = v8;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: One sample probing finished with success: %d", (uint8_t *)&v9, 0x12u);
  }
}

- (id)waldoRequiresTFO:(id)a3
{
  id v3 = a3;
  BOOL v4 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = sub_10005C0D4();
  id v6 = (void *)v5;
  if (v5) {
    id v7 = *(void **)(v5 + 40);
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v8 appRules];
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v9)
  {
    id v20 = 0;
    goto LABEL_17;
  }
  id v10 = v9;
  id v20 = 0;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      id v14 = [v8 getEdgeSetForAppRule:v13];
      id v15 = [v14 identifier];
      id v16 = [v3 identifier];
      if ([v15 isEqualToString:v16])
      {
        id v17 = [v13 requireTFO];

        if (!v17) {
          goto LABEL_13;
        }
        [v13 requireTFO];
        id v15 = v20;
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
      }
LABEL_13:
    }
    id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v10);
LABEL_17:

  return v20;
}

- (void)handleUsageReport:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = sub_10005C0D4();
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = *(void **)(v9 + 40);
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = [v12 getEdgeSetForSigningIdentifier:v7];
  id v14 = v13;
  if (v13)
  {
    if ([v13 source] != (id)2)
    {
      if (![v14 hasEdges]
        || [v6 waldoTimestamp]
        && (unsigned int v15 = [v6 waldoTimestamp],
            [v12 timestamp],
            id v16 = objc_claimAutoreleasedReturnValue(),
            unsigned int v17 = [v16 unsignedIntValue],
            v16,
            v15 != v17))
      {
        uint64_t v18 = nplog_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = [v14 identifier];
          unsigned int v20 = [v6 waldoTimestamp];
          long long v21 = [v12 timestamp];
          int v25 = 138412802;
          id v26 = v19;
          __int16 v27 = 1024;
          *(_DWORD *)v28 = v20;
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = [v21 unsignedIntValue];
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Refreshing Waldo because there are no edges or because the timestamp reported by the client (%u) is not equal to the current timestamp (%u)", (uint8_t *)&v25, 0x18u);
        }
        sub_10000ABA8((uint64_t)self, 0);
      }
    }
    if ([v14 hasEdges])
    {
      long long v22 = nplog_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [v14 identifier];
        int v25 = 138412546;
        id v26 = v23;
        __int16 v27 = 2112;
        *(void *)v28 = v7;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: Handling a usage report from %@", (uint8_t *)&v25, 0x16u);
      }
      [v14 handleUsageReport:v6];
    }
  }
  else
  {
    long long v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to find an edge set for %@", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (id)copyStateForClient:(id)a3 withPeerEndpoint:(id)a4 outWaldoInfo:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = sub_10005C0D4();
  id v12 = (void *)v11;
  v85 = a5;
  if (v11) {
    id v13 = *(void **)(v11 + 40);
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  id v89 = objc_alloc_init((Class)NSMutableDictionary);
  id v16 = [v14 getEdgeSetForSigningIdentifier:v9];
  id v17 = v9;
  v87 = v14;
  id v88 = v15;
  selfa = self;
  if (self)
  {
    uint64_t v18 = sub_10005C0D4();
    v19 = (void *)v18;
    id v20 = v8;
    if (v18) {
      long long v21 = *(void **)(v18 + 40);
    }
    else {
      long long v21 = 0;
    }
    id v22 = v21;
    long long v23 = [v22 appRules];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v90 objects:buf count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v91;
LABEL_8:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v91 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v90 + 1) + 8 * v28);
        uint64_t v30 = [v29 matchSigningIdentifier];
        unsigned __int8 v31 = [v30 isEqualToString:v17];

        if (v31) {
          break;
        }
        if (v26 == (id)++v28)
        {
          id v26 = [v24 countByEnumeratingWithState:&v90 objects:buf count:16];
          if (v26) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
      id v32 = v29;

      if (!v32) {
        goto LABEL_22;
      }
      v33 = [v32 locationBundlePath];

      id v8 = v20;
      if (v33)
      {
        id v34 = nplog_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v82 = [v32 label];
          v83 = [v32 locationBundlePath];
          *(_DWORD *)v94 = 138412546;
          *(void *)v95 = v82;
          *(_WORD *)&v95[8] = 2112;
          *(void *)&v95[10] = v83;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Checking if location services are enabled for %@ using bundle %@", v94, 0x16u);
        }
        v35 = [v32 locationBundlePath];
        unsigned int v36 = +[CLLocationManager authorizationStatusForBundlePath:v35];

        v37 = nplog_obj();
        id v15 = v88;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v84 = [v32 locationBundlePath];
          *(_DWORD *)v94 = 67109378;
          *(_DWORD *)v95 = v36;
          *(_WORD *)&v95[4] = 2112;
          *(void *)&v95[6] = v84;
          _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Got authorization status %d for bundle %@", v94, 0x12u);
        }
        BOOL v38 = v36 - 3 < 2;
        goto LABEL_26;
      }
    }
    else
    {
LABEL_14:

      id v32 = 0;
LABEL_22:
      id v8 = v20;
    }
    v39 = nplog_obj();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v94 = 138412290;
      *(void *)v95 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "App %@ does not have a location bundle path", v94, 0xCu);
    }

    BOOL v38 = 0;
    id v15 = v88;
LABEL_26:
    v94[0] = v38;

    uint64_t v40 = v94[0];
  }
  else
  {
    uint64_t v40 = 0;
  }

  if (v16)
  {
    id v42 = [v16 copyStateIncludeDistance:v40];
    v43 = [v16 edgeContainingOnRamp:v8];
    if (v42) {
      [v15 setObject:v42 forKeyedSubscript:@"edges"];
    }
    id v44 = [v16 copyEdgeSelectionTelemetry];
    [v15 setObject:v44 forKeyedSubscript:@"edgeSelection"];

    v45 = [v16 tag];

    if (v45)
    {
      v46 = [v16 tag];
      [v15 setObject:v46 forKeyedSubscript:@"config"];
    }
    v47 = nplog_obj();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG);
    if (!v40)
    {
      if (v48)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Not including location information in telemetry", buf, 2u);
      }
      goto LABEL_46;
    }
    if (v48)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Including location information in telemetry", buf, 2u);
    }

    v49 = [v16 locationManager];
    v47 = [v49 copyCurrentGeohash];

    v50 = [v16 locationManager];
    v51 = [v50 copyCurrentGeohashFromServer];

    v52 = [v16 locationManager];
    [v52 dislocation];
    double v54 = v53;

    if (!v47 || v51)
    {
      if (!v51)
      {
LABEL_43:
        if (v54 > 0.0)
        {
          v58 = +[NSNumber numberWithDouble:v54];
          [v89 setObject:v58 forKeyedSubscript:@"dislocation"];
        }
LABEL_46:

        v59 = nplog_obj();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          v81 = [v43 label];
          *(_DWORD *)buf = 138412546;
          id v97 = v8;
          __int16 v98 = 2112;
          v99 = v81;
          _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Mapped connection endpoint %@ to edge %@", buf, 0x16u);
        }
        v60 = [v43 label];
        id v61 = [v60 length];

        if (v61)
        {
          v62 = [v43 label];
          [v89 setObject:v62 forKeyedSubscript:@"peer"];
        }
        v63 = [v16 telemetryURL];

        if (v63)
        {
          v64 = [v16 telemetryURL];
          v65 = [v64 host];
          [v15 setObject:v65 forKeyedSubscript:@"host"];
        }
        id *v85 = v16;

        goto LABEL_53;
      }
      CFStringRef v55 = @"surfaced_at";
      v56 = v89;
      v57 = v51;
    }
    else
    {
      CFStringRef v55 = @"geohash";
      v56 = v89;
      v57 = v47;
    }
    [v56 setObject:v57 forKeyedSubscript:v55];
    goto LABEL_43;
  }
LABEL_53:
  if (selfa) {
    objc_getProperty(selfa, v41, 56, 1);
  }
  v66 = (void *)nw_path_evaluator_copy_path();
  if (!v66)
  {
    v67 = 0;
    goto LABEL_66;
  }
  v67 = nw_path_copy_interface();
  if (!v67)
  {
LABEL_66:
    v70 = 0;
    goto LABEL_67;
  }
  id v68 = +[NPUtilities interfaceTypeOfInterface:v67];
  uint64_t v69 = +[NSString stringWithUTF8String:nw_interface_get_name(v67)];
  v70 = (void *)v69;
  if (v68 == (id)1 && v69)
  {
    uint64_t v71 = WiFiManagerClientCreate();
    if (v71)
    {
      v72 = (const void *)v71;
      if (WiFiManagerClientGetDevice())
      {
        uint64_t v73 = WiFiDeviceClientCopyCurrentNetwork();
        if (v73)
        {
          v74 = (const void *)v73;
          v75 = WiFiNetworkGetProperty();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v75 doubleValue];
            v77 = +[NSNumber numberWithDouble:(double)(int)(v76 * 1000.0) / 1000.0];
            [v89 setObject:v77 forKeyedSubscript:@"signal_wifi"];
          }
          CFRelease(v74);
          id v15 = v88;
          goto LABEL_76;
        }
        v75 = nplog_obj();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v80 = "Failed to copy the current WiFi network";
          goto LABEL_75;
        }
      }
      else
      {
        v75 = nplog_obj();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v80 = "Failed to get the WiFi device";
LABEL_75:
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, v80, buf, 2u);
        }
      }
LABEL_76:

      CFRelease(v72);
      goto LABEL_67;
    }
    v79 = nplog_obj();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Failed to create a WiFi manager", buf, 2u);
    }
  }
LABEL_67:
  [v15 setObject:v89 forKeyedSubscript:@"connection"];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwContextIdlnessCheckTimer, 0);
  objc_storeStrong((id *)&self->_sharedNetworkTransaction, 0);
  objc_storeStrong((id *)&self->_nwContext, 0);
  objc_storeStrong((id *)&self->_defaultEvaluator, 0);
  objc_storeStrong((id *)&self->_requestLog, 0);
  objc_storeStrong((id *)&self->_resurrectionTimer, 0);
  objc_storeStrong((id *)&self->_currentNetworkCharacteristics, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end