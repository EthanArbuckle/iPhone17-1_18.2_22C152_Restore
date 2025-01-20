@interface CDASchemaCDADebugElectionDecisionMade
- (BOOL)hasDeviceGroup;
- (BOOL)hasIsCrossDeviceArbitrationAllowed;
- (BOOL)isCrossDeviceArbitrationAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDADebugElectionDecisionMade)initWithDictionary:(id)a3;
- (CDASchemaCDADebugElectionDecisionMade)initWithJSON:(id)a3;
- (NSArray)advertisementDatas;
- (NSData)jsonData;
- (id)advertisementDataAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)advertisementDataCount;
- (unint64_t)hash;
- (unsigned)deviceGroup;
- (void)addAdvertisementData:(id)a3;
- (void)clearAdvertisementData;
- (void)deleteDeviceGroup;
- (void)deleteIsCrossDeviceArbitrationAllowed;
- (void)setAdvertisementDatas:(id)a3;
- (void)setDeviceGroup:(unsigned int)a3;
- (void)setHasDeviceGroup:(BOOL)a3;
- (void)setHasIsCrossDeviceArbitrationAllowed:(BOOL)a3;
- (void)setIsCrossDeviceArbitrationAllowed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDADebugElectionDecisionMade

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CDASchemaCDADebugElectionDecisionMade;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CDASchemaCDADebugElectionDecisionMade *)self advertisementDatas];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(CDASchemaCDADebugElectionDecisionMade *)self setAdvertisementDatas:v7];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (void)setAdvertisementDatas:(id)a3
{
}

- (NSArray)advertisementDatas
{
  return self->_advertisementDatas;
}

- (BOOL)isCrossDeviceArbitrationAllowed
{
  return self->_isCrossDeviceArbitrationAllowed;
}

- (CDASchemaCDADebugElectionDecisionMade)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CDASchemaCDADebugElectionDecisionMade;
  v5 = [(CDASchemaCDADebugElectionDecisionMade *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isCrossDeviceArbitrationAllowed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDADebugElectionDecisionMade setIsCrossDeviceArbitrationAllowed:](v5, "setIsCrossDeviceArbitrationAllowed:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"advertisementData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[CDASchemaCDAAdvertisementData alloc] initWithDictionary:v13];
              [(CDASchemaCDADebugElectionDecisionMade *)v5 addAdvertisementData:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      v6 = v18;
    }
    v15 = [v4 objectForKeyedSubscript:@"deviceGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDADebugElectionDecisionMade setDeviceGroup:](v5, "setDeviceGroup:", [v15 unsignedIntValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (CDASchemaCDADebugElectionDecisionMade)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDADebugElectionDecisionMade *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDADebugElectionDecisionMade *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_advertisementDatas count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_advertisementDatas;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"advertisementData"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDADebugElectionDecisionMade deviceGroup](self, "deviceGroup"));
    [v3 setObject:v13 forKeyedSubscript:@"deviceGroup"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDADebugElectionDecisionMade isCrossDeviceArbitrationAllowed](self, "isCrossDeviceArbitrationAllowed"));
    [v3 setObject:v14 forKeyedSubscript:@"isCrossDeviceArbitrationAllowed"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isCrossDeviceArbitrationAllowed;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_advertisementDatas hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_deviceGroup;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isCrossDeviceArbitrationAllowed = self->_isCrossDeviceArbitrationAllowed;
    if (isCrossDeviceArbitrationAllowed != [v4 isCrossDeviceArbitrationAllowed]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(CDASchemaCDADebugElectionDecisionMade *)self advertisementDatas];
  uint64_t v7 = [v4 advertisementDatas];
  uint64_t v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(CDASchemaCDADebugElectionDecisionMade *)self advertisementDatas];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(CDASchemaCDADebugElectionDecisionMade *)self advertisementDatas];
    uint64_t v12 = [v4 advertisementDatas];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    unsigned int deviceGroup = self->_deviceGroup;
    if (deviceGroup != [v4 deviceGroup]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_advertisementDatas;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDADebugElectionDecisionMadeReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeviceGroup
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDeviceGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceGroup
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeviceGroup:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int deviceGroup = a3;
}

- (id)advertisementDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_advertisementDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)advertisementDataCount
{
  return [(NSArray *)self->_advertisementDatas count];
}

- (void)addAdvertisementData:(id)a3
{
  id v4 = a3;
  advertisementDatas = self->_advertisementDatas;
  id v8 = v4;
  if (!advertisementDatas)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_advertisementDatas;
    self->_advertisementDatas = v6;

    id v4 = v8;
    advertisementDatas = self->_advertisementDatas;
  }
  [(NSArray *)advertisementDatas addObject:v4];
}

- (void)clearAdvertisementData
{
}

- (void)deleteIsCrossDeviceArbitrationAllowed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsCrossDeviceArbitrationAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsCrossDeviceArbitrationAllowed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsCrossDeviceArbitrationAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isCrossDeviceArbitrationAllowed = a3;
}

@end