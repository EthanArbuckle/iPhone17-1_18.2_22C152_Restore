@interface IDENTITYSchemaIDENTITYUserPresenceMetadata
- (BOOL)hasLoggableMultiUserSharedUserId;
- (BOOL)hasUserEphemeralId;
- (BOOL)hasUserLocation;
- (BOOL)hasUserLocationSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYUserPresenceMetadata)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYUserPresenceMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)loggableMultiUserSharedUserId;
- (SISchemaUUID)userEphemeralId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)userLocation;
- (int)userLocationSource;
- (unint64_t)hash;
- (void)deleteLoggableMultiUserSharedUserId;
- (void)deleteUserEphemeralId;
- (void)deleteUserLocation;
- (void)deleteUserLocationSource;
- (void)setHasLoggableMultiUserSharedUserId:(BOOL)a3;
- (void)setHasUserEphemeralId:(BOOL)a3;
- (void)setHasUserLocation:(BOOL)a3;
- (void)setHasUserLocationSource:(BOOL)a3;
- (void)setLoggableMultiUserSharedUserId:(id)a3;
- (void)setUserEphemeralId:(id)a3;
- (void)setUserLocation:(int)a3;
- (void)setUserLocationSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYUserPresenceMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDENTITYSchemaIDENTITYUserPresenceMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self deleteUserEphemeralId];
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
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
  objc_storeStrong((id *)&self->_loggableMultiUserSharedUserId, 0);
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLoggableMultiUserSharedUserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUserEphemeralId:(id)a3
{
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (int)userLocationSource
{
  return self->_userLocationSource;
}

- (int)userLocation
{
  return self->_userLocation;
}

- (void)setLoggableMultiUserSharedUserId:(id)a3
{
}

- (NSString)loggableMultiUserSharedUserId
{
  return self->_loggableMultiUserSharedUserId;
}

- (IDENTITYSchemaIDENTITYUserPresenceMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDENTITYSchemaIDENTITYUserPresenceMetadata;
  v5 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"loggableMultiUserSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)v5 setLoggableMultiUserSharedUserId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"userLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserLocation:](v5, "setUserLocation:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"userLocationSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserLocationSource:](v5, "setUserLocationSource:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"userEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)v5 setUserEphemeralId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYUserPresenceMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self dictionaryRepresentation];
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
  if (self->_loggableMultiUserSharedUserId)
  {
    id v4 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self loggableMultiUserSharedUserId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"loggableMultiUserSharedUserId"];
  }
  if (self->_userEphemeralId)
  {
    v6 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"userEphemeralId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"userEphemeralId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    int v10 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userLocation];
    v11 = @"IDENTITYUSERLOCATION_UNKNOWN";
    if (v10 == 1) {
      v11 = @"IDENTITYUSERLOCATION_HOME";
    }
    if (v10 == 2) {
      v12 = @"IDENTITYUSERLOCATION_AWAY";
    }
    else {
      v12 = v11;
    }
    [v3 setObject:v12 forKeyedSubscript:@"userLocation"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v13 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userLocationSource];
    objc_super v14 = @"IDENTITYUSERPRESENCESOURCE_UNKNOWN";
    if (v13 == 1) {
      objc_super v14 = @"IDENTITYUSERPRESENCESOURCE_GEO_FENCE";
    }
    if (v13 == 2) {
      v15 = @"IDENTITYUSERPRESENCESOURCE_DEVICE_DISCOVERY";
    }
    else {
      v15 = v14;
    }
    [v3 setObject:v15 forKeyedSubscript:@"userLocationSource"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_loggableMultiUserSharedUserId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_userLocation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_userEphemeralId hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_userLocationSource;
  return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_userEphemeralId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self loggableMultiUserSharedUserId];
  v6 = [v4 loggableMultiUserSharedUserId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self loggableMultiUserSharedUserId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self loggableMultiUserSharedUserId];
    int v10 = [v4 loggableMultiUserSharedUserId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $0F6B81A10D08CC7CBD1B3A5B348F6638 has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int userLocation = self->_userLocation;
    if (userLocation != [v4 userLocation]) {
      goto LABEL_19;
    }
    $0F6B81A10D08CC7CBD1B3A5B348F6638 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    int userLocationSource = self->_userLocationSource;
    if (userLocationSource != [v4 userLocationSource]) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];
  v6 = [v4 userEphemeralId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];
  if (!v17)
  {

LABEL_22:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];
  v20 = [v4 userEphemeralId];
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self loggableMultiUserSharedUserId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];

  uint64_t v7 = v9;
  if (v6)
  {
    v8 = [(IDENTITYSchemaIDENTITYUserPresenceMetadata *)self userEphemeralId];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYUserPresenceMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserEphemeralId
{
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteUserLocationSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUserLocationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserLocationSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserLocationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int userLocationSource = a3;
}

- (void)deleteUserLocation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserLocation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int userLocation = a3;
}

- (void)deleteLoggableMultiUserSharedUserId
{
}

- (BOOL)hasLoggableMultiUserSharedUserId
{
  return self->_loggableMultiUserSharedUserId != 0;
}

@end