@interface IFTSchemaIFTQueryValue
- (BOOL)hasQuery;
- (BOOL)hasTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTQuery)query;
- (IFTSchemaIFTQueryValue)initWithDictionary:(id)a3;
- (IFTSchemaIFTQueryValue)initWithJSON:(id)a3;
- (IFTSchemaIFTTypeIdentifier)typeIdentifier;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteQuery;
- (void)deleteTypeIdentifier;
- (void)setHasQuery:(BOOL)a3;
- (void)setHasTypeIdentifier:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTQueryValue

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTQueryValue;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTQueryValue *)self deleteTypeIdentifier];
  }
  v9 = [(IFTSchemaIFTQueryValue *)self query];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTQueryValue *)self deleteQuery];
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
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (void)setHasQuery:(BOOL)a3
{
  self->_hasQuery = a3;
}

- (void)setHasTypeIdentifier:(BOOL)a3
{
  self->_hasTypeIdentifier = a3;
}

- (void)setQuery:(id)a3
{
}

- (IFTSchemaIFTQuery)query
{
  return self->_query;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (IFTSchemaIFTTypeIdentifier)typeIdentifier
{
  return self->_typeIdentifier;
}

- (IFTSchemaIFTQueryValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTQueryValue;
  v5 = [(IFTSchemaIFTQueryValue *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"typeIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTTypeIdentifier alloc] initWithDictionary:v6];
      [(IFTSchemaIFTQueryValue *)v5 setTypeIdentifier:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"query"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTQuery alloc] initWithDictionary:v8];
      [(IFTSchemaIFTQueryValue *)v5 setQuery:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (IFTSchemaIFTQueryValue)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTQueryValue *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTQueryValue *)self dictionaryRepresentation];
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
  if (self->_query)
  {
    id v4 = [(IFTSchemaIFTQueryValue *)self query];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"query"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"query"];
    }
  }
  if (self->_typeIdentifier)
  {
    uint64_t v7 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"typeIdentifier"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"typeIdentifier"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTTypeIdentifier *)self->_typeIdentifier hash];
  return [(IFTSchemaIFTQuery *)self->_query hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];
  v6 = [v4 typeIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];
    v10 = [v4 typeIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(IFTSchemaIFTQueryValue *)self query];
  v6 = [v4 query];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(IFTSchemaIFTQueryValue *)self query];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(IFTSchemaIFTQueryValue *)self query];
    v15 = [v4 query];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];

  if (v4)
  {
    v5 = [(IFTSchemaIFTQueryValue *)self typeIdentifier];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTQueryValue *)self query];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTQueryValue *)self query];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTQueryValueReadFrom(self, (uint64_t)a3);
}

- (void)deleteQuery
{
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (void)deleteTypeIdentifier
{
}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

@end