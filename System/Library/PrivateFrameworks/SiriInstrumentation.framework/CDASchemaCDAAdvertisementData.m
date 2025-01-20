@interface CDASchemaCDAAdvertisementData
- (BOOL)hasAudioHash;
- (BOOL)hasConfidenceScore;
- (BOOL)hasDeviceClass;
- (BOOL)hasDeviceGroup;
- (BOOL)hasGoodnessScore;
- (BOOL)hasIsFromContextCollector;
- (BOOL)hasIsSelf;
- (BOOL)hasProductType;
- (BOOL)hasTieBreaker;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromContextCollector;
- (BOOL)isSelf;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAAdvertisementData)initWithDictionary:(id)a3;
- (CDASchemaCDAAdvertisementData)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)audioHash;
- (unsigned)confidenceScore;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (unsigned)goodnessScore;
- (unsigned)productType;
- (unsigned)tieBreaker;
- (void)deleteAudioHash;
- (void)deleteConfidenceScore;
- (void)deleteDeviceClass;
- (void)deleteDeviceGroup;
- (void)deleteGoodnessScore;
- (void)deleteIsFromContextCollector;
- (void)deleteIsSelf;
- (void)deleteProductType;
- (void)deleteTieBreaker;
- (void)setAudioHash:(unsigned int)a3;
- (void)setConfidenceScore:(unsigned int)a3;
- (void)setDeviceClass:(unsigned int)a3;
- (void)setDeviceGroup:(unsigned int)a3;
- (void)setGoodnessScore:(unsigned int)a3;
- (void)setHasAudioHash:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasDeviceGroup:(BOOL)a3;
- (void)setHasGoodnessScore:(BOOL)a3;
- (void)setHasIsFromContextCollector:(BOOL)a3;
- (void)setHasIsSelf:(BOOL)a3;
- (void)setHasProductType:(BOOL)a3;
- (void)setHasTieBreaker:(BOOL)a3;
- (void)setIsFromContextCollector:(BOOL)a3;
- (void)setIsSelf:(BOOL)a3;
- (void)setProductType:(unsigned int)a3;
- (void)setTieBreaker:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAAdvertisementData

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isSelf
{
  return self->_isSelf;
}

- (BOOL)isFromContextCollector
{
  return self->_isFromContextCollector;
}

- (unsigned)tieBreaker
{
  return self->_tieBreaker;
}

- (unsigned)productType
{
  return self->_productType;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)confidenceScore
{
  return self->_confidenceScore;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)audioHash
{
  return self->_audioHash;
}

- (CDASchemaCDAAdvertisementData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDASchemaCDAAdvertisementData;
  v5 = [(CDASchemaCDAAdvertisementData *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioHash"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setAudioHash:](v5, "setAudioHash:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"goodnessScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setGoodnessScore:](v5, "setGoodnessScore:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"confidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setConfidenceScore:](v5, "setConfidenceScore:", [v8 unsignedIntValue]);
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"deviceClass", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setDeviceClass:](v5, "setDeviceClass:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"deviceGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setDeviceGroup:](v5, "setDeviceGroup:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setProductType:](v5, "setProductType:", [v11 unsignedIntValue]);
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"tieBreaker"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setTieBreaker:](v5, "setTieBreaker:", [v12 unsignedIntValue]);
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"isFromContextCollector"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setIsFromContextCollector:](v5, "setIsFromContextCollector:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isSelf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAAdvertisementData setIsSelf:](v5, "setIsSelf:", [v15 BOOLValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (CDASchemaCDAAdvertisementData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAAdvertisementData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAAdvertisementData *)self dictionaryRepresentation];
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
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if (v4)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData audioHash](self, "audioHash"));
    [v3 setObject:v7 forKeyedSubscript:@"audioHash"];

    __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData confidenceScore](self, "confidenceScore"));
  [v3 setObject:v8 forKeyedSubscript:@"confidenceScore"];

  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData deviceClass](self, "deviceClass"));
  [v3 setObject:v9 forKeyedSubscript:@"deviceClass"];

  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData deviceGroup](self, "deviceGroup"));
  [v3 setObject:v10 forKeyedSubscript:@"deviceGroup"];

  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData goodnessScore](self, "goodnessScore"));
  [v3 setObject:v11 forKeyedSubscript:@"goodnessScore"];

  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDAAdvertisementData isFromContextCollector](self, "isFromContextCollector"));
  [v3 setObject:v12 forKeyedSubscript:@"isFromContextCollector"];

  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x100) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDAAdvertisementData isSelf](self, "isSelf"));
  [v3 setObject:v13 forKeyedSubscript:@"isSelf"];

  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData productType](self, "productType"));
  [v3 setObject:v14 forKeyedSubscript:@"productType"];

  if ((*(_WORD *)(&self->_isSelf + 1) & 0x40) != 0)
  {
LABEL_10:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData tieBreaker](self, "tieBreaker"));
    [v3 setObject:v5 forKeyedSubscript:@"tieBreaker"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 v2 = *(_WORD *)(&self->_isSelf + 1);
  if (v2)
  {
    uint64_t v3 = 2654435761 * self->_audioHash;
    if ((v2 & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_goodnessScore;
      if ((v2 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((v2 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((v2 & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_confidenceScore;
    if ((v2 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((v2 & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_deviceClass;
    if ((v2 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_deviceGroup;
    if ((v2 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_productType;
    if ((v2 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((v2 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_tieBreaker;
    if ((v2 & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((*(_WORD *)(&self->_isSelf + 1) & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((v2 & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_isFromContextCollector;
  if ((*(_WORD *)(&self->_isSelf + 1) & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_isSelf;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
  unsigned int v6 = v4[19];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_38;
  }
  if (v5)
  {
    unsigned int audioHash = self->_audioHash;
    if (audioHash != [v4 audioHash]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v8)
  {
    unsigned int goodnessScore = self->_goodnessScore;
    if (goodnessScore != [v4 goodnessScore]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_38;
  }
  if (v10)
  {
    unsigned int confidenceScore = self->_confidenceScore;
    if (confidenceScore != [v4 confidenceScore]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_38;
  }
  if (v12)
  {
    unsigned int deviceClass = self->_deviceClass;
    if (deviceClass != [v4 deviceClass]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_38;
  }
  if (v14)
  {
    unsigned int deviceGroup = self->_deviceGroup;
    if (deviceGroup != [v4 deviceGroup]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_38;
  }
  if (v16)
  {
    unsigned int productType = self->_productType;
    if (productType != [v4 productType]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v18 = (v5 >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_38;
  }
  if (v18)
  {
    unsigned int tieBreaker = self->_tieBreaker;
    if (tieBreaker != [v4 tieBreaker]) {
      goto LABEL_38;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    unsigned int v6 = v4[19];
  }
  int v20 = (v5 >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_38;
  }
  if (v20)
  {
    int isFromContextCollector = self->_isFromContextCollector;
    if (isFromContextCollector == [v4 isFromContextCollector])
    {
      unsigned int v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
      unsigned int v6 = v4[19];
      goto LABEL_34;
    }
LABEL_38:
    BOOL v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  int v22 = (v5 >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_38;
  }
  if (v22)
  {
    int isSelf = self->_isSelf;
    if (isSelf != [v4 isSelf]) {
      goto LABEL_38;
    }
  }
  BOOL v24 = 1;
LABEL_39:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if (v4)
  {
    PBDataWriterWriteUint32Field();
    __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)(&self->_isSelf + 1) & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAAdvertisementDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSelf
{
  *(_WORD *)(&self->_isSelf + 1) &= ~0x100u;
}

- (void)setHasIsSelf:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFEFF | v3;
}

- (BOOL)hasIsSelf
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isSelf + 1)) & 1;
}

- (void)setIsSelf:(BOOL)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x100u;
  self->_int isSelf = a3;
}

- (void)deleteIsFromContextCollector
{
  *(_WORD *)(&self->_isSelf + 1) &= ~0x80u;
}

- (void)setHasIsFromContextCollector:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFF7F | v3;
}

- (BOOL)hasIsFromContextCollector
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 7) & 1;
}

- (void)setIsFromContextCollector:(BOOL)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x80u;
  self->_int isFromContextCollector = a3;
}

- (void)deleteTieBreaker
{
  *(_WORD *)(&self->_isSelf + 1) &= ~0x40u;
}

- (void)setHasTieBreaker:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFBF | v3;
}

- (BOOL)hasTieBreaker
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 6) & 1;
}

- (void)setTieBreaker:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x40u;
  self->_unsigned int tieBreaker = a3;
}

- (void)deleteProductType
{
  *(_WORD *)(&self->_isSelf + 1) &= ~0x20u;
}

- (void)setHasProductType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFDF | v3;
}

- (BOOL)hasProductType
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 5) & 1;
}

- (void)setProductType:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x20u;
  self->_unsigned int productType = a3;
}

- (void)deleteDeviceGroup
{
  *(_WORD *)(&self->_isSelf + 1) &= ~0x10u;
}

- (void)setHasDeviceGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFEF | v3;
}

- (BOOL)hasDeviceGroup
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 4) & 1;
}

- (void)setDeviceGroup:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x10u;
  self->_unsigned int deviceGroup = a3;
}

- (void)deleteDeviceClass
{
  *(_WORD *)(&self->_isSelf + 1) &= ~8u;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFF7 | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 3) & 1;
}

- (void)setDeviceClass:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 8u;
  self->_unsigned int deviceClass = a3;
}

- (void)deleteConfidenceScore
{
  *(_WORD *)(&self->_isSelf + 1) &= ~4u;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFFB | v3;
}

- (BOOL)hasConfidenceScore
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 2) & 1;
}

- (void)setConfidenceScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 4u;
  self->_unsigned int confidenceScore = a3;
}

- (void)deleteGoodnessScore
{
  *(_WORD *)(&self->_isSelf + 1) &= ~2u;
}

- (void)setHasGoodnessScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFFD | v3;
}

- (BOOL)hasGoodnessScore
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 1) & 1;
}

- (void)setGoodnessScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 2u;
  self->_unsigned int goodnessScore = a3;
}

- (void)deleteAudioHash
{
  *(_WORD *)(&self->_isSelf + 1) &= ~1u;
}

- (void)setHasAudioHash:(BOOL)a3
{
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFFE | a3;
}

- (BOOL)hasAudioHash
{
  return *(_WORD *)(&self->_isSelf + 1) & 1;
}

- (void)setAudioHash:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 1u;
  self->_unsigned int audioHash = a3;
}

@end