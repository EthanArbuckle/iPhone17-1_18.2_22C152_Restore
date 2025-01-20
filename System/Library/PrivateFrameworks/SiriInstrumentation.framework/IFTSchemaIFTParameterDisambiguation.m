@interface IFTSchemaIFTParameterDisambiguation
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasParameterId;
- (BOOL)hasParameterIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTParameterDisambiguation)initWithDictionary:(id)a3;
- (IFTSchemaIFTParameterDisambiguation)initWithJSON:(id)a3;
- (NSArray)items;
- (NSData)jsonData;
- (NSString)parameterId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int64_t)parameterIndex;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (void)addItems:(id)a3;
- (void)clearItems;
- (void)deleteExists;
- (void)deleteParameterId;
- (void)deleteParameterIndex;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasParameterId:(BOOL)a3;
- (void)setHasParameterIndex:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setParameterId:(id)a3;
- (void)setParameterIndex:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTParameterDisambiguation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTParameterDisambiguation;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTParameterDisambiguation *)self items];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(IFTSchemaIFTParameterDisambiguation *)self setItems:v7];
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
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_parameterId, 0);
}

- (void)setHasParameterId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (int64_t)parameterIndex
{
  return self->_parameterIndex;
}

- (void)setParameterId:(id)a3
{
}

- (NSString)parameterId
{
  return self->_parameterId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTParameterDisambiguation)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)IFTSchemaIFTParameterDisambiguation;
  v5 = [(IFTSchemaIFTParameterDisambiguation *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTParameterDisambiguation setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"parameterId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(IFTSchemaIFTParameterDisambiguation *)v5 setParameterId:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"parameterIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTParameterDisambiguation setParameterIndex:](v5, "setParameterIndex:", [v9 longLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"items"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v9;
      v21 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[IFTSchemaIFTTypedValue alloc] initWithDictionary:v16];
              [(IFTSchemaIFTParameterDisambiguation *)v5 addItems:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v7 = v21;
      objc_super v9 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (IFTSchemaIFTParameterDisambiguation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTParameterDisambiguation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTParameterDisambiguation *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTParameterDisambiguation exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if ([(NSArray *)self->_items count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = self->_items;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"items"];
  }
  if (self->_parameterId)
  {
    uint64_t v13 = [(IFTSchemaIFTParameterDisambiguation *)self parameterId];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"parameterId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTParameterDisambiguation parameterIndex](self, "parameterIndex"));
    [v3 setObject:v15 forKeyedSubscript:@"parameterIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_parameterId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_parameterIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_items hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_18;
    }
  }
  v6 = [(IFTSchemaIFTParameterDisambiguation *)self parameterId];
  uint64_t v7 = [v4 parameterId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(IFTSchemaIFTParameterDisambiguation *)self parameterId];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(IFTSchemaIFTParameterDisambiguation *)self parameterId];
    id v11 = [v4 parameterId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int64_t parameterIndex = self->_parameterIndex;
    if (parameterIndex != [v4 parameterIndex]) {
      goto LABEL_18;
    }
  }
  v6 = [(IFTSchemaIFTParameterDisambiguation *)self items];
  uint64_t v7 = [v4 items];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v15 = [(IFTSchemaIFTParameterDisambiguation *)self items];
    if (!v15)
    {

LABEL_21:
      BOOL v20 = 1;
      goto LABEL_19;
    }
    uint64_t v16 = (void *)v15;
    long long v17 = [(IFTSchemaIFTParameterDisambiguation *)self items];
    long long v18 = [v4 items];
    char v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v5 = [(IFTSchemaIFTParameterDisambiguation *)self parameterId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterDisambiguationReadFrom(self, (uint64_t)a3);
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_items objectAtIndexedSubscript:a3];
}

- (unint64_t)itemsCount
{
  return [(NSArray *)self->_items count];
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  items = self->_items;
  id v8 = v4;
  if (!items)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_items;
    self->_items = v6;

    id v4 = v8;
    items = self->_items;
  }
  [(NSArray *)items addObject:v4];
}

- (void)clearItems
{
}

- (void)deleteParameterIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasParameterIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParameterIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setParameterIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t parameterIndex = a3;
}

- (void)deleteParameterId
{
}

- (BOOL)hasParameterId
{
  return self->_parameterId != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end