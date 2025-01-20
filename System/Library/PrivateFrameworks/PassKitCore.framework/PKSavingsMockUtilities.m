@interface PKSavingsMockUtilities
+ (id)date1;
+ (id)date2;
+ (id)date3;
+ (id)date4;
+ (id)date5;
+ (id)date6;
+ (id)date7;
+ (id)date8;
+ (id)savingsAccountDetailsDictionary;
+ (id)savingsAccountDetailsDictionary2;
+ (id)savingsAccountDictionary;
+ (id)savingsAccountDictionary2;
+ (id)savingsAccountDictionaryUpdated;
+ (id)savingsAccountFCCStepUpDetailsDictionary;
+ (id)savingsAccountStatementsArray;
+ (id)savingsAccountStatementsArray2;
+ (id)savingsAccountSummaryDictionary;
+ (id)savingsAccountSummaryDictionary2;
+ (id)savingsAccountTaxFormsArray;
+ (id)savingsAccountTaxFormsArray2;
+ (id)savingsStatementDictionary;
+ (id)savingsStatementDictionary2;
+ (id)supportedSavingsAccountFeaturesArray;
+ (id)supportedSavingsAccountFeaturesArray2;
+ (id)transfer;
@end

@implementation PKSavingsMockUtilities

+ (id)savingsAccountDictionary
{
  v7[8] = *MEMORY[0x1E4F143B8];
  v6[0] = @"accountIdentifier";
  v6[1] = @"featureIdentifier";
  v7[0] = @"1111111111";
  v7[1] = @"savings";
  v7[2] = @"savings";
  v6[2] = @"accountType";
  v6[3] = @"accountDetails";
  v2 = [(id)objc_opt_class() savingsAccountDetailsDictionary];
  v7[3] = v2;
  v7[4] = @"active";
  v6[4] = @"state";
  v6[5] = @"accessLevel";
  v7[5] = @"primary";
  v6[6] = @"supportedFeatures";
  v3 = +[PKSavingsMockUtilities supportedSavingsAccountFeaturesArray];
  v6[7] = @"accountBaseURL";
  v7[6] = v3;
  v7[7] = @"https://localhost:3000/firebrand";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

+ (id)savingsAccountDictionaryUpdated
{
  v2 = [(id)objc_opt_class() savingsAccountSummaryDictionary];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"47" forKeyedSubscript:@"currentBalance"];
  [v3 setObject:@"1000" forKeyedSubscript:@"pendingBalance"];
  v4 = [(id)objc_opt_class() savingsAccountDetailsDictionary];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:v3 forKeyedSubscript:@"accountSummary"];
  v6 = [(id)objc_opt_class() savingsAccountDictionary];
  v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v5 forKeyedSubscript:@"accountDetails"];
  v8 = (void *)[v7 copy];

  return v8;
}

+ (id)savingsAccountDictionary2
{
  void v7[9] = *MEMORY[0x1E4F143B8];
  v6[0] = @"accountIdentifier";
  v6[1] = @"featureIdentifier";
  v7[0] = @"2222222222";
  v7[1] = @"savings";
  v7[2] = @"savings";
  v6[2] = @"accountType";
  v6[3] = @"accountDetails";
  v2 = [(id)objc_opt_class() savingsAccountDetailsDictionary2];
  v7[3] = v2;
  v7[4] = @"restricted";
  v6[4] = @"state";
  v6[5] = @"blockNotifications";
  v7[5] = MEMORY[0x1E4F1CC38];
  v7[6] = @"primary";
  v6[6] = @"accessLevel";
  v6[7] = @"supportedFeatures";
  v3 = [(id)objc_opt_class() supportedSavingsAccountFeaturesArray2];
  void v6[8] = @"accountBaseURL";
  v7[7] = v3;
  v7[8] = @"https://localhost:3000/firebrand";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:9];

  return v4;
}

+ (id)savingsAccountDetailsDictionary
{
  v8[17] = *MEMORY[0x1E4F143B8];
  v7[0] = @"lastUpdatedDate";
  v2 = [(id)objc_opt_class() date1];
  v8[0] = v2;
  v7[1] = @"createdDate";
  v3 = [(id)objc_opt_class() date2];
  v8[1] = v3;
  v8[2] = @"US";
  v7[2] = @"countryCode";
  v7[3] = @"currencyCode";
  v8[3] = @"USD";
  v8[4] = @"America/New_York";
  v7[4] = @"productTimeZone";
  v7[5] = @"moreInfoRequired";
  v8[5] = MEMORY[0x1E4F1CC38];
  v8[6] = MEMORY[0x1E4F1CC38];
  v7[6] = @"termsAcceptanceRequired";
  v7[7] = @"termsIdentifier";
  v8[7] = @"someTermsIdentifier";
  v8[8] = @"http://someurl.com/coolURL";
  v7[8] = @"termsURL";
  void v7[9] = @"privacyPolicyURL";
  v8[9] = @"www.apple.com/privacy";
  v8[10] = @"bd404f8a-d4db-4bee-a134-1ea61e2241b3";
  void v7[10] = @"businessChatIdentifier";
  v7[11] = @"contactWebsite";
  v8[11] = @"www.apple.com/";
  v8[12] = @"1-877-255-5923";
  v7[12] = @"contactNumber";
  v7[13] = @"routingNumber";
  v8[13] = @"121202211";
  v8[14] = @"927392017351";
  v7[14] = @"accountNumber";
  v7[15] = @"fccStepUpRequired";
  v8[15] = MEMORY[0x1E4F1CC28];
  v7[16] = @"accountSummary";
  v4 = [(id)objc_opt_class() savingsAccountSummaryDictionary];
  v8[16] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:17];

  return v5;
}

+ (id)savingsAccountDetailsDictionary2
{
  v9[18] = *MEMORY[0x1E4F143B8];
  v8[0] = @"lastUpdatedDate";
  v2 = [(id)objc_opt_class() date1];
  v9[0] = v2;
  v8[1] = @"createdDate";
  v3 = [(id)objc_opt_class() date2];
  v9[1] = v3;
  v9[2] = @"JP";
  v8[2] = @"countryCode";
  v8[3] = @"currencyCode";
  v9[3] = @"JPY";
  v9[4] = @"America/New_York";
  v8[4] = @"productTimeZone";
  v8[5] = @"moreInfoRequired";
  v9[5] = MEMORY[0x1E4F1CC28];
  v9[6] = MEMORY[0x1E4F1CC28];
  v8[6] = @"termsAcceptanceRequired";
  v8[7] = @"termsIdentifier";
  v9[7] = @"termsID";
  v9[8] = @"http://someurl.com/coolURL2";
  v8[8] = @"termsURL";
  v8[9] = @"privacyPolicyURL";
  v9[9] = @"www.apple.com/privacy1";
  v9[10] = @"bd404f8a-d4db-4bee-a134-1ea61e2241c3";
  v8[10] = @"businessChatIdentifier";
  v8[11] = @"contactWebsite";
  v9[11] = @"www.apple.com/contact";
  v9[12] = @"1-877-255-5923";
  v8[12] = @"contactNumber";
  v8[13] = @"routingNumber";
  v9[13] = @"121202211";
  v9[14] = @"927392017351";
  v8[14] = @"accountNumber";
  v8[15] = @"fccStepUpRequired";
  v9[15] = MEMORY[0x1E4F1CC38];
  v8[16] = @"fccStepUpDetails";
  v4 = [(id)objc_opt_class() savingsAccountFCCStepUpDetailsDictionary];
  v9[16] = v4;
  v8[17] = @"accountSummary";
  v5 = [(id)objc_opt_class() savingsAccountSummaryDictionary2];
  v9[17] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:18];

  return v6;
}

+ (id)savingsAccountSummaryDictionary
{
  return &unk_1EE22E180;
}

+ (id)savingsAccountSummaryDictionary2
{
  return &unk_1EE22E1A8;
}

+ (id)savingsAccountFCCStepUpDetailsDictionary
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"thresholdExceeded";
  v5[1] = @"neededBy";
  v6[0] = &unk_1EE22C650;
  v2 = [(id)objc_opt_class() date2];
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)savingsAccountStatementsArray
{
  v34[6] = *MEMORY[0x1E4F143B8];
  v32[0] = @"identifier";
  v32[1] = @"currencyCode";
  v33[0] = @"84019385-0249851-02984";
  v33[1] = @"USD";
  v32[2] = @"openingDate";
  v21 = [(id)objc_opt_class() date1];
  v33[2] = v21;
  v32[3] = @"closingDate";
  v20 = [(id)objc_opt_class() date2];
  v33[3] = v20;
  v33[4] = @"95";
  v32[4] = @"openingBalance";
  v32[5] = @"closingBalance";
  v33[5] = @"100";
  v33[6] = @"12.3";
  v32[6] = @"interestEarned";
  v32[7] = @"totalDeposits";
  v33[7] = @"12.3";
  v33[8] = @"12.3";
  v32[8] = @"totalDailyCashDeposits";
  v32[9] = @"totalWithdrawn";
  v33[9] = @"5.6";
  v33[10] = @"1.05";
  v32[10] = @"apy";
  v32[11] = @"statementPeriodDays";
  v33[11] = &unk_1EE22C668;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
  v34[0] = v19;
  v30[0] = @"identifier";
  v30[1] = @"currencyCode";
  v31[0] = @"84019385-0249851-02985";
  v31[1] = @"USD";
  v30[2] = @"openingDate";
  v18 = [(id)objc_opt_class() date2];
  v31[2] = v18;
  v30[3] = @"closingDate";
  v17 = [(id)objc_opt_class() date3];
  v31[3] = v17;
  v31[4] = @"100";
  v30[4] = @"openingBalance";
  v30[5] = @"closingBalance";
  v31[5] = @"200";
  v31[6] = @"12.3";
  v30[6] = @"interestEarned";
  v30[7] = @"totalDeposits";
  v31[7] = @"100";
  v31[8] = @"76.3";
  v30[8] = @"totalDailyCashDeposits";
  v30[9] = @"totalWithdrawn";
  v31[9] = @"12.3";
  v31[10] = @"1.05";
  v30[10] = @"apy";
  v30[11] = @"statementPeriodDays";
  v31[11] = &unk_1EE22C680;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:12];
  v34[1] = v16;
  v28[0] = @"identifier";
  v28[1] = @"currencyCode";
  v29[0] = @"84019385-0249851-02986";
  v29[1] = @"USD";
  v28[2] = @"openingDate";
  v15 = [(id)objc_opt_class() date3];
  v29[2] = v15;
  v28[3] = @"closingDate";
  v14 = [(id)objc_opt_class() date4];
  v29[3] = v14;
  v29[4] = @"200";
  v28[4] = @"openingBalance";
  v28[5] = @"closingBalance";
  v29[5] = @"500";
  v29[6] = @"12.3";
  v28[6] = @"interestEarned";
  v28[7] = @"totalDeposits";
  v29[7] = @"300";
  v29[8] = @"46.2";
  v28[8] = @"totalDailyCashDeposits";
  v28[9] = @"totalWithdrawn";
  v29[9] = @"12.3";
  v29[10] = @"1.05";
  v28[10] = @"apy";
  v28[11] = @"statementPeriodDays";
  v29[11] = &unk_1EE22C668;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:12];
  v34[2] = v13;
  v26[0] = @"identifier";
  v26[1] = @"currencyCode";
  v27[0] = @"84019385-0249851-02987";
  v27[1] = @"USD";
  v26[2] = @"openingDate";
  v12 = [(id)objc_opt_class() date4];
  v27[2] = v12;
  v26[3] = @"closingDate";
  v11 = [(id)objc_opt_class() date5];
  v27[3] = v11;
  v27[4] = @"500";
  v26[4] = @"openingBalance";
  v26[5] = @"closingBalance";
  v27[5] = @"600";
  v27[6] = @"12.3";
  v26[6] = @"interestEarned";
  v26[7] = @"totalDeposits";
  v27[7] = @"100";
  v27[8] = @"20.2";
  v26[8] = @"totalDailyCashDeposits";
  v26[9] = @"totalWithdrawn";
  v27[9] = @"12.3";
  v27[10] = @"1.05";
  v26[10] = @"apy";
  v26[11] = @"statementPeriodDays";
  v27[11] = &unk_1EE22C680;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:12];
  v34[3] = v10;
  v24[0] = @"identifier";
  v24[1] = @"currencyCode";
  v25[0] = @"84019385-0249851-02988";
  v25[1] = @"USD";
  v24[2] = @"openingDate";
  v2 = [(id)objc_opt_class() date6];
  v25[2] = v2;
  v24[3] = @"closingDate";
  v3 = [(id)objc_opt_class() date7];
  v25[3] = v3;
  v25[4] = @"600";
  v24[4] = @"openingBalance";
  v24[5] = @"closingBalance";
  v25[5] = @"600";
  v25[6] = @"12.3";
  v24[6] = @"interestEarned";
  v24[7] = @"totalDeposits";
  v25[7] = @"100";
  v25[8] = @"20.2";
  v24[8] = @"totalDailyCashDeposits";
  v24[9] = @"totalWithdrawn";
  v25[9] = @"12.3";
  v25[10] = @"1.05";
  v24[10] = @"apy";
  v24[11] = @"statementPeriodDays";
  v25[11] = &unk_1EE22C668;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:12];
  v34[4] = v4;
  v22[0] = @"identifier";
  v22[1] = @"currencyCode";
  v23[0] = @"84019385-0249851-02989";
  v23[1] = @"USD";
  v22[2] = @"openingDate";
  v5 = [(id)objc_opt_class() date7];
  v23[2] = v5;
  v22[3] = @"closingDate";
  v6 = [(id)objc_opt_class() date8];
  v23[3] = v6;
  v23[4] = @"600";
  v22[4] = @"openingBalance";
  v22[5] = @"closingBalance";
  v23[5] = @"600";
  v23[6] = @"12.3";
  v22[6] = @"interestEarned";
  v22[7] = @"totalDeposits";
  v23[7] = @"100";
  v23[8] = @"20.2";
  v22[8] = @"totalDailyCashDeposits";
  v22[9] = @"totalWithdrawn";
  v23[9] = @"12.3";
  v23[10] = @"1.05";
  v22[10] = @"apy";
  v22[11] = @"statementPeriodDays";
  v23[11] = &unk_1EE22C680;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:12];
  v34[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];

  return v8;
}

+ (id)savingsAccountStatementsArray2
{
  v27[11] = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = -6;
  float v3 = 0.0;
  float v4 = 1000.0;
  unint64_t v5 = 7;
  do
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v6 setMonth:v2];
    v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v25 = v6;
    v9 = [v7 dateByAddingComponents:v6 toDate:v8 options:0];

    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v27[0] = @"USD";
    v26[0] = @"currencyCode";
    v26[1] = @"openingDate";
    v23 = PKStartOfMonth(v9);
    v22 = PKISO8601DateStringFromDate(v23);
    v27[1] = v22;
    v26[2] = @"closingDate";
    v24 = v9;
    v11 = PKEndOfMonth(v9);
    v12 = PKISO8601DateStringFromDate(v11);
    v27[2] = v12;
    v26[3] = @"openingBalance";
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"%0.3f", v3);
    v27[3] = v13;
    v26[4] = @"closingBalance";
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%0.3f", v4);
    v27[4] = v14;
    v26[5] = @"interestEarned";
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%0.3f", (float)(v4 + (float)(v4 / -1.012)));
    v27[5] = v15;
    v27[6] = @"5.5";
    v26[6] = @"totalDeposits";
    v26[7] = @"totalDailyCashDeposits";
    v27[7] = @"14.5";
    v27[8] = @"20.0";
    v26[8] = @"totalWithdrawn";
    v26[9] = @"apy";
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%0.3f", 0x3FF3333340000000);
    v26[10] = @"statementPeriodDays";
    v27[9] = v16;
    v27[10] = &unk_1EE22C668;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:11];
    v18 = (void *)[v10 initWithDictionary:v17];

    if (v5 != 2)
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v5 - 1);
      [v18 setObject:v19 forKey:@"identifier"];
    }
    [v21 addObject:v18];

    --v5;
    ++v2;
    float v3 = v4;
    float v4 = v4 * 1.012;
  }
  while (v5 > 1);
  return v21;
}

+ (id)savingsAccountTaxFormsArray
{
  return &unk_1EE22B360;
}

+ (id)savingsAccountTaxFormsArray2
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = -3;
  for (unint64_t i = 4; i > 1; --i)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v4 setYear:v2];
    unint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = [v5 dateByAddingComponents:v4 toDate:v6 options:0];

    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v19[0] = @"1099-int";
    v18[0] = @"taxFormType";
    v18[1] = @"openingDate";
    v9 = PKStartOfYear(v7);
    id v10 = PKISO8601DateStringFromDate(v9);
    v19[1] = v10;
    v18[2] = @"closingDate";
    v11 = PKEndOfYear(v7);
    v12 = PKISO8601DateStringFromDate(v11);
    v19[2] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    v14 = (void *)[v8 initWithDictionary:v13];

    if (i != 2)
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%i", i - 1);
      [v14 setObject:v15 forKey:@"identifier"];
    }
    [v17 addObject:v14];

    ++v2;
  }
  return v17;
}

+ (id)supportedSavingsAccountFeaturesArray
{
  return &unk_1EE22B3F0;
}

+ (id)supportedSavingsAccountFeaturesArray2
{
  return &unk_1EE22B438;
}

+ (id)savingsStatementDictionary
{
  v7[12] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"currencyCode";
  v7[0] = @"84019385-0249851-02984";
  v7[1] = @"USD";
  v6[2] = @"openingDate";
  uint64_t v2 = [(id)objc_opt_class() date2];
  v7[2] = v2;
  void v6[3] = @"closingDate";
  float v3 = [(id)objc_opt_class() date3];
  v7[3] = v3;
  v7[4] = @"101";
  v6[4] = @"openingBalance";
  v6[5] = @"closingBalance";
  v7[5] = @"123";
  v7[6] = @"12.3";
  v6[6] = @"interestEarned";
  v6[7] = @"totalDeposits";
  v7[7] = @"8.5";
  v7[8] = @"1.3";
  void v6[8] = @"totalDailyCashDeposits";
  void v6[9] = @"totalWithdrawn";
  void v7[9] = @"2.8";
  void v7[10] = @"2.05";
  v6[10] = @"apy";
  v6[11] = @"statementPeriodDays";
  v7[11] = &unk_1EE22C680;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:12];

  return v4;
}

+ (id)savingsStatementDictionary2
{
  v7[11] = *MEMORY[0x1E4F143B8];
  v7[0] = @"EUR";
  v6[0] = @"currencyCode";
  v6[1] = @"openingDate";
  uint64_t v2 = [(id)objc_opt_class() date1];
  v7[1] = v2;
  v6[2] = @"closingDate";
  float v3 = [(id)objc_opt_class() date2];
  v7[2] = v3;
  v7[3] = @"123";
  void v6[3] = @"openingBalance";
  v6[4] = @"closingBalance";
  v7[4] = @"456";
  v7[5] = @"2.3";
  v6[5] = @"interestEarned";
  v6[6] = @"totalDeposits";
  v7[6] = @"10.5";
  v7[7] = @"5.0";
  v6[7] = @"totalDailyCashDeposits";
  void v6[8] = @"totalWithdrawn";
  v7[8] = @"9.9";
  void v7[9] = @"2.5";
  void v6[9] = @"apy";
  v6[10] = @"statementPeriodDays";
  void v7[10] = &unk_1EE22C668;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:11];

  return v4;
}

+ (id)transfer
{
  uint64_t v2 = objc_alloc_init(PKAccountTransfer);
  float v3 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:arc4random_uniform(0x186A0u) exponent:4294967294 isNegative:0];
  id v4 = PKCurrencyAmountCreate(v3, &cfstr_Usd.isa, 0);
  [(PKAccountTransfer *)v2 setCurrencyAmount:v4];

  [(PKAccountTransfer *)v2 setType:2];
  [(PKAccountTransfer *)v2 setState:1];
  unint64_t v5 = [(PKAccountPaymentFundingSource *)[PKAccountTransferExternalAccount alloc] initWithType:1];
  id v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  [(PKAccountPaymentFundingSource *)v5 setIdentifier:v7];

  [(PKAccountPaymentFundingSource *)v5 setAccountSuffix:@"7890"];
  id v8 = objc_alloc_init(PKAccountPaymentFundingDetailsBankAccount);
  [(PKAccountPaymentFundingDetailsBankAccount *)v8 setName:@"Bank of Cupertino"];
  [(PKAccountPaymentFundingSource *)v5 setFundingDetails:v8];
  v9 = objc_alloc_init(PKAccountTransferScheduleDetails);
  [(PKAccountTransferScheduleDetails *)v9 setFrequency:2];
  [(PKAccountTransfer *)v2 setScheduleDetails:v9];
  [(PKAccountTransfer *)v2 setExternalAccount:v5];
  id v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];
  [(PKAccountTransfer *)v2 setIdentifier:v11];

  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 UUIDString];
  [(PKAccountTransfer *)v2 setReferenceIdentifier:v13];

  v14 = [MEMORY[0x1E4F29128] UUID];
  v15 = [v14 UUIDString];
  [(PKAccountTransfer *)v2 setClientReferenceIdentifier:v15];

  v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:604800.0];
  [(PKAccountTransfer *)v2 setTransferDate:v16];

  id v17 = [MEMORY[0x1E4F1C9C8] date];
  [(PKAccountTransfer *)v2 setTransferStatusDate:v17];

  [(PKAccountTransfer *)v2 setCancellable:1];
  return v2;
}

+ (id)date1
{
  return @"2018-07-01T00:00:00+00:00";
}

+ (id)date2
{
  return @"2018-08-01T00:00:00+00:00";
}

+ (id)date3
{
  return @"2018-09-01T00:00:00+00:00";
}

+ (id)date4
{
  return @"2018-10-01T00:00:00+00:00";
}

+ (id)date5
{
  return @"2018-11-01T00:00:00+00:00";
}

+ (id)date6
{
  return @"2017-01-01T00:00:00+00:00";
}

+ (id)date7
{
  return @"2017-02-01T00:00:00+00:00";
}

+ (id)date8
{
  return @"2017-03-01T00:00:00+00:00";
}

@end