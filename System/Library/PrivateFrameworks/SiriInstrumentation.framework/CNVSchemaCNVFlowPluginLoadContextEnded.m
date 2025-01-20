@interface CNVSchemaCNVFlowPluginLoadContextEnded
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasHasPluginCached;
- (BOOL)hasPluginCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVFlowPluginLoadContextEnded)initWithDictionary:(id)a3;
- (CNVSchemaCNVFlowPluginLoadContextEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteHasPluginCached;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasHasPluginCached:(BOOL)a3;
- (void)setHasPluginCached:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVFlowPluginLoadContextEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasPluginCached
{
  return self->_hasPluginCached;
}

- (BOOL)exists
{
  return self->_exists;
}

- (CNVSchemaCNVFlowPluginLoadContextEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVSchemaCNVFlowPluginLoadContextEnded;
  v5 = [(CNVSchemaCNVFlowPluginLoadContextEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVFlowPluginLoadContextEnded setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasPluginCached"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVFlowPluginLoadContextEnded setHasPluginCached:](v5, "setHasPluginCached:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (CNVSchemaCNVFlowPluginLoadContextEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVFlowPluginLoadContextEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVFlowPluginLoadContextEnded *)self dictionaryRepresentation];
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
  char v4 = *(&self->_hasPluginCached + 1);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CNVSchemaCNVFlowPluginLoadContextEnded exists](self, "exists"));
    [v3 setObject:v5 forKeyedSubscript:@"exists"];

    char v4 = *(&self->_hasPluginCached + 1);
  }
  if ((v4 & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CNVSchemaCNVFlowPluginLoadContextEnded hasPluginCached](self, "hasPluginCached"));
    [v3 setObject:v6 forKeyedSubscript:@"hasPluginCached"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasPluginCached + 1))
  {
    uint64_t v2 = 2654435761 * self->_exists;
    if ((*(&self->_hasPluginCached + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_hasPluginCached + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_hasPluginCached;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_hasPluginCached + 1);
  unsigned int v6 = v4[10];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int exists = self->_exists;
    if (exists != [v4 exists])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_hasPluginCached + 1);
    unsigned int v6 = v4[10];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int hasPluginCached = self->_hasPluginCached;
    if (hasPluginCached != [v4 hasPluginCached]) {
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
  char v5 = *(&self->_hasPluginCached + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_hasPluginCached + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVFlowPluginLoadContextEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasPluginCached
{
  *(&self->_hasPluginCached + 1) &= ~2u;
}

- (void)setHasHasPluginCached:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasPluginCached + 1) = *(&self->_hasPluginCached + 1) & 0xFD | v3;
}

- (BOOL)hasHasPluginCached
{
  return (*((unsigned __int8 *)&self->_hasPluginCached + 1) >> 1) & 1;
}

- (void)setHasPluginCached:(BOOL)a3
{
  *(&self->_hasPluginCached + 1) |= 2u;
  self->_int hasPluginCached = a3;
}

- (void)deleteExists
{
  *(&self->_hasPluginCached + 1) &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_hasPluginCached + 1) = *(&self->_hasPluginCached + 1) & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(&self->_hasPluginCached + 1);
}

- (void)setExists:(BOOL)a3
{
  *(&self->_hasPluginCached + 1) |= 1u;
  self->_int exists = a3;
}

@end