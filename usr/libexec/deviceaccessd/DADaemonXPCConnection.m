@interface DADaemonXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)_entitledForAccessLevel:(int)a3 returnError:(id *)a4;
- (BOOL)_findSyncExtensionPoint:(id)a3 bundleID:(id)a4;
- (BOOL)entitled;
- (DADaemonServer)daemon;
- (NSString)appID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)accessLevel;
- (int)pid;
- (void)_xpcBluetoothAccessInfoGet:(id)a3;
- (void)_xpcBluetoothPairingMsg:(id)a3;
- (void)_xpcDADiscoveryActivate:(id)a3;
- (void)_xpcDADiscoveryInvalidateWithReason:(id)a3;
- (void)_xpcDADiscoveryMigrationComplete:(id)a3;
- (void)_xpcDASessionActivate:(id)a3;
- (void)_xpcDiagnosticShow:(id)a3;
- (void)_xpcGetAuthorizedAccessories:(id)a3;
- (void)_xpcGetAuthorizedDevices:(id)a3;
- (void)_xpcGetDevices:(id)a3;
- (void)_xpcGetPartialIPs:(id)a3;
- (void)_xpcModifyDeviceSettings:(id)a3;
- (void)_xpcRemoveDeviceAppAccessInfo:(id)a3;
- (void)_xpcRemoveDeviceConfirmation:(id)a3 accessInfo:(id)a4 userConfirmed:(BOOL)a5 request:(id)a6;
- (void)_xpcReportDAEvent:(id)a3;
- (void)_xpcSendEvent:(id)a3;
- (void)_xpcSendReply:(id)a3;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)_xpcSetDeviceAppAccessInfo:(id)a3;
- (void)_xpcSetDeviceState:(id)a3;
- (void)_xpcSetPartialIPs:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)reportDeviceChanged:(id)a3 appID:(id)a4 discovery:(BOOL)a5;
- (void)reportDevicesMigrated:(id)a3 appID:(id)a4;
- (void)reportDevicesPresentChanged:(BOOL)a3 appID:(id)a4;
- (void)reportDiscoveryEvent:(id)a3 appID:(id)a4;
- (void)reportRemovedDevice:(id)a3 appID:(id)a4 discovery:(BOOL)a5;
- (void)setAppID:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setXpcCnx:(id)a3;
- (void)xpcReceivedEvent:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
- (void)xpcReceivedRequest:(id)a3;
@end

@implementation DADaemonXPCConnection

- (id)description
{
  return [(DADaemonXPCConnection *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v10 = CUPrintPID();
  NSAppendPrintF();
  id v4 = 0;

  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    v11 = activatedDiscovery;
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  activatedSession = self->_activatedSession;
  if (activatedSession)
  {
    v12 = activatedSession;
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }

  return v4;
}

- (void)activate
{
  xpc_connection_get_audit_token();
  memset(v34, 0, sizeof(v34));
  v3 = +[LSBundleRecord bundleRecordForAuditToken:v34 error:0];
  id v4 = [v3 infoDictionary];
  v5 = [v4 objectForKey:@"NSAccessorySetupKitSupports" ofClass:objc_opt_class()];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v10 isEqualToString:@"Bluetooth"]) {
          self->_accessLevel = 4;
        }
        if ([v10 isEqualToString:@"WiFi"]) {
          self->_accessLevel = 4;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  v11 = (void *)xpc_copy_entitlement_for_token();
  v12 = v11;
  if (v11)
  {
    BOOL v13 = xpc_dictionary_get_BOOL(v11, "com.apple.DeviceAccess");
    if (v13) {
      int v14 = 6;
    }
    else {
      int v14 = 5;
    }
    self->_uint64_t entitledState = v14;
    if (v13) {
      self->_accessLevel = 7;
    }
    if (xpc_dictionary_get_BOOL(v12, "com.apple.DeviceAccess.private")) {
      self->_accessLevel = 10;
    }
  }
  uint64_t string = xpc_copy_code_signing_identity_for_token();
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001D218;
  v29[3] = &unk_10003D290;
  v29[4] = string;
  v16 = objc_retainBlock(v29);
  if (string) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v12 == 0;
  }
  if (!v17) {
    uint64_t string = (uint64_t)xpc_dictionary_get_string(v12, "application-identifier");
  }
  if (string)
  {
    v18 = +[NSString stringWithUTF8String:string];
    appID = self->_appID;
    self->_appID = v18;
  }
  if (dword_1000436E8 <= 20 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v20 = CUPrintPID();
    v21 = (void *)v20;
    uint64_t entitledState = self->_entitledState;
    if (entitledState >= 8)
    {
      if ((int)entitledState <= 9) {
        v23 = "?";
      }
      else {
        v23 = "User";
      }
    }
    else
    {
      v23 = off_10003D530[entitledState];
    }
    v27 = self->_appID;
    v28 = v23;
    uint64_t v26 = v20;
    LogPrintF();
  }
  v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid, v26, v27, v28);
  v25 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  +[DADeviceAccessAnalytics markSessionActivationForPid:v24 atTime:v25];

  ((void (*)(void *))v16[2])(v16);
}

- (void)invalidate
{
  connection = self->_xpcCnx;
  if (connection) {
    xpc_connection_cancel(connection);
  }
  v3 = self->_activatedDiscovery;
  if (v3)
  {
    if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      uint64_t v8 = v7 = v3;
      LogPrintF();
    }
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0;

    [(DADaemonServer *)self->_daemon removeDiscovery:v3];
    [(DADiscovery *)v3 invalidate];
  }
  v5 = self->_activatedSession;
  if (v5)
  {
    if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      uint64_t v8 = v7 = v5;
      LogPrintF();
    }
    [(DASession *)v5 invalidate];
    activatedSession = self->_activatedSession;
    self->_activatedSession = 0;
  }
  -[DADaemonServer xpcConnectionInvalidated:](self->_daemon, "xpcConnectionInvalidated:", self, v7, v8);
}

- (void)reportDeviceChanged:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  unsigned int v9 = [(DADaemonXPCConnection *)self accessLevel];
  v10 = [(DASession *)self->_activatedSession bundleID];
  if (!v10)
  {
    if (v5)
    {
      BOOL v13 = [(DADiscovery *)self->_activatedDiscovery configuration];
      v10 = [v13 bundleID];

      if (v10) {
        goto LABEL_2;
      }
    }
    else
    {
      v10 = 0;
    }
    if (v9 == 10)
    {
      v10 = 0;
      goto LABEL_14;
    }
  }
LABEL_2:
  if (self->_accessLevel == 4)
  {
    v11 = [v16 appAccessInfoMap];
    v12 = [v11 objectForKeyedSubscript:v10];
    if (v12)
    {
    }
    else
    {
      unsigned int v14 = [v10 isEqual:v8];

      if (!v14) {
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  if ([v10 isEqual:v8])
  {
LABEL_14:
    id v15 = [objc_alloc((Class)DADeviceEvent) initWithEventType:42 device:v16];
    [(DADaemonXPCConnection *)self _xpcReportDAEvent:v15];
  }
LABEL_15:
}

- (void)reportDevicesPresentChanged:(BOOL)a3 appID:(id)a4
{
  BOOL v4 = a3;
  activatedSession = self->_activatedSession;
  id v7 = a4;
  id v8 = [(DASession *)activatedSession bundleID];
  unsigned int v9 = v8;
  if (v8)
  {
    id v16 = v8;
  }
  else
  {
    v10 = [(DADiscovery *)self->_activatedDiscovery configuration];
    v11 = [v10 bundleID];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(DADiscovery *)self->_activatedDiscovery bundleID];
    }
    id v16 = v13;
  }
  unsigned int v14 = [v16 isEqual:v7];

  if (v14)
  {
    id v15 = [objc_alloc((Class)DAEventDevicesPresent) initWithPresent:v4 devicesMigrated:0];
    [(DADaemonXPCConnection *)self _xpcReportDAEvent:v15];
  }
}

- (void)reportDevicesMigrated:(id)a3 appID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(DADiscovery *)self->_activatedDiscovery configuration];
  unsigned int v8 = [(DADaemonXPCConnection *)self accessLevel];
  unsigned int v9 = [(DASession *)self->_activatedSession bundleID];
  if (!v9)
  {
    unsigned int v9 = [v7 bundleID];
    if (!v9 && v8 == 10)
    {
      unsigned int v9 = 0;
      goto LABEL_9;
    }
  }
  if ([v9 isEqual:v6]) {
LABEL_9:
  }
    [(DADaemonXPCConnection *)self _xpcReportDAEvent:v11];
}

- (void)reportDiscoveryEvent:(id)a3 appID:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(DADiscovery *)self->_activatedDiscovery configuration];
  if (([v7 presenceOnly] & 1) == 0)
  {
    unsigned int v8 = [(DASession *)self->_activatedSession bundleID];
    unsigned int v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v7 bundleID];
    }
    id v11 = v10;

    unsigned int v12 = [(DADaemonXPCConnection *)self accessLevel];
    if (v12 != 4 && (!v11 && v12 == 10 || [v11 isEqual:v6])) {
      [(DADaemonXPCConnection *)self _xpcReportDAEvent:v13];
    }
  }
}

- (void)reportRemovedDevice:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a3;
  id v8 = a4;
  unsigned int v9 = [(DADaemonXPCConnection *)self accessLevel];
  id v10 = [(DASession *)self->_activatedSession bundleID];
  if (!v10)
  {
    if (v5)
    {
      id v11 = [(DADiscovery *)self->_activatedDiscovery configuration];
      unsigned int v12 = [v11 bundleID];
      id v13 = v12;
      if (v12)
      {
        unsigned int v14 = v12;
      }
      else
      {
        unsigned int v14 = [(DADiscovery *)self->_activatedDiscovery bundleID];
      }
      id v10 = v14;
    }
    else
    {
      id v10 = self->_appID;
    }
  }
  if (v9 == 10) {
    goto LABEL_13;
  }
  if (self->_accessLevel == 4)
  {
    id v15 = [v22 appAccessInfoMap];
    id v16 = [v15 objectForKeyedSubscript:v10];
    if (v16)
    {

LABEL_13:
      unsigned __int8 v17 = [v22 flags];
      id v18 = objc_alloc((Class)DADeviceEvent);
      if ((v17 & 8) != 0) {
        uint64_t v19 = 41;
      }
      else {
        uint64_t v19 = 42;
      }
      id v20 = [v18 initWithEventType:v19 device:v22];
      [(DADaemonXPCConnection *)self _xpcReportDAEvent:v20];

      goto LABEL_17;
    }
    unsigned int v21 = [(NSString *)v10 isEqual:v8];

    if (v21) {
      goto LABEL_13;
    }
  }
  else if ([(NSString *)v10 isEqual:v8])
  {
    goto LABEL_13;
  }
LABEL_17:
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  int entitledState = self->_entitledState;
  if (entitledState != 6)
  {
    BOOL v5 = DAErrorF();
    if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintPID();
      id v8 = CUPrintNSError();
      LogPrintF();
    }
    if (a3) {
      *a3 = v5;
    }
  }
  return entitledState == 6;
}

- (BOOL)_findSyncExtensionPoint:(id)a3 bundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)_EXQuery);
  id v8 = +[NSPredicate predicateWithFormat:@"bundleIdentifier == %@", v5];

  id v9 = [v7 initWithExtensionPointIdentifier:v6 predicate:v8];
  id v10 = +[_EXQueryController executeQuery:v9];
  LOBYTE(v5) = [v10 count] != 0;

  return (char)v5;
}

- (BOOL)_entitledForAccessLevel:(int)a3 returnError:(id *)a4
{
  int accessLevel = self->_accessLevel;
  if (a4 && accessLevel < a3)
  {
    DAErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return accessLevel >= a3;
}

- (void)xpcReceivedMessage:(id)a3
{
  id v9 = a3;
  id type = xpc_get_type(v9);
  if (type == &_xpc_type_dictionary)
  {
    id type = [(DADaemonXPCConnection *)self xpcReceivedRequest:v9];
    goto LABEL_14;
  }
  id v5 = v9;
  if (v9 == &_xpc_error_connection_invalid)
  {
    if (dword_1000436E8 <= 20 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintPID();
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    id type = [(DADaemonXPCConnection *)self invalidate];
    goto LABEL_14;
  }
  if (dword_1000436E8 <= 90)
  {
    if (dword_1000436E8 != -1 || (type = (id)_LogCategory_Initialize(), id v5 = v9, type))
    {
      id v7 = CUPrintXPC();
      LogPrintF();

LABEL_14:
      id v5 = v9;
    }
  }

  _objc_release_x1(type, v5);
}

- (void)xpcReceivedEvent:(id)a3
{
  xpc_object_t message = a3;
  BOOL v4 = self->_xpcCnx;
  id v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)xpcReceivedRequest:(id)a3
{
  id v7 = a3;
  uint64_t string = xpc_dictionary_get_string(v7, "mTyp");
  if (!string)
  {
    if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!CUXPCDictionaryExpectsReply()) {
      goto LABEL_45;
    }
LABEL_29:
    id v6 = DAErrorF();
    [(DADaemonXPCConnection *)self _xpcSendReplyError:v6 request:v7];

    goto LABEL_45;
  }
  id v5 = string;
  if (!strncmp(string, "BTIG", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcBluetoothAccessInfoGet:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "DscA", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcDADiscoveryActivate:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "DscM", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcDADiscoveryMigrationComplete:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "DsSp", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcDADiscoveryInvalidateWithReason:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "SesA", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcDASessionActivate:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "DgSh", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcDiagnosticShow:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "RvAi", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcRemoveDeviceAppAccessInfo:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "SAAi", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcSetDeviceAppAccessInfo:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "GAAc", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcGetAuthorizedAccessories:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "GADv", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcGetAuthorizedDevices:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "GDvs", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcGetDevices:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "MdSt", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcModifyDeviceSettings:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "SDvS", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcSetDeviceState:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "GIFs", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcGetPartialIPs:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "SIFs", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcSetPartialIPs:v7];
    goto LABEL_45;
  }
  if (!strncmp(v5, "BTPM", 4uLL))
  {
    [(DADaemonXPCConnection *)self _xpcBluetoothPairingMsg:v7];
    goto LABEL_45;
  }
  if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (CUXPCDictionaryExpectsReply()) {
    goto LABEL_29;
  }
LABEL_45:
}

- (void)_xpcSendEvent:(id)a3
{
  xpc_object_t message = a3;
  BOOL v4 = self->_xpcCnx;
  id v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_xpcSendReply:(id)a3
{
  xpc_object_t message = a3;
  BOOL v4 = self->_xpcCnx;
  id v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v8 = a3;
  id v5 = CUXPCDictionaryCreateReply();
  if (v5)
  {
    CUXPCEncodeNSError();
    id v6 = self->_xpcCnx;
    id v7 = v6;
    if (v6)
    {
      xpc_connection_send_message(v6, v5);
    }
    else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_xpcBluetoothAccessInfoGet:(id)a3
{
  uint64_t v45 = 0;
  v46 = (id *)&v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10001EA50;
  v49 = sub_10001EA60;
  id v50 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10001EA68;
  v42[3] = &unk_10003D1F8;
  v44 = &v45;
  v42[4] = self;
  xpc_object_t original = a3;
  id v43 = original;
  uint64_t v26 = objc_retainBlock(v42);
  v3 = v46;
  id obj = v46[5];
  unsigned __int8 v4 = [(DADaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v3 + 5, obj);
  if (v4)
  {
    id v5 = self->_activatedSession;
    v25 = v5;
    if (v5)
    {
      long long v31 = [(DASession *)v5 bundleID];
      if (v31)
      {
        id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v31, @"daappdata"];
        id v6 = NSTemporaryDirectory();
        id v7 = +[NSURL fileURLWithPath:v6];
        v28 = [v7 URLByAppendingPathComponent:v29 isDirectory:0];

        id v8 = objc_alloc((Class)NSDictionary);
        id v9 = v46 + 5;
        id v40 = v46[5];
        id v33 = [v8 initWithContentsOfURL:v28 error:&v40];
        objc_storeStrong(v9, v40);
        if (v33)
        {
          CFDictionaryGetTypeID();
          id v10 = CFDictionaryGetTypedValue();
          id v34 = objc_alloc_init((Class)DABluetoothAccessInfo);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v11 = v10;
          id v12 = 0;
          id v13 = (char *)[v11 countByEnumeratingWithState:&v36 objects:v51 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v37;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(void *)v37 != v14) {
                  objc_enumerationMutation(v11);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  CFDictionaryGetTypeID();
                  id v16 = CFDictionaryGetTypedValue();
                  if (v16)
                  {
                    CFStringGetTypeID();
                    unsigned __int8 v17 = CFDictionaryGetTypedValue();
                    if (v17)
                    {
                      id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v17];
                      if (v18)
                      {
                        id v19 = objc_alloc_init((Class)DABluetoothDeviceAccessInfo);
                        [v19 setIdentifier:v18];
                        if (!v12) {
                          id v12 = objc_alloc_init((Class)NSMutableArray);
                        }
                        [v12 addObject:v19];
                      }
                    }
                  }
                }
              }
              id v13 = (char *)[v11 countByEnumeratingWithState:&v36 objects:v51 count:16];
            }
            while (v13);
          }

          [v34 setBluetoothDevices:v12];
          if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
          {
            v24 = CUPrintPID();
            LogPrintF();
          }
          xpc_object_t reply = xpc_dictionary_create_reply(original);
          CUXPCEncodeObject();
          [(DADaemonXPCConnection *)self _xpcSendEvent:reply];
        }
        else
        {
          uint64_t v23 = DANestedErrorF();
          id v11 = v46[5];
          v46[5] = (id)v23;
        }
      }
      else
      {
        uint64_t v22 = DAErrorF();
        id v30 = v46[5];
        v46[5] = (id)v22;
      }
    }
    else
    {
      uint64_t v21 = DAErrorF();
      id v32 = v46[5];
      v46[5] = (id)v21;
    }
  }
  ((void (*)(void *))v26[2])(v26);

  _Block_object_dispose(&v45, 8);
}

- (void)_xpcDADiscoveryActivate:(id)a3
{
  id v4 = a3;
  id v26 = 0;
  id v5 = [objc_alloc((Class)DADiscovery) initWithXPCObject:v4 error:&v26];
  id v6 = v26;
  if (v5)
  {
    id v7 = [v5 configuration];
    id v8 = [v7 bundleID];
    if (!v8)
    {
      id v8 = [v5 configurations];
      if ([v8 count])
      {
        id v9 = [v8 firstObject];
        uint64_t v10 = [v9 bundleID];
      }
      else
      {
        id v11 = [v5 bundleID];

        if (!v11)
        {
          if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v21 = DAErrorF();
          [(DADaemonXPCConnection *)self _xpcSendReplyError:v21 request:v4];

          goto LABEL_41;
        }
        if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v10 = [v5 bundleID];
      }

      id v8 = (void *)v10;
    }
    unsigned __int8 v12 = [v7 presenceOnly];
    if (v12)
    {
      if ([(NSString *)self->_appID isEqualToString:v8]) {
        goto LABEL_26;
      }
      id v24 = v6;
      unsigned __int8 v13 = [(DADaemonXPCConnection *)self _entitledAndReturnError:&v24];
      id v14 = v24;

      if ((v13 & 1) == 0)
      {
        id v15 = DAErrorF();
        [(DADaemonXPCConnection *)self _xpcSendReplyError:v15 request:v4];

LABEL_49:
        id v6 = v14;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      id v25 = v6;
      unsigned __int8 v16 = [(DADaemonXPCConnection *)self _entitledAndReturnError:&v25];
      id v14 = v25;

      if ((v16 & 1) == 0)
      {
        [(DADaemonXPCConnection *)self _xpcSendReplyError:v14 request:v4];
        goto LABEL_49;
      }
    }
    id v6 = v14;
LABEL_26:
    objc_storeStrong((id *)&self->_activatedDiscovery, v5);
    if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v23 = uint64_t v22 = v5;
      LogPrintF();
    }
    unsigned __int8 v17 = -[DADaemonServer addDiscovery:](self->_daemon, "addDiscovery:", v5, v22, v23);
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      if (v17) {
        char v19 = v12;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0) {
        CUXPCEncodeNSArrayOfObjects();
      }
      if (v8 && [(DADaemonServer *)self->_daemon devicesPresentWithAppID:v8]) {
        xpc_dictionary_set_BOOL(reply, "dvPr", 1);
      }
      id v20 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
      +[DADeviceAccessAnalytics markState:10 deviceID:v8 shared:0 discovery:v5 flags:8 sourceApp:6 atTime:v20 errorCode:0];
      [(DADaemonXPCConnection *)self _xpcSendReply:reply];
    }
    else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_41;
  }
  if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v22 = CUPrintNSError();
    LogPrintF();
  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4, v22);
LABEL_42:
}

- (void)_xpcDADiscoveryMigrationComplete:(id)a3
{
  id v4 = a3;
  id v16 = 0;
  id v5 = [objc_alloc((Class)DADiscovery) initWithXPCObject:v4 error:&v16];
  id v6 = v16;
  if (v5)
  {
    id v7 = [v5 configuration];
    id v8 = [v7 bundleID];
    if (!v8)
    {
      id v8 = [v5 configurations];
      if ([v8 count])
      {
        id v9 = [v8 firstObject];
        uint64_t v10 = [v9 bundleID];
      }
      else
      {
        id v11 = [v5 bundleID];

        if (!v11)
        {
          if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          unsigned __int8 v13 = DAErrorF();
          [(DADaemonXPCConnection *)self _xpcSendReplyError:v13 request:v4];
          goto LABEL_26;
        }
        if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v10 = [v5 bundleID];
      }

      id v8 = (void *)v10;
    }
    if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v15 = id v14 = v5;
      LogPrintF();
    }
    -[DADaemonServer runMigrationWithDiscovery:](self->_daemon, "runMigrationWithDiscovery:", v5, v14, v15);
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    unsigned __int8 v13 = reply;
    if (reply)
    {
      xpc_dictionary_set_BOOL(reply, "dvPr", 1);
      [(DADaemonXPCConnection *)self _xpcSendReply:v13];
    }
    else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_26:

    goto LABEL_27;
  }
  if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    id v14 = CUPrintNSError();
    LogPrintF();
  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4, v14);
LABEL_27:
}

- (void)_xpcDADiscoveryInvalidateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = self->_activatedDiscovery;
  if (v5)
  {
    CUXPCDecodeUInt64RangedEx();
    if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v13 = v5;
      uint64_t v14 = 0;
      LogPrintF();
    }
    id v6 = [(DADiscovery *)v5 configuration];
    id v7 = [v6 bundleID];
    if (!v7)
    {
      id v7 = [(DADiscovery *)v5 configurations];
      if ([v7 count])
      {
        id v8 = [v7 firstObject];
        uint64_t v9 = [v8 bundleID];
      }
      else
      {
        uint64_t v10 = [(DADiscovery *)v5 bundleID];

        if (!v10)
        {
          if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          id v11 = DAErrorF();
          [(DADaemonXPCConnection *)self _xpcSendReplyError:v11 request:v4];
          goto LABEL_27;
        }
        if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v9 = [(DADiscovery *)v5 bundleID];
      }

      id v7 = (void *)v9;
    }
    id v11 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    +[DADeviceAccessAnalytics markState:30 deviceID:v7 shared:0 discovery:v5 flags:8 sourceApp:6 atTime:v11 errorCode:0];
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      [(DADaemonXPCConnection *)self _xpcSendReply:reply];
    }
    else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

LABEL_27:
    goto LABEL_28;
  }
  if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    unsigned __int8 v13 = CUPrintNSError();
    LogPrintF();
  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", 0, v4, v13);
LABEL_28:
}

- (void)_xpcDASessionActivate:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = sub_10001EA50;
  v46 = sub_10001EA60;
  id v47 = +[NSMutableDictionary dictionary];
  id v5 = objc_alloc((Class)DASession);
  id v41 = 0;
  id v6 = [v5 initWithXPCObject:v4 error:&v41];
  id v7 = v41;
  if (v6)
  {
    [v6 setDispatchQueue:self->_dispatchQueue];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10001FDF8;
    v40[3] = &unk_10003D3F8;
    v40[4] = self;
    v40[5] = v6;
    [v6 setEventHandler:v40];
    objc_storeStrong((id *)&self->_activatedSession, v6);
    if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v28 = id v26 = v6;
      LogPrintF();
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (!reply)
    {
      if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_38;
    }
    uint64_t v48 = 0;
    if (CUXPCDecodeUInt64RangedEx() == 6) {
      uint64_t v9 = v48;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [v6 bundleID:v26, v28];
    id v11 = (void *)v10;
    if (!v9 || v10 || self->_accessLevel == 10)
    {
      if ([(NSString *)self->_appID isEqualToString:v10]) {
        goto LABEL_19;
      }
      id v39 = v7;
      unsigned __int8 v12 = [(DADaemonXPCConnection *)self _entitledAndReturnError:&v39];
      id v13 = v39;

      if (v12)
      {
        id v7 = v13;
LABEL_19:
        if (v11)
        {
          if ([(DADaemonServer *)self->_daemon devicesPresentWithAppID:v11]) {
            xpc_dictionary_set_BOOL(reply, "dvPr", 1);
          }
          [(DADaemonServer *)self->_daemon reportAuthorizedDevices:v11];
          if (!v9) {
            goto LABEL_34;
          }
          uint64_t v14 = [(DADaemonServer *)self->_daemon getDevicesWithFlags:v9 appID:v11];
          CUXPCEncodeNSArrayOfObjects();
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v35 objects:v49 count:16];
          id v29 = v7;
          uint64_t v17 = 0;
          if (v16)
          {
            uint64_t v18 = *(void *)v36;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                v17 |= (unint64_t)[*(id *)(*((void *)&v35 + 1) + 8 * i) flags];
              }
              id v16 = [v15 countByEnumeratingWithState:&v35 objects:v49 count:16];
            }
            while (v16);
          }

          id v7 = v29;
          id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 count]);
          [(id)v43[5] setObject:v20 forKeyedSubscript:@"AccessoriesCount"];

          uint64_t v21 = +[NSNumber numberWithUnsignedInteger:v17];
          [(id)v43[5] setObject:v21 forKeyedSubscript:@"AccessoryFlags"];

          [(id)v43[5] setObject:v11 forKeyedSubscript:@"BundleID"];
        }
        else
        {
          if (!v9)
          {
LABEL_34:
            [(DADaemonServer *)self->_daemon updateAppInfo:v11];
            uint64_t v22 = +[ACXDeviceConnection sharedDeviceConnection];
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_10001FE1C;
            v33[3] = &unk_10003D448;
            v33[4] = v6;
            v33[5] = self;
            id v34 = reply;
            [v22 applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:v11 completion:v33];

            if ([(NSString *)self->_appID isEqualToString:v11])
            {
              dispatchQueue = self->_dispatchQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10001FF8C;
              block[3] = &unk_10003D498;
              block[4] = self;
              id v32 = &v42;
              id v31 = v11;
              dispatch_async(dispatchQueue, block);
            }
            goto LABEL_37;
          }
          id v15 = [(DADaemonServer *)self->_daemon getDevicesWithFlags:v9 appID:0];
          CUXPCEncodeNSArrayOfObjects();
        }

        goto LABEL_34;
      }
      id v24 = DAErrorF();
      [(DADaemonXPCConnection *)self _xpcSendReplyError:v24 request:v4];

      id v7 = v13;
    }
    else
    {
      id v25 = DAErrorF();
      [(DADaemonXPCConnection *)self _xpcSendReplyError:v25 request:v4];
    }
LABEL_37:

LABEL_38:
    goto LABEL_41;
  }
  if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
  {
    v27 = CUPrintNSError();
    LogPrintF();

    -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v4, v27);
  }
  else
  {
    -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v4, v26);
  }
LABEL_41:

  _Block_object_dispose(&v42, 8);
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  unsigned __int8 v5 = [(DADaemonXPCConnection *)self _entitledAndReturnError:&v12];
  id v6 = v12;
  if (v5)
  {
    id v11 = CUDescriptionWithLevel();
    NSAppendPrintF();
    id v7 = (__CFString *)0;

    id v8 = CUXPCDictionaryCreateReply();
    if (v8)
    {
      if (v7) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = @"None\n";
      }
      uint64_t v10 = (const char *)[(__CFString *)v9 UTF8String];
      if (v10) {
        xpc_dictionary_set_string(v8, "oStr", v10);
      }
      [(DADaemonXPCConnection *)self _xpcSendReply:v8];
    }
    else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    [(DADaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
  }
}

- (void)_xpcRemoveDeviceAppAccessInfo:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10001EA50;
  uint64_t v21 = sub_10001EA60;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100021064;
  v14[3] = &unk_10003D1F8;
  id v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  uint64_t v9 = objc_retainBlock(v14);
  id v11 = self->_appID;
  if (v11)
  {
    id v13 = 0;
    objc_opt_class();
    unsigned __int8 v5 = v18;
    id v12 = v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v5 + 5, v12);
    if (!v18[5])
    {
      uint64_t v8 = DAErrorF();
      id v10 = v18[5];
      v18[5] = (id)v8;
    }
  }
  else
  {
    uint64_t v6 = DAErrorF();
    id v7 = v18[5];
    v18[5] = (id)v6;
  }
  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcRemoveDeviceConfirmation:(id)a3 accessInfo:(id)a4 userConfirmed:(BOOL)a5 request:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10001EA50;
  v28 = sub_10001EA60;
  id v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100021594;
  v21[3] = &unk_10003D1F8;
  uint64_t v23 = &v24;
  v21[4] = self;
  id v12 = a6;
  id v22 = v12;
  id v13 = objc_retainBlock(v21);
  if (!a5)
  {
    uint64_t v18 = DAErrorF();
    xpc_object_t reply = (xpc_object_t)v25[5];
    v25[5] = v18;
LABEL_9:

    goto LABEL_10;
  }
  [v11 setState:0];
  daemon = self->_daemon;
  id v15 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v16 = [(DADaemonServer *)daemon updateAppAccessInfo:v11 accessoryDevice:v10 removalType:2 error:&obj];
  objc_storeStrong(v15, obj);
  if (v16)
  {
    if (dword_1000436E8 <= 40 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = CUPrintPID();
      LogPrintF();
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v12);
    if (reply)
    {
      [(DADaemonXPCConnection *)self _xpcSendReply:reply];
    }
    else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_9;
  }
LABEL_10:
  ((void (*)(void *))v13[2])(v13);

  _Block_object_dispose(&v24, 8);
}

- (void)_xpcReportDAEvent:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "Evnt");
  [v4 encodeWithXPCObject:v5];

  [(DADaemonXPCConnection *)self _xpcSendEvent:v5];
}

- (void)_xpcSetDeviceAppAccessInfo:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (id *)&v13;
  uint64_t v15 = 0x3032000000;
  unsigned __int8 v16 = sub_10001EA50;
  uint64_t v17 = sub_10001EA60;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021B68;
  v10[3] = &unk_10003D1F8;
  id v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  id v4 = objc_retainBlock(v10);
  id v9 = 0;
  objc_opt_class();
  id v5 = v14;
  id obj = v14[5];
  CUXPCDecodeObject();
  objc_storeStrong(v5 + 5, obj);
  if (!v14[5])
  {
    uint64_t v6 = DAErrorF();
    id v7 = v14[5];
    void v14[5] = (id)v6;
  }
  ((void (*)(void *))v4[2])(v4);

  _Block_object_dispose(&v13, 8);
}

- (void)_xpcGetAuthorizedAccessories:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unsigned __int8 v16 = sub_10001EA50;
  uint64_t v17 = sub_10001EA60;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021FE4;
  v10[3] = &unk_10003D1F8;
  id v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  id v4 = objc_retainBlock(v10);
  id v9 = 0;
  objc_opt_class();
  id v5 = (id *)(v14 + 5);
  id obj = (id)v14[5];
  CUXPCDecodeObject();
  objc_storeStrong(v5, obj);
  if (!v14[5])
  {
    uint64_t v6 = DAErrorF();
    id v7 = (void *)v14[5];
    void v14[5] = v6;
  }
  ((void (*)(void *))v4[2])(v4);

  _Block_object_dispose(&v13, 8);
}

- (void)_xpcGetAuthorizedDevices:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unsigned __int8 v16 = sub_10001EA50;
  uint64_t v17 = sub_10001EA60;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022470;
  v10[3] = &unk_10003D1F8;
  id v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  id v4 = objc_retainBlock(v10);
  id v9 = 0;
  objc_opt_class();
  id v5 = (id *)(v14 + 5);
  id obj = (id)v14[5];
  CUXPCDecodeObject();
  objc_storeStrong(v5, obj);
  if (!v14[5])
  {
    uint64_t v6 = DAErrorF();
    id v7 = (void *)v14[5];
    void v14[5] = v6;
  }
  ((void (*)(void *))v4[2])(v4);

  _Block_object_dispose(&v13, 8);
}

- (void)_xpcGetDevices:(id)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10001EA50;
  id v20 = sub_10001EA60;
  id v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022984;
  v13[3] = &unk_10003D1F8;
  uint64_t v15 = &v16;
  v13[4] = self;
  id v4 = a3;
  id v14 = v4;
  id v5 = objc_retainBlock(v13);
  uint64_t v6 = self->_appID;
  if (v6)
  {
    objc_opt_class();
    id v7 = (id *)(v17 + 5);
    id obj = (id)v17[5];
    CUXPCDecodeObject();
    objc_storeStrong(v7, obj);
    if (!v17[5])
    {
      uint64_t v10 = DAErrorF();
      id v11 = (void *)v17[5];
      v17[5] = v10;
    }
  }
  else
  {
    uint64_t v8 = DAErrorF();
    id v9 = (void *)v17[5];
    v17[5] = v8;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v16, 8);
}

- (void)_xpcModifyDeviceSettings:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10001EA50;
  id v21 = sub_10001EA60;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100022FC8;
  v14[3] = &unk_10003D1F8;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  id v5 = objc_retainBlock(v14);
  uint64_t v6 = self->_appID;
  if (v6)
  {
    id v7 = v18;
    id obj = v18[5];
    id v13 = 0;
    CUXPCDecodeNSString();
    objc_storeStrong(v7 + 5, obj);
    if (!v18[5])
    {
      uint64_t v10 = DAErrorF();
      id v11 = v18[5];
      v18[5] = (id)v10;
    }
  }
  else
  {
    uint64_t v8 = DAErrorF();
    id v9 = v18[5];
    v18[5] = (id)v8;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcSetDeviceState:(id)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10001EA50;
  uint64_t v18 = sub_10001EA60;
  id v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100023570;
  v11[3] = &unk_10003D1F8;
  id v13 = &v14;
  v11[4] = self;
  id v4 = a3;
  id v12 = v4;
  id v5 = objc_retainBlock(v11);
  if (self->_entitledState == 6) {
    xpc_dictionary_get_BOOL(v4, "simA");
  }
  id v10 = 0;
  objc_opt_class();
  uint64_t v6 = (id *)(v15 + 5);
  id obj = (id)v15[5];
  CUXPCDecodeObject();
  objc_storeStrong(v6, obj);
  if (!v15[5])
  {
    uint64_t v7 = DAErrorF();
    uint64_t v8 = (void *)v15[5];
    v15[5] = v7;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v14, 8);
}

- (void)_xpcSetPartialIPs:(id)a3
{
  uint64_t v29 = 0;
  id v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_10001EA50;
  id v33 = sub_10001EA60;
  id v34 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100023A60;
  v26[3] = &unk_10003D1F8;
  v28 = &v29;
  v26[4] = self;
  id v4 = a3;
  id v27 = v4;
  id v5 = objc_retainBlock(v26);
  long long v24 = 0u;
  long long v25 = 0u;
  xpc_connection_get_audit_token();
  uint64_t v6 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v7 = v6;
  if (v6)
  {
    id v23 = 0;
    if (xpc_dictionary_get_BOOL(v6, "com.apple.DeviceAccess"))
    {
      if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      CUXPCDecodeNSString();
      goto LABEL_12;
    }
  }
  else
  {
    id v23 = 0;
  }
  uint64_t v8 = v30;
  id obj = v30[5];
  v21[0] = v24;
  v21[1] = v25;
  id v9 = +[LSBundleRecord bundleRecordForAuditToken:v21 error:&obj];
  objc_storeStrong(v8 + 5, obj);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 bundleIdentifier];
    id v11 = v23;
    id v23 = v10;
  }
LABEL_12:
  if (!v23)
  {
    uint64_t v16 = DAErrorF();
    id v17 = v30[5];
    v30[5] = (id)v16;

    goto LABEL_20;
  }
  *(void *)&v21[0] = 0;
  objc_opt_class();
  id v12 = v30;
  id v20 = v30[5];
  CUXPCDecodeNSArrayOfClass();
  objc_storeStrong(v12 + 5, v20);
  id v13 = v30 + 5;
  if (!v30[5])
  {
    if (!*(void *)&v21[0])
    {
      uint64_t v18 = DAErrorF();
      xpc_object_t reply = v30[5];
      v30[5] = (id)v18;
LABEL_18:

      goto LABEL_19;
    }
    daemon = self->_daemon;
    id v19 = 0;
    [(DADaemonServer *)daemon setPartialIPsForAppBundleID:v23 partialIPs:*(void *)&v21[0] error:&v19];
    objc_storeStrong(v13, v19);
    if (!v30[5])
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v4);
      if (reply)
      {
        [(DADaemonXPCConnection *)self _xpcSendReply:reply];
      }
      else if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_18;
    }
  }
LABEL_19:

LABEL_20:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcBluetoothPairingMsg:(id)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10001EA50;
  id v19 = sub_10001EA60;
  id v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100023F10;
  v12[3] = &unk_10003D1F8;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v4 = a3;
  id v13 = v4;
  id v5 = objc_retainBlock(v12);
  if ([(DADaemonXPCConnection *)self accessLevel] == 10)
  {
    uint64_t v6 = (id *)(v16 + 5);
    id obj = (id)v16[5];
    CUXPCDecodeNSString();
    objc_storeStrong(v6, obj);
    uint64_t v9 = DAErrorF();
    id v10 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    uint64_t v7 = DAErrorF();
    uint64_t v8 = (void *)v16[5];
    v16[5] = v7;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v15, 8);
}

- (void)_xpcGetPartialIPs:(id)a3
{
  uint64_t v19 = 0;
  id v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10001EA50;
  id v23 = sub_10001EA60;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100024358;
  v16[3] = &unk_10003D1F8;
  uint64_t v18 = &v19;
  v16[4] = self;
  id v3 = a3;
  id v17 = v3;
  id v4 = objc_retainBlock(v16);
  long long v14 = 0u;
  long long v15 = 0u;
  xpc_connection_get_audit_token();
  id v5 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v6 = v5;
  if (v5 && xpc_dictionary_get_BOOL(v5, "com.apple.DeviceAccess"))
  {
    uint64_t v7 = v20;
    id obj = v20[5];
    id v13 = 0;
    CUXPCDecodeNSString();
    objc_storeStrong(v7 + 5, obj);
    uint64_t v10 = DAErrorF();
    id v11 = v20[5];
    v20[5] = (id)v10;
  }
  else
  {
    uint64_t v8 = DAErrorF();
    id v9 = v20[5];
    v20[5] = (id)v8;
  }
  ((void (*)(void *))v4[2])(v4);

  _Block_object_dispose(&v19, 8);
}

- (int)accessLevel
{
  return self->_accessLevel;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (DADaemonServer)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_activatedSession, 0);

  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
}

@end