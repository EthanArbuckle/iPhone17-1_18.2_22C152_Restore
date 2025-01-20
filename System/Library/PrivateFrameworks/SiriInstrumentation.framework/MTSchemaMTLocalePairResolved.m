@interface MTSchemaMTLocalePairResolved
- (BOOL)hasLocalePair;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTLocalePair)localePair;
- (MTSchemaMTLocalePairResolved)initWithDictionary:(id)a3;
- (MTSchemaMTLocalePairResolved)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLocalePair;
- (void)setHasLocalePair:(BOOL)a3;
- (void)setLocalePair:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTLocalePairResolved

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTSchemaMTLocalePairResolved;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTLocalePairResolved *)self localePair];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MTSchemaMTLocalePairResolved *)self deleteLocalePair];
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
}

- (void)setHasLocalePair:(BOOL)a3
{
  self->_hasLocalePair = a3;
}

- (void)setLocalePair:(id)a3
{
}

- (MTSchemaMTLocalePair)localePair
{
  return self->_localePair;
}

- (MTSchemaMTLocalePairResolved)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTSchemaMTLocalePairResolved;
  v5 = [(MTSchemaMTLocalePairResolved *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"localePair"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[MTSchemaMTLocalePair alloc] initWithDictionary:v6];
      [(MTSchemaMTLocalePairResolved *)v5 setLocalePair:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (MTSchemaMTLocalePairResolved)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTLocalePairResolved *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTLocalePairResolved *)self dictionaryRepresentation];
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
  if (self->_localePair)
  {
    id v4 = [(MTSchemaMTLocalePairResolved *)self localePair];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"localePair"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"localePair"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(MTSchemaMTLocalePair *)self->_localePair hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(MTSchemaMTLocalePairResolved *)self localePair];
    v6 = [v4 localePair];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(MTSchemaMTLocalePairResolved *)self localePair];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(MTSchemaMTLocalePairResolved *)self localePair];
      v11 = [v4 localePair];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(MTSchemaMTLocalePairResolved *)self localePair];

  if (v4)
  {
    v5 = [(MTSchemaMTLocalePairResolved *)self localePair];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTLocalePairResolvedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocalePair
{
}

- (BOOL)hasLocalePair
{
  return self->_localePair != 0;
}

@end