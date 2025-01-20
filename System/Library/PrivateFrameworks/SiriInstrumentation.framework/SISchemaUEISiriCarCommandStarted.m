@interface SISchemaUEISiriCarCommandStarted
- (BOOL)hasCarPlayConnection;
- (BOOL)hasIsEnhancedSiriEnabled;
- (BOOL)hasIsEnhancedSiriRequest;
- (BOOL)isEnhancedSiriEnabled;
- (BOOL)isEnhancedSiriRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEISiriCarCommandStarted)initWithDictionary:(id)a3;
- (SISchemaUEISiriCarCommandStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)carPlayConnection;
- (unint64_t)hash;
- (void)deleteCarPlayConnection;
- (void)deleteIsEnhancedSiriEnabled;
- (void)deleteIsEnhancedSiriRequest;
- (void)setCarPlayConnection:(int)a3;
- (void)setHasCarPlayConnection:(BOOL)a3;
- (void)setHasIsEnhancedSiriEnabled:(BOOL)a3;
- (void)setHasIsEnhancedSiriRequest:(BOOL)a3;
- (void)setIsEnhancedSiriEnabled:(BOOL)a3;
- (void)setIsEnhancedSiriRequest:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEISiriCarCommandStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isEnhancedSiriRequest
{
  return self->_isEnhancedSiriRequest;
}

- (BOOL)isEnhancedSiriEnabled
{
  return self->_isEnhancedSiriEnabled;
}

- (int)carPlayConnection
{
  return self->_carPlayConnection;
}

- (SISchemaUEISiriCarCommandStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEISiriCarCommandStarted;
  v5 = [(SISchemaUEISiriCarCommandStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"carPlayConnection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEISiriCarCommandStarted setCarPlayConnection:](v5, "setCarPlayConnection:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isEnhancedSiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEISiriCarCommandStarted setIsEnhancedSiriEnabled:](v5, "setIsEnhancedSiriEnabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isEnhancedSiriRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEISiriCarCommandStarted setIsEnhancedSiriRequest:](v5, "setIsEnhancedSiriRequest:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaUEISiriCarCommandStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEISiriCarCommandStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEISiriCarCommandStarted *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isEnhancedSiriRequest + 1);
  if (v4)
  {
    unsigned int v5 = [(SISchemaUEISiriCarCommandStarted *)self carPlayConnection] - 1;
    if (v5 > 2) {
      v6 = @"CARPLAYCONNECTION_UNKNOWN";
    }
    else {
      v6 = off_1E5EBC170[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"carPlayConnection"];
    char v4 = *(&self->_isEnhancedSiriRequest + 1);
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEISiriCarCommandStarted isEnhancedSiriEnabled](self, "isEnhancedSiriEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isEnhancedSiriEnabled"];

    char v4 = *(&self->_isEnhancedSiriRequest + 1);
  }
  if ((v4 & 4) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEISiriCarCommandStarted isEnhancedSiriRequest](self, "isEnhancedSiriRequest"));
    [v3 setObject:v8 forKeyedSubscript:@"isEnhancedSiriRequest"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isEnhancedSiriRequest + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_isEnhancedSiriRequest + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_isEnhancedSiriRequest + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_carPlayConnection;
  if ((*(&self->_isEnhancedSiriRequest + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isEnhancedSiriEnabled;
  if ((*(&self->_isEnhancedSiriRequest + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isEnhancedSiriRequest;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1);
  unsigned int v6 = v4[14];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int carPlayConnection = self->_carPlayConnection;
    if (carPlayConnection != [v4 carPlayConnection]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1);
    unsigned int v6 = v4[14];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int isEnhancedSiriEnabled = self->_isEnhancedSiriEnabled;
    if (isEnhancedSiriEnabled == [v4 isEnhancedSiriEnabled])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1);
      unsigned int v6 = v4[14];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int isEnhancedSiriRequest = self->_isEnhancedSiriRequest;
    if (isEnhancedSiriRequest != [v4 isEnhancedSiriRequest]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_isEnhancedSiriRequest + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_isEnhancedSiriRequest + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isEnhancedSiriRequest + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(&self->_isEnhancedSiriRequest + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEISiriCarCommandStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEnhancedSiriRequest
{
  *(&self->_isEnhancedSiriRequest + 1) &= ~4u;
}

- (void)setHasIsEnhancedSiriRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEnhancedSiriRequest + 1) = *(&self->_isEnhancedSiriRequest + 1) & 0xFB | v3;
}

- (BOOL)hasIsEnhancedSiriRequest
{
  return (*((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1) >> 2) & 1;
}

- (void)setIsEnhancedSiriRequest:(BOOL)a3
{
  *(&self->_isEnhancedSiriRequest + 1) |= 4u;
  self->_int isEnhancedSiriRequest = a3;
}

- (void)deleteIsEnhancedSiriEnabled
{
  *(&self->_isEnhancedSiriRequest + 1) &= ~2u;
}

- (void)setHasIsEnhancedSiriEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEnhancedSiriRequest + 1) = *(&self->_isEnhancedSiriRequest + 1) & 0xFD | v3;
}

- (BOOL)hasIsEnhancedSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isEnhancedSiriRequest + 1) >> 1) & 1;
}

- (void)setIsEnhancedSiriEnabled:(BOOL)a3
{
  *(&self->_isEnhancedSiriRequest + 1) |= 2u;
  self->_int isEnhancedSiriEnabled = a3;
}

- (void)deleteCarPlayConnection
{
  *(&self->_isEnhancedSiriRequest + 1) &= ~1u;
}

- (void)setHasCarPlayConnection:(BOOL)a3
{
  *(&self->_isEnhancedSiriRequest + 1) = *(&self->_isEnhancedSiriRequest + 1) & 0xFE | a3;
}

- (BOOL)hasCarPlayConnection
{
  return *(&self->_isEnhancedSiriRequest + 1);
}

- (void)setCarPlayConnection:(int)a3
{
  *(&self->_isEnhancedSiriRequest + 1) |= 1u;
  self->_int carPlayConnection = a3;
}

@end