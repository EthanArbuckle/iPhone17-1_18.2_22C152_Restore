@interface IFTSchemaIFTParameter
- (BOOL)hasCandidate;
- (BOOL)hasCollectionIndex;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTCandidate)candidate;
- (IFTSchemaIFTParameter)initWithDictionary:(id)a3;
- (IFTSchemaIFTParameter)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)key;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)collectionIndex;
- (unint64_t)hash;
- (void)deleteCandidate;
- (void)deleteCollectionIndex;
- (void)deleteKey;
- (void)setCandidate:(id)a3;
- (void)setCollectionIndex:(int64_t)a3;
- (void)setHasCandidate:(BOOL)a3;
- (void)setHasCollectionIndex:(BOOL)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTParameter

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTParameter;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTParameter *)self candidate];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTParameter *)self deleteCandidate];
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
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setHasCandidate:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCandidate:(id)a3
{
}

- (IFTSchemaIFTCandidate)candidate
{
  return self->_candidate;
}

- (int64_t)collectionIndex
{
  return self->_collectionIndex;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (IFTSchemaIFTParameter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTParameter;
  v5 = [(IFTSchemaIFTParameter *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IFTSchemaIFTParameter *)v5 setKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"collectionIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTParameter setCollectionIndex:](v5, "setCollectionIndex:", [v8 longLongValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"candidate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTCandidate alloc] initWithDictionary:v9];
      [(IFTSchemaIFTParameter *)v5 setCandidate:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (IFTSchemaIFTParameter)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTParameter *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTParameter *)self dictionaryRepresentation];
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
  if (self->_candidate)
  {
    id v4 = [(IFTSchemaIFTParameter *)self candidate];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"candidate"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"candidate"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTParameter collectionIndex](self, "collectionIndex"));
    [v3 setObject:v7 forKeyedSubscript:@"collectionIndex"];
  }
  if (self->_key)
  {
    v8 = [(IFTSchemaIFTParameter *)self key];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"key"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_collectionIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(IFTSchemaIFTCandidate *)self->_candidate hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(IFTSchemaIFTParameter *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(IFTSchemaIFTParameter *)self key];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(IFTSchemaIFTParameter *)self key];
    v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t collectionIndex = self->_collectionIndex;
    if (collectionIndex != [v4 collectionIndex]) {
      goto LABEL_15;
    }
  }
  v5 = [(IFTSchemaIFTParameter *)self candidate];
  v6 = [v4 candidate];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(IFTSchemaIFTParameter *)self candidate];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTParameter *)self candidate];
    v16 = [v4 candidate];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(IFTSchemaIFTParameter *)self key];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  v5 = [(IFTSchemaIFTParameter *)self candidate];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(IFTSchemaIFTParameter *)self candidate];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterReadFrom(self, (uint64_t)a3);
}

- (void)deleteCandidate
{
}

- (BOOL)hasCandidate
{
  return self->_candidate != 0;
}

- (void)deleteCollectionIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCollectionIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCollectionIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCollectionIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t collectionIndex = a3;
}

- (void)deleteKey
{
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end