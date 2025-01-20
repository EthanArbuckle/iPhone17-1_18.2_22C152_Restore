@interface MusicUsageStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4;
- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3;
- (MPMediaQuery)localMusicMoviesQuery;
- (MPMediaQuery)localMusicShowsQuery;
- (MPMediaQuery)localSongsQuery;
- (MusicUsageStorageReporter)init;
- (float)sizeForCategory:(id)a3;
- (id)queryForCategoryIdentifier:(id)a3;
- (id)usageBundleApps;
- (unint64_t)localMusicMoviesFileSize;
- (unint64_t)localMusicShowsFileSize;
- (unint64_t)localSongsFileSize;
- (unint64_t)totalSize;
- (void)reloadSizeForCategoryIdentifier:(id)a3;
- (void)setLocalMusicMoviesFileSize:(unint64_t)a3;
- (void)setLocalMusicShowsFileSize:(unint64_t)a3;
- (void)setLocalSongsFileSize:(unint64_t)a3;
- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4;
@end

@implementation MusicUsageStorageReporter

- (MusicUsageStorageReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicUsageStorageReporter;
  v2 = [(MusicUsageStorageReporter *)&v6 init];
  if (v2)
  {
    +[MPMediaQuery setFilteringDisabled:1];
    v3 = +[MPMediaLibrary deviceMediaLibrary];
    v4 = [v3 libraryDataProvider];
    +[MPMediaLibrary reloadDynamicPropertiesForLibraryDataProvider:v4];
  }
  return v2;
}

- (id)usageBundleApps
{
  uint64_t v3 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyIsMusicShow];
  v5 = +[MPMediaQuery songsQuery];
  localSongsQuery = self->_localSongsQuery;
  self->_localSongsQuery = v5;

  [(MPMediaQuery *)self->_localSongsQuery setIgnoreSystemFilterPredicates:1];
  [(MPMediaQuery *)self->_localSongsQuery setIgnoreRestrictionsPredicates:1];
  [(MPMediaQuery *)self->_localSongsQuery setShouldIncludeNonLibraryEntities:1];
  [(MPMediaQuery *)self->_localSongsQuery addFilterPredicate:v3];
  [(MPMediaQuery *)self->_localSongsQuery setGroupingType:0];
  self->_localSongsFileSize = (unint64_t)MusicUsageFileSizeForMediaQuery(self->_localSongsQuery);
  v7 = +[MPMediaQuery moviesQuery];
  localMusicMoviesQuery = self->_localMusicMoviesQuery;
  self->_localMusicMoviesQuery = v7;

  [(MPMediaQuery *)self->_localMusicMoviesQuery setIgnoreSystemFilterPredicates:1];
  [(MPMediaQuery *)self->_localMusicMoviesQuery setIgnoreRestrictionsPredicates:1];
  [(MPMediaQuery *)self->_localMusicMoviesQuery setShouldIncludeNonLibraryEntities:1];
  v29 = (void *)v3;
  [(MPMediaQuery *)self->_localMusicMoviesQuery addFilterPredicate:v3];
  v28 = (void *)v4;
  [(MPMediaQuery *)self->_localMusicMoviesQuery addFilterPredicate:v4];
  [(MPMediaQuery *)self->_localMusicMoviesQuery setGroupingType:0];
  self->_localMusicMoviesFileSize = (unint64_t)MusicUsageFileSizeForMediaQuery(self->_localMusicMoviesQuery);
  v9 = +[MPMediaQuery tvShowsQuery];
  localMusicShowsQuery = self->_localMusicShowsQuery;
  self->_localMusicShowsQuery = v9;

  [(MPMediaQuery *)self->_localMusicShowsQuery setIgnoreSystemFilterPredicates:1];
  [(MPMediaQuery *)self->_localMusicShowsQuery setIgnoreRestrictionsPredicates:1];
  [(MPMediaQuery *)self->_localMusicShowsQuery setShouldIncludeNonLibraryEntities:1];
  [(MPMediaQuery *)self->_localMusicShowsQuery addFilterPredicate:v3];
  [(MPMediaQuery *)self->_localMusicShowsQuery addFilterPredicate:v4];
  [(MPMediaQuery *)self->_localMusicShowsQuery setGroupingType:0];
  self->_localMusicShowsFileSize = (unint64_t)MusicUsageFileSizeForMediaQuery(self->_localMusicShowsQuery);
  *(float *)&double v11 = (float)[(MusicUsageStorageReporter *)self totalSize];
  v12 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.MusicUsage" withTotalSize:v11];
  v13 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  v14 = [v13 localizedStringForKey:@"BUNDLE_NAME" value:&stru_108A0 table:@"MusicUsage"];
  [v12 setName:v14];

  v27 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  v26 = [v27 localizedStringForKey:@"ALL_MUSIC_HEADER" value:&stru_108A0 table:@"MusicUsage"];
  v25 = +[PSUsageBundleCategory categoryNamed:v26 withIdentifier:@"MusicUsageCategoryLocalMusic" forUsageBundleApp:v12];
  v32[0] = v25;
  v15 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  v16 = [v15 localizedStringForKey:@"MUSIC_MOVIES_HEADER" value:&stru_108A0 table:@"MusicUsage"];
  v17 = +[PSUsageBundleCategory categoryNamed:v16 withIdentifier:@"MusicUsageCategoryMusicMovies" forUsageBundleApp:v12];
  v32[1] = v17;
  v18 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
  v19 = [v18 localizedStringForKey:@"MUSIC_SHOWS_HEADER" value:&stru_108A0 table:@"MusicUsage"];
  v20 = +[PSUsageBundleCategory categoryNamed:v19 withIdentifier:@"MusicUsageCategoryMusicShows" forUsageBundleApp:v12];
  v32[2] = v20;
  v21 = +[NSArray arrayWithObjects:v32 count:3];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_A4F0;
  v30[3] = &unk_10760;
  v30[4] = self;
  v22 = [v21 sortedArrayUsingComparator:v30];

  [v12 setCategories:v22];
  v31 = v12;
  v23 = +[NSArray arrayWithObjects:&v31 count:1];

  return v23;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 1;
}

- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)reloadSizeForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"MusicUsageCategoryLocalMusic"]) {
    self->_localSongsFileSize = (unint64_t)MusicUsageFileSizeForMediaQuery(self->_localSongsQuery);
  }
  if ([v4 isEqualToString:@"MusicUsageCategoryMusicMovies"]) {
    self->_localMusicMoviesFileSize = (unint64_t)MusicUsageFileSizeForMediaQuery(self->_localMusicMoviesQuery);
  }
  if ([v4 isEqualToString:@"MusicUsageCategoryMusicShows"]) {
    self->_localMusicShowsFileSize = (unint64_t)MusicUsageFileSizeForMediaQuery(self->_localMusicShowsQuery);
  }
}

- (unint64_t)totalSize
{
  return self->_localMusicMoviesFileSize + self->_localSongsFileSize + self->_localMusicShowsFileSize;
}

- (float)sizeForCategory:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"MusicUsageCategoryLocalMusic"]) {
    unint64_t localSongsFileSize = self->_localSongsFileSize;
  }
  else {
    unint64_t localSongsFileSize = 0;
  }
  if ([v4 isEqualToString:@"MusicUsageCategoryMusicMovies"]) {
    unint64_t localSongsFileSize = self->_localMusicMoviesFileSize;
  }
  if ([v4 isEqualToString:@"MusicUsageCategoryMusicShows"]) {
    unint64_t localSongsFileSize = self->_localMusicShowsFileSize;
  }

  return (float)localSongsFileSize;
}

- (id)queryForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"MusicUsageCategoryLocalMusic"]) {
    v5 = self->_localSongsQuery;
  }
  else {
    v5 = 0;
  }
  if ([v4 isEqualToString:@"MusicUsageCategoryMusicMovies"])
  {
    objc_super v6 = self->_localMusicMoviesQuery;

    v5 = v6;
  }
  if ([v4 isEqualToString:@"MusicUsageCategoryMusicShows"])
  {
    v7 = self->_localMusicShowsQuery;

    v5 = v7;
  }

  return v5;
}

- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4
{
  return 1;
}

- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4
{
  v5 = [a3 bundleIdentifier];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.MusicUsage"];

  if (v6)
  {
    id v7 = *a4;
    v8 = +[NSNumber numberWithBool:1];
    [v7 setProperty:v8 forKey:PSLazyIconLoading];

    id v9 = *a4;
    uint64_t v10 = PSLazyIconAppID;
    [v9 setProperty:@"com.apple.Music" forKey:v10];
  }
}

- (MPMediaQuery)localSongsQuery
{
  return self->_localSongsQuery;
}

- (unint64_t)localSongsFileSize
{
  return self->_localSongsFileSize;
}

- (void)setLocalSongsFileSize:(unint64_t)a3
{
  self->_unint64_t localSongsFileSize = a3;
}

- (MPMediaQuery)localMusicMoviesQuery
{
  return self->_localMusicMoviesQuery;
}

- (unint64_t)localMusicMoviesFileSize
{
  return self->_localMusicMoviesFileSize;
}

- (void)setLocalMusicMoviesFileSize:(unint64_t)a3
{
  self->_localMusicMoviesFileSize = a3;
}

- (MPMediaQuery)localMusicShowsQuery
{
  return self->_localMusicShowsQuery;
}

- (unint64_t)localMusicShowsFileSize
{
  return self->_localMusicShowsFileSize;
}

- (void)setLocalMusicShowsFileSize:(unint64_t)a3
{
  self->_localMusicShowsFileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMusicShowsQuery, 0);
  objc_storeStrong((id *)&self->_localMusicMoviesQuery, 0);

  objc_storeStrong((id *)&self->_localSongsQuery, 0);
}

@end