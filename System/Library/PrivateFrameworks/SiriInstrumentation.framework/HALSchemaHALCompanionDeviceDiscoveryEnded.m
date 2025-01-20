@interface HALSchemaHALCompanionDeviceDiscoveryEnded
- (BOOL)hasDeviceProximity;
- (BOOL)hasDiscoveryType;
- (BOOL)hasHasNullPeerIdentityServicesId;
- (BOOL)hasHasOtheriOSActiveDevices;
- (BOOL)hasIsMeDevice;
- (BOOL)hasNullPeerIdentityServicesId;
- (BOOL)hasOtheriOSActiveDevices;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMeDevice;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALCompanionDeviceDiscoveryEnded)initWithDictionary:(id)a3;
- (HALSchemaHALCompanionDeviceDiscoveryEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)deviceProximity;
- (int)discoveryType;
- (unint64_t)hash;
- (void)deleteDeviceProximity;
- (void)deleteDiscoveryType;
- (void)deleteHasNullPeerIdentityServicesId;
- (void)deleteHasOtheriOSActiveDevices;
- (void)deleteIsMeDevice;
- (void)setDeviceProximity:(int)a3;
- (void)setDiscoveryType:(int)a3;
- (void)setHasDeviceProximity:(BOOL)a3;
- (void)setHasDiscoveryType:(BOOL)a3;
- (void)setHasHasNullPeerIdentityServicesId:(BOOL)a3;
- (void)setHasHasOtheriOSActiveDevices:(BOOL)a3;
- (void)setHasIsMeDevice:(BOOL)a3;
- (void)setHasNullPeerIdentityServicesId:(BOOL)a3;
- (void)setHasOtheriOSActiveDevices:(BOOL)a3;
- (void)setIsMeDevice:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALCompanionDeviceDiscoveryEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)deviceProximity
{
  return self->_deviceProximity;
}

- (BOOL)hasNullPeerIdentityServicesId
{
  return self->_hasNullPeerIdentityServicesId;
}

- (BOOL)hasOtheriOSActiveDevices
{
  return self->_hasOtheriOSActiveDevices;
}

- (BOOL)isMeDevice
{
  return self->_isMeDevice;
}

- (int)discoveryType
{
  return self->_discoveryType;
}

- (HALSchemaHALCompanionDeviceDiscoveryEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HALSchemaHALCompanionDeviceDiscoveryEnded;
  v5 = [(HALSchemaHALCompanionDeviceDiscoveryEnded *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"discoveryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setDiscoveryType:](v5, "setDiscoveryType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isMeDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setIsMeDevice:](v5, "setIsMeDevice:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hasOtheriOSActiveDevices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setHasOtheriOSActiveDevices:](v5, "setHasOtheriOSActiveDevices:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasNullPeerIdentityServicesId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setHasNullPeerIdentityServicesId:](v5, "setHasNullPeerIdentityServicesId:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"deviceProximity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setDeviceProximity:](v5, "setDeviceProximity:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (HALSchemaHALCompanionDeviceDiscoveryEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALCompanionDeviceDiscoveryEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALCompanionDeviceDiscoveryEnded *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    unsigned int v5 = [(HALSchemaHALCompanionDeviceDiscoveryEnded *)self deviceProximity] - 1;
    if (v5 > 3) {
      v6 = @"HALDEVICEPROXIMITY_UNKNOWN";
    }
    else {
      v6 = off_1E5EBB438[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"deviceProximity"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(HALSchemaHALCompanionDeviceDiscoveryEnded *)self discoveryType] - 1;
    if (v7 > 2) {
      v8 = @"HALDISCOVERYTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBB458[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"discoveryType"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HALSchemaHALCompanionDeviceDiscoveryEnded hasNullPeerIdentityServicesId](self, "hasNullPeerIdentityServicesId"));
    [v3 setObject:v11 forKeyedSubscript:@"hasNullPeerIdentityServicesId"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_13;
  }
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HALSchemaHALCompanionDeviceDiscoveryEnded hasOtheriOSActiveDevices](self, "hasOtheriOSActiveDevices"));
  [v3 setObject:v12 forKeyedSubscript:@"hasOtheriOSActiveDevices"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HALSchemaHALCompanionDeviceDiscoveryEnded isMeDevice](self, "isMeDevice"));
    [v3 setObject:v9 forKeyedSubscript:@"isMeDevice"];
  }
LABEL_15:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_discoveryType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isMeDevice;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_hasOtheriOSActiveDevices;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_hasNullPeerIdentityServicesId;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_deviceProximity;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $F5A7E65BE5A8F16E45AD300151EDB83C has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int discoveryType = self->_discoveryType;
    if (discoveryType != [v4 discoveryType]) {
      goto LABEL_22;
    }
    $F5A7E65BE5A8F16E45AD300151EDB83C has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int isMeDevice = self->_isMeDevice;
    if (isMeDevice != [v4 isMeDevice]) {
      goto LABEL_22;
    }
    $F5A7E65BE5A8F16E45AD300151EDB83C has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int hasOtheriOSActiveDevices = self->_hasOtheriOSActiveDevices;
    if (hasOtheriOSActiveDevices != [v4 hasOtheriOSActiveDevices]) {
      goto LABEL_22;
    }
    $F5A7E65BE5A8F16E45AD300151EDB83C has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    int hasNullPeerIdentityServicesId = self->_hasNullPeerIdentityServicesId;
    if (hasNullPeerIdentityServicesId == [v4 hasNullPeerIdentityServicesId])
    {
      $F5A7E65BE5A8F16E45AD300151EDB83C has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int deviceProximity = self->_deviceProximity;
    if (deviceProximity != [v4 deviceProximity]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALCompanionDeviceDiscoveryEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeviceProximity
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasDeviceProximity:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeviceProximity
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDeviceProximity:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int deviceProximity = a3;
}

- (void)deleteHasNullPeerIdentityServicesId
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasHasNullPeerIdentityServicesId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasNullPeerIdentityServicesId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNullPeerIdentityServicesId:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int hasNullPeerIdentityServicesId = a3;
}

- (void)deleteHasOtheriOSActiveDevices
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHasOtheriOSActiveDevices:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasOtheriOSActiveDevices
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasOtheriOSActiveDevices:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasOtheriOSActiveDevices = a3;
}

- (void)deleteIsMeDevice
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsMeDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsMeDevice
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsMeDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isMeDevice = a3;
}

- (void)deleteDiscoveryType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDiscoveryType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscoveryType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDiscoveryType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int discoveryType = a3;
}

@end