@interface DODMLASRSchemaDODMLASREntityCategoryCount
- (BOOL)hasCount;
- (BOOL)hasEntityCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASREntityCategoryCount)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASREntityCategoryCount)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)entityCategory;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)count;
- (void)deleteCount;
- (void)deleteEntityCategory;
- (void)setCount:(unsigned int)a3;
- (void)setEntityCategory:(id)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasEntityCategory:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASREntityCategoryCount

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasEntityCategory:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setEntityCategory:(id)a3
{
}

- (NSString)entityCategory
{
  return self->_entityCategory;
}

- (DODMLASRSchemaDODMLASREntityCategoryCount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DODMLASRSchemaDODMLASREntityCategoryCount;
  v5 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entityCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASREntityCategoryCount *)v5 setEntityCategory:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"count"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASREntityCategoryCount setCount:](v5, "setCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASREntityCategoryCount)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASREntityCategoryCount count](self, "count"));
    [v3 setObject:v4 forKeyedSubscript:@"count"];
  }
  if (self->_entityCategory)
  {
    v5 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self entityCategory];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"entityCategory"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_entityCategory hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_count;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self entityCategory];
  v6 = [v4 entityCategory];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self entityCategory];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self entityCategory];
    objc_super v11 = [v4 entityCategory];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int count = self->_count;
    if (count != [v4 count]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(DODMLASRSchemaDODMLASREntityCategoryCount *)self entityCategory];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASREntityCategoryCountReadFrom(self, (uint64_t)a3);
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

- (void)deleteEntityCategory
{
}

- (BOOL)hasEntityCategory
{
  return self->_entityCategory != 0;
}

@end