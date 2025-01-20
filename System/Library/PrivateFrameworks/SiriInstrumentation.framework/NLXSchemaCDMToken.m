@interface NLXSchemaCDMToken
- (BOOL)hasBegin;
- (BOOL)hasCleanValue;
- (BOOL)hasEnd;
- (BOOL)hasIsSignificant;
- (BOOL)hasIsWhitespace;
- (BOOL)hasNonWhitespaceTokenIndex;
- (BOOL)hasTokenIndex;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignificant;
- (BOOL)isWhitespace;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMToken)initWithDictionary:(id)a3;
- (NLXSchemaCDMToken)initWithJSON:(id)a3;
- (NSArray)normalizedValues;
- (NSData)jsonData;
- (NSString)cleanValue;
- (NSString)value;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)normalizedValuesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)normalizedValuesCount;
- (unsigned)begin;
- (unsigned)end;
- (unsigned)nonWhitespaceTokenIndex;
- (unsigned)tokenIndex;
- (void)addNormalizedValues:(id)a3;
- (void)clearNormalizedValues;
- (void)deleteBegin;
- (void)deleteCleanValue;
- (void)deleteEnd;
- (void)deleteIsSignificant;
- (void)deleteIsWhitespace;
- (void)deleteNonWhitespaceTokenIndex;
- (void)deleteTokenIndex;
- (void)deleteValue;
- (void)setBegin:(unsigned int)a3;
- (void)setCleanValue:(id)a3;
- (void)setEnd:(unsigned int)a3;
- (void)setHasBegin:(BOOL)a3;
- (void)setHasCleanValue:(BOOL)a3;
- (void)setHasEnd:(BOOL)a3;
- (void)setHasIsSignificant:(BOOL)a3;
- (void)setHasIsWhitespace:(BOOL)a3;
- (void)setHasNonWhitespaceTokenIndex:(BOOL)a3;
- (void)setHasTokenIndex:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setIsSignificant:(BOOL)a3;
- (void)setIsWhitespace:(BOOL)a3;
- (void)setNonWhitespaceTokenIndex:(unsigned int)a3;
- (void)setNormalizedValues:(id)a3;
- (void)setTokenIndex:(unsigned int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMToken

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLXSchemaCDMToken;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(NLXSchemaCDMToken *)self deleteValue];
    [(NLXSchemaCDMToken *)self deleteCleanValue];
    [(NLXSchemaCDMToken *)self deleteNormalizedValues];
  }
  if ([v4 isConditionSet:4])
  {
    [(NLXSchemaCDMToken *)self deleteValue];
    [(NLXSchemaCDMToken *)self deleteCleanValue];
    [(NLXSchemaCDMToken *)self deleteNormalizedValues];
  }
  if ([v4 isConditionSet:5])
  {
    [(NLXSchemaCDMToken *)self deleteValue];
    [(NLXSchemaCDMToken *)self deleteCleanValue];
    [(NLXSchemaCDMToken *)self deleteNormalizedValues];
  }
  if ([v4 isConditionSet:6])
  {
    [(NLXSchemaCDMToken *)self deleteValue];
    [(NLXSchemaCDMToken *)self deleteCleanValue];
    [(NLXSchemaCDMToken *)self deleteNormalizedValues];
  }
  if ([v4 isConditionSet:7])
  {
    [(NLXSchemaCDMToken *)self deleteValue];
    [(NLXSchemaCDMToken *)self deleteCleanValue];
    [(NLXSchemaCDMToken *)self deleteNormalizedValues];
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
  objc_storeStrong((id *)&self->_normalizedValues, 0);
  objc_storeStrong((id *)&self->_cleanValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setHasCleanValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setNormalizedValues:(id)a3
{
}

- (NSArray)normalizedValues
{
  return self->_normalizedValues;
}

- (void)setCleanValue:(id)a3
{
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (unsigned)nonWhitespaceTokenIndex
{
  return self->_nonWhitespaceTokenIndex;
}

- (unsigned)tokenIndex
{
  return self->_tokenIndex;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (unsigned)end
{
  return self->_end;
}

- (unsigned)begin
{
  return self->_begin;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (NLXSchemaCDMToken)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NLXSchemaCDMToken;
  v5 = [(NLXSchemaCDMToken *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(NLXSchemaCDMToken *)v5 setValue:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"begin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMToken setBegin:](v5, "setBegin:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"end"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMToken setEnd:](v5, "setEnd:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isSignificant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMToken setIsSignificant:](v5, "setIsSignificant:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isWhitespace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMToken setIsWhitespace:](v5, "setIsWhitespace:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"tokenIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMToken setTokenIndex:](v5, "setTokenIndex:", [v12 unsignedIntValue]);
    }
    v32 = v12;
    v13 = [v4 objectForKeyedSubscript:@"nonWhitespaceTokenIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMToken setNonWhitespaceTokenIndex:](v5, "setNonWhitespaceTokenIndex:", [v13 unsignedIntValue]);
    }
    v31 = v13;
    v14 = [v4 objectForKeyedSubscript:@"cleanValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(NLXSchemaCDMToken *)v5 setCleanValue:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"normalizedValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v11;
      v27 = v10;
      v28 = v9;
      v29 = v8;
      v30 = v6;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = (void *)[v22 copy];
              [(NLXSchemaCDMToken *)v5 addNormalizedValues:v23];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v19);
      }

      v8 = v29;
      v6 = v30;
      v10 = v27;
      v9 = v28;
      v11 = v26;
    }
    v24 = v5;
  }
  return v5;
}

- (NLXSchemaCDMToken)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMToken *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMToken *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMToken begin](self, "begin"));
    [v3 setObject:v4 forKeyedSubscript:@"begin"];
  }
  if (self->_cleanValue)
  {
    v5 = [(NLXSchemaCDMToken *)self cleanValue];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"cleanValue"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMToken end](self, "end"));
    [v3 setObject:v15 forKeyedSubscript:@"end"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaCDMToken isSignificant](self, "isSignificant"));
  [v3 setObject:v16 forKeyedSubscript:@"isSignificant"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaCDMToken isWhitespace](self, "isWhitespace"));
  [v3 setObject:v17 forKeyedSubscript:@"isWhitespace"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMToken nonWhitespaceTokenIndex](self, "nonWhitespaceTokenIndex"));
    [v3 setObject:v8 forKeyedSubscript:@"nonWhitespaceTokenIndex"];
  }
LABEL_10:
  if (self->_normalizedValues)
  {
    v9 = [(NLXSchemaCDMToken *)self normalizedValues];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"normalizedValues"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMToken tokenIndex](self, "tokenIndex"));
    [v3 setObject:v11 forKeyedSubscript:@"tokenIndex"];
  }
  if (self->_value)
  {
    v12 = [(NLXSchemaCDMToken *)self value];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"value"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_begin;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_end;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_isSignificant;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_isWhitespace;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_tokenIndex;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_nonWhitespaceTokenIndex;
LABEL_14:
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_cleanValue hash];
  return v10 ^ [(NSArray *)self->_normalizedValues hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  uint64_t v5 = [(NLXSchemaCDMToken *)self value];
  uint64_t v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v7 = [(NLXSchemaCDMToken *)self value];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaCDMToken *)self value];
    NSUInteger v10 = [v4 value];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  $9833CD79836BCD9C6DC73F6E21AAA665 has = self->_has;
  unsigned int v13 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_40;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int begin = self->_begin;
    if (begin != [v4 begin]) {
      goto LABEL_40;
    }
    $9833CD79836BCD9C6DC73F6E21AAA665 has = self->_has;
    unsigned int v13 = v4[56];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_40;
  }
  if (v15)
  {
    unsigned int end = self->_end;
    if (end != [v4 end]) {
      goto LABEL_40;
    }
    $9833CD79836BCD9C6DC73F6E21AAA665 has = self->_has;
    unsigned int v13 = v4[56];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_40;
  }
  if (v17)
  {
    int isSignificant = self->_isSignificant;
    if (isSignificant != [v4 isSignificant]) {
      goto LABEL_40;
    }
    $9833CD79836BCD9C6DC73F6E21AAA665 has = self->_has;
    unsigned int v13 = v4[56];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_40;
  }
  if (v19)
  {
    int isWhitespace = self->_isWhitespace;
    if (isWhitespace != [v4 isWhitespace]) {
      goto LABEL_40;
    }
    $9833CD79836BCD9C6DC73F6E21AAA665 has = self->_has;
    unsigned int v13 = v4[56];
  }
  int v21 = (*(unsigned int *)&has >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1)) {
    goto LABEL_40;
  }
  if (v21)
  {
    unsigned int tokenIndex = self->_tokenIndex;
    if (tokenIndex != [v4 tokenIndex]) {
      goto LABEL_40;
    }
    $9833CD79836BCD9C6DC73F6E21AAA665 has = self->_has;
    unsigned int v13 = v4[56];
  }
  int v23 = (*(unsigned int *)&has >> 5) & 1;
  if (v23 != ((v13 >> 5) & 1)) {
    goto LABEL_40;
  }
  if (v23)
  {
    unsigned int nonWhitespaceTokenIndex = self->_nonWhitespaceTokenIndex;
    if (nonWhitespaceTokenIndex != [v4 nonWhitespaceTokenIndex]) {
      goto LABEL_40;
    }
  }
  uint64_t v5 = [(NLXSchemaCDMToken *)self cleanValue];
  uint64_t v6 = [v4 cleanValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v25 = [(NLXSchemaCDMToken *)self cleanValue];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(NLXSchemaCDMToken *)self cleanValue];
    v28 = [v4 cleanValue];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMToken *)self normalizedValues];
  uint64_t v6 = [v4 normalizedValues];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v30 = [(NLXSchemaCDMToken *)self normalizedValues];
  if (!v30)
  {

LABEL_43:
    BOOL v35 = 1;
    goto LABEL_41;
  }
  v31 = (void *)v30;
  v32 = [(NLXSchemaCDMToken *)self normalizedValues];
  long long v33 = [v4 normalizedValues];
  char v34 = [v32 isEqual:v33];

  if (v34) {
    goto LABEL_43;
  }
LABEL_40:
  BOOL v35 = 0;
LABEL_41:

  return v35;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NLXSchemaCDMToken *)self value];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  uint64_t v7 = [(NLXSchemaCDMToken *)self cleanValue];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_normalizedValues;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTokenReadFrom(self, (uint64_t)a3);
}

- (id)normalizedValuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_normalizedValues objectAtIndexedSubscript:a3];
}

- (unint64_t)normalizedValuesCount
{
  return [(NSArray *)self->_normalizedValues count];
}

- (void)addNormalizedValues:(id)a3
{
  id v4 = a3;
  normalizedValues = self->_normalizedValues;
  id v8 = v4;
  if (!normalizedValues)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_normalizedValues;
    self->_normalizedValues = v6;

    id v4 = v8;
    normalizedValues = self->_normalizedValues;
  }
  [(NSArray *)normalizedValues addObject:v4];
}

- (void)clearNormalizedValues
{
}

- (void)deleteCleanValue
{
}

- (BOOL)hasCleanValue
{
  return self->_cleanValue != 0;
}

- (void)deleteNonWhitespaceTokenIndex
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasNonWhitespaceTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNonWhitespaceTokenIndex
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNonWhitespaceTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int nonWhitespaceTokenIndex = a3;
}

- (void)deleteTokenIndex
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTokenIndex
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int tokenIndex = a3;
}

- (void)deleteIsWhitespace
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsWhitespace:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsWhitespace
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsWhitespace:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isWhitespace = a3;
}

- (void)deleteIsSignificant
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsSignificant
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsSignificant:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isSignificant = a3;
}

- (void)deleteEnd
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnd:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int end = a3;
}

- (void)deleteBegin
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBegin:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBegin
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBegin:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int begin = a3;
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

@end