@interface QDSchemaQDEntityMatch
- (BOOL)hasEndIndex;
- (BOOL)hasMatchScore;
- (BOOL)hasMatcher;
- (BOOL)hasOriginAppBundleId;
- (BOOL)hasStartIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)matchingTransforms;
- (NSData)jsonData;
- (NSString)originAppBundleId;
- (QDSchemaQDEntityMatch)initWithDictionary:(id)a3;
- (QDSchemaQDEntityMatch)initWithJSON:(id)a3;
- (float)matchScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)matcher;
- (int)matchingTransformsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchingTransformsCount;
- (unsigned)endIndex;
- (unsigned)startIndex;
- (void)addMatchingTransforms:(int)a3;
- (void)clearMatchingTransforms;
- (void)deleteEndIndex;
- (void)deleteMatchScore;
- (void)deleteMatcher;
- (void)deleteOriginAppBundleId;
- (void)deleteStartIndex;
- (void)setEndIndex:(unsigned int)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasMatchScore:(BOOL)a3;
- (void)setHasMatcher:(BOOL)a3;
- (void)setHasOriginAppBundleId:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)setMatchScore:(float)a3;
- (void)setMatcher:(int)a3;
- (void)setMatchingTransforms:(id)a3;
- (void)setOriginAppBundleId:(id)a3;
- (void)setStartIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDEntityMatch

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QDSchemaQDEntityMatch;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(QDSchemaQDEntityMatch *)self deleteOriginAppBundleId];
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
  objc_storeStrong((id *)&self->_originAppBundleId, 0);
  objc_storeStrong((id *)&self->_matchingTransforms, 0);
}

- (void)setHasOriginAppBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOriginAppBundleId:(id)a3
{
}

- (NSString)originAppBundleId
{
  return self->_originAppBundleId;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (int)matcher
{
  return self->_matcher;
}

- (void)setMatchingTransforms:(id)a3
{
}

- (NSArray)matchingTransforms
{
  return self->_matchingTransforms;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (QDSchemaQDEntityMatch)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)QDSchemaQDEntityMatch;
  v5 = [(QDSchemaQDEntityMatch *)&v26 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"startIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDEntityMatch setStartIndex:](v5, "setStartIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"endIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDEntityMatch setEndIndex:](v5, "setEndIndex:", [v7 unsignedIntValue]);
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"matchingTransforms"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[QDSchemaQDEntityMatch addMatchingTransforms:](v5, "addMatchingTransforms:", [v14 intValue]);
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v11);
      }

      int v6 = v21;
    }
    v15 = [v4 objectForKeyedSubscript:@"matcher"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDEntityMatch setMatcher:](v5, "setMatcher:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"matchScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[QDSchemaQDEntityMatch setMatchScore:](v5, "setMatchScore:");
    }
    v17 = [v4 objectForKeyedSubscript:@"originAppBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(QDSchemaQDEntityMatch *)v5 setOriginAppBundleId:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (QDSchemaQDEntityMatch)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDEntityMatch *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDEntityMatch *)self dictionaryRepresentation];
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
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_3;
    }
LABEL_20:
    v15 = NSNumber;
    [(QDSchemaQDEntityMatch *)self matchScore];
    v16 = objc_msgSend(v15, "numberWithFloat:");
    [v3 setObject:v16 forKeyedSubscript:@"matchScore"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_4;
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[QDSchemaQDEntityMatch endIndex](self, "endIndex"));
  [v3 setObject:v14 forKeyedSubscript:@"endIndex"];

  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_20;
  }
LABEL_3:
  if ((has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  int v5 = [(QDSchemaQDEntityMatch *)self matcher];
  int v6 = @"QDSPANMATCHERTYPE_UNKNOWN";
  if (v5 == 1) {
    int v6 = @"QDSPANMATCHERTYPE_SIRI_ENTITY_MATCHER";
  }
  if (v5 == 2) {
    uint64_t v7 = @"QDSPANMATCHERTYPE_GLOBAL_ENTITY_MATCHER";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"matcher"];
LABEL_10:
  if ([(NSArray *)self->_matchingTransforms count])
  {
    objc_super v8 = [(QDSchemaQDEntityMatch *)self matchingTransforms];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"matchingTransforms"];
  }
  if (self->_originAppBundleId)
  {
    uint64_t v10 = [(QDSchemaQDEntityMatch *)self originAppBundleId];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"originAppBundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[QDSchemaQDEntityMatch startIndex](self, "startIndex"));
    [v3 setObject:v12 forKeyedSubscript:@"startIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_startIndex;
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
      uint64_t v4 = 2654435761 * self->_endIndex;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSArray *)self->_matchingTransforms hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_matcher;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v5 ^ [(NSString *)self->_originAppBundleId hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  float matchScore = self->_matchScore;
  double v8 = matchScore;
  if (matchScore < 0.0) {
    double v8 = -matchScore;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v5 ^ [(NSString *)self->_originAppBundleId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $FCEBA31F971276F4F09CAE3A65545F0F has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int startIndex = self->_startIndex;
    if (startIndex != [v4 startIndex]) {
      goto LABEL_26;
    }
    $FCEBA31F971276F4F09CAE3A65545F0F has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    unsigned int endIndex = self->_endIndex;
    if (endIndex != [v4 endIndex]) {
      goto LABEL_26;
    }
  }
  double v10 = [(QDSchemaQDEntityMatch *)self matchingTransforms];
  unint64_t v11 = [v4 matchingTransforms];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_25;
  }
  uint64_t v12 = [(QDSchemaQDEntityMatch *)self matchingTransforms];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(QDSchemaQDEntityMatch *)self matchingTransforms];
    v15 = [v4 matchingTransforms];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  $FCEBA31F971276F4F09CAE3A65545F0F v17 = self->_has;
  int v18 = (*(unsigned int *)&v17 >> 2) & 1;
  unsigned int v19 = v4[40];
  if (v18 != ((v19 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v18)
  {
    int matcher = self->_matcher;
    if (matcher != [v4 matcher]) {
      goto LABEL_26;
    }
    $FCEBA31F971276F4F09CAE3A65545F0F v17 = self->_has;
    unsigned int v19 = v4[40];
  }
  int v21 = (*(unsigned int *)&v17 >> 3) & 1;
  if (v21 != ((v19 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v21)
  {
    float matchScore = self->_matchScore;
    [v4 matchScore];
    if (matchScore != v23) {
      goto LABEL_26;
    }
  }
  double v10 = [(QDSchemaQDEntityMatch *)self originAppBundleId];
  unint64_t v11 = [v4 originAppBundleId];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v24 = [(QDSchemaQDEntityMatch *)self originAppBundleId];
  if (!v24)
  {

LABEL_29:
    BOOL v29 = 1;
    goto LABEL_27;
  }
  long long v25 = (void *)v24;
  objc_super v26 = [(QDSchemaQDEntityMatch *)self originAppBundleId];
  v27 = [v4 originAppBundleId];
  char v28 = [v26 isEqual:v27];

  if (v28) {
    goto LABEL_29;
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v6 = self->_matchingTransforms;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "intValue", (void)v13);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0) {
    PBDataWriterWriteFloatField();
  }
  uint64_t v12 = [(QDSchemaQDEntityMatch *)self originAppBundleId];

  if (v12) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDEntityMatchReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteOriginAppBundleId
{
}

- (BOOL)hasOriginAppBundleId
{
  return self->_originAppBundleId != 0;
}

- (void)deleteMatchScore
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasMatchScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMatchScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMatchScore:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float matchScore = a3;
}

- (void)deleteMatcher
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMatcher:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMatcher
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMatcher:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int matcher = a3;
}

- (int)matchingTransformsAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_matchingTransforms objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)matchingTransformsCount
{
  return [(NSArray *)self->_matchingTransforms count];
}

- (void)addMatchingTransforms:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  matchingTransforms = self->_matchingTransforms;
  if (!matchingTransforms)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchingTransforms;
    self->_matchingTransforms = v6;

    matchingTransforms = self->_matchingTransforms;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)matchingTransforms addObject:v8];
}

- (void)clearMatchingTransforms
{
}

- (void)deleteEndIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEndIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int endIndex = a3;
}

- (void)deleteStartIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int startIndex = a3;
}

@end