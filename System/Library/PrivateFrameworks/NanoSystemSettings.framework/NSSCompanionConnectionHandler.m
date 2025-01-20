@interface NSSCompanionConnectionHandler
+ (id)serverProtocol;
- (NSSCompanionConnectionHandler)initWithConnection:(id)a3 delegate:(id)a4;
- (void)cancelActiveLogFileTranfers;
- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4;
- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4;
- (void)fetchBetaEnrollmentStatus:(id)a3;
- (void)getAboutInfo:(id)a3;
- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4;
- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4;
- (void)getDiagnosticLogsInfo:(id)a3;
- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5;
- (void)getLegalDocuments:(id)a3;
- (void)getLocalesInfo:(id)a3;
- (void)getProfilesInfo:(id)a3;
- (void)getUsage:(id)a3;
- (void)getWatchFaces:(id)a3;
- (void)installProfile:(id)a3 replyHandler:(id)a4;
- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4;
- (void)purgeUsageBundle:(id)a3 replyHandler:(id)a4;
- (void)rebootDevice;
- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5;
- (void)removeProfileWithIdentifier:(id)a3 replyHandler:(id)a4;
- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3;
- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4;
- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4;
- (void)setDeviceName:(id)a3;
- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation NSSCompanionConnectionHandler

+ (id)serverProtocol
{
  return &OBJC_PROTOCOL___NSSCompanionServerProtocol;
}

- (NSSCompanionConnectionHandler)initWithConnection:(id)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NSSCompanionConnectionHandler;
  return [(NSSConnectionHandler *)&v5 initWithConnection:a3 delegate:a4];
}

- (void)setDeviceName:(id)a3
{
  id v4 = a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"device-name"])
  {
    objc_super v5 = [(NSSConnectionHandler *)self delegate];
    [v5 setDeviceName:v4];
  }
  else
  {
    objc_super v5 = NSSLogForType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discarding request due to missing entitlement", v6, 2u);
    }
  }
}

- (void)getUsage:(id)a3
{
  id v4 = off_10003E448;
  objc_super v5 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:v4])
  {
    id v6 = [(NSSConnectionHandler *)self delegate];
    [v6 getUsage:v5];
  }
  else
  {
    id v6 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v5[2](v5, 0);
  }
}

- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"airplanemode"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 retrieveAirplaneModeSettingsWithCompletionHandler:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"airplanemode"])
  {
    v7 = [(NSSConnectionHandler *)self delegate];
    [v7 setAirplaneModeSettings:v8 withCompletionHandler:v6];
  }
  else
  {
    v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

- (void)purgeUsageBundle:(id)a3 replyHandler:(id)a4
{
  id v9 = a3;
  id v6 = off_10003E448;
  v7 = (void (**)(id, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:v6])
  {
    id v8 = [(NSSConnectionHandler *)self delegate];
    [v8 purgeUsageBundle:v9 replyHandler:v7];
  }
  else
  {
    id v8 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v7[2](v7, v8);
  }
}

- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"diagnosticlogfile"])
  {
    v7 = [(NSSConnectionHandler *)self delegate];
    [v7 getDiagnosticLogFileFromGizmo:v8 withResults:v6];
  }
  else
  {
    v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSSConnectionHandler *)self delegate];
  [v8 retrieveDiagnosticLogTransferProgress:v7 withProgress:v6];
}

- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"cancellogtransfer"])
  {
    id v8 = [(NSSConnectionHandler *)self delegate];
    [v8 cancelDiagnosticLogTranfer:v6 withCompletion:v7];
  }
  else
  {
    id v8 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    id v9 = NSSLogForType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancel file transfer failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)cancelActiveLogFileTranfers
{
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"cancellogtransfers"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 cancelActiveLogFileTranfers];
  }
  else
  {
    v3 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    id v4 = NSSLogForType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancel file transfers failed with error: %@", buf, 0xCu);
    }
  }
}

- (void)getDiagnosticLogsInfo:(id)a3
{
  id v4 = a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"diagnosticlogs"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 getDiagnosticLogsInfo:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"diagnosticdelete"])
  {
    id v7 = [(NSSConnectionHandler *)self delegate];
    [v7 deleteDiagnosticLogFile:v8 withResult:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6, v7);
  }
}

- (void)getAboutInfo:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"about"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 getAboutInfo:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"about"])
  {
    int v10 = [(NSSConnectionHandler *)self delegate];
    [v10 recordSoftwareUpdateSpaceFailure:v11 osBeingUpdatedTo:v8 completion:v9];
  }
  else
  {
    int v10 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v9[2](v9, v10);
  }
}

- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"accounts"]|| [(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"icloud"])
  {
    id v7 = [(NSSConnectionHandler *)self delegate];
    [v7 getAccountsInfoForAccountType:v8 completionHandler:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"obliterate"])
  {
    id v7 = [(NSSConnectionHandler *)self delegate];
    [v7 obliterateGizmoPreservingeSIM:v4 completionHandler:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6);
  }
}

- (void)getProfilesInfo:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"profiles"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 getProfilesInfo:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"profiles"])
  {
    id v9 = [(NSSConnectionHandler *)self delegate];
    [v9 getFullProfileInfoWithIdentifier:v10 includeManagedPayloads:v6 completionHandler:v8];
  }
  else
  {
    id v9 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v8[2](v8, 0, v9);
  }
}

- (void)installProfile:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"profiles"])
  {
    id v7 = [(NSSConnectionHandler *)self delegate];
    [v7 installProfile:v8 replyHandler:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6, v7);
  }
}

- (void)removeProfileWithIdentifier:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"profiles"])
  {
    id v7 = [(NSSConnectionHandler *)self delegate];
    [v7 removeProfileWithIdentifier:v8 replyHandler:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v6[2](v6, v7);
  }
}

- (void)rebootDevice
{
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"reboot"])
  {
    id v4 = [(NSSConnectionHandler *)self delegate];
    [v4 rebootDevice];
  }
  else
  {
    v3 = NSSLogForType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Discarding request due to missing entitlement", buf, 2u);
    }
  }
}

- (void)getLegalDocuments:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"legal"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 getLegalDocuments:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)getLocalesInfo:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"locales"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 getLocalesInfo:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)getWatchFaces:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"watchfaces"])
  {
    id v5 = [(NSSConnectionHandler *)self delegate];
    [v5 getWatchFaces:v4];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"watchfaces"])
  {
    id v10 = [(NSSConnectionHandler *)self delegate];
    [v10 setWatchFaceIdentifier:v11 forFocusModeIdentifier:v8 completionHandler:v9];
  }
  else
  {
    id v10 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v9[2](v9, v10);
  }
}

- (void)fetchBetaEnrollmentStatus:(id)a3
{
  id v4 = a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"betaenrollment"])
  {
    id v7 = [(NSSConnectionHandler *)self delegate];
    [v7 fetchBetaEnrollmentStatus:v4];
  }
  else
  {
    id v5 = NSSLogForType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[NSSCompanionConnectionHandler fetchBetaEnrollmentStatus:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Discarding request due to missing entitlement", buf, 0xCu);
    }

    BOOL v6 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

- (void)updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:@"betaenrollment"])
  {
    id v10 = [(NSSConnectionHandler *)self delegate];
    [v10 updateBetaEnrollmentStatus:v8 requiresUnenroll:v6 withCompletion:v9];
  }
  else
  {
    id v11 = NSSLogForType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[NSSCompanionConnectionHandler updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Discarding request due to missing entitlement", (uint8_t *)&v13, 0xCu);
    }

    v12 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

@end