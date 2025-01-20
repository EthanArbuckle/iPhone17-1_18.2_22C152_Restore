@interface MBFollowUpExtensionViewController
- (FLFollowUpController)followUpController;
- (FLFollowUpController)legacyController;
- (MBManager)manager;
- (void)_allowRestoreOverCellularWithAccount:(id)a3;
- (void)_dismissFollowUpItem:(id)a3;
- (void)_openThermalKbase;
- (void)_openiCloudSettingsWithAccount:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)setFollowUpController:(id)a3;
- (void)setLegacyController:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation MBFollowUpExtensionViewController

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = v8;
  v12 = v10;
  v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = v11;
    __int16 v56 = 2114;
    id v57 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Follow up extension processing item:%{public}@, action:%{public}@", buf, 0x16u);
    v38 = v11;
    id v39 = v9;
    _MBLog();
  }

  v14 = [v11 userInfo];
  v15 = [v14 objectForKeyedSubscript:@"FollowUpType"];

  v16 = [v9 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"ActionType"];

  if (v15)
  {
    v43 = self;
    v46 = v17;
    v18 = +[ACAccountStore defaultStore];
    uint64_t v44 = [v18 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
    v45 = v18;
    objc_msgSend(v18, "accountsWithAccountType:");
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v48 = *(void *)v50;
      uint64_t v21 = ACAccountPropertyRemoteManagingAccountIdentifier;
      v41 = v12;
      id v42 = v9;
      v40 = v15;
LABEL_6:
      v22 = 0;
      while (1)
      {
        if (*(void *)v50 != v48) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v22);
        v24 = objc_msgSend(v23, "objectForKeyedSubscript:", v21, v38, v39);
        v25 = [v23 identifier];
        v26 = [v11 accountIdentifier];
        if ([v25 isEqualToString:v26]) {
          break;
        }
        v27 = v11;
        v28 = [v11 accountIdentifier];
        unsigned __int8 v29 = [v24 isEqualToString:v28];

        if (v29) {
          goto LABEL_18;
        }

        v22 = (char *)v22 + 1;
        v11 = v27;
        if (v20 == v22)
        {
          id v20 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
          v12 = v41;
          id v9 = v42;
          v15 = v40;
          if (v20) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
      }
      v27 = v11;

LABEL_18:
      id v31 = v23;

      v11 = v27;
      v12 = v41;
      id v9 = v42;
      v15 = v40;
      v17 = v46;
      if (v31) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_13:

      v17 = v46;
    }
    v32 = objc_msgSend(v11, "accountIdentifier", v38);

    if (v32)
    {
      v33 = MBGetDefaultLog();
      v35 = (void *)v44;
      v34 = v45;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v11;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "The account responsible for %@ is already signed out. Dismissing followup instead", buf, 0xCu);
        _MBLog();
      }

      [(MBFollowUpExtensionViewController *)v43 _dismissFollowUpItem:v11];
      v12[2](v12, 1);
    }
    else
    {
      id v31 = 0;
LABEL_24:
      switch([v15 intValue])
      {
        case 1u:
        case 6u:
          if (!v17 || [v17 intValue] != 1) {
            goto LABEL_37;
          }
          [(MBFollowUpExtensionViewController *)v43 _openiCloudSettingsWithAccount:v31];
          break;
        case 5u:
          if (v17)
          {
            if ([v17 intValue] == 5)
            {
              [(MBFollowUpExtensionViewController *)v43 _allowRestoreOverCellularWithAccount:v31];
            }
            else if ([v17 intValue] == 6)
            {
              [(MBFollowUpExtensionViewController *)v43 _openThermalKbase];
            }
          }
          break;
        case 8u:
          if (v17 && [v17 intValue] == 1) {
            [(MBFollowUpExtensionViewController *)v43 _openiCloudSettingsWithAccount:v31];
          }
LABEL_37:
          [(MBFollowUpExtensionViewController *)v43 _dismissFollowUpItem:v11];
          break;
        default:
          v36 = MBGetDefaultLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            unsigned int v37 = [v15 intValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v55) = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Unknown follow up item of type %u", buf, 8u);
            [v15 intValue];
            _MBLog();
          }

          break;
      }
      v12[2](v12, 1);

      v35 = (void *)v44;
      v34 = v45;
    }
  }
  else
  {
    v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Follow-up item had no item type. Don't know how to respond", buf, 2u);
      _MBLog();
    }

    v12[2](v12, 1);
  }
}

- (void)_openiCloudSettingsWithAccount:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "aa_isAccountClass:", AAAccountClassPrimary))
  {
    v6 = [v4 username];
    v7 = +[NSString stringWithFormat:@"prefs:root=ManagedAccount:%@&path=ICLOUD_SERVICE/com.apple.Dataclass.Backup", v6];
    v5 = +[NSURL URLWithString:v7];
  }
  else
  {
    v5 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Backup"];
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Trying to swizzle over to iCloud backup pane: %@", buf, 0xCu);
    _MBLog();
  }

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  [v9 openSensitiveURL:v5 withOptions:0];
}

- (void)_openThermalKbase
{
  v2 = +[NSURL URLWithString:@"https://support.apple.com/HT201678?cid=iOS_SettingsUI_iphone_article_HT201678"];
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Opening thermal kbase %@", buf, 0xCu);
    _MBLog();
  }

  v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v8 = 0;
  unsigned __int8 v5 = [v4 openURL:v2 withOptions:0 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v2;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not open kbase url %@ error %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (void)_dismissFollowUpItem:(id)a3
{
  id v4 = a3;
  if (!self->_followUpController)
  {
    unsigned __int8 v5 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.backupd"];
    followUpController = self->_followUpController;
    self->_followUpController = v5;

    v7 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.MobileBackup"];
    legacyController = self->_legacyController;
    self->_legacyController = v7;
  }
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clearing follow-up item %{public}@", buf, 0xCu);
    id v20 = v4;
    _MBLog();
  }

  v10 = self->_followUpController;
  __int16 v11 = [v4 uniqueIdentifier];
  v28 = v11;
  id v12 = +[NSArray arrayWithObjects:&v28 count:1];
  id v22 = 0;
  unsigned __int8 v13 = [(FLFollowUpController *)v10 clearPendingFollowUpItemsWithUniqueIdentifiers:v12 error:&v22];
  id v14 = v22;

  if ((v13 & 1) == 0)
  {
    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v4 uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      id v25 = v16;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Couldn't dismiss follow-up %@ with error %@", buf, 0x16u);

      id v20 = [v4 uniqueIdentifier];
      id v21 = v14;
      _MBLog();
    }
  }
  v17 = self->_legacyController;
  v18 = objc_msgSend(v4, "uniqueIdentifier", v20, v21);
  v23 = v18;
  id v19 = +[NSArray arrayWithObjects:&v23 count:1];
  [(FLFollowUpController *)v17 clearPendingFollowUpItemsWithUniqueIdentifiers:v19 error:0];
}

- (void)_allowRestoreOverCellularWithAccount:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (!self->_manager)
  {
    id v6 = [v4 personaIdentifier];

    if (v6) {
      v7 = (MBManager *)[objc_alloc((Class)MBManager) initWithAccount:v5 delegate:0 eventQueue:0];
    }
    else {
      v7 = (MBManager *)objc_opt_new();
    }
    manager = self->_manager;
    self->_manager = v7;
  }
  id v9 = +[MBCellularAccess inexpensiveCellularAccess];
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Allowing background restore over cellular, setting cellular access to:%@", buf, 0xCu);
    _MBLog();
  }

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = self->_manager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002B88;
  v15[3] = &unk_100004178;
  id v16 = v9;
  dispatch_semaphore_t v17 = v11;
  unsigned __int8 v13 = v11;
  id v14 = v9;
  [(MBManager *)v12 saveBackgroundRestoreCellularAccess:v14 completion:v15];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (FLFollowUpController)legacyController
{
  return self->_legacyController;
}

- (void)setLegacyController:(id)a3
{
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_legacyController, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end