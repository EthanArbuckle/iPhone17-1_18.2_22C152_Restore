@interface MTEpisodeDownloadsAlertsPresenter
- (void)showEpisodeFeedDeleted:(id)a3 onDismiss:(id)a4;
- (void)showEpisodeRestricted:(id)a3;
- (void)showGenericAlert:(id)a3;
- (void)showNoInternet:(id)a3;
- (void)showOrUpdateNetworkErrorAlert:(id)a3 body:(id)a4 onRetry:(id)a5 onDismiss:(id)a6;
- (void)showSubscriptionRequired:(id)a3;
@end

@implementation MTEpisodeDownloadsAlertsPresenter

- (void)showGenericAlert:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Download Failed" value:&stru_10056A8A0 table:0];
  v6 = +[NSString stringWithFormat:v5];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Download error." value:&stru_10056A8A0 table:0];
  v9 = +[NSString stringWithFormat:v8];

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"OK" value:&stru_10056A8A0 table:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BFE94;
  v15[3] = &unk_100550688;
  id v16 = v3;
  id v12 = v3;
  v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v15];

  v14 = +[MTAlertController alertControllerWithTitle:v6 message:v9 preferredStyle:1];
  [v14 addAction:v13];
  [v14 presentAnimated:1 completion:0];
}

- (void)showOrUpdateNetworkErrorAlert:(id)a3 body:(id)a4 onRetry:(id)a5 onDismiss:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"DOWNLOAD_FAILED_DONE" value:&stru_10056A8A0 table:0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C00E0;
  v27[3] = &unk_100550688;
  id v28 = v10;
  id v15 = v10;
  id v16 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v27];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"DOWNLOAD_FAILED_RETRY" value:&stru_10056A8A0 table:0];
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_1000C00F0;
  v25 = &unk_100550688;
  id v26 = v9;
  id v19 = v9;
  v20 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v22];

  v21 = +[MTAlertController alertControllerWithTitle:message:preferredStyle:](MTAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v11, 1, v22, v23, v24, v25);

  [v21 addAction:v16];
  [v21 addAction:v20];
  [v21 presentAnimated:1 completion:0];
}

- (void)showEpisodeFeedDeleted:(id)a3 onDismiss:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[MTEpisodeUnavailableUtil sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C01D0;
  v9[3] = &unk_10054ECB8;
  id v10 = v5;
  id v8 = v5;
  [v7 showDialogForReason:3 podcastTitle:v6 completion:v9];
}

- (void)showSubscriptionRequired:(id)a3
{
  id v3 = a3;
  v4 = +[MTEpisodeUnavailableUtil sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C0294;
  v6[3] = &unk_10054ECB8;
  id v7 = v3;
  id v5 = v3;
  [v4 showDialogForReason:8 podcastTitle:0 completion:v6];
}

- (void)showEpisodeRestricted:(id)a3
{
  id v3 = a3;
  v4 = +[MTEpisodeUnavailableUtil sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C0358;
  v6[3] = &unk_10054ECB8;
  id v7 = v3;
  id v5 = v3;
  [v4 showDialogForReason:1 podcastTitle:0 completion:v6];
}

- (void)showNoInternet:(id)a3
{
  id v3 = a3;
  v4 = +[MTReachability sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C0414;
  v6[3] = &unk_10054D6E8;
  id v7 = v3;
  id v5 = v3;
  [v4 showInternetUnreachableDialogWithAcknowledmentBlock:v6];
}

@end