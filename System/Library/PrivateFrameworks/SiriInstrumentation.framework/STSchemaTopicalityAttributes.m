@interface STSchemaTopicalityAttributes
- (BOOL)hasCalibratedEmbeddingSimilarity;
- (BOOL)hasCountAttributeBigramMatch;
- (BOOL)hasCountAttributeBigramPrefixMatch;
- (BOOL)hasCountAttributeNgramMatch;
- (BOOL)hasCountAttributeNgramPrefixMatch;
- (BOOL)hasCountAttributeQPQUMatch;
- (BOOL)hasCountAttributeQPQUprefixMatch;
- (BOOL)hasCountAttributeUnigramMatch;
- (BOOL)hasCountAttributeUnigramPrefixMatch;
- (BOOL)hasEmbeddingModelId;
- (BOOL)hasUnCalibratedEmbeddingSimilarity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)embeddingModelId;
- (STSchemaTopicalityAttributes)initWithDictionary:(id)a3;
- (STSchemaTopicalityAttributes)initWithJSON:(id)a3;
- (float)calibratedEmbeddingSimilarity;
- (float)unCalibratedEmbeddingSimilarity;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)countAttributeBigramMatch;
- (unsigned)countAttributeBigramPrefixMatch;
- (unsigned)countAttributeNgramMatch;
- (unsigned)countAttributeNgramPrefixMatch;
- (unsigned)countAttributeQPQUMatch;
- (unsigned)countAttributeQPQUprefixMatch;
- (unsigned)countAttributeUnigramMatch;
- (unsigned)countAttributeUnigramPrefixMatch;
- (void)deleteCalibratedEmbeddingSimilarity;
- (void)deleteCountAttributeBigramMatch;
- (void)deleteCountAttributeBigramPrefixMatch;
- (void)deleteCountAttributeNgramMatch;
- (void)deleteCountAttributeNgramPrefixMatch;
- (void)deleteCountAttributeQPQUMatch;
- (void)deleteCountAttributeQPQUprefixMatch;
- (void)deleteCountAttributeUnigramMatch;
- (void)deleteCountAttributeUnigramPrefixMatch;
- (void)deleteEmbeddingModelId;
- (void)deleteUnCalibratedEmbeddingSimilarity;
- (void)setCalibratedEmbeddingSimilarity:(float)a3;
- (void)setCountAttributeBigramMatch:(unsigned int)a3;
- (void)setCountAttributeBigramPrefixMatch:(unsigned int)a3;
- (void)setCountAttributeNgramMatch:(unsigned int)a3;
- (void)setCountAttributeNgramPrefixMatch:(unsigned int)a3;
- (void)setCountAttributeQPQUMatch:(unsigned int)a3;
- (void)setCountAttributeQPQUprefixMatch:(unsigned int)a3;
- (void)setCountAttributeUnigramMatch:(unsigned int)a3;
- (void)setCountAttributeUnigramPrefixMatch:(unsigned int)a3;
- (void)setEmbeddingModelId:(id)a3;
- (void)setHasCalibratedEmbeddingSimilarity:(BOOL)a3;
- (void)setHasCountAttributeBigramMatch:(BOOL)a3;
- (void)setHasCountAttributeBigramPrefixMatch:(BOOL)a3;
- (void)setHasCountAttributeNgramMatch:(BOOL)a3;
- (void)setHasCountAttributeNgramPrefixMatch:(BOOL)a3;
- (void)setHasCountAttributeQPQUMatch:(BOOL)a3;
- (void)setHasCountAttributeQPQUprefixMatch:(BOOL)a3;
- (void)setHasCountAttributeUnigramMatch:(BOOL)a3;
- (void)setHasCountAttributeUnigramPrefixMatch:(BOOL)a3;
- (void)setHasEmbeddingModelId:(BOOL)a3;
- (void)setHasUnCalibratedEmbeddingSimilarity:(BOOL)a3;
- (void)setUnCalibratedEmbeddingSimilarity:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaTopicalityAttributes

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasEmbeddingModelId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setEmbeddingModelId:(id)a3
{
}

- (NSString)embeddingModelId
{
  return self->_embeddingModelId;
}

- (float)calibratedEmbeddingSimilarity
{
  return self->_calibratedEmbeddingSimilarity;
}

- (float)unCalibratedEmbeddingSimilarity
{
  return self->_unCalibratedEmbeddingSimilarity;
}

- (unsigned)countAttributeNgramPrefixMatch
{
  return self->_countAttributeNgramPrefixMatch;
}

- (unsigned)countAttributeBigramPrefixMatch
{
  return self->_countAttributeBigramPrefixMatch;
}

- (unsigned)countAttributeUnigramPrefixMatch
{
  return self->_countAttributeUnigramPrefixMatch;
}

- (unsigned)countAttributeNgramMatch
{
  return self->_countAttributeNgramMatch;
}

- (unsigned)countAttributeBigramMatch
{
  return self->_countAttributeBigramMatch;
}

- (unsigned)countAttributeUnigramMatch
{
  return self->_countAttributeUnigramMatch;
}

- (unsigned)countAttributeQPQUprefixMatch
{
  return self->_countAttributeQPQUprefixMatch;
}

- (unsigned)countAttributeQPQUMatch
{
  return self->_countAttributeQPQUMatch;
}

- (STSchemaTopicalityAttributes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)STSchemaTopicalityAttributes;
  v5 = [(STSchemaTopicalityAttributes *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"countAttributeQPQUMatch"];
    objc_opt_class();
    v27 = v6;
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeQPQUMatch:](v5, "setCountAttributeQPQUMatch:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"countAttributeQPQUprefixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeQPQUprefixMatch:](v5, "setCountAttributeQPQUprefixMatch:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"countAttributeUnigramMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeUnigramMatch:](v5, "setCountAttributeUnigramMatch:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"countAttributeBigramMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeBigramMatch:](v5, "setCountAttributeBigramMatch:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"countAttributeNgramMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeNgramMatch:](v5, "setCountAttributeNgramMatch:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"countAttributeUnigramPrefixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeUnigramPrefixMatch:](v5, "setCountAttributeUnigramPrefixMatch:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"countAttributeBigramPrefixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeBigramPrefixMatch:](v5, "setCountAttributeBigramPrefixMatch:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"countAttributeNgramPrefixMatch"];
    objc_opt_class();
    v28 = v13;
    if (objc_opt_isKindOfClass()) {
      -[STSchemaTopicalityAttributes setCountAttributeNgramPrefixMatch:](v5, "setCountAttributeNgramPrefixMatch:", [v13 unsignedIntValue]);
    }
    v26 = v12;
    v14 = [v4 objectForKeyedSubscript:@"unCalibratedEmbeddingSimilarity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[STSchemaTopicalityAttributes setUnCalibratedEmbeddingSimilarity:](v5, "setUnCalibratedEmbeddingSimilarity:");
    }
    v15 = [v4 objectForKeyedSubscript:@"calibratedEmbeddingSimilarity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[STSchemaTopicalityAttributes setCalibratedEmbeddingSimilarity:](v5, "setCalibratedEmbeddingSimilarity:");
    }
    v16 = [v4 objectForKeyedSubscript:@"embeddingModelId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v11;
      v17 = v10;
      v18 = v9;
      v19 = v8;
      v20 = v7;
      v21 = v14;
      v22 = (void *)[v16 copy];
      [(STSchemaTopicalityAttributes *)v5 setEmbeddingModelId:v22];

      v14 = v21;
      v7 = v20;
      v8 = v19;
      v9 = v18;
      v10 = v17;
      v11 = v25;
    }
    v23 = v5;
  }
  return v5;
}

- (STSchemaTopicalityAttributes)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaTopicalityAttributes *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaTopicalityAttributes *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v11 = NSNumber;
    [(STSchemaTopicalityAttributes *)self calibratedEmbeddingSimilarity];
    v12 = objc_msgSend(v11, "numberWithFloat:");
    [v3 setObject:v12 forKeyedSubscript:@"calibratedEmbeddingSimilarity"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeBigramMatch](self, "countAttributeBigramMatch"));
  [v3 setObject:v13 forKeyedSubscript:@"countAttributeBigramMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeBigramPrefixMatch](self, "countAttributeBigramPrefixMatch"));
  [v3 setObject:v14 forKeyedSubscript:@"countAttributeBigramPrefixMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeNgramMatch](self, "countAttributeNgramMatch"));
  [v3 setObject:v15 forKeyedSubscript:@"countAttributeNgramMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeNgramPrefixMatch](self, "countAttributeNgramPrefixMatch"));
  [v3 setObject:v16 forKeyedSubscript:@"countAttributeNgramPrefixMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeQPQUMatch](self, "countAttributeQPQUMatch"));
  [v3 setObject:v17 forKeyedSubscript:@"countAttributeQPQUMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeQPQUprefixMatch](self, "countAttributeQPQUprefixMatch"));
  [v3 setObject:v18 forKeyedSubscript:@"countAttributeQPQUprefixMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeUnigramMatch](self, "countAttributeUnigramMatch"));
  [v3 setObject:v19 forKeyedSubscript:@"countAttributeUnigramMatch"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaTopicalityAttributes countAttributeUnigramPrefixMatch](self, "countAttributeUnigramPrefixMatch"));
    [v3 setObject:v5 forKeyedSubscript:@"countAttributeUnigramPrefixMatch"];
  }
LABEL_11:
  if (self->_embeddingModelId)
  {
    v6 = [(STSchemaTopicalityAttributes *)self embeddingModelId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"embeddingModelId"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v8 = NSNumber;
    [(STSchemaTopicalityAttributes *)self unCalibratedEmbeddingSimilarity];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"unCalibratedEmbeddingSimilarity"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v23 = 2654435761 * self->_countAttributeQPQUMatch;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v22 = 2654435761 * self->_countAttributeQPQUprefixMatch;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_countAttributeUnigramMatch;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_countAttributeBigramMatch;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_countAttributeNgramMatch;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_countAttributeUnigramPrefixMatch;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_countAttributeBigramPrefixMatch;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_21:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_22:
    unint64_t v14 = 0;
    goto LABEL_25;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_countAttributeNgramPrefixMatch;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_22;
  }
LABEL_10:
  float unCalibratedEmbeddingSimilarity = self->_unCalibratedEmbeddingSimilarity;
  double v11 = unCalibratedEmbeddingSimilarity;
  if (unCalibratedEmbeddingSimilarity < 0.0) {
    double v11 = -unCalibratedEmbeddingSimilarity;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_25:
  if ((has & 0x200) != 0)
  {
    float calibratedEmbeddingSimilarity = self->_calibratedEmbeddingSimilarity;
    double v17 = calibratedEmbeddingSimilarity;
    if (calibratedEmbeddingSimilarity < 0.0) {
      double v17 = -calibratedEmbeddingSimilarity;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v20 = v22 ^ v23 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
  return v20 ^ [(NSString *)self->_embeddingModelId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_46;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int countAttributeQPQUMatch = self->_countAttributeQPQUMatch;
    if (countAttributeQPQUMatch != [v4 countAttributeQPQUMatch]) {
      goto LABEL_46;
    }
    $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int countAttributeQPQUprefixMatch = self->_countAttributeQPQUprefixMatch;
      if (countAttributeQPQUprefixMatch != [v4 countAttributeQPQUprefixMatch]) {
        goto LABEL_46;
      }
      $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
      unsigned int v6 = v4[28];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        unsigned int countAttributeUnigramMatch = self->_countAttributeUnigramMatch;
        if (countAttributeUnigramMatch != [v4 countAttributeUnigramMatch]) {
          goto LABEL_46;
        }
        $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
        unsigned int v6 = v4[28];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          unsigned int countAttributeBigramMatch = self->_countAttributeBigramMatch;
          if (countAttributeBigramMatch != [v4 countAttributeBigramMatch]) {
            goto LABEL_46;
          }
          $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
          unsigned int v6 = v4[28];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            unsigned int countAttributeNgramMatch = self->_countAttributeNgramMatch;
            if (countAttributeNgramMatch != [v4 countAttributeNgramMatch]) {
              goto LABEL_46;
            }
            $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
            unsigned int v6 = v4[28];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              unsigned int countAttributeUnigramPrefixMatch = self->_countAttributeUnigramPrefixMatch;
              if (countAttributeUnigramPrefixMatch != [v4 countAttributeUnigramPrefixMatch])goto LABEL_46; {
              $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
              }
              unsigned int v6 = v4[28];
            }
            int v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 == ((v6 >> 6) & 1))
            {
              if (v18)
              {
                unsigned int countAttributeBigramPrefixMatch = self->_countAttributeBigramPrefixMatch;
                if (countAttributeBigramPrefixMatch != [v4 countAttributeBigramPrefixMatch])goto LABEL_46; {
                $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
                }
                unsigned int v6 = v4[28];
              }
              int v20 = (*(unsigned int *)&has >> 7) & 1;
              if (v20 == ((v6 >> 7) & 1))
              {
                if (v20)
                {
                  unsigned int countAttributeNgramPrefixMatch = self->_countAttributeNgramPrefixMatch;
                  if (countAttributeNgramPrefixMatch != [v4 countAttributeNgramPrefixMatch])goto LABEL_46; {
                  $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
                  }
                  unsigned int v6 = v4[28];
                }
                int v22 = (*(unsigned int *)&has >> 8) & 1;
                if (v22 == ((v6 >> 8) & 1))
                {
                  if (v22)
                  {
                    float unCalibratedEmbeddingSimilarity = self->_unCalibratedEmbeddingSimilarity;
                    [v4 unCalibratedEmbeddingSimilarity];
                    if (unCalibratedEmbeddingSimilarity != v24) {
                      goto LABEL_46;
                    }
                    $8DA0878AFE516F5D4B003EF29286DE13 has = self->_has;
                    unsigned int v6 = v4[28];
                  }
                  int v25 = (*(unsigned int *)&has >> 9) & 1;
                  if (v25 == ((v6 >> 9) & 1))
                  {
                    if (!v25
                      || (float calibratedEmbeddingSimilarity = self->_calibratedEmbeddingSimilarity,
                          [v4 calibratedEmbeddingSimilarity],
                          calibratedEmbeddingSimilarity == v27))
                    {
                      v28 = [(STSchemaTopicalityAttributes *)self embeddingModelId];
                      objc_super v29 = [v4 embeddingModelId];
                      v30 = v29;
                      if ((v28 == 0) != (v29 != 0))
                      {
                        uint64_t v31 = [(STSchemaTopicalityAttributes *)self embeddingModelId];
                        if (!v31)
                        {

LABEL_49:
                          BOOL v36 = 1;
                          goto LABEL_47;
                        }
                        v32 = (void *)v31;
                        v33 = [(STSchemaTopicalityAttributes *)self embeddingModelId];
                        v34 = [v4 embeddingModelId];
                        char v35 = [v33 isEqual:v34];

                        if (v35) {
                          goto LABEL_49;
                        }
                      }
                      else
                      {
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_46:
  BOOL v36 = 0;
LABEL_47:

  return v36;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteFloatField();
LABEL_12:
  uint64_t v5 = [(STSchemaTopicalityAttributes *)self embeddingModelId];

  unsigned int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaTopicalityAttributesReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteEmbeddingModelId
{
}

- (BOOL)hasEmbeddingModelId
{
  return self->_embeddingModelId != 0;
}

- (void)deleteCalibratedEmbeddingSimilarity
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasCalibratedEmbeddingSimilarity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasCalibratedEmbeddingSimilarity
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCalibratedEmbeddingSimilarity:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_float calibratedEmbeddingSimilarity = a3;
}

- (void)deleteUnCalibratedEmbeddingSimilarity
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasUnCalibratedEmbeddingSimilarity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUnCalibratedEmbeddingSimilarity
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUnCalibratedEmbeddingSimilarity:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_float unCalibratedEmbeddingSimilarity = a3;
}

- (void)deleteCountAttributeNgramPrefixMatch
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasCountAttributeNgramPrefixMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasCountAttributeNgramPrefixMatch
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCountAttributeNgramPrefixMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int countAttributeNgramPrefixMatch = a3;
}

- (void)deleteCountAttributeBigramPrefixMatch
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasCountAttributeBigramPrefixMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasCountAttributeBigramPrefixMatch
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCountAttributeBigramPrefixMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int countAttributeBigramPrefixMatch = a3;
}

- (void)deleteCountAttributeUnigramPrefixMatch
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasCountAttributeUnigramPrefixMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCountAttributeUnigramPrefixMatch
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCountAttributeUnigramPrefixMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int countAttributeUnigramPrefixMatch = a3;
}

- (void)deleteCountAttributeNgramMatch
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasCountAttributeNgramMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCountAttributeNgramMatch
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCountAttributeNgramMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int countAttributeNgramMatch = a3;
}

- (void)deleteCountAttributeBigramMatch
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasCountAttributeBigramMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCountAttributeBigramMatch
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCountAttributeBigramMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int countAttributeBigramMatch = a3;
}

- (void)deleteCountAttributeUnigramMatch
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasCountAttributeUnigramMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCountAttributeUnigramMatch
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCountAttributeUnigramMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int countAttributeUnigramMatch = a3;
}

- (void)deleteCountAttributeQPQUprefixMatch
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasCountAttributeQPQUprefixMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCountAttributeQPQUprefixMatch
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCountAttributeQPQUprefixMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int countAttributeQPQUprefixMatch = a3;
}

- (void)deleteCountAttributeQPQUMatch
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasCountAttributeQPQUMatch:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCountAttributeQPQUMatch
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCountAttributeQPQUMatch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int countAttributeQPQUMatch = a3;
}

@end