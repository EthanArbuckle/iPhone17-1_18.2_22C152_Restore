@interface ANCSchemaANCBackgroundContent
- (ANCSchemaANCBackgroundContent)initWithDictionary:(id)a3;
- (ANCSchemaANCBackgroundContent)initWithJSON:(id)a3;
- (BOOL)hasIsFocusModeEnabled;
- (BOOL)hasMediaType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFocusModeEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mediaType;
- (unint64_t)hash;
- (void)deleteIsFocusModeEnabled;
- (void)deleteMediaType;
- (void)setHasIsFocusModeEnabled:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setIsFocusModeEnabled:(BOOL)a3;
- (void)setMediaType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCBackgroundContent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isFocusModeEnabled
{
  return self->_isFocusModeEnabled;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (ANCSchemaANCBackgroundContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ANCSchemaANCBackgroundContent;
  v5 = [(ANCSchemaANCBackgroundContent *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCBackgroundContent setMediaType:](v5, "setMediaType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isFocusModeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCBackgroundContent setIsFocusModeEnabled:](v5, "setIsFocusModeEnabled:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ANCSchemaANCBackgroundContent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCBackgroundContent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCBackgroundContent *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isFocusModeEnabled + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ANCSchemaANCBackgroundContent isFocusModeEnabled](self, "isFocusModeEnabled"));
    [v3 setObject:v5 forKeyedSubscript:@"isFocusModeEnabled"];

    char v4 = *(&self->_isFocusModeEnabled + 1);
  }
  if (v4)
  {
    unsigned int v6 = [(ANCSchemaANCBackgroundContent *)self mediaType] - 1;
    if (v6 > 5) {
      uint64_t v7 = @"ANCMEDIATYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB9D58[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"mediaType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isFocusModeEnabled + 1))
  {
    uint64_t v2 = 2654435761 * self->_mediaType;
    if ((*(&self->_isFocusModeEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_isFocusModeEnabled + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isFocusModeEnabled;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isFocusModeEnabled + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int mediaType = self->_mediaType;
    if (mediaType != [v4 mediaType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isFocusModeEnabled + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int isFocusModeEnabled = self->_isFocusModeEnabled;
    if (isFocusModeEnabled != [v4 isFocusModeEnabled]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_isFocusModeEnabled + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_isFocusModeEnabled + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCBackgroundContentReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsFocusModeEnabled
{
  *(&self->_isFocusModeEnabled + 1) &= ~2u;
}

- (void)setHasIsFocusModeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isFocusModeEnabled + 1) = *(&self->_isFocusModeEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsFocusModeEnabled
{
  return (*((unsigned __int8 *)&self->_isFocusModeEnabled + 1) >> 1) & 1;
}

- (void)setIsFocusModeEnabled:(BOOL)a3
{
  *(&self->_isFocusModeEnabled + 1) |= 2u;
  self->_int isFocusModeEnabled = a3;
}

- (void)deleteMediaType
{
  *(&self->_isFocusModeEnabled + 1) &= ~1u;
}

- (void)setHasMediaType:(BOOL)a3
{
  *(&self->_isFocusModeEnabled + 1) = *(&self->_isFocusModeEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasMediaType
{
  return *(&self->_isFocusModeEnabled + 1);
}

- (void)setMediaType:(int)a3
{
  *(&self->_isFocusModeEnabled + 1) |= 1u;
  self->_int mediaType = a3;
}

@end