@interface PKProtobufPaymentApplication
- (BOOL)auxiliary;
- (BOOL)hasApanIdentifier;
- (BOOL)hasApanSuffix;
- (BOOL)hasApplicationIdentifier;
- (BOOL)hasAuxiliary;
- (BOOL)hasAuxiliaryPaymentType;
- (BOOL)hasBalanceInAppPINRequiredAmount;
- (BOOL)hasCustomPrecisionInAppPINRequiredAmount;
- (BOOL)hasDisplayName;
- (BOOL)hasDpanIdentifier;
- (BOOL)hasDpanSuffix;
- (BOOL)hasInAppPINRequired;
- (BOOL)hasInAppPINRequiredAmount;
- (BOOL)hasInAppPINRequiredCurrency;
- (BOOL)hasInAppPriority;
- (BOOL)hasPaymentNetworkIdentifier;
- (BOOL)hasPaymentType;
- (BOOL)hasSanitizedDpan;
- (BOOL)hasSecureElementIdenfitier;
- (BOOL)hasState;
- (BOOL)hasSupportsContactlessPayment;
- (BOOL)hasSupportsInAppPayment;
- (BOOL)hasSupportsInstantFundsIn;
- (BOOL)hasSupportsMerchantTokens;
- (BOOL)hasSupportsMultiTokensV2;
- (BOOL)hasSuspendedReason;
- (BOOL)inAppPINRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsContactlessPayment;
- (BOOL)supportsInAppPayment;
- (BOOL)supportsInstantFundsIn;
- (BOOL)supportsMerchantTokens;
- (BOOL)supportsMultiTokensV2;
- (NSString)apanIdentifier;
- (NSString)apanSuffix;
- (NSString)applicationIdentifier;
- (NSString)displayName;
- (NSString)dpanIdentifier;
- (NSString)dpanSuffix;
- (NSString)inAppPINRequiredCurrency;
- (NSString)sanitizedDpan;
- (NSString)secureElementIdenfitier;
- (NSString)suspendedReason;
- (PKProtobufCustomPrecisionAmount)customPrecisionInAppPINRequiredAmount;
- (PKProtobufNSDecimalNumber)balanceInAppPINRequiredAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)inAppPINRequiredAmount;
- (int64_t)inAppPriority;
- (unint64_t)hash;
- (unsigned)auxiliaryPaymentType;
- (unsigned)paymentNetworkIdentifier;
- (unsigned)paymentType;
- (unsigned)state;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApanIdentifier:(id)a3;
- (void)setApanSuffix:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setAuxiliary:(BOOL)a3;
- (void)setAuxiliaryPaymentType:(unsigned int)a3;
- (void)setBalanceInAppPINRequiredAmount:(id)a3;
- (void)setCustomPrecisionInAppPINRequiredAmount:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDpanIdentifier:(id)a3;
- (void)setDpanSuffix:(id)a3;
- (void)setHasAuxiliary:(BOOL)a3;
- (void)setHasAuxiliaryPaymentType:(BOOL)a3;
- (void)setHasInAppPINRequired:(BOOL)a3;
- (void)setHasInAppPINRequiredAmount:(BOOL)a3;
- (void)setHasInAppPriority:(BOOL)a3;
- (void)setHasPaymentNetworkIdentifier:(BOOL)a3;
- (void)setHasPaymentType:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasSupportsContactlessPayment:(BOOL)a3;
- (void)setHasSupportsInAppPayment:(BOOL)a3;
- (void)setHasSupportsInstantFundsIn:(BOOL)a3;
- (void)setHasSupportsMerchantTokens:(BOOL)a3;
- (void)setHasSupportsMultiTokensV2:(BOOL)a3;
- (void)setInAppPINRequired:(BOOL)a3;
- (void)setInAppPINRequiredAmount:(int64_t)a3;
- (void)setInAppPINRequiredCurrency:(id)a3;
- (void)setInAppPriority:(int64_t)a3;
- (void)setPaymentNetworkIdentifier:(unsigned int)a3;
- (void)setPaymentType:(unsigned int)a3;
- (void)setSanitizedDpan:(id)a3;
- (void)setSecureElementIdenfitier:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setSupportsContactlessPayment:(BOOL)a3;
- (void)setSupportsInAppPayment:(BOOL)a3;
- (void)setSupportsInstantFundsIn:(BOOL)a3;
- (void)setSupportsMerchantTokens:(BOOL)a3;
- (void)setSupportsMultiTokensV2:(BOOL)a3;
- (void)setSuspendedReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentApplication

- (BOOL)hasDpanIdentifier
{
  return self->_dpanIdentifier != 0;
}

- (BOOL)hasDpanSuffix
{
  return self->_dpanSuffix != 0;
}

- (BOOL)hasSanitizedDpan
{
  return self->_sanitizedDpan != 0;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (BOOL)hasSecureElementIdenfitier
{
  return self->_secureElementIdenfitier != 0;
}

- (void)setState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasSuspendedReason
{
  return self->_suspendedReason != 0;
}

- (void)setSupportsContactlessPayment:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_supportsContactlessPayment = a3;
}

- (void)setHasSupportsContactlessPayment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSupportsContactlessPayment
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSupportsInAppPayment:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_supportsInAppPayment = a3;
}

- (void)setHasSupportsInAppPayment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSupportsInAppPayment
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPaymentNetworkIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_paymentNetworkIdentifier = a3;
}

- (void)setHasPaymentNetworkIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPaymentNetworkIdentifier
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setInAppPINRequired:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_inAppPINRequired = a3;
}

- (void)setHasInAppPINRequired:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasInAppPINRequired
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setInAppPINRequiredAmount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_inAppPINRequiredAmount = a3;
}

- (void)setHasInAppPINRequiredAmount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasInAppPINRequiredAmount
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasInAppPINRequiredCurrency
{
  return self->_inAppPINRequiredCurrency != 0;
}

- (void)setPaymentType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPaymentType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setAuxiliary:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_auxiliary = a3;
}

- (void)setHasAuxiliary:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAuxiliary
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setInAppPriority:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_inAppPriority = a3;
}

- (void)setHasInAppPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasInAppPriority
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAuxiliaryPaymentType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_auxiliaryPaymentType = a3;
}

- (void)setHasAuxiliaryPaymentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAuxiliaryPaymentType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasApanIdentifier
{
  return self->_apanIdentifier != 0;
}

- (BOOL)hasApanSuffix
{
  return self->_apanSuffix != 0;
}

- (void)setSupportsMerchantTokens:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_supportsMerchantTokens = a3;
}

- (void)setHasSupportsMerchantTokens:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSupportsMerchantTokens
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasCustomPrecisionInAppPINRequiredAmount
{
  return self->_customPrecisionInAppPINRequiredAmount != 0;
}

- (BOOL)hasBalanceInAppPINRequiredAmount
{
  return self->_balanceInAppPINRequiredAmount != 0;
}

- (void)setSupportsMultiTokensV2:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_supportsMultiTokensV2 = a3;
}

- (void)setHasSupportsMultiTokensV2:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSupportsMultiTokensV2
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSupportsInstantFundsIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_supportsInstantFundsIn = a3;
}

- (void)setHasSupportsInstantFundsIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSupportsInstantFundsIn
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentApplication;
  v4 = [(PKProtobufPaymentApplication *)&v8 description];
  v5 = [(PKProtobufPaymentApplication *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  dpanIdentifier = self->_dpanIdentifier;
  if (dpanIdentifier) {
    [v3 setObject:dpanIdentifier forKey:@"dpanIdentifier"];
  }
  dpanSuffix = self->_dpanSuffix;
  if (dpanSuffix) {
    [v4 setObject:dpanSuffix forKey:@"dpanSuffix"];
  }
  sanitizedDpan = self->_sanitizedDpan;
  if (sanitizedDpan) {
    [v4 setObject:sanitizedDpan forKey:@"sanitizedDpan"];
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier) {
    [v4 setObject:applicationIdentifier forKey:@"applicationIdentifier"];
  }
  secureElementIdenfitier = self->_secureElementIdenfitier;
  if (secureElementIdenfitier) {
    [v4 setObject:secureElementIdenfitier forKey:@"secureElementIdenfitier"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_state];
    [v4 setObject:v10 forKey:@"state"];
  }
  suspendedReason = self->_suspendedReason;
  if (suspendedReason) {
    [v4 setObject:suspendedReason forKey:@"suspendedReason"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v30 = [NSNumber numberWithBool:self->_supportsContactlessPayment];
    [v4 setObject:v30 forKey:@"supportsContactlessPayment"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  v31 = [NSNumber numberWithBool:self->_supportsInAppPayment];
  [v4 setObject:v31 forKey:@"supportsInAppPayment"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  v32 = [NSNumber numberWithUnsignedInt:self->_paymentNetworkIdentifier];
  [v4 setObject:v32 forKey:@"paymentNetworkIdentifier"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_51:
  v33 = [NSNumber numberWithBool:self->_inAppPINRequired];
  [v4 setObject:v33 forKey:@"inAppPINRequired"];

  if (*(_WORD *)&self->_has)
  {
LABEL_20:
    v13 = [NSNumber numberWithLongLong:self->_inAppPINRequiredAmount];
    [v4 setObject:v13 forKey:@"inAppPINRequiredAmount"];
  }
LABEL_21:
  inAppPINRequiredCurrency = self->_inAppPINRequiredCurrency;
  if (inAppPINRequiredCurrency) {
    [v4 setObject:inAppPINRequiredCurrency forKey:@"inAppPINRequiredCurrency"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_paymentType];
    [v4 setObject:v15 forKey:@"paymentType"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x40) != 0)
  {
    v34 = [NSNumber numberWithBool:self->_auxiliary];
    [v4 setObject:v34 forKey:@"auxiliary"];

    __int16 v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_29:
      if ((v17 & 4) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_29;
  }
  v35 = [NSNumber numberWithLongLong:self->_inAppPriority];
  [v4 setObject:v35 forKey:@"inAppPriority"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_30:
    v18 = [NSNumber numberWithUnsignedInt:self->_auxiliaryPaymentType];
    [v4 setObject:v18 forKey:@"auxiliaryPaymentType"];
  }
LABEL_31:
  apanIdentifier = self->_apanIdentifier;
  if (apanIdentifier) {
    [v4 setObject:apanIdentifier forKey:@"apanIdentifier"];
  }
  apanSuffix = self->_apanSuffix;
  if (apanSuffix) {
    [v4 setObject:apanSuffix forKey:@"apanSuffix"];
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_supportsMerchantTokens];
    [v4 setObject:v21 forKey:@"supportsMerchantTokens"];
  }
  customPrecisionInAppPINRequiredAmount = self->_customPrecisionInAppPINRequiredAmount;
  if (customPrecisionInAppPINRequiredAmount)
  {
    v23 = [(PKProtobufCustomPrecisionAmount *)customPrecisionInAppPINRequiredAmount dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"customPrecisionInAppPINRequiredAmount"];
  }
  balanceInAppPINRequiredAmount = self->_balanceInAppPINRequiredAmount;
  if (balanceInAppPINRequiredAmount)
  {
    v25 = [(PKProtobufNSDecimalNumber *)balanceInAppPINRequiredAmount dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"balanceInAppPINRequiredAmount"];
  }
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x1000) != 0)
  {
    v27 = [NSNumber numberWithBool:self->_supportsMultiTokensV2];
    [v4 setObject:v27 forKey:@"supportsMultiTokensV2"];

    __int16 v26 = (__int16)self->_has;
  }
  if ((v26 & 0x400) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_supportsInstantFundsIn];
    [v4 setObject:v28 forKey:@"supportsInstantFundsIn"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentApplicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_dpanIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_dpanSuffix)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sanitizedDpan)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_applicationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_secureElementIdenfitier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_suspendedReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if (*(_WORD *)&self->_has)
  {
LABEL_20:
    PBDataWriterWriteSint64Field();
    id v4 = v7;
  }
LABEL_21:
  if (self->_inAppPINRequiredCurrency)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_29:
      if ((v6 & 4) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteSint64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_30:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_31:
  if (self->_apanIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_apanSuffix)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_customPrecisionInAppPINRequiredAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_balanceInAppPINRequiredAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_dpanIdentifier)
  {
    objc_msgSend(v4, "setDpanIdentifier:");
    id v4 = v7;
  }
  if (self->_dpanSuffix)
  {
    objc_msgSend(v7, "setDpanSuffix:");
    id v4 = v7;
  }
  if (self->_sanitizedDpan)
  {
    objc_msgSend(v7, "setSanitizedDpan:");
    id v4 = v7;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v7, "setApplicationIdentifier:");
    id v4 = v7;
  }
  if (self->_secureElementIdenfitier)
  {
    objc_msgSend(v7, "setSecureElementIdenfitier:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_state;
    *((_WORD *)v4 + 76) |= 0x20u;
  }
  if (self->_suspendedReason)
  {
    objc_msgSend(v7, "setSuspendedReason:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((unsigned char *)v4 + 146) = self->_supportsContactlessPayment;
    *((_WORD *)v4 + 76) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v4 + 147) = self->_supportsInAppPayment;
  *((_WORD *)v4 + 76) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 26) = self->_paymentNetworkIdentifier;
  *((_WORD *)v4 + 76) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_51:
  *((unsigned char *)v4 + 145) = self->_inAppPINRequired;
  *((_WORD *)v4 + 76) |= 0x80u;
  if (*(_WORD *)&self->_has)
  {
LABEL_20:
    *((void *)v4 + 1) = self->_inAppPINRequiredAmount;
    *((_WORD *)v4 + 76) |= 1u;
  }
LABEL_21:
  if (self->_inAppPINRequiredCurrency)
  {
    objc_msgSend(v7, "setInAppPINRequiredCurrency:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 27) = self->_paymentType;
    *((_WORD *)v4 + 76) |= 0x10u;
  }
  if (self->_displayName)
  {
    objc_msgSend(v7, "setDisplayName:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((unsigned char *)v4 + 144) = self->_auxiliary;
    *((_WORD *)v4 + 76) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_29:
      if ((v6 & 4) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_29;
  }
  *((void *)v4 + 2) = self->_inAppPriority;
  *((_WORD *)v4 + 76) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_30:
    *((_DWORD *)v4 + 12) = self->_auxiliaryPaymentType;
    *((_WORD *)v4 + 76) |= 4u;
  }
LABEL_31:
  if (self->_apanIdentifier)
  {
    objc_msgSend(v7, "setApanIdentifier:");
    id v4 = v7;
  }
  if (self->_apanSuffix)
  {
    objc_msgSend(v7, "setApanSuffix:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((unsigned char *)v4 + 149) = self->_supportsMerchantTokens;
    *((_WORD *)v4 + 76) |= 0x800u;
  }
  if (self->_customPrecisionInAppPINRequiredAmount)
  {
    objc_msgSend(v7, "setCustomPrecisionInAppPINRequiredAmount:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *((unsigned char *)v4 + 150) = self->_supportsMultiTokensV2;
    *((_WORD *)v4 + 76) |= 0x1000u;
  }
  if (self->_balanceInAppPINRequiredAmount)
  {
    objc_msgSend(v7, "setBalanceInAppPINRequiredAmount:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((unsigned char *)v4 + 148) = self->_supportsInstantFundsIn;
    *((_WORD *)v4 + 76) |= 0x400u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_dpanIdentifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_dpanSuffix copyWithZone:a3];
  v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_sanitizedDpan copyWithZone:a3];
  v11 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v10;

  uint64_t v12 = [(NSString *)self->_applicationIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_secureElementIdenfitier copyWithZone:a3];
  v15 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v14;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_state;
    *(_WORD *)(v5 + 152) |= 0x20u;
  }
  uint64_t v16 = [(NSString *)self->_suspendedReason copyWithZone:a3];
  __int16 v17 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v16;

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 146) = self->_supportsContactlessPayment;
    *(_WORD *)(v5 + 152) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 147) = self->_supportsInAppPayment;
  *(_WORD *)(v5 + 152) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 104) = self->_paymentNetworkIdentifier;
  *(_WORD *)(v5 + 152) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_25:
  *(unsigned char *)(v5 + 145) = self->_inAppPINRequired;
  *(_WORD *)(v5 + 152) |= 0x80u;
  if (*(_WORD *)&self->_has)
  {
LABEL_8:
    *(void *)(v5 + 8) = self->_inAppPINRequiredAmount;
    *(_WORD *)(v5 + 152) |= 1u;
  }
LABEL_9:
  uint64_t v19 = [(NSString *)self->_inAppPINRequiredCurrency copyWithZone:a3];
  v20 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v19;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_paymentType;
    *(_WORD *)(v5 + 152) |= 0x10u;
  }
  uint64_t v21 = [(NSString *)self->_displayName copyWithZone:a3];
  v22 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v21;

  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 144) = self->_auxiliary;
    *(_WORD *)(v5 + 152) |= 0x40u;
    __int16 v23 = (__int16)self->_has;
    if ((v23 & 2) == 0)
    {
LABEL_13:
      if ((v23 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_13;
  }
  *(void *)(v5 + 16) = self->_inAppPriority;
  *(_WORD *)(v5 + 152) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 48) = self->_auxiliaryPaymentType;
    *(_WORD *)(v5 + 152) |= 4u;
  }
LABEL_15:
  uint64_t v24 = [(NSString *)self->_apanIdentifier copyWithZone:a3];
  v25 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v24;

  uint64_t v26 = [(NSString *)self->_apanSuffix copyWithZone:a3];
  v27 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v26;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 149) = self->_supportsMerchantTokens;
    *(_WORD *)(v5 + 152) |= 0x800u;
  }
  id v28 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionInAppPINRequiredAmount copyWithZone:a3];
  v29 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v28;

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 150) = self->_supportsMultiTokensV2;
    *(_WORD *)(v5 + 152) |= 0x1000u;
  }
  id v30 = [(PKProtobufNSDecimalNumber *)self->_balanceInAppPINRequiredAmount copyWithZone:a3];
  v31 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v30;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 148) = self->_supportsInstantFundsIn;
    *(_WORD *)(v5 + 152) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_112;
  }
  dpanIdentifier = self->_dpanIdentifier;
  if ((unint64_t)dpanIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](dpanIdentifier, "isEqual:")) {
      goto LABEL_112;
    }
  }
  dpanSuffix = self->_dpanSuffix;
  if ((unint64_t)dpanSuffix | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](dpanSuffix, "isEqual:")) {
      goto LABEL_112;
    }
  }
  sanitizedDpan = self->_sanitizedDpan;
  if ((unint64_t)sanitizedDpan | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](sanitizedDpan, "isEqual:")) {
      goto LABEL_112;
    }
  }
  applicationIdentifier = self->_applicationIdentifier;
  if ((unint64_t)applicationIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](applicationIdentifier, "isEqual:")) {
      goto LABEL_112;
    }
  }
  secureElementIdenfitier = self->_secureElementIdenfitier;
  if ((unint64_t)secureElementIdenfitier | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](secureElementIdenfitier, "isEqual:")) {
      goto LABEL_112;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 76);
  if ((has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_state != *((_DWORD *)v4 + 32)) {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_112;
  }
  suspendedReason = self->_suspendedReason;
  if ((unint64_t)suspendedReason | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](suspendedReason, "isEqual:")) {
      goto LABEL_112;
    }
    __int16 has = (__int16)self->_has;
    __int16 v11 = *((_WORD *)v4 + 76);
  }
  if ((has & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0) {
      goto LABEL_112;
    }
    if (self->_supportsContactlessPayment)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_112;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0) {
      goto LABEL_112;
    }
    if (self->_supportsInAppPayment)
    {
      if (!*((unsigned char *)v4 + 147)) {
        goto LABEL_112;
      }
    }
    else if (*((unsigned char *)v4 + 147))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_paymentNetworkIdentifier != *((_DWORD *)v4 + 26)) {
      goto LABEL_112;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_112;
    }
    if (self->_inAppPINRequired)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_112;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_112;
  }
  if (has)
  {
    if ((v11 & 1) == 0 || self->_inAppPINRequiredAmount != *((void *)v4 + 1)) {
      goto LABEL_112;
    }
  }
  else if (v11)
  {
    goto LABEL_112;
  }
  inAppPINRequiredCurrency = self->_inAppPINRequiredCurrency;
  if ((unint64_t)inAppPINRequiredCurrency | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](inAppPINRequiredCurrency, "isEqual:")) {
      goto LABEL_112;
    }
    __int16 has = (__int16)self->_has;
    __int16 v11 = *((_WORD *)v4 + 76);
  }
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_paymentType != *((_DWORD *)v4 + 27)) {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_112;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_112;
    }
    __int16 has = (__int16)self->_has;
    __int16 v11 = *((_WORD *)v4 + 76);
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0) {
      goto LABEL_112;
    }
    if (self->_auxiliary)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_112;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_inAppPriority != *((void *)v4 + 2)) {
      goto LABEL_112;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_auxiliaryPaymentType != *((_DWORD *)v4 + 12)) {
      goto LABEL_112;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_112;
  }
  apanIdentifier = self->_apanIdentifier;
  if ((unint64_t)apanIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](apanIdentifier, "isEqual:"))
  {
    goto LABEL_112;
  }
  apanSuffix = self->_apanSuffix;
  if ((unint64_t)apanSuffix | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](apanSuffix, "isEqual:")) {
      goto LABEL_112;
    }
  }
  __int16 v17 = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 76);
  if ((v17 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 76) & 0x800) == 0) {
      goto LABEL_112;
    }
    if (self->_supportsMerchantTokens)
    {
      if (!*((unsigned char *)v4 + 149)) {
        goto LABEL_112;
      }
    }
    else if (*((unsigned char *)v4 + 149))
    {
      goto LABEL_112;
    }
  }
  else if ((*((_WORD *)v4 + 76) & 0x800) != 0)
  {
    goto LABEL_112;
  }
  customPrecisionInAppPINRequiredAmount = self->_customPrecisionInAppPINRequiredAmount;
  if ((unint64_t)customPrecisionInAppPINRequiredAmount | *((void *)v4 + 8))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionInAppPINRequiredAmount, "isEqual:")) {
      goto LABEL_112;
    }
    __int16 v17 = (__int16)self->_has;
    __int16 v18 = *((_WORD *)v4 + 76);
  }
  if ((v17 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0) {
      goto LABEL_112;
    }
    if (self->_supportsMultiTokensV2)
    {
      if (!*((unsigned char *)v4 + 150)) {
        goto LABEL_112;
      }
    }
    else if (*((unsigned char *)v4 + 150))
    {
      goto LABEL_112;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_112;
  }
  balanceInAppPINRequiredAmount = self->_balanceInAppPINRequiredAmount;
  if ((unint64_t)balanceInAppPINRequiredAmount | *((void *)v4 + 7))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](balanceInAppPINRequiredAmount, "isEqual:")) {
      goto LABEL_112;
    }
    __int16 v17 = (__int16)self->_has;
    __int16 v18 = *((_WORD *)v4 + 76);
  }
  if ((v17 & 0x400) != 0)
  {
    if ((v18 & 0x400) != 0)
    {
      if (self->_supportsInstantFundsIn)
      {
        if (!*((unsigned char *)v4 + 148)) {
          goto LABEL_112;
        }
      }
      else if (*((unsigned char *)v4 + 148))
      {
        goto LABEL_112;
      }
      BOOL v21 = 1;
      goto LABEL_113;
    }
LABEL_112:
    BOOL v21 = 0;
    goto LABEL_113;
  }
  BOOL v21 = (v18 & 0x400) == 0;
LABEL_113:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v31 = [(NSString *)self->_dpanIdentifier hash];
  NSUInteger v30 = [(NSString *)self->_dpanSuffix hash];
  NSUInteger v29 = [(NSString *)self->_sanitizedDpan hash];
  NSUInteger v28 = [(NSString *)self->_applicationIdentifier hash];
  NSUInteger v27 = [(NSString *)self->_secureElementIdenfitier hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v26 = 2654435761 * self->_state;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_suspendedReason hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v24 = 2654435761 * self->_supportsContactlessPayment;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      uint64_t v23 = 2654435761 * self->_supportsInAppPayment;
      if ((has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v23 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v22 = 2654435761 * self->_paymentNetworkIdentifier;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v21 = 0;
    if (has) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v22 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = 2654435761 * self->_inAppPINRequired;
  if (has)
  {
LABEL_9:
    uint64_t v20 = 2654435761 * self->_inAppPINRequiredAmount;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v20 = 0;
LABEL_15:
  NSUInteger v19 = [(NSString *)self->_inAppPINRequiredCurrency hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v18 = 2654435761 * self->_paymentType;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_displayName hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x40) == 0)
  {
    uint64_t v15 = 0;
    if ((v4 & 2) != 0) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v5 = 0;
    if ((v4 & 4) != 0) {
      goto LABEL_21;
    }
    goto LABEL_24;
  }
  uint64_t v15 = 2654435761 * self->_auxiliary;
  if ((v4 & 2) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v5 = 2654435761 * self->_inAppPriority;
  if ((v4 & 4) != 0)
  {
LABEL_21:
    uint64_t v6 = 2654435761 * self->_auxiliaryPaymentType;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
LABEL_25:
  NSUInteger v7 = [(NSString *)self->_apanIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_apanSuffix hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v9 = 2654435761 * self->_supportsMerchantTokens;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionInAppPINRequiredAmount hash];
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    uint64_t v11 = 2654435761 * self->_supportsMultiTokensV2;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(PKProtobufNSDecimalNumber *)self->_balanceInAppPINRequiredAmount hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v13 = 2654435761 * self->_supportsInstantFundsIn;
  }
  else {
    uint64_t v13 = 0;
  }
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (*((void *)v4 + 10))
  {
    -[PKProtobufPaymentApplication setDpanIdentifier:](self, "setDpanIdentifier:");
    id v4 = v11;
  }
  if (*((void *)v4 + 11))
  {
    -[PKProtobufPaymentApplication setDpanSuffix:](self, "setDpanSuffix:");
    id v4 = v11;
  }
  if (*((void *)v4 + 14))
  {
    -[PKProtobufPaymentApplication setSanitizedDpan:](self, "setSanitizedDpan:");
    id v4 = v11;
  }
  if (*((void *)v4 + 5))
  {
    -[PKProtobufPaymentApplication setApplicationIdentifier:](self, "setApplicationIdentifier:");
    id v4 = v11;
  }
  if (*((void *)v4 + 15))
  {
    -[PKProtobufPaymentApplication setSecureElementIdenfitier:](self, "setSecureElementIdenfitier:");
    id v4 = v11;
  }
  if ((*((_WORD *)v4 + 76) & 0x20) != 0)
  {
    self->_state = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 17))
  {
    -[PKProtobufPaymentApplication setSuspendedReason:](self, "setSuspendedReason:");
    id v4 = v11;
  }
  __int16 v5 = *((_WORD *)v4 + 76);
  if ((v5 & 0x100) != 0)
  {
    self->_supportsContactlessPayment = *((unsigned char *)v4 + 146);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 76);
    if ((v5 & 0x200) == 0)
    {
LABEL_17:
      if ((v5 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_42;
    }
  }
  else if ((*((_WORD *)v4 + 76) & 0x200) == 0)
  {
    goto LABEL_17;
  }
  self->_supportsInAppPayment = *((unsigned char *)v4 + 147);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 76);
  if ((v5 & 8) == 0)
  {
LABEL_18:
    if ((v5 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_paymentNetworkIdentifier = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 76);
  if ((v5 & 0x80) == 0)
  {
LABEL_19:
    if ((v5 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_43:
  self->_inAppPINRequired = *((unsigned char *)v4 + 145);
  *(_WORD *)&self->_has |= 0x80u;
  if (*((_WORD *)v4 + 76))
  {
LABEL_20:
    self->_inAppPINRequiredAmount = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_21:
  if (*((void *)v4 + 12))
  {
    -[PKProtobufPaymentApplication setInAppPINRequiredCurrency:](self, "setInAppPINRequiredCurrency:");
    id v4 = v11;
  }
  if ((*((_WORD *)v4 + 76) & 0x10) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 9))
  {
    -[PKProtobufPaymentApplication setDisplayName:](self, "setDisplayName:");
    id v4 = v11;
  }
  __int16 v6 = *((_WORD *)v4 + 76);
  if ((v6 & 0x40) != 0)
  {
    self->_auxiliary = *((unsigned char *)v4 + 144);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 76);
    if ((v6 & 2) == 0)
    {
LABEL_29:
      if ((v6 & 4) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_29;
  }
  self->_inAppPriority = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 76) & 4) != 0)
  {
LABEL_30:
    self->_auxiliaryPaymentType = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_31:
  if (*((void *)v4 + 3))
  {
    -[PKProtobufPaymentApplication setApanIdentifier:](self, "setApanIdentifier:");
    id v4 = v11;
  }
  if (*((void *)v4 + 4))
  {
    -[PKProtobufPaymentApplication setApanSuffix:](self, "setApanSuffix:");
    id v4 = v11;
  }
  if ((*((_WORD *)v4 + 76) & 0x800) != 0)
  {
    self->_supportsMerchantTokens = *((unsigned char *)v4 + 149);
    *(_WORD *)&self->_has |= 0x800u;
  }
  customPrecisionInAppPINRequiredAmount = self->_customPrecisionInAppPINRequiredAmount;
  uint64_t v8 = *((void *)v4 + 8);
  if (customPrecisionInAppPINRequiredAmount)
  {
    if (!v8) {
      goto LABEL_51;
    }
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionInAppPINRequiredAmount, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_51;
    }
    -[PKProtobufPaymentApplication setCustomPrecisionInAppPINRequiredAmount:](self, "setCustomPrecisionInAppPINRequiredAmount:");
  }
  id v4 = v11;
LABEL_51:
  if ((*((_WORD *)v4 + 76) & 0x1000) != 0)
  {
    self->_supportsMultiTokensV2 = *((unsigned char *)v4 + 150);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  balanceInAppPINRequiredAmount = self->_balanceInAppPINRequiredAmount;
  uint64_t v10 = *((void *)v4 + 7);
  if (balanceInAppPINRequiredAmount)
  {
    if (!v10) {
      goto LABEL_59;
    }
    -[PKProtobufNSDecimalNumber mergeFrom:](balanceInAppPINRequiredAmount, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_59;
    }
    -[PKProtobufPaymentApplication setBalanceInAppPINRequiredAmount:](self, "setBalanceInAppPINRequiredAmount:");
  }
  id v4 = v11;
LABEL_59:
  if ((*((_WORD *)v4 + 76) & 0x400) != 0)
  {
    self->_supportsInstantFundsIn = *((unsigned char *)v4 + 148);
    *(_WORD *)&self->_has |= 0x400u;
  }
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSString)dpanSuffix
{
  return self->_dpanSuffix;
}

- (void)setDpanSuffix:(id)a3
{
}

- (NSString)sanitizedDpan
{
  return self->_sanitizedDpan;
}

- (void)setSanitizedDpan:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)secureElementIdenfitier
{
  return self->_secureElementIdenfitier;
}

- (void)setSecureElementIdenfitier:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (NSString)suspendedReason
{
  return self->_suspendedReason;
}

- (void)setSuspendedReason:(id)a3
{
}

- (BOOL)supportsContactlessPayment
{
  return self->_supportsContactlessPayment;
}

- (BOOL)supportsInAppPayment
{
  return self->_supportsInAppPayment;
}

- (unsigned)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (BOOL)inAppPINRequired
{
  return self->_inAppPINRequired;
}

- (int64_t)inAppPINRequiredAmount
{
  return self->_inAppPINRequiredAmount;
}

- (NSString)inAppPINRequiredCurrency
{
  return self->_inAppPINRequiredCurrency;
}

- (void)setInAppPINRequiredCurrency:(id)a3
{
}

- (unsigned)paymentType
{
  return self->_paymentType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)auxiliary
{
  return self->_auxiliary;
}

- (int64_t)inAppPriority
{
  return self->_inAppPriority;
}

- (unsigned)auxiliaryPaymentType
{
  return self->_auxiliaryPaymentType;
}

- (NSString)apanIdentifier
{
  return self->_apanIdentifier;
}

- (void)setApanIdentifier:(id)a3
{
}

- (NSString)apanSuffix
{
  return self->_apanSuffix;
}

- (void)setApanSuffix:(id)a3
{
}

- (BOOL)supportsMerchantTokens
{
  return self->_supportsMerchantTokens;
}

- (PKProtobufCustomPrecisionAmount)customPrecisionInAppPINRequiredAmount
{
  return self->_customPrecisionInAppPINRequiredAmount;
}

- (void)setCustomPrecisionInAppPINRequiredAmount:(id)a3
{
}

- (PKProtobufNSDecimalNumber)balanceInAppPINRequiredAmount
{
  return self->_balanceInAppPINRequiredAmount;
}

- (void)setBalanceInAppPINRequiredAmount:(id)a3
{
}

- (BOOL)supportsMultiTokensV2
{
  return self->_supportsMultiTokensV2;
}

- (BOOL)supportsInstantFundsIn
{
  return self->_supportsInstantFundsIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedReason, 0);
  objc_storeStrong((id *)&self->_secureElementIdenfitier, 0);
  objc_storeStrong((id *)&self->_sanitizedDpan, 0);
  objc_storeStrong((id *)&self->_inAppPINRequiredCurrency, 0);
  objc_storeStrong((id *)&self->_dpanSuffix, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_customPrecisionInAppPINRequiredAmount, 0);
  objc_storeStrong((id *)&self->_balanceInAppPINRequiredAmount, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_apanSuffix, 0);
  objc_storeStrong((id *)&self->_apanIdentifier, 0);
}

@end