@interface PKPayLaterMockUtilities
+ (id)_assessmentCollection2Array;
+ (id)_assessmentCollectionArray;
+ (id)_bnplFinancingOptionsDictionaryWithRelevantDates:(BOOL)a3;
+ (id)_bnplFinancingPlan1WithRelevantDates:(BOOL)a3;
+ (id)_bnplPreliminaryAssessmentDictionary;
+ (id)_bnplProductAssessmentDictionary;
+ (id)_bnplProductAssessmentDictionary2;
+ (id)_dateFormatter;
+ (id)_loanFinancingOptionDictionaryWithRelevantDates:(BOOL)a3;
+ (id)_loanPreliminaryAssessmentDictionary;
+ (id)_loanPreliminaryAssessmentDictionary2;
+ (id)_loanProductAssessmentDictionary;
+ (id)_loanProductAssessmentDictionary2;
+ (id)assessmentCollection;
+ (id)assessmentCollection2;
+ (id)bnplFinancingOption;
+ (id)bnplFinancingOptionWithRelativeDates;
+ (id)bnplFinancingPlan;
+ (id)bnplFinancingPlanDictionary;
+ (id)bnplFinancingPlanWithRelativeDates;
+ (id)bnplPreliminaryAssessment;
@end

@implementation PKPayLaterMockUtilities

+ (id)assessmentCollection
{
  v3 = [PKPayLaterProductAssessmentCollection alloc];
  v4 = [a1 _assessmentCollectionArray];
  v5 = [(PKPayLaterProductAssessmentCollection *)v3 initWithArray:v4];

  return v5;
}

+ (id)bnplFinancingOption
{
  v3 = [PKPayLaterFinancingOption alloc];
  v4 = [a1 _bnplFinancingOptionsDictionaryWithRelevantDates:0];
  v5 = [(PKPayLaterFinancingOption *)v3 initWithDictionary:v4 productType:1];

  return v5;
}

+ (id)bnplFinancingOptionWithRelativeDates
{
  v3 = [PKPayLaterFinancingOption alloc];
  v4 = [a1 _bnplFinancingOptionsDictionaryWithRelevantDates:1];
  v5 = [(PKPayLaterFinancingOption *)v3 initWithDictionary:v4 productType:1];

  return v5;
}

+ (id)bnplPreliminaryAssessment
{
  v3 = [PKPayLaterPreliminaryAssessment alloc];
  v4 = [a1 _bnplPreliminaryAssessmentDictionary];
  v5 = [(PKPayLaterPreliminaryAssessment *)v3 initWithDictionary:v4 productType:1];

  return v5;
}

+ (id)assessmentCollection2
{
  v3 = [PKPayLaterProductAssessmentCollection alloc];
  v4 = [a1 _assessmentCollection2Array];
  v5 = [(PKPayLaterProductAssessmentCollection *)v3 initWithArray:v4];

  return v5;
}

+ (id)bnplFinancingPlan
{
  v3 = [PKPayLaterFinancingPlan alloc];
  v4 = [a1 _bnplFinancingPlan1WithRelevantDates:0];
  v5 = [(PKPayLaterFinancingPlan *)v3 initWithDictionary:v4];

  return v5;
}

+ (id)bnplFinancingPlanWithRelativeDates
{
  v3 = [PKPayLaterFinancingPlan alloc];
  v4 = [a1 _bnplFinancingPlan1WithRelevantDates:1];
  v5 = [(PKPayLaterFinancingPlan *)v3 initWithDictionary:v4];

  return v5;
}

+ (id)bnplFinancingPlanDictionary
{
  return (id)[a1 _bnplFinancingPlan1WithRelevantDates:1];
}

+ (id)_assessmentCollectionArray
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 _loanProductAssessmentDictionary];
  v7[0] = v3;
  v4 = [a1 _bnplProductAssessmentDictionary];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)_assessmentCollection2Array
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 _loanProductAssessmentDictionary2];
  v7[0] = v3;
  v4 = [a1 _bnplProductAssessmentDictionary2];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)_loanProductAssessmentDictionary
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"productType";
  v5[1] = @"financingEligibility";
  v6[0] = @"loan";
  v6[1] = @"eligible";
  v6[2] = MEMORY[0x1E4F1CBF0];
  v5[2] = @"financingOptions";
  v5[3] = @"preliminaryAssessment";
  v2 = [a1 _loanPreliminaryAssessmentDictionary];
  v6[3] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];

  return v3;
}

+ (id)_loanProductAssessmentDictionary2
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"productType";
  v5[1] = @"financingEligibility";
  v6[0] = @"loan";
  v6[1] = @"eligible";
  v6[2] = MEMORY[0x1E4F1CBF0];
  v5[2] = @"financingOptions";
  v5[3] = @"preliminaryAssessment";
  v2 = [a1 _loanPreliminaryAssessmentDictionary2];
  v6[3] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];

  return v3;
}

+ (id)_bnplProductAssessmentDictionary2
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"productType";
  v5[1] = @"financingEligibility";
  v6[0] = @"bnpl";
  v6[1] = @"eligible";
  v6[2] = MEMORY[0x1E4F1CBF0];
  v5[2] = @"financingOptions";
  v5[3] = @"preliminaryAssessment";
  v2 = [a1 _bnplPreliminaryAssessmentDictionary];
  v6[3] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];

  return v3;
}

+ (id)_bnplProductAssessmentDictionary
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"productType";
  v7[1] = @"financingEligibility";
  v8[0] = @"bnpl";
  v8[1] = @"eligible";
  v7[2] = @"financingOptions";
  v2 = [a1 _bnplFinancingOptionsDictionaryWithRelevantDates:0];
  v6 = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  void v7[3] = @"preliminaryAssessment";
  v8[2] = v3;
  v8[3] = MEMORY[0x1E4F1CC08];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v4;
}

+ (id)_bnplPreliminaryAssessmentDictionary
{
  return &unk_1EE22C9E8;
}

+ (id)_bnplFinancingOptionsDictionaryWithRelevantDates:(BOOL)a3
{
  BOOL v3 = a3;
  v45[16] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:14];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v5 dateByAddingComponents:v6 toDate:v7 options:0];
  uint64_t v9 = [v5 dateByAddingComponents:v6 toDate:v8 options:0];
  v33 = v5;
  v34 = [v5 dateByAddingComponents:v6 toDate:v9 options:0];
  v44[0] = @"identifier";
  v44[1] = @"installmentCount";
  v45[0] = @"paylater-swallowtail-financingOption1";
  v45[1] = &unk_1EE22BCA8;
  v44[2] = @"hasAPR";
  v44[3] = @"apr";
  v45[2] = MEMORY[0x1E4F1CC28];
  v45[3] = @"0";
  v44[4] = @"autoPayment";
  v44[5] = @"totalAmount";
  v45[4] = @"optional";
  v45[5] = &unk_1EE22CA10;
  v44[6] = @"totalFees";
  v44[7] = @"authAmount";
  v45[6] = &unk_1EE22CA38;
  v45[7] = &unk_1EE22CA60;
  v44[8] = @"dueNow";
  v44[9] = @"installmentAmount";
  v45[8] = &unk_1EE22CA88;
  v45[9] = &unk_1EE22CAB0;
  v45[10] = &unk_1EE22CAD8;
  v44[10] = @"installmentFees";
  v44[11] = @"installments";
  v41[0] = @"dueDate";
  v32 = (void *)v7;
  if (v3)
  {
    v27 = [a1 _dateFormatter];
    v10 = [v27 stringFromDate:v7];
  }
  else
  {
    v10 = @"2020-10-07T17:10:31+0000";
  }
  v41[1] = @"dueAmount";
  v42[0] = v10;
  v42[1] = &unk_1EE22CB00;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  uint64_t v30 = v29 = v10;
  v43[0] = v30;
  v39[0] = @"dueDate";
  if (v3)
  {
    v26 = [a1 _dateFormatter];
    v11 = [v26 stringFromDate:v8];
  }
  else
  {
    v11 = @"2020-10-21T17:10:31+0000";
  }
  v31 = (void *)v8;
  v39[1] = @"dueAmount";
  v40[0] = v11;
  v28 = v11;
  v40[1] = &unk_1EE22CB28;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v43[1] = v12;
  v37[0] = @"dueDate";
  if (v3)
  {
    v25 = [a1 _dateFormatter];
    v13 = [v25 stringFromDate:v9];
  }
  else
  {
    v13 = @"2020-11-04T17:10:31+0000";
  }
  v37[1] = @"dueAmount";
  v38[0] = v13;
  v38[1] = &unk_1EE22CB50;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v43[2] = v14;
  v35[0] = @"dueDate";
  if (v3)
  {
    id v15 = a1;
    v16 = (void *)v9;
    v24 = [v15 _dateFormatter];
    v17 = [v24 stringFromDate:v34];
  }
  else
  {
    v16 = (void *)v9;
    v17 = @"2020-11-18T17:10:31+0000";
  }
  v35[1] = @"dueAmount";
  v36[0] = v17;
  v36[1] = &unk_1EE22CB78;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v43[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  v45[11] = v19;
  v45[12] = &unk_1EE22CBA0;
  v44[12] = @"termsDetails";
  v44[13] = @"supportedRepaymentNetworks";
  v45[13] = &unk_1EE22AEC8;
  v45[14] = &unk_1EE22AEE0;
  v44[14] = @"supportedRepaymentTypes";
  v44[15] = @"financingOptionData";
  v45[15] = &unk_1EE22CBC8;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:16];

  if (v3)
  {

    v12 = v29;
    v14 = (void *)v30;
    v21 = v32;
    v22 = v27;
  }
  else
  {
    v22 = (void *)v30;
    v21 = v32;
  }

  return v20;
}

+ (id)_loanPreliminaryAssessmentDictionary
{
  return &unk_1EE22CCE0;
}

+ (id)_loanPreliminaryAssessmentDictionary2
{
  return &unk_1EE22CD58;
}

+ (id)_loanFinancingOptionDictionaryWithRelevantDates:(BOOL)a3
{
  BOOL v3 = a3;
  v35[16] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setMonth:1];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v5 dateByAddingComponents:v6 toDate:v7 options:0];

  uint64_t v9 = [v5 dateByAddingComponents:v6 toDate:v8 options:0];
  v26 = [v5 dateByAddingComponents:v6 toDate:v9 options:0];
  v34[0] = @"identifier";
  v34[1] = @"installmentCount";
  v35[0] = @"loan-a2df46d8-d07f-483e-b416-f0ff8872f03e";
  v35[1] = &unk_1EE22BCC0;
  v34[2] = @"hasAPR";
  v34[3] = @"apr";
  void v35[2] = MEMORY[0x1E4F1CC38];
  v35[3] = &unk_1EE22E5E0;
  v35[4] = @"optional";
  v34[4] = @"autoPayment";
  v34[5] = @"installments";
  v31[0] = @"dueDate";
  v25 = (void *)v8;
  if (v3)
  {
    v22 = [a1 _dateFormatter];
    v10 = [v22 stringFromDate:v8];
  }
  else
  {
    v10 = @"2021-03-10T00:29:34.349Z";
  }
  v31[1] = @"dueAmount";
  v32[0] = v10;
  v32[1] = &unk_1EE22CD80;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v33[0] = v11;
  v29[0] = @"dueDate";
  v24 = (void *)v9;
  if (v3)
  {
    v21 = [a1 _dateFormatter];
    v12 = [v21 stringFromDate:v9];
  }
  else
  {
    v12 = @"2021-04-09T23:29:34.349Z";
  }
  v29[1] = @"dueAmount";
  v30[0] = v12;
  v23 = v12;
  v30[1] = &unk_1EE22CDA8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v33[1] = v13;
  v27[0] = @"dueDate";
  if (v3)
  {
    v20 = [a1 _dateFormatter];
    v14 = [v20 stringFromDate:v26];
  }
  else
  {
    v14 = @"2021-05-09T23:29:34.349Z";
  }
  v27[1] = @"dueAmount";
  v28[0] = v14;
  v28[1] = &unk_1EE22CDD0;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v33[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v35[5] = v16;
  v35[6] = &unk_1EE22CDF8;
  v34[6] = @"dueNow";
  v34[7] = @"installmentAmount";
  v35[7] = &unk_1EE22CE20;
  v35[8] = &unk_1EE22CE48;
  v34[8] = @"totalAmount";
  v34[9] = @"totalFees";
  v35[9] = &unk_1EE22CE70;
  v35[10] = &unk_1EE22CE98;
  v34[10] = @"installmentFees";
  v34[11] = @"authAmount";
  v35[11] = &unk_1EE22CEC0;
  v35[12] = &unk_1EE22CEE8;
  v34[12] = @"termsDetails";
  v34[13] = @"supportedRepaymentNetworks";
  v35[13] = &unk_1EE22AF28;
  v35[14] = &unk_1EE22AF40;
  v34[14] = @"supportedRepaymentTypes";
  v34[15] = @"financingOptionData";
  v35[15] = &unk_1EE22CF10;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:16];

  if (v3)
  {

    v18 = v25;
    v11 = v22;
  }
  else
  {
    v10 = v13;
    v18 = v25;
  }

  return v17;
}

+ (id)_bnplFinancingPlan1WithRelevantDates:(BOOL)a3
{
  BOOL v3 = a3;
  v127[11] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:14];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v5 dateByAddingComponents:v6 toDate:v7 options:0];
  [v5 dateByAddingComponents:v6 toDate:v8 options:0];
  v75 = v6;
  v77 = v76 = v5;
  v78 = objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6);
  v126[0] = @"planIdentifier";
  v126[1] = @"productType";
  v127[0] = @"9d1106d3-e625-4cb4-b280-470156494160";
  v127[1] = @"bnpl";
  v126[2] = @"lastUpdated";
  if (v3)
  {
    v55 = [a1 _dateFormatter];
    uint64_t v9 = [v55 stringFromDate:v7];
  }
  else
  {
    uint64_t v9 = @"2020-9-20T00:00:00-08:00";
  }
  v127[2] = v9;
  v127[3] = @"active";
  v126[3] = @"state";
  v126[4] = @"stateReason";
  v127[4] = @"currentSettled";
  v127[5] = @"inApp";
  v126[5] = @"planChannel";
  v126[6] = @"planSummary";
  v115[0] = @"apr";
  v115[1] = @"hasAPR";
  v120[0] = @"0";
  v120[1] = MEMORY[0x1E4F1CC28];
  v115[2] = @"daysPastDue";
  v115[3] = @"pastDueAmount";
  v120[2] = &unk_1EE22BD20;
  v120[3] = &unk_1EE22CF38;
  v115[4] = @"installmentCount";
  v115[5] = @"panSuffix";
  v120[4] = &unk_1EE22BCA8;
  v120[5] = @"1234";
  v115[6] = @"totalAmount";
  v115[7] = @"paymentAmountToDate";
  v120[6] = &unk_1EE22CF60;
  v120[7] = &unk_1EE22CF88;
  v115[8] = @"currentBalance";
  v115[9] = @"totalInterest";
  v120[8] = &unk_1EE22CFB0;
  v120[9] = &unk_1EE22CFD8;
  v115[10] = @"interestPaidToDate";
  v115[11] = @"payoffAmount";
  v120[10] = &unk_1EE22D000;
  v120[11] = &unk_1EE22D028;
  v115[12] = @"transactionDate";
  if (v3)
  {
    v54 = [a1 _dateFormatter];
    uint64_t v53 = [v54 stringFromDate:v7];
    v121 = (__CFString *)v53;
    v116 = @"startInstallmentDate";
    v52 = [a1 _dateFormatter];
    uint64_t v51 = [v52 stringFromDate:v7];
    v122 = (__CFString *)v51;
    v117 = @"nextInstallmentDueDate";
    v50 = [a1 _dateFormatter];
    uint64_t v49 = [v50 stringFromDate:v8];
    v123 = (__CFString *)v49;
    v118 = @"endInstallmentDate";
    v48 = [a1 _dateFormatter];
    v47 = [v48 stringFromDate:v78];
    v124 = v47;
    v119 = @"cancellationDate";
    v46 = [a1 _dateFormatter];
    v10 = [v46 stringFromDate:v7];
  }
  else
  {
    v121 = @"2020-9-20T00:00:00-08:00";
    v122 = @"2019-05-01T18:05:10-08:00";
    v116 = @"startInstallmentDate";
    v117 = @"nextInstallmentDueDate";
    v123 = @"2019-05-10T18:05:10-08:00";
    v124 = @"2020-05-31T18:05:10-08:00";
    v118 = @"endInstallmentDate";
    v119 = @"cancellationDate";
    v10 = @"2020-05-30T18:05:10-08:00";
  }
  v62 = v10;
  v125 = v10;
  v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v115 count:17];
  v127[6] = v72;
  v127[7] = &unk_1EE22D050;
  v126[7] = @"merchantSummary";
  v126[8] = @"disputes";
  v101[0] = @"identifier";
  v101[1] = @"state";
  v107[0] = @"dispute-id-1";
  v107[1] = @"evidenceRequired";
  v101[2] = @"openDate";
  v63 = v9;
  if (v3)
  {
    v45 = [a1 _dateFormatter];
    v44 = [v45 stringFromDate:v7];
    v108 = v44;
    v102 = @"lastUpdated";
    v43 = [a1 _dateFormatter];
    v42 = [v43 stringFromDate:v7];
    v109 = v42;
    v103 = @"deadlineDate";
    v41 = [a1 _dateFormatter];
    v11 = [v41 stringFromDate:v8];
  }
  else
  {
    v108 = @"2020-9-20T00:00:00-08:00";
    v109 = @"2020-9-20T00:00:00-08:00";
    v102 = @"lastUpdated";
    v103 = @"deadlineDate";
    v11 = @"2019-05-10T18:05:10-08:00";
  }
  v61 = v11;
  v110 = v11;
  v111 = &unk_1EE22AF58;
  v104 = @"appliedPayments";
  v105 = @"emailAddress";
  v106 = @"requiredDocuments";
  v112 = @"example@apple.com";
  v113 = &unk_1EE22AF70;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v101 count:8];
  v114 = v71;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
  v127[8] = v70;
  v127[9] = &unk_1EE22D140;
  v126[9] = @"fundingSource";
  v126[10] = @"scheduleSummary";
  v100[0] = @"activeMilitary";
  v99[0] = @"scheduleSummaryReason";
  v99[1] = @"installments";
  v96[0] = @"installmentIdentifier";
  v96[1] = @"status";
  v97[0] = @"0f31ec57-6108-4cf6-afa5-c1208927edc5";
  v97[1] = @"paid";
  v96[2] = @"totalAmount";
  v96[3] = @"currentBalance";
  v97[2] = &unk_1EE22D168;
  v97[3] = &unk_1EE22D190;
  v96[4] = @"dueDate";
  BOOL v79 = v3;
  if (v3)
  {
    v40 = [a1 _dateFormatter];
    v12 = [v40 stringFromDate:v7];
  }
  else
  {
    v12 = @"2020-10-15T18:05:10-08:00";
  }
  v96[5] = @"appliedPayments";
  v60 = v12;
  v97[4] = v12;
  v97[5] = &unk_1EE22AF88;
  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:6];
  v98[0] = v69;
  v94[0] = @"installmentIdentifier";
  v94[1] = @"status";
  v95[0] = @"0f31ec57-6108-4cf6-afa5-c1208927edc4";
  v95[1] = @"open";
  v94[2] = @"totalAmount";
  v94[3] = @"currentBalance";
  v95[2] = &unk_1EE22D208;
  v95[3] = &unk_1EE22D230;
  v94[4] = @"dueDate";
  v73 = (void *)v8;
  if (v3)
  {
    v39 = [a1 _dateFormatter];
    v13 = [v39 stringFromDate:v8];
  }
  else
  {
    v13 = @"2020-10-30T18:05:10-08:00";
  }
  v94[5] = @"appliedPayments";
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  v59 = v13;
  v95[4] = v13;
  v95[5] = MEMORY[0x1E4F1CBF0];
  v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:6];
  v98[1] = v68;
  v92[0] = @"installmentIdentifier";
  v92[1] = @"status";
  v93[0] = @"0f31ec57-6108-4cf6-afa5-c1208927edc3";
  v93[1] = @"open";
  v92[2] = @"totalAmount";
  v92[3] = @"currentBalance";
  v93[2] = &unk_1EE22D258;
  v93[3] = &unk_1EE22D280;
  v92[4] = @"dueDate";
  if (v3)
  {
    v38 = [a1 _dateFormatter];
    id v15 = [v38 stringFromDate:v77];
  }
  else
  {
    id v15 = @"2020-11-15T18:05:10-08:00";
  }
  v92[5] = @"appliedPayments";
  v58 = v15;
  v93[4] = v15;
  v93[5] = v14;
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:6];
  v98[2] = v67;
  v90[0] = @"installmentIdentifier";
  v90[1] = @"status";
  v91[0] = @"0f31ec57-6108-4cf6-afa5-c1208927edc2";
  v91[1] = @"open";
  v90[2] = @"totalAmount";
  v90[3] = @"currentBalance";
  v91[2] = &unk_1EE22D2A8;
  v91[3] = &unk_1EE22D2D0;
  v90[4] = @"dueDate";
  if (v3)
  {
    v37 = [a1 _dateFormatter];
    v16 = [v37 stringFromDate:v78];
  }
  else
  {
    v16 = @"2020-11-30T18:05:10-08:00";
  }
  v90[5] = @"appliedPayments";
  v57 = v16;
  v91[4] = v16;
  v91[5] = v14;
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:6];
  v98[3] = v66;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];
  v100[1] = v65;
  v99[2] = @"payments";
  v87[0] = @"paymentIdentifier";
  v87[1] = @"type";
  v88[0] = @"111";
  v88[1] = @"payment";
  v87[2] = @"scheduledDate";
  v74 = (void *)v7;
  if (v3)
  {
    v36 = [a1 _dateFormatter];
    v17 = [v36 stringFromDate:v7];
  }
  else
  {
    v17 = @"2019-05-01T18:05:10-08:00";
  }
  v56 = v17;
  v88[2] = v17;
  v88[3] = &unk_1EE22D2F8;
  v87[3] = @"amount";
  v87[4] = @"interestPaid";
  v88[4] = &unk_1EE22D320;
  v88[5] = &unk_1EE22D348;
  v87[5] = @"principalPaid";
  v87[6] = @"fundingSources";
  v84[0] = @"refundAmount";
  v84[1] = @"sourceType";
  v85[0] = &unk_1EE22D370;
  v85[1] = @"paymentPass";
  v84[2] = @"sourceDetails";
  v82[0] = @"fpanIdentifier";
  v82[1] = @"dpanIdentifier";
  v83[0] = @"V-3814224667917919787953";
  v83[1] = @"00000011111122222333333AAAAA";
  v82[2] = @"cardName";
  v82[3] = @"cardType";
  v83[2] = @"BofA Visa Debit Card";
  v83[3] = @"debit";
  v82[4] = @"cardNetwork";
  v82[5] = @"cardSuffix";
  v83[4] = @"Visa";
  v83[5] = @"2046";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:6];
  v85[2] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3];
  v86 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v88[6] = v20;
  v88[7] = &unk_1EE22D398;
  v87[7] = @"fundingSourceRefundAmount";
  v87[8] = @"sourceType";
  v88[8] = @"paymentPass";
  v87[9] = @"sourceDetails";
  v80[0] = @"fpanIdentifier";
  v80[1] = @"dpanIdentifier";
  v81[0] = @"V-3814224667917919787953";
  v81[1] = @"00000011111122222333333AAAAA";
  v80[2] = @"cardName";
  v80[3] = @"cardType";
  v81[2] = @"BofA Visa Debit Card";
  v81[3] = @"debit";
  v80[4] = @"cardNetwork";
  v80[5] = @"cardSuffix";
  v81[4] = @"Visa";
  v81[5] = @"2046";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:6];
  v88[9] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:10];
  v89 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v100[2] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
  v127[10] = v24;
  id v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:11];

  if (v79)
  {

    v26 = v73;
    v25 = (void *)v7;
    v28 = v54;
    v27 = v55;
    v29 = v63;
    v31 = v52;
    uint64_t v30 = (void *)v53;
    v33 = v50;
    v32 = (void *)v51;
    v34 = (void *)v49;
  }
  else
  {
    v34 = v65;
    v33 = v66;
    v32 = v67;
    v31 = v68;
    uint64_t v30 = v69;
    v28 = v70;
    v29 = v71;
    v27 = v72;
    v26 = v73;
    v25 = v74;
  }

  return v64;
}

+ (id)_dateFormatter
{
  if (qword_1EB402E28 != -1) {
    dispatch_once(&qword_1EB402E28, &__block_literal_global_94);
  }
  v2 = (void *)_MergedGlobals_228;
  return v2;
}

uint64_t __41__PKPayLaterMockUtilities__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_228;
  _MergedGlobals_228 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_228;
  BOOL v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  v4 = (void *)_MergedGlobals_228;
  return [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
}

@end