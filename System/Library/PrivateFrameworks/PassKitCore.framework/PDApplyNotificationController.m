@interface PDApplyNotificationController
+ (id)_acceptReminderNotificationDate;
+ (id)_expiryReminderNotificationDateFromExpiryDate:(id)a3;
- (PDApplyNotificationController)initWithApplyManager:(id)a3 databaseManager:(id)a4 familyMemberManager:(id)a5 userNotificationManager:(id)a6 paymentWebServiceCoordinator:(id)a7;
- (id)_acceptReminderIdentifierForApplicationIdentifier:(id)a3;
- (id)_approvedIdentifierForApplicationIdentifier:(id)a3;
- (id)_customRouteForInvitationWithIdentifier:(id)a3;
- (id)_customRouteForJointOfferWithAccountIdentifier:(id)a3 invitationIdentifier:(id)a4;
- (id)_customRouteForPassUniqueID:(id)a3;
- (id)_cutomRouteForApplicationIdentifier:(id)a3;
- (id)_cutomRouteForFeatureIdentifier:(unint64_t)a3;
- (id)_expiryReminderIdentifierForApplicationIdentifier:(id)a3;
- (void)_insertOrUpdateFeatureApplicationAcceptedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationApprovedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationBookedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationExpiredNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationNewNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationOpenNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationPendingNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationTerminatedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationWithdrawnNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateInvitationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationOfferReadyNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationReceivedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdatePathToOfferCompletedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3;
- (void)_queue_notificationForNewApplication:(id)a3 oldApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_queue_removeAllNotificationsForApplicationIdentifier:(id)a3;
- (void)_queue_removeNonTerminalNotificationsForApplicationIdentifier:(id)a3;
- (void)applyManager:(id)a3 didAddApplication:(id)a4;
- (void)applyManager:(id)a3 didRemoveApplication:(id)a4;
- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)notificationForNewApplication:(id)a3 oldApplication:(id)a4;
- (void)postApplyStateRequiresUserInteractionNotificationWithNewApplication:(id)a3 oldApplication:(id)a4;
@end

@implementation PDApplyNotificationController

- (PDApplyNotificationController)initWithApplyManager:(id)a3 databaseManager:(id)a4 familyMemberManager:(id)a5 userNotificationManager:(id)a6 paymentWebServiceCoordinator:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PDApplyNotificationController;
  v17 = [(PDApplyNotificationController *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userNotificationManager, a6);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.applynotificationcontroller", v19);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v18->_applyManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_familyMemberManager, a5);
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a7);
    [(PDApplyManager *)v18->_applyManager registerObserver:v18];
    [(PDFamilyCircleManager *)v18->_familyMemberManager addObserver:v18];
  }
  return v18;
}

- (void)postApplyStateRequiresUserInteractionNotificationWithNewApplication:(id)a3 oldApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PKWalletVisibility isWalletVisible])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10038FE68;
    v9[3] = &unk_10074D140;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v9];
  }
}

- (void)applyManager:(id)a3 didAddApplication:(id)a4
{
  [(PDApplyNotificationController *)self notificationForNewApplication:a4 oldApplication:0];
  userNotificationManager = self->_userNotificationManager;
  [(PDUserNotificationManager *)userNotificationManager updateWalletBadgeCount];
}

- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5
{
  [(PDApplyNotificationController *)self notificationForNewApplication:a4 oldApplication:a5];
  userNotificationManager = self->_userNotificationManager;
  [(PDUserNotificationManager *)userNotificationManager updateWalletBadgeCount];
}

- (void)applyManager:(id)a3 didRemoveApplication:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100390224;
  v8[3] = &unk_10072E198;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (id)_approvedIdentifierForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-approved", a3];
}

- (id)_acceptReminderIdentifierForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-acceptReminder", a3];
}

+ (id)_acceptReminderNotificationDate
{
  v2 = +[NSCalendar currentCalendar];
  v3 = +[NSDate date];
  v4 = [v2 dateByAddingUnit:16 value:1 toDate:v3 options:0];

  return v4;
}

- (id)_expiryReminderIdentifierForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-expiryReminder", a3];
}

+ (id)_expiryReminderNotificationDateFromExpiryDate:(id)a3
{
  id v3 = a3;
  v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 dateByAddingUnit:16 value:-5 toDate:v3 options:0];

  id v6 = [v4 components:28 fromDate:v5];
  [v6 setHour:arc4random_uniform(1u) + 18];
  [v6 setMinute:arc4random_uniform(0x3Bu)];
  [v6 setSecond:arc4random_uniform(0x3Bu)];
  id v7 = +[NSTimeZone localTimeZone];
  [v6 setTimeZone:v7];

  v8 = [v4 dateFromComponents:v6];

  return v8;
}

- (void)_queue_removeNonTerminalNotificationsForApplicationIdentifier:(id)a3
{
  userNotificationManager = self->_userNotificationManager;
  id v5 = a3;
  id v6 = [(PDApplyNotificationController *)self _approvedIdentifierForApplicationIdentifier:v5];
  [(PDUserNotificationManager *)userNotificationManager removeUserNotificationWithIdentifier:v6];

  id v7 = self->_userNotificationManager;
  v8 = [(PDApplyNotificationController *)self _expiryReminderIdentifierForApplicationIdentifier:v5];
  [(PDUserNotificationManager *)v7 removeUserNotificationWithIdentifier:v8];

  id v9 = self->_userNotificationManager;
  id v10 = [(PDApplyNotificationController *)self _acceptReminderIdentifierForApplicationIdentifier:v5];

  [(PDUserNotificationManager *)v9 removeUserNotificationWithIdentifier:v10];
}

- (void)_queue_removeAllNotificationsForApplicationIdentifier:(id)a3
{
  userNotificationManager = self->_userNotificationManager;
  id v5 = a3;
  [(PDUserNotificationManager *)userNotificationManager removeUserNotificationWithIdentifier:v5];
  [(PDApplyNotificationController *)self _queue_removeNonTerminalNotificationsForApplicationIdentifier:v5];
}

- (void)notificationForNewApplication:(id)a3 oldApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 feature];
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003906B0;
    v10[3] = &unk_10074D168;
    id v13 = v8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v10];
  }
}

- (void)_queue_notificationForNewApplication:(id)a3 oldApplication:(id)a4 preferredLanguage:(id)a5
{
  id v34 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v34 feature] == (id)3) {
    goto LABEL_33;
  }
  id v10 = [v34 applicationState];
  id v33 = [v8 applicationState];
  id v32 = [v34 applicationStateReason];
  id v31 = [v8 applicationStateReason];
  id v11 = [v34 applicationIdentifier];
  id v12 = [v34 invitationDetails];
  id v13 = [v12 accountUserAltDSID];

  id v14 = [v34 invitationDetails];
  id v15 = [v14 originatorAltDSID];

  uint64_t v16 = [v34 accountIdentifier];
  v17 = (void *)v16;
  if (v13 && v16)
  {
    v18 = PKCurrentUserAltDSID();
    id v19 = v15;
    id v20 = v18;
    v21 = v20;
    if (v19 == v20)
    {
      v29 = v15;
    }
    else
    {
      if (!v19 || !v20)
      {

LABEL_16:
        goto LABEL_17;
      }
      v29 = v15;
      unsigned int v22 = [v19 isEqualToString:v20];

      if (!v22)
      {
        id v15 = v29;
LABEL_17:

        goto LABEL_18;
      }
    }
    if ([v34 applicationType] == (id)2)
    {

      id v15 = v29;
    }
    else
    {
      id v23 = [v34 applicationType];

      BOOL v24 = v23 == (id)3;
      id v15 = v29;
      if (!v24) {
        goto LABEL_18;
      }
    }
    v21 = +[PDAccountPendingFamilyMemberReminderNotification notificationIdentifierForAltDSID:v13];
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v21];
    v30 = v17;
    v25 = v15;
    v26 = v11;
    databaseManager = self->_databaseManager;
    id v19 = +[NSSet setWithObject:v13];
    v28 = databaseManager;
    id v11 = v26;
    id v15 = v25;
    v17 = v30;
    [(PDDatabaseManager *)v28 deleteAccountPendingFamilyMembersWithAccountIdentifier:v30 altDSIDs:v19];
    goto LABEL_16;
  }
LABEL_18:
  switch((unint64_t)v10)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 0xFuLL:
    case 0x10uLL:
      if (v10 != v33 || v32 != v31) {
        [(PDApplyNotificationController *)self _queue_removeAllNotificationsForApplicationIdentifier:v11];
      }
      break;
    case 1uLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationNewNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 4uLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationOpenNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 5uLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationPendingNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 6uLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationApprovedNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 7uLL:
    case 8uLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationAcceptedNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 9uLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationBookedNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 0xAuLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationWithdrawnNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 0xBuLL:
    case 0xDuLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationTerminatedNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 0xCuLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationExpiredNotificationsForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    case 0xEuLL:
      [(PDApplyNotificationController *)self _insertOrUpdateFeatureApplicationClosedNotificationForOldApplication:v8 newApplication:v34 preferredLanguage:v9];
      break;
    default:
      break;
  }

LABEL_33:
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100390C0C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_cutomRouteForFeatureIdentifier:(unint64_t)a3
{
  uint64_t v3 = PKURLActionSetup;
  uint64_t v4 = PKURLActionFeature;
  id v5 = PKFeatureIdentifierToString();
  id v6 = +[NSString stringWithFormat:@"%@/%@/%@", v3, v4, v5];

  return v6;
}

- (id)_cutomRouteForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@/%@", PKURLActionApplication, a3];
}

- (void)_insertOrUpdateFeatureApplicationApprovedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v50 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 applicationType] != (id)1)
  {
    [(PDApplyNotificationController *)self _insertOrUpdateInvitationOfferReadyNotificationForOldApplication:v50 newApplication:v8];
    goto LABEL_24;
  }
  unint64_t v10 = (unint64_t)[v50 applicationState];
  id v11 = [v8 applicationIdentifier];
  id v12 = [v8 feature];
  id v13 = 0;
  if (v10 > 5)
  {
    id v14 = 0;
LABEL_12:
    id v45 = v12;
    v29 = [v8 applicationOfferDetails];
    v30 = [v29 expiryDate];

    id v31 = [v50 applicationOfferDetails];
    id v32 = [v31 expiryDate];

    if (v10 != 6 || v30 && ([v30 isEqualToDate:v32] & 1) == 0)
    {
      id v33 = [(id)objc_opt_class() _expiryReminderNotificationDateFromExpiryDate:v30];
      if (!v13)
      {
        id v13 = [(id)objc_opt_class() _acceptReminderNotificationDate];
      }
      id v34 = PKLaterDate();

      if (v34 == v33)
      {
        v49 = v11;
        if (!v14)
        {
          id v14 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v45];
        }
        v47 = v14;
        v35 = [PDWalletUserNotification alloc];
        v36 = PKLocalizedApplyFeatureString();
        v37 = PKLocalizedApplyFeatureString();
        v38 = [(PDGenericUserNotification *)v35 initWithTitle:v36 message:v37];

        [(PDUserNotification *)v38 setSuppressionBehavior:1];
        [(PDUserNotification *)v38 setCustomActionRoute:v47];
        id v11 = v49;
        v39 = [(PDApplyNotificationController *)self _expiryReminderIdentifierForApplicationIdentifier:v49];
        [(PDUserNotification *)v38 setNotificationIdentifier:v39];

        id v14 = v47;
        [(PDUserNotification *)v38 setDate:v33];
        [(PDUserNotification *)v38 setReissueBannerOnUpdate:1];
        [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v38];
      }
    }

    goto LABEL_23;
  }
  id v14 = 0;
  if (((1 << v10) & 0x31) == 0) {
    goto LABEL_12;
  }
  if ([v8 feature] != (id)3 && objc_msgSend(v8, "applicationType") != (id)5)
  {
    uint64_t v15 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v12];
    v46 = (void *)v15;
    v44 = PKLocalizedApplyFeatureString();
    v41 = PKLocalizedApplyFeatureString();
    uint64_t v16 = [(PDGenericUserNotification *)[PDWalletUserNotification alloc] initWithTitle:v44 message:v41];
    v48 = self;
    v17 = v16;
    if (v10 == 4) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    [(PDUserNotification *)v16 setSuppressionBehavior:v18];
    [(PDUserNotification *)v17 setCustomActionRoute:v15];
    id v19 = [(PDApplyNotificationController *)v48 _approvedIdentifierForApplicationIdentifier:v11];
    [(PDUserNotification *)v17 setNotificationIdentifier:v19];

    [(PDUserNotification *)v17 setReissueBannerOnUpdate:1];
    uint64_t v20 = PKLocalizedApplyFeatureString();
    v21 = PKFeatureIdentifierToString();
    v43 = (void *)v20;
    id v42 = +[PKApplicationMessageGroupDescriptor createForIdentifier:v21 withSingularSummary:v20 pluralSummary:v20];

    v40 = [(PDUserNotification *)v17 actionURL];
    id v22 = +[PKApplicationMessageActionURL createWithURL:v40];
    +[PDUserNotification applicationMessageIconForFeature:2];
    id v23 = v12;
    v25 = BOOL v24 = v11;
    id v26 = +[PKApplicationMessageContentDefault createWithGroup:v42 action:v22 icon:v25 title:v44 body:v41];

    id v11 = v24;
    id v12 = v23;

    [(PDUserNotification *)v17 setApplicationMessageContent:v26];
    [(PDUserNotificationManager *)v48->_userNotificationManager insertUserNotification:v17];
    v27 = [(PDGenericUserNotification *)[PDWalletUserNotification alloc] initWithTitle:v44 message:v41];
    [(PDUserNotification *)v27 setSuppressionBehavior:1];
    [(PDUserNotification *)v27 setCustomActionRoute:v46];
    v28 = [(PDApplyNotificationController *)v48 _acceptReminderIdentifierForApplicationIdentifier:v11];
    [(PDUserNotification *)v27 setNotificationIdentifier:v28];

    id v14 = v46;
    id v13 = [(id)objc_opt_class() _acceptReminderNotificationDate];
    [(PDUserNotification *)v27 setDate:v13];
    [(PDUserNotification *)v27 setReissueBannerOnUpdate:1];
    [(PDUserNotification *)v27 setApplicationMessageContent:v26];
    [(PDUserNotificationManager *)v48->_userNotificationManager insertUserNotification:v27];

    self = v48;
    goto LABEL_12;
  }
LABEL_23:

LABEL_24:
}

- (void)_insertOrUpdateFeatureApplicationExpiredNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v18 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [v8 applicationIdentifier];
  id v11 = [v9 applicationState];

  id v12 = [v8 feature];
  [(PDApplyNotificationController *)self _queue_removeNonTerminalNotificationsForApplicationIdentifier:v10];
  if (v11 && v11 != (id)12)
  {
    id v13 = [PDWalletUserNotification alloc];
    id v14 = PKLocalizedApplyFeatureString();
    uint64_t v15 = PKLocalizedApplyFeatureString();
    uint64_t v16 = [(PDGenericUserNotification *)v13 initWithTitle:v14 message:v15];

    [(PDUserNotification *)v16 setSuppressionBehavior:1];
    v17 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v12];
    [(PDUserNotification *)v16 setCustomActionRoute:v17];

    [(PDUserNotification *)v16 setNotificationIdentifier:v10];
    [(PDUserNotification *)v16 setReissueBannerOnUpdate:1];
    [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v16];
  }
}

- (void)_insertOrUpdateFeatureApplicationBookedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v8 applicationIdentifier];
  id v11 = [v8 applicationState];
  id v12 = [v8 applicationStateReason];
  id v13 = [v30 applicationState];
  id v14 = [v30 applicationStateReason];
  id v15 = [v8 feature];
  [(PDApplyNotificationController *)self _queue_removeNonTerminalNotificationsForApplicationIdentifier:v10];
  if (v11 != v13 || v12 != v14)
  {
    if ([v8 applicationType] == (id)1)
    {
      if (v13 == (id)8 || v13 == (id)5 && v15 == (id)5)
      {
        uint64_t v16 = PKLocalizedApplyFeatureString();
        v17 = PKLocalizedApplyFeatureString();
        id v18 = [(PDGenericUserNotification *)[PDWalletUserNotification alloc] initWithTitle:v16 message:v17];
        [(PDUserNotification *)v18 setSuppressionBehavior:1];
        id v19 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v15];
        [(PDUserNotification *)v18 setCustomActionRoute:v19];

        [(PDUserNotification *)v18 setNotificationIdentifier:v10];
        [(PDUserNotification *)v18 setReissueBannerOnUpdate:1];
        if (v15 != (id)5)
        {
          uint64_t v20 = PKLocalizedApplyFeatureString();
          PKFeatureIdentifierToString();
          v21 = v29 = v16;
          v27 = (void *)v20;
          v28 = v17;
          id v22 = +[PKApplicationMessageGroupDescriptor createForIdentifier:v21 withSingularSummary:v20 pluralSummary:v20];

          id v23 = [(PDUserNotification *)v18 actionURL];
          id v24 = +[PKApplicationMessageActionURL createWithURL:v23];
          v25 = +[PDUserNotification applicationMessageIconForFeature:v15];
          id v26 = +[PKApplicationMessageContentDefault createWithGroup:v22 action:v24 icon:v25 title:v29 body:v28];

          [(PDUserNotification *)v18 setApplicationMessageContent:v26];
          uint64_t v16 = v29;

          v17 = v28;
        }
        [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v18];
      }
    }
    else
    {
      [(PDApplyNotificationController *)self _insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:v30 newApplication:v8];
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationPendingNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[PKWalletVisibility isWalletVisible])
  {
    unint64_t v10 = [v8 applicationIdentifier];
    id v11 = [v8 applicationType];
    id v12 = [v22 applicationState];
    id v13 = [v8 applicationStateReason];
    id v14 = [v22 applicationStateReason];
    id v15 = [v8 feature];
    if (v11 == (id)1 && v12 == (id)5 && v13 != v14)
    {
      id v16 = v15;
      v17 = [PDWalletUserNotification alloc];
      id v18 = PKLocalizedApplyFeatureString();
      id v19 = PKLocalizedApplyFeatureString();
      uint64_t v20 = [(PDGenericUserNotification *)v17 initWithTitle:v18 message:v19];

      [(PDUserNotification *)v20 setSuppressionBehavior:1];
      v21 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v16];
      [(PDUserNotification *)v20 setCustomActionRoute:v21];

      [(PDUserNotification *)v20 setNotificationIdentifier:v10];
      [(PDUserNotification *)v20 setReissueBannerOnUpdate:1];
      [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v20];
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationAcceptedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v32 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[PKWalletVisibility isWalletVisible])
  {
    unint64_t v10 = [v8 applicationIdentifier];
    id v11 = [v8 applicationState];
    unint64_t v12 = (unint64_t)[v32 applicationState];
    id v13 = [v8 applicationStateReason];
    id v14 = [v32 applicationStateReason];
    id v15 = [v8 feature];
    [(PDApplyNotificationController *)self _queue_removeNonTerminalNotificationsForApplicationIdentifier:v10];
    if (v11 != (id)v12 || v13 != v14)
    {
      id v16 = [v8 applicationType];
      if ((unint64_t)v16 < 2) {
        goto LABEL_8;
      }
      if (v16 == (id)2)
      {
        if (v11 == (id)7) {
          [(PDApplyNotificationController *)self _insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:v32 newApplication:v8];
        }
        goto LABEL_24;
      }
      if (v16 == (id)3)
      {
LABEL_8:
        if (v12 <= 5 && ((1 << v12) & 0x31) != 0)
        {
          uint64_t v17 = PKLocalizedApplyFeatureString();
          if (v15 == (id)5)
          {
            uint64_t v18 = PKLocalizedApplyFeatureString();
          }
          else
          {
            uint64_t v18 = 0;
          }
          id v19 = PKLocalizedApplyFeatureString();
          id v30 = (void *)v18;
          id v31 = (void *)v17;
          uint64_t v20 = [(PDGenericUserNotification *)[PDWalletUserNotification alloc] initWithTitle:v17 subtitle:v18 message:v19];
          v21 = v20;
          if (v12 == 4) {
            uint64_t v22 = 2;
          }
          else {
            uint64_t v22 = 1;
          }
          [(PDUserNotification *)v20 setSuppressionBehavior:v22];
          id v23 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v15];
          [(PDUserNotification *)v21 setCustomActionRoute:v23];

          [(PDUserNotification *)v21 setNotificationIdentifier:v10];
          [(PDUserNotification *)v21 setReissueBannerOnUpdate:1];
          if (v11 == (id)7 && v12 == 5)
          {
            if (v15 == (id)5)
            {
              id v24 = [(PDApplyNotificationController *)self _cutomRouteForApplicationIdentifier:v10];
              [(PDUserNotification *)v21 setCustomActionRoute:v24];
            }
            else
            {
              id v24 = PKLocalizedApplyFeatureString();
              v25 = PKFeatureIdentifierToString();
              id v29 = +[PKApplicationMessageGroupDescriptor createForIdentifier:v25 withSingularSummary:v24 pluralSummary:v24];

              id v26 = [(PDUserNotification *)v21 actionURL];
              id v27 = +[PKApplicationMessageActionURL createWithURL:v26];
              id v28 = +[PKApplicationMessageContentDefault createWithGroup:v29 action:v27 icon:0 title:v31 body:v19];

              [(PDUserNotification *)v21 setApplicationMessageContent:v28];
            }
          }
          -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v21, v29);
        }
      }
    }
LABEL_24:
  }
}

- (void)_insertOrUpdateFeatureApplicationWithdrawnNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v23 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [v8 applicationIdentifier];
  id v11 = [v8 applicationState];
  id v12 = [v9 applicationState];
  id v13 = [v8 applicationStateReason];
  id v14 = [v9 applicationStateReason];

  id v15 = [v8 feature];
  [(PDApplyNotificationController *)self _queue_removeNonTerminalNotificationsForApplicationIdentifier:v10];
  BOOL v17 = v11 != v12 || v13 != v14;
  if (v12 == (id)5 && v17)
  {
    uint64_t v18 = [PDWalletUserNotification alloc];
    id v19 = PKLocalizedApplyFeatureString();
    uint64_t v20 = PKLocalizedApplyFeatureString();
    v21 = [(PDGenericUserNotification *)v18 initWithTitle:v19 message:v20];

    [(PDUserNotification *)v21 setSuppressionBehavior:1];
    uint64_t v22 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v15];
    [(PDUserNotification *)v21 setCustomActionRoute:v22];

    [(PDUserNotification *)v21 setNotificationIdentifier:v10];
    [(PDUserNotification *)v21 setReissueBannerOnUpdate:1];
    [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v21];
  }
}

- (void)_insertOrUpdateFeatureApplicationTerminatedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 applicationIdentifier];
  id v12 = [v8 applicationState];
  id v13 = [v10 applicationState];
  id v14 = [v8 applicationStateReason];
  id v15 = [v10 applicationStateReason];

  id v16 = [v8 feature];
  [(PDApplyNotificationController *)self _queue_removeNonTerminalNotificationsForApplicationIdentifier:v11];
  if (v12 == v13 && v14 == v15) {
    goto LABEL_3;
  }
  id v17 = [v8 applicationType];
  if (v17 == (id)3) {
    goto LABEL_7;
  }
  if (v17 != (id)2)
  {
    if (v17 != (id)1) {
      goto LABEL_3;
    }
LABEL_7:
    if (v13 == (id)5)
    {
      uint64_t v18 = [PDWalletUserNotification alloc];
      id v19 = PKLocalizedApplyFeatureString();
      uint64_t v20 = PKLocalizedApplyFeatureString();
      v21 = [(PDGenericUserNotification *)v18 initWithTitle:v19 message:v20];

      [(PDUserNotification *)v21 setSuppressionBehavior:1];
      uint64_t v22 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v16];
      [(PDUserNotification *)v21 setCustomActionRoute:v22];

      [(PDUserNotification *)v21 setNotificationIdentifier:v11];
      [(PDUserNotification *)v21 setReissueBannerOnUpdate:1];
      [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v21];
    }
    goto LABEL_3;
  }
  if (v12 == (id)11)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100391FB8;
    v23[3] = &unk_10074D190;
    id v24 = v8;
    v25 = self;
    id v26 = v11;
    [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v23];
  }
LABEL_3:
}

- (void)_insertOrUpdateFeatureApplicationNewNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 applicationIdentifier];
  id v11 = [v8 applicationState];
  id v12 = [v15 applicationState];
  id v13 = [v8 applicationStateReason];
  id v14 = [v15 applicationStateReason];
  if (v11 != v12 || v13 != v14)
  {
    [(PDApplyNotificationController *)self _queue_removeAllNotificationsForApplicationIdentifier:v10];
    if (v13 == (id)15) {
      [(PDApplyNotificationController *)self _insertOrUpdatePathToOfferCompletedNotificationForOldApplication:v15 newApplication:v8 preferredLanguage:v9];
    }
    if ([v8 applicationType] == (id)2) {
      [(PDApplyNotificationController *)self _insertOrUpdateInvitationReceivedNotificationForOldApplication:v15 newApplication:v8];
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationOpenNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[PKWalletVisibility isWalletVisible])
  {
    id v11 = [v9 applicationIdentifier];
    id v12 = [v9 applicationState];
    id v13 = [v8 applicationState];
    id v14 = [v9 applicationStateReason];
    id v15 = [v8 applicationStateReason];
    id v16 = [v9 feature];
    BOOL v18 = v12 != v13 || v14 != v15;
    if (v13 == (id)5 && v18)
    {
      if (v15 == (id)8)
      {
        id v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Suppress notification because application went from pending - manual idv review to open", v26, 2u);
        }
      }
      else
      {
        id v20 = v16;
        v21 = [PDWalletUserNotification alloc];
        uint64_t v22 = PKLocalizedApplyFeatureString();
        id v23 = PKLocalizedApplyFeatureString();
        id v24 = [(PDGenericUserNotification *)v21 initWithTitle:v22 message:v23];

        [(PDUserNotification *)v24 setSuppressionBehavior:1];
        v25 = [(PDApplyNotificationController *)self _cutomRouteForFeatureIdentifier:v20];
        [(PDUserNotification *)v24 setCustomActionRoute:v25];

        [(PDUserNotification *)v24 setNotificationIdentifier:v11];
        [(PDUserNotification *)v24 setReissueBannerOnUpdate:1];
        [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v24];
      }
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = [v7 applicationIdentifier];
  id v9 = [v7 applicationState];
  id v10 = [v13 applicationState];
  id v11 = [v7 applicationStateReason];
  id v12 = [v13 applicationStateReason];
  if (v9 != v10 || v11 != v12)
  {
    [(PDApplyNotificationController *)self _queue_removeAllNotificationsForApplicationIdentifier:v8];
    if ([v7 applicationType] == (id)2) {
      [(PDApplyNotificationController *)self _insertOrUpdateInvitationClosedNotificationForOldApplication:v13 newApplication:v7];
    }
  }
}

- (void)_insertOrUpdatePathToOfferCompletedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  objc_msgSend(a4, "applicationIdentifier", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [[PDUserNotificationTypePTACCompletedUserNotification alloc] initWithApplicationIdentifier:v7];
  [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v6];
}

- (void)_insertOrUpdateInvitationReceivedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 invitationDetails];
  id v9 = [v8 accountUserAltDSID];
  id v10 = [v7 applicationState];

  id v11 = [v6 applicationIdentifier];

  if (!v10)
  {
    id v12 = PKCurrentUserAltDSID();
    id v13 = v9;
    id v14 = v12;
    if (v13 == v14)
    {
    }
    else
    {
      id v15 = v14;
      if (!v13 || !v14)
      {

        goto LABEL_10;
      }
      unsigned int v16 = [v13 isEqualToString:v14];

      if (!v16) {
        goto LABEL_10;
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100392800;
    v17[3] = &unk_10074D190;
    id v18 = v8;
    id v19 = self;
    id v20 = v11;
    [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v17];
  }
LABEL_10:
}

- (void)_insertOrUpdateInvitationOfferReadyNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v24 = a4;
  BOOL v6 = [a3 applicationState] == (id)5;
  id v7 = v24;
  if (v6)
  {
    id v8 = v24;
    id v9 = PKCurrentUserAltDSID();
    if ([v8 applicationType] == (id)3)
    {
      databaseManager = self->_databaseManager;
      id v11 = [v8 referenceIdentifier];
      id v12 = [(PDDatabaseManager *)databaseManager featureApplicationWithIdentifier:v11];

      id v13 = [v12 invitationDetails];
      id v14 = [v13 accountUserAltDSID];
      id v15 = v9;
      id v16 = v14;
      if (v15 == v16)
      {
      }
      else
      {
        id v17 = v16;
        if (!v15 || !v16)
        {
          id v19 = v16;
LABEL_18:

LABEL_19:
          id v7 = v24;
          goto LABEL_20;
        }
        unsigned __int8 v18 = [v15 isEqualToString:v16];

        if ((v18 & 1) == 0) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      id v12 = v8;
    }
    id v13 = [v12 accountIdentifier];
    id v19 = [v12 applicationIdentifier];
    PKLocalizedMadisonString(@"SHARING_INVITATION_OFFER_AVAILABLE_NOTIFICATION_TITLE");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = PKLocalizedMadisonString(@"SHARING_INVITATION_OFFER_AVAILABLE_NOTIFICATION_MESSAGE");
    if (v13)
    {
      id v20 = [(PDDatabaseManager *)self->_databaseManager accountWithIdentifier:v13];
      v21 = [v20 associatedPassUniqueID];
    }
    else
    {
      v21 = 0;
    }
    uint64_t v22 = [(PDGenericUserNotification *)[PDWalletUserNotification alloc] initWithTitle:v15 message:v17 forPassUniqueIdentifier:v21];
    [(PDUserNotification *)v22 setSuppressionBehavior:1];
    if (v13) {
      [(PDApplyNotificationController *)self _customRouteForJointOfferWithAccountIdentifier:v13 invitationIdentifier:v19];
    }
    else {
    id v23 = [(PDApplyNotificationController *)self _customRouteForInvitationWithIdentifier:v19];
    }
    [(PDUserNotification *)v22 setCustomActionRoute:v23];
    [(PDUserNotification *)v22 setNotificationIdentifier:v19];
    [(PDUserNotification *)v22 setReissueBannerOnUpdate:1];
    [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v22];

    goto LABEL_18;
  }
LABEL_20:
}

- (void)_insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v6 = a4;
  id v7 = [a3 applicationState];
  id v8 = [v6 invitationDetails];
  id v9 = [v8 originatorAltDSID];
  int v10 = PKAltDSIDIsCurrentUser();
  char v11 = v10;
  if (v7 == (id)5)
  {
    if (v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10039309C;
      v14[3] = &unk_10074D190;
      id v12 = &v15;
      id v15 = v6;
      id v13 = (id *)v16;
      v16[0] = v8;
      v16[1] = self;
      [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v14];
      goto LABEL_7;
    }
  }
  else if (v7 == (id)8 && [v8 accountUserAccessLevel] == (id)1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100392EC8;
    v17[3] = &unk_10074D1B8;
    id v12 = &v18;
    id v18 = v8;
    char v22 = v11;
    id v13 = &v19;
    id v19 = v9;
    id v20 = v6;
    v21 = self;
    [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v17];

LABEL_7:
  }
}

- (void)_insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v6 = a4;
  id v7 = [a3 applicationState];
  id v8 = [v6 invitationDetails];
  id v9 = PKCurrentUserAltDSID();
  if (v7 == (id)5)
  {
    id v10 = [v8 originatorAltDSID];
    id v14 = v9;
    id v12 = v14;
    if (v10 == v14)
    {
    }
    else
    {
      if (!v14 || !v10)
      {
LABEL_13:

        goto LABEL_19;
      }
      unsigned int v15 = [v10 isEqualToString:v14];

      if (!v15) {
        goto LABEL_19;
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100393674;
    v17[3] = &unk_10074D190;
    id v18 = v8;
    id v19 = v6;
    id v20 = self;
    [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v17];

    id v16 = v18;
    goto LABEL_18;
  }
  if (v7 == (id)8)
  {
    id v10 = [v8 accountUserAltDSID];
    id v11 = v9;
    id v12 = v11;
    if (v10 == v11)
    {

LABEL_15:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1003934D4;
      v21[3] = &unk_10074D190;
      id v22 = v8;
      id v23 = v6;
      id v24 = self;
      [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v21];

      id v16 = v22;
LABEL_18:

      goto LABEL_19;
    }
    if (v11 && v10)
    {
      unsigned int v13 = [v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
    goto LABEL_13;
  }
LABEL_19:
}

- (void)_insertOrUpdateInvitationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v5 = a4;
  if ([v5 applicationStateReason] == (id)14)
  {
    id v6 = [v5 applicationIdentifier];
    id v7 = [v5 invitationDetails];
    [v5 accountIdentifier];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100393980;
    v11[3] = &unk_10074D1E0;
    id v12 = v7;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = self;
    id v15 = v6;
    id v8 = v6;
    id v9 = v13;
    id v10 = v7;
    [(PDApplyNotificationController *)self _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:v11];
  }
}

- (id)_customRouteForPassUniqueID:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)NSString);
    id v5 = [v4 initWithFormat:@"%@/%@", PKUserNotificationActionRouteViewPass, v3];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_customRouteForInvitationWithIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)NSString);
    id v5 = [v4 initWithFormat:@"%@/%@", PKUserNotificationActionRouteInvitationInbox, v3];
  }
  else
  {
    id v5 = PKUserNotificationActionRouteInvitationInbox;
  }
  return v5;
}

- (id)_customRouteForJointOfferWithAccountIdentifier:(id)a3 invitationIdentifier:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = objc_alloc((Class)NSString);
    id v8 = [v7 initWithFormat:@"%@/%@/%@", PKUserNotificationActionRouteJointOffer, v6, v5];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_familyMemberCollection)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    familyMemberManager = self->_familyMemberManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100393F1C;
    v7[3] = &unk_1007346F0;
    v7[4] = self;
    id v8 = v4;
    [(PDFamilyCircleManager *)familyMemberManager familyMembersWithCachePolicy:0 completion:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_familyMemberManager, 0);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
}

@end