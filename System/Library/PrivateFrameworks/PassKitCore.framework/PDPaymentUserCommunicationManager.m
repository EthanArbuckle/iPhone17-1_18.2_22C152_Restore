@interface PDPaymentUserCommunicationManager
- (BOOL)_safariCredentialImportNotifiedForCredential:(id)a3;
- (PDPaymentUserCommunicationManager)init;
- (PDPaymentUserCommunicationManager)initWithNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 applicationMessageManager:(id)a5;
- (id)_applicationMessageContentForSafariImportCardWithSink:(id)a3 registration:(id)a4;
- (id)_applicationMessageContentForSafariImportConsentWithSink:(id)a3 registration:(id)a4;
- (id)_fpanSuffixFromSafariImportCardApplicationMessageIdentifier:(id)a3;
- (id)_keychainItemWithIdentifier:(id)a3;
- (id)_networkNameFromSafariImportCardApplicationMessageIdentifier:(id)a3;
- (id)_notifiedIdentifierForCredential:(id)a3;
- (id)_notifiedIdentifiersForKeychainItemIdentifier:(id)a3;
- (id)_safariIconImage;
- (id)_safariImportCardApplicationMessageIdentifierForCredential:(id)a3;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)_addNotifiedIdentifier:(id)a3 forKeychainItemIdentifier:(id)a4;
- (void)_addSafariCredentialImportNotifiedForCredential:(id)a3;
- (void)_handlePossibleVPANIssued:(id)a3 fromPreviousApplications:(id)a4;
- (void)_notificationsSupportedForType:(int64_t)a3 completion:(id)a4;
- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4;
- (void)clearSafariCredentialImportMessages;
- (void)clearSafariCredentialImportNotifiedIdentifiers;
- (void)connectApplicationMessageSink:(id)a3;
- (void)handlePaymentPassDidUpdatePaymentApplications:(id)a3 fromPaymentApplications:(id)a4 withCompletion:(id)a5;
- (void)sendSafariCredentialImportConsentNotificationWithCompletion:(id)a3;
- (void)sendSafariCredentialImportNotificationForCredentials:(id)a3 withCompletion:(id)a4;
- (void)sendVirtualCardNumberIssuedDueToTransactionNotificationForPaymentPass:(id)a3 withCompletion:(id)a4;
@end

@implementation PDPaymentUserCommunicationManager

- (PDPaymentUserCommunicationManager)init
{
  return 0;
}

- (PDPaymentUserCommunicationManager)initWithNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 applicationMessageManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PDPaymentUserCommunicationManager;
  v12 = [(PDPaymentUserCommunicationManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationManager, a3);
    objc_storeStrong((id *)&v13->_applicationMessageManager, a5);
    objc_storeStrong((id *)&v13->_paymentWebServiceCoordinator, a4);
    sub_1003A0878((uint64_t)v13->_applicationMessageManager, 3, v13);
  }

  return v13;
}

- (void)sendSafariCredentialImportConsentNotificationWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047EB20;
  v4[3] = &unk_100731C90;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PDPaymentUserCommunicationManager *)v5 _notificationsSupportedForType:0 completion:v4];
}

- (void)sendSafariCredentialImportNotificationForCredentials:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10047ED50;
  v9[3] = &unk_1007332B8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(PDPaymentUserCommunicationManager *)self _notificationsSupportedForType:1 completion:v9];
}

- (void)sendVirtualCardNumberIssuedDueToTransactionNotificationForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10047F5C4;
  v9[3] = &unk_1007332B8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(PDPaymentUserCommunicationManager *)self _notificationsSupportedForType:2 completion:v9];
}

- (void)handlePaymentPassDidUpdatePaymentApplications:(id)a3 fromPaymentApplications:(id)a4 withCompletion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10047F7D8;
  v10[3] = &unk_100753660;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(PDPaymentUserCommunicationManager *)v11 _notificationsSupportedForType:2 completion:v10];
}

- (void)clearSafariCredentialImportMessages
{
  [(PDUserNotificationManager *)self->_notificationManager removeUserNotificationsOfType:58];
  [(PDUserNotificationManager *)self->_notificationManager removeUserNotificationsOfType:59];
  applicationMessageSink = self->_applicationMessageSink;
  if (applicationMessageSink)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(PKApplicationMessageSink *)applicationMessageSink registrations];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) key];
          id v10 = [(id)v9 identifier];

          LOBYTE(v9) = [v10 isEqualToString:@"SafariImportConsentAMID"];
          unsigned int v11 = [v10 hasPrefix:@"SafariImportCard"];
          if ((v9 & 1) != 0 || v11) {
            [(PKApplicationMessageSink *)self->_applicationMessageSink unregisterMessageForIdentifier:v10];
          }

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)clearSafariCredentialImportNotifiedIdentifiers
{
  id v2 = [(PDPaymentUserCommunicationManager *)self _keychainItemWithIdentifier:@"PDSafariCredentialImportNotified"];
  [v2 resetKeychainItem];
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 key];
  uint64_t v9 = [v8 identifier];

  LODWORD(v8) = [v9 isEqualToString:@"SafariImportConsentAMID"];
  unsigned int v10 = [v9 hasPrefix:@"SafariImportCard"];
  if (v8)
  {
    uint64_t v11 = [(PDPaymentUserCommunicationManager *)self _applicationMessageContentForSafariImportConsentWithSink:v6 registration:v7];
  }
  else
  {
    if (!v10)
    {
      long long v12 = 0;
      goto LABEL_7;
    }
    uint64_t v11 = [(PDPaymentUserCommunicationManager *)self _applicationMessageContentForSafariImportCardWithSink:v6 registration:v7];
  }
  long long v12 = (void *)v11;
LABEL_7:

  return v12;
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "key", a3);
  id v7 = [(id)v5 identifier];

  LOBYTE(v5) = [v7 isEqualToString:@"SafariImportConsentAMID"];
  unsigned int v6 = [v7 hasPrefix:@"SafariImportCard"];
  if ((v5 & 1) != 0 || v6) {
    [(PDPaymentUserCommunicationManager *)self clearSafariCredentialImportMessages];
  }
}

- (void)connectApplicationMessageSink:(id)a3
{
}

- (void)_notificationsSupportedForType:(int64_t)a3 completion:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if (PKPassbookIsCurrentlyDeletedByUser())
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDPaymentUserCommunicationManager: Notifications not supported as Wallet has been deleted", buf, 2u);
      }

      v6[2](v6, 0);
      goto LABEL_18;
    }
    if ((unint64_t)a3 >= 2)
    {
      if (a3 != 2)
      {
        uint64_t v10 = 1;
LABEL_17:
        v6[2](v6, v10);
        goto LABEL_18;
      }
      if (PKNativeVPANAutofillSupported())
      {
        paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10047FD1C;
        v11[3] = &unk_100753C78;
        v11[4] = self;
        long long v12 = v6;
        [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v11];

        goto LABEL_18;
      }
    }
    else if (PKSafariCredentialProvisioningEnabled())
    {
      v6[2](v6, 1);
      goto LABEL_18;
    }
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPaymentUserCommunicationManager: No completion block provided to eligibility check.", buf, 2u);
  }

LABEL_18:
}

- (void)_handlePossibleVPANIssued:(id)a3 fromPreviousApplications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 paymentApplications];
  uint64_t v9 = [v7 valueForKey:@"applicationIdentifier"];
  uint64_t v10 = +[NSPredicate predicateWithFormat:@"applicationIdentifier IN %@", v9];

  v31 = v8;
  uint64_t v11 = [v8 filteredSetUsingPredicate:v10];
  long long v12 = [v11 valueForKey:@"applicationIdentifier"];

  long long v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v40 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "VPAN Issuance: Checking for change in VPAN status across %ld applications", buf, 0xCu);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v12;
  id v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v14) {
    goto LABEL_31;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v35;
  v28 = v10;
  id v29 = v6;
  v27 = self;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10048020C;
      v33[3] = &unk_10073A4E8;
      v33[4] = v18;
      v19 = objc_msgSend(v31, "pk_anyObjectPassingTest:", v33);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100480298;
      v32[3] = &unk_10073A4E8;
      v32[4] = v18;
      v20 = objc_msgSend(v7, "pk_anyObjectPassingTest:", v32);
      v21 = v20;
      if (!v19 || !v20)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "VPAN Issuance: Missing an application for comparison, skipping";
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
        }
LABEL_23:

        id v6 = v29;
LABEL_30:
        uint64_t v10 = v28;

        goto LABEL_31;
      }
      v22 = [v20 virtualCardIdentifier];

      if (v22)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "VPAN Issuance: Previous application already had VPAN, won't notify for new issuance";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      v23 = [v19 virtualCardIdentifier];

      if (!v23)
      {
        id v6 = v29;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "VPAN Issuance: New application doesn't have a VPAN", buf, 2u);
        }

        goto LABEL_30;
      }
      unint64_t v24 = (unint64_t)[v19 virtualCardVPANOrigin];
      BOOL v25 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if ((v24 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        if (v25)
        {
          *(_DWORD *)buf = 134217984;
          id v40 = (id)v24;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "VPAN Issuance: Pass issued VPAN due to %ld, notifying user", buf, 0xCu);
        }

        id v6 = v29;
        [(PDPaymentUserCommunicationManager *)v27 sendVirtualCardNumberIssuedDueToTransactionNotificationForPaymentPass:v29 withCompletion:0];
        goto LABEL_30;
      }
      if (v25)
      {
        *(_DWORD *)buf = 134217984;
        id v40 = (id)v24;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "VPAN Issuance: Pass issued VPAN due to %ld, no need to notify user", buf, 0xCu);
      }
    }
    id v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    uint64_t v10 = v28;
    id v6 = v29;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_31:
}

- (id)_applicationMessageContentForSafariImportConsentWithSink:(id)a3 registration:(id)a4
{
  uint64_t v5 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_CONSENT_REQUIRED_APP_MESSAGE_TITLE");
  id v6 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_CONSENT_REQUIRED_APP_MESSAGE_BODY");
  id v7 = objc_alloc((Class)NSURL);
  id v8 = +[NSString stringWithFormat:@"wallet://%@", PKUserNotificationActionRouteImportSafariCardConsent];
  id v9 = [v7 initWithString:v8];

  uint64_t v10 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_APP_MESSAGE_GROUP_SUMMARY");
  id v11 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"SafariImportCardMessageGroup" withSingularSummary:v10 pluralSummary:v10];
  long long v12 = [(PDPaymentUserCommunicationManager *)self _safariIconImage];
  if (v12)
  {
    id v13 = +[PKImageDescriptorBitmap createForImage:v12 withTintColor:0];
    id v14 = +[PKApplicationMessageIcon createWithImage:v13 style:0];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = +[PKApplicationMessageActionURL createWithURL:v9];
  id v16 = +[PKApplicationMessageContentDefault createWithGroup:v11 action:v15 icon:v14 title:v5 body:v6];

  return v16;
}

- (id)_applicationMessageContentForSafariImportCardWithSink:(id)a3 registration:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "key", a3);
  id v6 = [v5 identifier];

  uint64_t v7 = [(PDPaymentUserCommunicationManager *)self _fpanSuffixFromSafariImportCardApplicationMessageIdentifier:v6];
  uint64_t v8 = [(PDPaymentUserCommunicationManager *)self _networkNameFromSafariImportCardApplicationMessageIdentifier:v6];
  id v9 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_APP_MESSAGE_TITLE");
  v22 = (void *)v8;
  v23 = (void *)v7;
  uint64_t v10 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_BODY", @"%1$@%2$@", v8, v7);
  id v11 = objc_alloc((Class)NSURL);
  long long v12 = +[NSString stringWithFormat:@"wallet://%@", PKUserNotificationActionRouteAddPaymentCard];
  id v13 = [v11 initWithString:v12];

  id v14 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_APP_MESSAGE_GROUP_SUMMARY");
  id v15 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"SafariImportCardMessageGroup" withSingularSummary:v14 pluralSummary:v14];
  id v16 = [(PDPaymentUserCommunicationManager *)self _safariIconImage];
  if (v16)
  {
    id v17 = +[PKImageDescriptorBitmap createForImage:v16 withTintColor:0];
    id v18 = +[PKApplicationMessageIcon createWithImage:v17 style:0];
  }
  else
  {
    id v18 = 0;
  }
  id v19 = +[PKApplicationMessageActionURL createWithURL:v13];
  id v20 = +[PKApplicationMessageContentDefault createWithGroup:v15 action:v19 icon:v18 title:v9 body:v10];

  return v20;
}

- (id)_safariImportCardApplicationMessageIdentifierForCredential:(id)a3
{
  id v3 = a3;
  v4 = [v3 cardNumber];
  uint64_t v5 = PKFPANSuffixFromFPAN();

  id v6 = [v3 credentialType];
  uint64_t v7 = +[NSString stringWithFormat:@"%@_%ld_%@", @"SafariImportCard", v6, v5];

  return v7;
}

- (id)_fpanSuffixFromSafariImportCardApplicationMessageIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"_"];
  if ([v3 count] == (id)3)
  {
    v4 = [v3 objectAtIndexedSubscript:2];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_networkNameFromSafariImportCardApplicationMessageIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"_"];
  if ([v3 count] == (id)3)
  {
    v4 = [v3 objectAtIndexedSubscript:1];
    [v4 integerValue];

    uint64_t v5 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_safariIconImage
{
  id v2 = objc_alloc((Class)LSApplicationRecord);
  id v3 = [v2 initWithBundleIdentifier:PKSafariBundleIdentifier allowPlaceholder:0 error:0];
  v4 = [v3 URL];
  if (v4)
  {
    id v5 = [objc_alloc((Class)ISIcon) initWithURL:v4];
    PKScreenScale();
    double v7 = v6;
    uint64_t v8 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorTableUIName];
    [v8 setScale:v7];
    objc_msgSend(v8, "setSize:", 45.0, 45.0);
    [v8 setDrawBorder:1];
    id v9 = [v5 prepareImageForDescriptor:v8];
    CGImageRef v10 = CGImageRetain((CGImageRef)[v9 CGImage]);
    if (v10)
    {
      id v11 = v10;
      id v12 = [objc_alloc((Class)PKImage) initWithCGImage:v10 scale:0 orientation:v7];
      CGImageRelease(v11);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)_safariCredentialImportNotifiedForCredential:(id)a3
{
  id v4 = a3;
  id v5 = [(PDPaymentUserCommunicationManager *)self _notifiedIdentifiersForKeychainItemIdentifier:@"PDSafariCredentialImportNotified"];
  double v6 = [(PDPaymentUserCommunicationManager *)self _notifiedIdentifierForCredential:v4];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)_addSafariCredentialImportNotifiedForCredential:(id)a3
{
  id v4 = [(PDPaymentUserCommunicationManager *)self _notifiedIdentifierForCredential:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(PDPaymentUserCommunicationManager *)self _addNotifiedIdentifier:v4 forKeychainItemIdentifier:@"PDSafariCredentialImportNotified"];
    id v5 = v6;
  }
  _objc_release_x1(v4, v5);
}

- (id)_notifiedIdentifiersForKeychainItemIdentifier:(id)a3
{
  id v3 = [(PDPaymentUserCommunicationManager *)self _keychainItemWithIdentifier:a3];
  id v4 = [v3 objectForKey:kSecValueData];
  if (v4)
  {
    id v5 = objc_alloc((Class)NSSet);
    uint64_t v6 = objc_opt_class();
    id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    id v13 = 0;
    uint64_t v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v4 error:&v13];
    id v9 = v13;

    if (v9)
    {
      CGImageRef v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100517CE8((uint64_t)v9, v10);
      }

      id v11 = 0;
    }
    else
    {
      id v11 = v8;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_addNotifiedIdentifier:(id)a3 forKeychainItemIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(PDPaymentUserCommunicationManager *)self _notifiedIdentifiersForKeychainItemIdentifier:v6];
  if (([v7 containsObject:v11] & 1) == 0)
  {
    if (v7)
    {
      uint64_t v8 = [v7 setByAddingObject:v11];

      id v7 = (void *)v8;
    }
    else
    {
      id v7 = +[NSSet setWithObject:v11];
    }
    id v9 = [(PDPaymentUserCommunicationManager *)self _keychainItemWithIdentifier:v6];
    CGImageRef v10 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    [v9 setObject:v10 forKey:kSecValueData];
  }
}

- (id)_notifiedIdentifierForCredential:(id)a3
{
  id v3 = [a3 cardNumber];
  id v4 = [v3 dataUsingEncoding:4];

  if (v4)
  {
    id v5 = [v4 SHA256Hash];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_keychainItemWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)PKKeychainItemWrapper);
  id v5 = [v4 initWithIdentifier:v3 accessGroup:PKPassdBundleIdentifier serviceName:@"com.apple.passd.payment-user-communication" type:0 invisible:1 accessibility:1];

  [v5 setLabel:@"com.apple.passd.payment-user-communication"];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMessageManager, 0);
  objc_storeStrong((id *)&self->_applicationMessageSink, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

@end