@interface MKWalletRAPReport(InitWithTransaction)
- (void)initForMerchantIssue:()InitWithTransaction transaction:account:comments:;
@end

@implementation MKWalletRAPReport(InitWithTransaction)

- (void)initForMerchantIssue:()InitWithTransaction transaction:account:comments:
{
  id v8 = a4;
  id v9 = a5;
  id v51 = a6;
  v10 = [v8 issueReportIdentifier];
  if (![v10 length])
  {
    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];

    v10 = (void *)v12;
  }
  v52 = v9;
  v13 = [v8 merchant];
  v14 = [v13 mapsMerchant];
  uint64_t v15 = [v13 mapsBrand];
  v16 = [v14 postalAddress];
  v50 = v10;
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F1BA88];
    v18 = [v14 postalAddress];
    uint64_t v19 = [v17 stringFromPostalAddress:v18 style:0];
  }
  else
  {
    uint64_t v19 = 0;
  }

  v20 = [v8 location];
  [v20 coordinate];
  double v22 = v21;
  double v24 = v23;

  uint64_t v44 = [v13 industryCode];
  v48 = (void *)v15;
  v49 = v14;
  if ([v14 identifier]) {
    v25 = v14;
  }
  else {
    v25 = (void *)v15;
  }
  uint64_t v43 = [v25 identifier];
  v26 = [v13 name];
  v27 = [v13 rawName];
  v28 = [v13 industryCategory];
  v29 = [v13 originURL];
  v30 = [v29 absoluteString];
  v47 = (void *)v19;
  if (v19) {
    v31 = (__CFString *)v19;
  }
  else {
    v31 = &stru_1EF1B5B50;
  }
  [v8 transactionDate];
  v33 = v32 = v8;
  [v33 timeIntervalSinceReferenceDate];
  double v35 = v34;
  [v8 transactionType];
  v36 = PKPaymentTransactionTypeToString();
  v37 = objc_msgSend(a1, "initForMerchantIssue:merchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:", a3, v44, v43, v26, v27, v28, v35, v22, v24, v30, v31, v36);

  if (v37)
  {
    objc_msgSend(v37, "setIsAppleCard:", objc_msgSend(v52, "feature") == 2);
    uint64_t v38 = [v32 transactionSource];
    [v32 transactionType];
    if ((unint64_t)(v38 - 1) > 7) {
      uint64_t v39 = 0;
    }
    else {
      uint64_t v39 = qword_1A0443F48[v38 - 1];
    }
    [v37 setLookupTransactionType:v39];
    if ([v32 hasEffectiveTransactionSource])
    {
      v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "adamIdentifier"));
      v41 = [v40 stringValue];
      [v37 setMerchantAdamId:v41];
    }
    [v37 setCorrelationId:v50];
    [v37 setReportersComment:v51];
  }

  return v37;
}

@end