@interface MCDCompilationsTableViewController
- (MCDCompilationsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)filteringPreferenceKey;
- (id)legacyFilteringPreferenceKey;
- (id)sortingPreferenceKey;
- (id)textForHeaderViewInContentManager:(id)a3;
@end

@implementation MCDCompilationsTableViewController

- (MCDCompilationsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDCompilationsDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDCompilationsTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDCompilationsTableViewController *)v10 setPlayActivityFeatureName:@"compilations"];
  }
  return v10;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    BOOL v5 = (void (*)(void))off_1010D6D50;
    v14 = off_1010D6D50;
    if (!off_1010D6D50)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100090C3C;
      v10[3] = &unk_100FC34A0;
      v10[4] = &v11;
      sub_100090C3C((uint64_t)v10);
      BOOL v5 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    BOOL v6 = v5();
    v7 = [v6 localizedStringForKey:@"RECENTLY_PLAYED_ALBUMS" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  else if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    v7 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sortingPreferenceKey
{
  return @"compilationsOnlyAlbumsSortType";
}

- (id)filteringPreferenceKey
{
  return @"LibraryCompilationsFilterOption";
}

- (id)legacyFilteringPreferenceKey
{
  return @"compilations";
}

@end