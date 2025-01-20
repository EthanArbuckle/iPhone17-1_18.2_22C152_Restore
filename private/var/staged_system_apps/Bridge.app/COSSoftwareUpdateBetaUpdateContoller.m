@interface COSSoftwareUpdateBetaUpdateContoller
- (id)_specifierForBetaProgram:(id)a3 rowIdentifier:(id)a4;
- (id)appleIDSpecifier;
- (id)specifiers;
- (void)addFooter;
- (void)betaUpdatesAppleIDTapped:(id)a3;
- (void)loadView;
- (void)postFailedToSetBetaUpdateAlert;
- (void)setupProgramListSpecifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)willEnterForeground:(id)a3;
@end

@implementation COSSoftwareUpdateBetaUpdateContoller

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)COSSoftwareUpdateBetaUpdateContoller;
  [(COSSoftwareUpdateBetaUpdateContoller *)&v4 loadView];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)willEnterForeground:(id)a3
{
  objc_super v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[COSSoftwareUpdateBetaUpdateContoller willEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = [(COSSoftwareUpdateBetaUpdateContoller *)self updateController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10012B310;
  v6[3] = &unk_100244CE0;
  v6[4] = self;
  [v5 loadBetaUpdatesWithCompletion:v6];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = objc_opt_new();
    v7 = +[PSSpecifier groupSpecifierWithID:@"BETA_UPDATES_DETAIL_GROUP"];
    betaUpdatesGroup = self->_betaUpdatesGroup;
    self->_betaUpdatesGroup = v7;

    [(PSSpecifier *)self->_betaUpdatesGroup setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v6 addObject:self->_betaUpdatesGroup];
    [(COSSoftwareUpdateBetaUpdateContoller *)self addFooter];
    [(COSSoftwareUpdateBetaUpdateContoller *)self setupProgramListSpecifiers];
    [v6 addObjectsFromArray:self->_programsList];
    v9 = +[PSSpecifier groupSpecifierWithID:@"BETA_UPDATES_APPLEID_GROUP"];
    [v6 addObject:v9];
    v10 = [(COSSoftwareUpdateBetaUpdateContoller *)self appleIDSpecifier];
    [v6 addObject:v10];

    uint64_t v11 = +[NSArray arrayWithArray:v6];
    v12 = *(void **)&self->BPSListController_opaque[v2];
    *(void *)&self->BPSListController_opaque[v2] = v11;

    id v4 = *(id *)&self->BPSListController_opaque[v2];
  }

  return v4;
}

- (id)appleIDSpecifier
{
  v3 = [(COSSoftwareUpdateBetaUpdateContoller *)self updateController];
  id v4 = [v3 betaUpdatesAppleID];

  v5 = +[NSBundle mainBundle];
  if (v4)
  {
    v6 = [v5 localizedStringForKey:@"BETA_UPDATES_APPLE_ID_PREFIX" value:&stru_100249230 table:@"Software Update"];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);
  }
  else
  {
    v7 = [v5 localizedStringForKey:@"BETA_UPDATES_APPLE_ID_PROMPT" value:&stru_100249230 table:@"Software Update"];
  }

  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v8 setProperty:@"BetaEnrollementAppleIDKey" forKey:PSIDKey];
  [v8 setButtonAction:"betaUpdatesAppleIDTapped:"];

  return v8;
}

- (void)betaUpdatesAppleIDTapped:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK/SUBetaUpdatesButton"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  BPSOpenSensitiveURLAsync();
}

- (void)addFooter
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"BETA_UPDATES_FOOTER" value:&stru_100249230 table:@"Software Update"];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"LEARN_MORE_LINK" value:&stru_100249230 table:@"Software Update"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"LEARN_MORE_LINK" value:&stru_100249230 table:@"Software Update"];
  id v9 = [v22 rangeOfString:v8];
  NSUInteger v11 = v10;

  if (self)
  {
    v12 = self->_betaUpdatesGroup;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [(PSSpecifier *)v12 setProperty:v14 forKey:PSFooterCellClassGroupKey];

    betaUpdatesGroup = self->_betaUpdatesGroup;
  }
  else
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [0 setProperty:v20 forKey:PSFooterCellClassGroupKey];

    betaUpdatesGroup = 0;
  }
  [(PSSpecifier *)betaUpdatesGroup setProperty:v22 forKey:PSFooterHyperlinkViewTitleKey];
  if (self)
  {
    v16 = self->_betaUpdatesGroup;
    v24.location = (NSUInteger)v9;
    v24.length = v11;
    v17 = NSStringFromRange(v24);
    [(PSSpecifier *)v16 setProperty:v17 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v18 = self->_betaUpdatesGroup;
  }
  else
  {
    v25.location = (NSUInteger)v9;
    v25.length = v11;
    v21 = NSStringFromRange(v25);
    [0 setProperty:v21 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v18 = 0;
  }
  [(PSSpecifier *)v18 setProperty:@"https://beta.apple.com/" forKey:PSFooterHyperlinkViewURLKey];
}

- (void)setupProgramListSpecifiers
{
  id v3 = [(COSSoftwareUpdateBetaUpdateContoller *)self updateController];
  id v4 = [v3 availableBetaPrograms];

  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v4 count] + 2);
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"AUTOMATIC_UPDATES_DISABLED" value:&stru_100249230 table:@"Software Update"];
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

  v32 = v5;
  [v5 addObject:v8];
  [v8 setProperty:@"BETA_UPDATES_OFF_IDENTIFIER" forKey:PSIDKey];
  id v9 = [(COSSoftwareUpdateBetaUpdateContoller *)self updateController];
  NSUInteger v10 = [v9 enrolledBetaProgram];

  v31 = v8;
  if (v10)
  {
    NSUInteger v11 = [v4 valueForKey:@"programID"];
    v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 programID]);
    unsigned __int8 v13 = [v11 containsObject:v12];

    if ((v13 & 1) == 0)
    {
      v14 = [(COSSoftwareUpdateBetaUpdateContoller *)self _specifierForBetaProgram:v10 rowIdentifier:@"BETA_PROGRAMS_UNAVAILABLE_PROGRAM"];
      [v5 addObject:v14];
      if (self) {
        betaUpdatesGroup = self->_betaUpdatesGroup;
      }
      else {
        betaUpdatesGroup = 0;
      }
      [(PSSpecifier *)betaUpdatesGroup setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];
      v16 = pbb_setup_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Added unavailable specifier", buf, 2u);
      }
    }
  }
  else
  {
    if (self) {
      v17 = self->_betaUpdatesGroup;
    }
    else {
      v17 = 0;
    }
    [(PSSpecifier *)v17 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v4;
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    uint64_t v22 = PSRadioGroupCheckedSpecifierKey;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        NSRange v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v23);
        id v25 = [v10 programID];
        id v26 = [v24 programID];
        v27 = [(COSSoftwareUpdateBetaUpdateContoller *)self _specifierForBetaProgram:v24 rowIdentifier:0];
        if (v25 == v26)
        {
          if (self) {
            v28 = self->_betaUpdatesGroup;
          }
          else {
            v28 = 0;
          }
          [(PSSpecifier *)v28 setProperty:v27 forKey:v22];
        }
        [v32 addObject:v27];

        v23 = (char *)v23 + 1;
      }
      while (v20 != v23);
      id v29 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
      id v20 = v29;
    }
    while (v29);
  }

  v30 = +[NSArray arrayWithArray:v32];
  sub_10012BD70((uint64_t)self, v30);
}

- (id)_specifierForBetaProgram:(id)a3 rowIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 title];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

  if (v7)
  {
    [v9 setProperty:v7 forKey:PSIDKey];
  }
  else
  {
    NSUInteger v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 programID]);
    NSUInteger v11 = [v10 stringValue];

    [v9 setUserInfo:v6];
    [v9 setProperty:v11 forKey:PSIDKey];
  }
  [v9 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)COSSoftwareUpdateBetaUpdateContoller;
  id v6 = a4;
  [(COSSoftwareUpdateBetaUpdateContoller *)&v20 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(COSSoftwareUpdateBetaUpdateContoller *)self specifierAtIndexPath:v6];

  v8 = [v7 propertyForKey:PSIDKey];
  if (![v8 isEqualToString:@"BETA_UPDATES_OFF_IDENTIFIER"])
  {
    v12 = [v7 userInfo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v13 = [v8 isEqualToString:@"BETA_PROGRAMS_UNAVAILABLE_PROGRAM"];

      if (v13) {
        goto LABEL_15;
      }
      v12 = [v7 userInfo];
      v14 = pbb_setup_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v12 programID];
        *(_DWORD *)buf = 134217984;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Enrolling in program %ld", buf, 0xCu);
      }

      v16 = [(COSSoftwareUpdateBetaUpdateContoller *)self updateController];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10012C304;
      v18[3] = &unk_100243878;
      v18[4] = self;
      [v16 enrollInBetaProgram:v12 completion:v18];

      if (self) {
        betaUpdatesGroup = self->_betaUpdatesGroup;
      }
      else {
        betaUpdatesGroup = 0;
      }
      [(PSSpecifier *)betaUpdatesGroup setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
      [(COSSoftwareUpdateBetaUpdateContoller *)self reloadSpecifiers];
    }

    goto LABEL_15;
  }
  id v9 = pbb_setup_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unenrolling from beta updates", buf, 2u);
  }

  NSUInteger v10 = [(COSSoftwareUpdateBetaUpdateContoller *)self updateController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10012C1E4;
  v19[3] = &unk_100243878;
  v19[4] = self;
  [v10 unenrollFromBetaUpdatesWithCompletion:v19];

  if (self) {
    NSUInteger v11 = self->_betaUpdatesGroup;
  }
  else {
    NSUInteger v11 = 0;
  }
  [(PSSpecifier *)v11 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
  [(COSSoftwareUpdateBetaUpdateContoller *)self reloadSpecifiers];
LABEL_15:
}

- (void)postFailedToSetBetaUpdateAlert
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"BETA_UPDATES_FAILED_TITLE" value:&stru_100249230 table:@"Software Update"];
  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"BETA_UPDATES_FAILED_MESSAGE" value:&stru_100249230 table:@"Software Update"];
  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Software Update"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012C618;
  v13[3] = &unk_100243AE0;
  v13[4] = self;
  NSUInteger v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v13];
  [v7 addAction:v10];

  NSUInteger v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Presenting 'set beta failed' alert", v12, 2u);
  }

  [(COSSoftwareUpdateBetaUpdateContoller *)self presentViewController:v7 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programsList, 0);

  objc_storeStrong((id *)&self->_betaUpdatesGroup, 0);
}

@end