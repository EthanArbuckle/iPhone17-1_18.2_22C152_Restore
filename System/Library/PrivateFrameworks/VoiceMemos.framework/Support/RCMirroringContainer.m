@interface RCMirroringContainer
- (RCMirroringContainer)initWithURL:(id)a3;
- (id)mirroringDelegate;
- (id)storeDescriptionWithURL:(id)a3;
@end

@implementation RCMirroringContainer

- (RCMirroringContainer)initWithURL:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)RCMirroringContainer;
  v3 = [(RCMirroringContainer *)&v13 initWithURL:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(RCMirroringContainer *)v3 persistentContainer];
  v6 = [v5 persistentStoreCoordinator];
  v7 = [v6 persistentStores];
  v8 = [v7 firstObject];

  v9 = objc_msgSend(v8, "rc_mirroringDelegate");

  if (v9)
  {

LABEL_4:
    v10 = v4;
    goto LABEL_8;
  }
  v11 = OSLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    sub_10002257C((uint64_t)v8, v11);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (id)storeDescriptionWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() storeDescriptionForURL:v4 isXPCClient:0 configuration:RCCloudConfiguration];

  v6 = [(RCMirroringContainer *)self mirroringDelegate];
  [v5 setOption:v6 forMirroringKey:NSPersistentStoreMirroringDelegateOptionKey];
  v7 = (RCRegulatoryLogger *)objc_opt_new();
  regulatoryLogger = self->_regulatoryLogger;
  self->_regulatoryLogger = v7;

  return v5;
}

- (id)mirroringDelegate
{
  mirroringDelegate = self->_mirroringDelegate;
  if (!mirroringDelegate)
  {
    id v4 = objc_alloc_init((Class)CKContainerOptions);
    [v4 setApplicationBundleIdentifierOverride:RCVoiceMemosBundleID];
    v5 = RCSavedRecordingsCloudKitContainerIdentifier();
    v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      v12 = "-[RCMirroringContainer mirroringDelegate]";
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s -- Creating mirroring delegate using %@", (uint8_t *)&v11, 0x16u);
    }

    id v7 = [objc_alloc((Class)NSCloudKitMirroringDelegateOptions) initWithContainerIdentifier:v5];
    [v7 setAutomaticallyScheduleImportAndExportOperations:1];
    [v7 setApsConnectionMachServiceName:@"com.apple.aps.voicememod"];
    [v7 setContainerOptions:v4];
    v8 = (NSCloudKitMirroringDelegate *)[objc_alloc((Class)NSCloudKitMirroringDelegate) initWithOptions:v7];
    v9 = self->_mirroringDelegate;
    self->_mirroringDelegate = v8;

    mirroringDelegate = self->_mirroringDelegate;
  }
  return mirroringDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_mirroringDelegate, 0);
}

@end