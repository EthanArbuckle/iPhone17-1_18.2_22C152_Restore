@interface PKProtobufPaymentInstrument
+ (Class)associatedWebDomainsType;
+ (Class)paymentApplicationsType;
- (BOOL)cobranded;
- (BOOL)hasAssociatedAccountFeatureIdentifier;
- (BOOL)hasAssociatedPeerPaymentAccount;
- (BOOL)hasCobrandName;
- (BOOL)hasCobranded;
- (BOOL)hasCustomPrecisionPeerPaymentAccountBalance;
- (BOOL)hasDecimalAccountBalance;
- (BOOL)hasDisplayName;
- (BOOL)hasHasAssociatedPeerPaymentAccount;
- (BOOL)hasIngestedDate;
- (BOOL)hasIssuerCountryCode;
- (BOOL)hasManifestHash;
- (BOOL)hasOrganizationName;
- (BOOL)hasPassID;
- (BOOL)hasPeerPaymentAccountBalance;
- (BOOL)hasPeerPaymentAccountCurrency;
- (BOOL)hasPeerPaymentAccountState;
- (BOOL)hasPrimaryAccountIdentifier;
- (BOOL)hasPrimaryAccountNumberSuffix;
- (BOOL)hasSupportsAutomaticSelection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAutomaticSelection;
- (NSData)manifestHash;
- (NSMutableArray)associatedWebDomains;
- (NSMutableArray)paymentApplications;
- (NSString)cobrandName;
- (NSString)displayName;
- (NSString)issuerCountryCode;
- (NSString)organizationName;
- (NSString)passID;
- (NSString)peerPaymentAccountCurrency;
- (NSString)primaryAccountIdentifier;
- (NSString)primaryAccountNumberSuffix;
- (PKProtobufCustomPrecisionAmount)customPrecisionPeerPaymentAccountBalance;
- (PKProtobufNSDecimalNumber)decimalAccountBalance;
- (double)ingestedDate;
- (id)associatedWebDomainsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paymentApplicationsAtIndex:(unint64_t)a3;
- (int64_t)peerPaymentAccountBalance;
- (unint64_t)associatedWebDomainsCount;
- (unint64_t)hash;
- (unint64_t)paymentApplicationsCount;
- (unsigned)associatedAccountFeatureIdentifier;
- (unsigned)peerPaymentAccountState;
- (void)addAssociatedWebDomains:(id)a3;
- (void)addPaymentApplications:(id)a3;
- (void)clearAssociatedWebDomains;
- (void)clearPaymentApplications;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedAccountFeatureIdentifier:(unsigned int)a3;
- (void)setAssociatedWebDomains:(id)a3;
- (void)setCobrandName:(id)a3;
- (void)setCobranded:(BOOL)a3;
- (void)setCustomPrecisionPeerPaymentAccountBalance:(id)a3;
- (void)setDecimalAccountBalance:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasAssociatedAccountFeatureIdentifier:(BOOL)a3;
- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3;
- (void)setHasCobranded:(BOOL)a3;
- (void)setHasHasAssociatedPeerPaymentAccount:(BOOL)a3;
- (void)setHasIngestedDate:(BOOL)a3;
- (void)setHasPeerPaymentAccountBalance:(BOOL)a3;
- (void)setHasPeerPaymentAccountState:(BOOL)a3;
- (void)setHasSupportsAutomaticSelection:(BOOL)a3;
- (void)setIngestedDate:(double)a3;
- (void)setIssuerCountryCode:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassID:(id)a3;
- (void)setPaymentApplications:(id)a3;
- (void)setPeerPaymentAccountBalance:(int64_t)a3;
- (void)setPeerPaymentAccountCurrency:(id)a3;
- (void)setPeerPaymentAccountState:(unsigned int)a3;
- (void)setPrimaryAccountIdentifier:(id)a3;
- (void)setPrimaryAccountNumberSuffix:(id)a3;
- (void)setSupportsAutomaticSelection:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentInstrument

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasPassID
{
  return self->_passID != 0;
}

- (void)clearPaymentApplications
{
}

- (void)addPaymentApplications:(id)a3
{
  id v4 = a3;
  paymentApplications = self->_paymentApplications;
  id v8 = v4;
  if (!paymentApplications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_paymentApplications;
    self->_paymentApplications = v6;

    id v4 = v8;
    paymentApplications = self->_paymentApplications;
  }
  [(NSMutableArray *)paymentApplications addObject:v4];
}

- (unint64_t)paymentApplicationsCount
{
  return [(NSMutableArray *)self->_paymentApplications count];
}

- (id)paymentApplicationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentApplications objectAtIndex:a3];
}

+ (Class)paymentApplicationsType
{
  return (Class)objc_opt_class();
}

- (void)setIngestedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ingestedDate = a3;
}

- (void)setHasIngestedDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIngestedDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPrimaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix != 0;
}

- (BOOL)hasManifestHash
{
  return self->_manifestHash != 0;
}

- (BOOL)hasPrimaryAccountIdentifier
{
  return self->_primaryAccountIdentifier != 0;
}

- (void)clearAssociatedWebDomains
{
}

- (void)addAssociatedWebDomains:(id)a3
{
  id v4 = a3;
  associatedWebDomains = self->_associatedWebDomains;
  id v8 = v4;
  if (!associatedWebDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_associatedWebDomains;
    self->_associatedWebDomains = v6;

    id v4 = v8;
    associatedWebDomains = self->_associatedWebDomains;
  }
  [(NSMutableArray *)associatedWebDomains addObject:v4];
}

- (unint64_t)associatedWebDomainsCount
{
  return [(NSMutableArray *)self->_associatedWebDomains count];
}

- (id)associatedWebDomainsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associatedWebDomains objectAtIndex:a3];
}

+ (Class)associatedWebDomainsType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsAutomaticSelection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_supportsAutomaticSelection = a3;
}

- (void)setHasSupportsAutomaticSelection:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsAutomaticSelection
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasIssuerCountryCode
{
  return self->_issuerCountryCode != 0;
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (void)setHasHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasHasAssociatedPeerPaymentAccount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasPeerPaymentAccountCurrency
{
  return self->_peerPaymentAccountCurrency != 0;
}

- (void)setPeerPaymentAccountBalance:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_peerPaymentAccountBalance = a3;
}

- (void)setHasPeerPaymentAccountBalance:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPeerPaymentAccountBalance
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPeerPaymentAccountState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_peerPaymentAccountState = a3;
}

- (void)setHasPeerPaymentAccountState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPeerPaymentAccountState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasCustomPrecisionPeerPaymentAccountBalance
{
  return self->_customPrecisionPeerPaymentAccountBalance != 0;
}

- (BOOL)hasDecimalAccountBalance
{
  return self->_decimalAccountBalance != 0;
}

- (void)setAssociatedAccountFeatureIdentifier:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_associatedAccountFeatureIdentifier = a3;
}

- (void)setHasAssociatedAccountFeatureIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAssociatedAccountFeatureIdentifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCobranded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_cobranded = a3;
}

- (void)setHasCobranded:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCobranded
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasCobrandName
{
  return self->_cobrandName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentInstrument;
  id v4 = [(PKProtobufPaymentInstrument *)&v8 description];
  v5 = [(PKProtobufPaymentInstrument *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  passID = self->_passID;
  if (passID) {
    [v4 setObject:passID forKey:@"passID"];
  }
  if ([(NSMutableArray *)self->_paymentApplications count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_paymentApplications, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v8 = self->_paymentApplications;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "dictionaryRepresentation", (void)v36);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"paymentApplications"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = [NSNumber numberWithDouble:self->_ingestedDate];
    [v4 setObject:v14 forKey:@"ingestedDate"];
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if (primaryAccountNumberSuffix) {
    [v4 setObject:primaryAccountNumberSuffix forKey:@"primaryAccountNumberSuffix"];
  }
  manifestHash = self->_manifestHash;
  if (manifestHash) {
    [v4 setObject:manifestHash forKey:@"manifestHash"];
  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if (primaryAccountIdentifier) {
    [v4 setObject:primaryAccountIdentifier forKey:@"primaryAccountIdentifier"];
  }
  associatedWebDomains = self->_associatedWebDomains;
  if (associatedWebDomains) {
    [v4 setObject:associatedWebDomains forKey:@"associatedWebDomains"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_supportsAutomaticSelection];
    [v4 setObject:v19 forKey:@"supportsAutomaticSelection"];
  }
  issuerCountryCode = self->_issuerCountryCode;
  if (issuerCountryCode) {
    [v4 setObject:issuerCountryCode forKey:@"issuerCountryCode"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_hasAssociatedPeerPaymentAccount];
    [v4 setObject:v21 forKey:@"hasAssociatedPeerPaymentAccount"];
  }
  peerPaymentAccountCurrency = self->_peerPaymentAccountCurrency;
  if (peerPaymentAccountCurrency) {
    [v4 setObject:peerPaymentAccountCurrency forKey:@"peerPaymentAccountCurrency"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v24 = [NSNumber numberWithLongLong:self->_peerPaymentAccountBalance];
    [v4 setObject:v24 forKey:@"peerPaymentAccountBalance"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v25 = [NSNumber numberWithUnsignedInt:self->_peerPaymentAccountState];
    [v4 setObject:v25 forKey:@"peerPaymentAccountState"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v4 setObject:organizationName forKey:@"organizationName"];
  }
  customPrecisionPeerPaymentAccountBalance = self->_customPrecisionPeerPaymentAccountBalance;
  if (customPrecisionPeerPaymentAccountBalance)
  {
    v28 = [(PKProtobufCustomPrecisionAmount *)customPrecisionPeerPaymentAccountBalance dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"customPrecisionPeerPaymentAccountBalance"];
  }
  decimalAccountBalance = self->_decimalAccountBalance;
  if (decimalAccountBalance)
  {
    v30 = [(PKProtobufNSDecimalNumber *)decimalAccountBalance dictionaryRepresentation];
    [v4 setObject:v30 forKey:@"decimal_account_balance"];
  }
  char v31 = (char)self->_has;
  if ((v31 & 4) != 0)
  {
    v32 = [NSNumber numberWithUnsignedInt:self->_associatedAccountFeatureIdentifier];
    [v4 setObject:v32 forKey:@"associatedAccountFeatureIdentifier"];

    char v31 = (char)self->_has;
  }
  if ((v31 & 0x10) != 0)
  {
    v33 = [NSNumber numberWithBool:self->_cobranded];
    [v4 setObject:v33 forKey:@"cobranded"];
  }
  cobrandName = self->_cobrandName;
  if (cobrandName) {
    [v4 setObject:cobrandName forKey:@"cobrandName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentInstrumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_passID) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_paymentApplications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_primaryAccountNumberSuffix) {
    PBDataWriterWriteStringField();
  }
  if (self->_manifestHash) {
    PBDataWriterWriteDataField();
  }
  if (self->_primaryAccountIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_associatedWebDomains;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_issuerCountryCode) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_peerPaymentAccountCurrency) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_customPrecisionPeerPaymentAccountBalance) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_decimalAccountBalance) {
    PBDataWriterWriteSubmessage();
  }
  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_cobrandName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v15 = a3;
  if (self->_displayName) {
    objc_msgSend(v15, "setDisplayName:");
  }
  if (self->_passID) {
    objc_msgSend(v15, "setPassID:");
  }
  if ([(PKProtobufPaymentInstrument *)self paymentApplicationsCount])
  {
    [v15 clearPaymentApplications];
    unint64_t v4 = [(PKProtobufPaymentInstrument *)self paymentApplicationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PKProtobufPaymentInstrument *)self paymentApplicationsAtIndex:i];
        [v15 addPaymentApplications:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v15 + 1) = *(void *)&self->_ingestedDate;
    *((unsigned char *)v15 + 148) |= 1u;
  }
  if (self->_primaryAccountNumberSuffix) {
    objc_msgSend(v15, "setPrimaryAccountNumberSuffix:");
  }
  if (self->_manifestHash) {
    objc_msgSend(v15, "setManifestHash:");
  }
  if (self->_primaryAccountIdentifier) {
    objc_msgSend(v15, "setPrimaryAccountIdentifier:");
  }
  if ([(PKProtobufPaymentInstrument *)self associatedWebDomainsCount])
  {
    [v15 clearAssociatedWebDomains];
    unint64_t v8 = [(PKProtobufPaymentInstrument *)self associatedWebDomainsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PKProtobufPaymentInstrument *)self associatedWebDomainsAtIndex:j];
        [v15 addAssociatedWebDomains:v11];
      }
    }
  }
  uint64_t v12 = v15;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((unsigned char *)v15 + 146) = self->_supportsAutomaticSelection;
    *((unsigned char *)v15 + 148) |= 0x40u;
  }
  if (self->_issuerCountryCode)
  {
    objc_msgSend(v15, "setIssuerCountryCode:");
    uint64_t v12 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v12[145] = self->_hasAssociatedPeerPaymentAccount;
    v12[148] |= 0x20u;
  }
  if (self->_peerPaymentAccountCurrency)
  {
    objc_msgSend(v15, "setPeerPaymentAccountCurrency:");
    uint64_t v12 = v15;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v12 + 2) = self->_peerPaymentAccountBalance;
    v12[148] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v12 + 30) = self->_peerPaymentAccountState;
    v12[148] |= 8u;
  }
  if (self->_organizationName)
  {
    objc_msgSend(v15, "setOrganizationName:");
    uint64_t v12 = v15;
  }
  if (self->_customPrecisionPeerPaymentAccountBalance)
  {
    objc_msgSend(v15, "setCustomPrecisionPeerPaymentAccountBalance:");
    uint64_t v12 = v15;
  }
  if (self->_decimalAccountBalance)
  {
    objc_msgSend(v15, "setDecimalAccountBalance:");
    uint64_t v12 = v15;
  }
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v12 + 6) = self->_associatedAccountFeatureIdentifier;
    v12[148] |= 4u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 0x10) != 0)
  {
    v12[144] = self->_cobranded;
    v12[148] |= 0x10u;
  }
  if (self->_cobrandName)
  {
    objc_msgSend(v15, "setCobrandName:");
    uint64_t v12 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_passID copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v10 = self->_paymentApplications;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPaymentApplications:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_ingestedDate;
    *(unsigned char *)(v5 + 148) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_primaryAccountNumberSuffix copyWithZone:a3];
  long long v17 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v16;

  uint64_t v18 = [(NSData *)self->_manifestHash copyWithZone:a3];
  long long v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSString *)self->_primaryAccountIdentifier copyWithZone:a3];
  long long v21 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v20;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v22 = self->_associatedWebDomains;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * j), "copyWithZone:", a3, (void)v43);
        [(id)v5 addAssociatedWebDomains:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v24);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 146) = self->_supportsAutomaticSelection;
    *(unsigned char *)(v5 + 148) |= 0x40u;
  }
  uint64_t v28 = -[NSString copyWithZone:](self->_issuerCountryCode, "copyWithZone:", a3, (void)v43);
  v29 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v28;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 145) = self->_hasAssociatedPeerPaymentAccount;
    *(unsigned char *)(v5 + 148) |= 0x20u;
  }
  uint64_t v30 = [(NSString *)self->_peerPaymentAccountCurrency copyWithZone:a3];
  char v31 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v30;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_peerPaymentAccountBalance;
    *(unsigned char *)(v5 + 148) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_peerPaymentAccountState;
    *(unsigned char *)(v5 + 148) |= 8u;
  }
  uint64_t v33 = [(NSString *)self->_organizationName copyWithZone:a3];
  v34 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v33;

  id v35 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionPeerPaymentAccountBalance copyWithZone:a3];
  long long v36 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v35;

  id v37 = [(PKProtobufNSDecimalNumber *)self->_decimalAccountBalance copyWithZone:a3];
  long long v38 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v37;

  char v39 = (char)self->_has;
  if ((v39 & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_associatedAccountFeatureIdentifier;
    *(unsigned char *)(v5 + 148) |= 4u;
    char v39 = (char)self->_has;
  }
  if ((v39 & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 144) = self->_cobranded;
    *(unsigned char *)(v5 + 148) |= 0x10u;
  }
  uint64_t v40 = [(NSString *)self->_cobrandName copyWithZone:a3];
  uint64_t v41 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v40;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_68;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_68;
    }
  }
  passID = self->_passID;
  if ((unint64_t)passID | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](passID, "isEqual:")) {
      goto LABEL_68;
    }
  }
  paymentApplications = self->_paymentApplications;
  if ((unint64_t)paymentApplications | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](paymentApplications, "isEqual:")) {
      goto LABEL_68;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_ingestedDate != *((double *)v4 + 1)) {
      goto LABEL_68;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_68;
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if ((unint64_t)primaryAccountNumberSuffix | *((void *)v4 + 17)
    && !-[NSString isEqual:](primaryAccountNumberSuffix, "isEqual:"))
  {
    goto LABEL_68;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](manifestHash, "isEqual:")) {
      goto LABEL_68;
    }
  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if ((unint64_t)primaryAccountIdentifier | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](primaryAccountIdentifier, "isEqual:")) {
      goto LABEL_68;
    }
  }
  associatedWebDomains = self->_associatedWebDomains;
  if ((unint64_t)associatedWebDomains | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](associatedWebDomains, "isEqual:")) {
      goto LABEL_68;
    }
  }
  char has = (char)self->_has;
  char v13 = *((unsigned char *)v4 + 148);
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x40) == 0) {
      goto LABEL_68;
    }
    if (self->_supportsAutomaticSelection)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_68;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x40) != 0)
  {
    goto LABEL_68;
  }
  issuerCountryCode = self->_issuerCountryCode;
  if ((unint64_t)issuerCountryCode | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](issuerCountryCode, "isEqual:")) {
      goto LABEL_68;
    }
    char has = (char)self->_has;
    char v13 = *((unsigned char *)v4 + 148);
  }
  if ((has & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0) {
      goto LABEL_68;
    }
    if (self->_hasAssociatedPeerPaymentAccount)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_68;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  peerPaymentAccountCurrency = self->_peerPaymentAccountCurrency;
  if ((unint64_t)peerPaymentAccountCurrency | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](peerPaymentAccountCurrency, "isEqual:")) {
      goto LABEL_68;
    }
    char has = (char)self->_has;
    char v13 = *((unsigned char *)v4 + 148);
  }
  if ((has & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_peerPaymentAccountBalance != *((void *)v4 + 2)) {
      goto LABEL_68;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_peerPaymentAccountState != *((_DWORD *)v4 + 30)) {
      goto LABEL_68;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_68;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 11)
    && !-[NSString isEqual:](organizationName, "isEqual:"))
  {
    goto LABEL_68;
  }
  customPrecisionPeerPaymentAccountBalance = self->_customPrecisionPeerPaymentAccountBalance;
  if ((unint64_t)customPrecisionPeerPaymentAccountBalance | *((void *)v4 + 6))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionPeerPaymentAccountBalance, "isEqual:")) {
      goto LABEL_68;
    }
  }
  decimalAccountBalance = self->_decimalAccountBalance;
  if ((unint64_t)decimalAccountBalance | *((void *)v4 + 7))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](decimalAccountBalance, "isEqual:")) {
      goto LABEL_68;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0 || self->_associatedAccountFeatureIdentifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_68;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x10) == 0) {
      goto LABEL_74;
    }
LABEL_68:
    char v19 = 0;
    goto LABEL_69;
  }
  if ((*((unsigned char *)v4 + 148) & 0x10) == 0) {
    goto LABEL_68;
  }
  if (!self->_cobranded)
  {
    if (!*((unsigned char *)v4 + 144)) {
      goto LABEL_74;
    }
    goto LABEL_68;
  }
  if (!*((unsigned char *)v4 + 144)) {
    goto LABEL_68;
  }
LABEL_74:
  cobrandName = self->_cobrandName;
  if ((unint64_t)cobrandName | *((void *)v4 + 5)) {
    char v19 = -[NSString isEqual:](cobrandName, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_69:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_displayName hash];
  NSUInteger v26 = [(NSString *)self->_passID hash];
  uint64_t v25 = [(NSMutableArray *)self->_paymentApplications hash];
  if (*(unsigned char *)&self->_has)
  {
    double ingestedDate = self->_ingestedDate;
    double v4 = -ingestedDate;
    if (ingestedDate >= 0.0) {
      double v4 = self->_ingestedDate;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
    unint64_t v24 = v7;
  }
  else
  {
    unint64_t v24 = 0;
  }
  NSUInteger v23 = [(NSString *)self->_primaryAccountNumberSuffix hash];
  uint64_t v22 = [(NSData *)self->_manifestHash hash];
  NSUInteger v21 = [(NSString *)self->_primaryAccountIdentifier hash];
  uint64_t v20 = [(NSMutableArray *)self->_associatedWebDomains hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v19 = 2654435761 * self->_supportsAutomaticSelection;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_issuerCountryCode hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v9 = 2654435761 * self->_hasAssociatedPeerPaymentAccount;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_peerPaymentAccountCurrency hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_peerPaymentAccountBalance;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_18:
      uint64_t v12 = 2654435761 * self->_peerPaymentAccountState;
      goto LABEL_21;
    }
  }
  uint64_t v12 = 0;
LABEL_21:
  NSUInteger v13 = [(NSString *)self->_organizationName hash];
  unint64_t v14 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionPeerPaymentAccountBalance hash];
  unint64_t v15 = [(PKProtobufNSDecimalNumber *)self->_decimalAccountBalance hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v16 = 2654435761 * self->_associatedAccountFeatureIdentifier;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_23;
    }
LABEL_25:
    uint64_t v17 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_cobrandName hash];
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v17 = 2654435761 * self->_cobranded;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_cobrandName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[PKProtobufPaymentInstrument setDisplayName:](self, "setDisplayName:");
  }
  if (*((void *)v4 + 12)) {
    -[PKProtobufPaymentInstrument setPassID:](self, "setPassID:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = *((id *)v4 + 13);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PKProtobufPaymentInstrument *)self addPaymentApplications:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 148))
  {
    self->_double ingestedDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 17)) {
    -[PKProtobufPaymentInstrument setPrimaryAccountNumberSuffix:](self, "setPrimaryAccountNumberSuffix:");
  }
  if (*((void *)v4 + 10)) {
    -[PKProtobufPaymentInstrument setManifestHash:](self, "setManifestHash:");
  }
  if (*((void *)v4 + 16)) {
    -[PKProtobufPaymentInstrument setPrimaryAccountIdentifier:](self, "setPrimaryAccountIdentifier:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PKProtobufPaymentInstrument addAssociatedWebDomains:](self, "addAssociatedWebDomains:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v12);
  }

  if ((*((unsigned char *)v4 + 148) & 0x40) != 0)
  {
    self->_supportsAutomaticSelection = *((unsigned char *)v4 + 146);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 9)) {
    -[PKProtobufPaymentInstrument setIssuerCountryCode:](self, "setIssuerCountryCode:");
  }
  if ((*((unsigned char *)v4 + 148) & 0x20) != 0)
  {
    self->_hasAssociatedPeerPaymentAccount = *((unsigned char *)v4 + 145);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 14)) {
    -[PKProtobufPaymentInstrument setPeerPaymentAccountCurrency:](self, "setPeerPaymentAccountCurrency:");
  }
  char v15 = *((unsigned char *)v4 + 148);
  if ((v15 & 2) != 0)
  {
    self->_peerPaymentAccountBalance = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v15 = *((unsigned char *)v4 + 148);
  }
  if ((v15 & 8) != 0)
  {
    self->_peerPaymentAccountState = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 11)) {
    -[PKProtobufPaymentInstrument setOrganizationName:](self, "setOrganizationName:");
  }
  customPrecisionPeerPaymentAccountBalance = self->_customPrecisionPeerPaymentAccountBalance;
  uint64_t v17 = *((void *)v4 + 6);
  if (customPrecisionPeerPaymentAccountBalance)
  {
    if (v17) {
      -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionPeerPaymentAccountBalance, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[PKProtobufPaymentInstrument setCustomPrecisionPeerPaymentAccountBalance:](self, "setCustomPrecisionPeerPaymentAccountBalance:");
  }
  decimalAccountBalance = self->_decimalAccountBalance;
  uint64_t v19 = *((void *)v4 + 7);
  if (decimalAccountBalance)
  {
    if (v19) {
      -[PKProtobufNSDecimalNumber mergeFrom:](decimalAccountBalance, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[PKProtobufPaymentInstrument setDecimalAccountBalance:](self, "setDecimalAccountBalance:");
  }
  char v20 = *((unsigned char *)v4 + 148);
  if ((v20 & 4) != 0)
  {
    self->_associatedAccountFeatureIdentifier = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v20 = *((unsigned char *)v4 + 148);
  }
  if ((v20 & 0x10) != 0)
  {
    self->_cobranded = *((unsigned char *)v4 + 144);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 5)) {
    -[PKProtobufPaymentInstrument setCobrandName:](self, "setCobrandName:");
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NSMutableArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
}

- (double)ingestedDate
{
  return self->_ingestedDate;
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
}

- (NSMutableArray)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (void)setAssociatedWebDomains:(id)a3
{
}

- (BOOL)supportsAutomaticSelection
{
  return self->_supportsAutomaticSelection;
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (NSString)peerPaymentAccountCurrency
{
  return self->_peerPaymentAccountCurrency;
}

- (void)setPeerPaymentAccountCurrency:(id)a3
{
}

- (int64_t)peerPaymentAccountBalance
{
  return self->_peerPaymentAccountBalance;
}

- (unsigned)peerPaymentAccountState
{
  return self->_peerPaymentAccountState;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (PKProtobufCustomPrecisionAmount)customPrecisionPeerPaymentAccountBalance
{
  return self->_customPrecisionPeerPaymentAccountBalance;
}

- (void)setCustomPrecisionPeerPaymentAccountBalance:(id)a3
{
}

- (PKProtobufNSDecimalNumber)decimalAccountBalance
{
  return self->_decimalAccountBalance;
}

- (void)setDecimalAccountBalance:(id)a3
{
}

- (unsigned)associatedAccountFeatureIdentifier
{
  return self->_associatedAccountFeatureIdentifier;
}

- (BOOL)cobranded
{
  return self->_cobranded;
}

- (NSString)cobrandName
{
  return self->_cobrandName;
}

- (void)setCobrandName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountCurrency, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_decimalAccountBalance, 0);
  objc_storeStrong((id *)&self->_customPrecisionPeerPaymentAccountBalance, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
}

@end