void sub_100002124(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t vars8;

  v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000219C(void *a1)
{
  *(unsigned char *)(a1[4] + 35) = 0;
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 33))
  {
    objc_storeStrong((id *)(v2 + 48), *(id *)(*(void *)(a1[5] + 8) + 40));
    uint64_t v3 = a1[4];
    v4 = *(void **)(v3 + 72);
    if (v4)
    {
      [v4 invalidate];
      uint64_t v3 = a1[4];
    }
    objc_storeStrong((id *)(v3 + 72), *(id *)(*(void *)(a1[6] + 8) + 40));
  }
  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) != UIBackgroundTaskInvalid)
  {
    v5 = +[UIApplication sharedApplication];
    [v5 endBackgroundTask:*(void *)(*(void *)(a1[7] + 8) + 24)];

    *(void *)(*(void *)(a1[7] + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

int main(int argc, const char **argv, const char **envp)
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v7, v9);

  return (int)argv;
}

void sub_1000024E0(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100002E58;
  v13[4] = sub_100002E50;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100002E58;
  v11[4] = sub_100002E50;
  id v12 = 0;
  id v3 = objc_alloc_init((Class)SBSBiometricsService);
  if (v3)
  {
    dispatch_group_enter(v2);
    uint64_t v4 = PKServiceBundleIdentifier;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100002124;
    v7[3] = &unk_100019038;
    id v8 = v3;
    v10 = v13;
    v9 = v2;
    [v8 acquireWalletPreArmSuppressionAssertionForReason:v4 completion:v7];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000219C;
  block[3] = &unk_100019060;
  uint64_t v5 = *(void *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  block[5] = v11;
  block[6] = v13;
  block[7] = v5;
  dispatch_group_notify(v2, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void sub_1000026D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100002E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002E50(uint64_t a1)
{
}

uint64_t sub_100002E58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002E78(id a1)
{
  id v1 = +[PKDiscoveryService sharedInstance];
  [v1 beginReporingDiscoveryAnalytics];
  [v1 processDiscoveryItemsAndMessagesWithCompletion:&stru_100018FE8];
}

id sub_100002ED0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) updateRegionSupportIfNecessary];
}

void sub_100002F70(uint64_t a1)
{
  uint64_t v2 = +[UIApplication sharedApplication];
  id v3 = [v2 applicationIconBadgeNumber];

  uint64_t v4 = +[PKDiscoveryService sharedInstance];
  id v6 = v4;
  if ((uint64_t)v3 > 0) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  [v4 discoveryItemWithIdentifier:*(void *)(a1 + 32) launchedWithReferralSource:v5];
}

void sub_10000358C(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 128) groupStackView];
  if ([v5 presentationState] == (id)5)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
    id v3 = [v5 modalGroupFrontmostPass];
    uint64_t v4 = [v3 uniqueID];
    [v2 presentPassWithUniqueID:v4 animated:0 completionHandler:0];
  }
}

uint64_t sub_100003638(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100003648(uint64_t a1)
{
  char v8 = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 37))
  {
    *(unsigned char *)(v1 + 37) = 0;
    [*(id *)(*(void *)(a1 + 32) + 128) presentInitialState:&v8];
    uint64_t v1 = *(void *)(a1 + 32);
    char v3 = v8;
  }
  else
  {
    char v3 = 0;
  }
  uint64_t v4 = *(void **)(v1 + 128);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000370C;
  v6[3] = &unk_100018BC8;
  char v7 = v3;
  v6[4] = v1;
  return [v4 reloadPassesWithCompletion:v6];
}

id *sub_10000370C(id *result)
{
  if (!*((unsigned char *)result + 40)) {
    return (id *)[result[4] _presentLaunchPromptsIfNeeded];
  }
  return result;
}

uint64_t sub_100003868(uint64_t a1)
{
  if ([*(id *)(a1 + 32) applicationState] == (id)2) {
    [*(id *)(*(void *)(a1 + 40) + 128) setPassesAreOutdated:1];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void sub_100003CFC(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003DB0;
  v5[3] = &unk_100018CB8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 updatePassesIfNecessaryWithCompletion:v5];
}

void sub_100003DB0(id *a1)
{
  uint64_t v1 = a1 + 4;
  uint64_t v2 = [a1[4] scheme];
  id v3 = (void *)PKLegacyWalletURLScheme;
  id v4 = v2;
  id v5 = v3;
  if (v4 != v5)
  {
    id v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
    }
    else
    {
      unsigned __int8 v8 = [v4 isEqualToString:v5];

      if (v8) {
        goto LABEL_15;
      }
    }
    v9 = (void *)PKWalletURLScheme;
    id v10 = v4;
    id v11 = v9;
    if (v10 != v11)
    {
      id v12 = v11;
      if (!v4 || !v11)
      {

        goto LABEL_45;
      }
      unsigned __int8 v13 = [v10 isEqualToString:v11];

      if ((v13 & 1) == 0)
      {
LABEL_45:
        v35 = (__CFString *)v10;
        if (v35 != @"file")
        {
          v36 = v35;
          if (!v35) {
            goto LABEL_169;
          }
          unsigned int v37 = [(__CFString *)v35 isEqualToString:@"file"];

          if (!v37) {
            goto LABEL_169;
          }
        }
        v38 = [*v1 pathExtension];
        if (v38 != @"order")
        {
          v39 = v38;
          if (!v38) {
            goto LABEL_169;
          }
          unsigned int v40 = [(__CFString *)v38 isEqualToString:@"order"];

          if (!v40) {
            goto LABEL_169;
          }
        }
        v41 = (void *)*((void *)a1[5] + 16);
        v354[0] = _NSConcreteStackBlock;
        v354[1] = 3221225472;
        v354[2] = sub_100006F88;
        v354[3] = &unk_100018C90;
        v355 = a1[4];
        [v41 presentOrderManagementAnimated:1 completion:v354];
        v32 = v355;
LABEL_171:

        goto LABEL_172;
      }
      goto LABEL_15;
    }
  }

LABEL_15:
  id v321 = v4;
  v322 = [*v1 host];
  v324 = [*v1 pathComponents];
  id v14 = [v324 count];
  v319 = v1;
  id v323 = [objc_alloc((Class)NSURLComponents) initWithURL:*v1 resolvingAgainstBaseURL:0];
  [v323 queryItems];
  long long v416 = 0u;
  long long v417 = 0u;
  long long v418 = 0u;
  long long v419 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v416 objects:v438 count:16];
  if (!v15) {
    goto LABEL_36;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v417;
  id v18 = (id)PKUserNotificationQueryItemApplicationMessageContentIdentifier;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v417 != v17) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v416 + 1) + 8 * i);
      v21 = [v20 name];
      v22 = [v20 value];
      id v23 = v21;
      v24 = v23;
      if (v23 == v18)
      {

LABEL_29:
        if ([v22 length])
        {
          v27 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = *v319;
            *(_DWORD *)buf = 138412546;
            id v435 = v28;
            __int16 v436 = 2112;
            v437 = v22;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "URL %@ has associated applicationMessageContentIdentifier: %@", buf, 0x16u);
          }

          id v29 = objc_alloc_init((Class)PKPaymentService);
          [v29 userNotificationActionPerformed:2 applicationMessageContentIdentifier:v22 completion:0];

          goto LABEL_36;
        }
        goto LABEL_30;
      }
      if (v23) {
        BOOL v25 = v18 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      if (v25)
      {

        goto LABEL_30;
      }
      unsigned int v26 = [v23 isEqualToString:v18];

      if (v26) {
        goto LABEL_29;
      }
LABEL_30:
    }
    id v16 = [obj countByEnumeratingWithState:&v416 objects:v438 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_36:
  v30 = obj;

  v31 = v324;
  v32 = v322;
  v33 = v323;
  if ([a1[5] _handleWalletUniversalLinkableURLWithHost:v322 pathComponents:v324 urlComponents:v323])goto LABEL_146; {
  if ([v322 isEqual:PKUserNotificationActionRoutePassUpdate])
  }
  {
    if (v14 != (id)2) {
      goto LABEL_152;
    }
    id v34 = [v324 lastObject];
    [*((id *)a1[5] + 16) presentPassWithUpdateUserNotificationIdentifier:v34];
LABEL_144:

LABEL_145:
    v30 = obj;
LABEL_146:

LABEL_147:
    id v4 = v321;
    goto LABEL_171;
  }
  if (![v322 isEqual:PKUserNotificationActionRouteViewPass])
  {
    if ([v322 isEqual:PKUserNotificationActionRouteViewTransaction])
    {
      long long v401 = 0u;
      long long v402 = 0u;
      long long v399 = 0u;
      long long v400 = 0u;
      id v42 = obj;
      id v43 = [v42 countByEnumeratingWithState:&v399 objects:v430 count:16];
      if (!v43)
      {

        v55 = 0;
        v57 = 0;
        v45 = 0;
        BOOL v56 = 0;
        id v4 = v321;
        v33 = v323;
        v31 = v324;
        v30 = obj;
LABEL_92:

        goto LABEL_168;
      }
      id v44 = v43;
      v45 = 0;
      v337 = 0;
      id v344 = 0;
      uint64_t v46 = *(void *)v400;
      uint64_t v47 = PKUserNotificationActionQueryItemTransactionIdentifier;
      os_log_t log = (os_log_t)PKUserNotificationActionQueryItemServiceIdentifier;
      uint64_t v326 = PKUserNotificationActionQueryItemTransactionSourceIdentifier;
LABEL_55:
      uint64_t v48 = 0;
      while (1)
      {
        if (*(void *)v400 != v46) {
          objc_enumerationMutation(v42);
        }
        v49 = *(void **)(*((void *)&v399 + 1) + 8 * v48);
        v50 = [v49 name];
        v51 = [v49 value];
        if (![v51 length]) {
          goto LABEL_65;
        }
        if ([v50 isEqualToString:v47]) {
          break;
        }
        if ([v50 isEqualToString:log])
        {
          v52 = v337;
          v53 = v45;
          v337 = v51;
          goto LABEL_64;
        }
        v52 = v45;
        v53 = v51;
        if ([v50 isEqualToString:v326]) {
          goto LABEL_64;
        }
LABEL_65:

        if (v44 == (id)++v48)
        {
          id v44 = [v42 countByEnumeratingWithState:&v399 objects:v430 count:16];
          if (!v44)
          {

            id v4 = v321;
            v33 = v323;
            v31 = v324;
            v55 = v344;
            if (v344)
            {
              [*((id *)a1[5] + 16) presentTransactionDetailsForTransactionWithIdentifier:v344];
              BOOL v56 = 1;
              v32 = v322;
              v57 = v337;
              v30 = obj;
            }
            else
            {
              v32 = v322;
              v57 = v337;
              v30 = obj;
              if (v337)
              {
                [*((id *)a1[5] + 16) presentTransactionDetailsForTransactionWithServiceIdentifier:v337 transactionSourceIdentifier:v45];
                v55 = 0;
                BOOL v56 = 1;
              }
              else
              {
                v55 = 0;
                BOOL v56 = 0;
              }
            }
            goto LABEL_92;
          }
          goto LABEL_55;
        }
      }
      v52 = v344;
      v53 = v45;
      id v344 = v51;
LABEL_64:
      id v54 = v51;

      v45 = v53;
      goto LABEL_65;
    }
    if ([v322 isEqual:PKUserNotificationActionRouteAddValueAddedServicePass])
    {
      if (v14 != (id)2) {
        goto LABEL_152;
      }
      id v34 = [v324 lastObject];
      [*((id *)a1[5] + 16) addVASPassWithIdentifier:v34];
      goto LABEL_144;
    }
    if ([v322 isEqualToString:PKURLActionPaymentSetup])
    {
      [*((id *)a1[5] + 16) presentPaymentSetupInMode:0 referrerIdentifier:0 paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:0 productIdentifiers:0];
      goto LABEL_146;
    }
    if ([v322 isEqualToString:PKURLActionPaymentSetupIDMSCardOnFile])
    {
      if (v14 == (id)2)
      {
        id v34 = [v324 objectAtIndex:1];
      }
      else
      {
        id v34 = 0;
      }
      v65 = (void *)*((void *)a1[5] + 16);
      v66 = +[NSSet set];
      v67 = v65;
      uint64_t v68 = 2;
      id v69 = v34;
      v70 = v66;
      id v71 = 0;
LABEL_143:
      [v67 presentPaymentSetupInMode:v68 referrerIdentifier:v69 paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:v70 productIdentifiers:v71];

      goto LABEL_144;
    }
    if ([v322 isEqualToString:PKURLActionPaymentSetupSelectProduct])
    {
      if ((unint64_t)v14 < 2)
      {
        id v34 = 0;
      }
      else
      {
        v64 = [v324 objectAtIndex:1];
        if (v64) {
          id v34 = [objc_alloc((Class)NSSet) initWithObjects:v64, 0];
        }
        else {
          id v34 = 0;
        }
      }
      v93 = (void *)*((void *)a1[5] + 16);
      v66 = +[NSSet set];
      v67 = v93;
      uint64_t v68 = 3;
      id v69 = 0;
      v70 = v66;
      id v71 = v34;
      goto LABEL_143;
    }
    if ([v322 isEqualToString:PKURLActionPaymentSetupSelectPaymentNetwork])
    {
      if ((unint64_t)v14 < 2)
      {
        id v34 = 0;
      }
      else
      {
        id v34 = [v324 objectAtIndex:1];
        if (v14 != (id)2)
        {
          v72 = [v324 objectAtIndex:2];
LABEL_137:
          v91 = (void *)*((void *)a1[5] + 16);
          v92 = +[NSSet set];
          [v91 presentPaymentSetupInMode:3 referrerIdentifier:0 paymentNetwork:v34 transitNetworkIdentifier:v72 allowedFeatureIdentifiers:v92 productIdentifiers:0];

          goto LABEL_144;
        }
      }
      v72 = 0;
      goto LABEL_137;
    }
    if ([v322 isEqualToString:PKUserNotificationActionRoutePeerPaymentTopUp])
    {
      [*((id *)a1[5] + 16) presentPeerPaymentTopUp];
      goto LABEL_152;
    }
    if ([v322 isEqualToString:PKUserNotificationActionRoutePeerPaymentTermsAcceptance])
    {
      [*((id *)a1[5] + 16) presentPeerPaymentTermsAcceptance];
      goto LABEL_152;
    }
    if ([v322 isEqualToString:PKUserNotificationActionRoutePeerPaymentVerifyIdentity])
    {
      [*((id *)a1[5] + 16) presentPeerPaymentVerifyIdentity];
      goto LABEL_152;
    }
    if ([v322 isEqualToString:PKUserNotificationActionRoutePeerPaymentSetup])
    {
      long long v397 = 0u;
      long long v398 = 0u;
      long long v395 = 0u;
      long long v396 = 0u;
      id v106 = obj;
      id v107 = [v106 countByEnumeratingWithState:&v395 objects:v429 count:16];
      if (v107)
      {
        id v108 = v107;
        uint64_t v314 = 0;
        uint64_t v328 = 0;
        os_log_t logb = 0;
        id v347 = 0;
        v109 = 0;
        uint64_t v110 = *(void *)v396;
        uint64_t v111 = PKUserNotificationActionQueryItemPeerPaymentSetupAmount;
        uint64_t v112 = PKUserNotificationActionQueryItemPeerPaymentSetupCurrency;
        uint64_t v339 = PKUserNotificationActionQueryItemPeerPaymentSetupFlowState;
        uint64_t v320 = PKUserNotificationActionQueryItemPeerPaymentSetupSenderAddress;
        uint64_t v317 = PKUserNotificationActionQueryItemPeerPaymentSetupPaymentMode;
        do
        {
          for (j = 0; j != v108; j = (char *)j + 1)
          {
            if (*(void *)v396 != v110) {
              objc_enumerationMutation(v106);
            }
            v114 = *(void **)(*((void *)&v395 + 1) + 8 * (void)j);
            v115 = [v114 name];
            v116 = [v114 value];
            if ([v116 length])
            {
              if ([v115 isEqualToString:v111])
              {
                uint64_t v117 = +[NSDecimalNumber decimalNumberWithString:v116];

                v109 = (NSDecimalNumber *)v117;
              }
              else if ([v115 isEqualToString:v112])
              {
                id v118 = v116;

                id v347 = v118;
              }
              else if ([v115 isEqualToString:v339])
              {
                uint64_t v328 = PKPeerPaymentRegistrationFlowStateFromString();
              }
              else if ([v115 isEqualToString:v320])
              {
                v119 = v116;

                os_log_t logb = v119;
              }
              else if ([v115 isEqualToString:v317])
              {
                uint64_t v314 = PKPeerPaymentPaymentModeFromString();
              }
            }
          }
          id v108 = [v106 countByEnumeratingWithState:&v395 objects:v429 count:16];
        }
        while (v108);

        v120 = 0;
        if (v109 && v347)
        {
          v121 = v347;
          v120 = PKCurrencyAmountCreate(v109, (NSString *)v347, 0);
          os_log_t v122 = logb;
        }
        else
        {
          os_log_t v122 = logb;
          v121 = v347;
        }
        uint64_t v124 = v314;
        uint64_t v125 = v328;
      }
      else
      {

        v120 = 0;
        uint64_t v124 = 0;
        os_log_t v122 = 0;
        uint64_t v125 = 0;
        v121 = 0;
        v109 = 0;
      }
      id v148 = objc_alloc_init((Class)PKPeerPaymentAccountResolutionControllerConfiguration);
      [v148 setCurrencyAmount:v120];
      [v148 setRegistrationFlowState:v125];
      [v148 setSenderAddress:v122];
      [v148 setPaymentMode:v124];
      [*((id *)a1[5] + 16) presentPeerPaymentSetupWithConfiguration:v148];

      goto LABEL_245;
    }
    if ([v322 isEqualToString:PKURLActionShowExpiredPasses])
    {
      [*((id *)a1[5] + 16) presentExpiredPassesAnimated:1 completionHandler:0];
      goto LABEL_145;
    }
    if ([v322 isEqualToString:PKUserNotificationActionRouteAccountServiceSchedulePayment])
    {
      v32 = v322;
      v33 = v323;
      v31 = v324;
      if (v14 != (id)2) {
        goto LABEL_152;
      }
      id v34 = [v324 objectAtIndexedSubscript:1];
      [*((id *)a1[5] + 16) presentAccountServiceSchedulePayment:v34 billPayAmountType:0 billPayAmount:0 completion:0];
      goto LABEL_144;
    }
    if ([v322 isEqualToString:PKUserNotificationActionRouteAccountServicePaymentDetails])
    {
      v32 = v322;
      v33 = v323;
      v31 = v324;
      if (v14 != (id)2) {
        goto LABEL_152;
      }
      id v348 = [v324 objectAtIndexedSubscript:1];
      long long v391 = 0u;
      long long v392 = 0u;
      long long v393 = 0u;
      long long v394 = 0u;
      id v149 = obj;
      id v150 = [v149 countByEnumeratingWithState:&v391 objects:v428 count:16];
      if (!v150)
      {
        id v152 = 0;
        goto LABEL_296;
      }
      id v151 = v150;
      id v152 = 0;
      uint64_t v153 = *(void *)v392;
      id v154 = (id)PKUserNotificationActionQueryItemPaymentReferenceIdentifier;
LABEL_251:
      uint64_t v155 = 0;
      while (1)
      {
        if (*(void *)v392 != v153) {
          objc_enumerationMutation(v149);
        }
        v156 = *(void **)(*((void *)&v391 + 1) + 8 * v155);
        v157 = [v156 name];
        v158 = [v156 value];
        if (![v158 length]) {
          goto LABEL_265;
        }
        id v159 = v157;
        if (v159 == v154)
        {
        }
        else
        {
          v160 = v159;
          if (v159) {
            BOOL v161 = v154 == 0;
          }
          else {
            BOOL v161 = 1;
          }
          if (v161) {
            goto LABEL_264;
          }
          unsigned int v162 = [v159 isEqualToString:v154];

          if (!v162) {
            goto LABEL_265;
          }
        }
        v160 = v152;
        id v152 = v158;
LABEL_264:

LABEL_265:
        if (v151 == (id)++v155)
        {
          id v151 = [v149 countByEnumeratingWithState:&v391 objects:v428 count:16];
          if (!v151)
          {
LABEL_296:

            id v180 = v348;
            [*((id *)a1[5] + 16) presentAccountServicePaymentWithReferenceIdentifier:v152 forPassWithUniqueID:v348];

            goto LABEL_297;
          }
          goto LABEL_251;
        }
      }
    }
    v163 = (void *)PKVirtualCardRoutePass;
    v164 = v322;
    v165 = v163;
    if (v164 == v165)
    {
    }
    else
    {
      v166 = v165;
      if (!v164 || !v165)
      {

        goto LABEL_290;
      }
      unsigned int v167 = [v164 isEqualToString:v165];

      if (!v167)
      {
LABEL_290:
        v175 = (void *)PKInstallmentRoutePass;
        v176 = v164;
        v177 = v175;
        if (v176 == v177)
        {
        }
        else
        {
          v178 = v177;
          if (!v164 || !v177)
          {

LABEL_304:
            v181 = (void *)PKUserNotificationActionRouteViewSpendingSummary;
            v182 = v176;
            v183 = v181;
            if (v182 == v183)
            {
            }
            else
            {
              v184 = v183;
              if (!v164 || !v183)
              {

                goto LABEL_355;
              }
              unsigned int v185 = [v182 isEqualToString:v183];

              if (!v185)
              {
LABEL_355:
                v209 = (void *)PKUserNotificationActionRouteViewBalanceSummary;
                v210 = v182;
                v211 = v209;
                if (v210 == v211)
                {
                }
                else
                {
                  v212 = v211;
                  if (!v164 || !v211)
                  {

LABEL_389:
                    if ([v210 isEqual:PKAppletSubcredentialSharingInvitationNotificationActionRoute])
                    {
                      long long v381 = 0u;
                      long long v382 = 0u;
                      long long v379 = 0u;
                      long long v380 = 0u;
                      id v350 = obj;
                      id v228 = [v350 countByEnumeratingWithState:&v379 objects:v425 count:16];
                      if (v228)
                      {
                        id v229 = v228;
                        v230 = 0;
                        v231 = 0;
                        uint64_t v232 = *(void *)v380;
                        v233 = (void *)PKAppletSubcredentialSharingInvitationNotificationActionIdentifierParameter;
                        v234 = (void *)PKAppletSubcredentialSharingInvitationNotificationActionRemoteIdentifierParameter;
                        do
                        {
                          for (k = 0; k != v229; k = (char *)k + 1)
                          {
                            if (*(void *)v380 != v232) {
                              objc_enumerationMutation(v350);
                            }
                            v236 = *(void **)(*((void *)&v379 + 1) + 8 * (void)k);
                            v237 = [v236 name];
                            unsigned int v238 = [v233 isEqualToString:v237];

                            if (v238) {
                              BOOL v239 = v230 == 0;
                            }
                            else {
                              BOOL v239 = 0;
                            }
                            if (v239)
                            {
                              v230 = [v236 value];
                            }
                            else
                            {
                              v240 = [v236 name];
                              unsigned int v241 = [v234 isEqualToString:v240];

                              if (v241) {
                                BOOL v242 = v231 == 0;
                              }
                              else {
                                BOOL v242 = 0;
                              }
                              if (v242)
                              {
                                v231 = [v236 value];
                              }
                            }
                          }
                          id v229 = [v350 countByEnumeratingWithState:&v379 objects:v425 count:16];
                        }
                        while (v229);

                        if (v230)
                        {
                          BOOL v56 = 1;
                          [*((id *)a1[5] + 16) presentSubcredentialInvitationWithIdentifier:v230 remoteDeviceInvitationIdentifier:v231 animated:1];
LABEL_433:

                          id v4 = v321;
                          v32 = v322;
                          v33 = v323;
                          v31 = v324;
                          v30 = obj;
                          v55 = v230;
                          goto LABEL_168;
                        }
                        goto LABEL_432;
                      }
                      goto LABEL_426;
                    }
                    if ([v210 isEqual:PKShareableCredentialsNotificationActionRoute])
                    {
                      long long v377 = 0u;
                      long long v378 = 0u;
                      long long v375 = 0u;
                      long long v376 = 0u;
                      id v350 = obj;
                      id v243 = [v350 countByEnumeratingWithState:&v375 objects:v424 count:16];
                      if (v243)
                      {
                        id v244 = v243;
                        v230 = 0;
                        v231 = 0;
                        uint64_t v245 = *(void *)v376;
                        v246 = (void *)PKShareableCredentialsNotificationActionIdentiferParameter;
                        v247 = (void *)PKShareableCredentialsPassThumbnailImageParameter;
                        do
                        {
                          for (m = 0; m != v244; m = (char *)m + 1)
                          {
                            if (*(void *)v376 != v245) {
                              objc_enumerationMutation(v350);
                            }
                            v249 = *(void **)(*((void *)&v375 + 1) + 8 * (void)m);
                            v250 = [v249 name];
                            if ([v246 isEqualToString:v250])
                            {
                              uint64_t v251 = [v249 value];

                              v230 = (void *)v251;
                            }
                            if ([v247 isEqualToString:v250])
                            {
                              v252 = [v249 value];
                              uint64_t v253 = [v252 pk_decodeHexadecimal];

                              v231 = (void *)v253;
                            }
                          }
                          id v244 = [v350 countByEnumeratingWithState:&v375 objects:v424 count:16];
                        }
                        while (v244);

                        if (v230)
                        {
                          BOOL v56 = 1;
                          [*((id *)a1[5] + 16) presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString:v230 passThumbnailImageData:v231 animated:1];
                          goto LABEL_433;
                        }
LABEL_432:
                        BOOL v56 = 0;
                        goto LABEL_433;
                      }
LABEL_426:

                      BOOL v56 = 0;
                      v231 = 0;
                      v230 = 0;
                      goto LABEL_433;
                    }
                    if (![v210 isEqual:PKAddShareableConfigurationActionRoute]
                      || (PKStockholmEnvironmentIsLikelyProduction() & 1) != 0)
                    {
                      if ([v210 isEqualToString:PKUserNotificationActionRouteInvitationInbox])
                      {
                        if ((unint64_t)v14 < 2)
                        {
                          v254 = 0;
                        }
                        else
                        {
                          v254 = [v324 objectAtIndexedSubscript:1];
                        }
                        v281 = (void *)*((void *)a1[5] + 16);
                        v364[0] = _NSConcreteStackBlock;
                        v364[1] = 3221225472;
                        v364[2] = sub_100006CC4;
                        v364[3] = &unk_100018C40;
                        id v365 = v254;
                        id v282 = v254;
                        [v281 presentInvitationsInboxAnimated:1 completion:v364];

                        goto LABEL_245;
                      }
                      if ([v210 isEqualToString:PKUserNotificationActionRouteJointOffer])
                      {
                        if ((unint64_t)v14 < 2)
                        {
                          v168 = 0;
                        }
                        else
                        {
                          v168 = [v324 objectAtIndexedSubscript:1];
                          if (v14 != (id)2)
                          {
                            uint64_t v255 = [v324 objectAtIndexedSubscript:2];
                            v169 = v255;
                            if (v168 && v255) {
                              [*((id *)a1[5] + 16) presentInvitationWithIdentifier:v255 forAccountWithIdentifier:v168 completion:0];
                            }
                            goto LABEL_363;
                          }
                        }
                        v169 = 0;
                        goto LABEL_363;
                      }
                      v283 = (void *)PKURLActionRouteCreditAccountAddUser;
                      v284 = v210;
                      v285 = v283;
                      v353 = v284;
                      if (v284 == v285)
                      {
                      }
                      else
                      {
                        v286 = v285;
                        if (!v164 || !v285)
                        {

LABEL_494:
                          if ([v284 isEqual:PKUserNotificationActionRoutePayLaterViewFinancingPlan])
                          {
                            long long v362 = 0u;
                            long long v363 = 0u;
                            long long v360 = 0u;
                            long long v361 = 0u;
                            id v217 = obj;
                            id v288 = [v217 countByEnumeratingWithState:&v360 objects:v420 count:16];
                            if (!v288) {
                              goto LABEL_425;
                            }
                            id v289 = v288;
                            id v290 = 0;
                            uint64_t v291 = *(void *)v361;
                            id v292 = (id)PKUserNotificationActionQueryItemFinancingPlanIdentifier;
LABEL_497:
                            uint64_t v293 = 0;
                            while (1)
                            {
                              if (*(void *)v361 != v291) {
                                objc_enumerationMutation(v217);
                              }
                              v294 = *(void **)(*((void *)&v360 + 1) + 8 * v293);
                              v295 = [v294 name];
                              v296 = [v294 value];
                              if (![v296 length]) {
                                goto LABEL_511;
                              }
                              id v297 = v295;
                              if (v297 == v292)
                              {
                              }
                              else
                              {
                                v298 = v297;
                                if (v297) {
                                  BOOL v299 = v292 == 0;
                                }
                                else {
                                  BOOL v299 = 1;
                                }
                                if (v299) {
                                  goto LABEL_510;
                                }
                                unsigned int v300 = [v297 isEqualToString:v292];

                                if (!v300) {
                                  goto LABEL_511;
                                }
                              }
                              v298 = v290;
                              id v290 = v296;
LABEL_510:

LABEL_511:
                              if (v289 == (id)++v293)
                              {
                                id v289 = [v217 countByEnumeratingWithState:&v360 objects:v420 count:16];
                                if (!v289)
                                {

                                  v32 = v322;
                                  v33 = v323;
                                  v31 = v324;
                                  if (v290)
                                  {
                                    [*((id *)a1[5] + 16) presentPayLaterFinancingPlanWithIdentifier:v290];

                                    goto LABEL_515;
                                  }
LABEL_152:

                                  uint64_t v1 = v319;
                                  id v4 = v321;
                                  goto LABEL_169;
                                }
                                goto LABEL_497;
                              }
                            }
                          }
                          if ([v284 isEqualToString:PKUserNotificationActionRouteOrders])
                          {
                            v301 = (void *)*((void *)a1[5] + 16);
                            v356[0] = _NSConcreteStackBlock;
                            v356[1] = 3221225472;
                            v356[2] = sub_100006CDC;
                            v356[3] = &unk_100018C68;
                            id v357 = a1[6];
                            id v359 = v14;
                            v31 = v324;
                            id v358 = v324;
                            [v301 presentOrderManagementAnimated:1 completion:v356];

                            v32 = v322;
                            goto LABEL_246;
                          }
                          if ([v284 isEqual:PKUserNotificationActionRouteImportSafariCardConsent])
                          {
                            id v180 = [a1[6] objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
                            uint64_t v302 = [v180 isEqualToString:PKSpringBoardBundleIdentifier] ^ 1;
                            id v303 = objc_alloc_init((Class)PKPaymentService);
                            [v303 clearSafariCardImportNotificationsWithCompletion:0];
                            [*((id *)a1[5] + 16) presentImportSafariCardConsentAnimated:1 referralSource:v302 completion:0];
                          }
                          else
                          {
                            if (![v284 isEqual:PKUserNotificationActionRouteAddPaymentCard])
                            {
                              if (![v284 isEqual:PKURLActionRouteIssuer])
                              {
                                v32 = v322;
                                v33 = v323;
                                v31 = v324;
                                if ([v284 isEqual:PKURLActionRouteConnectedCards]&& (unint64_t)v14 >= 2)
                                {
                                  v55 = [v324 objectAtIndexedSubscript:1];
                                  unsigned int v304 = [v55 isEqual:PKURLSubactionRouteBackgroundRefreshConfirmation];
                                  BOOL v56 = v304;
                                  if (v304) {
                                    [*((id *)a1[5] + 16) presentBackgroundRefreshConfirmationAnimated:1];
                                  }
                                  id v4 = v321;
                                  v32 = v322;
                                  v33 = v323;
                                  v31 = v324;
                                  v30 = obj;
                                  goto LABEL_168;
                                }
                                goto LABEL_152;
                              }
                              v168 = [a1[5] _bankConnectAuthorizationRedirectURLFromPathComponents:v324 queryItems:obj];
                              if (v168)
                              {
                                [a1[5] _presentBankConnectAuthorizationViewControllerWithRedirectURL:v168];

LABEL_515:
                                v32 = v353;
                                goto LABEL_147;
                              }
                              v169 = PKLogFacilityTypeGetObject();
                              if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR)) {
                                sub_10000F9CC(v169);
                              }
                              goto LABEL_363;
                            }
                            id v180 = objc_alloc_init((Class)PKPaymentService);
                            [v180 clearSafariCardImportNotificationsWithCompletion:0];
                            [*((id *)a1[5] + 16) presentPaymentSetupInMode:0 referrerIdentifier:0 paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:0 productIdentifiers:0];
                          }
LABEL_297:

LABEL_245:
                          v32 = v322;
                          v31 = v324;
LABEL_246:
                          v33 = v323;
                          goto LABEL_145;
                        }
                        unsigned int v287 = [v284 isEqualToString:v285];

                        if (!v287) {
                          goto LABEL_494;
                        }
                      }
                      [*((id *)a1[5] + 16) presentCreateAccountUserInvitationWithCompletion:0];
                      goto LABEL_245;
                    }
                    logd = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(logd, OS_LOG_TYPE_DEFAULT))
                    {
                      id v256 = *v319;
                      *(_DWORD *)buf = 138543362;
                      id v435 = v256;
                      _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "Handling addShareable route for url: %{public}@", buf, 0xCu);
                    }

                    long long v373 = 0u;
                    long long v374 = 0u;
                    long long v371 = 0u;
                    long long v372 = 0u;
                    id v351 = obj;
                    id v257 = [v351 countByEnumeratingWithState:&v371 objects:v423 count:16];
                    if (!v257)
                    {

                      v342 = 0;
                      goto LABEL_488;
                    }
                    id v258 = v257;
                    v259 = 0;
                    v342 = 0;
                    uint64_t v260 = *(void *)v372;
                    v261 = (void *)PKAddShareableConfigurationActionConfigurationParameter;
                    v330 = (void *)PKAddShareableConfigurationActionTitleParameter;
LABEL_444:
                    uint64_t v262 = 0;
                    while (1)
                    {
                      if (*(void *)v372 != v260) {
                        objc_enumerationMutation(v351);
                      }
                      v263 = *(void **)(*((void *)&v371 + 1) + 8 * v262);
                      v264 = [v263 name];
                      if ([v261 isEqualToString:v264]) {
                        break;
                      }
                      if ([v330 isEqualToString:v264])
                      {
                        [v263 value];
                        v342 = v266 = v342;
LABEL_459:
                      }
                      if (v258 == (id)++v262)
                      {
                        id v258 = [v351 countByEnumeratingWithState:&v371 objects:v423 count:16];
                        if (!v258)
                        {

                          if (v259)
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v422 = v259;
                              uint64_t v270 = +[NSArray arrayWithObjects:&v422 count:1];

                              v259 = (void *)v270;
                            }
                            v271 = objc_alloc_init((Class)NSMutableArray);
                            long long v366 = 0u;
                            long long v367 = 0u;
                            long long v368 = 0u;
                            long long v369 = 0u;
                            id v352 = v259;
                            id v272 = [v352 countByEnumeratingWithState:&v366 objects:v421 count:16];
                            if (v272)
                            {
                              id v273 = v272;
                              uint64_t v274 = *(void *)v367;
                              do
                              {
                                for (n = 0; n != v273; n = (char *)n + 1)
                                {
                                  if (*(void *)v367 != v274) {
                                    objc_enumerationMutation(v352);
                                  }
                                  v276 = *(void **)(*((void *)&v366 + 1) + 8 * (void)n);
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v277 = [objc_alloc((Class)PKPushProvisioningTarget) initWithProvisioningDict:v276];
                                    id v278 = [objc_alloc((Class)PKShareablePassMetadata) initWithPushProvisioningTarget:v277];
                                    v279 = [v278 preview];
                                    [v279 setLocalizedDescription:v342];
                                    [v271 addObject:v278];
                                  }
                                  else
                                  {
                                    v277 = logd;
                                    if (os_log_type_enabled(logd, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 138543362;
                                      id v435 = v276;
                                      v277 = logd;
                                      _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "Failed to parse raw provisioning target due to it not being a dictionary. \n %{public}@", buf, 0xCu);
                                    }
                                  }
                                }
                                id v273 = [v352 countByEnumeratingWithState:&v366 objects:v421 count:16];
                              }
                              while (v273);
                            }

                            id v280 = [v271 count];
                            BOOL v56 = v280 != 0;
                            if (v280)
                            {
                              os_log_t loge = (os_log_t)[objc_alloc((Class)PKAddShareablePassConfiguration) initWithPrimaryAction:0 credentialsMetadata:v271];
                              [*((id *)a1[5] + 16) presentAddShareablePassConfiguration:animated:];
                            }
                            else
                            {
                              if (os_log_type_enabled(logd, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "Failed to addShareable route due to no metadatas", buf, 2u);
                              }
                            }
                            goto LABEL_521;
                          }
LABEL_488:
                          if (os_log_type_enabled(logd, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)buf = 0;
                            v271 = logd;
                            _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "Failed to addShareable route due to missing configuration", buf, 2u);
                            id v352 = 0;
                            BOOL v56 = 0;
                          }
                          else
                          {
                            id v352 = 0;
                            BOOL v56 = 0;
                            v271 = logd;
                          }
LABEL_521:

                          id v4 = v321;
                          v32 = v322;
                          v33 = v323;
                          v31 = v324;
                          v30 = obj;
                          v55 = v352;
                          goto LABEL_168;
                        }
                        goto LABEL_444;
                      }
                    }
                    v265 = [v263 value];
                    v266 = [v265 pk_decodeURLBase64];

                    if (v266)
                    {
                      id v370 = 0;
                      uint64_t v267 = +[NSJSONSerialization JSONObjectWithData:v266 options:0 error:&v370];
                      id v268 = v370;

                      if (v267) {
                        BOOL v269 = v268 == 0;
                      }
                      else {
                        BOOL v269 = 0;
                      }
                      if (!v269)
                      {
                        if (os_log_type_enabled(logd, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v435 = v268;
                          _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "Handling failed to deserialization addShareable json with error: %{public}@", buf, 0xCu);
                        }
                      }
                      v259 = (void *)v267;
                    }
                    goto LABEL_459;
                  }
                  unsigned int v213 = [v210 isEqualToString:v211];

                  if (!v213) {
                    goto LABEL_389;
                  }
                }
                long long v385 = 0u;
                long long v386 = 0u;
                long long v383 = 0u;
                long long v384 = 0u;
                id v214 = obj;
                id v215 = [v214 countByEnumeratingWithState:&v383 objects:v426 count:16];
                if (!v215)
                {
                  id v217 = v214;
                  goto LABEL_425;
                }
                id v216 = v215;
                id v217 = 0;
                uint64_t v218 = *(void *)v384;
                id v219 = (id)PKUserNotificationActionQueryItemPassUniqueIdentifier;
LABEL_370:
                uint64_t v220 = 0;
                while (1)
                {
                  if (*(void *)v384 != v218) {
                    objc_enumerationMutation(v214);
                  }
                  v221 = *(void **)(*((void *)&v383 + 1) + 8 * v220);
                  v222 = [v221 name];
                  v223 = [v221 value];
                  if (![v223 length]) {
                    goto LABEL_384;
                  }
                  id v224 = v222;
                  if (v224 == v219)
                  {
                  }
                  else
                  {
                    v225 = v224;
                    if (v224) {
                      BOOL v226 = v219 == 0;
                    }
                    else {
                      BOOL v226 = 1;
                    }
                    if (v226) {
                      goto LABEL_383;
                    }
                    unsigned int v227 = [v224 isEqualToString:v219];

                    if (!v227) {
                      goto LABEL_384;
                    }
                  }
                  v225 = v217;
                  id v217 = v223;
LABEL_383:

LABEL_384:
                  if (v216 == (id)++v220)
                  {
                    id v216 = [v214 countByEnumeratingWithState:&v383 objects:v426 count:16];
                    if (!v216)
                    {

                      v32 = v322;
                      v33 = v323;
                      v31 = v324;
                      if (!v217) {
                        goto LABEL_152;
                      }
                      [*((id *)a1[5] + 16) presentBalanceDetailsForPassUniqueIdentifier:v217 animated:1 completion:0];
LABEL_425:

LABEL_364:
                      v32 = v322;
                      v33 = v323;
                      v31 = v324;
                      goto LABEL_152;
                    }
                    goto LABEL_370;
                  }
                }
              }
            }
            long long v389 = 0u;
            long long v390 = 0u;
            long long v387 = 0u;
            long long v388 = 0u;
            id v186 = obj;
            id v187 = [v186 countByEnumeratingWithState:&v387 objects:v427 count:16];
            if (!v187)
            {
              v312 = v186;
LABEL_366:

              goto LABEL_364;
            }
            id v188 = v187;
            v312 = 0;
            uint64_t v315 = 0;
            id v349 = 0;
            uint64_t v189 = *(void *)v388;
            id v190 = (id)PKUserNotificationActionQueryItemSpendingSummaryType;
            id v341 = (id)PKUserNotificationActionQueryItemSpendingSummaryUnit;
            id v318 = (id)PKUserNotificationActionQueryItemSpendingSummaryCategorization;
            id v329 = (id)PKUserNotificationActionQueryItemPassUniqueIdentifier;
            uint64_t logc = 0x7FFFFFFFFFFFFFFFLL;
LABEL_312:
            uint64_t v191 = 0;
            while (1)
            {
              if (*(void *)v388 != v189) {
                objc_enumerationMutation(v186);
              }
              v192 = *(void **)(*((void *)&v387 + 1) + 8 * v191);
              v193 = [v192 name];
              v194 = [v192 value];
              if (![v194 length]) {
                goto LABEL_350;
              }
              id v195 = v193;
              if (v195 == v190) {
                break;
              }
              v196 = v195;
              if (v195) {
                BOOL v197 = v190 == 0;
              }
              else {
                BOOL v197 = 1;
              }
              if (v197)
              {
              }
              else
              {
                unsigned int v198 = [v195 isEqualToString:v190];

                if (v198) {
                  goto LABEL_325;
                }
              }
              id v199 = v196;
              if (v199 == v341)
              {

LABEL_332:
                uint64_t logc = (uint64_t)[v194 integerValue];
                goto LABEL_350;
              }
              v200 = v199;
              if (v196 && v341)
              {
                unsigned int v201 = [v199 isEqualToString:];

                if (v201) {
                  goto LABEL_332;
                }
              }
              else
              {
              }
              id v202 = v200;
              if (v202 == v318)
              {

LABEL_340:
                uint64_t v315 = PKSpendingSummaryCategorizationTypeForURLPathComponent();
                goto LABEL_350;
              }
              v203 = v202;
              if (v196 && v318)
              {
                unsigned int v204 = [v202 isEqualToString:];

                if (v204) {
                  goto LABEL_340;
                }
              }
              else
              {
              }
              id v205 = v203;
              if (v205 == v329)
              {
              }
              else
              {
                v206 = v205;
                if (!v196 || !v329)
                {

                  goto LABEL_350;
                }
                unsigned int v207 = [v205 isEqualToString:v329];

                if (!v207) {
                  goto LABEL_350;
                }
              }
              id v208 = v194;

              v312 = v208;
LABEL_350:

              if (v188 == (id)++v191)
              {
                id v188 = [v186 countByEnumeratingWithState:&v387 objects:v427 count:16];
                if (!v188)
                {

                  v32 = v322;
                  v33 = v323;
                  v31 = v324;
                  if (!v312) {
                    goto LABEL_152;
                  }
                  [*((id *)a1[5] + 16) presentSpendingSummaryForPassUniqueIdentifier:v312 type:v349 categorization:v315 unit:logc animated:1 completion:0];
                  goto LABEL_366;
                }
                goto LABEL_312;
              }
            }

LABEL_325:
            id v349 = [v194 integerValue];
            goto LABEL_350;
          }
          unsigned int v179 = [v176 isEqualToString:v177];

          if (!v179) {
            goto LABEL_304;
          }
        }
        v32 = v322;
        v33 = v323;
        v31 = v324;
        if ((unint64_t)v14 < 3) {
          goto LABEL_152;
        }
        v168 = [v324 objectAtIndex:1];
        v169 = [v324 objectAtIndex:2];
        if ([v168 length] && -[NSObject length](v169, "length")) {
          [*((id *)a1[5] + 16) presentInstallmentPlanWithIdentifier:v168 forAccountIdentifier:v169 completion:0];
        }
        goto LABEL_363;
      }
    }
    v32 = v322;
    v33 = v323;
    v31 = v324;
    if (v14 != (id)3) {
      goto LABEL_152;
    }
    v168 = [v324 objectAtIndex:1];
    v169 = [v324 objectAtIndex:2];
    if (![v168 length]) {
      goto LABEL_363;
    }
    v170 = (void *)PKVirtualCardRoutePassDetails;
    v171 = v169;
    v172 = v170;
    if (v171 == v172)
    {
    }
    else
    {
      v173 = v172;
      if (!v171 || !v172)
      {

        goto LABEL_363;
      }
      unsigned int v174 = [v171 isEqualToString:v172];

      if (!v174) {
        goto LABEL_363;
      }
    }
    [*((id *)a1[5] + 16) presentPassDetailsAssociatedWithVirtualCardID:v168 animated:1 completion:0];
LABEL_363:

    goto LABEL_364;
  }
  if (v14 != (id)3)
  {
    if (v14 != (id)2) {
      goto LABEL_152;
    }
    id v34 = [v324 lastObject];
    [*((id *)a1[5] + 16) presentPassWithUniqueID:v34 animated:1 completionHandler:0];
    goto LABEL_144;
  }
  v55 = [v324 objectAtIndexedSubscript:1];
  v58 = [v324 objectAtIndexedSubscript:2];
  v59 = PKPaymentPassActionTypeToString();
  unsigned int v60 = [v58 isEqualToString:v59];

  os_log_t loga = v58;
  if (v60)
  {
    BOOL v56 = 1;
    [*((id *)a1[5] + 16) presentActionViewControllerWithUniqueID:v55 actionType:1];
    id v4 = v321;
    goto LABEL_167;
  }
  v61 = PKPaymentPassActionTypeToString();
  unsigned int v62 = [v58 isEqualToString:v61];

  id v4 = v321;
  if (v62)
  {
    [*((id *)a1[5] + 16) presentActionViewControllerWithUniqueID:v55 actionType:2];
LABEL_79:
    BOOL v56 = 1;
    goto LABEL_167;
  }
  if ([v58 isEqualToString:PKUserNotificationViewPassPersistentEmulation])
  {
    id v63 = objc_alloc_init((Class)PKPassPresentationContext);
    BOOL v56 = 1;
    [v63 setPersistentCardEmulation:1];
    [*((id *)a1[5] + 16) presentPassWithUniqueID:v55 context:v63 animated:1 completionHandler:0];

    goto LABEL_167;
  }
  if ([v58 isEqualToString:PKUserNotificationActionRouteViewPassDetails])
  {
    BOOL v56 = 1;
    [*((id *)a1[5] + 16) presentPassDetailsWithUniqueID:v55 animated:1 completionHandler:0];
    goto LABEL_167;
  }
  if ([v58 isEqualToString:PKUserNotificationActionRouteCardInformation])
  {
    v73 = a1[5];
    v74 = (void *)v73[16];
    v415[0] = _NSConcreteStackBlock;
    v415[1] = 3221225472;
    v415[2] = sub_100006C10;
    v415[3] = &unk_100018C18;
    v415[4] = v73;
    BOOL v56 = 1;
    [v74 presentPassWithUniqueID:v55 animated:1 completionHandler:v415];
    goto LABEL_167;
  }
  if ([v58 isEqualToString:PKUserNotificationActionRouteViewPassExpressPromotion])
  {
    id v313 = objc_alloc_init((Class)NSMutableDictionary);
    long long v411 = 0u;
    long long v412 = 0u;
    long long v413 = 0u;
    long long v414 = 0u;
    id v75 = obj;
    id v76 = [v75 countByEnumeratingWithState:&v411 objects:v433 count:16];
    if (!v76)
    {
      uint64_t v327 = 0;
      v78 = 0;
      goto LABEL_165;
    }
    id v77 = v76;
    uint64_t v327 = 0;
    v78 = 0;
    uint64_t v79 = *(void *)v412;
    uint64_t v80 = PKUserNotificationActionQueryItemMarketIdentifier;
    id v345 = (id)PKUserNotificationActionQueryItemMarketNotificationAssetIdentifier;
    uint64_t v338 = PKUserNotificationActionQueryItemExpressModeEnabledHideDisableAction;
    uint64_t v316 = PKUserNotificationActionQueryItemMarketName;
    uint64_t v311 = PKUserNotificationActionQueryItemMarketRegion;
    uint64_t v309 = PKUserNotificationActionQueryItemEligibleMarkets;
    uint64_t v307 = PKUserNotificationActionQueryItemReferralSource;
    uint64_t v305 = PKAnalyticsReportReferralSourceKey;
    uint64_t v306 = PKAnalyticsReportEligibleMarketsKey;
    uint64_t v308 = PKAnalyticsReportMarketRegionKey;
    uint64_t v310 = PKAnalyticsReportMarketNameKey;
    while (1)
    {
      v81 = 0;
      do
      {
        if (*(void *)v412 != v79) {
          objc_enumerationMutation(v75);
        }
        v82 = *(void **)(*((void *)&v411 + 1) + 8 * (void)v81);
        v83 = [v82 name];
        if (([v83 isEqualToString:v80] & 1) != 0
          || [v83 isEqualToString:v345])
        {
          [v82 value];
          v78 = v84 = v78;
          goto LABEL_115;
        }
        if ([v83 isEqualToString:v338])
        {
          v84 = [v82 value];
          if ([v84 isEqualToString:@"true"])
          {
            uint64_t v85 = 1;
          }
          else
          {
            unsigned int v89 = [v84 isEqualToString:@"false"];
            uint64_t v85 = 2;
            if (!v89) {
              uint64_t v85 = 0;
            }
          }
          uint64_t v327 = v85;
          goto LABEL_115;
        }
        if ([v83 isEqualToString:v316])
        {
          v84 = [v82 value];
          v86 = v313;
          v87 = v84;
          uint64_t v88 = v310;
          goto LABEL_132;
        }
        if ([v83 isEqualToString:v311])
        {
          v84 = [v82 value];
          v86 = v313;
          v87 = v84;
          uint64_t v88 = v308;
          goto LABEL_132;
        }
        if ([v83 isEqualToString:v309])
        {
          v84 = [v82 value];
          v86 = v313;
          v87 = v84;
          uint64_t v88 = v306;
          goto LABEL_132;
        }
        if ([v83 isEqualToString:v307])
        {
          v84 = [v82 value];
          v86 = v313;
          v87 = v84;
          uint64_t v88 = v305;
LABEL_132:
          [v86 safelySetObject:v87 forKey:v88];
LABEL_115:
        }
        v81 = (char *)v81 + 1;
      }
      while (v77 != v81);
      id v90 = [v75 countByEnumeratingWithState:&v411 objects:v433 count:16];
      id v77 = v90;
      if (!v90)
      {
LABEL_165:

        BOOL v56 = 1;
        [*((id *)a1[5] + 16) presentExpressUpgradeDetailForPassUniqueID:v55 assetIdentifier:v78 hideDisableAction:v327 reportingMetadata:v313 animated:1 completionHandler:0];

        id v4 = v321;
        goto LABEL_166;
      }
    }
  }
  if ([v58 isEqualToString:PKUserNotificationActionRouteViewISO18013Details])
  {
    BOOL v56 = 1;
    [*((id *)a1[5] + 16) presentISO18013DetailsForPassUniqueIdentifier:v55 animated:1 completion:0];
    goto LABEL_167;
  }
  id v346 = v55;
  if ([v58 isEqualToString:PKUserNotificationActionRouteViewShareDetails])
  {
    long long v410 = 0u;
    long long v409 = 0u;
    long long v408 = 0u;
    long long v407 = 0u;
    id v94 = obj;
    id v95 = [v94 countByEnumeratingWithState:&v407 objects:v432 count:16];
    if (v95)
    {
      id v96 = v95;
      v97 = 0;
      uint64_t v98 = *(void *)v408;
      uint64_t v99 = PKUserNotificationActionQueryItemShareIdentifiers;
      do
      {
        for (ii = 0; ii != v96; ii = (char *)ii + 1)
        {
          if (*(void *)v408 != v98) {
            objc_enumerationMutation(v94);
          }
          v101 = *(void **)(*((void *)&v407 + 1) + 8 * (void)ii);
          v102 = [v101 name];
          unsigned int v103 = [v102 isEqualToString:v99];

          if (v103)
          {
            v104 = [v101 value];
            uint64_t v105 = [v104 componentsSeparatedByString:@","];

            v97 = (void *)v105;
          }
          v55 = v346;
        }
        id v96 = [v94 countByEnumeratingWithState:&v407 objects:v432 count:16];
      }
      while (v96);
    }
    else
    {
      v97 = 0;
    }

    if ((unint64_t)[v97 count] > 1)
    {
      v123 = 0;
    }
    else
    {
      v123 = [v97 firstObject];
    }
    id v4 = v321;
    v32 = v322;
    v33 = v323;
    v31 = v324;
    v30 = obj;
    [*((id *)a1[5] + 16) presentShareDetailsForPassUniqueIdentifier:v55 shareIdentifier:v123];

    goto LABEL_79;
  }
  if ([v58 isEqualToString:PKUserNotificationActionRouteViewEntitlementDetails])
  {
    [*((id *)a1[5] + 16) presentEntitlementDetailsForPassUniqueIdentifier:v55];
    goto LABEL_79;
  }
  if ([v58 isEqualToString:PKUserNotificationActionRouteSetupVirtualCardNumber])
  {
    BOOL v56 = 1;
    [*((id *)a1[5] + 16) presentSetupVirtualCardNumberForPassUniqueIdentifier:v55 animated:1 completion:0];
LABEL_270:
    id v4 = v321;
    v32 = v322;
LABEL_166:
    v33 = v323;
    v31 = v324;
    v30 = obj;
    goto LABEL_167;
  }
  v126 = PKPaymentPassActionTypeToString();
  unsigned int v127 = [v58 isEqualToString:v126];

  if (!v127)
  {
    if (![v58 isEqualToString:PKUserNotificationActionRoutePerformPrecursorPassUpdate])
    {
      BOOL v56 = 0;
      goto LABEL_280;
    }
    [*((id *)a1[5] + 16) presentPrecursorPassUpdateForPassUniqueIdentifier:v55];
    BOOL v56 = 1;
    goto LABEL_270;
  }
  long long v406 = 0u;
  long long v404 = 0u;
  long long v405 = 0u;
  long long v403 = 0u;
  id v128 = obj;
  id v129 = [v128 countByEnumeratingWithState:&v403 objects:v431 count:16];
  if (!v129)
  {

    BOOL v56 = 0;
    v146 = 0;
    v131 = 0;
    goto LABEL_279;
  }
  id v130 = v129;
  v340 = 0;
  v131 = 0;
  uint64_t v132 = *(void *)v404;
  id v133 = (id)PKUserNotificationActionQueryItemAuxiliaryPassInformationIdentifier;
  id v134 = (id)PKUserNotificationActionQueryItemAuxiliaryPassInformationItemIdentifier;
  while (2)
  {
    uint64_t v135 = 0;
    while (2)
    {
      if (*(void *)v404 != v132) {
        objc_enumerationMutation(v128);
      }
      v136 = *(void **)(*((void *)&v403 + 1) + 8 * v135);
      id v137 = [v136 name];
      if (v137 == v133)
      {

        goto LABEL_225;
      }
      v138 = v137;
      if (v137) {
        BOOL v139 = v133 == 0;
      }
      else {
        BOOL v139 = 1;
      }
      if (v139)
      {
      }
      else
      {
        unsigned int v140 = [v137 isEqualToString:v133];

        if (v140)
        {
LABEL_225:
          [v136 value];
          v131 = v141 = v131;
          goto LABEL_236;
        }
      }
      id v142 = [v136 name];
      if (v142 == v134)
      {

        goto LABEL_235;
      }
      v141 = v142;
      if (v142) {
        BOOL v143 = v134 == 0;
      }
      else {
        BOOL v143 = 1;
      }
      if (v143)
      {

        goto LABEL_236;
      }
      unsigned int v144 = [v142 isEqualToString:v134];

      if (v144)
      {
LABEL_235:
        [v136 value];
        v340 = v141 = v340;
LABEL_236:
      }
      if (v130 != (id)++v135) {
        continue;
      }
      break;
    }
    id v130 = [v128 countByEnumeratingWithState:&v403 objects:v431 count:16];
    if (v130) {
      continue;
    }
    break;
  }

  id v145 = v340;
  v146 = v145;
  if (v145 && (id v147 = [v145 length], v146, v147))
  {
    [*((id *)a1[5] + 16) presentAuxiliaryPassInformationItemDetailForItemIdentifier:v146 informationIdentifier:v131 forPassUniqueID:v346 completion:0];
    BOOL v56 = 1;
  }
  else
  {
    BOOL v56 = 0;
  }
LABEL_279:

LABEL_280:
  id v4 = v321;
  v32 = v322;
  v33 = v323;
  v31 = v324;
  v30 = obj;
  v55 = v346;
LABEL_167:

LABEL_168:
  uint64_t v1 = v319;
  if (!v56)
  {
LABEL_169:
    v32 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10000F950((uint64_t *)v1, v32);
    }
    goto LABEL_171;
  }
LABEL_172:
}

void sub_100006C10(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
      [v5 presentCardNumbers];
    }
  }
}

void *sub_100006CC4(void *result, void *a2)
{
  if (a2)
  {
    if (result[4]) {
      return [a2 presentInboxMessageWithIdentifier:];
    }
  }
  return result;
}

void sub_100006CDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
  if ([v4 isEqualToString:@"com.apple.springboard"])
  {
    v18[0] = PKAnalyticsReportEventKey;
    v18[1] = PKAnalyticsReportReferralSourceKey;
    v19[0] = PKAnalyticsReportEventTypeButtonTap;
    v19[1] = PKAnalyticsReportReferralSourceNotification;
    id v5 = v19;
    id v6 = v18;
    uint64_t v7 = 2;
  }
  else
  {
    if (![v4 isEqualToString:@"com.apple.Passbook"]) {
      goto LABEL_7;
    }
    v16[0] = PKAnalyticsReportEventKey;
    v16[1] = PKAnalyticsReportReferralSourceKey;
    v17[0] = PKAnalyticsReportEventTypeButtonTap;
    v17[1] = PKAnalyticsReportReferralSourceWallet;
    v16[2] = PKAnalyticsReportLaunchTypeKey;
    v17[2] = PKAnalyticsReportLaunchTypeSummaryTile;
    id v5 = v17;
    id v6 = v16;
    uint64_t v7 = 3;
  }
  unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v6 count:v7];
  if (v8)
  {
    +[PKAnalyticsReporter subject:PKAnalyticsSubjectOrderManagementWallet sendEvent:v8];
  }
LABEL_7:
  if (*(void *)(a1 + 48) >= 3uLL)
  {
    v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
    id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2];
    if (*(void *)(a1 + 48) < 5uLL)
    {
      [v3 showDetailsForOrderTypeIdentifier:v9 orderIdentifier:v10 fulfillmentIdentifier:0 sourceApplication:v4];
LABEL_17:

      goto LABEL_18;
    }
    id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:3];
    if ([v11 isEqualToString:@"fulfillments"])
    {
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = 4;
    }
    else
    {
      unsigned int v14 = [v11 isEqualToString:@"returns"];
      id v12 = *(void **)(a1 + 40);
      if (v14)
      {
        id v15 = [v12 objectAtIndexedSubscript:4];
        [v3 showReturnDetailsForOrderTypeIdentifier:v9 orderIdentifier:v10 returnIdentifier:v15 sourceApplication:v4];
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v13 = 3;
    }
    id v15 = [v12 objectAtIndexedSubscript:v13];
    [v3 showDetailsForOrderTypeIdentifier:v9 orderIdentifier:v10 fulfillmentIdentifier:v15 sourceApplication:v4];
    goto LABEL_16;
  }
LABEL_18:
}

void sub_100006F88(uint64_t a1, void *a2)
{
  uint64_t v3 = PKAnalyticsSubjectOrderManagementWallet;
  v6[0] = PKAnalyticsReportEventKey;
  v6[1] = PKAnalyticsReportReferralSourceKey;
  v7[0] = PKAnalyticsReportEventTypeButtonTap;
  v7[1] = PKAnalyticsReportReferralSourceShareLink;
  id v4 = a2;
  id v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  +[PKAnalyticsReporter subject:v3 sendEvent:v5];

  [v4 addOrderAtURL:*(void *)(a1 + 32)];
}

id sub_100007324(uint64_t a1, void *a2)
{
  return [a2 didReceiveAppAuthorizationRedirectToURL:*(void *)(a1 + 32)];
}

void sub_10000B0A8(uint64_t a1)
{
  id v2 = +[PKDiscoveryService sharedInstance];
  [v2 discoveryItemWithIdentifier:*(void *)(a1 + 32) launchedWithReferralSource:1];
}

void *sub_10000B104(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentPassDetailsWithUniqueID:animated:completionHandler:];
    }
  }
  return result;
}

void *sub_10000B12C(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentSearchWithCompletion:0];
    }
  }
  return result;
}

void *sub_10000B150(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentPassDetailsWithUniqueID:animated:action:completionHandler:];
    }
  }
  return result;
}

void sub_10000B17C(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 && (a2 & 1) == 0)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
    [v3 presentCardNumbers];
  }
}

void *sub_10000B1D8(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentPeerPaymentTransferToBank];
    }
  }
  return result;
}

BOOL sub_10000B1F8(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = v4;
  if (v4 == @"/")
  {
    LOBYTE(v6) = 0;
  }
  else if (v4)
  {
    unsigned int v6 = [(__CFString *)v4 isEqualToString:@"/"] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

void *sub_10000B264(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentPassDetailsWithUniqueID:animated:action:completionHandler:];
    }
  }
  return result;
}

void *sub_10000B28C(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentAccountServiceSchedulePayment:billPayAmountType:billPayAmount:completion:];
    }
  }
  return result;
}

void *sub_10000B2B8(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentBalanceDetailsForPassUniqueIdentifier:animated:completion:];
    }
  }
  return result;
}

void *sub_10000B2E0(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) showStatementForIdentifier:result[5] passUniqueIdentifier:a3 animated:0 completion:0];
    }
  }
  return result;
}

void *sub_10000B30C(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentInstallmentPlansForFeature:2 completion:0];
    }
  }
  return result;
}

void *sub_10000B334(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentSearchWithCompletion:0];
    }
  }
  return result;
}

void sub_10000B358(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B40C;
    block[3] = &unk_100018DC0;
    block[4] = *(void *)(a1 + 32);
    id v6 = v3;
    long long v7 = *(_OWORD *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10000B40C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  id v3 = [*(id *)(a1 + 40) associatedPassUniqueID];
  [v2 presentSpendingSummaryForPassUniqueIdentifier:v3 type:*(void *)(a1 + 48) categorization:*(void *)(a1 + 56) unit:*(void *)(a1 + 64) animated:1 completion:0];
}

void sub_10000B480(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
    [v4 presentCardNumbers];
  }
}

void *sub_10000B530(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentRewardsHubForPassUniqueIdentifier:animated:completion:];
    }
  }
  return result;
}

void *sub_10000B558(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentAccountPromotionForPassUniqueIdentifier:programIdentifier:animated:completion:];
    }
  }
  return result;
}

void *sub_10000B580(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentRewardsHubMerchantsForPassUniqueIdentifier:privateIdentifier:animated:completion:];
    }
  }
  return result;
}

BOOL sub_10000B5A8(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = v4;
  if (v4 == @"/")
  {
    LOBYTE(v6) = 0;
  }
  else if (v4)
  {
    unsigned int v6 = [(__CFString *)v4 isEqualToString:@"/"] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

void *sub_10000B614(void *result, char a2, uint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) == 0) {
      return [*(id *)(result[4] + 128) presentPassDetailsWithUniqueID:animated:completionHandler:];
    }
  }
  return result;
}

BOOL sub_10000B63C(id a1, NSURLQueryItem *a2)
{
  id v2 = [(NSURLQueryItem *)a2 name];
  id v3 = (void *)PKVerificationDeviceAccountIdentifierKey;
  id v4 = v2;
  id v5 = v3;
  unsigned int v6 = v5;
  if (v4 == v5)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = 0;
    if (v4 && v5) {
      unsigned __int8 v7 = [v4 isEqualToString:v5];
    }
  }

  return v7;
}

BOOL sub_10000B6C4(id a1, NSURLQueryItem *a2)
{
  id v2 = [(NSURLQueryItem *)a2 name];
  id v3 = (void *)PKVerificationSuccessKey;
  id v4 = v2;
  id v5 = v3;
  unsigned int v6 = v5;
  if (v4 == v5)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = 0;
    if (v4 && v5) {
      unsigned __int8 v7 = [v4 isEqualToString:v5];
    }
  }

  return v7;
}

void *sub_10000B74C(void *result, void *a2)
{
  if (a2)
  {
    if (result[4]) {
      return [a2 presentInboxMessageWithIdentifier:];
    }
  }
  return result;
}

BOOL sub_10000B764(id a1, NSURLQueryItem *a2)
{
  id v2 = [(NSURLQueryItem *)a2 name];
  id v3 = (void *)PKURLShareReferralSourceQueryItemKey;
  id v4 = v2;
  id v5 = v3;
  unsigned int v6 = v5;
  if (v4 == v5)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = 0;
    if (v4 && v5) {
      unsigned __int8 v7 = [v4 isEqualToString:v5];
    }
  }

  return v7;
}

BOOL sub_10000B7EC(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = v4;
  if (v4 == @"/")
  {
    LOBYTE(v6) = 0;
  }
  else if (v4)
  {
    unsigned int v6 = [(__CFString *)v4 isEqualToString:@"/"] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

BOOL sub_10000B858(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = v4;
  if (v4 == @"/")
  {
    LOBYTE(v6) = 0;
  }
  else if (v4)
  {
    unsigned int v6 = [(__CFString *)v4 isEqualToString:@"/"] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

id sub_10000BA64(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) presentPassDetailsWithUniqueID:*(void *)(a1 + 40) animated:1 completionHandler:0];
}

void sub_10000BE88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unsigned __int8 v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to re-direct url: %@ to Safari with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void sub_10000C250(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 transaction];
    id v6 = [v4 primaryAccountIdentifier];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C3B4;
    block[3] = &unk_100018CB8;
    block[4] = *(void *)(a1 + 40);
    id v11 = v5;
    id v12 = v6;
    id v7 = v6;
    uint64_t v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to retrieve a response with transaction for url %@", buf, 0xCu);
    }
  }
}

id sub_10000C3B4(void *a1)
{
  return [*(id *)(a1[4] + 128) presentTransactionDetailsForBankConnectTransaction:a1[5] applePayPrimaryAccountIdentifier:a1[6]];
}

void sub_10000C3D0(uint64_t a1, void *a2)
{
  uint64_t v3 = PKAnalyticsSubjectOrderManagementWallet;
  v6[0] = PKAnalyticsReportEventKey;
  v6[1] = PKAnalyticsReportReferralSourceKey;
  v7[0] = PKAnalyticsReportEventTypeButtonTap;
  v7[1] = PKAnalyticsReportReferralSourceSiriSpotlight;
  id v4 = a2;
  id v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  +[PKAnalyticsReporter subject:v3 sendEvent:v5];

  [v4 showDetailsForOrder:*(void *)(a1 + 32)];
}

void sub_10000C4D0(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
    [v4 presentCardNumbers];
  }
}

void sub_10000C658(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C70C;
  v5[3] = &unk_100018CB8;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 updatePassesIfNecessaryWithCompletion:v5];
}

void sub_10000C70C(id *a1)
{
  id v2 = [a1[4] activityType];
  if ([v2 isEqualToString:PKViewPassUserActivityType])
  {
    id v3 = [a1[5] objectForKey:PKViewPassUserActivityPassKey];
    if (v3) {
      [*((id *)a1[6] + 16) presentPassWithUniqueID:v3 animated:1 completionHandler:0];
    }
  }
  else if ([v2 isEqualToString:PKPassListUserActivityType])
  {
    [*((id *)a1[6] + 16) presentInitialState:0];
  }
  else if ([v2 isEqualToString:PKViewOrderUserActivityType])
  {
    uint64_t v4 = [a1[5] objectForKeyedSubscript:PKViewOrderUserActivityOrderIdentifierKey];
    id v5 = [a1[5] objectForKeyedSubscript:PKViewOrderUserActivityOrderTypeIdentifierKey];
    id v6 = [a1[5] objectForKeyedSubscript:PKViewOrderUserActivityOrderFulfillmentIdentifierKey];
    id v7 = (void *)*((void *)a1[6] + 16);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000C95C;
    v13[3] = &unk_100018F68;
    id v14 = v5;
    id v15 = v4;
    id v16 = v6;
    id v8 = v6;
    id v9 = v4;
    id v10 = v5;
    [v7 presentOrderManagementAnimated:1 completion:v13];
  }
  else if ([v2 isEqualToString:CSSearchableItemActionType])
  {
    [a1[6] _handleSpotlightWithUserActivity:a1[4]];
  }
  else
  {
    id v11 = [a1[4] activityType];
    unsigned int v12 = [v11 isEqual:NSUserActivityTypeBrowsingWeb];

    if (v12) {
      [a1[6] _handleUniversalLinkWithUserActivity:a1[4]];
    }
  }
}

void sub_10000C95C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1[4] && a1[5])
  {
    uint64_t v4 = PKAnalyticsSubjectOrderManagementWallet;
    v6[0] = PKAnalyticsReportEventKey;
    v6[1] = PKAnalyticsReportReferralSourceKey;
    v7[0] = PKAnalyticsReportEventTypeButtonTap;
    v7[1] = PKAnalyticsReportReferralSourceSiriSpotlight;
    id v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    +[PKAnalyticsReporter subject:v4 sendEvent:v5];

    [v3 showDetailsForOrderTypeIdentifier:a1[4] orderIdentifier:a1[5] fulfillmentIdentifier:a1[6] sourceApplication:0];
  }
}

void sub_10000CB84(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Error processing Discovery Items after entering foreground: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10000CC38(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    id v2 = +[UIApplication sharedApplication];
    [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

void sub_10000CE64(id a1)
{
  id v1 = +[PKDiscoveryService sharedInstance];
  [v1 endReporingDiscoveryAnalytics];
}

id sub_10000CEAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id sub_10000D4C8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 128) pkui_frontMostViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 128) presentedViewController];
    uint64_t v4 = [v3 topViewController];

    id v2 = (void *)v4;
  }
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PKDeletePassIntentHandler]) {
    id v5 = [v2 handleDeletePassWithUniqueID:*(void *)(a1 + 40)];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void sub_10000D588(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 128);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000D694;
    v5[3] = &unk_100019120;
    void v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 48);
    [v4 updatePassesIfNecessaryWithCompletion:v5];
  }
}

void sub_10000D694(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 128);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D754;
  v4[3] = &unk_1000190F8;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v3 presentPassWithUniqueID:v2 animated:1 completionHandler:v4];
}

uint64_t sub_10000D754(uint64_t a1, int a2)
{
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_10000D850(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 128) pkui_frontMostViewController];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v5;
    uint64_t v3 = [v2 topViewController];
    unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PKPassDeleteHandler];

    id v5 = v2;
    if (v4)
    {
      id v5 = [v2 topViewController];
    }
  }
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___PKPassDeleteHandler]) {
    [v5 handleDeletePassRequestWithPass:*(void *)(a1 + 40) forViewController:v5];
  }
}

void sub_10000DA04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 128);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DAB8;
  v4[3] = &unk_100018BF0;
  void v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 updatePassesIfNecessaryWithCompletion:v4];
}

void sub_10000DAB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 128);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DB68;
  v5[3] = &unk_100019170;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 presentPassWithUniqueID:v2 animated:1 completionHandler:v5];
}

void sub_10000DB68(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 128) pkui_frontMostViewController];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 128) pkui_frontMostViewController];
      [v5 presentShareFlow];
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
      }
    }
  }
}

void sub_10000DD34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 128);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DDE4;
  v5[3] = &unk_100019170;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 presentPassWithUniqueID:v2 animated:1 completionHandler:v5];
}

void sub_10000DDE4(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 128) pkui_frontMostViewController];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 128) pkui_frontMostViewController];
      id v6 = [v5 presentAddMoney];
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
      }
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
      }
    }
  }
}

void sub_10000DFD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 128);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10000E09C;
  v6[3] = &unk_100019198;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 48);
  [v3 presentPassWithUniqueID:v2 animated:1 completionHandler:v6];
}

id sub_10000E09C(void *a1, int a2)
{
  uint64_t v2 = a1[6];
  if (a2 && v2) {
    return (id)(*(uint64_t (**)(void, void))(v2 + 16))(a1[6], 0);
  }
  else {
    return [*(id *)(a1[4] + 128) presentSearchWithQuery:a1[5] completion:v2];
  }
}

void sub_10000E1C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 128);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10000E290;
  v6[3] = &unk_1000191E8;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = v4;
  uint64_t v10 = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v3 updatePassesIfNecessaryWithCompletion:v6];
}

id sub_10000E290(void *a1)
{
  return [*(id *)(a1[4] + 128) presentAccountServiceSchedulePayment:a1[5] billPayAmountType:a1[8] billPayAmount:a1[6] completion:a1[7]];
}

Class sub_10000E3F0()
{
  if (qword_10001E188 != -1) {
    dispatch_once(&qword_10001E188, &stru_100019208);
  }
  Class result = objc_getClass("FKBankConnectSpotlightTransactionsProvider");
  qword_10001E178 = (uint64_t)result;
  off_10001DE10 = (uint64_t (*)())sub_10000E454;
  return result;
}

id sub_10000E454()
{
  return (id)qword_10001E178;
}

void sub_10000E460(id a1)
{
  qword_10001E180 = (uint64_t)dlopen("/System/Library/Frameworks/FinanceKit.framework/FinanceKit", 2);
}

id sub_10000E9A0(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finishing %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) finishedTest:*(void *)(a1 + 32)];
}

uint64_t sub_10000EE1C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000EF7C(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = (id *)&v14;
  uint64_t v4 = -1;
  while (1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F15C;
    block[3] = &unk_100018EF0;
    block[4] = *(void *)(a1 + 32);
    int v5 = v2;
    id v14 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6)) {
      break;
    }

    if ((unint64_t)++v4 >= 9)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000F290;
      v9[3] = &unk_100018EF0;
      id v7 = *(void **)(a1 + 40);
      v9[4] = *(void *)(a1 + 32);
      uint64_t v3 = &v10;
      id v10 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
      goto LABEL_6;
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F27C;
  v11[3] = &unk_100018EF0;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

LABEL_6:
}

void sub_10000F15C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000F1E4;
  v2[3] = &unk_100019258;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _presentEditPassesWithCompletion:v2];
}

void sub_10000F1E4(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F274;
  v3[3] = &unk_100018B78;
  id v4 = *(id *)(a1 + 32);
  [a2 dismissViewControllerAnimated:1 completion:v3];
}

intptr_t sub_10000F274(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10000F27C(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedTest:*(void *)(a1 + 40) withFailure:@"Presentation timeout."];
}

id sub_10000F290(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40)];
}

void sub_10000F3C4(uint64_t a1, void *a2)
{
  id v3 = [a2 topViewController];
  id v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);
  }

  id v15 = objc_alloc((Class)RPTScrollViewTestParameters);
  id v16 = *(void **)(a1 + 32);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_10000F5A4;
  id v23 = &unk_100018EF0;
  id v17 = v16;
  uint64_t v18 = *(void *)(a1 + 40);
  id v24 = v17;
  uint64_t v25 = v18;
  id v19 = [v15 initWithTestName:v17 scrollBounds:0 amplitude:&v20 direction:v6 + 100.0 completionHandler:v8 + 100.0 v10 + -200.0 v12 + -200.0 200.0];
  [v19 setPreventSheetDismissal:1 v20, v21, v22, v23];
  [v19 setShouldFlick:1];
  +[RPTTestRunner runTestWithParameters:v19];
}

id sub_10000F5A4(uint64_t a1)
{
  dispatch_semaphore_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finishing %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) finishedTest:*(void *)(a1 + 32)];
}

void sub_10000F780(uint64_t a1, void *a2)
{
  id v3 = [a2 topViewController];
  [v3 beginPassSelectionTestWithTestName:*(void *)(a1 + 32)];
}

void sub_10000F8FC(uint64_t a1, void *a2)
{
  id v3 = [a2 topViewController];
  [v3 beginPassDeletionTestWithTestName:*(void *)(a1 + 32)];
}

void sub_10000F950(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "didn't understand URL %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10000F9CC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to handle BankConnect auth redirect. The redirectURL is nil!", v1, 2u);
}

void sub_10000FA10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to handle core data splotlight activity with identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FA88(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PBKAppDelegate (%p): acquired foreground nearfield informative assertion %p.", (uint8_t *)&v3, 0x16u);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PKCurrentRegion()
{
  return _PKCurrentRegion();
}

uint64_t PKDateForString()
{
  return _PKDateForString();
}

uint64_t PKEqualObjects()
{
  return _PKEqualObjects();
}

uint64_t PKFeatureIdentifierFromString()
{
  return _PKFeatureIdentifierFromString();
}

uint64_t PKGetClassNFHardwareManager()
{
  return _PKGetClassNFHardwareManager();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKPassKitCoreBundle()
{
  return _PKPassKitCoreBundle();
}

uint64_t PKPaymentPassActionTypeToString()
{
  return _PKPaymentPassActionTypeToString();
}

uint64_t PKPeerPaymentPaymentModeFromString()
{
  return _PKPeerPaymentPaymentModeFromString();
}

uint64_t PKPeerPaymentRegistrationFlowStateFromString()
{
  return _PKPeerPaymentRegistrationFlowStateFromString();
}

uint64_t PKRadioTechnologyForConfigurationTechnology()
{
  return _PKRadioTechnologyForConfigurationTechnology();
}

uint64_t PKRadioTechnologyFromStrings()
{
  return _PKRadioTechnologyFromStrings();
}

uint64_t PKSecureElementIsAvailable()
{
  return _PKSecureElementIsAvailable();
}

uint64_t PKSpendingSummaryCategorizationTypeForURLPathComponent()
{
  return _PKSpendingSummaryCategorizationTypeForURLPathComponent();
}

uint64_t PKStockholmEnvironmentIsLikelyProduction()
{
  return _PKStockholmEnvironmentIsLikelyProduction();
}

uint64_t PKSubcredentialPairingReferralSourceFromString()
{
  return _PKSubcredentialPairingReferralSourceFromString();
}

uint64_t PKUserIntentIsAvailable()
{
  return _PKUserIntentIsAvailable();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKCurrencyAmountCreate(NSDecimalNumber *a1, NSString *a2, uint64_t a3)
{
  return PKCurrencyAmountCreate(a1, a2, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__createForegroundActiveResources(void *a1, const char *a2, ...)
{
  return [a1 _createForegroundActiveResources];
}

id objc_msgSend__destroyForegroundActiveResources(void *a1, const char *a2, ...)
{
  return [a1 _destroyForegroundActiveResources];
}

id objc_msgSend__executeForegroundActiveBlocksIfPossible(void *a1, const char *a2, ...)
{
  return [a1 _executeForegroundActiveBlocksIfPossible];
}

id objc_msgSend__presentLaunchPromptsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _presentLaunchPromptsIfNeeded];
}

id objc_msgSend__shouldBeginSubjectReportingWallet(void *a1, const char *a2, ...)
{
  return [a1 _shouldBeginSubjectReportingWallet];
}

id objc_msgSend__shouldEndSubjectReportingWallet(void *a1, const char *a2, ...)
{
  return [a1 _shouldEndSubjectReportingWallet];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_applicationIconBadgeNumber(void *a1, const char *a2, ...)
{
  return [a1 applicationIconBadgeNumber];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 associatedPassUniqueID];
}

id objc_msgSend_beginReporingDiscoveryAnalytics(void *a1, const char *a2, ...)
{
  return [a1 beginReporingDiscoveryAnalytics];
}

id objc_msgSend_beginSelectCardTest(void *a1, const char *a2, ...)
{
  return [a1 beginSelectCardTest];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cardsViewController(void *a1, const char *a2, ...)
{
  return [a1 cardsViewController];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_didBecomeActive(void *a1, const char *a2, ...)
{
  return [a1 didBecomeActive];
}

id objc_msgSend_didEnterBackground(void *a1, const char *a2, ...)
{
  return [a1 didEnterBackground];
}

id objc_msgSend_disableLaunchPromptsForSession(void *a1, const char *a2, ...)
{
  return [a1 disableLaunchPromptsForSession];
}

id objc_msgSend_enableLaunchPromptsForSession(void *a1, const char *a2, ...)
{
  return [a1 enableLaunchPromptsForSession];
}

id objc_msgSend_endReporingDiscoveryAnalytics(void *a1, const char *a2, ...)
{
  return [a1 endReporingDiscoveryAnalytics];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fragment(void *a1, const char *a2, ...)
{
  return [a1 fragment];
}

id objc_msgSend_gotoBaseTestState(void *a1, const char *a2, ...)
{
  return [a1 gotoBaseTestState];
}

id objc_msgSend_groupStackView(void *a1, const char *a2, ...)
{
  return [a1 groupStackView];
}

id objc_msgSend_groupsController(void *a1, const char *a2, ...)
{
  return [a1 groupsController];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isInFailForward(void *a1, const char *a2, ...)
{
  return [a1 isInFailForward];
}

id objc_msgSend_isPresentingNotificationAuthorizationPrompt(void *a1, const char *a2, ...)
{
  return [a1 isPresentingNotificationAuthorizationPrompt];
}

id objc_msgSend_isPresentingPassViewFront(void *a1, const char *a2, ...)
{
  return [a1 isPresentingPassViewFront];
}

id objc_msgSend_itemIdentifierForFrontmostDiscoveryCard(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifierForFrontmostDiscoveryCard];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadGroupsSynchronously(void *a1, const char *a2, ...)
{
  return [a1 loadGroupsSynchronously];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_manufacturerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 manufacturerIdentifier];
}

id objc_msgSend_modalGroupFrontmostPass(void *a1, const char *a2, ...)
{
  return [a1 modalGroupFrontmostPass];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_partnerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 partnerIdentifier];
}

id objc_msgSend_passes(void *a1, const char *a2, ...)
{
  return [a1 passes];
}

id objc_msgSend_passesAreOutdated(void *a1, const char *a2, ...)
{
  return [a1 passesAreOutdated];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_presentAddMoney(void *a1, const char *a2, ...)
{
  return [a1 presentAddMoney];
}

id objc_msgSend_presentCardNumbers(void *a1, const char *a2, ...)
{
  return [a1 presentCardNumbers];
}

id objc_msgSend_presentPeerPaymentTermsAcceptance(void *a1, const char *a2, ...)
{
  return [a1 presentPeerPaymentTermsAcceptance];
}

id objc_msgSend_presentPeerPaymentTopUp(void *a1, const char *a2, ...)
{
  return [a1 presentPeerPaymentTopUp];
}

id objc_msgSend_presentPeerPaymentVerifyIdentity(void *a1, const char *a2, ...)
{
  return [a1 presentPeerPaymentVerifyIdentity];
}

id objc_msgSend_presentShareFlow(void *a1, const char *a2, ...)
{
  return [a1 presentShareFlow];
}

id objc_msgSend_presentationState(void *a1, const char *a2, ...)
{
  return [a1 presentationState];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_preview(void *a1, const char *a2, ...)
{
  return [a1 preview];
}

id objc_msgSend_primaryAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 primaryAccountIdentifier];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedHardwareManagerWithNoUI(void *a1, const char *a2, ...)
{
  return [a1 sharedHardwareManagerWithNoUI];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPaymentWebServiceContext(void *a1, const char *a2, ...)
{
  return [a1 sharedPaymentWebServiceContext];
}

id objc_msgSend_shouldPreventAutomaticDismissal(void *a1, const char *a2, ...)
{
  return [a1 shouldPreventAutomaticDismissal];
}

id objc_msgSend_supportedTerminals(void *a1, const char *a2, ...)
{
  return [a1 supportedTerminals];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_willEnterForegroundPostlude(void *a1, const char *a2, ...)
{
  return [a1 willEnterForegroundPostlude];
}

id objc_msgSend_willEnterForegroundPrelude(void *a1, const char *a2, ...)
{
  return [a1 willEnterForegroundPrelude];
}

id objc_msgSend_willResignActive(void *a1, const char *a2, ...)
{
  return [a1 willResignActive];
}

id objc_msgSend_willTerminate(void *a1, const char *a2, ...)
{
  return [a1 willTerminate];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}