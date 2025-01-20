@interface INCloudNetworkController
- (INCloudNetworkController)init;
- (INCloudNetworkController)initWithAccount:(id)a3;
- (id)_backupDeviceUDID;
- (void)_sendNetworkRequestForTip:(id)a3 request:(id)a4 completion:(id)a5;
- (void)_sendRecommendationActionStatusWithRequest:(id)a3 completion:(id)a4;
- (void)appCloudStorageForBundleId:(id)a3 completion:(id)a4;
- (void)cloudStorageApps:(id)a3;
- (void)cloudStorageSummary:(id)a3;
- (void)dismissedNetworkRequestForTip:(id)a3 completion:(id)a4;
- (void)displayedNetworkRequestForTip:(id)a3 completion:(id)a4;
- (void)fetchAppsSyncingToDrive:(id)a3;
- (void)fetchBackupInfoWithCompletion:(id)a3;
- (void)fetchCompletedAndDismissedRecommendationsWithConfiguration:(id)a3 completion:(id)a4;
- (void)fetchRecommendationRules:(id)a3;
- (void)fetchServerRecommendations:(id)a3;
- (void)sendStatusForRecommendationWithConfiguration:(id)a3 params:(id)a4 completion:(id)a5;
- (void)sendStatusForRecommendationWithConfiguration:(id)a3 recommendationIdentifiers:(id)a4 status:(id)a5 storageRecovered:(id)a6 completion:(id)a7;
- (void)sendStatusForRecommendationWithConfiguration:(id)a3 recommendationIdentifiers:(id)a4 status:(id)a5 storageRecovered:(id)a6 context:(id)a7 completion:(id)a8;
@end

@implementation INCloudNetworkController

- (INCloudNetworkController)initWithAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCloudNetworkController;
  v6 = [(INCloudNetworkController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    uint64_t v8 = +[AAURLSession sharedSessionWithNoUrlCache];
    aaUrlSession = v7->_aaUrlSession;
    v7->_aaUrlSession = (AAURLSession *)v8;
  }
  return v7;
}

- (INCloudNetworkController)init
{
  return 0;
}

- (void)cloudStorageSummary:(id)a3
{
  id v4 = a3;
  id v5 = [INStorageSummaryRequest alloc];
  account = self->_account;
  v7 = [(INCloudNetworkController *)self _backupDeviceUDID];
  uint64_t v8 = [(INStorageSummaryRequest *)v5 initWithAccount:account withBackupDeviceUDID:v7];

  aaUrlSession = self->_aaUrlSession;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006540;
  v11[3] = &unk_100040EA0;
  id v12 = v4;
  id v10 = v4;
  [(INStorageSummaryRequest *)v8 performRequestWithSession:aaUrlSession withHandler:v11];
}

- (void)cloudStorageApps:(id)a3
{
  id v4 = a3;
  id v5 = [INStorageAppsRequest alloc];
  account = self->_account;
  v7 = [(INCloudNetworkController *)self _backupDeviceUDID];
  uint64_t v8 = [(INStorageAppsRequest *)v5 initWithAccount:account withBackupDeviceUDID:v7];

  aaUrlSession = self->_aaUrlSession;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000067BC;
  v11[3] = &unk_100040EA0;
  id v12 = v4;
  id v10 = v4;
  [(INStorageAppsRequest *)v8 performRequestWithSession:aaUrlSession withHandler:v11];
}

- (void)appCloudStorageForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[INStorageByAppRequest alloc] initWithAccount:self->_account bundleId:v7];

  aaUrlSession = self->_aaUrlSession;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006A24;
  v11[3] = &unk_100040EA0;
  id v12 = v6;
  id v10 = v6;
  [(INStorageByAppRequest *)v8 performRequestWithSession:aaUrlSession withHandler:v11];
}

- (void)fetchBackupInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [INCloudBackupInfoRequest alloc];
  account = self->_account;
  id v7 = [(INCloudNetworkController *)self _backupDeviceUDID];
  uint64_t v8 = [(INCloudBackupInfoRequest *)v5 initWithAccount:account withBackupDeviceUDID:v7];

  aaUrlSession = self->_aaUrlSession;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006CA0;
  v11[3] = &unk_100040EA0;
  id v12 = v4;
  id v10 = v4;
  [(INCloudBackupInfoRequest *)v8 performRequestWithSession:aaUrlSession withHandler:v11];
}

- (void)displayedNetworkRequestForTip:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[INTipNetworkRequest alloc] initWithAccountForDisplayStatus:self->_account tip:v7];
  [(INCloudNetworkController *)self _sendNetworkRequestForTip:v7 request:v8 completion:v6];
}

- (void)dismissedNetworkRequestForTip:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[INTipNetworkRequest alloc] initWithAccountForDismissStatus:self->_account tip:v7];
  [(INCloudNetworkController *)self _sendNetworkRequestForTip:v7 request:v8 completion:v6];
}

- (void)_sendNetworkRequestForTip:(id)a3 request:(id)a4 completion:(id)a5
{
  id v7 = a5;
  aaUrlSession = self->_aaUrlSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006FFC;
  v10[3] = &unk_100040EA0;
  id v11 = v7;
  id v9 = v7;
  [a4 performRequestWithSession:aaUrlSession withHandler:v10];
}

- (id)_backupDeviceUDID
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000071F0;
  block[3] = &unk_100040EC8;
  block[4] = self;
  if (qword_10004E460 != -1) {
    dispatch_once(&qword_10004E460, block);
  }
  return (id)qword_10004E458;
}

- (void)fetchAppsSyncingToDrive:(id)a3
{
  id v4 = a3;
  id v5 = [[INAppsSyncingToDriveRequest alloc] initWithAccount:self->_account];
  aaUrlSession = self->_aaUrlSession;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000733C;
  v8[3] = &unk_100040EA0;
  id v9 = v4;
  id v7 = v4;
  [(INAppsSyncingToDriveRequest *)v5 performRequestWithSession:aaUrlSession withHandler:v8];
}

- (void)fetchServerRecommendations:(id)a3
{
  id v4 = a3;
  id v5 = [[INRecommendationsRequest alloc] initWithAccount:self->_account];
  aaUrlSession = self->_aaUrlSession;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000758C;
  v8[3] = &unk_100040EA0;
  id v9 = v4;
  id v7 = v4;
  [(INRenewingRequest *)v5 performRequestWithSession:aaUrlSession withHandler:v8];
}

- (void)fetchRecommendationRules:(id)a3
{
  id v4 = a3;
  id v5 = [[INRulesetRequest alloc] initWithAccount:self->_account];
  aaUrlSession = self->_aaUrlSession;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000077D8;
  v8[3] = &unk_100040EA0;
  id v9 = v4;
  id v7 = v4;
  [(INRenewingRequest *)v5 performRequestWithSession:aaUrlSession withHandler:v8];
}

- (void)fetchCompletedAndDismissedRecommendationsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[INRecommendationsCompletedAndDismissedRequest alloc] initWithAccount:self->_account configuration:v7];

  aaUrlSession = self->_aaUrlSession;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007A3C;
  v11[3] = &unk_100040EA0;
  id v12 = v6;
  id v10 = v6;
  [(INRecommendationsCompletedAndDismissedRequest *)v8 performRequestWithSession:aaUrlSession withHandler:v11];
}

- (void)_sendRecommendationActionStatusWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  aaUrlSession = self->_aaUrlSession;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007C6C;
  v9[3] = &unk_100040EA0;
  id v10 = v6;
  id v8 = v6;
  [a3 performRequestWithSession:aaUrlSession withHandler:v9];
}

- (void)sendStatusForRecommendationWithConfiguration:(id)a3 recommendationIdentifiers:(id)a4 status:(id)a5 storageRecovered:(id)a6 completion:(id)a7
{
}

- (void)sendStatusForRecommendationWithConfiguration:(id)a3 recommendationIdentifiers:(id)a4 status:(id)a5 storageRecovered:(id)a6 context:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([v16 isEqualToString:@"displayed"])
  {
    v20 = [[INRecommendationsActionsRequest alloc] initWithAccountForDisplayStatus:self->_account configuration:v14 recommendations:v15 context:v18];
LABEL_9:
    v21 = v20;
    goto LABEL_10;
  }
  if ([v16 isEqualToString:@"dismissed"])
  {
    v20 = [[INRecommendationsActionsRequest alloc] initWithAccountForDismissStatus:self->_account configuration:v14 recommendations:v15 context:v18];
    goto LABEL_9;
  }
  if ([v16 isEqualToString:@"completed"])
  {
    v20 = [[INRecommendationsActionsRequest alloc] initWithAccountForActionCompletedStatus:self->_account configuration:v14 recommendations:v15 storageRecovered:v17 context:v18];
    goto LABEL_9;
  }
  if ([v16 isEqualToString:@"canceled"])
  {
    v20 = [[INRecommendationsActionsRequest alloc] initWithAccountForActionCancelledStatus:self->_account configuration:v14 recommendations:v15 context:v18];
    goto LABEL_9;
  }
  v22 = _INLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100027420();
  }

  v21 = 0;
LABEL_10:
  [(INCloudNetworkController *)self _sendRecommendationActionStatusWithRequest:v21 completion:v19];
}

- (void)sendStatusForRecommendationWithConfiguration:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[INRecommendationsActionsRequest alloc] initWithAccount:self->_account configuration:v10 params:v9];

  [(INCloudNetworkController *)self _sendRecommendationActionStatusWithRequest:v11 completion:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaUrlSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end