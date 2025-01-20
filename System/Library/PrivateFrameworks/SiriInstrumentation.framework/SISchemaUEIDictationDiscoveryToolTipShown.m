@interface SISchemaUEIDictationDiscoveryToolTipShown
- (BOOL)hasEmoji;
- (BOOL)hasHasEmoji;
- (BOOL)hasToolTipShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationDiscoveryToolTipShown)initWithDictionary:(id)a3;
- (SISchemaUEIDictationDiscoveryToolTipShown)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)toolTipShown;
- (unint64_t)hash;
- (void)deleteHasEmoji;
- (void)deleteToolTipShown;
- (void)setHasEmoji:(BOOL)a3;
- (void)setHasHasEmoji:(BOOL)a3;
- (void)setHasToolTipShown:(BOOL)a3;
- (void)setToolTipShown:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationDiscoveryToolTipShown

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasEmoji
{
  return self->_hasEmoji;
}

- (int)toolTipShown
{
  return self->_toolTipShown;
}

- (SISchemaUEIDictationDiscoveryToolTipShown)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIDictationDiscoveryToolTipShown;
  v5 = [(SISchemaUEIDictationDiscoveryToolTipShown *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"toolTipShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationDiscoveryToolTipShown setToolTipShown:](v5, "setToolTipShown:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasEmoji"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationDiscoveryToolTipShown setHasEmoji:](v5, "setHasEmoji:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationDiscoveryToolTipShown)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationDiscoveryToolTipShown *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationDiscoveryToolTipShown *)self dictionaryRepresentation];
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
  char v4 = *(&self->_hasEmoji + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIDictationDiscoveryToolTipShown hasEmoji](self, "hasEmoji"));
    [v3 setObject:v5 forKeyedSubscript:@"hasEmoji"];

    char v4 = *(&self->_hasEmoji + 1);
  }
  if (v4)
  {
    unsigned int v6 = [(SISchemaUEIDictationDiscoveryToolTipShown *)self toolTipShown] - 1;
    if (v6 > 7) {
      uint64_t v7 = @"UEIDICTATIONDISCOVERYTOOLTIP_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB8610[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"toolTipShown"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasEmoji + 1))
  {
    uint64_t v2 = 2654435761 * self->_toolTipShown;
    if ((*(&self->_hasEmoji + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_hasEmoji + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_hasEmoji;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_hasEmoji + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int toolTipShown = self->_toolTipShown;
    if (toolTipShown != [v4 toolTipShown])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_hasEmoji + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int hasEmoji = self->_hasEmoji;
    if (hasEmoji != [v4 hasEmoji]) {
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
  char v5 = *(&self->_hasEmoji + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_hasEmoji + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationDiscoveryToolTipShownReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasEmoji
{
  *(&self->_hasEmoji + 1) &= ~2u;
}

- (void)setHasHasEmoji:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasEmoji + 1) = *(&self->_hasEmoji + 1) & 0xFD | v3;
}

- (BOOL)hasHasEmoji
{
  return (*((unsigned __int8 *)&self->_hasEmoji + 1) >> 1) & 1;
}

- (void)setHasEmoji:(BOOL)a3
{
  *(&self->_hasEmoji + 1) |= 2u;
  self->_int hasEmoji = a3;
}

- (void)deleteToolTipShown
{
  *(&self->_hasEmoji + 1) &= ~1u;
}

- (void)setHasToolTipShown:(BOOL)a3
{
  *(&self->_hasEmoji + 1) = *(&self->_hasEmoji + 1) & 0xFE | a3;
}

- (BOOL)hasToolTipShown
{
  return *(&self->_hasEmoji + 1);
}

- (void)setToolTipShown:(int)a3
{
  *(&self->_hasEmoji + 1) |= 1u;
  self->_int toolTipShown = a3;
}

@end