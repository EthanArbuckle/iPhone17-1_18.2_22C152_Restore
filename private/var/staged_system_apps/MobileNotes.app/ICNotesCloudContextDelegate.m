@interface ICNotesCloudContextDelegate
- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4;
- (BOOL)deleteCloudObjectIfFullyPushed:(id)a3;
- (BOOL)hasExceededQuota;
- (ICNotesCloudContextDelegate)init;
- (ICQInAppMessage)syncMessage;
- (NSMutableSet)quotaExceededRecordIDs;
- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4;
- (id)backgroundContextForCloudContext:(id)a3;
- (id)persistentStoreCoordinatorForCloudContext:(id)a3;
- (id)viewContextForCloudContext:(id)a3;
- (void)accountsDidChange:(id)a3;
- (void)cloudContext:(id)a3 didExceedQuotaForRecordID:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 didFetchShare:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 didFetchUserRecord:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 didPushRecordID:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 receivedZoneNotFound:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5;
- (void)dealloc;
- (void)fixGallerySubAttachments;
- (void)fixGallerySubAttachmentsIfNecessary;
- (void)registerForSyncMessages;
- (void)setSyncMessage:(id)a3;
- (void)syncPasswordProtectedNotesIfNecessary;
- (void)updateAppleAccountBags;
- (void)updateLastOSVersion;
- (void)updateSyncMessage;
@end

@implementation ICNotesCloudContextDelegate

- (ICNotesCloudContextDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICNotesCloudContextDelegate;
  v2 = [(ICNotesCloudContextDelegate *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    quotaExceededRecordIDs = v2->_quotaExceededRecordIDs;
    v2->_quotaExceededRecordIDs = (NSMutableSet *)v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"accountsDidChange:" name:ICAccountsDidChangeNotification object:0];
  }
  return v2;
}

- (id)viewContextForCloudContext:(id)a3
{
  uint64_t v3 = +[ICNoteContext sharedContext];
  v4 = [v3 managedObjectContext];

  return v4;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNotesCloudContextDelegate;
  [(ICNotesCloudContextDelegate *)&v4 dealloc];
}

- (void)registerForSyncMessages
{
  uint64_t v3 = [sub_1000853F8() shared];
  [v3 observeUpdates];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v5 = (void *)qword_1006AA110;
  uint64_t v11 = qword_1006AA110;
  if (!qword_1006AA110)
  {
    v6 = (void *)sub_100088924();
    v9[3] = (uint64_t)dlsym(v6, "ICQCurrentInAppMessageChangedNotification");
    qword_1006AA110 = v9[3];
    v5 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    objc_super v7 = (_Unwind_Exception *)sub_1004D6F34();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  [v4 addObserver:self selector:"updateSyncMessage" name:*v5 object:0];
}

- (void)cloudContext:(id)a3 didExceedQuotaForRecordID:(id)a4 accountID:(id)a5
{
  id v6 = a4;
  objc_super v7 = [(ICNotesCloudContextDelegate *)self quotaExceededRecordIDs];
  [v7 addObject:v6];

  [(ICNotesCloudContextDelegate *)self updateSyncMessage];
}

- (void)cloudContext:(id)a3 didPushRecordID:(id)a4 accountID:(id)a5
{
  id v6 = a4;
  objc_super v7 = [(ICNotesCloudContextDelegate *)self quotaExceededRecordIDs];
  [v7 removeObject:v6];

  [(ICNotesCloudContextDelegate *)self updateSyncMessage];
}

- (BOOL)hasExceededQuota
{
  v2 = [(ICNotesCloudContextDelegate *)self quotaExceededRecordIDs];
  unsigned __int8 v3 = [v2 ic_containsObjectPassingTest:&stru_100627510];

  return v3;
}

- (void)updateSyncMessage
{
  if (+[ICAccount isCloudKitAccountAvailable]
    && !+[ICDeviceSupport isRunningUnitTests])
  {
    objc_initWeak(&location, self);
    unsigned __int8 v3 = [sub_1000853F8() shared];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100085720;
    v4[3] = &unk_100627560;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    [v3 fetchMessageWithCompletion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ICNotesCloudContextDelegate *)self setSyncMessage:0];
  }
}

- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[ICCloudContext notesZoneID];
  unsigned int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = +[ICNoteContext sharedContext];
    v12 = [v11 snapshotManagedObjectContext];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100085DF8;
    v23[3] = &unk_100625A00;
    v13 = &v24;
    v14 = (id *)v25;
    id v24 = v8;
    v25[0] = v12;
    v25[1] = self;
    id v15 = v12;
    [v15 performBlockAndWait:v23];
LABEL_5:

    goto LABEL_6;
  }
  v16 = +[ICCloudContext metadataZoneID];
  unsigned int v17 = [v7 isEqual:v16];

  if (v17)
  {
    v18 = +[ICNoteContext sharedContext];
    v19 = [v18 managedObjectContext];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100086018;
    v20[3] = &unk_100625860;
    v13 = &v21;
    v14 = &v22;
    id v21 = v8;
    v22 = v18;
    id v15 = v18;
    [v19 performBlock:v20];

    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)deleteCloudObjectIfFullyPushed:(id)a3
{
  id v4 = a3;
  if ([v4 isDeleted])
  {
LABEL_13:
    BOOL v10 = 1;
    goto LABEL_19;
  }
  if (([v4 hasSuccessfullyPushedLatestVersionToCloud] & 1) != 0
    || ([v4 markedForDeletion] & 1) != 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [v4 objectsToBeDeletedBeforeThisObject];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if (![(ICNotesCloudContextDelegate *)self deleteCloudObjectIfFullyPushed:*(void *)(*((void *)&v13 + 1) + 8 * i)])
          {

            goto LABEL_18;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [v4 deleteFromLocalDatabase];
    goto LABEL_13;
  }
  uint64_t v11 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1004D70BC(v4);
  }

LABEL_18:
  BOOL v10 = 0;
LABEL_19:

  return v10;
}

- (void)cloudContext:(id)a3 receivedZoneNotFound:(id)a4 accountID:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1004D7170(v6);
  }

  v9 = +[ICNoteContext sharedContext];
  BOOL v10 = [v9 managedObjectContext];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000864D8;
  v14[3] = &unk_100625A00;
  id v15 = v7;
  id v16 = v9;
  id v17 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v7;
  [v10 performBlock:v14];
}

- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 ic_loggingDescription];
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %@: %@", buf, 0x16u);
  }
  BOOL v10 = +[ICNoteContext sharedContext];
  id v11 = [v10 snapshotManagedObjectContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100086A68;
  v15[3] = &unk_100625A00;
  id v16 = v6;
  id v17 = v11;
  id v18 = v7;
  id v12 = v7;
  id v13 = v11;
  id v14 = v6;
  [v13 performBlockAndWait:v15];
}

- (void)cloudContext:(id)a3 didFetchUserRecord:(id)a4 accountID:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = +[ICNoteContext sharedContext];
  v9 = [v8 snapshotManagedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100086E64;
  v13[3] = &unk_100625A00;
  id v14 = v7;
  id v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v9;
  id v12 = v7;
  [v11 performBlockAndWait:v13];
}

- (void)cloudContext:(id)a3 didFetchShare:(id)a4 accountID:(id)a5
{
  if (a4)
  {
    id v7 = a5;
    id v8 = a4;
    id v12 = +[NSMutableDictionary dictionary];
    [v12 ic_setNonNilObject:v8 forNonNilKey:ICNotesCloudContextDidFetchShareNotificationShareKey];

    [v12 ic_setNonNilObject:v7 forNonNilKey:ICNotesCloudContextDidFetchShareNotificationAccountIDKey];
    v9 = +[NSNotificationCenter defaultCenter];
    uint64_t v10 = ICNotesCloudContextDidFetchShareNotification;
    id v11 = [v12 copy];
    [v9 postNotificationName:v10 object:self userInfo:v11];
  }
}

- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100087324;
  id v20 = sub_100087334;
  id v21 = +[NSMutableArray array];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10008733C;
  id v13 = &unk_100625C78;
  id v7 = v6;
  id v14 = v7;
  id v15 = &v16;
  [v7 performBlockAndWait:&v10];
  id v8 = [[v17[5] copy] v10, v11, v12, v13];

  _Block_object_dispose(&v16, 8);

  return v8;
}

- (id)persistentStoreCoordinatorForCloudContext:(id)a3
{
  unsigned __int8 v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 persistentStoreCoordinator];

  return v4;
}

- (id)backgroundContextForCloudContext:(id)a3
{
  unsigned __int8 v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 workerManagedObjectContext];

  return v4;
}

- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4
{
  id v5 = +[ICNoteContext sharedContext];
  LOBYTE(a4) = [v5 hasContextOptions:a4];

  return a4;
}

- (void)syncPasswordProtectedNotesIfNecessary
{
  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1004D73CC();
  }

  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"lastKnownOperatingSystemVersion"];

  id v5 = os_log_create("com.apple.notes", "Cloud");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1004D7358();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No previous OS version dictionary", buf, 2u);
    }

    *(void *)buf = 0;
    id v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v7 = +[ICNoteContext sharedContext];
    id v8 = [v7 managedObjectContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100087814;
    v15[3] = &unk_1006265A8;
    void v15[4] = buf;
    [v8 performBlockAndWait:v15];
    int v9 = v17[24];
    uint64_t v10 = os_log_create("com.apple.notes", "Cloud");
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fetching user record to check if we need to re-sync", v14, 2u);
      }

      uint64_t v11 = +[ICAccount cloudKitAccountInContext:v8];
      id v12 = +[ICCloudContext sharedContext];
      id v13 = [v11 identifier];
      [v12 fetchUserRecordWithAccountID:v13 completionHandler:&stru_1006275A0];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      sub_1004D7324();
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)updateAppleAccountBags
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"DidUpdateAppleAccountProperties"];

  if (v3)
  {
    id v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1004D749C();
    }
  }
  else
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setBool:1 forKey:@"DidUpdateAppleAccountProperties"];

    id v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1004D74D0();
    }

    id v4 = +[ACAccountStore defaultStore];
    id v14 = [v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
    id v7 = -[NSObject accountsWithAccountType:](v4, "accountsWithAccountType:");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v12, "ic_isNotesMigrated") & 1) == 0
            && (objc_msgSend(v12, "ic_isPrimaryAppleAccount") & 1) == 0)
          {
            id v13 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v21 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updating account bag for %@", buf, 0xCu);
            }

            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_100087F10;
            v15[3] = &unk_100627628;
            void v15[4] = v12;
            [v4 aa_updatePropertiesForAppleAccount:v12 completion:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (void)fixGallerySubAttachmentsIfNecessary
{
  unsigned int v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"DidFixGallerySubAttachments"];

  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1004D7580();
    }
  }
  else
  {
    [(ICNotesCloudContextDelegate *)self fixGallerySubAttachments];
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setBool:1 forKey:@"DidFixGallerySubAttachments"];
  }
}

- (void)fixGallerySubAttachments
{
  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1004D75B4();
  }

  unsigned int v3 = +[ICNoteContext sharedContext];
  unsigned __int8 v4 = [v3 workerManagedObjectContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000881D8;
  v6[3] = &unk_100625AF0;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)accountsDidChange:(id)a3
{
  unsigned int v3 = +[ICCloudContext sharedContext];
  [v3 clearContainers];
  [v3 setNeedsToUpdateSubscriptions:1];
  [v3 clearSubscribedSubscriptionIDs];
  unsigned __int8 v4 = [v3 operationQueue];
  if (![v4 operationCount])
  {

    goto LABEL_7;
  }
  unsigned __int8 v5 = +[ICAccount isCloudKitAccountAvailable];

  if (v5)
  {
LABEL_7:
    id v8 = dispatch_get_global_queue(-2, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008869C;
    v10[3] = &unk_100625AF0;
    id v7 = &v11;
    uint64_t v11 = v3;
    id v9 = v3;
    dispatch_async(v8, v10);

    goto LABEL_8;
  }
  id v6 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1004D7720();
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100088694;
  v12[3] = &unk_100625AF0;
  id v7 = &v13;
  id v13 = v3;
  [v3 cancelEverythingWithCompletionHandler:v12];
LABEL_8:
}

- (void)updateLastOSVersion
{
  v2 = +[NSProcessInfo processInfo];
  unsigned int v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  unsigned __int8 v4 = +[NSNumber numberWithInteger:0];
  unsigned __int8 v5 = +[NSNumber numberWithInteger:0];
  id v6 = +[NSNumber numberWithInteger:0];
  v10[0] = @"majorVersion";
  v10[1] = @"minorVersion";
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = @"patchVersion";
  v11[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 setObject:v7 forKey:@"lastKnownOperatingSystemVersion"];

  id v9 = +[NSUserDefaults standardUserDefaults];
  [v9 synchronize];
}

- (ICQInAppMessage)syncMessage
{
  return self->_syncMessage;
}

- (void)setSyncMessage:(id)a3
{
}

- (NSMutableSet)quotaExceededRecordIDs
{
  return self->_quotaExceededRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaExceededRecordIDs, 0);

  objc_storeStrong((id *)&self->_syncMessage, 0);
}

@end