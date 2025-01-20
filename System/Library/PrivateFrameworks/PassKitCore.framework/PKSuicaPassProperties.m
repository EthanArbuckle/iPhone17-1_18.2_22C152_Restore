@interface PKSuicaPassProperties
+ (Class)equalityClass;
+ (PKSuicaPassProperties)passPropertiesForPass:(PKPass *)pass;
- (BOOL)isBalanceAllowedForCommute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGreenCarTicketUsed;
- (BOOL)isInShinkansenStation;
- (BOOL)isInStation;
- (BOOL)isLowBalanceGateNotificationEnabled;
- (id)_initWithProperties:(id)a3;
- (unint64_t)hash;
@end

@implementation PKSuicaPassProperties

+ (PKSuicaPassProperties)passPropertiesForPass:(PKPass *)pass
{
  v4 = pass;
  v5 = [(PKPass *)v4 paymentPass];
  v6 = [v5 devicePrimaryPaymentApplication];
  uint64_t v7 = [v6 paymentNetworkIdentifier];

  if (v7 == 103)
  {
    id v8 = objc_alloc((Class)a1);
    v9 = +[PKFelicaPassProperties passPropertiesForPass:v4];
    v10 = (void *)[v8 _initWithProperties:v9];
  }
  else
  {
    v10 = 0;
  }

  return (PKSuicaPassProperties *)v10;
}

- (id)_initWithProperties:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSuicaPassProperties;
  v5 = [(PKSuicaPassProperties *)&v15 init];
  if (v5)
  {
    v6 = [v4 balance];
    uint64_t v7 = v6;
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28C28] zero];
    }
    id v8 = [v4 balanceAmount];
    uint64_t v9 = [v8 currency];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = @"JPY";
    }
    v12 = PKCurrencyAmountCreate(v7, &v11->isa, 0);
    [(PKStoredValuePassProperties *)v5 setBalanceAmount:v12];

    if (!v6) {
    -[PKStoredValuePassProperties setBlocked:](v5, "setBlocked:", [v4 isBlocked]);
    }
    v13 = [v4 enrouteTransitTypes];
    [(PKStoredValuePassProperties *)v5 setEnrouteTransitTypes:v13];

    v5->_greenCarTicketUsed = [v4 isGreenCarTicketUsed];
    v5->_balanceAllowedForCommute = [v4 isBalanceAllowedForCommute];
    v5->_lowBalanceGateNotificationEnabled = [v4 isLowBalanceGateNotificationEnabled];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKSuicaPassProperties;
  if ([(PKStoredValuePassProperties *)&v8 isEqual:v4])
  {
    v5 = (unsigned __int8 *)v4;
    BOOL v6 = self->_greenCarTicketUsed == v5[66]
      && self->_balanceAllowedForCommute == v5[64]
      && self->_lowBalanceGateNotificationEnabled == v5[65];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PKSuicaPassProperties;
  unint64_t v3 = [(PKStoredValuePassProperties *)&v7 hash];
  uint64_t v4 = self->_greenCarTicketUsed - v3 + 32 * v3;
  uint64_t v5 = self->_balanceAllowedForCommute - v4 + 32 * v4;
  return self->_lowBalanceGateNotificationEnabled - v5 + 32 * v5;
}

+ (Class)equalityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInShinkansenStation
{
  v2 = [(PKStoredValuePassProperties *)self enrouteTransitTypes];
  char v3 = [v2 containsObject:@"TransitTrainShinkansen"];

  return v3;
}

- (BOOL)isInStation
{
  v2 = [(PKStoredValuePassProperties *)self enrouteTransitTypes];
  char v3 = [v2 containsObject:@"Transit"];

  return v3;
}

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (BOOL)isLowBalanceGateNotificationEnabled
{
  return self->_lowBalanceGateNotificationEnabled;
}

- (BOOL)isGreenCarTicketUsed
{
  return self->_greenCarTicketUsed;
}

@end