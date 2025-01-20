@interface ASRSchemaASREmojiMetrics
- (ASRSchemaASREmojiMetrics)initWithDictionary:(id)a3;
- (ASRSchemaASREmojiMetrics)initWithJSON:(id)a3;
- (BOOL)hasIsEmojiDisambiguationUsed;
- (BOOL)hasIsEmojiExpectedButNotRecognized;
- (BOOL)hasIsEmojiPersonalizationUsed;
- (BOOL)isEmojiDisambiguationUsed;
- (BOOL)isEmojiExpectedButNotRecognized;
- (BOOL)isEmojiPersonalizationUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)recognizedEmojis;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)recognizedEmojisAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)recognizedEmojisCount;
- (void)addRecognizedEmojis:(id)a3;
- (void)clearRecognizedEmojis;
- (void)deleteIsEmojiDisambiguationUsed;
- (void)deleteIsEmojiExpectedButNotRecognized;
- (void)deleteIsEmojiPersonalizationUsed;
- (void)setHasIsEmojiDisambiguationUsed:(BOOL)a3;
- (void)setHasIsEmojiExpectedButNotRecognized:(BOOL)a3;
- (void)setHasIsEmojiPersonalizationUsed:(BOOL)a3;
- (void)setIsEmojiDisambiguationUsed:(BOOL)a3;
- (void)setIsEmojiExpectedButNotRecognized:(BOOL)a3;
- (void)setIsEmojiPersonalizationUsed:(BOOL)a3;
- (void)setRecognizedEmojis:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASREmojiMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (BOOL)isEmojiExpectedButNotRecognized
{
  return self->_isEmojiExpectedButNotRecognized;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (void)setRecognizedEmojis:(id)a3
{
}

- (NSArray)recognizedEmojis
{
  return self->_recognizedEmojis;
}

- (ASRSchemaASREmojiMetrics)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASRSchemaASREmojiMetrics;
  v5 = [(ASRSchemaASREmojiMetrics *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recognizedEmojis"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v19);
              [(ASRSchemaASREmojiMetrics *)v5 addRecognizedEmojis:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isEmojiPersonalizationUsed", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASREmojiMetrics setIsEmojiPersonalizationUsed:](v5, "setIsEmojiPersonalizationUsed:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isEmojiDisambiguationUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASREmojiMetrics setIsEmojiDisambiguationUsed:](v5, "setIsEmojiDisambiguationUsed:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"isEmojiExpectedButNotRecognized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASREmojiMetrics setIsEmojiExpectedButNotRecognized:](v5, "setIsEmojiExpectedButNotRecognized:", [v16 BOOLValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (ASRSchemaASREmojiMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASREmojiMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASREmojiMetrics *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isEmojiExpectedButNotRecognized + 1);
  if ((v4 & 2) != 0)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASREmojiMetrics isEmojiDisambiguationUsed](self, "isEmojiDisambiguationUsed"));
    [v3 setObject:v9 forKeyedSubscript:@"isEmojiDisambiguationUsed"];

    char v4 = *(&self->_isEmojiExpectedButNotRecognized + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASREmojiMetrics isEmojiExpectedButNotRecognized](self, "isEmojiExpectedButNotRecognized"));
  [v3 setObject:v10 forKeyedSubscript:@"isEmojiExpectedButNotRecognized"];

  if (*(&self->_isEmojiExpectedButNotRecognized + 1))
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASREmojiMetrics isEmojiPersonalizationUsed](self, "isEmojiPersonalizationUsed"));
    [v3 setObject:v5 forKeyedSubscript:@"isEmojiPersonalizationUsed"];
  }
LABEL_5:
  if (self->_recognizedEmojis)
  {
    v6 = [(ASRSchemaASREmojiMetrics *)self recognizedEmojis];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"recognizedEmojis"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_recognizedEmojis hash];
  if (!*(&self->_isEmojiExpectedButNotRecognized + 1))
  {
    uint64_t v4 = 0;
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_isEmojiPersonalizationUsed;
  if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isEmojiDisambiguationUsed;
  if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isEmojiExpectedButNotRecognized;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(ASRSchemaASREmojiMetrics *)self recognizedEmojis];
  uint64_t v6 = [v4 recognizedEmojis];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(ASRSchemaASREmojiMetrics *)self recognizedEmojis];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(ASRSchemaASREmojiMetrics *)self recognizedEmojis];
    uint64_t v11 = [v4 recognizedEmojis];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1);
  unsigned int v14 = v4[19];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (v13)
  {
    int isEmojiPersonalizationUsed = self->_isEmojiPersonalizationUsed;
    if (isEmojiPersonalizationUsed != [v4 isEmojiPersonalizationUsed]) {
      goto LABEL_20;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1);
    unsigned int v14 = v4[19];
  }
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int isEmojiDisambiguationUsed = self->_isEmojiDisambiguationUsed;
    if (isEmojiDisambiguationUsed == [v4 isEmojiDisambiguationUsed])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1);
      unsigned int v14 = v4[19];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int isEmojiExpectedButNotRecognized = self->_isEmojiExpectedButNotRecognized;
    if (isEmojiExpectedButNotRecognized != [v4 isEmojiExpectedButNotRecognized]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_recognizedEmojis;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *(&self->_isEmojiExpectedButNotRecognized + 1);
  if ((v10 & 1) == 0)
  {
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  char v10 = *(&self->_isEmojiExpectedButNotRecognized + 1);
  if ((v10 & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v10 & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASREmojiMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEmojiExpectedButNotRecognized
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) &= ~4u;
}

- (void)setHasIsEmojiExpectedButNotRecognized:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmojiExpectedButNotRecognized + 1) = *(&self->_isEmojiExpectedButNotRecognized + 1) & 0xFB | v3;
}

- (BOOL)hasIsEmojiExpectedButNotRecognized
{
  return (*((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1) >> 2) & 1;
}

- (void)setIsEmojiExpectedButNotRecognized:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) |= 4u;
  self->_int isEmojiExpectedButNotRecognized = a3;
}

- (void)deleteIsEmojiDisambiguationUsed
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) &= ~2u;
}

- (void)setHasIsEmojiDisambiguationUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmojiExpectedButNotRecognized + 1) = *(&self->_isEmojiExpectedButNotRecognized + 1) & 0xFD | v3;
}

- (BOOL)hasIsEmojiDisambiguationUsed
{
  return (*((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1) >> 1) & 1;
}

- (void)setIsEmojiDisambiguationUsed:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) |= 2u;
  self->_int isEmojiDisambiguationUsed = a3;
}

- (void)deleteIsEmojiPersonalizationUsed
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) &= ~1u;
}

- (void)setHasIsEmojiPersonalizationUsed:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) = *(&self->_isEmojiExpectedButNotRecognized + 1) & 0xFE | a3;
}

- (BOOL)hasIsEmojiPersonalizationUsed
{
  return *(&self->_isEmojiExpectedButNotRecognized + 1);
}

- (void)setIsEmojiPersonalizationUsed:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) |= 1u;
  self->_int isEmojiPersonalizationUsed = a3;
}

- (id)recognizedEmojisAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_recognizedEmojis objectAtIndexedSubscript:a3];
}

- (unint64_t)recognizedEmojisCount
{
  return [(NSArray *)self->_recognizedEmojis count];
}

- (void)addRecognizedEmojis:(id)a3
{
  id v4 = a3;
  recognizedEmojis = self->_recognizedEmojis;
  id v8 = v4;
  if (!recognizedEmojis)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recognizedEmojis;
    self->_recognizedEmojis = v6;

    id v4 = v8;
    recognizedEmojis = self->_recognizedEmojis;
  }
  [(NSArray *)recognizedEmojis addObject:v4];
}

- (void)clearRecognizedEmojis
{
}

@end