@interface PDSharingUserCommunicationManager
- (PDSharingUserCommunicationManager)init;
- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 applicationMessageManager:(id)a4 delegate:(id)a5;
- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 delegate:(id)a4;
- (id)_calculateShareChangeFromOldShares:(id)a3 newShares:(id)a4;
- (id)_groupNotificationForChanges:(id)a3 pass:(id)a4;
- (id)_notificationForShareChange:(id)a3 pass:(id)a4;
- (id)_shareActivationRequiredBodyForPendingActivation:(id)a3;
- (id)_shareActivationRequiredTitleForPendingActivation:(id)a3;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)_sendActivationRequiredNotificationsForShareIdentifier:(id)a3;
- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4;
- (void)connectApplicationMessageSink:(id)a3;
- (void)sendEntitlementChangeNotificationsForPass:(id)a3 oldEntitlements:(id)a4 newEntitlements:(id)a5 hasExistingShares:(BOOL)a6;
- (void)sendShareChangeNotificationsForPass:(id)a3 oldShares:(id)a4 newShares:(id)a5;
- (void)updateApplicationMessages;
@end

@implementation PDSharingUserCommunicationManager

- (PDSharingUserCommunicationManager)init
{
  return 0;
}

- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 applicationMessageManager:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  v10 = [(PDSharingUserCommunicationManager *)self initWithNotificationManager:a3 delegate:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_applicationMessageManager, a4);
    sub_1003A0878((uint64_t)v11->_applicationMessageManager, 2, v11);
  }

  return v11;
}

- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDSharingUserCommunicationManager;
  id v9 = [(PDSharingUserCommunicationManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationManager, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingShareActivationShareIdentifiers = v10->_pendingShareActivationShareIdentifiers;
    v10->_pendingShareActivationShareIdentifiers = v11;
  }
  return v10;
}

- (void)connectApplicationMessageSink:(id)a3
{
  objc_storeStrong((id *)&self->_applicationMessageSink, a3);
  [(PDSharingUserCommunicationManager *)self updateApplicationMessages];
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  v5 = objc_msgSend(a4, "key", a3);
  v6 = [v5 identifier];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [WeakRetained pendingShareActivationForShareIdentifier:v6];

  if (v8)
  {
    id v9 = objc_alloc((Class)NSURL);
    v10 = +[NSString stringWithFormat:@"wallet://%@/%@/%@", PKURLActionShare, v6, PKURLActionShareActivateShare];
    id v11 = [v9 initWithString:v10];

    v12 = PKLocalizedShareableCredentialString(@"SHARE_ACTIVATION_APPLICATION_MESSAGE_GROUP_TITLE_SINGULAR");
    v13 = PKLocalizedShareableCredentialString(@"SHARE_ACTIVATION_APPLICATION_MESSAGE_GROUP_TITLE_PLURAL");
    id v14 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"pendingShares" withSingularSummary:v12 pluralSummary:v13];

    id v15 = +[PKImageDescriptorSymbol createForName:@"lock.shield" withTintColor:14];
    id v16 = +[PKApplicationMessageIcon createWithImage:v15 style:0];

    id v17 = 0;
    if ([v8 isWaitingOnUserAction]) {
      id v17 = +[PKApplicationMessageActionURL createWithURL:v11];
    }
    v18 = [(PDSharingUserCommunicationManager *)self _shareActivationRequiredTitleForPendingActivation:v8];
    v19 = [(PDSharingUserCommunicationManager *)self _shareActivationRequiredBodyForPendingActivation:v8];
    id v20 = +[PKApplicationMessageContentDefault createWithGroup:v14 action:v17 icon:v16 title:v18 body:v19];
  }
  else
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PDSharingUserCommunicationManager: returning no content for %@", buf, 0xCu);
    }

    id v20 = 0;
  }

  return v20;
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  v5 = objc_msgSend(a4, "key", a3);
  id v7 = [v5 identifier];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidDismissPendingShareActivationForShareIdentifier:v7];
}

- (void)updateApplicationMessages
{
  if (self->_applicationMessageSink)
  {
    v3 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100300144;
    block[3] = &unk_10072E1E8;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)sendShareChangeNotificationsForPass:(id)a3 oldShares:(id)a4 newShares:(id)a5
{
  id v8 = a3;
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    id v9 = [(PDSharingUserCommunicationManager *)self _calculateShareChangeFromOldShares:a4 newShares:a5];
    v10 = objc_msgSend(v9, "pk_groupDictionaryByApplyingBlock:", &stru_100748588);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100300744;
    v26[3] = &unk_100733420;
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v27 = v11;
    v28 = self;
    id v29 = v8;
    v12 = objc_retainBlock(v26);
    v13 = [v10 objectForKeyedSubscript:&off_10078B6B8];
    ((void (*)(void *, void *))v12[2])(v12, v13);

    id v14 = [v10 objectForKeyedSubscript:&off_10078B6D0];
    ((void (*)(void *, void *))v12[2])(v12, v14);

    id v15 = [v10 objectForKeyedSubscript:&off_10078B6E8];
    ((void (*)(void *, void *))v12[2])(v12, v15);

    id v16 = [v10 objectForKeyedSubscript:&off_10078B700];
    ((void (*)(void *, void *))v12[2])(v12, v16);

    if ([v11 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v17 = v11;
      id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          v21 = 0;
          do
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v17);
            }
            -[PDUserNotificationManager insertUserNotification:](self->_notificationManager, "insertUserNotification:", *(void *)(*((void *)&v22 + 1) + 8 * (void)v21), (void)v22);
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v19);
      }
    }
  }
}

- (void)sendEntitlementChangeNotificationsForPass:(id)a3 oldEntitlements:(id)a4 newEntitlements:(id)a5 hasExistingShares:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  uint64_t v12 = (uint64_t)a5;
  v13 = (void *)v12;
  if (v11 | v12)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    id v14 = sub_100300B2C(v12, (void *)v11);
    id v15 = sub_100300B2C((uint64_t)v14, v13);
    id v16 = [v14 count];
    if (v16 != [v15 count]) {
      goto LABEL_4;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100300C7C;
    v27[3] = &unk_1007485B0;
    v27[4] = v14;
    v27[5] = &v32;
    v27[6] = &v28;
    [v15 enumerateKeysAndObjectsUsingBlock:v27];
    if ([v14 count]) {
LABEL_4:
    }
      *((unsigned char *)v33 + 24) = 1;

    if (*((unsigned char *)v33 + 24))
    {
      id v17 = [v10 localizedDescription];
      id v18 = PKLocalizedShareableCredentialString(@"SHARE_NOTIFICATION_ENTITLEMENT_UPDATE_TITLE", @"%@", v17);

      id v19 = PKLocalizedShareableCredentialString(@"SHARE_NOTIFICATION_ENTITLEMENT_UPDATE_MESSAGE");
      uint64_t v20 = [PDEntitlementUpdateUserNotification alloc];
      v21 = [v10 uniqueID];
      long long v22 = [(PDEntitlementUpdateUserNotification *)v20 initWithTitle:v18 message:v19 forPassUniqueIdentifier:v21];

      [(PDUserNotificationManager *)self->_notificationManager insertUserNotification:v22];
      if (*((unsigned char *)v29 + 24) && v6 && [v10 isCarKeyPass])
      {
        id v23 = objc_alloc_init((Class)PKPaymentMessage);
        [v23 setIdentifier:@"PDSharingUserCommunicationManager.CapabilityChange"];
        [v23 setServiceIdentifier:@"PDSharingUserCommunicationManager"];
        [v23 setMessageType:0];
        long long v24 = +[NSDate now];
        [v23 setMessageDate:v24];

        long long v25 = PKLocalizedShareableCredentialString(@"SHARE_NOTIFICATION_ENTITLEMENT_CAPABILITY_UPDATE_MESSAGE");
        [v23 setContent:v25];

        [v23 setArchived:0];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained insertPassMessage:v23 pass:v10];
      }
    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
}

- (id)_notificationForShareChange:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 updatedShare];
  uint64_t v8 = [v5 oldShare];
  id v9 = (void *)v8;
  if (!(v7 | v8))
  {
    id v16 = 0;
    goto LABEL_38;
  }
  id v10 = [(id)v8 status];
  id v11 = [(id)v7 status];
  uint64_t v12 = [v5 sender];
  v13 = [(id)v7 recipientNickname];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [v9 recipientNickname];
  }
  id v17 = v15;

  if (!v9)
  {
    if ((unint64_t)v11 > 5) {
      goto LABEL_20;
    }
    v42 = v12;
    v43 = v17;
    BOOL v23 = v12 == 0;
    BOOL v22 = v12 != 0;
    if (v23) {
      id v19 = @"SHARE_NOTIFICATION_SHARE_ADDED_MESSAGE";
    }
    else {
      id v19 = @"SHARE_NOTIFICATION_SHARE_ADDED_MESSAGE_SENDER";
    }
LABEL_28:
    long long v25 = [(__CFString *)v19 stringByAppendingString:@"_TITLE"];
    PKLocalizationKeyForPassType();
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    v41 = PKLocalizedShareableCredentialString(v26);

    id v27 = [(__CFString *)v19 stringByAppendingString:@"_BODY"];
    PKLocalizationKeyForPassType();
    uint64_t v28 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v22) {
      PKLocalizedShareableCredentialString(v28, @"%@%@", v42, v43);
    }
    else {
    id v29 = PKLocalizedShareableCredentialString(v28, @"%@", v43);
    }
    uint64_t v30 = [(id)v7 identifier];
    char v31 = v30;
    v40 = v28;
    if (v30)
    {
      uint64_t v32 = v30;
    }
    else
    {
      uint64_t v33 = [v9 identifier];
      uint64_t v34 = (void *)v33;
      char v35 = &stru_10075AAD8;
      if (v33) {
        char v35 = (__CFString *)v33;
      }
      uint64_t v32 = v35;
    }
    v36 = [PDShareUpdateUserNotification alloc];
    v37 = [v6 uniqueID];
    v44 = v32;
    v38 = +[NSArray arrayWithObjects:&v44 count:1];
    id v16 = [(PDShareUpdateUserNotification *)v36 initWithTitle:v41 message:v29 forPassUniqueIdentifier:v37 shareIdentifiers:v38];

    uint64_t v12 = v42;
    id v17 = v43;
    goto LABEL_37;
  }
  if (!v7)
  {
    if (v10 == (id)6) {
      goto LABEL_20;
    }
LABEL_23:
    v42 = v12;
    v43 = v17;
    BOOL v22 = 0;
    id v19 = @"SHARE_NOTIFICATION_SHARE_REMOVED_MESSAGE";
    goto LABEL_28;
  }
  if (v10 != v11)
  {
    if (v11 == (id)1)
    {
      v42 = v12;
      v43 = v17;
      BOOL v22 = 0;
      id v19 = @"SHARE_NOTIFICATION_ACTIVE_MESSAGE";
      goto LABEL_28;
    }
    if (v11 != (id)6) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if (v10 != (id)1) {
    goto LABEL_20;
  }
  id v18 = [v5 type];
  id v19 = @"SHARE_NOTIFICATION_SHARE_ENTITLEMENT_UPDATE_MESSAGE";
  if (v18 == (id)1)
  {
    v42 = v12;
    v43 = v17;
    BOOL v22 = 0;
    goto LABEL_28;
  }
  if (v18 == (id)2)
  {
    v42 = v12;
    v43 = v17;
    [v9 mostRestrictiveShareability];
    char CanAllowResharing = PKSharingCapabilityShareabilityCanAllowResharing();
    [(id)v7 mostRestrictiveShareability];
    int v21 = PKSharingCapabilityShareabilityCanAllowResharing();
    if ((CanAllowResharing & 1) != 0 || !v21)
    {
      unsigned int v24 = [v9 mostRestrictiveIntraAccountSharingEnabled];
      BOOL v22 = 0;
      if (!(v24 | [(id)v7 mostRestrictiveIntraAccountSharingEnabled] ^ 1)) {
        id v19 = @"SHARE_NOTIFICATION_SHARE_ENTITLEMENT_UPDATE_CAN_SHARE_INTRA_ACCOUNT_MESSAGE";
      }
    }
    else
    {
      BOOL v22 = 0;
      id v19 = @"SHARE_NOTIFICATION_SHARE_ENTITLEMENT_UPDATE_CAN_SHARE_MESSAGE";
    }
    goto LABEL_28;
  }
LABEL_20:
  id v16 = 0;
LABEL_37:

LABEL_38:
  return v16;
}

- (id)_groupNotificationForChanges:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = [v13 updatedShare];
        id v15 = [v14 identifier];
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v18 = [v13 oldShare];
          id v17 = [v18 identifier];
        }
        [v7 safelyAddObject:v17];
      }
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  id v19 = [v8 firstObject];
  [v19 type];

  PKLocalizationKeyForPassType();
  uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizationKeyForPassType();
  int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL v22 = [PDShareUpdateUserNotification alloc];
  BOOL v23 = PKLocalizedShareableCredentialString(v20);
  unsigned int v24 = PKLocalizedShareableCredentialString(v21, @"%lu", [v8 count]);
  long long v25 = [v6 uniqueID];
  v26 = [(PDShareUpdateUserNotification *)v22 initWithTitle:v23 message:v24 forPassUniqueIdentifier:v25 shareIdentifiers:v7];

  return v26;
}

- (void)_sendActivationRequiredNotificationsForShareIdentifier:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained pendingShareActivationForShareIdentifier:v9];

  if (v5)
  {
    id v6 = [(PDSharingUserCommunicationManager *)self _shareActivationRequiredTitleForPendingActivation:v5];
    id v7 = [(PDSharingUserCommunicationManager *)self _shareActivationRequiredBodyForPendingActivation:v5];
    id v8 = [[PDShareActivationRequiredUserNotification alloc] initWithTitle:v6 message:v7 shareIdentifier:v9];
    [(PDUserNotification *)v8 setSuppressionBehavior:1];
    [(PDUserNotificationManager *)self->_notificationManager insertUserNotification:v8];
  }
}

- (id)_shareActivationRequiredTitleForPendingActivation:(id)a3
{
  v3 = [a3 originalInvitation];
  v4 = [v3 displayInformation];
  id v5 = [v4 title];

  id v6 = PKLocalizedShareableCredentialString(@"SHARE_ACTIVATION_APPLICATION_MESSAGE_TITLE", @"%@", v5);

  return v6;
}

- (id)_shareActivationRequiredBodyForPendingActivation:(id)a3
{
  if ([a3 isWaitingOnUserAction]) {
    v3 = @"SHARE_ACTIVATION_APPLICATION_MESSAGE_DESCRIPTION";
  }
  else {
    v3 = @"SHARE_ACTIVATION_APPLICATION_MESSAGE_DESCRIPTION_PENDING_KEY";
  }
  v4 = PKLocalizedShareableCredentialString(&v3->isa);
  return v4;
}

- (id)_calculateShareChangeFromOldShares:(id)a3 newShares:(id)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(a4, "pk_indexDictionaryByApplyingBlock:", &stru_1007485D0);
  id v7 = objc_msgSend(v5, "pk_indexDictionaryByApplyingBlock:", &stru_1007485F0);

  id v8 = [v7 mutableCopy];
  id v9 = [v6 mutableCopy];
  [v9 addEntriesFromDictionary:v8];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100301858;
  v31[3] = &unk_100748618;
  id v32 = v8;
  id v10 = v8;
  uint64_t v11 = objc_retainBlock(v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1003019B4;
  v29[3] = &unk_100748640;
  id v30 = v9;
  id v12 = v9;
  v13 = objc_retainBlock(v29);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100301A98;
  v25[3] = &unk_100748668;
  id v27 = v11;
  id v15 = v13;
  id v28 = v15;
  id v16 = v14;
  id v26 = v16;
  id v17 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100301BC0;
  v22[3] = &unk_100748690;
  id v23 = v16;
  id v24 = v15;
  id v18 = v16;
  id v19 = v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v22];
  id v20 = [v18 copy];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingShareActivationShareIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationMessageManager, 0);
  objc_storeStrong((id *)&self->_applicationMessageSink, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

@end