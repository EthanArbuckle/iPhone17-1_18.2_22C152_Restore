@interface PEGASUSSchemaPEGASUSAudioUnderstanding
- (BOOL)hasAudioDecade;
- (BOOL)hasAudioVerb;
- (BOOL)hasRequestedMediaType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)audioAttributes;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSAudioUnderstanding)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAudioUnderstanding)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioAttributesAtIndex:(unint64_t)a3;
- (int)audioDecade;
- (int)audioVerb;
- (int)requestedMediaType;
- (unint64_t)audioAttributesCount;
- (unint64_t)hash;
- (void)addAudioAttributes:(int)a3;
- (void)clearAudioAttributes;
- (void)deleteAudioDecade;
- (void)deleteAudioVerb;
- (void)deleteRequestedMediaType;
- (void)setAudioAttributes:(id)a3;
- (void)setAudioDecade:(int)a3;
- (void)setAudioVerb:(int)a3;
- (void)setHasAudioDecade:(BOOL)a3;
- (void)setHasAudioVerb:(BOOL)a3;
- (void)setHasRequestedMediaType:(BOOL)a3;
- (void)setRequestedMediaType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAudioUnderstanding

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (int)audioDecade
{
  return self->_audioDecade;
}

- (void)setAudioAttributes:(id)a3
{
}

- (NSArray)audioAttributes
{
  return self->_audioAttributes;
}

- (int)requestedMediaType
{
  return self->_requestedMediaType;
}

- (int)audioVerb
{
  return self->_audioVerb;
}

- (PEGASUSSchemaPEGASUSAudioUnderstanding)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PEGASUSSchemaPEGASUSAudioUnderstanding;
  v5 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioVerb"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioUnderstanding setAudioVerb:](v5, "setAudioVerb:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestedMediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioUnderstanding setRequestedMediaType:](v5, "setRequestedMediaType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"audioAttributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSAudioUnderstanding addAudioAttributes:](v5, "addAudioAttributes:", [v14 intValue]);
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v15 = [v4 objectForKeyedSubscript:@"audioDecade"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioUnderstanding setAudioDecade:](v5, "setAudioDecade:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioUnderstanding)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_audioAttributes count])
  {
    id v4 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self audioAttributes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"audioAttributes"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    unsigned int v9 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self audioVerb] - 1;
    if (v9 > 9) {
      uint64_t v10 = @"PEGASUSAUDIOVERB_UNKNOWN";
    }
    else {
      uint64_t v10 = off_1E5EBC9D8[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"audioVerb"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  unsigned int v7 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self audioDecade] - 1;
  if (v7 > 0xA) {
    v8 = @"PEGASUSAUDIODECADE_UNKNOWN";
  }
  else {
    v8 = off_1E5EBC980[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"audioDecade"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_15:
    unsigned int v11 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self requestedMediaType] - 1;
    if (v11 > 0x17) {
      uint64_t v12 = @"PEGASUSREQUESTEDMEDIATYPE_UNKNOWN";
    }
    else {
      uint64_t v12 = off_1E5EBCA28[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"requestedMediaType"];
  }
LABEL_19:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_audioVerb;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_requestedMediaType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSArray *)self->_audioAttributes hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_audioDecade;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $B46EF0E530EC967909A69E8F6C95FCE8 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int audioVerb = self->_audioVerb;
    if (audioVerb != [v4 audioVerb])
    {
LABEL_19:
      BOOL v20 = 0;
      goto LABEL_20;
    }
    $B46EF0E530EC967909A69E8F6C95FCE8 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int requestedMediaType = self->_requestedMediaType;
    if (requestedMediaType != [v4 requestedMediaType]) {
      goto LABEL_19;
    }
  }
  uint64_t v10 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self audioAttributes];
  unsigned int v11 = [v4 audioAttributes];
  uint64_t v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v13 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self audioAttributes];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self audioAttributes];
    v16 = [v4 audioAttributes];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v18 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v18 != ((v4[28] >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v18)
  {
    int audioDecade = self->_audioDecade;
    if (audioDecade != [v4 audioDecade]) {
      goto LABEL_19;
    }
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
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
  unsigned int v6 = self->_audioAttributes;
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

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioUnderstandingReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioDecade
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAudioDecade:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAudioDecade
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAudioDecade:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int audioDecade = a3;
}

- (int)audioAttributesAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_audioAttributes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)audioAttributesCount
{
  return [(NSArray *)self->_audioAttributes count];
}

- (void)addAudioAttributes:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  audioAttributes = self->_audioAttributes;
  if (!audioAttributes)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioAttributes;
    self->_audioAttributes = v6;

    audioAttributes = self->_audioAttributes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)audioAttributes addObject:v8];
}

- (void)clearAudioAttributes
{
}

- (void)deleteRequestedMediaType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestedMediaType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestedMediaType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestedMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int requestedMediaType = a3;
}

- (void)deleteAudioVerb
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioVerb:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioVerb
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioVerb:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioVerb = a3;
}

@end