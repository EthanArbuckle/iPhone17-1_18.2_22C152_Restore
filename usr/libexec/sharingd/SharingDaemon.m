@interface SharingDaemon
+ (id)sharedDaemon;
- (BOOL)canAccessAirDropSettings:(id)a3;
- (NSString)description;
- (SharingDaemon)init;
- (id)arrayFromXPCObject:(id)a3;
- (id)numberFromXPCObject:(id)a3;
- (id)stringFromXPCObject:(id)a3;
- (id)xpcArrayForSFNodeArray:(id)a3;
- (id)xpcObjectForSFOperationResults:(id)a3;
- (os_state_data_s)stateCapture;
- (void)_performMigrations;
- (void)dealloc;
- (void)handleBrowserMessage:(id)a3 forConnection:(id)a4;
- (void)handleNewConnection:(id)a3;
- (void)handleOperationMessage:(id)a3 forConnection:(id)a4;
- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6;
- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation SharingDaemon

+ (id)sharedDaemon
{
  if (qword_1009800A0 != -1) {
    dispatch_once(&qword_1009800A0, &stru_1008CDFE8);
  }
  v2 = (void *)qword_1009800A8;

  return v2;
}

- (SharingDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)SharingDaemon;
  v2 = [(SharingDaemon *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activeObjects = v2->_activeObjects;
    v2->_activeObjects = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    exportedOperations = v2->_exportedOperations;
    v2->_exportedOperations = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(SharingDaemon *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SharingDaemon;
  [(SharingDaemon *)&v3 dealloc];
}

- (id)xpcObjectForSFOperationResults:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  [v3 allKeys];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    uint64_t v8 = kSFOperationNodeKey;
    uint64_t v33 = kSFOperationSenderNodeKey;
    uint64_t v32 = kSFOperationFileIconKey;
    uint64_t v30 = kSFOperationSmallFileIconKey;
    uint64_t v29 = kSFOperationErrorKey;
    CFStringRef key = kCFErrorUnderlyingErrorKey;
    xpc_object_t v31 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v9);
        v11 = [v3 objectForKeyedSubscript:v10, key];

        v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        if (([v10 isEqual:v8] & 1) != 0
          || [v10 isEqual:v33])
        {
          uint64_t v13 = _SFNodeXPCObjectCreate();
LABEL_9:
          v14 = (void *)v13;
          goto LABEL_10;
        }
        if (([v10 isEqual:v32] & 1) != 0
          || [v10 isEqual:v30])
        {
          v17 = sub_1000D8D24(v11, 0);
          if (!v17)
          {
            v14 = 0;
            xpc_object_t v4 = v31;
            goto LABEL_15;
          }
          v18 = v17;
          v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          CFRelease(v18);
        }
        else
        {
          if (![v10 isEqual:v29])
          {
            uint64_t v13 = _CFXPCCreateXPCObjectFromCFObject();
            goto LABEL_9;
          }
          v14 = xpc_dictionary_create(0, 0, 0);
          int64_t Code = CFErrorGetCode((CFErrorRef)v11);
          CFErrorGetDomain((CFErrorRef)v11);
          v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_int64(v14, "Code", Code);
          if (v20) {
            xpc_dictionary_set_value(v14, "Domain", v20);
          }
          CFDictionaryRef v21 = CFErrorCopyUserInfo((CFErrorRef)v11);
          if (v21)
          {
            CFDictionaryRef v22 = v21;
            v28 = v20;
            MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v21);
            CFDictionaryRemoveValue(MutableCopy, key);
            v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
            if (v24) {
              xpc_dictionary_set_value(v14, "UserInfo", v24);
            }
            CFRelease(MutableCopy);
            CFRelease(v22);

            v20 = v28;
          }
        }
        xpc_object_t v4 = v31;
LABEL_10:
        if (v12) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          string_ptr = xpc_string_get_string_ptr(v12);
          xpc_dictionary_set_value(v4, string_ptr, v14);
        }
LABEL_15:

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v25 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      id v6 = v25;
    }
    while (v25);
  }

  return v4;
}

- (id)stringFromXPCObject:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_8;
  }
  xpc_object_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      uint64_t v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10013A6F8();
      }

      CFRelease(v5);
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (id)arrayFromXPCObject:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_8;
  }
  xpc_object_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      uint64_t v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10013A72C();
      }

      CFRelease(v5);
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (id)numberFromXPCObject:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  xpc_object_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFNumberGetTypeID())
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFBooleanGetTypeID())
      {
        uint64_t v8 = daemon_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10013A760();
        }

        CFRelease(v5);
        goto LABEL_8;
      }
    }
  }
LABEL_9:

  return v5;
}

- (id)xpcArrayForSFNodeArray:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  CFTypeID v6 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    CFTypeID v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)_SFNodeXPCObjectCreate();
        if (v10) {
          xpc_array_append_value(v4, v10);
        }
      }
      CFTypeID v7 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  id v11 = a3;
  id v12 = a5;
  long long v13 = daemon_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    long long v14 = [v11 kind];
    int v31 = 134218754;
    id v32 = v11;
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2048;
    long long v36 = a4;
    __int16 v37 = 1024;
    int v38 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "SFBrowserCallBack (<%p>{kind = %@}, node = %p, error = %d)", (uint8_t *)&v31, 0x26u);
  }
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  v16 = [v11 isEntitled];

  if (!v16)
  {
    v17 = [v11 kind];
    unsigned int v18 = [v17 isEqual:kSFBrowserKindAirDrop];
    if (v18)
    {
      CFTypeID v6 = [v11 connection];
      uint64_t has_entitlement = xpc_connection_has_entitlement();
    }
    else
    {
      uint64_t has_entitlement = 1;
    }
    v20 = +[NSNumber numberWithInt:has_entitlement];
    [v11 setIsEntitled:v20];

    if (v18) {
  }
    }
  CFDictionaryRef v21 = [v11 isEntitled];
  unsigned __int8 v22 = [v21 BOOLValue];

  if (v22)
  {
    v23 = [v11 childrenForNode:a4];
    if (!v23) {
      goto LABEL_18;
    }
    v24 = [(SharingDaemon *)self xpcArrayForSFNodeArray:v23];
    if (v24) {
      xpc_dictionary_set_value(v15, "Children", v24);
    }
  }
  else
  {
    v24 = airdrop_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10013A794(v11, v24);
    }
    v23 = 0;
  }

LABEL_18:
  id v25 = [v11 kind];
  if (![v25 isEqual:kSFBrowserKindNetwork])
  {
    uint64_t v27 = (uint64_t)v23;
LABEL_24:

    v23 = (void *)v27;
    goto LABEL_25;
  }
  int IsRoot = SFNodeIsRoot();

  if (!IsRoot) {
    goto LABEL_25;
  }
  uint64_t v27 = [v11 sidebarChildren];

  if (v27)
  {
    id v25 = [(SharingDaemon *)self xpcArrayForSFNodeArray:v27];
    if (v25) {
      xpc_dictionary_set_value(v15, "Sidebar", v25);
    }
    goto LABEL_24;
  }
  v23 = 0;
LABEL_25:
  v28 = (void *)_SFNodeXPCObjectCreate();
  if (v28) {
    xpc_dictionary_set_value(v15, "Node", v28);
  }
  if (v12)
  {
    uint64_t v29 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v29) {
      xpc_dictionary_set_value(v15, "Protocol", v29);
    }
  }
  xpc_dictionary_set_int64(v15, "Error", a6);
  uint64_t v30 = [v11 connection];
  xpc_connection_send_message(v30, v15);
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = daemon_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v8 kind];
    id v12 = (void *)v11;
    if ((unint64_t)(a4 - 1) > 0xE) {
      CFStringRef v13 = @"?";
    }
    else {
      CFStringRef v13 = off_1008CE090[a4 - 1];
    }
    *(_DWORD *)buf = 134218754;
    id v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    __int16 v35 = 2112;
    CFStringRef v36 = v13;
    __int16 v37 = 2048;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SFOperationCallBack (<%p>{kind = %@}, event = %@, results = %p)", buf, 0x2Au);
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v15 = [(SharingDaemon *)self xpcObjectForSFOperationResults:v9];
  xpc_dictionary_set_uint64(v14, "Events", a4);
  v16 = [v8 connection];
  if (v15)
  {
    if (a4 == 1)
    {
      uint64_t v17 = kSFOperationHTTPServerConnectionKey;
      unsigned int v18 = [v9 objectForKeyedSubscript:kSFOperationHTTPServerConnectionKey];

      if (v18)
      {
        uint64_t v30 = v17;
        v19 = +[NSUUID UUID];
        v20 = [v19 UUIDString];

        uint64_t v29 = kSFOperationContactsOnlyKey;
        CFDictionaryRef v21 = [v9 objectForKeyedSubscript:];
        id v22 = v20;
        xpc_dictionary_set_string(v15, "Operation", (const char *)[v22 UTF8String]);
        v23 = [SDNetworkOperation alloc];
        v24 = [(SDNetworkOperation *)v23 initWithKind:kSFOperationKindReceiver];
        id v25 = v24;
        if (v21) {
          [(SDNetworkOperation *)v24 setProperty:v21 forKey:v29];
        }
        [(SDNetworkOperation *)v25 setProperty:sub_1001B3F50(v16) forKey:kSFOperationBundleIDKey];
        [(SDNetworkOperation *)v25 setProperty:v18 forKey:v30];
        [(SDNetworkOperation *)v25 setProperty:v22 forKey:kSFOperationSessionIDKey];
        [(NSMutableDictionary *)self->_exportedOperations setObject:v25 forKeyedSubscript:v22];
        [(NSMutableSet *)self->_activeObjects addObject:v25];
        [(SDNetworkOperation *)v25 setObjectKey:v22];
        [(SDNetworkOperation *)v25 setDelegate:self];
        [(SDNetworkOperation *)v25 resume];
      }
    }
    xpc_dictionary_set_value(v14, "Results", v15);
  }
  v26 = [v8 kind];
  unsigned int v27 = [v26 isEqualToString:kSFOperationKindController];

  if (v27 && ![(SharingDaemon *)self canAccessAirDropSettings:v16])
  {
    v28 = airdrop_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10013A888(v16, v28);
    }
  }
  else
  {
    xpc_connection_send_message((xpc_connection_t)v16, v14);
  }
}

- (void)handleBrowserMessage:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  CFTypeID v7 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v6, "Function");
  if (string)
  {
    id v9 = string;
    if (!strcmp(string, "Create"))
    {
      v10 = xpc_dictionary_get_value(v6, "Kind");
      uint64_t v11 = [(SharingDaemon *)self stringFromXPCObject:v10];
      if (v11)
      {
        CFStringRef v13 = xpc_dictionary_get_value(v6, "Node");
        if (v13 && (uint64_t v14 = _SFNodeCreateWithXPCObject()) != 0)
        {
          xpc_object_t v15 = (const void *)v14;
          v16 = [[SDNetworkBrowser alloc] initWithKind:v11 rootNode:v14];
          xpc_connection_set_context(v7, v16);
          [(NSMutableSet *)self->_activeObjects addObject:v16];
          [(SDNetworkBrowser *)v16 setConnection:v7];
          [(SDNetworkBrowser *)v16 setBoostMessage:v6];
          [(SDNetworkBrowser *)v16 setDelegate:self];
          CFRelease(v15);
        }
        else
        {
          id v22 = daemon_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10013A97C();
          }
        }
      }
      else
      {
        CFStringRef v13 = daemon_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10013A948();
        }
      }

      goto LABEL_45;
    }
    v10 = xpc_connection_get_context(v7);
    if (!v10)
    {
      uint64_t v11 = daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10013A9B0();
      }
      goto LABEL_45;
    }
    uint64_t v11 = xpc_dictionary_get_value(v6, "Node");
    if (v11) {
      id v12 = (const void *)_SFNodeCreateWithXPCObject();
    }
    else {
      id v12 = 0;
    }
    if (!strcmp(v9, "OpenNode"))
    {
      unsigned int v18 = xpc_dictionary_get_value(v6, "Protocol");
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Flags");
      v20 = [(SharingDaemon *)self stringFromXPCObject:v18];
      if ([v10 openNode:v12 forProtocol:v20 flags:uint64])
      {
        CFDictionaryRef v21 = daemon_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10013A9E4();
        }
      }
    }
    else if (!strcmp(v9, "CloseNode"))
    {
      if (![v10 closeNode:v12]) {
        goto LABEL_43;
      }
      unsigned int v18 = daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10013AA4C();
      }
    }
    else if (!strcmp(v9, "AddNode"))
    {
      if (![v10 addNode:v12]) {
        goto LABEL_43;
      }
      unsigned int v18 = daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10013AAB4();
      }
    }
    else if (!strcmp(v9, "RemoveNode"))
    {
      if (![v10 removeNode:v12]) {
        goto LABEL_43;
      }
      unsigned int v18 = daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10013AB1C();
      }
    }
    else
    {
      if (!strcmp(v9, "SetMode"))
      {
        [v10 setMode:xpc_dictionary_get_uint64(v6, "Mode")];
        if (!v12) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
      if (strcmp(v9, "SetOptions"))
      {
LABEL_43:
        if (!v12)
        {
LABEL_45:

          goto LABEL_46;
        }
LABEL_44:
        CFRelease(v12);
        goto LABEL_45;
      }
      uint64_t v17 = xpc_dictionary_get_dictionary(v6, "Options");
      unsigned int v18 = _CFXPCCreateCFObjectFromXPCObject();

      [v10 setOptions:v18];
    }

    goto LABEL_43;
  }
  v10 = daemon_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10013A914();
  }
LABEL_46:
}

- (void)handleOperationMessage:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  CFTypeID v7 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v6, "Function");
  if (!string)
  {
    v10 = daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10013AB84();
    }
    goto LABEL_54;
  }
  id v9 = string;
  if (!strcmp(string, "Create"))
  {
    uint64_t v17 = xpc_dictionary_get_string(v6, "Operation");
    if (!v17)
    {
      v10 = xpc_dictionary_get_value(v6, "Kind");
      uint64_t v11 = [(SharingDaemon *)self stringFromXPCObject:v10];
      if (!v11)
      {
        CFDictionaryRef v21 = daemon_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10013ABB8();
        }

        goto LABEL_53;
      }
      uint64_t v14 = [[SDNetworkOperation alloc] initWithKind:v11];
      xpc_connection_set_context(v7, v14);
      [(NSMutableSet *)self->_activeObjects addObject:v14];
      [(SDNetworkOperation *)v14 setConnection:v7];
      [(SDNetworkOperation *)v14 setBoostMessage:v6];
      [(SDNetworkOperation *)v14 setDelegate:self];
LABEL_52:

LABEL_53:
      goto LABEL_54;
    }
    exportedOperations = self->_exportedOperations;
    v19 = +[NSString stringWithUTF8String:v17];
    v10 = [(NSMutableDictionary *)exportedOperations objectForKeyedSubscript:v19];

    if (v10)
    {
      xpc_connection_set_context(v7, v10);
      [v10 setBoostMessage:v6];
      [v10 setConnection:v7];
      goto LABEL_54;
    }
    v20 = daemon_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10013ABEC();
    }
LABEL_23:

    goto LABEL_54;
  }
  v10 = xpc_connection_get_context(v7);
  if (!v10)
  {
    v20 = daemon_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10013AC20();
    }
    goto LABEL_23;
  }
  if (!strcmp(v9, "Resume"))
  {
    [v10 resume];
  }
  else if (!strcmp(v9, "SetProperty"))
  {
    uint64_t v11 = xpc_dictionary_get_value(v6, "Name");
    id v12 = [(SharingDaemon *)self stringFromXPCObject:v11];
    if (!v12)
    {
      daemon_log();
      uint64_t v14 = (SDNetworkOperation *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
        sub_10013AC54();
      }
      goto LABEL_52;
    }
    CFStringRef v13 = v12;
    xpc_dictionary_get_value(v6, "Value");
    uint64_t v14 = (SDNetworkOperation *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (CFEqual(v13, kSFOperationNodeKey))
      {
        uint64_t v15 = _SFNodeCreateWithXPCObject();
LABEL_10:
        CGImageRef v16 = (CGImageRef)v15;
LABEL_39:
        if ((CFEqual(v13, kSFOperationDiscoverableModeKey)
           || CFEqual(v13, kSFOperationLegacyModeEnabledKey)
           || CFEqual(v13, kSFOperationWirelessEnabledKey)
           || CFEqual(v13, kSFOperationBluetoothEnabledKey)
           || CFEqual(v13, kSFOperationWirelessAccessPointKey)
           || CFEqual(v13, kSFOperationAirplaneModeEnabledKey))
          && ![(SharingDaemon *)self canAccessAirDropSettings:v7])
        {
          v26 = airdrop_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_10013AC88(v7, v26);
          }
        }
        else
        {
          [v10 setProperty:v16 forKey:v13];
        }
        if (v16) {
          CFRelease(v16);
        }
        goto LABEL_52;
      }
      if (!CFEqual(v13, kSFOperationFileIconKey) && !CFEqual(v13, kSFOperationSmallFileIconKey))
      {
        uint64_t v15 = _CFXPCCreateCFObjectFromXPCObject();
        goto LABEL_10;
      }
      CFDataRef v22 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject();
      if (v22)
      {
        CFDataRef v23 = v22;
        CFTypeID v24 = CFGetTypeID(v22);
        if (v24 == CFDataGetTypeID())
        {
          CGImageRef v16 = sub_1000D8A7C(v23);
        }
        else
        {
          id v25 = daemon_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10013AD14();
          }

          CGImageRef v16 = 0;
        }
        CFRelease(v23);
        goto LABEL_39;
      }
    }
    CGImageRef v16 = 0;
    goto LABEL_39;
  }
LABEL_54:
}

- (void)handleNewConnection:(id)a3
{
  xpc_object_t v4 = (_xpc_connection_s *)a3;
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100139444;
  v6[3] = &unk_1008CE010;
  CFTypeID v7 = v4;
  id v8 = self;
  id v5 = v4;
  xpc_connection_set_event_handler(v5, v6);
  xpc_connection_resume(v5);
}

- (NSString)description
{
  NSAppendPrintF();
  id v14 = 0;
  id v3 = +[SDStatusMonitor sharedMonitor];
  uint64_t v11 = [v3 deviceInformation];
  NSAppendPrintF();
  id v4 = v14;

  id v5 = +[SDServerBrowser sharedBrowser];
  id v12 = [v5 description];
  NSAppendPrintF();
  id v6 = v4;

  airDropService = self->_airDropService;
  if (airDropService)
  {
    CFStringRef v13 = [(SDAirDropService_objc *)airDropService description];
    NSAppendPrintF();
    id v8 = v6;

    id v6 = v8;
  }
  NSAppendPrintF();
  id v9 = v6;

  return (NSString *)v9;
}

- (os_state_data_s)stateCapture
{
  v2 = [(SharingDaemon *)self description];
  if (v2)
  {
    id v3 = +[NSPropertyListSerialization dataWithPropertyList:v2 format:200 options:0 error:0];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 length];
      id v6 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v5 + 200, 0xED4D4DCDuLL);
      CFTypeID v7 = v6;
      if (v6)
      {
        v6->var0 = 1;
        v6->var1.var1 = v5;
        __strlcpy_chk();
        memcpy(v7->var4, [v4 bytes], (size_t)v5);
      }
    }
    else
    {
      CFTypeID v7 = 0;
    }
  }
  else
  {
    CFTypeID v7 = 0;
  }

  return v7;
}

- (void)start
{
  +[NSURLSession _disableAppSSO];
  gSFRunningInSharingD = 1;
  id v3 = +[SDXPCSession sharedSession];
  [v3 start];

  if (!self->_listener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.sharingd", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    listener = self->_listener;
    self->_listener = mach_service;

    id v6 = self->_listener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10013A120;
    handler[3] = &unk_1008CE038;
    handler[4] = self;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(self->_listener);
  }
  CFTypeID v7 = +[SDStatusMonitor sharedMonitor];
  char v8 = SFIsDeviceAudioAccessory();
  id v9 = daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 deviceInformation];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device Information: %@", (uint8_t *)&buf, 0xCu);
  }
  if ((v8 & 1) == 0)
  {
    if (!self->_unlockKeyManager)
    {
      uint64_t v11 = +[SDUnlockKeyManager sharedKeyManager];
      unlockKeyManager = self->_unlockKeyManager;
      self->_unlockKeyManager = v11;
    }
    if (!self->_activityAdvertiser)
    {
      CFStringRef v13 = +[SDActivityAdvertiser sharedAdvertiser];
      activityAdvertiser = self->_activityAdvertiser;
      self->_activityAdvertiser = v13;

      [(SDActivityAdvertiser *)self->_activityAdvertiser start];
    }
    if (!self->_activityScanner)
    {
      uint64_t v15 = +[SDActivityScanner sharedScanner];
      activityScanner = self->_activityScanner;
      self->_activityScanner = v15;

      [(SDActivityScanner *)self->_activityScanner start];
    }
    if (!self->_encryptionManager)
    {
      uint64_t v17 = +[SDActivityEncryptionManager sharedEncryptionManager];
      encryptionManager = self->_encryptionManager;
      self->_encryptionManager = v17;
    }
    if (!self->_payloadManager)
    {
      v19 = +[SDActivityPayloadManager sharedPayloadManager];
      payloadManager = self->_payloadManager;
      self->_payloadManager = v19;
    }
    if (GestaltGetDeviceClass() == 6) {
      int v21 = _os_feature_enabled_impl();
    }
    else {
      int v21 = 1;
    }
    if (!self->_airDropService && v21)
    {
      CFDataRef v22 = objc_alloc_init(SDAirDropService_objc);
      airDropService = self->_airDropService;
      self->_airDropService = v22;

      [(SDAirDropService_objc *)self->_airDropService start];
    }
    if (!self->_sharesheetManager)
    {
      CFTypeID v24 = +[SDShareSheetSlotManager sharedManager];
      sharesheetManager = self->_sharesheetManager;
      self->_sharesheetManager = v24;

      [(SDShareSheetSlotManager *)self->_sharesheetManager activate];
    }
    if (!self->_sharesheetUserDefaultsServer)
    {
      v26 = objc_alloc_init(SDShareSheetUserDefaultsServer);
      sharesheetUserDefaultsServer = self->_sharesheetUserDefaultsServer;
      self->_sharesheetUserDefaultsServer = v26;

      [(SDShareSheetUserDefaultsServer *)self->_sharesheetUserDefaultsServer activate];
    }
    if (!self->_accessibilityServer)
    {
      v28 = objc_alloc_init(SDAccessibilityServer);
      accessibilityServer = self->_accessibilityServer;
      self->_accessibilityServer = v28;

      [(SDAccessibilityServer *)self->_accessibilityServer activate];
    }
    if (!self->_sharesheetRecipientServer)
    {
      uint64_t v30 = objc_alloc_init(SDShareSheetRecipientServer);
      sharesheetRecipientServer = self->_sharesheetRecipientServer;
      self->_sharesheetRecipientServer = v30;

      [(SDShareSheetRecipientServer *)self->_sharesheetRecipientServer activate];
    }
    if (!self->_collaborationUserDefaultsServer)
    {
      id v32 = objc_alloc_init(SDCollaborationUserDefaultsServer);
      collaborationUserDefaultsServer = self->_collaborationUserDefaultsServer;
      self->_collaborationUserDefaultsServer = v32;

      [(SDXPCDaemon *)self->_collaborationUserDefaultsServer _activate];
    }
    if (!self->_subCredentialAgent)
    {
      uint64_t v34 = +[SDSubCredentialAgent sharedAgent];
      subCredentialAgent = self->_subCredentialAgent;
      self->_subCredentialAgent = v34;

      [(SDSubCredentialAgent *)self->_subCredentialAgent activate];
    }
    if (!self->_broadwayAgent)
    {
      CFStringRef v36 = +[SDBroadwayAgent sharedAgent];
      broadwayAgent = self->_broadwayAgent;
      self->_broadwayAgent = v36;

      [(SDBroadwayAgent *)self->_broadwayAgent activate];
    }
    if (!self->_autoUnlockSessionManager)
    {
      id v38 = +[SDAutoUnlockSessionManager sharedManager];
      autoUnlockSessionManager = self->_autoUnlockSessionManager;
      self->_autoUnlockSessionManager = v38;

      [(SDAutoUnlockSessionManager *)self->_autoUnlockSessionManager start];
    }
    if (!self->_hotspotAgent && (SFIsDeviceAppleTV() & 1) == 0)
    {
      v40 = +[SDHotspotAgent sharedAgent];
      hotspotAgent = self->_hotspotAgent;
      self->_hotspotAgent = v40;

      [(SDHotspotAgent *)self->_hotspotAgent activate];
    }
    if (!self->_deviceAssetMonitor)
    {
      v42 = +[SDDeviceAssetMonitor sharedAssetMonitor];
      deviceAssetMonitor = self->_deviceAssetMonitor;
      self->_deviceAssetMonitor = v42;
    }
    if (!self->_pairedDeviceAgent)
    {
      v44 = +[SDPairedDeviceAgent sharedAgent];
      pairedDeviceAgent = self->_pairedDeviceAgent;
      self->_pairedDeviceAgent = v44;

      [(SDPairedDeviceAgent *)self->_pairedDeviceAgent activate];
    }
    v46 = +[SDAuthenticationManager shared];
    [v46 start];
  }
  if (!self->_xpcServer)
  {
    v47 = objc_alloc_init(SDXPCServer);
    xpcServer = self->_xpcServer;
    self->_xpcServer = v47;

    LODWORD(buf) = 0;
    uint64_t Int64 = CFPrefs_GetInt64();
    if (buf)
    {
      BOOL v50 = Int64 != 0;
      char v51 = GestaltGetDeviceClass() == 6 || v50;
      if ((v51 & 1) == 0) {
        goto LABEL_57;
      }
    }
    else if (!Int64)
    {
LABEL_57:
      [(SDXPCServer *)self->_xpcServer activate];
      goto LABEL_58;
    }
    v52 = daemon_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "SharingServices using high priority queue", v76, 2u);
    }

    v53 = SFHighPriorityQueue();
    [(SDXPCServer *)self->_xpcServer setDispatchQueue:v53];

    goto LABEL_57;
  }
LABEL_58:
  if (!self->_stateHandle)
  {
    v70 = _NSConcreteStackBlock;
    uint64_t v71 = 3221225472;
    v72 = sub_10013A1F4;
    v73 = &unk_1008CAAA0;
    v74 = self;
    self->_stateHandle = os_state_add_handler();
  }
  if (objc_msgSend(v7, "isAirDropAvailable", v70, v71, v72, v73, v74) && !self->_airdropAlertManager)
  {
    v54 = (_TtC16DaemoniOSLibrary21SDAirDropAlertManager *)objc_opt_new();
    airdropAlertManager = self->_airdropAlertManager;
    self->_airdropAlertManager = v54;

    [(SDAirDropAlertManager *)self->_airdropAlertManager activate];
  }
  v56 = +[SDB332SetupAgent shared];
  [v56 activate];

  v57 = +[SDB389SetupAgent shared];
  [v57 activate];

  v58 = +[SDHUDManager shared];
  [v58 start];

  *(void *)v76 = 0;
  v77 = v76;
  uint64_t v78 = 0x2050000000;
  v59 = (void *)qword_1009800B8;
  uint64_t v79 = qword_1009800B8;
  if (!qword_1009800B8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v81 = sub_10013A558;
    v82 = &unk_1008CA038;
    v83 = v76;
    sub_10013A558((uint64_t)&buf);
    v59 = (void *)*((void *)v77 + 3);
  }
  id v60 = v59;
  _Block_object_dispose(v76, 8);
  if (qword_1009800B0 == -1)
  {
    if (!v60) {
      goto LABEL_70;
    }
  }
  else
  {
    dispatch_once(&qword_1009800B0, &stru_1008CE058);
    if (!v60) {
      goto LABEL_70;
    }
  }
  if (byte_100967F98)
  {
    v61 = [v60 sharedInstance];
    [v61 start];
    goto LABEL_72;
  }
LABEL_70:
  v61 = daemon_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    sub_10013AEF4(v61, v62, v63, v64, v65, v66, v67, v68);
  }
LABEL_72:

  [(SharingDaemon *)self _performMigrations];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sharingd.daemon.started", 0, 0, 1u);
}

- (void)_performMigrations
{
}

- (void)stop
{
  xpcServer = self->_xpcServer;
  if (xpcServer)
  {
    [(SDXPCServer *)xpcServer invalidate];
    id v4 = self->_xpcServer;
    self->_xpcServer = 0;
  }
  deviceAssetMonitor = self->_deviceAssetMonitor;
  if (deviceAssetMonitor)
  {
    self->_deviceAssetMonitor = 0;
  }
  pairedDeviceAgent = self->_pairedDeviceAgent;
  if (pairedDeviceAgent)
  {
    self->_pairedDeviceAgent = 0;

    [(SDPairedDeviceAgent *)self->_pairedDeviceAgent invalidate];
  }
  activityScanner = self->_activityScanner;
  if (activityScanner)
  {
    [(SDActivityScanner *)activityScanner stop];
    char v8 = self->_activityScanner;
    self->_activityScanner = 0;
  }
  activityAdvertiser = self->_activityAdvertiser;
  if (activityAdvertiser)
  {
    [(SDActivityAdvertiser *)activityAdvertiser stop];
    v10 = self->_activityAdvertiser;
    self->_activityAdvertiser = 0;
  }
  encryptionManager = self->_encryptionManager;
  if (encryptionManager)
  {
    self->_encryptionManager = 0;
  }
  payloadManager = self->_payloadManager;
  if (payloadManager)
  {
    self->_payloadManager = 0;
  }
  broadwayAgent = self->_broadwayAgent;
  if (broadwayAgent)
  {
    [(SDBroadwayAgent *)broadwayAgent invalidate];
    id v14 = self->_broadwayAgent;
    self->_broadwayAgent = 0;
  }
  airDropService = self->_airDropService;
  if (airDropService)
  {
    [(SDAirDropService_objc *)airDropService stop];
    CGImageRef v16 = self->_airDropService;
    self->_airDropService = 0;
  }
  sharesheetManager = self->_sharesheetManager;
  if (sharesheetManager)
  {
    [(SDShareSheetSlotManager *)sharesheetManager invalidate];
    unsigned int v18 = self->_sharesheetManager;
    self->_sharesheetManager = 0;
  }
  accessibilityServer = self->_accessibilityServer;
  if (accessibilityServer)
  {
    [(SDAccessibilityServer *)accessibilityServer invalidate];
    v20 = self->_accessibilityServer;
    self->_accessibilityServer = 0;
  }
  sharesheetUserDefaultsServer = self->_sharesheetUserDefaultsServer;
  if (sharesheetUserDefaultsServer)
  {
    [(SDShareSheetUserDefaultsServer *)sharesheetUserDefaultsServer invalidate];
    CFDataRef v22 = self->_sharesheetUserDefaultsServer;
    self->_sharesheetUserDefaultsServer = 0;
  }
  sharesheetRecipientServer = self->_sharesheetRecipientServer;
  if (sharesheetRecipientServer)
  {
    [(SDShareSheetRecipientServer *)sharesheetRecipientServer invalidate];
    CFTypeID v24 = self->_sharesheetRecipientServer;
    self->_sharesheetRecipientServer = 0;
  }
  collaborationUserDefaultsServer = self->_collaborationUserDefaultsServer;
  if (collaborationUserDefaultsServer)
  {
    [(SDXPCDaemon *)collaborationUserDefaultsServer _invalidate];
    v26 = self->_collaborationUserDefaultsServer;
    self->_collaborationUserDefaultsServer = 0;
  }
  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);
    v28 = self->_listener;
    self->_listener = 0;
  }
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
  activeObjects = self->_activeObjects;

  [(NSMutableSet *)activeObjects removeAllObjects];
}

- (BOOL)canAccessAirDropSettings:(id)a3
{
  return xpc_connection_has_entitlement();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_unlockLockManager, 0);
  objc_storeStrong((id *)&self->_unlockKeyManager, 0);
  objc_storeStrong((id *)&self->_payloadManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pairedDeviceAgent, 0);
  objc_storeStrong((id *)&self->_airdropAlertManager, 0);
  objc_storeStrong((id *)&self->_deviceAssetMonitor, 0);
  objc_storeStrong((id *)&self->_hotspotAgent, 0);
  objc_storeStrong((id *)&self->_exportedOperations, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_autoUnlockSessionManager, 0);
  objc_storeStrong((id *)&self->_sharesheetManager, 0);
  objc_storeStrong((id *)&self->_broadwayAgent, 0);
  objc_storeStrong((id *)&self->_subCredentialAgent, 0);
  objc_storeStrong((id *)&self->_collaborationUserDefaultsServer, 0);
  objc_storeStrong((id *)&self->_sharesheetRecipientServer, 0);
  objc_storeStrong((id *)&self->_accessibilityServer, 0);
  objc_storeStrong((id *)&self->_sharesheetUserDefaultsServer, 0);
  objc_storeStrong((id *)&self->_airDropService, 0);
  objc_storeStrong((id *)&self->_activityScanner, 0);
  objc_storeStrong((id *)&self->_activityAdvertiser, 0);

  objc_storeStrong((id *)&self->_activeObjects, 0);
}

@end