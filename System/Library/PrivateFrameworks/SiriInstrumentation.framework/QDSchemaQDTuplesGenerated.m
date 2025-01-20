@interface QDSchemaQDTuplesGenerated
- (BOOL)hasMaximumTupleWidth;
- (BOOL)hasNumberOfTuples;
- (BOOL)hasWasToolTupleLimitReached;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasToolTupleLimitReached;
- (NSData)jsonData;
- (QDSchemaQDTuplesGenerated)initWithDictionary:(id)a3;
- (QDSchemaQDTuplesGenerated)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)maximumTupleWidth;
- (unsigned)numberOfTuples;
- (void)deleteMaximumTupleWidth;
- (void)deleteNumberOfTuples;
- (void)deleteWasToolTupleLimitReached;
- (void)setHasMaximumTupleWidth:(BOOL)a3;
- (void)setHasNumberOfTuples:(BOOL)a3;
- (void)setHasWasToolTupleLimitReached:(BOOL)a3;
- (void)setMaximumTupleWidth:(unsigned int)a3;
- (void)setNumberOfTuples:(unsigned int)a3;
- (void)setWasToolTupleLimitReached:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDTuplesGenerated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)wasToolTupleLimitReached
{
  return self->_wasToolTupleLimitReached;
}

- (unsigned)maximumTupleWidth
{
  return self->_maximumTupleWidth;
}

- (unsigned)numberOfTuples
{
  return self->_numberOfTuples;
}

- (QDSchemaQDTuplesGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QDSchemaQDTuplesGenerated;
  v5 = [(QDSchemaQDTuplesGenerated *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfTuples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDTuplesGenerated setNumberOfTuples:](v5, "setNumberOfTuples:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"maximumTupleWidth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDTuplesGenerated setMaximumTupleWidth:](v5, "setMaximumTupleWidth:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"wasToolTupleLimitReached"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDTuplesGenerated setWasToolTupleLimitReached:](v5, "setWasToolTupleLimitReached:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (QDSchemaQDTuplesGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDTuplesGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDTuplesGenerated *)self dictionaryRepresentation];
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
  char v4 = *(&self->_wasToolTupleLimitReached + 1);
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[QDSchemaQDTuplesGenerated maximumTupleWidth](self, "maximumTupleWidth"));
    [v3 setObject:v7 forKeyedSubscript:@"maximumTupleWidth"];

    char v4 = *(&self->_wasToolTupleLimitReached + 1);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!*(&self->_wasToolTupleLimitReached + 1))
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[QDSchemaQDTuplesGenerated numberOfTuples](self, "numberOfTuples"));
  [v3 setObject:v8 forKeyedSubscript:@"numberOfTuples"];

  if ((*(&self->_wasToolTupleLimitReached + 1) & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[QDSchemaQDTuplesGenerated wasToolTupleLimitReached](self, "wasToolTupleLimitReached"));
    [v3 setObject:v5 forKeyedSubscript:@"wasToolTupleLimitReached"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_wasToolTupleLimitReached + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_wasToolTupleLimitReached + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_wasToolTupleLimitReached + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_numberOfTuples;
  if ((*(&self->_wasToolTupleLimitReached + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_maximumTupleWidth;
  if ((*(&self->_wasToolTupleLimitReached + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_wasToolTupleLimitReached;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1);
  unsigned int v6 = v4[17];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    unsigned int numberOfTuples = self->_numberOfTuples;
    if (numberOfTuples != [v4 numberOfTuples]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1);
    unsigned int v6 = v4[17];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int maximumTupleWidth = self->_maximumTupleWidth;
    if (maximumTupleWidth == [v4 maximumTupleWidth])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1);
      unsigned int v6 = v4[17];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int wasToolTupleLimitReached = self->_wasToolTupleLimitReached;
    if (wasToolTupleLimitReached != [v4 wasToolTupleLimitReached]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_wasToolTupleLimitReached + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char v5 = *(&self->_wasToolTupleLimitReached + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_wasToolTupleLimitReached + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(&self->_wasToolTupleLimitReached + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDTuplesGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteWasToolTupleLimitReached
{
  *(&self->_wasToolTupleLimitReached + 1) &= ~4u;
}

- (void)setHasWasToolTupleLimitReached:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasToolTupleLimitReached + 1) = *(&self->_wasToolTupleLimitReached + 1) & 0xFB | v3;
}

- (BOOL)hasWasToolTupleLimitReached
{
  return (*((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1) >> 2) & 1;
}

- (void)setWasToolTupleLimitReached:(BOOL)a3
{
  *(&self->_wasToolTupleLimitReached + 1) |= 4u;
  self->_int wasToolTupleLimitReached = a3;
}

- (void)deleteMaximumTupleWidth
{
  *(&self->_wasToolTupleLimitReached + 1) &= ~2u;
}

- (void)setHasMaximumTupleWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasToolTupleLimitReached + 1) = *(&self->_wasToolTupleLimitReached + 1) & 0xFD | v3;
}

- (BOOL)hasMaximumTupleWidth
{
  return (*((unsigned __int8 *)&self->_wasToolTupleLimitReached + 1) >> 1) & 1;
}

- (void)setMaximumTupleWidth:(unsigned int)a3
{
  *(&self->_wasToolTupleLimitReached + 1) |= 2u;
  self->_unsigned int maximumTupleWidth = a3;
}

- (void)deleteNumberOfTuples
{
  *(&self->_wasToolTupleLimitReached + 1) &= ~1u;
}

- (void)setHasNumberOfTuples:(BOOL)a3
{
  *(&self->_wasToolTupleLimitReached + 1) = *(&self->_wasToolTupleLimitReached + 1) & 0xFE | a3;
}

- (BOOL)hasNumberOfTuples
{
  return *(&self->_wasToolTupleLimitReached + 1);
}

- (void)setNumberOfTuples:(unsigned int)a3
{
  *(&self->_wasToolTupleLimitReached + 1) |= 1u;
  self->_unsigned int numberOfTuples = a3;
}

@end