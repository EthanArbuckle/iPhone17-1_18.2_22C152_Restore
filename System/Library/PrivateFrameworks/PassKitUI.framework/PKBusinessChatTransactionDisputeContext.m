@interface PKBusinessChatTransactionDisputeContext
- (BOOL)requiresAuthorization;
- (PKBusinessChatTransactionDisputeContext)initWithPaymentPass:(id)a3 transaction:(id)a4 account:(id)a5 accountUser:(id)a6 familyMember:(id)a7 physicalCards:(id)a8 intent:(int64_t)a9;
- (PKBusinessChatTransactionDisputeContext)initWithPaymentPass:(id)a3 transaction:(id)a4 account:(id)a5 accountUser:(id)a6 familyMember:(id)a7 physicalCards:(id)a8 topic:(id)a9;
- (id)_formattedBodyTextForTopicBodyText:(id)a3;
- (id)_formattedTransactionDate;
- (id)_replacePlaceholder:(id)a3 withValue:(id)a4 inBodyText:(id)a5;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBusinessChatTransactionDisputeContext

- (PKBusinessChatTransactionDisputeContext)initWithPaymentPass:(id)a3 transaction:(id)a4 account:(id)a5 accountUser:(id)a6 familyMember:(id)a7 physicalCards:(id)a8 intent:(int64_t)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKBusinessChatTransactionDisputeContext;
  v19 = [(PKBusinessChatTransactionDisputeContext *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_paymentPass, a3);
    objc_storeStrong((id *)&v20->_transaction, a4);
    objc_storeStrong((id *)&v20->_account, a5);
    objc_storeStrong((id *)&v20->_accountUser, a6);
    objc_storeStrong((id *)&v20->_familyMember, a7);
    uint64_t v21 = [v18 copy];
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v21;

    v20->_intent = a9;
    if (v16) {
      char v23 = [v16 isCurrentUser] ^ 1;
    }
    else {
      char v23 = 0;
    }
    v20->_disputingAccountUserTransaction = v23;
  }

  return v20;
}

- (PKBusinessChatTransactionDisputeContext)initWithPaymentPass:(id)a3 transaction:(id)a4 account:(id)a5 accountUser:(id)a6 familyMember:(id)a7 physicalCards:(id)a8 topic:(id)a9
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v16 = a6;
  id v25 = a7;
  id v17 = a8;
  id v24 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PKBusinessChatTransactionDisputeContext;
  id v18 = [(PKBusinessChatTransactionDisputeContext *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentPass, a3);
    objc_storeStrong((id *)&v19->_transaction, a4);
    objc_storeStrong((id *)&v19->_account, a5);
    objc_storeStrong((id *)&v19->_accountUser, a6);
    objc_storeStrong((id *)&v19->_familyMember, a7);
    uint64_t v20 = [v17 copy];
    physicalCards = v19->_physicalCards;
    v19->_physicalCards = (NSSet *)v20;

    v19->_intent = 5;
    objc_storeStrong((id *)&v19->_topic, a9);
    if (v16) {
      char v22 = [v16 isCurrentUser] ^ 1;
    }
    else {
      char v22 = 0;
    }
    v19->_disputingAccountUserTransaction = v22;
  }

  return v19;
}

- (id)businessIdentifier
{
  return (id)[(PKPaymentPass *)self->_paymentPass businessChatIdentifier];
}

- (id)intentParameters
{
  topic = self->_topic;
  if (topic)
  {
    uint64_t v4 = [(PKAccountSupportTopic *)topic businessChatTargetDialog];
LABEL_8:
    v6 = (__CFString *)v4;
    goto LABEL_9;
  }
  unint64_t intent = self->_intent;
  if (intent > 0xD) {
    v6 = 0;
  }
  else {
    v6 = off_1E59CCE60[intent];
  }
  if (self->_disputingAccountUserTransaction)
  {
    uint64_t v4 = [(__CFString *)v6 stringByAppendingString:@"_alt"];
    goto LABEL_8;
  }
LABEL_9:
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:v6 forKeyedSubscript:@"targetDialog"];
  v8 = [(PKPaymentTransaction *)self->_transaction serviceIdentifier];
  [v7 setObject:v8 forKeyedSubscript:@"transactionId"];

  v9 = [(PKPaymentPass *)self->_paymentPass uniqueID];
  [v7 setObject:v9 forKeyedSubscript:@"passUniqueId"];

  v10 = [(PKPaymentPass *)self->_paymentPass associatedAccountServiceAccountIdentifier];
  [v7 setObject:v10 forKeyedSubscript:@"accountID"];

  uint64_t v11 = [(PKPaymentTransaction *)self->_transaction effectiveTransactionSource];
  v12 = PKPaymentTransactionSourceToString();
  [v7 setObject:v12 forKeyedSubscript:@"paymentMethod"];

  if (v11 == 5)
  {
    v13 = [(PKPaymentTransaction *)self->_transaction cardNumberSuffix];
    physicalCards = self->_physicalCards;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __59__PKBusinessChatTransactionDisputeContext_intentParameters__block_invoke;
    v38[3] = &unk_1E59CCD98;
    id v39 = v13;
    id v15 = v13;
    id v16 = [(NSSet *)physicalCards pk_anyObjectPassingTest:v38];
  }
  else
  {
    id v16 = 0;
  }
  [v16 state];
  id v17 = PKStringFromPhysicalCardState();
  [v7 setObject:v17 forKeyedSubscript:@"physicalCardStatus"];

  id v18 = [(PKPaymentTransaction *)self->_transaction amount];
  v19 = [v18 stringValue];
  [v7 setObject:v19 forKeyedSubscript:@"transactionAmount"];

  uint64_t v20 = [(PKPaymentTransaction *)self->_transaction merchant];
  uint64_t v21 = [v20 displayName];
  [v7 setObject:v21 forKeyedSubscript:@"transactionMerchantName"];

  char v22 = [(PKPaymentTransaction *)self->_transaction transactionDate];
  char v23 = PKW3CDateStringFromDate();
  [v7 setObject:v23 forKeyedSubscript:@"transactionDate"];

  accountUser = self->_accountUser;
  if (accountUser)
  {
    [(PKAccountUser *)accountUser accountState];
    id v25 = PKAccountStateToString();
    [v7 setObject:v25 forKeyedSubscript:@"transactorAccountState"];

    uint64_t v26 = [(PKAccountUser *)self->_accountUser accessLevel];
    id v27 = @"participant";
    if (v26 != 2) {
      id v27 = 0;
    }
    if (v26 == 1) {
      id v28 = @"owner";
    }
    else {
      id v28 = v27;
    }
    [v7 setObject:v28 forKeyedSubscript:@"transactorAccountRole"];
    objc_super v29 = [(PKAccountUser *)self->_accountUser firstName];
    [v7 setObject:v29 forKeyedSubscript:@"transactorFirstName"];
  }
  else
  {
    [(PKAccount *)self->_account state];
    v30 = PKAccountStateToString();
    [v7 setObject:v30 forKeyedSubscript:@"transactorAccountState"];

    uint64_t v31 = [(PKAccount *)self->_account accessLevel];
    v32 = @"participant";
    if (v31 != 2) {
      v32 = 0;
    }
    if (v31 == 1) {
      v33 = @"owner";
    }
    else {
      v33 = v32;
    }
    [v7 setObject:v33 forKeyedSubscript:@"transactorAccountRole"];
  }
  if ([(PKPaymentTransaction *)self->_transaction disputeStatus]) {
    v34 = @"true";
  }
  else {
    v34 = @"false";
  }
  [v7 setObject:v34 forKeyedSubscript:@"disputeInProgress"];
  [(PKPaymentTransaction *)self->_transaction transactionType];
  v35 = PKPaymentTransactionTypeToString();
  [v7 setObject:v35 forKeyedSubscript:@"transactionType"];

  v36 = (void *)[v7 copy];

  return v36;
}

uint64_t __59__PKBusinessChatTransactionDisputeContext_intentParameters__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 FPANSuffix];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)groupParameters
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (self->_topic)
  {
    uint64_t v2 = [(PKAccountSupportTopic *)self->_topic businessChatPage];
  }
  else
  {
    unint64_t intent = self->_intent;
    if (intent > 0xD) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = off_1E59CCED0[intent];
    }
    if (!self->_disputingAccountUserTransaction) {
      goto LABEL_9;
    }
    uint64_t v2 = [(__CFString *)v4 stringByAppendingString:@"::alt"];
  }
  uint64_t v4 = (__CFString *)v2;
LABEL_9:
  v7[0] = @"domain";
  v7[1] = @"origin";
  v8[0] = @"apple_pay";
  v8[1] = @"Wallet";
  v7[2] = @"page";
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)bodyText
{
  topic = self->_topic;
  if (topic)
  {
    uint64_t v4 = [(PKAccountSupportTopic *)topic bodyText];
    id v5 = [(PKBusinessChatTransactionDisputeContext *)self _formattedBodyTextForTopicBodyText:v4];
    goto LABEL_21;
  }
  uint64_t v4 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentAmount];
  id v6 = [(PKBusinessChatTransactionDisputeContext *)self _formattedTransactionDate];
  id v7 = [(PKPaymentTransaction *)self->_transaction merchant];
  uint64_t v8 = [v7 displayName];

  familyMember = self->_familyMember;
  if (familyMember && ![(PKFamilyMember *)familyMember isMe]) {
    goto LABEL_13;
  }
  accountUser = self->_accountUser;
  if (accountUser)
  {
    uint64_t v11 = [(PKAccountUser *)accountUser altDSID];
    v12 = PKCurrentUserAltDSID();
    id v13 = v11;
    id v14 = v12;
    if (v13 == v14)
    {

      id v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v15 = v14;
    if (v13 && v14)
    {
      char v16 = [v13 isEqualToString:v14];

      if (v16) {
        goto LABEL_10;
      }
    }
    else
    {
    }
LABEL_13:
    id v18 = (void *)MEMORY[0x1E4F845E8];
    v19 = self->_familyMember;
    uint64_t v20 = [(PKAccountUser *)self->_accountUser nameComponents];
    id v13 = [v18 contactForFamilyMember:v19 nameComponents:v20 imageData:0];

    id v17 = [v13 givenName];
    goto LABEL_14;
  }
LABEL_10:
  id v17 = 0;
LABEL_15:
  switch(self->_intent)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      uint64_t v21 = PKLocalizedFeatureStringWithDefaultValue();
      goto LABEL_19;
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
      uint64_t v21 = PKLocalizedFeatureStringWithDefaultValue();
LABEL_19:
      id v5 = (void *)v21;
      break;
    default:
      id v5 = 0;
      break;
  }

LABEL_21:

  return v5;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)_formattedBodyTextForTopicBodyText:(id)a3
{
  transaction = self->_transaction;
  id v5 = a3;
  id v6 = [(PKPaymentTransaction *)transaction merchant];
  id v7 = [v6 displayName];
  uint64_t v8 = [(PKBusinessChatTransactionDisputeContext *)self _replacePlaceholder:@"{merchantName}" withValue:v7 inBodyText:v5];

  v9 = [(PKBusinessChatTransactionDisputeContext *)self _formattedTransactionDate];
  v10 = [(PKBusinessChatTransactionDisputeContext *)self _replacePlaceholder:@"{transactionDate}" withValue:v9 inBodyText:v8];

  uint64_t v11 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentAmount];
  v12 = [(PKBusinessChatTransactionDisputeContext *)self _replacePlaceholder:@"{transactionAmount}" withValue:v11 inBodyText:v10];

  return v12;
}

- (id)_replacePlaceholder:(id)a3 withValue:(id)a4 inBodyText:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  if (([v9 containsString:v7] & 1) == 0)
  {
    id v11 = v10;
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_8;
  }
  id v11 = [v10 stringByReplacingOccurrencesOfString:v7 withString:v8];
LABEL_7:
  v12 = v11;
LABEL_8:

  return v12;
}

- (id)_formattedTransactionDate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v4];

  [v3 setDateStyle:3];
  [v3 setTimeStyle:1];
  id v5 = [(PKPaymentTransaction *)self->_transaction transactionDate];
  id v6 = [v3 stringFromDate:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end