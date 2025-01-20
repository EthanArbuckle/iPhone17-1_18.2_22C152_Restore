@interface MTUnplayedManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3;
- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3 newestToOldest:(BOOL)a4;
@end

@implementation MTUnplayedManifest

- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3
{
  return [(MTUnplayedManifest *)self initWithInitialEpisodeUuid:a3 newestToOldest:1];
}

- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3 newestToOldest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[MTEpisode predicateForEpisodesOnUnplayedTab];
  if (v4)
  {
    v8 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
    v20[0] = v8;
    v9 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:0];
    v20[1] = v9;
    v10 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:1];
    v20[2] = v10;
    v11 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
    v20[3] = v11;
    v12 = v20;
  }
  else
  {
    v8 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:1];
    v19[0] = v8;
    v9 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:1];
    v19[1] = v9;
    v10 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:0];
    v19[2] = v10;
    v11 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
    v19[3] = v11;
    v12 = v19;
  }
  v13 = +[NSArray arrayWithObjects:v12 count:4];
  v18.receiver = self;
  v18.super_class = (Class)MTUnplayedManifest;
  v14 = [(MTPredicateManifest *)&v18 initWithInitialEpisodeUuid:v6 predicateToTrack:v7 sortDescriptors:v13];

  if (v14)
  {
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"EPISODE_UNPLAYED_TITLE" value:&stru_10056A8A0 table:0];
    [(MTUnplayedManifest *)v14 setTitle:v16];
  }
  return v14;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015C2AC;
  v7[3] = &unk_10054E460;
  id v8 = a4;
  id v6 = v8;
  [a1 episodeUuidForActivity:a3 completion:v7];
}

+ (id)activityTypeSuffix
{
  return @"unplayed";
}

@end