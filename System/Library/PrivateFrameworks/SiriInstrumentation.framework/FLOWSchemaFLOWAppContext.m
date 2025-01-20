@interface FLOWSchemaFLOWAppContext
- (BOOL)hasAppResolutionType;
- (BOOL)hasAppVersion;
- (BOOL)hasBundleId;
- (BOOL)hasIsSmartEnoughAppSelectionUsed;
- (BOOL)hasProtectedAppType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSmartEnoughAppSelectionUsed;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWAppContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWAppContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)appVersion;
- (NSString)bundleId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appResolutionType;
- (int)protectedAppType;
- (unint64_t)hash;
- (void)deleteAppResolutionType;
- (void)deleteAppVersion;
- (void)deleteBundleId;
- (void)deleteIsSmartEnoughAppSelectionUsed;
- (void)deleteProtectedAppType;
- (void)setAppResolutionType:(int)a3;
- (void)setAppVersion:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasAppResolutionType:(BOOL)a3;
- (void)setHasAppVersion:(BOOL)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasIsSmartEnoughAppSelectionUsed:(BOOL)a3;
- (void)setHasProtectedAppType:(BOOL)a3;
- (void)setIsSmartEnoughAppSelectionUsed:(BOOL)a3;
- (void)setProtectedAppType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWAppContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setHasAppVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)protectedAppType
{
  return self->_protectedAppType;
}

- (int)appResolutionType
{
  return self->_appResolutionType;
}

- (BOOL)isSmartEnoughAppSelectionUsed
{
  return self->_isSmartEnoughAppSelectionUsed;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (FLOWSchemaFLOWAppContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLOWSchemaFLOWAppContext;
  v5 = [(FLOWSchemaFLOWAppContext *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(FLOWSchemaFLOWAppContext *)v5 setBundleId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"appVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(FLOWSchemaFLOWAppContext *)v5 setAppVersion:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isSmartEnoughAppSelectionUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWAppContext setIsSmartEnoughAppSelectionUsed:](v5, "setIsSmartEnoughAppSelectionUsed:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appResolutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWAppContext setAppResolutionType:](v5, "setAppResolutionType:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"protectedAppType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWAppContext setProtectedAppType:](v5, "setProtectedAppType:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWAppContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWAppContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWAppContext *)self dictionaryRepresentation];
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
    unsigned int v4 = [(FLOWSchemaFLOWAppContext *)self appResolutionType] - 1;
    if (v4 > 0xC) {
      v5 = @"FLOWAPPRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EAE9E0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"appResolutionType"];
  }
  if (self->_appVersion)
  {
    v6 = [(FLOWSchemaFLOWAppContext *)self appVersion];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"appVersion"];
  }
  if (self->_bundleId)
  {
    v8 = [(FLOWSchemaFLOWAppContext *)self bundleId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"bundleId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWAppContext isSmartEnoughAppSelectionUsed](self, "isSmartEnoughAppSelectionUsed"));
    [v3 setObject:v11 forKeyedSubscript:@"isSmartEnoughAppSelectionUsed"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    unsigned int v12 = [(FLOWSchemaFLOWAppContext *)self protectedAppType] - 1;
    if (v12 > 2) {
      v13 = @"FLOWPROTECTEDAPPTYPE_UNKNOWN";
    }
    else {
      v13 = off_1E5EAEA48[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"protectedAppType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_appVersion hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_isSmartEnoughAppSelectionUsed;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_appResolutionType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_protectedAppType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(FLOWSchemaFLOWAppContext *)self bundleId];
  uint64_t v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(FLOWSchemaFLOWAppContext *)self bundleId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(FLOWSchemaFLOWAppContext *)self bundleId];
    v10 = [v4 bundleId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWAppContext *)self appVersion];
  uint64_t v6 = [v4 appVersion];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(FLOWSchemaFLOWAppContext *)self appVersion];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWAppContext *)self appVersion];
    objc_super v15 = [v4 appVersion];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $F05D26BC8273E1F3DDD6EB10D1D8A00E has = self->_has;
  unsigned int v20 = v4[36];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int isSmartEnoughAppSelectionUsed = self->_isSmartEnoughAppSelectionUsed;
      if (isSmartEnoughAppSelectionUsed != [v4 isSmartEnoughAppSelectionUsed]) {
        goto LABEL_12;
      }
      $F05D26BC8273E1F3DDD6EB10D1D8A00E has = self->_has;
      unsigned int v20 = v4[36];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        int appResolutionType = self->_appResolutionType;
        if (appResolutionType != [v4 appResolutionType]) {
          goto LABEL_12;
        }
        $F05D26BC8273E1F3DDD6EB10D1D8A00E has = self->_has;
        unsigned int v20 = v4[36];
      }
      int v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (!v24
          || (int protectedAppType = self->_protectedAppType,
              protectedAppType == [v4 protectedAppType]))
        {
          BOOL v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(FLOWSchemaFLOWAppContext *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(FLOWSchemaFLOWAppContext *)self appVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWAppContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteProtectedAppType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProtectedAppType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtectedAppType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProtectedAppType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int protectedAppType = a3;
}

- (void)deleteAppResolutionType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAppResolutionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppResolutionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppResolutionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int appResolutionType = a3;
}

- (void)deleteIsSmartEnoughAppSelectionUsed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSmartEnoughAppSelectionUsed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSmartEnoughAppSelectionUsed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSmartEnoughAppSelectionUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSmartEnoughAppSelectionUsed = a3;
}

- (void)deleteAppVersion
{
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end