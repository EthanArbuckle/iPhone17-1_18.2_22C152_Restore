@interface PKPaymentSummaryItemsViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
+ (void)presentView:(id)a3 withDataItem:(id)a4 forPaymentRequest:(id)a5;
@end

@implementation PKPaymentSummaryItemsViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [a3 summaryItemsView];
  [a1 presentView:v12 withDataItem:v11 forPaymentRequest:v10];
}

+ (void)presentView:(id)a3 withDataItem:(id)a4 forPaymentRequest:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  id v11 = v8;
  id v12 = [v11 paymentSummaryItems];
  v13 = [v12 lastObject];
  uint64_t v50 = [v13 type];

  int v14 = [v9 isPeerPaymentRequest];
  uint64_t v15 = [v9 _isAMPPayment];
  v51 = v9;
  uint64_t v53 = [v9 requestType];
  if (v53 == 5) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  int v54 = v14;
  char v49 = v16;
  BOOL v17 = (v14 | v16) == 0;
  uint64_t v18 = 2;
  if (!v17) {
    uint64_t v18 = 0;
  }
  uint64_t v48 = v18;
  v55 = v10;
  [v10 setShowsBoldValueText:v15];
  v19 = [v11 paymentSummaryItems];
  v45 = v11;
  v20 = [v11 paymentSummaryItems];
  v21 = objc_msgSend(v19, "subarrayWithRange:", 0, objc_msgSend(v20, "count") - 1);

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v21;
  uint64_t v52 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v52)
  {
    uint64_t v47 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if (!v15
          || ([*(id *)(*((void *)&v56 + 1) + 8 * i) localizedAmount],
              (v24 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          if ([v23 type]) {
            int v25 = v54;
          }
          else {
            int v25 = 1;
          }
          if (v25 == 1)
          {
            v26 = [v23 amount];
            v27 = [v45 currencyCode];
            v24 = PKFormattedCurrencyStringFromNumber();
          }
          else if (v53 == 5 {
                 && ([v23 amount],
          }
                     v28 = objc_claimAutoreleasedReturnValue(),
                     [MEMORY[0x1E4F28C28] zero],
                     v29 = objc_claimAutoreleasedReturnValue(),
                     char v30 = [v28 isEqualToNumber:v29],
                     v29,
                     v28,
                     (v30 & 1) != 0))
          {
            v24 = 0;
          }
          else
          {
            v24 = PKLocalizedPaymentString(&cfstr_InAppPaymentPe_0.isa);
          }
        }
        if (v54) {
          BOOL v31 = [v23 type] == 1;
        }
        else {
          BOOL v31 = 0;
        }
        v32 = [v23 label];
        v33 = v32;
        if ((v49 & 1) == 0)
        {
          uint64_t v34 = objc_msgSend(v32, "pk_uppercaseStringForPreferredLocale");

          v33 = (void *)v34;
        }
        v35 = [v51 localizedSummaryItemsTitle];
        if (v35) {
          int v36 = v15;
        }
        else {
          int v36 = 0;
        }
        if (v36 == 1)
        {
          [v55 setTitle:v35];
        }
        else if (v53 == 5)
        {
          v37 = PKLocalizedBeekmanString(&cfstr_InstallmentPri.isa);
          v38 = objc_msgSend(v37, "pk_uppercaseStringForPreferredLocale");
          [v55 setTitle:v38];
        }
        if (v15)
        {
          v39 = [v23 localizedTitle];
          char v40 = [v23 useDarkColor];
          if (v53 == 5) {
            BOOL v41 = 1;
          }
          else {
            BOOL v41 = v40;
          }
          char v42 = [v23 useLargeFont];
        }
        else
        {
          v39 = 0;
          char v42 = 0;
          BOOL v41 = v53 == 5;
        }
        if (v50 == 1) {
          uint64_t v43 = 1;
        }
        else {
          uint64_t v43 = [v23 type];
        }
        BYTE2(v44) = v42;
        BYTE1(v44) = v41;
        LOBYTE(v44) = v31;
        objc_msgSend(v55, "addLabel:value:title:itemType:maxLabelLines:maxValueLines:hasBottomPadding:useDarkColor:useLargeFont:", v33, v24, v39, v43, v48, v15 ^ 1, v44);
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v52);
  }
}

@end