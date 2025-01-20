@interface ICDebugUtilities
+ (id)stateOfTheWorld;
+ (void)deleteEverythingWithCompletionHandler:(id)a3;
+ (void)deleteInvalidObjects;
+ (void)deleteMigratedDuplicatesWithCompletionHandler:(id)a3;
+ (void)deleteZonesWithZoneIDs:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
+ (void)markEverythingNeedToBeFetched;
+ (void)purgeEverythingWithCompletionHandler:(id)a3;
+ (void)pushEverythingToCloud;
+ (void)showAlertForError:(id)a3 title:(id)a4;
+ (void)showAlertWithTitle:(id)a3 description:(id)a4;
+ (void)startFreshWithCompletionHandler:(id)a3;
@end

@implementation ICDebugUtilities

+ (void)purgeEverythingWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[ICMigrationController sharedController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AE54C;
  v6[3] = &unk_100625988;
  id v7 = v3;
  id v5 = v3;
  [v4 cancelAllOperationsWithCompletionHandler:v6];
}

+ (void)deleteEverythingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ICNoteContext sharedContext];
  v6 = [v5 managedObjectContext];

  [v6 performBlockAndWait:&stru_100628190];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  +[ICAccount allActiveCloudKitAccountsInContext:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AE8CC;
  v9[3] = &unk_100628200;
  v12 = v14;
  id v13 = a1;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(v14, 8);
}

+ (void)deleteZonesWithZoneIDs:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ICCloudContext sharedContext];
  v12 = +[ICMigrationController sharedController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AEC80;
  v17[3] = &unk_100628278;
  id v18 = v11;
  id v19 = v8;
  id v21 = v10;
  id v22 = a1;
  id v20 = v9;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  [v12 cancelAllOperationsWithCompletionHandler:v17];
}

+ (void)showAlertForError:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = [a3 localizedDescription];
  [a1 showAlertWithTitle:v6 description:v7];
}

+ (void)showAlertWithTitle:(id)a3 description:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AF168;
  v7[3] = &unk_100625860;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (void)startFreshWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004DA218(v5);
  }

  id v6 = [v4 copy];
  +[ICMigrationController setDidChooseToMigrateLocalAccount:0];
  +[ICMigrationController setDidMigrateLocalAccount:0];
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:ICMigrationStateWillChangeNotification object:0];

  +[ICStartupController setHasShownWelcomeScreen:0];
  +[ICNoteContext setLegacyNotesDisabled:0];
  id v8 = +[ICNoteContext sharedContext];
  id v9 = [v8 managedObjectContext];
  id v10 = +[ICAccount allCloudKitAccountsInContext:v9];

  if ([v10 count])
  {
    *(void *)buf = 0;
    id v20 = buf;
    uint64_t v21 = 0x2020000000;
    id v22 = 0;
    id v22 = [v10 count];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AF530;
    v12[3] = &unk_1006283A0;
    v17 = buf;
    id v18 = a1;
    id v13 = v8;
    id v14 = v10;
    id v15 = v4;
    id v16 = v6;
    [v14 enumerateObjectsUsingBlock:v12];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v11 = os_log_create("com.apple.notes", "Internal");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Trying to reset migration without a CloudKit account", buf, 2u);
    }

    [a1 showAlertWithTitle:@"No CloudKit account to reset" description:@"Cannot reset migration without a CloudKit account."];
    if (v4) {
      v4[2](v4);
    }
  }
}

+ (void)pushEverythingToCloud
{
  v2 = +[ICNoteContext sharedContext];
  id v3 = [v2 snapshotManagedObjectContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AFF74;
  v6[3] = &unk_100625AF0;
  id v7 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v6];
  id v5 = +[ICCloudContext sharedContext];
  [v5 processAllCloudObjectsWithCompletionHandler:0];
}

+ (void)markEverythingNeedToBeFetched
{
  id v2 = +[ICNoteContext sharedContext];
  [v2 performSnapshotBackgroundTask:&stru_100628400];
}

+ (id)stateOfTheWorld
{
  id v2 = +[ICDatabaseStateHandler stateDictionary];
  id v3 = [v2 description];

  return v3;
}

+ (void)deleteInvalidObjects
{
  id v2 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Deleting invalid objects", buf, 2u);
  }

  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B02E0;
  v6[3] = &unk_100625AF0;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

+ (void)deleteMigratedDuplicatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting duplicate legacy notes", buf, 2u);
  }

  id v6 = +[ICNoteContext sharedContext];
  id v7 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0624;
  block[3] = &unk_100625DB0;
  id v12 = v4;
  id v13 = a1;
  id v11 = v6;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

@end