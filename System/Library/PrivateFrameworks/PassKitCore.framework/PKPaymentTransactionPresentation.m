@interface PKPaymentTransactionPresentation
+ (BOOL)transactionIsPaymentForPayLaterFinancingPlan:(id)a3;
+ (id)_billPaymentFundingSourceForTransaction:(id)a3;
+ (id)_presentationInformationForBankConnectTransaction:(id)a3 paymentPass:(id)a4;
+ (id)_relativeDateForTransaction:(id)a3;
+ (id)_statusAnnotationForTransaction:(id)a3 overloadAnnotation:(BOOL *)a4;
+ (id)presentationInformationForTransaction:(id)a3 transactionSource:(id)a4 secondaryTransactionSource:(id)a5 familyMember:(id)a6 account:(id)a7 deviceName:(id)a8 context:(unint64_t)a9;
+ (id)secondaryFundingSourceDescriptionForTransaction:(id)a3 secondarySource:(id)a4 includeBankAccountSuffix:(BOOL)a5 useGenericNameIfNoDescriptionAvailable:(BOOL)a6;
+ (id)staticIconNameForTransaction:(id)a3;
+ (unint64_t)iconTypeForTransaction:(id)a3 ignoreLogoURL:(BOOL)a4;
+ (void)_transferFundingSourceInformationForTransaction:(id)a3 primaryString:(id *)a4 secondaryString:(id *)a5;
@end

@implementation PKPaymentTransactionPresentation

+ (id)presentationInformationForTransaction:(id)a3 transactionSource:(id)a4 secondaryTransactionSource:(id)a5 familyMember:(id)a6 account:(id)a7 deviceName:(id)a8 context:(unint64_t)a9
{
  uint64_t v379 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  LODWORD(a8) = [v15 isBankConnectTransaction];
  uint64_t v21 = [v16 paymentPass];
  v22 = (void *)v21;
  if (a8)
  {
    v23 = [a1 _presentationInformationForBankConnectTransaction:v15 paymentPass:v21];

    goto LABEL_426;
  }
  id v349 = v18;
  id v350 = a1;
  v357 = (void *)v21;
  v344 = v19;
  v345 = v20;
  uint64_t v24 = [v15 transactionType];
  uint64_t v359 = [v15 transactionStatus];
  uint64_t v25 = [v15 transitType];
  char v324 = [v15 transitModifiers];
  uint64_t v326 = v25;
  BOOL v27 = v24 == 2 && v25 != 0;
  if ([v15 hasNotificationServiceData])
  {
    int v28 = 1;
  }
  else if ([v15 processedForLocation])
  {
    int v28 = [v15 processedForStations];
  }
  else
  {
    int v28 = 0;
  }
  int v328 = [v15 enRoute];
  uint64_t v361 = [v15 featureIdentifier];
  if ((v27 & v28) == 1)
  {
    *((void *)&v340 + 1) = [v15 startStation];
    *(void *)&long long v340 = [v15 endStation];
  }
  else
  {
    long long v340 = 0uLL;
  }
  uint64_t v29 = [v15 transactionType];
  BOOL v31 = a9 != 5 && v29 != 12;
  BOOL v337 = v31;
  if ([v15 isRecurring])
  {
    if ([v15 transactionType] == 6) {
      v32 = 0;
    }
    else {
      v32 = @"arrow.triangle.2.circlepath";
    }
  }
  else
  {
    v32 = 0;
  }
  uint64_t v33 = [v15 peerPaymentType];
  v347 = [v15 peerPaymentCounterpartHandle];
  if (v24 == 3 && [v15 peerPaymentPaymentMode] == 2) {
    v32 = @"apple.cash.tap";
  }
  [v15 amount];
  v354 = id v342 = v17;
  if (v354)
  {
    BOOL v34 = !v27;
    if (v24 == 3) {
      BOOL v34 = 0;
    }
    if (v34)
    {
      id v358 = [v15 formattedBalanceAdjustmentAmount];
    }
    else
    {
      v35 = [v15 formattedBalanceAdjustmentSubtotalAmount];
      v36 = v35;
      if (v35)
      {
        id v358 = v35;
      }
      else
      {
        id v358 = [v15 formattedBalanceAdjustmentAmount];
      }
    }
    v348 = [v15 currencyCode];
    if (v28) {
      goto LABEL_46;
    }
LABEL_42:
    id v338 = 0;
    id v341 = 0;
    goto LABEL_47;
  }
  v37 = [v15 amounts];
  if (v37)
  {
  }
  else
  {
    v38 = [v15 plans];

    if (!v38)
    {
      v354 = 0;
      v348 = 0;
      id v358 = 0;
      if (!v28) {
        goto LABEL_42;
      }
      goto LABEL_46;
    }
  }
  id v358 = [v15 formattedStringForMultipleAmountsForPass:v357];
  v39 = [v15 transactionAmountsForMultipleAmounts];
  v40 = [v39 firstObject];

  v41 = [v40 amount];
  v354 = [v41 amount];
  v348 = [v41 currency];

  id v17 = v342;
  if (!v28) {
    goto LABEL_42;
  }
LABEL_46:
  v42 = [v15 merchant];
  id v341 = [v42 displayName];

  id v338 = [v15 displayLocation];

LABEL_47:
  v355 = v32;
  if ([v15 transactionStatus] == 3)
  {
    uint64_t v48 = PKLocalizedPaymentString(&cfstr_PaymentTransac.isa, 0);

    int v49 = 0;
    int v50 = 0;
    BOOL v51 = 1;
LABEL_49:
    id v358 = (id)v48;
    goto LABEL_114;
  }
  if (v27 && (!v354 || !v348))
  {
    if (v359) {
      char v62 = 1;
    }
    else {
      char v62 = v328;
    }
    if ((v62 & 1) == 0)
    {
      uint64_t v64 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_1.isa, 0);
LABEL_258:
      uint64_t v48 = v64;

      int v49 = 0;
      BOOL v51 = 0;
      int v50 = 0;
      goto LABEL_49;
    }
    int v49 = 0;
    if (v326 > 256)
    {
      if ((unint64_t)(v326 - 257) >= 5)
      {
        if (v326 == 1025)
        {
          if (v328) {
            goto LABEL_84;
          }
          v71 = @"TRANSIT_TRANSACTION_REDEEMED";
          goto LABEL_257;
        }
        if (v326 != 517) {
          goto LABEL_113;
        }
        if (v359)
        {
          if ([v357 shouldSuppressNoChargeAmount]) {
            goto LABEL_84;
          }
          v72 = [v357 devicePrimaryPaymentApplication];
          uint64_t v73 = [v72 paymentNetworkIdentifier];

          if (v73 == 131) {
            v71 = @"-";
          }
          else {
            v71 = @"TRANSIT_TRANSACTION_FARE_FREE";
          }
          goto LABEL_257;
        }
        goto LABEL_256;
      }
    }
    else if ((unint64_t)(v326 - 1) >= 8)
    {
      goto LABEL_113;
    }
    if (v328) {
      goto LABEL_84;
    }
    if (v324)
    {
      v71 = @"TRANSIT_TRANSACTION_FARE_PAID";
LABEL_257:
      uint64_t v64 = PKLocalizedPaymentString(&v71->isa, 0);
      goto LABEL_258;
    }
    if ((v324 & 6) != 0)
    {
      uint64_t v64 = _zeroCurrencyAmount(v357);
      goto LABEL_258;
    }
    if (v359)
    {
      char v74 = [v357 shouldSuppressNoChargeAmount];
      int v49 = 0;
      if ((v74 & 1) == 0)
      {
        BOOL v51 = 0;
        int v50 = 0;
        if (v358) {
          goto LABEL_114;
        }
        PKLocalizedPaymentString(&cfstr_TransitTransac_0.isa, 0);
        id v358 = (id)objc_claimAutoreleasedReturnValue();
LABEL_84:
        int v49 = 0;
        BOOL v51 = 0;
        int v50 = 0;
        goto LABEL_114;
      }
LABEL_113:
      BOOL v51 = 0;
      int v50 = 0;
      goto LABEL_114;
    }
LABEL_256:
    v71 = @"TRANSIT_TRANSACTION_PENDING";
    goto LABEL_257;
  }
  int v49 = 0;
  if (!v354 || !v348) {
    goto LABEL_113;
  }
  if (a9 == 4)
  {
    if ([v15 transactionType] == 8)
    {
      v53 = [v15 currencyAmount];
      BOOL v63 = [v344 feature] == 5;
    }
    else
    {
      v53 = [v15 rewardsTotalCurrencyAmount];
      BOOL v63 = [v15 redemptionType] == 3;
    }
    int v65 = !v63;
    if (!v53) {
      goto LABEL_92;
    }
    uint64_t v352 = v33;
    id v330 = v16;
    v61 = [v53 formattedStringValue];

    v66 = [v53 amount];
    v67 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v68 = [v66 compare:v67];

    if (v68 == -1) {
      int v69 = 0;
    }
    else {
      int v69 = v65;
    }
    if (v69 == 1)
    {
      uint64_t v322 = (uint64_t)v61;
      uint64_t v59 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EE0F6808.isa);
      id v16 = v330;
      uint64_t v33 = v352;
LABEL_91:

      id v358 = (id)v59;
      id v17 = v342;
      goto LABEL_92;
    }
    id v358 = v61;
    id v16 = v330;
    id v17 = v342;
    uint64_t v33 = v352;
  }
  else
  {
    if (a9 != 3) {
      goto LABEL_93;
    }
    v52 = [v15 rewardsTotalCurrencyAmount];
    v53 = v52;
    if (v52)
    {
      uint64_t v54 = v33;
      v55 = [v52 amount];
      v56 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v57 = [v55 compare:v56];

      uint64_t v58 = [v53 formattedStringValue];
      uint64_t v59 = v58;
      if (v57 == -1)
      {
        v61 = v358;
      }
      else
      {
        uint64_t v322 = v58;
        uint64_t v60 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EE0F6808.isa);

        v61 = (void *)v59;
        uint64_t v59 = v60;
      }
      uint64_t v33 = v54;
      goto LABEL_91;
    }
  }
LABEL_92:

LABEL_93:
  int v49 = 0;
  BOOL v51 = 0;
  int v50 = 0;
  switch(v359)
  {
    case 0:
    case 8:
      int v49 = 0;
      int v50 = 0;
      BOOL v51 = v24 == 3 && v33 == 2;
      break;
    case 1:
      break;
    case 2:
      int v49 = 1;
      goto LABEL_94;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
LABEL_94:
      BOOL v51 = 1;
      int v50 = 1;
      break;
    default:
      goto LABEL_113;
  }
LABEL_114:
  id v339 = v15;
  unsigned int v335 = v50;
  BOOL v336 = v51;
  unsigned int v346 = v49;
  if (a9 == 1)
  {
    if (v24 == 11)
    {
      v75 = [v15 transactionDate];
      PKMonthAndYearStringFromDate(v75);
      id v343 = (id)objc_claimAutoreleasedReturnValue();
LABEL_117:

LABEL_154:
      id v362 = 0;
      goto LABEL_155;
    }
    v78 = v350;
    id v79 = [v350 _relativeDateForTransaction:v15];
LABEL_126:
    id v343 = v79;
    id v362 = 0;
    goto LABEL_156;
  }
  if (v24 == 3)
  {
    if ([v347 length])
    {
      if ([v15 peerPaymentPaymentMode] != 2)
      {
        id v77 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v347 contact:0];
        goto LABEL_153;
      }
      v76 = v347;
LABEL_122:
      id v77 = v76;
LABEL_153:
      id v343 = v77;
      goto LABEL_154;
    }
    if (v33 == 1)
    {
      v82 = @"PAYMENT_SUMMARY_PEER_PAYMENT_UNKNOWN_RECIPIENT_TITLE";
      goto LABEL_143;
    }
    if (v33 == 2)
    {
      v82 = @"PAYMENT_SUMMARY_PEER_PAYMENT_UNKNOWN_SENDER_TITLE";
LABEL_143:
      PKLocalizedPeerPaymentString(&v82->isa, 0);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_153;
    }
    goto LABEL_135;
  }
  if ((unint64_t)(v24 - 5) <= 1)
  {
    v78 = v350;
    id v79 = [(id)objc_opt_class() secondaryFundingSourceDescriptionForTransaction:v15 secondarySource:v17 includeBankAccountSuffix:0 useGenericNameIfNoDescriptionAvailable:0];
    goto LABEL_126;
  }
  if (v24 == 11)
  {
    if ([v344 type] == 1)
    {
      v85 = @"TRANSACTION_TYPE_INTEREST_CHARGE";
LABEL_141:
      PKLocalizedPaymentString(&v85->isa, 0);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_153;
    }
    uint64_t v81 = [v15 featureIdentifier];
    v80 = @"TRANSACTION_TYPE_INTEREST_PAID";
LABEL_152:
    PKLocalizedFeatureString(v80, v81, 0, v43, v44, v45, v46, v47, v322);
    id v77 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_153;
  }
  if (v24 == 10)
  {
    v80 = @"TRANSACTION_DETAIL_BILL_PAYMENT_TITLE";
LABEL_130:
    uint64_t v81 = 2;
    goto LABEL_152;
  }
LABEL_135:
  if (![v15 transactionType])
  {
    v88 = [v15 payments];
    uint64_t v89 = [v88 count];

    if (v89)
    {
      PKLocalizedFeatureString(@"ACCOUNT_SERVICE_DISPLAY_NAME", 2, 0, v90, v91, v92, v93, v94, v322);
      id v343 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v100 = PKLocalizedFeatureString(@"TRANSACTION_DETAIL_BILL_PAYMENT_TITLE", 2, 0, v95, v96, v97, v98, v99, v323);
      goto LABEL_150;
    }
  }
  if ([v15 transactionType] == 15)
  {
    v76 = v341;
    if (!v341)
    {
      v83 = [v15 releasedData];
      uint64_t v84 = [v83 verificationType];

      PKTransactionReleasedDataVerificationTypeToLocalizedTitle(v84);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_153;
    }
    goto LABEL_122;
  }
  if (![v15 transactionType])
  {
    v147 = [v15 transfers];
    uint64_t v148 = [v147 count];

    if (v148)
    {
      id v376 = 0;
      id v377 = 0;
      v78 = v350;
      [v350 _transferFundingSourceInformationForTransaction:v15 primaryString:&v377 secondaryString:&v376];
      id v343 = v377;
      id v362 = v376;
      goto LABEL_156;
    }
  }
  if ([v15 transactionType] == 7)
  {
    v86 = [v15 transfers];
    uint64_t v87 = [v86 count];

    if (v87)
    {
      id v375 = 0;
      v78 = v350;
      [v350 _transferFundingSourceInformationForTransaction:v15 primaryString:&v375 secondaryString:0];
      id v79 = v375;
      goto LABEL_126;
    }
  }
  if (![v15 transactionType] && objc_msgSend(v15, "accountType") == 1)
  {
    v142 = [v15 referenceIdentifier];
    uint64_t v143 = [v142 length];

    if (v143)
    {
      v85 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
      goto LABEL_141;
    }
  }
  if (![v15 transactionType])
  {
    v171 = [v15 recurringPeerPayment];

    if (v171)
    {
      v172 = [v15 merchant];
      char v173 = [v172 hasMapsMatch];

      if (v173)
      {
        v174 = [v15 merchant];
        id v343 = [v174 displayName];
      }
      else
      {
        PKLocalizedPeerPaymentString(&cfstr_AppleCash_1.isa, 0);
        id v343 = (id)objc_claimAutoreleasedReturnValue();
      }
      v199 = [v15 recurringPeerPayment];
      uint64_t v200 = [v199 type];

      if (v200 == 1)
      {
        v201 = @"TRANSACTION_DEBIT_RECURRING_PAYMENT";
      }
      else
      {
        if (v200 != 3) {
          goto LABEL_154;
        }
        v201 = @"TRANSACTION_DEBIT_AUTO_RELOAD";
      }
      uint64_t v100 = PKLocalizedPeerPaymentRecurringString(&v201->isa, 0);
LABEL_150:
      id v362 = (id)v100;
LABEL_155:
      v78 = v350;
      goto LABEL_156;
    }
  }
  if ([v350 transactionIsPaymentForPayLaterFinancingPlan:v15])
  {
    v144 = [v15 merchant];
    v145 = [v144 displayName];
    v146 = v145;
    if (v145)
    {
      id v343 = v145;
    }
    else
    {
      PKLocalizedCocoonString(&cfstr_ApplePayLater.isa, 0);
      id v343 = (id)objc_claimAutoreleasedReturnValue();
    }
    v195 = [v15 associatedFinancingPlan];
    v196 = v195;
    if (v195)
    {
      v197 = [v195 merchant];
      id v362 = [v197 displayNamePurchase];
    }
    else
    {
      id v362 = 0;
    }

    goto LABEL_155;
  }
  if ([v15 transactionType] == 13) {
    goto LABEL_241;
  }
  if ([v15 transactionType] == 14)
  {
    v75 = [v15 installmentPlan];
    v190 = [v75 product];
    id v343 = [v190 model];

    goto LABEL_117;
  }
  BOOL v208 = v361 == 4 || v27;
  if (!v208 && [v341 length])
  {
LABEL_241:
    v76 = v341;
    goto LABEL_122;
  }
  switch(v24)
  {
    case 4:
      v85 = @"TRANSACTION_TYPE_FEE";
      goto LABEL_141;
    case 7:
      PKLocalizedTitleForTransactionWithAdjustment(v15);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_153;
    case 8:
      v278 = [v15 redemptionEvent];

      if (v278)
      {
        v80 = @"TRANSACTION_REWARDS_TITLE";
        goto LABEL_130;
      }
      v85 = @"TRANSACTION_TYPE_DISBURSEMENT";
      goto LABEL_141;
    case 9:
      v80 = @"ACCOUNT_SERVICE_DISPLAY_NAME";
      goto LABEL_130;
    case 12:
      uint64_t v279 = v33;
      v280 = [v15 rewards];
      v281 = [v280 rewardsItems];
      v282 = [v281 firstObject];
      uint64_t v283 = [v282 type];

      if (v283 == 6) {
        v289 = @"TRANSACTION_REWARDS_REASON_ACTIVATION_OFFER";
      }
      else {
        v289 = @"TRANSACTION_REWARDS_REASON_OTHER";
      }
      PKLocalizedFeatureString(v289, 2, 0, v284, v285, v286, v287, v288, v322);
      id v343 = (id)objc_claimAutoreleasedReturnValue();
      id v362 = 0;
      id v17 = v342;
      v78 = v350;
      uint64_t v33 = v279;
      goto LABEL_156;
    default:
      if (!v27)
      {
        if (v361 != 4 || ![v341 length])
        {
          PKLocalizedPaymentString(&cfstr_PaymentSummary_1.isa, 0);
          id v293 = (id)objc_claimAutoreleasedReturnValue();
LABEL_499:
          id v343 = v293;
          id v362 = 0;
          goto LABEL_500;
        }
        goto LABEL_497;
      }
      if (v340 != 0)
      {
        v277 = (void *)*((void *)&v340 + 1);
        if ((void)v340) {
          v277 = (void *)v340;
        }
        goto LABEL_498;
      }
      if ([v338 length])
      {
        v277 = v338;
LABEL_498:
        id v293 = v277;
        goto LABEL_499;
      }
      if ([v341 length])
      {
LABEL_497:
        v277 = v341;
        goto LABEL_498;
      }
      if (![v15 transactionSource] && (v326 == 516 || v326 == 513))
      {
        id v293 = [v357 organizationName];
        goto LABEL_499;
      }
      id v362 = 0;
      id v343 = 0;
LABEL_500:
      id v17 = v342;
      v78 = v350;
LABEL_156:
      uint64_t v101 = [v15 disputeStatus];
      char v374 = 1;
      v353 = [v78 _statusAnnotationForTransaction:v15 overloadAnnotation:&v374];
      if ((unint64_t)(v101 - 1) <= 4)
      {
        uint64_t v102 = [v15 transactionType];
        uint64_t v103 = [v15 disputeType];
        if ((unint64_t)(v101 - 1) < 3)
        {
          uint64_t v109 = PKLocalizedFeatureString(@"TRANSACTION_DISPUTE_STATUS_IN_REVIEW", 2, 0, v104, v105, v106, v107, v108, v322);

          id v360 = 0;
          id v362 = (id)v109;
          unsigned int v346 = 1;
          v110 = v355;
          goto LABEL_369;
        }
        v110 = v355;
        if (v101 == 4)
        {
          if (v102 || v103 != 1) {
            v133 = @"TRANSACTION_DISPUTE_STATUS_APPROVED";
          }
          else {
            v133 = @"TRANSACTION_DISPUTE_STATUS_CREDIT_APPLIED";
          }
          PKLocalizedFeatureString(v133, 2, 0, v104, v105, v106, v107, v108, v322);
          id v138 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_196;
        }
        if (v101 == 5)
        {
          if (v102 || v103 != 1)
          {
            v114 = @"TRANSACTION_DISPUTE_STATUS_REJECTED";
          }
          else
          {
            v111 = [v15 disputeStatusDetails];
            v112 = [v111 statusReasons];
            int v113 = [v112 containsObject:@"splitLiability"];

            if (v113) {
              v114 = @"TRANSACTION_DISPUTE_STATUS_CREDIT_APPLIED";
            }
            else {
              v114 = @"TRANSACTION_DISPUTE_STATUS_NO_CREDIT_APPLIED";
            }
          }
          goto LABEL_192;
        }
LABEL_340:
        id v360 = 0;
        goto LABEL_369;
      }
      v110 = v355;
      if (v24 == 14)
      {
        uint64_t v115 = PKLocalizedBeekmanString(&cfstr_AppleCardInsta.isa, 0);
LABEL_194:
        id v138 = (id)v115;
LABEL_195:

LABEL_196:
        id v360 = 0;
        id v362 = v138;
        goto LABEL_369;
      }
      if (v24 != 13)
      {
        if (v24 == 11)
        {
          if ([v344 type] == 1)
          {

            id v360 = 0;
            id v362 = 0;
            goto LABEL_369;
          }
          uint64_t v134 = [v15 featureIdentifier];
          v114 = @"TRANSACTION_TYPE_TOP_UP";
          goto LABEL_193;
        }
        if (v24 == 3)
        {
          uint64_t v121 = [v15 peerPaymentType];
          uint64_t v122 = v121;
          switch(v121)
          {
            case 1:
              v149 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_SENT";
              goto LABEL_216;
            case 2:
              v149 = @"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_RECEIVED";
LABEL_216:
              PKLocalizedPeerPaymentString(&v149->isa, 0);
              v150 = v362;
              id v360 = 0;
              id v362 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_356;
            case 3:
              v151 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_5.isa, 0);

              if (a9 == 1)
              {
                id v360 = 0;
                id v362 = v151;
                goto LABEL_357;
              }
              uint64_t v333 = v122;
              v150 = [v15 expirationDate];
              v175 = [MEMORY[0x1E4F1C9A8] currentCalendar];
              v176 = [MEMORY[0x1E4F1C9C8] date];
              v177 = PKStartOfDay(v176);
              v178 = [v175 components:16 fromDate:v177 toDate:v150 options:0];

              uint64_t v179 = [v178 day];
              if (v179 == 1)
              {
                v180 = @"PEER_PAYMENT_PENDING_REQUEST_EXPIRATION_BADGE_VALUE_TOMORROW";
                goto LABEL_296;
              }
              if (!v179)
              {
                v180 = @"PEER_PAYMENT_PENDING_REQUEST_EXPIRATION_BADGE_VALUE_TODAY";
LABEL_296:
                PKLocalizedPeerPaymentString(&v180->isa, 0, v322);
                goto LABEL_298;
              }
              PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_1.isa, &cfstr_Ld_2.isa, v179);
LABEL_298:
              id v362 = (id)objc_claimAutoreleasedReturnValue();
              id v17 = v342;
              v110 = v355;
              uint64_t v122 = v333;

              id v360 = 0;
              goto LABEL_356;
            case 4:
            case 5:
              uint64_t v331 = v121;
              v123 = [v15 recurringPeerPayment];
              uint64_t v124 = [v123 frequency];
              v125 = [v123 startDate];
              v126 = PKPeerPaymentRecurringPaymentFrequencyToLocalizedWeekdayString(v124, v125);

              [v15 transactionDate];
              v327 = v123;
              id v329 = (id)objc_claimAutoreleasedReturnValue();
              v127 = [v123 memo];
              uint64_t v128 = [v127 text];

              v325 = (void *)v128;
              if (a9)
              {
                id v129 = v126;

                v130 = v126;
                v131 = v329;
                uint64_t v122 = v331;
                if (!v329)
                {
                  id v360 = 0;
                  goto LABEL_355;
                }
                PKMediumDateString(v329);
                id v132 = (id)objc_claimAutoreleasedReturnValue();
                PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionNex.isa, &stru_1EE0F6808.isa, v132);
                id v360 = (id)objc_claimAutoreleasedReturnValue();
LABEL_353:

                v130 = v126;
LABEL_354:
                v131 = v329;
LABEL_355:

                v150 = v327;
                id v362 = v325;
                id v343 = v129;
LABEL_356:

LABEL_357:
                v218 = [v15 peerPaymentMemo];
                if (!v218)
                {
                  v219 = [v15 recurringPeerPayment];
                  [v219 memo];
                  v221 = uint64_t v220 = v122;
                  v218 = [v221 text];

                  uint64_t v122 = v220;
                }
                if (![v218 length])
                {
LABEL_368:

                  goto LABEL_369;
                }
                if (v122 == 3)
                {
                  id v222 = v362;
                  if (a9 != 1)
                  {
                    id v225 = v362;

                    id v362 = v218;
                    id v360 = v225;
                    goto LABEL_368;
                  }
                  if (!v362)
                  {
LABEL_363:
                    id v362 = v218;
                    goto LABEL_368;
                  }
                }
                else
                {
                  if ((unint64_t)(v122 - 6) > 0xFFFFFFFFFFFFFFFDLL) {
                    goto LABEL_368;
                  }
                  id v222 = v362;
                  if (!v362) {
                    goto LABEL_363;
                  }
                }
                v223 = v222;
                id v224 = [NSString stringWithFormat:@"%@ - %@", v222, v218];

                id v362 = v224;
                goto LABEL_368;
              }
              uint64_t v122 = v331;
              if (v331 == 4)
              {
                v163 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                v164 = [MEMORY[0x1E4F1C9C8] date];
                v165 = PKStartOfDay(v164);
                id v132 = [v163 components:16 fromDate:v165 toDate:v329 options:0];

                uint64_t v166 = [v132 day];
                if (v166 == 1) {
                  PKLocalizedPeerPaymentRecurringString(&cfstr_SendingTomorro.isa, 0, v322);
                }
                else {
                  PKLocalizedPeerPaymentRecurringString(&cfstr_SendingInDays.isa, &cfstr_Ld_2.isa, v166);
                }
                id v360 = (id)objc_claimAutoreleasedReturnValue();
                v110 = v355;
                goto LABEL_286;
              }
              v130 = v126;
              id v360 = v126;
              uint64_t v181 = [v327 status];
              if ((unint64_t)(v181 - 3) >= 2)
              {
                if (v181 == 2)
                {
                  v198 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_0.isa, 0);
                  id v132 = v198;
                  if (v360)
                  {
                    uint64_t v363 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_1.isa, &stru_1EE105568.isa, v360, v198);

                    id v360 = (id)v363;
                  }
                  else
                  {
                    id v132 = v198;
                    id v360 = v132;
                  }
                  goto LABEL_352;
                }
              }
              else if (([v327 lastExecutedTransactionAppearsInHistory] & 1) == 0)
              {
                v182 = [v327 lastExecutedTransaction];
                uint64_t v183 = [v182 errorCode];

                if (v183 != 40311)
                {
                  PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_4.isa, 0);
                  id v132 = v325;
                  v325 = unsigned int v346 = 1;
LABEL_286:
                  id v129 = v343;
                  uint64_t v122 = v331;
                  goto LABEL_353;
                }
                v184 = [v327 fundingSource];
                id v132 = [v184 name];

                uint64_t v122 = v331;
                if ([v132 length]) {
                  PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_2.isa, &stru_1EE0F6808.isa, v132);
                }
                else {
                uint64_t v217 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_3.isa, 0, v322);
                }

                unsigned int v346 = 1;
                v325 = (void *)v217;
LABEL_352:
                id v129 = v343;
                goto LABEL_353;
              }
              id v129 = v343;
              goto LABEL_354;
            case 6:
              v150 = [v15 recurringPeerPayment];
              uint64_t v332 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadEntr.isa, 0);

              v152 = [v150 currencyThreshold];
              [v152 minimalFormattedStringValue];
              v154 = uint64_t v153 = v122;
              uint64_t v155 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadEntr_0.isa, &stru_1EE0F6808.isa, v154);

              uint64_t v122 = v153;
              id v360 = 0;
              id v362 = (id)v155;
              id v17 = v342;
              id v343 = (id)v332;
              goto LABEL_356;
            default:
              id v360 = 0;
              goto LABEL_357;
          }
        }
        if (v24 != 5)
        {
          if (v24 == 6)
          {
            v135 = [v15 transfers];
            uint64_t v136 = [v135 count];

            if (!v136)
            {
              uint64_t v156 = [v343 length];
              PKLocalizedPaymentString(&cfstr_TransactionTyp_4.isa, 0);
              id v138 = (id)objc_claimAutoreleasedReturnValue();
              if (v156) {
                goto LABEL_195;
              }

              id v360 = 0;
LABEL_228:
              id v343 = v138;
              goto LABEL_369;
            }
            v137 = v362;
            id v372 = v362;
            id v373 = v343;
            [v350 _transferFundingSourceInformationForTransaction:v15 primaryString:&v373 secondaryString:&v372];
            id v138 = v373;

            v139 = v372;
LABEL_227:
            id v162 = v139;

            id v360 = 0;
            id v362 = v162;
            goto LABEL_228;
          }
          if (![v15 transactionType])
          {
            v160 = [v15 transfers];
            uint64_t v161 = [v160 count];

            if (v161)
            {
              v137 = v362;
              id v368 = v362;
              id v369 = v343;
              [v350 _transferFundingSourceInformationForTransaction:v15 primaryString:&v369 secondaryString:&v368];
              id v138 = v369;

              v139 = v368;
              goto LABEL_227;
            }
          }
          if (v24 == 8)
          {
            v167 = [v15 redemptionEvent];

            if (v167)
            {
              v114 = @"TRANSACTION_REWARDS_CASH_BACK";
LABEL_192:
              uint64_t v134 = 2;
LABEL_193:
              uint64_t v115 = PKLocalizedFeatureString(v114, v134, 0, v104, v105, v106, v107, v108, v322);
              goto LABEL_194;
            }
            v191 = [v15 merchantProvidedDescription];
            uint64_t v192 = [v191 length];

            if (v192)
            {
              uint64_t v115 = [v15 merchantProvidedDescription];
              goto LABEL_194;
            }
          }
          else
          {
            if (v24 == 7)
            {
              uint64_t v115 = PKLocalizedSubtitleForTransactionWithAdjustment(v15);
              goto LABEL_194;
            }
            if (v27)
            {
              if ((v324 & 2) == 0)
              {
                uint64_t v168 = (uint64_t)v343;
                if ((v324 & 8) != 0)
                {
                  v170 = 0;
                  uint64_t v169 = v326;
                  if (v326 > 256)
                  {
                    v202 = @"MAGLEV_TRANSACTION_LIST_FARE_ADJUSTMENT";
                    switch(v326)
                    {
                      case 257:
                        v202 = @"SHINKANSEN_TRANSACTION_LIST_FARE_ADJUSTMENT";
                        goto LABEL_300;
                      case 258:
                        goto LABEL_300;
                      case 259:
                        v202 = @"TAXI_TRANSACTION_LIST_FARE_ADJUSTMENT";
                        goto LABEL_300;
                      case 260:
                        v202 = @"FERRY_TRANSACTION_LIST_FARE_ADJUSTMENT";
                        goto LABEL_300;
                      case 261:
                        v202 = @"BIKE_TRANSACTION_LIST_FARE_ADJUSTMENT";
                        goto LABEL_300;
                      default:
                        if (@"MAGLEV_TRANSACTION_LIST_FARE_ADJUSTMENT" == (__CFString *)1025)
                        {
                          v202 = @"GREEN_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT";
LABEL_495:
                          id v17 = v342;
                          uint64_t v168 = (uint64_t)v343;
                          v110 = v355;
                        }
                        else
                        {
                          uint64_t v169 = v326;
                          id v17 = v342;
                          uint64_t v168 = (uint64_t)v343;
                          v110 = v355;
                          if (v326 != 1026) {
                            goto LABEL_301;
                          }
                          v202 = @"METRO_UPGRADE_TRANSACTION_LIST_FARE_ADJUSTMENT";
                        }
                        break;
                    }
                    goto LABEL_300;
                  }
                  switch(v326)
                  {
                    case 1:
                      v202 = @"TRANSIT_TRANSACTION_LIST_FARE_ADJUSTMENT";
                      goto LABEL_300;
                    case 2:
                      v202 = @"METRO_TRANSACTION_LIST_FARE_ADJUSTMENT";
                      goto LABEL_300;
                    case 3:
                      v202 = @"BUS_TRANSACTION_LIST_FARE_ADJUSTMENT";
                      goto LABEL_300;
                    case 4:
                      v202 = @"TRAIN_TRANSACTION_LIST_FARE_ADJUSTMENT";
                      goto LABEL_300;
                    case 7:
                      v202 = @"LIGHT_RAIL_TRANSACTION_LIST_FARE_ADJUSTMENT";
                      goto LABEL_300;
                    case 8:
                      v202 = @"CABLE_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT";
                      goto LABEL_300;
                    default:
                      break;
                  }
                }
                else
                {
                  uint64_t v169 = v326;
                  if ((v324 & 0x10) == 0)
                  {
                    if (v343)
                    {
                      v170 = PKPaymentTransactionTransitSubtypeToLocalizedTitle(v326);
                      goto LABEL_303;
                    }
                    v170 = 0;
LABEL_302:
                    uint64_t v168 = PKPaymentTransactionTransitSubtypeToLocalizedTitle(v169);
LABEL_303:
                    if (*((void *)&v340 + 1) && (void)v340)
                    {
                      v203 = PKLocalizedPaymentString(&cfstr_TransitTransac_6.isa, &stru_1EE0F6808.isa, *((void *)&v340 + 1));
                    }
                    else
                    {
                      v203 = v362;
                    }
                    if (v328)
                    {
                      id v204 = v17;
                      v205 = v203;
                      v203 = PKLocalizedPaymentString(&cfstr_TransitTransac_7.isa, 0);

                      id v17 = v204;
                    }
                    if (v170)
                    {
                      if (v168)
                      {
                        id v343 = (id)v168;
                        if (v203)
                        {
                          v206 = v203;
                          uint64_t v207 = PKLocalizedPaymentString(&cfstr_TransitTransac_8.isa, &cfstr_21.isa, v170, v203);

                          id v362 = (id)v207;
                        }
                        else
                        {
                          id v362 = v170;
                        }
                      }
                      else
                      {
                        id v210 = v203;
                        id v362 = v170;
                        id v343 = v210;
                      }
                    }
                    else if (v168)
                    {
                      id v362 = v203;
                      id v343 = (id)v168;
                    }
                    else
                    {
                      id v343 = v203;

                      id v362 = 0;
                    }

                    goto LABEL_340;
                  }
                  v170 = 0;
                  if (v326 > 256)
                  {
                    v202 = @"MAGLEV_TRANSACTION_LIST_FARE_REBATE";
                    switch(v326)
                    {
                      case 257:
                        v202 = @"SHINKANSEN_TRANSACTION_LIST_FARE_REBATE";
                        goto LABEL_300;
                      case 258:
                        goto LABEL_300;
                      case 259:
                        v202 = @"TAXI_TRANSACTION_LIST_FARE_REBATE";
                        goto LABEL_300;
                      case 260:
                        v202 = @"FERRY_TRANSACTION_LIST_FARE_REBATE";
                        goto LABEL_300;
                      case 261:
                        v202 = @"BIKE_TRANSACTION_LIST_FARE_REBATE";
                        goto LABEL_300;
                      default:
                        if (v326 == 1025)
                        {
                          v202 = @"GREEN_CAR_TRANSACTION_LIST_FARE_REBATE";
                          goto LABEL_495;
                        }
                        uint64_t v169 = v326;
                        id v17 = v342;
                        uint64_t v168 = (uint64_t)v343;
                        v110 = v355;
                        if (v326 != 1026) {
                          goto LABEL_301;
                        }
                        v202 = @"METRO_UPGRADE_TRANSACTION_LIST_FARE_REBATE";
                        break;
                    }
                    goto LABEL_300;
                  }
                  switch(v326)
                  {
                    case 1:
                      v202 = @"TRANSIT_TRANSACTION_LIST_FARE_REBATE";
                      goto LABEL_300;
                    case 2:
                      v202 = @"METRO_TRANSACTION_LIST_FARE_REBATE";
                      goto LABEL_300;
                    case 3:
                      v202 = @"BUS_TRANSACTION_LIST_FARE_REBATE";
                      goto LABEL_300;
                    case 4:
                      v202 = @"TRAIN_TRANSACTION_LIST_FARE_REBATE";
                      goto LABEL_300;
                    case 7:
                      v202 = @"LIGHT_RAIL_TRANSACTION_LIST_FARE_REBATE";
                      goto LABEL_300;
                    case 8:
                      v202 = @"CABLE_CAR_TRANSACTION_LIST_FARE_REBATE";
                      goto LABEL_300;
                    default:
                      break;
                  }
                }
LABEL_301:
                if (v168) {
                  goto LABEL_303;
                }
                goto LABEL_302;
              }
              v202 = @"TRANSIT_TRANSACTION_TRANSFER";
              uint64_t v168 = (uint64_t)v343;
LABEL_300:
              v170 = PKLocalizedPaymentString(&v202->isa, 0);
              uint64_t v169 = v326;
              goto LABEL_301;
            }
            if (v24 == 10)
            {
              uint64_t v115 = [v350 _billPaymentFundingSourceForTransaction:v15];
              goto LABEL_194;
            }
          }
          v193 = [v15 unansweredQuestions];
          uint64_t v194 = [v193 count];

          if (v359 == 2)
          {
            if (v194)
            {
              v114 = @"TRANSACTION_VERIFICATION_REQUIRED";
              goto LABEL_192;
            }
            v211 = [v15 questions];
            uint64_t v212 = [v211 count];

            if (!v212)
            {
              uint64_t v269 = [v15 transactionDeclinedReason];
              uint64_t v115 = PKPaymentTransactionDeclinedReasonLocalizedString(v269, v270, v271, v272, v273, v274, v275, v276);
              goto LABEL_194;
            }
            if (![v15 reviewed]) {
              goto LABEL_340;
            }
LABEL_337:
            v114 = @"TRANSACTION_REVIEWED";
            goto LABEL_192;
          }
          if (v194)
          {
            uint64_t v209 = PKLocalizedFeatureString(@"TRANSACTION_VERIFICATION_REQUIRED", 2, 0, v104, v105, v106, v107, v108, v322);

            id v360 = 0;
            id v362 = (id)v209;
            unsigned int v346 = 1;
            goto LABEL_369;
          }
          if ([v15 reviewed]) {
            goto LABEL_337;
          }
          if ([v15 isIssuerInstallmentTransaction])
          {
            v213 = [v357 uniqueID];
            if (v213)
            {
              v214 = objc_alloc_init(PKPaymentService);
              v215 = [(PKPaymentService *)v214 paymentOffersCatalog];

              v216 = [v215 criteriaWithType:1 passUniqueID:v213];
            }
            else
            {
              v216 = 0;
            }
            uint64_t v304 = [v216 programName];
            v305 = (void *)v304;
            if (v216 && v304)
            {
LABEL_480:
              id v306 = v305;
            }
            else
            {
              PKLocalizedPaymentOffersString(&cfstr_PayLaterBadgeT.isa, 0);
              id v306 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v307 = v306;

LABEL_483:
            id v360 = 0;
            id v362 = v307;
            goto LABEL_540;
          }
          if (!PKHideCardBenefitRewards())
          {
            v290 = [v15 paymentRewardsRedemption];

            if (v290)
            {
              PKLocalizedPayWithPointsString(&cfstr_TransactionRew_3.isa, 0);
              id v291 = (id)objc_claimAutoreleasedReturnValue();
LABEL_450:
              id v292 = v291;

LABEL_533:
              id v360 = 0;
              id v362 = v292;
              goto LABEL_540;
            }
          }
          id v360 = 0;
          id v17 = v342;
          v110 = v355;
          switch([v15 effectiveTransactionSource])
          {
            case 1:
              id v292 = v338;

              if (v292) {
                goto LABEL_533;
              }
              if (v24 != 15)
              {
                PKLocalizedPaymentString(&cfstr_TransactionSou.isa, 0);
                id v362 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_539;
              }
              v308 = [v15 releasedData];
              uint64_t v309 = [v308 verificationType];

              v310 = PKTransactionReleasedDataVerificationTypeToLocalizedTitle(v309);
              id v311 = v343;
              id v312 = v310;
              v313 = v312;
              id v343 = v311;
              if (v311 == v312)
              {
              }
              else
              {
                if (!v311 || !v312)
                {

                  goto LABEL_544;
                }
                char v314 = [v311 isEqualToString:v312];

                if ((v314 & 1) == 0)
                {
LABEL_544:
                  id v362 = v313;
LABEL_545:

LABEL_539:
                  id v360 = 0;
LABEL_540:
                  id v17 = v342;
                  v110 = v355;
                  goto LABEL_369;
                }
              }
              id v362 = 0;
              goto LABEL_545;
            case 2:
            case 7:
            case 8:
              if (v24 != 15)
              {
                if (![v362 length] && objc_msgSend(v15, "featureIdentifier") != 4)
                {
                  PKLocalizedPaymentString(&cfstr_TransactionSou.isa, 0);
                  id v291 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_450;
                }
                goto LABEL_539;
              }
              v299 = [v15 releasedData];
              v300 = [v299 application];
              v301 = v300;
              if (v299 && v300)
              {
                uint64_t v302 = [v300 client];
                if (!v302)
                {
                  v319 = [v15 releasedData];
                  uint64_t v320 = PKTransactionReleasedDataVerificationTypeToLocalizedTitle([v319 verificationType]);

LABEL_537:
                  id v362 = (id)v320;
                  goto LABEL_538;
                }
                if (v302 != 2)
                {
                  if (v302 != 1)
                  {
LABEL_538:

                    goto LABEL_539;
                  }
                  v303 = @"TRANSACTION_TYPE_SERVICES";
                  goto LABEL_535;
                }
                if (![v15 requiresLocation]
                  || ([v15 displayLocation],
                      v321 = objc_claimAutoreleasedReturnValue(),
                      v321,
                      !v321))
                {
                  v303 = @"TRANSACTION_TYPE_APPS";
LABEL_535:
                  uint64_t v318 = PKLocalizedIdentityString(&v303->isa, 0);
                  goto LABEL_536;
                }
                uint64_t v318 = [v15 displayLocation];
              }
              else
              {
                v316 = [v15 releasedData];
                uint64_t v317 = [v316 verificationType];

                uint64_t v318 = PKTransactionReleasedDataVerificationTypeToLocalizedTitle(v317);
              }
LABEL_536:
              uint64_t v320 = v318;

              goto LABEL_537;
            case 3:
              v213 = [v15 merchant];
              v216 = [v213 originURL];
              v305 = [v216 absoluteString];
              if (v305) {
                goto LABEL_480;
              }
              PKLocalizedPaymentString(&cfstr_TransactionSou.isa, 0);
              id v307 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_483;
            case 4:
              goto LABEL_369;
            case 5:
              if (v338)
              {
                id v291 = v338;
                goto LABEL_450;
              }
              if (v353) {
                v315 = @"TRANSACTION_DETAILS_PHYSICAL_CARD_SEPARATOR";
              }
              else {
                v315 = @"TRANSACTION_DETAILS_PHYSICAL_CARD";
              }
LABEL_532:
              PKLocalizedFeatureString(v315, 2, 0, v294, v295, v296, v297, v298, v322);
              id v292 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_533;
            case 6:
              if (v353) {
                v315 = @"TRANSACTION_DETAILS_VIRTUAL_CARD_SEPARATOR";
              }
              else {
                v315 = @"TRANSACTION_DETAILS_VIRTUAL_CARD";
              }
              goto LABEL_532;
            default:
              goto LABEL_540;
          }
        }
        v140 = [v15 transfers];
        uint64_t v141 = [v140 count];

        if (v141)
        {
          v137 = v362;
          id v370 = v362;
          id v371 = v343;
          [v350 _transferFundingSourceInformationForTransaction:v15 primaryString:&v371 secondaryString:&v370];
          id v138 = v371;

          v139 = v370;
          goto LABEL_227;
        }
        uint64_t v157 = [v15 secondaryFundingSourceType];
        id v158 = v343;
        if (v157 == 1)
        {
          v159 = @"TRANSACTION_TYPE_WITHDRAWAL_BANK_ACCOUNT";
        }
        else
        {
          if (v157 != 2)
          {
            v185 = 0;
            goto LABEL_264;
          }
          v159 = @"TRANSACTION_TYPE_WITHDRAWAL_DEBIT";
        }
        v185 = PKLocalizedPaymentString(&v159->isa, 0);
LABEL_264:
        uint64_t v186 = [v343 length];
        id v187 = v362;
        if (v186) {
          v188 = v362;
        }
        else {
          v188 = v343;
        }
        if (v186) {
          id v187 = v185;
        }
        id v362 = v187;
        if (!v186) {
          id v158 = v185;
        }
        id v343 = v158;
        id v189 = v185;

        goto LABEL_340;
      }
      v116 = [v15 installmentPayment];
      v117 = [v116 localizedDisplay];
      v118 = v117;
      if (v117)
      {
        id v119 = v117;
        v120 = v362;
      }
      else
      {
        PKLocalizedBeekmanString(&cfstr_AppleCardInsta.isa, 0);
        id v119 = (id)objc_claimAutoreleasedReturnValue();

        v120 = v119;
      }

      id v360 = 0;
      id v362 = v119;
LABEL_369:
      if ((unint64_t)(v33 - 6) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        if ([v353 length])
        {
          v226 = v350;
          if (v374)
          {
            if (v362)
            {
              PKLocalizedPaymentString(&cfstr_PaymentPassDet.isa, &stru_1EE105568.isa, v353, v362);
              id v227 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v227 = v353;
            }
          }
          else
          {
            id v227 = v353;
          }
        }
        else
        {
          v226 = v350;
          id v227 = v362;
        }
        id v362 = v227;
        if (a9 != 1)
        {
          if (a9 == 2)
          {
            v228 = [v15 transactionDate];
            uint64_t v229 = PKMediumDateString(v228);
          }
          else
          {
            uint64_t v229 = [v226 _relativeDateForTransaction:v15];
            v228 = v360;
          }

          id v360 = (id)v229;
        }
      }
      v230 = [v15 rewards];
      v351 = v230;
      if (!v230)
      {
        v247 = 0;
        goto LABEL_406;
      }
      v231 = v230;
      id v334 = v16;
      v232 = [v230 promotionalRewardsItems];
      if ([v232 count]) {
        v110 = @"star.fill";
      }
      v356 = v110;
      v233 = [MEMORY[0x1E4F28C28] zero];
      long long v364 = 0u;
      long long v365 = 0u;
      long long v366 = 0u;
      long long v367 = 0u;
      v234 = [v231 rewardsItems];
      uint64_t v235 = [v234 countByEnumeratingWithState:&v364 objects:v378 count:16];
      v236 = v233;
      v237 = v233;
      if (v235)
      {
        uint64_t v238 = v235;
        uint64_t v239 = *(void *)v365;
        v236 = v233;
        v237 = v233;
        do
        {
          for (uint64_t i = 0; i != v238; ++i)
          {
            if (*(void *)v365 != v239) {
              objc_enumerationMutation(v234);
            }
            v241 = *(void **)(*((void *)&v364 + 1) + 8 * i);
            if ([v241 state] != 3)
            {
              uint64_t v242 = [v241 eligibleValueUnit];
              if (v242 == 2)
              {
                v243 = [v241 eligibleValue];
                uint64_t v246 = [(NSDecimalNumber *)v237 decimalNumberByAdding:v243];
                v245 = v237;
                v237 = (NSDecimalNumber *)v246;
              }
              else
              {
                if (v242 != 1) {
                  continue;
                }
                v243 = [v241 eligibleValue];
                uint64_t v244 = [(NSDecimalNumber *)v236 decimalNumberByAdding:v243];
                v245 = v236;
                v236 = (NSDecimalNumber *)v244;
              }
            }
          }
          uint64_t v238 = [v234 countByEnumeratingWithState:&v364 objects:v378 count:16];
        }
        while (v238);
      }

      if (([(NSDecimalNumber *)v236 isEqualToNumber:v233] & 1) == 0)
      {
        v248 = PKFormattedStringMinimalFractionDigitsFromNumber(v236, 0);
        v247 = PKLocalizedFeatureString(@"TRANSACTION_REWARDS_PERCENT_FORMAT", 2, @"%@%%", v249, v250, v251, v252, v253, (uint64_t)v248);
LABEL_404:
        v110 = v356;

        goto LABEL_405;
      }
      if ([v15 transactionType] != 12
        && ([(NSDecimalNumber *)v237 isEqualToNumber:v233] & 1) == 0)
      {
        v248 = [v15 rewardsTotalCurrencyCode];
        v256 = (NSString *)v248;
        if (!v248)
        {
          v256 = [v15 currencyCode];
        }
        v257 = PKCurrencyAmountCreate(v237, v256, 0);
        v247 = [v257 minimalFormattedStringValue];

        if (!v248) {
        goto LABEL_404;
        }
      }
      v247 = 0;
      v110 = v356;
LABEL_405:

      id v16 = v334;
      id v17 = v342;
LABEL_406:
      if ([v357 supportsFPANNotifications]
        && [v357 supportsDPANNotifications]
        && [v15 hasAssociatedPaymentApplication]
        && [v345 length])
      {
        if (v360)
        {
          v254 = [NSString stringWithFormat:@" - %@", v345];
          id v255 = [v360 stringByAppendingString:v254];

          id v360 = v255;
        }
        else
        {
          id v360 = v345;
        }
      }
      if ([v16 type] == 2)
      {
        v258 = [v16 accountUser];
        v259 = [v258 nameComponents];
        v260 = +[PKContactResolver contactForFamilyMember:v349 nameComponents:v259 imageData:0];

        v261 = [v260 givenName];
        v262 = v261;
        if (v261)
        {
          if (v360)
          {
            id v263 = v16;
            PKLocalizedMadisonString(&cfstr_AccountUserNam.isa, &cfstr_12_0.isa, v261, v360);
            uint64_t v265 = v264 = v110;

            id v360 = (id)v265;
          }
          else
          {
            v264 = v110;
            id v263 = v16;
            id v360 = v261;
          }
        }
        else
        {
          v264 = v110;
          id v263 = v16;
        }
        id v266 = v17;
      }
      else
      {
        v264 = v110;
        id v263 = v16;
        id v266 = v17;
      }
      id v18 = v349;
      v267 = objc_alloc_init(PKPaymentTransactionPresentationInformation);
      [(PKPaymentTransactionPresentationInformation *)v267 setPrimaryString:v343];
      [(PKPaymentTransactionPresentationInformation *)v267 setSecondaryString:v362];
      [(PKPaymentTransactionPresentationInformation *)v267 setTertiaryString:v360];
      [(PKPaymentTransactionPresentationInformation *)v267 setDestructiveSecondaryString:v346];
      [(PKPaymentTransactionPresentationInformation *)v267 setBadgeString:v247];
      [(PKPaymentTransactionPresentationInformation *)v267 setValueString:v358];
      [(PKPaymentTransactionPresentationInformation *)v267 setSecondaryBadgeSymbol:v264];
      [(PKPaymentTransactionPresentationInformation *)v267 setShouldGrayValue:v336];
      [(PKPaymentTransactionPresentationInformation *)v267 setShouldStrikeValue:v335];
      [(PKPaymentTransactionPresentationInformation *)v267 setShouldShowDisclosure:v337];
      v23 = v267;

      id v19 = v344;
      id v20 = v345;
      id v17 = v266;
      id v16 = v263;
      id v15 = v339;
LABEL_426:

      return v23;
  }
}

+ (id)_presentationInformationForBankConnectTransaction:(id)a3 paymentPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bankConnectCreditDebitIndicator];
  unint64_t v9 = [v6 transactionType];
  unint64_t v10 = [v6 transactionStatus];
  v11 = [v6 formattedBalanceAdjustmentAmount];
  v12 = 0;
  if (v9 <= 0x16)
  {
    if (((1 << v9) & 0x7F06F3) != 0)
    {
      v13 = [v6 merchant];
      v12 = [v13 displayName];
    }
    else if (v9 == 11)
    {
      if (v8 == 1) {
        uint64_t v21 = @"BANK_CONNECT_INTEREST_EARNED_TRANSACTION_CELL_PRIMARY_STRING";
      }
      else {
        uint64_t v21 = @"BANK_CONNECT_INTEREST_CHARGED_TRANSACTION_CELL_PRIMARY_STRING";
      }
      v12 = PKLocalizedBankConnectString(&v21->isa, 0);
LABEL_16:
      if ([v6 isIssuerInstallmentTransaction])
      {
        v22 = [v7 uniqueID];
        if (v22)
        {
          v23 = objc_alloc_init(PKPaymentService);
          uint64_t v24 = [(PKPaymentService *)v23 paymentOffersCatalog];

          uint64_t v25 = [v24 criteriaWithType:1 passUniqueID:v22];
        }
        else
        {
          uint64_t v25 = 0;
        }
        int v28 = [v25 programName];
        uint64_t v29 = v28;
        if (v25 && v28)
        {
          id v30 = v28;
        }
        else
        {
          PKLocalizedPaymentOffersString(&cfstr_PayLaterBadgeT.isa, 0);
          id v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v14 = v30;
      }
      else
      {
        id v14 = 0;
      }
LABEL_41:
      if (!PKHideCardBenefitRewards())
      {
        BOOL v31 = [v6 paymentRewardsRedemption];

        if (v31)
        {
          uint64_t v32 = PKLocalizedPayWithPointsString(&cfstr_TransactionRew_3.isa, 0);

          id v14 = (id)v32;
        }
      }
      goto LABEL_48;
    }
  }
  id v14 = 0;
  switch(v9)
  {
    case 0uLL:
      id v14 = [v6 displayLocation];
      if ([v6 isIssuerInstallmentTransaction])
      {
        id v15 = [v7 uniqueID];
        uint64_t v44 = v15;
        if (v15)
        {
          id v16 = objc_alloc_init(PKPaymentService);
          id v17 = [(PKPaymentService *)v16 paymentOffersCatalog];

          id v15 = [v17 criteriaWithType:1 passUniqueID:v15];
        }
        id v18 = [v15 programName];
        id v19 = v18;
        if (v15 && v18)
        {
          id v20 = v18;
        }
        else
        {
          PKLocalizedPaymentOffersString(&cfstr_PayLaterBadgeT.isa, 0);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v43 = v20;

        id v14 = v43;
      }
      goto LABEL_41;
    case 1uLL:
      v26 = @"BANK_CONNECT_REFUND_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 3uLL:
    case 0xBuLL:
    case 0x10uLL:
      goto LABEL_16;
    case 4uLL:
      v26 = @"BANK_CONNECT_FEE_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 5uLL:
      v26 = @"BANK_CONNECT_WITHDRAWAL_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 6uLL:
      v26 = @"BANK_CONNECT_DEPOSIT_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 7uLL:
      v26 = @"BANK_CONNECT_ADJUSTMENT_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 9uLL:
      v26 = @"BANK_CONNECT_REWARDS_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 0xAuLL:
      uint64_t v27 = [v6 displayLocation];
      goto LABEL_47;
    case 0x11uLL:
      v26 = @"BANK_CONNECT_DIVIDEND_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 0x12uLL:
      if (v8 == 1) {
        v26 = @"BANK_CONNECT_LOAN_CREDIT_TRANSACTION_CELL_SECONDARY_STRING";
      }
      else {
        v26 = @"BANK_CONNECT_LOAN_DEBIT_TRANSACTION_CELL_SECONDARY_STRING";
      }
      goto LABEL_46;
    case 0x13uLL:
      v26 = @"BANK_CONNECT_STANDING_ORDER_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 0x14uLL:
      v26 = @"BANK_CONNECT_DIRECT_DEBIT_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 0x15uLL:
      v26 = @"BANK_CONNECT_TRANSFER_TRANSACTION_CELL_SECONDARY_STRING";
      goto LABEL_46;
    case 0x16uLL:
      if (v8 == 1) {
        v26 = @"BANK_CONNECT_CHECK_CREDIT_TRANSACTION_CELL_SECONDARY_STRING";
      }
      else {
        v26 = @"BANK_CONNECT_CHECK_DEBIT_TRANSACTION_CELL_SECONDARY_STRING";
      }
LABEL_46:
      uint64_t v27 = PKLocalizedBankConnectString(&v26->isa, 0);
LABEL_47:
      id v14 = (id)v27;
      break;
    default:
      break;
  }
LABEL_48:
  if (!v12 || ![v12 length])
  {
    if (v14)
    {
      uint64_t v33 = [v14 copy];

      v12 = v14;
    }
    else
    {
      uint64_t v33 = [v6 localizedTypeDescription];
    }

    id v14 = 0;
    v12 = (void *)v33;
  }
  char v45 = 1;
  BOOL v34 = [a1 _statusAnnotationForTransaction:v6 overloadAnnotation:&v45];
  if ([v34 length])
  {
    if (!v45)
    {
      id v35 = v34;
      goto LABEL_59;
    }
    if (v14)
    {
      PKLocalizedPaymentString(&cfstr_PaymentPassDet.isa, &stru_1EE105568.isa, v34, v14);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
      id v36 = v35;

      id v14 = v36;
      goto LABEL_61;
    }
    id v14 = v34;
  }
LABEL_61:
  v37 = [a1 _relativeDateForTransaction:v6];
  v38 = v37;
  if (!v14)
  {
    id v14 = (id)[v37 copy];

    v38 = 0;
  }
  uint64_t v39 = (v10 < 8) & (0xF8u >> v10);
  BOOL v40 = v10 == 2;
  v41 = objc_alloc_init(PKPaymentTransactionPresentationInformation);
  [(PKPaymentTransactionPresentationInformation *)v41 setValueString:v11];
  [(PKPaymentTransactionPresentationInformation *)v41 setPrimaryString:v12];
  [(PKPaymentTransactionPresentationInformation *)v41 setSecondaryString:v14];
  [(PKPaymentTransactionPresentationInformation *)v41 setDestructiveSecondaryString:v40];
  [(PKPaymentTransactionPresentationInformation *)v41 setTertiaryString:v38];
  [(PKPaymentTransactionPresentationInformation *)v41 setBadgeString:0];
  [(PKPaymentTransactionPresentationInformation *)v41 setSecondaryBadgeSymbol:0];
  [(PKPaymentTransactionPresentationInformation *)v41 setShouldGrayValue:v39];
  [(PKPaymentTransactionPresentationInformation *)v41 setShouldStrikeValue:v39];
  [(PKPaymentTransactionPresentationInformation *)v41 setShouldShowDisclosure:1];

  return v41;
}

+ (id)_relativeDateForTransaction:(id)a3
{
  id v3 = a3;
  v4 = [v3 transactionDate];
  v5 = PKRelativeDateStringWithFullDateForUnits(v4, 8206, 0);
  uint64_t v6 = [v3 transactionType];
  uint64_t v7 = v6;
  if (v6 != 9)
  {
    if (v6 != 5) {
      goto LABEL_7;
    }
    uint64_t v8 = [v3 transfers];
    if (![v8 count])
    {
      char v9 = [v3 isBankConnectTransaction];

      if (v9) {
        goto LABEL_7;
      }
      PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_6.isa, &stru_1EE0F6808.isa, v5);
      v5 = uint64_t v8 = v5;
    }

LABEL_7:
    if (![v3 bankConnectRoundTransactionDate]) {
      goto LABEL_11;
    }
  }
  unint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([v10 isDateInToday:v4])
  {
    uint64_t v11 = PKLocalizedString(&cfstr_RelativeDateTo_0.isa, 0);

    v5 = (void *)v11;
  }

LABEL_11:
  if (v7 == 2 && ([v3 shouldSuppressDate] & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v5, "pk_uppercaseFirstStringForPreferredLocale");
  }

  return v12;
}

+ (id)_statusAnnotationForTransaction:(id)a3 overloadAnnotation:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 transactionType];
  uint64_t v7 = [v5 featureIdentifier];
  switch(v6)
  {
    case 9:
      id v14 = @"TRANSACTION_REWARDS_CASH_BACK";
LABEL_7:
      uint64_t v15 = PKLocalizedFeatureString(v14, 2, 0, v8, v9, v10, v11, v12, v26);
LABEL_14:
      v13 = (void *)v15;
      goto LABEL_15;
    case 2:
LABEL_5:
      v13 = 0;
      goto LABEL_15;
    case 1:
      if ([v5 isBankConnectTransaction]) {
        goto LABEL_5;
      }
      id v19 = @"PAYMENT_TRANSACTION_REFUND";
LABEL_13:
      uint64_t v15 = PKLocalizedPaymentString(&v19->isa, 0);
      goto LABEL_14;
  }
  uint64_t v16 = v7;
  uint64_t v17 = [v5 transactionStatus];
  v13 = 0;
  BOOL v18 = 1;
  switch(v17)
  {
    case 0:
    case 8:
      if (v16 == 2 && v6 == 10)
      {
        id v14 = @"PAYMENT_TRANSACTION_PENDING_PAYMENT";
        goto LABEL_7;
      }
      v22 = [v5 transfers];
      v23 = [v22 firstObject];

      if (v23
        && ([v23 externalAccount],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            uint64_t v25 = [v24 type],
            v24,
            v25 == 2))
      {
        v13 = 0;
      }
      else
      {
        v13 = PKLocalizedPaymentString(&cfstr_PaymentTransac_2.isa, 0);
      }

      break;
    case 2:
      v13 = PKLocalizedPaymentString(&cfstr_PaymentTransac_3.isa, 0);
      BOOL v18 = [v5 accountType] != 3;
      if (a4) {
        goto LABEL_17;
      }
      goto LABEL_18;
    case 4:
      id v19 = @"PAYMENT_TRANSACTION_FAILED";
      goto LABEL_13;
    case 5:
      id v19 = @"PAYMENT_TRANSACTION_CANCELED";
      goto LABEL_13;
    case 6:
      id v19 = @"PAYMENT_TRANSACTION_REJECTED";
      goto LABEL_13;
    case 7:
      id v19 = @"PAYMENT_TRANSACTION_EXPIRED";
      goto LABEL_13;
    default:
      goto LABEL_16;
  }
LABEL_15:
  BOOL v18 = 1;
LABEL_16:
  if (a4) {
LABEL_17:
  }
    *a4 = v18;
LABEL_18:
  id v20 = objc_msgSend(v13, "pk_uppercaseFirstStringForPreferredLocale");

  return v20;
}

+ (id)secondaryFundingSourceDescriptionForTransaction:(id)a3 secondarySource:(id)a4 includeBankAccountSuffix:(BOOL)a5 useGenericNameIfNoDescriptionAvailable:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 transactionType];
  if (v11 == 10)
  {
    uint64_t v15 = [a1 _billPaymentFundingSourceForTransaction:v9];
    goto LABEL_37;
  }
  if (v11 != 5)
  {
    uint64_t v12 = [v9 secondaryFundingSourceFPANIdentifier];
    if ([v12 length])
    {
      uint64_t v16 = [v10 paymentPass];
      uint64_t v15 = [v16 localizedDescription];
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (![v15 length])
    {
      uint64_t v17 = [v9 secondaryFundingSourceDescription];

      uint64_t v15 = (void *)v17;
    }
    if ([v15 length]) {
      goto LABEL_36;
    }
    BOOL v18 = PKDisplayablePaymentNetworkNameForPaymentCredentialType([v9 secondaryFundingSourceNetwork]);
    id v19 = [v9 secondaryFundingSourceDPANSuffix];
    if ([v18 length] && objc_msgSend(v19, "length"))
    {
      PKLocalizedPeerPaymentString(&cfstr_TransactionSec_5.isa, &stru_1EE105568.isa, v18, v19);
      goto LABEL_33;
    }
    if ([v18 length])
    {
      uint64_t v25 = v18;
      uint64_t v21 = @"TRANSACTION_SECONDARY_FUNDING_SOURCE_CARD_DESCRIPTION_NETWORK_FORMAT_STRING";
    }
    else
    {
      if (![v19 length])
      {
        if ([v9 isBankConnectTransaction])
        {
          uint64_t v22 = PKLocalizedBankConnectString(&cfstr_BankConnectOth.isa, 0);
          goto LABEL_34;
        }
        if (!v6) {
          goto LABEL_35;
        }
        PKLocalizedPeerPaymentString(&cfstr_TransactionSec_8.isa, 0);
        uint64_t v22 = LABEL_33:;
LABEL_34:
        v23 = (void *)v22;

        uint64_t v15 = v23;
LABEL_35:

        goto LABEL_36;
      }
      uint64_t v25 = v19;
      uint64_t v21 = @"TRANSACTION_SECONDARY_FUNDING_SOURCE_CARD_DESCRIPTION_DPAN_SUFFIX_FORMAT_STRING";
    }
    PKLocalizedPeerPaymentString(&v21->isa, &stru_1EE0F6808.isa, v25);
    goto LABEL_33;
  }
  uint64_t v12 = [v9 secondaryFundingSourceDescription];
  uint64_t v13 = [v9 secondaryFundingSourceType];
  if (v13)
  {
    if (v13 == 1)
    {
      if (![v12 length])
      {
        if (v6)
        {
          id v14 = @"TRANSACTION_SECONDARY_FUNDING_SOURCE_BANK_ACCOUNT_DESCRIPTION_GENERIC";
          goto LABEL_28;
        }
LABEL_29:
        uint64_t v15 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      if (v13 != 2) {
        goto LABEL_29;
      }
      if (![v12 length])
      {
        if (v6)
        {
          id v14 = @"TRANSACTION_SECONDARY_FUNDING_SOURCE_DEBIT_DESCRIPTION_GENERIC";
LABEL_28:
          PKLocalizedPeerPaymentString(&v14->isa, 0);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        goto LABEL_29;
      }
    }
  }
  else if (![v12 length])
  {
    goto LABEL_29;
  }
  id v20 = v12;
LABEL_23:
  uint64_t v15 = v20;
LABEL_36:

LABEL_37:
  return v15;
}

+ (id)_billPaymentFundingSourceForTransaction:(id)a3
{
  id v3 = [a3 payments];
  v4 = [v3 firstObject];

  id v5 = [v4 fundingSource];
  uint64_t v11 = 0;
  switch([v5 type])
  {
    case 1:
    case 5:
      uint64_t v12 = [v5 displayDescription];
      uint64_t v11 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ACH_ITEM_FORMAT", 2, @"%@", v13, v14, v15, v16, v17, (uint64_t)v12);

      break;
    case 2:
      BOOL v18 = @"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_APC_ITEM";
      goto LABEL_5;
    case 3:
      BOOL v18 = @"ACCOUNT_SERVICE_PAYMENT_DETAILS_OFFLINE_PAYMENT";
LABEL_5:
      uint64_t v11 = PKLocalizedFeatureString(v18, 2, 0, v6, v7, v8, v9, v10, v20);
      break;
    default:
      break;
  }

  return v11;
}

+ (void)_transferFundingSourceInformationForTransaction:(id)a3 primaryString:(id *)a4 secondaryString:(id *)a5
{
  id v50 = a3;
  uint64_t v7 = [v50 transfers];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v8 externalAccount];
  uint64_t v10 = [v50 associatedFeatureIdentifier];
  uint64_t v11 = 0;
  id v12 = 0;
  switch([v9 type])
  {
    case 1:
    case 5:
      uint64_t v11 = [v9 displayDescription];
      if ([v8 type] == 2) {
        goto LABEL_3;
      }
      id v35 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
      goto LABEL_13;
    case 2:
      uint64_t v21 = [v8 type];
      uint64_t v22 = [v50 featureIdentifier];
      if (v21 == 2)
      {
        if (v22 != 1)
        {
          uint64_t v36 = [v50 featureIdentifier];
          uint64_t v11 = PKLocalizedFeatureString(@"TRANSACTION_TYPE_TOPUP_CASH", v36, 0, v37, v38, v39, v40, v41, v49);
LABEL_3:
          uint64_t v13 = [v50 featureIdentifier];
          id v19 = @"TRANSACTION_TYPE_TOP_UP";
          goto LABEL_4;
        }
        if (v10)
        {
          uint64_t v11 = PKLocalizedFeatureString(@"TRANSACTION_PRODUCT_NAME", v10, 0, v23, v24, v25, v26, v27, v49);
          id v19 = @"TRANSACTION_TYPE_WITHDRAWAL_ACCOUNT";
          uint64_t v13 = v10;
LABEL_4:
          uint64_t v20 = PKLocalizedFeatureString(v19, v13, 0, v14, v15, v16, v17, v18, v49);
          goto LABEL_14;
        }
        uint64_t v48 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
      }
      else
      {
        if (v22 != 1)
        {
          uint64_t v42 = [v50 featureIdentifier];
          uint64_t v11 = PKLocalizedFeatureString(@"TRANSACTION_TYPE_TOPUP_CASH", v42, 0, v43, v44, v45, v46, v47, v49);
          uint64_t v13 = [v50 featureIdentifier];
          id v19 = @"TRANSACTION_TYPE_WITHDRAWAL_CASH";
          goto LABEL_4;
        }
        if (v10)
        {
          uint64_t v11 = PKLocalizedFeatureString(@"TRANSACTION_PRODUCT_NAME", v10, 0, v23, v24, v25, v26, v27, v49);
          id v35 = @"TRANSACTION_TYPE_TOP_UP";
LABEL_13:
          uint64_t v20 = PKLocalizedPaymentString(&v35->isa, 0);
LABEL_14:
          id v12 = (id)v20;
          if (!a4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        uint64_t v48 = @"TRANSACTION_TYPE_TOP_UP";
      }
      uint64_t v34 = PKLocalizedPaymentString(&v48->isa, 0);
LABEL_10:
      uint64_t v11 = (void *)v34;
      id v12 = 0;
      if (a4)
      {
LABEL_15:
        if (v11) {
          *a4 = v11;
        }
      }
LABEL_17:
      if (a5 && v12)
      {
        id v12 = v12;
        *a5 = v12;
      }
LABEL_20:

      return;
    case 3:
      uint64_t v28 = [v50 featureIdentifier];
      uint64_t v34 = PKLocalizedFeatureString(@"TRANSACTION_TYPE_OFFLINE_TRANSFER", v28, 0, v29, v30, v31, v32, v33, v49);
      goto LABEL_10;
    default:
      goto LABEL_20;
  }
}

+ (unint64_t)iconTypeForTransaction:(id)a3 ignoreLogoURL:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 staticIconNameForTransaction:v6];

  if (!v7)
  {
    uint64_t v9 = [v6 merchant];
    uint64_t v10 = v9;
    if (a4
      || ([v9 logoImageURL], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
    {
      if ([v6 transactionType] == 2)
      {
        unint64_t v8 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if ([v6 transactionType] == 15)
      {
        if ([v6 transactionSource] == 2) {
          unint64_t v8 = 3;
        }
        else {
          unint64_t v8 = 0;
        }
        goto LABEL_12;
      }
    }
    unint64_t v8 = 0;
    goto LABEL_12;
  }
  unint64_t v8 = 2;
LABEL_13:

  return v8;
}

+ (BOOL)transactionIsPaymentForPayLaterFinancingPlan:(id)a3
{
  id v3 = a3;
  if ([v3 transactionType])
  {
    BOOL v4 = 0;
  }
  else if ([v3 associatedFeatureIdentifier] == 3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v3 associatedFinancingPlan];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (id)staticIconNameForTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 isBankConnectTransaction])
  {
    id v5 = 0;
    switch([v4 transactionType])
    {
      case 4:
        id v5 = @"BANK_CONNECT_Fee";
        break;
      case 5:
      case 6:
      case 7:
      case 10:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        id v6 = [v4 currencyCode];
        char v7 = [v6 isEqual:@"GBP"];

        if (v7)
        {
          id v5 = @"IconGBP";
        }
        else
        {
          uint64_t v14 = [v4 currencyCode];
          int v15 = [v14 isEqual:@"USD"];

          if (v15) {
            id v5 = @"SAVINGS_Bank";
          }
          else {
            id v5 = 0;
          }
        }
        break;
      case 9:
        goto LABEL_22;
      case 11:
        id v5 = @"SAVINGS_Interest";
        break;
      case 17:
        id v5 = @"BANK_CONNECT_Dividend";
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v8 = [v4 accountType];
    id v5 = 0;
    switch([v4 transactionType])
    {
      case 0:
      case 1:
      case 2:
      case 13:
      case 14:
      case 15:
        uint64_t v9 = [v4 releasedData];
        uint64_t v10 = [v9 application];
        uint64_t v11 = [v10 client];

        if (v11 == 1) {
          id v5 = @"apple_icon_identity";
        }
        else {
          id v5 = 0;
        }
        if ([a1 transactionIsPaymentForPayLaterFinancingPlan:v4]) {
          id v5 = @"PayLater_welcome_icon";
        }
        if ([v4 transactionType]) {
          break;
        }
        id v12 = [v4 payments];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          id v5 = @"AppleCardIcon";
          break;
        }
        uint64_t v29 = [v4 transfers];
        if ([v29 count])
        {
          uint64_t v30 = [v4 associatedFeatureIdentifier];

          if (v30 == 5)
          {
            id v5 = @"SAVINGS_Icon";
            break;
          }
        }
        else
        {
        }
        if ([v4 associatedFeatureIdentifier] == 1)
        {
          uint64_t v31 = [v4 merchant];
          int v32 = [v31 hasMapsMatch];

          if (!v32) {
            id v5 = @"SAVINGS_Cash";
          }
        }
        break;
      case 3:
        uint64_t v21 = [v4 peerPaymentType];
        uint64_t v22 = @"CashBackIcon";
        uint64_t v23 = @"SAVINGS_Cash";
        BOOL v24 = v21 == 6;
        goto LABEL_37;
      case 4:
      case 12:
LABEL_22:
        id v5 = @"CashBackIcon";
        break;
      case 5:
      case 6:
      case 19:
      case 20:
      case 21:
      case 22:
        uint64_t v16 = [v4 transfers];
        uint64_t v17 = [v16 count];

        if (!v17) {
          goto LABEL_34;
        }
        uint64_t v18 = [v4 transfers];
        id v19 = [v18 firstObject];

        uint64_t v20 = [v19 externalAccount];
        if ([v20 type] == 2)
        {
          if ([v4 associatedFeatureIdentifier] == 5) {
            id v5 = @"SAVINGS_Icon";
          }
          else {
            id v5 = @"SAVINGS_Cash";
          }
        }
        else
        {
          id v5 = @"SAVINGS_Bank";
        }

        break;
      case 7:
        if (v8 == 3
          && ([v4 transfers],
              uint64_t v25 = objc_claimAutoreleasedReturnValue(),
              uint64_t v26 = [v25 count],
              v25,
              v26))
        {
LABEL_34:
          id v5 = @"SAVINGS_Bank";
        }
        else
        {
          id v5 = @"AdjustmentsIcon";
        }
        break;
      case 8:
        uint64_t v27 = [v4 redemptionEvent];

        uint64_t v22 = @"AppleCardIcon";
        uint64_t v23 = @"CashBackIcon";
        BOOL v24 = v27 == 0;
        goto LABEL_37;
      case 9:
      case 10:
        if ([v4 isBankConnectTransaction]) {
          id v5 = 0;
        }
        else {
          id v5 = @"AppleCardIcon";
        }
        break;
      case 11:
        uint64_t v22 = @"InterestIcon";
        uint64_t v23 = @"SAVINGS_Interest";
        BOOL v24 = v8 == 3;
LABEL_37:
        if (v24) {
          id v5 = v23;
        }
        else {
          id v5 = v22;
        }
        break;
      default:
        break;
    }
  }

  return v5;
}

@end