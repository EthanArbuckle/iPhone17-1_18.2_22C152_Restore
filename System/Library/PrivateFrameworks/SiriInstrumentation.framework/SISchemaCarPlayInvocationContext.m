@interface SISchemaCarPlayInvocationContext
- (BOOL)hasBundleID;
- (BOOL)hasCarPlayConnection;
- (BOOL)hasDirectAction;
- (BOOL)hasEnhancedVoiceTriggerMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleID;
- (SISchemaCarPlayInvocationContext)initWithDictionary:(id)a3;
- (SISchemaCarPlayInvocationContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)carPlayConnection;
- (int)directAction;
- (int)enhancedVoiceTriggerMode;
- (unint64_t)hash;
- (void)deleteBundleID;
- (void)deleteCarPlayConnection;
- (void)deleteDirectAction;
- (void)deleteEnhancedVoiceTriggerMode;
- (void)setBundleID:(id)a3;
- (void)setCarPlayConnection:(int)a3;
- (void)setDirectAction:(int)a3;
- (void)setEnhancedVoiceTriggerMode:(int)a3;
- (void)setHasBundleID:(BOOL)a3;
- (void)setHasCarPlayConnection:(BOOL)a3;
- (void)setHasDirectAction:(BOOL)a3;
- (void)setHasEnhancedVoiceTriggerMode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaCarPlayInvocationContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasBundleID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)carPlayConnection
{
  return self->_carPlayConnection;
}

- (int)enhancedVoiceTriggerMode
{
  return self->_enhancedVoiceTriggerMode;
}

- (int)directAction
{
  return self->_directAction;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (SISchemaCarPlayInvocationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaCarPlayInvocationContext;
  v5 = [(SISchemaCarPlayInvocationContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaCarPlayInvocationContext *)v5 setBundleID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"directAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCarPlayInvocationContext setDirectAction:](v5, "setDirectAction:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"enhancedVoiceTriggerMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCarPlayInvocationContext setEnhancedVoiceTriggerMode:](v5, "setEnhancedVoiceTriggerMode:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"carPlayConnection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCarPlayInvocationContext setCarPlayConnection:](v5, "setCarPlayConnection:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaCarPlayInvocationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaCarPlayInvocationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaCarPlayInvocationContext *)self dictionaryRepresentation];
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
  if (self->_bundleID)
  {
    id v4 = [(SISchemaCarPlayInvocationContext *)self bundleID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleID"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    unsigned int v9 = [(SISchemaCarPlayInvocationContext *)self directAction] - 1;
    if (v9 > 9) {
      v10 = @"SIRIDIRECTACTION_UNKNOWN_DIRECT_ACTION";
    }
    else {
      v10 = off_1E5EB5828[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"directAction"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  unsigned int v7 = [(SISchemaCarPlayInvocationContext *)self carPlayConnection] - 1;
  if (v7 > 2) {
    v8 = @"CARPLAYCONNECTION_UNKNOWN";
  }
  else {
    v8 = off_1E5EB5810[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"carPlayConnection"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_15:
    unsigned int v11 = [(SISchemaCarPlayInvocationContext *)self enhancedVoiceTriggerMode] - 1;
    if (v11 > 3) {
      v12 = @"ENHANCEDVOICETRIGGERMODE_UNKNOWN";
    }
    else {
      v12 = off_1E5EB5878[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"enhancedVoiceTriggerMode"];
  }
LABEL_19:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_directAction;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_enhancedVoiceTriggerMode;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_carPlayConnection;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(SISchemaCarPlayInvocationContext *)self bundleID];
  uint64_t v6 = [v4 bundleID];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(SISchemaCarPlayInvocationContext *)self bundleID];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    v10 = [(SISchemaCarPlayInvocationContext *)self bundleID];
    unsigned int v11 = [v4 bundleID];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $AEE03CA14C3DBCAC50C071D8F575FF74 has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int directAction = self->_directAction;
    if (directAction != [v4 directAction]) {
      goto LABEL_20;
    }
    $AEE03CA14C3DBCAC50C071D8F575FF74 has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int enhancedVoiceTriggerMode = self->_enhancedVoiceTriggerMode;
    if (enhancedVoiceTriggerMode == [v4 enhancedVoiceTriggerMode])
    {
      $AEE03CA14C3DBCAC50C071D8F575FF74 has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int carPlayConnection = self->_carPlayConnection;
    if (carPlayConnection != [v4 carPlayConnection]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SISchemaCarPlayInvocationContext *)self bundleID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCarPlayInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteCarPlayConnection
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCarPlayConnection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCarPlayConnection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCarPlayConnection:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int carPlayConnection = a3;
}

- (void)deleteEnhancedVoiceTriggerMode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEnhancedVoiceTriggerMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnhancedVoiceTriggerMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnhancedVoiceTriggerMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int enhancedVoiceTriggerMode = a3;
}

- (void)deleteDirectAction
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDirectAction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDirectAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDirectAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int directAction = a3;
}

- (void)deleteBundleID
{
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

@end