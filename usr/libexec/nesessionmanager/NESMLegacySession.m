@interface NESMLegacySession
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (int)type;
- (void)dealloc;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleDeviceLock;
- (void)handleDeviceUnlock;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleSecuritySessionInfoRequest:(id)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)install;
- (void)uninstall;
@end

@implementation NESMLegacySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userOptions, 0);
  objc_storeStrong((id *)&self->_agentPIDs, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

- (void)handleInitializeState
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NESMSession *)v2 configuration];
  v4 = [v3 identifier];
  v5 = [v4 UUIDString];
  v6 = +[NSString stringWithFormat:@"%@:%d", v5, [(NESMLegacySession *)v2 type]];
  [(NESMSession *)v2 setAuxiliaryDataKey:v6];

  [(NESMSession *)v2 setupFromAuxiliaryData];
  v7 = [(NESMSession *)v2 lastDisconnectError];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 domain];
    unsigned int v10 = [v9 isEqualToString:@"NEVPNConnectionErrorDomainIPSec"];

    if (v10)
    {
      CFStringRef v16 = @"LastCause";
      v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
      v17 = v11;
      v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100061B88;
      v14[3] = &unk_1000C6C38;
      v14[4] = v2;
      id v13 = v12;
      id v15 = v13;
      sub_100061C1C((uint64_t)v2, v14);
    }
  }

  objc_sync_exit(v2);
}

- (void)handleInstalledAppsChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100063AF0;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (void)handleDeviceUnlock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10006430C;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (void)handleDeviceLock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100064408;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (void)handleUserSwitch
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100064504;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (void)handleUserLogout
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100064600;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v4 VPN];
      *(_DWORD *)buf = 138412546;
      CFStringRef v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = [v6 isEnabled];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: enabled = %d", buf, 0x12u);
    }
    v14.receiver = self;
    v14.super_class = (Class)NESMLegacySession;
    if ([(NESMSession *)&v14 handleUpdateConfiguration:v4])
    {
      if (self && self->_sessionType == 2)
      {
        v7 = [(NESMSession *)self configuration];
        v8 = [v7 appVPN];
        unsigned int v10 = [v8 protocol];
      }
      else
      {
        v7 = [(NESMSession *)self configuration];
        v8 = [v7 VPN];
        unsigned int v10 = [v8 protocol];
        if (!self)
        {
LABEL_11:

          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100064890;
          v13[3] = &unk_1000C6C60;
          v13[4] = self;
          sub_100061C1C((uint64_t)self, v13);
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      objc_setProperty_atomic(self, v9, v10, 360);
      goto LABEL_11;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (void)uninstall
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10006498C;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (void)install
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100064BA4;
  v2[3] = &unk_1000C6C60;
  v2[4] = self;
  sub_100061C1C((uint64_t)self, v2);
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000663D4;
  v6[3] = &unk_1000C6E00;
  int v9 = a4;
  id v7 = a3;
  v8 = self;
  id v5 = v7;
  sub_100061C1C((uint64_t)self, v6);
}

- (void)handleSecuritySessionInfoRequest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000667A4;
  v5[3] = &unk_1000C6C38;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  sub_100061C1C((uint64_t)self, v5);
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NESMLegacySession;
  [(NESMSession *)&v13 handleChangeEventForInterface:v8 newFlags:a4 previousFlags:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006696C;
  v10[3] = &unk_1000C6930;
  v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a4;
  id v9 = v8;
  sub_100061C1C((uint64_t)self, v10);
}

- (void)handleWakeup
{
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066E8C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100066E98;
  v4[3] = &unk_1000C6C60;
  v4[4] = self;
  sub_100061C1C((uint64_t)self, v4);
}

- (void)handleSleepTime:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100066F88;
  v3[3] = &unk_1000C6B78;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  sub_100061C1C((uint64_t)self, v3);
}

- (BOOL)handleSleep
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006707C;
  v3[3] = &unk_1000C6C60;
  v3[4] = self;
  sub_100061C1C((uint64_t)self, v3);
  return 1;
}

- (void)handleStopMessageWithReason:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NESMLegacySession;
  [(NESMSession *)&v5 handleStopMessageWithReason:*(void *)&a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000671CC;
  v4[3] = &unk_1000C6C60;
  v4[4] = self;
  sub_100061C1C((uint64_t)self, v4);
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  objc_super v5 = xpc_dictionary_get_value(v4, "SessionOptions");
  if (qword_1000D7C30 != -1) {
    dispatch_once(&qword_1000D7C30, &stru_1000C63A0);
  }
  v65.receiver = self;
  v65.super_class = (Class)NESMLegacySession;
  -[NESMSession handleStartMessage:](&v65, "handleStartMessage:", v4, qword_1000D7C28);
  id v6 = NSCharacterSet_ptr;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (isa_nsdictionary())
    {
      id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v7];

      if (v8) {
        goto LABEL_12;
      }
    }
    else
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to convert the XPC options dictionary to a CFDictionary", buf, 2u);
      }
    }
  }
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
LABEL_12:
  v59 = v4;
  unsigned int v10 = [v8 objectForKeyedSubscript:@"OutgoingInterface"];
  if ((isa_nsstring() & 1) == 0)
  {
    id v11 = [(NESMSession *)self server];
    unint64_t v12 = [v11 primaryPhysicalInterface];

    if (!v12) {
      goto LABEL_16;
    }
    unsigned int v10 = [(NESMSession *)self server];
    objc_super v13 = [v10 primaryPhysicalInterface];
    objc_super v14 = [v13 interfaceName];
    [v8 setObject:v14 forKeyedSubscript:@"OutgoingInterface"];
  }
LABEL_16:
  id v15 = v8;
  __int16 v17 = v15;
  v58 = v5;
  if (!self)
  {

    id v51 = 0;
    id Property = 0;
    goto LABEL_73;
  }
  unsigned int v18 = (char *)[objc_getProperty(self, v16, 360, 1) type];
  v20 = [objc_getProperty(self, v19, 360, 1) passwordKeychainItem];
  v61 = [objc_getProperty(self, v21, 360, 1) username];
  if (v17)
  {
    v22 = [v17 objectForKeyedSubscript:kSCEntNetIPSec];
    if (isa_nsdictionary()) {
      id v23 = [v22 mutableCopy];
    }
    else {
      id v23 = 0;
    }
    v25 = [v17 objectForKeyedSubscript:kSCEntNetPPP];

    if (isa_nsdictionary()) {
      id v24 = [v25 mutableCopy];
    }
    else {
      id v24 = 0;
    }

    id v6 = NSCharacterSet_ptr;
    if (v23)
    {
      if (v24) {
        goto LABEL_27;
      }
LABEL_30:
      id v24 = objc_alloc_init((Class)v6[11]);
      if (v20) {
        goto LABEL_28;
      }
      goto LABEL_31;
    }
  }
  else
  {
    id v24 = 0;
  }
  id v23 = objc_alloc_init((Class)v6[11]);
  if (!v24) {
    goto LABEL_30;
  }
LABEL_27:
  if (v20)
  {
LABEL_28:
    id v60 = [v20 copyPassword];
    goto LABEL_32;
  }
LABEL_31:
  id v60 = 0;
LABEL_32:
  if ((unint64_t)(v18 - 1) <= 1)
  {
    uint64_t v27 = [objc_getProperty(self, v26, 360, 1) sharedSecretKeychainItem];

    v20 = (void *)v27;
  }
  if (v20) {
    id v28 = [v20 copyPassword];
  }
  else {
    id v28 = 0;
  }
  if (v61)
  {
    if (v18 == (char *)1)
    {
      CFStringRef v29 = kSCPropNetIPSecXAuthName;
      v30 = [v23 objectForKeyedSubscript:kSCPropNetIPSecXAuthName];
      char v31 = isa_nsstring();

      if (v31) {
        goto LABEL_45;
      }
      v32 = v23;
      goto LABEL_44;
    }
    if (v18 == (char *)2)
    {
      CFStringRef v29 = kSCPropNetPPPAuthName;
      v33 = [v24 objectForKeyedSubscript:kSCPropNetPPPAuthName];
      char v34 = isa_nsstring();

      if ((v34 & 1) == 0)
      {
        v32 = v24;
LABEL_44:
        [v32 setObject:v61 forKeyedSubscript:v29];
      }
    }
  }
LABEL_45:
  if (v60)
  {
    if (v18 == (char *)1)
    {
      CFStringRef v35 = kSCPropNetIPSecXAuthPassword;
      v36 = [v23 objectForKeyedSubscript:kSCPropNetIPSecXAuthPassword];
      char v37 = isa_nsstring();

      if ((v37 & 1) == 0)
      {
        v38 = v23;
LABEL_52:
        [v38 setObject:v60 forKeyedSubscript:v35];
      }
    }
    else if (v18 == (char *)2)
    {
      CFStringRef v35 = kSCPropNetPPPAuthPassword;
      v39 = [v24 objectForKeyedSubscript:kSCPropNetPPPAuthPassword];
      char v40 = isa_nsstring();

      if ((v40 & 1) == 0)
      {
        v38 = v24;
        goto LABEL_52;
      }
    }
  }
  if (v28)
  {
    v41 = [v23 objectForKeyedSubscript:kSCPropNetIPSecSharedSecret];
    char v42 = isa_nsstring();

    if ((v42 & 1) == 0) {
      [v23 setObject:v28 forKeyedSubscript:kSCPropNetIPSecSharedSecret];
    }
  }
  if (v17 && v18 == (char *)1)
  {
    if (!v23) {
      id v23 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v43 = [v17 objectForKeyedSubscript:NEVPNConnectionStartOptionUsername];
    int v44 = isa_nsstring();

    if (v44)
    {
      v45 = [v17 objectForKeyedSubscript:NEVPNConnectionStartOptionUsername];
      [v23 setObject:v45 forKeyedSubscript:kSCPropNetIPSecXAuthName];
    }
    v46 = [v17 objectForKeyedSubscript:NEVPNConnectionStartOptionPassword];
    int v47 = isa_nsstring();

    if (v47)
    {
      v48 = [v17 objectForKeyedSubscript:NEVPNConnectionStartOptionPassword];
      [v23 setObject:v48 forKeyedSubscript:kSCPropNetIPSecXAuthName];
    }
    *(void *)buf = NEVPNConnectionStartOptionPassword;
    v67 = NEVPNConnectionStartOptionUsername;
    v49 = +[NSArray arrayWithObjects:buf count:2];
    [v17 removeObjectsForKeys:v49];
  }
  else if (!v17)
  {
    if ([v23 count] || objc_msgSend(v24, "count")) {
      id v50 = objc_alloc_init((Class)NSMutableDictionary);
    }
    else {
      id v50 = 0;
    }
    goto LABEL_67;
  }
  id v50 = v17;
LABEL_67:
  if ([v24 count]) {
    [v50 setObject:v24 forKeyedSubscript:kSCEntNetPPP];
  }
  if (v23 && [v23 count]) {
    [v50 setObject:v23 forKeyedSubscript:kSCEntNetIPSec];
  }
  id v51 = v50;

  id Property = objc_getProperty(self, v52, 360, 1);
LABEL_73:
  if ([Property type] == (id)2)
  {
    int v55 = xpc_dictionary_copy_mach_send();
    int v56 = xpc_dictionary_copy_mach_send();
  }
  else
  {
    int v55 = 0;
    int v56 = 0;
  }
  if (self) {
    objc_setProperty_atomic(self, v54, v51, 384);
  }
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_100067A24;
  v62[3] = &unk_1000C6380;
  v62[4] = self;
  v62[5] = v57;
  int v63 = v55;
  int v64 = v56;
  sub_100061C1C((uint64_t)self, v62);
}

- (void)dealloc
{
  if (self && self->_bridge)
  {
    if (qword_1000D7C30 != -1) {
      dispatch_once(&qword_1000D7C30, &stru_1000C63A0);
    }
    (*(void (**)(_ne_sm_bridge *))(qword_1000D7C28 + 8))(self->_bridge);
    self->_bridge = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NESMLegacySession;
  [(NESMSession *)&v3 dealloc];
}

- (int)type
{
  if (self) {
    LODWORD(self) = self->_sessionType;
  }
  return (int)self;
}

@end