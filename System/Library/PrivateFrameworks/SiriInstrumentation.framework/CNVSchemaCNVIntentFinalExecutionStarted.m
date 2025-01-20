@interface CNVSchemaCNVIntentFinalExecutionStarted
- (BOOL)hasPlugin;
- (BOOL)hasStackDepth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionStarted)initWithDictionary:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)plugin;
- (unint64_t)hash;
- (unsigned)stackDepth;
- (void)deletePlugin;
- (void)deleteStackDepth;
- (void)setHasPlugin:(BOOL)a3;
- (void)setHasStackDepth:(BOOL)a3;
- (void)setPlugin:(int)a3;
- (void)setStackDepth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVIntentFinalExecutionStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)stackDepth
{
  return self->_stackDepth;
}

- (int)plugin
{
  return self->_plugin;
}

- (CNVSchemaCNVIntentFinalExecutionStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVSchemaCNVIntentFinalExecutionStarted;
  v5 = [(CNVSchemaCNVIntentFinalExecutionStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"plugin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVIntentFinalExecutionStarted setPlugin:](v5, "setPlugin:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"stackDepth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVIntentFinalExecutionStarted setStackDepth:](v5, "setStackDepth:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (CNVSchemaCNVIntentFinalExecutionStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVIntentFinalExecutionStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVIntentFinalExecutionStarted *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(CNVSchemaCNVIntentFinalExecutionStarted *)self plugin] - 1;
    if (v5 > 0x24) {
      v6 = @"CNVPLUGIN_UNKNOWN";
    }
    else {
      v6 = off_1E5EAD5E0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"plugin"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CNVSchemaCNVIntentFinalExecutionStarted stackDepth](self, "stackDepth"));
    [v3 setObject:v7 forKeyedSubscript:@"stackDepth"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_plugin;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_stackDepth;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $FB2CBB024570DF547870A1C3382B55AA has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int plugin = self->_plugin;
    if (plugin != [v4 plugin])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $FB2CBB024570DF547870A1C3382B55AA has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int stackDepth = self->_stackDepth;
    if (stackDepth != [v4 stackDepth]) {
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
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentFinalExecutionStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteStackDepth
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasStackDepth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStackDepth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStackDepth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int stackDepth = a3;
}

- (void)deletePlugin
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPlugin:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlugin
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlugin:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int plugin = a3;
}

@end