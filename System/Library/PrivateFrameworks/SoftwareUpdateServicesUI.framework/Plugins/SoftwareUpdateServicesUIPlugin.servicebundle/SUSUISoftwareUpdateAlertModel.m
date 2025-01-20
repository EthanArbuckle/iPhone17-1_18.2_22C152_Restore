@interface SUSUISoftwareUpdateAlertModel
- (BOOL)autoUpdateEnabled;
- (NSDate)nextAlertDate;
- (SUInstallPolicy)currentInstallationPolicy;
- (SUSUISoftwareUpdateAlertModel)initWithDefaults:(id)a3;
- (SUSUISoftwareUpdateAlertModel)initWithDownload:(id)a3 autoInstallOperation:(id)a4 defaults:(id)a5;
- (SUSUISoftwareUpdateAlertModelDelegate)delegate;
- (id)_initWithDownload:(id)a3 autoInstallOperation:(id)a4 defaults:(id)a5 persistence:(id)a6;
- (int64_t)autoUpdateRetryCount;
- (int64_t)remindMeLaterCountForCurrentUpdate;
- (int64_t)remindMeLaterCountSinceRequiringInstallation;
- (unint64_t)_initialInstallAlertFlowFromDownload;
- (unint64_t)alertFlow;
- (unint64_t)nextAlertRepopStrategy;
- (void)_rationalizePersistenceIntoModelWithDownload:(id)a3 autoInstallOperation:(id)a4;
- (void)_setAutoUpdateRetryCount:(int64_t)a3;
- (void)_setDownloadWasQueuedRemotely:(BOOL)a3;
- (void)_setInstallAlertFlow:(unint64_t)a3 forReason:(id)a4;
- (void)_setPersistedInstallAlertRepopStrategy:(unint64_t)a3 withFireDate:(id)a4;
- (void)_setRemindMeLaterCountForCurrentUpdate:(int64_t)a3;
- (void)_setRemindMeLaterCountSinceRequiringInstallation:(int64_t)a3;
- (void)_setUpdateToInstall:(id)a3;
- (void)autoInstallOperationEnded:(unint64_t)a3;
- (void)autoUpdateExpired;
- (void)countdownAlertPresentationPreventedForReasons:(id)a3;
- (void)didFinishDownloading:(id)a3;
- (void)resetTransientDownloadState;
- (void)setCurrentInstallationPolicy:(id)a3 forReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDownloadWasQueuedRemotely:(BOOL)a3;
- (void)setPersistedInstallAlertRepopStrategy:(unint64_t)a3 withFireDate:(id)a4;
- (void)userSelectedRemindMeLater;
- (void)willInstallWithType:(unint64_t)a3;
@end

@implementation SUSUISoftwareUpdateAlertModel

- (SUSUISoftwareUpdateAlertModel)initWithDefaults:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = [(SUSUISoftwareUpdateAlertModel *)v3 initWithDownload:0 autoInstallOperation:0 defaults:location[0]];
  v5 = v7;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v7, 0);
  return v5;
}

- (SUSUISoftwareUpdateAlertModel)initWithDownload:(id)a3 autoInstallOperation:(id)a4 defaults:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  v12 = v18;
  id v9 = location[0];
  id v10 = v16;
  id v11 = v15;
  v5 = [SUSUISoftwareUpdateStatePersistence alloc];
  v13 = [(SUSUISoftwareUpdateStatePersistence *)v5 initWithDefaults:v15];
  v18 = 0;
  v18 = -[SUSUISoftwareUpdateAlertModel _initWithDownload:autoInstallOperation:defaults:persistence:](v12, "_initWithDownload:autoInstallOperation:defaults:persistence:", v9, v10, v11);
  v14 = v18;

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v14;
}

- (id)_initWithDownload:(id)a3 autoInstallOperation:(id)a4 defaults:(id)a5 persistence:(id)a6
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  v6 = v21;
  v21 = 0;
  v16.receiver = v6;
  v16.super_class = (Class)SUSUISoftwareUpdateAlertModel;
  v12 = [(SUSUISoftwareUpdateAlertModel *)&v16 init];
  v21 = v12;
  objc_storeStrong((id *)&v21, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v21->_persistence, v17);
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      sub_8120((uint64_t)v23, (uint64_t)v21->_persistence);
      _os_log_impl(&def_46F0, (os_log_t)v15, v14, "Software update persistence initialized: %{public}@", v23, 0xCu);
    }
    objc_storeStrong(&v15, 0);
    [(SUSUISoftwareUpdateAlertModel *)v21 _rationalizePersistenceIntoModelWithDownload:location[0] autoInstallOperation:v19];
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_8120((uint64_t)v22, (uint64_t)v21->_persistence);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Software update persistence rationalized into model: %{public}@", v22, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v8 = v21;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v8;
}

- (unint64_t)alertFlow
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence alertFlow];
}

- (NSDate)nextAlertDate
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence nextAlertDate];
}

- (unint64_t)nextAlertRepopStrategy
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence nextAlertRepopStrategy];
}

- (int64_t)remindMeLaterCountForCurrentUpdate
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence remindMeLaterCountForCurrentUpdate];
}

- (int64_t)remindMeLaterCountSinceRequiringInstallation
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence remindMeLaterCountSinceRequiringInstallation];
}

- (int64_t)autoUpdateRetryCount
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence autoUpdateRetryCount];
}

- (BOOL)autoUpdateEnabled
{
  v3 = [(SUSUISoftwareUpdateStatePersistence *)self->_persistence currentInstallationPolicy];
  unsigned __int8 v4 = [(SUInstallPolicy *)v3 autoUpdateEnabled];

  return v4 & 1;
}

- (SUInstallPolicy)currentInstallationPolicy
{
  return [(SUSUISoftwareUpdateStatePersistence *)self->_persistence currentInstallationPolicy];
}

- (void)setCurrentInstallationPolicy:(id)a3 forReason:(id)a4
{
  os_log_type_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = [(SUSUISoftwareUpdateAlertModel *)v14 currentInstallationPolicy];
  char v8 = 0;
  if (location[0])
  {
    id v4 = location[0];
  }
  else
  {
    id v9 = objc_alloc_init((Class)SUInstallPolicy);
    char v8 = 1;
    id v4 = v9;
  }
  id v10 = v4;
  if (v8) {

  }
  if (([v11 isEqual:v10] & 1) == 0)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_8A10((uint64_t)v15, (uint64_t)v12, (uint64_t)v10);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Persistence] Install policy changed (reason: %{public}@) to: %{public}@", v15, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v14->_persistence setCurrentInstallationPolicy:v10];
    if ([v10 type] != (char *)&def_46F0 + 1) {
      [(SUSUISoftwareUpdateAlertModel *)v14 _setRemindMeLaterCountSinceRequiringInstallation:0];
    }
    int v5 = [v10 autoUpdateEnabled] & 1;
    if (v5 != ([v11 autoUpdateEnabled] & 1))
    {
      if ([v10 autoUpdateEnabled]) {
        [(SUSUISoftwareUpdateAlertModel *)v14 _setInstallAlertFlow:5 forReason:@"install policy has auto update enabled"];
      }
      else {
        [(SUSUISoftwareUpdateAlertModel *)v14 _setInstallAlertFlow:1 forReason:@"Auto Update disabled"];
      }
    }
    [(SUSUISoftwareUpdateStatePersistence *)v14->_persistence save];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)resetTransientDownloadState
{
  -[SUSUISoftwareUpdateAlertModel _setUpdateToInstall:](self, "_setUpdateToInstall:");
  [(SUSUISoftwareUpdateAlertModel *)self _setDownloadWasQueuedRemotely:0];
  -[SUSUISoftwareUpdateAlertModel _setInstallAlertFlow:forReason:](self, "_setInstallAlertFlow:forReason:");
  [(SUSUISoftwareUpdateAlertModel *)self _setPersistedInstallAlertRepopStrategy:0 withFireDate:0];
  [(SUSUISoftwareUpdateAlertModel *)self _setRemindMeLaterCountForCurrentUpdate:0];
  [(SUSUISoftwareUpdateAlertModel *)self _setAutoUpdateRetryCount:0];
  v2 = [(SUSUISoftwareUpdateAlertModel *)self currentInstallationPolicy];
  BOOL v3 = [(SUInstallPolicy *)v2 type] == (char *)&def_46F0 + 1;

  if (!v3) {
    [(SUSUISoftwareUpdateAlertModel *)self _setRemindMeLaterCountSinceRequiringInstallation:0];
  }
}

- (void)userSelectedRemindMeLater
{
  if (self->_updateToInstall)
  {
    [(SUSUISoftwareUpdateAlertModel *)self _setRemindMeLaterCountForCurrentUpdate:(char *)[(SUSUISoftwareUpdateAlertModel *)self remindMeLaterCountForCurrentUpdate]+ 1];
    int v5 = [(SUSUISoftwareUpdateAlertModel *)self currentInstallationPolicy];
    BOOL v6 = [(SUInstallPolicy *)v5 type] != (char *)&def_46F0 + 1;

    if (!v6) {
      [(SUSUISoftwareUpdateAlertModel *)self _setRemindMeLaterCountSinceRequiringInstallation:(char *)[(SUSUISoftwareUpdateAlertModel *)self remindMeLaterCountSinceRequiringInstallation]+ 1];
    }
    unint64_t v2 = [(SUSUISoftwareUpdateStatePersistence *)self->_persistence alertFlow];
    if (v2)
    {
      unint64_t v4 = v2;
      char v3 = 1;
    }
    else
    {
      unint64_t v4 = 0;
      char v3 = 0;
    }
    if ((v3 & 1) == 0)
    {
      switch(v4)
      {
        case 0uLL:
        case 4uLL:
          return;
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 5uLL:
          [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:4 forReason:@"User selected 'Remind me later'"];
          break;
        default:
          JUMPOUT(0);
      }
    }
  }
}

- (void)autoInstallOperationEnded:(unint64_t)a3
{
  unint64_t v3 = [(SUSUISoftwareUpdateStatePersistence *)self->_persistence alertFlow];
  if (v3)
  {
    unint64_t v5 = v3;
    char v4 = 1;
  }
  else
  {
    unint64_t v5 = 0;
    char v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    switch(v5)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 4uLL:
        return;
      case 3uLL:
        [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:4 forReason:@"Auto install operation was cancelled or expired."];
        break;
      case 5uLL:
        if (a3 == 1)
        {
          if ([(SUSUISoftwareUpdateAlertModel *)self autoUpdateRetryCount] >= 30) {
            [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:4 forReason:@"Auto install operation expired 7 days in a row."];
          }
          else {
            [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:5 forReason:@"Auto install operation expired."];
          }
        }
        else if (!a3)
        {
          [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:4 forReason:@"Auto install operation was cancelled"];
        }
        break;
      default:
        JUMPOUT(0);
    }
  }
}

- (void)autoUpdateExpired
{
  if ((char *)[(SUSUISoftwareUpdateStatePersistence *)self->_persistence alertFlow] == (char *)&dword_4 + 1) {
    [(SUSUISoftwareUpdateAlertModel *)self _setAutoUpdateRetryCount:(char *)[(SUSUISoftwareUpdateAlertModel *)self autoUpdateRetryCount] + 1];
  }
  else {
    [(SUSUISoftwareUpdateAlertModel *)self _setAutoUpdateRetryCount:0];
  }
}

- (void)setDownloadWasQueuedRemotely:(BOOL)a3
{
}

- (void)didFinishDownloading:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateAlertModel *)v4 _setUpdateToInstall:location[0]];
  [(SUSUISoftwareUpdateAlertModel *)v4 _setInstallAlertFlow:[(SUSUISoftwareUpdateAlertModel *)v4 _initialInstallAlertFlowFromDownload] forReason:@"Download completed"];
  objc_storeStrong(location, 0);
}

- (void)willInstallWithType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:3 forReason:@"Install tonight chosen"];
    }
    else if (a3 == 2)
    {
      [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:5 forReason:@"Auto update enabled"];
    }
  }
  else
  {
    [(SUSUISoftwareUpdateAlertModel *)self _setInstallAlertFlow:4 forReason:@"Install now chosen"];
  }
}

- (void)setPersistedInstallAlertRepopStrategy:(unint64_t)a3 withFireDate:(id)a4
{
  v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  [(SUSUISoftwareUpdateAlertModel *)v7 _setPersistedInstallAlertRepopStrategy:v5 withFireDate:location];
  objc_storeStrong(&location, 0);
}

- (void)countdownAlertPresentationPreventedForReasons:(id)a3
{
  unint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((char *)[(SUSUISoftwareUpdateStatePersistence *)v5->_persistence alertFlow] == (char *)&def_46F0 + 2)
  {
    unint64_t v3 = +[NSString stringWithFormat:@"Installation countdown alert prevented for reason %@", location[0]];
    [(SUSUISoftwareUpdateAlertModel *)v5 _setInstallAlertFlow:1 forReason:v3];
    objc_storeStrong((id *)&v3, 0);
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)_initialInstallAlertFlowFromDownload
{
  v21 = self;
  SEL v20 = a2;
  char v19 = 0;
  id v10 = [(SUDownload *)self->_updateToInstall metadata];
  unsigned __int8 v11 = [v10 isAutoDownload];

  char v19 = v11 & 1;
  if ((v11 & 1) != 0 && [(SUSUISoftwareUpdateAlertModel *)v21 autoUpdateEnabled]) {
    return 5;
  }
  char v18 = 0;
  char v18 = [(SUSUISoftwareUpdateStatePersistence *)v21->_persistence downloadWasQueuedRemotely];
  char v17 = 0;
  id v6 = [(SUDownload *)v21->_updateToInstall metadata];
  unsigned __int8 v7 = [v6 isDownloadOnly];

  char v17 = v7 & 1;
  char v16 = 0;
  id v8 = [(SUDownload *)v21->_updateToInstall downloadOptions];
  unsigned __int8 v9 = [v8 userUpdateTonight];

  char v16 = v9 & 1;
  uint64_t v15 = 0;
  if (v9)
  {
    uint64_t v15 = 3;
  }
  else if (v19 & 1) != 0 || (v17 & 1) != 0 || (v18)
  {
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 2;
  }
  id v14 = (id)SUSUILog();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    unint64_t v5 = SUSUIStringForInstallAlertFlow(v15);
    id v12 = v5;
    sub_3BE54((uint64_t)v23, (uint64_t)"-[SUSUISoftwareUpdateAlertModel _initialInstallAlertFlowFromDownload]", v19 & 1, v18 & 1, v17 & 1, v16 & 1, (uint64_t)v12);
    _os_log_impl(&def_46F0, log, type, "%s identified autoDownload=%d, queuedRemotely=%d, downloadOnly=%d, userUpdateTonight=%d, returning flow: %@", v23, 0x2Eu);

    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15;
}

- (void)_setInstallAlertFlow:(unint64_t)a3 forReason:(id)a4
{
  char v18 = self;
  SEL v17 = a2;
  unint64_t v16 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v14 = 0;
  id v14 = [(SUSUISoftwareUpdateStatePersistence *)v18->_persistence alertFlow];
  if (v14 != (id)v16)
  {
    id v13 = (id)SUSUILog();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      log = v13;
      os_log_type_t type = v12;
      unsigned __int8 v9 = SUSUIStringForInstallAlertFlow((uint64_t)v14);
      unint64_t v5 = v9;
      unsigned __int8 v11 = v5;
      id v8 = SUSUIStringForInstallAlertFlow(v16);
      id v10 = v8;
      sub_3C100((uint64_t)v19, (uint64_t)v5, (uint64_t)v10, (uint64_t)location);
      _os_log_impl(&def_46F0, log, type, "[Persistence] Install alert flow changed from: %{public}@ to: %{public}@ for reason: %{public}@", v19, 0x20u);

      objc_storeStrong((id *)&v10, 0);
      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong(&v13, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v18->_persistence setAlertFlow:v16];
    [(SUSUISoftwareUpdateStatePersistence *)v18->_persistence save];
    id WeakRetained = objc_loadWeakRetained((id *)&v18->_delegate);
    [WeakRetained alertModel:v18 alertFlowDidChangeFrom:v14 to:v16];
  }
  objc_storeStrong(&location, 0);
}

- (void)_setPersistedInstallAlertRepopStrategy:(unint64_t)a3 withFireDate:(id)a4
{
  v21 = self;
  SEL v20 = a2;
  unint64_t v19 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v17 = 0;
  char v4 = [(SUSUISoftwareUpdateStatePersistence *)v21->_persistence nextAlertDate];
  BOOL v11 = v4 != location;

  BOOL v17 = v11;
  BOOL v16 = 0;
  id v5 = [(SUSUISoftwareUpdateStatePersistence *)v21->_persistence nextAlertRepopStrategy];
  BOOL v16 = v5 != (id)v19;
  if (v11 || v16)
  {
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      os_log_type_t type = v14;
      id v10 = +[SUUtility prettyPrintDate:location];
      id v6 = v10;
      id v13 = v6;
      unsigned __int8 v9 = SUSUIStringForInstallAlertRepopStrategy(v19);
      os_log_type_t v12 = v9;
      sub_8A10((uint64_t)v22, (uint64_t)v6, (uint64_t)v12);
      _os_log_impl(&def_46F0, log, type, "[Persistence] Next install alert date changed to: %{public}@ for repop strategy: %{public}@", v22, 0x16u);

      objc_storeStrong((id *)&v12, 0);
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v15, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v21->_persistence setNextAlertRepopStrategy:v19 withNextAlertDate:location];
    [(SUSUISoftwareUpdateStatePersistence *)v21->_persistence save];
  }
  objc_storeStrong(&location, 0);
}

- (void)_setDownloadWasQueuedRemotely:(BOOL)a3
{
  unsigned __int8 v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  if ([(SUSUISoftwareUpdateStatePersistence *)self->_persistence downloadWasQueuedRemotely] != a3)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        CFStringRef v3 = @"YES";
      }
      else {
        CFStringRef v3 = @"NO";
      }
      sub_8120((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Persistence] Setting download was queued remotely: %{public}@", v8, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v7->_persistence setDownloadWasQueuedRemotely:v5];
    [(SUSUISoftwareUpdateStatePersistence *)v7->_persistence save];
  }
}

- (void)_setUpdateToInstall:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_updateToInstall != location[0]) {
    objc_storeStrong((id *)&v4->_updateToInstall, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_setRemindMeLaterCountForCurrentUpdate:(int64_t)a3
{
  SEL v6 = self;
  SEL v5 = a2;
  uint64_t v4 = a3;
  if ([(SUSUISoftwareUpdateStatePersistence *)self->_persistence remindMeLaterCountForCurrentUpdate] != a3)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v7, v4);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Persistence] Setting remind me later count (current update): %ld", v7, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v6->_persistence setRemindMeLaterCountForCurrentUpdate:v4];
    [(SUSUISoftwareUpdateStatePersistence *)v6->_persistence save];
  }
}

- (void)_setRemindMeLaterCountSinceRequiringInstallation:(int64_t)a3
{
  SEL v6 = self;
  SEL v5 = a2;
  uint64_t v4 = a3;
  if ([(SUSUISoftwareUpdateStatePersistence *)self->_persistence remindMeLaterCountSinceRequiringInstallation] != a3)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v7, v4);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Persistence] Setting remind me later count (since requiring updates): %ld", v7, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v6->_persistence setRemindMeLaterCountSinceRequiringInstallation:v4];
    [(SUSUISoftwareUpdateStatePersistence *)v6->_persistence save];
  }
}

- (void)_setAutoUpdateRetryCount:(int64_t)a3
{
  SEL v6 = self;
  SEL v5 = a2;
  uint64_t v4 = a3;
  if ([(SUSUISoftwareUpdateStatePersistence *)self->_persistence autoUpdateRetryCount] != a3)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v7, v4);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Persistence] Setting auto update retry count: %ld", v7, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateStatePersistence *)v6->_persistence setAutoUpdateRetryCount:v4];
    [(SUSUISoftwareUpdateStatePersistence *)v6->_persistence save];
  }
}

- (void)_rationalizePersistenceIntoModelWithDownload:(id)a3 autoInstallOperation:(id)a4
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  uint64_t v4 = [(SUSUISoftwareUpdateStatePersistence *)v33->_persistence currentInstallationPolicy];
  BOOL v21 = v4 != 0;

  if (!v21)
  {
    char v18 = v33;
    id v19 = objc_alloc_init((Class)SUInstallPolicy);
    -[SUSUISoftwareUpdateAlertModel setCurrentInstallationPolicy:forReason:](v18, "setCurrentInstallationPolicy:forReason:");
  }
  BOOL v16 = [(SUSUISoftwareUpdateStatePersistence *)v33->_persistence currentInstallationPolicy];
  BOOL v17 = [(SUInstallPolicy *)v16 type] == (char *)&def_46F0 + 1;

  if (!v17) {
    [(SUSUISoftwareUpdateStatePersistence *)v33->_persistence setRemindMeLaterCountSinceRequiringInstallation:0];
  }
  if (location[0])
  {
    [(SUSUISoftwareUpdateAlertModel *)v33 _setUpdateToInstall:location[0]];
    id v30 = [(SUSUISoftwareUpdateStatePersistence *)v33->_persistence nextAlertDate];
    if (v30)
    {
      id v29 = +[NSDate date];
      id v5 = [v30 earlierDate:v29];
      BOOL v15 = v5 != v30;

      if (!v15)
      {
        id v28 = (id)SUSUILog();
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
        {
          log = v28;
          os_log_type_t type = v27;
          sub_5A1C(v26);
          _os_log_impl(&def_46F0, log, type, "[Persistence] Rationalizing persistence - alert date found but has already passed, so we'll set the next alert repop strategy to \"when able\".", v26, 2u);
        }
        objc_storeStrong(&v28, 0);
        [(SUSUISoftwareUpdateAlertModel *)v33 _setPersistedInstallAlertRepopStrategy:6 withFireDate:0];
      }
      objc_storeStrong(&v29, 0);
    }
    if (![(SUSUISoftwareUpdateStatePersistence *)v33->_persistence alertFlow])
    {
      id v25 = [(SUSUISoftwareUpdateAlertModel *)v33 _initialInstallAlertFlowFromDownload];
      if ([v31 _isEffectivelyScheduled])
      {
        BOOL v11 = [(SUSUISoftwareUpdateStatePersistence *)v33->_persistence currentInstallationPolicy];
        unsigned __int8 v12 = [(SUInstallPolicy *)v11 autoUpdateEnabled];

        if (v12) {
          id v25 = &dword_4 + 1;
        }
        else {
          id v25 = &def_46F0 + 3;
        }
      }
      id v8 = v33;
      id v10 = SUSUIStringForInstallAlertFlow((uint64_t)v25);
      unsigned __int8 v9 = objc_retainAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Rationalizing persistence -- bad persistence state detected; fixing up alert flow to: \"%@\" based on update to install.",
               v10));
      -[SUSUISoftwareUpdateAlertModel _setInstallAlertFlow:forReason:](v8, "_setInstallAlertFlow:forReason:", v25);
    }
    objc_storeStrong(&v30, 0);
  }
  else
  {
    id v24 = (id)SUSUILog();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      SEL v6 = v24;
      os_log_type_t v7 = v23;
      sub_5A1C(v22);
      _os_log_impl(&def_46F0, v6, v7, "[Persistence] Rationalizing persistence -- bad persistence state detected; no SU download detected - resetting t"
        "ransient download state.",
        v22,
        2u);
    }
    objc_storeStrong(&v24, 0);
    [(SUSUISoftwareUpdateAlertModel *)v33 resetTransientDownloadState];
  }
  [(SUSUISoftwareUpdateStatePersistence *)v33->_persistence save];
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (SUSUISoftwareUpdateAlertModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUSUISoftwareUpdateAlertModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end