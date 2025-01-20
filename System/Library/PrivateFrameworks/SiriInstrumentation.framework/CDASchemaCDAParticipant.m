@interface CDASchemaCDAParticipant
- (BOOL)hasDeviceClass;
- (BOOL)hasElectionParticipantId;
- (BOOL)hasGoodnessScore;
- (BOOL)hasProductType;
- (BOOL)hasRotatedElectionParticipantId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAParticipant)initWithDictionary:(id)a3;
- (CDASchemaCDAParticipant)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)electionParticipantId;
- (SISchemaUUID)rotatedElectionParticipantId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)deviceClass;
- (unint64_t)hash;
- (unsigned)goodnessScore;
- (unsigned)productType;
- (void)deleteDeviceClass;
- (void)deleteElectionParticipantId;
- (void)deleteGoodnessScore;
- (void)deleteProductType;
- (void)deleteRotatedElectionParticipantId;
- (void)setDeviceClass:(int)a3;
- (void)setElectionParticipantId:(id)a3;
- (void)setGoodnessScore:(unsigned int)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasElectionParticipantId:(BOOL)a3;
- (void)setHasGoodnessScore:(BOOL)a3;
- (void)setHasProductType:(BOOL)a3;
- (void)setHasRotatedElectionParticipantId:(BOOL)a3;
- (void)setProductType:(unsigned int)a3;
- (void)setRotatedElectionParticipantId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAParticipant

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDASchemaCDAParticipant;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(CDASchemaCDAParticipant *)self electionParticipantId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CDASchemaCDAParticipant *)self deleteElectionParticipantId];
  }
  v9 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CDASchemaCDAParticipant *)self deleteRotatedElectionParticipantId];
  }

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
  objc_storeStrong((id *)&self->_rotatedElectionParticipantId, 0);
  objc_storeStrong((id *)&self->_electionParticipantId, 0);
}

- (void)setHasRotatedElectionParticipantId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasElectionParticipantId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRotatedElectionParticipantId:(id)a3
{
}

- (SISchemaUUID)rotatedElectionParticipantId
{
  return self->_rotatedElectionParticipantId;
}

- (void)setElectionParticipantId:(id)a3
{
}

- (SISchemaUUID)electionParticipantId
{
  return self->_electionParticipantId;
}

- (unsigned)productType
{
  return self->_productType;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (CDASchemaCDAParticipant)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDASchemaCDAParticipant;
  v5 = [(CDASchemaCDAParticipant *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"goodnessScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAParticipant setGoodnessScore:](v5, "setGoodnessScore:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"deviceClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAParticipant setDeviceClass:](v5, "setDeviceClass:", [v7 intValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAParticipant setProductType:](v5, "setProductType:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"electionParticipantId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(CDASchemaCDAParticipant *)v5 setElectionParticipantId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"rotatedElectionParticipantId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(CDASchemaCDAParticipant *)v5 setRotatedElectionParticipantId:v12];
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (CDASchemaCDAParticipant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAParticipant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAParticipant *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v4 = [(CDASchemaCDAParticipant *)self deviceClass] - 1;
    if (v4 > 0xB) {
      v5 = @"CDADEVICECLASS_UNKNOWN";
    }
    else {
      v5 = off_1E5EAD050[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"deviceClass"];
  }
  if (self->_electionParticipantId)
  {
    v6 = [(CDASchemaCDAParticipant *)self electionParticipantId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"electionParticipantId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"electionParticipantId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAParticipant goodnessScore](self, "goodnessScore"));
    [v3 setObject:v10 forKeyedSubscript:@"goodnessScore"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAParticipant productType](self, "productType"));
    [v3 setObject:v11 forKeyedSubscript:@"productType"];
  }
  if (self->_rotatedElectionParticipantId)
  {
    v12 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"rotatedElectionParticipantId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"rotatedElectionParticipantId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_goodnessScore;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_deviceClass;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_productType;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_electionParticipantId hash];
  return v6 ^ [(SISchemaUUID *)self->_rotatedElectionParticipantId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  $9F3D01B5CE01E8F52C53159BF086F1CB has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int goodnessScore = self->_goodnessScore;
    if (goodnessScore != [v4 goodnessScore]) {
      goto LABEL_23;
    }
    $9F3D01B5CE01E8F52C53159BF086F1CB has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int deviceClass = self->_deviceClass;
      if (deviceClass != [v4 deviceClass]) {
        goto LABEL_23;
      }
      $9F3D01B5CE01E8F52C53159BF086F1CB has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_23;
    }
    if (v10)
    {
      unsigned int productType = self->_productType;
      if (productType != [v4 productType]) {
        goto LABEL_23;
      }
    }
    v12 = [(CDASchemaCDAParticipant *)self electionParticipantId];
    objc_super v13 = [v4 electionParticipantId];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_22;
    }
    uint64_t v14 = [(CDASchemaCDAParticipant *)self electionParticipantId];
    if (v14)
    {
      objc_super v15 = (void *)v14;
      v16 = [(CDASchemaCDAParticipant *)self electionParticipantId];
      v17 = [v4 electionParticipantId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    v12 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];
    objc_super v13 = [v4 rotatedElectionParticipantId];
    if ((v12 == 0) != (v13 != 0))
    {
      uint64_t v19 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];
      if (!v19)
      {

LABEL_26:
        BOOL v24 = 1;
        goto LABEL_24;
      }
      v20 = (void *)v19;
      v21 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];
      v22 = [v4 rotatedElectionParticipantId];
      char v23 = [v21 isEqual:v22];

      if (v23) {
        goto LABEL_26;
      }
    }
    else
    {
LABEL_22:
    }
  }
LABEL_23:
  BOOL v24 = 0;
LABEL_24:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  uint64_t v5 = [(CDASchemaCDAParticipant *)self electionParticipantId];

  if (v5)
  {
    unsigned int v6 = [(CDASchemaCDAParticipant *)self electionParticipantId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];

  int v8 = v10;
  if (v7)
  {
    v9 = [(CDASchemaCDAParticipant *)self rotatedElectionParticipantId];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAParticipantReadFrom(self, (uint64_t)a3);
}

- (void)deleteRotatedElectionParticipantId
{
}

- (BOOL)hasRotatedElectionParticipantId
{
  return self->_rotatedElectionParticipantId != 0;
}

- (void)deleteElectionParticipantId
{
}

- (BOOL)hasElectionParticipantId
{
  return self->_electionParticipantId != 0;
}

- (void)deleteProductType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProductType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProductType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProductType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int productType = a3;
}

- (void)deleteDeviceClass
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeviceClass:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int deviceClass = a3;
}

- (void)deleteGoodnessScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasGoodnessScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGoodnessScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGoodnessScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int goodnessScore = a3;
}

@end