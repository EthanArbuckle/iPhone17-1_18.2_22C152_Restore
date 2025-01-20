@interface NLRouterSchemaNLRouterPromptGenerationSignalsCaptured
- (BOOL)hasIsAppFocused;
- (BOOL)hasIsMediaFocused;
- (BOOL)hasIsMediaRichAppFocused;
- (BOOL)isAppFocused;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaFocused;
- (BOOL)isMediaRichAppFocused;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsAppFocused;
- (void)deleteIsMediaFocused;
- (void)deleteIsMediaRichAppFocused;
- (void)setHasIsAppFocused:(BOOL)a3;
- (void)setHasIsMediaFocused:(BOOL)a3;
- (void)setHasIsMediaRichAppFocused:(BOOL)a3;
- (void)setIsAppFocused:(BOOL)a3;
- (void)setIsMediaFocused:(BOOL)a3;
- (void)setIsMediaRichAppFocused:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterPromptGenerationSignalsCaptured

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isMediaFocused
{
  return self->_isMediaFocused;
}

- (BOOL)isMediaRichAppFocused
{
  return self->_isMediaRichAppFocused;
}

- (BOOL)isAppFocused
{
  return self->_isAppFocused;
}

- (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterPromptGenerationSignalsCaptured;
  v5 = [(NLRouterSchemaNLRouterPromptGenerationSignalsCaptured *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAppFocused"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured setIsAppFocused:](v5, "setIsAppFocused:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isMediaRichAppFocused"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured setIsMediaRichAppFocused:](v5, "setIsMediaRichAppFocused:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isMediaFocused"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured setIsMediaFocused:](v5, "setIsMediaFocused:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterPromptGenerationSignalsCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterPromptGenerationSignalsCaptured *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isMediaFocused + 1);
  if (v4)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured isAppFocused](self, "isAppFocused"));
    [v3 setObject:v7 forKeyedSubscript:@"isAppFocused"];

    char v4 = *(&self->_isMediaFocused + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isMediaFocused + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured isMediaFocused](self, "isMediaFocused"));
  [v3 setObject:v8 forKeyedSubscript:@"isMediaFocused"];

  if ((*(&self->_isMediaFocused + 1) & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured isMediaRichAppFocused](self, "isMediaRichAppFocused"));
    [v3 setObject:v5 forKeyedSubscript:@"isMediaRichAppFocused"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isMediaFocused + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_isMediaFocused + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_isMediaFocused + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_isAppFocused;
  if ((*(&self->_isMediaFocused + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isMediaRichAppFocused;
  if ((*(&self->_isMediaFocused + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isMediaFocused;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isMediaFocused + 1);
  unsigned int v6 = v4[11];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int isAppFocused = self->_isAppFocused;
    if (isAppFocused != [v4 isAppFocused]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isMediaFocused + 1);
    unsigned int v6 = v4[11];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int isMediaRichAppFocused = self->_isMediaRichAppFocused;
    if (isMediaRichAppFocused == [v4 isMediaRichAppFocused])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isMediaFocused + 1);
      unsigned int v6 = v4[11];
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
    int isMediaFocused = self->_isMediaFocused;
    if (isMediaFocused != [v4 isMediaFocused]) {
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
  char v5 = *(&self->_isMediaFocused + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_isMediaFocused + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isMediaFocused + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(&self->_isMediaFocused + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterPromptGenerationSignalsCapturedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsMediaFocused
{
  *(&self->_isMediaFocused + 1) &= ~4u;
}

- (void)setHasIsMediaFocused:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isMediaFocused + 1) = *(&self->_isMediaFocused + 1) & 0xFB | v3;
}

- (BOOL)hasIsMediaFocused
{
  return (*((unsigned __int8 *)&self->_isMediaFocused + 1) >> 2) & 1;
}

- (void)setIsMediaFocused:(BOOL)a3
{
  *(&self->_isMediaFocused + 1) |= 4u;
  self->_int isMediaFocused = a3;
}

- (void)deleteIsMediaRichAppFocused
{
  *(&self->_isMediaFocused + 1) &= ~2u;
}

- (void)setHasIsMediaRichAppFocused:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isMediaFocused + 1) = *(&self->_isMediaFocused + 1) & 0xFD | v3;
}

- (BOOL)hasIsMediaRichAppFocused
{
  return (*((unsigned __int8 *)&self->_isMediaFocused + 1) >> 1) & 1;
}

- (void)setIsMediaRichAppFocused:(BOOL)a3
{
  *(&self->_isMediaFocused + 1) |= 2u;
  self->_int isMediaRichAppFocused = a3;
}

- (void)deleteIsAppFocused
{
  *(&self->_isMediaFocused + 1) &= ~1u;
}

- (void)setHasIsAppFocused:(BOOL)a3
{
  *(&self->_isMediaFocused + 1) = *(&self->_isMediaFocused + 1) & 0xFE | a3;
}

- (BOOL)hasIsAppFocused
{
  return *(&self->_isMediaFocused + 1);
}

- (void)setIsAppFocused:(BOOL)a3
{
  *(&self->_isMediaFocused + 1) |= 1u;
  self->_int isAppFocused = a3;
}

@end