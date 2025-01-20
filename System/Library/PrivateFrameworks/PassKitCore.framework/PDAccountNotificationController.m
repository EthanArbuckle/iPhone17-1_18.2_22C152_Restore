@interface PDAccountNotificationController
- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 financingPlan:(id)a4;
- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 overrideBlockNotifications:(BOOL)a4;
- (BOOL)_didPayOffFinancingPlan:(id)a3 oldFinancingPlan:(id)a4;
- (OS_dispatch_queue)workQueue;
- (PDAccountManager)accountManager;
- (PDAccountNotificationController)initWithAccountManager:(id)a3 notificationStreamManager:(id)a4 userNotificationManager:(id)a5 databaseManager:(id)a6 paymentWebServiceCoordinator:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 familyMemberManager:(id)a9;
- (PDDatabaseManager)databaseManager;
- (PDUserNotificationManager)userNotificationManager;
- (id)_latestNewFinancingPlanPaymentOfType:(unint64_t)a3 financingPlan:(id)a4 oldFinancingPlan:(id)a5;
- (id)_notificationForAccountEvent:(id)a3 account:(id)a4;
- (id)_paymentDueNotificationsForAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4;
- (id)_upcomingScheduledPaymentNotificationsForPayment:(id)a3 account:(id)a4;
- (id)createCurrentNotificationRegistrationState;
- (void)_accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)_notificationForAccountEvent:(id)a3 withManager:(id)a4 completion:(id)a5;
- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5;
- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5 newNotificationSuppressionBehavior:(unint64_t)a6;
- (void)_queue_computeAccountStateChangeNotification:(id)a3 oldAccount:(id)a4;
- (void)_queue_computeAdjustmentPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeCanceledFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeDeclinedPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeFinancingPlanDisputeNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeFinancingPlanPastDueNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeFinancingPlanPaymentReminderNotifications:(id)a3 account:(id)a4;
- (void)_queue_computeFinancingPlanScheduleSummaryReasonNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeNewFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeNewPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeRefundPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3;
- (void)_queue_removeSummaryTimesForAccountChangedIfNecessary:(id)a3 oldAccount:(id)a4;
- (void)_recomputePaymentNotificationsForScheduledPayments:(id)a3 account:(id)a4;
- (void)_recomputeSummaryNotificationsForAccountIdentifier:(id)a3 paymentPass:(id)a4 dateForSummary:(id)a5 summaryTypes:(id)a6 fireImmediately:(BOOL)a7;
- (void)_recomputeSummaryNotificationsForTransactionSourceIdentifier:(id)a3 withTransaction:(id)a4;
- (void)_removePayLaterNotificationsForAccount:(id)a3 removeAccountStateChangeNotification:(BOOL)a4;
- (void)_resurfaceRecentNotificationsAndPromote:(BOOL)a3;
- (void)_resurfaceRecentNotificationsForAccount:(id)a3 andPromote:(BOOL)a4;
- (void)_scheduledAndDeliveredUserNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)_scheduledAndDeliveredUserNotificationsOfType:(unint64_t)a3 completion:(id)a4;
- (void)_updateAccountAPYMessageForNewAccount:(id)a3 oldAccount:(id)a4 blockNotifications:(BOOL)a5;
- (void)_updateAccountBalanceNotificationForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateAccountStateNotificationForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateAccountUserIdentityStatusNotificationsWithAccount:(id)a3 accountUserCollection:(id)a4 oldAccountUserCollection:(id)a5;
- (void)_updateAccountUserMonthlySpendLimitNotificationsForOldAccount:(id)a3 newAccount:(id)a4 accountUserCollection:(id)a5;
- (void)_updateBankVerificationExpirationDismissalsForFundingSources:(id)a3;
- (void)_updateCanShowFixRewardsMessageForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateFCCStepUpMessageForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateInstallmentNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5;
- (void)_updatePastDueNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5 enrolledInRecoveryPaymentPlan:(BOOL)a6;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a4;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didAddFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didRemoveFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didSetScheduledPayments:(id)a4 forAccountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didUpdateFinancingPlan:(id)a4 oldFinancingPlan:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 didUpdatePaymentFundingSources:(id)a4 accountIdentifier:(id)a5;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(unint64_t)a4;
- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)removePayLaterNotificationsForAccount:(id)a3;
- (void)removeSavingsNotificationsForAccount:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateDailyCashNotificationsForAccountIdentifier:(id)a3 date:(id)a4 completion:(id)a5;
- (void)updateDailyCashNotificationsWithAccount:(id)a3;
- (void)updatedFundingSources:(id)a3 forSavingsAccount:(id)a4;
- (void)updatedPayLaterAccount:(id)a3 oldAccount:(id)a4;
- (void)updatedSavingsAccount:(id)a3 oldAccount:(id)a4;
@end

@implementation PDAccountNotificationController

- (void)removePayLaterNotificationsForAccount:(id)a3
{
}

- (void)_removePayLaterNotificationsForAccount:(id)a3 removeAccountStateChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = [a3 associatedPassUniqueID];
  if (v4)
  {
    v6 = [(PDAccountNotificationController *)self userNotificationManager];
    [v6 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:20];
  }
  v7 = [(PDAccountNotificationController *)self userNotificationManager];
  [v7 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:44];

  v8 = [(PDAccountNotificationController *)self userNotificationManager];
  [v8 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:51];

  v9 = [(PDAccountNotificationController *)self userNotificationManager];
  [v9 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:52];

  v10 = [(PDAccountNotificationController *)self userNotificationManager];
  [v10 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:53];

  v11 = [(PDAccountNotificationController *)self userNotificationManager];
  [v11 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:54];

  v12 = [(PDAccountNotificationController *)self userNotificationManager];
  [v12 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:55];

  v13 = [(PDAccountNotificationController *)self userNotificationManager];
  [v13 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:56];
}

- (void)accountManager:(id)a3 didUpdateFinancingPlan:(id)a4 oldFinancingPlan:(id)a5 accountIdentifier:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C744;
  v10[3] = &unk_10072E728;
  v11 = self;
  id v12 = a4;
  id v13 = a5;
  id v8 = v13;
  id v9 = v12;
  [(PDAccountNotificationController *)v11 _accountWithIdentifier:a6 completion:v10];
}

- (void)accountManager:(id)a3 didAddFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C8F0;
  v7[3] = &unk_10072E750;
  id v8 = self;
  id v9 = a4;
  id v6 = v9;
  [(PDAccountNotificationController *)v8 _accountWithIdentifier:a5 completion:v7];
}

- (void)accountManager:(id)a3 didRemoveFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v6 = a4;
  v7 = [(PDAccountNotificationController *)self workQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002CA3C;
  v9[3] = &unk_10072E198;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)updatedPayLaterAccount:(id)a3 oldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CF5C;
  v11[3] = &unk_10072E728;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PDAccountNotificationController *)self _accountWithIdentifier:v8 completion:v11];
}

- (void)_queue_computeNewFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 planSummary];
  v11 = [v10 transactionDate];

  id v12 = [v8 planIdentifier];
  id v13 = [v9 associatedPassUniqueID];

  if (!v11)
  {
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v12;
      v16 = "New Financing Plan doesnt have a transactionDate %@, skip notification.";
      v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_15;
  }
  [v11 timeIntervalSinceNow];
  if (fabs(v14) > 86400.0)
  {
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      __int16 v29 = 2112;
      v30 = v11;
      v16 = "New Financing Plan %@ has a transactionDate more than 1 day ago %@, skip notification.";
      v17 = v15;
      uint32_t v18 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v19 = +[NSString stringWithFormat:@"Found an existing active user notification for a new financing plan %@. Updating contents but not re-rolling banner.", v12];
  v20 = +[NSString stringWithFormat:@"Creating new notification for a new financing plan %@", v12];
  v21 = [[PDAccountFinancingPlanUserNotification alloc] initWithFinancingPlan:v8 updateType:1 passUniqueIdentifier:v13];
  if (a4)
  {
    v26 = v19;
    v22 = +[PDAccountFinancingPlanUserNotification notificationIdentifierForFinancingPlan:v8 updateType:1];
    v23 = [(PDAccountNotificationController *)self userNotificationManager];
    unsigned int v24 = [v23 hasNotificationApplicationMessageWithIdentifier:v22];

    if (v24)
    {
      v25 = [(PDAccountNotificationController *)self userNotificationManager];
      [v25 updateNotificationApplicationMessageWithNotification:v21];
    }
    v19 = v26;
  }
  else
  {
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v21 updateLogLine:v19 addLogLine:v20];
  }

LABEL_15:
}

- (void)_queue_computeCanceledFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v16 planIdentifier];
  v11 = [v8 associatedPassUniqueID];

  id v12 = [v9 state];
  if ([v16 state] == (id)5)
  {
    if (v12 == (id)5) {
      goto LABEL_6;
    }
    id v13 = +[NSString stringWithFormat:@"Found an existing active user notification for a canceled financing plan %@. Updating contents but not re-rolling banner.", v10];
    double v14 = +[NSString stringWithFormat:@"Creating new notification for a canceled financing plan %@", v10];
    v15 = [[PDAccountFinancingPlanUserNotification alloc] initWithFinancingPlan:v16 updateType:2 passUniqueIdentifier:v11];
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v15 updateLogLine:v13 addLogLine:v14];
  }
  else
  {
    id v13 = +[PDAccountFinancingPlanUserNotification notificationIdentifierForFinancingPlan:v16 updateType:2];
    double v14 = [(PDAccountNotificationController *)self userNotificationManager];
    [v14 removeNotificationApplicationMessageWithIdentifier:v13];
  }

LABEL_6:
}

- (void)_queue_computeNewPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 planIdentifier];
  id v12 = [v10 associatedPassUniqueID];
  if ([(PDAccountNotificationController *)self _didPayOffFinancingPlan:v8 oldFinancingPlan:v9])
  {
    id v13 = +[NSString stringWithFormat:@"Found an existing active user notification for a paid off financing plan %@. Updating contents but not re-rolling banner.", v11];
    double v14 = +[NSString stringWithFormat:@"Creating new notification for a paid off financing plan %@", v11];
    v15 = [[PDAccountFinancingPlanPaidOffNotification alloc] initWithFinancingPlan:v8 passUniqueIdentifier:v12];
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v15 updateLogLine:v13 addLogLine:v14];

LABEL_8:
    goto LABEL_9;
  }
  id v16 = [(PDAccountNotificationController *)self _latestNewFinancingPlanPaymentOfType:1 financingPlan:v8 oldFinancingPlan:v9];
  id v13 = v16;
  if (v16)
  {
    double v14 = [v16 paymentIdentifier];
    v17 = +[NSString stringWithFormat:@"Found an existing active user notification for a new payment %@ on financing plan %@. Updating contents but not re-rolling banner.", v14, v11];
    v23 = +[NSString stringWithFormat:@"Creating new notification for a new payment %@ on financing plan %@", v14, v11];
    if (v8)
    {
      id v24 = v8;
      +[NSArray arrayWithObjects:&v24 count:1];
      v22 = v14;
      v19 = uint32_t v18 = v17;
      id v20 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v10 financingPlans:v19];

      v17 = v18;
      double v14 = v22;
    }
    else
    {
      id v20 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v10 financingPlans:0];
    }
    v21 = [[PDAccountFinancingPlanPaymentNotification alloc] initWithFinancingPlan:v8 payment:v13 requiresGenericMessaging:v20 passUniqueIdentifier:v12];
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v21 updateLogLine:v17 addLogLine:v23 newNotificationSuppressionBehavior:0];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)_queue_computeDeclinedPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [v8 scheduleSummary];
  v11 = [v10 payments];

  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[PDAccountFinancingPlanPaymentNotification notificationIdentifierForPayment:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        v17 = [(PDAccountNotificationController *)self userNotificationManager];
        [v17 removeNotificationApplicationMessageWithIdentifier:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v13);
  }

  uint32_t v18 = [v8 planIdentifier];
  v19 = v30;
  id v20 = [v30 associatedPassUniqueID];
  v21 = [(PDAccountNotificationController *)self _latestNewFinancingPlanPaymentOfType:5 financingPlan:v8 oldFinancingPlan:v9];
  v22 = v21;
  if (v21)
  {
    id v29 = v9;
    v23 = [v21 paymentIdentifier];
    v28 = +[NSString stringWithFormat:@"Found an existing active user notification for a declined payment %@ on financing plan %@. Updating contents but not re-rolling banner.", v23, v18];
    id v24 = +[NSString stringWithFormat:@"Creating new notification for a declined payment %@ on financing plan %@", v23, v18];
    if (v8)
    {
      id v35 = v8;
      v25 = +[NSArray arrayWithObjects:&v35 count:1];
      id v26 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v30 financingPlans:v25];

      v19 = v30;
    }
    else
    {
      id v26 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v30 financingPlans:0];
    }
    v27 = [[PDAccountFinancingPlanPaymentNotification alloc] initWithFinancingPlan:v8 payment:v22 requiresGenericMessaging:v26 passUniqueIdentifier:v20];
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v27 updateLogLine:v28 addLogLine:v24];

    id v9 = v29;
  }
}

- (void)_queue_computeFinancingPlanPaymentReminderNotifications:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v52 = [v6 planIdentifier];
  uint64_t v8 = [v7 associatedPassUniqueID];
  v48 = v7;
  id v9 = [v7 payLaterDetails];
  uint64_t v50 = [v9 createdDate];

  id v10 = [(PDAccountNotificationController *)self userNotificationManager];
  v51 = (void *)v8;
  v11 = [v10 scheduledNotificationActivitiesForPassUniqueIdentifier:v8 ofType:53];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v61;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          uint32_t v18 = [v6 planIdentifier];
          v19 = [v17 planIdentifier];
          id v20 = v18;
          id v21 = v19;
          if (v20 != v21)
          {
            v22 = v21;
            if (v20 && v21)
            {
              unsigned __int8 v23 = [v20 isEqualToString:v21];

              if ((v23 & 1) == 0) {
                goto LABEL_18;
              }
LABEL_13:
              id v24 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v66 = v17;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removing future scheduled financing plan payment reminder notifications: %@", buf, 0xCu);
              }

              id v20 = [(PDAccountNotificationController *)self userNotificationManager];
              [v20 removeUserNotification:v17];
            }
            else
            {
            }
LABEL_18:

            continue;
          }

          goto LABEL_13;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v13);
  }

  v53 = v6;
  v25 = [v6 scheduleSummary];
  id v26 = [v25 installments];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v27 = v26;
  id v28 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v57;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v57 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = 0;
        uint64_t v33 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
        do
        {
          long long v34 = +[PDAccountFinancingPlanPaymentReminderNotification notificationIdentifierForInstallment:v33 reminderOffset:v32];
          id v35 = [(PDAccountNotificationController *)self userNotificationManager];
          [v35 removeNotificationApplicationMessageWithIdentifier:v34];

          ++v32;
        }
        while (v32 != 3);
      }
      id v29 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v29);
  }

  v36 = v48;
  if ([v48 state] == (id)3)
  {
    v37 = PKLogFacilityTypeGetObject();
    v38 = v53;
    v39 = (void *)v50;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Not scheduling any financing plan payment reminder notifications since the account is locked.", buf, 2u);
    }
  }
  else
  {
    v40 = objc_msgSend(v27, "pk_objectsPassingTest:", &stru_10072E790);

    id v27 = [v40 sortedArrayUsingComparator:&stru_10072E7D0];

    v37 = [v27 firstObject];
    v54 = [v37 installmentIdentifier];
    v38 = v53;
    [v53 state];
    char IsPending = PKPayLaterFinancingPlanStateIsPending();
    v39 = (void *)v50;
    if (!v37 || (IsPending & 1) != 0)
    {
      v47 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Not scheduling any financing plan payment reminder notifications since there are no open installments.", buf, 2u);
      }
    }
    else
    {
      uint64_t v42 = 0;
      v49 = v37;
      do
      {
        v43 = [[PDAccountFinancingPlanPaymentReminderNotification alloc] initWithInstallment:v37 financingPlan:v38 accountCreatedDate:v39 passUniqueIdentifier:v51 reminderOffset:v42];
        v44 = [(PDUserNotification *)v43 notificationIdentifier];
        v45 = +[NSString stringWithFormat:@"Found an existing active payment reminder notification for installment %@, financing plan %@, notification identifier %@. Updating contents but not re-rolling banner.", v54, v52, v44];
        v46 = +[NSString stringWithFormat:@"Creating new notification for a payment reminder notification with installment %@, financing plan %@, notification identifier %@.", v54, v52, v44];
        [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v43 updateLogLine:v45 addLogLine:v46];

        v38 = v53;
        v37 = v49;

        v39 = (void *)v50;
        ++v42;
      }
      while (v42 != 3);
    }

    v36 = v48;
  }
}

- (void)_queue_computeFinancingPlanPastDueNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 planIdentifier];
  id v12 = [v9 associatedPassUniqueID];
  id v13 = [v10 planSummary];

  id v14 = [v13 daysPastDue];
  v15 = [v8 planSummary];
  id v16 = [v15 daysPastDue];

  if (v14 != v16)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002E214;
    v27[3] = &unk_10072E238;
    v27[4] = self;
    id v17 = v12;
    id v28 = v17;
    id v18 = v8;
    id v29 = v18;
    v19 = objc_retainBlock(v27);
    if ([v18 state] == (id)4)
    {
      id v26 = self;
      if (v18)
      {
        id v30 = v18;
        id v20 = +[NSArray arrayWithObjects:&v30 count:1];
        id v21 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v9 financingPlans:v20];
      }
      else
      {
        id v21 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v9 financingPlans:0];
      }
      v22 = [[PDAccountFinancingPlanPastDueNotification alloc] initWithFinancingPlan:v18 requiresGenericMessaging:v21 daysPastDue:v16 passUniqueIdentifier:v17];
      unsigned __int8 v23 = [(PDUserNotification *)v22 notificationIdentifier];
      id v24 = +[NSString stringWithFormat:@"Found an existing active financing plan past due notification for financing plan %@, notification identifier %@. Updating contents but not re-rolling banner.", v11, v23];
      v25 = +[NSString stringWithFormat:@"Creating new notification for a financing plan past due notification with financing plan %@, notification identifier %@.", v11, v23];
      if (v22) {
        ((void (*)(void *))v19[2])(v19);
      }
      [(PDAccountNotificationController *)v26 _queue_addOrUpdateNotification:v22 updateLogLine:v24 addLogLine:v25];
    }
    else
    {
      ((void (*)(void *))v19[2])(v19);
    }
  }
}

- (void)_queue_computeFinancingPlanScheduleSummaryReasonNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 planIdentifier];
  id v35 = [v8 associatedPassUniqueID];
  v11 = [v7 scheduleSummary];
  id v12 = [v11 scheduleSummaryReason];

  id v13 = [v9 scheduleSummary];
  id v14 = [v13 scheduleSummaryReason];

  v15 = [v9 planSummary];

  id v16 = [v15 totalAmount];

  id v17 = [v7 planSummary];
  v37 = [v17 totalAmount];

  id v18 = +[NSNumber numberWithUnsignedInteger:v14];
  if ([&off_10078C0F0 containsObject:v18])
  {
  }
  else
  {
    v19 = +[NSNumber numberWithUnsignedInteger:v12];
    unsigned __int8 v20 = [&off_10078C108 containsObject:v19];

    if (v20)
    {
      uint64_t v21 = 1;
      goto LABEL_9;
    }
  }
  v22 = +[NSNumber numberWithUnsignedInteger:v14];
  if (![&off_10078C120 containsObject:v22])
  {
    unsigned __int8 v23 = +[NSNumber numberWithUnsignedInteger:v12];
    unsigned __int8 v24 = [&off_10078C138 containsObject:v23];

    if ((v24 & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v21 = 3;
LABEL_9:
    v25 = v16;
    goto LABEL_17;
  }

LABEL_10:
  id v26 = +[NSNumber numberWithUnsignedInteger:v14];
  v25 = v16;
  if ([&off_10078C150 containsObject:v26])
  {

    goto LABEL_14;
  }
  id v27 = +[NSNumber numberWithUnsignedInteger:v12];
  unsigned __int8 v28 = [&off_10078C168 containsObject:v27];

  if ((v28 & 1) == 0)
  {
LABEL_14:
    if ([v16 currencyAmountLessThanCurrencyAmount:v37]) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v21 = 4;
LABEL_17:
  if (v7)
  {
    id v38 = v7;
    id v29 = +[NSArray arrayWithObjects:&v38 count:1];
    id v30 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v8 financingPlans:v29];
  }
  else
  {
    id v30 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v8 financingPlans:0];
  }
  long long v31 = [[PDAccountFinancingPlanScheduleUpdateNotification alloc] initWithFinancingPlan:v7 updateType:v21 requiresGenericMessaging:v30 passUniqueIdentifier:v35];
  uint64_t v32 = [(PDUserNotification *)v31 notificationIdentifier];
  uint64_t v33 = +[NSString stringWithFormat:@"Found an existing active financing plan schedule summary reason notification for financing plan %@, notification identifier %@. Updating contents but not re-rolling banner.", v10, v32];
  long long v34 = +[NSString stringWithFormat:@"Creating new notification for a financing plan schedule summary reason notification with financing plan %@, notification identifier %@.", v10, v32];
  [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v31 updateLogLine:v33 addLogLine:v34];
}

- (void)_queue_computeRefundPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 planIdentifier];
  id v12 = [v9 associatedPassUniqueID];
  id v13 = [(PDAccountNotificationController *)self _latestNewFinancingPlanPaymentOfType:3 financingPlan:v8 oldFinancingPlan:v10];

  if (v13)
  {
    unsigned __int8 v20 = self;
    id v14 = [v13 paymentIdentifier];
    v15 = +[NSString stringWithFormat:@"Found an existing active user notification for a refund payment %@ on financing plan %@. Updating contents but not re-rolling banner.", v14, v11];
    id v16 = +[NSString stringWithFormat:@"Creating new notification for a refund payment %@ on financing plan %@", v14, v11];
    if (v8)
    {
      id v21 = v8;
      id v17 = +[NSArray arrayWithObjects:&v21 count:1];
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v9 financingPlans:v17];
    }
    else
    {
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v9 financingPlans:0];
    }
    v19 = [[PDAccountFinancingPlanPaymentNotification alloc] initWithFinancingPlan:v8 payment:v13 requiresGenericMessaging:v18 passUniqueIdentifier:v12];
    [(PDAccountNotificationController *)v20 _queue_addOrUpdateNotification:v19 updateLogLine:v15 addLogLine:v16];
  }
}

- (void)_queue_computeFinancingPlanDisputeNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 planIdentifier];
  v79 = v10;
  uint64_t v12 = [v10 associatedPassUniqueID];
  id v13 = sub_10002F264(v12, v8);
  id v14 = sub_10002F264((uint64_t)v13, v9);
  id v15 = [v13 mutableCopy];
  [v15 minusSet:v14];
  v82 = v14;
  id v16 = [v14 mutableCopy];
  v83 = v13;
  [v16 minusSet:v13];
  v80 = v16;
  v86 = v8;
  v81 = (void *)v11;
  v84 = (void *)v12;
  if ([v16 count])
  {
    id v17 = [(PDAccountNotificationController *)self userNotificationManager];
    id v18 = [v17 scheduledNotificationActivitiesForPassUniqueIdentifier:v12 ofType:56];

    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_10002F2EC;
    v101[3] = &unk_10072E838;
    id v102 = v80;
    v76 = v18;
    v19 = objc_msgSend(v18, "pk_objectsPassingTest:", v101);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v20 = [v19 countByEnumeratingWithState:&v97 objects:v107 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v98;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v98 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v97 + 1) + 8 * i);
          v25 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v106 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing notification for removed dispute: %@", buf, 0xCu);
          }

          id v26 = [(PDAccountNotificationController *)self userNotificationManager];
          [v26 removeUserNotification:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v97 objects:v107 count:16];
      }
      while (v21);
    }

    id v8 = v86;
    uint64_t v11 = (uint64_t)v81;
    uint64_t v12 = (uint64_t)v84;
  }
  id v27 = [v8 disputes];
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_10002F370;
  v95[3] = &unk_10072E860;
  id v78 = v15;
  id v96 = v78;
  unsigned __int8 v28 = objc_msgSend(v27, "pk_objectsPassingTest:", v95);

  id v29 = [v28 sortedArrayUsingComparator:&stru_10072E8A0];

  v77 = v29;
  id v30 = [v29 lastObject];
  long long v31 = v30;
  if (v30)
  {
    uint64_t v32 = [v30 identifier];
    uint64_t v33 = NSNumber_ptr;
    if ([v31 state] == (id)2)
    {
      long long v34 = +[NSString stringWithFormat:@"Found an existing active user notification for a new financing plan dispute in evidenceRequired state %@ on financing plan %@. Updating contents but not re-rolling banner.", v32, v11];
      id v35 = +[NSString stringWithFormat:@"Creating new notification for a new financing plan dispute in evidenceRequired state %@ on financing plan %@", v32, v11];
      v36 = [[PDAccountFinancingPlanDisputeUpdateNotification alloc] initWithFinancingPlan:v8 dispute:v31 type:0 passUniqueIdentifier:v12];
      [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v36 updateLogLine:v34 addLogLine:v35];

      uint64_t v33 = NSNumber_ptr;
      uint64_t v37 = 1;
    }
    else
    {
      uint64_t v37 = 0;
    }
    uint64_t v38 = [v33[11] stringWithFormat:@"Found an existing active user notification for a new financing plan dispute %@ on financing plan %@. Updating contents but not re-rolling banner.", v32, v11];
    v39 = v33;
    v40 = (void *)v38;
    v41 = [v39[11] stringWithFormat:@"Creating new notification for a new financing plan dispute %@ on financing plan %@", v32, v11];
    uint64_t v42 = [[PDAccountFinancingPlanDisputeUpdateNotification alloc] initWithFinancingPlan:v8 dispute:v31 type:v37 passUniqueIdentifier:v84];
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v42 updateLogLine:v40 addLogLine:v41];
  }
  v75 = v31;
  id v43 = [v83 mutableCopy];
  [v43 intersectSet:v82];
  id v44 = objc_alloc_init((Class)NSMutableArray);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v43;
  id v45 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v92;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v92 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void *)(*((void *)&v91 + 1) + 8 * (void)j);
        uint64_t v50 = [v86 disputeWithIdentifier:v49];
        id v51 = [v50 state];
        v52 = [v9 disputeWithIdentifier:v49];
        id v53 = [v52 state];

        if (v51 != v53) {
          [v44 safelyAddObject:v50];
        }
      }
      id v46 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v46);
  }

  v54 = [v44 sortedArrayUsingComparator:&stru_10072E8C0];
  id v55 = [v54 mutableCopy];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v56 = v55;
  id v57 = [v56 countByEnumeratingWithState:&v87 objects:v103 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v88;
    do
    {
      for (k = 0; k != v58; k = (char *)k + 1)
      {
        if (*(void *)v88 != v59) {
          objc_enumerationMutation(v56);
        }
        long long v61 = [*(id *)(*((void *)&v87 + 1) + 8 * (void)k) identifier];
        long long v62 = [v9 disputeWithIdentifier:v61];

        long long v63 = +[PDAccountFinancingPlanDisputeUpdateNotification notificationIdentifierForFinancingPlan:v9 dispute:v62 type:1];
        v64 = [(PDAccountNotificationController *)self userNotificationManager];
        [v64 removeUserNotificationWithIdentifier:v63];

        v65 = +[PDAccountFinancingPlanDisputeUpdateNotification notificationIdentifierForFinancingPlan:v9 dispute:v62 type:0];

        id v66 = [(PDAccountNotificationController *)self userNotificationManager];
        [v66 removeUserNotificationWithIdentifier:v65];
      }
      id v58 = [v56 countByEnumeratingWithState:&v87 objects:v103 count:16];
    }
    while (v58);
  }

  v67 = [v56 lastObject];
  v68 = v67;
  v69 = v84;
  v70 = v86;
  if (v67)
  {
    v71 = [v67 identifier];
    v74 = +[NSString stringWithFormat:@"Found an existing active user notification for a financing plan dispute state change %@ on financing plan %@. Updating contents but not re-rolling banner.", v71, v81];
    v72 = +[NSString stringWithFormat:@"Creating new notification for a financing plan dispute state change %@ on financing plan %@", v71, v81];
    v73 = [[PDAccountFinancingPlanDisputeUpdateNotification alloc] initWithFinancingPlan:v86 dispute:v68 type:1 passUniqueIdentifier:v84];
    [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v73 updateLogLine:v74 addLogLine:v72];

    v70 = v86;
    v69 = v84;
  }
}

- (void)_queue_computeAdjustmentPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 planIdentifier];
  uint64_t v12 = [v9 associatedPassUniqueID];
  id v13 = [(PDAccountNotificationController *)self _latestNewFinancingPlanPaymentOfType:7 financingPlan:v8 oldFinancingPlan:v10];

  if (v13)
  {
    id v20 = self;
    id v14 = [v13 paymentIdentifier];
    id v15 = +[NSString stringWithFormat:@"Found an existing active user notification for a adjustment payment %@ on financing plan %@. Updating contents but not re-rolling banner.", v14, v11];
    id v16 = +[NSString stringWithFormat:@"Creating new notification for a adjustment payment %@ on financing plan %@", v14, v11];
    if (v8)
    {
      id v21 = v8;
      id v17 = +[NSArray arrayWithObjects:&v21 count:1];
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v9 financingPlans:v17];
    }
    else
    {
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v9 financingPlans:0];
    }
    v19 = [[PDAccountFinancingPlanPaymentNotification alloc] initWithFinancingPlan:v8 payment:v13 requiresGenericMessaging:v18 passUniqueIdentifier:v12];
    [(PDAccountNotificationController *)v20 _queue_addOrUpdateNotification:v19 updateLogLine:v15 addLogLine:v16];
  }
}

- (void)_queue_computeAccountStateChangeNotification:(id)a3 oldAccount:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 associatedPassUniqueID];
  id v8 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:v12 financingPlans:0];
  id v9 = [v6 state];

  if ([v12 state] != (id)1)
  {
    id v10 = [v12 state];
    if (v9 == (id)1)
    {
      if (v10)
      {
        uint64_t v11 = -[PDPassAccountStateChangeUserNotification initWithPassUniqueIdentifier:accountState:accountStateReason:accessLevel:featureIdentifier:requiresDebtCollectionNotices:]([PDPassAccountStateChangeUserNotification alloc], "initWithPassUniqueIdentifier:accountState:accountStateReason:accessLevel:featureIdentifier:requiresDebtCollectionNotices:", v7, [v12 state], objc_msgSend(v12, "stateReason"), 0, objc_msgSend(v12, "feature"), v8);
        [(PDAccountNotificationController *)self _queue_addOrUpdateNotification:v11 updateLogLine:@"Found an existing active user notification for a pay later account state change. Updating contents but not re-rolling banner." addLogLine:@"Creating new notification for a pay later account state change"];
      }
    }
  }
}

- (void)_queue_removeSummaryTimesForAccountChangedIfNecessary:(id)a3 oldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 state] != (id)3 && objc_msgSend(v7, "state") != (id)4;
  BOOL v9 = [v6 state] != (id)3 && objc_msgSend(v6, "state") != (id)4;
  id v10 = [v6 state];
  if (v10 != [v7 state] && (v8 || v9) && !v9)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing financing plan notifications because the pay later account is locked or closed", v12, 2u);
    }

    [(PDAccountNotificationController *)self _removePayLaterNotificationsForAccount:v6 removeAccountStateChangeNotification:0];
  }
}

- (id)_latestNewFinancingPlanPaymentOfType:(unint64_t)a3 financingPlan:(id)a4 oldFinancingPlan:(id)a5
{
  id v7 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002FABC;
  v24[3] = &unk_10072E920;
  v24[4] = a3;
  id v8 = a5;
  BOOL v9 = objc_retainBlock(v24);
  id v10 = ((void (*)(void *, id))v9[2])(v9, v8);

  uint64_t v11 = ((void (*)(void *, id))v9[2])(v9, v7);
  id v12 = [v11 mutableCopy];

  [v12 minusSet:v10];
  if ([v12 count])
  {
    id v13 = [v7 scheduleSummary];
    id v14 = [v13 paymentsOfType:a3];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_10002FB5C;
    uint64_t v22 = &unk_10072E948;
    id v23 = v12;
    id v15 = objc_msgSend(v14, "pk_objectsPassingTest:", &v19);

    id v16 = objc_msgSend(v15, "sortedArrayUsingComparator:", &stru_10072E988, v19, v20, v21, v22);

    id v17 = [v16 lastObject];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PDAccountNotificationController *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FCEC;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5
{
}

- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5 newNotificationSuppressionBehavior:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = [(PDAccountNotificationController *)self userNotificationManager];
    id v14 = [v10 notificationIdentifier];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002FFA4;
    v15[3] = &unk_10072EA28;
    v15[4] = self;
    id v16 = v11;
    id v17 = v10;
    id v18 = v12;
    unint64_t v19 = a6;
    [v13 userNotificationWithIdentifier:v14 completion:v15];
  }
}

- (BOOL)_didPayOffFinancingPlan:(id)a3 oldFinancingPlan:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 state];
  id v8 = [v6 state];
  BOOL v9 = [v5 disputes];

  unsigned __int8 v10 = objc_msgSend(v9, "pk_containsObjectPassingTest:", &stru_10072EA68);
  id v11 = [v6 disputes];

  unsigned int v12 = objc_msgSend(v11, "pk_containsObjectPassingTest:", &stru_10072EA88);
  if (v7 != (id)6 && v8 == (id)6 && !v12) {
    return 1;
  }
  BOOL v14 = v7 == (id)6 && v8 == (id)6;
  char v15 = v10 ^ 1;
  if (!v14) {
    char v15 = 1;
  }
  return (v15 | v12) ^ 1;
}

- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 overrideBlockNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 associatedPassUniqueID];
  unsigned int v8 = [v6 supportsShowNotifications];
  unsigned int v9 = [v6 blockNotifications];
  if (!v6)
  {
    BOOL v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      char v15 = "Skipping pay later notifications since there is no account defined";
LABEL_9:
      id v16 = v14;
      uint32_t v17 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)v19, v17);
    }
LABEL_13:

    goto LABEL_14;
  }
  unsigned int v10 = v9;
  if ([v6 feature] != (id)3)
  {
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  if ((v8 & (v10 ^ 1 | v4) & 1) == 0)
  {
    BOOL v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 67109632;
      v19[1] = v8;
      __int16 v20 = 1024;
      unsigned int v21 = v10;
      __int16 v22 = 1024;
      BOOL v23 = v4;
      char v15 = "Skipping pay later notifications for account with supportsShowNotifications: %d, blockNotifications: %d, ove"
            "rrideBlockNotifications: %d";
      id v16 = v14;
      uint32_t v17 = 20;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!v7)
  {
    BOOL v14 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v19[0]) = 0;
    char v15 = "Skipping pay later notifications for because no associatedPassUniqueID defined on the pay later account.";
    goto LABEL_9;
  }
  id v11 = [(PDAccountNotificationController *)self databaseManager];
  unsigned __int8 v12 = [v11 passExistsWithUniqueID:v7];

  if ((v12 & 1) == 0)
  {
    BOOL v14 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v19[0]) = 0;
    char v15 = "Skipping pay later notifications since the pass doesn't exist on device.";
    goto LABEL_9;
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 financingPlan:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(PDAccountNotificationController *)self _canShowPayLaterNotificationsForAccount:a3 overrideBlockNotifications:0];
  BOOL v8 = 0;
  if (v7)
  {
    if ([v6 updateReasonIsInitialDownload])
    {
      unsigned int v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = [v6 planIdentifier];
        int v12 = 138412290;
        BOOL v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping financing plan financing plan notification %@ since it was apart of initial download.", (uint8_t *)&v12, 0xCu);
      }
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (PDAccountNotificationController)initWithAccountManager:(id)a3 notificationStreamManager:(id)a4 userNotificationManager:(id)a5 databaseManager:(id)a6 paymentWebServiceCoordinator:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 familyMemberManager:(id)a9
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v16 = a8;
  id v17 = a9;
  v32.receiver = self;
  v32.super_class = (Class)PDAccountNotificationController;
  id v18 = [(PDAccountNotificationController *)&v32 init];
  unint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_webServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_userNotificationManager, a5);
    objc_storeStrong((id *)&v19->_databaseManager, a6);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a8);
    objc_storeStrong((id *)&v19->_familyMemberManager, a9);
    -[PDFamilyCircleManager addObserver:](v19->_familyMemberManager, "addObserver:", v19, v25, v26, v27, v28, v29);
    __int16 v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.accountnotificationcontroller", v20);
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v19->_accountManager, a3);
    [(PDAccountManager *)v19->_accountManager registerObserver:v19];
    objc_storeStrong((id *)&v19->_notificationStreamManager, a4);
    [(PDNotificationStreamManager *)v19->_notificationStreamManager registerConsumer:v19];
    BOOL v23 = v19->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002E866C;
    block[3] = &unk_10072E1E8;
    long long v31 = v19;
    dispatch_async(v23, block);
  }
  return v19;
}

- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (([v7 updateReasonIsInitialDownload] & 1) == 0) {
    [(PDAccountNotificationController *)self _recomputeSummaryNotificationsForTransactionSourceIdentifier:v6 withTransaction:v7];
  }
}

- (void)_resurfaceRecentNotificationsAndPromote:(BOOL)a3
{
  accountManager = self->_accountManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002E8840;
  v4[3] = &unk_100747458;
  v4[4] = self;
  BOOL v5 = a3;
  [(PDAccountManager *)accountManager accountsWithCompletion:v4];
}

- (void)_resurfaceRecentNotificationsForAccount:(id)a3 andPromote:(BOOL)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E89DC;
  block[3] = &unk_100730438;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(unint64_t)a4
{
  databaseManager = self->_databaseManager;
  id v7 = a3;
  id v13 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:v7];
  id v8 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v13];
  unsigned int v9 = [v8 paymentPass];

  id v10 = +[NSDate date];
  BOOL v11 = +[NSNumber numberWithUnsignedInteger:a4];
  int v12 = +[NSSet setWithObject:v11];
  [(PDAccountNotificationController *)self _recomputeSummaryNotificationsForAccountIdentifier:v7 paymentPass:v9 dateForSummary:v10 summaryTypes:v12 fireImmediately:1];
}

- (void)_recomputeSummaryNotificationsForTransactionSourceIdentifier:(id)a3 withTransaction:(id)a4
{
  id v5 = a4;
  id v6 = [v5 accountIdentifier];
  id v7 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:v6];
  id v8 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];
  unsigned int v9 = [v8 paymentPass];

  if (PKIsPhone() & 1) != 0 || (PKIsPad())
  {
    if (!v7) {
      goto LABEL_16;
    }
  }
  else
  {
    char v10 = PKIsVision();
    if (!v7 || (v10 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (v5 && v6 && v9)
  {
    BOOL v11 = +[NSDate date];
    int v12 = PKStartOfLastMonth();

    id v13 = [v5 transactionDate];
    if ([v13 compare:v12] == (id)-1)
    {
      char v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Outdated transaction (%@), not computing summary notifications", buf, 0xCu);
      }
    }
    else
    {
      BOOL v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10078B670, &off_10078B688, 0);
      [(PDAccountNotificationController *)self _recomputeSummaryNotificationsForAccountIdentifier:v6 paymentPass:v9 dateForSummary:v13 summaryTypes:v14 fireImmediately:0];
    }
  }
LABEL_16:
}

- (void)_recomputeSummaryNotificationsForAccountIdentifier:(id)a3 paymentPass:(id)a4 dateForSummary:(id)a5 summaryTypes:(id)a6 fireImmediately:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (![v15 count])
  {
    uint64_t v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10078B670, &off_10078B688, 0);

    id v15 = (id)v16;
  }
  id v17 = [v13 uniqueID];
  id v18 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_100020B2C;
  v46[4] = sub_100021088;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_100020B2C;
  v44[4] = sub_100021088;
  id v45 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1002E9378;
  v41[3] = &unk_100730730;
  v41[4] = self;
  id v19 = v12;
  id v42 = v19;
  id v43 = v46;
  [v18 addOperation:v41];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1002E94C0;
  v38[3] = &unk_100730730;
  v38[4] = self;
  id v20 = v19;
  id v39 = v20;
  v40 = v44;
  [v18 addOperation:v38];
  dispatch_queue_t v21 = +[NSNull null];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002E9620;
  v28[3] = &unk_100747548;
  id v35 = v46;
  id v22 = v17;
  id v29 = v22;
  id v23 = v13;
  v36 = v44;
  id v30 = v23;
  long long v31 = self;
  id v24 = v20;
  id v32 = v24;
  id v25 = v15;
  id v33 = v25;
  id v26 = v14;
  id v34 = v26;
  BOOL v37 = a7;
  id v27 = [v18 evaluateWithInput:v21 completion:v28];

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
}

- (id)createCurrentNotificationRegistrationState
{
  v3 = objc_alloc_init(PDNotificationStreamRegistrationState);
  if (self->_hasAccounts)
  {
    BOOL v4 = +[NSSet setWithObject:PDDarwinNotificationEventSignificantTimeChanged];
    [(PDNotificationStreamRegistrationState *)v3 setNotificationNames:v4 forStream:0];
  }
  return v3;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  +[NSTimeZone resetSystemTimeZone];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EA3CC;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EA728;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 updateReasonIsInitialDownload] & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EA804;
    block[3] = &unk_10072E238;
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(workQueue, block);
  }
}

- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EA954;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didRemoveAccountEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EAAF8;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002EAC70;
  v16[3] = &unk_100730198;
  id v17 = v9;
  id v18 = self;
  id v19 = v11;
  id v20 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(workQueue, v16);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EB028;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EB110;
  block[3] = &unk_10072E238;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:v5];
  if (v6)
  {
    accountManager = self->_accountManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002EBA8C;
    v8[3] = &unk_10072E728;
    v8[4] = self;
    id v9 = v5;
    id v10 = v6;
    [(PDAccountManager *)accountManager accountWithIdentifier:v9 completion:v8];
  }
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EBC30;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didSetScheduledPayments:(id)a4 forAccountIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EBF64;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didUpdatePaymentFundingSources:(id)a4 accountIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  accountManager = self->_accountManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002EC0DC;
  v12[3] = &unk_100733420;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  [(PDAccountManager *)accountManager accountsWithCompletion:v12];
}

- (void)_updateInstallmentNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5
{
  id v7 = a3;
  id v60 = a4;
  id v59 = a5;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v55 = v7;
  id v9 = [v7 creditDetails];
  id v10 = [v9 installmentPlans];

  id v11 = [v10 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v70;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v70 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v12);
  }

  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v18 = [v60 creditDetails];
  id v19 = [v18 installmentPlans];

  id v20 = [v19 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v66;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v66 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        id v25 = [v24 identifier];
        [v17 setObject:v24 forKeyedSubscript:v25];
      }
      id v21 = [v19 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v21);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v54 = v17;
  id obj = [v17 allValues];
  id v26 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v62;
    uint64_t v56 = *(void *)v62;
    do
    {
      id v29 = 0;
      do
      {
        if (*(void *)v62 != v28) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v29);
        id v31 = [v30 state];
        id v32 = [v30 identifier];
        id v33 = [v8 objectForKeyedSubscript:v32];

        if (!v33)
        {
          id v35 = [[PDInstallmentAddedUserNotification alloc] initWithAccount:v60 installmentPlan:v30 passUniqueIdentifier:v59];
          [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v35];
          id v42 = PKSharedCacheGetDateForKey();
          databaseManager = self->_databaseManager;
          id v44 = [v60 accountIdentifier];
          id v45 = [(PDDatabaseManager *)databaseManager physicalCardsForAccountWithIdentifier:v44];

          if (v42)
          {
            [v42 timeIntervalSinceNow];
            double v47 = v46;
            [v42 timeIntervalSinceNow];
            if (v47 < 0.0) {
              double v48 = -v48;
            }
            if (v48 <= 3600.0 && ![v45 count])
            {
              uint64_t v49 = [PDWalletUserNotification alloc];
              [v60 feature];
              uint64_t v50 = PKLocalizedFeatureString();
              [v60 feature];
              id v51 = PKLocalizedFeatureString();
              v52 = [(PDGenericUserNotification *)v49 initWithTitle:v50 message:v51 forPassUniqueIdentifier:v59];

              [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v52];
              PKSharedCacheRemoveObjectForKey();
            }
          }

          uint64_t v28 = v56;
          goto LABEL_33;
        }
        if (v31 == (id)2)
        {
          id v34 = [v30 payments];
          id v35 = [v34 firstObject];

          v36 = [v33 payments];
          BOOL v37 = [v36 firstObject];

          uint64_t v38 = [(PDInstallmentAddedUserNotification *)v35 statement];
          if (v38)
          {
            id v39 = [v37 statementIdentifier];

            if (!v39)
            {
              v40 = [[PDInstallmentStateUserNotification alloc] initWithAccount:v60 installmentPlan:v30 passUniqueIdentifier:v59];
              v41 = [v38 closingDate];
              [(PDInstallmentStateUserNotification *)v40 setStatementClosingDate:v41];

              uint64_t v28 = v56;
              [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v40];
            }
          }

          goto LABEL_33;
        }
        if ([v33 state] != v31 && (char *)objc_msgSend(v30, "state") - 3 <= (char *)1)
        {
          id v35 = [[PDInstallmentStateUserNotification alloc] initWithAccount:v60 installmentPlan:v30 passUniqueIdentifier:v59];
          [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v35];
LABEL_33:
        }
        id v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      id v53 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
      id v27 = v53;
    }
    while (v53);
  }
}

- (void)_updatePastDueNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5 enrolledInRecoveryPaymentPlan:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002EC908;
  v14[3] = &unk_1007306E0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  BOOL v17 = a6;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(workQueue, v14);
}

- (void)_recomputePaymentNotificationsForScheduledPayments:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002ECD34;
  block[3] = &unk_10072E238;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (id)_upcomingScheduledPaymentNotificationsForPayment:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [[PDAccountPaymentScheduledUserNotification alloc] initWithAccount:v5 payment:v6 reminderOffset:1];
  if ([(PDAccountPaymentScheduledUserNotification *)v8 isValid]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  [v7 safelyAddObject:v9];
  id v10 = [[PDAccountPaymentScheduledUserNotification alloc] initWithAccount:v5 payment:v6 reminderOffset:0];

  if ([(PDAccountPaymentScheduledUserNotification *)v10 isValid]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  [v7 safelyAddObject:v11];
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Evaluation resulted in 'Payment Reminder' notifications: %@", (uint8_t *)&v15, 0xCu);
  }

  id v13 = [v7 copy];
  return v13;
}

- (id)_paymentDueNotificationsForAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [[PDAccountPaymentDueUserNotification alloc] initWithAccount:v6 estimatedRemainingMinimumPayment:v5 reminderOffset:2];
  if ([(PDAccountPaymentDueUserNotification *)v8 isValid]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  [v7 safelyAddObject:v9];
  id v10 = [[PDAccountPaymentDueUserNotification alloc] initWithAccount:v6 estimatedRemainingMinimumPayment:v5 reminderOffset:1];

  if ([(PDAccountPaymentDueUserNotification *)v10 isValid]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  [v7 safelyAddObject:v11];
  id v12 = [[PDAccountPaymentDueUserNotification alloc] initWithAccount:v6 estimatedRemainingMinimumPayment:v5 reminderOffset:0];

  if ([(PDAccountPaymentDueUserNotification *)v12 isValid]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  [v7 safelyAddObject:v13];
  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Evaluation resulted in 'Payment Due' notifications: %@", (uint8_t *)&v17, 0xCu);
  }

  id v15 = [v7 copy];
  return v15;
}

- (void)_notificationForAccountEvent:(id)a3 withManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && ([v8 updateReasonIsInitialDownload] & 1) == 0)
  {
    id v11 = [v8 accountIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002EE344;
    v12[3] = &unk_100742528;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v10;
    [v9 accountWithIdentifier:v11 completion:v12];
  }
}

- (id)_notificationForAccountEvent:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseManager = self->_databaseManager;
  id v9 = [v7 accountIdentifier];
  id v10 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:v9];

  if (v10)
  {
    id v11 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v10];
    id v12 = [v11 anyObject];

    id v13 = [PDPassAccountEventUserNotification alloc];
    id v14 = [v7 feature];
    id v15 = [v7 creditDetails];
    id v16 = [v15 accountSummary];
    int v17 = -[PDPassAccountEventUserNotification initWithPassUniqueIdentifier:transactionSourceIdentifier:accountEvent:featureIdentifier:requiresDebtCollectionNotices:](v13, "initWithPassUniqueIdentifier:transactionSourceIdentifier:accountEvent:featureIdentifier:requiresDebtCollectionNotices:", v10, v12, v6, v14, [v16 requiresDebtCollectionNotices]);
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

- (void)updateDailyCashNotificationsWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(PDDatabaseManager *)self->_databaseManager peerPaymentAccount];
  id v6 = [v5 associatedPassUniqueID];

  if (v6
    && [(PDDatabaseManager *)self->_databaseManager settingEnabled:1024 forPassWithUniqueIdentifier:v6])
  {
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v6 ofType:23];
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v6 ofType:42];
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v6 ofType:43];
  }
  else if (v4 {
         && (![v4 supportsShowNotifications]
  }
          || [v4 blockNotifications]))
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 accountIdentifier];
      if ([v4 supportsShowNotifications]) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      if ([v4 blockNotifications]) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      id v14 = v8;
      __int16 v15 = 2112;
      CFStringRef v16 = v9;
      __int16 v17 = 2112;
      CFStringRef v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Suppressing daily Daily Cash notifications for account with identifier %@. supportsShowNotifications: %@ blockNotifications: %@", buf, 0x20u);
    }
  }
  else
  {
    accountManager = self->_accountManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002EEA74;
    v12[3] = &unk_10072F200;
    void v12[4] = self;
    [(PDAccountManager *)accountManager defaultAccountForFeature:2 completion:v12];
  }
}

- (void)updateDailyCashNotificationsForAccountIdentifier:(id)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringRef v10 = (void (**)(void))a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100020B2C;
  id v30 = sub_100021088;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSDate date];
  }
  id v31 = v11;
  id v12 = +[NSCalendar currentCalendar];
  if (([v12 isDateInToday:v27[5]] & 1) != 0
    || ([v12 isDateInTomorrow:v27[5]] & 1) != 0)
  {
    id v13 = [v12 dateByAddingUnit:16 value:-1 toDate:v27[5] options:0];
    id v14 = +[PDPassPaymentDailyDailyCashUserNotification notificationIdentifierForDate:v27[5]];
    __int16 v15 = +[PDPassPaymentDailyDailyCashUserNotification notificationIdentifierForDate:v13];
    userNotificationManager = self->_userNotificationManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    _DWORD v19[2] = sub_1002EEDDC;
    v19[3] = &unk_1007477E8;
    v19[4] = self;
    id v17 = v15;
    id v20 = v17;
    id v25 = &v26;
    id v21 = v12;
    id v18 = v13;
    id v22 = v18;
    id v23 = v8;
    id v24 = v10;
    [(PDUserNotificationManager *)userNotificationManager userNotificationWithIdentifier:v14 completion:v19];
  }
  else if (v10)
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v26, 8);
}

- (void)_updateAccountUserMonthlySpendLimitNotificationsForOldAccount:(id)a3 newAccount:(id)a4 accountUserCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((PKIsMac() & 1) == 0 && [v9 accessLevel] != (id)2)
  {
    userNotificationManager = self->_userNotificationManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002EF78C;
    v12[3] = &unk_10072F3F0;
    void v12[4] = self;
    id v13 = v10;
    id v14 = v9;
    id v15 = v8;
    [(PDUserNotificationManager *)userNotificationManager userNotificationsOfType:37 completion:v12];
  }
}

- (void)_updateAccountUserIdentityStatusNotificationsWithAccount:(id)a3 accountUserCollection:(id)a4 oldAccountUserCollection:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  [v13 state];
  if ((PKAccountStateIsTerminal() & 1) == 0)
  {
    id v10 = [v8 currentAccountUser];
    id v11 = [v9 currentAccountUser];
    [v10 accountState];
    if ((PKAccountStateIsTerminal() & 1) == 0
      && [v11 identityStatus] == (id)3
      && [v10 identityStatus] == (id)2)
    {
      id v12 = [[PDAccountFailedIdentityVerificationUserNotification alloc] initWithAccount:v13 accountUser:v10];
      [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v12];
    }
  }
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
    v7[2] = sub_1002F018C;
    v7[3] = &unk_1007346F0;
    void v7[4] = self;
    id v8 = v4;
    [(PDFamilyCircleManager *)familyMemberManager familyMembersWithCachePolicy:0 completion:v7];
  }
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_familyMemberManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
}

- (void)updatedSavingsAccount:(id)a3 oldAccount:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 blockNotifications];
  [(PDAccountNotificationController *)self _updateAccountStateNotificationForNewAccount:v8 oldAccount:v6];
  [(PDAccountNotificationController *)self _updateAccountAPYMessageForNewAccount:v8 oldAccount:v6 blockNotifications:v7];
  if ((v7 & 1) == 0) {
    [(PDAccountNotificationController *)self _updateAccountBalanceNotificationForNewAccount:v8 oldAccount:v6];
  }
  [(PDAccountNotificationController *)self _updateCanShowFixRewardsMessageForNewAccount:v8 oldAccount:v6];
  [(PDAccountNotificationController *)self _updateFCCStepUpMessageForNewAccount:v8 oldAccount:v6];
}

- (void)updatedFundingSources:(id)a3 forSavingsAccount:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reconciling updated funding sources with verification notifications", buf, 2u);
  }

  id v7 = objc_msgSend(v5, "pk_objectsPassingTest:", &stru_100756428);

  id v27 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &stru_100756468);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v15 = [v14 fundingDetails];
        CFStringRef v16 = [v15 verificationDetails];
        id v17 = [v16 pendingAttempt];
        id v18 = [v17 sentDate];

        id v19 = PKShortDayAndMonthStringFromDate();
        id v20 = [v8 objectForKey:v19];
        if (!v20)
        {
          id v20 = objc_alloc_init((Class)NSMutableArray);
          [v8 setObject:v20 forKey:v19];
        }
        [v20 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  id v21 = [v28 accountIdentifier];
  [(PDAccountNotificationController *)self userNotificationManager];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1004BE250;
  v30[3] = &unk_1007565D8;
  id v31 = v21;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v27;
  id v34 = v8;
  id v35 = v28;
  v36 = self;
  id v22 = v28;
  id v23 = v8;
  id v24 = v27;
  id v25 = v32;
  id v26 = v21;
  [(PDAccountNotificationController *)self _scheduledAndDeliveredUserNotificationsOfType:78 completion:v30];
}

- (void)removeSavingsNotificationsForAccount:(id)a3
{
  id v8 = [a3 accountIdentifier];
  id v4 = [(PDAccountNotificationController *)self userNotificationManager];
  id v5 = +[PDAccountAPYUpdateUserNotification notificationIdentifierForAccountIdentifier:v8];
  [v4 removeUserNotificationWithIdentifier:v5];

  id v6 = +[PDAccountOverdrawnBalanceUserNotification notificationIdentifierForAccountIdentifier:v8];
  [v4 removeUserNotificationWithIdentifier:v6];

  id v7 = +[PDAccountFCCStepUpThresholdExceededUserNotification notificationIdentifierForAccountIdentifier:v8];
  [v4 removeUserNotificationWithIdentifier:v7];

  [v4 removeUserNotificationsOfType:78];
}

- (void)_updateAccountStateNotificationForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v16 state];
  id v8 = [v6 state];

  id v10 = v16;
  if (v7 != v8)
  {
    id v9 = [v16 state];
    id v10 = v16;
    if ((unint64_t)v9 >= 2 && v9 != (id)5)
    {
      if (v9 == (id)4)
      {
        id v11 = [PDPassAccountStateChangeUserNotification alloc];
        int v12 = 0;
        id v13 = 0;
      }
      else
      {
        id v11 = [PDPassAccountStateChangeUserNotification alloc];
        id v13 = [v16 accountIdentifier];
        int v12 = 1;
      }
      id v14 = -[PDPassAccountStateChangeUserNotification initWithAccountIdentifier:accountState:accountStateReason:featureIdentifier:](v11, "initWithAccountIdentifier:accountState:accountStateReason:featureIdentifier:", v13, [v16 state], objc_msgSend(v16, "stateReason"), objc_msgSend(v16, "feature"));
      if (v12) {

      }
      [(PDUserNotification *)v14 setReissueBannerOnUpdate:1];
      id v15 = [(PDAccountNotificationController *)self userNotificationManager];
      [v15 insertUserNotification:v14];

      id v10 = v16;
    }
  }
  _objc_release_x1(v9, v10);
}

- (void)_updateAccountAPYMessageForNewAccount:(id)a3 oldAccount:(id)a4 blockNotifications:(BOOL)a5
{
  id v24 = a3;
  id v8 = [a4 savingsDetails];
  id v9 = [v8 accountSummary];

  id v10 = [v24 savingsDetails];
  id v11 = [v10 accountSummary];

  int v12 = [v9 apy];
  id v13 = [v11 apy];
  if ((objc_msgSend(v13, "pk_isNotANumber") & 1) == 0
    && (objc_msgSend(v12, "pk_isNotANumber") & 1) == 0)
  {
    id v14 = [v9 formattedAPY];
    id v15 = [v11 formattedAPY];
    id v16 = v14;
    id v17 = v15;
    if (v16 == v17)
    {

      goto LABEL_14;
    }
    id v18 = v17;
    if (v16 && v17)
    {
      unsigned __int8 v19 = [v16 isEqualToString:v17];

      if (v19) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v20 = [v24 accountIdentifier];
    char v21 = PKHasDisabledAPYUpdateNotificationsForAccountIdentifier();

    if ((v21 & 1) == 0 && !a5)
    {
      id v22 = [[PDAccountAPYUpdateUserNotification alloc] initWithAccount:v24];
      id v23 = [(PDAccountNotificationController *)self userNotificationManager];
      [v23 insertUserNotification:v22];
    }
    PKSavingsSetPreviousAPYForUpdateMessage();
  }
LABEL_14:
}

- (void)_updateAccountBalanceNotificationForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [v17 savingsDetails];
  id v8 = [v7 accountSummary];
  id v9 = [v8 currentBalance];

  id v10 = [v6 savingsDetails];

  id v11 = [v10 accountSummary];
  int v12 = [v11 currentBalance];

  id v13 = +[NSDecimalNumber zero];
  if ([v12 compare:v13] != (id)-1)
  {
    id v14 = +[NSDecimalNumber zero];
    id v15 = [v9 compare:v14];

    if (v15 != (id)-1) {
      goto LABEL_5;
    }
    id v13 = [[PDAccountOverdrawnBalanceUserNotification alloc] initWithAccount:v17];
    id v16 = [(PDAccountNotificationController *)self userNotificationManager];
    [v16 insertUserNotification:v13];
  }
LABEL_5:
}

- (void)_updateCanShowFixRewardsMessageForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v5 = a3;
  id v6 = [a4 state];
  id v7 = [v5 state];

  if (v6 != (id)1 && v7 == (id)1)
  {
    PKSavingsSetHasDismissedFixRewardsMessage();
  }
}

- (void)_updateFCCStepUpMessageForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v11 = a3;
  int IsThresholdExceededActive = PKSavingsAccountIsThresholdExceededActive();
  int v6 = PKSavingsAccountIsThresholdExceededActive();
  if ((IsThresholdExceededActive & 1) != 0 || !v6)
  {
    if ((IsThresholdExceededActive ^ 1 | v6)) {
      goto LABEL_7;
    }
    id v7 = [v11 accountIdentifier];
    id v8 = [(PDAccountNotificationController *)self userNotificationManager];
    id v9 = +[PDAccountFCCStepUpThresholdExceededUserNotification notificationIdentifierForAccountIdentifier:v7];
    [v8 removeUserNotificationWithIdentifier:v9];
  }
  else
  {
    id v7 = [[PDAccountFCCStepUpThresholdExceededUserNotification alloc] initWithAccount:v11];
    id v8 = [(PDAccountNotificationController *)self userNotificationManager];
    [v8 insertUserNotification:v7];
  }

  id v10 = [(PDAccountNotificationController *)self userNotificationManager];
  [v10 updateWalletBadgeCount];

LABEL_7:
}

- (void)_updateBankVerificationExpirationDismissalsForFundingSources:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 fundingDetails];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v11 = [v8 fundingDetails];
          int v12 = [v8 identifier];
          if (PKSavingsHasDismissedBankVerificationExpirationMessage())
          {
            id v13 = [v11 verificationDetails];
            id v14 = [v13 pendingAttempt];

            if (v14) {
              PKSetSavingsHasDismissedBankVerificationExpirationMessage();
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)_scheduledAndDeliveredUserNotificationsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PDAccountNotificationController *)self userNotificationManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004BF954;
  v9[3] = &unk_1007422A8;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 userNotificationsOfType:a3 completion:v9];
}

- (void)_scheduledAndDeliveredUserNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDAccountNotificationController *)self userNotificationManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004BFAE4;
  v11[3] = &unk_100756600;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 userNotificationWithIdentifier:v9 completion:v11];
}

@end