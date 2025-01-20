@interface CLPInstSchemaServiceNodeComparatorResult
- (BOOL)hasComparatorName;
- (BOOL)hasIsMatched;
- (BOOL)hasIsValidOriginalItem;
- (BOOL)hasIsValidReplayedItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMatched;
- (BOOL)isValidOriginalItem;
- (BOOL)isValidReplayedItem;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaServiceNodeComparatorResult)initWithDictionary:(id)a3;
- (CLPInstSchemaServiceNodeComparatorResult)initWithJSON:(id)a3;
- (NSArray)mismatchedFields;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)comparatorName;
- (unint64_t)hash;
- (unint64_t)mismatchedFieldsAtIndex:(unint64_t)a3;
- (unint64_t)mismatchedFieldsCount;
- (void)addMismatchedFields:(unint64_t)a3;
- (void)clearMismatchedFields;
- (void)deleteComparatorName;
- (void)deleteIsMatched;
- (void)deleteIsValidOriginalItem;
- (void)deleteIsValidReplayedItem;
- (void)setComparatorName:(int)a3;
- (void)setHasComparatorName:(BOOL)a3;
- (void)setHasIsMatched:(BOOL)a3;
- (void)setHasIsValidOriginalItem:(BOOL)a3;
- (void)setHasIsValidReplayedItem:(BOOL)a3;
- (void)setIsMatched:(BOOL)a3;
- (void)setIsValidOriginalItem:(BOOL)a3;
- (void)setIsValidReplayedItem:(BOOL)a3;
- (void)setMismatchedFields:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaServiceNodeComparatorResult

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setMismatchedFields:(id)a3
{
}

- (NSArray)mismatchedFields
{
  return self->_mismatchedFields;
}

- (BOOL)isMatched
{
  return self->_isMatched;
}

- (BOOL)isValidReplayedItem
{
  return self->_isValidReplayedItem;
}

- (BOOL)isValidOriginalItem
{
  return self->_isValidOriginalItem;
}

- (int)comparatorName
{
  return self->_comparatorName;
}

- (CLPInstSchemaServiceNodeComparatorResult)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLPInstSchemaServiceNodeComparatorResult;
  v5 = [(CLPInstSchemaServiceNodeComparatorResult *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"comparatorName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaServiceNodeComparatorResult setComparatorName:](v5, "setComparatorName:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isValidOriginalItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaServiceNodeComparatorResult setIsValidOriginalItem:](v5, "setIsValidOriginalItem:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isValidReplayedItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaServiceNodeComparatorResult setIsValidReplayedItem:](v5, "setIsValidReplayedItem:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isMatched"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaServiceNodeComparatorResult setIsMatched:](v5, "setIsMatched:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"mismatchedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v8;
      v20 = v7;
      v21 = v6;
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
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[CLPInstSchemaServiceNodeComparatorResult addMismatchedFields:](v5, "addMismatchedFields:", [v16 unsignedLongLongValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v7 = v20;
      v6 = v21;
      v8 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (CLPInstSchemaServiceNodeComparatorResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaServiceNodeComparatorResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaServiceNodeComparatorResult *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(CLPInstSchemaServiceNodeComparatorResult *)self comparatorName] - 1;
    if (v5 > 5) {
      v6 = @"CLPCOMPARATORNAME_UNKNOWN";
    }
    else {
      v6 = off_1E5EAD1B8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"comparatorName"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaServiceNodeComparatorResult isMatched](self, "isMatched"));
    [v3 setObject:v11 forKeyedSubscript:@"isMatched"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaServiceNodeComparatorResult isValidOriginalItem](self, "isValidOriginalItem"));
  [v3 setObject:v12 forKeyedSubscript:@"isValidOriginalItem"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaServiceNodeComparatorResult isValidReplayedItem](self, "isValidReplayedItem"));
    [v3 setObject:v7 forKeyedSubscript:@"isValidReplayedItem"];
  }
LABEL_10:
  if ([(NSArray *)self->_mismatchedFields count])
  {
    v8 = [(CLPInstSchemaServiceNodeComparatorResult *)self mismatchedFields];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"mismatchedFields"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_comparatorName;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isValidOriginalItem;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSArray *)self->_mismatchedFields hash];
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isValidReplayedItem;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isMatched;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSArray *)self->_mismatchedFields hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $BF0BA5941349B6B18C1F25CF79745885 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int comparatorName = self->_comparatorName;
    if (comparatorName != [v4 comparatorName]) {
      goto LABEL_22;
    }
    $BF0BA5941349B6B18C1F25CF79745885 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int isValidOriginalItem = self->_isValidOriginalItem;
      if (isValidOriginalItem != [v4 isValidOriginalItem]) {
        goto LABEL_22;
      }
      $BF0BA5941349B6B18C1F25CF79745885 has = self->_has;
      unsigned int v6 = v4[24];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int isValidReplayedItem = self->_isValidReplayedItem;
        if (isValidReplayedItem != [v4 isValidReplayedItem]) {
          goto LABEL_22;
        }
        $BF0BA5941349B6B18C1F25CF79745885 has = self->_has;
        unsigned int v6 = v4[24];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12 || (int isMatched = self->_isMatched, isMatched == [v4 isMatched]))
        {
          uint64_t v14 = [(CLPInstSchemaServiceNodeComparatorResult *)self mismatchedFields];
          uint64_t v15 = [v4 mismatchedFields];
          v16 = v15;
          if ((v14 == 0) != (v15 != 0))
          {
            uint64_t v17 = [(CLPInstSchemaServiceNodeComparatorResult *)self mismatchedFields];
            if (!v17)
            {

LABEL_25:
              BOOL v22 = 1;
              goto LABEL_23;
            }
            v18 = (void *)v17;
            v19 = [(CLPInstSchemaServiceNodeComparatorResult *)self mismatchedFields];
            v20 = [v4 mismatchedFields];
            char v21 = [v19 isEqual:v20];

            if (v21) {
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
      }
    }
  }
LABEL_22:
  BOOL v22 = 0;
LABEL_23:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_mismatchedFields;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedLongLongValue", (void)v11);
        PBDataWriterWriteUint64Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaServiceNodeComparatorResultReadFrom(self, (uint64_t)a3);
}

- (unint64_t)mismatchedFieldsAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_mismatchedFields objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)mismatchedFieldsCount
{
  return [(NSArray *)self->_mismatchedFields count];
}

- (void)addMismatchedFields:(unint64_t)a3
{
  mismatchedFields = self->_mismatchedFields;
  if (!mismatchedFields)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mismatchedFields;
    self->_mismatchedFields = v6;

    mismatchedFields = self->_mismatchedFields;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)mismatchedFields addObject:v8];
}

- (void)clearMismatchedFields
{
}

- (void)deleteIsMatched
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsMatched:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsMatched
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsMatched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isMatched = a3;
}

- (void)deleteIsValidReplayedItem
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsValidReplayedItem:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsValidReplayedItem
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsValidReplayedItem:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isValidReplayedItem = a3;
}

- (void)deleteIsValidOriginalItem
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsValidOriginalItem:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsValidOriginalItem
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsValidOriginalItem:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isValidOriginalItem = a3;
}

- (void)deleteComparatorName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasComparatorName:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComparatorName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setComparatorName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int comparatorName = a3;
}

@end