@interface SISchemaEngagedAccessoryContext
- (BOOL)hasAccessoryBrand;
- (BOOL)hasAccessoryId;
- (BOOL)hasAccessoryModel;
- (BOOL)hasHomeKitAccessoryType;
- (BOOL)hasIsAudioPlaybackCapable;
- (BOOL)hasIsThirdPartyMusicEnabled;
- (BOOL)isAudioPlaybackCapable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThirdPartyMusicEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)accessoryBrand;
- (NSString)accessoryModel;
- (SISchemaEngagedAccessoryContext)initWithDictionary:(id)a3;
- (SISchemaEngagedAccessoryContext)initWithJSON:(id)a3;
- (SISchemaUUID)accessoryId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)homeKitAccessoryType;
- (unint64_t)hash;
- (void)deleteAccessoryBrand;
- (void)deleteAccessoryId;
- (void)deleteAccessoryModel;
- (void)deleteHomeKitAccessoryType;
- (void)deleteIsAudioPlaybackCapable;
- (void)deleteIsThirdPartyMusicEnabled;
- (void)setAccessoryBrand:(id)a3;
- (void)setAccessoryId:(id)a3;
- (void)setAccessoryModel:(id)a3;
- (void)setHasAccessoryBrand:(BOOL)a3;
- (void)setHasAccessoryId:(BOOL)a3;
- (void)setHasAccessoryModel:(BOOL)a3;
- (void)setHasHomeKitAccessoryType:(BOOL)a3;
- (void)setHasIsAudioPlaybackCapable:(BOOL)a3;
- (void)setHasIsThirdPartyMusicEnabled:(BOOL)a3;
- (void)setHomeKitAccessoryType:(int)a3;
- (void)setIsAudioPlaybackCapable:(BOOL)a3;
- (void)setIsThirdPartyMusicEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaEngagedAccessoryContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaEngagedAccessoryContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaEngagedAccessoryContext *)self accessoryId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaEngagedAccessoryContext *)self deleteAccessoryId];
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
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_accessoryBrand, 0);
  objc_storeStrong((id *)&self->_accessoryId, 0);
}

- (void)setHasAccessoryModel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasAccessoryBrand:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasAccessoryId:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 2) = a3;
}

- (BOOL)isThirdPartyMusicEnabled
{
  return self->_isThirdPartyMusicEnabled;
}

- (BOOL)isAudioPlaybackCapable
{
  return self->_isAudioPlaybackCapable;
}

- (void)setAccessoryModel:(id)a3
{
}

- (NSString)accessoryModel
{
  return self->_accessoryModel;
}

- (void)setAccessoryBrand:(id)a3
{
}

- (NSString)accessoryBrand
{
  return self->_accessoryBrand;
}

- (int)homeKitAccessoryType
{
  return self->_homeKitAccessoryType;
}

- (void)setAccessoryId:(id)a3
{
}

- (SISchemaUUID)accessoryId
{
  return self->_accessoryId;
}

- (SISchemaEngagedAccessoryContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SISchemaEngagedAccessoryContext;
  v5 = [(SISchemaEngagedAccessoryContext *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"accessoryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaEngagedAccessoryContext *)v5 setAccessoryId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"homeKitAccessoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEngagedAccessoryContext setHomeKitAccessoryType:](v5, "setHomeKitAccessoryType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"accessoryBrand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SISchemaEngagedAccessoryContext *)v5 setAccessoryBrand:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"accessoryModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(SISchemaEngagedAccessoryContext *)v5 setAccessoryModel:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"isAudioPlaybackCapable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEngagedAccessoryContext setIsAudioPlaybackCapable:](v5, "setIsAudioPlaybackCapable:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"isThirdPartyMusicEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEngagedAccessoryContext setIsThirdPartyMusicEnabled:](v5, "setIsThirdPartyMusicEnabled:", [v14 BOOLValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (SISchemaEngagedAccessoryContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaEngagedAccessoryContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaEngagedAccessoryContext *)self dictionaryRepresentation];
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
  if (self->_accessoryBrand)
  {
    id v4 = [(SISchemaEngagedAccessoryContext *)self accessoryBrand];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"accessoryBrand"];
  }
  if (self->_accessoryId)
  {
    v6 = [(SISchemaEngagedAccessoryContext *)self accessoryId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"accessoryId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"accessoryId"];
    }
  }
  if (self->_accessoryModel)
  {
    objc_super v9 = [(SISchemaEngagedAccessoryContext *)self accessoryModel];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"accessoryModel"];
  }
  char v11 = *(&self->_isThirdPartyMusicEnabled + 1);
  if (v11)
  {
    unsigned int v12 = [(SISchemaEngagedAccessoryContext *)self homeKitAccessoryType] - 1;
    if (v12 > 0x26) {
      v13 = @"HOMEKITACCESSORYTYPE_UNKNOWN_HOMEKIT_ACCESSORY_TYPE";
    }
    else {
      v13 = off_1E5EB6B48[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"homeKitAccessoryType"];
    char v11 = *(&self->_isThirdPartyMusicEnabled + 1);
  }
  if ((v11 & 2) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEngagedAccessoryContext isAudioPlaybackCapable](self, "isAudioPlaybackCapable"));
    [v3 setObject:v14 forKeyedSubscript:@"isAudioPlaybackCapable"];

    char v11 = *(&self->_isThirdPartyMusicEnabled + 1);
  }
  if ((v11 & 4) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEngagedAccessoryContext isThirdPartyMusicEnabled](self, "isThirdPartyMusicEnabled"));
    [v3 setObject:v15 forKeyedSubscript:@"isThirdPartyMusicEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_accessoryId hash];
  if (*(&self->_isThirdPartyMusicEnabled + 1)) {
    uint64_t v4 = 2654435761 * self->_homeKitAccessoryType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_accessoryBrand hash];
  NSUInteger v6 = [(NSString *)self->_accessoryModel hash];
  if ((*(&self->_isThirdPartyMusicEnabled + 1) & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_isAudioPlaybackCapable;
    if ((*(&self->_isThirdPartyMusicEnabled + 1) & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(&self->_isThirdPartyMusicEnabled + 1) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_isThirdPartyMusicEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  NSUInteger v5 = [(SISchemaEngagedAccessoryContext *)self accessoryId];
  NSUInteger v6 = [v4 accessoryId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(SISchemaEngagedAccessoryContext *)self accessoryId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    objc_super v9 = [(SISchemaEngagedAccessoryContext *)self accessoryId];
    v10 = [v4 accessoryId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (*(&self->_isThirdPartyMusicEnabled + 1) != (v4[42] & 1)) {
    goto LABEL_20;
  }
  if (*(&self->_isThirdPartyMusicEnabled + 1))
  {
    int homeKitAccessoryType = self->_homeKitAccessoryType;
    if (homeKitAccessoryType != [v4 homeKitAccessoryType]) {
      goto LABEL_20;
    }
  }
  NSUInteger v5 = [(SISchemaEngagedAccessoryContext *)self accessoryBrand];
  NSUInteger v6 = [v4 accessoryBrand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(SISchemaEngagedAccessoryContext *)self accessoryBrand];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(SISchemaEngagedAccessoryContext *)self accessoryBrand];
    v16 = [v4 accessoryBrand];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaEngagedAccessoryContext *)self accessoryModel];
  NSUInteger v6 = [v4 accessoryModel];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v18 = [(SISchemaEngagedAccessoryContext *)self accessoryModel];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(SISchemaEngagedAccessoryContext *)self accessoryModel];
    v21 = [v4 accessoryModel];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unsigned int v25 = *((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1);
  int v26 = (v25 >> 1) & 1;
  unsigned int v27 = v4[42];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      int isAudioPlaybackCapable = self->_isAudioPlaybackCapable;
      if (isAudioPlaybackCapable != [v4 isAudioPlaybackCapable]) {
        goto LABEL_20;
      }
      unsigned int v25 = *((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1);
      unsigned int v27 = v4[42];
    }
    int v29 = (v25 >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (int isThirdPartyMusicEnabled = self->_isThirdPartyMusicEnabled,
            isThirdPartyMusicEnabled == [v4 isThirdPartyMusicEnabled]))
      {
        BOOL v23 = 1;
        goto LABEL_21;
      }
    }
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SISchemaEngagedAccessoryContext *)self accessoryId];

  if (v4)
  {
    NSUInteger v5 = [(SISchemaEngagedAccessoryContext *)self accessoryId];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isThirdPartyMusicEnabled + 1)) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(SISchemaEngagedAccessoryContext *)self accessoryBrand];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SISchemaEngagedAccessoryContext *)self accessoryModel];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char v8 = *(&self->_isThirdPartyMusicEnabled + 1);
  objc_super v9 = v10;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    objc_super v9 = v10;
    char v8 = *(&self->_isThirdPartyMusicEnabled + 1);
  }
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    objc_super v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEngagedAccessoryContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsThirdPartyMusicEnabled
{
  *(&self->_isThirdPartyMusicEnabled + 1) &= ~4u;
}

- (void)setHasIsThirdPartyMusicEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isThirdPartyMusicEnabled + 1) = *(&self->_isThirdPartyMusicEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasIsThirdPartyMusicEnabled
{
  return (*((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1) >> 2) & 1;
}

- (void)setIsThirdPartyMusicEnabled:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) |= 4u;
  self->_int isThirdPartyMusicEnabled = a3;
}

- (void)deleteIsAudioPlaybackCapable
{
  *(&self->_isThirdPartyMusicEnabled + 1) &= ~2u;
}

- (void)setHasIsAudioPlaybackCapable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isThirdPartyMusicEnabled + 1) = *(&self->_isThirdPartyMusicEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsAudioPlaybackCapable
{
  return (*((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1) >> 1) & 1;
}

- (void)setIsAudioPlaybackCapable:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) |= 2u;
  self->_int isAudioPlaybackCapable = a3;
}

- (void)deleteAccessoryModel
{
}

- (BOOL)hasAccessoryModel
{
  return self->_accessoryModel != 0;
}

- (void)deleteAccessoryBrand
{
}

- (BOOL)hasAccessoryBrand
{
  return self->_accessoryBrand != 0;
}

- (void)deleteHomeKitAccessoryType
{
  *(&self->_isThirdPartyMusicEnabled + 1) &= ~1u;
}

- (void)setHasHomeKitAccessoryType:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) = *(&self->_isThirdPartyMusicEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasHomeKitAccessoryType
{
  return *(&self->_isThirdPartyMusicEnabled + 1);
}

- (void)setHomeKitAccessoryType:(int)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) |= 1u;
  self->_int homeKitAccessoryType = a3;
}

- (void)deleteAccessoryId
{
}

- (BOOL)hasAccessoryId
{
  return self->_accessoryId != 0;
}

@end