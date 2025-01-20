@interface MCDMusicNowPlayingViewController
+ (id)musicNowPlayingViewController;
@end

@implementation MCDMusicNowPlayingViewController

+ (id)musicNowPlayingViewController
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)qword_1010D6E28;
  uint64_t v19 = qword_1010D6E28;
  if (!qword_1010D6E28)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000995B4;
    v15[3] = &unk_100FC34A0;
    v15[4] = &v16;
    sub_1000995B4((uint64_t)v15);
    v2 = (void *)v17[3];
  }
  v3 = v2;
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 alloc];
  v5 = sub_1000994AC();
  id v6 = [v4 initWithBundleID:v5 appName:0];

  v7 = [MCDNowPlayingContentManager alloc];
  v8 = objc_opt_new();
  v9 = sub_1000994AC();
  v10 = [(MCDNowPlayingContentManager *)v7 initWithDelegate:v6 dataSource:v8 bundleID:v9];

  [v6 setContentManager:v10];
  v11 = [MCDUpNextViewController alloc];
  v12 = [v6 contentManager];
  v13 = [(MCDUpNextViewController *)v11 initWithContentManager:v12];
  [v6 setPlaybackQueueViewController:v13];

  [v6 setPlayActivityFeatureName:@"now_playing"];

  return v6;
}

@end