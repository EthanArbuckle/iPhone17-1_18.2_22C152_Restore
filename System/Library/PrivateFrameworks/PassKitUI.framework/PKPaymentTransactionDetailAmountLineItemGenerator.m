@interface PKPaymentTransactionDetailAmountLineItemGenerator
- (id)_feeLineItemsForFees:(id)a3;
- (id)_foreignExchangeLineItemsForExchangeInfo:(id)a3;
- (id)_lineItemsForPeerPaymentTransaction:(id)a3 transactionSourceCollection:(id)a4;
- (id)_lineItemsForPurchaseTransaction:(id)a3 transactionSourceCollection:(id)a4 associatedReceipt:(id)a5;
- (id)_lineItemsForWithdrawalTransaction:(id)a3 transactionSourceCollection:(id)a4;
- (id)_primaryFundingSourceLineItemForTransaction:(id)a3 transactionSourceCollection:(id)a4;
- (id)_rewardsLineItemsForRewards:(id)a3 currencyCode:(id)a4;
- (id)_secondaryFundingSourceLineItemForTransaction:(id)a3;
- (id)_subtotalLineItemForTransaction:(id)a3;
- (id)_totalPaidLineItemForTransaction:(id)a3 isUnqualified:(BOOL)a4;
- (id)_totalReceivedLineItemForTransaction:(id)a3;
- (id)_totalRequestedLineItemForTransaction:(id)a3;
- (id)_totalSentLineItemForTransaction:(id)a3;
- (id)_totalTransferredItemForTransaction:(id)a3;
- (id)lineItemsForInstallmentPlan:(id)a3;
- (id)lineItemsForTransaction:(id)a3 transactionSourceCollection:(id)a4 associatedTransaction:(id)a5 associatedReceipt:(id)a6;
@end

@implementation PKPaymentTransactionDetailAmountLineItemGenerator

- (id)lineItemsForTransaction:(id)a3 transactionSourceCollection:(id)a4 associatedTransaction:(id)a5 associatedReceipt:(id)a6
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = 0;
  uint64_t v15 = [v10 transactionType];
  switch(v15)
  {
    case 0:
      uint64_t v31 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _lineItemsForPurchaseTransaction:v10 transactionSourceCollection:v11 associatedReceipt:v13];
      goto LABEL_72;
    case 1:
      v32 = [PKPaymentTransactionDetailAmountLineItemTotal alloc];
      v33 = [v10 amount];
      v34 = [v10 currencyCode];
      v35 = PKCurrencyAmountCreate(v33, v34);
      v36 = [(PKPaymentTransactionDetailAmountLineItemTotal *)v32 initWithAmount:v35 totalType:4];

      if (v12)
      {
        v37 = [[PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment alloc] initWithAssociatedTransaction:v12];
        [(PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment *)v37 setHasTrailingLineSeperator:1];
        v127[0] = v36;
        v127[1] = v37;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
      }
      else
      {
        [(PKPaymentTransactionDetailAmountLineItemTotal *)v36 setHasTrailingLineSeperator:1];
        v126 = v36;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
      }

      break;
    case 2:
      v38 = [v10 amount];
      objc_msgSend(v38, "pk_absoluteValue");
      v106 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      v98 = v38;
      int v97 = objc_msgSend(v38, "pk_isNegativeNumber");
      v110 = [v11 paymentPass];
      v107 = [v10 currencyCode];
      if (!v107)
      {
        v39 = [v110 devicePrimaryContactlessPaymentApplication];
        v107 = [v39 appletCurrencyCode];
      }
      v40 = [v10 amounts];
      v41 = [v10 plans];
      uint64_t v42 = [v10 transitType];
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v104 = v10;
      v105 = v41;
      id v101 = v13;
      id v102 = v12;
      id v103 = v11;
      uint64_t v99 = v42;
      v100 = v40;
      if (v40)
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        obuint64_t j = v40;
        uint64_t v44 = [obj countByEnumeratingWithState:&v119 objects:v130 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v120;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v120 != v46) {
                objc_enumerationMutation(obj);
              }
              v48 = *(void **)(*((void *)&v119 + 1) + 8 * i);
              v49 = [v48 amount];
              v50 = [v49 absoluteValue];
              v51 = [v50 formattedStringValue];

              v52 = [v49 amount];
              int v53 = objc_msgSend(v52, "pk_isNegativeNumber");

              if (v53)
              {
                uint64_t v54 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v51);

                v55 = @"TRANSACTION_DEFAULT_CREDIT";
                v51 = (void *)v54;
              }
              else
              {
                v55 = @"TRANSACTION_DEFAULT_AMOUNT";
              }
              v56 = PKLocalizedPaymentString(&v55->isa);
              uint64_t v57 = [v48 label];
              v58 = (void *)v57;
              if (v57) {
                v59 = (void *)v57;
              }
              else {
                v59 = v56;
              }
              id v60 = v59;

              v61 = [[PKPaymentTransactionDetailAmountLineItemGeneric alloc] initWithLabel:v60 value:v51];
              [(PKPaymentTransactionDetailAmountLineItemGeneric *)v61 setHasTrailingLineSeperator:1];
              [(PKPaymentTransactionDetailAmountLineItemGeneric *)v61 setIsEmphasized:0];
              [v43 addObject:v61];
            }
            uint64_t v45 = [obj countByEnumeratingWithState:&v119 objects:v130 count:16];
          }
          while (v45);
        }

        id v11 = v103;
        id v13 = v101;
        id v12 = v102;
        uint64_t v42 = v99;
        v40 = v100;
        v41 = v105;
      }
      if (v41)
      {
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        id v62 = v41;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v115 objects:v129 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v116;
          do
          {
            for (uint64_t j = 0; j != v64; ++j)
            {
              if (*(void *)v116 != v65) {
                objc_enumerationMutation(v62);
              }
              v67 = *(void **)(*((void *)&v115 + 1) + 8 * j);
              v68 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
              v69 = [v67 label];
              v70 = PKPassLocalizedStringWithFormat();
              v71 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v68, "initWithLabel:value:", v69, v70, 0);

              [(PKPaymentTransactionDetailAmountLineItemGeneric *)v71 setHasTrailingLineSeperator:1];
              [(PKPaymentTransactionDetailAmountLineItemGeneric *)v71 setIsEmphasized:0];
              [v43 addObject:v71];
            }
            uint64_t v64 = [v62 countByEnumeratingWithState:&v115 objects:v129 count:16];
          }
          while (v64);
        }

        id v11 = v103;
        id v10 = v104;
        id v13 = v101;
        id v12 = v102;
        uint64_t v42 = v99;
        v40 = v100;
        v41 = v105;
      }
      if (v42 == 517 && ([v110 shouldSuppressNoChargeAmount] & 1) == 0)
      {
        v72 = [v110 devicePrimaryPaymentApplication];
        uint64_t v73 = [v72 paymentNetworkIdentifier];

        if (v73 == 131)
        {
          v74 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
          v75 = PKLocalizedPaymentString(&cfstr_TransactionDet_67.isa);
          v76 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)v74 initWithLabel:v75 value:&stru_1EF1B5B50];

          [(PKPaymentTransactionDetailAmountLineItemGeneric *)v76 setHasTrailingLineSeperator:1];
          [(PKPaymentTransactionDetailAmountLineItemGeneric *)v76 setIsEmphasized:0];
          [v43 addObject:v76];
        }
      }
      if (([v10 enRoute] & 1) == 0 && v42 != 1025 && v106 && v107)
      {
        v77 = PKCurrencyAmountCreate(v106, v107);
        uint64_t v78 = [v77 formattedStringValue];
        v79 = (void *)v78;
        if (v97)
        {
          uint64_t v80 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v78);

          v79 = (void *)v80;
        }
        v81 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
        v82 = PKLocalizedPaymentString(&cfstr_TransactionDef_2.isa);
        v83 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)v81 initWithLabel:v82 value:v79];

        [(PKPaymentTransactionDetailAmountLineItemGeneric *)v83 setHasTrailingLineSeperator:1];
        [(PKPaymentTransactionDetailAmountLineItemGeneric *)v83 setIsEmphasized:1];
        [v43 addObject:v83];

        v41 = v105;
        uint64_t v42 = v99;
      }
      if (([v10 enRoute] & 1) == 0 && v42 != 1025 && (unint64_t)objc_msgSend(v40, "count") >= 2)
      {
        v84 = [v10 dictionaryOfFormattedMultipleAmountTotalsByRealCurrency];
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id obja = [v84 keyEnumerator];
        uint64_t v85 = [obja countByEnumeratingWithState:&v111 objects:v128 count:16];
        if (v85)
        {
          uint64_t v86 = v85;
          uint64_t v87 = *(void *)v112;
          do
          {
            for (uint64_t k = 0; k != v86; ++k)
            {
              if (*(void *)v112 != v87) {
                objc_enumerationMutation(obja);
              }
              uint64_t v89 = *(void *)(*((void *)&v111 + 1) + 8 * k);
              v90 = PKLocalizedPaymentString(&cfstr_TransactionTot.isa, &stru_1EF1B4C70.isa, v89);
              v91 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
              v92 = [v84 objectForKeyedSubscript:v89];
              v93 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)v91 initWithLabel:v90 value:v92];

              [(PKPaymentTransactionDetailAmountLineItemGeneric *)v93 setHasTrailingLineSeperator:1];
              [(PKPaymentTransactionDetailAmountLineItemGeneric *)v93 setIsEmphasized:1];
              [v43 addObject:v93];
            }
            uint64_t v86 = [obja countByEnumeratingWithState:&v111 objects:v128 count:16];
          }
          while (v86);
        }

        id v11 = v103;
        id v10 = v104;
        id v13 = v101;
        id v12 = v102;
        v40 = v100;
        v41 = v105;
      }
      v14 = (void *)[v43 copy];

      break;
    case 3:
      uint64_t v31 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _lineItemsForPeerPaymentTransaction:v10 transactionSourceCollection:v11];
      goto LABEL_72;
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      v16 = [v10 transfers];
      v17 = [v16 firstObject];

      if (v17 && [v10 transactionStatus] != 2)
      {
        uint64_t v27 = [v17 fundsAreAvailable];
        uint64_t v28 = [v17 expectedCompletionDate];
        v19 = (NSDecimalNumber *)v28;
        if ((v27 & 1) != 0 || !v28)
        {
          uint64_t v29 = [v10 transactionStatusChangedDate];

          v19 = (NSDecimalNumber *)v29;
        }
        v25 = [[PKPaymentTransactionDetailAmountLineCompletionDate alloc] initWithDate:v19 completed:v27];
        [(PKPaymentTransactionDetailAmountLineCompletionDate *)v25 setHasTrailingLineSeperator:1];
        v125 = v25;
        v26 = &v125;
      }
      else
      {
        v18 = [v10 amount];
        v19 = v18;
        if (v18)
        {
          char v20 = [(NSDecimalNumber *)v18 pk_isNegativeNumber];
          if (v15 == 11 && (v20 & 1) == 0 && [v10 featureIdentifier] == 5)
          {
            uint64_t v21 = [(NSDecimalNumber *)v19 pk_negativeValue];

            v19 = (NSDecimalNumber *)v21;
          }
        }
        v22 = [PKPaymentTransactionDetailAmountLineItemTotal alloc];
        v23 = [v10 currencyCode];
        v24 = PKCurrencyAmountCreate(v19, v23);
        v25 = [(PKPaymentTransactionDetailAmountLineItemTotal *)v22 initWithAmount:v24 totalType:4];

        [(PKPaymentTransactionDetailAmountLineCompletionDate *)v25 setHasTrailingLineSeperator:1];
        v124 = v25;
        v26 = &v124;
      }
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

      break;
    case 5:
      uint64_t v31 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _lineItemsForWithdrawalTransaction:v10 transactionSourceCollection:v11];
LABEL_72:
      v14 = (void *)v31;
      break;
    case 10:
      v94 = [PKPaymentTransactionDetailAmountLineItemPaymentTotal alloc];
      v95 = [v10 currencyAmount];
      v96 = [(PKPaymentTransactionDetailAmountLineItemPaymentTotal *)v94 initWithAmount:v95];

      [(PKPaymentTransactionDetailAmountLineItemPaymentTotal *)v96 setHasTrailingLineSeperator:1];
      v123 = v96;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];

      break;
    default:
      break;
  }

  return v14;
}

- (id)lineItemsForInstallmentPlan:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 lineItems];
  v69 = v3;
  v71 = [v3 currencyCode];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v93 objects:v99 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v94 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        uint64_t v14 = [v13 type];
        uint64_t v15 = v6;
        if (v14 != 1)
        {
          uint64_t v16 = [v13 type];
          uint64_t v15 = v7;
          if (v16 != 5) {
            continue;
          }
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v93 objects:v99 count:16];
    }
    while (v10);
  }
  v68 = v4;

  uint64_t v17 = [v6 count];
  uint64_t v18 = [v7 count];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v70 = v19;
  if (v17)
  {
    char v20 = v19;
    uint64_t v64 = objc_msgSend(v8, "pk_arrayByRemovingObjectsInArray:", v6);

    uint64_t v21 = [v6 count];
    v88[0] = MEMORY[0x1E4F143A8];
    v22 = &unk_1A0442000;
    v88[1] = 3221225472;
    v88[2] = __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke;
    v88[3] = &unk_1E59E0290;
    id v89 = v71;
    BOOL v92 = v18 != 0;
    id v90 = v20;
    uint64_t v91 = v21;
    [v6 enumerateObjectsUsingBlock:v88];

    id v8 = (id)v64;
  }
  else
  {
    v22 = &unk_1A0442000;
  }
  if (v18)
  {
    uint64_t v65 = objc_msgSend(v8, "pk_arrayByRemovingObjectsInArray:", v7);

    uint64_t v23 = [v7 count];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_2;
    v83[3] = &unk_1E59E0290;
    id v24 = v71;
    id v84 = v24;
    v25 = v70;
    id v26 = v70;
    BOOL v87 = v17 != 0;
    id v85 = v26;
    uint64_t v86 = v23;
    [v7 enumerateObjectsUsingBlock:v83];

    if (v17)
    {
      uint64_t v63 = (NSString *)v24;
      v67 = v26;
      uint64_t v27 = [MEMORY[0x1E4F28C28] zero];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v28 = v6;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v79 objects:v98 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v80 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v79 + 1) + 8 * j);
            v34 = [v33 amount];

            if (v34)
            {
              v35 = [v33 amount];
              uint64_t v36 = [(NSDecimalNumber *)v27 decimalNumberByAdding:v35];

              uint64_t v27 = (NSDecimalNumber *)v36;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v79 objects:v98 count:16];
        }
        while (v30);
      }

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v37 = v7;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v75 objects:v97 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v39; ++k)
          {
            if (*(void *)v76 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v42 = *(void **)(*((void *)&v75 + 1) + 8 * k);
            id v43 = [v42 amount];

            if (v43)
            {
              uint64_t v44 = [v42 amount];
              uint64_t v45 = [(NSDecimalNumber *)v27 decimalNumberBySubtracting:v44];

              uint64_t v27 = (NSDecimalNumber *)v45;
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v75 objects:v97 count:16];
        }
        while (v39);
      }

      uint64_t v46 = 0;
      if (v27)
      {
        v25 = v70;
        v22 = (void *)&unk_1A0442000;
        if (v63)
        {
          uint64_t v46 = PKCurrencyAmountCreate(v27, v63);
        }
      }
      else
      {
        v25 = v70;
        v22 = &unk_1A0442000;
      }
      v48 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v46 totalType:5];
      [(PKPaymentTransactionDetailAmountLineItemTotal *)v48 setHasTrailingLineSeperator:1];
      [v67 addObject:v48];
    }
    v47 = (void *)v65;
  }
  else
  {
    v47 = v8;
    v25 = v70;
  }
  [v68 addObjectsFromArray:v25];
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = v22[313];
  v72[2] = __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_3;
  v72[3] = &unk_1E59E02B8;
  id v50 = v71;
  id v73 = v50;
  id v51 = v49;
  id v74 = v51;
  [v47 enumerateObjectsUsingBlock:v72];
  v52 = [v51 lastObject];
  [v52 setHasTrailingLineSeperator:1];

  [v68 addObjectsFromArray:v51];
  int v53 = v69;
  if (v50)
  {
    uint64_t v54 = [v69 totalAmount];

    if (v54)
    {
      v55 = [v69 totalAmount];
      v56 = PKCurrencyAmountCreate(v55, (NSString *)v50);

      uint64_t v54 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v56 totalType:6];
      [v68 addObject:v54];
    }
    uint64_t v57 = [v69 rewards];
    if (v57)
    {
      [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _rewardsLineItemsForRewards:v57 currencyCode:v50];
      v59 = v58 = v47;
      id v60 = [v59 lastObject];
      [v60 setHasTrailingLineSeperator:1];

      v25 = v70;
      [v68 addObjectsFromArray:v59];

      v47 = v58;
      int v53 = v69;
    }
    else
    {
      [(PKPaymentTransactionDetailAmountLineItemTotal *)v54 setHasTrailingLineSeperator:1];
    }
  }
  v61 = (void *)[v68 copy];

  return v61;
}

void __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [[PKInstallmentPlanDetailLineItem alloc] initWithLineItem:v5 currencyCode:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v6];
  if (!*(unsigned char *)(a1 + 56) && *(void *)(a1 + 48) - 1 == a3) {
    [(PKInstallmentPlanDetailLineItem *)v6 setHasTrailingLineSeperator:1];
  }
}

void __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [[PKInstallmentPlanDetailLineItem alloc] initWithLineItem:v5 currencyCode:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v6];
  if (!*(unsigned char *)(a1 + 56) && *(void *)(a1 + 48) - 1 == a3) {
    [(PKInstallmentPlanDetailLineItem *)v6 setHasTrailingLineSeperator:1];
  }
}

void __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKInstallmentPlanDetailLineItem alloc] initWithLineItem:v3 currencyCode:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v4];
}

- (id)_lineItemsForWithdrawalTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [v5 fees];
  id v8 = [v7 fees];
  uint64_t v9 = [v8 allObjects];

  if ([v9 count])
  {
    uint64_t v10 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalTransferredItemForTransaction:v5];
    [v6 addObject:v10];
    uint64_t v11 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _feeLineItemsForFees:v9];
    id v12 = [v11 lastObject];
    [v12 setHasTrailingLineSeperator:1];

    [v6 addObjectsFromArray:v11];
    id v13 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalPaidLineItemForTransaction:v5 isUnqualified:1];
    [v13 setHasTrailingLineSeperator:1];
    [v6 addObject:v13];
  }
  uint64_t v14 = [v5 transfers];
  uint64_t v15 = [v14 firstObject];

  if (v15 && [v5 transactionStatus] != 2)
  {
    int v16 = [v15 fundsAreAvailable];
    uint64_t v17 = [v15 expectedCompletionDate];
    uint64_t v18 = (void *)v17;
    if ((v16 & 1) != 0 || !v17)
    {
      uint64_t v19 = [v5 transactionStatusChangedDate];

      uint64_t v18 = (void *)v19;
    }
    if (v16)
    {
      char v20 = [[PKPaymentTransactionDetailAmountLineCompletionDate alloc] initWithDate:v18 completed:1];
      [(PKPaymentTransactionDetailAmountLineCompletionDate *)v20 setHasTrailingLineSeperator:1];
      [v6 addObject:v20];
    }
  }
  if ([v6 count]) {
    uint64_t v21 = (void *)[v6 copy];
  }
  else {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)_lineItemsForPurchaseTransaction:(id)a3 transactionSourceCollection:(id)a4 associatedReceipt:(id)a5
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v90 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v7 foreignExchangeInformation];
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v11 = [v9 destinationCurrencyAmount];
  id v12 = [v11 currency];
  id v13 = [v7 currencyCode];
  id v14 = v12;
  id v15 = v13;
  int v16 = v15;
  if (v14 == v15)
  {

    goto LABEL_8;
  }
  if (v14 && v15)
  {
    char v17 = [v14 isEqualToString:v15];

    if ((v17 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v18 = [v10 exchangeRate];
    [v18 doubleValue];
    double v20 = v19;

    if (v20 == 1.0) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }

LABEL_11:
LABEL_12:
  uint64_t v21 = [v7 foreignExchangeInformation];
  v22 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _foreignExchangeLineItemsForExchangeInfo:v21];

  uint64_t v23 = [v22 lastObject];
  [v23 setHasTrailingLineSeperator:1];

  if ([v22 count]) {
    [v8 addObjectsFromArray:v22];
  }

LABEL_15:
  if (v90)
  {
    id v24 = [v90 lineItems];
    v25 = objc_msgSend(v24, "pk_arrayByApplyingBlock:", &__block_literal_global_240);

    id v26 = [v25 lastObject];
    [v26 setHasTrailingLineSeperator:1];

    [v8 addObjectsFromArray:v25];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v88 = [v90 summaryItems];
    id v28 = [v90 subtotalCurrencyAmount];
    uint64_t v29 = [v90 totalCurrencyAmount];
    id v89 = v28;
    BOOL v87 = (void *)v29;
    if (v28)
    {
      uint64_t v30 = (void *)v29;
      if (v29)
      {
        uint64_t v31 = [v28 amount];
        v32 = [v30 amount];
        uint64_t v33 = [v31 compare:v32];

        if (v33)
        {
          v34 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
          v35 = PKLocalizedPaymentString(&cfstr_Subtotal_0.isa);
          uint64_t v36 = [v89 formattedStringValue];
          id v37 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)v34 initWithLabel:v35 value:v36];

          [(PKPaymentTransactionDetailAmountLineItemGeneric *)v37 setIsEmphasized:1];
          [v27 addObject:v37];
        }
      }
    }
    uint64_t v38 = v88;
    if (v88)
    {
      v83 = v25;
      id v84 = v10;
      id v85 = v8;
      id v86 = v7;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v39 = v88;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v94 objects:v98 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v95;
LABEL_23:
        uint64_t v43 = 0;
        while (2)
        {
          if (*(void *)v95 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void **)(*((void *)&v94 + 1) + 8 * v43);
          uint64_t v45 = [v44 currencyAmount];
          uint64_t v46 = [v45 formattedStringValue];

          switch([v44 type])
          {
            case 0:
              v47 = [v44 label];
              if (v47) {
                goto LABEL_36;
              }
              v48 = @"TRANSACTION_RECEIPT_OTHER";
              goto LABEL_42;
            case 1:
              uint64_t v50 = [v44 label];
              if (!v50)
              {
                if ([v90 state] == 2) {
                  id v51 = @"TRANSACTION_RECEIPT_TAX";
                }
                else {
                  id v51 = @"TRANSACTION_RECEIPT_ESTIMATED_TAX";
                }
                uint64_t v50 = PKLocalizedPaymentString(&v51->isa);
              }
              id v49 = (void *)v50;
              goto LABEL_47;
            case 2:
              v47 = [v44 label];
              if (v47) {
                goto LABEL_36;
              }
              v48 = @"TRANSACTION_RECEIPT_SHIPPING";
              goto LABEL_42;
            case 3:
              v47 = [v44 label];
              if (v47)
              {
LABEL_36:
                id v52 = v47;
              }
              else
              {
                v48 = @"TRANSACTION_RECEIPT_FEE";
LABEL_42:
                PKLocalizedPaymentString(&v48->isa);
                id v52 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v49 = v52;

LABEL_47:
              uint64_t v57 = [[PKPaymentTransactionDetailAmountLineItemGeneric alloc] initWithLabel:v49 value:v46];
              [v27 addObject:v57];

              if (v41 != ++v43) {
                continue;
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v94 objects:v98 count:16];
              if (!v41) {
                goto LABEL_49;
              }
              goto LABEL_23;
            case 4:
              int v53 = [v44 label];
              uint64_t v54 = v53;
              if (v53)
              {
                id v55 = v53;
              }
              else
              {
                PKLocalizedPaymentString(&cfstr_TransactionRec_5.isa);
                id v55 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v49 = v55;

              uint64_t v56 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v46);

              uint64_t v46 = (void *)v56;
              goto LABEL_47;
            default:
              id v49 = 0;
              goto LABEL_47;
          }
        }
      }
LABEL_49:

      id v8 = v85;
      id v7 = v86;
      uint64_t v10 = v84;
      v25 = v83;
      uint64_t v38 = v88;
    }
    v58 = [v27 lastObject];
    [v58 setHasTrailingLineSeperator:1];

    if ([v27 count]) {
      [v8 addObjectsFromArray:v27];
    }
  }
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v60 = [v7 nominalAmount];
  if (v60)
  {
    v61 = (void *)v60;
    id v62 = [v7 amountModifiers];
    uint64_t v63 = [v62 count];

    if (v63)
    {
      uint64_t v64 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
      uint64_t v65 = PKLocalizedPaymentString(&cfstr_Subtotal_0.isa);
      v66 = [v7 nominalCurrencyAmount];
      v67 = [v66 formattedStringValue];
      v68 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)v64 initWithLabel:v65 value:v67];

      [(PKPaymentTransactionDetailAmountLineItemGeneric *)v68 setIsEmphasized:0];
      [v59 addObject:v68];
      v69 = [v7 amountModifiers];
      uint64_t v70 = [v69 count];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __132__PKPaymentTransactionDetailAmountLineItemGenerator__lineItemsForPurchaseTransaction_transactionSourceCollection_associatedReceipt___block_invoke_2;
      v91[3] = &unk_1E59E0300;
      uint64_t v93 = v70 - 1;
      id v71 = v59;
      id v92 = v71;
      [v69 enumerateObjectsUsingBlock:v91];
      if ([v71 count]) {
        [v8 addObjectsFromArray:v71];
      }
    }
  }
  v72 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalPaidLineItemForTransaction:v7 isUnqualified:1];
  [v8 addObject:v72];
  id v73 = [v7 rewards];

  if (v73)
  {
    id v74 = [v7 rewards];
    long long v75 = [v7 rewardsTotalCurrencyCode];
    if (v75)
    {
      long long v76 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _rewardsLineItemsForRewards:v74 currencyCode:v75];
    }
    else
    {
      uint64_t v77 = [v7 currencyCode];
      long long v78 = self;
      long long v79 = (void *)v77;
      long long v76 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)v78 _rewardsLineItemsForRewards:v74 currencyCode:v77];
    }
    long long v80 = [v76 lastObject];
    [v80 setHasTrailingLineSeperator:1];

    if ([v76 count]) {
      [v8 addObjectsFromArray:v76];
    }
    else {
      [v72 setHasTrailingLineSeperator:1];
    }
  }
  else
  {
    [v72 setHasTrailingLineSeperator:1];
  }
  long long v81 = (void *)[v8 copy];

  return v81;
}

PKPaymentTransactionDetailAmountLineItemReceipt *__132__PKPaymentTransactionDetailAmountLineItemGenerator__lineItemsForPurchaseTransaction_transactionSourceCollection_associatedReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKPaymentTransactionDetailAmountLineItemReceipt alloc] initWithReceiptLineItem:v2];

  return v3;
}

void __132__PKPaymentTransactionDetailAmountLineItemGenerator__lineItemsForPurchaseTransaction_transactionSourceCollection_associatedReceipt___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
  id v7 = [v5 modifierDescription];
  id v8 = [v5 amount];

  uint64_t v9 = [v8 amount];
  uint64_t v10 = [v9 formattedStringValue];
  uint64_t v11 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)v6 initWithLabel:v7 value:v10];

  if (*(void *)(a1 + 40) == a3) {
    [(PKPaymentTransactionDetailAmountLineItemGeneric *)v11 setHasTrailingLineSeperator:1];
  }
  [*(id *)(a1 + 32) addObject:v11];
}

- (id)_lineItemsForPeerPaymentTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 fees];
  uint64_t v10 = [v9 fees];
  uint64_t v11 = [v10 allObjects];

  uint64_t v12 = [v6 peerPaymentType];
  uint64_t v13 = [v11 count];
  uint64_t v14 = [v6 secondaryFundingSourceAmount];
  if (v14)
  {
    id v15 = (void *)v14;
    int v16 = [v6 secondaryFundingSourceCurrencyCode];

    if (v16)
    {
      char v17 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _primaryFundingSourceLineItemForTransaction:v6 transactionSourceCollection:v7];
      [v8 addObject:v17];
      uint64_t v18 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _secondaryFundingSourceLineItemForTransaction:v6];
      [v18 setHasTrailingLineSeperator:1];
      [v8 addObject:v18];
    }
  }
  switch(v12)
  {
    case 0:
      uint64_t v19 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _subtotalLineItemForTransaction:v6];
      goto LABEL_10;
    case 1:
      uint64_t v19 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalSentLineItemForTransaction:v6];
      goto LABEL_10;
    case 2:
      uint64_t v19 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalReceivedLineItemForTransaction:v6];
      goto LABEL_10;
    case 3:
      uint64_t v19 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalRequestedLineItemForTransaction:v6];
LABEL_10:
      double v20 = (void *)v19;
      if (v19) {
        [v8 addObject:v19];
      }
      break;
    default:
      double v20 = 0;
      break;
  }
  if (v13)
  {
    uint64_t v21 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _feeLineItemsForFees:v11];
    v22 = [v21 lastObject];
    [v22 setHasTrailingLineSeperator:1];

    [v8 addObjectsFromArray:v21];
    uint64_t v23 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)self _totalPaidLineItemForTransaction:v6 isUnqualified:0];
    [v23 setHasTrailingLineSeperator:1];
    [v8 addObject:v23];
  }
  else
  {
    [v20 setHasTrailingLineSeperator:1];
  }
  id v24 = (void *)[v8 copy];

  return v24;
}

- (id)_secondaryFundingSourceLineItemForTransaction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 secondaryFundingSourceAmount];
  uint64_t v5 = [v3 secondaryFundingSourceCurrencyCode];
  id v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:v5 exponent:0];
  }
  id v8 = [v3 secondaryFundingSourceFPANIdentifier];
  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v10 = [v9 passWithFPANIdentifier:v8];

    if (v10)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v10];
      uint64_t v12 = [PKPaymentTransactionDetailAmountLineItemFundingSource alloc];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v11];
      uint64_t v14 = [(PKPaymentTransactionDetailAmountLineItemFundingSource *)v12 initWithAmount:v7 transactionSourceCollection:v13];

      goto LABEL_13;
    }
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v16 = "Pass matching alternative funding source FPAN ID not found in library, falling back to pass description in transaction";
      char v17 = buf;
      goto LABEL_11;
    }
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = 0;
      int v16 = "Transaction alternative funding source does not contain an FPAN ID, falling back to pass description in transaction";
      char v17 = (uint8_t *)&v23;
LABEL_11:
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
    }
  }

  uint64_t v18 = [PKPaymentTransactionDetailAmountLineItemFundingSource alloc];
  uint64_t v19 = [v3 secondaryFundingSourceNetwork];
  double v20 = [v3 secondaryFundingSourceDPANSuffix];
  uint64_t v21 = [v3 secondaryFundingSourceDescription];
  uint64_t v14 = [(PKPaymentTransactionDetailAmountLineItemFundingSource *)v18 initWithAmount:v7 credentialType:v19 dpanSuffix:v20 cardDescription:v21];

LABEL_13:

  return v14;
}

- (id)_primaryFundingSourceLineItemForTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 primaryFundingSourceAmount];
  id v8 = [v6 primaryFundingSourceCurrencyCode];

  uint64_t v9 = 0;
  if (v7 && v8) {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v7 currency:v8 exponent:0];
  }
  uint64_t v10 = [[PKPaymentTransactionDetailAmountLineItemFundingSource alloc] initWithAmount:v9 transactionSourceCollection:v5];

  return v10;
}

- (id)_totalPaidLineItemForTransaction:(id)a3 isUnqualified:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 amount];
  id v7 = [v5 currencyCode];

  id v8 = 0;
  if (v6 && v7) {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v6 currency:v7 exponent:0];
  }
  if (v4) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v8 totalType:v9];

  return v10;
}

- (id)_totalTransferredItemForTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 subtotalAmount];
  uint64_t v5 = [v3 currencyCode];
  id v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:v5 exponent:0];
  }
  id v8 = [v3 secondaryFundingSourceFPANIdentifier];
  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v10 = [v9 passWithFPANIdentifier:v8];

    id v11 = objc_alloc(MEMORY[0x1E4F850C8]);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v10];
    uint64_t v13 = (void *)[v11 initWithTransactionSource:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [[PKPaymentTransactionDetailAmountLineItemTransferSource alloc] initWithAmount:v7 transactionSourceCollection:v13];

  return v14;
}

- (id)_totalSentLineItemForTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 subtotalAmount];
  uint64_t v5 = [v3 currencyCode];

  id v6 = 0;
  if (v4 && v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:v5 exponent:0];
  }
  id v7 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v6 totalType:1];

  return v7;
}

- (id)_totalReceivedLineItemForTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 amount];
  uint64_t v5 = [v3 currencyCode];
  id v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:v5 exponent:0];
  }
  if (([v3 transactionStatus] & 0xFFFFFFFFFFFFFFFELL) == 6) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v7 totalType:v8];

  return v9;
}

- (id)_totalRequestedLineItemForTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 amount];
  uint64_t v5 = [v3 currencyCode];

  id v6 = 0;
  if (v4 && v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:v5 exponent:0];
  }
  id v7 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v6 totalType:7];

  return v7;
}

- (id)_subtotalLineItemForTransaction:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 subtotalAmount];
  uint64_t v5 = [v3 currencyCode];

  id v6 = 0;
  if (v4 && v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:v5 exponent:0];
  }
  id v7 = [[PKPaymentTransactionDetailAmountLineItemTotal alloc] initWithAmount:v6 totalType:4];

  return v7;
}

- (id)_feeLineItemsForFees:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [PKPaymentTransactionDetailAmountLineItemFee alloc];
        uint64_t v12 = -[PKPaymentTransactionDetailAmountLineItemFee initWithFeeItem:](v11, "initWithFeeItem:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v4 sortedArrayUsingComparator:&__block_literal_global_367_0];

  return v13;
}

uint64_t __74__PKPaymentTransactionDetailAmountLineItemGenerator__feeLineItemsForFees___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 label];
  uint64_t v6 = [v4 label];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)_rewardsLineItemsForRewards:(id)a3 currencyCode:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v47 = (NSString *)a4;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = [v5 totalEligibleValueForUnit:1];
  uint64_t v44 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v45 = [v5 promotionalRewardsItems];
  unsigned int v41 = objc_msgSend(v45, "pk_hasObjectPassingTest:", &__block_literal_global_370);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v42 = v5;
  uint64_t v6 = [v5 rewardsItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v13 = [v12 state];
        if (v13 != 3)
        {
          uint64_t v14 = v13;
          if ([v12 eligibleValueUnit] == 1)
          {
            long long v15 = [v12 currencyAmount];

            if (v15)
            {
              long long v16 = [v12 currencyAmount];
              long long v17 = [v16 amount];
              uint64_t v18 = [(NSDecimalNumber *)v44 decimalNumberByAdding:v17];

              uint64_t v44 = (NSDecimalNumber *)v18;
            }
          }
          v9 |= v14 == 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  uint64_t v19 = [MEMORY[0x1E4F28C28] zero];
  char v20 = [v43 isEqualToNumber:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28C28] zero];
    char v22 = [(NSDecimalNumber *)v44 isEqualToNumber:v21];

    __int16 v23 = 0;
    if (v47 && (v22 & 1) == 0)
    {
      __int16 v23 = PKCurrencyAmountCreate(v44, v47);
    }
    id v24 = [[PKPaymentTransactionDetailAmountLineItemRewards alloc] initWithRewardsValueUnit:1 eligibleValue:v43 isEligible:v9 & 1 totalAmount:v23 hasPromotionalReward:v41 promotionName:0];
    [v46 addObject:v24];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v25 = [v42 rewardsItems];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        if ([v30 eligibleValueUnit] == 2)
        {
          uint64_t v31 = [v30 state];
          v32 = [v30 eligibleValue];
          uint64_t v33 = PKCurrencyAmountCreate(v32, v47);

          v34 = [PKPaymentTransactionDetailAmountLineItemRewards alloc];
          v35 = [v30 eligibleValue];
          uint64_t v36 = [v45 containsObject:v30];
          id v37 = [v30 promotionName];
          uint64_t v38 = [(PKPaymentTransactionDetailAmountLineItemRewards *)v34 initWithRewardsValueUnit:2 eligibleValue:v35 isEligible:v31 == 1 totalAmount:v33 hasPromotionalReward:v36 promotionName:v37];
          [v46 addObject:v38];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v27);
  }

  id v39 = (void *)[v46 copy];

  return v39;
}

BOOL __94__PKPaymentTransactionDetailAmountLineItemGenerator__rewardsLineItemsForRewards_currencyCode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 eligibleValueUnit] == 1;
}

- (id)_foreignExchangeLineItemsForExchangeInfo:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [[PKPaymentTransactionDetailAmountLineItemForeignExchange alloc] initWithForeignExchangeInformation:v3 type:0];
  id v5 = [[PKPaymentTransactionDetailAmountLineItemForeignExchange alloc] initWithForeignExchangeInformation:v3 type:1];

  v8[0] = v4;
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

@end