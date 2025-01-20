@interface PDPassVerificationManager
- (PDPassVerificationManager)initWithDatabaseManager:(id)a3 userNotificationManager:(id)a4 webServiceCoordinator:(id)a5 secureElement:(id)a6;
- (unint64_t)_isVerificationRequiredForPass:(id)a3;
- (void)_checkVerificationStatusForUniqueID:(id)a3;
- (void)_scheduleVerificationCheckForPass:(id)a3 onDate:(id)a4;
- (void)_sendPrecursorActionReminderNotificationForPass:(id)a3 precursorController:(id)a4;
- (void)_sendVerificationReminderNotificationForPass:(id)a3;
- (void)connect;
- (void)passAddedOrUpdated:(id)a3;
- (void)passWillBeRemoved:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
@end

@implementation PDPassVerificationManager

- (PDPassVerificationManager)initWithDatabaseManager:(id)a3 userNotificationManager:(id)a4 webServiceCoordinator:(id)a5 secureElement:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PDPassVerificationManager;
  v15 = [(PDPassVerificationManager *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_databaseManager, a3);
    objc_storeStrong((id *)&v16->_userNotificationManager, a4);
    objc_storeStrong((id *)&v16->_webServiceCoordinator, a5);
    objc_storeStrong((id *)&v16->_secureElement, a6);
  }

  return v16;
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v11 = v4;
    if ((id)[(PDPassVerificationManager *)self _isVerificationRequiredForPass:v4] == (id)2)
    {
      userNotificationManager = self->_userNotificationManager;
      v7 = [v11 uniqueID];
      [(PDUserNotificationManager *)userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v7 ofType:81];
    }
    else
    {
      if (PKShortenRemindersEnabled())
      {
        v8 = +[NSDate dateWithTimeIntervalSinceNow:60.0];
        [(PDPassVerificationManager *)self _scheduleVerificationCheckForPass:v11 onDate:v8];

        double v9 = 300.0;
      }
      else
      {
        v10 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
        [(PDPassVerificationManager *)self _scheduleVerificationCheckForPass:v11 onDate:v10];

        double v9 = 86400.0;
      }
      v7 = +[NSDate dateWithTimeIntervalSinceNow:v9];
      [(PDPassVerificationManager *)self _scheduleVerificationCheckForPass:v11 onDate:v7];
    }

    id v5 = v11;
  }
  _objc_release_x1(v4, v5);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueID];
  v6 = sub_1001C48A8(v5);
  PDScheduledActivityRemove();

  if ([v4 isIdentityPass])
  {
    v7 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
    unsigned int v8 = [v4 isPrecursorPass:v7];

    if (v8)
    {
      id v9 = objc_alloc_init((Class)DIIdentityProofingSession);
      v10 = [v4 issuerAdministrativeAreaCode];
      id v11 = [v4 issuerCountryCode];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001C492C;
      v13[3] = &unk_10073CFE0;
      id v14 = v4;
      id v15 = v9;
      id v12 = v9;
      [v12 cancelProofingWithState:v10 country:v11 completion:v13];
    }
  }
}

- (void)connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4A94;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  if (qword_100808CF0 != -1) {
    dispatch_once(&qword_100808CF0, block);
  }
}

- (void)_scheduleVerificationCheckForPass:(id)a3 onDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v5 organizationName];
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scheduling verification check for %@ on %@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [v5 uniqueID];
  v10 = sub_1001C48A8(v9);

  id v11 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v6];
  PDScheduledActivityRegister();
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling Scheduled Activity: %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = v6;
  v10 = v9;
  if (![v9 containsString:@"VerificationCheck."]) {
    goto LABEL_6;
  }
  id v11 = (char *)[v9 rangeOfString:@"VerificationCheck."];
  v10 = [v9 substringFromIndex:&v11[v12]];

  if (v10)
  {
    [(PDPassVerificationManager *)self _checkVerificationStatusForUniqueID:v10];
LABEL_6:
  }
}

- (void)_checkVerificationStatusForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking verification status for %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v4];
  id v7 = [v6 secureElementPass];

  unsigned int v8 = [v7 devicePrimaryPaymentApplication];
  id v9 = v8;
  if (v8)
  {
    if ([v8 state] == (id)3 || objc_msgSend(v9, "state") == (id)4) {
      [(PDPassVerificationManager *)self _sendVerificationReminderNotificationForPass:v7];
    }
  }
  else
  {
    id v10 = objc_alloc((Class)PKPrecursorPassUpgradeController);
    id v11 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebService];
    id v12 = [v10 initWithPass:v7 webService:v11];

    int v13 = [v12 devicePrimaryPrecursorRequest];

    if (v13) {
      [(PDPassVerificationManager *)self _sendPrecursorActionReminderNotificationForPass:v7 precursorController:v12];
    }
  }
}

- (unint64_t)_isVerificationRequiredForPass:(id)a3
{
  id v4 = a3;
  id v5 = [v4 devicePrimaryPaymentApplication];
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = (unint64_t)[v5 state];
    if (v7 < 0x10 && ((0x87FFu >> v7) & 1) != 0)
    {
      unint64_t v8 = qword_1005B3698[v7];
      goto LABEL_10;
    }
    if ([v6 state] != (id)3 && objc_msgSend(v6, "state") != (id)4) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v8 = 1;
    goto LABEL_10;
  }
  id v9 = objc_alloc((Class)PKPrecursorPassUpgradeController);
  id v10 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebService];
  id v11 = [v9 initWithPass:v4 webService:v10];

  id v12 = [v11 devicePrimaryPrecursorRequest];

  if (v12) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v8 = 2;
LABEL_10:

  return v8;
}

- (void)_sendVerificationReminderNotificationForPass:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 organizationName];
    *(_DWORD *)buf = 138412290;
    int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posting verification reminder notification for %@", buf, 0xCu);
  }
  unint64_t v7 = [v4 localizedDescription];
  unint64_t v8 = PKLocalizedPaymentString(@"NEEDS_VERIFICATION_REMINDER_FORMAT", @"%@", v7);

  id v9 = [PDPassVerificationPromptNotification alloc];
  id v10 = [v4 uniqueID];
  id v11 = [(PDPassVerificationPromptNotification *)v9 initWithTitle:0 message:v8 forPassUniqueIdentifier:v10];

  [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v11];
}

- (void)_sendPrecursorActionReminderNotificationForPass:(id)a3 precursorController:(id)a4
{
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [v5 organizationName];
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting verification reminder notification for %@", buf, 0xCu);
  }
  unint64_t v8 = [v5 uniqueID];
  id v9 = PKLocalizedPaymentString(@"NEEDS_VERIFICATION_REQUIRED_APPLICATION_MESSAGE_SUMMARY");
  id v10 = [v5 localizedDescription];
  id v11 = PKLocalizedPaymentString(@"NEEDS_PRECURSOR_ACTION_REMINDER_FORMAT", @"%@", v10);

  id v12 = [[PDPassVerificationPromptNotification alloc] initWithTitle:v9 message:v11 forPassUniqueIdentifier:v8];
  id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@-PrecursorAction", v8];
  id v14 = +[PKApplicationMessageGroupDescriptor createForIdentifier:v13 withSingularSummary:v9 pluralSummary:v9];
  id v15 = [(PDUserNotification *)v12 actionURL];
  id v16 = +[PKApplicationMessageActionURL createWithURL:v15];

  id v17 = +[PKApplicationMessageContentDefault createWithGroup:v14 action:v16 icon:0 title:v9 body:v11];
  [(PDUserNotification *)v12 setApplicationMessageContent:v17];
  [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end