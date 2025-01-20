@interface NLXSchemaCDMTurnContext
- (BOOL)hasLegacyNlContext;
- (BOOL)hasNlContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMNLContext)nlContext;
- (NLXSchemaCDMTurnContext)initWithDictionary:(id)a3;
- (NLXSchemaCDMTurnContext)initWithJSON:(id)a3;
- (NLXSchemaNLXLegacyNLContext)legacyNlContext;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichTurncontexttype;
- (void)deleteLegacyNlContext;
- (void)deleteNlContext;
- (void)setHasLegacyNlContext:(BOOL)a3;
- (void)setHasNlContext:(BOOL)a3;
- (void)setLegacyNlContext:(id)a3;
- (void)setNlContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMTurnContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMTurnContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMTurnContext *)self nlContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMTurnContext *)self deleteNlContext];
  }
  v9 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMTurnContext *)self deleteLegacyNlContext];
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
  objc_storeStrong((id *)&self->_legacyNlContext, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
}

- (void)setHasLegacyNlContext:(BOOL)a3
{
  self->_hasLegacyNlContext = a3;
}

- (BOOL)hasLegacyNlContext
{
  return self->_hasLegacyNlContext;
}

- (void)setHasNlContext:(BOOL)a3
{
  self->_hasNlContext = a3;
}

- (BOOL)hasNlContext
{
  return self->_hasNlContext;
}

- (unint64_t)whichTurncontexttype
{
  return self->_whichTurncontexttype;
}

- (NLXSchemaCDMTurnContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMTurnContext;
  v5 = [(NLXSchemaCDMTurnContext *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nlContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[NLXSchemaCDMNLContext alloc] initWithDictionary:v6];
      [(NLXSchemaCDMTurnContext *)v5 setNlContext:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"legacyNlContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NLXSchemaNLXLegacyNLContext alloc] initWithDictionary:v8];
      [(NLXSchemaCDMTurnContext *)v5 setLegacyNlContext:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMTurnContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMTurnContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMTurnContext *)self dictionaryRepresentation];
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
  if (self->_legacyNlContext)
  {
    id v4 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"legacyNlContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"legacyNlContext"];
    }
  }
  if (self->_nlContext)
  {
    uint64_t v7 = [(NLXSchemaCDMTurnContext *)self nlContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"nlContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"nlContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NLXSchemaCDMNLContext *)self->_nlContext hash];
  return [(NLXSchemaNLXLegacyNLContext *)self->_legacyNlContext hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichTurncontexttype = self->_whichTurncontexttype;
  if (whichTurncontexttype != [v4 whichTurncontexttype]) {
    goto LABEL_13;
  }
  v6 = [(NLXSchemaCDMTurnContext *)self nlContext];
  uint64_t v7 = [v4 nlContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(NLXSchemaCDMTurnContext *)self nlContext];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(NLXSchemaCDMTurnContext *)self nlContext];
    int v11 = [v4 nlContext];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];
  uint64_t v7 = [v4 legacyNlContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];
    v16 = [v4 legacyNlContext];
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
  id v4 = [(NLXSchemaCDMTurnContext *)self nlContext];

  if (v4)
  {
    v5 = [(NLXSchemaCDMTurnContext *)self nlContext];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaCDMTurnContext *)self legacyNlContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTurnContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteLegacyNlContext
{
  if (self->_whichTurncontexttype == 2)
  {
    self->_unint64_t whichTurncontexttype = 0;
    self->_legacyNlContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaNLXLegacyNLContext)legacyNlContext
{
  if (self->_whichTurncontexttype == 2) {
    v2 = self->_legacyNlContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLegacyNlContext:(id)a3
{
  id v4 = (NLXSchemaNLXLegacyNLContext *)a3;
  nlContext = self->_nlContext;
  self->_nlContext = 0;

  self->_unint64_t whichTurncontexttype = 2 * (v4 != 0);
  legacyNlContext = self->_legacyNlContext;
  self->_legacyNlContext = v4;
}

- (void)deleteNlContext
{
  if (self->_whichTurncontexttype == 1)
  {
    self->_unint64_t whichTurncontexttype = 0;
    self->_nlContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMNLContext)nlContext
{
  if (self->_whichTurncontexttype == 1) {
    v2 = self->_nlContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlContext:(id)a3
{
  id v4 = (NLXSchemaCDMNLContext *)a3;
  legacyNlContext = self->_legacyNlContext;
  self->_legacyNlContext = 0;

  self->_unint64_t whichTurncontexttype = v4 != 0;
  nlContext = self->_nlContext;
  self->_nlContext = v4;
}

@end