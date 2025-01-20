@interface MBPrebuddyFollowUpController
+ (id)connection;
- (MBHelperServiceProtocol)proxy;
- (MBPrebuddyDisabledCategoriesManager)disabledCategoriesManager;
- (MBPrebuddyFollowUpController)initWithBackupState:(id)a3;
- (MBStateInfo)backupState;
- (NSDate)megaBackupExpirationDate;
- (NSNumberFormatter)percentageFormatter;
- (id)_expirationExtensionFollowUpAction;
- (id)_initialFollowUpActionTitle:(id)a3;
- (id)_initialFollowUpMessage:(id)a3 needsTemporaryStorage:(BOOL)a4;
- (id)_initialFollowUpTitle:(id)a3;
- (id)_initialNotificationMessage:(id)a3;
- (id)_initialNotificationTitle:(id)a3;
- (id)_newPrebuddyNotification:(id)a3;
- (id)_trackOrderFollowUpAction;
- (id)_turnOnAppsBackingUpFollowUpAction;
- (id)_turnOnAppsUsingiCloudFollowUpAction;
- (void)_finishXPCWithError:(id)a3;
- (void)_postNewFollowup:(id)a3;
- (void)_postUpdateFollowupWithProgress:(id)a3;
- (void)_updateFollowUpActions:(id)a3 hasDisabledSyncCategories:(BOOL)a4 hasDisabledBackupDomains:(BOOL)a5 canTrackOrder:(BOOL)a6 allowsExpirationExtension:(BOOL)a7;
- (void)reset;
- (void)setBackupState:(id)a3;
- (void)setDisabledCategoriesManager:(id)a3;
- (void)setMegaBackupExpirationDate:(id)a3;
- (void)setPercentageFormatter:(id)a3;
- (void)setProxy:(id)a3;
- (void)startFollowup:(id)a3;
- (void)updateFollowupWithBackupProgress:(id)a3;
@end

@implementation MBPrebuddyFollowUpController

- (MBPrebuddyFollowUpController)initWithBackupState:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MBPrebuddyFollowUpController;
  v6 = [(MBPrebuddyFollowUpController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backupState, a3);
    v8 = objc_alloc_init(MBPrebuddyDisabledCategoriesManager);
    disabledCategoriesManager = v7->_disabledCategoriesManager;
    v7->_disabledCategoriesManager = v8;

    v10 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    percentageFormatter = v7->_percentageFormatter;
    v7->_percentageFormatter = v10;

    [(NSNumberFormatter *)v7->_percentageFormatter setNumberStyle:3];
    uint64_t v12 = [(id)objc_opt_class() connection];
    if (!v12) {
      __assert_rtn("-[MBPrebuddyFollowUpController initWithBackupState:]", "MBPrebuddyFollowUpController.m", 63, "connection");
    }
    v13 = (void *)v12;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001F5EB8;
    v18[3] = &unk_100411060;
    v14 = v7;
    v19 = v14;
    uint64_t v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v18];
    proxy = v14->_proxy;
    v14->_proxy = (MBHelperServiceProtocol *)v15;

    if (!v14->_proxy) {
      __assert_rtn("-[MBPrebuddyFollowUpController initWithBackupState:]", "MBPrebuddyFollowUpController.m", 68, "_proxy != nil");
    }
  }
  return v7;
}

- (void)updateFollowupWithBackupProgress:(id)a3
{
  id v4 = a3;
  [(MBPrebuddyFollowUpController *)self setBackupState:v4];
  [(MBPrebuddyFollowUpController *)self _postUpdateFollowupWithProgress:v4];
}

- (void)startFollowup:(id)a3
{
  id v4 = a3;
  if (+[MBPrebuddyManager hasPrebuddyFollowUp])
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ignoring prebuddy signal, prebuddy backup already initiated", v6, 2u);
      _MBLog();
    }
  }
  else
  {
    [(MBPrebuddyFollowUpController *)self _postNewFollowup:v4];
  }
}

- (id)_initialFollowUpTitle:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"MBServerInitialFollowUpTitleKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    MBLocalizedStringFromTable();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_initialFollowUpMessage:(id)a3 needsTemporaryStorage:(BOOL)a4
{
  id v4 = [a3 objectForKeyedSubscript:@"MBServerInitialFollowUpMessageKey"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    MBLocalizedStringFromTable();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_initialFollowUpActionTitle:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"MBServerInitialFollowUpActionTitleKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    MBLocalizedStringFromTable();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return v6;
}

- (void)_postNewFollowup:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MBMegaBackupEligibilityManager);
  id v6 = MBDeviceUUID();
  v7 = objc_msgSend(v6, "mb_backupIDByAddingCKPrefix");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001F622C;
  v9[3] = &unk_100416450;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(MBMegaBackupEligibilityManager *)v5 checkMegaBackupEligibility:1 deepLinkURL:0 backupDeviceUUID:v7 queue:&_dispatch_main_q completion:v9];
}

- (void)_postUpdateFollowupWithProgress:(id)a3
{
  id v4 = a3;
  id v61 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.backupd"];
  id v5 = [(MBPrebuddyFollowUpController *)self megaBackupExpirationDate];
  if (v5)
  {
    [v4 progress];
    float v7 = v6;
  }
  else
  {
    float v7 = 0.0;
  }

  unint64_t v8 = 60 * (void)[v4 estimatedTimeRemaining];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_1001F6FAC;
  v72 = sub_1001F6FBC;
  id v73 = 0;
  if (v8 <= 0x93A7F)
  {
    proxy = self->_proxy;
    if (!proxy) {
      __assert_rtn("-[MBPrebuddyFollowUpController _postUpdateFollowupWithProgress:]", "MBPrebuddyFollowUpController.m", 164, "_proxy != nil");
    }
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1001F6FC4;
    v67[3] = &unk_100411088;
    v67[4] = &v68;
    [(MBHelperServiceProtocol *)proxy localizedStringForEstimatedTimeRemaining:v67 reply:(double)v8];
  }
  unsigned int v10 = [v4 state];
  v11 = [MBServiceAccount alloc];
  uint64_t v12 = +[UMUserPersona currentPersona];
  id v66 = 0;
  v13 = [(MBServiceAccount *)v11 initWithPersona:v12 error:&v66];
  id v14 = v66;

  if (v13)
  {
    uint64_t v15 = +[MBCKManager sharedInstance];
    v62 = [v15 disabledDomainInfosForAccount:v13];
  }
  else
  {
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No account to get disabled domain infos: %@", buf, 0xCu);
      id v50 = v14;
      _MBLog();
    }

    v62 = 0;
    uint64_t v15 = v14;
    id v14 = 0;
  }

  if ([v62 count]) {
    BOOL v17 = v10 == 6;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  unsigned int v60 = v18;
  disabledCategoriesManager = self->_disabledCategoriesManager;
  id v65 = v14;
  objc_super v20 = -[MBPrebuddyDisabledCategoriesManager disabledSyncDataclasses:](disabledCategoriesManager, "disabledSyncDataclasses:", &v65, v50);
  id v21 = v65;

  if (!v20 && v21)
  {
    v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to get disabled sync categories to update follow up: %@", buf, 0xCu);
      id v51 = v21;
      _MBLog();
    }

    id v21 = 0;
  }
  BOOL v23 = objc_msgSend(v20, "count", v51) != 0;
  if (v10 == 6) {
    BOOL v23 = 0;
  }
  BOOL v59 = v23;
  if (v10 == 6)
  {
    v24 = MBLocalizedStringFromTable();
    v29 = MBLocalizedStringFromTable();
LABEL_40:
    BOOL v38 = 0;
    goto LABEL_41;
  }
  if (v7 < 1.0)
  {
    v24 = MBLocalizedStringFromTable();
    v25 = MBLocale();
    [(NSNumberFormatter *)self->_percentageFormatter setLocale:v25];

    percentageFormatter = self->_percentageFormatter;
    v27 = +[NSNumber numberWithDouble:v7];
    v28 = [(NSNumberFormatter *)percentageFormatter stringFromNumber:v27];

    if (v69[5])
    {
      v52 = v28;
      v53 = (void *)v69[5];
      MBLocalizedStringWithSubstitutions();
    }
    else
    {
      v52 = v28;
      MBLocalizedStringWithFormat();
    v29 = };

    goto LABEL_40;
  }
  v30 = [(MBPrebuddyFollowUpController *)self megaBackupExpirationDate];
  if (!v30) {
    __assert_rtn("-[MBPrebuddyFollowUpController _postUpdateFollowupWithProgress:]", "MBPrebuddyFollowUpController.m", 220, "self.megaBackupExpirationDate != nil");
  }

  v31 = +[NSCalendar currentCalendar];
  v32 = +[NSDate date];
  v58 = [v31 components:28 fromDate:v32];

  v33 = [(MBPrebuddyFollowUpController *)self megaBackupExpirationDate];
  v57 = [v31 components:28 fromDate:v33];

  v34 = [v31 dateFromComponents:v58];
  v56 = [v31 dateFromComponents:v57];
  v55 = v34;
  if (objc_msgSend(v34, "compare:") == (id)-1
    && (+[NSCalendar currentCalendar],
        v35 = objc_claimAutoreleasedReturnValue(),
        unsigned int v36 = [v35 isDate:v34 inSameDayAsDate:v56],
        v35,
        !v36))
  {
    v24 = MBLocalizedStringFromTable();
    id v45 = v56;
    id v54 = v55;
    v46 = +[NSCalendar currentCalendar];
    v47 = [v46 components:16 fromDate:v54 toDate:v45 options:0];

    uint64_t v48 = (uint64_t)[v47 day];
    BOOL v38 = v48 < 4;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v75 = sub_1001F6FAC;
    v76 = sub_1001F6FBC;
    v77 = &stru_100418BA8;
    v49 = self->_proxy;
    if (!v49) {
      __assert_rtn("-[MBPrebuddyFollowUpController _postUpdateFollowupWithProgress:]", "MBPrebuddyFollowUpController.m", 245, "_proxy != nil");
    }
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1001F70B8;
    v64[3] = &unk_100411088;
    v64[4] = buf;
    [(MBHelperServiceProtocol *)v49 localizedStringForCountdownFrom:v54 toDate:v45 reply:v64];
    v52 = *(void **)(*(void *)&buf[8] + 40);
    v29 = MBLocalizedStringWithSubstitutions();
    _Block_object_dispose(buf, 8);

    char v39 = 0;
  }
  else
  {
    v37 = MBGetDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v56;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Mega Backup Expired, resetting: %{public}@ %{public}@", buf, 0x16u);
      v52 = v34;
      v53 = v56;
      _MBLog();
    }

    [(MBPrebuddyFollowUpController *)self reset];
    BOOL v38 = 0;
    v29 = 0;
    v24 = 0;
    char v39 = 1;
  }

  if (v39)
  {
    id v40 = v21;
    goto LABEL_48;
  }
LABEL_41:
  v41 = +[MBPrebuddyManager baseFollowupItem];
  [v41 setTitle:v24];
  [v41 setInformativeText:v29];
  if (v7 < 1.0)
  {
    v42 = +[MBPrebuddyManager backupToCloudImageName];
    [v41 setBundleIconName:v42];
  }
  [(MBPrebuddyFollowUpController *)self _updateFollowUpActions:v41 hasDisabledSyncCategories:v59 hasDisabledBackupDomains:v60 canTrackOrder:0 allowsExpirationExtension:v38];
  id v63 = v21;
  unsigned __int8 v43 = [v61 postFollowUpItem:v41 error:&v63];
  id v40 = v63;

  if ((v43 & 1) == 0)
  {
    v44 = MBGetDefaultLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v40;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "failed to post prebuddy follow up, error : %@", buf, 0xCu);
      _MBLog();
    }
  }
LABEL_48:

  _Block_object_dispose(&v68, 8);
}

- (id)_initialNotificationTitle:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"MBServerInitialNotificationTitleKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    MBLocalizedStringFromTable();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  float v6 = v5;

  return v6;
}

- (id)_initialNotificationMessage:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"MBServerInitialNotificationMessageKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    MBLocalizedStringFromTable();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  float v6 = v5;

  return v6;
}

- (id)_newPrebuddyNotification:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)FLFollowUpNotification);
  float v6 = [(MBPrebuddyFollowUpController *)self _initialNotificationTitle:v4];
  [v5 setTitle:v6];

  float v7 = [(MBPrebuddyFollowUpController *)self _initialNotificationMessage:v4];

  [v5 setInformativeText:v7];
  [v5 setFrequency:0.0];
  unint64_t v8 = +[NSMutableSet set];
  v11[0] = FLNotificationOptionForce;
  v11[1] = FLNotificationOptionNotificationCenter;
  v11[2] = FLNotificationOptionLockscreen;
  v11[3] = FLNotificationOptionBannerAlert;
  v11[4] = FLNotificationOptionExtensionActions;
  v9 = +[NSArray arrayWithObjects:v11 count:5];
  [v8 addObjectsFromArray:v9];

  return v5;
}

- (void)reset
{
  [(MBPrebuddyFollowUpController *)self setBackupState:0];
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clearing prebuddy follow up.", buf, 2u);
    _MBLog();
  }

  id v3 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.backupd"];
  id v7 = 0;
  unsigned __int8 v4 = [v3 clearPendingFollowUpItemsWithUniqueIdentifiers:&off_10043B508 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    float v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "failed to clear prebuddy follow up, error : %@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (void)_updateFollowUpActions:(id)a3 hasDisabledSyncCategories:(BOOL)a4 hasDisabledBackupDomains:(BOOL)a5 canTrackOrder:(BOOL)a6 allowsExpirationExtension:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v17 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  if (v7)
  {
    id v14 = [(MBPrebuddyFollowUpController *)self _expirationExtensionFollowUpAction];
    [v12 addObject:v14];

    if (!v10)
    {
LABEL_3:
      if (!v9) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if (!v10)
  {
    goto LABEL_3;
  }
  uint64_t v15 = [(MBPrebuddyFollowUpController *)self _turnOnAppsUsingiCloudFollowUpAction];
  [v12 addObject:v15];

  if (!v9)
  {
LABEL_4:
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v16 = [(MBPrebuddyFollowUpController *)self _turnOnAppsBackingUpFollowUpAction];
  [v12 addObject:v16];

  if (v8)
  {
LABEL_5:
    v13 = [(MBPrebuddyFollowUpController *)self _trackOrderFollowUpAction];
    [v12 addObject:v13];
  }
LABEL_6:
  [v17 setActions:v12];
}

- (id)_expirationExtensionFollowUpAction
{
  v2 = MBLocalizedStringFromTable();
  id v3 = +[FLFollowUpAction actionWithLabel:v2 url:0];

  [v3 setIdentifier:@"ExtendMegaBackupExpirationFollowUpIdentifier"];
  return v3;
}

- (id)_trackOrderFollowUpAction
{
  v2 = MBLocalizedStringFromTable();
  id v3 = +[FLFollowUpAction actionWithLabel:v2 url:0];

  [v3 setIdentifier:@"TrackOrderFollowUpIdentifier"];
  return v3;
}

- (id)_turnOnAppsUsingiCloudFollowUpAction
{
  v2 = MBLocalizedStringFromTable();
  id v3 = +[FLFollowUpAction actionWithLabel:v2 url:0];

  [v3 setIdentifier:@"TurnOnAppsUsingiCloudFollowUpIdentifier"];
  return v3;
}

- (id)_turnOnAppsBackingUpFollowUpAction
{
  v2 = MBLocalizedStringFromTable();
  id v3 = +[FLFollowUpAction actionWithLabel:v2 url:0];

  [v3 setIdentifier:@"TurnOnAppsBackingUpFollowUpIdentifier"];
  return v3;
}

+ (id)connection
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (qword_1004826A0)
  {
    id v3 = (id)qword_1004826A0;
  }
  else
  {
    if (qword_1004826B0 != -1) {
      dispatch_once(&qword_1004826B0, &stru_100416470);
    }
    id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.MobileBackup.MBHelperService"];
    [v4 setRemoteObjectInterface:qword_1004826A8];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001F7A1C;
    v6[3] = &unk_100411038;
    v6[4] = v2;
    [v4 setInvalidationHandler:v6];
    objc_storeStrong((id *)&qword_1004826A0, v4);
    [v4 resume];
    id v3 = (id)qword_1004826A0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_finishXPCWithError:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MBPrebuddyFollowUpController finish XPC with error: %{public}@", buf, 0xCu);
    _MBLog();
  }
}

- (NSDate)megaBackupExpirationDate
{
  return self->_megaBackupExpirationDate;
}

- (void)setMegaBackupExpirationDate:(id)a3
{
}

- (MBPrebuddyDisabledCategoriesManager)disabledCategoriesManager
{
  return (MBPrebuddyDisabledCategoriesManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisabledCategoriesManager:(id)a3
{
}

- (MBStateInfo)backupState
{
  return (MBStateInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackupState:(id)a3
{
}

- (MBHelperServiceProtocol)proxy
{
  return (MBHelperServiceProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProxy:(id)a3
{
}

- (NSNumberFormatter)percentageFormatter
{
  return (NSNumberFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPercentageFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_disabledCategoriesManager, 0);
  objc_storeStrong((id *)&self->_megaBackupExpirationDate, 0);
}

@end