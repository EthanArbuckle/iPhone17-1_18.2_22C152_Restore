@interface PDCloudStoreService
- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator;
- (PDCloudStoreService)initWithConnection:(id)a3;
- (PDCloudStoreService)initWithConnection:(id)a3 server:(id)a4;
- (PDCloudStoreTransactionSourceController)transactionSourceController;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4;
- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4;
- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4;
- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5;
- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3;
- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4;
- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5;
- (void)setCloudStoreNotificationCoordinator:(id)a3;
- (void)setTransactionSourceController:(id)a3;
- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4;
- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4;
- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6;
@end

@implementation PDCloudStoreService

- (PDCloudStoreService)initWithConnection:(id)a3
{
  return 0;
}

- (PDCloudStoreService)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDCloudStoreService;
  v6 = [(PDCloudStoreService *)&v12 initWithConnection:v5];
  if (v6)
  {
    v7 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v5];
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    v9 = PKCloudStoreServiceInterface();
    [v5 setRemoteObjectInterface:v9];

    v10 = PDCloudStoreServiceInterface();
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008E9AC;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    v15 = dispatch_get_global_queue(21, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008EE04;
    v17[3] = &unk_100732BC8;
    v17[4] = self;
    unint64_t v21 = a3;
    id v18 = v12;
    id v19 = v13;
    BOOL v22 = a6;
    id v20 = v14;
    v16 = v17;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v24 = v16;
    dispatch_async(v15, block);
  }
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = dispatch_get_global_queue(21, 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008F274;
    v16[3] = &unk_100731F38;
    v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    v15 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v22 = v15;
    dispatch_async(v14, block);
  }
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    v9 = dispatch_get_global_queue(21, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008F680;
    v11[3] = &unk_100731600;
    v11[4] = self;
    unint64_t v13 = a3;
    BOOL v14 = a4;
    id v12 = v8;
    id v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v16 = v10;
    dispatch_async(v9, block);
  }
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = dispatch_get_global_queue(21, 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008FAC4;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    id v12 = v13;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v18 = v12;
    dispatch_async(v11, block);
  }
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    id v12 = dispatch_get_global_queue(21, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008FEF8;
    v14[3] = &unk_100732BF0;
    v14[4] = self;
    unint64_t v17 = a3;
    id v15 = v10;
    int64_t v18 = a5;
    id v16 = v11;
    unint64_t v13 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v20 = v13;
    dispatch_async(v12, block);
  }
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    id v12 = dispatch_get_global_queue(21, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100090334;
    v14[3] = &unk_100732BF0;
    v14[4] = self;
    unint64_t v17 = a3;
    id v15 = v10;
    int64_t v18 = a5;
    id v16 = v11;
    unint64_t v13 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v20 = v13;
    dispatch_async(v12, block);
  }
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100090758;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
}

- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(21, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100090B98;
  v16[3] = &unk_100730578;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v21 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100090FB4;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000913D4;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000917E4;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = dispatch_get_global_queue(21, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100091C4C;
  v18[3] = &unk_100732C18;
  v18[4] = self;
  id v19 = v10;
  BOOL v22 = a5;
  id v20 = v11;
  id v21 = v12;
  id v14 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v24 = v14;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v13, block);
}

- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(21, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000920B4;
  v16[3] = &unk_100730578;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v21 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(21, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000924F8;
  v16[3] = &unk_100730578;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v21 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(21, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009293C;
  v16[3] = &unk_100730578;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v21 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = dispatch_get_global_queue(21, 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100092DB8;
  v22[3] = &unk_100732C68;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  int64_t v27 = a6;
  id v17 = v22;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v29 = v17;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async(v16, block);
}

- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = dispatch_get_global_queue(21, 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100093230;
  v22[3] = &unk_100732C68;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  int64_t v27 = a6;
  id v17 = v22;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v29 = v17;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async(v16, block);
}

- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = dispatch_get_global_queue(21, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100093680;
  v18[3] = &unk_100730288;
  v18[4] = self;
  id v19 = v10;
  id v21 = v12;
  int64_t v22 = a5;
  id v20 = v11;
  id v14 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v24 = v14;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v13, block);
}

- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100093A9C;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100093EB4;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000942D8;
  v14[3] = &unk_100731AD8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v11 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, block);
}

- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000946EC;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100094AE0;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100094EF0;
  v12[3] = &unk_1007315D8;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7F0;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v8, block);
}

- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009536C;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009559C;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000957A0;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100095998;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7F0;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator
{
  return self->_cloudStoreNotificationCoordinator;
}

- (void)setCloudStoreNotificationCoordinator:(id)a3
{
}

- (PDCloudStoreTransactionSourceController)transactionSourceController
{
  return self->_transactionSourceController;
}

- (void)setTransactionSourceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceController, 0);
  objc_storeStrong((id *)&self->_cloudStoreNotificationCoordinator, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end