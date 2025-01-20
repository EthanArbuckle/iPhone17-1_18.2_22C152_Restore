@interface PDPassPaymentTransactionUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPaymentTransaction:(id)a3;
- (BOOL)isValid;
- (PDPassPaymentTransactionUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8;
- (PKAccountUser)accountUser;
- (PKFamilyMember)familyMember;
- (PKPaymentOfferInstallmentCriteria)installmentCriteria;
- (PKPaymentTransaction)paymentTransaction;
- (id)_absoluteAmountString;
- (id)_amountString;
- (id)_amountsString;
- (id)_awardsString;
- (id)_locationString;
- (id)_personContact;
- (id)_statusString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)notificationType;
- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentTransactionUserNotification

+ (id)notificationIdentifierForPaymentTransaction:(id)a3
{
  id v3 = a3;
  v4 = [v3 serviceIdentifier];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 identifier];
  }
  v7 = v6;

  return v7;
}

- (PDPassPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v36 = a7;
  id v19 = a8;
  if (v15)
  {
    id v34 = v19;
    id v35 = v18;
    v20 = [(id)objc_opt_class() notificationIdentifierForPaymentTransaction:v15];
    v37.receiver = self;
    v37.super_class = (Class)PDPassPaymentTransactionUserNotification;
    v21 = [(PDUserNotification *)&v37 initWithNotificationIdentifier:v20 forPassUniqueIdentifier:v16];
    v22 = v21;
    if (v21)
    {
      p_paymentTransaction = (id *)&v21->_paymentTransaction;
      objc_storeStrong((id *)&v21->_paymentTransaction, a3);
      objc_storeStrong((id *)&v22->_familyMember, a6);
      objc_storeStrong((id *)&v22->_accountUser, a7);
      objc_storeStrong((id *)&v22->_installmentCriteria, a8);
      v24 = [*p_paymentTransaction transactionDate];
      [(PDUserNotification *)v22 setDate:v24];

      v25 = [*p_paymentTransaction accountIdentifier];
      [(PDUserNotification *)v22 setAccountIdentifier:v25];

      if (([v17 supportsTransit] & 1) == 0)
      {
        [(PDUserNotification *)v22 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
        v26 = [*p_paymentTransaction identifier];
        v27 = [*p_paymentTransaction transactionSourceIdentifier];
        id v28 = objc_alloc_init((Class)NSMutableDictionary);
        if ([v26 length]) {
          [v28 setObject:v26 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
        }
        if ([v27 length]) {
          [v28 setObject:v27 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
        }
        id v29 = [v28 copy];
        [(PDUserNotification *)v22 setCustomActionQueryParameters:v29];
      }
    }

    id v18 = v35;
    v30 = v36;
    v31 = v34;
  }
  else
  {
    id v32 = v19;

    v31 = v32;
    v22 = 0;
    v30 = v36;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDPassPaymentTransactionUserNotification;
  v5 = [(PDUserNotification *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    paymentTransaction = v5->_paymentTransaction;
    v5->_paymentTransaction = (PKPaymentTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMember"];
    familyMember = v5->_familyMember;
    v5->_familyMember = (PKFamilyMember *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUser"];
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentCriteria"];
    installmentCriteria = v5->_installmentCriteria;
    v5->_installmentCriteria = (PKPaymentOfferInstallmentCriteria *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentTransactionUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentTransaction, @"paymentTransaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_familyMember forKey:@"familyMember"];
  [v4 encodeObject:self->_accountUser forKey:@"accountUser"];
  [v4 encodeObject:self->_installmentCriteria forKey:@"installmentCriteria"];
}

- (unint64_t)familyNotificationType
{
  if (self->_accountUser) {
    return 2;
  }
  else {
    return self->_familyMember != 0;
  }
}

- (unint64_t)notificationType
{
  return 4;
}

- (BOOL)isValid
{
  id v3 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  unsigned int v6 = [(PKPaymentTransaction *)self->_paymentTransaction hasNotificationServiceData];
  if (v6)
  {
    LOBYTE(v6) = [(PKPaymentTransaction *)self->_paymentTransaction hasAssociatedPaymentApplication];
    if (fabs(v5) <= 43200.0) {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PDPassPaymentTransactionUserNotification;
  id v4 = a3;
  double v5 = [(PDUserNotification *)&v18 notificationContentWithDataSource:v4];
  -[PDPassPaymentTransactionUserNotification _populateNotificationContent:withDataSource:](self, "_populateNotificationContent:withDataSource:", v5, v4, v18.receiver, v18.super_class);

  unsigned int v6 = [(PKFamilyMember *)self->_familyMember altDSID];
  if (!v6)
  {
    accountUser = self->_accountUser;
    if (accountUser)
    {
      unsigned int v6 = [(PKAccountUser *)accountUser altDSID];
    }
    else
    {
      unsigned int v6 = 0;
    }
  }
  uint64_t v8 = [v5 userInfo];
  id v9 = [v8 mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v12 = v11;

  v13 = [(PKPaymentTransaction *)self->_paymentTransaction identifier];
  [v12 setObject:v13 forKeyedSubscript:PKUserNotificationTransactionIdentifierContextKey];

  v14 = [(PDUserNotification *)self passUniqueIdentifier];
  [v12 setObject:v14 forKeyedSubscript:PKUserNotificationPassUniqueIdentifierContextKey];

  [v12 setObject:v6 forKeyedSubscript:PKUserNotificationAltDSIDKey];
  objc_super v15 = [(PKPaymentTransaction *)self->_paymentTransaction accountIdentifier];
  [v12 setObject:v15 forKeyedSubscript:PKUserNotificationAccountIdentifier];

  id v16 = +[NSNumber numberWithInteger:[(PKPaymentTransaction *)self->_paymentTransaction accountType]];
  [v12 setObject:v16 forKeyedSubscript:PKUserNotificationAccountType];

  [v5 setUserInfo:v12];
  return v5;
}

- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4
{
  id v64 = a3;
  id v6 = a4;
  v7 = [(PDUserNotification *)self passUniqueIdentifier];
  uint64_t v8 = [v6 passWithUniqueIdentifier:v7];

  id v9 = [v8 paymentPass];
  uint64_t v10 = [(PDPassPaymentTransactionUserNotification *)self _personContact];
  v63 = [v10 givenName];

  unsigned int v11 = [v9 hasAssociatedPeerPaymentAccount];
  uint64_t v12 = [v9 associatedAccountServiceAccountIdentifier];

  id v13 = [(PKPaymentTransaction *)self->_paymentTransaction featureIdentifier];
  id v14 = [v9 associatedAccountFeatureIdentifier];
  objc_super v15 = 0;
  id v16 = 0;
  switch((unint64_t)[(PKPaymentTransaction *)self->_paymentTransaction transactionType])
  {
    case 0uLL:
      if ([(PKPaymentTransaction *)self->_paymentTransaction transactionStatus] == (id)2) {
        goto LABEL_26;
      }
      goto LABEL_2;
    case 1uLL:
      id v16 = [(PDPassPaymentTransactionUserNotification *)self _locationString];
      if (v63)
      {
        PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_REFUNDED", @"%@", v63);
        uint64_t v28 = LABEL_23:;
      }
      else
      {
        uint64_t v28 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_REFUND");
      }
      goto LABEL_43;
    case 3uLL:
    case 9uLL:
    case 0xCuLL:
    case 0xEuLL:
      goto LABEL_2;
    case 4uLL:
      v23 = @"TRANSACTION_TYPE_FEE";
      goto LABEL_40;
    case 5uLL:
      if (v11)
      {
        v24 = [(PKPaymentTransaction *)self->_paymentTransaction secondaryFundingSourceDescription];
        objc_super v18 = v24;
        if (v63)
        {
          v25 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
          v20 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_FAMILY_MEMBER_BANK_TRANSFER_BY_MESSAGE", @"%@%@%@", v63, v25, v18);

          v22 = 0;
          id v16 = 0;
          goto LABEL_7;
        }
        id v16 = v24;
        PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_BANK_TRANSFER_NOTIFICATION_TITLE");
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      if (v13 != (id)5) {
        goto LABEL_65;
      }
      v39 = [(PKPaymentTransaction *)self->_paymentTransaction transfers];
      v40 = [v39 firstObject];

      v41 = [v40 externalAccount];
      v42 = [v41 fundingDetails];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v43 = [v42 name];
        v44 = v43;
        if (v43)
        {
          id v45 = v43;
        }
        else
        {
          PKLocalizedFeatureString();
          id v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        v56 = v45;
      }
      else
      {
        v56 = 0;
      }
      objc_super v15 = PKLocalizedFeatureString();
      PKLocalizedFeatureString();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (![v56 length]) {
        goto LABEL_78;
      }
      goto LABEL_77;
    case 6uLL:
      if (v11)
      {
        objc_super v15 = v63;
        if (!v63)
        {
          PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_TOP_UP_NOTIFICATION_MESSAGE");
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          v22 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
          v20 = 0;
          goto LABEL_45;
        }
        v26 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
        v20 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_FAMILY_MEMBER_TOP_UP_NOTIFICATION_MESSAGE", @"%@%@", v63, v26);

        v22 = 0;
        id v16 = 0;
        objc_super v15 = 0;
        if (v20) {
          goto LABEL_51;
        }
        goto LABEL_54;
      }
      if (v13 == (id)5)
      {
        v46 = [(PKPaymentTransaction *)self->_paymentTransaction transfers];
        v40 = [v46 firstObject];

        v47 = [v40 externalAccount];
        v42 = [v47 fundingDetails];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v48 = [v42 name];
          v49 = v48;
          if (v48)
          {
            id v50 = v48;
          }
          else
          {
            PKLocalizedFeatureString();
            id v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          v56 = v50;
        }
        else
        {
          v56 = 0;
        }
        objc_super v15 = PKLocalizedFeatureString();
        PKLocalizedFeatureString();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if ([v56 length])
        {
LABEL_77:
          v58 = v56;
          uint64_t v57 = PKLocalizedFeatureString();
        }
        else
        {
LABEL_78:
          uint64_t v57 = PKLocalizedFeatureString();
        }
        v20 = (void *)v57;
        goto LABEL_80;
      }
      if (v14 != (id)4)
      {
LABEL_65:
        objc_super v15 = 0;
        id v16 = 0;
        goto LABEL_54;
      }
      PKLocalizedPaymentString(@"TRANSACTION_TYPE_TOP_UP");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:
      v20 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
      objc_super v15 = 0;
      goto LABEL_82;
    case 7uLL:
      uint64_t v27 = PKLocalizedTitleForTransactionWithAdjustment();
      goto LABEL_41;
    case 8uLL:
      id v16 = [(PDPassPaymentTransactionUserNotification *)self _locationString];
      if (!v63) {
        goto LABEL_64;
      }
      PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_DISBURSED", @"%@", v63);
      goto LABEL_23;
    case 0xAuLL:
      if (v12 && [(PKPaymentTransaction *)self->_paymentTransaction transactionStatus] == (id)4) {
LABEL_26:
      }
        [v64 setInterruptionLevel:2];
LABEL_2:
      id v16 = [(PDPassPaymentTransactionUserNotification *)self _locationString];
      id v17 = [(PDPassPaymentTransactionUserNotification *)self _statusString];
      objc_super v18 = v17;
      if (v17)
      {
        id v19 = v17;
LABEL_4:
        v20 = v19;
        uint64_t v21 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
      }
      else
      {
        v20 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
        uint64_t v21 = [(PDPassPaymentTransactionUserNotification *)self _awardsString];
      }
      v22 = (void *)v21;
LABEL_7:

      goto LABEL_44;
    case 0xBuLL:
      if (v13 == (id)5)
      {
        objc_super v15 = PKLocalizedFeatureString();
        PKLocalizedFeatureString();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        id v29 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
        v30 = PKStartOfMonth();
        v31 = PKEndOfMonth();
        uint64_t v32 = PKDatesMidpoint();

        v33 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        id v34 = [v33 components:16 fromDate:v29];
        id v59 = [v34 day];

        v62 = v33;
        v60 = (void *)v32;
        id v35 = [v33 components:16 fromDate:v32];
        id v36 = [v35 day];

        v61 = v29;
        if ((uint64_t)v59 <= (uint64_t)v36)
        {
          PKStartOfLastMonth();
          id v37 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v37 = v29;
        }
        v53 = v37;
        v54 = [v62 components:8 fromDate:v37];
        [v54 month];

        v55 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
        v58 = [(PDPassPaymentTransactionUserNotification *)self _absoluteAmountString];
        v20 = PKLocalizedFeatureString();

        v56 = v62;
        v42 = v60;
        v40 = v61;
LABEL_80:

        if (v15) {
          [v64 setTitle:v15];
        }
LABEL_82:
        v22 = 0;
      }
      else
      {
        v23 = @"TRANSACTION_TYPE_INTEREST_CHARGE";
LABEL_40:
        uint64_t v27 = PKLocalizedPaymentString(&v23->isa);
LABEL_41:
        id v16 = (id)v27;
LABEL_42:
        uint64_t v28 = [(PDPassPaymentTransactionUserNotification *)self _statusString];
LABEL_43:
        v20 = (void *)v28;
        v22 = [(PDPassPaymentTransactionUserNotification *)self _amountString];
LABEL_44:
        objc_super v15 = 0;
      }
LABEL_45:
      if (v16) {
        [v64 setSubtitle:v16];
      }
      if (v20 && v22)
      {
        v51 = +[NSString stringWithFormat:@"%@ • %@", v20, v22];
        [v64 setBody:v51];

LABEL_52:
LABEL_53:

        goto LABEL_54;
      }
      if (v20)
      {
LABEL_51:
        objc_msgSend(v64, "setBody:", v20, v58);
        goto LABEL_52;
      }
      if (v22)
      {
        [v64 setBody:v22];
        v20 = v22;
        goto LABEL_53;
      }
LABEL_54:
      v52 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
      [v64 setDate:v52];

      return;
    case 0xDuLL:
      v38 = [(PKPaymentTransaction *)self->_paymentTransaction installmentPayment];
      id v16 = [v38 localizedDisplay];

      goto LABEL_42;
    default:
      goto LABEL_54;
  }
}

- (id)_locationString
{
  id v3 = [(PKPaymentTransaction *)self->_paymentTransaction merchant];
  if (v3
    || ([(PKPaymentTransaction *)self->_paymentTransaction displayLocation],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    double v5 = +[NSMutableArray array];
    id v6 = [(PKPaymentTransaction *)self->_paymentTransaction merchant];
    v7 = [v6 displayName];
    [v5 safelyAddObject:v7];

    uint64_t v8 = [(PKPaymentTransaction *)self->_paymentTransaction displayLocation];
    [v5 safelyAddObject:v8];

    id v9 = +[NSLocale currentLocale];
    uint64_t v10 = [v9 objectForKey:NSLocaleGroupingSeparator];
    unsigned int v11 = +[NSString stringWithFormat:@"%@ ", v10];

    uint64_t v12 = [v5 componentsJoinedByString:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_statusString
{
  paymentTransaction = self->_paymentTransaction;
  id v3 = [(PDPassPaymentTransactionUserNotification *)self _personContact];
  id v4 = +[PKPaymentTransaction transactionNotificationStatusStringForTransaction:paymentTransaction personContact:v3];

  return v4;
}

- (id)_amountString
{
  id v3 = [(PKPaymentTransaction *)self->_paymentTransaction amount];
  if (v3)
  {
  }
  else
  {
    id v4 = [(PKPaymentTransaction *)self->_paymentTransaction amounts];

    if (!v4) {
      goto LABEL_14;
    }
  }
  double v5 = [(PKPaymentTransaction *)self->_paymentTransaction amount];

  if (v5) {
    [(PKPaymentTransaction *)self->_paymentTransaction formattedBalanceAdjustmentAmount];
  }
  else {
  id v4 = [(PDPassPaymentTransactionUserNotification *)self _amountsString];
  }
  if (![(PKPaymentTransaction *)self->_paymentTransaction transactionType]
    && [(PKPaymentTransaction *)self->_paymentTransaction isIssuerInstallmentTransaction])
  {
    id v6 = [(PKPaymentOfferInstallmentCriteria *)self->_installmentCriteria programName];
    v7 = v6;
    if (self->_installmentCriteria && v6)
    {
      id v8 = v6;
    }
    else
    {
      PKLocalizedPaymentOffersString(@"TRANSACTION_NOTIFICATION_PAY_LATER_PURCHASE");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v8;

    id v4 = v9;
  }
LABEL_14:
  return v4;
}

- (id)_absoluteAmountString
{
  id v3 = [(PKPaymentTransaction *)self->_paymentTransaction currencyAmount];
  if (v3)
  {
  }
  else
  {
    id v4 = [(PKPaymentTransaction *)self->_paymentTransaction amounts];

    if (!v4)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  double v5 = [(PKPaymentTransaction *)self->_paymentTransaction currencyAmount];

  if (v5)
  {
    id v6 = [(PKPaymentTransaction *)self->_paymentTransaction currencyAmount];
    v7 = [v6 formattedStringValue];
  }
  else
  {
    v7 = [(PDPassPaymentTransactionUserNotification *)self _amountsString];
  }
LABEL_8:
  return v7;
}

- (id)_amountsString
{
  id v3 = +[NSDecimalNumber zero];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(PKPaymentTransaction *)self->_paymentTransaction amounts];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      id v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v8) amount];
        unsigned int v11 = [v10 amount];

        id v3 = [(NSDecimalNumber *)v9 decimalNumberByAdding:v11];

        id v8 = (char *)v8 + 1;
        id v9 = v3;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [(PKPaymentTransaction *)self->_paymentTransaction currencyCode];
  if (!v12)
  {
    id v13 = [(PKPaymentTransaction *)self->_paymentTransaction amounts];
    id v14 = [v13 firstObject];
    objc_super v15 = [v14 amount];
    uint64_t v12 = [v15 currency];
  }
  id v16 = 0;
  if (v3 && v12)
  {
    id v17 = PKCurrencyAmountCreate(v3, v12, 0);
    id v16 = [v17 formattedStringValue];
  }
  return v16;
}

- (id)_awardsString
{
  return [(PKPaymentTransaction *)self->_paymentTransaction formattedAwards];
}

- (id)_personContact
{
  familyMember = self->_familyMember;
  id v3 = [(PKAccountUser *)self->_accountUser nameComponents];
  id v4 = +[PKContactResolver contactForFamilyMember:familyMember nameComponents:v3 imageData:0];

  return v4;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKPaymentOfferInstallmentCriteria)installmentCriteria
{
  return self->_installmentCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentCriteria, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
}

@end