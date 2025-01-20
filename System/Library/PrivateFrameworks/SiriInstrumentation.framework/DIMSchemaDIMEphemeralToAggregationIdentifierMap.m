@interface DIMSchemaDIMEphemeralToAggregationIdentifierMap
- (BOOL)hasDeviceAggregationId;
- (BOOL)hasUserAggregationId;
- (BOOL)hasUserAggregationIdExpirationTimestampMs;
- (BOOL)hasUserAggregationIdRotationTimestampMs;
- (BOOL)hasUserEphemeralId;
- (BOOL)hasUserSamplingId;
- (BOOL)hasUserSamplingIdExpirationTimestampMs;
- (BOOL)hasUserSamplingIdRotationTimestampMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)initWithDictionary:(id)a3;
- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)deviceAggregationId;
- (SISchemaUUID)userAggregationId;
- (SISchemaUUID)userEphemeralId;
- (SISchemaUUID)userSamplingId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)userAggregationIdExpirationTimestampMs;
- (unint64_t)userAggregationIdRotationTimestampMs;
- (unint64_t)userSamplingIdExpirationTimestampMs;
- (unint64_t)userSamplingIdRotationTimestampMs;
- (void)deleteDeviceAggregationId;
- (void)deleteUserAggregationId;
- (void)deleteUserAggregationIdExpirationTimestampMs;
- (void)deleteUserAggregationIdRotationTimestampMs;
- (void)deleteUserEphemeralId;
- (void)deleteUserSamplingId;
- (void)deleteUserSamplingIdExpirationTimestampMs;
- (void)deleteUserSamplingIdRotationTimestampMs;
- (void)setDeviceAggregationId:(id)a3;
- (void)setHasDeviceAggregationId:(BOOL)a3;
- (void)setHasUserAggregationId:(BOOL)a3;
- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3;
- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3;
- (void)setHasUserEphemeralId:(BOOL)a3;
- (void)setHasUserSamplingId:(BOOL)a3;
- (void)setHasUserSamplingIdExpirationTimestampMs:(BOOL)a3;
- (void)setHasUserSamplingIdRotationTimestampMs:(BOOL)a3;
- (void)setUserAggregationId:(id)a3;
- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3;
- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3;
- (void)setUserEphemeralId:(id)a3;
- (void)setUserSamplingId:(id)a3;
- (void)setUserSamplingIdExpirationTimestampMs:(unint64_t)a3;
- (void)setUserSamplingIdRotationTimestampMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DIMSchemaDIMEphemeralToAggregationIdentifierMap

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DIMSchemaDIMEphemeralToAggregationIdentifierMap;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deleteUserEphemeralId];
  }
  v9 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deleteUserAggregationId];
  }
  v12 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deleteDeviceAggregationId];
  }
  v15 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deleteUserSamplingId];
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
  objc_storeStrong((id *)&self->_userSamplingId, 0);
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
}

- (void)setHasUserSamplingId:(BOOL)a3
{
  self->_hasUserEphemeralId = a3;
}

- (void)setHasDeviceAggregationId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasUserAggregationId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)userSamplingIdExpirationTimestampMs
{
  return self->_userSamplingIdExpirationTimestampMs;
}

- (unint64_t)userSamplingIdRotationTimestampMs
{
  return self->_userSamplingIdRotationTimestampMs;
}

- (void)setUserSamplingId:(id)a3
{
}

- (SISchemaUUID)userSamplingId
{
  return self->_userSamplingId;
}

- (void)setDeviceAggregationId:(id)a3
{
}

- (SISchemaUUID)deviceAggregationId
{
  return self->_deviceAggregationId;
}

- (unint64_t)userAggregationIdExpirationTimestampMs
{
  return self->_userAggregationIdExpirationTimestampMs;
}

- (unint64_t)userAggregationIdRotationTimestampMs
{
  return self->_userAggregationIdRotationTimestampMs;
}

- (void)setUserAggregationId:(id)a3
{
}

- (SISchemaUUID)userAggregationId
{
  return self->_userAggregationId;
}

- (void)setUserEphemeralId:(id)a3
{
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIMSchemaDIMEphemeralToAggregationIdentifierMap;
  v5 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)v5 setUserEphemeralId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"userAggregationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)v5 setUserAggregationId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"userAggregationIdRotationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationIdRotationTimestampMs:](v5, "setUserAggregationIdRotationTimestampMs:", [v10 unsignedLongLongValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"userAggregationIdExpirationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationIdExpirationTimestampMs:](v5, "setUserAggregationIdExpirationTimestampMs:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"deviceAggregationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)v5 setDeviceAggregationId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"userSamplingId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)v5 setUserSamplingId:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"userSamplingIdRotationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingIdRotationTimestampMs:](v5, "setUserSamplingIdRotationTimestampMs:", [v16 unsignedLongLongValue]);
    }
    int v17 = [v4 objectForKeyedSubscript:@"userSamplingIdExpirationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingIdExpirationTimestampMs:](v5, "setUserSamplingIdExpirationTimestampMs:", [v17 unsignedLongLongValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self dictionaryRepresentation];
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
  if (self->_deviceAggregationId)
  {
    id v4 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"deviceAggregationId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"deviceAggregationId"];
    }
  }
  if (self->_userAggregationId)
  {
    uint64_t v7 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"userAggregationId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"userAggregationId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationIdExpirationTimestampMs](self, "userAggregationIdExpirationTimestampMs"));
    [v3 setObject:v11 forKeyedSubscript:@"userAggregationIdExpirationTimestampMs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationIdRotationTimestampMs](self, "userAggregationIdRotationTimestampMs"));
    [v3 setObject:v12 forKeyedSubscript:@"userAggregationIdRotationTimestampMs"];
  }
  if (self->_userEphemeralId)
  {
    v13 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"userEphemeralId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"userEphemeralId"];
    }
  }
  if (self->_userSamplingId)
  {
    v16 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"userSamplingId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"userSamplingId"];
    }
  }
  char v19 = (char)self->_has;
  if ((v19 & 8) != 0)
  {
    objc_super v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingIdExpirationTimestampMs](self, "userSamplingIdExpirationTimestampMs"));
    [v3 setObject:v20 forKeyedSubscript:@"userSamplingIdExpirationTimestampMs"];

    char v19 = (char)self->_has;
  }
  if ((v19 & 4) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingIdRotationTimestampMs](self, "userSamplingIdRotationTimestampMs"));
    [v3 setObject:v21 forKeyedSubscript:@"userSamplingIdRotationTimestampMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_userEphemeralId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_userAggregationId hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = 2654435761u * self->_userAggregationIdRotationTimestampMs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v6 = 2654435761u * self->_userAggregationIdExpirationTimestampMs;
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
LABEL_6:
  unint64_t v7 = [(SISchemaUUID *)self->_deviceAggregationId hash];
  unint64_t v8 = [(SISchemaUUID *)self->_userSamplingId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v9 = 2654435761u * self->_userSamplingIdRotationTimestampMs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  unint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v10 = 2654435761u * self->_userSamplingIdExpirationTimestampMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  unint64_t v5 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];
  unint64_t v6 = [v4 userEphemeralId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v7 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];
    unint64_t v10 = [v4 userEphemeralId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];
  unint64_t v6 = [v4 userAggregationId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v12 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];
    v15 = [v4 userAggregationId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  $A43B0B0B3A7EF5FDA9C5377DBC124AA6 has = self->_has;
  unsigned int v18 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t userAggregationIdRotationTimestampMs = self->_userAggregationIdRotationTimestampMs;
    if (userAggregationIdRotationTimestampMs != [v4 userAggregationIdRotationTimestampMs]) {
      goto LABEL_29;
    }
    $A43B0B0B3A7EF5FDA9C5377DBC124AA6 has = self->_has;
    unsigned int v18 = v4[72];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_29;
  }
  if (v20)
  {
    unint64_t userAggregationIdExpirationTimestampMs = self->_userAggregationIdExpirationTimestampMs;
    if (userAggregationIdExpirationTimestampMs != [v4 userAggregationIdExpirationTimestampMs]) {
      goto LABEL_29;
    }
  }
  unint64_t v5 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  unint64_t v6 = [v4 deviceAggregationId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v22 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
    v25 = [v4 deviceAggregationId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];
  unint64_t v6 = [v4 userSamplingId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v27 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];
    v30 = [v4 userSamplingId];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  $A43B0B0B3A7EF5FDA9C5377DBC124AA6 v34 = self->_has;
  int v35 = (*(unsigned int *)&v34 >> 2) & 1;
  unsigned int v36 = v4[72];
  if (v35 == ((v36 >> 2) & 1))
  {
    if (v35)
    {
      unint64_t userSamplingIdRotationTimestampMs = self->_userSamplingIdRotationTimestampMs;
      if (userSamplingIdRotationTimestampMs != [v4 userSamplingIdRotationTimestampMs]) {
        goto LABEL_29;
      }
      $A43B0B0B3A7EF5FDA9C5377DBC124AA6 v34 = self->_has;
      unsigned int v36 = v4[72];
    }
    int v38 = (*(unsigned int *)&v34 >> 3) & 1;
    if (v38 == ((v36 >> 3) & 1))
    {
      if (!v38
        || (unint64_t userSamplingIdExpirationTimestampMs = self->_userSamplingIdExpirationTimestampMs,
            userSamplingIdExpirationTimestampMs == [v4 userSamplingIdExpirationTimestampMs]))
      {
        BOOL v32 = 1;
        goto LABEL_30;
      }
    }
  }
LABEL_29:
  BOOL v32 = 0;
LABEL_30:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  unint64_t v4 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];

  if (v4)
  {
    unint64_t v5 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userEphemeralId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];

  if (v6)
  {
    uint64_t v7 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userAggregationId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v9 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];

  if (v9)
  {
    unint64_t v10 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];

  if (v11)
  {
    uint64_t v12 = [(DIMSchemaDIMEphemeralToAggregationIdentifierMap *)self userSamplingId];
    PBDataWriterWriteSubmessage();
  }
  char v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v13 = (char)self->_has;
  }
  int v14 = v15;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    int v14 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMEphemeralToAggregationIdentifierMapReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserSamplingIdExpirationTimestampMs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasUserSamplingIdExpirationTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserSamplingIdExpirationTimestampMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUserSamplingIdExpirationTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t userSamplingIdExpirationTimestampMs = a3;
}

- (void)deleteUserSamplingIdRotationTimestampMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasUserSamplingIdRotationTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserSamplingIdRotationTimestampMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUserSamplingIdRotationTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t userSamplingIdRotationTimestampMs = a3;
}

- (void)deleteUserSamplingId
{
}

- (BOOL)hasUserSamplingId
{
  return self->_userSamplingId != 0;
}

- (void)deleteDeviceAggregationId
{
}

- (BOOL)hasDeviceAggregationId
{
  return self->_deviceAggregationId != 0;
}

- (void)deleteUserAggregationIdExpirationTimestampMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserAggregationIdExpirationTimestampMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t userAggregationIdExpirationTimestampMs = a3;
}

- (void)deleteUserAggregationIdRotationTimestampMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserAggregationIdRotationTimestampMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t userAggregationIdRotationTimestampMs = a3;
}

- (void)deleteUserAggregationId
{
}

- (BOOL)hasUserAggregationId
{
  return self->_userAggregationId != 0;
}

- (void)deleteUserEphemeralId
{
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

@end