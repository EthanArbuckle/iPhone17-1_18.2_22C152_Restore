@interface NPDCompanionAgentClient
- (BOOL)_isGizmoConnected;
- (BOOL)_isPassQualifiedToBeDefaultWithUniqueID:(id)a3;
- (NPDCompanionAgentClientDataSource)dataSource;
- (NPDCompanionAgentClientDelegate)delegate;
- (id)_commutePlanReminderIdentifierWithCommutePlan:(id)a3 pass:(id)a4;
- (id)_defaultCard;
- (id)paymentPassWithUniqueID:(id)a3;
- (void)_applyIngestionDateToPass:(id)a3;
- (void)_invalidateWatchOfferTimer;
- (void)_invokeWatchOfferProvisioningCompletionHandlersWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_removePendingAppleCardNotification;
- (void)_selectNewDefaultCardForUserAfterDeletionOfDefaultCardWithUniqueID:(id)a3;
- (void)_setOrResetWatchOfferTimerForProvisioningURL:(id)a3;
- (void)_updateLocalBalanceReminderForBalance:(id)a3 pass:(id)a4;
- (void)_updateLocalCommutePlanReminderForCommutePlan:(id)a3 pass:(id)a4;
- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)beginProvisioningFromWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4;
- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)countOfPassesWithCompletion:(id)a3;
- (void)credentialedPassUniqueIDsWithReply:(id)a3;
- (void)defaultCard:(id)a3;
- (void)defaultPaymentApplicationForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)deletePaymentTransactionWithIdentifier:(id)a3 fromDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)deviceIDSIdentifierWithCompletion:(id)a3;
- (void)expressModeEnabledForPassIdentifier:(id)a3 completion:(id)a4;
- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)handleDeviceUnlockedForPendingProvisioningRequestFromGizmo;
- (void)handlePeerPaymentTermsAndConditionsRequestFromGizmo;
- (void)handlePendingUnpairingWithCompletion:(id)a3;
- (void)handlePendingiCloudSignoutWithCompletion:(id)a3;
- (void)handleProvisioningErrorForAccountIdentifier:(id)a3 error:(id)a4;
- (void)hasActiveExternallySharedPassesWithCompletion:(id)a3;
- (void)initiateConsistencyCheckWithCompletion:(id)a3;
- (void)initiateLostModeExitAuthWithCompletion:(id)a3;
- (void)isIssuerAppProvisioningSupported:(id)a3;
- (void)markAllAppletsForDeletionWithCompletion:(id)a3;
- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3;
- (void)noteForegroundVerificationObserverActive:(BOOL)a3;
- (void)noteProvisioningPreflightCompleteWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5;
- (void)noteWatchOfferDisplayedForPaymentPassWithUniqueID:(id)a3;
- (void)passesWithCompletion:(id)a3;
- (void)paymentPassUniqueIDsExcludingDeactivated:(BOOL)a3 reply:(id)a4;
- (void)paymentPassWithDeviceAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentPassWithPairedTerminalIdentifier:(id)a3 completion:(id)a4;
- (void)paymentPassWithUniqueID:(id)a3 reply:(id)a4;
- (void)paymentPassesWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4;
- (void)peerPaymentAccountForPairingID:(id)a3 withCompletion:(id)a4;
- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 completion:(id)a6;
- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5;
- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5;
- (void)redownloadAllPaymentPassesWithCompletion:(id)a3;
- (void)registerDeviceWithCompletion:(id)a3;
- (void)removePaymentPassWithUniqueID:(id)a3 forPairingID:(id)a4 waitForConfirmation:(BOOL)a5 completion:(id)a6;
- (void)savePaymentPassData:(id)a3 withUniqueID:(id)a4 forPairingID:(id)a5 completion:(id)a6;
- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setDataSource:(id)a3;
- (void)setDefaultCard:(id)a3 completion:(id)a4;
- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPeerPaymentAccount:(id)a3 forPairingID:(id)a4 completion:(id)a5;
- (void)setSharedPaymentWebServiceContext:(id)a3 forPairingID:(id)a4 completion:(id)a5;
- (void)setSharedPeerPaymentWebServiceContext:(id)a3 forPairingID:(id)a4 completion:(id)a5;
- (void)sharedPaymentWebServiceContextForPairingID:(id)a3 withCompletion:(id)a4;
- (void)sharedPeerPaymentWebServiceContextForPairingID:(id)a3 withCompletion:(id)a4;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
- (void)trustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5;
- (void)updateCredentials:(id)a3 forUniqueID:(id)a4 completion:(id)a5;
- (void)updateSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation NPDCompanionAgentClient

- (void)noteWatchOfferDisplayedForPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Note watch offer displayed for pass with unique ID %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8 = [(NPDCompanionAgentClient *)self dataSource];
  v9 = [v8 bulletinScheduler];
  [v9 noteOfferDisplayedForCompanionPaymentPassWithUniqueID:v4];
}

- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = +[NPKOSTransaction transactionWithName:@"Provision pass for account identifier"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024FD4;
  block[3] = &unk_10006CFC0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100024FDC;
  v20 = &unk_10006DDB8;
  id v21 = v8;
  v22 = self;
  BOOL v25 = v6;
  id v23 = v10;
  id v24 = v9;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = objc_retainBlock(&v17);
  v15 = [(NPDCompanionAgentClient *)self dataSource];
  v16 = [v15 remoteAdminConnectionServiceAgent];
  [v16 provisionPassForAccountIdentifier:v13 makeDefault:v6 completion:v14];
}

- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: (apple-balance-pass-provisioning) Client. provisionPassForRemoteCredentialWithTypeAndIdentifier", v15, 2u);
    }
  }
  id v13 = [(NPDCompanionAgentClient *)self dataSource];
  v14 = [v13 remoteAdminConnectionServiceAgent];
  [v14 provisionPassForRemoteCredentialWithType:a3 andIdentifier:v9 completion:v8];
}

- (void)handleDeviceUnlockedForPendingProvisioningRequestFromGizmo
{
  v3 = [(NPDCompanionAgentClient *)self dataSource];
  id v4 = [v3 npsDomainAccessor];
  uint64_t v5 = NPKProvisionAccountPassOnUnlock;
  BOOL v6 = [v4 objectForKey:NPKProvisionAccountPassOnUnlock];

  v7 = [v6 objectForKey:@"accountIdentifier"];
  id v8 = [v6 objectForKey:@"makeDefault"];
  unsigned int v9 = [v8 BOOLValue];

  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v9) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v46 = v7;
      __int16 v47 = 2112;
      CFStringRef v48 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) handleDeviceUnlockedForPendingProvisioningRequestFromGizmo accountIdentifier %@ makeDefault %@", buf, 0x16u);
    }
  }
  if (v7)
  {
    unsigned int v37 = v9;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v14 = +[PKPassLibrary sharedInstance];
    v15 = [v14 passesOfType:1];

    id v16 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v40 + 1) + 8 * i) secureElementPass];
          id v21 = [v20 associatedAccountServiceAccountIdentifier];

          if (v21 && [v21 isEqualToString:v7])
          {

            v34 = pk_Payment_log();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

            if (v35)
            {
              v36 = pk_Payment_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v7;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) companion still has pass for accountIdentifier %@ will attempt reprovision", buf, 0xCu);
              }
            }
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_100025BB0;
            v38[3] = &unk_10006DDE0;
            id v39 = v7;
            [(NPDCompanionAgentClient *)self provisionPassForAccountIdentifier:v39 makeDefault:v37 completion:v38];
            v30 = v39;
            goto LABEL_27;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    v22 = pk_Payment_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      id v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v7;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) companion no longer has pass for accountIdentifier %@ will not reprovision", buf, 0xCu);
      }
    }
    BOOL v25 = [(NPDCompanionAgentClient *)self dataSource];
    v26 = [v25 npsDomainAccessor];
    [v26 removeObjectForKey:v5];

    v27 = [(NPDCompanionAgentClient *)self dataSource];
    v28 = [v27 npsDomainAccessor];
    id v29 = [v28 synchronize];

    v30 = [(NPDCompanionAgentClient *)self dataSource];
    v31 = [v30 npsManager];
    uint64_t v32 = NPKDefaultsDomain;
    v33 = +[NSSet setWithObject:v5];
    [v31 synchronizeNanoDomain:v32 keys:v33];

LABEL_27:
  }
}

- (void)handleProvisioningErrorForAccountIdentifier:(id)a3 error:(id)a4
{
  id v5 = a3;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) handleProvisioningErrorForAccountIdentifier %@", buf, 0xCu);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned int v9 = +[PKPassLibrary sharedInstance];
  int v10 = [v9 passesOfType:1];

  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v15 = [v14 secureElementPass];
        id v16 = [v15 associatedAccountServiceAccountIdentifier];

        if (v16 && [v16 isEqualToString:v5])
        {
          id v11 = v14;

          goto LABEL_16;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  id v17 = +[NSURL URLWithString:@"bridge:root=com.apple.NanoPassbookBridgeSettings&action=ACCOUNT_PASS_REPROVISION"];
  uint64_t v18 = [v11 paymentPass];

  if (v18)
  {
    v19 = [v11 paymentPass];
    BOOL v35 = v19;
    v20 = +[NSArray arrayWithObjects:&v35 count:1];
    uint64_t v21 = +[NPKCompanionAgentConnection watchProvisioningURLForPaymentPasses:v20];

    id v17 = (void *)v21;
  }
  v22 = pk_Payment_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    id v24 = pk_Payment_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) posting alert to inform user with URL %@", buf, 0xCu);
    }
  }
  BOOL v25 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"ACCOUNTPASS_PROVISIONING_ERROR" value:&stru_10006EFD0 table:@"AccountPass"];

  v27 = [(NPDCompanionAgentClient *)self dataSource];
  v28 = [v27 bulletinManager];
  id v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"ACCOUNTPASS_PRODUCT_NAME" value:&stru_10006EFD0 table:@"AccountPass"];
  [v28 insertBridgeBulletinWithTitle:v30 message:v26 actionURL:v17 delay:180.0];
}

- (void)beginProvisioningFromWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  if ([v6 count])
  {
    id v8 = [(NPDCompanionAgentClient *)self dataSource];
    unsigned int v9 = [v8 paymentWebService];
    int v10 = [v9 targetDevice];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v10 currentPassbookState], PKPassbookIsCurrentlyDeletedByUser()))
    {
      id v11 = PKDisplayableErrorForCommonType();
      uint64_t v12 = pk_Payment_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Attempt to provision passes to Watch denied. NanoPassbook not installed in Watch. Returning error: %@", buf, 0xCu);
        }
      }
      v7[2](v7, 0, v11);
    }
    else
    {
      v15 = +[NPKCompanionAgentConnection watchProvisioningURLForPaymentPasses:v6];
      id v11 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
      v22[0] = FBSOpenApplicationOptionKeyActivateSuspended;
      v22[1] = FBSOpenApplicationOptionKeyIsSensitiveURL;
      v23[0] = &__kCFBooleanTrue;
      v23[1] = &__kCFBooleanTrue;
      v22[2] = FBSOpenApplicationOptionKeyPayloadURL;
      v23[2] = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
      id v17 = +[FBSOpenApplicationOptions optionsWithDictionary:v16];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100026380;
      v19[3] = &unk_10006DE08;
      id v20 = v15;
      uint64_t v21 = v7;
      v19[4] = self;
      id v18 = v15;
      [v11 openApplication:@"com.apple.Bridge" withOptions:v17 completion:v19];
    }
    goto LABEL_13;
  }
  if (v7)
  {
    int v10 = PKDisplayableErrorForCommonType();
    v7[2](v7, 0, v10);
LABEL_13:
  }
}

- (void)_setOrResetWatchOfferTimerForProvisioningURL:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Setting or resetting watch offer timer", (uint8_t *)buf, 2u);
    }
  }
  [(NPDCompanionAgentClient *)self _invalidateWatchOfferTimer];
  id v8 = dispatch_get_global_queue(0, 0);
  unsigned int v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026630;
  v14[3] = &unk_10006D280;
  objc_copyWeak(&v16, buf);
  id v15 = v4;
  id v11 = v4;
  dispatch_source_set_event_handler(v9, v14);
  watchOfferTimeoutTimer = self->_watchOfferTimeoutTimer;
  self->_watchOfferTimeoutTimer = (OS_dispatch_source *)v9;
  BOOL v13 = v9;

  dispatch_resume(v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

- (void)_invalidateWatchOfferTimer
{
  if (self->_watchOfferTimeoutTimer)
  {
    v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Invalidating watch offer timer", v7, 2u);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_watchOfferTimeoutTimer);
    watchOfferTimeoutTimer = self->_watchOfferTimeoutTimer;
    self->_watchOfferTimeoutTimer = 0;
  }
}

- (void)noteProvisioningPreflightCompleteWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  unsigned int v9 = (void (**)(void))a5;
  dispatch_time_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Note provisioning preflight completed with success %d (error %@)", (uint8_t *)v13, 0x12u);
    }
  }
  [(NPDCompanionAgentClient *)self _invalidateWatchOfferTimer];
  [(NPDCompanionAgentClient *)self _invokeWatchOfferProvisioningCompletionHandlersWithSuccess:v6 error:v8];
  if (v9) {
    v9[2](v9);
  }
}

- (void)_invokeWatchOfferProvisioningCompletionHandlersWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(NPDCompanionAgentClient *)self dataSource];
  id v8 = [v7 watchOfferProvisioningCompletionHandlers];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  __int16 v14 = sub_100026BC4;
  id v15 = &unk_10006DE58;
  BOOL v17 = a3;
  id v16 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:&v12];

  dispatch_time_t v10 = [(NPDCompanionAgentClient *)self dataSource];
  BOOL v11 = [v10 watchOfferProvisioningCompletionHandlers];
  [v11 removeAllObjects];
}

- (void)registerDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: calling registerDeviceWithCompletion", buf, 2u);
    }
  }
  id v8 = [(NPDCompanionAgentClient *)self dataSource];
  id v9 = [v8 paymentWebService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026D08;
  v11[3] = &unk_10006DE80;
  id v12 = v4;
  id v10 = v4;
  [v9 registerDeviceWithCompletion:v11];
}

- (void)paymentPassUniqueIDsExcludingDeactivated:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, id))a4;
  BOOL v7 = [(NPDCompanionAgentClient *)self dataSource];
  id v8 = [v7 companionPaymentPassDatabase];
  id v9 = [v8 uniqueIDs];

  id v10 = [v9 mutableCopy];
  if (v4)
  {
    BOOL v25 = v9;
    v26 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          BOOL v17 = -[NPDCompanionAgentClient paymentPassWithUniqueID:](self, "paymentPassWithUniqueID:", v16, v25, v26);
          id v18 = [v17 activationState];

          if (v18 == (id)4)
          {
            [v10 removeObject:v16];
            v19 = pk_Payment_log();
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

            if (v20)
            {
              uint64_t v21 = pk_Payment_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v32 = v16;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Notice: Removing ID %@ from set of uniqueIDs to return because it is deactivated", buf, 0xCu);
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v13);
    }

    id v9 = v25;
    BOOL v6 = v26;
  }
  v22 = pk_Payment_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    id v24 = pk_Payment_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Notice: Request for payment pass unique IDs (returning %@)", buf, 0xCu);
    }
  }
  v6[2](v6, v10);
}

- (void)paymentPassWithUniqueID:(id)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = [(NPDCompanionAgentClient *)self paymentPassWithUniqueID:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (id)paymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPDCompanionAgentClient *)self dataSource];
  BOOL v6 = [v5 companionPaymentPassDatabase];
  id v7 = [v6 paymentPassWithUniqueID:v4];

  id v8 = NPKPairedDeviceSecureElementIdentifiers();
  if ([v8 count]) {
    NPKIdentifyDevicePaymentApplicationsForPass();
  }
  id v9 = +[NPKGizmoDatabase sharedDatabase];
  id v10 = [v7 uniqueID];
  id v11 = [v9 transitAppletStateForPassWithUniqueID:v10];

  NPKUpdateTransitPassPropertiesForPass();
  id v12 = +[NPKGizmoDatabase sharedDatabase];
  id v13 = [v7 uniqueID];
  uint64_t v14 = [v12 transactionSourceIdentifierForPassWithUniqueID:v13];

  id v38 = (void *)v14;
  NPKUpdateTransactionSourceIdentifierForPass();
  [(NPDCompanionAgentClient *)self _applyIngestionDateToPass:v7];
  id v15 = +[NPKGizmoDatabase sharedDatabase];
  id v16 = [v15 passForUniqueID:v4 includeImageSets:0];

  objc_msgSend(v7, "setSettings:", objc_msgSend(v16, "settings"));
  BOOL v17 = [v16 paymentPass];
  id v18 = [v17 copy];

  if (v18) {
    [v8 count];
  }
  v19 = [v18 devicePrimaryPaymentApplication];
  BOOL v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    v22 = [v18 devicePaymentApplications];
    id v21 = [v22 anyObject];
  }
  BOOL v23 = [v21 subcredentials];
  if ([v23 count])
  {
    unsigned int v37 = v11;
    id v24 = [v7 devicePrimaryPaymentApplication];
    BOOL v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      long long v27 = [v7 devicePaymentApplications];
      id v26 = [v27 anyObject];
    }
    [v26 setSubcredentials:v23];
    long long v28 = pk_Payment_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (v29)
    {
      long long v30 = pk_Payment_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v7 devicePrimaryPaymentApplication];
        long long v31 = [v36 subcredentials];
        *(_DWORD *)buf = 138412546;
        id v40 = v4;
        __int16 v41 = 2112;
        long long v42 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Notice: updated subcredentials for pass %@ to be %@", buf, 0x16u);
      }
    }

    id v11 = v37;
  }
  long long v32 = pk_Payment_log();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

  if (v33)
  {
    long long v34 = pk_Payment_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v4;
      __int16 v41 = 2112;
      long long v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Notice: Request for payment pass with unique ID %@ (replying with %@)", buf, 0x16u);
    }
  }
  return v7;
}

- (void)paymentPassesWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100027694;
  BOOL v25 = sub_1000276A4;
  id v26 = +[NSMutableSet set];
  id v8 = NPKPairedDeviceSecureElementIdentifiers();
  if (v8)
  {
    id v9 = [(NPDCompanionAgentClient *)self dataSource];
    id v10 = [v9 companionPaymentPassDatabase];
    id v11 = [v10 uniqueIDs];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000276AC;
    v17[3] = &unk_10006DEA8;
    v17[4] = self;
    id v18 = v8;
    id v19 = v6;
    BOOL v20 = &v21;
    [v11 enumerateObjectsUsingBlock:v17];
  }
  id v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v22[5];
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Request for payment passes with FPANID %@ (replying with %@)", buf, 0x16u);
    }
  }
  if (v7)
  {
    id v16 = [(id)v22[5] copy];
    v7[2](v7, v16);
  }
  _Block_object_dispose(&v21, 8);
}

- (void)paymentPassWithDeviceAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100027694;
  id v24 = sub_1000276A4;
  id v25 = 0;
  id v8 = NPKPairedDeviceSecureElementIdentifiers();
  if (v8)
  {
    id v9 = [(NPDCompanionAgentClient *)self dataSource];
    id v10 = [v9 companionPaymentPassDatabase];
    id v11 = [v10 uniqueIDs];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100027A88;
    v16[3] = &unk_10006DEA8;
    v16[4] = self;
    id v17 = v8;
    id v18 = v6;
    id v19 = &v20;
    [v11 enumerateObjectsUsingBlock:v16];
  }
  id v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v21[5];
      *(_DWORD *)buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Request for payment pass with DPANID %@ (replying with %@)", buf, 0x16u);
    }
  }
  if (v7) {
    v7[2](v7, v21[5]);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)paymentPassWithPairedTerminalIdentifier:(id)a3 completion:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x3032000000;
  unsigned int v37 = sub_100027694;
  id v38 = sub_1000276A4;
  id v39 = 0;
  id v7 = dispatch_group_create();
  uint64_t v8 = NPKPairedDeviceSecureElementIdentifiers();
  id v9 = &off_10004F000;
  uint64_t v20 = (void *)v8;
  if (v8)
  {
    id v10 = [(NPDCompanionAgentClient *)self dataSource];
    id v11 = [v10 companionPaymentPassDatabase];
    id v12 = [v11 uniqueIDs];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v31;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v13);
          }
          if (!v35[5])
          {
            uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            dispatch_group_enter(v7);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100027F38;
            v26[3] = &unk_10006DED0;
            id v27 = v21;
            uint64_t v29 = &v34;
            __int16 v28 = v7;
            [(NPDCompanionAgentClient *)self paymentPassWithUniqueID:v17 reply:v26];
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v14);
    }

    id v9 = &off_10004F000;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v9 + 367);
  block[2] = sub_100027FCC;
  block[3] = &unk_10006D968;
  id v24 = v6;
  id v25 = &v34;
  id v23 = v21;
  id v18 = v6;
  id v19 = v21;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v34, 8);
}

- (void)credentialedPassUniqueIDsWithReply:(id)a3
{
  id v16 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100027694;
  v28[4] = sub_1000276A4;
  id v29 = +[NSMutableSet set];
  id v4 = dispatch_group_create();
  uint64_t v5 = NPKPairedDeviceSecureElementIdentifiers();
  id v6 = &off_10004F000;
  uint64_t v15 = (void *)v5;
  if (v5)
  {
    id v7 = [(NPDCompanionAgentClient *)self dataSource];
    uint64_t v8 = [v7 companionPaymentPassDatabase];
    id v9 = [v8 uniqueIDs];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          dispatch_group_enter(v4);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000283D0;
          v21[3] = &unk_10006DEF8;
          id v23 = v28;
          v21[4] = v13;
          uint64_t v22 = v4;
          [(NPDCompanionAgentClient *)self paymentPassWithUniqueID:v13 reply:v21];
        }
        id v10 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v10);
    }

    id v6 = &off_10004F000;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v6 + 367);
  block[2] = sub_100028424;
  block[3] = &unk_10006DF20;
  uint64_t v20 = v28;
  id v19 = v16;
  id v14 = v16;
  dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v28, 8);
}

- (void)savePaymentPassData:(id)a3 withUniqueID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v12 UUIDString];
      *(_DWORD *)buf = 138412546;
      id v59 = v11;
      __int16 v60 = 2112;
      id v61 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Request to save payment pass with unique ID %@ for pairing ID %@", buf, 0x16u);
    }
  }
  v49 = self;
  id v18 = [(NPDCompanionAgentClient *)self dataSource];
  id v19 = [v18 companionPaymentPassDatabase];

  uint64_t v20 = NPKPairedOrPairingDevice();
  id v21 = [v20 valueForProperty:NRDevicePropertyPairingID];

  if (([v12 isEqual:v21] & 1) == 0)
  {
    uint64_t v22 = pk_Payment_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      long long v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = [v12 UUIDString];
        long long v26 = [v21 UUIDString];
        *(_DWORD *)buf = 138412546;
        id v59 = v25;
        __int16 v60 = 2112;
        id v61 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Warning: Save pass requested for device with pairing ID %@, which does not match current pairing ID %@.", buf, 0x16u);
      }
    }
    long long v27 = NPKDeviceWithPairingID();
    if (v27)
    {
      __int16 v28 = [NPDCompanionPaymentPassDatabase alloc];
      id v29 = [NPDOutstandingPassDeletionStore alloc];
      id v30 = objc_alloc((Class)NPSDomainAccessor);
      id v31 = v10;
      id v32 = [v30 initWithDomain:NPKDefaultsDomain];
      long long v33 = [(NPDOutstandingPassDeletionStore *)v29 initWithDomainAccessor:v32];
      uint64_t v34 = [(NPDCompanionPaymentPassDatabase *)v28 initWithDevice:v27 outstandingDeletionStore:v33];

      id v19 = v32;
      id v10 = v31;
    }
    else
    {
      uint64_t v34 = 0;
    }

    id v19 = v34;
  }
  if (v19)
  {
    BOOL v35 = [v19 uniqueIDs];
    id v36 = [v35 count];

    id v56 = 0;
    id v57 = 0;
    id v48 = v10;
    id v37 = +[PKPass createWithData:v10 warnings:&v57 error:&v56];
    id v38 = v57;
    id v39 = v56;
    id v40 = [v37 paymentPass];

    if (v40)
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100028A68;
      v50[3] = &unk_10006DF48;
      id v51 = v19;
      v52 = v49;
      BOOL v55 = v36 != 0;
      id v53 = v11;
      id v54 = v13;
      [v51 savePaymentPass:v40 requireExisting:0 requireNewer:0 completion:v50];
    }
    else
    {
      v45 = pk_Payment_log();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);

      if (v46)
      {
        __int16 v47 = pk_Payment_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v59 = v11;
          __int16 v60 = 2112;
          id v61 = v38;
          __int16 v62 = 2112;
          id v63 = v39;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Warning: Could not initialize pass with unique ID %@ from pass data; not saving. Warnings: %@ Error: %@",
            buf,
            0x20u);
        }
      }
      if (v13) {
        (*((void (**)(id, void))v13 + 2))(v13, 0);
      }
    }

    id v10 = v48;
  }
  else
  {
    __int16 v41 = pk_Payment_log();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

    if (v42)
    {
      long long v43 = pk_Payment_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = [v12 UUIDString];
        *(_DWORD *)buf = 138412290;
        id v59 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Warning: Save pass requested for device with pairing ID %@, but that device is no longer paired; ignoring.",
          buf,
          0xCu);
      }
    }
    if (v13) {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
}

- (void)removePaymentPassWithUniqueID:(id)a3 forPairingID:(id)a4 waitForConfirmation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    BOOL v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v58 = v10;
      __int16 v59 = 2112;
      id v60 = v11;
      __int16 v61 = 1024;
      BOOL v62 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notice: Request to remove payment pass with unique ID %@ for pairing ID %@ (wait for remote confirmation %d)", buf, 0x1Cu);
    }
  }
  id v16 = NPKPairedOrPairingDevice();
  uint64_t v17 = [v16 valueForProperty:NRDevicePropertyPairingID];

  if ([v11 isEqual:v17])
  {
    id v38 = v11;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000291C4;
    v50[3] = &unk_10006DF70;
    id v37 = v12;
    id v52 = v12;
    id v39 = v10;
    id v18 = v10;
    id v51 = v18;
    id v19 = objc_retainBlock(v50);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000294A8;
    v47[3] = &unk_10006CEA0;
    v47[4] = self;
    id v20 = v18;
    id v48 = v20;
    id v21 = v19;
    id v49 = v21;
    uint64_t v22 = objc_retainBlock(v47);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100029698;
    v45[3] = &unk_10006DFC0;
    v45[4] = self;
    id v23 = v20;
    id v46 = v23;
    long long v24 = objc_retainBlock(v45);
    long long v25 = [(NPDCompanionAgentClient *)self dataSource];
    long long v26 = [v25 companionPaymentPassDatabase];
    long long v27 = [v26 paymentPassWithUniqueID:v23];

    if (v7)
    {
      if ([(NPDCompanionAgentClient *)self _isGizmoConnected])
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1000298C4;
        v42[3] = &unk_10006DFE8;
        long long v43 = v22;
        v44 = v21;
        ((void (*)(void *, void *, void *))v24[2])(v24, v27, v42);

        __int16 v28 = v43;
      }
      else
      {
        NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
        CFStringRef v54 = @"Watch not connected";
        id v36 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        __int16 v28 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v36];

        ((void (*)(void *, void, void *, void))v21[2])(v21, 0, v28, 0);
      }
    }
    else
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000298EC;
      v40[3] = &unk_10006DDE0;
      id v41 = v23;
      ((void (*)(void *, void *, void *))v24[2])(v24, v27, v40);
      ((void (*)(void *))v22[2])(v22);
      __int16 v28 = v41;
    }
    id v11 = v38;

    uint64_t v34 = v52;
    id v10 = v39;
    id v12 = v37;
    goto LABEL_18;
  }
  id v29 = pk_Payment_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    id v31 = pk_Payment_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [v11 UUIDString];
      long long v33 = [v17 UUIDString];
      *(_DWORD *)buf = 138412546;
      id v58 = v32;
      __int16 v59 = 2112;
      id v60 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Warning: Remove requested for pairing ID %@ which does not match current pairing ID %@; ignoring.",
        buf,
        0x16u);
    }
  }
  if (v12)
  {
    NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
    CFStringRef v56 = @"Pairing ID doesn't match";
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    BOOL v35 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v34];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v35);

LABEL_18:
  }
}

- (BOOL)_isGizmoConnected
{
  char v3 = NPKIsPairedDeviceStandalone();
  id v4 = [(NPDCompanionAgentClient *)self dataSource];
  uint64_t v5 = v4;
  if (v3)
  {
    id v6 = [v4 passSyncService];
    BOOL v7 = [v6 passSyncService];
  }
  else
  {
    BOOL v7 = [v4 generalService];
  }

  char v8 = NPKIsConnectedToPairedOrPairingDeviceFromService();
  return v8;
}

- (void)setDefaultCard:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to set default card to %@", buf, 0xCu);
    }
  }
  id v11 = [(NPDCompanionAgentClient *)self dataSource];
  id v12 = [v11 companionPaymentPassDatabase];
  id v13 = [v12 uniqueIDs];

  if (v6)
  {
    if ([v13 containsObject:v6])
    {
      BOOL v14 = [(NPDCompanionAgentClient *)self dataSource];
      BOOL v15 = [v14 npsDomainAccessor];
      [v15 setObject:v6 forKey:NPKDefaultPaymentPassDefault];
LABEL_16:

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100029D1C;
      v19[3] = &unk_10006D5E0;
      v19[4] = self;
      id v20 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

      goto LABEL_17;
    }
  }
  else if (![v13 count])
  {
    BOOL v14 = [(NPDCompanionAgentClient *)self dataSource];
    BOOL v15 = [v14 npsDomainAccessor];
    [v15 removeObjectForKey:NPKDefaultPaymentPassDefault];
    goto LABEL_16;
  }
  id v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    id v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      long long v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: Rejecting invalid default card: %@, current cards = %@", buf, 0x16u);
    }
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_17:
}

- (void)defaultCard:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, id))a3;
    id v5 = [(NPDCompanionAgentClient *)self _defaultCard];
    v4[2](v4, v5);
  }
}

- (id)_defaultCard
{
  char v3 = [(NPDCompanionAgentClient *)self dataSource];
  id v4 = [v3 npsDomainAccessor];
  id v5 = [v4 synchronize];

  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v7 = [v6 npsDomainAccessor];
  char v8 = [v7 objectForKey:NPKDefaultPaymentPassDefault];

  return v8;
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    if (v9)
    {
      id v7 = [(NPDCompanionAgentClient *)self _defaultCard];
      if (v7) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = [(NPDCompanionAgentClient *)self _isPassQualifiedToBeDefaultWithUniqueID:v9];
      }
      v6[2](v6, v8);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (BOOL)_isPassQualifiedToBeDefaultWithUniqueID:(id)a3
{
  id v3 = a3;
  id v4 = +[NPKGizmoDatabase sharedDatabase];
  id v5 = [v4 passForUniqueID:v3];
  id v6 = [v5 paymentPass];

  if (v6)
  {
    id v7 = NPKPeerPaymentAccountPath();
    BOOL v8 = +[NSData dataWithContentsOfFile:v7];

    if (v8)
    {
      objc_opt_class();
      id v9 = NPKSecureUnarchiveObject();
    }
    else
    {
      id v9 = 0;
    }
    id v11 = [v9 associatedPassUniqueID];
    id v12 = +[NPKGizmoDatabase sharedDatabase];
    id v13 = [v12 preferredPaymentApplicationForPaymentPass:v6];

    id v14 = [v13 state];
    BOOL v15 = NPKPairedDeviceSecureElementIdentifiers();
    if ([v15 count]) {
      NPKIdentifyDevicePaymentApplicationsForPass();
    }
    unsigned __int8 v16 = [v11 isEqualToString:v3];
    if ([v6 effectiveContactlessPaymentApplicationState] == (id)1)
    {
      BOOL v17 = 0;
    }
    else if (PKPaymentApplicationStateIsSuspended())
    {
      BOOL v17 = 0;
    }
    else
    {
      BOOL v17 = v14 != (id)2;
    }
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v18 = [v6 supportsDefaultCardSelection];
    }
    else {
      unsigned __int8 v18 = 1;
    }
    BOOL v10 = !v17 & ~v16 & v18;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)defaultPaymentApplicationForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v5 = (void (**)(id, void))a4;
  id v6 = +[NPKGizmoDatabase sharedDatabase];
  id v7 = [v6 passForUniqueID:v13];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  BOOL v8 = +[NPKGizmoDatabase sharedDatabase];
  id v9 = [v8 passForUniqueID:v13];

  if (!v9)
  {
LABEL_7:
    v5[2](v5, 0);
    goto LABEL_8;
  }
  BOOL v10 = NPKPairedDeviceSecureElementIdentifiers();
  if ([v10 count]) {
    NPKIdentifyDevicePaymentApplicationsForPass();
  }
  id v11 = +[NPKGizmoDatabase sharedDatabase];
  id v12 = [v11 preferredPaymentApplicationForPaymentPass:v9];
  ((void (**)(id, void *))v5)[2](v5, v12);

LABEL_8:
}

- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002A58C;
  v25[3] = &unk_10006E038;
  id v10 = a5;
  id v27 = v10;
  v25[4] = self;
  id v11 = v9;
  id v26 = v11;
  id v12 = objc_retainBlock(v25);
  id v13 = +[NPKGizmoDatabase sharedDatabase];
  id v14 = [v13 passForUniqueID:v11];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v16 = 0;
LABEL_6:
    ((void (*)(void *, void))v12[2])(v12, 0);
    goto LABEL_7;
  }
  BOOL v15 = +[NPKGizmoDatabase sharedDatabase];
  id v16 = [v15 passForUniqueID:v11];

  if (!v16) {
    goto LABEL_6;
  }
  BOOL v17 = +[NPKGizmoDatabase sharedDatabase];
  [v17 setPreferredPaymentApplication:v8 forPaymentPass:v16];

  if (![(NPDCompanionAgentClient *)self _isGizmoConnected]) {
    goto LABEL_6;
  }
  unsigned __int8 v18 = [(NPDCompanionAgentClient *)self dataSource];
  id v19 = [v18 remoteAdminConnectionServiceAgent];
  id v20 = [v8 applicationIdentifier];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002A814;
  v21[3] = &unk_10006E060;
  id v16 = v16;
  id v22 = v16;
  id v23 = v10;
  long long v24 = v12;
  [v19 handlePreferredAID:v20 forPassWithUniqueID:v11 completion:v21];

LABEL_7:
}

- (void)initiateConsistencyCheckWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v5 = [v6 remoteAdminConnectionServiceAgent];
  [v5 initiateConsistencyCheckWithCompletion:v4];
}

- (void)redownloadAllPaymentPassesWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v5 = [v6 remoteAdminConnectionServiceAgent];
  [v5 redownloadAllPaymentPassesWithCompletion:v4];
}

- (void)handlePendingUnpairingWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v5 = [v6 remoteAdminConnectionServiceAgent];
  [v5 handlePendingUnpairingWithCompletion:v4];
}

- (void)handlePendingiCloudSignoutWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v5 = [v6 remoteAdminConnectionServiceAgent];
  [v5 handlePendingiCloudSignoutWithCompletion:v4];
}

- (void)setSharedPaymentWebServiceContext:(id)a3 forPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = NPKPairedOrPairingDevice();
  id v12 = [v11 valueForProperty:NRDevicePropertyPairingID];

  if (![v9 isEqual:v12])
  {
    BOOL v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      id v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v9 UUIDString];
        id v21 = [v12 UUIDString];
        *(_DWORD *)buf = 138412546;
        BOOL v42 = v20;
        __int16 v43 = 2112;
        v44 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Warning: Got shared payment web service context for device with pairing ID %@, which does not match the current device (%@). Attempting to save in the correct pairing store location.", buf, 0x16u);
      }
    }
    BOOL v15 = NPKDeviceWithPairingID();
    if (!v15)
    {
      id v32 = pk_Payment_log();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        id v16 = pk_Payment_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = [v9 UUIDString];
          *(_DWORD *)buf = 138412546;
          BOOL v42 = v34;
          __int16 v43 = 2112;
          v44 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: No device found with pairing ID %@. Ignoring web service context %@.", buf, 0x16u);
        }
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    id v16 = +[NSMutableArray array];
    id v22 = [v15 valueForProperty:NRDevicePropertySEID];
    if (v22) {
      [v16 addObject:v22];
    }
    id v23 = [v15 valueForProperty:NRDevicePropertyAdditionalSEIDs];
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v16 addObjectsFromArray:v23];
      }
    }
    if (NPKValidatePaymentWebServiceContextAgainstWatchSEIDs())
    {
      id v40 = v22;
      long long v24 = NPKPaymentWebServiceContextPathForDevice();
      long long v25 = pk_Payment_log();
      id v26 = v25;
      if (v24)
      {
        BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

        if (v27)
        {
          __int16 v28 = pk_Payment_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v9 UUIDString];
            *(_DWORD *)buf = 138412546;
            BOOL v42 = v29;
            __int16 v43 = 2112;
            v44 = v24;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Notice: Archiving web service for device with pairing ID %@ at path %@", buf, 0x16u);
          }
        }
        [v8 archiveAtPath:v24];
      }
      else
      {
        BOOL v37 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v37)
        {
          id v38 = pk_Payment_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            id v39 = [v9 UUIDString];
            *(_DWORD *)buf = 138412290;
            BOOL v42 = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error: No web service context path for device with pairing ID %@; not saving.",
              buf,
              0xCu);
          }
        }
      }
      id v22 = v40;
    }
    else
    {
      BOOL v35 = pk_Payment_log();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

      if (!v36)
      {
LABEL_36:

        goto LABEL_37;
      }
      long long v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v42 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Warning: Not saving invalid web service context (%@) for non-current watch", buf, 0xCu);
      }
    }

    goto LABEL_36;
  }
  id v13 = NPKPairedDeviceSecureElementIdentifiers();
  int v14 = NPKValidatePaymentWebServiceContextAgainstWatchSEIDs();

  if (v14)
  {
    BOOL v15 = [(NPDCompanionAgentClient *)self dataSource];
    id v16 = [v15 remoteAdminConnectionServiceAgent];
    [v16 handleUpdatedSharedPaymentWebServiceContext:v8];
LABEL_37:

    goto LABEL_38;
  }
  BOOL v30 = pk_Payment_log();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

  if (!v31) {
    goto LABEL_39;
  }
  BOOL v15 = pk_Payment_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: Not saving invalid web service context (%@) for current watch", buf, 0xCu);
  }
LABEL_38:

LABEL_39:
  if (v10) {
    v10[2](v10);
  }
}

- (void)sharedPaymentWebServiceContextForPairingID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    id v8 = NPKPairedOrPairingDevice();
    id v9 = [v8 valueForProperty:NRDevicePropertyPairingID];

    if ([v6 isEqual:v9])
    {
      id v10 = [(NPDCompanionAgentClient *)self dataSource];
      id v11 = [v10 remoteAdminConnectionServiceAgent];
      id v12 = [v11 sharedPaymentWebServiceContext];
      v7[2](v7, v12);
    }
    else
    {
      id v13 = pk_Payment_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (v14)
      {
        BOOL v15 = pk_Payment_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = [v6 UUIDString];
          BOOL v17 = [v9 UUIDString];
          int v18 = 138412546;
          id v19 = v16;
          __int16 v20 = 2112;
          id v21 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error: Got request for shared web service context for pairing ID %@, which does not match current pairing ID %@. Returning nil; the caller will need to create a fresh context and re-register.",
            (uint8_t *)&v18,
            0x16u);
        }
      }
      v7[2](v7, 0);
    }
  }
}

- (void)setSharedPeerPaymentWebServiceContext:(id)a3 forPairingID:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v6 = a3;
  id v7 = NPKPeerPaymentWebServiceContextPath();
  [v6 archiveAtPath:v7];

  notify_post((const char *)[NPKSharedPeerPaymentWebServiceChangedDarwinNotification UTF8String]);
  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)sharedPeerPaymentWebServiceContextForPairingID:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v7 = NPKPairedOrPairingDevice();
    id v8 = [v7 valueForProperty:NRDevicePropertyPairingID];

    if ([v5 isEqual:v8])
    {
      id v9 = NPKPeerPaymentWebServiceContextPath();
      id v10 = +[PKPeerPaymentWebServiceContext contextWithArchive:v9];

      v6[2](v6, v10);
    }
    else
    {
      id v11 = pk_Payment_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (v12)
      {
        id v13 = pk_Payment_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          BOOL v14 = [v5 UUIDString];
          BOOL v15 = [v8 UUIDString];
          int v16 = 138412546;
          BOOL v17 = v14;
          __int16 v18 = 2112;
          id v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error: Got request for shared peer payment web service context for pairing ID %@, which does not match current pairing ID %@. Returning nil; the caller will need to create a fresh context and re-register.",
            (uint8_t *)&v16,
            0x16u);
        }
      }
      v6[2](v6, 0);
    }
  }
}

- (void)setPeerPaymentAccount:(id)a3 forPairingID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v5 = NPKSecureArchiveObject();
  id v6 = NPKPeerPaymentAccountPath();
  [v5 writeToFile:v6 atomically:1];

  notify_post((const char *)[NPKPeerPaymentAccountChangedDarwinNotification UTF8String]);
  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    id v7 = v8;
  }
}

- (void)peerPaymentAccountForPairingID:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v7 = NPKPairedOrPairingDevice();
    id v8 = [v7 valueForProperty:NRDevicePropertyPairingID];

    if ([v5 isEqual:v8])
    {
      id v9 = NPKPeerPaymentAccountPath();
      id v10 = +[NSData dataWithContentsOfFile:v9];

      if (v10)
      {
        objc_opt_class();
        id v11 = NPKSecureUnarchiveObject();
      }
      else
      {
        id v11 = 0;
      }
      v6[2](v6, v11);
    }
    else
    {
      BOOL v12 = pk_Payment_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        BOOL v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          BOOL v15 = [v5 UUIDString];
          int v16 = [v8 UUIDString];
          int v17 = 138412546;
          __int16 v18 = v15;
          __int16 v19 = 2112;
          __int16 v20 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error: Got request for peer payment account for pairing ID %@, which does not match current pairing ID %@. Returning nil.", (uint8_t *)&v17, 0x16u);
        }
      }
      v6[2](v6, 0);
    }
  }
}

- (void)updateSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v9 = a4;
  id v6 = [(NPDCompanionAgentClient *)self delegate];
  [v6 handleUpdatedSettings:a3 forPassWithUniqueID:v9];

  if (NPKIsPairedDeviceStandalone())
  {
    id v7 = [(NPDCompanionAgentClient *)self dataSource];
    id v8 = [v7 passSyncService];
    [v8 handleSettingsChanged:a3 forPassWithUniqueID:v9];
  }
}

- (void)countOfPassesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (NPKPairedOrPairingDeviceIsTinker())
  {
    id v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Note that this count of passes returned for a tinker device does not include non-payment passes!", v14, 2u);
      }
    }
    id v8 = 0;
  }
  else
  {
    id v9 = objc_alloc_init((Class)PKPassLibrary);
    id v8 = (char *)[v9 countPassesOfType:0];
  }
  id v10 = [(NPDCompanionAgentClient *)self dataSource];
  id v11 = [v10 companionPaymentPassDatabase];
  BOOL v12 = [v11 uniqueIDs];
  id v13 = [v12 count];

  if (v4) {
    ((void (**)(id, char *))v4)[2](v4, &v8[(void)v13]);
  }
}

- (void)passesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  BOOL v6 = NPKPairedDeviceSecureElementIdentifiers();
  if (v6)
  {
    id v7 = [(NPDCompanionAgentClient *)self dataSource];
    id v8 = [v7 companionPaymentPassDatabase];
    id v9 = [v8 uniqueIDs];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002BA50;
    v15[3] = &unk_10006E088;
    v15[4] = self;
    id v16 = v6;
    id v17 = v5;
    [v9 enumerateObjectsUsingBlock:v15];
  }
  if (NPKPairedOrPairingDeviceIsTinker())
  {
    id v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11) {
      goto LABEL_11;
    }
    BOOL v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: Note that these passes returned for a tinker device do not include non-payment passes!", v14, 2u);
    }
  }
  else
  {
    BOOL v12 = objc_alloc_init((Class)PKPassLibrary);
    id v13 = [v12 passesOfType:0];
    if ([v13 count]) {
      [v5 addObjectsFromArray:v13];
    }
  }
LABEL_11:
  if (v4) {
    v4[2](v4, v5);
  }
}

- (void)deviceIDSIdentifierWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(NPDCompanionAgentClient *)self dataSource];
  BOOL v6 = [v5 paymentWebService];

  id v7 = [v6 targetDevice];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 deviceIDSIdentifier];
    if (v4) {
      v4[2](v4, v8);
    }
  }
  else
  {
    id v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      BOOL v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error: Unexpected web service target device:%@, we can't continue this route", (uint8_t *)&v12, 0xCu);
      }
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
}

- (void)initiateLostModeExitAuthWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  char v5 = NPKIsPairedDeviceStandalone();
  BOOL v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 passSyncService];
    id v9 = [v8 passSyncService];
  }
  else
  {
    id v9 = [v6 generalService];
  }

  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100027694;
  __int16 v18 = sub_1000276A4;
  id v19 = 0;
  id v10 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:0 type:11 isResponse:0];
  v20[0] = IDSSendMessageOptionTimeoutKey;
  BOOL v11 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  v21[0] = v11;
  v21[1] = &__kCFBooleanTrue;
  v20[1] = IDSSendMessageOptionBypassDuetKey;
  v20[2] = IDSSendMessageOptionAllowCloudDeliveryKey;
  v21[2] = &__kCFBooleanTrue;
  int v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  id v13 = (id)NPKProtoSendWithOptions();

  if (v4) {
    v4[2](v4, v15[5]);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)markAllAppletsForDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  char v5 = [v6 remoteAdminConnectionServiceAgent];
  [v5 markAllAppletsForDeletionWithCompletion:v4];
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v14 = a3;
  id v42 = a6;
  id v41 = a7;
  BOOL v36 = (void (**)(id, void *))a10;
  id v40 = +[NSMutableSet set];
  id v39 = +[NSMutableSet set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        __int16 v20 = +[NPKGizmoDatabase sharedDatabase];
        id v21 = [v20 transactionsForTransactionSourceIdentifier:v19 withTransactionSource:a4 withBackingData:a5 startDate:v42 endDate:v41 orderedByDate:1 limit:a9];

        id v22 = +[NPKGizmoDatabase sharedDatabase];
        id v23 = [v22 passUniqueIDForTransactionSourceIdentifier:v19];

        if (v21) {
          [v40 addObjectsFromArray:v21];
        }
        if (v23) {
          [v39 addObject:v23];
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v16);
  }

  long long v24 = pk_Payment_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v25)
  {
    id v26 = pk_Payment_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = [v40 count];
      *(_DWORD *)buf = 138413314;
      id v53 = obj;
      __int16 v54 = 2112;
      NSErrorUserInfoKey v55 = v39;
      __int16 v56 = 1024;
      int v57 = a4;
      __int16 v58 = 1024;
      int v59 = a5;
      __int16 v60 = 1024;
      unsigned int v61 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Notice: Request for transactions with source identifiers %@ (unique IDs %@) with transaction source %u with backing data %u (%u transactions)", buf, 0x28u);
    }
  }
  if (v36) {
    v36[2](v36, v40);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v28 = v39;
  id v29 = [v28 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v43 + 1) + 8 * (void)j);
        uint64_t v34 = [(NPDCompanionAgentClient *)self dataSource];
        BOOL v35 = [v34 remoteAdminConnectionServiceAgent];
        [v35 retrieveTransactionsForPassWithUniqueID:v33];
      }
      id v30 = [v28 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v30);
  }
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3 fromDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  BOOL v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Request to delete from device with Pairing ID: %@ Transaction with Identifier: %@", buf, 0x16u);
    }
  }
  id v14 = NPKPairedOrPairingDevice();
  id v15 = [v14 valueForProperty:NRDevicePropertyPairingID];

  if ([v15 isEqual:v9])
  {
    id v16 = +[NPKGizmoDatabase sharedDatabase];
    uint64_t v17 = [v16 transactionSourceIdentifierForTransactionWithIdentifier:v8];

    __int16 v18 = +[NPKGizmoDatabase sharedDatabase];
    uint64_t v19 = [v18 passUniqueIDForTransactionSourceIdentifier:v17];

    __int16 v20 = +[NPKGizmoDatabase sharedDatabase];
    [v20 removeTransactionWithIdentifier:v8];

    id v21 = [(NPDCompanionAgentClient *)self dataSource];
    id v22 = [v21 remoteAdminConnectionServiceAgent];
    [v22 handleDeletePaymentTransactionWithIdentifier:v8 passUniqueIdentifier:v19];

    id v23 = [(NPDCompanionAgentClient *)self delegate];
    [v23 transactionSourceIdentifier:v17 didRemoveTransactionWithIdentifier:v8];

    long long v24 = 0;
  }
  else
  {
    BOOL v25 = pk_Payment_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      unsigned int v27 = pk_Payment_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v9 UUIDString];
        id v29 = [v15 UUIDString];
        *(_DWORD *)buf = 138412546;
        id v33 = v28;
        __int16 v34 = 2112;
        id v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Warning: Remove requested for pairing ID %@ which does not match current pairing ID %@; ignoring.",
          buf,
          0x16u);
      }
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"PairingID does not match current Pairing ID";
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    long long v24 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v17];
  }

  if (v10) {
    v10[2](v10, v24);
  }
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = +[NPKGizmoDatabase sharedDatabase];
  BOOL v11 = [v10 transitAppletStateForPassWithUniqueID:v7];

  BOOL v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Request for transit state for unique ID %@ payment application %@; returning %@",
        (uint8_t *)&v15,
        0x20u);
    }
  }
  if (v9) {
    v9[2](v9, v11);
  }
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[NPKGizmoDatabase sharedDatabase];
  id v8 = [v7 paymentBalancesForPassWithUniqueID:v5];

  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      int v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalance get) Request for balances for unique ID %@; returning %@",
        (uint8_t *)&v12,
        0x16u);
    }
  }
  if (v6) {
    v6[2](v6, v8);
  }
}

- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  if (a5)
  {
    id v8 = (void (**)(id, void *))a5;
    id v9 = a4;
    id v10 = a3;
    NPKDomainAccessorForDomain();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = [v9 uniqueID];
    int v12 = NPKBalanceReminderIdentifierWithBalanceAndUniqueID();
    id v13 = [v15 dataForKey:v12];

    objc_opt_class();
    __int16 v14 = NPKSecureUnarchiveObject();
    v8[2](v8, v14);

    [(NPDCompanionAgentClient *)self _updateLocalBalanceReminderForBalance:v10 pass:v9];
  }
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t))a6;
  __int16 v14 = pk_Payment_log();
  LODWORD(a4) = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (a4)
  {
    id v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notice: Request to set balance reminder %@ for balance %@ of pass %@", buf, 0x20u);
    }
  }
  id v16 = NPKSecureArchiveObject();
  __int16 v17 = NPKDomainAccessorForDomain();
  id v18 = [v12 uniqueID];
  __int16 v19 = NPKBalanceReminderIdentifierWithBalanceAndUniqueID();
  [v17 setObject:v16 forKey:v19];

  id v20 = [v17 synchronize];
  objc_initWeak((id *)buf, self);
  id v21 = [(NPDCompanionAgentClient *)self dataSource];
  id v22 = [v21 remoteAdminConnectionServiceAgent];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002CE6C;
  v26[3] = &unk_10006E0D8;
  id v23 = v10;
  id v27 = v23;
  id v24 = v11;
  id v28 = v24;
  id v25 = v12;
  id v29 = v25;
  objc_copyWeak(&v30, (id *)buf);
  [v22 setBalanceReminder:v23 forBalance:v24 pass:v25 completion:v26];

  if (v13) {
    v13[2](v13, 1);
  }
  objc_destroyWeak(&v30);

  objc_destroyWeak((id *)buf);
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  if (a5)
  {
    id v8 = (void (**)(id, id))a5;
    id v9 = a4;
    id v10 = a3;
    NPKDomainAccessorForDomain();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [(NPDCompanionAgentClient *)self _commutePlanReminderIdentifierWithCommutePlan:v10 pass:v9];
    [v15 doubleForKey:v11];
    double v13 = v12;

    id v14 = [objc_alloc((Class)PKPaymentCommutePlanReminder) initWithTimeInterval:v13];
    v8[2](v8, v14);

    [(NPDCompanionAgentClient *)self _updateLocalCommutePlanReminderForCommutePlan:v10 pass:v9];
  }
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = (void (**)(id, uint64_t))a6;
  id v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Request to set commute plan reminder %@ for pass %@", buf, 0x16u);
    }
  }
  __int16 v17 = NPKDomainAccessorForDomain();
  [v10 timeInterval];
  double v19 = v18;
  id v20 = [(NPDCompanionAgentClient *)self _commutePlanReminderIdentifierWithCommutePlan:v11 pass:v12];
  [v17 setDouble:v20 forKey:v19];

  id v21 = [v17 synchronize];
  objc_initWeak((id *)buf, self);
  id v22 = [(NPDCompanionAgentClient *)self dataSource];
  id v23 = [v22 remoteAdminConnectionServiceAgent];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002D354;
  v27[3] = &unk_10006E100;
  id v24 = v10;
  id v28 = v24;
  id v25 = v12;
  id v29 = v25;
  objc_copyWeak(&v31, (id *)buf);
  id v26 = v11;
  id v30 = v26;
  [v23 setCommutePlanReminder:v24 forCommutePlan:v26 pass:v25 completion:v27];

  if (v13) {
    v13[2](v13, 1);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 uniqueID];
      int v14 = 138412290;
      BOOL v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to start background verification observer for pass %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v12 = [(NPDCompanionAgentClient *)self dataSource];
  double v13 = [v12 remoteAdminConnectionServiceAgent];
  [v13 startBackgroundVerificationObserverForPass:v6 verificationMethod:v7];
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Note foreground observervation active %d", (uint8_t *)v10, 8u);
    }
  }
  id v8 = [(NPDCompanionAgentClient *)self dataSource];
  BOOL v9 = [v8 remoteAdminConnectionServiceAgent];
  [v9 noteForegroundVerificationObserverActive:v3 withObserver:self];
}

- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPDCompanionAgentClient *)self delegate];
  [v8 fetchPendingTransactionForPassWithUniqueID:v7 completion:v6];
}

- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPDCompanionAgentClient *)self delegate];
  [v5 markPendingTransactionAsProcessedForPassWithUniqueID:v4];
}

- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    BOOL v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_retainBlock(v12);
      int v23 = 134218754;
      int64_t v24 = a3;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notice: Request to present standalone transaction %lu for pass unique id: %@ readerID: %@ completion %@", (uint8_t *)&v23, 0x2Au);
    }
  }
  __int16 v17 = [(NPDCompanionAgentClient *)self dataSource];
  double v18 = [v17 paymentWebService];

  double v19 = [v18 targetDevice];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 paymentWebService:v18 presentStandaloneTransaction:a3 forPassUniqueIdentifier:v10 terminalReaderIdentifier:v11 completion:v12];
  }
  else
  {
    id v20 = pk_General_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (v21)
    {
      id v22 = pk_General_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138412290;
        int64_t v24 = (int64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error: Unexpected web service target device:%@, we can't continue this route", (uint8_t *)&v23, 0xCu);
      }
    }
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)hasActiveExternallySharedPassesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_retainBlock(v4);
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Request to get has active externally shared passes completion %@", (uint8_t *)&v12, 0xCu);
    }
  }
  BOOL v9 = [(NPDCompanionAgentClient *)self dataSource];
  id v10 = [v9 paymentWebService];

  id v11 = [v10 targetDevice];
  [v11 hasActiveExternallySharedPassesWithCompletion:v4];
}

- (void)expressModeEnabledForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock(v7);
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to check express pass with identifier %@, completion %@", buf, 0x16u);
    }
  }
  int v12 = [(NPDCompanionAgentClient *)self dataSource];
  id v13 = [v12 paymentWebService];

  BOOL v14 = [v13 targetDevice];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002DC6C;
  v16[3] = &unk_10006CDF0;
  id v17 = v7;
  id v15 = v7;
  [v14 expressModeEnabledForPassIdentifier:v6 completion:v16];
}

- (void)updateCredentials:(id)a3 forUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_retainBlock(v10);
      int v17 = 138412802;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Request to update credentials %@, for unique ID: %@, completion %@", (uint8_t *)&v17, 0x20u);
    }
  }
  id v15 = [(NPDCompanionAgentClient *)self dataSource];
  id v16 = [v15 remoteAdminConnectionServiceAgent];
  [v16 handleCredentialsUpdate:v8 forUniqueID:v9 completion:v10];
}

- (void)isIssuerAppProvisioningSupported:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Request to check if issuer app provisioning is supported", (uint8_t *)v12, 2u);
    }
  }
  id v7 = NPKPairedOrPairingDevice();
  if (v7) {
    uint64_t v8 = NPKIsTinkerDevice() ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: isIssuerAppProvisioningSupported:%d", (uint8_t *)v12, 8u);
    }
  }
  if (v3) {
    v3[2](v3, v8);
  }
}

- (void)trustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPDCompanionAgentClient *)self dataSource];
  BOOL v12 = [v11 paymentWebService];

  id v13 = [v12 targetDevice];
  id v14 = [v13 trustedDeviceEnrollmentInfoForWebService:v12];
  id v15 = [v14 deviceUDID];
  id v16 = objc_alloc_init((Class)NSMutableData);
  int v17 = [v15 dataUsingEncoding:4];
  [v16 appendData:v17];

  id v18 = [v10 dataUsingEncoding:4];

  [v16 appendData:v18];
  [v16 appendData:v9];

  __int16 v19 = [v16 SHA256Hash];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002E11C;
  void v21[3] = &unk_10006E128;
  id v22 = v8;
  id v20 = v8;
  [v13 paymentWebService:v12 signData:v19 signatureEntanglementMode:0 withCompletionHandler:v21];
}

- (void)handlePeerPaymentTermsAndConditionsRequestFromGizmo
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Gizmo requesting Terms & Conditions acceptance flow", v13, 2u);
    }
  }
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SURF_TC_ACCEPTANCE_MESSAGE_SPECIFIC" value:&stru_10006EFD0 table:@"NanoPassKit"];

  id v8 = [(NPDCompanionAgentClient *)self dataSource];
  id v9 = [v8 bulletinManager];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"APPLE_WATCH" value:&stru_10006EFD0 table:@"NanoPassKit"];
  BOOL v12 = +[NSURL URLWithString:@"bridge:root=com.apple.NanoPassbookBridgeSettings&action=ACCEPT_PP_TC"];
  [v9 insertBridgeBulletinWithTitle:v11 message:v7 actionURL:v12 forPass:0];
}

- (void)_selectNewDefaultCardForUserAfterDeletionOfDefaultCardWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  int64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100027694;
  __int16 v27 = sub_1000276A4;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  void v21[3] = sub_100027694;
  void v21[4] = sub_1000276A4;
  id v22 = 0;
  BOOL v5 = +[NPKGizmoDatabase sharedDatabase];
  id v6 = [v5 passDescriptions];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002E68C;
  v17[3] = &unk_10006E150;
  id v7 = v4;
  id v18 = v7;
  __int16 v19 = &v23;
  id v20 = v21;
  [v6 enumerateObjectsUsingBlock:v17];

  id v8 = pk_General_log();
  LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v24[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Selected new default card %@ for user", buf, 0xCu);
    }
  }
  if (v24[5])
  {
    id v11 = +[NPKGizmoDatabase sharedDatabase];
    BOOL v12 = [v11 passForUniqueID:v24[5]];

    uint64_t v13 = v24[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002E794;
    v15[3] = &unk_10006E178;
    id v14 = v12;
    id v16 = v14;
    [(NPDCompanionAgentClient *)self setDefaultCard:v13 completion:v15];
  }
  else
  {
    [(NPDCompanionAgentClient *)self setDefaultCard:0 completion:0];
  }

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)_applyIngestionDateToPass:(id)a3
{
  id v7 = a3;
  BOOL v3 = +[NPKGizmoDatabase sharedDatabase];
  id v4 = [v7 uniqueID];
  BOOL v5 = [v3 passForUniqueID:v4];

  if (!v5 || ([v5 ingestedDate], (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = +[NSDate distantPast];
  }
  [v7 setIngestedDate:v6];
}

- (id)_commutePlanReminderIdentifierWithCommutePlan:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 uniqueID];
  id v8 = +[NSString stringWithFormat:@"CommutePlanReminder-%@", v7];

  id v9 = [v6 transitCommutePlanType];
  if (v9 == (id)2)
  {
    uint64_t v10 = [v5 identifier];
    uint64_t v11 = [v8 stringByAppendingFormat:@"-planID:%@", v10];

    id v8 = (void *)v11;
  }

  return v8;
}

- (void)_updateLocalBalanceReminderForBalance:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPDCompanionAgentClient *)self dataSource];
  id v9 = [v8 remoteAdminConnectionServiceAgent];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_10002EBCC;
  v12[3] = &unk_10006E1A0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 balanceReminderForBalance:v11 pass:v10 completion:v12];
}

- (void)_updateLocalCommutePlanReminderForCommutePlan:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPDCompanionAgentClient *)self dataSource];
  id v9 = [v8 remoteAdminConnectionServiceAgent];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_10002EE44;
  v12[3] = &unk_10006E1C8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 commutePlanReminderForCommutePlan:v11 pass:v10 withCompletion:v12];
}

- (void)_removePendingAppleCardNotification
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v3 localizedStringForKey:@"ACCOUNTPASS_PRODUCT_NAME" value:&stru_10006EFD0 table:@"AccountPass"];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ACCOUNTPASS_PROVISIONING_ERROR" value:&stru_10006EFD0 table:@"AccountPass"];

  id v6 = [(NPDCompanionAgentClient *)self dataSource];
  id v7 = [v6 bulletinManager];
  [v7 removeBridgeBulletinsWithTitle:v8 message:v5 actionURL:0];
}

- (NPDCompanionAgentClientDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPDCompanionAgentClientDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NPDCompanionAgentClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPDCompanionAgentClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_watchOfferTimeoutTimer, 0);
}

@end