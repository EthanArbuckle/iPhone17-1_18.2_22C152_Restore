@interface DonationSchemaSDSpeechDonationEventMetaData
- (BOOL)hasDeviceType;
- (BOOL)hasSdId;
- (BOOL)hasSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DonationSchemaSDSpeechDonationEventMetaData)initWithDictionary:(id)a3;
- (DonationSchemaSDSpeechDonationEventMetaData)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)systemBuild;
- (SISchemaUUID)sdId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)deviceType;
- (unint64_t)hash;
- (void)deleteDeviceType;
- (void)deleteSdId;
- (void)deleteSystemBuild;
- (void)setDeviceType:(int)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasSdId:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setSdId:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DonationSchemaSDSpeechDonationEventMetaData

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DonationSchemaSDSpeechDonationEventMetaData;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DonationSchemaSDSpeechDonationEventMetaData *)self deleteSdId];
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
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_sdId, 0);
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSdId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setSdId:(id)a3
{
}

- (SISchemaUUID)sdId
{
  return self->_sdId;
}

- (DonationSchemaSDSpeechDonationEventMetaData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DonationSchemaSDSpeechDonationEventMetaData;
  v5 = [(DonationSchemaSDSpeechDonationEventMetaData *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sdId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DonationSchemaSDSpeechDonationEventMetaData *)v5 setSdId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DonationSchemaSDSpeechDonationEventMetaData setDeviceType:](v5, "setDeviceType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(DonationSchemaSDSpeechDonationEventMetaData *)v5 setSystemBuild:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (DonationSchemaSDSpeechDonationEventMetaData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DonationSchemaSDSpeechDonationEventMetaData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DonationSchemaSDSpeechDonationEventMetaData *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(DonationSchemaSDSpeechDonationEventMetaData *)self deviceType] - 1;
    if (v4 > 7) {
      v5 = @"DEVICEFAMILY_UNKNOWN";
    }
    else {
      v5 = off_1E5EBDDF0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"deviceType"];
  }
  if (self->_sdId)
  {
    v6 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"sdId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"sdId"];
    }
  }
  if (self->_systemBuild)
  {
    objc_super v9 = [(DonationSchemaSDSpeechDonationEventMetaData *)self systemBuild];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"systemBuild"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_sdId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_deviceType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_systemBuild hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];
  v6 = [v4 sdId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];
    v10 = [v4 sdId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int deviceType = self->_deviceType;
    if (deviceType != [v4 deviceType]) {
      goto LABEL_15;
    }
  }
  v5 = [(DonationSchemaSDSpeechDonationEventMetaData *)self systemBuild];
  v6 = [v4 systemBuild];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(DonationSchemaSDSpeechDonationEventMetaData *)self systemBuild];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(DonationSchemaSDSpeechDonationEventMetaData *)self systemBuild];
    v16 = [v4 systemBuild];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];

  if (v4)
  {
    v5 = [(DonationSchemaSDSpeechDonationEventMetaData *)self sdId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(DonationSchemaSDSpeechDonationEventMetaData *)self systemBuild];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DonationSchemaSDSpeechDonationEventMetaDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteDeviceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int deviceType = a3;
}

- (void)deleteSdId
{
}

- (BOOL)hasSdId
{
  return self->_sdId != 0;
}

@end