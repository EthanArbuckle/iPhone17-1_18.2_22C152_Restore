@interface UMMobileKeyBag
+ (BOOL)clearSyncBubblesWithOutError:(id *)a3;
+ (BOOL)startSyncBubbleForUser:(id)a3 outError:(id *)a4;
+ (BOOL)stopSyncBubbleForUser:(id)a3 outError:(id *)a4;
+ (UMUser)lastLoggedInUser;
+ (id)allSyncBubbleUsers;
+ (id)currentSyncBubbleUser;
+ (id)queuedSyncBubbleUsers;
+ (id)syncBubbleMachServiceNamesForUser:(id)a3;
+ (void)initialize;
@end

@implementation UMMobileKeyBag

+ (void)initialize
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_190C3EA8C, @"com.apple.mobile.keybagd.user_changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v10 = UMUserTypeDeviceMode(0, 0);
  v4 = objc_msgSend_objectForKeyedSubscript_(v10, v3, kUMDeviceModeKey);
  int isEqualToString = objc_msgSend_isEqualToString_(v4, v5, kUMDeviceModeSharedIPad);
  byte_1EB2197E8 = isEqualToString;
  if (isEqualToString)
  {
    v8 = objc_msgSend_objectForKeyedSubscript_(v10, v7, kUMUserTypeKey);
    if (objc_msgSend_isEqualToString_(v8, v9, kUMUserTypeEphemeral)) {
      byte_1E92A98E8 = 1;
    }
  }
}

+ (UMUser)lastLoggedInUser
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_190C39F5C;
  v36 = sub_190C39F34;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_190C39F5C;
  v30 = sub_190C39F34;
  id v31 = 0;
  v2 = sub_190C4D8F4();
  v3 = sub_190C54624(v2);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_190C3FC5C;
  v25[3] = &unk_1E56C6100;
  v25[4] = &v32;
  v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v25);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_190C3FCFC;
  v24[3] = &unk_1E56C6150;
  v24[4] = &v26;
  v24[5] = &v32;
  objc_msgSend_userSessionLRUInfoWithReply_(v5, v6, (uint64_t)v24);

  v7 = (void *)v27[5];
  if (v7)
  {
    id v8 = v7;
    v11 = objc_msgSend_lastObject(v8, v9, v10);
    v14 = v11;
    if (v11)
    {
      uint64_t v15 = objc_msgSend_unsignedIntValue(v11, v12, v13);
      v16 = sub_190C5C790((uint64_t)UMUser, v15);
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_8;
  }
  if (v33[5])
  {
    sub_190C3C3A4();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C4A024((uint64_t)v8, @"Could not get LRU UIDs, error: %@", v17, v18, v19, v20, v21, v22, v33[5]);
    v16 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v16 = 0;
LABEL_9:

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return (UMUser *)v16;
}

+ (id)currentSyncBubbleUser
{
  uint64_t v13 = 0;
  uint64_t v2 = UMCurrentSyncBubbleSessionID(&v13);
  if (v2 == -1)
  {
    if (v13)
    {
      v4 = sub_190C3C3A4();
      v5 = v13;
      sub_190C4A024((uint64_t)v4, @"Could not get current sync bubble uid, error: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v13);
    }
    v3 = 0;
  }
  else
  {
    v3 = sub_190C5C790((uint64_t)UMUser, v2);
  }
  return v3;
}

+ (id)queuedSyncBubbleUsers
{
  v4 = objc_msgSend_currentSyncBubbleUser(a1, a2, v2);
  v5 = (void *)MEMORY[0x1E4F28F60];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_190C44A48;
  v15[3] = &unk_1E56C6258;
  id v16 = v4;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_predicateWithBlock_(v5, v7, (uint64_t)v15);
  uint64_t v11 = objc_msgSend_allSyncBubbleUsers(a1, v9, v10);
  uint64_t v13 = objc_msgSend_filteredArrayUsingPredicate_(v11, v12, (uint64_t)v8);

  return v13;
}

+ (id)allSyncBubbleUsers
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_190C39F5C;
  v50 = sub_190C39F34;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_190C39F5C;
  v44 = sub_190C39F34;
  id v45 = 0;
  uint64_t v2 = sub_190C4D8F4();
  v3 = sub_190C54624(v2);

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_190C44DF8;
  v39[3] = &unk_1E56C6100;
  v39[4] = &v46;
  v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v39);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_190C44E98;
  v38[3] = &unk_1E56C6150;
  v38[4] = &v40;
  v38[5] = &v46;
  objc_msgSend_listSyncBubbleUserswithReply_(v5, v6, (uint64_t)v38);

  uint64_t v7 = (void *)v41[5];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v12 = objc_msgSend_count(v8, v10, v11);
    v14 = objc_msgSend_arrayWithCapacity_(v9, v13, v12);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v8;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v34, v52, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v15);
          }
          uint64_t v17 = (const char *)objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v34 + 1) + 8 * i), v17, v18);
          if (v17 != 502)
          {
            v23 = sub_190C5C790((uint64_t)UMUser, (uint64_t)v17);
            if (v23) {
              objc_msgSend_addObject_(v14, v22, (uint64_t)v23);
            }
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v34, v52, 16);
      }
      while (v19);
    }

    uint64_t v26 = objc_msgSend_copy(v14, v24, v25);
    goto LABEL_16;
  }
  if (v47[5])
  {
    sub_190C3C3A4();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C4A024((uint64_t)v15, @"Could not get sync bubble uids, error: %@", v27, v28, v29, v30, v31, v32, v47[5]);
    uint64_t v26 = 0;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v26 = 0;
LABEL_17:

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v26;
}

+ (id)syncBubbleMachServiceNamesForUser:(id)a3
{
  id v4 = a3;
  v5 = sub_190C4390C((uint64_t)a1, v4);
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_190C39F5C;
  long long v34 = sub_190C39F34;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_190C39F5C;
  uint64_t v28 = sub_190C39F34;
  id v29 = 0;
  id v6 = sub_190C4D8F4();
  uint64_t v7 = sub_190C54624(v6);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_190C451E0;
  v23[3] = &unk_1E56C6100;
  v23[4] = &v30;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v23);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_190C45280;
  v22[3] = &unk_1E56C6150;
  v22[4] = &v24;
  v22[5] = &v30;
  objc_msgSend_listSyncServiceSourcesForUserSession_withReply_(v9, v10, (uint64_t)v5, v22);

  uint64_t v11 = (void *)v25[5];
  if (v11)
  {
    id v12 = v11;
  }
  else if (v31[5])
  {
    uint64_t v13 = sub_190C3C3A4();
    sub_190C4A024((uint64_t)v13, @"Could not get mach service names, error: %@", v14, v15, v16, v17, v18, v19, v31[5]);
  }
  id v20 = v11;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v20;
}

+ (BOOL)startSyncBubbleForUser:(id)a3 outError:(id *)a4
{
  return sub_190C45364((uint64_t)a1, 1, a3, a4);
}

+ (BOOL)stopSyncBubbleForUser:(id)a3 outError:(id *)a4
{
  return sub_190C45364((uint64_t)a1, 0, a3, a4);
}

+ (BOOL)clearSyncBubblesWithOutError:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_190C39F5C;
  v23 = sub_190C39F34;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v4 = sub_190C4D8F4();
  v5 = sub_190C54624(v4);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_190C4583C;
  v14[3] = &unk_1E56C6100;
  v14[4] = &v19;
  uint64_t v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_190C458DC;
  v13[3] = &unk_1E56C61E0;
  v13[4] = &v19;
  v13[5] = &v15;
  objc_msgSend_clearSyncBubbleUserswithReply_(v7, v8, (uint64_t)v13);

  uint64_t v9 = (void *)v20[5];
  int v10 = *((unsigned __int8 *)v16 + 24);
  if (a3) {
    *a3 = v9;
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v10 != 0;
}

@end