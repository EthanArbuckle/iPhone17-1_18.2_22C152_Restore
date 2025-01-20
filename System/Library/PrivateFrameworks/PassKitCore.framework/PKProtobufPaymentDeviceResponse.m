@interface PKProtobufPaymentDeviceResponse
+ (Class)paymentInstrumentsType;
+ (Class)supportedSetupFeaturesType;
- (BOOL)deviceDisabled;
- (BOOL)hasDefaultPaymentInstrumentIndex;
- (BOOL)hasDeviceDisabled;
- (BOOL)hasLocked;
- (BOOL)hasNearby;
- (BOOL)hasProtocolVersion;
- (BOOL)hasSupportsFaceID;
- (BOOL)hasUserDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)locked;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsFaceID;
- (BOOL)userDisabled;
- (NSMutableArray)paymentInstruments;
- (NSMutableArray)supportedSetupFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nearbyAsString:(int)a3;
- (id)paymentInstrumentsAtIndex:(unint64_t)a3;
- (id)supportedSetupFeaturesAtIndex:(unint64_t)a3;
- (int)StringAsNearby:(id)a3;
- (int)nearby;
- (unint64_t)hash;
- (unint64_t)paymentInstrumentsCount;
- (unint64_t)supportedSetupFeaturesCount;
- (unsigned)defaultPaymentInstrumentIndex;
- (unsigned)protocolVersion;
- (void)addPaymentInstruments:(id)a3;
- (void)addSupportedSetupFeatures:(id)a3;
- (void)clearPaymentInstruments;
- (void)clearSupportedSetupFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDefaultPaymentInstrumentIndex:(unsigned int)a3;
- (void)setDeviceDisabled:(BOOL)a3;
- (void)setHasDefaultPaymentInstrumentIndex:(BOOL)a3;
- (void)setHasDeviceDisabled:(BOOL)a3;
- (void)setHasLocked:(BOOL)a3;
- (void)setHasNearby:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasSupportsFaceID:(BOOL)a3;
- (void)setHasUserDisabled:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setNearby:(int)a3;
- (void)setPaymentInstruments:(id)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setSupportedSetupFeatures:(id)a3;
- (void)setSupportsFaceID:(BOOL)a3;
- (void)setUserDisabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentDeviceResponse

- (void)setLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_locked = a3;
}

- (void)setHasLocked:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocked
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearPaymentInstruments
{
}

- (void)addPaymentInstruments:(id)a3
{
  id v4 = a3;
  paymentInstruments = self->_paymentInstruments;
  id v8 = v4;
  if (!paymentInstruments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_paymentInstruments;
    self->_paymentInstruments = v6;

    id v4 = v8;
    paymentInstruments = self->_paymentInstruments;
  }
  [(NSMutableArray *)paymentInstruments addObject:v4];
}

- (unint64_t)paymentInstrumentsCount
{
  return [(NSMutableArray *)self->_paymentInstruments count];
}

- (id)paymentInstrumentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentInstruments objectAtIndex:a3];
}

+ (Class)paymentInstrumentsType
{
  return (Class)objc_opt_class();
}

- (void)setDefaultPaymentInstrumentIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_defaultPaymentInstrumentIndex = a3;
}

- (void)setHasDefaultPaymentInstrumentIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDefaultPaymentInstrumentIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_userDisabled = a3;
}

- (void)setHasUserDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUserDisabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDeviceDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deviceDisabled = a3;
}

- (void)setHasDeviceDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceDisabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)nearby
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_nearby;
  }
  else {
    return 0;
  }
}

- (void)setNearby:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nearby = a3;
}

- (void)setHasNearby:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNearby
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)nearbyAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E56E3330[a3];
  }
  return v3;
}

- (int)StringAsNearby:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEARBY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISTANT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsFaceID:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_supportsFaceID = a3;
}

- (void)setHasSupportsFaceID:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsFaceID
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearSupportedSetupFeatures
{
}

- (void)addSupportedSetupFeatures:(id)a3
{
  id v4 = a3;
  supportedSetupFeatures = self->_supportedSetupFeatures;
  id v8 = v4;
  if (!supportedSetupFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_supportedSetupFeatures;
    self->_supportedSetupFeatures = v6;

    id v4 = v8;
    supportedSetupFeatures = self->_supportedSetupFeatures;
  }
  [(NSMutableArray *)supportedSetupFeatures addObject:v4];
}

- (unint64_t)supportedSetupFeaturesCount
{
  return [(NSMutableArray *)self->_supportedSetupFeatures count];
}

- (id)supportedSetupFeaturesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedSetupFeatures objectAtIndex:a3];
}

+ (Class)supportedSetupFeaturesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentDeviceResponse;
  id v4 = [(PKProtobufPaymentDeviceResponse *)&v8 description];
  v5 = [(PKProtobufPaymentDeviceResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    id v4 = [NSNumber numberWithBool:self->_locked];
    [v3 setObject:v4 forKey:@"locked"];
  }
  if ([(NSMutableArray *)self->_paymentInstruments count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_paymentInstruments, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v6 = self->_paymentInstruments;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"paymentInstruments"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v22 = [NSNumber numberWithUnsignedInt:self->_defaultPaymentInstrumentIndex];
    [v3 setObject:v22 forKey:@"defaultPaymentInstrumentIndex"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_14:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_14;
  }
  v23 = [NSNumber numberWithBool:self->_userDisabled];
  [v3 setObject:v23 forKey:@"userDisabled"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  v24 = [NSNumber numberWithBool:self->_deviceDisabled];
  [v3 setObject:v24 forKey:@"deviceDisabled"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_34:
  uint64_t nearby = self->_nearby;
  if (nearby >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nearby);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E56E3330[nearby];
  }
  [v3 setObject:v26 forKey:@"nearby"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_17:
    if ((has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_38:
  v27 = [NSNumber numberWithUnsignedInt:self->_protocolVersion];
  [v3 setObject:v27 forKey:@"protocolVersion"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    v13 = [NSNumber numberWithBool:self->_supportsFaceID];
    [v3 setObject:v13 forKey:@"supportsFaceID"];
  }
LABEL_19:
  if ([(NSMutableArray *)self->_supportedSetupFeatures count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_supportedSetupFeatures, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v15 = self->_supportedSetupFeatures;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v28 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"supportedSetupFeatures"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentDeviceResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_paymentInstruments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_16:
  }
    PBDataWriterWriteBOOLField();
LABEL_17:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_supportedSetupFeatures;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[41] = self->_locked;
    v4[44] |= 0x10u;
  }
  id v14 = v4;
  if ([(PKProtobufPaymentDeviceResponse *)self paymentInstrumentsCount])
  {
    [v14 clearPaymentInstruments];
    unint64_t v5 = [(PKProtobufPaymentDeviceResponse *)self paymentInstrumentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PKProtobufPaymentDeviceResponse *)self paymentInstrumentsAtIndex:i];
        [v14 addPaymentInstruments:v8];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v14 + 2) = self->_defaultPaymentInstrumentIndex;
    *((unsigned char *)v14 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v14 + 43) = self->_userDisabled;
  *((unsigned char *)v14 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)v14 + 40) = self->_deviceDisabled;
  *((unsigned char *)v14 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    *((_DWORD *)v14 + 6) = self->_protocolVersion;
    *((unsigned char *)v14 + 44) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  *((_DWORD *)v14 + 3) = self->_nearby;
  *((unsigned char *)v14 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 0x20) != 0)
  {
LABEL_13:
    *((unsigned char *)v14 + 42) = self->_supportsFaceID;
    *((unsigned char *)v14 + 44) |= 0x20u;
  }
LABEL_14:
  if ([(PKProtobufPaymentDeviceResponse *)self supportedSetupFeaturesCount])
  {
    [v14 clearSupportedSetupFeatures];
    unint64_t v10 = [(PKProtobufPaymentDeviceResponse *)self supportedSetupFeaturesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(PKProtobufPaymentDeviceResponse *)self supportedSetupFeaturesAtIndex:j];
        [v14 addSupportedSetupFeatures:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 41) = self->_locked;
    *(unsigned char *)(v5 + 44) |= 0x10u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = self->_paymentInstruments;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPaymentInstruments:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v6 + 8) = self->_defaultPaymentInstrumentIndex;
    *(unsigned char *)(v6 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  *(unsigned char *)(v6 + 43) = self->_userDisabled;
  *(unsigned char *)(v6 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(v6 + 40) = self->_deviceDisabled;
  *(unsigned char *)(v6 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 12) = self->_nearby;
  *(unsigned char *)(v6 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_29:
  *(_DWORD *)(v6 + 24) = self->_protocolVersion;
  *(unsigned char *)(v6 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    *(unsigned char *)(v6 + 42) = self->_supportsFaceID;
    *(unsigned char *)(v6 + 44) |= 0x20u;
  }
LABEL_17:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = self->_supportedSetupFeatures;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v6 addSupportedSetupFeatures:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_locked)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  paymentInstruments = self->_paymentInstruments;
  if ((unint64_t)paymentInstruments | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](paymentInstruments, "isEqual:")) {
      goto LABEL_48;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_defaultPaymentInstrumentIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_48;
    }
  }
  else if (v6)
  {
    goto LABEL_48;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_48;
    }
    if (self->_userDisabled)
    {
      if (!*((unsigned char *)v4 + 43)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 43))
    {
      goto LABEL_48;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_48;
    }
    if (self->_deviceDisabled)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_48;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_nearby != *((_DWORD *)v4 + 3)) {
      goto LABEL_48;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_48;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x20) == 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_54;
    }
LABEL_48:
    char v8 = 0;
    goto LABEL_49;
  }
  if ((v6 & 0x20) == 0) {
    goto LABEL_48;
  }
  if (!self->_supportsFaceID)
  {
    if (!*((unsigned char *)v4 + 42)) {
      goto LABEL_54;
    }
    goto LABEL_48;
  }
  if (!*((unsigned char *)v4 + 42)) {
    goto LABEL_48;
  }
LABEL_54:
  supportedSetupFeatures = self->_supportedSetupFeatures;
  if ((unint64_t)supportedSetupFeatures | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](supportedSetupFeatures, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_49:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_locked;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_paymentInstruments hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_defaultPaymentInstrumentIndex;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_userDisabled;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_deviceDisabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_nearby;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_16:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_supportedSetupFeatures hash];
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_protocolVersion;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_supportsFaceID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_supportedSetupFeatures hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    self->_locked = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PKProtobufPaymentDeviceResponse *)self addPaymentInstruments:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v5 + 44);
  if (v11)
  {
    self->_defaultPaymentInstrumentIndex = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v11 = *((unsigned char *)v5 + 44);
    if ((v11 & 0x40) == 0)
    {
LABEL_12:
      if ((v11 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v5 + 44) & 0x40) == 0)
  {
    goto LABEL_12;
  }
  self->_userDisabled = *((unsigned char *)v5 + 43);
  *(unsigned char *)&self->_has |= 0x40u;
  char v11 = *((unsigned char *)v5 + 44);
  if ((v11 & 8) == 0)
  {
LABEL_13:
    if ((v11 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_deviceDisabled = *((unsigned char *)v5 + 40);
  *(unsigned char *)&self->_has |= 8u;
  char v11 = *((unsigned char *)v5 + 44);
  if ((v11 & 2) == 0)
  {
LABEL_14:
    if ((v11 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_uint64_t nearby = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v11 = *((unsigned char *)v5 + 44);
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_29:
  self->_protocolVersion = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v5 + 44) & 0x20) != 0)
  {
LABEL_16:
    self->_supportsFaceID = *((unsigned char *)v5 + 42);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_17:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v5 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[PKProtobufPaymentDeviceResponse addSupportedSetupFeatures:](self, "addSupportedSetupFeatures:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)locked
{
  return self->_locked;
}

- (NSMutableArray)paymentInstruments
{
  return self->_paymentInstruments;
}

- (void)setPaymentInstruments:(id)a3
{
}

- (unsigned)defaultPaymentInstrumentIndex
{
  return self->_defaultPaymentInstrumentIndex;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (BOOL)deviceDisabled
{
  return self->_deviceDisabled;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)supportsFaceID
{
  return self->_supportsFaceID;
}

- (NSMutableArray)supportedSetupFeatures
{
  return self->_supportedSetupFeatures;
}

- (void)setSupportedSetupFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSetupFeatures, 0);
  objc_storeStrong((id *)&self->_paymentInstruments, 0);
}

@end