@interface HALSchemaHALNearbyPersonalDevicesReported
- (BOOL)hasIMacCount;
- (BOOL)hasIPadCount;
- (BOOL)hasIPhoneCount;
- (BOOL)hasMacBookCount;
- (BOOL)hasMacStudioCount;
- (BOOL)hasWatchCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALNearbyPersonalDevicesReported)initWithDictionary:(id)a3;
- (HALSchemaHALNearbyPersonalDevicesReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)iMacCount;
- (unsigned)iPadCount;
- (unsigned)iPhoneCount;
- (unsigned)macBookCount;
- (unsigned)macStudioCount;
- (unsigned)watchCount;
- (void)deleteIMacCount;
- (void)deleteIPadCount;
- (void)deleteIPhoneCount;
- (void)deleteMacBookCount;
- (void)deleteMacStudioCount;
- (void)deleteWatchCount;
- (void)setHasIMacCount:(BOOL)a3;
- (void)setHasIPadCount:(BOOL)a3;
- (void)setHasIPhoneCount:(BOOL)a3;
- (void)setHasMacBookCount:(BOOL)a3;
- (void)setHasMacStudioCount:(BOOL)a3;
- (void)setHasWatchCount:(BOOL)a3;
- (void)setIMacCount:(unsigned int)a3;
- (void)setIPadCount:(unsigned int)a3;
- (void)setIPhoneCount:(unsigned int)a3;
- (void)setMacBookCount:(unsigned int)a3;
- (void)setMacStudioCount:(unsigned int)a3;
- (void)setWatchCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALNearbyPersonalDevicesReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)iMacCount
{
  return self->_iMacCount;
}

- (unsigned)macStudioCount
{
  return self->_macStudioCount;
}

- (unsigned)macBookCount
{
  return self->_macBookCount;
}

- (unsigned)watchCount
{
  return self->_watchCount;
}

- (unsigned)iPadCount
{
  return self->_iPadCount;
}

- (unsigned)iPhoneCount
{
  return self->_iPhoneCount;
}

- (HALSchemaHALNearbyPersonalDevicesReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HALSchemaHALNearbyPersonalDevicesReported;
  v5 = [(HALSchemaHALNearbyPersonalDevicesReported *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"iPhoneCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALNearbyPersonalDevicesReported setIPhoneCount:](v5, "setIPhoneCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"iPadCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALNearbyPersonalDevicesReported setIPadCount:](v5, "setIPadCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"watchCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALNearbyPersonalDevicesReported setWatchCount:](v5, "setWatchCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"macBookCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALNearbyPersonalDevicesReported setMacBookCount:](v5, "setMacBookCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"macStudioCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALNearbyPersonalDevicesReported setMacStudioCount:](v5, "setMacStudioCount:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"iMacCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALNearbyPersonalDevicesReported setIMacCount:](v5, "setIMacCount:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (HALSchemaHALNearbyPersonalDevicesReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALNearbyPersonalDevicesReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALNearbyPersonalDevicesReported *)self dictionaryRepresentation];
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
  if ((has & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported iMacCount](self, "iMacCount"));
    [v3 setObject:v7 forKeyedSubscript:@"iMacCount"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported iPadCount](self, "iPadCount"));
  [v3 setObject:v8 forKeyedSubscript:@"iPadCount"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported iPhoneCount](self, "iPhoneCount"));
  [v3 setObject:v9 forKeyedSubscript:@"iPhoneCount"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported macBookCount](self, "macBookCount"));
  [v3 setObject:v10 forKeyedSubscript:@"macBookCount"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported macStudioCount](self, "macStudioCount"));
  [v3 setObject:v11 forKeyedSubscript:@"macStudioCount"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALNearbyPersonalDevicesReported watchCount](self, "watchCount"));
    [v3 setObject:v5 forKeyedSubscript:@"watchCount"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_iPhoneCount;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_iPadCount;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
    uint64_t v4 = 2654435761 * self->_watchCount;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_macBookCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_macStudioCount;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_iMacCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $2603D206256D646781B8C1B61506BA35 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int iPhoneCount = self->_iPhoneCount;
    if (iPhoneCount != [v4 iPhoneCount]) {
      goto LABEL_26;
    }
    $2603D206256D646781B8C1B61506BA35 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    unsigned int iPadCount = self->_iPadCount;
    if (iPadCount != [v4 iPadCount]) {
      goto LABEL_26;
    }
    $2603D206256D646781B8C1B61506BA35 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    unsigned int watchCount = self->_watchCount;
    if (watchCount != [v4 watchCount]) {
      goto LABEL_26;
    }
    $2603D206256D646781B8C1B61506BA35 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    unsigned int macBookCount = self->_macBookCount;
    if (macBookCount != [v4 macBookCount]) {
      goto LABEL_26;
    }
    $2603D206256D646781B8C1B61506BA35 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    unsigned int macStudioCount = self->_macStudioCount;
    if (macStudioCount == [v4 macStudioCount])
    {
      $2603D206256D646781B8C1B61506BA35 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    unsigned int iMacCount = self->_iMacCount;
    if (iMacCount != [v4 iMacCount]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALNearbyPersonalDevicesReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIMacCount
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIMacCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIMacCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIMacCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int iMacCount = a3;
}

- (void)deleteMacStudioCount
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasMacStudioCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMacStudioCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMacStudioCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int macStudioCount = a3;
}

- (void)deleteMacBookCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasMacBookCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMacBookCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMacBookCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int macBookCount = a3;
}

- (void)deleteWatchCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasWatchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWatchCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWatchCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int watchCount = a3;
}

- (void)deleteIPadCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIPadCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIPadCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIPadCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int iPadCount = a3;
}

- (void)deleteIPhoneCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIPhoneCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIPhoneCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIPhoneCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int iPhoneCount = a3;
}

@end