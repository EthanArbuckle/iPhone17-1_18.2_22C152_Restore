@interface SUSUISoftwareUpdateStatePersistence
- (BOOL)downloadWasQueuedRemotely;
- (NSDate)nextAlertDate;
- (SUInstallPolicy)currentInstallationPolicy;
- (SUSUISoftwareUpdateStatePersistence)initWithDefaults:(id)a3;
- (id)description;
- (int64_t)autoUpdateRetryCount;
- (int64_t)remindMeLaterCountForCurrentUpdate;
- (int64_t)remindMeLaterCountSinceRequiringInstallation;
- (unint64_t)alertFlow;
- (unint64_t)nextAlertRepopStrategy;
- (void)_clear;
- (void)_load;
- (void)_setNextAlertDate:(id)a3;
- (void)_setNextAlertRepopStrategy:(unint64_t)a3;
- (void)save;
- (void)setAlertFlow:(unint64_t)a3;
- (void)setAutoUpdateRetryCount:(int64_t)a3;
- (void)setCurrentInstallationPolicy:(id)a3;
- (void)setDownloadWasQueuedRemotely:(BOOL)a3;
- (void)setNextAlertRepopStrategy:(unint64_t)a3 withNextAlertDate:(id)a4;
- (void)setRemindMeLaterCountForCurrentUpdate:(int64_t)a3;
- (void)setRemindMeLaterCountSinceRequiringInstallation:(int64_t)a3;
@end

@implementation SUSUISoftwareUpdateStatePersistence

- (SUSUISoftwareUpdateStatePersistence)initWithDefaults:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSUISoftwareUpdateStatePersistence;
  v6 = [(SUSUISoftwareUpdateStatePersistence *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    objc_storeStrong((id *)&v9->_nextAlertScheduledDate, 0);
    objc_storeStrong((id *)&v9->_installPolicy, 0);
    v9->_remindMeLaterCountForCurrentUpdate = 0;
    v9->_remindMeLaterCountSinceRequiringInstallation = 0;
    v9->_alertFlow = 0;
    v9->_downloadWasQueuedRemotely = 0;
    objc_storeStrong((id *)&v9->_defaults, location[0]);
    v9->_autoUpdateRetryCount = 0;
    [(SUSUISoftwareUpdateStatePersistence *)v9 _load];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)setNextAlertRepopStrategy:(unint64_t)a3 withNextAlertDate:(id)a4
{
  objc_super v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  [(SUSUISoftwareUpdateStatePersistence *)v7 _setNextAlertDate:location];
  [(SUSUISoftwareUpdateStatePersistence *)v7 _setNextAlertRepopStrategy:v5];
  objc_storeStrong(&location, 0);
}

- (id)description
{
  v18 = self;
  v17[1] = (id)a2;
  v17[0] = +[BSDescriptionBuilder builderWithObject:self];
  if (v18->_nextAlertScheduledDate)
  {
    id v16 = +[SUUtility prettyPrintDate:v18->_nextAlertScheduledDate];
    id v2 = objc_msgSend(v17[0], "appendObject:withName:");
  }
  id v11 = v17[0];
  v12 = SUSUIStringForInstallAlertRepopStrategy(v18->_nextAlertRepopStrategy);
  id v3 = objc_msgSend(v11, "appendObject:withName:");

  id v13 = v17[0];
  v14 = SUSUIStringForInstallAlertFlow(v18->_alertFlow);
  id v4 = objc_msgSend(v13, "appendObject:withName:");

  id v5 = [v17[0] appendBool:v18->_downloadWasQueuedRemotely withName:@"DownloadWasQueuedRemotely"];
  id v6 = [v17[0] appendInteger:v18->_remindMeLaterCountForCurrentUpdate withName:@"RemindMeLaterCountForCurrentUpdate"];
  id v7 = [v17[0] appendInteger:v18->_remindMeLaterCountSinceRequiringInstallation withName:@"RemindMeLaterCountSinceRequiringUpdates"];
  id v8 = [v17[0] appendObject:v18->_installPolicy withName:@"InstallPolicy"];
  id v9 = [v17[0] appendInteger:v18->_autoUpdateRetryCount withName:@"AutoUpdateRetryCount"];
  id v15 = [v17[0] build];
  objc_storeStrong(v17, 0);

  return v15;
}

- (void)save
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = +[NSMutableDictionary dictionary];
  id v6 = +[NSNumber numberWithBool:v15->_downloadWasQueuedRemotely];
  objc_msgSend(v14[0], "setObject:forKey:");

  id v7 = +[NSNumber numberWithUnsignedInteger:v15->_alertFlow];
  objc_msgSend(v14[0], "setObject:forKey:");

  id v8 = +[NSNumber numberWithInteger:v15->_remindMeLaterCountForCurrentUpdate];
  objc_msgSend(v14[0], "setObject:forKey:");

  id v9 = +[NSNumber numberWithInteger:v15->_remindMeLaterCountSinceRequiringInstallation];
  objc_msgSend(v14[0], "setObject:forKey:");

  if (v15->_nextAlertScheduledDate) {
    [v14[0] setObject:v15->_nextAlertScheduledDate forKey:@"SUSUISoftwareUpdateAlertRepopDate"];
  }
  id v4 = +[NSNumber numberWithUnsignedInteger:v15->_nextAlertRepopStrategy];
  objc_msgSend(v14[0], "setObject:forKey:");

  id v5 = +[NSNumber numberWithInteger:v15->_autoUpdateRetryCount];
  objc_msgSend(v14[0], "setObject:forKey:");

  id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v15->_installPolicy];
  if (v13) {
    [v14[0] setObject:v13 forKey:@"SUSUISoftwareUpdateStateInstallPolicyKey"];
  }
  [(SUSUISoftwareUpdateDefaults *)v15->_defaults setSoftwareUpdateState:v14[0]];
  id location = (id)SUSUILog();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    log = location;
    os_log_type_t type = v11;
    sub_5A1C(v10);
    _os_log_impl(&def_46F0, log, type, "[Persistence] Saved persistence state.", v10, 2u);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
}

- (void)_clear
{
}

- (void)_load
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = [(SUSUISoftwareUpdateDefaults *)self->_defaults softwareUpdateState];
  id v11 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateAlertFlow", objc_opt_class());
  if (v11)
  {
    id v10 = [v11 unsignedIntegerValue];
    if ((unint64_t)v10 > 4) {
      [(SUSUISoftwareUpdateStatePersistence *)v13 setAlertFlow:0];
    }
    else {
      [(SUSUISoftwareUpdateStatePersistence *)v13 setAlertFlow:v10];
    }
  }
  id v9 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateAlertRepopDate", objc_opt_class());
  if (v9) {
    [(SUSUISoftwareUpdateStatePersistence *)v13 _setNextAlertDate:v9];
  }
  id v8 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateAlertRepopStrategy", objc_opt_class());
  if (v8) {
    -[SUSUISoftwareUpdateStatePersistence _setNextAlertRepopStrategy:](v13, "_setNextAlertRepopStrategy:", [v8 unsignedIntegerValue]);
  }
  else {
    [(SUSUISoftwareUpdateStatePersistence *)v13 _setNextAlertRepopStrategy:0];
  }
  id v7 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateDownloadWasQueuedRemotely", objc_opt_class());
  if (v7) {
    -[SUSUISoftwareUpdateStatePersistence setDownloadWasQueuedRemotely:](v13, "setDownloadWasQueuedRemotely:", (unint64_t)[v7 BOOLValue] & 1);
  }
  id v6 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateStateAlertRemindMeLaterCount", objc_opt_class());
  if (v6) {
    -[SUSUISoftwareUpdateStatePersistence setRemindMeLaterCountForCurrentUpdate:](v13, "setRemindMeLaterCountForCurrentUpdate:", [v6 integerValue]);
  }
  id v5 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateStateInstallPolicyKey", objc_opt_class());
  if (v5)
  {
    id location = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUSUISoftwareUpdateStatePersistence *)v13 setCurrentInstallationPolicy:location];
    }
    objc_storeStrong(&location, 0);
  }
  id v3 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateStateAlertRemindMeLaterCountSinceRequiringInstallation", objc_opt_class());
  if (v3) {
    -[SUSUISoftwareUpdateStatePersistence setRemindMeLaterCountSinceRequiringInstallation:](v13, "setRemindMeLaterCountSinceRequiringInstallation:", [v3 integerValue]);
  }
  id v2 = objc_msgSend(v12[0], "bs_safeObjectForKey:ofType:", @"SUSUISoftwareUpdateStateAlertAutoUpdateRetryCount", objc_opt_class());
  if (v2) {
    -[SUSUISoftwareUpdateStatePersistence setAutoUpdateRetryCount:](v13, "setAutoUpdateRetryCount:", [v2 integerValue]);
  }
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
}

- (unint64_t)alertFlow
{
  return self->_alertFlow;
}

- (void)setAlertFlow:(unint64_t)a3
{
  self->_alertFlow = a3;
}

- (NSDate)nextAlertDate
{
  return self->_nextAlertScheduledDate;
}

- (void)_setNextAlertDate:(id)a3
{
}

- (BOOL)downloadWasQueuedRemotely
{
  return self->_downloadWasQueuedRemotely;
}

- (void)setDownloadWasQueuedRemotely:(BOOL)a3
{
  self->_downloadWasQueuedRemotely = a3;
}

- (unint64_t)nextAlertRepopStrategy
{
  return self->_nextAlertRepopStrategy;
}

- (void)_setNextAlertRepopStrategy:(unint64_t)a3
{
  self->_nextAlertRepopStrategy = a3;
}

- (int64_t)remindMeLaterCountForCurrentUpdate
{
  return self->_remindMeLaterCountForCurrentUpdate;
}

- (void)setRemindMeLaterCountForCurrentUpdate:(int64_t)a3
{
  self->_remindMeLaterCountForCurrentUpdate = a3;
}

- (int64_t)remindMeLaterCountSinceRequiringInstallation
{
  return self->_remindMeLaterCountSinceRequiringInstallation;
}

- (void)setRemindMeLaterCountSinceRequiringInstallation:(int64_t)a3
{
  self->_remindMeLaterCountSinceRequiringInstallation = a3;
}

- (SUInstallPolicy)currentInstallationPolicy
{
  return self->_installPolicy;
}

- (void)setCurrentInstallationPolicy:(id)a3
{
}

- (int64_t)autoUpdateRetryCount
{
  return self->_autoUpdateRetryCount;
}

- (void)setAutoUpdateRetryCount:(int64_t)a3
{
  self->_autoUpdateRetryCount = a3;
}

- (void).cxx_destruct
{
}

@end