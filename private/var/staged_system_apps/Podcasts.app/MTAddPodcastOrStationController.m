@interface MTAddPodcastOrStationController
- (BOOL)userHasSomePodcasts;
- (MTAddPodcastOrStationController)init;
- (UIAlertController)alertController;
- (id)createAndSaveStationWithTitle:(id)a3;
- (id)plusButtonItem;
- (id)presentingViewController;
- (void)dismissAllModalsAnimated:(BOOL)a3;
- (void)performSubscribe:(id)a3;
- (void)plusButtonPressed:(id)a3;
- (void)presentAddPodcastUI;
- (void)presentAddPodcastUIWithUrl:(id)a3;
- (void)presentAddStationUI;
- (void)presentStationWithTitle:(id)a3;
- (void)setAlertController:(id)a3;
@end

@implementation MTAddPodcastOrStationController

- (MTAddPodcastOrStationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTAddPodcastOrStationController;
  v2 = [(MTAddPodcastOrStationController *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)plusButtonItem
{
  plusButtonItem = self->_plusButtonItem;
  if (!plusButtonItem)
  {
    v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"plusButtonPressed:"];
    v5 = self->_plusButtonItem;
    self->_plusButtonItem = v4;

    plusButtonItem = self->_plusButtonItem;
  }

  return plusButtonItem;
}

- (void)plusButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Add Podcast" value:&stru_10056A8A0 table:0];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Add Station" value:&stru_10056A8A0 table:0];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Cancel" value:&stru_10056A8A0 table:0];

  v11 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  [(MTAddPodcastOrStationController *)self setAlertController:v11];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D44CC;
  v23[3] = &unk_100550790;
  v23[4] = self;
  v12 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v23];
  [v11 addAction:v12];

  if ([(MTAddPodcastOrStationController *)self userHasSomePodcasts])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D44D4;
    v22[3] = &unk_100550790;
    v22[4] = self;
    v13 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v22];
    [v11 addAction:v13];
  }
  v14 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v11 addAction:v14];

  v15 = [v11 popoverPresentationController];
  [v15 setBarButtonItem:v4];

  v16 = +[UIColor appTintColor];
  v17 = [v11 view];
  [v17 setTintColor:v16];

  [v11 setModalPresentationStyle:2];
  v18 = [(MTAddPodcastOrStationController *)self presentingViewController];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D44DC;
  v20[3] = &unk_10054D570;
  id v21 = v11;
  id v19 = v11;
  [v18 presentViewController:v19 animated:1 completion:v20];
}

- (void)presentAddPodcastUI
{
}

- (void)presentAddPodcastUIWithUrl:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Add Podcast" value:&stru_10056A8A0 table:0];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"ADD_PODCAST_MESSAGE" value:&stru_10056A8A0 table:0];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Follow" value:&stru_10056A8A0 table:0];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"Cancel" value:&stru_10056A8A0 table:0];

  v13 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  [(MTAddPodcastOrStationController *)self setAlertController:v13];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100056FBC;
  v27[4] = sub_1000572A8;
  id v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000D48B4;
  v24[3] = &unk_100550A28;
  v26 = v27;
  id v14 = v4;
  id v25 = v14;
  [v13 addTextFieldWithConfigurationHandler:v24];
  v15 = +[UIAlertAction actionWithTitle:v12 style:1 handler:0];
  [v13 addAction:v15];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D4938;
  v23[3] = &unk_100550A50;
  v23[4] = self;
  void v23[5] = v27;
  v16 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v23];
  [v13 addAction:v16];

  v17 = +[UIColor appTintColor];
  v18 = [v13 view];
  [v18 setTintColor:v17];

  id v19 = +[MTApplication appController];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000D4AB0;
  v21[3] = &unk_10054D9B0;
  v21[4] = self;
  id v20 = v13;
  id v22 = v20;
  [v19 dismissNowPlayingAnimated:1 completion:v21];

  _Block_object_dispose(v27, 8);
}

- (void)performSubscribe:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setUrl:v3];

  [v5 setUserInitiated:1];
  id v4 = +[MTSubscriptionManager sharedInstance];
  [v4 subscribeToPodcastWithParams:v5];
}

- (void)presentAddStationUI
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"NEW_PLAYLIST_ALERT" value:&stru_10056A8A0 table:0];

  id v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Save Playlist" value:&stru_10056A8A0 table:0];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Cancel" value:&stru_10056A8A0 table:0];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"TITLE_PLACEHOLDER" value:&stru_10056A8A0 table:0];

  v11 = +[UIAlertController alertControllerWithTitle:v4 message:&stru_10056A8A0 preferredStyle:1];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100056FBC;
  v25[4] = sub_1000572A8;
  id v26 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000D4F0C;
  v22[3] = &unk_100550A78;
  id v12 = v10;
  id v23 = v12;
  v24 = v25;
  [v11 addTextFieldWithConfigurationHandler:v22];
  v13 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000D4F68;
  v21[3] = &unk_100550A50;
  v21[4] = self;
  void v21[5] = v25;
  id v14 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v21];
  [v11 addAction:v13];
  [v11 addAction:v14];
  v15 = +[UIColor appTintColor];
  v16 = [v11 view];
  [v16 setTintColor:v15];

  v17 = +[MTApplication appController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D500C;
  v19[3] = &unk_10054D9B0;
  v19[4] = self;
  id v18 = v11;
  id v20 = v18;
  [v17 dismissNowPlayingAnimated:1 completion:v19];

  _Block_object_dispose(v25, 8);
}

- (void)presentStationWithTitle:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(MTAddPodcastOrStationController *)self createAndSaveStationWithTitle:v6];
    id v5 = +[MTApplication appController];
    [v5 presentStation:v4 new:1];
  }
}

- (id)createAndSaveStationWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100056FBC;
  v25[4] = sub_1000572A8;
  id v26 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100056FBC;
  id v23 = sub_1000572A8;
  id v24 = 0;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1000D52D0;
  id v14 = &unk_100550AA0;
  v17 = &v19;
  id v6 = v5;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  id v18 = v25;
  [v6 performBlockAndWaitWithSave:&v11];
  v8 = +[SyncKeysRepository shared];
  [v8 setIsPlaylistSyncDirty:1];

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(v25, 8);

  return v9;
}

- (id)presentingViewController
{
  v2 = +[MTApplication appController];
  id v3 = [v2 rootViewController];

  return v3;
}

- (BOOL)userHasSomePodcasts
{
  id v2 = objc_alloc((Class)NSFetchRequest);
  id v3 = [v2 initWithEntityName:kMTPodcastEntityName];
  id v4 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  [v3 setPredicate:v4];

  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainQueueContext];
  uint64_t v11 = 0;
  id v7 = [v6 countForFetchRequest:v3 error:&v11];

  BOOL v9 = v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != 0;
  return v9;
}

- (void)dismissAllModalsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MTAddPodcastOrStationController *)self alertController];

  if (v5)
  {
    id v6 = [(MTAddPodcastOrStationController *)self alertController];
    [v6 dismissViewControllerAnimated:v3 completion:0];
  }
}

- (UIAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);

  objc_storeStrong((id *)&self->_plusButtonItem, 0);
}

@end