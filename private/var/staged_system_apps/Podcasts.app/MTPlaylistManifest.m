@interface MTPlaylistManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (BOOL)_updatePlaylistEpisodes;
- (MTPlaylistManifest)initWithPlaylistUuid:(id)a3 initialEpisodeUuid:(id)a4;
- (NSString)playlistUuid;
- (id)activitySpotlightIdentifier;
- (void)_load:(id)a3;
- (void)_propertyDidChange;
- (void)setPlaylistUuid:(id)a3;
@end

@implementation MTPlaylistManifest

+ (id)activityTypeSuffix
{
  return @"playlist";
}

- (MTPlaylistManifest)initWithPlaylistUuid:(id)a3 initialEpisodeUuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSPredicate falsePredicate];
  v20.receiver = self;
  v20.super_class = (Class)MTPlaylistManifest;
  v9 = [(MTPredicateManifest *)&v20 initWithInitialEpisodeUuid:v7 predicateToTrack:v8 sortDescriptors:0];

  if (v9)
  {
    v10 = +[NSPredicate predicateWithFormat:@"%K == %@", kPlaylistUuid, v6];
    [(MTPredicateManifest *)v9 _observeAllPropertyChangesForEntityName:kMTPlaylistEntityName predicate:v10];
    [(MTPlaylistManifest *)v9 setPlaylistUuid:v6];
    v11 = [(MTPlayerManifest *)v9 activity];
    v12 = [(MTPlaylistManifest *)v9 playlistUuid];
    [v11 setValue:v12 forKey:@"MTPlaylistManifestPlaylistUuid"];

    v13 = +[MTDB sharedInstance];
    v14 = [v13 mainOrPrivateContext];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A0F20;
    v17[3] = &unk_10054D9B0;
    id v18 = v14;
    v19 = v9;
    id v15 = v14;
    [v15 performBlockAndWait:v17];
  }
  return v9;
}

- (id)activitySpotlightIdentifier
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100056F2C;
  v16 = sub_100057260;
  id v17 = 0;
  v3 = +[MTDB sharedInstance];
  v4 = [v3 mainOrPrivateContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A10F8;
  v8[3] = &unk_10054DA00;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  v11 = &v12;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 userInfo];
  id v9 = [v8 valueForKey:@"MTPlaylistManifestPlaylistUuid"];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A129C;
    v10[3] = &unk_10054F630;
    id v12 = v7;
    id v11 = v9;
    [a1 episodeUuidForActivity:v6 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_load:(id)a3
{
  id v4 = a3;
  [(MTPlaylistManifest *)self _updatePlaylistEpisodes];
  v5.receiver = self;
  v5.super_class = (Class)MTPlaylistManifest;
  [(MTPredicateManifest *)&v5 _load:v4];
}

- (BOOL)_updatePlaylistEpisodes
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100056F2C;
  objc_super v20 = sub_100057260;
  id v21 = &__NSArray0__struct;
  v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A1580;
  v12[3] = &unk_10054DA00;
  id v5 = v4;
  id v13 = v5;
  uint64_t v14 = self;
  id v15 = &v16;
  [v5 performBlockAndWait:v12];
  if (!v17[5]) {
    goto LABEL_5;
  }
  id v6 = [(MTPredicateManifest *)self explicitSortOrder];
  unsigned __int8 v7 = [v6 isEqualToArray:v17[5]];

  uint64_t v8 = v17[5];
  if ((v7 & 1) == 0)
  {
    [(MTPredicateManifest *)self setExplicitSortOrder:v8];
    v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", kEpisodeUuid, v17[5]];
    [(MTPredicateManifest *)self setPredicate:v10];
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    v10 = +[NSPredicate falsePredicate];
    [(MTPredicateManifest *)self setPredicate:v10];
LABEL_7:

    BOOL v9 = 1;
    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_8:

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)_propertyDidChange
{
  if ([(MTPlaylistManifest *)self _updatePlaylistEpisodes])
  {
    [(MTPredicateManifest *)self _refetch:0];
  }
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end