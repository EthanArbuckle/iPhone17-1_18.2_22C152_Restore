@interface LRSchemaLRWindow
- (BOOL)hasEndTimeInNs;
- (BOOL)hasStartTimeInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LRSchemaLRWindow)initWithDictionary:(id)a3;
- (LRSchemaLRWindow)initWithJSON:(id)a3;
- (NSArray)activeRedactionPolicies;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)activeRedactionPoliciesAtIndex:(unint64_t)a3;
- (unint64_t)activeRedactionPoliciesCount;
- (unint64_t)endTimeInNs;
- (unint64_t)hash;
- (unint64_t)startTimeInNs;
- (void)addActiveRedactionPolicies:(int)a3;
- (void)clearActiveRedactionPolicies;
- (void)deleteEndTimeInNs;
- (void)deleteStartTimeInNs;
- (void)setActiveRedactionPolicies:(id)a3;
- (void)setEndTimeInNs:(unint64_t)a3;
- (void)setHasEndTimeInNs:(BOOL)a3;
- (void)setHasStartTimeInNs:(BOOL)a3;
- (void)setStartTimeInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation LRSchemaLRWindow

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setActiveRedactionPolicies:(id)a3
{
}

- (NSArray)activeRedactionPolicies
{
  return self->_activeRedactionPolicies;
}

- (unint64_t)endTimeInNs
{
  return self->_endTimeInNs;
}

- (unint64_t)startTimeInNs
{
  return self->_startTimeInNs;
}

- (LRSchemaLRWindow)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LRSchemaLRWindow;
  v5 = [(LRSchemaLRWindow *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRWindow setStartTimeInNs:](v5, "setStartTimeInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"endTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRWindow setEndTimeInNs:](v5, "setEndTimeInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"activeRedactionPolicies"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[LRSchemaLRWindow addActiveRedactionPolicies:](v5, "addActiveRedactionPolicies:", [v14 intValue]);
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v11);
      }

      v6 = v17;
    }
    v15 = v5;
  }
  return v5;
}

- (LRSchemaLRWindow)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LRSchemaLRWindow *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LRSchemaLRWindow *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_activeRedactionPolicies count])
  {
    id v4 = [(LRSchemaLRWindow *)self activeRedactionPolicies];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activeRedactionPolicies"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRWindow endTimeInNs](self, "endTimeInNs"));
    [v3 setObject:v7 forKeyedSubscript:@"endTimeInNs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRWindow startTimeInNs](self, "startTimeInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"startTimeInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_startTimeInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSArray *)self->_activeRedactionPolicies hash];
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_endTimeInNs;
  return v3 ^ v2 ^ [(NSArray *)self->_activeRedactionPolicies hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $F60B79F1AEB0D1197C1771A21EE4FA2C has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t startTimeInNs = self->_startTimeInNs;
    if (startTimeInNs != [v4 startTimeInNs]) {
      goto LABEL_14;
    }
    $F60B79F1AEB0D1197C1771A21EE4FA2C has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (unint64_t endTimeInNs = self->_endTimeInNs, endTimeInNs == [v4 endTimeInNs]))
    {
      uint64_t v10 = [(LRSchemaLRWindow *)self activeRedactionPolicies];
      uint64_t v11 = [v4 activeRedactionPolicies];
      uint64_t v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(LRSchemaLRWindow *)self activeRedactionPolicies];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(LRSchemaLRWindow *)self activeRedactionPolicies];
        v16 = [v4 activeRedactionPolicies];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_activeRedactionPolicies;
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRWindowReadFrom(self, (uint64_t)a3);
}

- (int)activeRedactionPoliciesAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_activeRedactionPolicies objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)activeRedactionPoliciesCount
{
  return [(NSArray *)self->_activeRedactionPolicies count];
}

- (void)addActiveRedactionPolicies:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  activeRedactionPolicies = self->_activeRedactionPolicies;
  if (!activeRedactionPolicies)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_activeRedactionPolicies;
    self->_activeRedactionPolicies = v6;

    activeRedactionPolicies = self->_activeRedactionPolicies;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)activeRedactionPolicies addObject:v8];
}

- (void)clearActiveRedactionPolicies
{
}

- (void)deleteEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEndTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t endTimeInNs = a3;
}

- (void)deleteStartTimeInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartTimeInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimeInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t startTimeInNs = a3;
}

@end