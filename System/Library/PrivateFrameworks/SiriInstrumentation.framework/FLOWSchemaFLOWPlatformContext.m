@interface FLOWSchemaFLOWPlatformContext
- (BOOL)hasEntityContext;
- (BOOL)hasEntityContextValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWEntityContext)entityContext;
- (FLOWSchemaFLOWEntityContext)entityContextValue;
- (FLOWSchemaFLOWPlatformContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWPlatformContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichPlatformcontext;
- (void)deleteEntityContext;
- (void)deleteEntityContextValue;
- (void)setEntityContext:(id)a3;
- (void)setEntityContextValue:(id)a3;
- (void)setHasEntityContext:(BOOL)a3;
- (void)setHasEntityContextValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWPlatformContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWPlatformContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWPlatformContext *)self deleteEntityContext];
  }
  v9 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWPlatformContext *)self deleteEntityContextValue];
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
  objc_storeStrong((id *)&self->_entityContextValue, 0);
  objc_storeStrong((id *)&self->_entityContext, 0);
}

- (void)setHasEntityContextValue:(BOOL)a3
{
  self->_hasEntityContextValue = a3;
}

- (void)setHasEntityContext:(BOOL)a3
{
  self->_hasEntityContext = a3;
}

- (BOOL)hasEntityContext
{
  return self->_hasEntityContext;
}

- (void)setEntityContextValue:(id)a3
{
}

- (FLOWSchemaFLOWEntityContext)entityContextValue
{
  return self->_entityContextValue;
}

- (unint64_t)whichPlatformcontext
{
  return self->_whichPlatformcontext;
}

- (FLOWSchemaFLOWPlatformContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWPlatformContext;
  v5 = [(FLOWSchemaFLOWPlatformContext *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entityContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWEntityContext alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWPlatformContext *)v5 setEntityContext:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"entityContextValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLOWSchemaFLOWEntityContext alloc] initWithDictionary:v8];
      [(FLOWSchemaFLOWPlatformContext *)v5 setEntityContextValue:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWPlatformContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWPlatformContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWPlatformContext *)self dictionaryRepresentation];
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
  if (self->_entityContext)
  {
    id v4 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entityContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"entityContext"];
    }
  }
  if (self->_entityContextValue)
  {
    uint64_t v7 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"entityContextValue"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"entityContextValue"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLOWSchemaFLOWEntityContext *)self->_entityContext hash];
  return [(FLOWSchemaFLOWEntityContext *)self->_entityContextValue hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichPlatformcontext = self->_whichPlatformcontext;
  if (whichPlatformcontext != [v4 whichPlatformcontext]) {
    goto LABEL_13;
  }
  v6 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];
  uint64_t v7 = [v4 entityContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];
    int v11 = [v4 entityContext];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];
  uint64_t v7 = [v4 entityContextValue];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];
    v16 = [v4 entityContextValue];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];

  if (v4)
  {
    v5 = [(FLOWSchemaFLOWPlatformContext *)self entityContext];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];

  if (v6)
  {
    uint64_t v7 = [(FLOWSchemaFLOWPlatformContext *)self entityContextValue];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPlatformContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEntityContextValue
{
}

- (BOOL)hasEntityContextValue
{
  return self->_entityContextValue != 0;
}

- (void)deleteEntityContext
{
  if (self->_whichPlatformcontext == 1)
  {
    self->_unint64_t whichPlatformcontext = 0;
    self->_entityContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWEntityContext)entityContext
{
  if (self->_whichPlatformcontext == 1) {
    v2 = self->_entityContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntityContext:(id)a3
{
  self->_unint64_t whichPlatformcontext = a3 != 0;
  objc_storeStrong((id *)&self->_entityContext, a3);
}

@end