@interface NEHelperWiFiInfoManager
- (NEHelperWiFiInfoManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)dealloc;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperWiFiInfoManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "interface-name");
  v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_opt_class();
    v8 = "(nil)";
    if (string) {
      v8 = string;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ processing Wi-Fi information request for %s", buf, 0x16u);
  }
  id v10 = v4;
  v11 = v10;
  if (self)
  {
    id v12 = v10;
    v13 = v12;
    if (v12)
    {
      v14 = xpc_dictionary_get_string(v12, "interface-name");
      if (v14)
      {
        v15 = +[NSString stringWithUTF8String:v14];
        interfaceName = self->_interfaceName;
        self->_interfaceName = v15;
      }
      self->_isSecurityTypeRequested = xpc_dictionary_get_BOOL(v13, "security-type-requested");
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10000B76C;
      *(void *)&buf[24] = &unk_1000397B8;
      v98 = self;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, buf);
      if (!self->_network)
      {
        v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = objc_opt_class();
          *(_DWORD *)v101 = 138412290;
          *(void *)&v101[4] = v18;
          id v19 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ device is not associated to Wi-Fi network", v101, 0xCu);
        }
      }
    }

    v20 = self->_connection;
    if (qword_100042C58 != -1) {
      dispatch_once(&qword_100042C58, &stru_100038E28);
    }
    if (byte_100042C50)
    {
      if (nelog_is_debug_logging_enabled())
      {
        pid_t pid = xpc_connection_get_pid(v20);
        proc_name(pid, buf, 0x40u);
        v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v101 = 136315138;
          *(void *)&v101[4] = buf;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Process [%s] is requesting current Wi-Fi network information", v101, 0xCu);
        }
      }
      v23 = (void *)xpc_connection_copy_entitlement_value();
      v24 = v23;
      if (v23 && xpc_get_type(v23) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v24))
      {

        v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v94 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v94;
          id v95 = v94;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@ calling process has private entitlement", buf, 0xCu);
        }
        sub_10000ABC8((uint64_t)self, v13);
        goto LABEL_86;
      }
    }
    memset(buf, 0, sizeof(buf));
    xpc_dictionary_get_audit_token();
    id v96 = 0;
    *(_OWORD *)v101 = *(_OWORD *)buf;
    *(_OWORD *)&v101[16] = *(_OWORD *)&buf[16];
    v26 = +[LSBundleRecord bundleRecordForAuditToken:v101 error:&v96];
    id v27 = v96;
    if (v26)
    {
      v28 = [v26 SDKVersion];
    }
    else
    {
      v29 = ne_log_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v101 = 138412546;
        *(void *)&v101[4] = self;
        *(_WORD *)&v101[12] = 2112;
        *(void *)&v101[14] = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@ failed to get bundle record, error: %@", v101, 0x16u);
      }

      v28 = 0;
    }

    v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v81 = objc_opt_class();
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v81;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = bundleID;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v28;
      id v83 = v81;
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@ [%@] is built with SDK version [%@]", buf, 0x20u);
    }
    if (!v28) {
      goto LABEL_42;
    }
    id v31 = v28;
    v32 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned __int8 v33 = [v32 isVersion:v31 greaterThanOrEqualToVersion:@"12.0"];

    if (v33)
    {
      v34 = xpc_connection_copy_entitlement_value();
      v35 = v34;
      if (!v34 || xpc_get_type(v34) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v35))
      {

        v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = objc_opt_class();
          v38 = self->_bundleID;
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v38;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = "com.apple.developer.networking.wifi-info";
          id v39 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@ [%@] missing \"%s\" entitlement", buf, 0x20u);
        }
LABEL_42:
        v40 = ne_log_obj();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = objc_opt_class();
          v42 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v42;
          id v43 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@ [%@] is not entitled", buf, 0x16u);
        }
        sub_10000B3B8((uint64_t)self, v13, 1);
        goto LABEL_85;
      }
    }
    else
    {
      v35 = ne_log_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v44 = objc_opt_class();
        v45 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        id v46 = v44;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@ [%@] linked before iOS 12.0", buf, 0x16u);
      }
    }

    v47 = ne_log_obj();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = objc_opt_class();
      v49 = self->_bundleID;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v49;
      id v50 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@ [%@] is entitled", buf, 0x16u);
    }
    if (objc_opt_class())
    {
      v51 = self->_bundleID;
      *(void *)v101 = 0;
      unsigned int v52 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:v51 error:v101];
      id v53 = *(id *)v101;
      if (v53)
      {
        v54 = ne_log_obj();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = objc_opt_class();
          v56 = self->_bundleID;
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v53;
          id v57 = v55;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%@ failed to find location authorization for [%@] [%@]", buf, 0x20u);
        }
        unsigned int v52 = 0;
      }
    }
    else
    {
      unsigned int v52 = 0;
    }
    v58 = ne_log_obj();
    BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);
    if (v52)
    {
      if (v59)
      {
        v60 = objc_opt_class();
        v61 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v61;
        id v62 = v60;
        v63 = "%@ [%@] is authorized to access the location";
LABEL_83:
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, v63, buf, 0x16u);
      }
    }
    else
    {
      if (v59)
      {
        v64 = objc_opt_class();
        v65 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v65;
        id v66 = v64;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%@ [%@] is not authorized to access the location", buf, 0x16u);
      }
      if (self->_network && (uint64_t BundleIdentifier = WiFiNetworkGetBundleIdentifier()) != 0) {
        unsigned int v68 = [(NSString *)self->_bundleID isEqual:BundleIdentifier];
      }
      else {
        unsigned int v68 = 0;
      }
      v58 = ne_log_obj();
      BOOL v69 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);
      if (!v68)
      {
        if (v69)
        {
          v72 = objc_opt_class();
          v73 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v72;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v73;
          id v74 = v72;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%@ [%@] has not configured the current network", buf, 0x16u);
        }
        v75 = (void *)xpc_connection_copy_entitlement_value();
        if ((NEGetEntitlement() & 3) != 0)
        {
          v77 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:objc_getProperty(self, v76, 32, 1)];
          v78 = v77;
          if (v77)
          {
            v79 = [v77 protocol];
            BOOL v80 = ([v79 isEqualToString:@"com.apple.networkextension.app-proxy"] & 1) != 0
               || [v79 isEqualToString:@"com.apple.networkextension.packet-tunnel"];
          }
          else
          {
            BOOL v80 = 0;
          }
        }
        else
        {
          BOOL v80 = 0;
        }

        v58 = ne_log_obj();
        BOOL v84 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);
        if (!v80)
        {
          if (v84)
          {
            v87 = objc_opt_class();
            v88 = self->_bundleID;
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v87;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v88;
            id v89 = v87;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%@ [%@] is not a VPN provider", buf, 0x16u);
          }
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_10000AED4;
          *(void *)&buf[24] = &unk_100039358;
          v98 = self;
          id v99 = v13;
          id v100 = v31;
          v90 = buf;
          v91 = +[NEConfigurationManager sharedManagerForAllUsers];
          queue = self->_queue;
          *(void *)v101 = _NSConcreteStackBlock;
          *(void *)&v101[8] = 3221225472;
          *(void *)&v101[16] = sub_10000B4E0;
          *(void *)&v101[24] = &unk_100038E08;
          v102 = self;
          v93 = v90;
          v103 = v93;
          [v91 loadConfigurations:0 withFilter:0 completionQueue:queue completionHandler:v101];

          goto LABEL_85;
        }
        if (!v84) {
          goto LABEL_84;
        }
        v85 = objc_opt_class();
        v86 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v86;
        id v62 = v85;
        v63 = "%@ [%@] is a VPN provider";
        goto LABEL_83;
      }
      if (v69)
      {
        v70 = objc_opt_class();
        v71 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v70;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v71;
        id v62 = v70;
        v63 = "%@ [%@] has configured the current network";
        goto LABEL_83;
      }
    }
LABEL_84:

    sub_10000ABC8((uint64_t)self, v13);
LABEL_85:
  }
LABEL_86:
}

- (void)dealloc
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ dealloc()", buf, 0xCu);
  }
  myCFRelease();
  v5.receiver = self;
  v5.super_class = (Class)NEHelperWiFiInfoManager;
  [(NEHelperWiFiInfoManager *)&v5 dealloc];
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
  {
    self = (NEHelperWiFiInfoManager *)objc_getProperty(self, a2, 48, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NEHelperWiFiInfoManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEHelperWiFiInfoManager;
  objc_super v5 = [(NEHelperWiFiInfoManager *)&v19 init];
  if (v5)
  {
    uint64_t v6 = NECopySigningIdentifierForXPCMessage();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("NEHelperWiFiInfoManagerMainTaskQueue", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = xpc_dictionary_get_remote_connection(v4);
    connection = v5->_connection;
    v5->_connection = (OS_xpc_object *)v11;

    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_opt_class();
      v15 = v5->_bundleID;
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ Created new WiFi Info Helper delegate for [%@]", buf, 0x16u);
    }
    v17 = v5;
  }

  return v5;
}

@end