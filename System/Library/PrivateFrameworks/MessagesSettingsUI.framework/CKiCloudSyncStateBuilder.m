@interface CKiCloudSyncStateBuilder
+ (id)_messagesInCloudCountStringWithLongCount:(unint64_t)a3;
+ (id)_syncFooterTextWithStatusError:(id)a3 dateString:(id)a4;
+ (id)_syncingMessagesStringWithLongCount:(unint64_t)a3;
+ (id)accountMismatchStateForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)idleStateForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)noSyncStorageAlmostFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)noSyncStorageFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)noSyncStorageOverFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncCompleteForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncDownloadingForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncModelForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncPausedAirplaneModeForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncPausedCellularDataDisabledForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncPausedNoInternetConnectionForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
+ (id)syncUploadingForDescriptor:(CKiCloudSyncStatusDescriptor *)a3;
@end

@implementation CKiCloudSyncStateBuilder

+ (id)syncModelForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  switch(a3->var0)
  {
    case 0:
      long long v54 = *(_OWORD *)&a3->var0;
      id var3 = a3->var3;
      unint64_t var2 = a3->var2;
      id v6 = var3;
      id v56 = v6;
      BOOL var4 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 idleStateForDescriptor:&v54];
      goto LABEL_22;
    case 1:
      long long v50 = *(_OWORD *)&a3->var0;
      id v8 = a3->var3;
      unint64_t v51 = a3->var2;
      id v6 = v8;
      id v52 = v6;
      BOOL v53 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 syncUploadingForDescriptor:&v50];
      goto LABEL_22;
    case 2:
      long long v46 = *(_OWORD *)&a3->var0;
      id v9 = a3->var3;
      unint64_t v47 = a3->var2;
      id v6 = v9;
      id v48 = v6;
      BOOL v49 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 syncDownloadingForDescriptor:&v46];
      goto LABEL_22;
    case 3:
      long long v42 = *(_OWORD *)&a3->var0;
      id v10 = a3->var3;
      unint64_t v43 = a3->var2;
      id v6 = v10;
      id v44 = v6;
      BOOL v45 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 syncPausedNoInternetConnectionForDescriptor:&v42];
      goto LABEL_22;
    case 4:
      long long v38 = *(_OWORD *)&a3->var0;
      id v11 = a3->var3;
      unint64_t v39 = a3->var2;
      id v6 = v11;
      id v40 = v6;
      BOOL v41 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 syncPausedAirplaneModeForDescriptor:&v38];
      goto LABEL_22;
    case 5:
      long long v34 = *(_OWORD *)&a3->var0;
      id v12 = a3->var3;
      unint64_t v35 = a3->var2;
      id v6 = v12;
      id v36 = v6;
      BOOL v37 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 syncPausedCellularDataDisabledForDescriptor:&v34];
      goto LABEL_22;
    case 6:
      long long v30 = *(_OWORD *)&a3->var0;
      id v13 = a3->var3;
      unint64_t v31 = a3->var2;
      id v6 = v13;
      id v32 = v6;
      BOOL v33 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 accountMismatchStateForDescriptor:&v30];
      goto LABEL_22;
    case 7:
      long long v26 = *(_OWORD *)&a3->var0;
      id v14 = a3->var3;
      unint64_t v27 = a3->var2;
      id v6 = v14;
      id v28 = v6;
      BOOL v29 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 noSyncStorageAlmostFullForDescriptor:&v26];
      goto LABEL_22;
    case 8:
      long long v22 = *(_OWORD *)&a3->var0;
      id v15 = a3->var3;
      unint64_t v23 = a3->var2;
      id v6 = v15;
      id v24 = v6;
      BOOL v25 = a3->var4;
      if (!a1) {
        goto LABEL_23;
      }
      v7 = [a1 noSyncStorageFullForDescriptor:&v22];
      goto LABEL_22;
    case 9:
      long long v18 = *(_OWORD *)&a3->var0;
      id v16 = a3->var3;
      unint64_t v19 = a3->var2;
      id v6 = v16;
      id v20 = v6;
      BOOL v21 = a3->var4;
      if (a1)
      {
        v7 = [a1 noSyncStorageOverFullForDescriptor:&v18];
LABEL_22:
        a1 = v7;
      }
      else
      {
LABEL_23:

        a1 = 0;
      }
LABEL_24:

      return a1;
    default:
      goto LABEL_24;
  }
}

+ (id)idleStateForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:1];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:0];
  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:1];
  if (a3->var4)
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"SYNC_PAUSED" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
    [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];
  }
  else
  {
    v7 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:1];
    [(CKiCloudSyncStateModel *)v5 setSyncStatus:v7];
  }

  return v5;
}

+ (id)syncUploadingForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  if (a3->var2)
  {
    v5 = objc_msgSend(a1, "_syncingMessagesStringWithLongCount:");
  }
  else
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v6 localizedStringForKey:@"SYNCING_WITH_ICLOUD" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  }
  v7 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  id v8 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v8 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v8 setSyncStatusMacButtonType:1];
  id v9 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v8 setMessagesInCloudCount:v9];

  [(CKiCloudSyncStateModel *)v8 setSyncStatus:v5];
  [(CKiCloudSyncStateModel *)v8 setSyncStatusFooterText:v7];
  [(CKiCloudSyncStateModel *)v8 setLastSyncedDateString:v7];
  [(CKiCloudSyncStateModel *)v8 setSyncAvailable:1];

  return v8;
}

+ (id)syncDownloadingForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  id v6 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v6 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v6 setSyncStatusMacButtonType:1];
  v7 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v6 setMessagesInCloudCount:v7];

  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"SYNCING_WITH_ICLOUD" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v6 setSyncStatus:v9];

  [(CKiCloudSyncStateModel *)v6 setSyncStatusFooterText:v5];
  [(CKiCloudSyncStateModel *)v6 setLastSyncedDateString:v5];
  [(CKiCloudSyncStateModel *)v6 setSyncAvailable:1];

  return v6;
}

+ (id)syncCompleteForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:1];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SYNC_COMPLETE_JUST_NOW" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:0];
  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:1];

  return v5;
}

+ (id)syncPausedNoInternetConnectionForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:3];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SYNC_PAUSED" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SYNC_ERROR_NO_INTERNET" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"SETTINGS_CTA" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v13 = NSString;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"SYNC_ERROR_NO_INTERNET_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  long long v18 = +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:v16 dateString:v17];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v18];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v12];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v10];
  [(CKiCloudSyncStateModel *)v5 setLastSyncedDateString:v17];

  return v5;
}

+ (id)syncPausedAirplaneModeForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:0];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SYNC_PAUSED" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SYNC_ERROR_AIRPLANE_MODE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"SETTINGS_CTA" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v13 = NSString;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"SYNC_ERROR_AIRPLANE_MODE_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  long long v18 = +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:v16 dateString:v17];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v18];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v12];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v10];
  [(CKiCloudSyncStateModel *)v5 setLastSyncedDateString:v17];

  return v5;
}

+ (id)syncPausedCellularDataDisabledForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:0];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SYNC_PAUSED" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SYNC_ERROR_NO_CELLULAR_DATA" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"SETTINGS_CTA" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v13 = NSString;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"SYNC_ERROR_NO_CELLULAR_DATA_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  long long v18 = +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:v16 dateString:v17];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v18];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v12];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v10];
  [(CKiCloudSyncStateModel *)v5 setLastSyncedDateString:v17];

  return v5;
}

+ (id)accountMismatchStateForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:3];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SYNC_FAILED" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"ICLOUD_ACCOUNT_MISMATCH" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"SETTINGS_CTA" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v13 = NSString;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"ICLOUD_ACCOUNT_MISMATCH_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  long long v18 = +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:v16 dateString:v17];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v18];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v12];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v10];
  [(CKiCloudSyncStateModel *)v5 setLastSyncedDateString:v17];

  return v5;
}

+ (id)noSyncStorageAlmostFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:1];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v7];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:1];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"YOUR_ICLOUD_STORAGE_IS_ALMOST_FULL" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"GET_MORE_STORAGE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v12 = NSString;
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"YOUR_ICLOUD_STORAGE_IS_ALMOST_FULL_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v15];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v11];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v9];

  return v5;
}

+ (id)noSyncStorageFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:2];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"NOT_SYNCING" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"YOUR_ICLOUD_STORAGE_IS_FULL" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"GET_MORE_STORAGE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v13 = NSString;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"YOUR_ICLOUD_STORAGE_IS_FULL_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  long long v18 = +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:v16 dateString:v17];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v18];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v12];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v10];
  [(CKiCloudSyncStateModel *)v5 setLastSyncedDateString:v17];

  return v5;
}

+ (id)noSyncStorageOverFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  [(CKiCloudSyncStateModel *)v5 setSyncState:a3->var0];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacButtonType:2];
  id v6 = [a1 _messagesInCloudCountStringWithLongCount:a3->var1];
  [(CKiCloudSyncStateModel *)v5 setMessagesInCloudCount:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"NOT_SYNCING" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  [(CKiCloudSyncStateModel *)v5 setSyncStatus:v8];

  [(CKiCloudSyncStateModel *)v5 setSyncAvailable:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"YOUR_ICLOUD_STORAGE_IS_OVER_FULL" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"GET_MORE_STORAGE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  id v13 = NSString;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"YOUR_ICLOUD_STORAGE_IS_OVER_FULL_%@" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = +[CKiCloudSettingsUtils lastSyncedDateStringForDate:a3->var3 inContext:0];
  long long v18 = +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:v16 dateString:v17];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterText:v18];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusFooterSubstringForHyperlink:v12];
  [(CKiCloudSyncStateModel *)v5 setSyncStatusMacToolTipText:v10];
  [(CKiCloudSyncStateModel *)v5 setLastSyncedDateString:v17];

  return v5;
}

+ (id)_messagesInCloudCountStringWithLongCount:(unint64_t)a3
{
  v4 = +[CKiCloudSettingsUtils sharedNumberFormatter];
  v5 = [NSNumber numberWithUnsignedLong:a3];
  id v6 = [v4 stringFromNumber:v5];

  if (v6)
  {
    v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"N_MESSAGE(S)" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
    objc_msgSend(v7, "stringWithFormat:", v9, a3, v6);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = @"Unknown";
  }

  return v10;
}

+ (id)_syncingMessagesStringWithLongCount:(unint64_t)a3
{
  v4 = +[CKiCloudSettingsUtils sharedNumberFormatter];
  v5 = [NSNumber numberWithUnsignedLong:a3];
  id v6 = [v4 stringFromNumber:v5];

  if (v6)
  {
    v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"SYNCING_N_MESSAGE(S)" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
    objc_msgSend(v7, "stringWithFormat:", v9, a3, v6);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = @"Unknown";
  }

  return v10;
}

+ (id)_syncFooterTextWithStatusError:(id)a3 dateString:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [NSString stringWithFormat:@"%@\n\n%@", v5, a4];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

@end