@interface COSUnavailableAppDetailViewController
- (BOOL)disabled;
- (id)specifiers;
- (void)removeRow:(id)a3;
- (void)setDisabled:(BOOL)a3;
@end

@implementation COSUnavailableAppDetailViewController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    +[PSSpecifier groupSpecifierWithID:@"UNAVAILABLE_APP"];
    v28 = v27 = v5;
    [v5 addObject:];
    id v6 = objc_alloc((Class)PSSpecifier);
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"CLEAR_UNAVAILABLE_APP" value:&stru_100249230 table:@"Localizable"];
    id v9 = [v6 initWithName:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v9 setIdentifier:@"CLEAR_UNAVAILABLE_APP_ID"];
    [v9 setProperty:&__kCFBooleanTrue forKey:@"isDestructive"];
    v10 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSUnavailableApplicationInfoID"];
    v11 = [v10 objectForKeyedSubscript:ACXApplicationBundleIdentiferKey];
    v12 = +[COSSettingsListController unavailableWatchKitApps];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v13 = [v12 allKeys];
    uint64_t v14 = (uint64_t)[v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v14)
    {
      v26 = v10;
      uint64_t v15 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if ([v11 isEqual:v17])
          {
            v18 = [v12 objectForKeyedSubscript:v17];
            v19 = [v18 objectForKeyedSubscript:ACXServerStatusKey];
            uint64_t v14 = (uint64_t)[v19 integerValue];

            goto LABEL_12;
          }
        }
        uint64_t v14 = (uint64_t)[v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v14) {
          continue;
        }
        break;
      }
LABEL_12:
      v10 = v26;
    }

    v20 = pbb_bridge_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = +[NSNumber numberWithInteger:v14];
      *(_DWORD *)buf = 136315650;
      v34 = "-[COSUnavailableAppDetailViewController specifiers]";
      __int16 v35 = 2112;
      v36 = v11;
      __int16 v37 = 2112;
      v38 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s - %@ State: %@", buf, 0x20u);
    }
    BOOL v22 = v14 <= 2 && !self->_disabled;
    v23 = +[NSNumber numberWithInt:v22];
    [v9 setProperty:v23 forKey:PSEnabledKey];

    [v9 setButtonAction:"removeRow:"];
    [v27 addObject:v9];
    v24 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v27;

    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)removeRow:(id)a3
{
  v4 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSUnavailableApplicationInfoID"];
  v5 = [v4 objectForKeyedSubscript:ACXApplicationBundleIdentiferKey];
  id v6 = +[ACXDeviceConnection sharedDeviceConnection];
  v7 = [UIApp activeWatch];
  self->_disabled = 1;
  [(COSUnavailableAppDetailViewController *)self reloadSpecifiers];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100044FCC;
  v8[3] = &unk_100244640;
  v8[4] = self;
  [v6 removeApplication:v5 fromPairedDevice:v7 completion:v8];
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

@end