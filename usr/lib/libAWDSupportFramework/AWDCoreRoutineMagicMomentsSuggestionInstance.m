@interface AWDCoreRoutineMagicMomentsSuggestionInstance
+ (Class)suggestionsType;
- (BOOL)hasConfidence;
- (BOOL)hasDurationSinceLastSuggestion;
- (BOOL)hasReposponceTime;
- (BOOL)hasSuggestionId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestions;
- (NSString)suggestionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (int)confidence;
- (int)durationSinceLastSuggestion;
- (int)reposponceTime;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (unint64_t)timestamp;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setDurationSinceLastSuggestion:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasDurationSinceLastSuggestion:(BOOL)a3;
- (void)setHasReposponceTime:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setReposponceTime:(int)a3;
- (void)setSuggestionId:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicMomentsSuggestionInstance

- (void)dealloc
{
  [(AWDCoreRoutineMagicMomentsSuggestionInstance *)self setSuggestionId:0];
  [(AWDCoreRoutineMagicMomentsSuggestionInstance *)self setSuggestions:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicMomentsSuggestionInstance;
  [(AWDCoreRoutineMagicMomentsSuggestionInstance *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearSuggestions
{
}

- (void)addSuggestions:(id)a3
{
  suggestions = self->_suggestions;
  if (!suggestions)
  {
    suggestions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_suggestions = suggestions;
  }

  [(NSMutableArray *)suggestions addObject:a3];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (void)setReposponceTime:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_reposponceTime = a3;
}

- (void)setHasReposponceTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReposponceTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDurationSinceLastSuggestion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_durationSinceLastSuggestion = a3;
}

- (void)setHasDurationSinceLastSuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDurationSinceLastSuggestion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicMomentsSuggestionInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicMomentsSuggestionInstance description](&v3, sel_description), -[AWDCoreRoutineMagicMomentsSuggestionInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  suggestionId = self->_suggestionId;
  if (suggestionId) {
    [v3 setObject:suggestionId forKey:@"suggestionId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_confidence] forKey:@"confidence"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_suggestions, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    suggestions = self->_suggestions;
    uint64_t v7 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(suggestions);
          }
          [v5 addObject:[(*(id *)(*((void *)&v13 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"suggestions"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_reposponceTime] forKey:@"reposponceTime"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_durationSinceLastSuggestion] forKey:@"durationSinceLastSuggestion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicMomentsSuggestionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_suggestionId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  suggestions = self->_suggestions;
  uint64_t v5 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(suggestions);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
  }
  if (self->_suggestionId) {
    [a3 setSuggestionId:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_confidence;
    *((unsigned char *)a3 + 48) |= 2u;
  }
  if ([(AWDCoreRoutineMagicMomentsSuggestionInstance *)self suggestionsCount])
  {
    [a3 clearSuggestions];
    unint64_t v5 = [(AWDCoreRoutineMagicMomentsSuggestionInstance *)self suggestionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSuggestions:-[AWDCoreRoutineMagicMomentsSuggestionInstance suggestionsAtIndex:](self, "suggestionsAtIndex:", i)];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_reposponceTime;
    *((unsigned char *)a3 + 48) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_durationSinceLastSuggestion;
    *((unsigned char *)a3 + 48) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_suggestionId copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_confidence;
    *(unsigned char *)(v6 + 48) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  suggestions = self->_suggestions;
  uint64_t v8 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(suggestions);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addSuggestions:v12];
      }
      uint64_t v9 = [(NSMutableArray *)suggestions countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_reposponceTime;
    *(unsigned char *)(v6 + 48) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_durationSinceLastSuggestion;
    *(unsigned char *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }
    suggestionId = self->_suggestionId;
    if ((unint64_t)suggestionId | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](suggestionId, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 4)) {
        goto LABEL_27;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_27;
    }
    suggestions = self->_suggestions;
    if ((unint64_t)suggestions | *((void *)a3 + 5))
    {
      int v5 = -[NSMutableArray isEqual:](suggestions, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_reposponceTime != *((_DWORD *)a3 + 6)) {
        goto LABEL_27;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_durationSinceLastSuggestion != *((_DWORD *)a3 + 5)) {
        goto LABEL_27;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_suggestionId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_confidence;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_suggestions hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_reposponceTime;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_durationSinceLastSuggestion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 48))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDCoreRoutineMagicMomentsSuggestionInstance setSuggestionId:](self, "setSuggestionId:");
  }
  if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
    self->_confidence = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        [(AWDCoreRoutineMagicMomentsSuggestionInstance *)self addSuggestions:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  char v10 = *((unsigned char *)a3 + 48);
  if ((v10 & 8) != 0)
  {
    self->_reposponceTime = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 8u;
    char v10 = *((unsigned char *)a3 + 48);
  }
  if ((v10 & 4) != 0)
  {
    self->_durationSinceLastSuggestion = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
}

- (int)confidence
{
  return self->_confidence;
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (int)reposponceTime
{
  return self->_reposponceTime;
}

- (int)durationSinceLastSuggestion
{
  return self->_durationSinceLastSuggestion;
}

@end