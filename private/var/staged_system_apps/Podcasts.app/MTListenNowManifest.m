@interface MTListenNowManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (void)nextManifest:(id)a3;
@end

@implementation MTListenNowManifest

- (void)nextManifest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[MTListenNowManager sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10012DE30;
    v6[3] = &unk_100551D20;
    v6[4] = self;
    id v7 = v4;
    [v5 results:v6];
  }
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 userInfo];
  v9 = [v8 valueForKey:@"MTPodcastManifestActivitySectionType"];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012E578;
  v12[3] = &unk_10054F630;
  id v13 = v9;
  id v14 = v6;
  id v10 = v9;
  id v11 = v6;
  [a1 episodeUuidForActivity:v7 completion:v12];
}

+ (id)activityTypeSuffix
{
  return @"listenNow";
}

@end