@interface PDPassTransitTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldSuppressNotificationForPass:(id)a3;
- (BOOL)enrouteFlag;
- (BOOL)isValid;
- (NSDecimalNumber)transitBalance;
- (NSString)transitBalanceCurrencyCode;
- (PDPassTransitTransactionUserNotification)initWithCoder:(id)a3;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 balance:(id)a6;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 balance:(id)a7 accountUser:(id)a8 installmentCriteria:(id)a9;
- (id)_amountTitleStringForSubtype:(int64_t)a3 transitModifiers:(unint64_t)a4 amountString:(id)a5;
- (id)_messageStringWithPass:(id)a3;
- (id)_titleStringForPass:(id)a3;
- (id)_zeroValueTitleStringForTransitSubtype:(int64_t)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateTransitBalance;
@end

@implementation PDPassTransitTransactionUserNotification

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 balance:(id)a6
{
  return [(PDPassTransitTransactionUserNotification *)self initWithPaymentTransaction:a3 forPassUniqueIdentifier:a4 paymentApplication:a5 familyMember:0 balance:a6 accountUser:0 installmentCriteria:0];
}

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5
{
  return [(PDPassTransitTransactionUserNotification *)self initWithPaymentTransaction:a3 forPassUniqueIdentifier:a4 paymentApplication:a5 familyMember:0 accountUser:0 installmentCriteria:0];
}

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8
{
  return [(PDPassTransitTransactionUserNotification *)self initWithPaymentTransaction:a3 forPassUniqueIdentifier:a4 paymentApplication:a5 familyMember:a6 balance:0 accountUser:a7 installmentCriteria:a8];
}

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 balance:(id)a7 accountUser:(id)a8 installmentCriteria:(id)a9
{
  id v15 = a3;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PDPassTransitTransactionUserNotification;
  v17 = [(PDPassPaymentTransactionUserNotification *)&v23 initWithPaymentTransaction:v15 forPassUniqueIdentifier:a4 paymentApplication:a5 familyMember:a6 accountUser:a8 installmentCriteria:a9];
  if (v17)
  {
    v17->_enrouteFlag = [v15 enRoute];
    if (v16)
    {
      uint64_t v18 = [v16 value];
      transitBalance = v17->_transitBalance;
      v17->_transitBalance = (NSDecimalNumber *)v18;

      uint64_t v20 = [v16 currencyCode];
      transitBalanceCurrencyCode = v17->_transitBalanceCurrencyCode;
      v17->_transitBalanceCurrencyCode = (NSString *)v20;
    }
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassTransitTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDPassTransitTransactionUserNotification;
  v5 = [(PDPassPaymentTransactionUserNotification *)&v17 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(PDPassPaymentTransactionUserNotification *)v5 paymentTransaction];
    v6->_enrouteFlag = [v7 enRoute];

    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"transitBalance"];
    transitBalance = v6->_transitBalance;
    v6->_transitBalance = (NSDecimalNumber *)v10;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = +[NSDecimalNumber decimalNumberWithMantissa:[(NSDecimalNumber *)v6->_transitBalance unsignedLongLongValue] exponent:0 isNegative:0];
      v13 = v6->_transitBalance;
      v6->_transitBalance = (NSDecimalNumber *)v12;
    }
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transitCurrencyCode"];
    transitBalanceCurrencyCode = v6->_transitBalanceCurrencyCode;
    v6->_transitBalanceCurrencyCode = (NSString *)v14;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassTransitTransactionUserNotification;
  id v4 = a3;
  [(PDPassPaymentTransactionUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitBalance, @"transitBalance", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transitBalanceCurrencyCode forKey:@"transitCurrencyCode"];
}

- (unint64_t)notificationType
{
  return 5;
}

- (BOOL)isValid
{
  v2 = [(PDPassPaymentTransactionUserNotification *)self paymentTransaction];
  if ([v2 transactionType] == (id)2
    && [v2 hasAssociatedPaymentApplication]
    && ([v2 enRoute] & 1) == 0)
  {
    unsigned int v3 = [v2 hasPendingAmounts] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)_zeroValueTitleStringForTransitSubtype:(int64_t)a3
{
  if (a3 <= 512)
  {
    if ((unint64_t)a3 > 0x200)
    {
      switch(a3)
      {
        case 257:
          unsigned int v3 = @"SHINKANSEN_TRANSACTION_NOTIFICATION_TITLE";
          goto LABEL_25;
        case 258:
          id v4 = @"TRANSIT_TRANSACTION_TITLE_MAGLEV";
          goto LABEL_23;
        case 259:
          id v4 = @"TRANSIT_TRANSACTION_TITLE_TAXI";
          goto LABEL_23;
        case 260:
          id v4 = @"TRANSIT_TRANSACTION_TITLE_FERRY";
          goto LABEL_23;
        case 261:
          id v4 = @"TRANSIT_TRANSACTION_TITLE_BIKE";
          goto LABEL_23;
        default:
          goto LABEL_18;
      }
    }
    switch(a3)
    {
      case 2:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_METRO";
        goto LABEL_23;
      case 3:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_BUS";
        goto LABEL_23;
      case 4:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_TRAIN";
        goto LABEL_23;
      case 5:
      case 6:
        goto LABEL_18;
      case 7:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_LIGHT_RAIL";
        goto LABEL_23;
      case 8:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_CABLE_CAR";
        goto LABEL_23;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 513:
    case 515:
      unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_PURCHASE";
      goto LABEL_25;
    case 514:
      unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_REFUND";
      goto LABEL_25;
    case 516:
      goto LABEL_18;
    case 517:
      unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_CARD_READ";
      goto LABEL_25;
    default:
      if (a3 == 1025)
      {
        unsigned int v3 = @"GREEN_CAR_TRANSACTION_NOTIFICATION_TITLE";
        goto LABEL_25;
      }
      if (a3 != 1026)
      {
LABEL_18:
        unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_TRANSIT";
LABEL_25:
        objc_super v5 = PKLocalizedPaymentString(&v3->isa);
        goto LABEL_26;
      }
      id v4 = @"TRANSIT_TRANSACTION_TITLE_METRO_UPGRADE";
LABEL_23:
      objc_super v5 = PKLocalizedTransitString(&v4->isa);
LABEL_26:
      return v5;
  }
}

- (id)_amountTitleStringForSubtype:(int64_t)a3 transitModifiers:(unint64_t)a4 amountString:(id)a5
{
  char v5 = a4;
  id v7 = a5;
  uint64_t v8 = 0;
  if (a3 <= 512)
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 5:
      case 6:
LABEL_5:
        if ((v5 & 8) != 0)
        {
          v9 = @"TRANSIT_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          v9 = @"TRANSIT_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          v9 = @"TRANSIT_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
LABEL_68:
        uint64_t v11 = PKLocalizedPaymentString(&v9->isa);
        goto LABEL_79;
      case 2:
        if ((v5 & 8) != 0)
        {
          uint64_t v10 = @"METRO_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          uint64_t v10 = @"METRO_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          uint64_t v10 = @"METRO_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
        goto LABEL_78;
      case 3:
        if ((v5 & 8) != 0)
        {
          uint64_t v10 = @"BUS_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          uint64_t v10 = @"BUS_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          uint64_t v10 = @"BUS_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
        goto LABEL_78;
      case 4:
        if ((v5 & 8) != 0)
        {
          uint64_t v10 = @"TRAIN_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          uint64_t v10 = @"TRAIN_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          uint64_t v10 = @"TRAIN_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
        goto LABEL_78;
      case 7:
        if ((v5 & 8) != 0)
        {
          uint64_t v10 = @"LIGHT_RAIL_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          uint64_t v10 = @"LIGHT_RAIL_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          uint64_t v10 = @"LIGHT_RAIL_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
        goto LABEL_78;
      case 8:
        if ((v5 & 8) != 0)
        {
          uint64_t v10 = @"CABLE_CAR_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          uint64_t v10 = @"CABLE_CAR_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          uint64_t v10 = @"CABLE_CAR_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
        goto LABEL_78;
      default:
        switch(a3)
        {
          case 257:
            if ((v5 & 8) != 0)
            {
              v9 = @"SHINKANSEN_TRANSACTION_FARE_ADJUSTMENT_AMOUNT_NOTIFICATION_FORMAT";
            }
            else if ((v5 & 0x10) != 0)
            {
              v9 = @"SHINKANSEN_TRANSACTION_FARE_REBATE_AMOUNT_NOTIFICATION_FORMAT";
            }
            else
            {
              v9 = @"SHINKANSEN_TRANSACTION_AMOUNT_NOTIFICATION_FORMAT";
            }
            goto LABEL_68;
          case 258:
            if ((v5 & 8) != 0)
            {
              uint64_t v10 = @"MAGLEV_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
            }
            else if ((v5 & 0x10) != 0)
            {
              uint64_t v10 = @"MAGLEV_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
            }
            else
            {
              uint64_t v10 = @"MAGLEV_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
            }
            goto LABEL_78;
          case 259:
            if ((v5 & 8) != 0)
            {
              uint64_t v10 = @"TAXI_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
            }
            else if ((v5 & 0x10) != 0)
            {
              uint64_t v10 = @"TAXI_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
            }
            else
            {
              uint64_t v10 = @"TAXI_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
            }
            goto LABEL_78;
          case 260:
            if ((v5 & 8) != 0)
            {
              uint64_t v10 = @"FERRY_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
            }
            else if ((v5 & 0x10) != 0)
            {
              uint64_t v10 = @"FERRY_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
            }
            else
            {
              uint64_t v10 = @"FERRY_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
            }
            goto LABEL_78;
          case 261:
            if ((v5 & 8) != 0)
            {
              uint64_t v10 = @"BIKE_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
            }
            else if ((v5 & 0x10) != 0)
            {
              uint64_t v10 = @"BIKE_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
            }
            else
            {
              uint64_t v10 = @"BIKE_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
            }
            goto LABEL_78;
          default:
            goto LABEL_82;
        }
    }
  }
  else
  {
    switch(a3)
    {
      case 513:
        v9 = @"DEPOSIT_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        goto LABEL_68;
      case 514:
        v9 = @"REFUND_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        goto LABEL_68;
      case 515:
        v9 = @"PURCHASE_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        goto LABEL_68;
      case 516:
        v9 = @"WITHDRAWAL_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        goto LABEL_68;
      case 517:
        v9 = @"CARDREAD_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        goto LABEL_68;
      case 518:
        goto LABEL_5;
      default:
        if (a3 == 1025)
        {
          if ((v5 & 8) != 0)
          {
            v9 = @"GREEN_CAR_TRANSACTION_FARE_ADJUSTMENT_AMOUNT_NOTIFICATION_FORMAT";
          }
          else if ((v5 & 0x10) != 0)
          {
            v9 = @"GREEN_CAR_TRANSACTION_FARE_REBATE_AMOUNT_NOTIFICATION_FORMAT";
          }
          else
          {
            v9 = @"GREEN_CAR_TRANSACTION_AMOUNT_NOTIFICATION_FORMAT";
          }
          goto LABEL_68;
        }
        if (a3 != 1026) {
          goto LABEL_82;
        }
        if ((v5 & 8) != 0)
        {
          uint64_t v10 = @"METRO_UPGRADE_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }
        else if ((v5 & 0x10) != 0)
        {
          uint64_t v10 = @"METRO_UPGRADE_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }
        else
        {
          uint64_t v10 = @"METRO_UPGRADE_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }
        break;
    }
LABEL_78:
    uint64_t v11 = PKLocalizedTransitString(&v10->isa);
LABEL_79:
    uint64_t v12 = (void *)v11;
    if (v11)
    {
      uint64_t v8 = PKStringWithValidatedFormat();
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
LABEL_82:

  return v8;
}

- (id)_titleStringForPass:(id)a3
{
  id v4 = a3;
  char v5 = [(PDPassPaymentTransactionUserNotification *)self paymentTransaction];
  id v6 = [v5 transitType];
  id v7 = [v5 transitModifiers];
  uint64_t v8 = [v5 amount];
  unsigned int v9 = [v5 isZeroTransaction];
  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (v8)
    {
      uint64_t v11 = [v5 formattedBalanceAdjustmentSubtotalAmount];
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = v11;
        uint64_t v12 = v13;
      }
      else
      {
        id v13 = [v5 formattedBalanceAdjustmentAmount];
      }
    }
    else
    {
      uint64_t v12 = [v4 paymentPass];
      id v13 = [v5 formattedStringForMultipleAmountsForPass:v12];
    }
    uint64_t v10 = v13;
  }
  if (self->_enrouteFlag)
  {
    uint64_t v14 = 0;
  }
  else
  {
    if ((v7 & 8) != 0) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = v9;
    }
    if (v15 != 1)
    {
      id v16 = v10;
      uint64_t v14 = [(PDPassTransitTransactionUserNotification *)self _amountTitleStringForSubtype:v6 transitModifiers:v7 amountString:v16];
      goto LABEL_17;
    }
    uint64_t v14 = [(PDPassTransitTransactionUserNotification *)self _zeroValueTitleStringForTransitSubtype:v6];
  }
  id v16 = 0;
LABEL_17:
  id v17 = v14;

  return v17;
}

- (BOOL)_shouldSuppressNotificationForPass:(id)a3
{
  id v4 = [a3 paymentPass];
  char v5 = [v4 devicePrimaryPaymentApplication];
  id v6 = [v5 paymentNetworkIdentifier];

  if (v6 == (id)131)
  {
    id v7 = [(PDPassPaymentTransactionUserNotification *)self paymentTransaction];
    if ([v7 isZeroTransaction]) {
      BOOL v8 = [v7 transitType] == (id)517;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_messageStringWithPass:(id)a3
{
  id v4 = a3;
  if ([v4 passType] == (id)1) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;
  id v7 = [(PDPassPaymentTransactionUserNotification *)self paymentTransaction];
  if (!self->_transitBalance && !self->_transitBalanceCurrencyCode)
  {
    BOOL v8 = +[PKTransitPassProperties passPropertiesForPass:v4];
    if ([v6 isEMoneyPass])
    {
      unsigned int v9 = [v8 balances];
      uint64_t v10 = [v9 firstObject];

      if (![v10 isCurrencyBalance])
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v11 = [v10 amount];
      transitBalance = self->_transitBalance;
      self->_transitBalance = v11;

      id v13 = [v10 currencyCode];
    }
    else
    {
      uint64_t v14 = [v8 balanceAmount];
      uint64_t v10 = v14;
      if (!v14)
      {
        v45 = [v8 balances];
        id v17 = [v45 firstObject];

        if ([v17 isCurrencyBalance])
        {
          v46 = [v17 amount];
          v47 = self->_transitBalance;
          self->_transitBalance = v46;

          v48 = [v17 currencyCode];
          transitBalanceCurrencyCode = self->_transitBalanceCurrencyCode;
          self->_transitBalanceCurrencyCode = v48;
        }
        goto LABEL_12;
      }
      unsigned int v15 = [v14 amount];
      id v16 = self->_transitBalance;
      self->_transitBalance = v15;

      id v13 = [v10 currency];
    }
    id v17 = self->_transitBalanceCurrencyCode;
    self->_transitBalanceCurrencyCode = v13;
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  if (!self->_transitBalanceCurrencyCode || !self->_transitBalance)
  {
    v26 = [(PDPassPaymentTransactionUserNotification *)self _locationString];
    goto LABEL_36;
  }
  uint64_t v18 = [v7 amount];

  v19 = &dispatch_get_global_queue_ptr;
  if (v18)
  {
    uint64_t v20 = [v7 amount];
    if (!self->_transitBalanceCurrencyCode)
    {
      v21 = [v7 currencyCode];
      v22 = self->_transitBalanceCurrencyCode;
      self->_transitBalanceCurrencyCode = v21;
    }
    if (!v20) {
      goto LABEL_34;
    }
  }
  else
  {
    id v51 = v6;
    id v52 = v4;
    uint64_t v20 = +[NSDecimalNumber zero];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v50 = v7;
    v27 = [v7 amounts];
    id v28 = [v27 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v54;
      do
      {
        v31 = 0;
        v32 = v20;
        do
        {
          if (*(void *)v54 != v30) {
            objc_enumerationMutation(v27);
          }
          v33 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)v31) amount];
          v34 = [v33 amount];

          uint64_t v20 = [v32 decimalNumberByAdding:v34];

          v31 = (char *)v31 + 1;
          v32 = v20;
        }
        while (v29 != v31);
        id v29 = [v27 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v29);
    }

    if (self->_transitBalanceCurrencyCode)
    {
      id v6 = v51;
      id v4 = v52;
      id v7 = v50;
    }
    else
    {
      id v7 = v50;
      v35 = [v50 amounts];
      v36 = [v35 firstObject];
      v37 = [v36 amount];
      v38 = [v37 currency];
      v39 = self->_transitBalanceCurrencyCode;
      self->_transitBalanceCurrencyCode = v38;

      id v6 = v51;
      id v4 = v52;
    }
    v19 = &dispatch_get_global_queue_ptr;
    if (!v20) {
      goto LABEL_34;
    }
  }
  objc_super v23 = [v19[482] zero];
  unsigned __int8 v24 = [v20 isEqualToNumber:v23];

  if (v24)
  {
LABEL_34:
    v25 = PKFormattedCurrencyStringFromNumber();
    PKLocalizedPaymentString(@"TRANSIT_NOTIFICATION_CURRENT_BALANCE_FORMAT", @"%@", v25);
    goto LABEL_35;
  }
  v25 = PKFormattedCurrencyStringFromNumber();
  PKLocalizedPaymentString(@"TRANSIT_NOTIFICATION_NEW_BALANCE_FORMAT", @"%@", v25);
  v26 = LABEL_35:;

LABEL_36:
  v40 = objc_msgSend(v7, "formattedTransitTransactionMessageForPass:suppressNoChargeAmount:", v6, objc_msgSend(v6, "shouldSuppressNoChargeAmount"));
  id v41 = v26;
  v42 = v41;
  id v43 = v41;
  if (v40)
  {
    if (v41)
    {
      id v43 = +[NSString stringWithFormat:@"%@\n%@", v40, v41];
    }
    else
    {
      id v43 = v40;
    }
  }

  return v43;
}

- (void)invalidateTransitBalance
{
  transitBalance = self->_transitBalance;
  self->_transitBalance = 0;

  transitBalanceCurrencyCode = self->_transitBalanceCurrencyCode;
  self->_transitBalanceCurrencyCode = 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PDPassTransitTransactionUserNotification;
  id v4 = a3;
  char v5 = [(PDPassPaymentTransactionUserNotification *)&v14 notificationContentWithDataSource:v4];
  id v6 = [(PDUserNotification *)self passUniqueIdentifier];
  id v7 = [v4 passWithUniqueIdentifier:v6];

  if ([(PDPassTransitTransactionUserNotification *)self _shouldSuppressNotificationForPass:v7])
  {
    id v8 = 0;
  }
  else
  {
    if (self->_enrouteFlag) {
      PKLocalizedTransitString(@"TRANSIT_ENROUTE_TRANSACTION_NOTIFICATION_TITLE");
    }
    else {
    unsigned int v9 = [(PDPassTransitTransactionUserNotification *)self _titleStringForPass:v7];
    }
    [v5 setSubtitle:v9];

    uint64_t v10 = [v5 body];
    id v11 = [v10 length];

    if (!v11)
    {
      uint64_t v12 = [(PDPassTransitTransactionUserNotification *)self _messageStringWithPass:v7];
      [v5 setBody:v12];
    }
    id v8 = v5;
  }

  return v8;
}

- (NSDecimalNumber)transitBalance
{
  return self->_transitBalance;
}

- (NSString)transitBalanceCurrencyCode
{
  return self->_transitBalanceCurrencyCode;
}

- (BOOL)enrouteFlag
{
  return self->_enrouteFlag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceCurrencyCode, 0);
  objc_storeStrong((id *)&self->_transitBalance, 0);
}

@end