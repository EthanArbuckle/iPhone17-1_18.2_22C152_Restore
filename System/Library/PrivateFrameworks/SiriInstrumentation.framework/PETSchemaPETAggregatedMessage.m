@interface PETSchemaPETAggregatedMessage
- (BOOL)hasCount;
- (BOOL)hasDistribution;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PETSchemaPETAggregatedMessage)initWithDictionary:(id)a3;
- (PETSchemaPETAggregatedMessage)initWithJSON:(id)a3;
- (PETSchemaPETAggregationKey)key;
- (PETSchemaPETDistribution)distribution;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)count;
- (void)deleteCount;
- (void)deleteDistribution;
- (void)deleteKey;
- (void)setCount:(unsigned int)a3;
- (void)setDistribution:(id)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasDistribution:(BOOL)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETSchemaPETAggregatedMessage

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETSchemaPETAggregatedMessage;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PETSchemaPETAggregatedMessage *)self key];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PETSchemaPETAggregatedMessage *)self deleteKey];
  }
  v9 = [(PETSchemaPETAggregatedMessage *)self distribution];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PETSchemaPETAggregatedMessage *)self deleteDistribution];
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
  objc_storeStrong((id *)&self->_distribution, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setHasDistribution:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDistribution:(id)a3
{
}

- (PETSchemaPETDistribution)distribution
{
  return self->_distribution;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setKey:(id)a3
{
}

- (PETSchemaPETAggregationKey)key
{
  return self->_key;
}

- (PETSchemaPETAggregatedMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETSchemaPETAggregatedMessage;
  v5 = [(PETSchemaPETAggregatedMessage *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PETSchemaPETAggregationKey alloc] initWithDictionary:v6];
      [(PETSchemaPETAggregatedMessage *)v5 setKey:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"count"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETAggregatedMessage setCount:](v5, "setCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"distribution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[PETSchemaPETDistribution alloc] initWithDictionary:v9];
      [(PETSchemaPETAggregatedMessage *)v5 setDistribution:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (PETSchemaPETAggregatedMessage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PETSchemaPETAggregatedMessage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PETSchemaPETAggregatedMessage *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PETSchemaPETAggregatedMessage count](self, "count"));
    [v3 setObject:v4 forKeyedSubscript:@"count"];
  }
  if (self->_distribution)
  {
    v5 = [(PETSchemaPETAggregatedMessage *)self distribution];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"distribution"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"distribution"];
    }
  }
  if (self->_key)
  {
    int v8 = [(PETSchemaPETAggregatedMessage *)self key];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"key"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"key"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PETSchemaPETAggregationKey *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_count;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(PETSchemaPETDistribution *)self->_distribution hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(PETSchemaPETAggregatedMessage *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(PETSchemaPETAggregatedMessage *)self key];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PETSchemaPETAggregatedMessage *)self key];
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
    unsigned int count = self->_count;
    if (count != [v4 count]) {
      goto LABEL_15;
    }
  }
  v5 = [(PETSchemaPETAggregatedMessage *)self distribution];
  v6 = [v4 distribution];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(PETSchemaPETAggregatedMessage *)self distribution];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(PETSchemaPETAggregatedMessage *)self distribution];
    v16 = [v4 distribution];
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
  id v9 = a3;
  uint64_t v4 = [(PETSchemaPETAggregatedMessage *)self key];

  if (v4)
  {
    v5 = [(PETSchemaPETAggregatedMessage *)self key];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v6 = [(PETSchemaPETAggregatedMessage *)self distribution];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(PETSchemaPETAggregatedMessage *)self distribution];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETAggregatedMessageReadFrom(self, (uint64_t)a3);
}

- (void)deleteDistribution
{
}

- (BOOL)hasDistribution
{
  return self->_distribution != 0;
}

- (void)deleteCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int count = a3;
}

- (void)deleteKey
{
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end