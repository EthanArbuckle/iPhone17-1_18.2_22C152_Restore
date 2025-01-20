@interface MBDeviceManager
+ (id)deviceManagerWithCheckinMethod:(int)a3;
- (MBDeviceManager)initWithCheckinMethod:(int)a3;
- (id)_acceptConnectionWithInfo:(id)a3;
- (id)_checkinWithConnectionInfo:(id)a3;
- (id)_settingsContextWithSourceIdentifier:(id)a3 targetIdentifier:(id)a4 applicationIDs:(id)a5 options:(id)a6;
- (id)close;
- (id)open;
- (id)run;
- (void)_acceptFailedCallback:(id)a3;
- (void)_disconnectCallback:(id)a3;
- (void)_enableCloudBackupMessage:(id)a3;
- (void)_eraseDeviceMessage:(id)a3;
- (void)_handleBackupMessage:(id)a3;
- (void)_handleChangePasswordMessage:(id)a3;
- (void)_handleExtractMessage:(id)a3;
- (void)_handleHelloMessage:(id)a3;
- (void)_handleInfoMessage:(id)a3;
- (void)_handleListMessage:(id)a3;
- (void)_handleRemoveMessage:(id)a3;
- (void)_handleRestoreMessage:(id)a3;
- (void)_handleUnbackMessage:(id)a3;
- (void)_processMessageCallback:(id)a3;
- (void)_sendResponseMessage:(id)a3;
- (void)_sendResponseMessageWithCode:(int64_t)a3 description:(id)a4;
- (void)_sendResponseMessageWithError:(id)a3;
- (void)_sendSuccessResponseMessage;
- (void)_sendSuccessResponseMessageWithProperties:(id)a3;
- (void)_stop;
- (void)_stopWithError:(id)a3;
- (void)dealloc;
@end

@implementation MBDeviceManager

+ (id)deviceManagerWithCheckinMethod:(int)a3
{
  v3 = [[MBDeviceManager alloc] initWithCheckinMethod:*(void *)&a3];

  return v3;
}

- (MBDeviceManager)initWithCheckinMethod:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MBDeviceManager;
  v4 = [(MBDeviceManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_checkinMethod = a3;
    [+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0) setPreferencesValue:0 forKey:@"DriveRestoreInProgress"];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDeviceManager;
  [(MBDeviceManager *)&v3 dealloc];
}

- (id)open
{
  objc_super v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id result = [(MBDeviceManager *)self _checkinWithConnectionInfo:v3];
  if (!result)
  {
    return [(MBDeviceManager *)self _acceptConnectionWithInfo:v3];
  }
  return result;
}

- (id)_checkinWithConnectionInfo:(id)a3
{
  [a3 setValue:@"DLInfoStreamTypeTCP" forKey:@"DLInfoStreamTypeKey"];
  int checkinMethod = self->_checkinMethod;
  if (checkinMethod == 2)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = 6599;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Listening on port %d", buf, 8u);
      uint64_t v16 = 6599;
      _MBLog();
    }
    v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6599, v16);
    CFStringRef v10 = @"DLInfoPortKey";
LABEL_17:
    [a3 setValue:v9 forKey:v10];
    return 0;
  }
  if (checkinMethod == 1)
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Checking in with launchd", buf, 2u);
      _MBLog();
    }
    uint64_t v12 = DLGetListenerSocketFromLaunchd();
    if (!v12)
    {
      CFStringRef v7 = @"Could not check-in with launchd";
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, v7, v16);
    }
    uint64_t v13 = v12;
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Listening on launchd socket: %d", buf, 8u);
      uint64_t v16 = v13;
      _MBLog();
    }
    v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13, v16);
    CFStringRef v10 = @"DLInfoSocketKey";
    goto LABEL_17;
  }
  if (checkinMethod) {
    return +[MBError errorWithCode:1, @"Unknown checkin method: %d", self->_checkinMethod format];
  }
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking in with lockdown", buf, 2u);
    _MBLog();
  }
  if (!DLLockdownXPCCheckin()) {
    return 0;
  }
  CFStringRef v7 = @"Could not check-in with lockdown";
  return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, v7, v16);
}

- (id)_acceptConnectionWithInfo:(id)a3
{
  uint64_t v10 = 0;
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating device connection", buf, 2u);
    _MBLog();
  }
  uint64_t v4 = DLCreateDeviceLinkConnectionForDevice();
  if (v4) {
    return +[MBError errorWithCode:100, @"Error creating connection: %d %@", v4, v10 format];
  }
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Waiting for connection from computer", v8, 2u);
    _MBLog();
  }
  uint64_t v7 = DLWaitForConnection();
  if (v7) {
    return +[MBError errorWithCode:100, @"Error accepting connection: %d %@", v7, v10 format];
  }
  else {
    return 0;
  }
}

- (id)run
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Running connection", v5, 2u);
    _MBLog();
  }
  CFRunLoopRun();
  return self->_error;
}

- (id)close
{
  uint64_t v13 = 0;
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Closing connection", buf, 2u);
    _MBLog();
  }
  uint64_t v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Disconnecting connection", buf, 2u);
    _MBLog();
  }
  error = self->_error;
  if (error) {
    [(NSError *)error description];
  }
  uint64_t v6 = DLDisconnect();
  if (v6)
  {
    uint64_t v7 = v6;
    DLDeleteDeviceLinkConnection();
    return +[MBError errorWithCode:100, @"Error disconnecting connection: %d %@", v7, v13 format];
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleting connection", buf, 2u);
      _MBLog();
    }
    uint64_t v10 = DLDeleteDeviceLinkConnection();
    if (v10)
    {
      return +[MBError errorWithCode:100, @"Error deleting connection: %d %@", v10, v13 format];
    }
    else
    {
      v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Connection closed", buf, 2u);
        _MBLog();
      }
      return 0;
    }
  }
}

- (id)_settingsContextWithSourceIdentifier:(id)a3 targetIdentifier:(id)a4 applicationIDs:(id)a5 options:(id)a6
{
  id v11 = +[MBDriveSettingsContext defaultSettingsContext];
  [v11 setProtocolVersion:self->_protocolVersion];
  [v11 setSourceIdentifier:a3];
  [v11 setTargetIdentifier:a4];
  if (a5) {
    uint64_t v12 = +[NSSet setWithArray:a5];
  }
  else {
    uint64_t v12 = 0;
  }
  [v11 setApplicationIDs:v12];
  [objc_msgSend(v11, "options") addEntriesFromDictionary:a6];
  [v11 setDrive:[+[MBDeviceLinkDrive deviceLinkDriveWithConnection:](MBDeviceLinkDrive, "deviceLinkDriveWithConnection:", self->super._connection)];
  return v11;
}

- (void)_stop
{
  Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

- (void)_stopWithError:(id)a3
{
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "_stopWithError: %@", buf, 0xCu);
    id v6 = a3;
    _MBLog();
  }
  if (!self->_error) {
    self->_error = (NSError *)a3;
  }
  [(MBDeviceManager *)self _stop];
}

- (void)_sendResponseMessage:(id)a3
{
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = [a3 objectForKeyedSubscript:@"ErrorCode"];
    __int16 v7 = 2112;
    id v8 = [a3 objectForKeyedSubscript:@"ErrorDescription"];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Sending response message: %@ %@", buf, 0x16u);
    [a3 objectForKeyedSubscript:@"ErrorCode"];
    [a3 objectForKeyedSubscript:@"ErrorDescription"];
    _MBLog();
  }
  *(void *)buf = 0;
  if (DLProcessMessage()) {
    [(MBDeviceManager *)self _stopWithError:+[MBError errorWithCode:100, @"Error sending message: %@", *(void *)buf format]];
  }
}

- (void)_sendSuccessResponseMessageWithProperties:(id)a3
{
  v6[0] = @"MessageName";
  v6[1] = @"ErrorCode";
  v7[0] = @"Response";
  v7[1] = +[NSNumber numberWithInt:0];
  id v5 = [+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2] mutableCopy];
  [v5 addEntriesFromDictionary:a3];
  [(MBDeviceManager *)self _sendResponseMessage:v5];
}

- (void)_sendSuccessResponseMessage
{
}

- (void)_sendResponseMessageWithCode:(int64_t)a3 description:(id)a4
{
  v7[0] = @"Response";
  v6[0] = @"MessageName";
  v6[1] = @"ErrorCode";
  void v6[2] = @"ErrorDescription";
  v7[1] = +[NSNumber numberWithInteger:a3];
  void v7[2] = a4;
  [(MBDeviceManager *)self _sendResponseMessage:+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3]];
}

- (void)_sendResponseMessageWithError:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain")) {
    uint64_t v5 = (uint64_t)[a3 code];
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = +[MBError descriptionForError:a3];

  [(MBDeviceManager *)self _sendResponseMessageWithCode:v5 description:v6];
}

- (void)_acceptFailedCallback:(id)a3
{
  uint64_t v4 = +[MBError errorWithCode:100, @"Accepting connection failed: %@", a3 format];

  [(MBDeviceManager *)self _stopWithError:v4];
}

- (void)_disconnectCallback:(id)a3
{
  uint64_t v4 = MBGetDefaultLog();
  uint64_t v5 = v4;
  if (a3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Computer disconnected: %@", buf, 0xCu);
      _MBLog();
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Computer disconnected", buf, 2u);
      _MBLog();
      BOOL v6 = 0;
    }
  }
  sub_100005B50(v6);
}

- (void)_processMessageCallback:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"MessageName"];
  BOOL v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received message: %@", buf, 0xCu);
    id v7 = v5;
    _MBLog();
  }
  if (objc_msgSend(v5, "isEqualToString:", @"Hello", v7))
  {
    [(MBDeviceManager *)self _handleHelloMessage:a3];
  }
  else if ([v5 isEqualToString:@"Backup"])
  {
    [(MBDeviceManager *)self _handleBackupMessage:a3];
  }
  else if ([v5 isEqualToString:@"Restore"])
  {
    [(MBDeviceManager *)self _handleRestoreMessage:a3];
  }
  else if ([v5 isEqualToString:@"ChangePassword"])
  {
    [(MBDeviceManager *)self _handleChangePasswordMessage:a3];
  }
  else if ([v5 isEqualToString:@"Extract"])
  {
    [(MBDeviceManager *)self _handleExtractMessage:a3];
  }
  else if ([v5 isEqualToString:@"Remove"])
  {
    [(MBDeviceManager *)self _handleRemoveMessage:a3];
  }
  else if ([v5 isEqualToString:@"Info"])
  {
    [(MBDeviceManager *)self _handleInfoMessage:a3];
  }
  else if ([v5 isEqualToString:@"List"])
  {
    [(MBDeviceManager *)self _handleListMessage:a3];
  }
  else if ([v5 isEqualToString:@"Unback"])
  {
    [(MBDeviceManager *)self _handleUnbackMessage:a3];
  }
  else if ([v5 isEqualToString:@"EnableCloudBackup"])
  {
    [(MBDeviceManager *)self _enableCloudBackupMessage:a3];
  }
  else if ([v5 isEqualToString:@"EraseDevice"])
  {
    [(MBDeviceManager *)self _eraseDeviceMessage:a3];
  }
  else
  {
    [(MBDeviceManager *)self _stopWithError:+[MBError errorWithCode:1, @"Unknown message name received: %@", v5 format]];
  }
}

- (void)_handleHelloMessage:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"SupportedProtocolVersions"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (void *)MBSupportedProtocolVersions();
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v4 containsObject:v10])
        {
          [v10 doubleValue];
          if (v11 > self->_protocolVersion)
          {
            [v10 doubleValue];
            self->_double protocolVersion = v12;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
  double protocolVersion = self->_protocolVersion;
  v14 = MBGetDefaultLog();
  v15 = v14;
  if (protocolVersion <= 0.0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No common supported protocol version", buf, 2u);
      _MBLog();
    }
    [(MBDeviceManager *)self _sendResponseMessageWithCode:1 description:@"No common supported protocol version"];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v16 = self->_protocolVersion;
      *(_DWORD *)buf = 134217984;
      double v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Using protocol version %0.1f", buf, 0xCu);
      double v17 = self->_protocolVersion;
      _MBLog();
    }
    CFStringRef v22 = @"ProtocolVersion";
    v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_protocolVersion, *(void *)&v17);
    [(MBDeviceManager *)self _sendSuccessResponseMessageWithProperties:+[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1]];
  }
}

- (void)_handleBackupMessage:(id)a3
{
  id v4 = [[self _settingsContextWithSourceIdentifier:0 targetIdentifier:[a3 objectForKeyedSubscript:@"TargetIdentifier"] applicationIDs:0 options:[a3 objectForKeyedSubscript:@"Options"]];
  id v5 = +[MBDriveBackupEngine backupEngineWithSettingsContext:debugContext:](MBDriveBackupEngine, "backupEngineWithSettingsContext:debugContext:", v4, +[MBDebugContext defaultDebugContext]);
  [v4 setPlugins:sub_1000964F4()];
  -[MBProgress setDelegate:](-[MBDriveBackupEngine progress](v5, "progress"), "setDelegate:", [v4 drive]);
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Action: Backup", v8, 2u);
    _MBLog();
  }
  id v7 = [(MBDriveBackupEngine *)v5 backup];
  if (v7) {
    [(MBDeviceManager *)self _sendResponseMessageWithError:v7];
  }
  else {
    [(MBDeviceManager *)self _sendSuccessResponseMessage];
  }
  [(MBDriveBackupEngine *)v5 endWithError:v7];
}

- (void)_handleRestoreMessage:(id)a3
{
  id v4 = [-self _settingsContextWithSourceIdentifier:[a3 objectForKeyedSubscript:@"SourceIdentifier"] targetIdentifier:[a3 objectForKeyedSubscript:@"TargetIdentifier"] applicationIDs:[a3 objectForKeyedSubscript:@"ApplicationIDs"] options:[a3 objectForKeyedSubscript:@"Options"]];
  id v5 = +[MBDriveRestoreEngine restoreEngineWithSettingsContext:debugContext:](MBDriveRestoreEngine, "restoreEngineWithSettingsContext:debugContext:", v4, +[MBDebugContext defaultDebugContext]);
  [v4 setPlugins:sub_1000964F4()];
  -[MBProgress setDelegate:](-[MBDriveRestoreEngine progress](v5, "progress"), "setDelegate:", [v4 drive]);
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Action: Restore", v8, 2u);
    _MBLog();
  }
  id v7 = [(MBDriveRestoreEngine *)v5 restore];
  if (v7) {
    [(MBDeviceManager *)self _sendResponseMessageWithError:v7];
  }
  else {
    [(MBDeviceManager *)self _sendSuccessResponseMessage];
  }
  [(MBDriveRestoreEngine *)v5 endWithError:v7];
}

- (void)_handleChangePasswordMessage:(id)a3
{
  uint64_t v4 = 0;
  if ([objc_msgSend(objc_msgSend(-[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", 0, objc_msgSend(a3, "objectForKeyedSubscript:", @"TargetIdentifier"), 0, 0), "encryptionManager"), "changePasswordFrom:toPassword:error:", objc_msgSend(a3, "objectForKeyedSubscript:", @"OldPassword"), objc_msgSend(a3, "objectForKeyedSubscript:", @"NewPassword"), &v4))-[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage"); {
  else
  }
    [(MBDeviceManager *)self _sendResponseMessageWithError:v4];
}

- (void)_handleExtractMessage:(id)a3
{
  uint64_t v14 = 0;
  id v5 = [a3 objectForKeyedSubscript:@"SourceIdentifier"];
  id v6 = [a3 objectForKeyedSubscript:@"TargetIdentifier"];
  id v7 = [a3 objectForKeyedSubscript:@"DomainName"];
  id v8 = [a3 objectForKeyedSubscript:@"RelativePath"];
  id v9 = [a3 objectForKeyedSubscript:@"Password"];
  if (v9)
  {
    CFStringRef v15 = @"Password";
    id v16 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  double v11 = +[MBDeviceTools toolsWithSettingsContext:[(MBDeviceManager *)self _settingsContextWithSourceIdentifier:v5 targetIdentifier:v6 applicationIDs:0 options:v10] error:&v14];
  double v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Action: Extract", v13, 2u);
    _MBLog();
  }
  if ([(MBDeviceTools *)v11 extractWithDomainName:v7 relativePath:v8 error:&v14])
  {
    [(MBDeviceManager *)self _sendSuccessResponseMessage];
  }
  else
  {
    [(MBDeviceManager *)self _sendResponseMessageWithError:v14];
  }
}

- (void)_handleRemoveMessage:(id)a3
{
  uint64_t v4 = +[MBError errorWithCode:1 format:@"Remove action is no longer supported"];

  [(MBDeviceManager *)self _sendResponseMessageWithError:v4];
}

- (void)_handleInfoMessage:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v4 = +[MBDeviceTools toolsWithSettingsContext:error:](MBDeviceTools, "toolsWithSettingsContext:error:", -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", [a3 objectForKeyedSubscript:@"SourceIdentifier"], objc_msgSend(a3, "objectForKeyedSubscript:", @"TargetIdentifier"), 0, 0), &v8);
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Action: Info", v7, 2u);
    _MBLog();
  }
  id v6 = [(MBDeviceTools *)v4 infoWithError:&v8];
  if (v6)
  {
    CFStringRef v9 = @"Content";
    id v10 = v6;
    [(MBDeviceManager *)self _sendSuccessResponseMessageWithProperties:+[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1]];
  }
  else
  {
    [(MBDeviceManager *)self _sendResponseMessageWithError:v8];
  }
}

- (void)_handleListMessage:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v4 = +[MBDeviceTools toolsWithSettingsContext:error:](MBDeviceTools, "toolsWithSettingsContext:error:", -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", [a3 objectForKeyedSubscript:@"SourceIdentifier"], objc_msgSend(a3, "objectForKeyedSubscript:", @"TargetIdentifier"), 0, 0), &v8);
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Action: List", v7, 2u);
    _MBLog();
  }
  id v6 = [(MBDeviceTools *)v4 listWithError:&v8];
  if (v6)
  {
    CFStringRef v9 = @"Content";
    id v10 = v6;
    [(MBDeviceManager *)self _sendSuccessResponseMessageWithProperties:+[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1]];
  }
  else
  {
    [(MBDeviceManager *)self _sendResponseMessageWithError:v8];
  }
}

- (void)_handleUnbackMessage:(id)a3
{
  uint64_t v12 = 0;
  id v5 = [a3 objectForKeyedSubscript:@"SourceIdentifier"];
  id v6 = [a3 objectForKeyedSubscript:@"TargetIdentifier"];
  id v7 = [a3 objectForKeyedSubscript:@"Password"];
  if (v7)
  {
    CFStringRef v13 = @"Password";
    id v14 = v7;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFStringRef v9 = +[MBDeviceTools toolsWithSettingsContext:[(MBDeviceManager *)self _settingsContextWithSourceIdentifier:v5 targetIdentifier:v6 applicationIDs:0 options:v8] error:&v12];
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Action: Unback", v11, 2u);
    _MBLog();
  }
  if ([(MBDeviceTools *)v9 unbackWithError:&v12]) {
    [(MBDeviceManager *)self _sendSuccessResponseMessage];
  }
  else {
    [(MBDeviceManager *)self _sendResponseMessageWithError:v12];
  }
}

- (void)_enableCloudBackupMessage:(id)a3
{
  id v4 = [[objc_msgSend(a3, "objectForKeyedSubscript:", @"CloudBackupState") boolValue];
  if (v4)
  {
    id v5 = +[MCProfileConnection sharedConnection];
    if (([v5 isSettingLockedDownByRestrictions:MCFeatureCloudBackupAllowed] & 1) != 0
      || [+[NSFileManager defaultManager] fileExistsAtPath:@"/var/tmp/MDMRefuseToEnableCloudBackups"])
    {
      id v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloud backups are disabled via management for this device", buf, 2u);
        _MBLog();
      }
      id v7 = +[MBError errorWithCode:22 format:@"Cloud backups are disabled via management for this device"];
      uint64_t v8 = self;
      goto LABEL_22;
    }
  }
  id v9 = +[ACAccountStore defaultStore];
  id v10 = [v9 aa_primaryAppleAccount];
  if (!v10)
  {
    CFStringRef v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No Apple acount exists", buf, 2u);
      _MBLog();
    }
    id v16 = +[MBError errorWithCode:1 format:@"No account exists"];
    goto LABEL_21;
  }
  double v11 = v10;
  uint64_t v12 = kAccountDataclassBackup;
  if (![v10 isProvisionedForDataclass:kAccountDataclassBackup])
  {
    double v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = (const __CFString *)[v11 accountDescription];
      __int16 v22 = 2112;
      id v23 = [v11 provisionedDataclasses];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "The account \"%@\" is not provisioned for cloud backup. %@", buf, 0x16u);
      CFStringRef v18 = (const __CFString *)[v11 accountDescription];
      id v19 = [v11 provisionedDataclasses];
      _MBLog();
    }
    id v16 = +[MBError errorWithCode:1, @"The primary account is not provisioned for cloud backup", v18, v19 format];
    [v9 saveAccount:v11 withCompletionHandler:&stru_1000F16E0];
LABEL_21:
    uint64_t v8 = self;
    id v7 = v16;
LABEL_22:
    [(MBDeviceManager *)v8 _sendResponseMessageWithError:v7];
    return;
  }
  [v11 setEnabled:v4 forDataclass:v12];
  CFStringRef v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (v4) {
      CFStringRef v14 = @"En";
    }
    else {
      CFStringRef v14 = @"Dis";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v21 = v14;
    __int16 v22 = 2112;
    id v23 = [v11 accountDescription];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@abled account \"%@\" for cloud backup", buf, 0x16u);
    CFStringRef v18 = v14;
    id v19 = [v11 accountDescription];
    _MBLog();
  }
  [v9 saveAccount:v11 withCompletionHandler:&stru_1000F16E0, v18, v19];
  [(MBDeviceManager *)self _sendSuccessResponseMessage];
}

- (void)_eraseDeviceMessage:(id)a3
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Erasing device per request from iTunes", v5, 2u);
    _MBLog();
  }
  v6[0] = kObliterationTypeKey;
  v6[1] = kObliterationMessageKey;
  v7[0] = kObliterateDataPartition;
  v7[1] = @"BackupRestore";
  +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  if (Mobile_Obliterate()) {
    [(MBDeviceManager *)self _sendResponseMessageWithCode:1 description:@"Failed to erase device"];
  }
  else {
    [(MBDeviceManager *)self _sendSuccessResponseMessage];
  }
}

@end