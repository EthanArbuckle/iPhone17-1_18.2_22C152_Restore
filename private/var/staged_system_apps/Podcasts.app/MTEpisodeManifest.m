@interface MTEpisodeManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4;
- (MTEpisodeManifest)initWithEpisodeUuid:(id)a3;
- (id)activity;
@end

@implementation MTEpisodeManifest

+ (id)activityTypeSuffix
{
  return @"episode";
}

- (MTEpisodeManifest)initWithEpisodeUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc((Class)NSFetchRequest);
    id v6 = [v5 initWithEntityName:kMTEpisodeEntityName];
    v7 = +[MTEpisode predicateForEpisodeUuid:v4];
    [v6 setPredicate:v7];

    [v6 setSortDescriptors:&__NSArray0__struct];
    v13.receiver = self;
    v13.super_class = (Class)MTEpisodeManifest;
    v8 = [(MTPredicateManifest *)&v13 initWithInitialEpisodeUuid:v4 fetchRequest:v6];
    v9 = v8;
    if (v8)
    {
      v10 = [(MTEpisodeManifest *)v8 activity];
      [v10 setValue:v4 forKey:@"MTEpisodeManifestEpisodeUuid"];
    }
    self = v9;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"MTEpisodeManifestEpisodeUuid"];

  if ([v9 length]
    && (+[MTEpisode exists:v9] & 1) != 0)
  {
    v7[2](v7, v9);
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___MTEpisodeManifest;
    [super episodeUuidForActivity:v6 completion:v7];
  }
}

- (id)activity
{
  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeManifest;
  v2 = [(MTPlayerManifest *)&v4 activity];

  return v2;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100071F14;
  v7[3] = &unk_10054E460;
  id v8 = a4;
  id v6 = v8;
  [a1 episodeUuidForActivity:a3 completion:v7];
}

@end