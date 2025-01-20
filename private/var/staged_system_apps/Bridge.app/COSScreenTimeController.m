@interface COSScreenTimeController
- (id)labelText;
- (id)linkSubtext;
- (id)specifiers;
- (void)_openScreenTimeForFamilyMember:(id)a3;
- (void)_openScreenTimeForTinkerFamilyMember;
- (void)linkTextTapped;
@end

@implementation COSScreenTimeController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier groupSpecifierWithID:@"SCREENTIME_DESCRIPTION"];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"OPEN_SCREENTIME_LINK_TEXT" value:&stru_100249230 table:@"ScreenTime"];

    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"SCREENTIME_DETAIL_TEXT" value:&stru_100249230 table:@"ScreenTime"];

    id v11 = [v10 rangeOfString:v8 options:5];
    NSUInteger v13 = v12;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v6 setProperty:v15 forKey:PSFooterCellClassGroupKey];

    [v6 setProperty:v10 forKey:PSFooterHyperlinkViewTitleKey];
    v22.location = (NSUInteger)v11;
    v22.length = v13;
    v16 = NSStringFromRange(v22);
    [v6 setProperty:v16 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v17 = +[NSValue valueWithNonretainedObject:self];
    [v6 setProperty:v17 forKey:PSFooterHyperlinkViewTargetKey];

    v18 = NSStringFromSelector("linkTextTapped");
    [v6 setProperty:v18 forKey:PSFooterHyperlinkViewActionKey];

    [v5 insertObject:v6 atIndex:0];
    v19 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (id)labelText
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"SCREENTIME_DETAIL_TEXT" value:&stru_100249230 table:@"ScreenTime"];

  return v3;
}

- (id)linkSubtext
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"OPEN_SCREENTIME_LINK_TEXT" value:&stru_100249230 table:@"ScreenTime"];

  return v3;
}

- (void)linkTextTapped
{
}

- (void)_openScreenTimeForTinkerFamilyMember
{
  uint64_t v3 = +[BPSTinkerSupport sharedInstance];
  v4 = [v3 cachedTinkerFamilyMemeber];

  if (v4)
  {
    v5 = pbb_accountsignin_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[COSScreenTimeController _openScreenTimeForTinkerFamilyMember]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Member: %@", buf, 0x16u);
    }

    [(COSScreenTimeController *)self _openScreenTimeForFamilyMember:v4];
  }
  else
  {
    v6 = +[BPSTinkerSupport sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005C4BC;
    v7[3] = &unk_100244B80;
    v7[4] = self;
    [v6 getActiveTinkerFamilyMemberWithCompletion:v7];
  }
}

- (void)_openScreenTimeForFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSString);
  v5 = [v3 dsid];
  id v6 = [v4 initWithFormat:@"prefs:root=SCREEN_TIME&path=CHILD_%@", v5];

  v7 = +[NSURL URLWithString:v6];
  v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "-[COSScreenTimeController _openScreenTimeForFamilyMember:]";
    __int16 v11 = 2114;
    NSUInteger v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Opening URL %{public}@ for familyMember %@", buf, 0x20u);
  }

  BPSOpenSensitiveURLAsync();
}

@end