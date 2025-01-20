@interface ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap
- (BOOL)hasDeviceAggregationId;
- (BOOL)hasUserAggregationId;
- (BOOL)hasUserAggregationIdExpirationTimestampMs;
- (BOOL)hasUserAggregationIdRotationTimestampMs;
- (BOOL)hasUserEphemeralId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)initWithDictionary:(id)a3;
- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)initWithJSON:(id)a3;
- (SISchemaUUID)deviceAggregationId;
- (SISchemaUUID)userAggregationId;
- (SISchemaUUID)userEphemeralId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)userAggregationIdExpirationTimestampMs;
- (unint64_t)userAggregationIdRotationTimestampMs;
- (void)deleteDeviceAggregationId;
- (void)deleteUserAggregationId;
- (void)deleteUserAggregationIdExpirationTimestampMs;
- (void)deleteUserAggregationIdRotationTimestampMs;
- (void)deleteUserEphemeralId;
- (void)setDeviceAggregationId:(id)a3;
- (void)setHasDeviceAggregationId:(BOOL)a3;
- (void)setHasUserAggregationId:(BOOL)a3;
- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3;
- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3;
- (void)setHasUserEphemeralId:(BOOL)a3;
- (void)setUserAggregationId:(id)a3;
- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3;
- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3;
- (void)setUserEphemeralId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deleteUserEphemeralId];
  }
  v9 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deleteUserAggregationId];
  }
  v12 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deleteDeviceAggregationId];
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
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
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

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap;
  v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)v5 setUserEphemeralId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"userAggregationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)v5 setUserAggregationId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"userAggregationIdRotationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationIdRotationTimestampMs:](v5, "setUserAggregationIdRotationTimestampMs:", [v10 unsignedLongLongValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"userAggregationIdExpirationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationIdExpirationTimestampMs:](v5, "setUserAggregationIdExpirationTimestampMs:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"deviceAggregationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)v5 setDeviceAggregationId:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self dictionaryRepresentation];
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
    id v4 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
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
    uint64_t v7 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];
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
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationIdExpirationTimestampMs](self, "userAggregationIdExpirationTimestampMs"));
    [v3 setObject:v11 forKeyedSubscript:@"userAggregationIdExpirationTimestampMs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationIdRotationTimestampMs](self, "userAggregationIdRotationTimestampMs"));
    [v3 setObject:v12 forKeyedSubscript:@"userAggregationIdRotationTimestampMs"];
  }
  if (self->_userEphemeralId)
  {
    v13 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];
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
LABEL_5:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_deviceAggregationId hash];
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_userAggregationIdExpirationTimestampMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_deviceAggregationId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  unint64_t v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];
  unint64_t v6 = [v4 userEphemeralId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];
    v10 = [v4 userEphemeralId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];
  unint64_t v6 = [v4 userAggregationId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v12 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];
    v15 = [v4 userAggregationId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $DBD19EE17EB715C058DA7D16A1F0D83B has = self->_has;
  unsigned int v18 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t userAggregationIdRotationTimestampMs = self->_userAggregationIdRotationTimestampMs;
    if (userAggregationIdRotationTimestampMs != [v4 userAggregationIdRotationTimestampMs]) {
      goto LABEL_24;
    }
    $DBD19EE17EB715C058DA7D16A1F0D83B has = self->_has;
    unsigned int v18 = v4[48];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    unint64_t userAggregationIdExpirationTimestampMs = self->_userAggregationIdExpirationTimestampMs;
    if (userAggregationIdExpirationTimestampMs != [v4 userAggregationIdExpirationTimestampMs]) {
      goto LABEL_24;
    }
  }
  unint64_t v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  unint64_t v6 = [v4 deviceAggregationId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v22 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  if (!v22)
  {

LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  v24 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
  v25 = [v4 deviceAggregationId];
  char v26 = [v24 isEqual:v25];

  if (v26) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_25:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];

  if (v4)
  {
    unint64_t v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userEphemeralId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self userAggregationId];
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
  v9 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];

  v10 = v12;
  if (v9)
  {
    int v11 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self deviceAggregationId];
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapReadFrom(self, (uint64_t)a3);
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