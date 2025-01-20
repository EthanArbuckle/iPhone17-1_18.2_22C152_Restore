@interface MTSchemaMTLanguageIdentificationCompleted
- (BOOL)hasInputSource;
- (BOOL)hasTopLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTLanguageIdentificationCompleted)initWithDictionary:(id)a3;
- (MTSchemaMTLanguageIdentificationCompleted)initWithJSON:(id)a3;
- (NSArray)lidConfidences;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)lidConfidenceAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)inputSource;
- (int)topLocale;
- (unint64_t)hash;
- (unint64_t)lidConfidenceCount;
- (void)addLidConfidence:(id)a3;
- (void)clearLidConfidence;
- (void)deleteInputSource;
- (void)deleteTopLocale;
- (void)setHasInputSource:(BOOL)a3;
- (void)setHasTopLocale:(BOOL)a3;
- (void)setInputSource:(int)a3;
- (void)setLidConfidences:(id)a3;
- (void)setTopLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTLanguageIdentificationCompleted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTSchemaMTLanguageIdentificationCompleted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTLanguageIdentificationCompleted *)self lidConfidences];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MTSchemaMTLanguageIdentificationCompleted *)self setLidConfidences:v7];
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
}

- (void)setLidConfidences:(id)a3
{
}

- (NSArray)lidConfidences
{
  return self->_lidConfidences;
}

- (int)topLocale
{
  return self->_topLocale;
}

- (int)inputSource
{
  return self->_inputSource;
}

- (MTSchemaMTLanguageIdentificationCompleted)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MTSchemaMTLanguageIdentificationCompleted;
  v5 = [(MTSchemaMTLanguageIdentificationCompleted *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"inputSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTLanguageIdentificationCompleted setInputSource:](v5, "setInputSource:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"topLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTLanguageIdentificationCompleted setTopLocale:](v5, "setTopLocale:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"lidConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v7;
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[MTSchemaMTLanguageIdentificationConfidence alloc] initWithDictionary:v14];
              [(MTSchemaMTLanguageIdentificationCompleted *)v5 addLidConfidence:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;
  }
  return v5;
}

- (MTSchemaMTLanguageIdentificationCompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTLanguageIdentificationCompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTLanguageIdentificationCompleted *)self dictionaryRepresentation];
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
    unsigned int v4 = [(MTSchemaMTLanguageIdentificationCompleted *)self inputSource] - 1;
    if (v4 > 3) {
      v5 = @"MTINPUTSOURCE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBE430[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"inputSource"];
  }
  if ([(NSArray *)self->_lidConfidences count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = self->_lidConfidences;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"lidConfidence"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v14 = [(MTSchemaMTLanguageIdentificationCompleted *)self topLocale] - 1;
    if (v14 > 0x3D) {
      v15 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v15 = off_1E5EBE450[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"topLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_inputSource;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSArray *)self->_lidConfidences hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_topLocale;
  return v3 ^ v2 ^ [(NSArray *)self->_lidConfidences hash];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $C5EDA01EFA766C22BB8EDC829DA6867A has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int inputSource = self->_inputSource;
    if (inputSource != [v4 inputSource]) {
      goto LABEL_14;
    }
    $C5EDA01EFA766C22BB8EDC829DA6867A has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (int topLocale = self->_topLocale, topLocale == [v4 topLocale]))
    {
      uint64_t v10 = [(MTSchemaMTLanguageIdentificationCompleted *)self lidConfidences];
      uint64_t v11 = [v4 lidConfidences];
      uint64_t v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(MTSchemaMTLanguageIdentificationCompleted *)self lidConfidences];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        unsigned int v14 = (void *)v13;
        v15 = [(MTSchemaMTLanguageIdentificationCompleted *)self lidConfidences];
        v16 = [v4 lidConfidences];
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
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_lidConfidences;
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTLanguageIdentificationCompletedReadFrom(self, (uint64_t)a3);
}

- (id)lidConfidenceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_lidConfidences objectAtIndexedSubscript:a3];
}

- (unint64_t)lidConfidenceCount
{
  return [(NSArray *)self->_lidConfidences count];
}

- (void)addLidConfidence:(id)a3
{
  id v4 = a3;
  lidConfidences = self->_lidConfidences;
  id v8 = v4;
  if (!lidConfidences)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_lidConfidences;
    self->_lidConfidences = v6;

    id v4 = v8;
    lidConfidences = self->_lidConfidences;
  }
  [(NSArray *)lidConfidences addObject:v4];
}

- (void)clearLidConfidence
{
}

- (void)deleteTopLocale
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTopLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTopLocale
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTopLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int topLocale = a3;
}

- (void)deleteInputSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInputSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInputSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int inputSource = a3;
}

@end