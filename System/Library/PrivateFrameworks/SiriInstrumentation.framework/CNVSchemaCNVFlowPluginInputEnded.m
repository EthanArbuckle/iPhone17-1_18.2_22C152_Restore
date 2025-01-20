@interface CNVSchemaCNVFlowPluginInputEnded
- (BOOL)hasHasTopicChanged;
- (BOOL)hasTopicChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVFlowPluginInputEnded)initWithDictionary:(id)a3;
- (CNVSchemaCNVFlowPluginInputEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHasTopicChanged;
- (void)setHasHasTopicChanged:(BOOL)a3;
- (void)setHasTopicChanged:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVFlowPluginInputEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasTopicChanged
{
  return self->_hasTopicChanged;
}

- (CNVSchemaCNVFlowPluginInputEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNVSchemaCNVFlowPluginInputEnded;
  v5 = [(CNVSchemaCNVFlowPluginInputEnded *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasTopicChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVFlowPluginInputEnded setHasTopicChanged:](v5, "setHasTopicChanged:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (CNVSchemaCNVFlowPluginInputEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVFlowPluginInputEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVFlowPluginInputEnded *)self dictionaryRepresentation];
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
  if (*(&self->_hasTopicChanged + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CNVSchemaCNVFlowPluginInputEnded hasTopicChanged](self, "hasTopicChanged"));
    [v3 setObject:v4 forKeyedSubscript:@"hasTopicChanged"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasTopicChanged + 1)) {
    return 2654435761 * self->_hasTopicChanged;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (*(&self->_hasTopicChanged + 1) == (v4[9] & 1))
    {
      if (!*(&self->_hasTopicChanged + 1)
        || (int hasTopicChanged = self->_hasTopicChanged,
            hasTopicChanged == [v4 hasTopicChanged]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_hasTopicChanged + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVFlowPluginInputEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasTopicChanged
{
  *(&self->_hasTopicChanged + 1) &= ~1u;
}

- (void)setHasHasTopicChanged:(BOOL)a3
{
  *(&self->_hasTopicChanged + 1) = *(&self->_hasTopicChanged + 1) & 0xFE | a3;
}

- (BOOL)hasHasTopicChanged
{
  return *(&self->_hasTopicChanged + 1);
}

- (void)setHasTopicChanged:(BOOL)a3
{
  *(&self->_hasTopicChanged + 1) |= 1u;
  self->_int hasTopicChanged = a3;
}

@end